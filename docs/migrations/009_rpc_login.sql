-- ============================================
-- SECURE LOGIN RPC
-- ============================================

-- This function handles the "Login or Register" flow securely on the server side.
-- It runs with SECURITY DEFINER privileges, bypassing RLS policies.
-- This ensures that even if the 'users' table is locked down, 
-- users can still log in if they know their username.

CREATE OR REPLACE FUNCTION login_by_username(p_username text)
RETURNS SETOF users AS $$
DECLARE
  v_user users%ROWTYPE;
BEGIN
  -- 1. Try to find existing user (case-insensitive)
  SELECT * INTO v_user 
  FROM users 
  WHERE username ILIKE p_username 
  LIMIT 1;
  
  IF FOUND THEN
    -- Update last_seen
    UPDATE users SET last_seen = NOW() WHERE id = v_user.id;
    RETURN NEXT v_user;
    RETURN;
  END IF;
  
  -- 2. Create new user if not found
  INSERT INTO users (username) 
  VALUES (p_username) 
  RETURNING * INTO v_user;
  
  RETURN NEXT v_user;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission to anon and authenticated roles
GRANT EXECUTE ON FUNCTION login_by_username(text) TO anon, authenticated, service_role;
