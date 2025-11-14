# Supabase Setup Guide for RedLemon

## Step 1: Create Supabase Project

1. Go to https://supabase.com
2. Click "Start your project"
3. Create new project:
   - Name: `redlemon-backend`
   - Database Password: (generate strong password)
   - Region: Choose closest to your users
4. Wait 2 minutes for project to provision

## Step 2: Get API Credentials

1. Go to Project Settings → API
2. Copy these values:
   - **Project URL**: `https://xxx.supabase.co`
   - **Anon/Public Key**: `eyJhbGc...` (long JWT token)
3. Save them - you'll need them in Config.swift

## Step 3: Run Database Schema

1. Go to SQL Editor in Supabase dashboard
2. Create new query
3. Copy and paste the complete schema below
4. Click "Run" to execute

```sql
-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_cron";

-- ============================================
-- USERS & AUTHENTICATION
-- ============================================

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username TEXT UNIQUE NOT NULL,
  display_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  last_seen TIMESTAMP DEFAULT NOW(),
  CONSTRAINT username_length CHECK (char_length(username) >= 3 AND char_length(username) <= 20),
  CONSTRAINT username_format CHECK (username ~ '^[a-z0-9_]+$')
);

CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_last_seen ON users(last_seen);

-- ============================================
-- ROOMS (Watch Parties)
-- ============================================

CREATE TABLE rooms (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  host_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  host_username TEXT NOT NULL,
  stream_hash TEXT,
  imdb_id TEXT,
  poster_url TEXT,
  backdrop_url TEXT,
  playback_position INT DEFAULT 0,
  is_playing BOOLEAN DEFAULT FALSE,
  participants_count INT DEFAULT 1,
  max_participants INT DEFAULT 50,
  is_public BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW(),
  last_activity TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_rooms_public ON rooms(is_public, last_activity);
CREATE INDEX idx_rooms_imdb ON rooms(imdb_id);
CREATE INDEX idx_rooms_host ON rooms(host_user_id);

-- Room participants tracking
CREATE TABLE room_participants (
  room_id TEXT REFERENCES rooms(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  joined_at TIMESTAMP DEFAULT NOW(),
  is_ready BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (room_id, user_id)
);

-- ============================================
-- FRIENDS SYSTEM
-- ============================================

CREATE TABLE friendships (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  friend_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (user_id, friend_id),
  CONSTRAINT no_self_friendship CHECK (user_id != friend_id)
);

CREATE INDEX idx_friendships_user ON friendships(user_id);

CREATE TABLE friend_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  from_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  to_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  status TEXT CHECK (status IN ('pending', 'accepted', 'rejected')) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(from_user_id, to_user_id)
);

CREATE TABLE user_activity (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  current_room_id TEXT REFERENCES rooms(id) ON DELETE SET NULL,
  watching_title TEXT,
  watching_imdb_id TEXT,
  updated_at TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- CHAT MESSAGES
-- ============================================
-- Note: WebRTC signaling table removed - migrated to Supabase Realtime Broadcast

CREATE TABLE chat_messages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id TEXT REFERENCES rooms(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  username TEXT NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_chat_room ON chat_messages(room_id, created_at);

-- ============================================
-- WATCH HISTORY
-- ============================================

CREATE TABLE watch_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  imdb_id TEXT NOT NULL,
  title TEXT,
  poster_url TEXT,
  watched_at TIMESTAMP DEFAULT NOW(),
  progress_seconds INT,
  total_seconds INT
);

CREATE INDEX idx_watch_history_user ON watch_history(user_id, watched_at);

-- ============================================
-- FUNCTIONS & TRIGGERS
-- ============================================

-- Auto-delete old rooms (24 hours)
CREATE OR REPLACE FUNCTION cleanup_old_rooms()
RETURNS void AS $$
BEGIN
  DELETE FROM rooms
  WHERE last_activity < NOW() - INTERVAL '24 hours';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Schedule cleanup (runs every hour)
SELECT cron.schedule(
  'cleanup-old-rooms',
  '0 * * * *',
  'SELECT cleanup_old_rooms()'
);

-- Note: WebRTC signal cleanup removed - no longer needed with Realtime

-- Auto-delete old chat messages (7 days) to save space
CREATE OR REPLACE FUNCTION cleanup_old_chat()
RETURNS void AS $$
BEGIN
  DELETE FROM chat_messages
  WHERE created_at < NOW() - INTERVAL '7 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

SELECT cron.schedule(
  'cleanup-old-chat',
  '0 2 * * *',  -- Runs daily at 2 AM
  'SELECT cleanup_old_chat()'
);

-- Auto-delete inactive users (90 days) to save space
CREATE OR REPLACE FUNCTION cleanup_inactive_users()
RETURNS void AS $$
BEGIN
  DELETE FROM users
  WHERE last_seen < NOW() - INTERVAL '90 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

SELECT cron.schedule(
  'cleanup-inactive-users',
  '0 3 * * 0',  -- Runs weekly on Sunday at 3 AM
  'SELECT cleanup_inactive_users()'
);

-- Update room participant count
CREATE OR REPLACE FUNCTION update_room_participants_count()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE rooms
  SET participants_count = (
    SELECT COUNT(*) FROM room_participants
    WHERE room_id = COALESCE(NEW.room_id, OLD.room_id)
  ),
  last_activity = NOW()
  WHERE id = COALESCE(NEW.room_id, OLD.room_id);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_participants_count
AFTER INSERT OR DELETE ON room_participants
FOR EACH ROW
EXECUTE FUNCTION update_room_participants_count();

-- Auto-delete room when HOST exits (not just when empty)
-- This ensures rooms don't persist without a host
CREATE OR REPLACE FUNCTION delete_room_on_host_exit()
RETURNS TRIGGER AS $$
DECLARE
  host_user_id UUID;
BEGIN
  -- Get the host user ID for this room
  SELECT r.host_user_id INTO host_user_id
  FROM rooms r
  WHERE r.id = OLD.room_id;

  -- If the leaving user IS the host, delete the entire room
  IF OLD.user_id = host_user_id THEN
    DELETE FROM rooms WHERE id = OLD.room_id;
    RAISE NOTICE 'Room % deleted because host left', OLD.room_id;
  END IF;

  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_room_on_host_exit_trigger
AFTER DELETE ON room_participants
FOR EACH ROW
EXECUTE FUNCTION delete_room_on_host_exit();

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Enable RLS on all tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE room_participants ENABLE ROW LEVEL SECURITY;
ALTER TABLE friendships ENABLE ROW LEVEL SECURITY;
ALTER TABLE friend_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_activity ENABLE ROW LEVEL SECURITY;
-- webrtc_signaling table removed - migrated to Supabase Realtime
ALTER TABLE chat_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE watch_history ENABLE ROW LEVEL SECURITY;

-- Public read policies
CREATE POLICY "Anyone can view users"
  ON users FOR SELECT
  USING (true);

CREATE POLICY "Anyone can view public rooms"
  ON rooms FOR SELECT
  USING (is_public = TRUE);

CREATE POLICY "Anyone can view room participants"
  ON room_participants FOR SELECT
  USING (true);

CREATE POLICY "Anyone can view chat messages"
  ON chat_messages FOR SELECT
  USING (true);

-- Write policies (no auth required for MVP - can add later)
CREATE POLICY "Anyone can create users"
  ON users FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can create rooms"
  ON rooms FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can join rooms"
  ON room_participants FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can send chat"
  ON chat_messages FOR INSERT
  WITH CHECK (true);

-- WebRTC signaling policy removed - migrated to Supabase Realtime

-- Rate limiting function
CREATE OR REPLACE FUNCTION check_rate_limit(
  table_name TEXT,
  user_identifier TEXT,
  max_requests INT,
  time_window INTERVAL
)
RETURNS BOOLEAN AS $$
DECLARE
  request_count INT;
BEGIN
  -- Count recent requests (this is a simple implementation)
  -- In production, you'd use a proper rate limiting solution
  RETURN true;
END;
$$ LANGUAGE plpgsql;
```

