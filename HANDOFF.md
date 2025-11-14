# RedLemon-Native Project Handoff
**Date:** November 9, 2025
**Status:** ✅ Production-ready v1.0.8 Deployed

---

## 🎯 Current Status

### What's Working ✅
- **Video Playback**: MPV integration fully functional with hardware acceleration
- **Real-Debrid**: Stream unlocking working perfectly
- **Subtitle System**: ZIP extraction, SRT→VTT conversion, loading via SubDL API
- **Search & Browse**: Movies + TV shows with season/episode selection
- **Settings**: Username creation/storage, API key management (Real-Debrid, SubDL)
- **Supabase Backend**: PostgreSQL database for watch parties, users, friends
- **Auto-Updates**: Sparkle framework with GitHub releases (v1.0.8 deployed)
- **4-Character Room Codes**: Easy-to-share codes like "K7M2" (excludes confusing chars)
- **MySpace Tom Feature**: Every new user auto-friends `lemontom` (bidirectional, no pending)
- **Database Polling**: Participants sync every 2 seconds, chat syncs every 1.5 seconds
- **Room Auto-Delete**: Rooms clean up when host exits
- **Code Signing**: Ad-hoc signatures for Sparkle compatibility

### In Progress 🔄
- **WebRTC Integration**: Framework installation and MPVPlayerViewModel integration needed
- **Watch Party UI**: Room creation, join flow, guest list (designed, not implemented)

### Critical Information 🔑
- **Current Version**: v1.0.8 (build 8)
- **GitHub Releases**: https://github.com/orangeapple1272/Redlemon/releases
- **Appcast Feed**: https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml
- **Supabase Project**: PostgreSQL database with RLS policies
- **Auto-Update Framework**: Sparkle 2.8.0 (Swift Package Manager)

---

## 📊 Technical Architecture

