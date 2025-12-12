-- FIX: Deduplicate Watch History & Fix Logic
-- The issue: UNIQUE constraints in Postgres allow multiple NULLs (so multiple entries for the same movie).
-- The fix: Transform NULLs to -1 (sentinels) and enforcing uniqueness on non-null values.

-- 1. Clean up existing duplicates (Keeping the most recently watched one)
DELETE FROM user_watch_history
WHERE id IN (
    SELECT id
    FROM (
        SELECT id,
               ROW_NUMBER() OVER (
                   PARTITION BY user_id, media_id, COALESCE(season, -1), COALESCE(episode, -1)
                   ORDER BY last_watched DESC
               ) as rnum
        FROM user_watch_history
    ) t
    WHERE t.rnum > 1
);

-- 2. Update existing NULLs to -1
UPDATE user_watch_history SET season = -1 WHERE season IS NULL;
UPDATE user_watch_history SET episode = -1 WHERE episode IS NULL;

-- 3. Alter columns to be NOT NULL with Default -1
ALTER TABLE user_watch_history 
    ALTER COLUMN season SET DEFAULT -1,
    ALTER COLUMN season SET NOT NULL,
    ALTER COLUMN episode SET DEFAULT -1,
    ALTER COLUMN episode SET NOT NULL;

-- 4. Re-create the Unique Constraint
ALTER TABLE user_watch_history DROP CONSTRAINT IF EXISTS unique_user_media;

ALTER TABLE user_watch_history
ADD CONSTRAINT unique_user_media 
UNIQUE (user_id, media_id, season, episode);

-- 5. Enable RLS and Realtime (Already enabled, so skipping to avoid error)
-- ALTER PUBLICATION supabase_realtime ADD TABLE user_watch_history;
