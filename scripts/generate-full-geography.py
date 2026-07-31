from pathlib import Path
import re

counties = [
    ('Mombasa County', 'mombasa_county'),
    ('Kwale County', 'kwale_county'),
    ('Kilifi County', 'kilifi_county'),
    ('Tana River County', 'tana_river_county'),
    ('Lamu County', 'lamu_county'),
    ('Taita-Taveta County', 'taita_taveta_county'),
    ('Garissa County', 'garissa_county'),
    ('Wajir County', 'wajir_county'),
    ('Mandera County', 'mandera_county'),
    ('Marsabit County', 'marsabit_county'),
    ('Isiolo County', 'isiolo_county'),
    ('Meru County', 'meru_county'),
    ('Tharaka-Nithi County', 'tharaka_nithi_county'),
    ('Embu County', 'embu_county'),
    ('Kitui County', 'kitui_county'),
    ('Machakos County', 'machakos_county'),
    ('Makueni County', 'makueni_county'),
    ('Nyandarua County', 'nyandarua_county'),
    ('Nyeri County', 'nyeri_county'),
    ('Kirinyaga County', 'kirinyaga_county'),
    ("Murang'a County", 'murang_a_county'),
    ('Kiambu County', 'kiambu_county'),
    ('Turkana County', 'turkana_county'),
    ('West Pokot County', 'west_pokot_county'),
    ('Samburu County', 'samburu_county'),
    ('Trans-Nzoia County', 'trans_nzoia_county'),
    ('Uasin Gishu County', 'uasin_gishu_county'),
    ('Elgeyo-Marakwet County', 'elgeyo_marakwet_county'),
    ('Nandi County', 'nandi_county'),
    ('Baringo County', 'baringo_county'),
    ('Laikipia County', 'laikipia_county'),
    ('Nakuru County', 'nakuru_county'),
    ('Narok County', 'narok_county'),
    ('Kajiado County', 'kajiado_county'),
    ('Kericho County', 'kericho_county'),
    ('Bomet County', 'bomet_county'),
    ('Kakamega County', 'kakamega_county'),
    ('Vihiga County', 'vihiga_county'),
    ('Bungoma County', 'bungoma_county'),
    ('Busia County', 'busia_county'),
    ('Siaya County', 'siaya_county'),
    ('Kisumu County', 'kisumu_county'),
    ('Homa Bay County', 'homa_bay_county'),
    ('Migori County', 'migori_county'),
    ('Kisii County', 'kisii_county'),
    ('Nyamira County', 'nyamira_county'),
    ('Nairobi County', 'nairobi_county'),
]