### Technology Stack
- **Swift 5.7 + SwiftUI** (macOS 12+)
- **libmpv.2.dylib** from mpv-iina (IINA's fork)
  - Version: 2.0.0
  - Size: 7.2 MB
  - Dependencies: 75 dylibs
  - Location: `Frameworks/libmpv.2.dylib`
- **Sparkle.framework** for auto-updates
  - Version: 2.8.0
  - Added via Swift Package Manager
  - Location: `build/RedLemon.app/Contents/Frameworks/Sparkle.framework`

### Auto-Update Architecture
**Status:** ✅ Production-ready with Sparkle framework

**Flow:**
1. App launches → UpdateManager initializes Sparkle
2. Sparkle checks appcast.xml (GitHub) for latest version
3. If newer version exists, downloads DMG from GitHub Releases
4. Verifies code signature (ad-hoc for development)
5. Shows native macOS update UI
6. Installs and relaunches

**Components:**
- **Sparkle.framework** - Industry-standard macOS auto-updater
- **appcast.xml** - RSS feed with version metadata (hosted on GitHub)
- **GitHub Releases** - Hosts DMG files with public URLs
- **UpdateManager** (`Sources/Services/UpdateManager.swift`) - Sparkle integration
- **Info.plist Keys**:
  - `SUFeedURL`: Appcast feed URL
  - `SUEnableAutomaticChecks`: Auto-check enabled
  - `SUAllowsInsecureUpdates`: Allow unsigned DMGs (development)
  - `SUScheduledCheckInterval`: 24 hours (86400 seconds)

**Code Signing:**
- Development builds: Ad-hoc signature (`codesign --sign -`)
- Production builds: Requires Apple Developer ID certificate
- Sparkle requires code signing even for insecure updates

### libmpv Capabilities (Verified)
```bash
# Verified with nm command:
nm Frameworks/libmpv.2.dylib | grep mpv_render_context
# Results:
✅ _mpv_render_context_create
✅ _mpv_render_context_free
✅ _mpv_render_context_render
✅ _mpv_render_context_get_info
```

**Build configuration:**
- `-Dlibmpv=true`
- `-Dmacos-cocoa-cb=disabled`
- MetalLayer support
- gl-cocoa backend
- videotoolbox-gl
- vulkan support

---

## 🧪 Testing History

### Attempt 1: OpenGL Render API
```swift
vo=libmpv + api_type="opengl"
Result: ❌ Error -18 (MPV_ERROR_UNSUPPORTED)
```

### Attempt 2: Native GPU Window
```swift
vo=gpu
Result: ✅ Video works BUT creates separate window (breaks SwiftUI overlay)
```

### Attempt 3: Software Render API
```swift
vo=libmpv + api_type="sw"
Result: ✅ Context created successfully... 💥 then app crashed
```

### Attempt 4: Audio-Only (BREAKTHROUGH)
```swift
vo=null + video=no
Result: ✅ App runs perfectly, NO CRASH
```
**This proves video rendering is the crash source!**

### Current Attempt: OpenGL with Proper Init
Testing OpenGL render API with correct initialization parameters.

---

## 📂 Key Files & Code

### 1. MPVWrapper.swift
**Location:** `Sources/Features/Player/MPVWrapper.swift`

**Current configuration:**
```swift
// Line ~46
mpv_set_option_string(handle, "vo", "libmpv")
mpv_set_option_string(handle, "hwdec", "videotoolbox")
```

**Key methods:**
- `setupVideo(in view:)` - Initializes MPV (line ~37)
- `loadVideo(url:)` - Loads stream URL (line ~118)
- `pollEvents()` - Event loop (line ~155)

**Important:** `mpvHandle` is the OpaquePointer to MPV instance

### 2. MPVVideoView.swift
**Location:** `Sources/Features/Player/MPVVideoView.swift`

**Current setup:**
```swift
// Line ~60
override func viewDidMoveToWindow() {
    mpvWrapper.setupVideo(in: self)
    setupMPVRenderContext()  // Re-enabled
}
```

**Render context creation (line ~71):**
```swift
let apiType = strdup("opengl")!
var params: [mpv_render_param] = [
    mpv_render_param(type: MPV_RENDER_PARAM_API_TYPE,
                     data: UnsafeMutableRawPointer(apiType)),
    mpv_render_param(type: MPV_RENDER_PARAM_OPENGL_INIT_PARAMS,
                     data: &getProcAddressWrapper),
    mpv_render_param(type: MPV_RENDER_PARAM_INVALID, data: nil)
]
```

**Fallback strategy:** If OpenGL fails, try `vo=gpu`

### 3. MPVPlayerView.swift
**Location:** `Sources/Features/Player/MPVPlayerView.swift`

**Player shell with overlay:**
- KeyEventHandler for keyboard shortcuts
- Chat overlay (ChatOverlayView)
- Exit button
- All UI functional

### 4. AppState.swift
**Location:** `Sources/App/AppState.swift`

**Stream unlock flow:**
```swift
func playStream(infoHash:fileIdx:) {
    // 1. Call LocalAPI unlock endpoint
    // 2. Real-Debrid unlocks torrent
    // 3. Returns direct URL
    // 4. Navigate to player with URL
}
```

**Status:** Working perfectly

---

## 🔧 Build & Debug Commands

### Build
```bash
cd <PROJECT_ROOT>
bash build-app.sh
```

**Output location:** `build/RedLemon.app`

### Run
```bash
open build/RedLemon.app
```

### Debug Logs
```bash
log stream --predicate 'processImagePath contains "RedLemon"' --level default --style compact
```

**Look for:**
- `🖼️ Setting up MPV with...` - MPV initialization
- `✅ MPV initialized...` - Success message
- `🔧 Setting up MPV render context...` - Render context creation
- `❌ Failed to create MPV render context: X` - Error code (e.g., -18)
- `✅ MPV render context created successfully` - Success
- Any crash logs after successful context creation

---

## 🐛 Known Issues & Patterns

### Error -18 (MPV_ERROR_UNSUPPORTED)
- Means: Render API type not available
- **NOT** because symbols are missing (verified with nm)
- Likely: Specific API variant disabled in build config
- OpenGL variant may not be enabled even though symbols exist

### Software Rendering Crash
- Context creates successfully (no error -18)
- App crashes during rendering phase (after context creation)
- Suggests: Problem in rendering pipeline, not initialization

### GPU Native Window
- Works but creates separate window
- Incompatible with SwiftUI overlay architecture
- Not ideal but is a working fallback

---

## 🎬 What User Typically Does to Test

1. Start debug log stream in terminal
2. Open RedLemon.app
3. Navigate: Browse → Search "The Matrix" → Click result
4. Select quality (1080p BrRip x264)
5. Click Play
6. Observe: Audio plays, but black screen (no video)

**Test stream info:**
- Movie: The Matrix (1999)
- InfoHash: `66672b822002...`
- FileIdx: 222
- Filename: `The.Matrix.1999.1080p.BrRip.x264.YIFY.mp4`

---

## 📝 Important Log Evidence

### Successful Audio-Only Test (Nov 1, 00:22:10)
```
00:22:10.034 🖼️ Setting up MPV with simplified audio-only config...
00:22:10.038 ✅ MPV initialized with native GPU rendering
00:22:10.039 ⚠️ Skipping render context setup - testing audio-only playback
00:22:10.100 🎥 Loading video: https://chi6-4.download.real-debrid.com/...
00:22:10.100 ✅ Load command sent successfully
00:22:12.909 (CoreAudio) HALPlugInManagement::RegisterPlugIns...
00:22:12.987 [AUHAL] SelectDevice: created ioproc for device 49
[App continued running - NO CRASH]
```

### Previous Software Rendering Attempt (Oct 31, 00:17:56)
```
00:17:56.301 🔧 Setting up MPV render context with Metal...
00:17:56.314 ✅ MPV render context created successfully
[App crashed immediately after]
```

### Previous OpenGL Attempt (Oct 31, 00:12:39)
```
00:12:39.248 🔧 Setting up MPV render context with OpenGL...
00:12:39.249 ❌ Failed to create MPV render context: -18
```

---

## 🚀 Next Steps (In Order)

### Step 1: Test Current OpenGL Implementation
Currently building. Once complete:
1. Run debug logs
2. Open app and play The Matrix
3. Check outcome:
   - **If video renders:** Success! Problem solved!
   - **If error -18:** OpenGL API still unsupported
   - **If crash:** Need to adjust OpenGL initialization

### Step 2: Alternative Approaches (If OpenGL Fails)

**Option A: Try Metal Native API**
```swift
// MPVVideoView.swift line ~71
let apiType = strdup("metal")!
// Pass CAMetalLayer to MPV
```

**Option B: Use IINA's cocoa-cb approach**
- IINA uses MPV's cocoa-cb backend
- May need different libmpv build
- Research: https://github.com/iina/mpv-build

**Option C: Accept GPU native window**
```swift
// MPVWrapper.swift line ~46
mpv_set_option_string(handle, "vo", "gpu")
// Video works but no SwiftUI overlay
```

**Option D: Different libmpv Binary**
```bash
# Try Homebrew's libmpv instead
brew install mpv
cp /opt/homebrew/lib/libmpv.2.dylib Frameworks/
```

### Step 3: Research cocoa-cb Integration
If all else fails, implement IINA's approach:
- Uses `--cocoa-cb-sw-renderer=no`
- Native macOS window integration
- Check IINA source: `VideoView.swift`

---

## 🔍 Debugging Tips

### Check MPV Logs
MPV writes to `msg-level=all=trace`:
```swift
mpv_set_option_string(handle, "msg-level", "all=v")
```

### Verify Render API Support
```bash
# List supported video outputs
Frameworks/libmpv.2.dylib --vo=help
```

### Test Minimal MPV
Create standalone test:
```swift
let handle = mpv_create()
mpv_set_option_string(handle, "vo", "libmpv")
mpv_initialize(handle)
// Does it crash here?
```

### Check for Memory Issues
```bash
# Run with malloc debugging
export MallocStackLogging=1
open build/RedLemon.app
# Check Console.app for malloc logs
```

---

## 🤝 Social Features

### 4-Character Room Codes
**Implementation:** `Sources/App/AppState.swift` → `generateRoomCode()`

**Format:** 4 alphanumeric characters (e.g., "K7M2", "H5P9")
**Character Set:** `ABCDEFGHJKLMNPQRSTUVWXYZ23456789`
- **Excluded:** I, O, 1, 0 (avoid confusion)
- **Total Combinations:** 32^4 = 1,048,576 possible codes

**Benefits:**
- Easy to share verbally ("Kay Seven Em Two")
- Short enough to type quickly
- Still provides ample uniqueness

### MySpace Tom Auto-Friend Feature
**Implementation:**
- `Sources/Features/Auth/UsernameSetupView.swift` → `addDefaultFriend()`
- `Sources/Networking/SupabaseClient.swift` → `createFriendship()`

**Behavior:**
- Every new user is automatically friended with `lemontom` account
- **Bidirectional friendship** created instantly (no pending request)
- User's first friend appears immediately in Friends list
- Inspired by MySpace's Tom Anderson (everyone's first friend)

