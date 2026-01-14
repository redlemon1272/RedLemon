# RedLemon AI Bible
> **THE ULTIMATE CONTEXT DOCUMENT**
> **Last Updated:** January 14, 2026
> **Platform:** macOS (Native App)

> [!IMPORTANT]
> **Mandatory AI Instruction:**
> "You are the custodian of RedLemon. First, STUDY `MPVPlayerViewModel.swift` (Landmine #1)—it is the fragile engine of this app. Second, respect `MainActor` isolation or you will crash the UI. Finally, when shipping, obey **Part 19** implicitly. Deviating from the Bible corrupts the project."



# ⚡️ THE SURVIVAL GUIDE (Start Here)
> **The 80/20 Rule: 80% of crashes come from ignoring these 3 rules.**

1.  **Read Landmines #1, #25, & #35**:
    *   **#1 (The God Class)**: `MPVPlayerViewModel` is fragile. Touch it with fear.
    *   **#25 (MainActor)**: NEVER use `DispatchQueue.main.async`. Use `Task { @MainActor }`.
    *   **#35 (Ghost Streams)**: DB state MUST be cleared when Host leaves.
2.  **Copy-Paste Patterns**: Use **Part 1.5** for Concurrency and Logging. Do not invent your own.
3.  **Debug via Symptoms**: Use the **Symptom Checker** below to find the specific Landmine.

---


# Part 0: The Core Rules (The "Stone Tablet")

1.  **The God Class**: `MPVPlayerViewModel.swift` is the central nervous system. It handles concurrency, C-interop, and state. Thread safety here is paramount.
2.  **Concurrency**: Violating `MainActor` isolation crashes the UI. Use `Task { @MainActor in ... }`.
3.  **Deployment**: Ship ONLY via **Part 19** (Release Workflow). Manual releases corrupt the repo.
4.  **Privacy**: Logs go to `.applicationSupportDirectory`, NOT Documents.
5.  **Versioning**: Update logic relies on **Integer Build Numbers**, not Version Strings.

---


# Part 1: Architecture & Landmines

## 🚑 Symptom Checker (Quick Index)
| Symptom | Probable Cause | Landmine |
| :--- | :--- | :--- |
| **UI Freeze / Lag** | Threading violation (MainActor) | #2, #25 |
| **Crash on Logging** | Strings with `%` symbols | #11 |
| **"Ghost" / Zombie Room** | Host quit without strong capture | #21, #32 |
| **Guests Auto-Join Dead Stream** | Stale DB state (is_playing=true) | #35 |
| **Ghost Join (Host Left)** | Missing DB Verification on Join | #33 |
| **Updates Fail** | String comparison used instead of Int | #30 |
| **Missing Streams** | Hardcoded blocklists active | #4 |
| **Binge Prompt Flicker** | Global Status Reset used | #34 |
| **Date Decoding Error** | Wrong Formatter (Missing Fractional) | #8 |
| **Anime: No Streams Found** | Kitsu ID not resolved to IMDB | #40 |
| **Play-Buffer-Play Flash** | Subtitle track changed during playback | #41 |
| **Host Stuck Buffering (Audio Plays)** | Recovery logic excludes Watch Party Host | #42 |
| **Guest Playback EOF / Wrong Stream** | Optional chaining silently skipped async call | #43 |
| **Server Fail: Torrent not cached** | Heuristic ignored provider fileIdx (Season Pack) | #45 |
| **Player Start -> Immediate Fail** | Fake 'Direct' URL (Comet Error Stream) | #46 |

## 🚨 Critical Landmines

### 1-5: Core Engines
1.  **MPVPlayerViewModel (God Class)**: Handles Playback, Chat, Sync. **Rule**: Sync Chat Sender/Receiver logic perfectly. Watch thread safety.
2.  **VerifiedStream IDs**: Composite of `hash_season_episode`. **Rule**: NEVER use `hash` alone as ID (crashes on Season Packs).
3.  **Subtitle Scoring**: +3000 (Embedded), +600 (Clean Title), +500 (Release Match). **Rule**: `MPVWrapper` auto-selects based on this score.
4.  **Stream Filters**: `StreamResolver` has hardcoded blocklists (codecs/groups). **Rule**: Check blocklists if streams are missing.
5.  **Realtime Sync**: **Rule**: Copy ALL properties when re-creating `SyncMessage` for drift compensation to prevent data loss.

