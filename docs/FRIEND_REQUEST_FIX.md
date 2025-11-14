# Friend Request Fix

## Problem

Friend requests were being sent successfully to the database, but the recipient (toonie) couldn't see them in their Friends tab. The "Requests" tab showed no incoming requests.

## Root Cause

The `loadFriends()` function in `FriendsView.swift` was just a TODO/mock implementation that didn't actually fetch data from Supabase. It was just sleeping for 1 second and returning empty data.

```swift
// OLD (broken):
private func loadFriends() async {
    isLoading = true
    // TODO: Load from ICP canister
    // For now, mock data
    do {
        try await Task.sleep(nanoseconds: 1_000_000_000)
    } catch {}
    isLoading = false
}
```

## Solution

### 1. Added Missing Supabase Functions

Added three new functions to `SupabaseClient.swift`:

```swift
/// Get incoming friend requests for a user
func getFriendRequests(userId: UUID) async throws -> [SupabaseFriendRequest]

/// Accept friend request
func acceptFriendRequest(requestId: UUID, userId: UUID, friendId: UUID) async throws

/// Decline friend request
func declineFriendRequest(requestId: UUID) async throws
```

### 2. Added SupabaseFriendRequest Model

Created new struct in `SupabaseClient.swift`:

```swift
struct SupabaseFriendRequest: Codable {
    let id: UUID
    let fromUserId: UUID
    let toUserId: UUID
    let status: String
    let createdAt: Date
    let fromUser: SupabaseUser?  // Joined data from users table
}
```

### 3. Implemented loadFriends()

Replaced the mock implementation with real Supabase queries:

```swift
private func loadFriends() async {
    isLoading = true

    guard let userId = appState.currentUserId else {
        isLoading = false
        return
    }

    do {
        // Load friends from Supabase
        let supabaseFriends = try await SupabaseClient.shared.getFriends(userId: userId)
        friends = supabaseFriends.map { /* convert to Friend model */ }

        // Load friend requests
        let supabaseRequests = try await SupabaseClient.shared.getFriendRequests(userId: userId)
        friendRequests = supabaseRequests.compactMap { /* convert to FriendRequest model */ }

        print("✅ Loaded \(friends.count) friends and \(friendRequests.count) friend requests")
    } catch {
        print("❌ Failed to load friends: \(error)")
    }

    isLoading = false
}
```

### 4. Implemented Accept/Decline Actions

Replaced the TODO stubs with real implementations:

```swift
private func acceptFriendRequest(_ request: FriendRequest) async {
    // Validates UUIDs
    // Calls SupabaseClient.acceptFriendRequest()
    // Updates request status in DB
    // Creates bidirectional friendship
    // Reloads friends list
}

private func declineFriendRequest(_ request: FriendRequest) async {
    // Validates request ID
    // Calls SupabaseClient.declineFriendRequest()
    // Updates request status to 'rejected'
    // Reloads friends list
}
```

### 5. Improved Error Handling

Updated `sendFriendRequest()` to return error messages and handle HTTP 409 (Conflict):

```swift
private func sendFriendRequest(...) async -> String? {
    do {
        try await SupabaseClient.shared.sendFriendRequest(...)
        await loadFriends()
        return nil // Success
    } catch let error as SupabaseError {
        switch error {
        case .httpError(409, _):
            return "Friend request already sent or you're already friends"
        case .userNotFound:
            return "User not found"
        default:
            return "Failed to send request: \(error.localizedDescription)"
        }
    } catch {
        return "Failed to send request: \(error.localizedDescription)"
    }
}
```

### 6. Updated AddFriendSheet

Modified the sheet to:
- Wait for the friend request to complete before closing
- Show error messages in the sheet if request fails
- Show loading indicator while sending
- Only close the sheet on success

## Testing Steps

1. **Apply Migration (if not already done):**
   - Open Supabase Dashboard → SQL Editor
   - Run `docs/migrations/005_add_is_host_to_room_participants.sql`

2. **Rebuild the app:**
   ```bash
   cd /Users/danielnoble/Desktop/RedLemon-Native
   swift build
   ```

3. **Test Friend Requests:**
   - Open app on Mac 1 (main user)
   - Send friend request to "toonie"
   - Open app on Mac 2 (toonie)
   - Go to Friends tab
   - Click "Requests" tab - should see incoming request!
   - Click Accept or Decline

4. **Test Duplicate Request:**
   - Try sending friend request to same user again
   - Should see error: "Friend request already sent or you're already friends"
   - Error appears in the Add Friend sheet

## Files Changed

- `Sources/Networking/SupabaseClient.swift`
  - Added `getFriendRequests()` function
  - Added `acceptFriendRequest()` function
  - Added `declineFriendRequest()` function
  - Added `SupabaseFriendRequest` struct

- `Sources/Features/Friends/FriendsView.swift`
  - Implemented `loadFriends()` with real Supabase queries
  - Implemented `acceptFriendRequest()` with real actions
  - Implemented `declineFriendRequest()` with real actions
  - Updated `sendFriendRequest()` to return error messages
  - Updated `AddFriendSheet` to handle errors properly

## Database Schema

The fix relies on these Supabase tables:

```sql
-- Friend requests table
CREATE TABLE friend_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  from_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  to_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  status TEXT CHECK (status IN ('pending', 'accepted', 'rejected')) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(from_user_id, to_user_id)
);

-- Friendships table (bidirectional)
CREATE TABLE friendships (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  friend_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (user_id, friend_id),
  CONSTRAINT no_self_friendship CHECK (user_id != friend_id)
);
```

## Expected Behavior

### Before Fix
- ❌ Send friend request → appears to do nothing
- ❌ Recipient sees empty Requests tab
- ❌ No way to accept/decline requests
- ❌ Duplicate requests show no error

### After Fix
- ✅ Send friend request → shows loading, success/error message
- ✅ Recipient sees request in "Requests" tab with sender's username
- ✅ Can accept request → creates friendship for both users
- ✅ Can decline request → updates status to 'rejected'
- ✅ Duplicate request → shows clear error message
- ✅ Friends list updates automatically after actions

## Related Issues

This fix completes the friend system implementation. Previously only the sending side was implemented, but the receiving side was all TODOs.

The HTTP 409 error mentioned earlier is now properly handled with a user-friendly message instead of silent failure.
