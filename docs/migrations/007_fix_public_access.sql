-- ============================================
-- FIX PUBLIC ACCESS (Login & Search)
-- ============================================

-- The previous RLS policies locked down the 'users' table too tight.
-- We need to allow anyone (anon and authenticated) to read user profiles.
-- This is required for:
-- 1. "Login by Username" (finding the user ID for a given username)
-- 2. Searching for friends
-- 3. Viewing room hosts

DROP POLICY IF EXISTS "Public profiles are viewable by everyone" ON users;
CREATE POLICY "Public profiles are viewable by everyone" 
ON users FOR SELECT 
USING (true);

-- Note: We keep the "Users can update own profile" policy from 006
-- so that only the user themselves can edit their data.
