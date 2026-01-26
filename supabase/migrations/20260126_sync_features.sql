-- Migration: Add User Library and Watch History
-- Date: 2026-01-26

-- 1. User Library
CREATE TABLE IF NOT EXISTS public.user_library (
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    item_id TEXT NOT NULL, -- IMDB ID
    name TEXT NOT NULL,
    type TEXT NOT NULL, -- 'movie' or 'series'
    poster_url TEXT,
    year TEXT,
    media_meta JSONB DEFAULT '{}'::jsonb, -- Store full metadata if needed
    added_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_id, item_id)
);

ALTER TABLE public.user_library ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (to allow re-running migration)
DROP POLICY IF EXISTS "Users can view their own library" ON public.user_library;
DROP POLICY IF EXISTS "Users can insert their own library items" ON public.user_library;
DROP POLICY IF EXISTS "Users can update their own library items" ON public.user_library;
DROP POLICY IF EXISTS "Users can delete their own library items" ON public.user_library;

CREATE POLICY "Users can view their own library"
    ON public.user_library FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own library items"
    ON public.user_library FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own library items"
    ON public.user_library FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own library items"
    ON public.user_library FOR DELETE
    USING (auth.uid() = user_id);

-- 2. User Watch History
CREATE TABLE IF NOT EXISTS public.user_watch_history (
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    item_id TEXT NOT NULL, -- "mediaId" or "mediaId:S:E"
    media_name TEXT NOT NULL,
    media_type TEXT NOT NULL,
    poster_url TEXT,
    timestamp FLOAT NOT NULL DEFAULT 0,
    duration FLOAT NOT NULL DEFAULT 0,
    progress FLOAT NOT NULL DEFAULT 0,
    season INT,
    episode INT,
    media_meta JSONB DEFAULT '{}'::jsonb, -- Store full MediaItem
    last_watched TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_id, item_id)
);

ALTER TABLE public.user_watch_history ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view their own history" ON public.user_watch_history;
DROP POLICY IF EXISTS "Users can insert their own history" ON public.user_watch_history;
DROP POLICY IF EXISTS "Users can update their own history" ON public.user_watch_history;
DROP POLICY IF EXISTS "Users can delete their own history" ON public.user_watch_history;

CREATE POLICY "Users can view their own history"
    ON public.user_watch_history FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own history"
    ON public.user_watch_history FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own history"
    ON public.user_watch_history FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own history"
    ON public.user_watch_history FOR DELETE
    USING (auth.uid() = user_id);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_library_user_added ON public.user_library(user_id, added_at DESC);
CREATE INDEX IF NOT EXISTS idx_history_user_watched ON public.user_watch_history(user_id, last_watched DESC);
