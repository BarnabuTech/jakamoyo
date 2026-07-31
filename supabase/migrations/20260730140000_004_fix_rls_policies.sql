/*
# Jakamoyo — Fix RLS Policies for Geography Tables

## Purpose
The 002_full_kenya_geography.sql migration recreated the counties, constituencies, and wards tables
but didn't set up RLS policies. This migration adds the missing policies to allow anonymous and
authenticated users to read the geographic data.
*/

-- Enable RLS on the tables (if not already enabled)
ALTER TABLE counties ENABLE ROW LEVEL SECURITY;
ALTER TABLE constituencies ENABLE ROW LEVEL SECURITY;
ALTER TABLE wards ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "read_counties" ON counties;
DROP POLICY IF EXISTS "read_constituencies" ON constituencies;
DROP POLICY IF EXISTS "read_wards" ON wards;

-- Create policies to allow anon and authenticated users to read the data
CREATE POLICY "read_counties" ON counties FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "read_constituencies" ON constituencies FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "read_wards" ON wards FOR SELECT TO anon, authenticated USING (true);

-- Enable RLS on infrastructure_gaps table
ALTER TABLE infrastructure_gaps ENABLE ROW LEVEL SECURITY;

-- Drop existing policy if it exists
DROP POLICY IF EXISTS "read_infrastructure_gaps" ON infrastructure_gaps;

-- Create policy to allow anon and authenticated users to read infrastructure gaps
CREATE POLICY "read_infrastructure_gaps" ON infrastructure_gaps FOR SELECT TO anon, authenticated USING (true);
