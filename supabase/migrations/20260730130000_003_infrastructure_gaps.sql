/*
# Jakamoyo — Infrastructure Gaps

## Purpose
Adds the `infrastructure_gaps` table to represent real development plan data and external dataset ingestion.
This data is used by the `rank-projects` edge function to boost priority when citizen requests align with documented government gaps.

*/

CREATE TABLE IF NOT EXISTS infrastructure_gaps (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  ward_id uuid NOT NULL REFERENCES wards(id) ON DELETE CASCADE,
  category text NOT NULL,
  gap_description_en text NOT NULL,
  gap_description_sw text NOT NULL,
  severity text NOT NULL DEFAULT 'Medium'
    CHECK (severity IN ('Low','Medium','High')),
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Index for hot paths
CREATE INDEX IF NOT EXISTS idx_infrastructure_gaps_ward ON infrastructure_gaps(ward_id);
CREATE INDEX IF NOT EXISTS idx_infrastructure_gaps_category ON infrastructure_gaps(category);

-- RLS Policies
ALTER TABLE infrastructure_gaps ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_infrastructure_gaps" ON infrastructure_gaps;
CREATE POLICY "read_infrastructure_gaps" ON infrastructure_gaps FOR SELECT TO anon, authenticated USING (true);

-- Seed Data (Example gaps for demonstration)
-- Note: In a real environment, we'd lookup ward UUIDs. For this seed, we assume the edge function 
-- will join by category and ward_id dynamically. To make the seed data portable without hardcoding UUIDs,
-- we'll write a quick DO block to insert a few representative gaps into random or specific wards.

DO $$ 
DECLARE 
  w_kawangware uuid;
  w_nyalenda uuid;
  w_likoni uuid;
BEGIN
  -- Grab a few known wards from the 002 seed script
  SELECT id INTO w_kawangware FROM wards WHERE name = 'Mvita Ward 1' LIMIT 1;
  SELECT id INTO w_nyalenda FROM wards WHERE name = 'Mvita Ward 2' LIMIT 1;
  SELECT id INTO w_likoni FROM wards WHERE name = 'Changamwe Ward 1' LIMIT 1;

  IF w_kawangware IS NOT NULL THEN
    INSERT INTO infrastructure_gaps (ward_id, category, gap_description_en, gap_description_sw, severity)
    VALUES 
    (w_kawangware, 'WATER', 'Severe water shortage, 2 boreholes required', 'Upungufu mkubwa wa maji, visima 2 vinahitajika', 'High'),
    (w_kawangware, 'EDUCATION', 'Overcrowded primary school, 4 classrooms needed', 'Shule ya msingi imejaa sana, madarasa 4 yanahitajika', 'Medium');
  END IF;

  IF w_nyalenda IS NOT NULL THEN
    INSERT INTO infrastructure_gaps (ward_id, category, gap_description_en, gap_description_sw, severity)
    VALUES 
    (w_nyalenda, 'HEALTH', 'No maternity wing in local dispensary', 'Hakuna wodi ya wazazi katika zahanati', 'High');
  END IF;

  IF w_likoni IS NOT NULL THEN
    INSERT INTO infrastructure_gaps (ward_id, category, gap_description_en, gap_description_sw, severity)
    VALUES 
    (w_likoni, 'ROADS', 'Main access road impassable during rains', 'Barabara kuu haipitiki wakati wa mvua', 'High');
  END IF;
END $$;
