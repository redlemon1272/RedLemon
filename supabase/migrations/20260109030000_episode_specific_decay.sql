-- Fix: Make decay trigger episode-specific for TV shows
-- Add season/episode columns to reported_streams table

-- 1. Add columns (default -1 for movies, like verified_streams does)
ALTER TABLE public.reported_streams 
ADD COLUMN IF NOT EXISTS season INT DEFAULT -1,
ADD COLUMN IF NOT EXISTS episode INT DEFAULT -1;

-- 2. Update trigger to be fully episode-specific
CREATE OR REPLACE FUNCTION public.decay_verified_stream_on_report()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_current_votes int;
BEGIN
  -- Decrement vote_count for the SPECIFIC (imdb, season, episode, hash) combination
  UPDATE public.verified_streams
  SET 
    vote_count = vote_count - 1,
    last_verified_at = NOW()
  WHERE stream_hash = NEW.stream_hash 
    AND imdb_id = NEW.imdb_id
    AND season = NEW.season      -- ✅ Episode-specific
    AND episode = NEW.episode    -- ✅ Episode-specific
  RETURNING vote_count INTO v_current_votes;

  -- Check threshold (-3). Only delete the specific entry.
  IF v_current_votes <= -3 THEN
    DELETE FROM public.verified_streams
    WHERE stream_hash = NEW.stream_hash
      AND imdb_id = NEW.imdb_id
      AND season = NEW.season
      AND episode = NEW.episode;
  END IF;

  RETURN NEW;
END;
$$;

-- 3. Update unique constraint to include season/episode
DROP INDEX IF EXISTS unique_user_report;
CREATE UNIQUE INDEX unique_user_report ON public.reported_streams(user_id, stream_hash, imdb_id, season, episode);
