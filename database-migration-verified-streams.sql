-- Migration: Create verified_streams table for community caching
-- Date: 2025-12-15

CREATE TABLE verified_streams (
    -- Composite Key: We track verification per movie/episode AND quality
    -- This ensures we don't return a 4K stream for a 720p request
    imdb_id TEXT NOT NULL,
    quality TEXT NOT NULL, -- '2160p', '1080p', '720p', '480p'
    
    stream_hash TEXT NOT NULL,
    magnet_link TEXT, -- Cached magnet for instant resolve (optional, can just use hash)
    
    vote_count INTEGER DEFAULT 1,
    last_verified_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    PRIMARY KEY (imdb_id, quality)
);

-- Index for fast lookup
CREATE INDEX idx_verified_streams_lookup ON verified_streams(imdb_id, quality);

-- Comment
COMMENT ON TABLE verified_streams IS 'Community verified streams that are known to work well.';
