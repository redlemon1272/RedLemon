# RedLemon AI Bible
> **THE ULTIMATE CONTEXT DOCUMENT**
> **Last Updated:** January 11, 2026
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

### 16. The "Revival" Logic Trap (Zombie Events)
- **Problem**: Code that attempts to "heal" missing data (e.g., `PlayerViewModel` re-creating a missing room because the ID exists in a link) can bypass expiration rules.
- **Example**: Users joining `event_123` after it ended. The room was deleted (correctly), but the client "revived" it because it thought it was helping a user join a valid room.
- **Rule**: NEVER auto-create "System" resources (Events) based solely on client-side IDs. Always validate against the *current* `EventsConfig` liveness before "reviving" a room.

### 17. Black Box Service Diagnostics (The "Silent Failure" Trap)
- **Problem**: Self-hosted binaries (like Zilean or Stremio Addons) can be "Running" (Exit Code 0, HTTP 200) but functionally dead due to missing dependencies or silent logic failures.
- **Example**: Zilean ran perfectly but indexed 0 torrents because the `rank-torrent-name` Python library was missing from the system. It swallowed the exception until Debug logs were enabled.
- **Rule**: Verify the **Data Pipeline**, not just the Process Status.
    1.  **Persistence**: Redirect logs to a file (`> session.log 2>&1`). Stdout is useless if the session closes.
    2.  **Dependencies**: Manually verify external requirements (Python libs, FFmpeg) exist in the *execution environment* (`/root`, not just `/usr`).
    3.  **Output**: The only proof of life is **Database Growth** (`SELECT count(*)`), not log activity.

### 18. Event Source of Truth (The `event_` Prefix)
- **Problem**: Relying on boolean flags (`isEvent`, `isHost`) to determine UI state (like Waiting Gates) is fragile during retries or re-joins where state might be lost.
- **Rule**: The Room ID is the ultimate source of truth.
    - If `room_id.startsWith("event_")` -> It IS an event.
    - **Implication**: ALWAYS bypass "Ready Gates" and Host Checks for these IDs, regardless of what `appState` says.
