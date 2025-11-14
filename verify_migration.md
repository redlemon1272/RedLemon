# Migration 005 Verification

## Quick Verification Steps

### Option 1: Check in Supabase Dashboard (Recommended)

1. Go to https://nhvsojszwfvcinkyvzmf.supabase.co
2. Navigate to **Table Editor** → `room_participants`
3. Check the columns - you should see:
   - `room_id`
   - `user_id`
   - `joined_at`
   - `is_ready`
   - **`is_host`** ← This should exist now! (BOOLEAN type)

### Option 2: Run SQL Query

In Supabase SQL Editor, run:

```sql
-- Check if column exists
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'room_participants'
ORDER BY ordinal_position;
```

Expected output should include:
```
column_name | data_type | is_nullable | column_default
-----------+-----------+-------------+----------------
room_id    | text      | NO          |
user_id    | uuid      | NO          |
joined_at  | timestamp | YES         | now()
is_ready   | boolean   | YES         | false
is_host    | boolean   | NO          | false    ← Should see this!
```

### Option 3: Test with the App

The best verification is to test a watch party:

1. **Rebuild the app** (if not already done):
   ```bash
   cd "/Users/danielnoble/Desktop/RedLemon-Native   "
   ./build-app-debug.sh
   ```

2. **Start a watch party:**
   - Open the app on Mac 1 (main)
   - Browse for a movie
   - Click "Watch Party" → "Create Room"
   - Share the room code

3. **Join from Mac 2 (toonie):**
   - Open the app
   - Go to Rooms tab
   - Enter the room code
   - Click "Join Room"

4. **Check console logs** - you should NO LONGER see:
   - ❌ `keyNotFound(CodingKeys(stringValue: "is_host", intValue: nil))`
   - ❌ `Failed to fetch participants`

5. **Verify in UI:**
   - ✅ Participant count should show "2 participants"
   - ✅ Both users should see each other in the room
   - ✅ Host should be marked/distinguished from guest

## What Should Work Now

After migration + rebuild:

### Room Participants
- ✅ Host creates room with `is_host = true`
- ✅ Guest joins room with `is_host = false`
- ✅ Participant polling succeeds (no more JSON decode errors)
- ✅ Correct participant count displayed
- ✅ Can distinguish host from guests

### Friend Requests
- ✅ Send friend request (saves to database)
- ✅ Recipient sees request in "Requests" tab
- ✅ Can accept/decline requests
- ✅ Duplicate request shows error message

## If You See Errors

If you still see `keyNotFound "is_host"` errors:

1. **Check migration was applied:**
   ```sql
   SELECT * FROM room_participants LIMIT 1;
   ```
   Should show `is_host` column

2. **Verify the app was rebuilt:**
   - Check build timestamp
   - The code changes need to be compiled

3. **Clear old room data:**
   ```sql
   DELETE FROM room_participants;
   DELETE FROM rooms;
   ```
   Then test with fresh rooms

## Testing Checklist

- [ ] Migration applied in Supabase
- [ ] App rebuilt with latest code
- [ ] Create watch party → no errors
- [ ] Join from second device → shows 2 participants
- [ ] Send friend request → saves to DB
- [ ] Open on second device → sees request in Friends tab
- [ ] Accept request → creates friendship
