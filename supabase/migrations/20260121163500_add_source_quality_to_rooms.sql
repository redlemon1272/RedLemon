-- AI_BIBLE #91: Add source_quality for Guest/Host Stream Sync
-- This column persists the stream title/filename when the stream provider (e.g. DebridSearch)
-- does not provide an infoHash, allowing Guests to resolve the same file via title matching.

ALTER TABLE rooms ADD COLUMN IF NOT EXISTS source_quality TEXT;
COMMENT ON COLUMN rooms.source_quality IS 'Stream title/filename for fallback matching in Watch Party when InfoHash is nil (Landmine #91)';
