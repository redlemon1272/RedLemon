# RedLemon Documentation Index
**For AI Assistants and Future Developers**
**Last Updated:** November 8, 2025

This document helps you quickly understand the RedLemon project structure and find the information you need.

---

## 🚀 Quick Start (For New AI Assistants)

**Read these in order:**

1. **HANDOFF.md** - Current project status (v1.0.8) and what works
2. **docs/SUPABASE_SETUP.md** - Database setup and configuration
3. **ROADMAP.md** - Product vision and development phases

**Then dive deeper as needed** (see sections below)

---

## 📂 Documentation Structure

### Core Project Docs

| File | Purpose | When to Read |
|------|---------|--------------|
| **HANDOFF.md** | Current status (v1.0.8), features, architecture | Always read first |
| **README.md** | Project overview, quick start, installation | Setting up or distributing |
| **ROADMAP.md** | Product roadmap, feature status, vision | Understanding long-term plans |

### Backend & Infrastructure

| File | Purpose | When to Read |
|------|---------|--------------|
| **docs/SUPABASE_SETUP.md** | Database setup and schema | Working with friends/rooms/watch parties |
| **appcast.xml** | Sparkle update feed (GitHub-hosted) | Releasing new versions |

### Performance & Technical

| File | Purpose | When to Read |
|------|---------|--------------|
| **docs/PERFORMANCE.md** | Performance optimization guide | Debugging slowness |
| **docs/PERFORMANCE.md** | Optimization targets | Improving app performance |

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
3. Read **docs/ICP_MAINNET_GUIDE.md** (10 min) - Critical for backend work

### "I need to deploy a new app version"
1. Update version in `build-app-debug.sh` (CFBundleShortVersionString and CFBundleVersion)
2. Build app: `./build-app-debug.sh`
3. Create DMG: `./build-dmg.sh`
4. Upload DMG to GitHub Releases
5. Update `appcast.xml` with new version and file size
6. Commit and push appcast.xml to GitHub

### "What are we building next?"
→ **ROADMAP.md** (Phase 2: Watch Parties)

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
Current Version: v1.0.8 (build 8)
GitHub Releases: https://github.com/orangeapple1272/Redlemon/releases
Appcast Feed: https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml
Database: Supabase PostgreSQL
Auto-Updates: Sparkle 2.8.0 framework
```

### Local Development
```
Swift Build: cd ~/Desktop/RedLemon-Native && ./build-app-debug.sh
Create DMG: ./build-dmg.sh
Launch App: open build/RedLemon.app
Code Signing: Ad-hoc (development), Developer ID (production)
```

### Key Dependencies
```
Swift 5.7+, SwiftUI (macOS 12+)
libmpv.2.dylib (from mpv-iina)
Python 3 (bundled proxy)
dfx 0.26+ (ICP SDK)
Real-Debrid API (streaming)
Supabase PostgreSQL (friends/rooms)
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
│   │   └── WatchParty/                # WebRTC sync (NEW)
│   ├── Models/                        # Data structures
│   ├── Networking/
│   │   ├── SupabaseClient.swift       # Database client (friends/rooms)
│   │   └── LocalAPIClient.swift       # Metadata fetching
│   └── Server/
│       ├── HTTPServer.swift           # Vapor server for streaming
│       ├── Services/                  # Real-Debrid, SubDL, providers
│       └── Routes/                    # API endpoints
├── icp-backend/
│   ├── backend/
│   │   └── main.mo                    # Motoko smart contract (updates)
│   ├── proxy.py                       # HTTP→Candid translator (bundled)
│   └── README.md                      # Backend documentation
├── docs/
│   ├── AUTO_UPDATE_SYSTEM.md          # Update deployment guide
│   ├── ICP_MAINNET_GUIDE.md           # Mainnet deployment
│   ├── SUPABASE_SETUP.md              # Database schema
│   └── PERFORMANCE.md                 # Optimization guide
│   └── canister_ids.json              # Mainnet canister mapping
├── Frameworks/
│   └── libmpv.2.dylib                 # MPV player library
├── Resources/
│   └── AppIcon.icns                   # App icon
├── docs/                              # Detailed documentation
│   ├── ICP_MAINNET_GUIDE.md           # Production backend guide
│   ├── WEBRTC_GUIDE.md                # WebRTC integration
│   ├── NEXT_STEPS.md                  # Immediate tasks
│   ├── TV_SHOW_IMPLEMENTATION.md      # TV data structures
│   ├── PERFORMANCE.md                 # Optimization targets
│   └── archive/                       # Historical docs
│       ├── AI_HANDOFF.md              # Old Nov 2 handoff
│       ├── MIGRATION_COMPLETE.md      # WKWebView migration
│       └── COLORFRUIT_PORT_GUIDE.md   # Electron port guide
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

