# RedLemon AI Bible
> **THE ULTIMATE CONTEXT DOCUMENT**
> **Last Updated:** January 9, 2026
> **Platform:** macOS (Native App)
> Read this first. Contains everything an AI assistant needs to work on this codebase.

---

# Part 1: Codebase Architecture & Landmines

## 🚨 Critical "Landmines" & Hidden Logic

### 1. The "God Class": `MPVPlayerViewModel.swift`
- **What it does**: Everything. Video playback, UI state, Chat networking, Watch Party Sync, Subtitle logic.
- **Danger**: Modifying one part (e.g., Chat) can break another (e.g., Playback).
- **Rule**: TRIPLE CHECK that changes handle `DispatchQueue.main` correctly—MPV callbacks often come from background threads.
- **Sync Integrity**: Chat execution is split between `sendMessage` (Sender) and `handleSyncMessage` (Receiver). Updating one without the other leads to "Silent Failures" where data is sent but ignored. ALWAYS update both.

### 2. Verified Streams Data Model
- **File**: `SupabaseClient.swift` → `struct VerifiedStream`
- **Crucial Detail**: The `id` is a **COMPOSITE** of `hash + season + episode`.
    - `var id: String { "\(hash)_\(season)_\(episode)" }`
    - **Why**: "Season Pack" torrents share the same hash for multiple episodes. Using just `hash` causes Duplicate ID crashes in `ForEach` loops.
- **Rule**: NEVER identify a stream solely by its hash in the UI.

### 3. Subtitle Selection Logic (`MPVWrapper.swift`)
- **Key Function**: `refreshSubtitleSelection()`
- **Scoring System**:
    - **Embedded Track**: +3000 points (heavily preferred over external)
    - **Release Match**: +500 points (WEBRip matches WEBRip, etc.)
    - **Clean Title Bonus**: +600 points (short titles like "SDH" or "English")
    - **SDH/CC/HI**: +250 points
    - **Forced**: -50 points penalty
    - **Default**: -10 points penalty
- **Warning**: `SubtitleService` triggers `refreshSubtitleSelection()` after loading. The Wrapper uses scoring to auto-select.

### 4. StreamResolver Filters (`StreamResolver.swift`)
- **What it does**: Scrapes and filters streams.
- **Danger**: Contains HARDCODED lists for blocked groups (e.g., `tamilmv`), codecs (`av1`), and audio languages.
- **Rule**: If a valid stream is missing, check these arrays first.
- **Verified Short-Circuit**: Verified streams bypass ALMOST ALL checks. Intentional.

### 5. Realtime Sync (`RealtimeChannelManager.swift`)
- **Mechanism**: Uses `actor` for concurrency.
- **Fragility**: Initial connection callbacks have race conditions.
- **Drift Logic**: Hardcoded thresholds (50ms, 500ms) for Seek vs. Rate Shift.
- **Rule (Message Preservation)**: When `handleSyncMessage` re-creates a `SyncMessage` for latency compensation, it **MUST** copy every single property (including metadata like `isPremium` or stream info like `infoHash`). Failing to do so causes "Silent Projection Failures" where data is broadcasted but vanishes on the receiving end.

### 6. SwiftUI Compiler Timeouts
- **Symptom**: `The compiler is unable to type-check this expression in reasonable time`.
- **Cause**: Complex logic (especially `if/else`, variable declarations, or long chains) inside `ForEach` or other ViewBuilders.
- **Rule**: EXTRACT row content into separate private functions (`messageRow`, `userRow`) or Subviews. Do not inline complex logic in `ForEach`.

### 7. Service Layer Independence (Singleton Trap)
- **Problem**: Attempting to access `AppState` (UI Layer) from Services (`LicenseManager`, `SupabaseClient`).
- **Constaint**: `AppState` does not exist in the service layer context.
- **Rule**: NEVER import or rely on `AppState` in Services. Use `SupabaseClient.shared.auth` for user context. Dependencies must flow DOWN, not UP.

