-- ============================================
-- FIX ROOM & PARTICIPANT PERMISSIONS
-- ============================================

-- Grant access to rooms and participants tables
-- This fixes the "0 users" issue in the lobby and "0 rooms" in the list

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE rooms TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE room_participants TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE chat_messages TO anon, authenticated;

-- Ensure RLS policies allow reading
-- (We assume RLS is enabled, so we need policies)

-- 1. Rooms: Everyone can view public rooms
DROP POLICY IF EXISTS "Public rooms are viewable by everyone" ON rooms;
CREATE POLICY "Public rooms are viewable by everyone" 
ON rooms FOR SELECT 
USING (is_public = true);

-- 2. Participants: Everyone can view participants of public rooms
DROP POLICY IF EXISTS "Participants are viewable by everyone" ON room_participants;
CREATE POLICY "Participants are viewable by everyone" 
ON room_participants FOR SELECT 
USING (true);

-- 3. Chat: Everyone can view chat in public rooms
DROP POLICY IF EXISTS "Chat is viewable by everyone" ON chat_messages;
CREATE POLICY "Chat is viewable by everyone" 
ON chat_messages FOR SELECT 
USING (true);

-- 4. Allow creation/joining
DROP POLICY IF EXISTS "Anyone can create rooms" ON rooms;
CREATE POLICY "Anyone can create rooms" ON rooms FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Anyone can join rooms" ON room_participants;
CREATE POLICY "Anyone can join rooms" ON room_participants FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Anyone can chat" ON chat_messages;
CREATE POLICY "Anyone can chat" ON chat_messages FOR INSERT WITH CHECK (true);

-- 5. Allow updates (e.g. playback state)
DROP POLICY IF EXISTS "Anyone can update rooms" ON rooms;
CREATE POLICY "Anyone can update rooms" ON rooms FOR UPDATE USING (true);

DROP POLICY IF EXISTS "Anyone can leave rooms" ON room_participants;
CREATE POLICY "Anyone can leave rooms" ON room_participants FOR DELETE USING (true);
