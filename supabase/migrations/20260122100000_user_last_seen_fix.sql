-- Migration: Accurate User Last Seen
-- Date: 2026-01-22
-- Description: Updates public.users.last_seen during both room heartbeats and global app heartbeats.

-- 1. Create User Heartbeat RPC (Global Presence)
CREATE OR REPLACE FUNCTION public.user_heartbeat(p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- 🔒 SECURE: Verify Signature
    PERFORM verify_user_signature(p_user_id, '/rpc/user_heartbeat');

    -- Update user's last_seen globally
    UPDATE public.users
    SET last_seen = NOW()
    WHERE id = p_user_id;
END;
$$;

GRANT EXECUTE ON FUNCTION public.user_heartbeat(uuid) TO anon, authenticated, service_role;

-- 2. Update Room Heartbeat to also update User table
-- This covers users actively in a watch party.
CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text, p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- 🔒 SECURE: Verify Signature before action
    PERFORM verify_user_signature(p_user_id, '/rpc/room_heartbeat');

    -- UPSERT participant heartbeat (Room Specific)
    INSERT INTO public.room_participants (room_id, user_id, last_seen, is_host)
    VALUES (p_room_id, p_user_id, NOW(), false)
    ON CONFLICT (room_id, user_id)
    DO UPDATE SET last_seen = NOW();

    -- Update user's global last_seen
    UPDATE public.users
    SET last_seen = NOW()
    WHERE id = p_user_id;

    -- Update room activity
    UPDATE public.rooms
    SET last_activity = NOW()
    WHERE id = p_room_id;
END;
$$;