### 8. The Date Decoding Trap (Postgres Timestamps)
- **Problem**: Supabase/Postgres returns dates with variable precision (microseconds `.SSSSSS`) or different timezone formats (`+00`, `Z`).
- **Symptom**: Silent decoding failures; features (like Friend List) return empty results without error.
- **Rule**: ALWAYS use a robust `ISO8601DateFormatter` with `.withFractionalSeconds` and `.withInternetDateTime`. NEVER trust a simple fixed format string.

### 9. Implicit RLS Blockers
- **Problem**: Tables like `users` or `user_blocks` implicitly DENY access if RLS is enabled but no policy exists.
- **Symptom**: Client requests return empty lists (success 200 OK) but no data.
- **Rule**: When adding tables, explicitly create policies for `SELECT` access. "Public" tables need `USING (true)` policies.

### 10. Lifecycle Consistency (Auto-Login Disconnect)
- **Problem**: Features working in development (hot reload) fail in production (app restart) because initialization code is missing from the Auto-Login path.
- **Example**: `SocialService.connect()` was called in `SignUp` but forgotten in `loadStoredUser`.
- **Rule**: Critical service connections MUST be called in ALL authentication paths: (1) New Account, (2) Manual Login, (3) Auto-Login/Restore.

### 11. Safe Logging (`NSLog` Vulnerabilities)
- **Problem**: Passing string-interpolated URLs or JSON directly into `NSLog` (e.g., `NSLog("URL: \(url)")`) causes crashes if the string contains a `%` character (standard in encoded URLs).
- **Rule**: ALWAYS use the specifier format: `NSLog("%@", "Message: \(url)")`.

### 12. SwiftUI Modifier Version Compatibility
- **Problem**: Some SwiftUI modifiers are macOS version-specific. For example, `.fontWeight()` on `Text` or `Button` requires **macOS 13.0+**.
- **Symptom**: Build fails with `'fontWeight' is only available in macOS 13.0 or newer`.
- **Rule**: Use `.font(.system(size:weight:))` instead of `.fontWeight()` for weight styling. This is compatible with macOS 12.x.
- **Example**:
  - ❌ `.font(.caption).fontWeight(.semibold)` - Fails on macOS 12
  - ✅ `.font(.system(size: 12, weight: .semibold))` - Works on all versions

### 13. State Persistence Fallback (Lobby Bypass)
- **Problem**: Relying solely on Realtime/WebSockets for state (e.g., `isPlaying`, `isReady`) fails when users join late or reconnect, as they miss previous broadcast messages.
- **Symptom**: "Lobby loops" where a user can't join a playing room, or "desyncs" where late joiners wait forever.
- **Rule**: Critical state MUST be backed by Database persistence.
    - **Example**: The Host updates `rooms.is_playing` in DB alongside broadcasting `PLAY` events. New joiners check DB state to bypass lobby if room is already live.

### 14. Configuration Authority (Events Config)
- **Problem**: Hardcoding logic-dependent constants (like `epochTimestamp` for event cycles) in local Swift code causes desyncs if the server config differs (e.g., legacy vs. updated epoch).
- **Rule**: The Server (Database/Config) is the Single Source of Truth.
    - **Action**: Always fetch `EventsConfig` first and use its values (`epoch_timestamp`, `cycle_duration`) to drive logic. Fallback to local constants ONLY if offline.

### 15. Transient State Pollution
- **Problem**: Variables in `AppState` (like `resumeFromTimestamp` or `eventStartTime`) behave as GLOBAL state. If a feature (e.g., Events) sets them but fails to clear them, they "leak" into the next feature (e.g., Solo Playback).
- **Symptom**: "Ghost behavior" where a fresh video starts at a specific timestamp from a previous session.
- **Rule**: "Consume" transient state immediately. Use it, then set it to `nil` in the SAME execution block. Never assume the next view will clear it.

## 🏗️ Architecture Map

