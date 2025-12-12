-- Watch History Migration

-- 1. Create table
CREATE TABLE user_watch_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    media_id TEXT NOT NULL,
    media_type TEXT NOT NULL, -- 'movie', 'series'
    title TEXT NOT NULL,
    season INTEGER,
    episode INTEGER,
    progress FLOAT DEFAULT 0,
    poster_url TEXT,
    last_watched TIMESTAMPTZ DEFAULT NOW(),
    
    -- Ensure one entry per media item per user
    CONSTRAINT unique_user_media UNIQUE (user_id, media_id, season, episode)
);

-- 2. Indexes
CREATE INDEX idx_history_user_id ON user_watch_history(user_id);
CREATE INDEX idx_history_last_watched ON user_watch_history(last_watched);

-- 3. RLS
ALTER TABLE user_watch_history ENABLE ROW LEVEL SECURITY;

-- Users can insert/update their own history
CREATE POLICY "Users can manage their own history" 
ON user_watch_history 
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can view their own history OR their friends' history
CREATE POLICY "Users can view own and friends history" 
ON user_watch_history FOR SELECT 
USING (
    auth.uid() = user_id 
    OR 
    EXISTS (
        SELECT 1 FROM friendships 
        WHERE 
            (
                (user_id_1 = auth.uid() AND user_id_2 = user_watch_history.user_id) 
                OR 
                (user_id_1 = user_watch_history.user_id AND user_id_2 = auth.uid())
            )
            AND status = 'accepted'
    )
);

-- 4. Enable Realtime
ALTER PUBLICATION supabase_realtime ADD TABLE user_watch_history;
