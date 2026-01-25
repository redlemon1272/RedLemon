# RedLemon Open Source Strategy: Hybrid Model

> **Document Purpose:** This is the authoritative reference for splitting RedLemon into open and closed components. All AI assistants working on this project must follow this specification exactly.

> **Last Updated:** January 24, 2026
> **Status:** Planning Phase - Not Yet Executed

---

## Executive Summary

RedLemon is adopting a **hybrid open-source model** to build trust with the r/piracy community while protecting core intellectual property.

**Public GitHub Repo:** `redlemon-app/RedLemon` (to be created)
**Private Core Repo:** Remains private/unpublished

**The Promise to Users:**
- 85%+ of code will be open source
- Closed components are clearly documented
- No telemetry, no data collection (verifiable in open code)
- Pre-built binaries provided for easy testing

---

## Table of Contents

1. [Separation Criteria](#separation-criteria)
2. [Directory-by-Directory Breakdown](#directory-by-directory-breakdown)
3. [File-by-File Inventory](#file-by-file-inventory)
4. [Git Strategy](#git-strategy)
5. [Scrubber Defense-in-Depth](#scrubber-defense-in-depth)
6. [Build & Release Changes](#build--release-changes)
7. [Binary Verification (Trust Anchor)](#binary-verification-trust-anchor)
8. [Security Considerations](#security-considerations)
9. [Transparency Policy](#transparency-policy)
10. [Auditor's Guide (How to Verify)](#auditors-guide-how-to-verify)
11. [Communication Strategy](#communication-strategy)
12. [Verification Checklist](#verification-checklist)

---

## Separation Criteria

### CLOSED SOURCE (Core IP - Must Remain Private)

| Category | Rationale |
|----------|-----------|
| **Stream Resolution Engine** | Primary competitive advantage. Multi-provider aggregation, filtering, scoring logic. |
| **Provider Services** | API integrations (Torrentio, Comet, MediaFusion, Zilean, DebridSearch). Contains request patterns, rate limiting, fallback logic. |
| **Watch Party Sync** | Drift correction algorithms, Realtime message handling, presence management. Differentiating feature. |
| **DRM/Anti-Piracy Evasion** | Any code that helps bypass provider restrictions. |
| **Crypto/Payment Logic** | HD wallet derivation, signing, payment processing. Security + IP. |

### OPEN SOURCE (Transparency & Trust)

| Category | Rationale |
|----------|-----------|
| **UI Layer** (SwiftUI views) | Proves no malware, no hidden UI tricks. |
| **MPV Player Wrapper** | Standard libmpv bindings. Not competitive IP. |
| **HTTP Server Infrastructure** | Vapor routing, middleware. Shows architecture transparency. |
| **Logging, Caching, Utilities** | Infrastructure code. Low competitive value. |
| **Authentication (Client-side)** | Ed25519 key generation, signing. Shows security approach. |
| **Settings, Onboarding** | UX transparency. |
| **Social Features (UI-side)** | Friends list, presence UI. Logic may remain closed. |

---

## Directory-by-Directory Breakdown

Based on the AI_BIBLE.md architecture map:

```
RedLemon-Native/
├── Sources/
│   ├── App/
│   │   ├── RedLemonApp.swift              [OPEN] - App entry point
│   │   └── AppState.swift                  [OPEN] - Global state container
│   │
│   ├── Features/
│   │   ├── Player/
│   │   │   ├── MPVPlayerViewModel.swift   [CLOSED] - Sync logic + playback orchestration
│   │   │   ├── MPVWrapper.swift           [OPEN] - C interop, libmpv bindings
│   │   │   ├── PlayerView.swift           [OPEN] - UI
│   │   │   └── PlayerControlsView.swift   [OPEN] - UI
│   │   │
│   │   ├── Browse/
│   │   │   ├── BrowseViewModel.swift      [OPEN] - State management
│   │   │   ├── BrowseView.swift           [OPEN] - UI
│   │   │   └── BrowseComponents.swift     [OPEN] - UI components
│   │   │
│   │   ├── Lobby/
│   │   │   ├── LobbyViewModel.swift       [CLOSED] - Presence logic, room management
│   │   │   ├── LobbyView.swift            [OPEN] - UI
│   │   │   └── LobbyComponents.swift      [OPEN] - UI components
│   │   │
│   │   ├── Social/
│   │   │   ├── SocialService.swift        [CLOSED] - Presence, friends logic
│   │   │   ├── SocialView.swift           [OPEN] - UI
│   │   │   └── FriendsComponents.swift    [OPEN] - UI components
│   │   │
│   │   ├── Settings/
│   │   │   ├── SettingsView.swift         [OPEN] - UI
│   │   │   └── SettingsViewModel.swift    [OPEN] - State management
│   │   │
│   │   ├── Onboarding/
│   │   │   ├── OnboardingView.swift       [OPEN] - UI
│   │   │   └── OnboardingViewModel.swift  [OPEN] - State management
│   │   │
│   │   ├── Admin/
│   │   │   ├── AdminDashboardView.swift   [OPEN] - UI
│   │   │   └── (closed logic)            [CLOSED] - Dashboard data fetching
│   │   │
│   │   ├── Payments/
│   │   │   ├── PaymentView.swift          [OPEN] - UI
│   │   │   └── (payment logic)            [CLOSED] - HD wallet, crypto, edge functions
│   │   │
│   │   └── Events/
│   │       ├── EventsView.swift           [OPEN] - UI
│   │       └── EventsViewModel.swift      [CLOSED] - Event sync, countdown, auto-join
│   │
│   ├── Server/                    [MIXED - See detailed breakdown]
│   │   ├── HTTPServer.swift               [OPEN] - Server initialization
│   │   ├── LocalAuthMiddleware.swift      [OPEN] - Auth middleware
│   │   ├── LocalAPIClient.swift           [OPEN] - Client for local server
│   │   │
│   │   ├── Routes/
│   │   │   ├── StreamRoutes.swift         [CLOSED] - Calls to StreamResolver
│   │   │   ├── UnlockRoutes.swift         [CLOSED] - Real-Debrid unlocking
│   │   │   ├── MetadataRoutes.swift       [OPEN] - TMDb proxying
│   │   │   ├── SubtitleRoutes.swift       [CLOSED] - Provider integration
│   │   │   ├── ProxyRoutes.swift          [OPEN] - Generic proxy
│   │   │   └── TokenRoutes.swift          [OPEN] - Token management
│   │   │
│   │   ├── Services/
│   │   │   ├── StreamResolver.swift       [CLOSED] - CORE IP
│   │   │   ├── ProviderService.swift      [CLOSED] - Provider orchestration
│   │   │   ├── TorrentioService.swift     [CLOSED] - Provider implementation
│   │   │   ├── CometService.swift         [CLOSED] - Provider implementation
│   │   │   ├── MediaFusionService.swift   [CLOSED] - Provider implementation
│   │   │   ├── ZileanService.swift        [CLOSED] - Provider implementation
│   │   │   ├── DebridSearchService.swift  [CLOSED] - Provider implementation
│   │   │   ├── RealDebridClient.swift     [CLOSED] - API integration
│   │   │   ├── SubDLService.swift         [CLOSED] - Provider implementation
│   │   │   ├── MetadataService.swift      [OPEN] - TMDb integration
│   │   │   ├── SubtitleService.swift      [CLOSED] - Subtitle aggregation
│   │   │   └── DebridValidatorService.swift [CLOSED] - Token validation
│   │   │
│   │   └── Credentials/
│   │       ├── KeychainManager.swift      [OPEN] - Keychain access (security best practices)
│   │       └── AccountExportManager.swift [OPEN] - Export/import logic
│   │
│   ├── Networking/
│   │   ├── SupabaseClient.swift           [OPEN] - Database client
│   │   ├── SupabaseRealtimeClient.swift   [CLOSED] - WebSocket, presence logic
│   │   ├── RealtimeChannelManager.swift   [CLOSED] - Channel management
│   │   ├── CacheManager.swift             [OPEN] - Caching infrastructure
│   │   └── UpdateManager.swift            [OPEN] - Sparkle updates
│   │
│   ├── Services/
│   │   ├── LoggingManager.swift           [OPEN] - Logging infrastructure
│   │   ├── SessionRecorder.swift          [OPEN] - Session recording
│   │   ├── LicenseManager.swift           [CLOSED] - Payment verification, premium checks
│   │   └── NotificationManager.swift      [OPEN] - macOS notifications
│   │
│   └── Shared/
│       ├── Models/                        [OPEN] - Data models
│       ├── DesignSystem/                  [OPEN] - UI constants, colors
│       └── Extensions/                    [OPEN] - Swift extensions
│
├── Scripts/
│   ├── architecture-scan.sh               [OPEN] - Regression scanner
│   ├── release.sh                         [CLOSED] - Contains server credentials, signing process
│   ├── merge-and-tag.sh                   [OPEN] - Git workflow
│   └── get-changelog.sh                   [OPEN] - Changelog generator
│
├── Resources/
│   ├── Info.plist                         [OPEN] - App metadata
│   └── Assets.xcassets/                   [OPEN] - Images, icons
│
├── AI_BIBLE.md                            [CLOSED] - Contains server credentials, wallet seeds
├── OPEN_SOURCE_PLAN.md                    [OPEN] - This document
└── README.md                              [OPEN] - Public-facing readme
```

---

## File-by-File Inventory

### CRITICAL CLOSED FILES (Never Publish)

| File | Reason |
|------|--------|
| `Sources/Server/Services/StreamResolver.swift` | Core IP - multi-provider resolution logic |
| `Sources/Server/Services/TorrentioService.swift` | Provider implementation details |
| `Sources/Server/Services/CometService.swift` | Provider implementation details |
| `Sources/Server/Services/MediaFusionService.swift` | Provider implementation details |
| `Sources/Server/Services/ZileanService.swift` | Provider implementation details |
| `Sources/Server/Services/DebridSearchService.swift` | Provider implementation details |
| `Sources/Server/Services/RealDebridClient.swift` | API integration, caching, IP-lock handling |
| `Sources/Server/Services/SubDLService.swift` | Provider implementation |
| `Sources/Server/Services/SubtitleService.swift` | Aggregation logic |
| `Sources/Features/Player/MPVPlayerViewModel.swift` | Sync algorithms, drift correction |
| `Sources/Features/Lobby/LobbyViewModel.swift` | Presence logic, room state management |
| `Sources/Features/Social/SocialService.swift` | Presence, friends, activity tracking |
| `Sources/Features/Events/EventsViewModel.swift` | Event sync, countdown logic |
| `Sources/Features/Rooms/LobbyPresenceManager.swift` | Heartbeat & Grace period logic (Landmine #100) |
| `Sources/Features/Admin/AdminRealtimeService.swift` | Internal admin monitoring logic |
| `Sources/Features/Payments/*.swift` (logic files) | Crypto, HD wallet, payment processing |
| `Sources/Networking/SupabaseRealtimeClient.swift` | WebSocket implementation, Phoenix protocol |
| `Sources/Networking/RealtimeChannelManager.swift` | Channel management, reference counting |
| `Sources/Services/LicenseManager.swift` | Payment verification, premium logic |
| `AI_BIBLE.md` | Server credentials, wallet seeds, API keys |
| `scripts/release.sh` | Server credentials, deployment details |

### CRITICAL OPEN FILES (Must Publish for Trust)

| File | Reason to Open |
|------|----------------|
| `Sources/App/RedLemonApp.swift` | App entry point - proves clean launch |
| `Sources/Features/Player/MPVWrapper.swift` | Shows libmpv integration is standard |
| `Sources/Features/Player/PlayerView.swift` | UI transparency - no hidden overlays |
| `Sources/Features/Settings/SettingsView.swift` | Shows what settings are collected |
| `Sources/Features/Onboarding/OnboardingView.swift` | Shows what data is requested upfront |
| `Sources/Server/HTTPServer.swift` | Server architecture transparency |
| `Sources/Server/Credentials/KeychainManager.swift` | Shows credential storage is secure |
| `Sources/Services/LoggingManager.swift` | Proves what is/isn't logged |
| `Sources/Networking/SupabaseClient.swift` | Shows database interaction patterns |
| `Sources/Shared/Models/*.swift` | Data structure transparency |
| `Scripts/architecture-scan.sh` | Shows anti-regression commitment |

---

## Git Strategy

### Repository Structure

**Public Repo:** `github.com/redlemon-app/RedLemon`
- Contains all OPEN files
- Has descriptive README
- Has descriptive README (Focus on "How to verify")
- Issues enabled for BUG REPORTS ONLY
- **Pull Requests DISABLED** - This is a read-only mirror for transparency.

**Private Repo:** Existing `RedLemon-Native`
- Contains full codebase (OPEN + CLOSED)
- Contains AI_BIBLE.md
- Contains release scripts with credentials

### Development Workflow

```bash
# In private repo (RedLemon-Native)
# Work as normal on all code

# When preparing to push to public:
./scripts/sync-to-public.sh
```

### The `sync-to-public.sh` Script

This script is the main "Scrubber" tool. It is designed to be run from the root of the **private** repo.

**Functionality:**
1. **Targeting**: It expects a sibling directory named `../RedLemon-Public` which should be a clone of the public GitHub repo.
2. **Whitelist Only**: It wipes the target directory (except `.git`) and copies ONLY files explicitly marked as OPEN in the script's whitelist.
3. **Automated Stubs**: It automatically generates `MPVPlayerViewModel.swift` and `LobbyViewModel.swift` stubs in the target repo so it remains compile-compatible.
4. **Sanitization**: It recursively searches the target repo for the production server IP (`151.243.109.243`) and replaces it with `redlemon.live.placeholder`.

**Usage:**
```bash
# Ensure sibling repo exists
cd .. && git clone https://github.com/redlemon-app/RedLemon RedLemon-Public
cd RedLemon-Native

# Run the scrub
./scripts/sync-to-public.sh

# Review and push
cd ../RedLemon-Public
git add .
git commit -m "Sync: [Message]"
git push origin main
```

---

## Scrubber Defense-in-Depth

To ensure the public repo remains a clean, "Gold Standard" mirror, the `sync-to-public.sh` script must implement **Defense-in-depth** against information leakage.

### The "Triple-Grep" Shield
The script will run three separate validation passes after copying files but before allowing a commit:

1.  **IP Sanitization**: Grep for the production server IP pattern `151.243.109.X`. If found, the script aborts.
2.  **Key Pattern Matching**: Grep for patterns like `sk_live`, `Bearer`, and `supabase_key`.
3.  **Cross-Reference Check**: The script will maintain a `PRIVATE_SENSITIVE_STRINGS` list (e.g., admin email, specific wallet addresses) and scan all files for these strings before completion.

### Stub Verification
The script will attempt to compile the public repository's UI target automatically. If the public repo doesn't compile due to missing stubs, the sync is marked as **FAILED**.

---

### Stub Files for Closed Dependencies

Closed-source ViewModels need open-source stubs with:
- Same public interface (properties, methods)
- Compile-time compatible
- Runtime placeholder behavior

```swift
// Example: Sources/Features/Player/MPVPlayerViewModelStub.swift
// This file goes in public repo

import Foundation
@MainActor
class MPVPlayerViewModel: ObservableObject {
    // Public interface matching private implementation
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    func loadStream(url: String, metadata: MediaMetadata) async throws {
        // Stub: Show alert that this requires the full binary
        throw NSError(domain: "RedLemon", code: 1, userInfo: [
            NSLocalizedDescriptionKey: "Stream playback requires the full RedLemon app. Please download the pre-built binary."
        ])
    }

    // ... rest of public interface
}
```

---

## Build & Release Changes

### Public Repo Builds

The public repo should:
- **NOT** build a working app from source
- **SHOULD** demonstrate the UI architecture
- **SHOULD** include build instructions that explain the hybrid model

### Build Instructions for Public Repo

```markdown
# Building RedLemon

## From Source (UI Only)

The public repository contains the UI layer and infrastructure code. The stream resolution engine and sync logic are closed-source.

To explore the code:
1. Clone this repo
2. Open `RedLemon.xcodeproj`
3. Build in Xcode - you'll see the UI but playback won't work

## Running RedLemon

Download the pre-built binary from [releases page]. This includes the closed-source components.
```

### Release Process (Unchanged)

- Release script (`scripts/release.sh`) remains in private repo
- Public repo gets tagged releases matching private repo
- Public repo releases contain source code snapshots only
- DMG downloads link to separate distribution (or GitHub Releases if allowed)

---

## Binary Verification (Trust Anchor)

The primary challenge of a hybrid model is proving that the **Closed Source binary** actually contains the **Open Source code**. We solve this through:

### 1. Digital Signatures & Hashes
Every release includes a `release_package.sha256` file in the public repository. This hash matches the exact DMG provided for download.

### 2. Version Locking
The public repository is tagged (e.g., `v1.2.3`) simultaneously with the private release. Users can audit the UI branch for that specific version to see exactly what UI and networking code was active in that build.

### 3. Symbolic Mapping (Advanced Verification)
We provide the `symbols.txt` for the public UI components in each release. This allows technical users to verify that the entry points and networking paths in the binary correspond to the paths in the open-source files.

## Migration: The GitHub Magic Command

To increase trust and remove dependency on a raw IP address for installation, we will migrate the "Magic Installer" to GitHub.

### 1. The Public URL
The new installation command will be:
`curl -sL https://raw.githubusercontent.com/redlemon-app/RedLemon/main/scripts/install.sh | bash`

### 2. The `install.sh` Script (OPEN)
This script will be moved from the server's `/root/updates/install` to the public repository's `scripts/install.sh`.

### 3. Verification
By hosting the install script on GitHub, users can:
- Inspect exactly what the script does before running it.
- Verify that the DMG it downloads matches the SHA256 sum in the repo.
- See the audit history of changes to the installation process.

### 4. Binary Hosting Transition
> [!IMPORTANT]
> Upon public launch, the `URL` variable inside `scripts/install.sh` MUST be updated to point to the **GitHub Releases** binary (e.g., `https://github.com/redlemon-app/RedLemon/releases/latest/download/RedLemon.dmg`). This removes the final dependency on a raw IP address and centralizes the trust anchor on GitHub.

---

## Security Considerations

### Information Leakage Review

Before publishing any file, verify it does NOT contain:

| Type | Example |
|------|---------|
| Server IPs | `151.243.109.243` |
| API Keys | Supabase JWT, TMDb keys |
| Credentials | Database passwords, SSH keys |
| Wallet Seeds | Mnemonic phrases, private keys |
| Admin Endpoints | Undocumented API routes |

### Sanitization Checklist

For each file marked OPEN:
- [ ] No hardcoded URLs containing server IP
- [ ] No API keys (use environment variables or placeholders)
- [ ] No references to internal/private endpoints
- [ ] No credentials in comments
- [ ] No wallet/crypto seeds

### AI_BIBLE.md Handling

Create `AI_BIBLE_PUBLIC.md` containing:
- Architecture overview (no credentials)
- Landmines list (sanitized - no server details)
- Common patterns (safe concurrency, logging)
- Deployment process (high-level, no credentials)

The full `AI_BIBLE.md` stays private.

### 2. The Extension Pattern (Mixed Files)
For files containing both UI state (Open) and sensitive logic (Closed), use Swift Extensions:
- `Sources/App/AppState.swift` [OPEN]: Contains UI state and global flags.
- `Sources/App/AppState+Core.swift` [CLOSED]: Contains provider initialization and sensitive session management.

This allows the sync script to copy the main file while leaving the sensitive extension behind, keeping the codebase clean.

---

## Transparency Policy

RedLemon is provided as a **read-only mirror** of our infrastructure and UI code. We do **not** accept external contributions or pull requests.

### Why?
Our goal is to be the most transparent streaming app in the scene. By open-sourcing the UI and networking layers, we allow experts to verify that we are not:
1.  Running telemetry or spyware.
2.  Logging sensitive user data.
3.  Handling credentials unsafely.

We maintain full control over the codebase to ensure the highest performance and security standards, adhering strictly to our internal AI Bible.

---

## Auditor's Guide (How to Verify)

For developers and privacy advocates who want to verify our claims, here is the audit checklist:

### 1. Verify "Zero Telemetry"
- **Scan**: `Sources/App/AppState.swift` and `Sources/Services/LoggingManager.swift`.
- **Search**: For any `URLSession` or `LocalAPIClient` calls that send data to external domains other than `redlemon.live` (our server) or `supabase.co` (our database).
- **Proves**: We are not "phoning home" to Google, Meta, or third-party tracking services.

### 2. Verify Credential Safety
- **Scan**: `Sources/Server/Credentials/KeychainManager.swift`.
- **Logic**: All API keys and tokens are pulled from the macOS Keychain, never stored in plaintext within the application's local sandbox or `UserDefaults`.

### 3. Verify Networking Transparency
- **Scan**: `Sources/Networking/SupabaseClient.swift`.
- **Logic**: Observe that all database interactions use our standard, open-source client.

## Communication Strategy

### Public README Structure

```markdown
# RedLemon

[Watch Together. It Just Plays.]

RedLemon is a macOS streaming app with real-time watch parties and 24/7 live events.

## Features

- **24/7 Live Channels** - Nonstop events, auto-join at any time
- **Watch Parties** - Host or join, real-time sync, shared chat
- **One-Click Play** - No torrent hunting, instant playback

## What's Closed Source?

RedLemon is **mostly open source**. To maintain a balance between trust and operational sustainability, we use a hybrid model:

- **StreamResolver.swift**: Aggregates 5+ providers, handles auto-unlocking, and requires our server-side infrastructure to function.
- **Watch Party Sync**: The real-time drift correction and presence algorithms are core IP we are still actively iterating on.
- **Payment Processing**: Contains security best practices and vault integration logic we prefer to keep private for safety.

**Everything else is open.** You can verify for yourself that there is no telemetry, no hidden data collection, and that all credentials are stored safely in the macOS Keychain.

**What you can verify:**
- No telemetry or data collection
- Credentials stored securely in Keychain
- Open-source networking and database clients
- Transparent logging

## Installation

[Download DMG]

### Note: Unsigned App

RedLemon is not signed by Apple. Right-click the DMG and choose Open.

## Disclaimer

RedLemon does not host or distribute any content. The app connects to streaming providers through your Real-Debrid account. Users are responsible for ensuring their use complies with local laws.

## License

RedLemon is released under the **MIT License**. This provides the community with maximum freedom to use and contribute while protecting the authors from liability. (See [LICENSE](LICENSE) in the public repo).

## Building from Source

See [BUILDING.md](BUILDING.md)
```

### r/piracy Post Template

```markdown
Title: RedLemon - macOS streaming app with watch parties, 24/7 events, open source UI

Body:
Hey everyone,

I've been building RedLemon, a native macOS streaming app with some features I haven't seen elsewhere:

**What it is:**
- 24/7 live channels (events run back-to-back, drop in anytime)
- Watch parties with real-time sync and shared chat
- One-click play (aggregates 5+ providers, auto-unlocks via Real-Debrid)

**Transparency approach:**
The UI, player wrapper, and infrastructure are open source. The stream resolution engine is closed (that's the secret sauce).

This is a **read-only mirror** so you can inspect the code to verify:
- No telemetry
- No data collection
- Credentials stored in macOS Keychain
- What the app actually does

We don't accept PRs, but bug reports are welcome.

**Requirements:**
- macOS 12+
- Real-Debrid account

**Download:** [link to landing page/releases]
**GitHub:** [link to public repo]

**Note:** App is unsigned (right-click DMG → Open).

I've been using it daily for months. Happy to answer questions.
```

---

## Verification Checklist

Before making the public repo live:

### Code Separation
- [ ] All files marked OPEN have been reviewed
- [ ] All files marked CLOSED remain in private repo
- [ ] Stub files created for closed dependencies
- [ ] Public repo builds (non-functional but compiles)

### Security
- [ ] No credentials in OPEN files
- [ ] No server IPs in OPEN files
- [ ] No API keys in OPEN files
- [ ] AI_BIBLE.md sanitized
- [ ] AI_BIBLE_PUBLIC.md created
- [ ] Release scripts excluded from public repo
- [ ] Leak Detector passed (no keys/emails/passwords)

### Documentation
- [ ] README.md written and reviewed
- [ ] BUILDING.md explains hybrid model
- [ ] LICENSE selected and added
- [ ] AI_BIBLE_PUBLIC.md created
- [ ] r/piracy post drafted

### Infrastructure
- [ ] `sync-to-public.sh` script created and tested
- [ ] GitHub repo created under `redlemon-app` org
- [ ] Pull Requests disabled in repo settings
- [ ] Issue templates (Bug Report only) created

### Post-Launch
- [ ] r/piracy post scheduled
- [ ] Landing page updated with GitHub link
- [ ] Community monitoring plan in place
- [ ] Response templates for common questions ready

---

## Appendix A: Quick Reference for AI Assistants

When asked to work on RedLemon open source:

1. **Check this document first** - Is the file you're modifying OPEN or CLOSED?
2. **If CLOSED** - Work in private repo, do not commit to public
3. **If OPEN** - Work in private repo, sync to public via `sync-to-public.sh`
4. **If creating new file** - Decide: Does this contain competitive IP? If yes, CLOSED
5. **When in doubt** - Ask the user, or default to CLOSED

### Golden Rules

- **Never** push `AI_BIBLE.md` to public
- **Never** push files containing server credentials
- **Never** push provider implementation details
- **Always** verify no secrets in code before public push
- **Always** update this document if separation strategy changes

---

## Appendix B: File Extension Patterns

### Generally OPEN

| Pattern | Examples |
|---------|----------|
| `*View.swift` | UI components |
| `*Components.swift` | UI components |
| `*.xib` | Interface Builder files |
| `*.strings` | Localization |
| `Assets.xcassets/**` | Images, colors |
| `*Extension.swift` | Swift extensions |
| `*Model.swift` | Data models |
| `*Manager.swift` (infrastructure) | Cache, logging |

### Generally CLOSED

| Pattern | Examples |
|---------|----------|
| `*ViewModel.swift` | Business logic |
| `*Service.swift` | Provider integrations |
| `*Resolver.swift` | Resolution logic |
| `*Client.swift` | External API clients |
| `*Sync*.swift` | Sync algorithms |
| `*Provider*.swift` | Provider implementations |
| `*Debrid*.swift` | Debrid integration |

**Note:** These are patterns, not rules. Always check the main inventory above.

---

**End of Document**

*This document is part of the RedLemon AI Bible series. When the open source strategy changes, update this document first.*
