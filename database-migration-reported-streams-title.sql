-- Migration: Add movie_title to reported_streams for better admin visibility
-- Date: 2025-12-16

-- Add movie_title column if it doesn't exist
ALTER TABLE reported_streams
ADD COLUMN IF NOT EXISTS movie_title TEXT;

-- Update comment
COMMENT ON COLUMN reported_streams.movie_title IS 'Title of the movie or TV show for display purposes';