| Component | Responsibility | Hidden Dependencies |
| :--- | :--- | :--- |
| `MPVWrapper.swift` | Low-level C-Interop | Subtitle Scoring Logic |
| `EventsConfigService` | Remote Config | Version comparison caching |
| `LobbyViewModel` | Rooms/Social | Coupled with `RealtimeChannelManager` |
| `BrowseView.swift` | Content browsing | Extensive Task cancellation for performance |

## 🛠️ Common Tasks Cheat Sheet

**"Fix a subtitle issue"**
→ Check `MPVWrapper.swift` (`refreshSubtitleSelection`) for scoring
→ Check `SubtitleService.swift` for loading/downloading

**"Add a new Stream Provider"**
→ Add to `ProviderService.swift` → `ProviderManager`
→ Register in `HTTPServer.swift`

---

# Part 2: Rooms vs. Events

## Quick Comparison

| Feature | User Hosted Rooms | System Hosted Events |
| :--- | :--- | :--- |
| **Primary entity** | `SupabaseRoom` | `EventsConfig` |
| **Host** | A specific User | The System (Automated) |
| **Lifecycle** | Ephemeral (deleted when empty) | Persistent/Scheduled |
| **Playback Control** | Host controls | System controlled (simulated broadcast) |
| **Tech Stack** | WebSockets, `rooms` table | Static Config, Local Calculation |

## User Hosted Rooms (Watch Parties)
- **Behavior**: Host pauses → everyone pauses. Host seeks → everyone seeks.
- **Database**: `rooms` and `room_participants` tables.
- **Latency**: Critical. High-performance WebSockets.

## Playlist Voting (Watch Party)
- **Mechanism**: Ephemeral real-time signals (not persisted to DB).
- **Pattern**: Follows `toggleReady` architecture.
- **Messages**: `LOBBY_VOTE:<itemId>` and `LOBBY_UNVOTE:<itemId>`.
- **UI**: Heart icon ❤️ on playlist items.
- **State**: Managed in `LobbyViewModel.playlistVotes`.

## System Hosted Events (Movie Events)
- **Behavior**: Movie plays at specific time. No pause/seek. Everyone sees same frame.
- **Database**: `events_config` table.
- **Latency**: Less critical; uses wall-clock calculation.

## Dead Room Logic
- **User Rooms**: Blocked if Host left (checks `host_user_id` in participants).
- **Event Rooms**: Always joinable (bypasses Host Check for `event_*` IDs).

## Room Code Visibility
- **User Rooms**: Code shown in lobby and chat header.
- **Event Rooms**: Code hidden (joined via UI schedule).

---

# Part 3: Crypto Payment System

## Overview
Non-custodial, multi-chain crypto payment gateway using HD Wallet architecture.

### Key Features
- **Non-Custodial**: Private keys never touch server.
- **Multi-Chain**: EVM only (Ethereum, Base, Arbitrum, Optimism, Polygon). **No BTC.**
- **Multi-Asset**: ETH, USDC, USDT.
- **Automated**: Unique derived addresses per user.

## Database Schema
| Table | Purpose |
| :--- | :--- |
| `key_derivation_indices` | Tracks next index per chain |
| `payment_pools` | Maps address → user |
| `payment_transactions` | Logs detected payments |
| `payment_sweeps` | Logs sweep operations |
| `users` | Stores `subscription_expires_at` |

## Edge Functions

### `assign-address`
- **Trigger**: User opens Payment Screen.
- **Logic**: Derives unique address, assigns to user.

### `check-payment`
- **Trigger**: App polling.
- **Logic**: Scans all chains (multi-asset: ETH, USDC, USDT), calculates USD value via Coinbase API, grants access:
  - **$4.00+** = 30 days
  - **$7.00+** = 60 days
  - **$10.00+** = 90 days
- **Note**: Actual code thresholds are slightly lower ($3.80/$6.80/$9.80) to account for price fluctuations.

### `sweep-payments`
- **Trigger**: Daily cron (9:10 AM UTC).
- **Logic**: Sweeps balances >$1.50 to master wallet.

