/*
# WaziConstituency AI — Core Schema

## Purpose
Single migration that creates the full relational schema for a multilingual
AI platform that consolidates citizen development requests for Kenyan MPs and
ranks high-priority CDF/NG-CDF projects. This is a shared demo dataset
(single-tenant), so all public data tables allow anon + authenticated CRUD
via RLS; the `profiles` table (linked to Supabase Auth) is owner-scoped.

## New Tables
1. `counties` — Kenyan counties (id, name, code).
2. `constituencies` — Constituencies belonging to a county (id, name, code, county_id).
3. `wards` — Wards belonging to a constituency (id, name, ward_code, constituency_id,
   county_id, population_estimate, voters_2022, lat, lng). lat/lng power the map.
4. `submissions` — Citizen development requests. status lifecycle:
   PENDING_AI -> ANALYZED / FLAGGED_DUPLICATE / MERGED / ARCHIVED.
   Stores optional downscaled photo (base64 data URL) and audio metadata (jsonb).
5. `submission_analysis` — 1:1 AI analysis of a submission (category, sub_category,
   priority_score 0-1, beneficiary_group, location_entities, language_detected,
   summary_en, summary_sw, duplicate_group_id).
6. `recommended_projects` — Ranked, AI-generated project recommendations per ward
   (title, theme, category, priority_score, backing_submissions_count,
   beneficiary_count_estimate, cost_band Low/Medium/High, justification_en/sw,
   status DRAFT/APPROVED/IMPLEMENTED).
7. `profiles` — Supabase Auth user profile (full_name, role MP/CDF_MANAGER/
   ANALYST/CITIZEN, county_id, constituency_id). Owner-scoped.

## Security (RLS)
- counties, constituencies, wards, submissions, submission_analysis,
  recommended_projects: ENABLE RLS; anon + authenticated full CRUD (intentionally
  shared public demo data).
- profiles: ENABLE RLS; owner-scoped CRUD (TO authenticated, auth.uid() = id).

## Notes
- All PKs are uuid DEFAULT gen_random_uuid().
- FKs use ON DELETE CASCADE for child geography/admin tables and analysis.
- Indexes added on hot lookup columns (ward_id, status, category, duplicate_group_id).
*/

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

