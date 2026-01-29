# RedLemon Current State (December 2025)
**For AI Assistants & New Developers**

This document explains the **current production architecture** of RedLemon. Read this first to understand what's actually running.

---

## 🎯 What Is RedLemon?

RedLemon is a **native macOS streaming app** (Swift/SwiftUI) that:
- Streams movies/TV shows via **Real-Debrid** (premium link service)
- Supports **watch parties** with real-time sync (via Supabase Realtime)
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
│  ├─ SupabaseRealtimeClient (Custom WS)     │
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
│  ├─ Realtime Channels (Signaling)          │
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
User clicks play
    ↓
Real-Debrid unrestricts torrent → direct HTTP link
    ↓
MPV plays video from HTTP stream
    ↓
(Optional) Watch party: Custom SupabaseRealtimeClient → Supabase
```

---

## 🔑 Key Technologies

### **Networking**
- **No Official Supabase SDK**: We use a custom `SupabaseRealtimeClient` (URLSession-based) to interact with Supabase, avoiding Swift version conflicts.
- **Supabase Realtime**: Used for Watch Party signaling and chat.
- **Direct REST API**: Used for database operations (users, friends).

### **Video Playback**
- **MPV**: Core video player.
- **Quality Filtering**: x265/HEVC blocked server-side to ensure compatibility.

### **Real-Time Sync**
- **Service**: Supabase Realtime.
- **Manager**: `RealtimeChannelManager.swift`.
- **Protocol**: Broadcasts `sync` events (play, pause, seek, position).

---

## 📁 Project Structure

```
RedLemon-Native/
├── Sources/
│   ├── App/
│   │   ├── Config.swift              # Supabase URL/keys
│   │   ├── AppState.swift            # Global state
│   │   └── RedLemonApp.swift         # Entry point
│   ├── Features/
│   │   ├── Auth/                     # Username setup
│   │   ├── Browse/                   # Catalog
│   │   ├── Friends/                  # Friend system
│   │   ├── Player/                   # MPV integration
│   │   ├── Rooms/                    # Watch party rooms
│   │   ├── WatchParty/               # Real-time sync logic
│   │   │   └── RealtimeChannelManager.swift
│   ├── Networking/
│   │   ├── SupabaseClient.swift      # REST client
│   │   ├── SupabaseRealtimeClient.swift  # Custom WS client
│   │   └── LocalAPIClient.swift      # Vapor client
│   ├── Server/                       # Local Vapor server
│   └── Services/                     # UpdateManager, etc.
```

---

## 🔐 Security & Privacy

### **What's Public**
- ✅ Supabase **anon key** (RLS-protected)
- ✅ Source code

### **What's Private**
- ❌ Supabase **service_role** key
- ❌ User's Real-Debrid/SubDL keys (Keychain only)

### **Privacy Features**
- ✅ **No telemetry**
- ✅ **Local watch history**
- ✅ **Keychain-secured credentials**

---

## 🔄 Recent Changes (January 2026)

### **Added/Improved**
- ✅ **Atomic Payment Processing**: Robust crypto payment gateway using server-side RPCs for atomic transaction logging and premium status updates.
- ✅ **Subscription Persistence**: Fixed date decoding and added database triggers to ensure `premium_until` and `subscription_expires_at` remain synced across app restarts.
- ✅ **Security Hardening**: Enforced cryptographic signatures for all database write operations to comply with strict RLS policies.
- ✅ **Lobby Stability**: Decoupled Realtime and Database connection layers to prevent "all-or-nothing" failures in the Lobby.
- ✅ **Event Improvements**: Fixed event countdowns, auto-start loops, and event-specific heartbeat grace periods (90s).
- ✅ **Monetization Strategy Hardening**: Implemented a robust 24-hour hosting limit for free users using a persistent `room_creation_history` table. Hardened premium status logic to strictly enforce expiration dates even if `is_premium` flag is true.
- ✅ **Grace Period Protection**: Added clock-drift protection to the 10-minute refund grace period for hosting credits.

### **Current Focus**
- ✅ Payment System Reliability
- ✅ Watch Party Consistency
- ✅ Advanced Subtitle Extraction (Smart Fallbacks)
- ✅ Production Monitoring & Logging

---

## 🔧 For AI Assistants

- **Watch Party**: Look at `RealtimeChannelManager.swift`. It uses `SupabaseRealtimeClient` to sync via Supabase channels.
- **Friends**: `FriendsView.swift` and `SupabaseClient.swift`.
- **Playback**: `MPVPlayerViewModel.swift`.
- **Payments**: `check-payment` edge function and `process_payment_batch_secure` RPC.

---

**Last Updated:** January 29, 2026
**Status:** Hardening Phase (Production Ready)
