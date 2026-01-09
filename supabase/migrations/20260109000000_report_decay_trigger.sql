-- Migration: Report-Based Verified Stream Decay
-- When a stream is reported, decrement the verified vote count.
-- If vote_count drops to -5 or below, auto-delete the verification.
-- Date: 2026-01-09

-- Create the trigger function
CREATE OR REPLACE FUNCTION public.decay_verified_stream_on_report()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Decrement vote_count for the matching verified stream (if exists)
  UPDATE public.verified_streams
  SET vote_count = vote_count - 1,
      last_verified_at = NOW() -- Update timestamp to track decay
  WHERE stream_hash = NEW.stream_hash;
  
  -- If vote_count dropped to -5 or below, remove the verification entirely
  DELETE FROM public.verified_streams
  WHERE stream_hash = NEW.stream_hash
    AND vote_count <= -5;
  
  RETURN NEW;
END;
$$;

-- Create the trigger on reported_streams
CREATE TRIGGER on_report_decay_verified
  AFTER INSERT ON public.reported_streams
  FOR EACH ROW
  EXECUTE FUNCTION public.decay_verified_stream_on_report();

-- Comment
COMMENT ON FUNCTION public.decay_verified_stream_on_report() IS 'Decrements verified stream votes when reported. Removes verification at -5 votes.';
