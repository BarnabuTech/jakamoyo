const fs = require('fs');
const path = 'supabase/migrations/20260728122052_001_wazi_schema_seeds.sql';
const text = fs.readFileSync(path, 'utf8');
const countyCount = (text.match(/INSERT INTO counties \(name, code\)/g) || []).length;
const constituencyCount = (text.match(/INSERT INTO constituencies \(name, code, county_id\)/g) || []).length;
console.log({ countyCount, constituencyCount });
