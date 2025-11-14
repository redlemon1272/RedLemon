# RedLemon Current State (November 2025)
**For AI Assistants & New Developers**

This document explains the **current production architecture** of RedLemon. Read this first to understand what's actually running.

---

## 🎯 What Is RedLemon?

RedLemon is a **native macOS streaming app** (Swift/SwiftUI) that:
- Streams movies/TV shows via **Real-Debrid** (premium link service)
- Supports **watch parties** with real-time sync
- Has **optional social features** (username, friends, rooms)
- Uses **auto-updates** via Sparkle framework
- Respects **privacy** (no telemetry, local-first)

**Think:** Private Stremio/Popcorn Time with native macOS UI and social features.

---

## 🏗️ Current Architecture (2025)

### Client (Native macOS App)
```
┌─────────────────────────────────────────────┐
│  RedLemon.app (Swift 5.7.2+)               │
│  ├─ SwiftUI (UI layer)                     │
│  ├─ Vapor 4.96 (local HTTP server)         │
│  ├─ URLSession WebSocket (Realtime)        │
│  ├─ MPV (video playback)                   │
│  ├─ Sparkle 2.8 (auto-updates)             │
│  └─ Keychain (credential storage)          │
└─────────────────────────────────────────────┘
```

### Backend Services
```
┌─────────────────────────────────────────────┐
│  Supabase (PostgreSQL + Realtime)          │
│  ├─ Users table (usernames, IDs)           │
│  ├─ Friendships table (bidirectional)      │
│  ├─ Watch party rooms                      │
│  ├─ Realtime WebSocket (Phoenix protocol)  │
│  └─ Row Level Security (RLS) policies      │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│  Stream Providers (Torrent Indexers)       │
│  ├─ Torrentio (primary)                    │
│  ├─ MediaFusion                            │
│  ├─ Comet                                  │
│  ├─ Jackettio                              │
│  └─ Zilean                                 │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│  GitHub Releases (Distribution)             │
│  ├─ DMG files (app bundles)                │
│  ├─ appcast.xml (Sparkle feed)             │
│  └─ HTTPS downloads                        │
└─────────────────────────────────────────────┘
```

### Data Flow
```
User opens RedLemon
    ↓
Local Vapor HTTP server starts (port 47253)
    ↓
User searches for content
    ↓
Server fetches streams from providers (Torrentio, etc.)
    ↓
Filters x265/HEVC, buckets by quality (4K/1080p/720p/480p)
    ↓
Attaches subtitles from SubDL
    ↓
User clicks play
    ↓
Real-Debrid unrestricts torrent → direct HTTP link
    ↓
MPV plays video from HTTP stream
    ↓
(Optional) Watch party: URLSession WebSocket → Supabase Realtime
```

---

## 🔑 Key Technologies

