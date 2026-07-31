import fs from 'fs'
import fetch from 'node-fetch'

const CONS_API = 'https://en.wikipedia.org/w/api.php?action=parse&page=Constituencies_of_Kenya&format=json&prop=text&origin=*'
const COUNTIES_API = 'https://en.wikipedia.org/w/api.php?action=parse&page=Counties_of_Kenya&format=json&prop=text&origin=*'

function slugify(s){ return s.toLowerCase().replace(/[^a-z0-9]+/g,'_').replace(/^_|_$/g,'') }
function sqlEscape(s){ return "'"+s.replace(/'/g,"''")+"'" }

async function fetchApi(url){
  const res = await fetch(url)
  if(!res.ok) throw new Error('fetch failed '+url)
  const j = await res.json()
  return j.parse && j.parse.text && j.parse.text['*'] ? j.parse.text['*'] : ''
}

function parseByRegex(html){
  const mapping = {}
  const headingRegex = /<h[23][^>]*>[\s\S]*?<a[^>]*>([^<]+ County)<\/a>[\s\S]*?<\/h[23]>/gi
  let match
  while((match = headingRegex.exec(html)) !== null){
    const county = match[1].trim()
    const headingEnd = match.index + match[0].length
    const rest = html.slice(headingEnd)
    let cons = []

    // first try to find a list item right after the county heading
    const listMatch = rest.match(/<li[^>]*>\s*Constituencies:\s*([\s\S]*?)<\/li>/i)
    if(listMatch){
      const listHtml = listMatch[1]
      cons = Array.from(listHtml.matchAll(/<a[^>]*>([^<]+)<\/a>/gi), m=>m[1].trim())
        .filter(text=>text.length>0 && !/^[0-9]+$/.test(text))
    }

    // if the county uses a wikitable after the heading, parse the first column anchors
    if(cons.length === 0){
      const tableMatch = rest.match(/<table[^>]*class="[^"]*wikitable[^"]*"[\s\S]*?<\/table>/i)
      if(tableMatch){
        const tableHtml = tableMatch[0]
        cons = Array.from(tableHtml.matchAll(/<td[^>]*>[\s\S]*?<a[^>]*>([^<]+)<\/a>/gi), m=>m[1].trim())
          .filter(text=>text.length>0 && !/^[0-9]+\./.test(text))
      }
    }

    if(cons.length === 0){
      const headingSection = html.slice(match.index)
      const nextHeadingIndex = headingSection.search(/<h[23][^>]*>/i)
      if(nextHeadingIndex !== -1){
        const countyBlock = headingSection.slice(0, nextHeadingIndex)
        const listMatch2 = countyBlock.match(/<li[^>]*>\s*Constituencies:\s*([\s\S]*?)<\/li>/i)
        if(listMatch2){
          cons = Array.from(listMatch2[1].matchAll(/<a[^>]*>([^<]+)<\/a>/gi), m=>m[1].trim())
            .filter(text=>text.length>0 && !/^[0-9]+$/.test(text))
        }
      }
    }

    if(cons.length > 0){
      mapping[county] = cons
    }
  }
  return mapping
}

function generateSQLFrom(mapping){
  const counties = Object.keys(mapping).sort()
  const lines = ['-- Auto-generated seed (regex parser)','BEGIN;']
  counties.forEach(c=>{
    const code = slugify(c)
    lines.push(`INSERT INTO counties (name, code) VALUES (${sqlEscape(c)}, '${code}');`)
  })
  lines.push('')
  Object.entries(mapping).forEach(([county, arr])=>{
    const countyCode = slugify(county)
    arr.forEach(cons=>{
      const consCode = slugify(cons)
      lines.push(`INSERT INTO constituencies (name, code, county_id) VALUES (${sqlEscape(cons)}, '${consCode}', (SELECT id FROM counties WHERE code='${countyCode}')) ;`)
    })
  })
  lines.push('COMMIT;')
  return lines.join('\n')
}

async function main(){
  console.log('Fetching parsed HTML via API (regex parser)...')
  const consHtml = await fetchApi(CONS_API)
  const mapping = parseByRegex(consHtml)
  console.log('Counties found:', Object.keys(mapping).length)
  const sql = generateSQLFrom(mapping)
  const out = './supabase/migrations/20260728122052_001_wazi_schema_seeds.sql'
  fs.writeFileSync(out, sql)
  console.log('Wrote', out)
}

main().catch(e=>{console.error(e); process.exit(1)})
