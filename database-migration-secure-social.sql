-- Secure Social Interactions Migration
-- 1. Create secure RPC for blocking
CREATE OR REPLACE FUNCTION manage_block(target_id UUID, action TEXT)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER -- Run as owner (bypass RLS)
AS $$
DECLARE
  requesting_user_id UUID;
  v_headers JSONB;
  v_signature TEXT;
  v_timestamp TEXT;
BEGIN
  -- 0. Get Headers safely (handling potential missing headers)
  BEGIN
    v_headers := current_setting('request.headers', true)::jsonb;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Could not access request headers.';
  END;

  -- 1. Extract Identity from Headers
  -- We trust x-identity-id because we VERIFY the signature against it below.
  -- If someone spoofs x-identity-id, signature verification will fail (key mismatch).
  requesting_user_id := (v_headers->>'x-identity-id')::uuid;

  IF requesting_user_id IS NULL THEN
    RAISE EXCEPTION 'Missing x-identity-id header';
  END IF;

  -- 2. Verify Signature
  -- We verify that the request to '/rpc/manage_block' was signed by requesting_user_id
  PERFORM verify_user_signature(requesting_user_id, '/rpc/manage_block');

  -- 3. Perform Action
  IF action = 'block' THEN
    INSERT INTO user_blocks (blocker_id, blocked_id)
    VALUES (requesting_user_id, target_id)
    ON CONFLICT DO NOTHING;
  ELSIF action = 'unblock' THEN
    DELETE FROM user_blocks
    WHERE blocker_id = requesting_user_id AND blocked_id = target_id;
  ELSE
    RAISE EXCEPTION 'Invalid action: %. Must be block or unblock.', action;
  END IF;
END;
$$;

-- 2. Lock down `user_blocks` Table
-- Remove the temporary "true" policies I added during debugging
DROP POLICY IF EXISTS "Enable insert for all users" ON user_blocks;
DROP POLICY IF EXISTS "Enable delete for all users" ON user_blocks;

-- 3. Lock down `users` Table
-- Remove insecure policies that allow anyone to update/create users
-- (Reads are still public via "Enable read access for all users")
DROP POLICY IF EXISTS "Anyone can update users" ON public.users;
DROP POLICY IF EXISTS "Anyone can create users" ON public.users;

-- Ensure RLS is enabled
ALTER TABLE user_blocks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- 4. Grant access to new RPC
GRANT EXECUTE ON FUNCTION manage_block(UUID, TEXT) TO anon;
GRANT EXECUTE ON FUNCTION manage_block(UUID, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION manage_block(UUID, TEXT) TO service_role;
