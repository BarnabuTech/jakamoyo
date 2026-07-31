/*
# Jakamoyo — Comprehensive Demo Seed Data for Hackathon Pitch

## Purpose
Comprehensive seed data (~80 submissions) across Kenya to demonstrate the full innovation of Jakamoyo
for the GDG Pwani hackathon. This showcases the multilingual AI platform that consolidates citizen
feedback and ranks high-priority development works using Gemma 4 analysis.

## Demo Features
- Multilingual submissions (English & Kiswahili) from 10+ counties
- AI analysis with category detection, priority scoring, and summaries
- Ranked project recommendations based on citizen demand
- Infrastructure gap integration
- Geographic hotspot mapping across Kenya
- Role-based demo accounts for all user types

## Geographic Coverage
- Nairobi (Urban, diverse needs)
- Mombasa (Coastal, water/transport)
- Kisumu (Lakeside, fishing/agriculture)
- Nakuru (Agriculture, education)
- Kiambu (Education, youth)
- Kakamega (Health, agriculture)
- Turkana (Water, pastoralism)
- Garissa (Water, health)
- Meru (Agriculture, roads)
- Kisii (Health, education)
*/

-- Insert demo user profiles
INSERT INTO profiles (id, full_name, role, county_id, constituency_id) VALUES
  (gen_random_uuid(), 'Ali Abdallah', 'CITIZEN', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL),
  (gen_random_uuid(), 'Hon. Fatma Ahmed', 'MP', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL),
  (gen_random_uuid(), 'David Kamau', 'ANALYST', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL),
  (gen_random_uuid(), 'Grace Wanjiku', 'CDF_MANAGER', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL)
ON CONFLICT (id) DO NOTHING;

-- Insert sample citizen submissions (multilingual - English & Kiswahili)
-- These demonstrate the core innovation: scattered citizen input being consolidated
-- 80+ submissions from 10+ counties across Kenya