### ICP Backend
```bash
# Check mainnet status
cd ~/Desktop/RedLemon-Native/icp-backend
export DFX_WARNING=-mainnet_plaintext_identity
dfx canister status backend --network ic

# Deploy update
dfx deploy backend --network ic

# Test username
dfx canister call backend getUsername --network ic \
  '(principal "ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae")'
```

### Python Proxy
```bash
# Start proxy
cd ~/Desktop/RedLemon-Native/icp-backend
python3 proxy.py &

# Check if running
ps aux | grep proxy.py

# Kill proxy
pkill -f "python3 proxy.py"
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

### "Canister is out of cycles!"
```bash
# Top up immediately (see ICP_MAINNET_GUIDE.md)
dfx cycles convert --amount 0.5 --network ic
dfx canister deposit-cycles 100000000000 backend --network ic
```

### "Python proxy crashed!"
```bash
cd ~/Desktop/RedLemon-Native/icp-backend
pkill -f "python3 proxy.py"
python3 proxy.py &
```

### "App won't connect to backend!"
1. Check proxy is running: `ps aux | grep proxy.py`
2. Check canister status: `dfx canister status backend --network ic`
3. Test direct call: `dfx canister call backend getUsername --network ic '(principal "ggjfp-2cemt-...")'`

### "Build fails!"
1. Check Swift version: `swift --version` (need 5.7+)
2. Clean build: `rm -rf .build && swift build`
3. Check dependencies: `swift package resolve`

---

## 📚 External Resources

### ICP Documentation
- **Main Docs**: https://internetcomputer.org/docs
- **Motoko Language**: https://internetcomputer.org/docs/current/motoko/main/motoko
- **dfx CLI**: https://internetcomputer.org/docs/current/references/cli-reference/
- **Developer Forum**: https://forum.dfinity.org

### Swift & MPV
- **Swift Package Manager**: https://www.swift.org/package-manager/
- **SwiftUI**: https://developer.apple.com/documentation/swiftui
- **libmpv**: https://mpv.io/manual/master/#embedding-into-other-programs-libmpv

### APIs We Use
- **Real-Debrid**: https://api.real-debrid.com
- **SubDL**: https://subdl.com
- **MediaFusion**: https://mediafusion.elfhosted.com
- **Torrentio**: https://torrentio.strem.fun

---

## 🎯 Development Philosophy

From **ROADMAP.md**:
- **No Technical Debt**: Fix it right, not fast
- **Test Everything**: Write tests before features
- **User First**: Every decision from user's perspective
- **Performance Obsession**: Profile, optimize, repeat
- **No Rush**: "No deadline = no pressure = better quality"

---

## 📝 Version History

### v1.0 (Current - Nov 3, 2025)
- ✅ Video playback with MPV
- ✅ Real-Debrid integration
- ✅ Subtitle loading (SubDL)
- ✅ Username system (ICP mainnet)
- ✅ WebRTC infrastructure (code ready)
- 🔄 Watch parties (in development)

### v0.5 (Nov 1, 2025)
- ✅ Basic UI and navigation
- ✅ Search and browse
- ✅ Season/episode selection
- ✅ Local development environment

---

**For AI Assistants:** If you're continuing work on RedLemon, you now have everything you need to understand the full context, manage the ICP backend, deploy updates, handle cycles, and continue development. Good luck! 🍋

**Last Updated:** November 3, 2025