### **No Supabase SDK**
- ❌ We **removed** the Supabase Swift SDK (requires Swift 5.10, we're on 5.7.2)
- ✅ We use **native URLSession WebSocketTask** instead
- ✅ Manually implement **Phoenix protocol** for Supabase Realtime
- ✅ Direct REST API calls for database operations

### **No ICP/Blockchain**
- ❌ ICP (Internet Computer) was **completely removed** (November 2025)
- ❌ No blockchain, no canisters, no dfx
- ✅ Updates via **Sparkle + GitHub Releases** only

### **Quality Filtering**
- **x265/HEVC blocked** - Known to cause playback issues on older Macs
- **Quality buckets** - 4K, 1080p, 720p, 480p (ColorFruit-inspired)
- **Seeder thresholds** - 1 seeder minimum (Real-Debrid caches and streams via HTTP)
- **Episode matching** - Server-side filtering for TV shows (S01E01 patterns)

### **Real-Time Sync**
- **Protocol:** Phoenix (Supabase Realtime standard)
- **Messages:** `phx_join`, `phx_leave`, `broadcast`, `presence_state`, `presence_diff`
- **Heartbeat:** Every 30 seconds to keep connection alive
- **Disconnect:** Properly cancels WebSocket before setting flags (fixed after 4 iterations)

---

## 📁 Project Structure

```
RedLemon-Native/
├── Sources/
│   ├── App/
│   │   ├── Config.swift              # Supabase URL/keys, server config
│   │   ├── AppState.swift            # Global state, navigation
│   │   └── RedLemonApp.swift         # App entry point
│   ├── Features/
│   │   ├── Auth/                     # Username setup
│   │   ├── Browse/                   # Movie/TV catalog
│   │   ├── Friends/                  # Friend management
│   │   ├── Player/                   # MPV integration
│   │   ├── Rooms/                    # Watch party rooms
│   │   ├── Search/                   # Content search
│   │   ├── Settings/                 # App settings
│   │   └── WatchParty/               # Real-time sync
│   ├── Models/                       # Data structures
│   ├── Networking/
│   │   ├── SupabaseClient.swift      # REST API client
│   │   ├── SupabaseRealtimeClient.swift  # URLSession WebSocket
│   │   └── LocalAPIClient.swift      # Vapor server client
│   ├── Server/
│   │   ├── HTTPServer.swift          # Vapor server setup
│   │   ├── Routes/                   # API endpoints
│   │   └── Services/                 # Provider integrations
│   └── Services/
│       └── UpdateManager.swift       # Sparkle integration
├── Frameworks/                       # MPV libraries
├── Resources/                        # Assets, icons
├── docs/                            # Documentation
│   ├── archive/                     # Old/deprecated docs
│   └── SUPABASE_SETUP.md            # Database schema
├── stremio-web/                     # Stremio catalog (metadata)
├── appcast.xml                      # Sparkle update feed
├── Package.swift                    # Swift dependencies
└── build-app-debug.sh               # Build script
```

---

## 🔐 Security & Privacy

### **What's Public (Safe to Share)**
- ✅ Supabase **anon key** (in `Config.swift`) - Public by design, RLS-protected
- ✅ GitHub repository URL
- ✅ Appcast.xml feed URL
- ✅ All source code

### **What's Private (Never Share)**
- ❌ Supabase **service_role** key (NOT in repo, admin-only)
- ❌ User's Real-Debrid API token (Keychain only)
- ❌ User's SubDL API key (Keychain only)

### **Privacy Features**
- ✅ **No telemetry** - Zero analytics, tracking, or crash reports
- ✅ **Local watch history** - Never uploaded to cloud
- ✅ **Optional username** - Can use app without account
- ✅ **Keychain-secured** - All credentials in macOS Keychain

### **Row Level Security (RLS)**
All Supabase tables have RLS policies:
- Users can only see their own data
- Friendships are bidirectional (both users can see)
- Room participants can only see members of their room

---

## 🚀 Build & Run

### **Requirements**
- macOS 12.0+ (Monterey)
- Xcode 14.2 (Swift 5.7.2)
- Real-Debrid account (for streaming)

### **Build from Source**
```bash
cd /path/to/RedLemon-Native
./build-app-debug.sh    # Builds to build/RedLemon.app
open build/RedLemon.app  # Launch
```

### **Create DMG**
```bash
./build-dmg.sh  # Creates RedLemon-Installer.dmg
```

### **View Logs**
```bash
log stream --predicate 'processImagePath contains "RedLemon"' --level default
```

---

## 🐛 Common Issues & Solutions

### **Build Fails with "Cannot find Supabase SDK"**
✅ **EXPECTED** - We don't use the SDK anymore. Build should succeed with our custom URLSession client.

### **x265/HEVC Streams Not Playing**
✅ **EXPECTED** - We filter these out server-side (line 86-96 in `StreamRoutes.swift`). They cause issues on older Macs.

### **WebSocket Not Disconnecting**
✅ **FIXED** - `cleanup()` is now async, `exitPlayer()` awaits it, WebSocket canceled before flags set.

### **Game of Thrones (or other shows) Show "No Streams Found"**
✅ **FIXED** - Server now filters by episode pattern BEFORE bucketing (lines 130-179 in `StreamRoutes.swift`).

### **MPV Render Context Error -18**
⚠️ **KNOWN ISSUE** - Some Macs don't support OpenGL render context. Fallback to native window or software rendering.

---

## 📊 Current Status (v1.0.12)

### **What Works**
- ✅ Movie/TV streaming via Real-Debrid
- ✅ Quality bucketing (4K/1080p/720p/480p)
- ✅ Subtitle matching with scoring
- ✅ Watch parties with real-time sync
- ✅ Friend system (MySpace Tom auto-friend)
- ✅ Username setup (optional)
- ✅ Auto-updates via Sparkle
- ✅ Episode pattern matching
- ✅ WebSocket disconnect (properly fixed)

### **What's Not Implemented**
- ❌ WebRTC video chat (removed, too complex)
- ❌ ICP blockchain integration (removed completely)
- ❌ Playlist/queue system
- ❌ Download management
- ❌ Mobile apps (macOS only)

### **Known Limitations**
- **MacBook Air 2015** is minimum supported (Swift 5.7.2 requirement)
- **No code signing** (development builds only, production needs Ed25519 keys)
- **Local HTTP server** (not exposed to network, 127.0.0.1 only)
- **x265 filtered** (quality concerns, not configurable)

---

## 🔄 Recent Changes (November 2025)

### **Removed**
- ❌ ICP backend (`icp-backend/` directory)
- ❌ Supabase SDK dependency (Package.swift)
- ❌ SwiftNIO (caused 4+ crashes, replaced with URLSession)
- ❌ Personal file paths from code/docs
- ❌ Outdated scripts (`check_lemontom.sh`)
- ❌ 10 `.backup` files

### **Added**
- ✅ Native URLSession WebSocket client (400 lines)
- ✅ Server-side episode filtering
- ✅ Async cleanup for proper WebSocket disconnect
- ✅ Enhanced security documentation
- ✅ Comprehensive audit reports

### **Fixed**
- ✅ WebSocket disconnect (messages flooding after exit)
- ✅ Episode pattern matching (Game of Thrones now works)
- ✅ Subtitle scoring (format/resolution matching)
- ✅ Browse tab error flash (removed empty state error)

---

## 🎯 Where to Look for Specific Features

### **Stream Resolution**
- `Sources/Server/Routes/StreamRoutes.swift` (lines 50-250)
- Quality bucketing, seeder filtering, episode matching

### **WebSocket/Real-Time**
- `Sources/Networking/SupabaseRealtimeClient.swift` (400 lines, URLSession implementation)
- `Sources/Features/WatchParty/RealtimeChannelManager.swift` (Phoenix protocol wrapper)

### **Player**
- `Sources/Features/Player/MPVPlayerViewModel.swift` (1000+ lines, main logic)
- `Sources/Features/Player/MPVWrapper.swift` (MPV integration)

### **Friend System**
- `Sources/Features/Friends/FriendsView.swift` (UI)
- `Sources/Networking/SupabaseClient.swift` (REST API calls)

### **Auto-Updates**
- `Sources/Services/UpdateManager.swift` (Sparkle integration)
- `appcast.xml` (update manifest, GitHub-hosted)

### **Configuration**
- `Sources/App/Config.swift` (Supabase URL/keys, server port)
- Port 47253 (default, respects REDLEMON_PORT env var)

---

## 🧪 Testing

### **Manual Testing**
```bash
# Build and run
./build-app-debug.sh && open build/RedLemon.app

# Watch logs in real-time
log stream --predicate 'processImagePath contains "RedLemon"' --level default --style compact

# Check for specific issues
log stream --predicate 'processImagePath contains "RedLemon"' | grep "ERROR\|WebSocket\|MPV"
```

### **Key Test Scenarios**
1. **Stream Resolution** - Search "Game of Thrones", play S01E01
2. **WebSocket Connect** - Join watch party room, verify "Connected to Supabase Realtime"
3. **WebSocket Disconnect** - Exit room, verify messages stop immediately
4. **Friend Request** - Send friend request, verify bidirectional friendship created
5. **Auto-Update** - Check for updates, verify appcast.xml fetch

---

## 📚 Documentation Hierarchy

Read in this order:

1. **CURRENT_STATE.md** ← You are here (architecture overview)
2. **HANDOFF.md** - Detailed feature status, recent work
3. **docs/SUPABASE_SETUP.md** - Database schema and RLS policies
4. **SECURITY.md** - Security model, what's public vs private
5. **SECURITY_AUDIT.md** - Recent security audit results
6. **ROADMAP.md** - Future plans and vision
7. **INDEX.md** - Documentation index for specific topics

---

## 💡 Quick Facts

- **Language:** Swift 5.7.2 (macOS 12+ compatible)
- **UI Framework:** SwiftUI
- **HTTP Server:** Vapor 4.96 (localhost:47253)
- **Database:** Supabase PostgreSQL (cloud-hosted)
- **Real-Time:** URLSession WebSocket (Phoenix protocol)
- **Updates:** Sparkle 2.8.0 (GitHub Releases)
- **Video Player:** MPV (libmpv)
- **Debrid Service:** Real-Debrid (required for streaming)
- **Subtitles:** SubDL API (optional, user-provided key)
- **Repository:** https://github.com/orangeapple1272/Redlemon

---

## 🎬 What Happens When You Click "Play"

1. User searches for "Breaking Bad S05E14"
2. `LocalAPIClient.shared.getStreamBucket()` called
3. Vapor server receives request at `/api/streams/resolveByQuality`
4. Server fetches streams from 5 providers (Torrentio, MediaFusion, etc.)
5. Filters out x265/HEVC codecs (lines 86-96)
6. Filters by episode pattern "s05e14" (lines 130-179)
7. Buckets by quality: 4K, 1080p, 720p, 480p
8. Applies seeder threshold (1 minimum)
9. Sorts by codec (x264 first), then seeders, then file extension
10. Attaches matching subtitles from SubDL
11. Returns primary + 4 alternates per quality tier
12. Client tries primary first
13. Real-Debrid API called to unrestrict torrent
14. Real-Debrid returns direct HTTP video URL
15. MPV loads and plays the video
16. (Optional) If in watch party: Broadcasts playback position every 2 seconds via WebSocket

---

## 🔧 For AI Assistants

When you see:
- "Episode not matching" → Check `StreamRoutes.swift` lines 130-179 (episode filtering)
- "WebSocket not disconnecting" → Check `MPVPlayerViewModel.swift` cleanup() (must be async, awaited)
- "x265 streams playing" → Should be filtered at line 86-96 in `StreamRoutes.swift`
- "Build fails with Supabase" → We don't use the SDK, check if URLSession implementation is intact
- "ICP references" → All removed November 2025, archive only

---

**Last Updated:** November 11, 2025
**Version:** v1.0.12
**Status:** Production-ready, actively maintained

Read **HANDOFF.md** next for detailed recent work and current feature status.