## Master Wallet
- **Address**: `0x33E53714ef5dc4d28A5Ea1FD3df16E86cf6223b9`
- **Derivation**: `m/44'/60'/0'/0/0` (Index 0)

## ⚠️ Source of Truth for Premium Status
**Critical:** `LicenseManager.refreshSubscription()` relies on a **HYBRID** check:
1.  **Edge Function** (`check-payment`): Detects *new* incoming crypto transactions.
2.  **Database Profile** (`users.subscription_expires_at`): Persists valid subscriptions and Admin Grants.
**Rule:** Always check BOTH. The latest date wins. Never rely solely on the edge function, or Admin Grants will be ignored.

---

# Part 4: Server Infrastructure

## Server Access

| Service | Detail |
| :--- | :--- |
| **IP Address** | `151.243.109.243` |
| **SSH User** | `root` |
| **SSH Password** | `123Scarface123!` |
| **OS** | Ubuntu 24.04 LTS |

```bash
ssh root@151.243.109.243
```

## Supabase Access

| Component | URL | Credentials |
| :--- | :--- | :--- |
| **Dashboard** | `http://151.243.109.243:3000` | admin / `7a65fa960cfbcd1da2e3c1da3a4c8b2e` |
| **API** | `https://151.243.109.243.nip.io` | (Anon Key protected) |
| **Database** | Port 5432 | postgres / `6be071e915e2f9246408639def0a07bd` |

### API Keys
- **ANON_KEY**: `eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogImFub24iLCAiaXNzIjogInN1cGFiYXNlIiwgImlhdCI6IDE3Njc2NTAwMzIsICJleHAiOiAyMDgzMDEwMDMyfQ.zY-FKTBjIi4dvhR7En5i5ULALx9QM_2O4QWMbedkBus`
- **JWT Secret**: `0c759034b5faeabea30200006df6cfed979ea6a95891a33080fb0d8677e671de`

## Maintenance Commands

```bash
# Restart everything
cd /root/supabase/docker && docker compose restart

# Check logs
docker compose logs -f --tail 100

# Database shell
docker exec -it supabase-db psql -U postgres
```

## Daily Schedule (UTC)

| Time | Job |
|------|-----|
| 9:00 AM | Database backup |
| 9:10 AM | Payment sweep |

## Database Migrations

**Step 1: Copy file to server**
```bash
expect -c 'spawn scp supabase/migrations/YOUR_MIGRATION.sql root@151.243.109.243:/tmp/migration.sql; expect "password:"; send "123Scarface123!\r"; expect eof'
```

**Step 2: Execute on database**
```bash
./remote_exec.sh "cat /tmp/migration.sql | docker exec -i supabase-db psql -U postgres postgres"
```

**One-liner SQL queries:**
```bash
./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"SELECT * FROM users LIMIT 5;\""
```

## Edge Functions Location
`/root/supabase/docker/volumes/functions/[name]/index.ts`

Functions: `assign-address`, `check-payment`, `sweep-payments`, `cleanup-rooms`, `recover-account`

---

# Part 5: Wallet Secrets

> [!CAUTION]
> **CRITICAL SECURITY INFORMATION**
> These keys control collected funds. Store offline (paper/metal backup).

**Seed Phrase:**
`moment absent unfair song unusual neck panther asset clock conduct doll voice`

**Derivation Paths:**
- **BTC**: `m/84'/0'/0'` (Native Segwit)
- **EVM**: `m/44'/60'/0'` (Standard BIP44)

**XPUBs (Server Config):**
- **XPUB_BTC**: `xpub6CNJnaQ1bu7oLQH4g8ZGSJUbVtRLqu3ikYm9PhiFohEb9LdFCsz4QTK1aWob5nR1P7uzDmRR7GKm5aJvKgzrrWmh6CahF95K5Vtb3TgzLoq`
- **XPUB_EVM**: `xpub6CUocXeQEa3MZ7QWXn4uwjcaXS2y84MAN1KTQRq9TscPvJk5kMj4fSKYxNC1ooyAf9ysT15cwJW3UP6HEcCPUKVu67wwoKqsyJNAeWQ6i1y`