120:
121: ### 19. Zilean Population Verification (Data Pipeline Check)
122: - **Problem**: Zilean can appear healthy while not populating new torrents.
123: - **Rule**: Verify **Database Growth** in the Admin Dashboard "Overview".
124:     - If the "Zilean Torrents" count is static over several hours despite logs showing activity, the indexing pipeline is broken (likely Landmine #17).
125:     - **Log Source**: `SupabaseClient.getZileanTorrentCount()` parses the `details` field of the latest `zilean_maintenance` job log.
126:     - **Requirement**: The server-side maintenance script MUST write `Total Torrents: X` into the `system_job_logs` details for this metric to be live.

### 20. Timer Burst Pattern (Playback Jitters)
- **Problem**: Multiple background heartbeat/polling systems running at similar intervals (e.g., all at 30s) cause "bursts" of CPU activity that can produce micro-jitters during video playback on older hardware (MacBook Air 2015).
- **Symptom**: Smooth playback on newer hardware (quad-core), occasional micro-stutters on older hardware (dual-core).
- **Systems at Risk**:
    - `SocialService.swift` - Global presence heartbeat
    - `LobbyPresenceManager.swift` - Room heartbeat + participant polling
    - `MPVPlayerViewModel.swift` - Playback heartbeat + chat polling
    - `SupabaseRealtimeClient.swift` - WebSocket heartbeat
- **Rule**: **Stagger intervals** to spread CPU load:
    - Use different intervals (25s, 30s, 35s instead of all 30s)
    - Add initial offsets so timers don't start synchronized
    - Prefer `Task` over `Timer` to avoid blocking main RunLoop
    - Keep fallback polling conservative (5s+, not 2s)
- **Example Fix**: Changed from `Timer(timeInterval: 20.0)` on main RunLoop to `Task { try? await Task.sleep(nanoseconds: 25_000_000_000) }` with 5s initial offset.

### 21. Zombie Room Deadlocks (The "Ready Gate" Trap)
- **Problem**: A host quits abruptly (force quit), leaving the room state as `is_playing: true` in the DB for ~2 minutes (until cron cleanup).
- **Symptom**: Guests join, see `is_playing`, enter the "Waiting for Host" gate, and wait FOREVER because the host is gone and will never send a `PLAY` signal.
- **Rule**: **Trust but Verify**. Never assume DB state guarantees Real-time presence.
    - **Implementation**: ALL "Waiting" gates must have a client-side timeout (e.g., 30 seconds).
    - **Fallback**: If timeout triggers, exit gracefully to Lobby/Browse with a message ("Host is absent"). Do NOT hang indefinitely.

### 22. Data Shadowing (User vs Media Metadata)
- **Problem**: `WatchPartyRoom` has a mutable `description` (Host's message), while `MediaItem` has an immutable `description` (TMDB Plot). Realtime payloads often flatten these into a single JSON object.
- **Danger**: Mapping the `description` column from a realtime update into `room.mediaItem.description` erroneously overwrites the Plot Summary with the Host's message (or vice versa), causing the UI to show the wrong text.
- **Rule**: **Explicitly Separate** during decoding.
    - `room.description` = `payload["description"]` (The Host's custom text)
    - `mediaItem.description` = `payload["overview"]` or kept as-is (The Movie's plot)
    - **Never** assume "description" genericially refers to one or the other without checking context.

### 23. Session ID vs. Log Entry ID (The Feedback Trap)
- **Problem**: The `session_logs` table stores *individual events*, not just sessions. It has two IDs:
    -   `id`: The Primary Key of the specific log row.
    -   `session_id`: The Grouping Key for the entire user session.
- **Pitfall**: External tables (like `feedback_reports`) often link to a specific *Log Entry* (`id`) to capture the exact state at reporting time. Matching this against `session_id` causes silent failures.
- **Rule**: When joining or matching `session_logs`, check the Granularity.
    -   Linking a Report? Use `log.id`.
    -   Grouping a User's history? Use `log.session_id`.

### 24. Navigation State Updates from Gestures
- **Problem**: When triggering navigation from gesture handlers (tap, swipe), the current view's `onDisappear` fires immediately and cancels any active Tasks, potentially racing with the navigation transition.
- **Symptom**: Intermittent "freeze" when clicking items on browse pages. Logs show "View disappeared - cancelling tasks" immediately after selection.
- **Root Cause**: If the navigation trigger is wrapped in an `async` function, the calling `Task` stays alive and gets cancelled by `onDisappear`. Alternatively, wrapping in `DispatchQueue.main.async` causes Landmine #25.
- **Rule**: Navigation state changes from gesture handlers should be **synchronous** and **direct**:
    - ✅ **Correct**: `appState.currentView = .target` (direct assignment)
    - ❌ **Wrong**: `Task { await navigate() }` (async keeps Task alive)
    - ❌ **Wrong**: `DispatchQueue.main.async { appState.currentView = .target }` (GCD incompatible with @MainActor, see Landmine #25)
- **Key Files**: `BrowseView.swift` (`selectMedia`), `DiscoverView.swift` (`selectMedia`)

### 25. GCD vs @MainActor Isolation (The DispatchQueue Trap)
- **Problem**: `DispatchQueue.main.async` and `@MainActor` are **not equivalent**. Using GCD to access `@MainActor` isolated objects can cause data races and intermittent freezes.
- **Background**: `AppState` is marked `@MainActor`. While both GCD main queue and MainActor run on the main thread, Swift's actor isolation doesn't recognize `DispatchQueue.main` as satisfying `@MainActor` requirements.
- **Symptom**: Intermittent hangs, freezes, or unpredictable UI behavior when mixing GCD with actor-isolated types.
- **Rule**: For `@MainActor` isolated objects:
    - ✅ **Direct access** from SwiftUI views (they're already MainActor-isolated)
    - ✅ **`Task { @MainActor in ... }`** for async contexts
    - ✅ **`await MainActor.run { ... }`** for explicit hopping
    - ❌ **`DispatchQueue.main.async { ... }`** causes data races with actors
- **Exception**: `DispatchQueue.main.async` is fine for non-actor-isolated code, but avoid mixing with Swift Concurrency actors.

### 26. Automation Deadlock (The Startup Script Trap)
- **Problem**: Using `start-production.sh` inside an automated script (like `release.sh`) causes a "Deadlock". 
- **Symptom**: The script hangs indefinitely after building because it launches the app and waits for it to exit before proceeding to the signing/DMG steps.
- **Rule**: Automated pipelines MUST use headless build scripts (`build-app-debug.sh`) that return control immediately after the binary is created.

### 27. Network Timeout Blind Spots (The 16-Second Spin)
- **Problem**: Chaining multiple network requests (e.g. `HEAD` -> `GET`) with default timeouts (60s) or moderately high timeouts (8s) creates massive cumulative delays when endpoints are slow/unresponsive.
- **Symptom**: User sees a "Loading Spinner" for 15-20 seconds before playback starts.
- **Rule**: Implement "Fail Fast" logic for validation checks.
    - Set aggressive timeouts (e.g., 3s) for pre-flight checks (HEAD).
    - If the pre-flight fails/times out, **ABORT** the chain. Do not fall back to a heavier request (GET) that is guaranteed to also fail.


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
- **Single Vote**: Each user can only vote for ONE item at a time.
- **Late Joiner Sync**: Host re-broadcasts their vote on `LOBBY_JOIN` so late joiners see existing votes (per Landmine #13).

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

## Payment Stacking (Extend License)
The `check-payment` edge function **automatically stacks** new payments onto existing subscriptions:
```typescript
let currentExpiry = userData?.subscription_expires_at ? new Date(userData.subscription_expires_at) : new Date()
if (currentExpiry < new Date()) currentExpiry = new Date()  // Reset if expired
const newExpiry = new Date(currentExpiry.getTime() + (daysToAdd * 24 * 60 * 60 * 1000))  // ADDS days
```
**Example:** User with 60 days remaining pays $10 → Gets 90 days added → Now has 150 days total.

**UI:** Premium users see "Extend License" button in Settings when < 365 days remain (`SettingsView.swift`).

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

## Zilean Maintenance (Native Service)
- **Start/Restart**: `screen -dmS zilean /root/start_zilean.sh`
- **Logs**: `tail -f /root/zilean_bin/zilean_session.log`
- **Console**: `screen -r zilean` (Ctrl+A, D to detach)
- **Database Check**: `./remote_exec.sh "PGPASSWORD=zilean psql -h localhost -p 5433 -U zilean -d zilean -c \"SELECT count(*) FROM \\\"Torrents\\\";\""`
- **Janitor Logs**: `./remote_exec.sh "docker exec supabase-db psql -U postgres -d postgres -c \"SELECT * FROM system_job_logs ORDER BY created_at DESC LIMIT 5;\""`
- **Dashboard Visibility**: The Admin Dashboard (Overview & Server tabs) provides high-level visibility into Zilean's count and last maintenance run.

## Self-Hosting Service Checklist (Lessons Learned)
0.  **Feasibility Check**: Is the source code public?
    -   *Lesson*: **Torrentio is Closed Source/Proprietary** and cannot be self-hosted.
    -   *Action*: Search for "open source alternative" (e.g., **Comet** or **MediaFusion** instead of Torrentio).
1.  **Runtime Autonomy**: Native services (outside Docker) require manual dependency management.
    -   *Lesson*: Zilean needed .NET 9.0 AND specific Python libraries (`rank-torrent-name`) installed system-wide.
    -   *Action*: Check `.runtimeconfig.json` and `requirements.txt` immediately.
2.  **Output Persistence**: Native binaries write to `stdout`, which vanishes in `screen`.
    -   *Action*: Always modify start scripts to redirect: `> app.log 2>&1`.
3.  **Data Verification**: Services can be "Healthy" (HTTP 200) but empty.
    -   *Action*: Verify specific tables (`ParsedPages`, `Torrents`) to confirm *logic* execution.

## Daily Schedule (UTC)

| Time | Job |
|------|-----|
| 9:00 AM | Database backup |
| 9:10 AM | Payment sweep |
| 9:20 AM | Zilean Maintenance (Janitor) |

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
The app runs an **embedded Vapor HTTP server** on `127.0.0.1:47253`. This server handles stream resolution, metadata fetching, and debrid unlocking—replacing the Node.js Express server from the original ColorFruit project.

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

## Stream & Playback Lifecycle (Visual Map)

```mermaid
graph TD
    subgraph "UI Layer (SwiftUI)"
        A[Media Selection] --> B[LocalAPIClient]
        K[MPVPlayerViewModel] --> L[MPVWrapper]
    end

    subgraph "Server Layer (Vapor - 127.0.0.1:47253)"
        B --> C{StreamResolver}
        C --> D[TorrentioService]
        C --> E[ZileanService]
        C --> F[...]
        
        D & E & F --> G[Filter & Sort Logic]
        G --> H[RealDebrid Unlock]
    end

    subgraph "External Providers"
        D -.-> T[Torrentio API]
        E -.-> Z[Production DB - Zilean]
        H -.-> RD[Real-Debrid API]
    end

    H -->|Playable URL| B
    B -->|URL Queue| K
    L -->|C-Interop| MPV[libmpv engine]
```

> **StreamResolver Filters**: Contains hardcoded blocklists for groups (`tamilmv`), codecs (`av1`), and audio. Check these if valid streams are missing.

## Failover Strategy
### Guest Failover (Emergency Resolution)
- **Problem**: Guests inherit the Host's stream. If that specific stream fails (404/Timeout) for the Guest, they have no fallback queue.
- **Mechanism**: If `streamQueue` is empty during a retry, the client triggers **Emergency Resolution**.
- **Action**: It autonomously resolves fresh streams for the content and effectively "forks" playback to a working stream.
- **Note**: This prevents "No Streams Found" errors but may lead to minor runtime deltas if the Guest picks a different release group.

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
- **Appcast URL**: `https://151.243.109.243.nip.io/updates/appcast.xml`
- **Mode**: **Seamless** (Automatic checks, Automatic downloading)
- **Security**: Ed25519 Signed Updates (Key in Keychain/Info.plist)

### Release Workflow (How to Ship)
The authoritative way to ship is via the automated release script:

```bash
./scripts/release.sh <VERSION> <BUILD_NUMBER>
# Example: ./scripts/release.sh 1.0.16 16
```

**This script (headless) automatically:**
1.  **Sets Version**: Updates `build-app-debug.sh`.
2.  **Builds App**: Compiles `RedLemon.app` (without launching).
3.  **Packages DMG**: Creates the installer.
4.  **Signs Update**: Generates the EdSignature using your local Keychain.
5.  **Updates Appcast**: Appends the new release block to local `appcast.xml`.
6.  **Deploys**: Pushes the DMG and XML to the production server via SCP.

### Build Artifacts
| File | Purpose | Location |
| :--- | :--- | :--- |
| `RedLemon-Installer.dmg` | Distributable installer | `build/` |
| `appcast.xml` | Sparkle RSS feed | Project Root / Server |
| `checksums.txt` | SHA256 verification | `build/` |

> [!IMPORTANT]
> **Signing Keys**: The Private Key is stored in your macOS Keychain (entry: "Sparkle Private Key"). The Public Key is embedded in `Info.plist` (`SUPublicEDKey`).
> If you move to a new machine, you must export/import the Sparkle private key or generate a new pair.

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

### Anti-Spam Best Practices
- **Summary Over Iteration**: NEVER log inside high-volume loops (e.g., `streams.map`). Log a single summary line *after* the loop (e.g., `📉 Penalized 45 streams`).
- **Polling Debounce**: Periodic tasks MUST check `if newValue != oldValue` before logging to prevent idle noise.

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
| Playback Core | `MPVPlayerViewModel.swift` (The God Class: Video, Subs, Sync) |
| Room Logic | `PlayerViewModel.swift` (Lobby, Navigation, Room Creation) |
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
| `system_job_logs` | Server maintenance/cron logs |


## Cron Jobs
Run `./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"SELECT jobname, schedule FROM cron.job;\""`

## UUID Case Sensitivity
> [!CAUTION]
# Part 15: Update Infrastructure & Private Distribution

## Private Repository Strategy
- **Limitation**: Sparkle cannot authenticate with private GitHub repositories (`raw.githubusercontent.com`) directly.
- **Solution**: Use the production server (`151.243.109.243`) as a public bridge for the `appcast.xml` and DMG files.
- **Path**: Files are served from `/root/updates` on the host, mapped to `/srv/updates` in the `caddy-proxy` container.

## Sparkle Tooling Quirks
- **Binary Output**: The `sign_update` tool returns a single string containing multiple XML attributes: `sparkle:edSignature="..." length="..."`.
- **Versioning Strategy**: Use the numeric **Build Number** (`CFBundleVersion`) for the `sparkle:version` attribute in `appcast.xml`. Using string versions like "1.0.60" can cause string-sorting failures where "1.0.60" is treated as less than "59" (since '1' < '5'). 
- **Initialization**: `SPUStandardUpdaterController` MUST be initialized with `startingUpdater: true`. If set to `false`, the update engine remains dormant, and manual `checkForUpdates()` triggers from the UI will have no response.
- **Critical Forcing**: Use `sparkle:criticalUpdate="true"` in the enclosure tag to force old or dormant clients to prioritize the update.
- **Logic**: In release scripts, never wrap the `$SIGNATURE` variable in a manual `sparkle:edSignature` tag, or the XML will be malformed. Use the variable directly inside the `<enclosure />` tag.

## Automated Deployment
The `./scripts/release.sh` script is now fully automated and "Headless". It performs:
1. **Headless Build**: Compiles without launching.
2. **DMG Creation**: Packages the app.
3. **Appcast Injection**: Uses `sed` to insert the new version at the top of the local `appcast.xml`.
4. **Remote Push**: Uses `scp` to deploy both the DMG and the XML to the production server.

---

# Part 16: Playback Synchronization

## Drift Correction (MPVPlayerViewModel.swift)
Watch Parties use a tiered synchronization system to compensate for network latency and hardware variance.

### Tiered Logic
- **Perfect Sync (<0.1s)**: No action, reset speed to 1.0x.
- **Micro Drift (0.1s - 0.4s)**: Ultra-gentle speed adjustment (±0.5%).
- **Medium Drift (0.4s - 1.0s)**: Gentle speed adjustment (±1.0%).
- **Large Drift (1.0s - 5.0s)**: Aggressive speed adjustment (up to ±5.0%).
- **Fatal Drift (>5.0s)**: Hard seek to host position + 1.2s buffer offset.

### Event Sync (Wall Clock)
For Live Events, devices calculate the seek position based on `Date() - eventStartTime`. This ensures all users see the exact same frame regardless of when they join.

---

# Part 17: Subtitle & Audio Scoring

## Subtitle Selection (`MPVWrapper.refreshSubtitleSelection`)
When multiple tracks exist, we use a weighted scoring system (higher = better):

| Factor | Weight |
| :--- | :--- |
| **Embedded Track** | +3000 |
| **Clean Title** (e.g., "English") | +600 |
| **Release Match** (e.g., "WEBRip") | +500 |
| **SDH/CC/HI** Labels | +250 |
| **Forced Track** | -50 |
| **Default Flag** | -10 |

## Audio Selection
Prioritizes **English** (+1000) and **Surround Sound** (+10 per channel), while strictly avoiding **Commentary** (-10000).

---

# Part 18: Reporting & Diagnostics

## Session Logging (`Sources/Services/SessionRecorder.swift`)
Every playback session generates an anonymized JSON log including:
- **Provider events** (Torrentio/RealDebrid response times)
- **MPV events** (Buffering status, Internal errors)
- **Sync events** (Drift corrections)

## Reported Streams (`reported_streams` table)
Users can report broken streams. The system captures:
- `imdb_id`, `stream_hash`, `quality`, and `reason`.
- Reported hashes are temporarily hidden after 3 reports and permanently blocked after admin review.

## Landmine #26: Automation Deadlock
Avoid calling scripts that `open` the app (like `start-production.sh`) in automated pipelines. Headless terminals (CI/CD or release scripts) will hang indefinitely waiting for the windowing system. Use `build-app-debug.sh` for headless builds.

## Landmine #27: Network Timeout Blind Spots
Chaining requests with default timeouts creates massive delays. Always use "Fail Fast" logic with aggressive timeouts (3s) for pre-flight checks, and abort strictly on timeout.

## Landmine #28: UUID Case Sensitivity
Supabase/Postgres is case-insensitive for UUID types, but **Swift and Realtime Channels are sensitive**.
**Rule**: Always `.lowercased()` a UUID string before using it as a dictionary key or Realtime topic to avoid silent mismatches.

## Landmine #29: The "Documents Folder" Privacy Trap
Using `fileManager.urls(for: .documentDirectory, ...)` to store internal app data (logs, cache) triggers a user-facing macOS Privacy prompt ("RedLemon would like to access files in your Documents folder").
**Rule**: Use `.applicationSupportDirectory` for all internal data. It is silent, professional, and standard for macOS applications.

## Landmine #30: Numeric vs String Update Logic
Never compare versions like `latestVersion > currentVersion` using raw strings if they can contain mixed formats (e.g., "1.0.60" vs "59"). 
**Rule**: Always cast to `Int` and compare numeric build numbers for ground-truth update detection to prevent "Version 1.0.0" being treated as older than "Version 9".

## Landmine #31: Onboarding UX Dead-ends
Avoid leaving the user on a "Success" or "finished" page during onboarding (e.g., after an Account Restoration).
**Rule**: After a critical background action (like Restoration) finishes, transition immediately to a **Success View** and implement an **Automatic Timer (2.5s)** to close the modal and drop the user into the app. Never force a user to click "Next" on a page they've already completed.
