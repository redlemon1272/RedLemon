-- ============================================
-- FIX CHAT REALTIME
-- ============================================

-- Ensure chat_messages is included in the realtime publication
-- This is required for clients to receive INSERT/UPDATE events
ALTER PUBLICATION supabase_realtime ADD TABLE chat_messages;

-- Just in case, ensure rooms and participants are also there
ALTER PUBLICATION supabase_realtime ADD TABLE rooms;
ALTER PUBLICATION supabase_realtime ADD TABLE room_participants;

-- Verify RLS for Realtime (Realtime respects RLS)
-- We already added "true" policies in 010, so this should be fine.
-- But let's double check we didn't miss anything.
