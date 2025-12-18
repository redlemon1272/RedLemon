-- 20251217050000_fix_room_limit_trigger.sql
-- FIX: Use NEW.host_user_id instead of auth.uid() because the client uses custom auth (RPC) and requests come as 'anon'.

CREATE OR REPLACE FUNCTION check_room_creation_limits()
RETURNS TRIGGER AS $$
DECLARE
    target_user_id UUID;
BEGIN
  -- Use the host_user_id from the payload, fallback to auth.uid() if null (safety)
  target_user_id := COALESCE(NEW.host_user_id, auth.uid());

  -- If we still don't have a user ID, we can't enforce limits (or should block). 
  -- Assuming system requires host_user_id.
  IF target_user_id IS NULL THEN
      RETURN NEW;
  END IF;

  -- Check if user is premium
  IF (SELECT subscription_expires_at FROM users WHERE id = target_user_id) > NOW() THEN
    RETURN NEW; -- Premium user, allow
  END IF;

  -- Check active rooms (created in last 72h). 
  -- Use target_user_id!
  IF (SELECT COUNT(*) FROM rooms WHERE host_user_id = target_user_id AND created_at > NOW() - INTERVAL '72 hours') >= 1 THEN
    RAISE EXCEPTION 'Free Tier Limit: You can only host 1 active room at a time.';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
