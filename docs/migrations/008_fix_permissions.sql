-- ============================================
-- FIX PERMISSIONS (Explicit Grants)
-- ============================================

-- Ensure the 'anon' and 'authenticated' roles have permission to access the tables.
-- Sometimes RLS is enabled but the role itself lacks the basic GRANT.

GRANT USAGE ON SCHEMA public TO anon, authenticated;

GRANT SELECT, INSERT, UPDATE ON TABLE users TO anon, authenticated;
GRANT SELECT, INSERT ON TABLE app_logs TO anon, authenticated;
GRANT SELECT, INSERT ON TABLE analytics_events TO anon, authenticated;

-- Ensure sequences are accessible (if any)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;

-- Re-affirm the public access policy just in case
DROP POLICY IF EXISTS "Public profiles are viewable by everyone" ON users;
CREATE POLICY "Public profiles are viewable by everyone" 
ON users FOR SELECT 
USING (true);
