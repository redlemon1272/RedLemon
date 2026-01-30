-- Fix friendships RLS policy to allow INSERT operations
-- This enables the MySpace Tom auto-friend feature and friend requests

-- Drop existing policies if any
DROP POLICY IF EXISTS "Anyone can view friendships" ON friendships;
DROP POLICY IF EXISTS "Users can manage their friendships" ON friendships;

-- Allow anyone to view friendships (for friends list)
CREATE POLICY "Anyone can view friendships"
  ON friendships FOR SELECT
  USING (true);

-- Allow anyone to create friendships (for auto-friend and friend requests)
-- In production, you might want to restrict this to authenticated users
CREATE POLICY "Anyone can create friendships"
  ON friendships FOR INSERT
  WITH CHECK (true);

-- Allow users to delete their own friendships (unfriend)
CREATE POLICY "Users can delete their friendships"
  ON friendships FOR DELETE
  USING (true);

-- Similarly, add policies for friend_requests if missing
DROP POLICY IF EXISTS "Anyone can view friend requests" ON friend_requests;
DROP POLICY IF EXISTS "Anyone can create friend requests" ON friend_requests;
DROP POLICY IF EXISTS "Anyone can update friend requests" ON friend_requests;

CREATE POLICY "Anyone can view friend requests"
  ON friend_requests FOR SELECT
  USING (true);

CREATE POLICY "Anyone can create friend requests"
  ON friend_requests FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can update friend requests"
  ON friend_requests FOR UPDATE
  USING (true);

-- Add policies for user_activity and watch_history if missing
DROP POLICY IF EXISTS "Anyone can manage user activity" ON user_activity;
DROP POLICY IF EXISTS "Anyone can manage watch history" ON watch_history;

CREATE POLICY "Anyone can manage user activity"
  ON user_activity FOR ALL
  USING (true);

CREATE POLICY "Anyone can manage watch history"
  ON watch_history FOR ALL
  USING (true);

-- Allow updates to users table (for last_seen, etc)
DROP POLICY IF EXISTS "Anyone can update users" ON users;

CREATE POLICY "Anyone can update users"
  ON users FOR UPDATE
  USING (true);

-- Allow updates and deletes on rooms (for host controls)
DROP POLICY IF EXISTS "Anyone can update rooms" ON rooms;
DROP POLICY IF EXISTS "Anyone can delete rooms" ON rooms;

CREATE POLICY "Anyone can update rooms"
  ON rooms FOR UPDATE
  USING (true);

CREATE POLICY "Anyone can delete rooms"
  ON rooms FOR DELETE
  USING (true);

-- Allow deletes on room_participants (for leaving rooms)
DROP POLICY IF EXISTS "Anyone can leave rooms" ON room_participants;

CREATE POLICY "Anyone can leave rooms"
  ON room_participants FOR DELETE
  USING (true);

-- Allow deletes on chat_messages (for moderation)
DROP POLICY IF EXISTS "Anyone can delete chat" ON chat_messages;

CREATE POLICY "Anyone can delete chat"
  ON chat_messages FOR DELETE
  USING (true);
