-- Migration: Update verified_streams for TV Show support (Season/Episode)
-- Date: 2025-12-16

-- 1. Add new columns with default values (Movies use -1)
ALTER TABLE verified_streams 
ADD COLUMN season INTEGER DEFAULT -1 NOT NULL,
ADD COLUMN episode INTEGER DEFAULT -1 NOT NULL;

-- 2. Drop the old Primary Key (imdb_id, quality)
ALTER TABLE verified_streams 
DROP CONSTRAINT verified_streams_pkey;

-- 3. Create new Primary Key including season/episode
ALTER TABLE verified_streams 
ADD PRIMARY KEY (imdb_id, season, episode, quality);

-- 4. Update index (Optional, as PK creates an index, but good to be explicit if we have specific lookups)
DROP INDEX IF EXISTS idx_verified_streams_lookup;
CREATE INDEX idx_verified_streams_lookup_v2 ON verified_streams(imdb_id, season, episode, quality);

-- Comment
COMMENT ON TABLE verified_streams IS 'Community verified streams (Movies & TV Episodes).';