### 6-10: SwiftUI & Services
6.  **Compiler Timeouts**: Complex `ForEach`. **Rule**: Extract logic to private funcs/subviews.
7.  **Service Isolation**: Services cannot see `AppState`. **Rule**: Dependencies flow DOWN (UI -> Service).
8.  **Date Decoding**: Postgres timestamps vary. **Rule**: Use `.withFractionalSeconds` and `.withInternetDateTime`.
9.  **RLS Policies**: Implicit deny. **Rule**: Create `SELECT` policies for public tables.
10. **Auto-Login**: **Rule**: Call critical connections (`SocialService.connect()`) in `loadStoredUser`, not just `SignUp`.

### 11-15: System Stability
11. **Safe Logging**: **Rule**: Use `NSLog("%@", "Msg: \(url)")`. String interpolation crashes on `%`.
12. **Modifiers**: **Rule**: Use `.font(.system(size:weight:))` (macOS 12 compatible), not `.fontWeight`.
13. **State Persistence**: WebSockets fail on reconnect. **Rule**: Critical state (Playing/Ready) MUST be in Database.
14. **Config Authority**: **Rule**: Server `EventsConfig` > Local Constants.
15. **Transient State**: Variables "leak". **Rule**: Consume and `nil` state immediately.

### 16-20: Logic & Data
16. **Zombie Events**: **Rule**: NEVER auto-create Events from IDs. Validate against Config first.
17. **Silent Failures**: Binaries run without working. **Rule**: Verify **Database Growth**, not Exit Code.
18. **Event Truth**: **Rule**: If ID starts with `event_`, it IS an event. Bypass Host Checks.
19. **Zilean Integrity**: Logs lie. **Rule**: Check Admin Dashboard "Zilean Torrents" count. Static count = Broken Pipeline.
20. **Timer Bursts**: Synchronized timers cause jitter. **Rule**: Stagger tasks (`Task.sleep` with offsets).

### 21-25: Concurrency & Sync
21. **Zombie Rooms**: Host quits abruptly.
    *   **Trigger**: Host force-quits (Cmd+Q) while 2+ guests in lobby.
    *   **Rule**: All "Waiting" gates need client-side timeouts (30s).
22. **Data Shadowing**: **Rule**: Explicitly separate `payload["description"]` (User Msg) from `mediaItem.description` (Plot).
23. **Session IDs**: **Rule**: Match Reports to `log.id`, User History to `log.session_id`.
24. **Gesture Nav**: `onDisappear` cancels Tasks. **Rule**: Nav writes must be synchronous (`appState.view = .target`).
25. **MainActor**: GCD != MainActor.
    *   **Trigger**: Using `DispatchQueue.main.async` inside a Task or Actor.
    *   **Rule**: In NEW code, use `Task { @MainActor }`, NEVER `DispatchQueue.main.async`.
    *   **Note**: Existing `DispatchQueue.main.async` calls that work correctly do not require refactoring. This rule prevents NEW violations, not mandating rewrites of stable code.

### 26-31: Deployment & Privacy
26. **Automation Deadlock**: **Rule**: Use headless `build-app-debug.sh`.
27. **Network Timeouts**: **Rule**: Fail fast (3s) on pre-flight checks (Health/Version). Stream Resolution allowed 10s (Debrid Latency).
28. **UUID Case**: **Rule**: Always `.lowercased()` UUIDs for Dict keys / Realtime topics.
29. **Privacy Trap**: **Rule**: Logs to `.applicationSupportDirectory` (Hidden), NEVER `.documentDirectory` (Prompt).
30. **Versioning**: Strings fail sort ("1.0.60" < "59"). **Rule**: Compare `Int` Build Numbers.
31. **Onboarding**: **Rule**: Auto-close Success modals (2.5s timer). Don't make users click "Next" on success.
32. **ViewModel Survival (Room Cleanup)**:
    *   **Trigger**: Host deallocates ViewModel while async `deleteRoom` is pending.
    *   **Rule**: Hosts MUST capture `self` strongly in the exit `Task` to ensure `deleteRoom()` completes before deallocation. Weak capture = Zombie Rooms.
