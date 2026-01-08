-- Migration: Fix Room Heartbeat to UPSERT
-- Date: 2026-01-08
-- Description: Makes room_heartbeat an UPSERT operation to ensure participants
--              are always tracked, even if initial joinRoom() insertion fails.
--              This fixes the bug where participant count drops to 0 incorrectly.

CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text, p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- UPSERT: Create participant if missing, update last_seen if exists
  -- This fixes the bug where joinRoom() insertion fails silently,
  -- causing the user to never be tracked in room_participants.
  INSERT INTO public.room_participants (room_id, user_id, is_host, last_seen, joined_at)
  VALUES (p_room_id, p_user_id, false, NOW(), NOW())
  ON CONFLICT (room_id, user_id)
  DO UPDATE SET last_seen = NOW();

  -- Update room activity (keep it alive)
  UPDATE public.rooms
  SET last_activity = NOW()
  WHERE id = p_room_id;
END;
$$;

-- Ensure proper permissions
GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO service_role;
