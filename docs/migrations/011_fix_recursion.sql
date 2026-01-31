-- ============================================
-- FIX INFINITE RECURSION
-- ============================================

-- The error "infinite recursion detected in policy for relation users" 
-- happens because the "Admins can view all users" policy queries the 'users' table,
-- which triggers the policy again, and so on.

-- 1. Create a helper function to check admin status safely (bypassing RLS)
CREATE OR REPLACE FUNCTION auth_is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  -- SECURITY DEFINER allows this function to run with the privileges of the creator,
  -- bypassing RLS on the 'users' table for this specific check.
  RETURN EXISTS (
    SELECT 1 FROM users 
    WHERE id = auth.uid() 
    AND is_admin = true
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute to everyone
GRANT EXECUTE ON FUNCTION auth_is_admin() TO anon, authenticated, service_role;

-- 2. Drop the recursive policy
DROP POLICY IF EXISTS "Admins can view all users" ON users;

-- 3. Ensure Public Access is the primary policy for SELECT
-- (This was added in 007 but we re-affirm it here to be sure)
DROP POLICY IF EXISTS "Public profiles are viewable by everyone" ON users;
CREATE POLICY "Public profiles are viewable by everyone" 
ON users FOR SELECT 
USING (true);

-- 4. Re-add Admin policy using the safe function (Optional, but good for clarity/future)
-- This allows admins to view users even if we later disable public access.
CREATE POLICY "Admins can view all users (Safe)" 
ON users FOR SELECT 
USING (auth_is_admin());
