-- FIX: Update Social Features (Friendships & DMs) to work with custom 'public.users' auth
-- comprehensive fix for Foreign Keys and RLS policies

-- ==========================================
-- 1. FIX FOREIGN KEYS (auth.users -> public.users)
-- ==========================================

-- A. Friendships
ALTER TABLE friendships DROP CONSTRAINT IF EXISTS friendships_user_id_1_fkey;
ALTER TABLE friendships DROP CONSTRAINT IF EXISTS friendships_user_id_2_fkey;

ALTER TABLE friendships
    ADD CONSTRAINT friendships_user_id_1_fkey
    FOREIGN KEY (user_id_1) REFERENCES public.users(id) ON DELETE CASCADE;

ALTER TABLE friendships
    ADD CONSTRAINT friendships_user_id_2_fkey
    FOREIGN KEY (user_id_2) REFERENCES public.users(id) ON DELETE CASCADE;

-- B. Direct Messages
ALTER TABLE direct_messages DROP CONSTRAINT IF EXISTS direct_messages_sender_id_fkey;
ALTER TABLE direct_messages DROP CONSTRAINT IF EXISTS direct_messages_receiver_id_fkey;

ALTER TABLE direct_messages
    ADD CONSTRAINT direct_messages_sender_id_fkey
    FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE CASCADE;

ALTER TABLE direct_messages
    ADD CONSTRAINT direct_messages_receiver_id_fkey
    FOREIGN KEY (receiver_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- ==========================================
-- 2. FIX RLS POLICIES (Allow public access for custom auth)
-- ==========================================

-- A. Friendships
DROP POLICY IF EXISTS "Users can view their own friendships" ON friendships;
DROP POLICY IF EXISTS "Users can create friend requests" ON friendships;
DROP POLICY IF EXISTS "Users can update their own friendships" ON friendships;

CREATE POLICY "Enable all access for friendships"
ON friendships FOR ALL
USING (true)
WITH CHECK (true);

-- B. Direct Messages
DROP POLICY IF EXISTS "Users can view their own messages" ON direct_messages;
DROP POLICY IF EXISTS "Users can send messages" ON direct_messages;
DROP POLICY IF EXISTS "Users can update received messages" ON direct_messages;

CREATE POLICY "Enable all access for direct_messages"
ON direct_messages FOR ALL
USING (true)
WITH CHECK (true);
