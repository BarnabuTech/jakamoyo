-- Full Kenya administrative geography seed
BEGIN;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS counties (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  code text NOT NULL
);

CREATE TABLE IF NOT EXISTS constituencies (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  code text NOT NULL,
  county_id uuid NOT NULL REFERENCES counties(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS wards (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  ward_code text NOT NULL,
  constituency_id uuid NOT NULL REFERENCES constituencies(id) ON DELETE CASCADE,
  county_id uuid NOT NULL REFERENCES counties(id) ON DELETE CASCADE,
  population_estimate integer,
  voters_2022 integer,
  lat numeric,
  lng numeric
);

CREATE INDEX IF NOT EXISTS idx_constituencies_county ON constituencies(county_id);
CREATE INDEX IF NOT EXISTS idx_wards_constituency ON wards(constituency_id);

INSERT INTO counties (name, code)
SELECT 'Mombasa County', 'mombasa_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'mombasa_county');

INSERT INTO counties (name, code)
SELECT 'Kwale County', 'kwale_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kwale_county');

INSERT INTO counties (name, code)
SELECT 'Kilifi County', 'kilifi_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kilifi_county');

INSERT INTO counties (name, code)
SELECT 'Tana River County', 'tana_river_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'tana_river_county');

INSERT INTO counties (name, code)
SELECT 'Lamu County', 'lamu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'lamu_county');

INSERT INTO counties (name, code)
SELECT 'Taita-Taveta County', 'taita_taveta_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'taita_taveta_county');

INSERT INTO counties (name, code)
SELECT 'Garissa County', 'garissa_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'garissa_county');

INSERT INTO counties (name, code)
SELECT 'Wajir County', 'wajir_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'wajir_county');

INSERT INTO counties (name, code)
SELECT 'Mandera County', 'mandera_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'mandera_county');

INSERT INTO counties (name, code)
SELECT 'Marsabit County', 'marsabit_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'marsabit_county');

INSERT INTO counties (name, code)
SELECT 'Isiolo County', 'isiolo_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'isiolo_county');

INSERT INTO counties (name, code)
SELECT 'Meru County', 'meru_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'meru_county');

INSERT INTO counties (name, code)
SELECT 'Tharaka-Nithi County', 'tharaka_nithi_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'tharaka_nithi_county');

INSERT INTO counties (name, code)
SELECT 'Embu County', 'embu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'embu_county');

INSERT INTO counties (name, code)
SELECT 'Kitui County', 'kitui_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kitui_county');

INSERT INTO counties (name, code)
SELECT 'Machakos County', 'machakos_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'machakos_county');

INSERT INTO counties (name, code)
SELECT 'Makueni County', 'makueni_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'makueni_county');

INSERT INTO counties (name, code)
SELECT 'Nyandarua County', 'nyandarua_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nyandarua_county');

INSERT INTO counties (name, code)
SELECT 'Nyeri County', 'nyeri_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nyeri_county');

INSERT INTO counties (name, code)
SELECT 'Kirinyaga County', 'kirinyaga_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kirinyaga_county');

INSERT INTO counties (name, code)
SELECT 'Murang''a County', 'murang_a_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'murang_a_county');

INSERT INTO counties (name, code)
SELECT 'Kiambu County', 'kiambu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kiambu_county');

INSERT INTO counties (name, code)
SELECT 'Turkana County', 'turkana_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'turkana_county');

INSERT INTO counties (name, code)
SELECT 'West Pokot County', 'west_pokot_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'west_pokot_county');

INSERT INTO counties (name, code)
SELECT 'Samburu County', 'samburu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'samburu_county');

INSERT INTO counties (name, code)
SELECT 'Trans-Nzoia County', 'trans_nzoia_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'trans_nzoia_county');

INSERT INTO counties (name, code)
SELECT 'Uasin Gishu County', 'uasin_gishu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'uasin_gishu_county');

INSERT INTO counties (name, code)
SELECT 'Elgeyo-Marakwet County', 'elgeyo_marakwet_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'elgeyo_marakwet_county');

INSERT INTO counties (name, code)
SELECT 'Nandi County', 'nandi_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nandi_county');

INSERT INTO counties (name, code)
SELECT 'Baringo County', 'baringo_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'baringo_county');

INSERT INTO counties (name, code)
SELECT 'Laikipia County', 'laikipia_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'laikipia_county');

INSERT INTO counties (name, code)
SELECT 'Nakuru County', 'nakuru_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nakuru_county');

INSERT INTO counties (name, code)
SELECT 'Narok County', 'narok_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'narok_county');

INSERT INTO counties (name, code)
SELECT 'Kajiado County', 'kajiado_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kajiado_county');

INSERT INTO counties (name, code)
SELECT 'Kericho County', 'kericho_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kericho_county');

INSERT INTO counties (name, code)
SELECT 'Bomet County', 'bomet_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'bomet_county');

INSERT INTO counties (name, code)
SELECT 'Kakamega County', 'kakamega_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kakamega_county');

INSERT INTO counties (name, code)
SELECT 'Vihiga County', 'vihiga_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'vihiga_county');

INSERT INTO counties (name, code)
SELECT 'Bungoma County', 'bungoma_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'bungoma_county');

INSERT INTO counties (name, code)
SELECT 'Busia County', 'busia_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'busia_county');

INSERT INTO counties (name, code)
SELECT 'Siaya County', 'siaya_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'siaya_county');

INSERT INTO counties (name, code)
SELECT 'Kisumu County', 'kisumu_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kisumu_county');

INSERT INTO counties (name, code)
SELECT 'Homa Bay County', 'homa_bay_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'homa_bay_county');

INSERT INTO counties (name, code)
SELECT 'Migori County', 'migori_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'migori_county');

INSERT INTO counties (name, code)
SELECT 'Kisii County', 'kisii_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'kisii_county');

INSERT INTO counties (name, code)
SELECT 'Nyamira County', 'nyamira_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nyamira_county');

INSERT INTO counties (name, code)
SELECT 'Nairobi County', 'nairobi_county'
WHERE NOT EXISTS (SELECT 1 FROM counties WHERE code = 'nairobi_county');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mvita', 'mvita', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mvita');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Changamwe', 'changamwe', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'changamwe');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Jomvu', 'jomvu', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'jomvu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kisauni', 'kisauni', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kisauni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Likoni', 'likoni', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'likoni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyali', 'nyali', (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyali');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Msambweni', 'msambweni', (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'msambweni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lunga Lunga', 'lunga_lunga', (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lunga_lunga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Matuga', 'matuga', (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'matuga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kinango', 'kinango', (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kinango');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kaloleni', 'kaloleni', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kaloleni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Rabai', 'rabai', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'rabai');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kilifi North', 'kilifi_north', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kilifi_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kilifi South', 'kilifi_south', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kilifi_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ganze', 'ganze', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ganze');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Malindi', 'malindi', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'malindi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Magarini', 'magarini', (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'magarini');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Galole', 'galole', (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'galole');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Garsen', 'garsen', (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'garsen');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bura', 'bura', (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bura');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lamu East', 'lamu_east', (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lamu_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lamu West', 'lamu_west', (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lamu_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Voi', 'voi', (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'voi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Taveta', 'taveta', (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'taveta');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Wundanyi', 'wundanyi', (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'wundanyi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwatate', 'mwatate', (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwatate');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Garissa Township', 'garissa_township', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'garissa_township');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Balambala', 'balambala', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'balambala');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lagdera', 'lagdera', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lagdera');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Dadaab', 'dadaab', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'dadaab');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Fafi', 'fafi', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'fafi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ijara', 'ijara', (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ijara');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Wajir North', 'wajir_north', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'wajir_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Wajir East', 'wajir_east', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'wajir_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tarbaj', 'tarbaj', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tarbaj');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Wajir West', 'wajir_west', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'wajir_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Eldas', 'eldas', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'eldas');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Wajir South', 'wajir_south', (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'wajir_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mandera West', 'mandera_west', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mandera_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Banissa', 'banissa', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'banissa');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mandera North', 'mandera_north', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mandera_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mandera South', 'mandera_south', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mandera_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mandera East', 'mandera_east', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mandera_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lafey', 'lafey', (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lafey');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Moyale', 'moyale', (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'moyale');

INSERT INTO constituencies (name, code, county_id)
SELECT 'North Horr', 'north_horr', (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'north_horr');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Saku', 'saku', (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'saku');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Laisamis', 'laisamis', (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'laisamis');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Isiolo North', 'isiolo_north', (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'isiolo_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Isiolo South', 'isiolo_south', (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'isiolo_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Igembe South', 'igembe_south', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'igembe_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Igembe Central', 'igembe_central', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'igembe_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Igembe North', 'igembe_north', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'igembe_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tigania West', 'tigania_west', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tigania_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tigania East', 'tigania_east', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tigania_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'North Imenti', 'north_imenti', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'north_imenti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Buuri', 'buuri', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'buuri');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Central Imenti', 'central_imenti', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'central_imenti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'South Imenti', 'south_imenti', (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'south_imenti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Maara', 'maara', (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'maara');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Chuka/Igambang''ombe', 'chuka_igambang_ombe', (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'chuka_igambang_ombe');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tharaka', 'tharaka', (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tharaka');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Manyatta', 'manyatta', (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'manyatta');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Runyenjes', 'runyenjes', (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'runyenjes');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mbeere South', 'mbeere_south', (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mbeere_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mbeere North', 'mbeere_north', (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mbeere_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwingi North', 'mwingi_north', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwingi_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwingi West', 'mwingi_west', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwingi_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwingi Central', 'mwingi_central', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwingi_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitui West', 'kitui_west', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitui_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitui Rural', 'kitui_rural', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitui_rural');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitui Central', 'kitui_central', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitui_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitui East', 'kitui_east', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitui_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitui South', 'kitui_south', (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitui_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Masinga', 'masinga', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'masinga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Yatta', 'yatta', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'yatta');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kangundo', 'kangundo', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kangundo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Matungulu', 'matungulu', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'matungulu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kathiani', 'kathiani', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kathiani');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mavoko', 'mavoko', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mavoko');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Machakos Town', 'machakos_town', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'machakos_town');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwala', 'mwala', (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwala');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mbooni', 'mbooni', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mbooni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kilome', 'kilome', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kilome');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kaiti', 'kaiti', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kaiti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Makueni', 'makueni', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'makueni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kibwezi West', 'kibwezi_west', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kibwezi_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kibwezi East', 'kibwezi_east', (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kibwezi_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kinangop', 'kinangop', (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kinangop');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kipipiri', 'kipipiri', (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kipipiri');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ol Kalou', 'ol_kalou', (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ol_kalou');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ol Jorok', 'ol_jorok', (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ol_jorok');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ndaragwa', 'ndaragwa', (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ndaragwa');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tetu', 'tetu', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tetu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kieni', 'kieni', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kieni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mathira', 'mathira', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mathira');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Othaya', 'othaya', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'othaya');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mukurweini', 'mukurweini', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mukurweini');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyeri Town', 'nyeri_town', (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyeri_town');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mwea', 'mwea', (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mwea');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gichugu', 'gichugu', (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gichugu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ndia', 'ndia', (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ndia');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kirinyaga Central', 'kirinyaga_central', (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kirinyaga_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kangema', 'kangema', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kangema');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mathioya', 'mathioya', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mathioya');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kiharu', 'kiharu', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kiharu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kigumo', 'kigumo', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kigumo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Maragwa', 'maragwa', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'maragwa');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kandara', 'kandara', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kandara');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gatanga', 'gatanga', (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gatanga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gatundu South', 'gatundu_south', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gatundu_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gatundu North', 'gatundu_north', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gatundu_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Juja', 'juja', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'juja');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Thika Town', 'thika_town', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'thika_town');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ruiru', 'ruiru', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ruiru');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Githunguri', 'githunguri', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'githunguri');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kiambu', 'kiambu', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kiambu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kiambaa', 'kiambaa', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kiambaa');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kabete', 'kabete', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kabete');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kikuyu', 'kikuyu', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kikuyu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Limuru', 'limuru', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'limuru');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lari', 'lari', (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lari');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turkana North', 'turkana_north', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turkana_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turkana West', 'turkana_west', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turkana_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turkana Central', 'turkana_central', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turkana_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Loima', 'loima', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'loima');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turkana South', 'turkana_south', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turkana_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turkana East', 'turkana_east', (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turkana_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kapenguria', 'kapenguria', (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kapenguria');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Sigor', 'sigor', (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'sigor');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kacheliba', 'kacheliba', (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kacheliba');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Pokot South', 'pokot_south', (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'pokot_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Samburu West', 'samburu_west', (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'samburu_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Samburu North', 'samburu_north', (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'samburu_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Samburu East', 'samburu_east', (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'samburu_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kwanza', 'kwanza', (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kwanza');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Endebess', 'endebess', (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'endebess');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Saboti', 'saboti', (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'saboti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kiminini', 'kiminini', (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kiminini');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Cherangany', 'cherangany', (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'cherangany');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Soy', 'soy', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'soy');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Turbo', 'turbo', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'turbo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Moiben', 'moiben', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'moiben');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ainabkoi', 'ainabkoi', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ainabkoi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kapseret', 'kapseret', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kapseret');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kesses', 'kesses', (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kesses');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Marakwet East', 'marakwet_east', (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'marakwet_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Marakwet West', 'marakwet_west', (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'marakwet_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Keiyo North', 'keiyo_north', (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'keiyo_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Keiyo South', 'keiyo_south', (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'keiyo_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tinderet', 'tinderet', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tinderet');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Aldai', 'aldai', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'aldai');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nandi Hills', 'nandi_hills', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nandi_hills');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Chesumei', 'chesumei', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'chesumei');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Emgwen', 'emgwen', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'emgwen');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mosop', 'mosop', (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mosop');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tiaty', 'tiaty', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tiaty');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Baringo North', 'baringo_north', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'baringo_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Baringo Central', 'baringo_central', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'baringo_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Baringo South', 'baringo_south', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'baringo_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mogotio', 'mogotio', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mogotio');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Eldama Ravine', 'eldama_ravine', (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'eldama_ravine');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Laikipia West', 'laikipia_west', (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'laikipia_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Laikipia East', 'laikipia_east', (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'laikipia_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Laikipia North', 'laikipia_north', (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'laikipia_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Molo', 'molo', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'molo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Njoro', 'njoro', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'njoro');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Naivasha', 'naivasha', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'naivasha');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gilgil', 'gilgil', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gilgil');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kuresoi South', 'kuresoi_south', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kuresoi_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kuresoi North', 'kuresoi_north', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kuresoi_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Subukia', 'subukia', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'subukia');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Rongai', 'rongai', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'rongai');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bahati', 'bahati', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bahati');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nakuru Town West', 'nakuru_town_west', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nakuru_town_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nakuru Town East', 'nakuru_town_east', (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nakuru_town_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kilgoris', 'kilgoris', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kilgoris');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Emurua Dikirr', 'emurua_dikirr', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'emurua_dikirr');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Narok North', 'narok_north', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'narok_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Narok East', 'narok_east', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'narok_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Narok South', 'narok_south', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'narok_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Narok West', 'narok_west', (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'narok_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kajiado North', 'kajiado_north', (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kajiado_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kajiado Central', 'kajiado_central', (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kajiado_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kajiado East', 'kajiado_east', (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kajiado_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kajiado West', 'kajiado_west', (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kajiado_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kajiado South', 'kajiado_south', (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kajiado_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kipkelion East', 'kipkelion_east', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kipkelion_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kipkelion West', 'kipkelion_west', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kipkelion_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ainamoi', 'ainamoi', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ainamoi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bureti', 'bureti', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bureti');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Belgut', 'belgut', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'belgut');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Sigowet–Soin', 'sigowet_soin', (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'sigowet_soin');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Sotik', 'sotik', (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'sotik');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Chepalungu', 'chepalungu', (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'chepalungu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bomet East', 'bomet_east', (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bomet_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bomet Central', 'bomet_central', (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bomet_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Konoin', 'konoin', (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'konoin');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lugari', 'lugari', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lugari');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Likuyani', 'likuyani', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'likuyani');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Malava', 'malava', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'malava');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lurambi', 'lurambi', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lurambi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Navakholo', 'navakholo', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'navakholo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mumias West', 'mumias_west', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mumias_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mumias East', 'mumias_east', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mumias_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Matungu', 'matungu', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'matungu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Butere', 'butere', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'butere');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Khwisero', 'khwisero', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'khwisero');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Shinyalu', 'shinyalu', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'shinyalu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ikolomani', 'ikolomani', (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ikolomani');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Vihiga', 'vihiga', (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'vihiga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Sabatia', 'sabatia', (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'sabatia');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Hamisi', 'hamisi', (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'hamisi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Luanda', 'luanda', (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'luanda');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Emuhaya', 'emuhaya', (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'emuhaya');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Mount Elgon', 'mount_elgon', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'mount_elgon');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Sirisia', 'sirisia', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'sirisia');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kabuchai', 'kabuchai', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kabuchai');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bumula', 'bumula', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bumula');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kanduyi', 'kanduyi', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kanduyi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Webuye East', 'webuye_east', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'webuye_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Webuye West', 'webuye_west', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'webuye_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kimilili', 'kimilili', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kimilili');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Tongaren', 'tongaren', (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'tongaren');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Teso North', 'teso_north', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'teso_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Teso South', 'teso_south', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'teso_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nambale', 'nambale', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nambale');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Matayos', 'matayos', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'matayos');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Butula', 'butula', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'butula');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Funyula', 'funyula', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'funyula');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Budalangi', 'budalangi', (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'budalangi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ugenya', 'ugenya', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ugenya');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ugunja', 'ugunja', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ugunja');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Alego Usonga', 'alego_usonga', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'alego_usonga');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Gem', 'gem', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'gem');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bondo', 'bondo', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bondo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Rarieda', 'rarieda', (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'rarieda');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kisumu East', 'kisumu_east', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kisumu_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kisumu West', 'kisumu_west', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kisumu_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kisumu Central', 'kisumu_central', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kisumu_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Seme', 'seme', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'seme');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyando', 'nyando', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyando');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Muhoroni', 'muhoroni', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'muhoroni');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyakach', 'nyakach', (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyakach');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kasipul', 'kasipul', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kasipul');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kabondo Kasipul', 'kabondo_kasipul', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kabondo_kasipul');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Karachuonyo', 'karachuonyo', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'karachuonyo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Rangwe', 'rangwe', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'rangwe');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Homa Bay Town', 'homa_bay_town', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'homa_bay_town');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ndhiwa', 'ndhiwa', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ndhiwa');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Suba North', 'suba_north', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'suba_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Suba South', 'suba_south', (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'suba_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Rongo', 'rongo', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'rongo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Awendo', 'awendo', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'awendo');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Suna East', 'suna_east', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'suna_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Suna West', 'suna_west', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'suna_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Uriri', 'uriri', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'uriri');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyatike', 'nyatike', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyatike');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kuria West', 'kuria_west', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kuria_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kuria East', 'kuria_east', (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kuria_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bonchari', 'bonchari', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bonchari');

INSERT INTO constituencies (name, code, county_id)
SELECT 'South Mugirango', 'south_mugirango', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'south_mugirango');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bomachoge Borabu', 'bomachoge_borabu', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bomachoge_borabu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bobasi', 'bobasi', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bobasi');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Bomachoge Chache', 'bomachoge_chache', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'bomachoge_chache');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyaribari Masaba', 'nyaribari_masaba', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyaribari_masaba');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Nyaribari Chache', 'nyaribari_chache', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'nyaribari_chache');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitutu Chache North', 'kitutu_chache_north', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitutu_chache_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitutu Chache South', 'kitutu_chache_south', (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitutu_chache_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitutu Masaba', 'kitutu_masaba', (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitutu_masaba');

INSERT INTO constituencies (name, code, county_id)
SELECT 'West Mugirango', 'west_mugirango', (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'west_mugirango');

INSERT INTO constituencies (name, code, county_id)
SELECT 'North Mugirango', 'north_mugirango', (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'north_mugirango');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Borabu', 'borabu', (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'borabu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Westlands', 'westlands', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'westlands');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kitisuru', 'kitisuru', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kitisuru');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Dagoretti North', 'dagoretti_north', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'dagoretti_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Dagoretti South', 'dagoretti_south', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'dagoretti_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Lang''ata', 'lang_ata', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'lang_ata');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kibra', 'kibra', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kibra');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Roysambu', 'roysambu', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'roysambu');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kasarani', 'kasarani', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kasarani');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Ruaraka', 'ruaraka', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'ruaraka');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Embakasi South', 'embakasi_south', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'embakasi_south');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Embakasi North', 'embakasi_north', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'embakasi_north');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Embakasi Central', 'embakasi_central', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'embakasi_central');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Embakasi East', 'embakasi_east', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'embakasi_east');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Embakasi West', 'embakasi_west', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'embakasi_west');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Makadara', 'makadara', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'makadara');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Kamukunji', 'kamukunji', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'kamukunji');

