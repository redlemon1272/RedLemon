ALTER TABLE public.user_watch_history ADD COLUMN IF NOT EXISTS timestamp FLOAT8;
ALTER TABLE public.user_watch_history ADD COLUMN IF NOT EXISTS duration FLOAT8;