33. **Ghost Join Protection**:
    *   **Trigger**: User clicks "Join" on a room where Host has crashed/left.
    *   **Rule**: Guests MUST verify the room record in the DB *during* connection. If missing (host left), immediately eject to `.browse` with an alert.
34. **Binge Control Flash**: **Rule**: "Next Episode" prompts MUST use a local session flag (`hasHandledNextEpisodePrompt`) to stay hidden after dismissal or play. Global status resets cause UI flicker.
35. **Ghost Streams (Zombie Playback)**: *(Added v1.0.65)*
    *   **Trigger**: Host returns to Lobby, Guest auto-joins "Playing" stream because `is_playing` wasn't cleared.
    *   **Rule**: Hosts MUST explicitly `nil` query-able stream properties (`stream_hash`, `unlocked_stream_url`) in the DB immediately upon returning to lobby. Relying on `is_playing=false` alone is insufficient as guests may auto-join "ready" streams due to race conditions.
36. **Idempotent Auto-Start (The "Ghost Loop" Fix)**: **Rule**: Database reads are eventually consistent. Clients MUST track the `session_id` (Hash + Timestamp) of the last *completed* action. If the remote state asks to "Start" the same Session ID again, **BLOCK IT**. Never rely on a raw boolean (`is_playing`) alone.
37. **UUID String Case Sensitivity**:
    *   **Trigger**: Comparing IDs with `==` (e.g., `hostId == currentUserId`) when one is Uppercase (from App) and one is Lowercase (from DB).
    *   **Rule**: NEVER use `==` for String IDs. ALways use `.caseInsensitiveCompare(...) == .orderedSame`.
38. **System Color Fallback Trap**:
    *   **Trigger**: Relying on `.accentColor` without a configured `Assets.xcassets`. On macOS, this defaults to system Blue, breaking custom branding (e.g., Host labels).
    *   **Rule**: NEVER use system semantic colors (`.accentColor`, `.blue`) for core branding. Always use explicit tokens like `DesignSystem.Colors.accent`.
39. **Sparkle Hygiene**:
    *   **Trigger**: Deploying an update that isn't detected by users or lacks info (generic "Production Release").
    *   **Rule**: (1) New Build (`X`) MUST be > Current Build (`Y`) found in `README.md`. (2) Never release with generic notes; inject HTML `<li>` items listing specific fixes via the `RELEASE_NOTES` arg in `release.sh`.
40. **Kitsu→IMDB Resolution (Anime Support)**: *(Added v1.0.75)*
    *   **Trigger**: Anime content uses Kitsu IDs (`kitsu:49205`) which providers like Zilean/DebridSearch don't understand.
    *   **Rule**: `StreamResolver` MUST check if ID starts with `kitsu:` and resolve to IMDB via `MetadataService.resolveKitsuToImdb()`. Use the resolved IMDB ID for ALL provider queries. The addon `anime-kitsu.strem.fun` provides this mapping.
41. **Subtitle Track Selection Timing**: *(Added v1.0.75)*
    *   **Trigger**: Changing subtitle tracks (via `refreshSubtitleSelection`) DURING playback causes MPV to rebuffer, creating a visible "play-buffer-play" flash.
    *   **Rule**: Track selection MUST happen BEFORE playback starts. `MPVWrapper.pollForTracksAndResume()` handles this. `SubtitleService.loadExternalSubtitles()` must NEVER call `refreshSubtitleSelection()` after playback has begun.