INSERT INTO submissions (id, citizen_hash, title, description, language, county_id, constituency_id, ward_id, category_input, estimated_beneficiaries_input, status, created_at) VALUES
  -- MOMBASA COUNTY (Coastal region)
  (gen_random_uuid(), 'citizen_001', 'Primary School Classroom Upgrade', 
   'Our primary school in Nyali has over 80 students per classroom. The roof is leaking and we lack proper desks. Children are learning in very difficult conditions. We need at least 4 additional classrooms and furniture.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL, 
   (SELECT id FROM wards WHERE name LIKE '%Nyali%' AND county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) LIMIT 1), 
   'EDUCATION', '500 students', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_002', 'Maji ya Kuvunja Kikombe',
   'Tunakabiliwa na uhaba mkubwa wa maji safi eneo la Kisauni. Wanawake na watoto wanatembea umbali mrefu kupata maji. Tuhitaji kisima cha maji chini ya ardhi au bomba la maji la umma.',
   'sw', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kisauni%' THEN 0 ELSE 1 END, name LIMIT 1),
   'WATER', '2000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_003', 'Health Centre Equipment',
   'The local dispensary in Changamwe lacks basic medical equipment. No ultrasound machine, inadequate laboratory facilities, and shortage of essential medicines. Pregnant women have to travel to Mombasa town for basic checkups.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Changamwe%' AND county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) LIMIT 1),
   'HEALTH', '5000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_004', 'Barabara ya Likoni Ferry',
   'Barabara inayoelekea feri ya Likoni ni mbovu sana wakati wa mvua. Magari yanakwama na watu wanashindwa kufika kazini kwa wakati. Tuhitibu barabara hii na kujenga mabomba ya maji taka.',
   'sw', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Likoni%' AND county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) LIMIT 1),
   'ROADS', '10000 daily commuters', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_005', 'Youth Vocational Training Centre',
   'Many young people in Nyali are unemployed after completing secondary school. We need a vocational training centre to teach skills like computer literacy, tailoring, carpentry, and electrical work to create employment opportunities.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Nyali%' THEN 0 ELSE 1 END, name LIMIT 1),
   'YOUTH', '300 youth annually', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- NAIROBI COUNTY (Urban region)
  (gen_random_uuid(), 'citizen_006', 'Kibera Slum Sanitation Project',
   'The sanitation facilities in Kibera are inadequate. Open defecation is common due to lack of toilets. We need community toilet blocks and proper waste management systems to prevent disease outbreaks.',
   'en', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kibra%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'WATER', '50000 residents', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_007', 'Shule ya Msingi Mathare',
   'Shule ya Mathare ina wanafunzi 70 kila darasa. Hakuna madarasa ya kutosha na vifaa vya kujifunzia ni duni. Tunahitaji madarasa mapya na vitabu.',
   'sw', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Mathare%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '1000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_008', 'Eastleigh Youth Empowerment',
   'Youth in Eastleigh face high unemployment rates. We need a business incubation centre to support young entrepreneurs with training and micro-finance access.',
   'en', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Eastleigh%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'YOUTH', '500 youth', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_009', 'Duka la Dawa Dagoretti',
   'Duka la dawa la Dagoretti halina dawa za kutosha na wafanyakazi ni wachache. Watu wanatembea umbali mrefu kupata huduma za afya.',
   'sw', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Dagoretti%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'HEALTH', '30000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_010', 'Thika Road Traffic Management',
   'Traffic congestion on Thika Road is severe during peak hours. We need better traffic management systems and pedestrian bridges to improve commute times and safety.',
   'en', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kasarani%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'ROADS', '200000 daily commuters', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- KISUMU COUNTY (Lakeside region)
  (gen_random_uuid(), 'citizen_011', 'Lake Victoria Fishing Equipment',
   'Fishermen in Kisumu lack modern fishing equipment and cold storage facilities. Fish spoilage rates are high. We need cold storage units and modern fishing gear.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Manyatta%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '2000 fishermen', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_012', 'Maji ya Kisumu Rural',
   'Wakazi wa vijijini Kisumu wanatumia maji ya ziwa ambayo hayajasafishwa. Tunahitaji vituo vya usafishaji maji na bomba la maji la umma.',
   'sw', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Muhoroni%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'WATER', '15000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_013', 'Kisumu County Hospital Upgrade',
   'The county hospital lacks specialized equipment for treating waterborne diseases common in the region. We need laboratory upgrades and medical equipment.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kisumu Central%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'HEALTH', '100000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_014', 'Barabara ya Seme-Kisumu',
   'Barabara inayounganisha Seme na Kisumu ni mbovu sana wakati wa mvua. Wakulima wanashindwa kusafirisha mazao yao kwa wakati.',
   'sw', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Seme%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'ROADS', '5000 farmers', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_015', 'Youth ICT Training Centre',
   'Young people in Kisumu need digital skills training to access online jobs. We need an ICT training centre with internet connectivity.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nyando%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'ICT', '300 youth annually', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- NAKURU COUNTY (Agricultural region)
  (gen_random_uuid(), 'citizen_016', 'Nakuru Agricultural Extension Services',
   'Farmers in Nakuru need better extension services for modern farming techniques. We need agricultural training centres and demonstration farms.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nakuru Town%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '10000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_017', 'Shule za Upili Naivasha',
   'Shule za upili Naivasha zina uhaba wa walimu wa sayansi na maabara. Wanafunzi wanafanya vibaya katika mitihani ya kitaifa.',
   'sw', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Naivasha%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '5000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_018', 'Gilgil Health Centre Expansion',
   'Gilgil health centre serves a large population but is understaffed and lacks equipment. We need expansion and more medical staff.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Gilgil%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'HEALTH', '40000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_019', 'Maji ya Mau Escarpment',
   'Wakazi wa Mau Escarpment wanapata maji kutoka mito ambayo inakauka wakati wa kiangazi. Tunahitaji kisima cha kina kirefu.',
   'sw', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Molo%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'WATER', '8000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_020', 'Nakuru-Nairobi Highway Safety',
   'The Nakuru-Nairobi highway has many accident blackspots. We need better road signage, speed bumps, and lighting to improve safety.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nakuru East%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'ROADS', '50000 daily users', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- KIAMBU COUNTY (Education hub)
  (gen_random_uuid(), 'citizen_021', 'Kiambu Technical Training Institute',
   'Kiambu lacks sufficient technical training institutions. Youth need skills for construction, hospitality, and technology sectors.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kiambu Town%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'YOUTH', '1000 youth annually', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_022', 'Shule za Msingi Thika',
   'Shule za msingi Thika zimejaa sana. Wanafunzi wanajifunza kwenye madarasa yasiyo na vifaa vya kutosha.',
   'sw', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Thika%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '8000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_023', 'Ruiru Water Treatment Plant',
   'Ruiru town faces water rationing due to insufficient treatment capacity. We need an upgraded water treatment plant.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Ruiru%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'WATER', '200000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_024', 'Hospitali ya Kiambu Level 5',
   'Hospitali ya Kiambu inahitaji upanuzi na vifaa vya kisasa. Watu wanatembea Nairobi kupata huduma za kipekee.',
   'sw', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kiambu West%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'HEALTH', '500000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_025', 'Limuru Road Expansion',
   'Limuru Road is congested and narrow. We need road expansion to accommodate the growing traffic from the industrial area.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Limuru%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'ROADS', '30000 daily commuters', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- KAKAMEGA COUNTY (Western region)
  (gen_random_uuid(), 'citizen_026', 'Kakamega Sugar Refinery Support',
   'Sugarcane farmers in Kakamega need better processing facilities and fair pricing. We need a local sugar refinery and farmer cooperatives.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kakamega Central%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '15000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_027', 'Shule za Msingi Mumias',
   'Shule za Mumias zina uhaba wa walimu na vitabu. Wanafunzi wanapata matokeo mabaya katika mitihani.',
   'sw', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Mumias%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '6000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_028', 'Kakamega County Referral Hospital',
   'The referral hospital lacks specialized departments and modern equipment. Patients are referred to Kisumu or Eldoret for specialized care.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kakamega North%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'HEALTH', '200000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_029', 'Maji ya Malava',
   'Wakazi wa Malava wanatumia maji ya mito ambayo hayajasafishwa. Tunahitaji mradi wa maji chini ya ardhi.',
   'sw', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Malava%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'WATER', '12000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_030', 'Kakamega-Webuye Road',
   'The Kakamega-Webuye road is in poor condition, affecting transportation of agricultural produce. We need tarmacking and drainage.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Shinyalu%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'ROADS', '25000 daily users', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- TURKANA COUNTY (Arid region)
  (gen_random_uuid(), 'citizen_031', 'Turkana Water Boreholes',
   'Turkana faces severe water scarcity. Communities walk long distances for water. We need solar-powered boreholes across the county.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana Central%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'WATER', '50000 residents', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_032', 'Shule za Msingi Lodwar',
   'Shule za Lodwar zina uhaba wa walimu na madarasa. Watoto wanatembea umbali mrefu kwenda shule.',
   'sw', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Lodwar%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '3000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_033', 'Lodwar County Hospital',
   'Lodwar hospital lacks essential equipment and specialized doctors. Patients travel to Eldoret for basic specialized care.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana South%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'HEALTH', '100000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_034', 'Barabara ya Lodwar-Kitale',
   'Barabara ya Lodwar-Kitale ni mbovu sana. Wakulima wanashindwa kusafirisha mazao yao kwa wakati.',
   'sw', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana East%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'ROADS', '15000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_035', 'Turkana Youth Skills Training',
   'Youth in Turkana need skills for alternative livelihoods beyond pastoralism. We need vocational training in mechanics, electricity, and ICT.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana West%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'YOUTH', '500 youth', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- GARISSA COUNTY (Arid region)
  (gen_random_uuid(), 'citizen_036', 'Garissa Water Supply Project',
   'Garissa town faces chronic water shortages. The existing supply is insufficient for the growing population. We need a new water treatment plant.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Garissa Township%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'WATER', '150000 residents', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_037', 'Shule za Msingi Dadaab',
   'Shule za Dadaab zimejaa sana kutokana na wakimbizi. Wanafunzi wanajifunza kwenye mazingira magumu.',
   'sw', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Dadaab%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '20000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_038', 'Garissa Provincial Hospital',
   'Garissa Provincial Hospital lacks specialized equipment and adequate staffing. Maternal health services are particularly inadequate.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Balambala%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'HEALTH', '300000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_039', 'Barabara ya Garissa-Mwingi',
   'Barabara ya Garissa-Mwingi ni mbovu sana wakati wa mvua. Biashara inashindwa kufanya kazi.',
   'sw', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Lagdera%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'ROADS', '20000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_040', 'Garissa Youth Employment',
   'Youth unemployment in Garissa is high. We need entrepreneurship training and access to micro-finance for small businesses.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Fafi%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'YOUTH', '3000 youth', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- MERU COUNTY (Agricultural region)
  (gen_random_uuid(), 'citizen_041', 'Meru Coffee Processing Plant',
   'Coffee farmers in Meru need better processing facilities to get better prices. We need a local coffee processing and marketing cooperative.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Imenti Central%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '20000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_042', 'Shule za Msingi Meru',
   'Shule za Meru zina uhaba wa madarasa na vitabu. Wanafunzi wanapata matokeo duni.',
   'sw', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Tigania West%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '15000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_043', 'Meru Teaching and Referral Hospital',
   'Meru hospital needs modernization and equipment expansion. Specialist services are limited, forcing patients to seek care in Nairobi.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Buuri%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'HEALTH', '400000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_044', 'Maji ya Nkubu',
   'Wakazi wa Nkubu wanapata maji kutoka mito ambayo inakauka wakati wa kiangazi. Tunahitaji mradi wa maji.',
   'sw', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%North Imenti%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'WATER', '10000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_045', 'Meru-Embu Road',
   'The Meru-Embu road is in poor condition, affecting transportation of agricultural produce. We need tarmacking and proper drainage.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Maara%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'ROADS', '35000 daily users', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- KISII COUNTY (Highlands region)
  (gen_random_uuid(), 'citizen_046', 'Kisii Banana Processing',
   'Banana farmers in Kisii need processing facilities to add value to their produce. We need a banana processing plant for flour and other products.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kisii Central%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '25000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_047', 'Shule za Msingi Kisii',
   'Shule za Kisii zimejaa sana. Wanafunzi wanajifunza kwenye madarasa yasiyo na vifaa vya kutosha.',
   'sw', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nyamache%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'EDUCATION', '18000 students', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_048', 'Kisii Level 5 Hospital',
   'Kisii hospital needs expansion and modern equipment. The maternity wing is particularly overstretched.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Bonchari%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'HEALTH', '600000 residents', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_049', 'Maji ya Gucha',
   'Wakazi wa Gucha wanatumia maji ya mito ambayo hayajasafishwa. Tunahitaji vituo vya maji vya jamii.',
   'sw', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Gucha%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'WATER', '15000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_050', 'Kisii-Kericho Road',
   'The Kisii-Kericho road is narrow and accident-prone. We need road expansion and safety improvements.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%South Mugirango%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'ROADS', '40000 daily users', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- Additional submissions to reach 80+
  (gen_random_uuid(), 'citizen_051', 'Mombasa Fish Market Upgrade',
   'The Mombasa fish market needs modernization with cold storage and better hygiene facilities to support fishermen and traders.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Jomvu%' AND county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) LIMIT 1),
   'MARKET', '500 fishermen', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_052', 'Soko la Mbuzi Nairobi',
   'Soko la mbuzi la Nairobi linahitaji upanuzi na vifaa bora zaidi. Wafanyabiashara wanapata changamoto.',
   'sw', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Westlands%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'MARKET', '1000 traders', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_053', 'Kisumu Cotton Ginnery',
   'Cotton farmers in Kisumu need a modern ginnery to process their cotton locally. The current facilities are outdated.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Seme%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '8000 farmers', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_054', 'Nakuru Flower Farm Workers Housing',
   'Flower farm workers in Nakuru live in poor housing conditions. We need decent housing with water and sanitation facilities.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Njoro%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'OTHER', '2000 workers', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_055', 'Kiambu Dairy Processing',
   'Dairy farmers in Kiambu need better milk processing facilities. We need a modern dairy plant to process milk locally.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Githunguri%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '12000 farmers', 'ANALYZED', NOW() - INTERVAL '1 day'),
   
  (gen_random_uuid(), 'citizen_056', 'Kakamega Tea Processing',
   'Tea farmers in Kakamega need better processing facilities. The current tea factory is overwhelmed during peak season.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Ikolomani%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '18000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_057', 'Turkana Livestock Market',
   'Pastoralists in Turkana need better livestock markets with veterinary services and cold storage for meat products.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kakuma%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'MARKET', '5000 pastoralists', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_058', 'Garissa Livestock Health Centre',
   'Livestock in Garissa need veterinary services. We need a livestock health centre to prevent disease outbreaks.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Ijara%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '10000 pastoralists', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_059', 'Meru Miraa Processing',
   'Miraa farmers in Meru need better processing and marketing facilities. The current infrastructure is inadequate.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%South Imenti%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '15000 farmers', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_060', 'Kisii Tea Factory Expansion',
   'The Kisii tea factory needs expansion to handle increased production from farmers. Processing capacity is insufficient.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Bobasi%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '22000 farmers', 'ANALYZED', NOW() - INTERVAL '1 day'),

  -- Additional 20 submissions for comprehensive coverage
  (gen_random_uuid(), 'citizen_061', 'Mombasa Port Workers Training',
   'Port workers need safety training and skills certification. We need a maritime training centre in Mombasa.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Mvita%' AND county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) LIMIT 1),
   'YOUTH', '2000 workers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_062', 'Nairobi Informal Settlement Electrification',
   'Many informal settlements in Nairobi lack electricity connections. We need a solar electrification project.',
   'en', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Makadara%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'ICT', '100000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_063', 'Kisumu Beach Management',
   'Lake Victoria beaches need better management with sanitation facilities and environmental conservation.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kisumu West%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'OTHER', '50000 visitors', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_064', 'Nakuru Geothermal Training',
   'Youth in Nakuru need training in geothermal energy maintenance. We need a technical training centre.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nakuru North%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'YOUTH', '500 youth', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_065', 'Kiambu Market Infrastructure',
   'Markets in Kiambu need better infrastructure with proper drainage, lighting, and storage facilities.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kabete%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'MARKET', '3000 traders', 'ANALYZED', NOW() - INTERVAL '1 day'),
   
  (gen_random_uuid(), 'citizen_066', 'Kakamega Forest Conservation',
   'Kakamega forest needs conservation efforts. We need community-based forest management and eco-tourism initiatives.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Shinyalu%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'OTHER', '10000 residents', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_067', 'Turkana Solar Energy Project',
   'Turkana has high solar potential. We need a solar energy project to power rural communities and reduce reliance on diesel.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana South%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'ICT', '30000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_068', 'Garissa Irrigation Scheme',
   'Garissa has potential for irrigation farming along the Tana River. We need an irrigation scheme to support food security.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Hulugho%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '20000 farmers', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_069', 'Meru Horticulture Processing',
   'Horticulture farmers in Meru need cold storage and processing facilities for vegetables and fruits.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Igembe North%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '10000 farmers', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_070', 'Kisii Soapstone Crafts',
   'Soapstone artisans in Kisii need better market access and training. We need a crafts centre and marketing support.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kitutu Chache%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'YOUTH', '2000 artisans', 'ANALYZED', NOW() - INTERVAL '1 day'),
   
  (gen_random_uuid(), 'citizen_071', 'Mombasa Tourism Training',
   'Youth in Mombasa need training in hospitality and tourism. We need a tourism training centre.',
   'en', (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Changamwe%' THEN 0 ELSE 1 END, name LIMIT 1),
   'YOUTH', '1000 youth', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_072', 'Nairobi Waste Management',
   'Nairobi needs better waste management with recycling facilities. We need a waste-to-energy project.',
   'en', (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Embakasi%' AND county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) LIMIT 1),
   'OTHER', '4000000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_073', 'Kisumu Fish Farming',
   'Fish farming in Kisumu needs support with fingerling supply and training. We need a fish hatchery.',
   'en', (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Muhoroni%' AND county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '5000 farmers', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_074', 'Nakuru Waste Recycling',
   'Nakuru needs waste recycling facilities. We need a recycling plant to manage solid waste.',
   'en', (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Nakuru West%' AND county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) LIMIT 1),
   'OTHER', '400000 residents', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_075', 'Kiambu Water Conservation',
   'Kiambu needs water conservation initiatives. We need water harvesting and conservation projects.',
   'en', (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Lari%' AND county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) LIMIT 1),
   'WATER', '100000 residents', 'ANALYZED', NOW() - INTERVAL '1 day'),
   
  (gen_random_uuid(), 'citizen_076', 'Kakamega Beekeeping',
   'Beekeeping in Kakamega needs support with equipment and training. We need a honey processing centre.',
   'en', (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Malava%' AND county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '8000 farmers', 'ANALYZED', NOW() - INTERVAL '5 days'),
   
  (gen_random_uuid(), 'citizen_077', 'Turkana Wind Energy',
   'Turkana has high wind energy potential. We need a wind energy project to power rural communities.',
   'en', (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Turkana North%' AND county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) LIMIT 1),
   'ICT', '50000 residents', 'ANALYZED', NOW() - INTERVAL '4 days'),
   
  (gen_random_uuid(), 'citizen_078', 'Garissa Border Market',
   'The Kenya-Somalia border needs a proper market for cross-border trade. We need a modern market facility.',
   'en', (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Liboi%' AND county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) LIMIT 1),
   'MARKET', '5000 traders', 'ANALYZED', NOW() - INTERVAL '3 days'),
   
  (gen_random_uuid(), 'citizen_079', 'Meru Milk Cooling Plant',
   'Dairy farmers in Meru need milk cooling plants to preserve milk quality. We need several cooling plants.',
   'en', (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Buuri%' AND county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) LIMIT 1),
   'AGRICULTURE', '15000 farmers', 'ANALYZED', NOW() - INTERVAL '2 days'),
   
  (gen_random_uuid(), 'citizen_080', 'Kisii Water Treatment',
   'Kisii town needs an upgraded water treatment plant to meet growing demand. Current capacity is insufficient.',
   'en', (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1), NULL,
   (SELECT id FROM wards WHERE name LIKE '%Kisii South%' AND county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) LIMIT 1),
   'WATER', '300000 residents', 'ANALYZED', NOW() - INTERVAL '1 day');

-- Insert AI analysis results (simulating Gemma 4 analysis)
-- This demonstrates the AI engine turning unstructured input into structured insights
-- Analysis for all 80 submissions

INSERT INTO submission_analysis (id, submission_id, category, sub_category, priority_score, beneficiary_group, location_entities, language_detected, summary_en, summary_sw, duplicate_group_id, analyzed_at)
SELECT 
  gen_random_uuid(),
  s.id,
  s.category_input,
  CASE 
    WHEN s.category_input = 'EDUCATION' THEN 'school infrastructure upgrade'
    WHEN s.category_input = 'WATER' THEN 'water supply infrastructure'
    WHEN s.category_input = 'HEALTH' THEN 'healthcare facility upgrade'
    WHEN s.category_input = 'ROADS' THEN 'road construction and maintenance'
    WHEN s.category_input = 'YOUTH' THEN 'youth skills training and employment'
    WHEN s.category_input = 'AGRICULTURE' THEN 'agricultural processing and support'
    WHEN s.category_input = 'ICT' THEN 'digital infrastructure and training'
    WHEN s.category_input = 'MARKET' THEN 'market infrastructure development'
    WHEN s.category_input = 'OTHER' THEN 'community infrastructure development'
  END,
  CASE 
    WHEN s.category_input = 'EDUCATION' THEN 0.85
    WHEN s.category_input = 'WATER' THEN 0.92
    WHEN s.category_input = 'HEALTH' THEN 0.88
    WHEN s.category_input = 'ROADS' THEN 0.78
    WHEN s.category_input = 'YOUTH' THEN 0.82
    WHEN s.category_input = 'AGRICULTURE' THEN 0.80
    WHEN s.category_input = 'ICT' THEN 0.75
    WHEN s.category_input = 'MARKET' THEN 0.77
    WHEN s.category_input = 'OTHER' THEN 0.73
  END,
  CASE 
    WHEN s.category_input = 'EDUCATION' THEN 'students, teachers'
    WHEN s.category_input = 'WATER' THEN 'residents, women, children'
    WHEN s.category_input = 'HEALTH' THEN 'patients, pregnant mothers, elderly'
    WHEN s.category_input = 'ROADS' THEN 'commuters, farmers, traders'
    WHEN s.category_input = 'YOUTH' THEN 'unemployed youth, graduates'
    WHEN s.category_input = 'AGRICULTURE' THEN 'farmers, pastoralists, fishermen'
    WHEN s.category_input = 'ICT' THEN 'youth, businesses, communities'
    WHEN s.category_input = 'MARKET' THEN 'traders, farmers, artisans'
    WHEN s.category_input = 'OTHER' THEN 'residents, workers'
  END,
  CASE 
    WHEN s.language = 'en' THEN jsonb_build_array(s.title)
    WHEN s.language = 'sw' THEN jsonb_build_array(s.title)
  END,
  s.language,
  CASE 
    WHEN s.language = 'en' THEN s.description
    WHEN s.language = 'sw' THEN 'Community infrastructure need requiring immediate attention for development planning.'
  END,
  CASE 
    WHEN s.language = 'sw' THEN s.description
    WHEN s.language = 'en' THEN 'Mahitaji ya miundombinu ya jamii yanayohitaji utatuzi wa haraka kwa upangaji wa maendeleo.'
  END,
  NULL,
  NOW()
FROM submissions s
WHERE s.status = 'ANALYZED';

-- Insert recommended projects (AI-ranked based on citizen demand + infrastructure gaps)
-- This demonstrates the core innovation: ranking projects based on real demand
-- 20+ ranked projects across different counties and categories

INSERT INTO recommended_projects (id, title, ward_id, theme, category, priority_score, backing_submissions_count, beneficiary_count_estimate, cost_band, justification_en, justification_sw, status, created_at) VALUES
  -- MOMBASA COUNTY PROJECTS
  (gen_random_uuid(), 'Kisauni Community Water Supply Project', 
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kisauni%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Water Access', 'WATER', 0.92, 3, 2500, 'High',
   'Based on 3 citizen submissions highlighting severe water shortage. Infrastructure gap data shows Kisauni has no public water supply. Project will install solar-powered borehole with distribution kiosks.',
   'Kulingana na maombi 3 ya wananchi wakionyesha uhaba mkubwa wa maji. Data ya ufaulu wa miundombinu inaonyesha Kisauni haina usambazaji wa maji wa umma. Mradi utasakafiza kisima cha jua na vituo vya usambazaji.',
   'DRAFT', NOW() - make_interval(hours => 12)),
   
  (gen_random_uuid(), 'Nyali Primary School Expansion',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Nyali%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Education Quality', 'EDUCATION', 0.88, 2, 800, 'Medium',
   'Citizen reports 80+ students per classroom with leaking roof. Infrastructure gap shows Nyali schools exceed capacity by 40%. Will construct 4 new classrooms and provide furniture.',
   'Ripoti ya mwananchi inaonyesha wanafunzi 80+ kila darasa na paa linavuja. Data ya ufaulu inaonyesha shule za Nyali zimezidi uwezo kwa asilimia 40. Tutajenga madarasa 4 mapya na kutoa samani.',
   'DRAFT', NOW() - make_interval(hours => 11)),
   
  (gen_random_uuid(), 'Changamwe Health Centre Upgrade',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Changamwe%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Healthcare Access', 'HEALTH', 0.86, 1, 5000, 'High',
   'Dispensary lacks ultrasound and lab equipment. Infrastructure gap indicates Changamwe residents travel 15km for basic maternal care. Will equip facility with modern diagnostic equipment.',
   'Duka la dawa halina ultrasound na vifaa vya maabara. Data ya ufaulu inaonyesha wakazi wa Changamwe wanatembea km 15 kwa huduma za msingi za akina mama. Tutajipa kituo na vifaa vya kisasa vya uchambuzi.',
   'DRAFT', NOW() - make_interval(hours => 10)),
   
  (gen_random_uuid(), 'Likoni Ferry Access Road Rehabilitation',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'mombasa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Likoni%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Transport Infrastructure', 'ROADS', 0.78, 1, 10000, 'High',
   'Road to ferry becomes impassable during rains affecting 10,000 daily commuters. Infrastructure gap shows poor drainage. Will rehabilitate road and construct proper drainage system.',
   'Barabara inayoelekea feri inakuwa isiweze kupitika wakati wa mvua ikikabili wasafiri 10,000 kila siku. Data ya ufaulu inaonyesna mifereji mibovu. Tutarekebisha barabara na kujenga mfumo wa mifereji sahihi.',
   'DRAFT', NOW() - make_interval(hours => 9)),

  -- NAIROBI COUNTY PROJECTS
  (gen_random_uuid(), 'Kibera Sanitation and Water Project',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kibra%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Urban Sanitation', 'WATER', 0.94, 4, 50000, 'High',
   'Multiple submissions highlight severe sanitation crisis in Kibera. Infrastructure gap shows no proper sewage system. Will construct community toilet blocks and water kiosks.',
   'Maombi mengi yanaonyesha mgogoro mkubwa wa usafi katika Kibera. Data ya ufaulu inaonyesha hakuna mfumo wa maji taka sahihi. Tutajenga vyoo vya jamii na vituo vya maji.',
   'DRAFT', NOW() - make_interval(hours => 8)),
   
  (gen_random_uuid(), 'Mathare Primary School Reconstruction',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Mathare%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Education Quality', 'EDUCATION', 0.87, 2, 1000, 'Medium',
   'Overcrowded classrooms with inadequate facilities. Infrastructure gap shows Mathare schools lack basic infrastructure. Will reconstruct classrooms and provide learning materials.',
   'Madarasa yamejaa na vifaa duni. Data ya ufaulu inaonyesha shule za Mathare zina uhaba wa miundombinu ya msingi. Tutajenga upya madarasa na kutoa vifaa vya kujifunzia.',
   'DRAFT', NOW() - make_interval(hours => 7)),
   
  (gen_random_uuid(), 'Eastleigh Youth Business Incubation Centre',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'nairobi_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Eastleigh%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Youth Empowerment', 'YOUTH', 0.83, 1, 500, 'Medium',
   'High youth unemployment in Eastleigh. Infrastructure gap shows no business support facilities. Will establish incubation centre with micro-finance access.',
   'Ukosefu wa juu wa vijana Eastleigh. Data ya ufaulu inaonyesha hakuna vifaa vya kusaidia biashara. Tutateng kituo cha kuzaa biashara na upatikanaji wa mikopo.',
   'DRAFT', NOW() - make_interval(hours => 6)),

  -- KISUMU COUNTY PROJECTS
  (gen_random_uuid(), 'Lake Victoria Fishermen Cold Storage',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Manyatta%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Fisheries Development', 'AGRICULTURE', 0.89, 2, 2000, 'Medium',
   'Fishermen report high spoilage rates due to lack of cold storage. Infrastructure gap shows no cold chain facilities. Will install solar-powered cold storage units.',
   'Wavuvi wanaripoti kiwango kikubwa cha kuharibika kutokana na uhaba wa hifadhi ya baridi. Data ya ufaulu inaonyesha hakuna vifaa vya baridi. Tutasakafiza vifaa vya hifadhi ya baridi ya jua.',
   'DRAFT', NOW() - make_interval(hours => 5)),
   
  (gen_random_uuid(), 'Kisumu Rural Water Treatment',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kisumu_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Muhoroni%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Rural Water Access', 'WATER', 0.91, 3, 15000, 'High',
   'Rural communities use untreated lake water. Infrastructure gap shows no water treatment facilities. Will construct water treatment plants and distribution network.',
   'Jamii za vijijini hutumia maji ya ziwa yasiyosafishwa. Data ya ufaulu inaonyesha hakuna vituo vya usafishaji maji. Tutajenga vituo vya usafishaji maji na mtandao wa usambazaji.',
   'DRAFT', NOW() - make_interval(hours => 4)),

  -- NAKURU COUNTY PROJECTS
  (gen_random_uuid(), 'Nakuru Agricultural Extension Centre',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Nakuru Town%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Agricultural Support', 'AGRICULTURE', 0.84, 2, 10000, 'Medium',
   'Farmers need modern farming techniques. Infrastructure gap shows limited extension services. Will establish agricultural training centre with demonstration farms.',
   'Wakulima wanahitaji mbinu za kilimo za kisasa. Data ya ufaulu inaonyesha huduma chache za upanuzi. Tutateng kituo cha mafunzo ya kilimo na mashamba ya maonyesho.',
   'DRAFT', NOW() - make_interval(hours => 3)),
   
  (gen_random_uuid(), 'Naivasha Secondary School Science Labs',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'nakuru_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Naivasha%' THEN 0 ELSE 1 END, name LIMIT 1),
   'STEM Education', 'EDUCATION', 0.86, 1, 5000, 'Medium',
   'Schools lack science teachers and laboratories. Infrastructure gap shows poor science performance. Will construct modern science laboratories and recruit teachers.',
   'Shule zina uhaba wa walimu wa sayansi na maabara. Data ya ufaulu inaonyesha matokeo duni ya sayansi. Tutajenga maabara za kisasa za sayansi na kuajiri walimu.',
   'DRAFT', NOW() - make_interval(hours => 2)),

  -- KIAMBU COUNTY PROJECTS
  (gen_random_uuid(), 'Kiambu Technical Training Institute',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kiambu Town%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Skills Development', 'YOUTH', 0.85, 2, 1000, 'Medium',
   'Youth need technical skills for employment. Infrastructure gap shows insufficient training institutions. Will establish technical training institute.',
   'Vijana wanahitaji ujuzi wa kiufundi kwa ajili ya kazi. Data ya ufaulu inaonyesha taasisi chache za mafunzo. Tutateng taasisi ya mafunzo ya kiufundi.',
   'DRAFT', NOW() - make_interval(hours => 1)),
   
  (gen_random_uuid(), 'Ruiru Water Treatment Plant Upgrade',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kiambu_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Ruiru%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Urban Water Supply', 'WATER', 0.90, 3, 200000, 'High',
   'Town faces water rationing due to insufficient capacity. Infrastructure gap shows treatment plant is overwhelmed. Will upgrade treatment capacity and distribution.',
   'Mji inakabiliwa na ugawaji wa maji kutokana na uwezo duni. Data ya ufaulu inaonyesha kiwanda cha usafishaji maji kimejaa. Tutaboresha uwezo wa usafishaji na usambazaji.',
   'DRAFT', NOW() - make_interval(hours => 12)),

  -- KAKAMEGA COUNTY PROJECTS
  (gen_random_uuid(), 'Kakamega Sugar Processing Cooperative',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kakamega Central%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Agro-Processing', 'AGRICULTURE', 0.87, 2, 15000, 'High',
   'Sugarcane farmers need better processing facilities. Infrastructure gap shows no local sugar refinery. Will establish farmer-owned sugar processing cooperative.',
   'Wakulima wa miwa wanahitaji vifaa bora vya usindikaji. Data ya ufaulu inaonyesha hakuna kiwanda cha sukari cha ndani. Tutateng ushirika wa usindikaji wa sukari unamilikiwa na wakulima.',
   'DRAFT', NOW() - make_interval(hours => 11)),
   
  (gen_random_uuid(), 'Kakamega County Referral Hospital Equipment',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kakamega_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kakamega North%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Healthcare Access', 'HEALTH', 0.88, 1, 200000, 'High',
   'Hospital lacks specialized departments and equipment. Infrastructure gap shows patients referred to other counties. Will equip hospital with modern medical equipment.',
   'Hospitali ina uhaba wa idara za kipekee na vifaa. Data ya ufaulu inaonyesha wagonjwa wanaelekezwa kaunti nyingine. Tutajipa hospitali na vifaa vya kisasa vya matibabu.',
   'DRAFT', NOW() - make_interval(hours => 10)),

  -- TURKANA COUNTY PROJECTS
  (gen_random_uuid(), 'Turkana Solar-Powered Water Boreholes',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Turkana Central%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Arid Region Water', 'WATER', 0.95, 5, 50000, 'High',
   'Severe water scarcity with communities walking long distances. Infrastructure gap shows no water infrastructure. Will install solar-powered boreholes across the county.',
   'Uhaba mkubwa wa maji na jamii kutembea umbali mrefu. Data ya ufaulu inaonyesha hakuna miundombinu ya maji. Tutasakafiza visima vya jua vilivyowekwa nje katika kaunti.',
   'DRAFT', NOW() - make_interval(hours => 9)),
   
  (gen_random_uuid(), 'Turkana Youth Vocational Training Centre',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'turkana_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Turkana West%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Alternative Livelihoods', 'YOUTH', 0.82, 1, 500, 'Medium',
   'Youth need skills beyond pastoralism. Infrastructure gap shows no vocational training. Will establish training centre for mechanics, electricity, and ICT.',
   'Vijana wanahitaji ujuzi zaidi ya ufugaji. Data ya ufaulu inaonyesha hakuna mafunzo ya kitaalamu. Tutateng kituo cha mafunzo kwa wafundi, umeme, na ICT.',
   'DRAFT', NOW() - make_interval(hours => 8)),

  -- GARISSA COUNTY PROJECTS
  (gen_random_uuid(), 'Garissa Water Treatment Plant',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Garissa Township%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Urban Water Supply', 'WATER', 0.93, 4, 150000, 'High',
   'Chronic water shortages with insufficient supply. Infrastructure gap shows treatment capacity is inadequate. Will construct new water treatment plant.',
   'Uhaba wa mara kwa mara wa maji na usambazaji duni. Data ya ufaulu inaonyesha uwezo wa usafishaji ni duni. Tutajenga kiwanda kipya cha usafishaji maji.',
   'DRAFT', NOW() - make_interval(hours => 7)),
   
  (gen_random_uuid(), 'Garissa Provincial Hospital Upgrade',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'garissa_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Balambala%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Maternal Health', 'HEALTH', 0.89, 2, 300000, 'High',
   'Hospital lacks specialized equipment and staffing. Infrastructure gap shows poor maternal health services. Will upgrade facility with modern equipment and staff.',
   'Hospitali ina uhaba wa vifaa vya kipekee na wafanyakazi. Data ya ufaulu inaonyesha huduma duni za afya ya mama. Tutaboresha kituo na vifaa vya kisasa na wafanyakazi.',
   'DRAFT', NOW() - make_interval(hours => 6)),

  -- MERU COUNTY PROJECTS
  (gen_random_uuid(), 'Meru Coffee Processing Cooperative',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Imenti Central%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Coffee Value Addition', 'AGRICULTURE', 0.86, 2, 20000, 'Medium',
   'Coffee farmers need better processing for better prices. Infrastructure gap shows no local processing facilities. Will establish coffee processing and marketing cooperative.',
   'Wakulima wa kahawa wanahitaji usindikaji bora kwa bei bora. Data ya ufaulu inaonyesha hakuna vifaa vya usindikaji vya ndani. Tutateng ushirika wa usindikaji na uuzaji wa kahawa.',
   'DRAFT', NOW() - make_interval(hours => 5)),
   
  (gen_random_uuid(), 'Meru Teaching and Referral Hospital Modernization',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'meru_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Buuri%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Specialized Healthcare', 'HEALTH', 0.87, 1, 400000, 'High',
   'Hospital needs modernization and equipment. Infrastructure gap shows limited specialist services. Will modernize facility and expand specialist departments.',
   'Hospitali inahitaji kisasa na vifaa. Data ya ufaulu inaonyesha huduma chache za wataalamu. Tutaweka hospitali ya kisasa na kupanua idara za wataalamu.',
   'DRAFT', NOW() - make_interval(hours => 4)),

  -- KISII COUNTY PROJECTS
  (gen_random_uuid(), 'Kisii Banana Processing Plant',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Kisii Central%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Value Addition', 'AGRICULTURE', 0.85, 2, 25000, 'Medium',
   'Banana farmers need processing facilities. Infrastructure gap shows no value-addition facilities. Will construct banana processing plant for flour and products.',
   'Wakulima wa ndizi wanahitaji vifaa vya usindikaji. Data ya ufaulu inaonyesha hakuna vifaa vya kuongeza thamani. Tutajenga kiwanda cha usindikaji wa ndizi kwa unga na bidhaa.',
   'DRAFT', NOW() - make_interval(hours => 3)),
   
  (gen_random_uuid(), 'Kisii Level 5 Hospital Expansion',
   (SELECT id FROM wards WHERE county_id = (SELECT id FROM counties WHERE code = 'kisii_county' LIMIT 1) ORDER BY CASE WHEN name LIKE '%Bonchari%' THEN 0 ELSE 1 END, name LIMIT 1),
   'Maternal Health', 'HEALTH', 0.88, 2, 600000, 'High',
   'Hospital needs expansion and modern equipment. Infrastructure gap shows maternity wing is overstretched. Will expand facility and equip with modern equipment.',
   'Hospitali inahitaji upanuzi na vifaa vya kisasa. Data ya ufaulu inaonyesha boma la akina mama limejaa. Tutapanua kituo na kijipa na vifaa vya kisasa.',
   'DRAFT', NOW() - make_interval(hours => 2));

-- Demo credentials for hackathon pitch
-- Email: demo.citizen@jakamoyo.com | Password: demo123
-- Email: demo.mp@jakamoyo.com | Password: demo123
-- Email: demo.analyst@jakamoyo.com | Password: demo123
-- Email: demo.cdf@jakamoyo.com | Password: demo123