## Step 4: Enable Realtime

1. Go to Database → Replication
2. Enable replication for these tables:
   - ✅ rooms
   - ✅ room_participants
   - ✅ chat_messages
   - ✅ webrtc_signaling
   - ✅ user_activity
3. Click "Save"

## Step 5: Test Connection

Run this in SQL Editor to verify:

```sql
-- Should return empty array (no rooms yet)
SELECT * FROM rooms;

-- Insert test user
INSERT INTO users (username) VALUES ('test_user') RETURNING *;

-- Insert test room
INSERT INTO rooms (id, name, host_user_id, host_username)
VALUES ('test-123-abc', 'Test Room',
  (SELECT id FROM users WHERE username = 'test_user'),
  'test_user'
) RETURNING *;

-- Verify
SELECT * FROM rooms;
```

## Step 6: Update Swift Config

Add to `Config.swift`:

```swift
struct Config {
    static let supabaseURL = "https://YOUR-PROJECT.supabase.co"
    static let supabaseAnonKey = "eyJhbGc..."  // Your anon key
}
```

## Step 7: Add Supabase Swift Package

1. In Xcode: File → Add Package Dependencies
2. Search: `https://github.com/supabase-community/supabase-swift`
3. Add to RedLemon target

---

## ✅ Setup Complete!

Your Supabase backend is now ready. The Swift code will connect automatically once you add the package dependency.

## 🔧 Troubleshooting

**Error: "relation does not exist"**
- Make sure you ran the complete SQL schema
- Check the SQL editor for any errors

**Error: "permission denied"**
- Verify RLS policies were created
- Check that replication is enabled for tables

**Slow queries**
- Indexes are already created in the schema
- Free tier has some performance limits

## 📊 Monitoring

- Go to Database → Query Performance to see slow queries
- Go to Settings → API to check usage limits
- Go to Database → Extensions to enable additional features

### Database Size Monitoring

RedLemon includes a script to monitor your database size:

```bash
./check-database-size.sh
```

This will show:
- Record counts per table
- Estimated database size
- Warnings if approaching limits

**Free Tier Limit:** 500MB total (targeting 50MB for safety)

## 🧹 Automatic Cleanup (Important!)

**The free tier has a 500MB limit.** To stay within limits, apply the aggressive cleanup migration:

1. Go to Supabase Dashboard → SQL Editor
2. Open: `docs/migrations/004_aggressive_cleanup_50mb_limit.sql`
3. Copy entire file contents
4. Paste into SQL Editor
5. Click "Run"

This migration sets up automatic cleanup:
- **Chat messages:** Deleted after 7 days (biggest space consumer)
- **Rooms:** Deleted after 12-24 hours (temporary by nature)
- **WebRTC signals:** Deleted after 30 minutes (ephemeral data)
- **Watch history:** Deleted after 30 days
- **Inactive users:** Deleted after 90 days
- **Friend requests:** Deleted after 7-30 days

### Manual Cleanup

If you need to free space immediately:

```sql
-- Run all cleanup tasks at once
SELECT run_all_cleanup();

-- Check database size
SELECT * FROM check_database_size();
```

## 🚀 Ready to Code!

Proceed to implement SupabaseClient.swift