---

# Part 6: Testing Accounts

## Reset Premium for Testing
```bash
./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"UPDATE users SET is_premium = false, subscription_expires_at = NULL WHERE username = 'USERNAME'; DELETE FROM payment_transactions WHERE user_id = (SELECT id FROM users WHERE username = 'USERNAME'); DELETE FROM payment_pools WHERE assigned_to_user_id = (SELECT id FROM users WHERE username = 'USERNAME');\""
```

## Local Testing Profiles
In `RedLemonApp.swift`, use command line args:
- `-user-profile host`
- `-user-profile guest`

---

# Quick Reference

## Key Files
| Purpose | File |
| :--- | :--- |
| Video Playback | `MPVPlayerViewModel.swift` |
| Stream Resolution | `StreamResolver.swift` |
| Subtitles | `MPVWrapper.swift`, `SubtitleService.swift` |
| Watch Parties | `RealtimeChannelManager.swift`, `LobbyViewModel.swift` |
| Payments | `SupabaseClient.swift`, Edge Functions |
| Settings | `SettingsView.swift` |
| Admin | `AdminDashboardView.swift` |

## Important Database Tables
| Table | Purpose |
| :--- | :--- |
| `users` | User accounts, premium status |
| `rooms` | Active watch parties |
| `room_creation_history` | Persistent room limit tracking |
| `verified_streams` | Community-verified streams |
| `reported_streams` | Problem reports |
| `blocked_streams` | Permanent blacklist |
| `payment_pools` | Assigned crypto addresses |
| `payment_transactions` | Payment records |

## Cron Jobs
Run `./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"SELECT jobname, schedule FROM cron.job;\""`

---

# Part 7: Authentication & Security Architecture

## Authentication Model
- **Primary**: Anonymous Auth (Supabase Anon Key) + Custom User Tables.
- **Security**: **Cryptographic Signature Verification** (Ed25519).
- **Goal**: Prevent IDOR (Impersonation) without requiring email passwords.

## How It Works (IDOR Protection)
1.  **Keys**: App generates an Ed25519 Key Pair on first launch. Stored in macOS Keychain.
2.  **Registration**: Public Key is sent to server (`register_user_secure`).
3.  **Signing**: Client signs critical requests (e.g., `room_heartbeat`).
    -   **Header**: `x-identity-signature`
    -   **Payload**: `Sign(privateKey, timestamp + user_id.lowercase + path)`
    -   **Time Window**: Server rejects replay attacks >60s old.
4.  **Verification**: Server (`verify_user_signature`) verifies signature against stored Public Key using `pgsodium`.

## Critical Rules
> [!IMPORTANT]
> **RPC Security**
> Critical RPCs (`room_heartbeat`, `assign_payment_address`) MUST call `verify_user_signature(user_id, path)`.
> Removing this line re-opens IDOR vulnerabilities.

## Account Recovery
- **Mechanism**: `.redlemon-key` file.
- **Contents**: JSON containing `privateKey`, `publicKey`, and `userId`.
- **Process**: Importing the file restores the Private Key to Keychain, enabling valid signatures.

---

# Part 8: Local HTTP Server Architecture

## Overview
The app runs an **embedded Vapor HTTP server** on `127.0.0.1:8080`. This server handles stream resolution, metadata fetching, and debrid unlocking—replacing the Node.js Express server from the original ColorFruit project.

## Key Files
| File | Purpose |
| :--- | :--- |
| `HTTPServer.swift` | Server initialization, CORS, route registration |
| `LocalAuthMiddleware.swift` | Token authentication (`X-RedLemon-Auth`) |
| `LocalAPIClient.swift` | Swift client for calling local server |