42. **Watch Party Host Recovery Logic**: *(Added v1.0.76)*
    *   **Trigger**: Host gets stuck on "Buffering..." with audio playing after returning to lobby and restarting playback.
    *   **Cause**: Hosts are "authoritative" and filter out their own sync messages (Line ~2710 in `MPVPlayerViewModel`). Recovery logic that uses `!isInWatchParty` excludes hosts from failsafe state clearing.
    *   **Rule**: Any recovery/failsafe logic in `MPVPlayerViewModel` that clears `isLoading`, `isBuffering`, or `isRefiningInitialSeek` MUST use `(!isInWatchParty || isWatchPartyHost)` to include the host. Guests are excluded because they wait for sync messages to reveal video (prevents frame 0 flash).
43. **Silent Async Failure (Optional Chaining on Async Functions)**: *(Added v1.0.80)*
    *   **Trigger**: Guest joins watch party, playback starts but immediately hits EOF or plays the wrong stream (host's URL instead of guest's).
    *   **Cause**: Swift optional chaining on async throwing functions (e.g., `try await obj?.asyncFunc()`) **silently returns nil** if `obj` is nil—**no error is thrown**. The `try` is satisfied because "nothing happened" is not an error. Subsequent code runs as if the async function completed successfully.
    *   **Symptom**: `preloadStream()` never actually runs, so `preResolvedStream` is nil. `playMedia()` then falls through to a different code path that resolves the wrong stream or uses the host's cached URL.
    *   **Rule**: NEVER use optional chaining on critical async functions. Always use explicit guards:
    ```swift
    // ❌ WRONG: Silent failure if appState is nil
    try await viewModel.appState?.player.preloadStream(...)
    NSLog("Stream preloaded!") // RUNS EVEN IF PRELOAD NEVER EXECUTED

    // ✅ RIGHT: Explicit guard with early return
    guard let player = viewModel.appState?.player else {
        NSLog("CRITICAL: player is nil!")
        return
    }
    try await player.preloadStream(...)
    NSLog("Stream preloaded!") // Only runs if preload actually completed
    ```
    *   **Debug Pattern**: Add logging IMMEDIATELY after async calls to verify they ran: log the input AND output state. If the "success" log prints but the state is wrong, the async call was silently skipped.
44. **Guest IP-Locked URLs + RD Cache**: *(Added v1.0.80, Fixed v1.0.82)*
    *   **Trigger**: Guest joins watch party, playback starts but hits EOF in 2-5 seconds despite duration being correct.
    *   **Cause (Layer 1)**: Real-Debrid download URLs are **IP-locked** to the user who unlocked them.
    *   **Cause (Layer 2)**: `RealDebridClient` has a **60-minute in-memory cache** (`cache[hash:fileIdx:season:episode]`). When the guest calls `unlock()` in `playMedia()`, it returns the **cached host URL** instead of generating a fresh one.
    *   **Symptom**: Guest's log shows `📝 [PLAYER] File Loaded ["duration": "7559.594"]` (correct duration), then `📝 [PLAYER] Playback Finished (EOF)` within seconds. Also: `✅ RD cache hit: <hash>` appearing when guest unlocks.
    *   **Rule**: In `LobbyEventRouter.handleGuestStartLogic()`:
        1. Set `targetRoom.unlockedStreamURL = nil` (force fresh unlock)
        2. Set `viewModel.appState?.player.preResolvedStream = nil` (bypass preloaded URL)
        3. Call `await RealDebridClient.shared.clearCache(forHash: hash)` (evict cached host URL)
    *   **Related Code**: `LobbyEventRouter.swift`, `RealDebridClient.swift`
    *   **Fix Applied**: v1.0.82 added `clearCache(forHash:)` to `RealDebridClient` and calls it from `handleGuestStartLogic()` to evict cached host URLs.
45. **Debrid File Selection (The "Season Pack" Trap)**: *(Added v1.0.82)*
    *   **Trigger**: User gets "Server Fail: Torrent not cached" error for a Season Pack that the provider (Torrentio) claims is cached.
    *   **Cause**: The app ignores the provider's `fileIdx` and attempts to "guess" the correct file via string matching (e.g., matching "S01E05"). The heuristic accidentally targets an uncached file (e.g., "S01E05 Repack.mkv" or a sample) instead of the main file.
    *   **Rule**: If the Provider supplies a `fileIdx`, **TRUST IT**. Map it directly to the Debrid service's File ID. Only use filename heuristics as a fallback when no index is provided.