CREATE TABLE IF NOT EXISTS submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  citizen_hash text,
  title text,
  description text NOT NULL,
  language text,
  county_id uuid REFERENCES counties(id) ON DELETE SET NULL,
  constituency_id uuid REFERENCES constituencies(id) ON DELETE SET NULL,
  ward_id uuid REFERENCES wards(id) ON DELETE SET NULL,
  category_input text,
  estimated_beneficiaries_input text,
  photo_data text,
  audio_meta jsonb,
  status text NOT NULL DEFAULT 'PENDING_AI'
    CHECK (status IN ('PENDING_AI','ANALYZED','FLAGGED_DUPLICATE','MERGED','ARCHIVED')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS submission_analysis (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  submission_id uuid NOT NULL UNIQUE REFERENCES submissions(id) ON DELETE CASCADE,
  category text NOT NULL,
  sub_category text,
  priority_score numeric NOT NULL DEFAULT 0.5
    CHECK (priority_score >= 0 AND priority_score <= 1),
  beneficiary_group text,
  location_entities jsonb NOT NULL DEFAULT '[]'::jsonb,
  language_detected text NOT NULL DEFAULT 'en',
  summary_en text,
  summary_sw text,
  duplicate_group_id text,
  analyzed_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS recommended_projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  ward_id uuid NOT NULL REFERENCES wards(id) ON DELETE CASCADE,
  theme text NOT NULL,
  category text NOT NULL,
  priority_score numeric NOT NULL DEFAULT 0.5
    CHECK (priority_score >= 0 AND priority_score <= 1),
  backing_submissions_count integer NOT NULL DEFAULT 0,
  beneficiary_count_estimate integer NOT NULL DEFAULT 0,
  cost_band text NOT NULL DEFAULT 'Medium'
    CHECK (cost_band IN ('Low','Medium','High')),
  justification_en text,
  justification_sw text,
  status text NOT NULL DEFAULT 'DRAFT'
    CHECK (status IN ('DRAFT','APPROVED','IMPLEMENTED')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS profiles (
  id uuid PRIMARY KEY DEFAULT auth.uid() REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name text NOT NULL,
  role text NOT NULL DEFAULT 'CITIZEN'
    CHECK (role IN ('MP','CDF_MANAGER','ANALYST','CITIZEN')),
  county_id uuid REFERENCES counties(id) ON DELETE SET NULL,
  constituency_id uuid REFERENCES constituencies(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Indexes for hot paths
CREATE INDEX IF NOT EXISTS idx_submissions_ward ON submissions(ward_id);
CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
CREATE INDEX IF NOT EXISTS idx_submissions_county ON submissions(county_id);
CREATE INDEX IF NOT EXISTS idx_analysis_category ON submission_analysis(category);
CREATE INDEX IF NOT EXISTS idx_analysis_dup_group ON submission_analysis(duplicate_group_id);
CREATE INDEX IF NOT EXISTS idx_projects_ward ON recommended_projects(ward_id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON recommended_projects(status);
CREATE INDEX IF NOT EXISTS idx_wards_constituency ON wards(constituency_id);
CREATE INDEX IF NOT EXISTS idx_constituencies_county ON constituencies(county_id);

-- ---------- RLS ----------
ALTER TABLE counties ENABLE ROW LEVEL SECURITY;
ALTER TABLE constituencies ENABLE ROW LEVEL SECURITY;
ALTER TABLE wards ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE submission_analysis ENABLE ROW LEVEL SECURITY;
ALTER TABLE recommended_projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Shared public demo data: anon + authenticated full CRUD
DROP POLICY IF EXISTS "read_counties" ON counties;
CREATE POLICY "read_counties" ON counties FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "read_constituencies" ON constituencies;
CREATE POLICY "read_constituencies" ON constituencies FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "read_wards" ON wards;
CREATE POLICY "read_wards" ON wards FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "read_submissions" ON submissions;
CREATE POLICY "read_submissions" ON submissions FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "insert_submissions" ON submissions;
CREATE POLICY "insert_submissions" ON submissions FOR INSERT TO anon, authenticated WITH CHECK (true);
DROP POLICY IF EXISTS "update_submissions" ON submissions;
CREATE POLICY "update_submissions" ON submissions FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "delete_submissions" ON submissions;
CREATE POLICY "delete_submissions" ON submissions FOR DELETE TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "read_analysis" ON submission_analysis;
CREATE POLICY "read_analysis" ON submission_analysis FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "insert_analysis" ON submission_analysis;
CREATE POLICY "insert_analysis" ON submission_analysis FOR INSERT TO anon, authenticated WITH CHECK (true);
DROP POLICY IF EXISTS "update_analysis" ON submission_analysis;
CREATE POLICY "update_analysis" ON submission_analysis FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "delete_analysis" ON submission_analysis;
CREATE POLICY "delete_analysis" ON submission_analysis FOR DELETE TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "read_projects" ON recommended_projects;
CREATE POLICY "read_projects" ON recommended_projects FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "insert_projects" ON recommended_projects;
CREATE POLICY "insert_projects" ON recommended_projects FOR INSERT TO anon, authenticated WITH CHECK (true);
DROP POLICY IF EXISTS "update_projects" ON recommended_projects;
CREATE POLICY "update_projects" ON recommended_projects FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "delete_projects" ON recommended_projects;
CREATE POLICY "delete_projects" ON recommended_projects FOR DELETE TO anon, authenticated USING (true);

-- Profiles: owner-scoped (real auth users manage their own profile)
DROP POLICY IF EXISTS "read_own_profile" ON profiles;
CREATE POLICY "read_own_profile" ON profiles FOR SELECT TO authenticated USING (auth.uid() = id);
DROP POLICY IF EXISTS "insert_own_profile" ON profiles;
CREATE POLICY "insert_own_profile" ON profiles FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);
DROP POLICY IF EXISTS "update_own_profile" ON profiles;
CREATE POLICY "update_own_profile" ON profiles FOR UPDATE TO authenticated USING (auth.uid() = id) WITH CHECK (auth.uid() = id);