## Route Files (`Sources/Server/Routes/`)
| Route | Endpoints |
| :--- | :--- |
| `TokenRoutes.swift` | `/tokens/save`, `/tokens/delete`, `/tokens/list` |
| `UnlockRoutes.swift` | `/api/streams/unlock` (RealDebrid) |
| `StreamRoutes.swift` | `/api/streams/resolve`, `/api/streams/resolveByQuality` |
| `MetadataRoutes.swift` | `/api/metadata/catalog`, `/api/metadata/meta` |
| `ProxyRoutes.swift` | Subtitle proxy, image proxy |
| `SubtitleRoutes.swift` | Subtitle search and download |

## Stream Provider System
Located in `Sources/Server/Services/`:

| Provider | File | Description |
| :--- | :--- | :--- |
| **Torrentio** | `TorrentioService.swift` | Primary source, RD integration |
| **Comet** | `CometService.swift` | Alternative source |
| **MediaFusion** | `MediaFusionService.swift` | Addon aggregator |
| **DebridSearch** | `DebridSearchService.swift` | Direct RD library search |
| **Zilean** | `ZileanService.swift` | DMM hash database |

**Provider Manager**: `ProviderService.swift` - Registers and queries all providers.

## Stream Resolution Flow
1. `LocalAPIClient.resolveStreamWithFallback()` calls `/api/streams/resolve`
2. `StreamResolver.swift` queries all providers in parallel
3. Results are filtered (codecs, groups, languages) and sorted by quality
4. Best match is unlocked via RealDebrid and returned

> [!WARNING]
> **StreamResolver Filters**: Contains hardcoded blocklists for groups (`tamilmv`), codecs (`av1`), and audio. Check these if valid streams are missing.

---

# Part 9: Secrets & Credentials Management

## KeychainManager (`Sources/Server/Credentials/KeychainManager.swift`)
An `actor` that securely stores sensitive data in macOS Keychain.

| Service Key | Data Stored |
| :--- | :--- |
| `realdebrid` | RealDebrid API token |
| `subdl` | SubDL API key |
| `user_id` | Current user's UUID |
| `recovery_phrase` | Mnemonic phrase hash |
| (Special) | Ed25519 Key Pair |

## Dynamic Credential Loading
Providers fetch credentials **on each request** via `KeychainManager.shared.get(service:)`. This ensures account recovery or credential updates take effect immediately without app restart.

## Account Export/Import (`AccountExportManager.swift`)
Creates `.redlemon-key` files containing:
- User ID + Username
- Ed25519 Key Pair (for signature auth)
- RealDebrid/SubDL tokens (optional)

---

# Part 10: Social Features System

## SocialService (`Sources/Features/Social/SocialService.swift`)
A 1000+ line singleton managing all social features.

### Core Features
- **Friends List**: Add, remove, accept/decline requests
- **Presence**: Real-time online/offline status
- **Activity Tracking**: "Watching {Movie}" status
- **Blocking**: User blocking with `user_blocks` table
- **Direct Messages**: DM channel support

### Presence Architecture
- Uses dedicated `SupabaseRealtimeClient` for `global-presence` channel
- Tracks multiple connection refs per user (handles reconnects)
- Heartbeat every 30 seconds to maintain online status

### Key Tables
| Table | Purpose |
| :--- | :--- |
| `friendships` | Friend relationships |
| `friend_requests` | Pending requests |
| `user_blocks` | Block list |

### Landmine: Ghost Rooms
When showing "Join Friend" buttons, `validateRoomJoinability()` checks if the room actually exists and has a host. Without this, users could attempt to join deleted rooms.

---

# Part 11: App Updates & Versioning

## UpdateManager (`Sources/Services/UpdateManager.swift`)
Uses **Sparkle** framework for macOS auto-updates.

### Configuration
- **Appcast URL**: `https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml`
- **Mode**: Manual only (no auto-checks, no automatic downloads)
- **Silent Check**: Custom implementation that parses appcast XML without Sparkle UI

### Update Flow
1. `checkForUpdatesInBackground()` called on app launch
2. Silently fetches `appcast.xml` from GitHub
3. Compares `<sparkle:version>` with `CFBundleVersion`
4. Sets `updateAvailable = true` if newer version exists

