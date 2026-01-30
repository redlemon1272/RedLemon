-- ============================================
-- ADMIN ACCESS & UTILITIES
-- ============================================

-- 1. Allow Admins to view all users (for Dashboard User Count)
-- Note: We assume RLS is enabled on 'users'. If not, this does nothing but is safe.
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admins can view all users" ON users;
CREATE POLICY "Admins can view all users" 
ON users FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM users 
        WHERE id = auth.uid() AND is_admin = TRUE
    )
);

-- 2. Allow Users to view their own profile (Critical for app functionality)
DROP POLICY IF EXISTS "Users can view own profile" ON users;
CREATE POLICY "Users can view own profile" 
ON users FOR SELECT 
USING (
    auth.uid() = id
);

-- 3. Allow Users to update their own profile (e.g. last_seen)
DROP POLICY IF EXISTS "Users can update own profile" ON users;
CREATE POLICY "Users can update own profile" 
ON users FOR UPDATE
USING (
    auth.uid() = id
)
WITH CHECK (
    auth.uid() = id
);

-- 4. Allow Users to insert their own profile (on signup)
DROP POLICY IF EXISTS "Users can insert own profile" ON users;
CREATE POLICY "Users can insert own profile" 
ON users FOR INSERT
WITH CHECK (
    auth.uid() = id OR id IS NULL
);

-- 5. Public Server Time Function (for Health Check & Time Sync)
-- This avoids relying on table access for simple connectivity checks
CREATE OR REPLACE FUNCTION get_server_time()
RETURNS TIMESTAMP WITH TIME ZONE AS $$
BEGIN
  RETURN NOW();
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant access to anon and authenticated users
GRANT EXECUTE ON FUNCTION get_server_time() TO anon, authenticated, service_role;
