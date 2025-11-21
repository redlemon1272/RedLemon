-- Migration to fix friendships table schema
-- The table needs to use user_id_1, user_id_2, and status columns

-- Drop existing table if it has wrong schema
DROP TABLE IF EXISTS friendships CASCADE;

-- Recreate with correct schema
CREATE TABLE friendships (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id_1 UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  user_id_2 UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  status TEXT CHECK (status IN ('pending', 'accepted', 'blocked')) DEFAULT 'accepted',
  created_at TIMESTAMP DEFAULT NOW(),
  CONSTRAINT no_self_friendship CHECK (user_id_1 != user_id_2),
  CONSTRAINT unique_friendship UNIQUE (user_id_1, user_id_2)
);

CREATE INDEX idx_friendships_user_1 ON friendships(user_id_1);
CREATE INDEX idx_friendships_user_2 ON friendships(user_id_2);
CREATE INDEX idx_friendships_status ON friendships(status);

-- Enable RLS
ALTER TABLE friendships ENABLE ROW LEVEL SECURITY;

-- Allow anyone to view friendships (for friends list)
CREATE POLICY "Anyone can view friendships"
  ON friendships FOR SELECT
  USING (true);

-- Allow anyone to create friendships (for auto-friend and friend requests)
CREATE POLICY "Anyone can create friendships"
  ON friendships FOR INSERT
  WITH CHECK (true);

-- Allow users to delete their own friendships (unfriend)
CREATE POLICY "Users can delete their friendships"
  ON friendships FOR DELETE
  USING (true);

-- Allow updates to friendship status
CREATE POLICY "Anyone can update friendships"
  ON friendships FOR UPDATE
  USING (true);
