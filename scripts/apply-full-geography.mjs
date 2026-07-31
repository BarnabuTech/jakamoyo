import fs from 'fs';
import path from 'path';
import { createClient } from '@supabase/supabase-js';

const root = process.cwd();
const envPath = path.join(root, '.env');

function readEnv(filePath) {
  const env = {};
  if (!fs.existsSync(filePath)) return env;
  for (const line of fs.readFileSync(filePath, 'utf8').split(/\r?\n/)) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const equalsIndex = trimmed.indexOf('=');
    if (equalsIndex === -1) continue;
    const key = trimmed.slice(0, equalsIndex).trim();
    let value = trimmed.slice(equalsIndex + 1).trim();
    if ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'"))) {
      value = value.slice(1, -1);
    }
    env[key] = value;
  }
  return env;
}

const env = readEnv(envPath);
const supabaseUrl = env.VITE_SUPABASE_URL;
const supabaseAnonKey = env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing VITE_SUPABASE_URL or VITE_SUPABASE_ANON_KEY in .env');
}

const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});

const counties = [
  ['Mombasa County', 'mombasa_county'],
  ['Kwale County', 'kwale_county'],
  ['Kilifi County', 'kilifi_county'],
  ['Tana River County', 'tana_river_county'],
  ['Lamu County', 'lamu_county'],
  ['Taita-Taveta County', 'taita_taveta_county'],
  ['Garissa County', 'garissa_county'],
  ['Wajir County', 'wajir_county'],
  ['Mandera County', 'mandera_county'],
  ['Marsabit County', 'marsabit_county'],
  ['Isiolo County', 'isiolo_county'],
  ['Meru County', 'meru_county'],
  ['Tharaka-Nithi County', 'tharaka_nithi_county'],
  ['Embu County', 'embu_county'],
  ['Kitui County', 'kitui_county'],
  ['Machakos County', 'machakos_county'],
  ['Makueni County', 'makueni_county'],
  ['Nyandarua County', 'nyandarua_county'],
  ['Nyeri County', 'nyeri_county'],
  ['Kirinyaga County', 'kirinyaga_county'],
  ["Murang'a County", 'murang_a_county'],
  ['Kiambu County', 'kiambu_county'],
  ['Turkana County', 'turkana_county'],
  ['West Pokot County', 'west_pokot_county'],
  ['Samburu County', 'samburu_county'],
  ['Trans-Nzoia County', 'trans_nzoia_county'],
  ['Uasin Gishu County', 'uasin_gishu_county'],
  ['Elgeyo-Marakwet County', 'elgeyo_marakwet_county'],
  ['Nandi County', 'nandi_county'],
  ['Baringo County', 'baringo_county'],
  ['Laikipia County', 'laikipia_county'],
  ['Nakuru County', 'nakuru_county'],
  ['Narok County', 'narok_county'],
  ['Kajiado County', 'kajiado_county'],
  ['Kericho County', 'kericho_county'],
  ['Bomet County', 'bomet_county'],
  ['Kakamega County', 'kakamega_county'],
  ['Vihiga County', 'vihiga_county'],
  ['Bungoma County', 'bungoma_county'],
  ['Busia County', 'busia_county'],
  ['Siaya County', 'siaya_county'],
  ['Kisumu County', 'kisumu_county'],
  ['Homa Bay County', 'homa_bay_county'],
  ['Migori County', 'migori_county'],
  ['Kisii County', 'kisii_county'],
  ['Nyamira County', 'nyamira_county'],
  ['Nairobi County', 'nairobi_county'],
];

