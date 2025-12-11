# RedLemon Documentation Index
**For AI Assistants and Future Developers**
**Last Updated:** December 10, 2025

This document helps you quickly understand the RedLemon project structure and find the information you need.

---

## 🚀 Quick Start (For New AI Assistants)

**Read these in order:**

1. **HANDOFF.md** - Current project status and what works
2. **docs/SUPABASE_SETUP.md** - Database setup and configuration
3. **docs/MONETIZATION_ROADMAP.md** - Payment and hosting strategy (Bitcoin/LNBits)
4. **ROADMAP.md** - Product vision and development phases

**Then dive deeper as needed** (see sections below)

---

## 📂 Documentation Structure

### Core Project Docs

| File | Purpose | When to Read |
|------|---------|--------------|
| **HANDOFF.md** | Current status, features, architecture | Always read first |
| **README.md** | Project overview, quick start, installation | Setting up or distributing |
| **ROADMAP.md** | Product roadmap, feature status, vision | Understanding long-term plans |

### Backend & Infrastructure

| File | Purpose | When to Read |
|------|---------|--------------|
| **docs/SUPABASE_SETUP.md** | Database setup and schema | Working with friends/rooms/watch parties |
| **appcast.xml** | Sparkle update feed (GitHub-hosted) | Releasing new versions |
| **docs/MONETIZATION_ROADMAP.md** | Monetization strategy | Implementing payments |

### Performance & Technical

| File | Purpose | When to Read |
|------|---------|--------------|
| **docs/PERFORMANCE.md** | Performance optimization guide | Debugging slowness |

### Archived (Historical Reference)

| File | Purpose |
|------|---------|
| **docs/archive/AI_HANDOFF.md** | Old Nov 2 handoff (subtitle debugging) |
| **docs/archive/MIGRATION_COMPLETE.md** | WKWebView → Native Swift migration |
| **docs/archive/COLORFRUIT_PORT_GUIDE.md** | Electron → Swift port guide |

---

## 🎯 Common Scenarios

### "I'm a new AI assistant, what's going on?"
1. Read **HANDOFF.md** (5 min) - Get current state
2. Skim **ROADMAP.md** (3 min) - Understand vision
3. Read **docs/SUPABASE_SETUP.md** (10 min) - Critical for backend work

### "I need to deploy a new app version"
1. Update version in `scripts/build-app-debug.sh` (CFBundleShortVersionString and CFBundleVersion)
2. Build app: `scripts/build-app-debug.sh`
3. Create DMG: `scripts/build-dmg.sh`
4. Upload DMG to GitHub Releases
5. Update `appcast.xml` with new version and file size
6. Commit and push appcast.xml to GitHub

### "What are we building next?"
→ **ROADMAP.md** (Phase 2: Watch Parties & Phase 3: Monetization)

### "The app won't build"
→ **README.md** (Build Instructions) + Check **Package.swift**

### "Username or friends system isn't working"
→ **docs/SUPABASE_SETUP.md** (Database schema and queries)

### "Auto-updates aren't working"
1. Check Sparkle logs in Console.app (filter by "Sparkle")
2. Verify appcast.xml is accessible: `curl https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml`
3. Verify app is code-signed: `codesign -dvv build/RedLemon.app`
4. Check Info.plist has SUFeedURL and SUAllowsInsecureUpdates keys

### "What's our tech stack?"
→ **HANDOFF.md** (Section: "Technical Architecture")

---

## 🔑 Critical Information (Always Know This)

### Production System
```
GitHub Releases: https://github.com/orangeapple1272/Redlemon/releases
Appcast Feed: https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml
Database: Supabase PostgreSQL
Auto-Updates: Sparkle 2.8.0 framework
Payments: Bitcoin/LNBits (Planned)
```

### Local Development
```
Swift Build: cd ~/Desktop/RedLemon-Native && scripts/build-app-debug.sh
Create DMG: scripts/build-dmg.sh
Launch App: open build/RedLemon.app
Code Signing: Ad-hoc (development), Developer ID (production)
```

### Key Dependencies
```
Swift 5.7+, SwiftUI (macOS 12+)
libmpv.2.dylib (from mpv-iina)
Real-Debrid API (streaming)
Supabase PostgreSQL (friends/rooms)
Sparkle (Updates)
```

---

## 📊 Project Structure

```
RedLemon-Native/
├── Sources/
│   ├── App/
│   │   ├── RedLemonApp.swift          # SwiftUI app entry point
│   │   ├── AppState.swift             # Global state, playback logic
│   │   └── ContentView.swift          # Main navigation
│   ├── Features/
│   │   ├── Browse/                    # Movie/TV browsing
│   │   ├── Player/                    # MPV integration
│   │   ├── Search/                    # Media search
│   │   ├── Settings/                  # User settings, username
│   │   └── WatchParty/                # WebRTC/Supabase sync
│   ├── Models/                        # Data structures
│   ├── Networking/
│   │   ├── SupabaseClient.swift       # Database client (friends/rooms)
│   │   └── LocalAPIClient.swift       # Metadata fetching
│   └── Server/
│       ├── HTTPServer.swift           # Vapor server for streaming
│       ├── Services/                  # Real-Debrid, SubDL, providers
│       └── Routes/                    # API endpoints
├── scripts/                           # Build and utility scripts
│   ├── build-app-debug.sh
│   └── build-dmg.sh
├── docs/                              # Detailed documentation
│   ├── SUPABASE_SETUP.md              # Database schema
│   ├── MONETIZATION_ROADMAP.md        # Payment system
│   ├── PERFORMANCE.md                 # Optimization guide
│   └── archive/                       # Historical docs
├── Frameworks/
│   └── libmpv.2.dylib                 # MPV player library
├── Resources/
│   └── AppIcon.icns                   # App icon
└── Root Documentation/
    ├── README.md                      # Project overview
    ├── INDEX.md (this file)           # Documentation navigation
    ├── HANDOFF.md                     # Current status
    └── ROADMAP.md                     # Product roadmap
```

---

## 🛠️ Quick Commands Reference

### Build & Run
```bash
# Build app
cd ~/Desktop/RedLemon-Native
swift build

# Run app
open build/RedLemon.app

# Run with logs
./.build/debug/RedLemon
```

### Git
```bash
# Check what changed
git status

# See recent commits
git log --oneline -10

# View file history
git log --follow path/to/file
```

---

## 🚨 Emergency Procedures

### "App won't connect to backend!"
1. Check internet connection
2. Verify Supabase status
3. Check debug logs for connection errors

### "Build fails!"
1. Check Swift version: `swift --version` (need 5.7+)
2. Clean build: `rm -rf .build && swift build`
3. Check dependencies: `swift package resolve`