> [!NOTE]
> For production release signing, add `SUPublicEDKey` to Info.plist with your Ed25519 public key.

---

# Part 12: Caching System

## CacheManager (`Sources/Networking/CacheManager.swift`)
An `actor`-based LRU cache with memory pressure handling.

### Cache Types
| Type | Max Items | Expiration |
| :--- | :--- | :--- |
| Catalog | 20 | 5 minutes |
| Metadata | 50 | 10 minutes |
| Images | 100 | 30 minutes |

### Memory Pressure
- Periodic check every 60 seconds
- Aggressive cleanup when >80 total items
- Images cleared first (largest memory consumer)

### Usage
```swift
// Check cache
if let cached = await CacheManager.shared.getMetadata(key: imdbId) {
    return cached
}
// ... fetch from network ...
await CacheManager.shared.setMetadata(key: imdbId, value: metadata)
```

---

# Part 13: Logging System

## LoggingManager (`Sources/Services/LoggingManager.swift`)
Centralized logging with throttling to reduce console spam.

### Log Levels
`debug` < `info` < `warning` < `error`

### Categories (can be individually enabled/disabled)
- `videoRendering` - Frame rendering (heavily throttled)
- `mouseTracking` - UI hover states
- `subtitles` - Track selection
- `watchHistory` - Progress saves
- `network` - API calls
- `watchParty` - Sync messages

### Throttling
Certain high-frequency logs (video rendering, mouse tracking) are throttled to max 1 per second to prevent log flooding.

---

# Part 14: Free-Tier Hosting Limits

## Room Creation History (`room_creation_history` table)
Tracks when users create watch party rooms to enforce limits.

### Limit Rules
- **Free Users**: 1 room per 24 hours
- **Premium Users**: Unlimited

### Implementation
- `SupabaseClient.checkFreeTierLimit()` returns seconds until next free room
- `LicenseManager.checkHostingLimit()` updates `timeUntilNextFreeRoom`
- UI shows cooldown timer when limit reached

### Database RPC
`check_room_creation_limit(user_id)` returns `{can_create, time_until_next, is_premium}`

---

# Quick Reference

## Key Files
| Purpose | File |
| :--- | :--- |
| Video Playback | `MPVPlayerViewModel.swift` (God Class) |
| Stream Resolution | `StreamResolver.swift` |
| Subtitles | `MPVWrapper.swift`, `SubtitleService.swift` |
| Watch Parties | `RealtimeChannelManager.swift`, `LobbyViewModel.swift` |
| Payments | `SupabaseClient.swift`, Edge Functions |
| Settings | `SettingsView.swift` |
| Admin | `AdminDashboardView.swift` |
| Social | `SocialService.swift` |
| Local Server | `HTTPServer.swift`, `StreamRoutes.swift` |
| Secrets | `KeychainManager.swift` |
| Updates | `UpdateManager.swift` |
| Caching | `CacheManager.swift` |

## Important Database Tables
| Table | Purpose |
| :--- | :--- |
| `users` | User accounts, premium status |
| `rooms` | Active watch parties |
| `room_participants` | Who's in each room |
| `room_creation_history` | Free-tier limit tracking |
| `verified_streams` | Community-verified streams |
| `reported_streams` | Problem reports |
| `blocked_streams` | Permanent blacklist |
| `payment_pools` | Assigned crypto addresses |
| `payment_transactions` | Payment records |
| `friendships` | Friend connections |
| `friend_requests` | Pending friend requests |
| `user_blocks` | Blocked users |
| `events_config` | Live event schedule |

## Cron Jobs
Run `./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"SELECT jobname, schedule FROM cron.job;\""`

## UUID Case Sensitivity
> [!CAUTION]
> UUIDs are normalized to **lowercase** in most places (`participantId = room.hostId.lowercased()`). When comparing UUIDs, always use `caseInsensitiveCompare()` or normalize both sides. Direct `==` comparison can silently fail.