**Technical:**
```swift
// Creates two friendship rows in Supabase
func createFriendship(userId1: UUID, userId2: UUID) async throws {
    // Row 1: user → lemontom
    // Row 2: lemontom → user
    // Status: "accepted" (bypasses friend_requests table)
}
```

---

## 📦 Project Structure

```
RedLemon-Native/
├── Sources/
│   ├── App/
│   │   ├── AppState.swift          # Stream unlock logic
│   │   └── RedLemonApp.swift       # App entry point
│   ├── Features/
│   │   └── Player/
│   │       ├── MPVWrapper.swift        # MPV initialization ⚠️
│   │       ├── MPVVideoView.swift      # Render context setup ⚠️
│   │       ├── MPVPlayerView.swift     # Player UI shell
│   │       └── MPVPlayerViewModel.swift
│   ├── Server/
│   │   └── Routes/
│   │       └── UnlockRoutes.swift  # Real-Debrid unlock
│   └── Networking/
│       └── LocalAPIClient.swift    # Internal HTTP client
├── Frameworks/
│   └── libmpv.2.dylib              # MPV library (IINA build)
├── Resources/
│   └── AppIcon.png                 # App icon
├── build-app.sh                    # Build script
└── build/
    └── RedLemon.app                # Built app bundle
```