46. **The "Direct URL" Trojan Horse (Comet Error Streams)**: *(Added v1.0.83)*
    *   **Trigger**: A specific Provider (e.g., Comet) returns a stream with a direct HTTP URL that is actually an error/placeholder page (e.g. `.../elfhosted_addons_disabling_nondebrid_modes`) instead of a video file.
    *   **Cause**: `StreamResolver.sort` logic prioritizes Direct URLs (instant playback) over Torrents (need resolving). A "fake" stream appearing to be a Direct URL bypasses all other valid torrents and gets sent to the player, causing immediate failure.
    *   **Symptom**: Player loads quickly, immediately pauses/ends with Error Code 4 ("Failed to recognize file format"). Logs show a URL that looks like an error message path.
    *   **Rule**: All `ProviderServices` MUST validate direct URLs before returning them. Explicitly blacklist known error patterns (e.g., `elfhosted_...`, `reddit.com`) in the Service itself to prevent them from reaching the Resolver.


## 🪦 Resolved Landmines (Archived)
*   ~~#XX: Old Issue~~ - (Example placeholder)

## 🏗️ Architecture Map
| Component | Responsibility |
| :--- | :--- |
| `MPVWrapper` | C-Interop, Subtitles, Playback |
| `LobbyViewModel` | Rooms, Chat, Sync |
| `HTTPServer` | Local Streaming/Metadata Server (Port 47253) |
| `StreamResolver` | Scraper Logic & Filtering |


# Part 1.5: The Holy Patterns (Code Snippets)
> **Use these exact patterns to implement rules. Do not invent your own.**

### 🛑 Safe Concurrency (Handling MainActor)
**Pattern**: Move heavy work off-thread, update UI on MainActor.
```swift
// ❌ WRONG: Dispatch.main.async (Data Race) or blocking Task
Task { @MainActor in
   let data = heavyWork() // FREEZES UI
}

// ✅ RIGHT: Detached work + MainActor update
Task.detached(priority: .userInitiated) {
    let result = await HeavyService.compute()
    await MainActor.run {
        self.data = result
    }
}
```

### 🛑 Safe Logging (No Crashing)
**Pattern**: Use string specifiers to prevent `%` crashes.
```swift
// ❌ WRONG: String interpolation crash on %
NSLog("URL: \(url.absoluteString)")

// ✅ RIGHT: Specifier format
NSLog("%@", "URL: \(url.absoluteString)")
```

### 🛑 Safe Date Decoding (Postgres)
**Pattern**: Handle fractional seconds and ISO formats.
```swift
// ✅ RIGHT: The Only Allowed Decoder
let decoder = JSONDecoder()
let formatter = ISO8601DateFormatter()
formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
decoder.dateDecodingStrategy = .custom { decoder in
    let container = try decoder.singleValueContainer()
    let string = try container.decode(String.self)
    if let date = formatter.date(from: string) { return date }
    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
}
```

### 🛑 Safe Navigation (Gesture Handlers)
**Pattern**: Synchronous state update, no async wrapping.
```swift
// ❌ WRONG: Async task gets cancelled by onDisappear
Button(action: {
    Task { await appState.navigate(to: .target) }
})

// ✅ RIGHT: Direct State Mutation
Button(action: {
    appState.currentView = .target
})
```

---


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
    -   *Lesson*: **Torrentio is Closed Source/Proprietary** and cannot be self-hosted. We rely on the public API (`torrentio.strem.fun`).
    -   *Risk Mitigation*: We implemented **Provider Redundancy** (Comet, MediaFusion, Zilean, DebridSearch). If Torrentio fails or rate-limits, `StreamResolver` falls back to these alternatives. Zilean is our self-hosted safety net.
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
- **BTC**: `m/84'/0'/0'` (Native Segwit) - *Currently Inactive/Hidden in UI*
- **EVM**: `m/44'/60'/0'` (Standard BIP44) - *Active (Ethereum, Base, etc)*

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

