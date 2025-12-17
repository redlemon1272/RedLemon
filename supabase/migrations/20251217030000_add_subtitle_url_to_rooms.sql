-- Add subtitle_url to rooms table
ALTER TABLE rooms 
ADD COLUMN IF NOT EXISTS subtitle_url TEXT;

-- Update the comment for documentation
COMMENT ON COLUMN rooms.subtitle_url IS 'URL of the selected subtitle file for the event/room';
