-- Social Features Migration: Friendships and Direct Messages (CLEAN SLATE)

-- ⚠️ DROP TABLES IF THEY EXIST (To fix schema mismatches)
DROP TABLE IF EXISTS direct_messages;
DROP TABLE IF EXISTS friendships;

-- 1. Friendships Table
CREATE TABLE friendships (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id_1 UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    user_id_2 UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    status TEXT NOT NULL CHECK (status IN ('pending', 'accepted', 'blocked')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Ensure unique pair regardless of order
    CONSTRAINT unique_friendship UNIQUE (user_id_1, user_id_2)
);

-- Index for fast lookups
CREATE INDEX idx_friendships_user_1 ON friendships(user_id_1);
CREATE INDEX idx_friendships_user_2 ON friendships(user_id_2);

-- RLS Policies for Friendships
ALTER TABLE friendships ENABLE ROW LEVEL SECURITY;

-- Users can see their own friendships
CREATE POLICY "Users can view their own friendships" 
ON friendships FOR SELECT 
USING (auth.uid() = user_id_1 OR auth.uid() = user_id_2);

-- Users can create friend requests (insert)
CREATE POLICY "Users can create friend requests" 
ON friendships FOR INSERT 
WITH CHECK (auth.uid() = user_id_1);

-- Users can update their own friendships (accept/block)
CREATE POLICY "Users can update their own friendships" 
ON friendships FOR UPDATE 
USING (auth.uid() = user_id_1 OR auth.uid() = user_id_2);

-- 2. Direct Messages Table
CREATE TABLE direct_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    receiver_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fetching chat history
CREATE INDEX idx_direct_messages_sender ON direct_messages(sender_id);
CREATE INDEX idx_direct_messages_receiver ON direct_messages(receiver_id);
CREATE INDEX idx_direct_messages_created_at ON direct_messages(created_at);

-- RLS Policies for Direct Messages
ALTER TABLE direct_messages ENABLE ROW LEVEL SECURITY;

-- Users can see messages they sent or received
CREATE POLICY "Users can view their own messages" 
ON direct_messages FOR SELECT 
USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

-- Users can send messages
CREATE POLICY "Users can send messages" 
ON direct_messages FOR INSERT 
WITH CHECK (auth.uid() = sender_id);

-- Users can update read status of received messages
CREATE POLICY "Users can update received messages" 
ON direct_messages FOR UPDATE 
USING (auth.uid() = receiver_id);

-- Enable Realtime for these tables
ALTER PUBLICATION supabase_realtime ADD TABLE friendships;
ALTER PUBLICATION supabase_realtime ADD TABLE direct_messages;
