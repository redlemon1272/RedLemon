# WebRTC → Supabase Realtime Migration

## Summary

Migrated Watch Party communication from WebRTC peer-to-peer connections to Supabase Realtime Broadcast channels for improved reliability and simpler architecture.

## Changes Made

### 1. New RealtimeChannelManager
**File:** `Sources/Features/WatchParty/RealtimeChannelManager.swift`

- Created new Swift actor-based manager using Supabase Realtime v2 API
- Implements Broadcast messaging for sync messages (play/pause/seek/chat)
- Implements Presence tracking for participant joins/leaves
- Uses WebSocket connections (no complex SDP/ICE signaling needed)
- Maintains same sync algorithm as WebRTC implementation
- Native Swift async/await API

### 2. Updated LobbyViewModel
**File:** `Sources/Features/Rooms/LobbyViewModel.swift`

- Replaced `WebRTCManager` with `RealtimeChannelManager`
- Removed complex WebRTC signaling code (offer/answer/ICE candidate exchange)
- Simplified connection flow - just channel subscription
- Updated error handling for Realtime-specific errors
- Changed status tracking from `WebRTCConnectionStatus` to `RealtimeConnectionStatus`

### 3. Updated MPVPlayerViewModel
**File:** `Sources/Features/Player/MPVPlayerViewModel.swift`

- Replaced `webrtcManager` property with `realtimeManager`
- Updated `startWatchPartySync()` to use Realtime channels
- Updated message sending (chat, playback state) to use Realtime broadcast
- Updated `stopWatchPartySync()` to disconnect Realtime channels

### 4. Updated Models
**File:** `Sources/Models/WatchPartyModels.swift`

- Added `RealtimeConnectionStatus` enum (disconnected, connecting, connected, failed)
- Kept `WebRTCConnectionStatus` as legacy for reference

### 5. Removed WebRTC Dependencies
**File:** `Package.swift`

- Commented out WebRTC package dependency
- Removed WebRTC product from target dependencies

### 6. Updated Database Schema
**File:** `docs/SUPABASE_SETUP.md`

- Removed `webrtc_signaling` table (no longer needed)
- Removed `cleanup_old_signals()` function
- Removed WebRTC signaling RLS policies
- Added migration notes

## Benefits

### 1. Simplified Architecture
- No SDP offer/answer exchange
- No ICE candidate gathering/exchange
- No NAT traversal complexity (STUN/TURN)
- Direct WebSocket connection to Supabase

### 2. Higher Reliability
- WebSocket connections more stable than WebRTC P2P
- No connection timeout issues
- No symmetric NAT traversal failures
- Built-in reconnection handling

### 3. Better Developer Experience
- Native Swift async/await API
- Less code to maintain
- Easier to debug (server-relayed messages)
- Unified with existing Supabase stack

### 4. Built-in Features
- Automatic presence management
- Channel subscription lifecycle handling
- No database polling for signaling
- WebSocket multiplexing

## Trade-offs

### Latency
- **Before (WebRTC P2P):** ~50ms peer-to-peer
- **After (Realtime):** ~100-200ms server-relayed
- **Impact:** Minimal for watch party use case (sync updates every 100ms)

### Server Load
- All messages now relay through Supabase
- Watch party messages are small and infrequent
- Within Supabase Realtime rate limits for typical usage

## Migration Path

### For Existing Users
1. Update dependencies: `swift package update`
2. No database migration needed - old signaling data auto-expires
3. Existing rooms continue working with database fallback
4. New connections use Realtime automatically

### Database Cleanup (Optional)
If you want to remove the old `webrtc_signaling` table:

```sql
DROP TABLE IF EXISTS webrtc_signaling CASCADE;
```

## Testing Checklist

- [ ] Create watch party room (host)
- [ ] Join watch party room (guest)
- [ ] Test chat messages
- [ ] Test playback sync (play/pause/seek)
- [ ] Test ready state toggles
- [ ] Test countdown and simultaneous playback start
- [ ] Test presence tracking (joins/leaves)
- [ ] Test database fallback if Realtime unavailable
- [ ] Test across different network conditions

## Files Modified

### Core Implementation
- `Sources/Features/WatchParty/RealtimeChannelManager.swift` (NEW)
- `Sources/Features/Rooms/LobbyViewModel.swift`
- `Sources/Features/Player/MPVPlayerViewModel.swift`
- `Sources/Models/WatchPartyModels.swift`

### Configuration & Documentation
- `Package.swift`
- `docs/SUPABASE_SETUP.md`
- `REALTIME_MIGRATION.md` (this file)

### Files to Remove (Future Cleanup)
- `Sources/Features/WatchParty/WebRTCManager.swift` (can be archived)
- `Sources/Features/WatchParty/WebRTCSignalingService.swift` (can be removed)

## Rollback Plan

If issues arise, rollback is possible by:
1. Reverting to previous git commit
2. Uncommenting WebRTC dependencies in Package.swift
3. Running `swift package update`
4. Previous WebRTCManager code still exists in git history

## Version

**Branch:** `feature/migrate-to-supabase-realtime`
**Date:** 2025-11-10
**Migrated from:** WebRTC P2P v1.0.10
**Migrated to:** Supabase Realtime Broadcast v2
