-- Migration: Add heartbeat and stale participant cleanup
-- Description: Adds last_seen column and function to remove inactive users
-- Date: 2025-12-07

-- 1. Add last_seen column to room_participants
ALTER TABLE room_participants
ADD COLUMN IF NOT EXISTS last_seen TIMESTAMPTZ DEFAULT NOW();

-- 2. Function to clean up stale participants (inactive > 2 minutes)
CREATE OR REPLACE FUNCTION cleanup_stale_participants()
RETURNS void AS $$
BEGIN
  DELETE FROM room_participants
  WHERE last_seen < (NOW() - INTERVAL '2 minutes');
END;
$$ LANGUAGE plpgsql;

-- 3. Expose function to API (if needed, usually RPC calls work without this if permissions are right)
-- GRANT EXECUTE ON FUNCTION cleanup_stale_participants() TO service_role;
-- GRANT EXECUTE ON FUNCTION cleanup_stale_participants() TO authenticated;
-- GRANT EXECUTE ON FUNCTION cleanup_stale_participants() TO anon;
