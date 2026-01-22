-- legacy
-- Make room_heartbeat an UPSERT operation
-- This ensures that if a user's row doesn't exist (e.g., joinRoom failed due to RLS race),
-- the heartbeat will create it. This is the ultimate safety net for presence.

CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text, p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- 🔒 SECURE: Verify Signature before action
    PERFORM verify_user_signature(p_user_id, '/rpc/room_heartbeat');

    -- UPSERT participant heartbeat
    -- If row exists: update last_seen
    -- If row doesn't exist: insert new row
    INSERT INTO public.room_participants (room_id, user_id, last_seen, is_host)
    VALUES (p_room_id, p_user_id, NOW(), false)
    ON CONFLICT (room_id, user_id)
    DO UPDATE SET last_seen = NOW();

    -- Update room activity
    UPDATE public.rooms
    SET last_activity = NOW()
    WHERE id = p_room_id;
END;
$$;