---

# Part 7: Authentication & Security Architecture

## Authentication Model
- **Primary**: Anonymous Auth (Supabase Anon Key) + Custom User Tables.
- **Security**: **Cryptographic Signature Verification** (Ed25519).
- **Goal**: Prevent IDOR (Impersonation) without requiring email passwords.

## How It Works (IDOR Protection)
1.  **Keys**: App generates an Ed25519 Key Pair on first launch. Stored in macOS Keychain.
2.  **Registration**: Public Key is sent to server (`register_user_secure`).
3.  **Signing**: Client signs critical requests (e.g., `room_heartbeat`, `manage_block`).
    -   **Header `x-identity-signature`**: `Sign(privateKey, timestamp + user_id.lowercase + path)`
    -   **Header `x-identity-id`**: The `user_id` string. **MANDATORY for linking signature to user.**
    -   **Payload**: `Sign(privateKey, timestamp + method + path + body)` (Request Integrity)
    -   **Time Window**: Server rejects replay attacks >60s old.
4.  **Verification**: Server (`verify_user_signature`) verifies signature against stored Public Key using `pgsodium`.

## Critical Rules
> [!IMPORTANT]
> **RPC & Edge Function Security**
>
> **RPCs (Postgres Functions):** Critical RPCs (`room_heartbeat`, `manage_block`) are fully secured:
> 1. Swift calls them via `makeRequest(..., sign: true)` which attaches `x-identity-signature`, `x-timestamp`, and `x-identity-id` headers.
> 2. Postgres function `verify_user_signature()` validates the Ed25519 signature against the user's stored public key.
> 3. Replay attacks are blocked by 60-second timestamp window.
>
> **Edge Functions (Deno):** Currently use a **defense-in-depth** approach:
> 1. Swift client signs requests via `makeRequest(sign: true, isFunction: true)`.
> 2. Edge Functions accept `user_id` from request body (client-provided).
> 3. **Note:** Server-side signature verification is NOT yet implemented in Edge Functions. Security relies on: (a) users only knowing their own UUID, (b) RLS policies on underlying tables, (c) payment pools being user-specific.
>
> **Future Hardening:** To add server-side verification to Edge Functions, you would need to implement Ed25519 signature verification in Deno and query the user's public key from the database. This is non-trivial and requires full payment testing.
>
> *Functions using the standard SDK wrapper (`functions.invoke`) DO NOT auto-sign.* You MUST use `makeRequest(..., sign: true, isFunction: true)` for Edge Function calls.

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

# Part 19: Deployment & Release Workflow

## Update Infrastructure (Sparkle)
- **Framework**: Sparkle 2.8.0.
- **Hosting**: Files/Appcast served from `root@151.243.109.243:/root/updates` (Private Server).
- **Proxied URL**: `https://151.243.109.243.nip.io/updates/appcast.xml`.
- **Security**: Ed25519 Signed Updates (Key in Keychain/Info.plist).

## Critical Rules
1. **Versioning**: Use numeric **Build Number** (`CFBundleVersion`) for comparisons. Strings fail (1.0.60 < 1.0.9).
2. **Initialization**: `SPUStandardUpdaterController` MUST use `startingUpdater: true`.
3. **Forcing**: Use `sparkle:criticalUpdate="true"` for mandatory fixes.
4. **Key Verification**: Agents MUST verify presence of Private Sparkle Key in Keychain (`./.build/artifacts/sparkle/bin/sign_update` check) BEFORE starting build.