---

## 💡 Key Insights

1. **The library HAS the render API** - Symbols verified with `nm`
2. **Render context CAN be created** - Software API proved it
3. **The crash happens during rendering** - Not initialization
4. **Audio-only works perfectly** - MPV itself is functional
5. **Need correct API parameters** - OpenGL/Metal initialization is tricky

---

## 🎯 Success Criteria

When video rendering works, you should see:
1. Debug log: `✅ MPV render context created successfully`
2. NO crash after context creation
3. Video displays in player window
4. Chat overlay still functional (Space to open)
5. Audio continues playing in sync

---

## 📞 Handoff Questions to Ask New Agent

1. "Did the current OpenGL render implementation work?"
2. "What error code did you see in logs when attempting render context creation?"
3. "Did it crash, or just fail to create context?"
4. "Should we try Metal API, cocoa-cb, or accept GPU native window?"

---

## 🌐 ICP (Internet Computer Protocol) Integration

### Current Status
**Not yet implemented** - ICP integration is Phase 3 (future work). The app currently works standalone.

### ICP's Role
**Purpose:** "The only use for redlemon UI (on ICP) is that the ICP canister can provide the handshake for watch parties"

ICP provides **signaling/coordination layer** for:
1. **Room Creation** - Every playback session creates a room (solo or watch party)
2. **Watch Party Coordination** - Synchronized playback state across users
3. **Real-time Chat** - Chat relay between watch party participants
4. **Friend Activity** - Visibility of what friends are watching
5. **Watch History** - Tracking and persistence

### Authentication
**Internet Identity** will be used for user authentication:
- Decentralized identity via ICP
- No passwords or email required
- Single sign-on across ICP dapps
- Principal ID becomes user identifier

### Architecture
```
┌─────────────────────────┐
│  RedLemon Native App    │ ← Swift/SwiftUI (THIS PROJECT)
│   - UI/UX               │
│   - Video Playback      │
│   - Local Server        │
│   - Internet Identity   │ ← Auth via II delegation
└───────────┬─────────────┘
            │ HTTP/WebSocket + II Principal
            ↓
┌─────────────────────────┐
│  ICP Canister           │ ← Future: Internet Computer
│   - Room Management     │
│   - Chat Relay          │
│   - Presence/State      │
│   - Auth: II Principal  │ ← Validates II delegation
└─────────────────────────┘
```

### Room Lifecycle (Planned)

#### Every playback creates a room:
```swift
1. User authenticates with Internet Identity (if not logged in)
   - Get II delegation
   - Store principal ID
2. User clicks Play → Quality Selection
3. AppState.playMedia() → Unlock stream via Real-Debrid
4. CREATE ROOM on ICP ← NOT YET IMPLEMENTED
   - Send II principal with request
   - Generate roomId
   - Store: principal, imdbId, title, streamHash, watchMode
   - Set visibility (solo = friendsCanSee, party = friendsCanJoin)
5. Switch to player view
6. During playback: Sync state to ICP every 5s
   - Send: currentTime, isPaused, buffering (authenticated)
   - Receive: chat messages from other authenticated users
7. User exits (Escape key)
8. LEAVE ROOM → Notify ICP ← NOT YET IMPLEMENTED
   - Authenticated request to leave
   - Update watch history (stored by principal)
   - Remove from active rooms
```