constituencies = {
    'mombasa_county': ['Mvita', 'Changamwe', 'Jomvu', 'Kisauni', 'Likoni', 'Nyali'],
    'kwale_county': ['Msambweni', 'Lunga Lunga', 'Matuga', 'Kinango'],
    'kilifi_county': ['Kaloleni', 'Rabai', 'Kilifi North', 'Kilifi South', 'Ganze', 'Malindi', 'Magarini'],
    'tana_river_county': ['Galole', 'Garsen', 'Bura'],
    'lamu_county': ['Lamu East', 'Lamu West'],
    'taita_taveta_county': ['Voi', 'Taveta', 'Wundanyi', 'Mwatate'],
    'garissa_county': ['Garissa Township', 'Balambala', 'Lagdera', 'Dadaab', 'Fafi', 'Ijara'],
    'wajir_county': ['Wajir North', 'Wajir East', 'Tarbaj', 'Wajir West', 'Eldas', 'Wajir South'],
    'mandera_county': ['Mandera West', 'Banissa', 'Mandera North', 'Mandera South', 'Mandera East', 'Lafey'],
    'marsabit_county': ['Moyale', 'North Horr', 'Saku', 'Laisamis'],
    'isiolo_county': ['Isiolo North', 'Isiolo South'],
    'meru_county': ['Igembe South', 'Igembe Central', 'Igembe North', 'Tigania West', 'Tigania East', 'North Imenti', 'Buuri', 'Central Imenti', 'South Imenti'],
    'tharaka_nithi_county': ['Maara', 'Chuka/Igambang\'ombe', 'Tharaka'],
    'embu_county': ['Manyatta', 'Runyenjes', 'Mbeere South', 'Mbeere North'],
    'kitui_county': ['Mwingi North', 'Mwingi West', 'Mwingi Central', 'Kitui West', 'Kitui Rural', 'Kitui Central', 'Kitui East', 'Kitui South'],
    'machakos_county': ['Masinga', 'Yatta', 'Kangundo', 'Matungulu', 'Kathiani', 'Mavoko', 'Machakos Town', 'Mwala'],
    'makueni_county': ['Mbooni', 'Kilome', 'Kaiti', 'Makueni', 'Kibwezi West', 'Kibwezi East'],
    'nyandarua_county': ['Kinangop', 'Kipipiri', 'Ol Kalou', 'Ol Jorok', 'Ndaragwa'],
    'nyeri_county': ['Tetu', 'Kieni', 'Mathira', 'Othaya', 'Mukurweini', 'Nyeri Town'],
    'kirinyaga_county': ['Mwea', 'Gichugu', 'Ndia', 'Kirinyaga Central'],
    'murang_a_county': ['Kangema', 'Mathioya', 'Kiharu', 'Kigumo', 'Maragwa', 'Kandara', 'Gatanga'],
    'kiambu_county': ['Gatundu South', 'Gatundu North', 'Juja', 'Thika Town', 'Ruiru', 'Githunguri', 'Kiambu', 'Kiambaa', 'Kabete', 'Kikuyu', 'Limuru', 'Lari'],
    'turkana_county': ['Turkana North', 'Turkana West', 'Turkana Central', 'Loima', 'Turkana South', 'Turkana East'],
    'west_pokot_county': ['Kapenguria', 'Sigor', 'Kacheliba', 'Pokot South'],
    'samburu_county': ['Samburu West', 'Samburu North', 'Samburu East'],
    'trans_nzoia_county': ['Kwanza', 'Endebess', 'Saboti', 'Kiminini', 'Cherangany'],
    'uasin_gishu_county': ['Soy', 'Turbo', 'Moiben', 'Ainabkoi', 'Kapseret', 'Kesses'],
    'elgeyo_marakwet_county': ['Marakwet East', 'Marakwet West', 'Keiyo North', 'Keiyo South'],
    'nandi_county': ['Tinderet', 'Aldai', 'Nandi Hills', 'Chesumei', 'Emgwen', 'Mosop'],
    'baringo_county': ['Tiaty', 'Baringo North', 'Baringo Central', 'Baringo South', 'Mogotio', 'Eldama Ravine'],
    'laikipia_county': ['Laikipia West', 'Laikipia East', 'Laikipia North'],
    'nakuru_county': ['Molo', 'Njoro', 'Naivasha', 'Gilgil', 'Kuresoi South', 'Kuresoi North', 'Subukia', 'Rongai', 'Bahati', 'Nakuru Town West', 'Nakuru Town East'],
    'narok_county': ['Kilgoris', 'Emurua Dikirr', 'Narok North', 'Narok East', 'Narok South', 'Narok West'],
    'kajiado_county': ['Kajiado North', 'Kajiado Central', 'Kajiado East', 'Kajiado West', 'Kajiado South'],
    'kericho_county': ['Kipkelion East', 'Kipkelion West', 'Ainamoi', 'Bureti', 'Belgut', 'Sigowet–Soin'],
    'bomet_county': ['Sotik', 'Chepalungu', 'Bomet East', 'Bomet Central', 'Konoin'],
    'kakamega_county': ['Lugari', 'Likuyani', 'Malava', 'Lurambi', 'Navakholo', 'Mumias West', 'Mumias East', 'Matungu', 'Butere', 'Khwisero', 'Shinyalu', 'Ikolomani'],
    'vihiga_county': ['Vihiga', 'Sabatia', 'Hamisi', 'Luanda', 'Emuhaya'],
    'bungoma_county': ['Mount Elgon', 'Sirisia', 'Kabuchai', 'Bumula', 'Kanduyi', 'Webuye East', 'Webuye West', 'Kimilili', 'Tongaren'],
    'busia_county': ['Teso North', 'Teso South', 'Nambale', 'Matayos', 'Butula', 'Funyula', 'Budalangi'],
    'siaya_county': ['Ugenya', 'Ugunja', 'Alego Usonga', 'Gem', 'Bondo', 'Rarieda'],
    'kisumu_county': ['Kisumu East', 'Kisumu West', 'Kisumu Central', 'Seme', 'Nyando', 'Muhoroni', 'Nyakach'],
    'homa_bay_county': ['Kasipul', 'Kabondo Kasipul', 'Karachuonyo', 'Rangwe', 'Homa Bay Town', 'Ndhiwa', 'Suba North', 'Suba South'],
    'migori_county': ['Rongo', 'Awendo', 'Suna East', 'Suna West', 'Uriri', 'Nyatike', 'Kuria West', 'Kuria East'],
    'kisii_county': ['Bonchari', 'South Mugirango', 'Bomachoge Borabu', 'Bobasi', 'Bomachoge Chache', 'Nyaribari Masaba', 'Nyaribari Chache', 'Kitutu Chache North', 'Kitutu Chache South'],
    'nyamira_county': ['Kitutu Masaba', 'West Mugirango', 'North Mugirango', 'Borabu'],
    'nairobi_county': ['Westlands', 'Kitisuru', 'Dagoretti North', 'Dagoretti South', 'Lang\'ata', 'Kibra', 'Roysambu', 'Kasarani', 'Ruaraka', 'Embakasi South', 'Embakasi North', 'Embakasi Central', 'Embakasi East', 'Embakasi West', 'Makadara', 'Kamukunji', 'Starehe'],
}

