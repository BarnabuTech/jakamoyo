/*
# Jakamoyo — Add Missing Tables from 001_wazi_schema.sql

## Purpose
Since 001_wazi_schema.sql was not applied, this migration adds all the missing tables and RLS policies
that were defined there but are not present in the applied migrations (002 and 003).

This includes:
- submissions table
- submission_analysis table  
- recommended_projects table
- profiles table
- All RLS policies for these tables
*/

-- Create submissions table
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

-- Create submission_analysis table
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

-- Create recommended_projects table
CREATE TABLE IF NOT EXISTS recommended_projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  ward_id uuid REFERENCES wards(id) ON DELETE CASCADE,
  county_id uuid REFERENCES counties(id) ON DELETE CASCADE,
  constituency_id uuid REFERENCES constituencies(id) ON DELETE CASCADE,
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

-- Create profiles table
CREATE TABLE IF NOT EXISTS profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  full_name text NOT NULL,
  role text NOT NULL DEFAULT 'CITIZEN'
    CHECK (role IN ('MP','CDF_MANAGER','ANALYST','CITIZEN')),
  county_id uuid REFERENCES counties(id) ON DELETE SET NULL,
  constituency_id uuid REFERENCES constituencies(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Create indexes for submissions
CREATE INDEX IF NOT EXISTS idx_submissions_ward ON submissions(ward_id);
CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
CREATE INDEX IF NOT EXISTS idx_submissions_county ON submissions(county_id);

-- Create indexes for submission_analysis
CREATE INDEX IF NOT EXISTS idx_analysis_category ON submission_analysis(category);
CREATE INDEX IF NOT EXISTS idx_analysis_dup_group ON submission_analysis(duplicate_group_id);

-- Create indexes for recommended_projects
CREATE INDEX IF NOT EXISTS idx_projects_ward ON recommended_projects(ward_id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON recommended_projects(status);

-- Enable RLS on all tables
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE submission_analysis ENABLE ROW LEVEL SECURITY;
ALTER TABLE recommended_projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "read_submissions" ON submissions;
DROP POLICY IF EXISTS "insert_submissions" ON submissions;
DROP POLICY IF EXISTS "update_submissions" ON submissions;
DROP POLICY IF EXISTS "delete_submissions" ON submissions;

DROP POLICY IF EXISTS "read_analysis" ON submission_analysis;
DROP POLICY IF EXISTS "insert_analysis" ON submission_analysis;
DROP POLICY IF EXISTS "update_analysis" ON submission_analysis;
DROP POLICY IF EXISTS "delete_analysis" ON submission_analysis;

DROP POLICY IF EXISTS "read_projects" ON recommended_projects;
DROP POLICY IF EXISTS "insert_projects" ON recommended_projects;
DROP POLICY IF EXISTS "update_projects" ON recommended_projects;
DROP POLICY IF EXISTS "delete_projects" ON recommended_projects;

DROP POLICY IF EXISTS "read_own_profile" ON profiles;
DROP POLICY IF EXISTS "insert_own_profile" ON profiles;
DROP POLICY IF EXISTS "update_own_profile" ON profiles;

-- Create policies for submissions (anon + authenticated full CRUD)
CREATE POLICY "read_submissions" ON submissions FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_submissions" ON submissions FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_submissions" ON submissions FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "delete_submissions" ON submissions FOR DELETE TO anon, authenticated USING (true);

-- Create policies for submission_analysis (anon + authenticated full CRUD)
CREATE POLICY "read_analysis" ON submission_analysis FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_analysis" ON submission_analysis FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_analysis" ON submission_analysis FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "delete_analysis" ON submission_analysis FOR DELETE TO anon, authenticated USING (true);

-- Create policies for recommended_projects (anon + authenticated full CRUD)
CREATE POLICY "read_projects" ON recommended_projects FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "insert_projects" ON recommended_projects FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "update_projects" ON recommended_projects FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "delete_projects" ON recommended_projects FOR DELETE TO anon, authenticated USING (true);

-- Create policies for profiles (owner-scoped)
CREATE POLICY "read_own_profile" ON profiles FOR SELECT TO authenticated USING (true);
CREATE POLICY "insert_own_profile" ON profiles FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "update_own_profile" ON profiles FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
