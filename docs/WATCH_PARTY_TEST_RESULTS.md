# Watch Party Test Results & Fixes - November 9, 2025

## Test Results Summary

From the console logs in `docs/test-logs.txt`, we identified the root causes of all watch party issues:

### ✅ What's Working:
- ✅ Room creation successful
- ✅ Host joins room successfully
- ✅ Chat messages save to database
- ✅ Chat messages received from database

### ❌ What's Broken:

#### **Issue #1: Missing `is_host` Column in Database** 🔴 CRITICAL
**Error from logs:**
```
⚠️ Lobby: Failed to poll participants: keyNotFound(CodingKeys(stringValue: "is_host", intValue: nil)
```

**Root Cause:**
- The Supabase `room_participants` table is missing the `is_host` column
- The Swift code (RoomParticipant struct) expects this field but it doesn't exist in database
- This happens repeatedly every 2 seconds during participant polling

**Impact:**
- ❌ Cannot display participant list correctly
- ❌ Shows wrong participant count (1 instead of 2)
- ❌ Cannot distinguish host from guests

---

#### **Issue #2: WebRTC Channel Not Ready** 🔴 CRITICAL
**Error from logs:**
```
🎬 Host: Starting movie for 1 participants
⚠️ Host: Failed to broadcast start signal via WebRTC: channelNotReady
```

**Root Cause:**
- Host tries to start movie and broadcast via WebRTC
- WebRTC data channel is not ready/established
- Guest never receives the start signal

**Impact:**
- ❌ Guest's video player never launches
- ❌ Playback doesn't sync between devices

---

## Fixes Applied

### Fix #1: Database Schema Migration ✅

**File Created:** `docs/migrations/005_add_is_host_to_room_participants.sql`

This migration:
1. Adds `is_host` boolean column with default `false`
2. Updates existing records to mark first joiner as host
3. Adds index for performance
4. Safe to run multiple times

**How to Apply:**
```bash
1. Go to Supabase Dashboard → SQL Editor
2. Copy contents of 005_add_is_host_to_room_participants.sql
3. Paste and Run
4. Verify: SELECT * FROM room_participants;
```

---

### Fix #2: Update joinRoom() Function ✅

**File Modified:** `Sources/Networking/SupabaseClient.swift`

**Changes:**
```swift
// BEFORE:
func joinRoom(roomId: String, userId: UUID) async throws {
    _ = try await makeRequest(
        path: "/room_participants",
        method: "POST",
        body: [
            "room_id": roomId,
            "user_id": userId.uuidString
        ]
    )
}

// AFTER:
func joinRoom(roomId: String, userId: UUID, isHost: Bool = false) async throws {
    _ = try await makeRequest(
        path: "/room_participants",
        method: "POST",
        body: [
            "room_id": roomId,
            "user_id": userId.uuidString,
            "is_host": isHost  // ← NEW: Explicitly set host status
        ]
    )
}
```

---

### Fix #3: Host Joins with isHost=true ✅

**File Modified:** `Sources/App/AppState.swift`

**Changes:**
```swift
// BEFORE:
try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)

// AFTER:
try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: true)
```

---

### Fix #4: Guest Joins with isHost=false ✅

**File Modified:** `Sources/Features/Rooms/LobbyViewModel.swift`

**Changes:**
```swift
// BEFORE:
try await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId)

// AFTER:
try await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId, isHost: false)
```

---

## Next Steps

### 1. Apply Database Migration ⚠️ REQUIRED

**Option A: Via Supabase Dashboard (Recommended)**
```bash
1. Open Supabase Dashboard
2. Go to SQL Editor
3. Copy/paste docs/migrations/005_add_is_host_to_room_participants.sql
4. Click Run
5. Verify success
```

**Option B: Via Migration Script**
If you have a migration runner set up, just run:
```bash
# Apply all pending migrations
./apply-migrations.sh
```

### 2. Rebuild the App ⚠️ REQUIRED

The code fixes are ready but need to be compiled into the running app:

```bash
# Clean build
cd "/Users/danielnoble/Desktop/RedLemon-Native   "
./cleanup.sh

# Build and run
./start-production.sh
```

### 3. Test Watch Party End-to-End

**Test Checklist:**
- [ ] Host creates watch party
- [ ] Guest joins via room code
- [ ] Both devices show correct participant count (2)
- [ ] Host can see guest username
- [ ] Guest can see host username
- [ ] Chat works both directions
- [ ] Host starts movie
- [ ] Guest's player launches automatically
- [ ] Both devices play in sync

---

## WebRTC Issue - Still Needs Investigation

The WebRTC "channelNotReady" issue might resolve itself once participants are properly registered in the database. However, if it persists:

**Possible Causes:**
1. WebRTC connection takes too long to establish
2. Host tries to broadcast before guest's peer connection is ready
3. Need to add retry logic or fallback to database polling

**Fallback Already Implemented:**
The code has database polling as a backup:
- Participant list polls every 2 seconds
- Chat polls every 2 seconds
- Can manually broadcast "start" signal via database

**If WebRTC Still Fails After Fixes:**
We can add a "Start Movie" button with a manual database broadcast instead of relying on WebRTC for the initial signal.

---

## File Changes Summary

### New Files:
1. `docs/migrations/005_add_is_host_to_room_participants.sql` - Database migration

### Modified Files:
1. `Sources/Networking/SupabaseClient.swift` - Added `isHost` parameter to `joinRoom()`
2. `Sources/App/AppState.swift` - Host joins with `isHost: true`
3. `Sources/Features/Rooms/LobbyViewModel.swift` - Guest joins with `isHost: false`

### Test Files:
1. `docs/test-logs.txt` - Console logs showing the issues

---

## Expected Behavior After Fixes

### Database Structure:
```sql
SELECT * FROM room_participants;
```
Should show:
```
| room_id | user_id                              | is_host | joined_at           |
|---------|--------------------------------------|---------|---------------------|
| 2KFY    | 123e4567-e89b-12d3-a456-426614174000 | true    | 2025-11-09 23:43:29 |
| 2KFY    | 789e4567-e89b-12d3-a456-426614174111 | false   | 2025-11-09 23:43:35 |
```

### Console Logs (Expected):
```
✅ Room created: 2KFY
✅ Host joined room: 2KFY
✅ Guest joined room 2KFY in database
✅ Lobby: Participant count: 2 (was showing error before)
💬 Chat message saved to database
💬 New chat message from lemontom: hi
🎬 Host: Starting movie for 2 participants (was 1 before)
✅ Guest: Received start signal
🎬 Guest: Launching player
```

---

## Questions?

If you encounter any issues after applying these fixes, check:
1. Database migration applied successfully?
2. App rebuilt with latest code?
3. Both devices logged in with different usernames?
4. Check console logs for new error messages

The most critical fix is the database migration - without it, nothing else will work!
