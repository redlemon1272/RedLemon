-- ==============================================================================
-- REDLEMON ROOM CLEANUP SCRIPT (V3 - SAFER FORCE MODE)
-- ==============================================================================
-- Changes in V3:
-- - Handles "Zombie Lobbies" where Host is present (count=1) but inactive.
-- - PROTECTS active movies (is_playing=true) unless extremely old.
-- - Logic:
--   1. If Lobby/Paused (is_playing=false) AND Inactive > 1 hour -> DELETE
--   2. If Playing (is_playing=true) AND Inactive > 6 hours -> DELETE (Stuck/Crashed)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. STORED PROCEDURE
-- ------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.cleanup_stale_rooms()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    deleted_count INT;
BEGIN
    DELETE FROM public.rooms
    WHERE 
      (
        -- Case A: Zombie Lobby (Host crashed/left without DB update)
        -- Playing is FALSE, and no activity for 1 hour.
        (is_playing = false AND last_activity < NOW() - INTERVAL '1 hour')
        OR
        -- Case B: Stuck Playback (Host crashed while playing)
        -- Playing is TRUE, but no activity for 6 hours (Safe max movie length).
        (is_playing = true AND last_activity < NOW() - INTERVAL '6 hours')
      )
      AND id NOT LIKE 'event_%'; -- Exclude system events
      
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    
    IF deleted_count > 0 THEN
        RAISE NOTICE 'Cleaned up % stale rooms (Force Mode).', deleted_count;
    END IF;
END;
$$;

-- ------------------------------------------------------------------------------
-- 2. AUTOMATION (PG_CRON)
-- ------------------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA extensions;

-- Unschedule robustly
SELECT cron.unschedule(jobid)
FROM cron.job
WHERE jobname = 'cleanup-stale-rooms';

-- Schedule new job (Every hour)
SELECT cron.schedule(
    'cleanup-stale-rooms',
    '0 * * * *', 
    'SELECT public.cleanup_stale_rooms();'
);

-- ------------------------------------------------------------------------------
-- 3. MANUAL CLEANUP (IMMEDIATE)
-- ------------------------------------------------------------------------------
SELECT public.cleanup_stale_rooms();

-- Verification
SELECT id, name, participants_count, is_playing, last_activity 
FROM public.rooms 
WHERE id NOT LIKE 'event_%'
ORDER BY last_activity ASC;
