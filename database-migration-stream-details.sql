-- Migration: Add detailed stream info to rooms table
-- This allows guests to sync exactly with the host's selected stream
-- Date: 2025-12-07

-- Add stream details columns to rooms table
ALTER TABLE rooms
ADD COLUMN selected_quality TEXT,
ADD COLUMN selected_file_idx INTEGER,
ADD COLUMN unlocked_stream_url TEXT;

-- Add comments to document the columns
COMMENT ON COLUMN rooms.selected_quality IS 'Quality of selected stream (e.g. 1080p, 4K)';
COMMENT ON COLUMN rooms.selected_file_idx IS 'Index of the selected file within the torrent/stream';
COMMENT ON COLUMN rooms.unlocked_stream_url IS 'Direct URL to the unlocked stream (RealDebrid link)';
