/*
# Restore browser access to public dashboard and location data

Tables created through the SQL editor do not necessarily inherit the grants
needed by Supabase's `anon` and `authenticated` API roles.  RLS policies alone
are not sufficient: the roles must also have table privileges.
*/

GRANT USAGE ON SCHEMA public TO anon, authenticated;

GRANT SELECT ON TABLE counties, constituencies, wards TO anon, authenticated;
GRANT SELECT, INSERT ON TABLE submissions TO anon, authenticated;
GRANT SELECT ON TABLE submission_analysis, recommended_projects TO anon, authenticated;
GRANT UPDATE ON TABLE recommended_projects TO authenticated;

ALTER TABLE counties ENABLE ROW LEVEL SECURITY;
ALTER TABLE constituencies ENABLE ROW LEVEL SECURITY;
ALTER TABLE wards ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE submission_analysis ENABLE ROW LEVEL SECURITY;
ALTER TABLE recommended_projects ENABLE ROW LEVEL SECURITY;

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

DROP POLICY IF EXISTS "read_analysis" ON submission_analysis;
CREATE POLICY "read_analysis" ON submission_analysis FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "read_projects" ON recommended_projects;
CREATE POLICY "read_projects" ON recommended_projects FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "update_projects" ON recommended_projects;
CREATE POLICY "update_projects" ON recommended_projects FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
