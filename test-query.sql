-- Test query to verify RLS policies are working
-- Run this in Supabase SQL Editor to check if anon user can access the data

-- Check if RLS is enabled on the tables
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies 
WHERE tablename IN ('counties', 'constituencies', 'wards')
ORDER BY tablename, policyname;

-- Test the actual data count
SELECT 'counties' as table_name, COUNT(*) as count FROM counties
UNION ALL
SELECT 'constituencies', COUNT(*) FROM constituencies  
UNION ALL
SELECT 'wards', COUNT(*) FROM wards;
