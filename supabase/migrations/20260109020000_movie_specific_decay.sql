-- Fix: Make decay trigger movie-specific
-- Previously: Reports for Movie A would also decay Movie B if they shared the same stream_hash
-- Now: Reports only affect the specific (imdb_id, stream_hash) combination

CREATE OR REPLACE FUNCTION public.decay_verified_stream_on_report()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_current_votes int;
BEGIN
  -- 1. Decrement vote_count for the SPECIFIC movie + stream combination
  UPDATE public.verified_streams
  SET 
    vote_count = vote_count - 1,
    last_verified_at = NOW()
  WHERE stream_hash = NEW.stream_hash 
    AND imdb_id = NEW.imdb_id  -- ✅ FIX: Now movie-specific!
  RETURNING vote_count INTO v_current_votes;

  -- 2. Check threshold (-3). Only delete the specific entry.
  IF v_current_votes <= -3 THEN
    DELETE FROM public.verified_streams
    WHERE stream_hash = NEW.stream_hash
      AND imdb_id = NEW.imdb_id;  -- ✅ FIX: Movie-specific deletion
  END IF;

  RETURN NEW;
END;
$$;
