# RedLemon

A native macOS media streaming app with watch party features.

**Current Version:** v1.0.146 (build 146)
**Status:** ✅ Production Ready

## 🚀 For AI Assistants & Developers

**START HERE:** Read **[INDEX.md](INDEX.md)** for complete documentation navigation.

**Quick Links:**
- **[HANDOFF.md](HANDOFF.md)** - Current project status (v1.0.8)
- **[docs/ICP_MAINNET_GUIDE.md](docs/ICP_MAINNET_GUIDE.md)** - Watch party backend guide
- **[ROADMAP.md](ROADMAP.md)** - Product roadmap

## ✨ Features

- 🎬 Browse and search movies/TV shows
- 📺 Season and episode selection
- 💬 Automatic subtitle fetching and syncing
- ⚡ High-performance MPV player with hardware acceleration
- 🔗 Real-Debrid integration for premium streaming
- 👥 **Watch Parties** - Synchronized viewing with friends (Supabase-powered)
- 🔐 **Username System** - Persistent usernames in database
- 🔄 **Auto-Updates** - Sparkle framework integration
- 🎯 **4-Character Room Codes** - Easy sharing (e.g., "K7M2")
- 👤 **MySpace Tom Feature** - Every user gets `lemontom` as first friend

## Project Structure

```
RedLemon-Native/
├── Sources/
│   ├── App/                    # Main app and state management
│   ├── Features/
│   │   ├── Auth/              # Username-based authentication
│   │   ├── Browse/            # Media browsing
│   │   ├── Player/            # MPV video player
│   │   ├── Rooms/             # Watch party rooms
│   │   ├── Search/            # Media search
│   │   └── Settings/          # App settings
│   ├── Models/                # Data models
│   ├── Networking/            # API clients (Supabase)
│   └── Server/                # Backend Vapor server
└── Frameworks/                # libmpv and Sparkle.framework
```

## Quick Start

### 1. Download & Install
Download the latest DMG from the project distribution folder:
- Open `RedLemon-Installer.dmg`
- Drag RedLemon.app to Applications
- **Important:** To launch for the first time, **Right-Click (Control-Click)** the app in Applications and select **Open**.
- Click **"Open"** in the confirmation dialog (this bypasses the "Unidentified Developer" warning).

### 2. Build from Source (Developers)
```bash
# Build app
scripts/build-app-debug.sh

# Build DMG
scripts/build-dmg.sh

# Run app
open build/RedLemon.app
```
### 3. Configure
- Go to **Settings**
- Add your RealDebrid API token
- Create a username (stored in Supabase database)

## Watch Parties

Watch parties allow synchronized viewing with friends:

1. **Create a room** from any media detail page
2. **Share** the 4-character room code (e.g., `K7M2`)
3. **Watch** together - host controls playback for all guests

Each guest uses their own RealDebrid key to unlock the same file, ensuring perfect synchronization.

### MySpace Tom Feature 👤
Every new user automatically gets `lemontom` as their first friend (inspired by MySpace's Tom Anderson). No friend request needed - instant connection!

## Development

### Requirements
- macOS 12.0+
- Swift 5.9+
- Xcode Command Line Tools

### Architecture
- **Frontend**: Swift + SwiftUI
- **Video Player**: libmpv with hardware acceleration
- **Backend Server**: Vapor (HTTP server for metadata/streaming)
- **Database**: Supabase PostgreSQL (watch parties, users, friends)
- **Authentication**: Username-based
- **Auto-Updates**: Sparkle framework integration

## Auto-Updates 🔄

RedLemon uses the industry-standard **Sparkle framework** for auto-updates:
- **Check:** App checks for updates on launch (24hr interval)
- **Download:** DMG files hosted on production server
- **Verify:** Code signing validation (ad-hoc for development, Developer ID for production)
- **Install:** Automatic replacement and relaunch

Appcast feed: `https://151.243.109.243.nip.io/updates/appcast.xml`


## License

TBDv2

