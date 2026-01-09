-- 1. CLEANUP: Delete existing reports to allow fresh unique constraints
-- Since reports are transient signals, wiping them is better than dealing with legacy NULL user_ids
DELETE FROM public.reported_streams;

-- 2. SCHEMA: Add user_id column
ALTER TABLE public.reported_streams 
ADD COLUMN user_id UUID REFERENCES auth.users(id);

-- 3. CONSTRAINT: Enforce unique reports per user per stream
-- This prevents a single user from spamming reports to nuke a stream
CREATE UNIQUE INDEX unique_user_report ON public.reported_streams(user_id, stream_hash);

-- 4. LOGIC: Update the decay trigger to be more aggressive (-3 instead of -5)
CREATE OR REPLACE FUNCTION public.decay_verified_stream_on_report()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_current_votes int;
BEGIN
  -- 1. Decrement vote_count for the reported stream
  UPDATE public.verified_streams
  SET 
    vote_count = vote_count - 1,
    last_verified_at = NOW()
  WHERE stream_hash = NEW.stream_hash
  RETURNING vote_count INTO v_current_votes;

  -- 2. Check if vote_count dropped below threshold (-3)
  -- If so, delete the verification (Un-verify)
  IF v_current_votes <= -3 THEN
    DELETE FROM public.verified_streams
    WHERE stream_hash = NEW.stream_hash;
    
    -- Optional: Log the deletion? (For now, just delete)
  END IF;

  RETURN NEW;
END;
$$;
