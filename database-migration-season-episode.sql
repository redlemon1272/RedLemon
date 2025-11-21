-- Migration: Add season and episode support to rooms table
-- This allows TV show episodes to be properly tracked in Watch Party rooms
-- Date: 2025-11-20

-- Add season and episode columns to rooms table
ALTER TABLE rooms
ADD COLUMN season INTEGER,
ADD COLUMN episode INTEGER;

-- Add index for faster queries on season/episode
CREATE INDEX idx_rooms_season_episode ON rooms(season, episode);

-- Add comment to document the columns
COMMENT ON COLUMN rooms.season IS 'Season number for TV show episodes (NULL for movies)';
COMMENT ON COLUMN rooms.episode IS 'Episode number for TV show episodes (NULL for movies)';
