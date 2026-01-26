ALTER TABLE public.user_watch_history ADD COLUMN IF NOT EXISTS media_meta JSONB;
-- Reload PostgREST schema cache to ensure new column is visible immediately
NOTIFY pgrst, 'reload config';