const constituencies = {
  mombasa_county: ['Mvita', 'Changamwe', 'Jomvu', 'Kisauni', 'Likoni', 'Nyali'],
  kwale_county: ['Msambweni', 'Lunga Lunga', 'Matuga', 'Kinango'],
  kilifi_county: ['Kaloleni', 'Rabai', 'Kilifi North', 'Kilifi South', 'Ganze', 'Malindi', 'Magarini'],
  tana_river_county: ['Galole', 'Garsen', 'Bura'],
  lamu_county: ['Lamu East', 'Lamu West'],
  taita_taveta_county: ['Voi', 'Taveta', 'Wundanyi', 'Mwatate'],
  garissa_county: ['Garissa Township', 'Balambala', 'Lagdera', 'Dadaab', 'Fafi', 'Ijara'],
  wajir_county: ['Wajir North', 'Wajir East', 'Tarbaj', 'Wajir West', 'Eldas', 'Wajir South'],
  mandera_county: ['Mandera West', 'Banissa', 'Mandera North', 'Mandera South', 'Mandera East', 'Lafey'],
  marsabit_county: ['Moyale', 'North Horr', 'Saku', 'Laisamis'],
  isiolo_county: ['Isiolo North', 'Isiolo South'],
  meru_county: ['Igembe South', 'Igembe Central', 'Igembe North', 'Tigania West', 'Tigania East', 'North Imenti', 'Buuri', 'Central Imenti', 'South Imenti'],
  tharaka_nithi_county: ['Maara', 'Chuka/Igambang\'ombe', 'Tharaka'],
  embu_county: ['Manyatta', 'Runyenjes', 'Mbeere South', 'Mbeere North'],
  kitui_county: ['Mwingi North', 'Mwingi West', 'Mwingi Central', 'Kitui West', 'Kitui Rural', 'Kitui Central', 'Kitui East', 'Kitui South'],
  machakos_county: ['Masinga', 'Yatta', 'Kangundo', 'Matungulu', 'Kathiani', 'Mavoko', 'Machakos Town', 'Mwala'],
  makueni_county: ['Mbooni', 'Kilome', 'Kaiti', 'Makueni', 'Kibwezi West', 'Kibwezi East'],
  nyandarua_county: ['Kinangop', 'Kipipiri', 'Ol Kalou', 'Ol Jorok', 'Ndaragwa'],
  nyeri_county: ['Tetu', 'Kieni', 'Mathira', 'Othaya', 'Mukurweini', 'Nyeri Town'],
  kirinyaga_county: ['Mwea', 'Gichugu', 'Ndia', 'Kirinyaga Central'],
  murang_a_county: ['Kangema', 'Mathioya', 'Kiharu', 'Kigumo', 'Maragwa', 'Kandara', 'Gatanga'],
  kiambu_county: ['Gatundu South', 'Gatundu North', 'Juja', 'Thika Town', 'Ruiru', 'Githunguri', 'Kiambu', 'Kiambaa', 'Kabete', 'Kikuyu', 'Limuru', 'Lari'],
  turkana_county: ['Turkana North', 'Turkana West', 'Turkana Central', 'Loima', 'Turkana South', 'Turkana East'],
  west_pokot_county: ['Kapenguria', 'Sigor', 'Kacheliba', 'Pokot South'],
  samburu_county: ['Samburu West', 'Samburu North', 'Samburu East'],
  trans_nzoia_county: ['Kwanza', 'Endebess', 'Saboti', 'Kiminini', 'Cherangany'],
  uasin_gishu_county: ['Soy', 'Turbo', 'Moiben', 'Ainabkoi', 'Kapseret', 'Kesses'],
  elgeyo_marakwet_county: ['Marakwet East', 'Marakwet West', 'Keiyo North', 'Keiyo South'],
  nandi_county: ['Tinderet', 'Aldai', 'Nandi Hills', 'Chesumei', 'Emgwen', 'Mosop'],
  baringo_county: ['Tiaty', 'Baringo North', 'Baringo Central', 'Baringo South', 'Mogotio', 'Eldama Ravine'],
  laikipia_county: ['Laikipia West', 'Laikipia East', 'Laikipia North'],
  nakuru_county: ['Molo', 'Njoro', 'Naivasha', 'Gilgil', 'Kuresoi South', 'Kuresoi North', 'Subukia', 'Rongai', 'Bahati', 'Nakuru Town West', 'Nakuru Town East'],
  narok_county: ['Kilgoris', 'Emurua Dikirr', 'Narok North', 'Narok East', 'Narok South', 'Narok West'],
  kajiado_county: ['Kajiado North', 'Kajiado Central', 'Kajiado East', 'Kajiado West', 'Kajiado South'],
  kericho_county: ['Kipkelion East', 'Kipkelion West', 'Ainamoi', 'Bureti', 'Belgut', 'Sigowet–Soin'],
  bomet_county: ['Sotik', 'Chepalungu', 'Bomet East', 'Bomet Central', 'Konoin'],
  kakamega_county: ['Lugari', 'Likuyani', 'Malava', 'Lurambi', 'Navakholo', 'Mumias West', 'Mumias East', 'Matungu', 'Butere', 'Khwisero', 'Shinyalu', 'Ikolomani'],
  vihiga_county: ['Vihiga', 'Sabatia', 'Hamisi', 'Luanda', 'Emuhaya'],
  bungoma_county: ['Mount Elgon', 'Sirisia', 'Kabuchai', 'Bumula', 'Kanduyi', 'Webuye East', 'Webuye West', 'Kimilili', 'Tongaren'],
  busia_county: ['Teso North', 'Teso South', 'Nambale', 'Matayos', 'Butula', 'Funyula', 'Budalangi'],
  siaya_county: ['Ugenya', 'Ugunja', 'Alego Usonga', 'Gem', 'Bondo', 'Rarieda'],
  kisumu_county: ['Kisumu East', 'Kisumu West', 'Kisumu Central', 'Seme', 'Nyando', 'Muhoroni', 'Nyakach'],
  homa_bay_county: ['Kasipul', 'Kabondo Kasipul', 'Karachuonyo', 'Rangwe', 'Homa Bay Town', 'Ndhiwa', 'Suba North', 'Suba South'],
  migori_county: ['Rongo', 'Awendo', 'Suna East', 'Suna West', 'Uriri', 'Nyatike', 'Kuria West', 'Kuria East'],
  kisii_county: ['Bonchari', 'South Mugirango', 'Bomachoge Borabu', 'Bobasi', 'Bomachoge Chache', 'Nyaribari Masaba', 'Nyaribari Chache', 'Kitutu Chache North', 'Kitutu Chache South'],
  nyamira_county: ['Kitutu Masaba', 'West Mugirango', 'North Mugirango', 'Borabu'],
  nairobi_county: ['Westlands', 'Kitisuru', 'Dagoretti North', 'Dagoretti South', 'Lang\'ata', 'Kibra', 'Roysambu', 'Kasarani', 'Ruaraka', 'Embakasi South', 'Embakasi North', 'Embakasi Central', 'Embakasi East', 'Embakasi West', 'Makadara', 'Kamukunji', 'Starehe'],
};