#### Current Placeholder Code:
```swift
// AppState.swift line ~128
// TODO: Authenticate with Internet Identity
// let principal = try await authenticateII()

// TODO: Create room on ICP with principal
// currentRoomId = try await createICPRoom(
//     principal: principal,
//     imdbId: ...,
//     ...
// )

currentRoomId = "room_\(UUID().uuidString.prefix(8))" // Placeholder

// Line ~165
// TODO: Notify ICP canister that user is leaving room (authenticated)
// await leaveICPRoom(principal: principal, roomId: roomId, mode: currentWatchMode)
```

### Room Types

**Solo Room** (default):
- Creates room but no one can join
- Visible to friends (if settings allow)
- Tracked for watch history
- `watchMode = .solo`

**Watch Party Room**:
- Public or friends-only
- Synchronized playback
- Real-time chat
- Users can join mid-stream
- `watchMode = .watchParty`

### Room Visibility Enum (Planned)
```swift
enum RoomVisibility {
    case private          // Hidden - no one sees
    case friendsCanSee    // Visible, can't join
    case friendsCanJoin   // Friends can join (default for watch party)
    case publicOpen       // Public discovery
}
```

### What Needs to be Built (Future)

1. **Internet Identity Integration**
   - Add `agent-swift` or ICP Swift SDK
   - Implement II delegation flow
   - Store principal ID securely (Keychain)
   - Login/logout UI flow

2. **ICPClient.swift** - Swift client for ICP canister
   - Authenticated WebSocket connection using II principal
   - Room CRUD operations (signed by II)
   - Chat message relay
   - State synchronization

3. **ICP Canister** (Motoko/Rust)
   - Accept and validate II principals
   - Room management endpoints (auth required)
   - User presence tracking (by principal)
   - Chat message storage/relay (auth required)
   - Friend graph queries (by principal)

4. **Chat Integration**
   - Replace mock messages in `ChatOverlayView`
   - Connect to ICP chat relay with II auth
   - Real-time message streaming
   - Display user identities (II principal → username mapping)

5. **State Sync Timer**
   - Every 5s during playback: send authenticated state to ICP
   - Receive state updates from other users
   - Handle play/pause/seek events
   - Verify messages are from authenticated principals

### Why Not ICP Now?

Current focus: **Get video playback working first**

Once MPV renders video properly:
1. Test full playback flow
2. Verify Real-Debrid integration
3. Then add ICP signaling layer

ICP is an **enhancement**, not a blocker for core functionality.

### References
- **Internet Identity Docs:** https://internetcomputer.org/docs/current/developer-docs/identity/internet-identity/
- **ICP Swift SDK:** https://github.com/internet-computer/agent-swift (or equivalent)
- ColorFruit Port Guide: See `COLORFRUIT_PORT_GUIDE.md`
- Migration Notes: See `MIGRATION_COMPLETE.md` lines 143-144
- Room Architecture: `COLORFRUIT_PORT_GUIDE.md` lines 7-50

### Authentication Flow (Planned)
```swift
// On app launch or when accessing social features:
1. Check if II principal exists in Keychain
2. If not: Present II login UI
   - User authenticates via Internet Identity
   - Receive delegation
   - Store principal ID in Keychain
3. Use principal for all ICP canister calls
4. Handle delegation expiry (re-authenticate)
```

---

## 🔗 Useful References

- **MPV Render API Docs:** https://mpv.io/manual/master/#embedding-into-other-programs-libmpv
- **IINA Source (reference):** https://github.com/iina/iina
- **libmpv Options:** https://mpv.io/manual/master/#options
- **Error Codes:** https://github.com/mpv-player/mpv/blob/master/libmpv/client.h

---

## ⚡ Quick Commands Reference

```bash
# Build
bash build-app.sh

# Run
open build/RedLemon.app

# Debug logs
log stream --predicate 'processImagePath contains "RedLemon"' --level default --style compact

# Check library symbols
nm Frameworks/libmpv.2.dylib | grep render

# Check library dependencies
otool -L Frameworks/libmpv.2.dylib

# Check library capabilities
strings Frameworks/libmpv.2.dylib | grep -i "vo-"
```

---

**END OF HANDOFF**

*This document contains everything needed to continue debugging the video rendering issue from the current state. The audio-only test proved the issue is isolated to video rendering, and we're currently testing OpenGL render API with proper initialization.*