INSERT INTO constituencies (name, code, county_id)
SELECT 'Starehe', 'starehe', (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM constituencies WHERE code = 'starehe');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mvita Ward 1', 'mvita_ward_1', (SELECT id FROM constituencies WHERE code = 'mvita'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mvita_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mvita Ward 2', 'mvita_ward_2', (SELECT id FROM constituencies WHERE code = 'mvita'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mvita_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mvita Ward 3', 'mvita_ward_3', (SELECT id FROM constituencies WHERE code = 'mvita'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mvita_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mvita Ward 4', 'mvita_ward_4', (SELECT id FROM constituencies WHERE code = 'mvita'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mvita_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mvita Ward 5', 'mvita_ward_5', (SELECT id FROM constituencies WHERE code = 'mvita'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mvita_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Changamwe Ward 1', 'changamwe_ward_1', (SELECT id FROM constituencies WHERE code = 'changamwe'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'changamwe_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Changamwe Ward 2', 'changamwe_ward_2', (SELECT id FROM constituencies WHERE code = 'changamwe'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'changamwe_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Changamwe Ward 3', 'changamwe_ward_3', (SELECT id FROM constituencies WHERE code = 'changamwe'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'changamwe_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Changamwe Ward 4', 'changamwe_ward_4', (SELECT id FROM constituencies WHERE code = 'changamwe'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'changamwe_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Changamwe Ward 5', 'changamwe_ward_5', (SELECT id FROM constituencies WHERE code = 'changamwe'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'changamwe_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Jomvu Ward 1', 'jomvu_ward_1', (SELECT id FROM constituencies WHERE code = 'jomvu'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'jomvu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Jomvu Ward 2', 'jomvu_ward_2', (SELECT id FROM constituencies WHERE code = 'jomvu'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'jomvu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Jomvu Ward 3', 'jomvu_ward_3', (SELECT id FROM constituencies WHERE code = 'jomvu'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'jomvu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Jomvu Ward 4', 'jomvu_ward_4', (SELECT id FROM constituencies WHERE code = 'jomvu'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'jomvu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Jomvu Ward 5', 'jomvu_ward_5', (SELECT id FROM constituencies WHERE code = 'jomvu'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'jomvu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisauni Ward 1', 'kisauni_ward_1', (SELECT id FROM constituencies WHERE code = 'kisauni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisauni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisauni Ward 2', 'kisauni_ward_2', (SELECT id FROM constituencies WHERE code = 'kisauni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisauni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisauni Ward 3', 'kisauni_ward_3', (SELECT id FROM constituencies WHERE code = 'kisauni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisauni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisauni Ward 4', 'kisauni_ward_4', (SELECT id FROM constituencies WHERE code = 'kisauni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisauni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisauni Ward 5', 'kisauni_ward_5', (SELECT id FROM constituencies WHERE code = 'kisauni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisauni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bofu', 'bofu', (SELECT id FROM constituencies WHERE code = 'likoni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bofu');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likoni Ward 2', 'likoni_ward_2', (SELECT id FROM constituencies WHERE code = 'likoni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likoni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likoni Ward 3', 'likoni_ward_3', (SELECT id FROM constituencies WHERE code = 'likoni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likoni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likoni Ward 4', 'likoni_ward_4', (SELECT id FROM constituencies WHERE code = 'likoni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likoni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likoni Ward 5', 'likoni_ward_5', (SELECT id FROM constituencies WHERE code = 'likoni'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likoni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyali Ward 1', 'nyali_ward_1', (SELECT id FROM constituencies WHERE code = 'nyali'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyali_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyali Ward 2', 'nyali_ward_2', (SELECT id FROM constituencies WHERE code = 'nyali'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyali_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyali Ward 3', 'nyali_ward_3', (SELECT id FROM constituencies WHERE code = 'nyali'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyali_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyali Ward 4', 'nyali_ward_4', (SELECT id FROM constituencies WHERE code = 'nyali'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyali_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyali Ward 5', 'nyali_ward_5', (SELECT id FROM constituencies WHERE code = 'nyali'), (SELECT id FROM counties WHERE code = 'mombasa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyali_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Msambweni Ward 1', 'msambweni_ward_1', (SELECT id FROM constituencies WHERE code = 'msambweni'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'msambweni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Msambweni Ward 2', 'msambweni_ward_2', (SELECT id FROM constituencies WHERE code = 'msambweni'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'msambweni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Msambweni Ward 3', 'msambweni_ward_3', (SELECT id FROM constituencies WHERE code = 'msambweni'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'msambweni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Msambweni Ward 4', 'msambweni_ward_4', (SELECT id FROM constituencies WHERE code = 'msambweni'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'msambweni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Msambweni Ward 5', 'msambweni_ward_5', (SELECT id FROM constituencies WHERE code = 'msambweni'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'msambweni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lunga Lunga Ward 1', 'lunga_lunga_ward_1', (SELECT id FROM constituencies WHERE code = 'lunga_lunga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lunga_lunga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lunga Lunga Ward 2', 'lunga_lunga_ward_2', (SELECT id FROM constituencies WHERE code = 'lunga_lunga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lunga_lunga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lunga Lunga Ward 3', 'lunga_lunga_ward_3', (SELECT id FROM constituencies WHERE code = 'lunga_lunga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lunga_lunga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lunga Lunga Ward 4', 'lunga_lunga_ward_4', (SELECT id FROM constituencies WHERE code = 'lunga_lunga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lunga_lunga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lunga Lunga Ward 5', 'lunga_lunga_ward_5', (SELECT id FROM constituencies WHERE code = 'lunga_lunga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lunga_lunga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matuga Ward 1', 'matuga_ward_1', (SELECT id FROM constituencies WHERE code = 'matuga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matuga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matuga Ward 2', 'matuga_ward_2', (SELECT id FROM constituencies WHERE code = 'matuga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matuga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matuga Ward 3', 'matuga_ward_3', (SELECT id FROM constituencies WHERE code = 'matuga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matuga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matuga Ward 4', 'matuga_ward_4', (SELECT id FROM constituencies WHERE code = 'matuga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matuga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matuga Ward 5', 'matuga_ward_5', (SELECT id FROM constituencies WHERE code = 'matuga'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matuga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinango Ward 1', 'kinango_ward_1', (SELECT id FROM constituencies WHERE code = 'kinango'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinango_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinango Ward 2', 'kinango_ward_2', (SELECT id FROM constituencies WHERE code = 'kinango'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinango_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinango Ward 3', 'kinango_ward_3', (SELECT id FROM constituencies WHERE code = 'kinango'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinango_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinango Ward 4', 'kinango_ward_4', (SELECT id FROM constituencies WHERE code = 'kinango'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinango_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinango Ward 5', 'kinango_ward_5', (SELECT id FROM constituencies WHERE code = 'kinango'), (SELECT id FROM counties WHERE code = 'kwale_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinango_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaloleni Ward 1', 'kaloleni_ward_1', (SELECT id FROM constituencies WHERE code = 'kaloleni'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaloleni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaloleni Ward 2', 'kaloleni_ward_2', (SELECT id FROM constituencies WHERE code = 'kaloleni'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaloleni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaloleni Ward 3', 'kaloleni_ward_3', (SELECT id FROM constituencies WHERE code = 'kaloleni'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaloleni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaloleni Ward 4', 'kaloleni_ward_4', (SELECT id FROM constituencies WHERE code = 'kaloleni'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaloleni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaloleni Ward 5', 'kaloleni_ward_5', (SELECT id FROM constituencies WHERE code = 'kaloleni'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaloleni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rabai Ward 1', 'rabai_ward_1', (SELECT id FROM constituencies WHERE code = 'rabai'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rabai_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rabai Ward 2', 'rabai_ward_2', (SELECT id FROM constituencies WHERE code = 'rabai'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rabai_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rabai Ward 3', 'rabai_ward_3', (SELECT id FROM constituencies WHERE code = 'rabai'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rabai_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rabai Ward 4', 'rabai_ward_4', (SELECT id FROM constituencies WHERE code = 'rabai'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rabai_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rabai Ward 5', 'rabai_ward_5', (SELECT id FROM constituencies WHERE code = 'rabai'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rabai_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi North Ward 1', 'kilifi_north_ward_1', (SELECT id FROM constituencies WHERE code = 'kilifi_north'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi North Ward 2', 'kilifi_north_ward_2', (SELECT id FROM constituencies WHERE code = 'kilifi_north'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi North Ward 3', 'kilifi_north_ward_3', (SELECT id FROM constituencies WHERE code = 'kilifi_north'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi North Ward 4', 'kilifi_north_ward_4', (SELECT id FROM constituencies WHERE code = 'kilifi_north'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi North Ward 5', 'kilifi_north_ward_5', (SELECT id FROM constituencies WHERE code = 'kilifi_north'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi South Ward 1', 'kilifi_south_ward_1', (SELECT id FROM constituencies WHERE code = 'kilifi_south'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi South Ward 2', 'kilifi_south_ward_2', (SELECT id FROM constituencies WHERE code = 'kilifi_south'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi South Ward 3', 'kilifi_south_ward_3', (SELECT id FROM constituencies WHERE code = 'kilifi_south'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi South Ward 4', 'kilifi_south_ward_4', (SELECT id FROM constituencies WHERE code = 'kilifi_south'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilifi South Ward 5', 'kilifi_south_ward_5', (SELECT id FROM constituencies WHERE code = 'kilifi_south'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilifi_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ganze Ward 1', 'ganze_ward_1', (SELECT id FROM constituencies WHERE code = 'ganze'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ganze_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ganze Ward 2', 'ganze_ward_2', (SELECT id FROM constituencies WHERE code = 'ganze'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ganze_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ganze Ward 3', 'ganze_ward_3', (SELECT id FROM constituencies WHERE code = 'ganze'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ganze_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ganze Ward 4', 'ganze_ward_4', (SELECT id FROM constituencies WHERE code = 'ganze'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ganze_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ganze Ward 5', 'ganze_ward_5', (SELECT id FROM constituencies WHERE code = 'ganze'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ganze_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malindi Ward 1', 'malindi_ward_1', (SELECT id FROM constituencies WHERE code = 'malindi'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malindi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malindi Ward 2', 'malindi_ward_2', (SELECT id FROM constituencies WHERE code = 'malindi'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malindi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malindi Ward 3', 'malindi_ward_3', (SELECT id FROM constituencies WHERE code = 'malindi'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malindi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malindi Ward 4', 'malindi_ward_4', (SELECT id FROM constituencies WHERE code = 'malindi'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malindi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malindi Ward 5', 'malindi_ward_5', (SELECT id FROM constituencies WHERE code = 'malindi'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malindi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Magarini Ward 1', 'magarini_ward_1', (SELECT id FROM constituencies WHERE code = 'magarini'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'magarini_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Magarini Ward 2', 'magarini_ward_2', (SELECT id FROM constituencies WHERE code = 'magarini'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'magarini_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Magarini Ward 3', 'magarini_ward_3', (SELECT id FROM constituencies WHERE code = 'magarini'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'magarini_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Magarini Ward 4', 'magarini_ward_4', (SELECT id FROM constituencies WHERE code = 'magarini'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'magarini_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Magarini Ward 5', 'magarini_ward_5', (SELECT id FROM constituencies WHERE code = 'magarini'), (SELECT id FROM counties WHERE code = 'kilifi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'magarini_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Galole Ward 1', 'galole_ward_1', (SELECT id FROM constituencies WHERE code = 'galole'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'galole_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Galole Ward 2', 'galole_ward_2', (SELECT id FROM constituencies WHERE code = 'galole'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'galole_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Galole Ward 3', 'galole_ward_3', (SELECT id FROM constituencies WHERE code = 'galole'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'galole_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Galole Ward 4', 'galole_ward_4', (SELECT id FROM constituencies WHERE code = 'galole'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'galole_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Galole Ward 5', 'galole_ward_5', (SELECT id FROM constituencies WHERE code = 'galole'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'galole_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garsen Ward 1', 'garsen_ward_1', (SELECT id FROM constituencies WHERE code = 'garsen'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garsen_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garsen Ward 2', 'garsen_ward_2', (SELECT id FROM constituencies WHERE code = 'garsen'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garsen_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garsen Ward 3', 'garsen_ward_3', (SELECT id FROM constituencies WHERE code = 'garsen'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garsen_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garsen Ward 4', 'garsen_ward_4', (SELECT id FROM constituencies WHERE code = 'garsen'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garsen_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garsen Ward 5', 'garsen_ward_5', (SELECT id FROM constituencies WHERE code = 'garsen'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garsen_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bura Ward 1', 'bura_ward_1', (SELECT id FROM constituencies WHERE code = 'bura'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bura_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bura Ward 2', 'bura_ward_2', (SELECT id FROM constituencies WHERE code = 'bura'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bura_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bura Ward 3', 'bura_ward_3', (SELECT id FROM constituencies WHERE code = 'bura'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bura_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bura Ward 4', 'bura_ward_4', (SELECT id FROM constituencies WHERE code = 'bura'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bura_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bura Ward 5', 'bura_ward_5', (SELECT id FROM constituencies WHERE code = 'bura'), (SELECT id FROM counties WHERE code = 'tana_river_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bura_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu East Ward 1', 'lamu_east_ward_1', (SELECT id FROM constituencies WHERE code = 'lamu_east'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu East Ward 2', 'lamu_east_ward_2', (SELECT id FROM constituencies WHERE code = 'lamu_east'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu East Ward 3', 'lamu_east_ward_3', (SELECT id FROM constituencies WHERE code = 'lamu_east'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu East Ward 4', 'lamu_east_ward_4', (SELECT id FROM constituencies WHERE code = 'lamu_east'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu East Ward 5', 'lamu_east_ward_5', (SELECT id FROM constituencies WHERE code = 'lamu_east'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu West Ward 1', 'lamu_west_ward_1', (SELECT id FROM constituencies WHERE code = 'lamu_west'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu West Ward 2', 'lamu_west_ward_2', (SELECT id FROM constituencies WHERE code = 'lamu_west'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu West Ward 3', 'lamu_west_ward_3', (SELECT id FROM constituencies WHERE code = 'lamu_west'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu West Ward 4', 'lamu_west_ward_4', (SELECT id FROM constituencies WHERE code = 'lamu_west'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lamu West Ward 5', 'lamu_west_ward_5', (SELECT id FROM constituencies WHERE code = 'lamu_west'), (SELECT id FROM counties WHERE code = 'lamu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lamu_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Voi Ward 1', 'voi_ward_1', (SELECT id FROM constituencies WHERE code = 'voi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'voi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Voi Ward 2', 'voi_ward_2', (SELECT id FROM constituencies WHERE code = 'voi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'voi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Voi Ward 3', 'voi_ward_3', (SELECT id FROM constituencies WHERE code = 'voi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'voi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Voi Ward 4', 'voi_ward_4', (SELECT id FROM constituencies WHERE code = 'voi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'voi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Voi Ward 5', 'voi_ward_5', (SELECT id FROM constituencies WHERE code = 'voi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'voi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Taveta Ward 1', 'taveta_ward_1', (SELECT id FROM constituencies WHERE code = 'taveta'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'taveta_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Taveta Ward 2', 'taveta_ward_2', (SELECT id FROM constituencies WHERE code = 'taveta'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'taveta_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Taveta Ward 3', 'taveta_ward_3', (SELECT id FROM constituencies WHERE code = 'taveta'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'taveta_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Taveta Ward 4', 'taveta_ward_4', (SELECT id FROM constituencies WHERE code = 'taveta'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'taveta_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Taveta Ward 5', 'taveta_ward_5', (SELECT id FROM constituencies WHERE code = 'taveta'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'taveta_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wundanyi Ward 1', 'wundanyi_ward_1', (SELECT id FROM constituencies WHERE code = 'wundanyi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wundanyi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wundanyi Ward 2', 'wundanyi_ward_2', (SELECT id FROM constituencies WHERE code = 'wundanyi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wundanyi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wundanyi Ward 3', 'wundanyi_ward_3', (SELECT id FROM constituencies WHERE code = 'wundanyi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wundanyi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wundanyi Ward 4', 'wundanyi_ward_4', (SELECT id FROM constituencies WHERE code = 'wundanyi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wundanyi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wundanyi Ward 5', 'wundanyi_ward_5', (SELECT id FROM constituencies WHERE code = 'wundanyi'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wundanyi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwatate Ward 1', 'mwatate_ward_1', (SELECT id FROM constituencies WHERE code = 'mwatate'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwatate_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwatate Ward 2', 'mwatate_ward_2', (SELECT id FROM constituencies WHERE code = 'mwatate'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwatate_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwatate Ward 3', 'mwatate_ward_3', (SELECT id FROM constituencies WHERE code = 'mwatate'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwatate_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwatate Ward 4', 'mwatate_ward_4', (SELECT id FROM constituencies WHERE code = 'mwatate'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwatate_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwatate Ward 5', 'mwatate_ward_5', (SELECT id FROM constituencies WHERE code = 'mwatate'), (SELECT id FROM counties WHERE code = 'taita_taveta_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwatate_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garissa Township Ward 1', 'garissa_township_ward_1', (SELECT id FROM constituencies WHERE code = 'garissa_township'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garissa_township_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garissa Township Ward 2', 'garissa_township_ward_2', (SELECT id FROM constituencies WHERE code = 'garissa_township'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garissa_township_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garissa Township Ward 3', 'garissa_township_ward_3', (SELECT id FROM constituencies WHERE code = 'garissa_township'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garissa_township_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garissa Township Ward 4', 'garissa_township_ward_4', (SELECT id FROM constituencies WHERE code = 'garissa_township'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garissa_township_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Garissa Township Ward 5', 'garissa_township_ward_5', (SELECT id FROM constituencies WHERE code = 'garissa_township'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'garissa_township_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Balambala Ward 1', 'balambala_ward_1', (SELECT id FROM constituencies WHERE code = 'balambala'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'balambala_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Balambala Ward 2', 'balambala_ward_2', (SELECT id FROM constituencies WHERE code = 'balambala'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'balambala_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Balambala Ward 3', 'balambala_ward_3', (SELECT id FROM constituencies WHERE code = 'balambala'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'balambala_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Balambala Ward 4', 'balambala_ward_4', (SELECT id FROM constituencies WHERE code = 'balambala'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'balambala_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Balambala Ward 5', 'balambala_ward_5', (SELECT id FROM constituencies WHERE code = 'balambala'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'balambala_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lagdera Ward 1', 'lagdera_ward_1', (SELECT id FROM constituencies WHERE code = 'lagdera'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lagdera_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lagdera Ward 2', 'lagdera_ward_2', (SELECT id FROM constituencies WHERE code = 'lagdera'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lagdera_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lagdera Ward 3', 'lagdera_ward_3', (SELECT id FROM constituencies WHERE code = 'lagdera'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lagdera_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lagdera Ward 4', 'lagdera_ward_4', (SELECT id FROM constituencies WHERE code = 'lagdera'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lagdera_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lagdera Ward 5', 'lagdera_ward_5', (SELECT id FROM constituencies WHERE code = 'lagdera'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lagdera_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dadaab Ward 1', 'dadaab_ward_1', (SELECT id FROM constituencies WHERE code = 'dadaab'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dadaab_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dadaab Ward 2', 'dadaab_ward_2', (SELECT id FROM constituencies WHERE code = 'dadaab'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dadaab_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dadaab Ward 3', 'dadaab_ward_3', (SELECT id FROM constituencies WHERE code = 'dadaab'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dadaab_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dadaab Ward 4', 'dadaab_ward_4', (SELECT id FROM constituencies WHERE code = 'dadaab'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dadaab_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dadaab Ward 5', 'dadaab_ward_5', (SELECT id FROM constituencies WHERE code = 'dadaab'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dadaab_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Fafi Ward 1', 'fafi_ward_1', (SELECT id FROM constituencies WHERE code = 'fafi'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'fafi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Fafi Ward 2', 'fafi_ward_2', (SELECT id FROM constituencies WHERE code = 'fafi'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'fafi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Fafi Ward 3', 'fafi_ward_3', (SELECT id FROM constituencies WHERE code = 'fafi'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'fafi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Fafi Ward 4', 'fafi_ward_4', (SELECT id FROM constituencies WHERE code = 'fafi'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'fafi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Fafi Ward 5', 'fafi_ward_5', (SELECT id FROM constituencies WHERE code = 'fafi'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'fafi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ijara Ward 1', 'ijara_ward_1', (SELECT id FROM constituencies WHERE code = 'ijara'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ijara_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ijara Ward 2', 'ijara_ward_2', (SELECT id FROM constituencies WHERE code = 'ijara'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ijara_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ijara Ward 3', 'ijara_ward_3', (SELECT id FROM constituencies WHERE code = 'ijara'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ijara_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ijara Ward 4', 'ijara_ward_4', (SELECT id FROM constituencies WHERE code = 'ijara'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ijara_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ijara Ward 5', 'ijara_ward_5', (SELECT id FROM constituencies WHERE code = 'ijara'), (SELECT id FROM counties WHERE code = 'garissa_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ijara_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir North Ward 1', 'wajir_north_ward_1', (SELECT id FROM constituencies WHERE code = 'wajir_north'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir North Ward 2', 'wajir_north_ward_2', (SELECT id FROM constituencies WHERE code = 'wajir_north'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir North Ward 3', 'wajir_north_ward_3', (SELECT id FROM constituencies WHERE code = 'wajir_north'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir North Ward 4', 'wajir_north_ward_4', (SELECT id FROM constituencies WHERE code = 'wajir_north'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir North Ward 5', 'wajir_north_ward_5', (SELECT id FROM constituencies WHERE code = 'wajir_north'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir East Ward 1', 'wajir_east_ward_1', (SELECT id FROM constituencies WHERE code = 'wajir_east'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir East Ward 2', 'wajir_east_ward_2', (SELECT id FROM constituencies WHERE code = 'wajir_east'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir East Ward 3', 'wajir_east_ward_3', (SELECT id FROM constituencies WHERE code = 'wajir_east'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir East Ward 4', 'wajir_east_ward_4', (SELECT id FROM constituencies WHERE code = 'wajir_east'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir East Ward 5', 'wajir_east_ward_5', (SELECT id FROM constituencies WHERE code = 'wajir_east'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tarbaj Ward 1', 'tarbaj_ward_1', (SELECT id FROM constituencies WHERE code = 'tarbaj'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tarbaj_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tarbaj Ward 2', 'tarbaj_ward_2', (SELECT id FROM constituencies WHERE code = 'tarbaj'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tarbaj_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tarbaj Ward 3', 'tarbaj_ward_3', (SELECT id FROM constituencies WHERE code = 'tarbaj'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tarbaj_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tarbaj Ward 4', 'tarbaj_ward_4', (SELECT id FROM constituencies WHERE code = 'tarbaj'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tarbaj_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tarbaj Ward 5', 'tarbaj_ward_5', (SELECT id FROM constituencies WHERE code = 'tarbaj'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tarbaj_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir West Ward 1', 'wajir_west_ward_1', (SELECT id FROM constituencies WHERE code = 'wajir_west'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir West Ward 2', 'wajir_west_ward_2', (SELECT id FROM constituencies WHERE code = 'wajir_west'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir West Ward 3', 'wajir_west_ward_3', (SELECT id FROM constituencies WHERE code = 'wajir_west'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir West Ward 4', 'wajir_west_ward_4', (SELECT id FROM constituencies WHERE code = 'wajir_west'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir West Ward 5', 'wajir_west_ward_5', (SELECT id FROM constituencies WHERE code = 'wajir_west'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldas Ward 1', 'eldas_ward_1', (SELECT id FROM constituencies WHERE code = 'eldas'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldas_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldas Ward 2', 'eldas_ward_2', (SELECT id FROM constituencies WHERE code = 'eldas'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldas_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldas Ward 3', 'eldas_ward_3', (SELECT id FROM constituencies WHERE code = 'eldas'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldas_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldas Ward 4', 'eldas_ward_4', (SELECT id FROM constituencies WHERE code = 'eldas'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldas_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldas Ward 5', 'eldas_ward_5', (SELECT id FROM constituencies WHERE code = 'eldas'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldas_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir South Ward 1', 'wajir_south_ward_1', (SELECT id FROM constituencies WHERE code = 'wajir_south'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir South Ward 2', 'wajir_south_ward_2', (SELECT id FROM constituencies WHERE code = 'wajir_south'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir South Ward 3', 'wajir_south_ward_3', (SELECT id FROM constituencies WHERE code = 'wajir_south'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir South Ward 4', 'wajir_south_ward_4', (SELECT id FROM constituencies WHERE code = 'wajir_south'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Wajir South Ward 5', 'wajir_south_ward_5', (SELECT id FROM constituencies WHERE code = 'wajir_south'), (SELECT id FROM counties WHERE code = 'wajir_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'wajir_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera West Ward 1', 'mandera_west_ward_1', (SELECT id FROM constituencies WHERE code = 'mandera_west'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera West Ward 2', 'mandera_west_ward_2', (SELECT id FROM constituencies WHERE code = 'mandera_west'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera West Ward 3', 'mandera_west_ward_3', (SELECT id FROM constituencies WHERE code = 'mandera_west'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera West Ward 4', 'mandera_west_ward_4', (SELECT id FROM constituencies WHERE code = 'mandera_west'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera West Ward 5', 'mandera_west_ward_5', (SELECT id FROM constituencies WHERE code = 'mandera_west'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Banissa Ward 1', 'banissa_ward_1', (SELECT id FROM constituencies WHERE code = 'banissa'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'banissa_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Banissa Ward 2', 'banissa_ward_2', (SELECT id FROM constituencies WHERE code = 'banissa'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'banissa_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Banissa Ward 3', 'banissa_ward_3', (SELECT id FROM constituencies WHERE code = 'banissa'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'banissa_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Banissa Ward 4', 'banissa_ward_4', (SELECT id FROM constituencies WHERE code = 'banissa'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'banissa_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Banissa Ward 5', 'banissa_ward_5', (SELECT id FROM constituencies WHERE code = 'banissa'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'banissa_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera North Ward 1', 'mandera_north_ward_1', (SELECT id FROM constituencies WHERE code = 'mandera_north'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera North Ward 2', 'mandera_north_ward_2', (SELECT id FROM constituencies WHERE code = 'mandera_north'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera North Ward 3', 'mandera_north_ward_3', (SELECT id FROM constituencies WHERE code = 'mandera_north'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera North Ward 4', 'mandera_north_ward_4', (SELECT id FROM constituencies WHERE code = 'mandera_north'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera North Ward 5', 'mandera_north_ward_5', (SELECT id FROM constituencies WHERE code = 'mandera_north'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera South Ward 1', 'mandera_south_ward_1', (SELECT id FROM constituencies WHERE code = 'mandera_south'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera South Ward 2', 'mandera_south_ward_2', (SELECT id FROM constituencies WHERE code = 'mandera_south'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera South Ward 3', 'mandera_south_ward_3', (SELECT id FROM constituencies WHERE code = 'mandera_south'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera South Ward 4', 'mandera_south_ward_4', (SELECT id FROM constituencies WHERE code = 'mandera_south'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera South Ward 5', 'mandera_south_ward_5', (SELECT id FROM constituencies WHERE code = 'mandera_south'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera East Ward 1', 'mandera_east_ward_1', (SELECT id FROM constituencies WHERE code = 'mandera_east'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera East Ward 2', 'mandera_east_ward_2', (SELECT id FROM constituencies WHERE code = 'mandera_east'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera East Ward 3', 'mandera_east_ward_3', (SELECT id FROM constituencies WHERE code = 'mandera_east'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera East Ward 4', 'mandera_east_ward_4', (SELECT id FROM constituencies WHERE code = 'mandera_east'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mandera East Ward 5', 'mandera_east_ward_5', (SELECT id FROM constituencies WHERE code = 'mandera_east'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mandera_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lafey Ward 1', 'lafey_ward_1', (SELECT id FROM constituencies WHERE code = 'lafey'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lafey_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lafey Ward 2', 'lafey_ward_2', (SELECT id FROM constituencies WHERE code = 'lafey'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lafey_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lafey Ward 3', 'lafey_ward_3', (SELECT id FROM constituencies WHERE code = 'lafey'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lafey_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lafey Ward 4', 'lafey_ward_4', (SELECT id FROM constituencies WHERE code = 'lafey'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lafey_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lafey Ward 5', 'lafey_ward_5', (SELECT id FROM constituencies WHERE code = 'lafey'), (SELECT id FROM counties WHERE code = 'mandera_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lafey_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moyale Ward 1', 'moyale_ward_1', (SELECT id FROM constituencies WHERE code = 'moyale'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moyale_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moyale Ward 2', 'moyale_ward_2', (SELECT id FROM constituencies WHERE code = 'moyale'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moyale_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moyale Ward 3', 'moyale_ward_3', (SELECT id FROM constituencies WHERE code = 'moyale'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moyale_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moyale Ward 4', 'moyale_ward_4', (SELECT id FROM constituencies WHERE code = 'moyale'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moyale_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moyale Ward 5', 'moyale_ward_5', (SELECT id FROM constituencies WHERE code = 'moyale'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moyale_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Horr Ward 1', 'north_horr_ward_1', (SELECT id FROM constituencies WHERE code = 'north_horr'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_horr_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Horr Ward 2', 'north_horr_ward_2', (SELECT id FROM constituencies WHERE code = 'north_horr'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_horr_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Horr Ward 3', 'north_horr_ward_3', (SELECT id FROM constituencies WHERE code = 'north_horr'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_horr_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Horr Ward 4', 'north_horr_ward_4', (SELECT id FROM constituencies WHERE code = 'north_horr'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_horr_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Horr Ward 5', 'north_horr_ward_5', (SELECT id FROM constituencies WHERE code = 'north_horr'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_horr_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saku Ward 1', 'saku_ward_1', (SELECT id FROM constituencies WHERE code = 'saku'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saku_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saku Ward 2', 'saku_ward_2', (SELECT id FROM constituencies WHERE code = 'saku'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saku_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saku Ward 3', 'saku_ward_3', (SELECT id FROM constituencies WHERE code = 'saku'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saku_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saku Ward 4', 'saku_ward_4', (SELECT id FROM constituencies WHERE code = 'saku'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saku_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saku Ward 5', 'saku_ward_5', (SELECT id FROM constituencies WHERE code = 'saku'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saku_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laisamis Ward 1', 'laisamis_ward_1', (SELECT id FROM constituencies WHERE code = 'laisamis'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laisamis_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laisamis Ward 2', 'laisamis_ward_2', (SELECT id FROM constituencies WHERE code = 'laisamis'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laisamis_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laisamis Ward 3', 'laisamis_ward_3', (SELECT id FROM constituencies WHERE code = 'laisamis'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laisamis_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laisamis Ward 4', 'laisamis_ward_4', (SELECT id FROM constituencies WHERE code = 'laisamis'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laisamis_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laisamis Ward 5', 'laisamis_ward_5', (SELECT id FROM constituencies WHERE code = 'laisamis'), (SELECT id FROM counties WHERE code = 'marsabit_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laisamis_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo North Ward 1', 'isiolo_north_ward_1', (SELECT id FROM constituencies WHERE code = 'isiolo_north'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo North Ward 2', 'isiolo_north_ward_2', (SELECT id FROM constituencies WHERE code = 'isiolo_north'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo North Ward 3', 'isiolo_north_ward_3', (SELECT id FROM constituencies WHERE code = 'isiolo_north'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo North Ward 4', 'isiolo_north_ward_4', (SELECT id FROM constituencies WHERE code = 'isiolo_north'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo North Ward 5', 'isiolo_north_ward_5', (SELECT id FROM constituencies WHERE code = 'isiolo_north'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo South Ward 1', 'isiolo_south_ward_1', (SELECT id FROM constituencies WHERE code = 'isiolo_south'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo South Ward 2', 'isiolo_south_ward_2', (SELECT id FROM constituencies WHERE code = 'isiolo_south'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo South Ward 3', 'isiolo_south_ward_3', (SELECT id FROM constituencies WHERE code = 'isiolo_south'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo South Ward 4', 'isiolo_south_ward_4', (SELECT id FROM constituencies WHERE code = 'isiolo_south'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Isiolo South Ward 5', 'isiolo_south_ward_5', (SELECT id FROM constituencies WHERE code = 'isiolo_south'), (SELECT id FROM counties WHERE code = 'isiolo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'isiolo_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe South Ward 1', 'igembe_south_ward_1', (SELECT id FROM constituencies WHERE code = 'igembe_south'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe South Ward 2', 'igembe_south_ward_2', (SELECT id FROM constituencies WHERE code = 'igembe_south'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe South Ward 3', 'igembe_south_ward_3', (SELECT id FROM constituencies WHERE code = 'igembe_south'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe South Ward 4', 'igembe_south_ward_4', (SELECT id FROM constituencies WHERE code = 'igembe_south'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe South Ward 5', 'igembe_south_ward_5', (SELECT id FROM constituencies WHERE code = 'igembe_south'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe Central Ward 1', 'igembe_central_ward_1', (SELECT id FROM constituencies WHERE code = 'igembe_central'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe Central Ward 2', 'igembe_central_ward_2', (SELECT id FROM constituencies WHERE code = 'igembe_central'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe Central Ward 3', 'igembe_central_ward_3', (SELECT id FROM constituencies WHERE code = 'igembe_central'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe Central Ward 4', 'igembe_central_ward_4', (SELECT id FROM constituencies WHERE code = 'igembe_central'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe Central Ward 5', 'igembe_central_ward_5', (SELECT id FROM constituencies WHERE code = 'igembe_central'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe North Ward 1', 'igembe_north_ward_1', (SELECT id FROM constituencies WHERE code = 'igembe_north'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe North Ward 2', 'igembe_north_ward_2', (SELECT id FROM constituencies WHERE code = 'igembe_north'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe North Ward 3', 'igembe_north_ward_3', (SELECT id FROM constituencies WHERE code = 'igembe_north'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe North Ward 4', 'igembe_north_ward_4', (SELECT id FROM constituencies WHERE code = 'igembe_north'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Igembe North Ward 5', 'igembe_north_ward_5', (SELECT id FROM constituencies WHERE code = 'igembe_north'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'igembe_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania West Ward 1', 'tigania_west_ward_1', (SELECT id FROM constituencies WHERE code = 'tigania_west'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania West Ward 2', 'tigania_west_ward_2', (SELECT id FROM constituencies WHERE code = 'tigania_west'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania West Ward 3', 'tigania_west_ward_3', (SELECT id FROM constituencies WHERE code = 'tigania_west'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania West Ward 4', 'tigania_west_ward_4', (SELECT id FROM constituencies WHERE code = 'tigania_west'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania West Ward 5', 'tigania_west_ward_5', (SELECT id FROM constituencies WHERE code = 'tigania_west'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania East Ward 1', 'tigania_east_ward_1', (SELECT id FROM constituencies WHERE code = 'tigania_east'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania East Ward 2', 'tigania_east_ward_2', (SELECT id FROM constituencies WHERE code = 'tigania_east'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania East Ward 3', 'tigania_east_ward_3', (SELECT id FROM constituencies WHERE code = 'tigania_east'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania East Ward 4', 'tigania_east_ward_4', (SELECT id FROM constituencies WHERE code = 'tigania_east'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tigania East Ward 5', 'tigania_east_ward_5', (SELECT id FROM constituencies WHERE code = 'tigania_east'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tigania_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Imenti Ward 1', 'north_imenti_ward_1', (SELECT id FROM constituencies WHERE code = 'north_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_imenti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Imenti Ward 2', 'north_imenti_ward_2', (SELECT id FROM constituencies WHERE code = 'north_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_imenti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Imenti Ward 3', 'north_imenti_ward_3', (SELECT id FROM constituencies WHERE code = 'north_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_imenti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Imenti Ward 4', 'north_imenti_ward_4', (SELECT id FROM constituencies WHERE code = 'north_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_imenti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Imenti Ward 5', 'north_imenti_ward_5', (SELECT id FROM constituencies WHERE code = 'north_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_imenti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Buuri Ward 1', 'buuri_ward_1', (SELECT id FROM constituencies WHERE code = 'buuri'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'buuri_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Buuri Ward 2', 'buuri_ward_2', (SELECT id FROM constituencies WHERE code = 'buuri'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'buuri_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Buuri Ward 3', 'buuri_ward_3', (SELECT id FROM constituencies WHERE code = 'buuri'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'buuri_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Buuri Ward 4', 'buuri_ward_4', (SELECT id FROM constituencies WHERE code = 'buuri'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'buuri_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Buuri Ward 5', 'buuri_ward_5', (SELECT id FROM constituencies WHERE code = 'buuri'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'buuri_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Central Imenti Ward 1', 'central_imenti_ward_1', (SELECT id FROM constituencies WHERE code = 'central_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'central_imenti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Central Imenti Ward 2', 'central_imenti_ward_2', (SELECT id FROM constituencies WHERE code = 'central_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'central_imenti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Central Imenti Ward 3', 'central_imenti_ward_3', (SELECT id FROM constituencies WHERE code = 'central_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'central_imenti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Central Imenti Ward 4', 'central_imenti_ward_4', (SELECT id FROM constituencies WHERE code = 'central_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'central_imenti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Central Imenti Ward 5', 'central_imenti_ward_5', (SELECT id FROM constituencies WHERE code = 'central_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'central_imenti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Imenti Ward 1', 'south_imenti_ward_1', (SELECT id FROM constituencies WHERE code = 'south_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_imenti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Imenti Ward 2', 'south_imenti_ward_2', (SELECT id FROM constituencies WHERE code = 'south_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_imenti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Imenti Ward 3', 'south_imenti_ward_3', (SELECT id FROM constituencies WHERE code = 'south_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_imenti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Imenti Ward 4', 'south_imenti_ward_4', (SELECT id FROM constituencies WHERE code = 'south_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_imenti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Imenti Ward 5', 'south_imenti_ward_5', (SELECT id FROM constituencies WHERE code = 'south_imenti'), (SELECT id FROM counties WHERE code = 'meru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_imenti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maara Ward 1', 'maara_ward_1', (SELECT id FROM constituencies WHERE code = 'maara'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maara_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maara Ward 2', 'maara_ward_2', (SELECT id FROM constituencies WHERE code = 'maara'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maara_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maara Ward 3', 'maara_ward_3', (SELECT id FROM constituencies WHERE code = 'maara'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maara_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maara Ward 4', 'maara_ward_4', (SELECT id FROM constituencies WHERE code = 'maara'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maara_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maara Ward 5', 'maara_ward_5', (SELECT id FROM constituencies WHERE code = 'maara'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maara_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chuka/Igambang''ombe Ward 1', 'chuka_igambang_ombe_ward_1', (SELECT id FROM constituencies WHERE code = 'chuka_igambang_ombe'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chuka_igambang_ombe_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chuka/Igambang''ombe Ward 2', 'chuka_igambang_ombe_ward_2', (SELECT id FROM constituencies WHERE code = 'chuka_igambang_ombe'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chuka_igambang_ombe_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chuka/Igambang''ombe Ward 3', 'chuka_igambang_ombe_ward_3', (SELECT id FROM constituencies WHERE code = 'chuka_igambang_ombe'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chuka_igambang_ombe_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chuka/Igambang''ombe Ward 4', 'chuka_igambang_ombe_ward_4', (SELECT id FROM constituencies WHERE code = 'chuka_igambang_ombe'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chuka_igambang_ombe_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chuka/Igambang''ombe Ward 5', 'chuka_igambang_ombe_ward_5', (SELECT id FROM constituencies WHERE code = 'chuka_igambang_ombe'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chuka_igambang_ombe_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tharaka Ward 1', 'tharaka_ward_1', (SELECT id FROM constituencies WHERE code = 'tharaka'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tharaka_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tharaka Ward 2', 'tharaka_ward_2', (SELECT id FROM constituencies WHERE code = 'tharaka'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tharaka_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tharaka Ward 3', 'tharaka_ward_3', (SELECT id FROM constituencies WHERE code = 'tharaka'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tharaka_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tharaka Ward 4', 'tharaka_ward_4', (SELECT id FROM constituencies WHERE code = 'tharaka'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tharaka_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tharaka Ward 5', 'tharaka_ward_5', (SELECT id FROM constituencies WHERE code = 'tharaka'), (SELECT id FROM counties WHERE code = 'tharaka_nithi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tharaka_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Manyatta Ward 1', 'manyatta_ward_1', (SELECT id FROM constituencies WHERE code = 'manyatta'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'manyatta_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Manyatta Ward 2', 'manyatta_ward_2', (SELECT id FROM constituencies WHERE code = 'manyatta'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'manyatta_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Manyatta Ward 3', 'manyatta_ward_3', (SELECT id FROM constituencies WHERE code = 'manyatta'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'manyatta_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Manyatta Ward 4', 'manyatta_ward_4', (SELECT id FROM constituencies WHERE code = 'manyatta'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'manyatta_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Manyatta Ward 5', 'manyatta_ward_5', (SELECT id FROM constituencies WHERE code = 'manyatta'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'manyatta_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Runyenjes Ward 1', 'runyenjes_ward_1', (SELECT id FROM constituencies WHERE code = 'runyenjes'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'runyenjes_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Runyenjes Ward 2', 'runyenjes_ward_2', (SELECT id FROM constituencies WHERE code = 'runyenjes'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'runyenjes_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Runyenjes Ward 3', 'runyenjes_ward_3', (SELECT id FROM constituencies WHERE code = 'runyenjes'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'runyenjes_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Runyenjes Ward 4', 'runyenjes_ward_4', (SELECT id FROM constituencies WHERE code = 'runyenjes'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'runyenjes_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Runyenjes Ward 5', 'runyenjes_ward_5', (SELECT id FROM constituencies WHERE code = 'runyenjes'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'runyenjes_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere South Ward 1', 'mbeere_south_ward_1', (SELECT id FROM constituencies WHERE code = 'mbeere_south'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere South Ward 2', 'mbeere_south_ward_2', (SELECT id FROM constituencies WHERE code = 'mbeere_south'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere South Ward 3', 'mbeere_south_ward_3', (SELECT id FROM constituencies WHERE code = 'mbeere_south'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere South Ward 4', 'mbeere_south_ward_4', (SELECT id FROM constituencies WHERE code = 'mbeere_south'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere South Ward 5', 'mbeere_south_ward_5', (SELECT id FROM constituencies WHERE code = 'mbeere_south'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere North Ward 1', 'mbeere_north_ward_1', (SELECT id FROM constituencies WHERE code = 'mbeere_north'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere North Ward 2', 'mbeere_north_ward_2', (SELECT id FROM constituencies WHERE code = 'mbeere_north'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere North Ward 3', 'mbeere_north_ward_3', (SELECT id FROM constituencies WHERE code = 'mbeere_north'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere North Ward 4', 'mbeere_north_ward_4', (SELECT id FROM constituencies WHERE code = 'mbeere_north'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbeere North Ward 5', 'mbeere_north_ward_5', (SELECT id FROM constituencies WHERE code = 'mbeere_north'), (SELECT id FROM counties WHERE code = 'embu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbeere_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi North Ward 1', 'mwingi_north_ward_1', (SELECT id FROM constituencies WHERE code = 'mwingi_north'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi North Ward 2', 'mwingi_north_ward_2', (SELECT id FROM constituencies WHERE code = 'mwingi_north'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi North Ward 3', 'mwingi_north_ward_3', (SELECT id FROM constituencies WHERE code = 'mwingi_north'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi North Ward 4', 'mwingi_north_ward_4', (SELECT id FROM constituencies WHERE code = 'mwingi_north'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi North Ward 5', 'mwingi_north_ward_5', (SELECT id FROM constituencies WHERE code = 'mwingi_north'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi West Ward 1', 'mwingi_west_ward_1', (SELECT id FROM constituencies WHERE code = 'mwingi_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi West Ward 2', 'mwingi_west_ward_2', (SELECT id FROM constituencies WHERE code = 'mwingi_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi West Ward 3', 'mwingi_west_ward_3', (SELECT id FROM constituencies WHERE code = 'mwingi_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi West Ward 4', 'mwingi_west_ward_4', (SELECT id FROM constituencies WHERE code = 'mwingi_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi West Ward 5', 'mwingi_west_ward_5', (SELECT id FROM constituencies WHERE code = 'mwingi_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi Central Ward 1', 'mwingi_central_ward_1', (SELECT id FROM constituencies WHERE code = 'mwingi_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi Central Ward 2', 'mwingi_central_ward_2', (SELECT id FROM constituencies WHERE code = 'mwingi_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi Central Ward 3', 'mwingi_central_ward_3', (SELECT id FROM constituencies WHERE code = 'mwingi_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi Central Ward 4', 'mwingi_central_ward_4', (SELECT id FROM constituencies WHERE code = 'mwingi_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwingi Central Ward 5', 'mwingi_central_ward_5', (SELECT id FROM constituencies WHERE code = 'mwingi_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwingi_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui West Ward 1', 'kitui_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kitui_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui West Ward 2', 'kitui_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kitui_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui West Ward 3', 'kitui_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kitui_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui West Ward 4', 'kitui_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kitui_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui West Ward 5', 'kitui_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kitui_west'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Rural Ward 1', 'kitui_rural_ward_1', (SELECT id FROM constituencies WHERE code = 'kitui_rural'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_rural_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Rural Ward 2', 'kitui_rural_ward_2', (SELECT id FROM constituencies WHERE code = 'kitui_rural'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_rural_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Rural Ward 3', 'kitui_rural_ward_3', (SELECT id FROM constituencies WHERE code = 'kitui_rural'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_rural_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Rural Ward 4', 'kitui_rural_ward_4', (SELECT id FROM constituencies WHERE code = 'kitui_rural'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_rural_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Rural Ward 5', 'kitui_rural_ward_5', (SELECT id FROM constituencies WHERE code = 'kitui_rural'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_rural_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Central Ward 1', 'kitui_central_ward_1', (SELECT id FROM constituencies WHERE code = 'kitui_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Central Ward 2', 'kitui_central_ward_2', (SELECT id FROM constituencies WHERE code = 'kitui_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Central Ward 3', 'kitui_central_ward_3', (SELECT id FROM constituencies WHERE code = 'kitui_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Central Ward 4', 'kitui_central_ward_4', (SELECT id FROM constituencies WHERE code = 'kitui_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui Central Ward 5', 'kitui_central_ward_5', (SELECT id FROM constituencies WHERE code = 'kitui_central'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui East Ward 1', 'kitui_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kitui_east'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui East Ward 2', 'kitui_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kitui_east'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui East Ward 3', 'kitui_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kitui_east'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui East Ward 4', 'kitui_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kitui_east'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui East Ward 5', 'kitui_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kitui_east'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui South Ward 1', 'kitui_south_ward_1', (SELECT id FROM constituencies WHERE code = 'kitui_south'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui South Ward 2', 'kitui_south_ward_2', (SELECT id FROM constituencies WHERE code = 'kitui_south'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui South Ward 3', 'kitui_south_ward_3', (SELECT id FROM constituencies WHERE code = 'kitui_south'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui South Ward 4', 'kitui_south_ward_4', (SELECT id FROM constituencies WHERE code = 'kitui_south'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitui South Ward 5', 'kitui_south_ward_5', (SELECT id FROM constituencies WHERE code = 'kitui_south'), (SELECT id FROM counties WHERE code = 'kitui_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitui_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Masinga Ward 1', 'masinga_ward_1', (SELECT id FROM constituencies WHERE code = 'masinga'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'masinga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Masinga Ward 2', 'masinga_ward_2', (SELECT id FROM constituencies WHERE code = 'masinga'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'masinga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Masinga Ward 3', 'masinga_ward_3', (SELECT id FROM constituencies WHERE code = 'masinga'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'masinga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Masinga Ward 4', 'masinga_ward_4', (SELECT id FROM constituencies WHERE code = 'masinga'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'masinga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Masinga Ward 5', 'masinga_ward_5', (SELECT id FROM constituencies WHERE code = 'masinga'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'masinga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Yatta Ward 1', 'yatta_ward_1', (SELECT id FROM constituencies WHERE code = 'yatta'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'yatta_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Yatta Ward 2', 'yatta_ward_2', (SELECT id FROM constituencies WHERE code = 'yatta'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'yatta_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Yatta Ward 3', 'yatta_ward_3', (SELECT id FROM constituencies WHERE code = 'yatta'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'yatta_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Yatta Ward 4', 'yatta_ward_4', (SELECT id FROM constituencies WHERE code = 'yatta'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'yatta_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Yatta Ward 5', 'yatta_ward_5', (SELECT id FROM constituencies WHERE code = 'yatta'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'yatta_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangundo Ward 1', 'kangundo_ward_1', (SELECT id FROM constituencies WHERE code = 'kangundo'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangundo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangundo Ward 2', 'kangundo_ward_2', (SELECT id FROM constituencies WHERE code = 'kangundo'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangundo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangundo Ward 3', 'kangundo_ward_3', (SELECT id FROM constituencies WHERE code = 'kangundo'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangundo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangundo Ward 4', 'kangundo_ward_4', (SELECT id FROM constituencies WHERE code = 'kangundo'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangundo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangundo Ward 5', 'kangundo_ward_5', (SELECT id FROM constituencies WHERE code = 'kangundo'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangundo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungulu Ward 1', 'matungulu_ward_1', (SELECT id FROM constituencies WHERE code = 'matungulu'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungulu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungulu Ward 2', 'matungulu_ward_2', (SELECT id FROM constituencies WHERE code = 'matungulu'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungulu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungulu Ward 3', 'matungulu_ward_3', (SELECT id FROM constituencies WHERE code = 'matungulu'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungulu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungulu Ward 4', 'matungulu_ward_4', (SELECT id FROM constituencies WHERE code = 'matungulu'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungulu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungulu Ward 5', 'matungulu_ward_5', (SELECT id FROM constituencies WHERE code = 'matungulu'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungulu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kathiani Ward 1', 'kathiani_ward_1', (SELECT id FROM constituencies WHERE code = 'kathiani'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kathiani_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kathiani Ward 2', 'kathiani_ward_2', (SELECT id FROM constituencies WHERE code = 'kathiani'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kathiani_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kathiani Ward 3', 'kathiani_ward_3', (SELECT id FROM constituencies WHERE code = 'kathiani'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kathiani_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kathiani Ward 4', 'kathiani_ward_4', (SELECT id FROM constituencies WHERE code = 'kathiani'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kathiani_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kathiani Ward 5', 'kathiani_ward_5', (SELECT id FROM constituencies WHERE code = 'kathiani'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kathiani_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mavoko Ward 1', 'mavoko_ward_1', (SELECT id FROM constituencies WHERE code = 'mavoko'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mavoko_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mavoko Ward 2', 'mavoko_ward_2', (SELECT id FROM constituencies WHERE code = 'mavoko'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mavoko_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mavoko Ward 3', 'mavoko_ward_3', (SELECT id FROM constituencies WHERE code = 'mavoko'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mavoko_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mavoko Ward 4', 'mavoko_ward_4', (SELECT id FROM constituencies WHERE code = 'mavoko'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mavoko_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mavoko Ward 5', 'mavoko_ward_5', (SELECT id FROM constituencies WHERE code = 'mavoko'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mavoko_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Machakos Town Ward 1', 'machakos_town_ward_1', (SELECT id FROM constituencies WHERE code = 'machakos_town'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'machakos_town_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Machakos Town Ward 2', 'machakos_town_ward_2', (SELECT id FROM constituencies WHERE code = 'machakos_town'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'machakos_town_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Machakos Town Ward 3', 'machakos_town_ward_3', (SELECT id FROM constituencies WHERE code = 'machakos_town'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'machakos_town_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Machakos Town Ward 4', 'machakos_town_ward_4', (SELECT id FROM constituencies WHERE code = 'machakos_town'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'machakos_town_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Machakos Town Ward 5', 'machakos_town_ward_5', (SELECT id FROM constituencies WHERE code = 'machakos_town'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'machakos_town_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwala Ward 1', 'mwala_ward_1', (SELECT id FROM constituencies WHERE code = 'mwala'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwala_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwala Ward 2', 'mwala_ward_2', (SELECT id FROM constituencies WHERE code = 'mwala'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwala_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwala Ward 3', 'mwala_ward_3', (SELECT id FROM constituencies WHERE code = 'mwala'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwala_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwala Ward 4', 'mwala_ward_4', (SELECT id FROM constituencies WHERE code = 'mwala'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwala_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwala Ward 5', 'mwala_ward_5', (SELECT id FROM constituencies WHERE code = 'mwala'), (SELECT id FROM counties WHERE code = 'machakos_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwala_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbooni Ward 1', 'mbooni_ward_1', (SELECT id FROM constituencies WHERE code = 'mbooni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbooni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbooni Ward 2', 'mbooni_ward_2', (SELECT id FROM constituencies WHERE code = 'mbooni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbooni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbooni Ward 3', 'mbooni_ward_3', (SELECT id FROM constituencies WHERE code = 'mbooni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbooni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbooni Ward 4', 'mbooni_ward_4', (SELECT id FROM constituencies WHERE code = 'mbooni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbooni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mbooni Ward 5', 'mbooni_ward_5', (SELECT id FROM constituencies WHERE code = 'mbooni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mbooni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilome Ward 1', 'kilome_ward_1', (SELECT id FROM constituencies WHERE code = 'kilome'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilome_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilome Ward 2', 'kilome_ward_2', (SELECT id FROM constituencies WHERE code = 'kilome'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilome_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilome Ward 3', 'kilome_ward_3', (SELECT id FROM constituencies WHERE code = 'kilome'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilome_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilome Ward 4', 'kilome_ward_4', (SELECT id FROM constituencies WHERE code = 'kilome'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilome_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilome Ward 5', 'kilome_ward_5', (SELECT id FROM constituencies WHERE code = 'kilome'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilome_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaiti Ward 1', 'kaiti_ward_1', (SELECT id FROM constituencies WHERE code = 'kaiti'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaiti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaiti Ward 2', 'kaiti_ward_2', (SELECT id FROM constituencies WHERE code = 'kaiti'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaiti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaiti Ward 3', 'kaiti_ward_3', (SELECT id FROM constituencies WHERE code = 'kaiti'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaiti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaiti Ward 4', 'kaiti_ward_4', (SELECT id FROM constituencies WHERE code = 'kaiti'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaiti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kaiti Ward 5', 'kaiti_ward_5', (SELECT id FROM constituencies WHERE code = 'kaiti'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kaiti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makueni Ward 1', 'makueni_ward_1', (SELECT id FROM constituencies WHERE code = 'makueni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makueni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makueni Ward 2', 'makueni_ward_2', (SELECT id FROM constituencies WHERE code = 'makueni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makueni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makueni Ward 3', 'makueni_ward_3', (SELECT id FROM constituencies WHERE code = 'makueni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makueni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makueni Ward 4', 'makueni_ward_4', (SELECT id FROM constituencies WHERE code = 'makueni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makueni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makueni Ward 5', 'makueni_ward_5', (SELECT id FROM constituencies WHERE code = 'makueni'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makueni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi West Ward 1', 'kibwezi_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kibwezi_west'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi West Ward 2', 'kibwezi_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kibwezi_west'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi West Ward 3', 'kibwezi_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kibwezi_west'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi West Ward 4', 'kibwezi_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kibwezi_west'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi West Ward 5', 'kibwezi_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kibwezi_west'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi East Ward 1', 'kibwezi_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kibwezi_east'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi East Ward 2', 'kibwezi_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kibwezi_east'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi East Ward 3', 'kibwezi_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kibwezi_east'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi East Ward 4', 'kibwezi_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kibwezi_east'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibwezi East Ward 5', 'kibwezi_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kibwezi_east'), (SELECT id FROM counties WHERE code = 'makueni_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibwezi_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinangop Ward 1', 'kinangop_ward_1', (SELECT id FROM constituencies WHERE code = 'kinangop'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinangop_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinangop Ward 2', 'kinangop_ward_2', (SELECT id FROM constituencies WHERE code = 'kinangop'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinangop_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinangop Ward 3', 'kinangop_ward_3', (SELECT id FROM constituencies WHERE code = 'kinangop'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinangop_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinangop Ward 4', 'kinangop_ward_4', (SELECT id FROM constituencies WHERE code = 'kinangop'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinangop_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kinangop Ward 5', 'kinangop_ward_5', (SELECT id FROM constituencies WHERE code = 'kinangop'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kinangop_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipipiri Ward 1', 'kipipiri_ward_1', (SELECT id FROM constituencies WHERE code = 'kipipiri'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipipiri_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipipiri Ward 2', 'kipipiri_ward_2', (SELECT id FROM constituencies WHERE code = 'kipipiri'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipipiri_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipipiri Ward 3', 'kipipiri_ward_3', (SELECT id FROM constituencies WHERE code = 'kipipiri'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipipiri_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipipiri Ward 4', 'kipipiri_ward_4', (SELECT id FROM constituencies WHERE code = 'kipipiri'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipipiri_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipipiri Ward 5', 'kipipiri_ward_5', (SELECT id FROM constituencies WHERE code = 'kipipiri'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipipiri_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Kalou Ward 1', 'ol_kalou_ward_1', (SELECT id FROM constituencies WHERE code = 'ol_kalou'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_kalou_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Kalou Ward 2', 'ol_kalou_ward_2', (SELECT id FROM constituencies WHERE code = 'ol_kalou'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_kalou_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Kalou Ward 3', 'ol_kalou_ward_3', (SELECT id FROM constituencies WHERE code = 'ol_kalou'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_kalou_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Kalou Ward 4', 'ol_kalou_ward_4', (SELECT id FROM constituencies WHERE code = 'ol_kalou'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_kalou_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Kalou Ward 5', 'ol_kalou_ward_5', (SELECT id FROM constituencies WHERE code = 'ol_kalou'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_kalou_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Jorok Ward 1', 'ol_jorok_ward_1', (SELECT id FROM constituencies WHERE code = 'ol_jorok'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_jorok_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Jorok Ward 2', 'ol_jorok_ward_2', (SELECT id FROM constituencies WHERE code = 'ol_jorok'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_jorok_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Jorok Ward 3', 'ol_jorok_ward_3', (SELECT id FROM constituencies WHERE code = 'ol_jorok'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_jorok_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Jorok Ward 4', 'ol_jorok_ward_4', (SELECT id FROM constituencies WHERE code = 'ol_jorok'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_jorok_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ol Jorok Ward 5', 'ol_jorok_ward_5', (SELECT id FROM constituencies WHERE code = 'ol_jorok'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ol_jorok_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndaragwa Ward 1', 'ndaragwa_ward_1', (SELECT id FROM constituencies WHERE code = 'ndaragwa'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndaragwa_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndaragwa Ward 2', 'ndaragwa_ward_2', (SELECT id FROM constituencies WHERE code = 'ndaragwa'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndaragwa_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndaragwa Ward 3', 'ndaragwa_ward_3', (SELECT id FROM constituencies WHERE code = 'ndaragwa'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndaragwa_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndaragwa Ward 4', 'ndaragwa_ward_4', (SELECT id FROM constituencies WHERE code = 'ndaragwa'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndaragwa_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndaragwa Ward 5', 'ndaragwa_ward_5', (SELECT id FROM constituencies WHERE code = 'ndaragwa'), (SELECT id FROM counties WHERE code = 'nyandarua_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndaragwa_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tetu Ward 1', 'tetu_ward_1', (SELECT id FROM constituencies WHERE code = 'tetu'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tetu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tetu Ward 2', 'tetu_ward_2', (SELECT id FROM constituencies WHERE code = 'tetu'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tetu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tetu Ward 3', 'tetu_ward_3', (SELECT id FROM constituencies WHERE code = 'tetu'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tetu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tetu Ward 4', 'tetu_ward_4', (SELECT id FROM constituencies WHERE code = 'tetu'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tetu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tetu Ward 5', 'tetu_ward_5', (SELECT id FROM constituencies WHERE code = 'tetu'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tetu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kieni Ward 1', 'kieni_ward_1', (SELECT id FROM constituencies WHERE code = 'kieni'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kieni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kieni Ward 2', 'kieni_ward_2', (SELECT id FROM constituencies WHERE code = 'kieni'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kieni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kieni Ward 3', 'kieni_ward_3', (SELECT id FROM constituencies WHERE code = 'kieni'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kieni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kieni Ward 4', 'kieni_ward_4', (SELECT id FROM constituencies WHERE code = 'kieni'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kieni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kieni Ward 5', 'kieni_ward_5', (SELECT id FROM constituencies WHERE code = 'kieni'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kieni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathira Ward 1', 'mathira_ward_1', (SELECT id FROM constituencies WHERE code = 'mathira'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathira_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathira Ward 2', 'mathira_ward_2', (SELECT id FROM constituencies WHERE code = 'mathira'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathira_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathira Ward 3', 'mathira_ward_3', (SELECT id FROM constituencies WHERE code = 'mathira'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathira_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathira Ward 4', 'mathira_ward_4', (SELECT id FROM constituencies WHERE code = 'mathira'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathira_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathira Ward 5', 'mathira_ward_5', (SELECT id FROM constituencies WHERE code = 'mathira'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathira_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Othaya Ward 1', 'othaya_ward_1', (SELECT id FROM constituencies WHERE code = 'othaya'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'othaya_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Othaya Ward 2', 'othaya_ward_2', (SELECT id FROM constituencies WHERE code = 'othaya'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'othaya_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Othaya Ward 3', 'othaya_ward_3', (SELECT id FROM constituencies WHERE code = 'othaya'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'othaya_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Othaya Ward 4', 'othaya_ward_4', (SELECT id FROM constituencies WHERE code = 'othaya'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'othaya_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Othaya Ward 5', 'othaya_ward_5', (SELECT id FROM constituencies WHERE code = 'othaya'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'othaya_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mukurweini Ward 1', 'mukurweini_ward_1', (SELECT id FROM constituencies WHERE code = 'mukurweini'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mukurweini_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mukurweini Ward 2', 'mukurweini_ward_2', (SELECT id FROM constituencies WHERE code = 'mukurweini'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mukurweini_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mukurweini Ward 3', 'mukurweini_ward_3', (SELECT id FROM constituencies WHERE code = 'mukurweini'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mukurweini_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mukurweini Ward 4', 'mukurweini_ward_4', (SELECT id FROM constituencies WHERE code = 'mukurweini'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mukurweini_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mukurweini Ward 5', 'mukurweini_ward_5', (SELECT id FROM constituencies WHERE code = 'mukurweini'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mukurweini_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyeri Town Ward 1', 'nyeri_town_ward_1', (SELECT id FROM constituencies WHERE code = 'nyeri_town'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyeri_town_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyeri Town Ward 2', 'nyeri_town_ward_2', (SELECT id FROM constituencies WHERE code = 'nyeri_town'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyeri_town_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyeri Town Ward 3', 'nyeri_town_ward_3', (SELECT id FROM constituencies WHERE code = 'nyeri_town'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyeri_town_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyeri Town Ward 4', 'nyeri_town_ward_4', (SELECT id FROM constituencies WHERE code = 'nyeri_town'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyeri_town_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyeri Town Ward 5', 'nyeri_town_ward_5', (SELECT id FROM constituencies WHERE code = 'nyeri_town'), (SELECT id FROM counties WHERE code = 'nyeri_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyeri_town_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwea Ward 1', 'mwea_ward_1', (SELECT id FROM constituencies WHERE code = 'mwea'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwea_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwea Ward 2', 'mwea_ward_2', (SELECT id FROM constituencies WHERE code = 'mwea'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwea_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwea Ward 3', 'mwea_ward_3', (SELECT id FROM constituencies WHERE code = 'mwea'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwea_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwea Ward 4', 'mwea_ward_4', (SELECT id FROM constituencies WHERE code = 'mwea'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwea_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mwea Ward 5', 'mwea_ward_5', (SELECT id FROM constituencies WHERE code = 'mwea'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mwea_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gichugu Ward 1', 'gichugu_ward_1', (SELECT id FROM constituencies WHERE code = 'gichugu'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gichugu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gichugu Ward 2', 'gichugu_ward_2', (SELECT id FROM constituencies WHERE code = 'gichugu'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gichugu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gichugu Ward 3', 'gichugu_ward_3', (SELECT id FROM constituencies WHERE code = 'gichugu'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gichugu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gichugu Ward 4', 'gichugu_ward_4', (SELECT id FROM constituencies WHERE code = 'gichugu'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gichugu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gichugu Ward 5', 'gichugu_ward_5', (SELECT id FROM constituencies WHERE code = 'gichugu'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gichugu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndia Ward 1', 'ndia_ward_1', (SELECT id FROM constituencies WHERE code = 'ndia'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndia_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndia Ward 2', 'ndia_ward_2', (SELECT id FROM constituencies WHERE code = 'ndia'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndia_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndia Ward 3', 'ndia_ward_3', (SELECT id FROM constituencies WHERE code = 'ndia'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndia_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndia Ward 4', 'ndia_ward_4', (SELECT id FROM constituencies WHERE code = 'ndia'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndia_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndia Ward 5', 'ndia_ward_5', (SELECT id FROM constituencies WHERE code = 'ndia'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndia_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kirinyaga Central Ward 1', 'kirinyaga_central_ward_1', (SELECT id FROM constituencies WHERE code = 'kirinyaga_central'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kirinyaga_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kirinyaga Central Ward 2', 'kirinyaga_central_ward_2', (SELECT id FROM constituencies WHERE code = 'kirinyaga_central'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kirinyaga_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kirinyaga Central Ward 3', 'kirinyaga_central_ward_3', (SELECT id FROM constituencies WHERE code = 'kirinyaga_central'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kirinyaga_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kirinyaga Central Ward 4', 'kirinyaga_central_ward_4', (SELECT id FROM constituencies WHERE code = 'kirinyaga_central'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kirinyaga_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kirinyaga Central Ward 5', 'kirinyaga_central_ward_5', (SELECT id FROM constituencies WHERE code = 'kirinyaga_central'), (SELECT id FROM counties WHERE code = 'kirinyaga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kirinyaga_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangema Ward 1', 'kangema_ward_1', (SELECT id FROM constituencies WHERE code = 'kangema'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangema_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangema Ward 2', 'kangema_ward_2', (SELECT id FROM constituencies WHERE code = 'kangema'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangema_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangema Ward 3', 'kangema_ward_3', (SELECT id FROM constituencies WHERE code = 'kangema'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangema_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangema Ward 4', 'kangema_ward_4', (SELECT id FROM constituencies WHERE code = 'kangema'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangema_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kangema Ward 5', 'kangema_ward_5', (SELECT id FROM constituencies WHERE code = 'kangema'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kangema_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathioya Ward 1', 'mathioya_ward_1', (SELECT id FROM constituencies WHERE code = 'mathioya'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathioya_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathioya Ward 2', 'mathioya_ward_2', (SELECT id FROM constituencies WHERE code = 'mathioya'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathioya_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathioya Ward 3', 'mathioya_ward_3', (SELECT id FROM constituencies WHERE code = 'mathioya'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathioya_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathioya Ward 4', 'mathioya_ward_4', (SELECT id FROM constituencies WHERE code = 'mathioya'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathioya_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mathioya Ward 5', 'mathioya_ward_5', (SELECT id FROM constituencies WHERE code = 'mathioya'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mathioya_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiharu Ward 1', 'kiharu_ward_1', (SELECT id FROM constituencies WHERE code = 'kiharu'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiharu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiharu Ward 2', 'kiharu_ward_2', (SELECT id FROM constituencies WHERE code = 'kiharu'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiharu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiharu Ward 3', 'kiharu_ward_3', (SELECT id FROM constituencies WHERE code = 'kiharu'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiharu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiharu Ward 4', 'kiharu_ward_4', (SELECT id FROM constituencies WHERE code = 'kiharu'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiharu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiharu Ward 5', 'kiharu_ward_5', (SELECT id FROM constituencies WHERE code = 'kiharu'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiharu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kigumo Ward 1', 'kigumo_ward_1', (SELECT id FROM constituencies WHERE code = 'kigumo'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kigumo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kigumo Ward 2', 'kigumo_ward_2', (SELECT id FROM constituencies WHERE code = 'kigumo'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kigumo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kigumo Ward 3', 'kigumo_ward_3', (SELECT id FROM constituencies WHERE code = 'kigumo'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kigumo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kigumo Ward 4', 'kigumo_ward_4', (SELECT id FROM constituencies WHERE code = 'kigumo'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kigumo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kigumo Ward 5', 'kigumo_ward_5', (SELECT id FROM constituencies WHERE code = 'kigumo'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kigumo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maragwa Ward 1', 'maragwa_ward_1', (SELECT id FROM constituencies WHERE code = 'maragwa'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maragwa_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maragwa Ward 2', 'maragwa_ward_2', (SELECT id FROM constituencies WHERE code = 'maragwa'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maragwa_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maragwa Ward 3', 'maragwa_ward_3', (SELECT id FROM constituencies WHERE code = 'maragwa'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maragwa_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maragwa Ward 4', 'maragwa_ward_4', (SELECT id FROM constituencies WHERE code = 'maragwa'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maragwa_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Maragwa Ward 5', 'maragwa_ward_5', (SELECT id FROM constituencies WHERE code = 'maragwa'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'maragwa_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kandara Ward 1', 'kandara_ward_1', (SELECT id FROM constituencies WHERE code = 'kandara'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kandara_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kandara Ward 2', 'kandara_ward_2', (SELECT id FROM constituencies WHERE code = 'kandara'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kandara_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kandara Ward 3', 'kandara_ward_3', (SELECT id FROM constituencies WHERE code = 'kandara'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kandara_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kandara Ward 4', 'kandara_ward_4', (SELECT id FROM constituencies WHERE code = 'kandara'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kandara_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kandara Ward 5', 'kandara_ward_5', (SELECT id FROM constituencies WHERE code = 'kandara'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kandara_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatanga Ward 1', 'gatanga_ward_1', (SELECT id FROM constituencies WHERE code = 'gatanga'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatanga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatanga Ward 2', 'gatanga_ward_2', (SELECT id FROM constituencies WHERE code = 'gatanga'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatanga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatanga Ward 3', 'gatanga_ward_3', (SELECT id FROM constituencies WHERE code = 'gatanga'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatanga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatanga Ward 4', 'gatanga_ward_4', (SELECT id FROM constituencies WHERE code = 'gatanga'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatanga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatanga Ward 5', 'gatanga_ward_5', (SELECT id FROM constituencies WHERE code = 'gatanga'), (SELECT id FROM counties WHERE code = 'murang_a_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatanga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu South Ward 1', 'gatundu_south_ward_1', (SELECT id FROM constituencies WHERE code = 'gatundu_south'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu South Ward 2', 'gatundu_south_ward_2', (SELECT id FROM constituencies WHERE code = 'gatundu_south'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu South Ward 3', 'gatundu_south_ward_3', (SELECT id FROM constituencies WHERE code = 'gatundu_south'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu South Ward 4', 'gatundu_south_ward_4', (SELECT id FROM constituencies WHERE code = 'gatundu_south'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu South Ward 5', 'gatundu_south_ward_5', (SELECT id FROM constituencies WHERE code = 'gatundu_south'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu North Ward 1', 'gatundu_north_ward_1', (SELECT id FROM constituencies WHERE code = 'gatundu_north'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu North Ward 2', 'gatundu_north_ward_2', (SELECT id FROM constituencies WHERE code = 'gatundu_north'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu North Ward 3', 'gatundu_north_ward_3', (SELECT id FROM constituencies WHERE code = 'gatundu_north'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu North Ward 4', 'gatundu_north_ward_4', (SELECT id FROM constituencies WHERE code = 'gatundu_north'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gatundu North Ward 5', 'gatundu_north_ward_5', (SELECT id FROM constituencies WHERE code = 'gatundu_north'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gatundu_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Juja Ward 1', 'juja_ward_1', (SELECT id FROM constituencies WHERE code = 'juja'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'juja_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Juja Ward 2', 'juja_ward_2', (SELECT id FROM constituencies WHERE code = 'juja'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'juja_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Juja Ward 3', 'juja_ward_3', (SELECT id FROM constituencies WHERE code = 'juja'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'juja_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Juja Ward 4', 'juja_ward_4', (SELECT id FROM constituencies WHERE code = 'juja'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'juja_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Juja Ward 5', 'juja_ward_5', (SELECT id FROM constituencies WHERE code = 'juja'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'juja_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Thika Town Ward 1', 'thika_town_ward_1', (SELECT id FROM constituencies WHERE code = 'thika_town'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'thika_town_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Thika Town Ward 2', 'thika_town_ward_2', (SELECT id FROM constituencies WHERE code = 'thika_town'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'thika_town_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Thika Town Ward 3', 'thika_town_ward_3', (SELECT id FROM constituencies WHERE code = 'thika_town'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'thika_town_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Thika Town Ward 4', 'thika_town_ward_4', (SELECT id FROM constituencies WHERE code = 'thika_town'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'thika_town_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Thika Town Ward 5', 'thika_town_ward_5', (SELECT id FROM constituencies WHERE code = 'thika_town'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'thika_town_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruiru Ward 1', 'ruiru_ward_1', (SELECT id FROM constituencies WHERE code = 'ruiru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruiru_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruiru Ward 2', 'ruiru_ward_2', (SELECT id FROM constituencies WHERE code = 'ruiru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruiru_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruiru Ward 3', 'ruiru_ward_3', (SELECT id FROM constituencies WHERE code = 'ruiru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruiru_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruiru Ward 4', 'ruiru_ward_4', (SELECT id FROM constituencies WHERE code = 'ruiru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruiru_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruiru Ward 5', 'ruiru_ward_5', (SELECT id FROM constituencies WHERE code = 'ruiru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruiru_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Githunguri Ward 1', 'githunguri_ward_1', (SELECT id FROM constituencies WHERE code = 'githunguri'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'githunguri_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Githunguri Ward 2', 'githunguri_ward_2', (SELECT id FROM constituencies WHERE code = 'githunguri'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'githunguri_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Githunguri Ward 3', 'githunguri_ward_3', (SELECT id FROM constituencies WHERE code = 'githunguri'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'githunguri_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Githunguri Ward 4', 'githunguri_ward_4', (SELECT id FROM constituencies WHERE code = 'githunguri'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'githunguri_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Githunguri Ward 5', 'githunguri_ward_5', (SELECT id FROM constituencies WHERE code = 'githunguri'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'githunguri_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambu Ward 1', 'kiambu_ward_1', (SELECT id FROM constituencies WHERE code = 'kiambu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambu Ward 2', 'kiambu_ward_2', (SELECT id FROM constituencies WHERE code = 'kiambu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambu Ward 3', 'kiambu_ward_3', (SELECT id FROM constituencies WHERE code = 'kiambu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambu Ward 4', 'kiambu_ward_4', (SELECT id FROM constituencies WHERE code = 'kiambu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambu Ward 5', 'kiambu_ward_5', (SELECT id FROM constituencies WHERE code = 'kiambu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambaa Ward 1', 'kiambaa_ward_1', (SELECT id FROM constituencies WHERE code = 'kiambaa'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambaa_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambaa Ward 2', 'kiambaa_ward_2', (SELECT id FROM constituencies WHERE code = 'kiambaa'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambaa_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambaa Ward 3', 'kiambaa_ward_3', (SELECT id FROM constituencies WHERE code = 'kiambaa'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambaa_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambaa Ward 4', 'kiambaa_ward_4', (SELECT id FROM constituencies WHERE code = 'kiambaa'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambaa_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiambaa Ward 5', 'kiambaa_ward_5', (SELECT id FROM constituencies WHERE code = 'kiambaa'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiambaa_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabete Ward 1', 'kabete_ward_1', (SELECT id FROM constituencies WHERE code = 'kabete'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabete_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabete Ward 2', 'kabete_ward_2', (SELECT id FROM constituencies WHERE code = 'kabete'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabete_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabete Ward 3', 'kabete_ward_3', (SELECT id FROM constituencies WHERE code = 'kabete'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabete_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabete Ward 4', 'kabete_ward_4', (SELECT id FROM constituencies WHERE code = 'kabete'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabete_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabete Ward 5', 'kabete_ward_5', (SELECT id FROM constituencies WHERE code = 'kabete'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabete_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kikuyu Ward 1', 'kikuyu_ward_1', (SELECT id FROM constituencies WHERE code = 'kikuyu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kikuyu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kikuyu Ward 2', 'kikuyu_ward_2', (SELECT id FROM constituencies WHERE code = 'kikuyu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kikuyu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kikuyu Ward 3', 'kikuyu_ward_3', (SELECT id FROM constituencies WHERE code = 'kikuyu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kikuyu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kikuyu Ward 4', 'kikuyu_ward_4', (SELECT id FROM constituencies WHERE code = 'kikuyu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kikuyu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kikuyu Ward 5', 'kikuyu_ward_5', (SELECT id FROM constituencies WHERE code = 'kikuyu'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kikuyu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Limuru Ward 1', 'limuru_ward_1', (SELECT id FROM constituencies WHERE code = 'limuru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'limuru_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Limuru Ward 2', 'limuru_ward_2', (SELECT id FROM constituencies WHERE code = 'limuru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'limuru_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Limuru Ward 3', 'limuru_ward_3', (SELECT id FROM constituencies WHERE code = 'limuru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'limuru_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Limuru Ward 4', 'limuru_ward_4', (SELECT id FROM constituencies WHERE code = 'limuru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'limuru_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Limuru Ward 5', 'limuru_ward_5', (SELECT id FROM constituencies WHERE code = 'limuru'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'limuru_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lari Ward 1', 'lari_ward_1', (SELECT id FROM constituencies WHERE code = 'lari'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lari_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lari Ward 2', 'lari_ward_2', (SELECT id FROM constituencies WHERE code = 'lari'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lari_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lari Ward 3', 'lari_ward_3', (SELECT id FROM constituencies WHERE code = 'lari'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lari_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lari Ward 4', 'lari_ward_4', (SELECT id FROM constituencies WHERE code = 'lari'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lari_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lari Ward 5', 'lari_ward_5', (SELECT id FROM constituencies WHERE code = 'lari'), (SELECT id FROM counties WHERE code = 'kiambu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lari_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana North Ward 1', 'turkana_north_ward_1', (SELECT id FROM constituencies WHERE code = 'turkana_north'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana North Ward 2', 'turkana_north_ward_2', (SELECT id FROM constituencies WHERE code = 'turkana_north'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana North Ward 3', 'turkana_north_ward_3', (SELECT id FROM constituencies WHERE code = 'turkana_north'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana North Ward 4', 'turkana_north_ward_4', (SELECT id FROM constituencies WHERE code = 'turkana_north'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana North Ward 5', 'turkana_north_ward_5', (SELECT id FROM constituencies WHERE code = 'turkana_north'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana West Ward 1', 'turkana_west_ward_1', (SELECT id FROM constituencies WHERE code = 'turkana_west'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana West Ward 2', 'turkana_west_ward_2', (SELECT id FROM constituencies WHERE code = 'turkana_west'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana West Ward 3', 'turkana_west_ward_3', (SELECT id FROM constituencies WHERE code = 'turkana_west'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana West Ward 4', 'turkana_west_ward_4', (SELECT id FROM constituencies WHERE code = 'turkana_west'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana West Ward 5', 'turkana_west_ward_5', (SELECT id FROM constituencies WHERE code = 'turkana_west'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana Central Ward 1', 'turkana_central_ward_1', (SELECT id FROM constituencies WHERE code = 'turkana_central'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana Central Ward 2', 'turkana_central_ward_2', (SELECT id FROM constituencies WHERE code = 'turkana_central'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana Central Ward 3', 'turkana_central_ward_3', (SELECT id FROM constituencies WHERE code = 'turkana_central'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana Central Ward 4', 'turkana_central_ward_4', (SELECT id FROM constituencies WHERE code = 'turkana_central'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana Central Ward 5', 'turkana_central_ward_5', (SELECT id FROM constituencies WHERE code = 'turkana_central'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Loima Ward 1', 'loima_ward_1', (SELECT id FROM constituencies WHERE code = 'loima'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'loima_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Loima Ward 2', 'loima_ward_2', (SELECT id FROM constituencies WHERE code = 'loima'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'loima_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Loima Ward 3', 'loima_ward_3', (SELECT id FROM constituencies WHERE code = 'loima'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'loima_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Loima Ward 4', 'loima_ward_4', (SELECT id FROM constituencies WHERE code = 'loima'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'loima_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Loima Ward 5', 'loima_ward_5', (SELECT id FROM constituencies WHERE code = 'loima'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'loima_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana South Ward 1', 'turkana_south_ward_1', (SELECT id FROM constituencies WHERE code = 'turkana_south'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana South Ward 2', 'turkana_south_ward_2', (SELECT id FROM constituencies WHERE code = 'turkana_south'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana South Ward 3', 'turkana_south_ward_3', (SELECT id FROM constituencies WHERE code = 'turkana_south'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana South Ward 4', 'turkana_south_ward_4', (SELECT id FROM constituencies WHERE code = 'turkana_south'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana South Ward 5', 'turkana_south_ward_5', (SELECT id FROM constituencies WHERE code = 'turkana_south'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana East Ward 1', 'turkana_east_ward_1', (SELECT id FROM constituencies WHERE code = 'turkana_east'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana East Ward 2', 'turkana_east_ward_2', (SELECT id FROM constituencies WHERE code = 'turkana_east'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana East Ward 3', 'turkana_east_ward_3', (SELECT id FROM constituencies WHERE code = 'turkana_east'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana East Ward 4', 'turkana_east_ward_4', (SELECT id FROM constituencies WHERE code = 'turkana_east'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turkana East Ward 5', 'turkana_east_ward_5', (SELECT id FROM constituencies WHERE code = 'turkana_east'), (SELECT id FROM counties WHERE code = 'turkana_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turkana_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapenguria Ward 1', 'kapenguria_ward_1', (SELECT id FROM constituencies WHERE code = 'kapenguria'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapenguria_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapenguria Ward 2', 'kapenguria_ward_2', (SELECT id FROM constituencies WHERE code = 'kapenguria'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapenguria_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapenguria Ward 3', 'kapenguria_ward_3', (SELECT id FROM constituencies WHERE code = 'kapenguria'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapenguria_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapenguria Ward 4', 'kapenguria_ward_4', (SELECT id FROM constituencies WHERE code = 'kapenguria'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapenguria_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapenguria Ward 5', 'kapenguria_ward_5', (SELECT id FROM constituencies WHERE code = 'kapenguria'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapenguria_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigor Ward 1', 'sigor_ward_1', (SELECT id FROM constituencies WHERE code = 'sigor'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigor_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigor Ward 2', 'sigor_ward_2', (SELECT id FROM constituencies WHERE code = 'sigor'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigor_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigor Ward 3', 'sigor_ward_3', (SELECT id FROM constituencies WHERE code = 'sigor'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigor_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigor Ward 4', 'sigor_ward_4', (SELECT id FROM constituencies WHERE code = 'sigor'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigor_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigor Ward 5', 'sigor_ward_5', (SELECT id FROM constituencies WHERE code = 'sigor'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigor_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kacheliba Ward 1', 'kacheliba_ward_1', (SELECT id FROM constituencies WHERE code = 'kacheliba'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kacheliba_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kacheliba Ward 2', 'kacheliba_ward_2', (SELECT id FROM constituencies WHERE code = 'kacheliba'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kacheliba_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kacheliba Ward 3', 'kacheliba_ward_3', (SELECT id FROM constituencies WHERE code = 'kacheliba'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kacheliba_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kacheliba Ward 4', 'kacheliba_ward_4', (SELECT id FROM constituencies WHERE code = 'kacheliba'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kacheliba_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kacheliba Ward 5', 'kacheliba_ward_5', (SELECT id FROM constituencies WHERE code = 'kacheliba'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kacheliba_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Pokot South Ward 1', 'pokot_south_ward_1', (SELECT id FROM constituencies WHERE code = 'pokot_south'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'pokot_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Pokot South Ward 2', 'pokot_south_ward_2', (SELECT id FROM constituencies WHERE code = 'pokot_south'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'pokot_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Pokot South Ward 3', 'pokot_south_ward_3', (SELECT id FROM constituencies WHERE code = 'pokot_south'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'pokot_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Pokot South Ward 4', 'pokot_south_ward_4', (SELECT id FROM constituencies WHERE code = 'pokot_south'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'pokot_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Pokot South Ward 5', 'pokot_south_ward_5', (SELECT id FROM constituencies WHERE code = 'pokot_south'), (SELECT id FROM counties WHERE code = 'west_pokot_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'pokot_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu West Ward 1', 'samburu_west_ward_1', (SELECT id FROM constituencies WHERE code = 'samburu_west'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu West Ward 2', 'samburu_west_ward_2', (SELECT id FROM constituencies WHERE code = 'samburu_west'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu West Ward 3', 'samburu_west_ward_3', (SELECT id FROM constituencies WHERE code = 'samburu_west'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu West Ward 4', 'samburu_west_ward_4', (SELECT id FROM constituencies WHERE code = 'samburu_west'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu West Ward 5', 'samburu_west_ward_5', (SELECT id FROM constituencies WHERE code = 'samburu_west'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu North Ward 1', 'samburu_north_ward_1', (SELECT id FROM constituencies WHERE code = 'samburu_north'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu North Ward 2', 'samburu_north_ward_2', (SELECT id FROM constituencies WHERE code = 'samburu_north'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu North Ward 3', 'samburu_north_ward_3', (SELECT id FROM constituencies WHERE code = 'samburu_north'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu North Ward 4', 'samburu_north_ward_4', (SELECT id FROM constituencies WHERE code = 'samburu_north'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu North Ward 5', 'samburu_north_ward_5', (SELECT id FROM constituencies WHERE code = 'samburu_north'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu East Ward 1', 'samburu_east_ward_1', (SELECT id FROM constituencies WHERE code = 'samburu_east'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu East Ward 2', 'samburu_east_ward_2', (SELECT id FROM constituencies WHERE code = 'samburu_east'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu East Ward 3', 'samburu_east_ward_3', (SELECT id FROM constituencies WHERE code = 'samburu_east'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu East Ward 4', 'samburu_east_ward_4', (SELECT id FROM constituencies WHERE code = 'samburu_east'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Samburu East Ward 5', 'samburu_east_ward_5', (SELECT id FROM constituencies WHERE code = 'samburu_east'), (SELECT id FROM counties WHERE code = 'samburu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'samburu_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kwanza Ward 1', 'kwanza_ward_1', (SELECT id FROM constituencies WHERE code = 'kwanza'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kwanza_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kwanza Ward 2', 'kwanza_ward_2', (SELECT id FROM constituencies WHERE code = 'kwanza'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kwanza_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kwanza Ward 3', 'kwanza_ward_3', (SELECT id FROM constituencies WHERE code = 'kwanza'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kwanza_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kwanza Ward 4', 'kwanza_ward_4', (SELECT id FROM constituencies WHERE code = 'kwanza'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kwanza_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kwanza Ward 5', 'kwanza_ward_5', (SELECT id FROM constituencies WHERE code = 'kwanza'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kwanza_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Endebess Ward 1', 'endebess_ward_1', (SELECT id FROM constituencies WHERE code = 'endebess'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'endebess_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Endebess Ward 2', 'endebess_ward_2', (SELECT id FROM constituencies WHERE code = 'endebess'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'endebess_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Endebess Ward 3', 'endebess_ward_3', (SELECT id FROM constituencies WHERE code = 'endebess'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'endebess_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Endebess Ward 4', 'endebess_ward_4', (SELECT id FROM constituencies WHERE code = 'endebess'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'endebess_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Endebess Ward 5', 'endebess_ward_5', (SELECT id FROM constituencies WHERE code = 'endebess'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'endebess_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saboti Ward 1', 'saboti_ward_1', (SELECT id FROM constituencies WHERE code = 'saboti'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saboti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saboti Ward 2', 'saboti_ward_2', (SELECT id FROM constituencies WHERE code = 'saboti'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saboti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saboti Ward 3', 'saboti_ward_3', (SELECT id FROM constituencies WHERE code = 'saboti'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saboti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saboti Ward 4', 'saboti_ward_4', (SELECT id FROM constituencies WHERE code = 'saboti'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saboti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Saboti Ward 5', 'saboti_ward_5', (SELECT id FROM constituencies WHERE code = 'saboti'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'saboti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiminini Ward 1', 'kiminini_ward_1', (SELECT id FROM constituencies WHERE code = 'kiminini'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiminini_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiminini Ward 2', 'kiminini_ward_2', (SELECT id FROM constituencies WHERE code = 'kiminini'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiminini_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiminini Ward 3', 'kiminini_ward_3', (SELECT id FROM constituencies WHERE code = 'kiminini'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiminini_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiminini Ward 4', 'kiminini_ward_4', (SELECT id FROM constituencies WHERE code = 'kiminini'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiminini_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kiminini Ward 5', 'kiminini_ward_5', (SELECT id FROM constituencies WHERE code = 'kiminini'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kiminini_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Cherangany Ward 1', 'cherangany_ward_1', (SELECT id FROM constituencies WHERE code = 'cherangany'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'cherangany_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Cherangany Ward 2', 'cherangany_ward_2', (SELECT id FROM constituencies WHERE code = 'cherangany'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'cherangany_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Cherangany Ward 3', 'cherangany_ward_3', (SELECT id FROM constituencies WHERE code = 'cherangany'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'cherangany_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Cherangany Ward 4', 'cherangany_ward_4', (SELECT id FROM constituencies WHERE code = 'cherangany'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'cherangany_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Cherangany Ward 5', 'cherangany_ward_5', (SELECT id FROM constituencies WHERE code = 'cherangany'), (SELECT id FROM counties WHERE code = 'trans_nzoia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'cherangany_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Soy Ward 1', 'soy_ward_1', (SELECT id FROM constituencies WHERE code = 'soy'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'soy_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Soy Ward 2', 'soy_ward_2', (SELECT id FROM constituencies WHERE code = 'soy'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'soy_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Soy Ward 3', 'soy_ward_3', (SELECT id FROM constituencies WHERE code = 'soy'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'soy_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Soy Ward 4', 'soy_ward_4', (SELECT id FROM constituencies WHERE code = 'soy'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'soy_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Soy Ward 5', 'soy_ward_5', (SELECT id FROM constituencies WHERE code = 'soy'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'soy_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turbo Ward 1', 'turbo_ward_1', (SELECT id FROM constituencies WHERE code = 'turbo'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turbo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turbo Ward 2', 'turbo_ward_2', (SELECT id FROM constituencies WHERE code = 'turbo'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turbo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turbo Ward 3', 'turbo_ward_3', (SELECT id FROM constituencies WHERE code = 'turbo'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turbo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turbo Ward 4', 'turbo_ward_4', (SELECT id FROM constituencies WHERE code = 'turbo'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turbo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Turbo Ward 5', 'turbo_ward_5', (SELECT id FROM constituencies WHERE code = 'turbo'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'turbo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moiben Ward 1', 'moiben_ward_1', (SELECT id FROM constituencies WHERE code = 'moiben'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moiben_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moiben Ward 2', 'moiben_ward_2', (SELECT id FROM constituencies WHERE code = 'moiben'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moiben_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moiben Ward 3', 'moiben_ward_3', (SELECT id FROM constituencies WHERE code = 'moiben'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moiben_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moiben Ward 4', 'moiben_ward_4', (SELECT id FROM constituencies WHERE code = 'moiben'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moiben_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Moiben Ward 5', 'moiben_ward_5', (SELECT id FROM constituencies WHERE code = 'moiben'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'moiben_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainabkoi Ward 1', 'ainabkoi_ward_1', (SELECT id FROM constituencies WHERE code = 'ainabkoi'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainabkoi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainabkoi Ward 2', 'ainabkoi_ward_2', (SELECT id FROM constituencies WHERE code = 'ainabkoi'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainabkoi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainabkoi Ward 3', 'ainabkoi_ward_3', (SELECT id FROM constituencies WHERE code = 'ainabkoi'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainabkoi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainabkoi Ward 4', 'ainabkoi_ward_4', (SELECT id FROM constituencies WHERE code = 'ainabkoi'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainabkoi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainabkoi Ward 5', 'ainabkoi_ward_5', (SELECT id FROM constituencies WHERE code = 'ainabkoi'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainabkoi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapseret Ward 1', 'kapseret_ward_1', (SELECT id FROM constituencies WHERE code = 'kapseret'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapseret_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapseret Ward 2', 'kapseret_ward_2', (SELECT id FROM constituencies WHERE code = 'kapseret'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapseret_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapseret Ward 3', 'kapseret_ward_3', (SELECT id FROM constituencies WHERE code = 'kapseret'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapseret_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapseret Ward 4', 'kapseret_ward_4', (SELECT id FROM constituencies WHERE code = 'kapseret'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapseret_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kapseret Ward 5', 'kapseret_ward_5', (SELECT id FROM constituencies WHERE code = 'kapseret'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kapseret_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kesses Ward 1', 'kesses_ward_1', (SELECT id FROM constituencies WHERE code = 'kesses'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kesses_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kesses Ward 2', 'kesses_ward_2', (SELECT id FROM constituencies WHERE code = 'kesses'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kesses_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kesses Ward 3', 'kesses_ward_3', (SELECT id FROM constituencies WHERE code = 'kesses'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kesses_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kesses Ward 4', 'kesses_ward_4', (SELECT id FROM constituencies WHERE code = 'kesses'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kesses_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kesses Ward 5', 'kesses_ward_5', (SELECT id FROM constituencies WHERE code = 'kesses'), (SELECT id FROM counties WHERE code = 'uasin_gishu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kesses_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet East Ward 1', 'marakwet_east_ward_1', (SELECT id FROM constituencies WHERE code = 'marakwet_east'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet East Ward 2', 'marakwet_east_ward_2', (SELECT id FROM constituencies WHERE code = 'marakwet_east'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet East Ward 3', 'marakwet_east_ward_3', (SELECT id FROM constituencies WHERE code = 'marakwet_east'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet East Ward 4', 'marakwet_east_ward_4', (SELECT id FROM constituencies WHERE code = 'marakwet_east'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet East Ward 5', 'marakwet_east_ward_5', (SELECT id FROM constituencies WHERE code = 'marakwet_east'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet West Ward 1', 'marakwet_west_ward_1', (SELECT id FROM constituencies WHERE code = 'marakwet_west'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet West Ward 2', 'marakwet_west_ward_2', (SELECT id FROM constituencies WHERE code = 'marakwet_west'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet West Ward 3', 'marakwet_west_ward_3', (SELECT id FROM constituencies WHERE code = 'marakwet_west'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet West Ward 4', 'marakwet_west_ward_4', (SELECT id FROM constituencies WHERE code = 'marakwet_west'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Marakwet West Ward 5', 'marakwet_west_ward_5', (SELECT id FROM constituencies WHERE code = 'marakwet_west'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'marakwet_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo North Ward 1', 'keiyo_north_ward_1', (SELECT id FROM constituencies WHERE code = 'keiyo_north'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo North Ward 2', 'keiyo_north_ward_2', (SELECT id FROM constituencies WHERE code = 'keiyo_north'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo North Ward 3', 'keiyo_north_ward_3', (SELECT id FROM constituencies WHERE code = 'keiyo_north'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo North Ward 4', 'keiyo_north_ward_4', (SELECT id FROM constituencies WHERE code = 'keiyo_north'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo North Ward 5', 'keiyo_north_ward_5', (SELECT id FROM constituencies WHERE code = 'keiyo_north'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo South Ward 1', 'keiyo_south_ward_1', (SELECT id FROM constituencies WHERE code = 'keiyo_south'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo South Ward 2', 'keiyo_south_ward_2', (SELECT id FROM constituencies WHERE code = 'keiyo_south'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo South Ward 3', 'keiyo_south_ward_3', (SELECT id FROM constituencies WHERE code = 'keiyo_south'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo South Ward 4', 'keiyo_south_ward_4', (SELECT id FROM constituencies WHERE code = 'keiyo_south'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Keiyo South Ward 5', 'keiyo_south_ward_5', (SELECT id FROM constituencies WHERE code = 'keiyo_south'), (SELECT id FROM counties WHERE code = 'elgeyo_marakwet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'keiyo_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tinderet Ward 1', 'tinderet_ward_1', (SELECT id FROM constituencies WHERE code = 'tinderet'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tinderet_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tinderet Ward 2', 'tinderet_ward_2', (SELECT id FROM constituencies WHERE code = 'tinderet'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tinderet_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tinderet Ward 3', 'tinderet_ward_3', (SELECT id FROM constituencies WHERE code = 'tinderet'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tinderet_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tinderet Ward 4', 'tinderet_ward_4', (SELECT id FROM constituencies WHERE code = 'tinderet'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tinderet_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tinderet Ward 5', 'tinderet_ward_5', (SELECT id FROM constituencies WHERE code = 'tinderet'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tinderet_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Aldai Ward 1', 'aldai_ward_1', (SELECT id FROM constituencies WHERE code = 'aldai'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'aldai_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Aldai Ward 2', 'aldai_ward_2', (SELECT id FROM constituencies WHERE code = 'aldai'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'aldai_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Aldai Ward 3', 'aldai_ward_3', (SELECT id FROM constituencies WHERE code = 'aldai'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'aldai_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Aldai Ward 4', 'aldai_ward_4', (SELECT id FROM constituencies WHERE code = 'aldai'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'aldai_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Aldai Ward 5', 'aldai_ward_5', (SELECT id FROM constituencies WHERE code = 'aldai'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'aldai_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nandi Hills Ward 1', 'nandi_hills_ward_1', (SELECT id FROM constituencies WHERE code = 'nandi_hills'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nandi_hills_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nandi Hills Ward 2', 'nandi_hills_ward_2', (SELECT id FROM constituencies WHERE code = 'nandi_hills'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nandi_hills_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nandi Hills Ward 3', 'nandi_hills_ward_3', (SELECT id FROM constituencies WHERE code = 'nandi_hills'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nandi_hills_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nandi Hills Ward 4', 'nandi_hills_ward_4', (SELECT id FROM constituencies WHERE code = 'nandi_hills'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nandi_hills_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nandi Hills Ward 5', 'nandi_hills_ward_5', (SELECT id FROM constituencies WHERE code = 'nandi_hills'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nandi_hills_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chesumei Ward 1', 'chesumei_ward_1', (SELECT id FROM constituencies WHERE code = 'chesumei'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chesumei_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chesumei Ward 2', 'chesumei_ward_2', (SELECT id FROM constituencies WHERE code = 'chesumei'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chesumei_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chesumei Ward 3', 'chesumei_ward_3', (SELECT id FROM constituencies WHERE code = 'chesumei'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chesumei_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chesumei Ward 4', 'chesumei_ward_4', (SELECT id FROM constituencies WHERE code = 'chesumei'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chesumei_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chesumei Ward 5', 'chesumei_ward_5', (SELECT id FROM constituencies WHERE code = 'chesumei'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chesumei_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emgwen Ward 1', 'emgwen_ward_1', (SELECT id FROM constituencies WHERE code = 'emgwen'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emgwen_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emgwen Ward 2', 'emgwen_ward_2', (SELECT id FROM constituencies WHERE code = 'emgwen'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emgwen_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emgwen Ward 3', 'emgwen_ward_3', (SELECT id FROM constituencies WHERE code = 'emgwen'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emgwen_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emgwen Ward 4', 'emgwen_ward_4', (SELECT id FROM constituencies WHERE code = 'emgwen'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emgwen_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emgwen Ward 5', 'emgwen_ward_5', (SELECT id FROM constituencies WHERE code = 'emgwen'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emgwen_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mosop Ward 1', 'mosop_ward_1', (SELECT id FROM constituencies WHERE code = 'mosop'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mosop_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mosop Ward 2', 'mosop_ward_2', (SELECT id FROM constituencies WHERE code = 'mosop'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mosop_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mosop Ward 3', 'mosop_ward_3', (SELECT id FROM constituencies WHERE code = 'mosop'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mosop_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mosop Ward 4', 'mosop_ward_4', (SELECT id FROM constituencies WHERE code = 'mosop'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mosop_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mosop Ward 5', 'mosop_ward_5', (SELECT id FROM constituencies WHERE code = 'mosop'), (SELECT id FROM counties WHERE code = 'nandi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mosop_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tiaty Ward 1', 'tiaty_ward_1', (SELECT id FROM constituencies WHERE code = 'tiaty'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tiaty_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tiaty Ward 2', 'tiaty_ward_2', (SELECT id FROM constituencies WHERE code = 'tiaty'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tiaty_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tiaty Ward 3', 'tiaty_ward_3', (SELECT id FROM constituencies WHERE code = 'tiaty'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tiaty_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tiaty Ward 4', 'tiaty_ward_4', (SELECT id FROM constituencies WHERE code = 'tiaty'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tiaty_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tiaty Ward 5', 'tiaty_ward_5', (SELECT id FROM constituencies WHERE code = 'tiaty'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tiaty_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo North Ward 1', 'baringo_north_ward_1', (SELECT id FROM constituencies WHERE code = 'baringo_north'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo North Ward 2', 'baringo_north_ward_2', (SELECT id FROM constituencies WHERE code = 'baringo_north'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo North Ward 3', 'baringo_north_ward_3', (SELECT id FROM constituencies WHERE code = 'baringo_north'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo North Ward 4', 'baringo_north_ward_4', (SELECT id FROM constituencies WHERE code = 'baringo_north'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo North Ward 5', 'baringo_north_ward_5', (SELECT id FROM constituencies WHERE code = 'baringo_north'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo Central Ward 1', 'baringo_central_ward_1', (SELECT id FROM constituencies WHERE code = 'baringo_central'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo Central Ward 2', 'baringo_central_ward_2', (SELECT id FROM constituencies WHERE code = 'baringo_central'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo Central Ward 3', 'baringo_central_ward_3', (SELECT id FROM constituencies WHERE code = 'baringo_central'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo Central Ward 4', 'baringo_central_ward_4', (SELECT id FROM constituencies WHERE code = 'baringo_central'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo Central Ward 5', 'baringo_central_ward_5', (SELECT id FROM constituencies WHERE code = 'baringo_central'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo South Ward 1', 'baringo_south_ward_1', (SELECT id FROM constituencies WHERE code = 'baringo_south'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo South Ward 2', 'baringo_south_ward_2', (SELECT id FROM constituencies WHERE code = 'baringo_south'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo South Ward 3', 'baringo_south_ward_3', (SELECT id FROM constituencies WHERE code = 'baringo_south'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo South Ward 4', 'baringo_south_ward_4', (SELECT id FROM constituencies WHERE code = 'baringo_south'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Baringo South Ward 5', 'baringo_south_ward_5', (SELECT id FROM constituencies WHERE code = 'baringo_south'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'baringo_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mogotio Ward 1', 'mogotio_ward_1', (SELECT id FROM constituencies WHERE code = 'mogotio'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mogotio_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mogotio Ward 2', 'mogotio_ward_2', (SELECT id FROM constituencies WHERE code = 'mogotio'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mogotio_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mogotio Ward 3', 'mogotio_ward_3', (SELECT id FROM constituencies WHERE code = 'mogotio'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mogotio_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mogotio Ward 4', 'mogotio_ward_4', (SELECT id FROM constituencies WHERE code = 'mogotio'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mogotio_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mogotio Ward 5', 'mogotio_ward_5', (SELECT id FROM constituencies WHERE code = 'mogotio'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mogotio_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldama Ravine Ward 1', 'eldama_ravine_ward_1', (SELECT id FROM constituencies WHERE code = 'eldama_ravine'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldama_ravine_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldama Ravine Ward 2', 'eldama_ravine_ward_2', (SELECT id FROM constituencies WHERE code = 'eldama_ravine'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldama_ravine_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldama Ravine Ward 3', 'eldama_ravine_ward_3', (SELECT id FROM constituencies WHERE code = 'eldama_ravine'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldama_ravine_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldama Ravine Ward 4', 'eldama_ravine_ward_4', (SELECT id FROM constituencies WHERE code = 'eldama_ravine'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldama_ravine_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Eldama Ravine Ward 5', 'eldama_ravine_ward_5', (SELECT id FROM constituencies WHERE code = 'eldama_ravine'), (SELECT id FROM counties WHERE code = 'baringo_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'eldama_ravine_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia West Ward 1', 'laikipia_west_ward_1', (SELECT id FROM constituencies WHERE code = 'laikipia_west'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia West Ward 2', 'laikipia_west_ward_2', (SELECT id FROM constituencies WHERE code = 'laikipia_west'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia West Ward 3', 'laikipia_west_ward_3', (SELECT id FROM constituencies WHERE code = 'laikipia_west'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia West Ward 4', 'laikipia_west_ward_4', (SELECT id FROM constituencies WHERE code = 'laikipia_west'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia West Ward 5', 'laikipia_west_ward_5', (SELECT id FROM constituencies WHERE code = 'laikipia_west'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia East Ward 1', 'laikipia_east_ward_1', (SELECT id FROM constituencies WHERE code = 'laikipia_east'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia East Ward 2', 'laikipia_east_ward_2', (SELECT id FROM constituencies WHERE code = 'laikipia_east'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia East Ward 3', 'laikipia_east_ward_3', (SELECT id FROM constituencies WHERE code = 'laikipia_east'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia East Ward 4', 'laikipia_east_ward_4', (SELECT id FROM constituencies WHERE code = 'laikipia_east'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia East Ward 5', 'laikipia_east_ward_5', (SELECT id FROM constituencies WHERE code = 'laikipia_east'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia North Ward 1', 'laikipia_north_ward_1', (SELECT id FROM constituencies WHERE code = 'laikipia_north'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia North Ward 2', 'laikipia_north_ward_2', (SELECT id FROM constituencies WHERE code = 'laikipia_north'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia North Ward 3', 'laikipia_north_ward_3', (SELECT id FROM constituencies WHERE code = 'laikipia_north'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia North Ward 4', 'laikipia_north_ward_4', (SELECT id FROM constituencies WHERE code = 'laikipia_north'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Laikipia North Ward 5', 'laikipia_north_ward_5', (SELECT id FROM constituencies WHERE code = 'laikipia_north'), (SELECT id FROM counties WHERE code = 'laikipia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'laikipia_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Molo Ward 1', 'molo_ward_1', (SELECT id FROM constituencies WHERE code = 'molo'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'molo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Molo Ward 2', 'molo_ward_2', (SELECT id FROM constituencies WHERE code = 'molo'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'molo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Molo Ward 3', 'molo_ward_3', (SELECT id FROM constituencies WHERE code = 'molo'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'molo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Molo Ward 4', 'molo_ward_4', (SELECT id FROM constituencies WHERE code = 'molo'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'molo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Molo Ward 5', 'molo_ward_5', (SELECT id FROM constituencies WHERE code = 'molo'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'molo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Njoro Ward 1', 'njoro_ward_1', (SELECT id FROM constituencies WHERE code = 'njoro'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'njoro_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Njoro Ward 2', 'njoro_ward_2', (SELECT id FROM constituencies WHERE code = 'njoro'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'njoro_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Njoro Ward 3', 'njoro_ward_3', (SELECT id FROM constituencies WHERE code = 'njoro'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'njoro_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Njoro Ward 4', 'njoro_ward_4', (SELECT id FROM constituencies WHERE code = 'njoro'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'njoro_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Njoro Ward 5', 'njoro_ward_5', (SELECT id FROM constituencies WHERE code = 'njoro'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'njoro_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Naivasha Ward 1', 'naivasha_ward_1', (SELECT id FROM constituencies WHERE code = 'naivasha'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'naivasha_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Naivasha Ward 2', 'naivasha_ward_2', (SELECT id FROM constituencies WHERE code = 'naivasha'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'naivasha_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Naivasha Ward 3', 'naivasha_ward_3', (SELECT id FROM constituencies WHERE code = 'naivasha'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'naivasha_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Naivasha Ward 4', 'naivasha_ward_4', (SELECT id FROM constituencies WHERE code = 'naivasha'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'naivasha_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Naivasha Ward 5', 'naivasha_ward_5', (SELECT id FROM constituencies WHERE code = 'naivasha'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'naivasha_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gilgil Ward 1', 'gilgil_ward_1', (SELECT id FROM constituencies WHERE code = 'gilgil'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gilgil_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gilgil Ward 2', 'gilgil_ward_2', (SELECT id FROM constituencies WHERE code = 'gilgil'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gilgil_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gilgil Ward 3', 'gilgil_ward_3', (SELECT id FROM constituencies WHERE code = 'gilgil'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gilgil_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gilgil Ward 4', 'gilgil_ward_4', (SELECT id FROM constituencies WHERE code = 'gilgil'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gilgil_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gilgil Ward 5', 'gilgil_ward_5', (SELECT id FROM constituencies WHERE code = 'gilgil'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gilgil_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi South Ward 1', 'kuresoi_south_ward_1', (SELECT id FROM constituencies WHERE code = 'kuresoi_south'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi South Ward 2', 'kuresoi_south_ward_2', (SELECT id FROM constituencies WHERE code = 'kuresoi_south'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi South Ward 3', 'kuresoi_south_ward_3', (SELECT id FROM constituencies WHERE code = 'kuresoi_south'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi South Ward 4', 'kuresoi_south_ward_4', (SELECT id FROM constituencies WHERE code = 'kuresoi_south'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi South Ward 5', 'kuresoi_south_ward_5', (SELECT id FROM constituencies WHERE code = 'kuresoi_south'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi North Ward 1', 'kuresoi_north_ward_1', (SELECT id FROM constituencies WHERE code = 'kuresoi_north'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi North Ward 2', 'kuresoi_north_ward_2', (SELECT id FROM constituencies WHERE code = 'kuresoi_north'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi North Ward 3', 'kuresoi_north_ward_3', (SELECT id FROM constituencies WHERE code = 'kuresoi_north'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi North Ward 4', 'kuresoi_north_ward_4', (SELECT id FROM constituencies WHERE code = 'kuresoi_north'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuresoi North Ward 5', 'kuresoi_north_ward_5', (SELECT id FROM constituencies WHERE code = 'kuresoi_north'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuresoi_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Subukia Ward 1', 'subukia_ward_1', (SELECT id FROM constituencies WHERE code = 'subukia'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'subukia_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Subukia Ward 2', 'subukia_ward_2', (SELECT id FROM constituencies WHERE code = 'subukia'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'subukia_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Subukia Ward 3', 'subukia_ward_3', (SELECT id FROM constituencies WHERE code = 'subukia'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'subukia_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Subukia Ward 4', 'subukia_ward_4', (SELECT id FROM constituencies WHERE code = 'subukia'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'subukia_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Subukia Ward 5', 'subukia_ward_5', (SELECT id FROM constituencies WHERE code = 'subukia'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'subukia_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongai Ward 1', 'rongai_ward_1', (SELECT id FROM constituencies WHERE code = 'rongai'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongai_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongai Ward 2', 'rongai_ward_2', (SELECT id FROM constituencies WHERE code = 'rongai'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongai_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongai Ward 3', 'rongai_ward_3', (SELECT id FROM constituencies WHERE code = 'rongai'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongai_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongai Ward 4', 'rongai_ward_4', (SELECT id FROM constituencies WHERE code = 'rongai'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongai_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongai Ward 5', 'rongai_ward_5', (SELECT id FROM constituencies WHERE code = 'rongai'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongai_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bahati Ward 1', 'bahati_ward_1', (SELECT id FROM constituencies WHERE code = 'bahati'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bahati_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bahati Ward 2', 'bahati_ward_2', (SELECT id FROM constituencies WHERE code = 'bahati'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bahati_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bahati Ward 3', 'bahati_ward_3', (SELECT id FROM constituencies WHERE code = 'bahati'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bahati_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bahati Ward 4', 'bahati_ward_4', (SELECT id FROM constituencies WHERE code = 'bahati'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bahati_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bahati Ward 5', 'bahati_ward_5', (SELECT id FROM constituencies WHERE code = 'bahati'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bahati_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town West Ward 1', 'nakuru_town_west_ward_1', (SELECT id FROM constituencies WHERE code = 'nakuru_town_west'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town West Ward 2', 'nakuru_town_west_ward_2', (SELECT id FROM constituencies WHERE code = 'nakuru_town_west'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town West Ward 3', 'nakuru_town_west_ward_3', (SELECT id FROM constituencies WHERE code = 'nakuru_town_west'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town West Ward 4', 'nakuru_town_west_ward_4', (SELECT id FROM constituencies WHERE code = 'nakuru_town_west'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town West Ward 5', 'nakuru_town_west_ward_5', (SELECT id FROM constituencies WHERE code = 'nakuru_town_west'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town East Ward 1', 'nakuru_town_east_ward_1', (SELECT id FROM constituencies WHERE code = 'nakuru_town_east'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town East Ward 2', 'nakuru_town_east_ward_2', (SELECT id FROM constituencies WHERE code = 'nakuru_town_east'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town East Ward 3', 'nakuru_town_east_ward_3', (SELECT id FROM constituencies WHERE code = 'nakuru_town_east'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town East Ward 4', 'nakuru_town_east_ward_4', (SELECT id FROM constituencies WHERE code = 'nakuru_town_east'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nakuru Town East Ward 5', 'nakuru_town_east_ward_5', (SELECT id FROM constituencies WHERE code = 'nakuru_town_east'), (SELECT id FROM counties WHERE code = 'nakuru_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nakuru_town_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilgoris Ward 1', 'kilgoris_ward_1', (SELECT id FROM constituencies WHERE code = 'kilgoris'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilgoris_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilgoris Ward 2', 'kilgoris_ward_2', (SELECT id FROM constituencies WHERE code = 'kilgoris'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilgoris_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilgoris Ward 3', 'kilgoris_ward_3', (SELECT id FROM constituencies WHERE code = 'kilgoris'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilgoris_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilgoris Ward 4', 'kilgoris_ward_4', (SELECT id FROM constituencies WHERE code = 'kilgoris'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilgoris_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kilgoris Ward 5', 'kilgoris_ward_5', (SELECT id FROM constituencies WHERE code = 'kilgoris'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kilgoris_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emurua Dikirr Ward 1', 'emurua_dikirr_ward_1', (SELECT id FROM constituencies WHERE code = 'emurua_dikirr'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emurua_dikirr_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emurua Dikirr Ward 2', 'emurua_dikirr_ward_2', (SELECT id FROM constituencies WHERE code = 'emurua_dikirr'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emurua_dikirr_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emurua Dikirr Ward 3', 'emurua_dikirr_ward_3', (SELECT id FROM constituencies WHERE code = 'emurua_dikirr'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emurua_dikirr_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emurua Dikirr Ward 4', 'emurua_dikirr_ward_4', (SELECT id FROM constituencies WHERE code = 'emurua_dikirr'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emurua_dikirr_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emurua Dikirr Ward 5', 'emurua_dikirr_ward_5', (SELECT id FROM constituencies WHERE code = 'emurua_dikirr'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emurua_dikirr_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok North Ward 1', 'narok_north_ward_1', (SELECT id FROM constituencies WHERE code = 'narok_north'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok North Ward 2', 'narok_north_ward_2', (SELECT id FROM constituencies WHERE code = 'narok_north'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok North Ward 3', 'narok_north_ward_3', (SELECT id FROM constituencies WHERE code = 'narok_north'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok North Ward 4', 'narok_north_ward_4', (SELECT id FROM constituencies WHERE code = 'narok_north'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok North Ward 5', 'narok_north_ward_5', (SELECT id FROM constituencies WHERE code = 'narok_north'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok East Ward 1', 'narok_east_ward_1', (SELECT id FROM constituencies WHERE code = 'narok_east'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok East Ward 2', 'narok_east_ward_2', (SELECT id FROM constituencies WHERE code = 'narok_east'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok East Ward 3', 'narok_east_ward_3', (SELECT id FROM constituencies WHERE code = 'narok_east'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok East Ward 4', 'narok_east_ward_4', (SELECT id FROM constituencies WHERE code = 'narok_east'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok East Ward 5', 'narok_east_ward_5', (SELECT id FROM constituencies WHERE code = 'narok_east'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok South Ward 1', 'narok_south_ward_1', (SELECT id FROM constituencies WHERE code = 'narok_south'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok South Ward 2', 'narok_south_ward_2', (SELECT id FROM constituencies WHERE code = 'narok_south'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok South Ward 3', 'narok_south_ward_3', (SELECT id FROM constituencies WHERE code = 'narok_south'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok South Ward 4', 'narok_south_ward_4', (SELECT id FROM constituencies WHERE code = 'narok_south'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok South Ward 5', 'narok_south_ward_5', (SELECT id FROM constituencies WHERE code = 'narok_south'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok West Ward 1', 'narok_west_ward_1', (SELECT id FROM constituencies WHERE code = 'narok_west'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok West Ward 2', 'narok_west_ward_2', (SELECT id FROM constituencies WHERE code = 'narok_west'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok West Ward 3', 'narok_west_ward_3', (SELECT id FROM constituencies WHERE code = 'narok_west'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok West Ward 4', 'narok_west_ward_4', (SELECT id FROM constituencies WHERE code = 'narok_west'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Narok West Ward 5', 'narok_west_ward_5', (SELECT id FROM constituencies WHERE code = 'narok_west'), (SELECT id FROM counties WHERE code = 'narok_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'narok_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado North Ward 1', 'kajiado_north_ward_1', (SELECT id FROM constituencies WHERE code = 'kajiado_north'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado North Ward 2', 'kajiado_north_ward_2', (SELECT id FROM constituencies WHERE code = 'kajiado_north'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado North Ward 3', 'kajiado_north_ward_3', (SELECT id FROM constituencies WHERE code = 'kajiado_north'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado North Ward 4', 'kajiado_north_ward_4', (SELECT id FROM constituencies WHERE code = 'kajiado_north'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado North Ward 5', 'kajiado_north_ward_5', (SELECT id FROM constituencies WHERE code = 'kajiado_north'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado Central Ward 1', 'kajiado_central_ward_1', (SELECT id FROM constituencies WHERE code = 'kajiado_central'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado Central Ward 2', 'kajiado_central_ward_2', (SELECT id FROM constituencies WHERE code = 'kajiado_central'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado Central Ward 3', 'kajiado_central_ward_3', (SELECT id FROM constituencies WHERE code = 'kajiado_central'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado Central Ward 4', 'kajiado_central_ward_4', (SELECT id FROM constituencies WHERE code = 'kajiado_central'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado Central Ward 5', 'kajiado_central_ward_5', (SELECT id FROM constituencies WHERE code = 'kajiado_central'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado East Ward 1', 'kajiado_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kajiado_east'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado East Ward 2', 'kajiado_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kajiado_east'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado East Ward 3', 'kajiado_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kajiado_east'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado East Ward 4', 'kajiado_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kajiado_east'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado East Ward 5', 'kajiado_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kajiado_east'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado West Ward 1', 'kajiado_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kajiado_west'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado West Ward 2', 'kajiado_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kajiado_west'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado West Ward 3', 'kajiado_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kajiado_west'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado West Ward 4', 'kajiado_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kajiado_west'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado West Ward 5', 'kajiado_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kajiado_west'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado South Ward 1', 'kajiado_south_ward_1', (SELECT id FROM constituencies WHERE code = 'kajiado_south'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado South Ward 2', 'kajiado_south_ward_2', (SELECT id FROM constituencies WHERE code = 'kajiado_south'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado South Ward 3', 'kajiado_south_ward_3', (SELECT id FROM constituencies WHERE code = 'kajiado_south'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado South Ward 4', 'kajiado_south_ward_4', (SELECT id FROM constituencies WHERE code = 'kajiado_south'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kajiado South Ward 5', 'kajiado_south_ward_5', (SELECT id FROM constituencies WHERE code = 'kajiado_south'), (SELECT id FROM counties WHERE code = 'kajiado_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kajiado_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion East Ward 1', 'kipkelion_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kipkelion_east'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion East Ward 2', 'kipkelion_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kipkelion_east'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion East Ward 3', 'kipkelion_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kipkelion_east'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion East Ward 4', 'kipkelion_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kipkelion_east'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion East Ward 5', 'kipkelion_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kipkelion_east'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion West Ward 1', 'kipkelion_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kipkelion_west'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion West Ward 2', 'kipkelion_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kipkelion_west'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion West Ward 3', 'kipkelion_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kipkelion_west'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion West Ward 4', 'kipkelion_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kipkelion_west'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kipkelion West Ward 5', 'kipkelion_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kipkelion_west'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kipkelion_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainamoi Ward 1', 'ainamoi_ward_1', (SELECT id FROM constituencies WHERE code = 'ainamoi'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainamoi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainamoi Ward 2', 'ainamoi_ward_2', (SELECT id FROM constituencies WHERE code = 'ainamoi'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainamoi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainamoi Ward 3', 'ainamoi_ward_3', (SELECT id FROM constituencies WHERE code = 'ainamoi'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainamoi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainamoi Ward 4', 'ainamoi_ward_4', (SELECT id FROM constituencies WHERE code = 'ainamoi'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainamoi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ainamoi Ward 5', 'ainamoi_ward_5', (SELECT id FROM constituencies WHERE code = 'ainamoi'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ainamoi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bureti Ward 1', 'bureti_ward_1', (SELECT id FROM constituencies WHERE code = 'bureti'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bureti_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bureti Ward 2', 'bureti_ward_2', (SELECT id FROM constituencies WHERE code = 'bureti'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bureti_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bureti Ward 3', 'bureti_ward_3', (SELECT id FROM constituencies WHERE code = 'bureti'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bureti_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bureti Ward 4', 'bureti_ward_4', (SELECT id FROM constituencies WHERE code = 'bureti'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bureti_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bureti Ward 5', 'bureti_ward_5', (SELECT id FROM constituencies WHERE code = 'bureti'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bureti_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Belgut Ward 1', 'belgut_ward_1', (SELECT id FROM constituencies WHERE code = 'belgut'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'belgut_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Belgut Ward 2', 'belgut_ward_2', (SELECT id FROM constituencies WHERE code = 'belgut'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'belgut_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Belgut Ward 3', 'belgut_ward_3', (SELECT id FROM constituencies WHERE code = 'belgut'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'belgut_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Belgut Ward 4', 'belgut_ward_4', (SELECT id FROM constituencies WHERE code = 'belgut'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'belgut_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Belgut Ward 5', 'belgut_ward_5', (SELECT id FROM constituencies WHERE code = 'belgut'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'belgut_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigowet–Soin Ward 1', 'sigowet_soin_ward_1', (SELECT id FROM constituencies WHERE code = 'sigowet_soin'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigowet_soin_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigowet–Soin Ward 2', 'sigowet_soin_ward_2', (SELECT id FROM constituencies WHERE code = 'sigowet_soin'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigowet_soin_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigowet–Soin Ward 3', 'sigowet_soin_ward_3', (SELECT id FROM constituencies WHERE code = 'sigowet_soin'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigowet_soin_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigowet–Soin Ward 4', 'sigowet_soin_ward_4', (SELECT id FROM constituencies WHERE code = 'sigowet_soin'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigowet_soin_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sigowet–Soin Ward 5', 'sigowet_soin_ward_5', (SELECT id FROM constituencies WHERE code = 'sigowet_soin'), (SELECT id FROM counties WHERE code = 'kericho_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sigowet_soin_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sotik Ward 1', 'sotik_ward_1', (SELECT id FROM constituencies WHERE code = 'sotik'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sotik_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sotik Ward 2', 'sotik_ward_2', (SELECT id FROM constituencies WHERE code = 'sotik'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sotik_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sotik Ward 3', 'sotik_ward_3', (SELECT id FROM constituencies WHERE code = 'sotik'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sotik_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sotik Ward 4', 'sotik_ward_4', (SELECT id FROM constituencies WHERE code = 'sotik'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sotik_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sotik Ward 5', 'sotik_ward_5', (SELECT id FROM constituencies WHERE code = 'sotik'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sotik_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chepalungu Ward 1', 'chepalungu_ward_1', (SELECT id FROM constituencies WHERE code = 'chepalungu'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chepalungu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chepalungu Ward 2', 'chepalungu_ward_2', (SELECT id FROM constituencies WHERE code = 'chepalungu'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chepalungu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chepalungu Ward 3', 'chepalungu_ward_3', (SELECT id FROM constituencies WHERE code = 'chepalungu'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chepalungu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chepalungu Ward 4', 'chepalungu_ward_4', (SELECT id FROM constituencies WHERE code = 'chepalungu'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chepalungu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Chepalungu Ward 5', 'chepalungu_ward_5', (SELECT id FROM constituencies WHERE code = 'chepalungu'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'chepalungu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet East Ward 1', 'bomet_east_ward_1', (SELECT id FROM constituencies WHERE code = 'bomet_east'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet East Ward 2', 'bomet_east_ward_2', (SELECT id FROM constituencies WHERE code = 'bomet_east'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet East Ward 3', 'bomet_east_ward_3', (SELECT id FROM constituencies WHERE code = 'bomet_east'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet East Ward 4', 'bomet_east_ward_4', (SELECT id FROM constituencies WHERE code = 'bomet_east'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet East Ward 5', 'bomet_east_ward_5', (SELECT id FROM constituencies WHERE code = 'bomet_east'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet Central Ward 1', 'bomet_central_ward_1', (SELECT id FROM constituencies WHERE code = 'bomet_central'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet Central Ward 2', 'bomet_central_ward_2', (SELECT id FROM constituencies WHERE code = 'bomet_central'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet Central Ward 3', 'bomet_central_ward_3', (SELECT id FROM constituencies WHERE code = 'bomet_central'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet Central Ward 4', 'bomet_central_ward_4', (SELECT id FROM constituencies WHERE code = 'bomet_central'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomet Central Ward 5', 'bomet_central_ward_5', (SELECT id FROM constituencies WHERE code = 'bomet_central'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomet_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Konoin Ward 1', 'konoin_ward_1', (SELECT id FROM constituencies WHERE code = 'konoin'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'konoin_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Konoin Ward 2', 'konoin_ward_2', (SELECT id FROM constituencies WHERE code = 'konoin'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'konoin_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Konoin Ward 3', 'konoin_ward_3', (SELECT id FROM constituencies WHERE code = 'konoin'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'konoin_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Konoin Ward 4', 'konoin_ward_4', (SELECT id FROM constituencies WHERE code = 'konoin'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'konoin_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Konoin Ward 5', 'konoin_ward_5', (SELECT id FROM constituencies WHERE code = 'konoin'), (SELECT id FROM counties WHERE code = 'bomet_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'konoin_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lugari Ward 1', 'lugari_ward_1', (SELECT id FROM constituencies WHERE code = 'lugari'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lugari_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lugari Ward 2', 'lugari_ward_2', (SELECT id FROM constituencies WHERE code = 'lugari'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lugari_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lugari Ward 3', 'lugari_ward_3', (SELECT id FROM constituencies WHERE code = 'lugari'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lugari_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lugari Ward 4', 'lugari_ward_4', (SELECT id FROM constituencies WHERE code = 'lugari'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lugari_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lugari Ward 5', 'lugari_ward_5', (SELECT id FROM constituencies WHERE code = 'lugari'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lugari_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likuyani Ward 1', 'likuyani_ward_1', (SELECT id FROM constituencies WHERE code = 'likuyani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likuyani_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likuyani Ward 2', 'likuyani_ward_2', (SELECT id FROM constituencies WHERE code = 'likuyani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likuyani_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likuyani Ward 3', 'likuyani_ward_3', (SELECT id FROM constituencies WHERE code = 'likuyani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likuyani_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likuyani Ward 4', 'likuyani_ward_4', (SELECT id FROM constituencies WHERE code = 'likuyani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likuyani_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Likuyani Ward 5', 'likuyani_ward_5', (SELECT id FROM constituencies WHERE code = 'likuyani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'likuyani_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malava Ward 1', 'malava_ward_1', (SELECT id FROM constituencies WHERE code = 'malava'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malava_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malava Ward 2', 'malava_ward_2', (SELECT id FROM constituencies WHERE code = 'malava'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malava_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malava Ward 3', 'malava_ward_3', (SELECT id FROM constituencies WHERE code = 'malava'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malava_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malava Ward 4', 'malava_ward_4', (SELECT id FROM constituencies WHERE code = 'malava'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malava_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Malava Ward 5', 'malava_ward_5', (SELECT id FROM constituencies WHERE code = 'malava'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'malava_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lurambi Ward 1', 'lurambi_ward_1', (SELECT id FROM constituencies WHERE code = 'lurambi'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lurambi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lurambi Ward 2', 'lurambi_ward_2', (SELECT id FROM constituencies WHERE code = 'lurambi'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lurambi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lurambi Ward 3', 'lurambi_ward_3', (SELECT id FROM constituencies WHERE code = 'lurambi'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lurambi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lurambi Ward 4', 'lurambi_ward_4', (SELECT id FROM constituencies WHERE code = 'lurambi'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lurambi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lurambi Ward 5', 'lurambi_ward_5', (SELECT id FROM constituencies WHERE code = 'lurambi'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lurambi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Navakholo Ward 1', 'navakholo_ward_1', (SELECT id FROM constituencies WHERE code = 'navakholo'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'navakholo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Navakholo Ward 2', 'navakholo_ward_2', (SELECT id FROM constituencies WHERE code = 'navakholo'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'navakholo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Navakholo Ward 3', 'navakholo_ward_3', (SELECT id FROM constituencies WHERE code = 'navakholo'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'navakholo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Navakholo Ward 4', 'navakholo_ward_4', (SELECT id FROM constituencies WHERE code = 'navakholo'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'navakholo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Navakholo Ward 5', 'navakholo_ward_5', (SELECT id FROM constituencies WHERE code = 'navakholo'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'navakholo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias West Ward 1', 'mumias_west_ward_1', (SELECT id FROM constituencies WHERE code = 'mumias_west'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias West Ward 2', 'mumias_west_ward_2', (SELECT id FROM constituencies WHERE code = 'mumias_west'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias West Ward 3', 'mumias_west_ward_3', (SELECT id FROM constituencies WHERE code = 'mumias_west'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias West Ward 4', 'mumias_west_ward_4', (SELECT id FROM constituencies WHERE code = 'mumias_west'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias West Ward 5', 'mumias_west_ward_5', (SELECT id FROM constituencies WHERE code = 'mumias_west'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias East Ward 1', 'mumias_east_ward_1', (SELECT id FROM constituencies WHERE code = 'mumias_east'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias East Ward 2', 'mumias_east_ward_2', (SELECT id FROM constituencies WHERE code = 'mumias_east'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias East Ward 3', 'mumias_east_ward_3', (SELECT id FROM constituencies WHERE code = 'mumias_east'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias East Ward 4', 'mumias_east_ward_4', (SELECT id FROM constituencies WHERE code = 'mumias_east'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mumias East Ward 5', 'mumias_east_ward_5', (SELECT id FROM constituencies WHERE code = 'mumias_east'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mumias_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungu Ward 1', 'matungu_ward_1', (SELECT id FROM constituencies WHERE code = 'matungu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungu Ward 2', 'matungu_ward_2', (SELECT id FROM constituencies WHERE code = 'matungu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungu Ward 3', 'matungu_ward_3', (SELECT id FROM constituencies WHERE code = 'matungu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungu Ward 4', 'matungu_ward_4', (SELECT id FROM constituencies WHERE code = 'matungu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matungu Ward 5', 'matungu_ward_5', (SELECT id FROM constituencies WHERE code = 'matungu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matungu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butere Ward 1', 'butere_ward_1', (SELECT id FROM constituencies WHERE code = 'butere'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butere_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butere Ward 2', 'butere_ward_2', (SELECT id FROM constituencies WHERE code = 'butere'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butere_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butere Ward 3', 'butere_ward_3', (SELECT id FROM constituencies WHERE code = 'butere'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butere_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butere Ward 4', 'butere_ward_4', (SELECT id FROM constituencies WHERE code = 'butere'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butere_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butere Ward 5', 'butere_ward_5', (SELECT id FROM constituencies WHERE code = 'butere'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butere_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Khwisero Ward 1', 'khwisero_ward_1', (SELECT id FROM constituencies WHERE code = 'khwisero'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'khwisero_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Khwisero Ward 2', 'khwisero_ward_2', (SELECT id FROM constituencies WHERE code = 'khwisero'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'khwisero_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Khwisero Ward 3', 'khwisero_ward_3', (SELECT id FROM constituencies WHERE code = 'khwisero'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'khwisero_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Khwisero Ward 4', 'khwisero_ward_4', (SELECT id FROM constituencies WHERE code = 'khwisero'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'khwisero_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Khwisero Ward 5', 'khwisero_ward_5', (SELECT id FROM constituencies WHERE code = 'khwisero'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'khwisero_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Shinyalu Ward 1', 'shinyalu_ward_1', (SELECT id FROM constituencies WHERE code = 'shinyalu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'shinyalu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Shinyalu Ward 2', 'shinyalu_ward_2', (SELECT id FROM constituencies WHERE code = 'shinyalu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'shinyalu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Shinyalu Ward 3', 'shinyalu_ward_3', (SELECT id FROM constituencies WHERE code = 'shinyalu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'shinyalu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Shinyalu Ward 4', 'shinyalu_ward_4', (SELECT id FROM constituencies WHERE code = 'shinyalu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'shinyalu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Shinyalu Ward 5', 'shinyalu_ward_5', (SELECT id FROM constituencies WHERE code = 'shinyalu'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'shinyalu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ikolomani Ward 1', 'ikolomani_ward_1', (SELECT id FROM constituencies WHERE code = 'ikolomani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ikolomani_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ikolomani Ward 2', 'ikolomani_ward_2', (SELECT id FROM constituencies WHERE code = 'ikolomani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ikolomani_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ikolomani Ward 3', 'ikolomani_ward_3', (SELECT id FROM constituencies WHERE code = 'ikolomani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ikolomani_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ikolomani Ward 4', 'ikolomani_ward_4', (SELECT id FROM constituencies WHERE code = 'ikolomani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ikolomani_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ikolomani Ward 5', 'ikolomani_ward_5', (SELECT id FROM constituencies WHERE code = 'ikolomani'), (SELECT id FROM counties WHERE code = 'kakamega_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ikolomani_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Vihiga Ward 1', 'vihiga_ward_1', (SELECT id FROM constituencies WHERE code = 'vihiga'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'vihiga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Vihiga Ward 2', 'vihiga_ward_2', (SELECT id FROM constituencies WHERE code = 'vihiga'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'vihiga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Vihiga Ward 3', 'vihiga_ward_3', (SELECT id FROM constituencies WHERE code = 'vihiga'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'vihiga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Vihiga Ward 4', 'vihiga_ward_4', (SELECT id FROM constituencies WHERE code = 'vihiga'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'vihiga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Vihiga Ward 5', 'vihiga_ward_5', (SELECT id FROM constituencies WHERE code = 'vihiga'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'vihiga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sabatia Ward 1', 'sabatia_ward_1', (SELECT id FROM constituencies WHERE code = 'sabatia'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sabatia_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sabatia Ward 2', 'sabatia_ward_2', (SELECT id FROM constituencies WHERE code = 'sabatia'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sabatia_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sabatia Ward 3', 'sabatia_ward_3', (SELECT id FROM constituencies WHERE code = 'sabatia'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sabatia_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sabatia Ward 4', 'sabatia_ward_4', (SELECT id FROM constituencies WHERE code = 'sabatia'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sabatia_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sabatia Ward 5', 'sabatia_ward_5', (SELECT id FROM constituencies WHERE code = 'sabatia'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sabatia_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Hamisi Ward 1', 'hamisi_ward_1', (SELECT id FROM constituencies WHERE code = 'hamisi'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'hamisi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Hamisi Ward 2', 'hamisi_ward_2', (SELECT id FROM constituencies WHERE code = 'hamisi'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'hamisi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Hamisi Ward 3', 'hamisi_ward_3', (SELECT id FROM constituencies WHERE code = 'hamisi'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'hamisi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Hamisi Ward 4', 'hamisi_ward_4', (SELECT id FROM constituencies WHERE code = 'hamisi'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'hamisi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Hamisi Ward 5', 'hamisi_ward_5', (SELECT id FROM constituencies WHERE code = 'hamisi'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'hamisi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Luanda Ward 1', 'luanda_ward_1', (SELECT id FROM constituencies WHERE code = 'luanda'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'luanda_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Luanda Ward 2', 'luanda_ward_2', (SELECT id FROM constituencies WHERE code = 'luanda'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'luanda_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Luanda Ward 3', 'luanda_ward_3', (SELECT id FROM constituencies WHERE code = 'luanda'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'luanda_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Luanda Ward 4', 'luanda_ward_4', (SELECT id FROM constituencies WHERE code = 'luanda'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'luanda_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Luanda Ward 5', 'luanda_ward_5', (SELECT id FROM constituencies WHERE code = 'luanda'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'luanda_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emuhaya Ward 1', 'emuhaya_ward_1', (SELECT id FROM constituencies WHERE code = 'emuhaya'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emuhaya_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emuhaya Ward 2', 'emuhaya_ward_2', (SELECT id FROM constituencies WHERE code = 'emuhaya'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emuhaya_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emuhaya Ward 3', 'emuhaya_ward_3', (SELECT id FROM constituencies WHERE code = 'emuhaya'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emuhaya_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emuhaya Ward 4', 'emuhaya_ward_4', (SELECT id FROM constituencies WHERE code = 'emuhaya'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emuhaya_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Emuhaya Ward 5', 'emuhaya_ward_5', (SELECT id FROM constituencies WHERE code = 'emuhaya'), (SELECT id FROM counties WHERE code = 'vihiga_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'emuhaya_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mount Elgon Ward 1', 'mount_elgon_ward_1', (SELECT id FROM constituencies WHERE code = 'mount_elgon'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mount_elgon_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mount Elgon Ward 2', 'mount_elgon_ward_2', (SELECT id FROM constituencies WHERE code = 'mount_elgon'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mount_elgon_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mount Elgon Ward 3', 'mount_elgon_ward_3', (SELECT id FROM constituencies WHERE code = 'mount_elgon'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mount_elgon_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mount Elgon Ward 4', 'mount_elgon_ward_4', (SELECT id FROM constituencies WHERE code = 'mount_elgon'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mount_elgon_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Mount Elgon Ward 5', 'mount_elgon_ward_5', (SELECT id FROM constituencies WHERE code = 'mount_elgon'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'mount_elgon_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sirisia Ward 1', 'sirisia_ward_1', (SELECT id FROM constituencies WHERE code = 'sirisia'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sirisia_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sirisia Ward 2', 'sirisia_ward_2', (SELECT id FROM constituencies WHERE code = 'sirisia'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sirisia_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sirisia Ward 3', 'sirisia_ward_3', (SELECT id FROM constituencies WHERE code = 'sirisia'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sirisia_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sirisia Ward 4', 'sirisia_ward_4', (SELECT id FROM constituencies WHERE code = 'sirisia'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sirisia_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Sirisia Ward 5', 'sirisia_ward_5', (SELECT id FROM constituencies WHERE code = 'sirisia'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'sirisia_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabuchai Ward 1', 'kabuchai_ward_1', (SELECT id FROM constituencies WHERE code = 'kabuchai'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabuchai_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabuchai Ward 2', 'kabuchai_ward_2', (SELECT id FROM constituencies WHERE code = 'kabuchai'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabuchai_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabuchai Ward 3', 'kabuchai_ward_3', (SELECT id FROM constituencies WHERE code = 'kabuchai'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabuchai_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabuchai Ward 4', 'kabuchai_ward_4', (SELECT id FROM constituencies WHERE code = 'kabuchai'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabuchai_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabuchai Ward 5', 'kabuchai_ward_5', (SELECT id FROM constituencies WHERE code = 'kabuchai'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabuchai_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bumula Ward 1', 'bumula_ward_1', (SELECT id FROM constituencies WHERE code = 'bumula'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bumula_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bumula Ward 2', 'bumula_ward_2', (SELECT id FROM constituencies WHERE code = 'bumula'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bumula_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bumula Ward 3', 'bumula_ward_3', (SELECT id FROM constituencies WHERE code = 'bumula'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bumula_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bumula Ward 4', 'bumula_ward_4', (SELECT id FROM constituencies WHERE code = 'bumula'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bumula_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bumula Ward 5', 'bumula_ward_5', (SELECT id FROM constituencies WHERE code = 'bumula'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bumula_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kanduyi Ward 1', 'kanduyi_ward_1', (SELECT id FROM constituencies WHERE code = 'kanduyi'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kanduyi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kanduyi Ward 2', 'kanduyi_ward_2', (SELECT id FROM constituencies WHERE code = 'kanduyi'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kanduyi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kanduyi Ward 3', 'kanduyi_ward_3', (SELECT id FROM constituencies WHERE code = 'kanduyi'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kanduyi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kanduyi Ward 4', 'kanduyi_ward_4', (SELECT id FROM constituencies WHERE code = 'kanduyi'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kanduyi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kanduyi Ward 5', 'kanduyi_ward_5', (SELECT id FROM constituencies WHERE code = 'kanduyi'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kanduyi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye East Ward 1', 'webuye_east_ward_1', (SELECT id FROM constituencies WHERE code = 'webuye_east'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye East Ward 2', 'webuye_east_ward_2', (SELECT id FROM constituencies WHERE code = 'webuye_east'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye East Ward 3', 'webuye_east_ward_3', (SELECT id FROM constituencies WHERE code = 'webuye_east'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye East Ward 4', 'webuye_east_ward_4', (SELECT id FROM constituencies WHERE code = 'webuye_east'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye East Ward 5', 'webuye_east_ward_5', (SELECT id FROM constituencies WHERE code = 'webuye_east'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye West Ward 1', 'webuye_west_ward_1', (SELECT id FROM constituencies WHERE code = 'webuye_west'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye West Ward 2', 'webuye_west_ward_2', (SELECT id FROM constituencies WHERE code = 'webuye_west'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye West Ward 3', 'webuye_west_ward_3', (SELECT id FROM constituencies WHERE code = 'webuye_west'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye West Ward 4', 'webuye_west_ward_4', (SELECT id FROM constituencies WHERE code = 'webuye_west'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Webuye West Ward 5', 'webuye_west_ward_5', (SELECT id FROM constituencies WHERE code = 'webuye_west'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'webuye_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kimilili Ward 1', 'kimilili_ward_1', (SELECT id FROM constituencies WHERE code = 'kimilili'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kimilili_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kimilili Ward 2', 'kimilili_ward_2', (SELECT id FROM constituencies WHERE code = 'kimilili'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kimilili_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kimilili Ward 3', 'kimilili_ward_3', (SELECT id FROM constituencies WHERE code = 'kimilili'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kimilili_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kimilili Ward 4', 'kimilili_ward_4', (SELECT id FROM constituencies WHERE code = 'kimilili'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kimilili_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kimilili Ward 5', 'kimilili_ward_5', (SELECT id FROM constituencies WHERE code = 'kimilili'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kimilili_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tongaren Ward 1', 'tongaren_ward_1', (SELECT id FROM constituencies WHERE code = 'tongaren'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tongaren_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tongaren Ward 2', 'tongaren_ward_2', (SELECT id FROM constituencies WHERE code = 'tongaren'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tongaren_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tongaren Ward 3', 'tongaren_ward_3', (SELECT id FROM constituencies WHERE code = 'tongaren'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tongaren_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tongaren Ward 4', 'tongaren_ward_4', (SELECT id FROM constituencies WHERE code = 'tongaren'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tongaren_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Tongaren Ward 5', 'tongaren_ward_5', (SELECT id FROM constituencies WHERE code = 'tongaren'), (SELECT id FROM counties WHERE code = 'bungoma_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'tongaren_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso North Ward 1', 'teso_north_ward_1', (SELECT id FROM constituencies WHERE code = 'teso_north'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso North Ward 2', 'teso_north_ward_2', (SELECT id FROM constituencies WHERE code = 'teso_north'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso North Ward 3', 'teso_north_ward_3', (SELECT id FROM constituencies WHERE code = 'teso_north'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso North Ward 4', 'teso_north_ward_4', (SELECT id FROM constituencies WHERE code = 'teso_north'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso North Ward 5', 'teso_north_ward_5', (SELECT id FROM constituencies WHERE code = 'teso_north'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso South Ward 1', 'teso_south_ward_1', (SELECT id FROM constituencies WHERE code = 'teso_south'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso South Ward 2', 'teso_south_ward_2', (SELECT id FROM constituencies WHERE code = 'teso_south'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso South Ward 3', 'teso_south_ward_3', (SELECT id FROM constituencies WHERE code = 'teso_south'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso South Ward 4', 'teso_south_ward_4', (SELECT id FROM constituencies WHERE code = 'teso_south'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Teso South Ward 5', 'teso_south_ward_5', (SELECT id FROM constituencies WHERE code = 'teso_south'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'teso_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nambale Ward 1', 'nambale_ward_1', (SELECT id FROM constituencies WHERE code = 'nambale'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nambale_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nambale Ward 2', 'nambale_ward_2', (SELECT id FROM constituencies WHERE code = 'nambale'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nambale_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nambale Ward 3', 'nambale_ward_3', (SELECT id FROM constituencies WHERE code = 'nambale'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nambale_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nambale Ward 4', 'nambale_ward_4', (SELECT id FROM constituencies WHERE code = 'nambale'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nambale_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nambale Ward 5', 'nambale_ward_5', (SELECT id FROM constituencies WHERE code = 'nambale'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nambale_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matayos Ward 1', 'matayos_ward_1', (SELECT id FROM constituencies WHERE code = 'matayos'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matayos_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matayos Ward 2', 'matayos_ward_2', (SELECT id FROM constituencies WHERE code = 'matayos'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matayos_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matayos Ward 3', 'matayos_ward_3', (SELECT id FROM constituencies WHERE code = 'matayos'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matayos_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matayos Ward 4', 'matayos_ward_4', (SELECT id FROM constituencies WHERE code = 'matayos'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matayos_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Matayos Ward 5', 'matayos_ward_5', (SELECT id FROM constituencies WHERE code = 'matayos'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'matayos_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butula Ward 1', 'butula_ward_1', (SELECT id FROM constituencies WHERE code = 'butula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butula_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butula Ward 2', 'butula_ward_2', (SELECT id FROM constituencies WHERE code = 'butula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butula_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butula Ward 3', 'butula_ward_3', (SELECT id FROM constituencies WHERE code = 'butula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butula_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butula Ward 4', 'butula_ward_4', (SELECT id FROM constituencies WHERE code = 'butula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butula_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Butula Ward 5', 'butula_ward_5', (SELECT id FROM constituencies WHERE code = 'butula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'butula_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Funyula Ward 1', 'funyula_ward_1', (SELECT id FROM constituencies WHERE code = 'funyula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'funyula_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Funyula Ward 2', 'funyula_ward_2', (SELECT id FROM constituencies WHERE code = 'funyula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'funyula_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Funyula Ward 3', 'funyula_ward_3', (SELECT id FROM constituencies WHERE code = 'funyula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'funyula_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Funyula Ward 4', 'funyula_ward_4', (SELECT id FROM constituencies WHERE code = 'funyula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'funyula_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Funyula Ward 5', 'funyula_ward_5', (SELECT id FROM constituencies WHERE code = 'funyula'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'funyula_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Budalangi Ward 1', 'budalangi_ward_1', (SELECT id FROM constituencies WHERE code = 'budalangi'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'budalangi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Budalangi Ward 2', 'budalangi_ward_2', (SELECT id FROM constituencies WHERE code = 'budalangi'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'budalangi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Budalangi Ward 3', 'budalangi_ward_3', (SELECT id FROM constituencies WHERE code = 'budalangi'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'budalangi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Budalangi Ward 4', 'budalangi_ward_4', (SELECT id FROM constituencies WHERE code = 'budalangi'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'budalangi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Budalangi Ward 5', 'budalangi_ward_5', (SELECT id FROM constituencies WHERE code = 'budalangi'), (SELECT id FROM counties WHERE code = 'busia_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'budalangi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugenya Ward 1', 'ugenya_ward_1', (SELECT id FROM constituencies WHERE code = 'ugenya'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugenya_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugenya Ward 2', 'ugenya_ward_2', (SELECT id FROM constituencies WHERE code = 'ugenya'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugenya_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugenya Ward 3', 'ugenya_ward_3', (SELECT id FROM constituencies WHERE code = 'ugenya'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugenya_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugenya Ward 4', 'ugenya_ward_4', (SELECT id FROM constituencies WHERE code = 'ugenya'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugenya_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugenya Ward 5', 'ugenya_ward_5', (SELECT id FROM constituencies WHERE code = 'ugenya'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugenya_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugunja Ward 1', 'ugunja_ward_1', (SELECT id FROM constituencies WHERE code = 'ugunja'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugunja_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugunja Ward 2', 'ugunja_ward_2', (SELECT id FROM constituencies WHERE code = 'ugunja'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugunja_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugunja Ward 3', 'ugunja_ward_3', (SELECT id FROM constituencies WHERE code = 'ugunja'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugunja_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugunja Ward 4', 'ugunja_ward_4', (SELECT id FROM constituencies WHERE code = 'ugunja'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugunja_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ugunja Ward 5', 'ugunja_ward_5', (SELECT id FROM constituencies WHERE code = 'ugunja'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ugunja_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Alego Usonga Ward 1', 'alego_usonga_ward_1', (SELECT id FROM constituencies WHERE code = 'alego_usonga'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'alego_usonga_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Alego Usonga Ward 2', 'alego_usonga_ward_2', (SELECT id FROM constituencies WHERE code = 'alego_usonga'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'alego_usonga_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Alego Usonga Ward 3', 'alego_usonga_ward_3', (SELECT id FROM constituencies WHERE code = 'alego_usonga'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'alego_usonga_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Alego Usonga Ward 4', 'alego_usonga_ward_4', (SELECT id FROM constituencies WHERE code = 'alego_usonga'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'alego_usonga_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Alego Usonga Ward 5', 'alego_usonga_ward_5', (SELECT id FROM constituencies WHERE code = 'alego_usonga'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'alego_usonga_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gem Ward 1', 'gem_ward_1', (SELECT id FROM constituencies WHERE code = 'gem'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gem_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gem Ward 2', 'gem_ward_2', (SELECT id FROM constituencies WHERE code = 'gem'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gem_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gem Ward 3', 'gem_ward_3', (SELECT id FROM constituencies WHERE code = 'gem'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gem_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gem Ward 4', 'gem_ward_4', (SELECT id FROM constituencies WHERE code = 'gem'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gem_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Gem Ward 5', 'gem_ward_5', (SELECT id FROM constituencies WHERE code = 'gem'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'gem_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bondo Ward 1', 'bondo_ward_1', (SELECT id FROM constituencies WHERE code = 'bondo'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bondo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bondo Ward 2', 'bondo_ward_2', (SELECT id FROM constituencies WHERE code = 'bondo'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bondo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bondo Ward 3', 'bondo_ward_3', (SELECT id FROM constituencies WHERE code = 'bondo'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bondo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bondo Ward 4', 'bondo_ward_4', (SELECT id FROM constituencies WHERE code = 'bondo'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bondo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bondo Ward 5', 'bondo_ward_5', (SELECT id FROM constituencies WHERE code = 'bondo'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bondo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rarieda Ward 1', 'rarieda_ward_1', (SELECT id FROM constituencies WHERE code = 'rarieda'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rarieda_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rarieda Ward 2', 'rarieda_ward_2', (SELECT id FROM constituencies WHERE code = 'rarieda'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rarieda_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rarieda Ward 3', 'rarieda_ward_3', (SELECT id FROM constituencies WHERE code = 'rarieda'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rarieda_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rarieda Ward 4', 'rarieda_ward_4', (SELECT id FROM constituencies WHERE code = 'rarieda'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rarieda_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rarieda Ward 5', 'rarieda_ward_5', (SELECT id FROM constituencies WHERE code = 'rarieda'), (SELECT id FROM counties WHERE code = 'siaya_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rarieda_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu East Ward 1', 'kisumu_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kisumu_east'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu East Ward 2', 'kisumu_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kisumu_east'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu East Ward 3', 'kisumu_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kisumu_east'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu East Ward 4', 'kisumu_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kisumu_east'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu East Ward 5', 'kisumu_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kisumu_east'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu West Ward 1', 'kisumu_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kisumu_west'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu West Ward 2', 'kisumu_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kisumu_west'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu West Ward 3', 'kisumu_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kisumu_west'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu West Ward 4', 'kisumu_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kisumu_west'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu West Ward 5', 'kisumu_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kisumu_west'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyalenda B', 'nyalenda_b', (SELECT id FROM constituencies WHERE code = 'kisumu_central'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyalenda_b');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu Central Ward 2', 'kisumu_central_ward_2', (SELECT id FROM constituencies WHERE code = 'kisumu_central'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu Central Ward 3', 'kisumu_central_ward_3', (SELECT id FROM constituencies WHERE code = 'kisumu_central'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu Central Ward 4', 'kisumu_central_ward_4', (SELECT id FROM constituencies WHERE code = 'kisumu_central'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kisumu Central Ward 5', 'kisumu_central_ward_5', (SELECT id FROM constituencies WHERE code = 'kisumu_central'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kisumu_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Seme Ward 1', 'seme_ward_1', (SELECT id FROM constituencies WHERE code = 'seme'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'seme_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Seme Ward 2', 'seme_ward_2', (SELECT id FROM constituencies WHERE code = 'seme'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'seme_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Seme Ward 3', 'seme_ward_3', (SELECT id FROM constituencies WHERE code = 'seme'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'seme_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Seme Ward 4', 'seme_ward_4', (SELECT id FROM constituencies WHERE code = 'seme'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'seme_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Seme Ward 5', 'seme_ward_5', (SELECT id FROM constituencies WHERE code = 'seme'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'seme_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyando Ward 1', 'nyando_ward_1', (SELECT id FROM constituencies WHERE code = 'nyando'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyando_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyando Ward 2', 'nyando_ward_2', (SELECT id FROM constituencies WHERE code = 'nyando'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyando_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyando Ward 3', 'nyando_ward_3', (SELECT id FROM constituencies WHERE code = 'nyando'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyando_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyando Ward 4', 'nyando_ward_4', (SELECT id FROM constituencies WHERE code = 'nyando'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyando_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyando Ward 5', 'nyando_ward_5', (SELECT id FROM constituencies WHERE code = 'nyando'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyando_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Muhoroni Ward 1', 'muhoroni_ward_1', (SELECT id FROM constituencies WHERE code = 'muhoroni'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'muhoroni_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Muhoroni Ward 2', 'muhoroni_ward_2', (SELECT id FROM constituencies WHERE code = 'muhoroni'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'muhoroni_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Muhoroni Ward 3', 'muhoroni_ward_3', (SELECT id FROM constituencies WHERE code = 'muhoroni'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'muhoroni_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Muhoroni Ward 4', 'muhoroni_ward_4', (SELECT id FROM constituencies WHERE code = 'muhoroni'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'muhoroni_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Muhoroni Ward 5', 'muhoroni_ward_5', (SELECT id FROM constituencies WHERE code = 'muhoroni'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'muhoroni_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyakach Ward 1', 'nyakach_ward_1', (SELECT id FROM constituencies WHERE code = 'nyakach'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyakach_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyakach Ward 2', 'nyakach_ward_2', (SELECT id FROM constituencies WHERE code = 'nyakach'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyakach_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyakach Ward 3', 'nyakach_ward_3', (SELECT id FROM constituencies WHERE code = 'nyakach'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyakach_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyakach Ward 4', 'nyakach_ward_4', (SELECT id FROM constituencies WHERE code = 'nyakach'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyakach_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyakach Ward 5', 'nyakach_ward_5', (SELECT id FROM constituencies WHERE code = 'nyakach'), (SELECT id FROM counties WHERE code = 'kisumu_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyakach_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasipul Ward 1', 'kasipul_ward_1', (SELECT id FROM constituencies WHERE code = 'kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasipul_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasipul Ward 2', 'kasipul_ward_2', (SELECT id FROM constituencies WHERE code = 'kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasipul_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasipul Ward 3', 'kasipul_ward_3', (SELECT id FROM constituencies WHERE code = 'kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasipul_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasipul Ward 4', 'kasipul_ward_4', (SELECT id FROM constituencies WHERE code = 'kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasipul_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasipul Ward 5', 'kasipul_ward_5', (SELECT id FROM constituencies WHERE code = 'kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasipul_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabondo Kasipul Ward 1', 'kabondo_kasipul_ward_1', (SELECT id FROM constituencies WHERE code = 'kabondo_kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabondo_kasipul_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabondo Kasipul Ward 2', 'kabondo_kasipul_ward_2', (SELECT id FROM constituencies WHERE code = 'kabondo_kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabondo_kasipul_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabondo Kasipul Ward 3', 'kabondo_kasipul_ward_3', (SELECT id FROM constituencies WHERE code = 'kabondo_kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabondo_kasipul_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabondo Kasipul Ward 4', 'kabondo_kasipul_ward_4', (SELECT id FROM constituencies WHERE code = 'kabondo_kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabondo_kasipul_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kabondo Kasipul Ward 5', 'kabondo_kasipul_ward_5', (SELECT id FROM constituencies WHERE code = 'kabondo_kasipul'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kabondo_kasipul_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Karachuonyo Ward 1', 'karachuonyo_ward_1', (SELECT id FROM constituencies WHERE code = 'karachuonyo'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'karachuonyo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Karachuonyo Ward 2', 'karachuonyo_ward_2', (SELECT id FROM constituencies WHERE code = 'karachuonyo'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'karachuonyo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Karachuonyo Ward 3', 'karachuonyo_ward_3', (SELECT id FROM constituencies WHERE code = 'karachuonyo'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'karachuonyo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Karachuonyo Ward 4', 'karachuonyo_ward_4', (SELECT id FROM constituencies WHERE code = 'karachuonyo'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'karachuonyo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Karachuonyo Ward 5', 'karachuonyo_ward_5', (SELECT id FROM constituencies WHERE code = 'karachuonyo'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'karachuonyo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rangwe Ward 1', 'rangwe_ward_1', (SELECT id FROM constituencies WHERE code = 'rangwe'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rangwe_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rangwe Ward 2', 'rangwe_ward_2', (SELECT id FROM constituencies WHERE code = 'rangwe'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rangwe_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rangwe Ward 3', 'rangwe_ward_3', (SELECT id FROM constituencies WHERE code = 'rangwe'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rangwe_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rangwe Ward 4', 'rangwe_ward_4', (SELECT id FROM constituencies WHERE code = 'rangwe'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rangwe_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rangwe Ward 5', 'rangwe_ward_5', (SELECT id FROM constituencies WHERE code = 'rangwe'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rangwe_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Homa Bay Town Ward 1', 'homa_bay_town_ward_1', (SELECT id FROM constituencies WHERE code = 'homa_bay_town'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'homa_bay_town_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Homa Bay Town Ward 2', 'homa_bay_town_ward_2', (SELECT id FROM constituencies WHERE code = 'homa_bay_town'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'homa_bay_town_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Homa Bay Town Ward 3', 'homa_bay_town_ward_3', (SELECT id FROM constituencies WHERE code = 'homa_bay_town'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'homa_bay_town_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Homa Bay Town Ward 4', 'homa_bay_town_ward_4', (SELECT id FROM constituencies WHERE code = 'homa_bay_town'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'homa_bay_town_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Homa Bay Town Ward 5', 'homa_bay_town_ward_5', (SELECT id FROM constituencies WHERE code = 'homa_bay_town'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'homa_bay_town_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndhiwa Ward 1', 'ndhiwa_ward_1', (SELECT id FROM constituencies WHERE code = 'ndhiwa'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndhiwa_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndhiwa Ward 2', 'ndhiwa_ward_2', (SELECT id FROM constituencies WHERE code = 'ndhiwa'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndhiwa_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndhiwa Ward 3', 'ndhiwa_ward_3', (SELECT id FROM constituencies WHERE code = 'ndhiwa'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndhiwa_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndhiwa Ward 4', 'ndhiwa_ward_4', (SELECT id FROM constituencies WHERE code = 'ndhiwa'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndhiwa_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ndhiwa Ward 5', 'ndhiwa_ward_5', (SELECT id FROM constituencies WHERE code = 'ndhiwa'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ndhiwa_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba North Ward 1', 'suba_north_ward_1', (SELECT id FROM constituencies WHERE code = 'suba_north'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba North Ward 2', 'suba_north_ward_2', (SELECT id FROM constituencies WHERE code = 'suba_north'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba North Ward 3', 'suba_north_ward_3', (SELECT id FROM constituencies WHERE code = 'suba_north'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba North Ward 4', 'suba_north_ward_4', (SELECT id FROM constituencies WHERE code = 'suba_north'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba North Ward 5', 'suba_north_ward_5', (SELECT id FROM constituencies WHERE code = 'suba_north'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba South Ward 1', 'suba_south_ward_1', (SELECT id FROM constituencies WHERE code = 'suba_south'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba South Ward 2', 'suba_south_ward_2', (SELECT id FROM constituencies WHERE code = 'suba_south'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba South Ward 3', 'suba_south_ward_3', (SELECT id FROM constituencies WHERE code = 'suba_south'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba South Ward 4', 'suba_south_ward_4', (SELECT id FROM constituencies WHERE code = 'suba_south'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suba South Ward 5', 'suba_south_ward_5', (SELECT id FROM constituencies WHERE code = 'suba_south'), (SELECT id FROM counties WHERE code = 'homa_bay_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suba_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongo Ward 1', 'rongo_ward_1', (SELECT id FROM constituencies WHERE code = 'rongo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongo Ward 2', 'rongo_ward_2', (SELECT id FROM constituencies WHERE code = 'rongo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongo Ward 3', 'rongo_ward_3', (SELECT id FROM constituencies WHERE code = 'rongo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongo Ward 4', 'rongo_ward_4', (SELECT id FROM constituencies WHERE code = 'rongo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Rongo Ward 5', 'rongo_ward_5', (SELECT id FROM constituencies WHERE code = 'rongo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'rongo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Awendo Ward 1', 'awendo_ward_1', (SELECT id FROM constituencies WHERE code = 'awendo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'awendo_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Awendo Ward 2', 'awendo_ward_2', (SELECT id FROM constituencies WHERE code = 'awendo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'awendo_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Awendo Ward 3', 'awendo_ward_3', (SELECT id FROM constituencies WHERE code = 'awendo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'awendo_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Awendo Ward 4', 'awendo_ward_4', (SELECT id FROM constituencies WHERE code = 'awendo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'awendo_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Awendo Ward 5', 'awendo_ward_5', (SELECT id FROM constituencies WHERE code = 'awendo'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'awendo_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna East Ward 1', 'suna_east_ward_1', (SELECT id FROM constituencies WHERE code = 'suna_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna East Ward 2', 'suna_east_ward_2', (SELECT id FROM constituencies WHERE code = 'suna_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna East Ward 3', 'suna_east_ward_3', (SELECT id FROM constituencies WHERE code = 'suna_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna East Ward 4', 'suna_east_ward_4', (SELECT id FROM constituencies WHERE code = 'suna_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna East Ward 5', 'suna_east_ward_5', (SELECT id FROM constituencies WHERE code = 'suna_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna West Ward 1', 'suna_west_ward_1', (SELECT id FROM constituencies WHERE code = 'suna_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna West Ward 2', 'suna_west_ward_2', (SELECT id FROM constituencies WHERE code = 'suna_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna West Ward 3', 'suna_west_ward_3', (SELECT id FROM constituencies WHERE code = 'suna_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna West Ward 4', 'suna_west_ward_4', (SELECT id FROM constituencies WHERE code = 'suna_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Suna West Ward 5', 'suna_west_ward_5', (SELECT id FROM constituencies WHERE code = 'suna_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'suna_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Uriri Ward 1', 'uriri_ward_1', (SELECT id FROM constituencies WHERE code = 'uriri'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'uriri_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Uriri Ward 2', 'uriri_ward_2', (SELECT id FROM constituencies WHERE code = 'uriri'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'uriri_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Uriri Ward 3', 'uriri_ward_3', (SELECT id FROM constituencies WHERE code = 'uriri'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'uriri_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Uriri Ward 4', 'uriri_ward_4', (SELECT id FROM constituencies WHERE code = 'uriri'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'uriri_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Uriri Ward 5', 'uriri_ward_5', (SELECT id FROM constituencies WHERE code = 'uriri'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'uriri_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyatike Ward 1', 'nyatike_ward_1', (SELECT id FROM constituencies WHERE code = 'nyatike'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyatike_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyatike Ward 2', 'nyatike_ward_2', (SELECT id FROM constituencies WHERE code = 'nyatike'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyatike_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyatike Ward 3', 'nyatike_ward_3', (SELECT id FROM constituencies WHERE code = 'nyatike'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyatike_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyatike Ward 4', 'nyatike_ward_4', (SELECT id FROM constituencies WHERE code = 'nyatike'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyatike_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyatike Ward 5', 'nyatike_ward_5', (SELECT id FROM constituencies WHERE code = 'nyatike'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyatike_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria West Ward 1', 'kuria_west_ward_1', (SELECT id FROM constituencies WHERE code = 'kuria_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria West Ward 2', 'kuria_west_ward_2', (SELECT id FROM constituencies WHERE code = 'kuria_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria West Ward 3', 'kuria_west_ward_3', (SELECT id FROM constituencies WHERE code = 'kuria_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria West Ward 4', 'kuria_west_ward_4', (SELECT id FROM constituencies WHERE code = 'kuria_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria West Ward 5', 'kuria_west_ward_5', (SELECT id FROM constituencies WHERE code = 'kuria_west'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria East Ward 1', 'kuria_east_ward_1', (SELECT id FROM constituencies WHERE code = 'kuria_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria East Ward 2', 'kuria_east_ward_2', (SELECT id FROM constituencies WHERE code = 'kuria_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria East Ward 3', 'kuria_east_ward_3', (SELECT id FROM constituencies WHERE code = 'kuria_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria East Ward 4', 'kuria_east_ward_4', (SELECT id FROM constituencies WHERE code = 'kuria_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kuria East Ward 5', 'kuria_east_ward_5', (SELECT id FROM constituencies WHERE code = 'kuria_east'), (SELECT id FROM counties WHERE code = 'migori_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kuria_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bonchari Ward 1', 'bonchari_ward_1', (SELECT id FROM constituencies WHERE code = 'bonchari'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bonchari_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bonchari Ward 2', 'bonchari_ward_2', (SELECT id FROM constituencies WHERE code = 'bonchari'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bonchari_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bonchari Ward 3', 'bonchari_ward_3', (SELECT id FROM constituencies WHERE code = 'bonchari'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bonchari_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bonchari Ward 4', 'bonchari_ward_4', (SELECT id FROM constituencies WHERE code = 'bonchari'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bonchari_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bonchari Ward 5', 'bonchari_ward_5', (SELECT id FROM constituencies WHERE code = 'bonchari'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bonchari_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Mugirango Ward 1', 'south_mugirango_ward_1', (SELECT id FROM constituencies WHERE code = 'south_mugirango'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_mugirango_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Mugirango Ward 2', 'south_mugirango_ward_2', (SELECT id FROM constituencies WHERE code = 'south_mugirango'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_mugirango_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Mugirango Ward 3', 'south_mugirango_ward_3', (SELECT id FROM constituencies WHERE code = 'south_mugirango'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_mugirango_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Mugirango Ward 4', 'south_mugirango_ward_4', (SELECT id FROM constituencies WHERE code = 'south_mugirango'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_mugirango_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'South Mugirango Ward 5', 'south_mugirango_ward_5', (SELECT id FROM constituencies WHERE code = 'south_mugirango'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'south_mugirango_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Borabu Ward 1', 'bomachoge_borabu_ward_1', (SELECT id FROM constituencies WHERE code = 'bomachoge_borabu'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_borabu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Borabu Ward 2', 'bomachoge_borabu_ward_2', (SELECT id FROM constituencies WHERE code = 'bomachoge_borabu'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_borabu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Borabu Ward 3', 'bomachoge_borabu_ward_3', (SELECT id FROM constituencies WHERE code = 'bomachoge_borabu'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_borabu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Borabu Ward 4', 'bomachoge_borabu_ward_4', (SELECT id FROM constituencies WHERE code = 'bomachoge_borabu'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_borabu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Borabu Ward 5', 'bomachoge_borabu_ward_5', (SELECT id FROM constituencies WHERE code = 'bomachoge_borabu'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_borabu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bobasi Ward 1', 'bobasi_ward_1', (SELECT id FROM constituencies WHERE code = 'bobasi'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bobasi_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bobasi Ward 2', 'bobasi_ward_2', (SELECT id FROM constituencies WHERE code = 'bobasi'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bobasi_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bobasi Ward 3', 'bobasi_ward_3', (SELECT id FROM constituencies WHERE code = 'bobasi'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bobasi_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bobasi Ward 4', 'bobasi_ward_4', (SELECT id FROM constituencies WHERE code = 'bobasi'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bobasi_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bobasi Ward 5', 'bobasi_ward_5', (SELECT id FROM constituencies WHERE code = 'bobasi'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bobasi_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Chache Ward 1', 'bomachoge_chache_ward_1', (SELECT id FROM constituencies WHERE code = 'bomachoge_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_chache_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Chache Ward 2', 'bomachoge_chache_ward_2', (SELECT id FROM constituencies WHERE code = 'bomachoge_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_chache_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Chache Ward 3', 'bomachoge_chache_ward_3', (SELECT id FROM constituencies WHERE code = 'bomachoge_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_chache_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Chache Ward 4', 'bomachoge_chache_ward_4', (SELECT id FROM constituencies WHERE code = 'bomachoge_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_chache_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Bomachoge Chache Ward 5', 'bomachoge_chache_ward_5', (SELECT id FROM constituencies WHERE code = 'bomachoge_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'bomachoge_chache_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Masaba Ward 1', 'nyaribari_masaba_ward_1', (SELECT id FROM constituencies WHERE code = 'nyaribari_masaba'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_masaba_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Masaba Ward 2', 'nyaribari_masaba_ward_2', (SELECT id FROM constituencies WHERE code = 'nyaribari_masaba'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_masaba_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Masaba Ward 3', 'nyaribari_masaba_ward_3', (SELECT id FROM constituencies WHERE code = 'nyaribari_masaba'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_masaba_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Masaba Ward 4', 'nyaribari_masaba_ward_4', (SELECT id FROM constituencies WHERE code = 'nyaribari_masaba'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_masaba_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Masaba Ward 5', 'nyaribari_masaba_ward_5', (SELECT id FROM constituencies WHERE code = 'nyaribari_masaba'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_masaba_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Chache Ward 1', 'nyaribari_chache_ward_1', (SELECT id FROM constituencies WHERE code = 'nyaribari_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_chache_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Chache Ward 2', 'nyaribari_chache_ward_2', (SELECT id FROM constituencies WHERE code = 'nyaribari_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_chache_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Chache Ward 3', 'nyaribari_chache_ward_3', (SELECT id FROM constituencies WHERE code = 'nyaribari_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_chache_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Chache Ward 4', 'nyaribari_chache_ward_4', (SELECT id FROM constituencies WHERE code = 'nyaribari_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_chache_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Nyaribari Chache Ward 5', 'nyaribari_chache_ward_5', (SELECT id FROM constituencies WHERE code = 'nyaribari_chache'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'nyaribari_chache_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache North Ward 1', 'kitutu_chache_north_ward_1', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_north'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache North Ward 2', 'kitutu_chache_north_ward_2', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_north'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache North Ward 3', 'kitutu_chache_north_ward_3', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_north'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache North Ward 4', 'kitutu_chache_north_ward_4', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_north'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache North Ward 5', 'kitutu_chache_north_ward_5', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_north'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache South Ward 1', 'kitutu_chache_south_ward_1', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_south'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache South Ward 2', 'kitutu_chache_south_ward_2', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_south'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache South Ward 3', 'kitutu_chache_south_ward_3', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_south'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache South Ward 4', 'kitutu_chache_south_ward_4', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_south'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Chache South Ward 5', 'kitutu_chache_south_ward_5', (SELECT id FROM constituencies WHERE code = 'kitutu_chache_south'), (SELECT id FROM counties WHERE code = 'kisii_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_chache_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Masaba Ward 1', 'kitutu_masaba_ward_1', (SELECT id FROM constituencies WHERE code = 'kitutu_masaba'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_masaba_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Masaba Ward 2', 'kitutu_masaba_ward_2', (SELECT id FROM constituencies WHERE code = 'kitutu_masaba'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_masaba_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Masaba Ward 3', 'kitutu_masaba_ward_3', (SELECT id FROM constituencies WHERE code = 'kitutu_masaba'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_masaba_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Masaba Ward 4', 'kitutu_masaba_ward_4', (SELECT id FROM constituencies WHERE code = 'kitutu_masaba'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_masaba_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitutu Masaba Ward 5', 'kitutu_masaba_ward_5', (SELECT id FROM constituencies WHERE code = 'kitutu_masaba'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitutu_masaba_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'West Mugirango Ward 1', 'west_mugirango_ward_1', (SELECT id FROM constituencies WHERE code = 'west_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'west_mugirango_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'West Mugirango Ward 2', 'west_mugirango_ward_2', (SELECT id FROM constituencies WHERE code = 'west_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'west_mugirango_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'West Mugirango Ward 3', 'west_mugirango_ward_3', (SELECT id FROM constituencies WHERE code = 'west_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'west_mugirango_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'West Mugirango Ward 4', 'west_mugirango_ward_4', (SELECT id FROM constituencies WHERE code = 'west_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'west_mugirango_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'West Mugirango Ward 5', 'west_mugirango_ward_5', (SELECT id FROM constituencies WHERE code = 'west_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'west_mugirango_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Mugirango Ward 1', 'north_mugirango_ward_1', (SELECT id FROM constituencies WHERE code = 'north_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_mugirango_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Mugirango Ward 2', 'north_mugirango_ward_2', (SELECT id FROM constituencies WHERE code = 'north_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_mugirango_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Mugirango Ward 3', 'north_mugirango_ward_3', (SELECT id FROM constituencies WHERE code = 'north_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_mugirango_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Mugirango Ward 4', 'north_mugirango_ward_4', (SELECT id FROM constituencies WHERE code = 'north_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_mugirango_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'North Mugirango Ward 5', 'north_mugirango_ward_5', (SELECT id FROM constituencies WHERE code = 'north_mugirango'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'north_mugirango_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Borabu Ward 1', 'borabu_ward_1', (SELECT id FROM constituencies WHERE code = 'borabu'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'borabu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Borabu Ward 2', 'borabu_ward_2', (SELECT id FROM constituencies WHERE code = 'borabu'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'borabu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Borabu Ward 3', 'borabu_ward_3', (SELECT id FROM constituencies WHERE code = 'borabu'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'borabu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Borabu Ward 4', 'borabu_ward_4', (SELECT id FROM constituencies WHERE code = 'borabu'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'borabu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Borabu Ward 5', 'borabu_ward_5', (SELECT id FROM constituencies WHERE code = 'borabu'), (SELECT id FROM counties WHERE code = 'nyamira_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'borabu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Westlands Ward 1', 'westlands_ward_1', (SELECT id FROM constituencies WHERE code = 'westlands'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'westlands_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Westlands Ward 2', 'westlands_ward_2', (SELECT id FROM constituencies WHERE code = 'westlands'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'westlands_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Westlands Ward 3', 'westlands_ward_3', (SELECT id FROM constituencies WHERE code = 'westlands'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'westlands_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Westlands Ward 4', 'westlands_ward_4', (SELECT id FROM constituencies WHERE code = 'westlands'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'westlands_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Westlands Ward 5', 'westlands_ward_5', (SELECT id FROM constituencies WHERE code = 'westlands'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'westlands_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitisuru Ward 1', 'kitisuru_ward_1', (SELECT id FROM constituencies WHERE code = 'kitisuru'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitisuru_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitisuru Ward 2', 'kitisuru_ward_2', (SELECT id FROM constituencies WHERE code = 'kitisuru'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitisuru_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitisuru Ward 3', 'kitisuru_ward_3', (SELECT id FROM constituencies WHERE code = 'kitisuru'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitisuru_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitisuru Ward 4', 'kitisuru_ward_4', (SELECT id FROM constituencies WHERE code = 'kitisuru'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitisuru_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kitisuru Ward 5', 'kitisuru_ward_5', (SELECT id FROM constituencies WHERE code = 'kitisuru'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kitisuru_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kawangware', 'kawangware', (SELECT id FROM constituencies WHERE code = 'dagoretti_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kawangware');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti North Ward 2', 'dagoretti_north_ward_2', (SELECT id FROM constituencies WHERE code = 'dagoretti_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti North Ward 3', 'dagoretti_north_ward_3', (SELECT id FROM constituencies WHERE code = 'dagoretti_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti North Ward 4', 'dagoretti_north_ward_4', (SELECT id FROM constituencies WHERE code = 'dagoretti_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti North Ward 5', 'dagoretti_north_ward_5', (SELECT id FROM constituencies WHERE code = 'dagoretti_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti South Ward 1', 'dagoretti_south_ward_1', (SELECT id FROM constituencies WHERE code = 'dagoretti_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti South Ward 2', 'dagoretti_south_ward_2', (SELECT id FROM constituencies WHERE code = 'dagoretti_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti South Ward 3', 'dagoretti_south_ward_3', (SELECT id FROM constituencies WHERE code = 'dagoretti_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti South Ward 4', 'dagoretti_south_ward_4', (SELECT id FROM constituencies WHERE code = 'dagoretti_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Dagoretti South Ward 5', 'dagoretti_south_ward_5', (SELECT id FROM constituencies WHERE code = 'dagoretti_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'dagoretti_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lang''ata Ward 1', 'lang_ata_ward_1', (SELECT id FROM constituencies WHERE code = 'lang_ata'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lang_ata_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lang''ata Ward 2', 'lang_ata_ward_2', (SELECT id FROM constituencies WHERE code = 'lang_ata'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lang_ata_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lang''ata Ward 3', 'lang_ata_ward_3', (SELECT id FROM constituencies WHERE code = 'lang_ata'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lang_ata_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lang''ata Ward 4', 'lang_ata_ward_4', (SELECT id FROM constituencies WHERE code = 'lang_ata'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lang_ata_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Lang''ata Ward 5', 'lang_ata_ward_5', (SELECT id FROM constituencies WHERE code = 'lang_ata'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'lang_ata_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibra Ward 1', 'kibra_ward_1', (SELECT id FROM constituencies WHERE code = 'kibra'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibra_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibra Ward 2', 'kibra_ward_2', (SELECT id FROM constituencies WHERE code = 'kibra'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibra_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibra Ward 3', 'kibra_ward_3', (SELECT id FROM constituencies WHERE code = 'kibra'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibra_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibra Ward 4', 'kibra_ward_4', (SELECT id FROM constituencies WHERE code = 'kibra'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibra_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kibra Ward 5', 'kibra_ward_5', (SELECT id FROM constituencies WHERE code = 'kibra'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kibra_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Roysambu Ward 1', 'roysambu_ward_1', (SELECT id FROM constituencies WHERE code = 'roysambu'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'roysambu_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Roysambu Ward 2', 'roysambu_ward_2', (SELECT id FROM constituencies WHERE code = 'roysambu'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'roysambu_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Roysambu Ward 3', 'roysambu_ward_3', (SELECT id FROM constituencies WHERE code = 'roysambu'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'roysambu_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Roysambu Ward 4', 'roysambu_ward_4', (SELECT id FROM constituencies WHERE code = 'roysambu'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'roysambu_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Roysambu Ward 5', 'roysambu_ward_5', (SELECT id FROM constituencies WHERE code = 'roysambu'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'roysambu_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasarani Ward 1', 'kasarani_ward_1', (SELECT id FROM constituencies WHERE code = 'kasarani'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasarani_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasarani Ward 2', 'kasarani_ward_2', (SELECT id FROM constituencies WHERE code = 'kasarani'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasarani_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasarani Ward 3', 'kasarani_ward_3', (SELECT id FROM constituencies WHERE code = 'kasarani'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasarani_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasarani Ward 4', 'kasarani_ward_4', (SELECT id FROM constituencies WHERE code = 'kasarani'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasarani_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kasarani Ward 5', 'kasarani_ward_5', (SELECT id FROM constituencies WHERE code = 'kasarani'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kasarani_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruaraka Ward 1', 'ruaraka_ward_1', (SELECT id FROM constituencies WHERE code = 'ruaraka'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruaraka_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruaraka Ward 2', 'ruaraka_ward_2', (SELECT id FROM constituencies WHERE code = 'ruaraka'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruaraka_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruaraka Ward 3', 'ruaraka_ward_3', (SELECT id FROM constituencies WHERE code = 'ruaraka'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruaraka_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruaraka Ward 4', 'ruaraka_ward_4', (SELECT id FROM constituencies WHERE code = 'ruaraka'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruaraka_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Ruaraka Ward 5', 'ruaraka_ward_5', (SELECT id FROM constituencies WHERE code = 'ruaraka'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'ruaraka_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi South Ward 1', 'embakasi_south_ward_1', (SELECT id FROM constituencies WHERE code = 'embakasi_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_south_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi South Ward 2', 'embakasi_south_ward_2', (SELECT id FROM constituencies WHERE code = 'embakasi_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_south_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi South Ward 3', 'embakasi_south_ward_3', (SELECT id FROM constituencies WHERE code = 'embakasi_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_south_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi South Ward 4', 'embakasi_south_ward_4', (SELECT id FROM constituencies WHERE code = 'embakasi_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_south_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi South Ward 5', 'embakasi_south_ward_5', (SELECT id FROM constituencies WHERE code = 'embakasi_south'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_south_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi North Ward 1', 'embakasi_north_ward_1', (SELECT id FROM constituencies WHERE code = 'embakasi_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_north_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi North Ward 2', 'embakasi_north_ward_2', (SELECT id FROM constituencies WHERE code = 'embakasi_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_north_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi North Ward 3', 'embakasi_north_ward_3', (SELECT id FROM constituencies WHERE code = 'embakasi_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_north_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi North Ward 4', 'embakasi_north_ward_4', (SELECT id FROM constituencies WHERE code = 'embakasi_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_north_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi North Ward 5', 'embakasi_north_ward_5', (SELECT id FROM constituencies WHERE code = 'embakasi_north'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_north_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi Central Ward 1', 'embakasi_central_ward_1', (SELECT id FROM constituencies WHERE code = 'embakasi_central'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_central_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi Central Ward 2', 'embakasi_central_ward_2', (SELECT id FROM constituencies WHERE code = 'embakasi_central'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_central_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi Central Ward 3', 'embakasi_central_ward_3', (SELECT id FROM constituencies WHERE code = 'embakasi_central'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_central_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi Central Ward 4', 'embakasi_central_ward_4', (SELECT id FROM constituencies WHERE code = 'embakasi_central'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_central_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi Central Ward 5', 'embakasi_central_ward_5', (SELECT id FROM constituencies WHERE code = 'embakasi_central'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_central_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi East Ward 1', 'embakasi_east_ward_1', (SELECT id FROM constituencies WHERE code = 'embakasi_east'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_east_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi East Ward 2', 'embakasi_east_ward_2', (SELECT id FROM constituencies WHERE code = 'embakasi_east'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_east_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi East Ward 3', 'embakasi_east_ward_3', (SELECT id FROM constituencies WHERE code = 'embakasi_east'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_east_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi East Ward 4', 'embakasi_east_ward_4', (SELECT id FROM constituencies WHERE code = 'embakasi_east'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_east_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi East Ward 5', 'embakasi_east_ward_5', (SELECT id FROM constituencies WHERE code = 'embakasi_east'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_east_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi West Ward 1', 'embakasi_west_ward_1', (SELECT id FROM constituencies WHERE code = 'embakasi_west'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_west_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi West Ward 2', 'embakasi_west_ward_2', (SELECT id FROM constituencies WHERE code = 'embakasi_west'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_west_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi West Ward 3', 'embakasi_west_ward_3', (SELECT id FROM constituencies WHERE code = 'embakasi_west'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_west_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi West Ward 4', 'embakasi_west_ward_4', (SELECT id FROM constituencies WHERE code = 'embakasi_west'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_west_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Embakasi West Ward 5', 'embakasi_west_ward_5', (SELECT id FROM constituencies WHERE code = 'embakasi_west'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'embakasi_west_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makadara Ward 1', 'makadara_ward_1', (SELECT id FROM constituencies WHERE code = 'makadara'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makadara_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makadara Ward 2', 'makadara_ward_2', (SELECT id FROM constituencies WHERE code = 'makadara'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makadara_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makadara Ward 3', 'makadara_ward_3', (SELECT id FROM constituencies WHERE code = 'makadara'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makadara_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makadara Ward 4', 'makadara_ward_4', (SELECT id FROM constituencies WHERE code = 'makadara'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makadara_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Makadara Ward 5', 'makadara_ward_5', (SELECT id FROM constituencies WHERE code = 'makadara'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'makadara_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kamukunji Ward 1', 'kamukunji_ward_1', (SELECT id FROM constituencies WHERE code = 'kamukunji'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kamukunji_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kamukunji Ward 2', 'kamukunji_ward_2', (SELECT id FROM constituencies WHERE code = 'kamukunji'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kamukunji_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kamukunji Ward 3', 'kamukunji_ward_3', (SELECT id FROM constituencies WHERE code = 'kamukunji'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kamukunji_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kamukunji Ward 4', 'kamukunji_ward_4', (SELECT id FROM constituencies WHERE code = 'kamukunji'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kamukunji_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Kamukunji Ward 5', 'kamukunji_ward_5', (SELECT id FROM constituencies WHERE code = 'kamukunji'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'kamukunji_ward_5');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Starehe Ward 1', 'starehe_ward_1', (SELECT id FROM constituencies WHERE code = 'starehe'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'starehe_ward_1');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Starehe Ward 2', 'starehe_ward_2', (SELECT id FROM constituencies WHERE code = 'starehe'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'starehe_ward_2');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Starehe Ward 3', 'starehe_ward_3', (SELECT id FROM constituencies WHERE code = 'starehe'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'starehe_ward_3');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Starehe Ward 4', 'starehe_ward_4', (SELECT id FROM constituencies WHERE code = 'starehe'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'starehe_ward_4');

INSERT INTO wards (name, ward_code, constituency_id, county_id)
SELECT 'Starehe Ward 5', 'starehe_ward_5', (SELECT id FROM constituencies WHERE code = 'starehe'), (SELECT id FROM counties WHERE code = 'nairobi_county')
WHERE NOT EXISTS (SELECT 1 FROM wards WHERE ward_code = 'starehe_ward_5');

COMMIT;