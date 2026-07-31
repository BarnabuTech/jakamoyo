import fs from 'fs'
import fetch from 'node-fetch'
import { parse } from 'node-html-parser'

const CONSTITUENCIES_URL = 'https://en.wikipedia.org/wiki/Constituencies_of_Kenya'
const COUNTIES_URL = 'https://en.wikipedia.org/wiki/Counties_of_Kenya'

function slugify(s){
  return s.toLowerCase().replace(/[^a-z0-9]+/g,'_').replace(/^_|_$/g,'')
}

async function fetchHtml(url){
  const res = await fetch(url)
  if(!res.ok) throw new Error('fetch failed '+url)
  return await res.text()
}

function extractCountiesFromCountiesPage(html){
  const root = parse(html)
  const list = []
  // look for the table or lists — fallback: find all links to "County" pages in content
  root.querySelectorAll('a').forEach(a=>{
    const txt = a.text.trim()
    if(/County$/.test(txt) && txt.length>6){
      if(!list.includes(txt)) list.push(txt)
    }
  })
  return list
}

function extractCountyConstituencies(html){
  const root = parse(html)
  const mapping = {}
  const headlines = root.querySelectorAll('.mw-headline')
  for(let i=0;i<headlines.length;i++){
    const h = headlines[i]
    const title = h.text.trim()
    if(!/County$/.test(title)) continue
    // gather nodes until next headline of same level
    const parent = h.parentNode
    // gather following siblings
    let node = parent.nextSibling
    const constituencies = []
    while(node){
      if(node.querySelectorAll && node.querySelectorAll('.mw-headline').length>0) break
      // find links that look like constituencies
      node.querySelectorAll && node.querySelectorAll('a').forEach(a=>{
        const href = a.getAttribute('href')||''
        const txt = a.text.trim()
        if(/Constituency/.test(txt) || /_Constituency/.test(href)){
          if(!constituencies.includes(txt) && txt.length>0) constituencies.push(txt)
        }
      })
      node = node.nextSibling
    }
    mapping[title] = constituencies
  }
  return mapping
}

function generateSQL(counties, map){
  const lines = []
  lines.push('-- Auto-generated Kenya counties + constituencies seed')
  lines.push('BEGIN;')
  // insert counties
  counties.forEach((c,idx)=>{
    const code = slugify(c)
    lines.push(`INSERT INTO counties (name, code) VALUES (${sqlEscape(c)}, '${code}');`)
  })
  lines.push('')
  // insert constituencies referencing county by code
  Object.entries(map).forEach(([county, arr])=>{
    const countyCode = slugify(county)
    arr.forEach(cons=>{
      const consCode = slugify(cons)
      lines.push(`INSERT INTO constituencies (name, code, county_id) VALUES (${sqlEscape(cons)}, '${consCode}', (SELECT id FROM counties WHERE code='${countyCode}')) ;`)
    })
  })
  lines.push('COMMIT;')
  return lines.join('\n')
}

function sqlEscape(s){
  return "'"+s.replace(/'/g,"''")+"'"
}

async function main(){
  console.log('Fetching pages...')
  const [cntHtml, consHtml] = await Promise.all([fetchHtml(COUNTIES_URL), fetchHtml(CONSTITUENCIES_URL)])
  console.log('Parsing counties...')
  const counties = extractCountiesFromCountiesPage(cntHtml)
  console.log('Found', counties.length, 'counties')
  console.log('Parsing constituencies...')
  const map = extractCountyConstituencies(consHtml)
  const missing = counties.filter(c=>!(c in map))
  if(missing.length>0){
    console.warn('Warning: some counties had no extracted constituencies:', missing.length)
  }
  const sql = generateSQL(counties, map)
  const outPath = './supabase/migrations/20260728122052_001_wazi_schema_seeds.sql'
  fs.writeFileSync(outPath, sql)
  console.log('Wrote', outPath)
}

main().catch(err=>{console.error(err); process.exit(1)})