## Release Protocol (The "Part 19" Standard)
**Mandatory 5-Step Sequence:**
1.  **Code & Build**: Run `./build-app-debug.sh`. Verify 0 errors.
2.  **User Validation (GATE)**: Ask user to test. **DO NOT PROCEED** without confirmation.
3.  **Git Sync**: `git pull` (Change Log depends on this!) then `git push origin <branch>`.
4.  **Generate Notes**: Run `./scripts/get-changelog.sh` to grab the list of changes since the last release. Copy the output.
5.  **Release Script**: Run `./scripts/release.sh <VERSION> <BUILD> "<PASTE_NOTES_HERE>"`.
    -   *Action*: Builds -> Packages DMG -> Signs -> Deploys to Server.
6.  **Appcast Sync**: Push the auto-updated `appcast.xml` to GitHub.
7.  **Merge & Tag**: Run `./scripts/merge-and-tag.sh <VERSION>` (e.g., `v1.0.71`) to merge the feature branch into `main` and create the release tag.
    -   *Action*: Fetches origin -> Checkouts main -> Merges branch -> Tags -> Pushes Main & Tag -> Returns to Branch.

## Manual Key Recovery (New Device)
To sign releases on a new machine, you must import the **Sparkle Private Key** into the Keychain.

**Private Key:** `d5KfXj5aB/3zD1HPHnB7bRvZs+0mFoQczwi7yoa1D8g=`

**Import Command:**
```bash
security add-generic-password -a "ed25519" -s "https://sparkle-project.org" -D "application password" -w "d5KfXj5aB/3zD1HPHnB7bRvZs+0mFoQczwi7yoa1D8g="
```

**Verification:**
Run `./.build/artifacts/sparkle/bin/generate_keys -p` to confirm it generates the Public Key matching `Info.plist` (`oT0UkapQxn9PE5FOU...`).

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

### Forensic Logging Standard
Logs must be "Forensically Complete" - a silent narrative that explains "Who, What, Why, and Result" without needing user input.
1.  **Identity**: Every session log MUST start with `App Version`, `Build Number`, and `User ID`.
2.  **Trigger Source**: Explicitly log the `trigger_source` for every session:
    - `"manual"`: User clicked play/join.
    - `"lobby_auto_join"`: Database polling auto-started the session.
    - `"lobby_auto_start"`: Lobby view model auto-started via system event.
    - `"watch_party_sync"`: Realtime event from host started the session.
    - `"watch_party_resolve"`: Host initiated resolution.
    - `"preload"`: Background preloading.
3.  **State Mirroring**: Critical debugging events (Resolution, Unlock, Player State) MUST be mirrored to the System Console (`NSLog`) via `SessionRecorder` for real-time `tail -f` debugging.
4.  **Cross-Boundary Context**: When handing off between subsystems (e.g., Resolver -> Player), log the exact artifact being passed (e.g., "Unlocked Filename" vs "Provider Title").
5.  **Explicit Failure**: Never log just "Failed". Log "Failed: [Reason] [Context]". E.g., `Buffering Timeout (45s) - Connection too slow`.

---

# Part 14: Free-Tier Hosting Limits

## Room Creation History (`room_creation_history` table)
Tracks when users create watch party rooms to enforce limits.

### Limit Rules
- **Free Users**: 1 room per 72 hours
- **Premium Users**: Unlimited

### Implementation
- `SupabaseClient.checkFreeTierLimit()` returns seconds until next free room
- `LicenseManager.checkHostingLimit()` updates `timeUntilNextFreeRoom`
- UI shows cooldown timer when limit reached

### Database RPC
`check_room_creation_limit(user_id)` returns `{can_create, time_until_next, is_premium}`




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

## Smart Crash Reporting
**Rule:** When a playback session ends in a fatal error (e.g., "No Streams Found"), the user MUST be prompted to "Report Issue".
- **Action:** This triggers `SessionRecorder.shared.getSanitizedLog()` and uploads the JSON log to the `session_logs` table via `SupabaseClient`.
- **Privacy:** Logs are uploaded ONLY with explicit user consent (button click). Automatic background uploading is strictly forbidden to preserve privacy.
- **UI Standard:** Replace the "Retry" button (which usually fails in loop) with "Report Issue" in fatal error states.



---

# Appendix: Quick Reference

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
| `session_logs` | Playback error reports & session analytics |
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


