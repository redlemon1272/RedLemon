-- Migration: Fix delete_room_on_host_exit to skip event rooms
-- Date: 2026-01-08
-- Description: Event rooms should NOT be deleted when the "host" leaves
--              because they are system-hosted persistent events.
--              Only user-hosted rooms should be deleted when the host leaves.

CREATE OR REPLACE FUNCTION public.delete_room_on_host_exit()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
DECLARE
  v_host_user_id UUID;
BEGIN
  -- SKIP EVENT ROOMS: Event rooms are persistent and should not be deleted
  -- when any user (including the creator) leaves.
  IF OLD.room_id LIKE 'event_%' THEN
    RETURN NULL;
  END IF;

  -- Get the host user ID for this room
  SELECT r.host_user_id INTO v_host_user_id
  FROM rooms r
  WHERE r.id = OLD.room_id;

  -- If the leaving user IS the host, delete the entire room
  IF OLD.user_id = v_host_user_id THEN
    DELETE FROM rooms WHERE id = OLD.room_id;
    RAISE NOTICE 'Room % deleted because host left', OLD.room_id;
  END IF;

  RETURN NULL;
END;
$function$;