function slugify(value) {
  return value.trim().toLowerCase().replace(/[^a-z0-9]+/g, '_').replace(/^_|_$/g, '');
}

async function getExistingCodes(table) {
  const { data, error } = await supabase.from(table).select('code').not('code', 'is', null);
  if (error) throw error;
  return new Set((data ?? []).map((row) => row.code));
}

async function getExistingWardCodes() {
  const { data, error } = await supabase.from('wards').select('ward_code').not('ward_code', 'is', null);
  if (error) throw error;
  return new Set((data ?? []).map((row) => row.ward_code));
}

async function main() {
  const existingCountyCodes = await getExistingCodes('counties');
  const existingConstituencyCodes = await getExistingCodes('constituencies');
  const existingWardCodes = await getExistingWardCodes();

  const countyIds = {};
  for (const [name, code] of counties) {
    if (existingCountyCodes.has(code)) {
      const { data, error } = await supabase.from('counties').select('id').eq('code', code).maybeSingle();
      if (error) throw error;
      countyIds[code] = data?.id;
      continue;
    }
    const { data, error } = await supabase.from('counties').insert({ name, code }).select('id').single();
    if (error) throw error;
    countyIds[code] = data.id;
    existingCountyCodes.add(code);
  }

  for (const [countyCode, countyConstituencies] of Object.entries(constituencies)) {
    const countyId = countyIds[countyCode];
    if (!countyId) {
      throw new Error(`Missing county ID for ${countyCode}`);
    }
    for (const name of countyConstituencies) {
      const code = slugify(name);
      if (existingConstituencyCodes.has(code)) {
        continue;
      }
      const { error } = await supabase.from('constituencies').insert({ name, code, county_id: countyId });
      if (error) throw error;
      existingConstituencyCodes.add(code);
    }
  }

  for (const [countyCode, countyConstituencies] of Object.entries(constituencies)) {
    const countyId = countyIds[countyCode];
    if (!countyId) continue;
    for (const name of countyConstituencies) {
      const code = slugify(name);
      const { data: constituency, error: constituencyError } = await supabase.from('constituencies').select('id').eq('code', code).maybeSingle();
      if (constituencyError) throw constituencyError;
      if (!constituency?.id) continue;
      for (let wardIndex = 1; wardIndex <= 5; wardIndex += 1) {
        const wardName = `${name} Ward ${wardIndex}`;
        const wardCode = `${code}_ward_${wardIndex}`;
        if (existingWardCodes.has(wardCode)) continue;
        const { error } = await supabase.from('wards').insert({
          name: wardName,
          ward_code: wardCode,
          constituency_id: constituency.id,
          county_id: countyId,
        });
        if (error) throw error;
        existingWardCodes.add(wardCode);
      }
    }
  }

  const { count: countyCount, error: countyError } = await supabase.from('counties').select('*', { count: 'exact', head: true });
  if (countyError) throw countyError;
  const { count: constituencyCount, error: constituencyError } = await supabase.from('constituencies').select('*', { count: 'exact', head: true });
  if (constituencyError) throw constituencyError;
  const { count: wardCount, error: wardError } = await supabase.from('wards').select('*', { count: 'exact', head: true });
  if (wardError) throw wardError;

  console.log({ countyCount, constituencyCount, wardCount });
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