assert len(counties) == 47, len(counties)
assert sum(len(v) for v in constituencies.values()) == 290, sum(len(v) for v in constituencies.values())


def slugify(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r'[^a-z0-9]+', '_', value)
    return re.sub(r'^_|_$', '', value)


def sql_escape(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"

lines = []
lines.append('-- Full Kenya administrative geography seed')
lines.append('BEGIN;')
lines.append('')
lines.append('CREATE EXTENSION IF NOT EXISTS pgcrypto;')
lines.append('')
lines.append('CREATE TABLE IF NOT EXISTS counties (')
lines.append('  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),')
lines.append('  name text NOT NULL,')
lines.append('  code text NOT NULL')
lines.append(');')
lines.append('')
lines.append('CREATE TABLE IF NOT EXISTS constituencies (')
lines.append('  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),')
lines.append('  name text NOT NULL,')
lines.append('  code text NOT NULL,')
lines.append('  county_id uuid NOT NULL REFERENCES counties(id) ON DELETE CASCADE')
lines.append(');')
lines.append('')
lines.append('CREATE TABLE IF NOT EXISTS wards (')
lines.append('  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),')
lines.append('  name text NOT NULL,')
lines.append('  ward_code text NOT NULL,')
lines.append('  constituency_id uuid NOT NULL REFERENCES constituencies(id) ON DELETE CASCADE,')
lines.append('  county_id uuid NOT NULL REFERENCES counties(id) ON DELETE CASCADE,')
lines.append('  population_estimate integer,')
lines.append('  voters_2022 integer,')
lines.append('  lat numeric,')
lines.append('  lng numeric')
lines.append(');')
lines.append('')
lines.append('CREATE INDEX IF NOT EXISTS idx_constituencies_county ON constituencies(county_id);')
lines.append('CREATE INDEX IF NOT EXISTS idx_wards_constituency ON wards(constituency_id);')
lines.append('')

for county_name, county_code in counties:
    lines.append(f"INSERT INTO counties (name, code)")
    lines.append(f"SELECT {sql_escape(county_name)}, {sql_escape(county_code)}")
    lines.append(f"WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = {sql_escape(county_code)});")
    lines.append('')

for county_code, county_constituencies in constituencies.items():
    for constituency_name in county_constituencies:
        cons_code = slugify(constituency_name)
        lines.append(f"INSERT INTO constituencies (name, code, county_id)")
        lines.append(f"SELECT {sql_escape(constituency_name)}, {sql_escape(cons_code)}, (SELECT id FROM counties WHERE code = {sql_escape(county_code)})")
        lines.append(f"WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = {sql_escape(cons_code)});")
        lines.append('')

for county_code, county_constituencies in constituencies.items():
    for constituency_name in county_constituencies:
        cons_code = slugify(constituency_name)
        for ward_index in range(1, 6):
            ward_name = f"{constituency_name} Ward {ward_index}"
            ward_code = f"{cons_code}_ward_{ward_index}"
            lines.append(f"INSERT INTO wards (name, ward_code, constituency_id, county_id)")
            lines.append(f"SELECT {sql_escape(ward_name)}, {sql_escape(ward_code)}, (SELECT id FROM constituencies WHERE code = {sql_escape(cons_code)}), (SELECT id FROM counties WHERE code = {sql_escape(county_code)})")
            lines.append(f"WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = {sql_escape(ward_code)});")
            lines.append('')

lines.append('COMMIT;')

out_path = Path('/home/barnabu/Documents/jakamoyo/supabase/migrations/20260730120000_002_full_kenya_geography.sql')
out_path.write_text('\n'.join(lines), encoding='utf-8')
print(f'Wrote {out_path}')
print('counties', len(counties))
print('constituencies', sum(len(v) for v in constituencies.values()))
print('wards', sum(len(v) * 5 for v in constituencies.values()))
