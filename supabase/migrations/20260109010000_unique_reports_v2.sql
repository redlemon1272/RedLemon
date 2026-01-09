-- 1. CLEANUP (Retry): Delete existing reports
DELETE FROM public.reported_streams;

-- 2. SCHEMA: Add user_id column referencing PUBLIC.users
ALTER TABLE public.reported_streams 
ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES public.users(id);

-- 3. CONSTRAINT: Enforce unique reports
CREATE UNIQUE INDEX IF NOT EXISTS unique_user_report ON public.reported_streams(user_id, stream_hash);

-- 4. LOGIC: Update decay trigger (-3)
CREATE OR REPLACE FUNCTION public.decay_verified_stream_on_report()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_current_votes int;
BEGIN
  -- 1. Decrement vote_count
  UPDATE public.verified_streams
  SET 
    vote_count = vote_count - 1,
    last_verified_at = NOW()
  WHERE stream_hash = NEW.stream_hash
  RETURNING vote_count INTO v_current_votes;

  -- 2. Check threshold (-3)
  IF v_current_votes <= -3 THEN
    DELETE FROM public.verified_streams
    WHERE stream_hash = NEW.stream_hash;
  END IF;

  RETURN NEW;
END;
$$;
