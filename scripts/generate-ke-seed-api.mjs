import fs from 'fs'
import fetch from 'node-fetch'
import { parse } from 'node-html-parser'

const CONS_API = 'https://en.wikipedia.org/w/api.php?action=parse&page=Constituencies_of_Kenya&format=json&prop=text&origin=*'
const COUNTIES_API = 'https://en.wikipedia.org/w/api.php?action=parse&page=Counties_of_Kenya&format=json&prop=text&origin=*'

function slugify(s){
  return s.toLowerCase().replace(/[^a-z0-9]+/g,'_').replace(/^_|_$/g,'')
}

async function fetchApi(url){
  const res = await fetch(url)
  if(!res.ok) throw new Error('fetch failed '+url)
  const j = await res.json()
  return j.parse && j.parse.text && j.parse.text['*'] ? j.parse.text['*'] : ''
}

function extractCountiesFromHtml(html){
  const root = parse(html)
  const list = []
  // find first table with counties or all links ending with ' County'
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
  for(const h of headlines){
    const title = h.text.trim()
    if(!/County$/.test(title)) continue
    // find parent heading and collect until next heading
    const parent = h.parentNode
    let node = parent.nextSibling
    const cons = []
    while(node){
      if(node.querySelectorAll && node.querySelectorAll('.mw-headline').length>0) break
      node.querySelectorAll && node.querySelectorAll('a').forEach(a=>{
        const txt = a.text.trim()
        const href = a.getAttribute('href')||''
        if(/Constituency/.test(txt) || /_Constituency/.test(href)){
          if(!cons.includes(txt) && txt.length>0) cons.push(txt)
        }
      })
      node = node.nextSibling
    }
    mapping[title] = cons
  }
  return mapping
}

function generateSQL(counties, map){
  const lines = []
  lines.push('-- Auto-generated Kenya counties + constituencies seed')
  lines.push('BEGIN;')
  counties.forEach(c=>{
    const code = slugify(c)
    lines.push(`INSERT INTO counties (name, code) VALUES (${sqlEscape(c)}, '${code}');`)
  })
  lines.push('')
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

function sqlEscape(s){ return "'"+s.replace(/'/g,"''")+"'" }

async function main(){
  console.log('Fetching parsed HTML via API...')
  const [cntHtml, consHtml] = await Promise.all([fetchApi(COUNTIES_API), fetchApi(CONS_API)])
  console.log('Extracting counties...')
  let counties = extractCountiesFromHtml(cntHtml)
  console.log('Counties found from counties page:', counties.length)
  console.log('Extracting constituencies mapped to counties...')
  const map = extractCountyConstituencies(consHtml)
  // Fallback: if counties page parsing failed, use mapping keys as county list
  if(counties.length === 0){
    counties = Object.keys(map).sort()
    console.log('Falling back to counties derived from constituencies page:', counties.length)
  }
  const missing = counties.filter(c=>!(c in map))
  if(missing.length>0) console.warn('Missing mapping for', missing.length, 'counties')
  const sql = generateSQL(counties, map)
  const out = './supabase/migrations/20260728122052_001_wazi_schema_seeds.sql'
  fs.writeFileSync(out, sql)
  console.log('Wrote', out)
}

main().catch(e=>{console.error(e); process.exit(1)})
