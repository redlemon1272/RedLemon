-- Migration: Add is_host column to room_participants
-- Description: Fixes participant polling by adding missing is_host field
-- Date: 2025-11-09
--
-- Issue: "keyNotFound(CodingKeys(stringValue: "is_host", intValue: nil))"
-- The Swift code expects is_host but the database table doesn't have it

-- ============================================
-- 1. ADD is_host COLUMN
-- ============================================

ALTER TABLE room_participants
ADD COLUMN IF NOT EXISTS is_host BOOLEAN NOT NULL DEFAULT false;

-- ============================================
-- 2. UPDATE EXISTING RECORDS
-- ============================================

-- Mark the first participant of each room as host
-- This handles any existing data
WITH first_participants AS (
  SELECT DISTINCT ON (room_id)
    user_id,
    room_id
  FROM room_participants
  ORDER BY room_id, joined_at ASC
)
UPDATE room_participants rp
SET is_host = true
FROM first_participants fp
WHERE rp.room_id = fp.room_id
  AND rp.user_id = fp.user_id;

-- ============================================
-- 3. CREATE INDEX FOR PERFORMANCE
-- ============================================

CREATE INDEX IF NOT EXISTS idx_room_participants_is_host
ON room_participants(room_id, is_host);

-- ============================================
-- VERIFICATION
-- ============================================

-- After running this, verify with:
-- SELECT * FROM room_participants;
-- You should see the is_host column with true/false values

-- ============================================
-- NOTES
-- ============================================

-- This migration:
-- 1. Adds the is_host boolean column with default false
-- 2. Updates existing rows to mark the first joiner as host
-- 3. Adds an index for faster queries
-- 4. Is safe to run multiple times (IF NOT EXISTS)

-- The Swift code (LobbyViewModel) expects this structure:
--   struct RoomParticipant: Codable {
--     let userId: UUID
--     let username: String
--     let isHost: Bool  // <-- This was missing in database!
--   }
