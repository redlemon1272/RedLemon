# RedLemon AI Bible
> **THE ULTIMATE CONTEXT DOCUMENT**
> **Last Updated:** January 28, 2026 (Part 32: Seamless Player UI & Transitions)
> **Platform:** macOS (Native App)

> [!IMPORTANT]
> **Mandatory AI Instruction:**
> "You are the custodian of RedLemon. First, STUDY `MPVPlayerViewModel.swift` (Landmine #1)—it is the fragile engine of this app. Second, respect `MainActor` isolation or you will crash the UI. Finally, when shipping, obey **Part 19** implicitly. Deviating from the Bible corrupts the project."



# ⚡️ THE SURVIVAL GUIDE (Start Here)
> **The 80/20 Rule: 80% of crashes come from ignoring these 4 rules.**

1.  **Read Landmines #1, #25, #35, & #132**:
    *   **#1 (The God Class)**: `MPVPlayerViewModel` is fragile. Touch it with fear.
    *   **#25 (MainActor)**: NEVER use `DispatchQueue.main.async`. Use `Task { @MainActor }`.
    *   **#35 (Ghost Streams)**: DB state MUST be cleared when Host leaves.
    *   **#132 (Inherited Observers)**: Transitions MUST explicitly back-fill Realtime state (phxRef) and use authoritative polling, or users vanish at 120s.
2.  **Copy-Paste Patterns**: Use **Part 1.5** for Concurrency and Logging. Do not invent your own.
3.  **Debug via Symptoms**: Use the **Symptom Checker** below to find the specific Landmine.

---


# Part 0: The Core Rules (The "Stone Tablet")

1.  **The God Class**: `MPVPlayerViewModel.swift` is the central nervous system. It handles concurrency, C-interop, and state. Thread safety here is paramount.
2.  **Concurrency**: Violating `MainActor` isolation crashes the UI. Use `Task { @MainActor in ... }`.
3.  **Deployment**: Ship ONLY via **Part 19** (Release Workflow). Manual releases corrupt the repo.
4.  **Privacy**: Logs go to `.applicationSupportDirectory`, NOT Documents.
5.  **Versioning**: Update logic relies on **Integer Build Numbers**, not Version Strings.
6.  **Codification Protocol**: When a major bug or "Landmine" is discovered and fixed, the assistant MUST:
    - (a) Document it in **Part 1** with a new ID.
    - (b) Add the observed symptom to the **Symptom Checker** (Part 1).
    - (c) Add a regression check to `scripts/architecture-scan.sh` (if possible via regex).
    - (d) Update the **Last Updated** date at the top.
7.  **SwiftUI Atomic Replacement**: When modifying complex SwiftUI bodies (ZStack, Overlay, etc.), assistants MUST replace the **ENTIRE** property or struct. Surgical line-edits on deeply nested SwiftUI blocks often lead to brace-drift and compiler errors.

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
| **Missing "Self" Messages** | Expecting Broadcast Echo | #61 |
| **Updates Fail** | String comparison used instead of Int | #30 |
| **Missing Streams** | Hardcoded blocklists active | #4 |
| **Binge Prompt Flicker** | Global Status Reset used | #34 |
| **Date Decoding Error** | Wrong Formatter (Missing Fractional) | #8 |
| **Anime: No Streams Found** | Kitsu ID not resolved to IMDB | #40 |
| **Play-Buffer-Play Flash** | Subtitle track changed during playback | #41 |
| **Host Stuck Buffering (Audio Plays)** | Recovery logic excludes Watch Party Host | #42 |
| **Crash (Illegal Instruction: 4)** | Double-bootstrap of LoggingSystem | #116 |
| **Guest Playback EOF / Wrong Stream** | Optional chaining silently skipped async call OR Real-Debrid IP-locked URL | #43, #44, #141 |
| **Watch Party Guest: Instant EOF** | Real-Debrid server-side cache (magnet hash level) | #44, #141 |
| **Server Fail: Torrent not cached** | Heuristic ignored provider fileIdx (Season Pack) | #45 |
| **Player Start -> Immediate Fail** | Fake 'Direct' URL (Comet Error Stream) | #46 |
| **Ghost Participant (Lobby)** | User list doesn't update / 'Left' msg missing | #47 |
| **Scroll Restore Fails** | Race condition (Scroll happens on empty list) | #48 |
| **Can't Scroll Vertically (macOS 15)** | NSScrollView swallowing events | #49 |
| **Labored/Laggy Scrolling** | 60fps @Published state updates | #50 |
| **User Flapping (Join/Left/Join)** | Presence keyed by ID instead of Ref | #51 |
| **"Insufficient funds for gas" on sweep** | Key/Derivation Depth Mismatch | #52 |
| **Funds detected but not credited** | Aggregate vs Per-Address Reconciliation | #53 |
| **Payment Success immediately loops** | Missing NEW payment flag distinction | #54 |
| **Wallet doesn't autofill amount** | Missing EIP-681 'value' in URI | #55 |
| **Screensaver/Sleep during Playback** | Missing `.idleDisplaySleepDisabled` | #56 |
| **Video Stutter/Drop when Menu Open** | Native `Menu` blocking main thread (Modal Loop) | #57 |
| **Double Join / Message Echo** | Race Condition in Connection Logic (Debounce Missing) | #58 |
| **"Realtime not connected" on Transition** | Multi-channel Interest Collision | #59 |
| **Join Failed (Duplicate Key)** | Race Condition in `room_participants` Join | #60 |
| **"User Joined" missing for sender** | Broadcasts don't echo to self | #61 |
| **Black Screen after Playback Ends** | Missing explicit navigation in exitPlayer | #62 |
| **Auto-Start Loop (Infinite Playback)** | Stale is_playing flag or missed Ready reset | #63 |
| **Realtime Auth Error (RLS)** | Missing Authorization header in WebSocket handshake | #64 |
| **"User Joined" Missing (Guests)** | `LobbyEventRouter` ignores guests | #65 |
| **Provider "Offline" (SubDL, RD)** | Missing User-Agent or Aggressive Timeout | #83 |
| **Event: Stuck at 0:00 / Black Screen** | Stream validation seeking to 0 (Watch Party logic on Events) | #84 |
| **Event: Auto-Starts Early (Countdown Bypass)** | Database createdAt (room creation) vs eventStartTime mismatch | #84 |
| **Event: Infinite Loop (No Auto-Exit)** | EOF handler using wrong time reference (user join vs event start) | #84 |
| **Guest plays different file than Host** | DebridSearch has nil infoHash; Guest falls to independent resolution | #91, #141 |
| **Slow Guest Sync (10-20s Delay)** | Full provider scrape instead of targeted sync | #142 |
| **"No Valid Streams" (All .iso files)** | Fake torrents block legitimate localized streams | #85 |
| **Browse Page Slow/Laggy** | All catalogs + images loading simultaneously | #86 |
| **App Freeze on Watch Party (Browse)** | Sheet dismissal race condition / root unmount | #87 |
| **Guest Kicked ("Room Closed") - Host OK** | Heartbeat fails due to stale auth.currentUser | #88 |
| **"User Joined" Missing / Stale Player State** | State Handoff Failure (Source VM didn't sync to AppState) | #92 |
| **Event Countdown Hidden (Auto-Join Only)** | VM Recreation Trap (New VM blocked from init by shared state) | #93 |
| **Wrong Episode Plays (Multi-Season Pack)** | Episode-only pattern matches wrong season file | #94 |
| **"Host has left the room" (Self-Alert)** | Host processes their own "Room Closed" broadcast | #95 |
| **User Re-Joins Silently** | Deduplication state not cleared on leave | #96 |
| **Zero KB Disk Usage** | Edge Function `df` failure / Relative path error | #97 |
| **Stale User Last Seen** | "12 days ago" for active user | #98 |
| **Void RPC Build Failure** | type 'Void' cannot conform to 'Decodable' | #99 |
| **"User Left" at 120s (Watch Party)** | "Inherited Observer" gap + "Sticky Ghost" timer. Shield drop aligns with DB cleanup. | #140 |
| **Guest shows "not connected"** | Realtime setup skipped after DB join fails (RLS, permissions) | #101 |
| **"403 Forbidden" / RLS Error** | Missing cryptographic signature on DB write | #103 |
| **Partial Payment Success** | Non-atomic write (Log success, Credit fail) | #104 |
| **Stream Re-selection Loop** | Hashless streams bypass exclusion list | #105 |
| **Flaky Background Art / Flicker** | Redundant state reset in loadStream | #106 |
| **Missing Logos/Art (Text only)** | Lite MediaItem used without hydration | #107 |
| **Compiler: Extraneous '}' / Redeclaration** | Partial SwiftUI Body Replacement Error | #108 |
| **Subtitles Appear Delayed (10s+)** | Sequential loading loop + 5s polling delay | #109 |
| **Subtitle Download Failed (403/503)** | Missing Browser User-Agent (SubDL CDN) | #110 |
| **Subtitle Availability Gap** | Concurrency race or slow provider response | #114 |
| **Guest/Host Subtitle Mismatch** | Sync inconsistency or weak scoring (TELESYNC Trap) | #117 |
| **Missing Subtitles on Start** | Initial API timeout; Service was down during "Smart Load" | #118 |
| **App Hang/Freezes (Startup)** | Actor Initialization Task Loop | #119 |
| **App Lag/Resource Exhaustion** | New LocalAPIClient() per view | #120 |
| **UI Flash/Spinners** | Missing Optimistic Rendering | #121 |
| **Supabase Error: Ext Limit** | Multiple Realtime WebSockets | #122 |
| **Duplicate Subtitles/Audio** | Redundant Resolution Pulse (Healing Loop) | #123 |
| **Player Hijacked by Past Event** | Orphaned countdown ticker in LobbyVM | #125 |
| **Friend Profile Empty** | RLS blocks direct table reads between users | #126 |
| **Duplicate Show Entries (Social)** | Unique ID used instead of Root IMDB ID | #127 |
| **Social View Lag/Memory Spike** | Infinite history fetch/render | #128 |
| **"ursinho" data not showing** | Friend hasn't synced local data to cloud yet | #129 |
| **Sync Script Drift** | Feature missing from public whitelist | #130 |
| **Release Artifact Mismatch** | Uncommitted changes in build executable | #131 |
| **Zoomed In UI** | Returning from Fullscreen restart | #82 |
| **Infinite Retry Loop** | Hashless streams bypass exclusion | #131 |
| **Duplicate System Messages** | Rapid UI Transitions / Double onAppear | #132 |
| **Event Sync Noise** | Non-user seeks shown during events | #133 |
| **Seek Notification Flood** | Large drift correction triggers spam | #134 |
| **Scanner Proximity Failure** | Guard too far from trigger | #135 |
| **Guest Left Immediately** | Call to `sync` runs before `appState` injection | #131 |
| **Playback "Skip" after Sync** | Overlay cleared before snap-seek finished | #145 |
| **Stale Premium Crown** | Client trusting DB flag vs Expiration Date | #146 |
| **Silent Scroll Abandonment** | Users unaware of participants/playlist list | #147 |
| **Subtitle Search: 0 results for major movie** | SubDL record lacks IMDb ID; Search fragile with Year | #138 |

## 🚨 Critical Landmines

### 1-5: Core Engines
1.  **MPVPlayerViewModel (God Class)**: Handles Playback, Chat, Sync. **Rule**: Sync Chat Sender/Receiver logic perfectly. Watch thread safety.
2.  **VerifiedStream IDs**: Composite of `hash_season_episode`. **Rule**: NEVER use `hash` alone as ID (crashes on Season Packs).
3.  **Subtitle Scoring**: +3000 (Embedded), +600 (Clean Title), +500 (Release Match). **Rule**: `MPVWrapper` auto-selects based on this score.
4.  **Stream Filters**: `StreamResolver` has hardcoded blocklists (codecs/groups). **Rule**: Check blocklists if streams are missing.
5.  **Realtime Sync**: **Rule**: Copy ALL properties when re-creating `SyncMessage` for drift compensation to prevent data loss.

### 6-10: SwiftUI & Services
6.  **Compiler Timeouts**: Complex `ForEach`. **Rule**: Extract logic to separate `struct` Views. `ViewBuilder` functions remain fragile in large files.
7.  **Service Isolation**: Services cannot see `AppState`. **Rule**: Dependencies flow DOWN (UI -> Service).
8.  **Date Decoding**: Postgres timestamps vary. **Rule**: Use `.withFractionalSeconds` and `.withInternetDateTime`.
9.  **RLS Policies**: Implicit deny. **Rule**: Create `SELECT` policies for public tables.
10. **Auto-Login**: **Rule**: Call critical connections (`SocialService.connect()`) in `loadStoredUser`, not just `SignUp`.
11. **Native Window Stabilization (Landmine #82)**: **Rule**: MacOS window transforms (fullscreen) are asynchronous. NEVER trigger navigation or layout math immediately after a fullscreen toggle. Apply a minimum **0.3s** exit delay and **0.1s** entry delay to allow the Cocoa frame-math to settle.
12. **Hashless Identity Matching (Landmine #131)**: **Rule**: For streams without infoHashes (DebridSearch/DMM), identity is defined as a 3-factor composite: **Normalized Title + Release Group + Size**. Any exclusion logic MUST check all three to prevent the "Hydra" effect (one bad release group repeatedly winning the resolution race).
13. **Strict Subtitle Year Matching**: **Rule**: SubDL's "title + year" search is fragile. Always search by **Clean Title**. Apply a **Conflict-Only** local filter: Reject if BOTH target/candidate have years that mismatch (±1 variance); but ACCEPT if the candidate lacks year metadata entirely but the name match is strong.
11. **Idempotent UI Services (Subtitle/Audio)**: **Rule**: Services receiving external data streams MUST deduplicate by URL/ID internally. Never assume the caller (e.g. `PlayerViewModel`) sends a clean or unique list. This prevents menu duplication during "Healing Loops" (Landmine #123).

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
21. **The "Healing Loop" Trap**: **Rule**: Logic that refreshes `selectedStream` in the background (to add late-arriving subtitles or info) MUST be non-destructive to current playback state. Use `loadExternalSubtitles` for late arrivals instead of re-injecting the whole stream. (Landmine #123).
22. **The "Activity Shield" Protocol**: **Rule**: Any background task (Task, Timer, or Ticker) that modifies global state or triggers navigation MUST verify it is still the current active instance before acting (e.g. `if appState.activeLobbyViewModel === self`). (Landmine #125).

### Performance Optimizations
86. **Browse Page Performance (The "10 Rows of Death")**: *(Added v1.0.126)*
    *   **Trigger**: Browse page feels sluggish compared to Events/Discover.
    *   **Cause**: Loading 10+ streaming service catalogs + 100+ poster images simultaneously overwhelms CPU/memory.
    *   **Optimizations Applied**:
        1. **Staggered Catalog Loading**: 150ms delay between catalog fetches, visible rows prioritized first.
        2. **NSCache Fast-Path**: `PosterImageCache` provides synchronous image retrieval (no async overhead).
        3. **Visibility Tracking**: `visibleRowKeys` prioritizes loading for rows currently on screen.
        4. **Removed Scroll Offset Thrashing**: Changed `scrollOffset` bindings to `nil` to prevent AppState updates during scroll.
    *   **Files**: `BrowseViewModel.swift`, `BrowseComponents.swift`, `BrowseView.swift`
    *   **Key Rule**: NEVER load all catalogs at once. Always stagger and prioritize visible content.

87. **Watch Party Freeze (Browse Sheet Race)**: *(Added v1.0.127)*
    *   **Trigger**: Starting a Watch Party from the "Continue Watching" sheet on the Browse page.
    *   **Cause**: Swapping `appState.currentView` (unmounting the parent) before the sheet is dismissed.
    *   **Rule**: Always call `dismiss()` the sheet and use a small delay (0.1s) BEFORE changing the root `currentView`.
    *   **Files**: `BrowseComponents.swift` (WatchModeSelectionView)
    *   **Pattern**: `dismiss() -> Task.sleep(0.1s) -> appState.currentView = .target`

88. **Stale Auth Context (Heartbeat Failure)**: *(Added v1.0.128)*
    *   **Symptom**: Guest gets kicked from Watch Party with "Room Closed" message, but Host continues playing.
    *   **Trigger**: New user creates account during onboarding, then hosts a Watch Party in the same session.
    *   **Cause**: `SupabaseClient.auth.currentUser` is set during registration, but the signing logic runs on background threads before it propagates. Without `currentUser.id`, the identity signature (`x-identity-signature`) is missing, causing server to reject heartbeat. After 2 minutes of failed heartbeats, the `cleanup_inactive_rooms_v2()` cron deletes the participant row, triggering room orphan detection.
    *   **Fix**: `makeRequest()` now has a fallback that reconstructs `auth.currentUser` from Keychain (`user_id`) if it's nil during signing.
    *   **Files**: `SupabaseClient.swift` (lines 269-293)
    *   **Rule**: NEVER assume `auth.currentUser` is populated. Always have a Keychain fallback for identity operations.

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
44. **Guest IP-Locked URLs + RD Cache (The Debrid API Limitation)**: *(Added v1.0.80, Updated v1.0.82+)*
    *   **Trigger**: Guest joins watch party, playback starts but hits EOF in 2-5 seconds despite duration being correct.
    *   **Cause (Layer 1 - Client Cache)**: `RealDebridClient` has a **60-minute in-memory cache** (`cache[hash:fileIdx:season:episode]`). When the guest calls `unlock()`, it returns the **cached host URL** instead of generating a fresh one.
    *   **Cause (Layer 2 - Server Cache, DEEPER)**: Real-Debrid's API caches unrestricted links **at the magnet hash level in their backend**, NOT at the torrent ID level. Even if you delete and re-add a torrent, RD returns the same cached unrestricted URL because it remembers the magnet hash.
    *   **Cause (Layer 3 - IP Locking)**: Real-Debrid unrestricted download URLs are **IP-locked to the original requester**. When a guest gets the host's cached URL, it doesn't work for their IP.
    *   **Attempted Workarounds That DON'T Work**:
        - Deleting and re-adding torrents in RD (returns same cached URL)
        - Using `/unrestrict/magnet` endpoint (doesn't exist - returns 404 "unknown_method")
        - Bypassing client-side in-memory cache (still hits server-side cache)
    *   **Symptom**: Guest's log shows `📝 [PLAYER] File Loaded ["duration": "7559.594"]` (correct duration), then `📝 [PLAYER] Playback Finished (EOF)` within seconds. Also: `✅ RD cache hit: <hash>` appearing when guest unlocks.
    *   **Impact**: This is a **Real-Debrid API limitation**, not a bug we can fix. For normal watch party usage (start once, watch together), this works fine. The edge case is when the host starts/stops the same media multiple times - guests get cached URLs that don't work for their IP.
    *   **Rule**: Accept the limitation. Document that watch parties work best when host doesn't restart the same media multiple times during a session. Workarounds require:
        1. Using a different Debrid service for guests (if they support it)
        2. Proxying the video through your server (bandwidth intensive)
        3. Accepting the limitation (current approach)
    *   **Related Code**: `RealDebridClient.swift`, `LobbyEventRouter.swift`
45. **Debrid File Selection (The "Season Pack" Trap)**: *(Added v1.0.82)*
    *   **Trigger**: User gets "Server Fail: Torrent not cached" error for a Season Pack that the provider (Torrentio) claims is cached.
    *   **Cause**: The app ignores the provider's `fileIdx` and attempts to "guess" the correct file via string matching (e.g., matching "S01E05"). The heuristic accidentally targets an uncached file (e.g., "S01E05 Repack.mkv" or a sample) instead of the main file.
    *   **Rule**: If the Provider supplies a `fileIdx`, **TRUST IT**. Map it directly to the Debrid service's File ID. Only use filename heuristics as a fallback when no index is provided.
46. **The "Direct URL" Trojan Horse (Comet Error Streams)**: *(Added v1.0.83)*
    *   **Trigger**: A specific Provider (e.g., Comet) returns a stream with a direct HTTP URL that is actually an error/placeholder page (e.g. `.../elfhosted_addons_disabling_nondebrid_modes`) instead of a video file.
    *   **Cause**: `StreamResolver.sort` logic prioritizes Direct URLs (instant playback) over Torrents (need resolving). A "fake" stream appearing to be a Direct URL bypasses all other valid torrents and gets sent to the player, causing immediate failure.
    *   **Symptom**: Player loads quickly, immediately pauses/ends with Error Code 4 ("Failed to recognize file format"). Logs show a URL that looks like an error message path.
    *   **Rule**: All `ProviderServices` MUST validate direct URLs before returning them. Explicitly blacklist known error patterns (e.g., `elfhosted_...`, `reddit.com`) in the Service itself to prevent them from reaching the Resolver.

### 47-51: Realtime & UI
47. **Realtime Identity Masking (Topic-Scoped Handlers)**:
    *   **Rule**: Presence handlers (`SupabaseRealtimeClient`) MUST pass the Phoenix map key as the primary session ID. UI Managers (`LobbyPresenceManager`, `MPVPlayerViewModel`) MUST use this key to match JOIN and LEAVE events. Never rely on the User UUID alone to resolve a leave event, as stale heartbeats or rotation-reconnects will cause "ghost" entries or ignored leaves.
48. **Async Scroll Race Condition (The "Empty List" Trap)**:
    *   **Trigger**: Triggering `proxy.scrollTo` inside `onAppear` while content is loading asynchronously (e.g., via `.task`).
    *   **Symptom**: Scroll restoration works ~50% of the time. Fails when the list is empty/cleared during the scroll command.
    *   **Rule**: Scrolls MUST be **Content-Aware**.
        1. Check `!items.isEmpty` before scrolling.
        2. Add `.onChange(of: items)` to trigger the scroll once data arrives.
        3. **Optimistic UI**: NEVER `removeAll()` data before reloading (Atomic replacement) to maintain scroll anchor.
49. **macOS 15 Nested Scroll Event Swallowing**:
    *   **Trigger**: Using a custom `NSScrollView` (via `NSViewRepresentable`) inside a vertical native SwiftUI `ScrollView` on macOS 15+.
    *   **Symptom**: Vertical scrolling stops working when the mouse is over the horizontal row. The inner implementation "eats" the scroll events.
    *   **Rule**: You MUST subclass `NSScrollView` and override `scrollWheel` to forward vertical deltas (`deltaY`) to `nextResponder` manually.
    *   **Note**: On macOS 12-14, the standard `NSScrollView` works fine, and sometimes the custom subclass actually *breaks* it. Use version checks (`if #available(macOS 15, *)`) to apply the fix conditionally.
50. **The High-Frequency State Trap (60fps Re-renders)**:
    *   **Trigger**: Binding a high-frequency real-time value (like Scroll Offset `CGFloat`) directly to a Global `@Published` property in `AppState`.
    *   **Symptom**: Application becomes extremely sluggish/labored while interacting. CPU usage spikes.
    *   **Cause**: `@Published` triggers `objectWillChange`, forcing **every view in the app observing AppState** to re-evaluate its body 60-120 times per second.
    *   **Rule**: **DEBOUNCE** high-frequency inputs. Do not update `AppState` on every frame. Use a `DispatchWorkItem` to wait for the interaction to *stop* (e.g., 150ms delay) before committing the value to the global state.
51. **Phoenix Ref Collision Trap (Presence Flapping)**: *(Added v1.0.84)*
    *   **Trigger**: Using `userId` as the key for Realtime Presence handlers instead of the unique `phx_ref`.
    *   **Symptom**: Users erroneously appear to "Leave" and then "Join" instantly (flap) during metadata updates (e.g., status change).
    *   **Cause**: Phoenix Presence updates send a `leave` (old ref) and `join` (new ref) simultaneously. If keyed by `userId`, the `leave` event for the *old* ref deletes the dictionary entry entirely, momentarily removing the user before the `join` (new ref) is processed.
    *   **Rule**: `SupabaseRealtimeClient` MUST iterate over the `metas` array and use `phx_ref` as the unique key for callbacks. Consumers (like `SocialService`) must manage a set of refs per user (`[UserId: [PhxRef: Metadata]]`). User is "Offline" only when their ref count drops to zero.

### 52-57: Payments & System
52. **HD Wallet Derivation Depth (XPRV Trap)**: *(Added v1.0.85)*
    *   **Trigger**: Sweep function fails with "Insufficient funds" or "Key mismatch" when address balance is clearly > 0.
    *   **Cause**: If the `XPRV_EVM` is derived at the "External/Change" level (`m/44'/60'/0'/0`), you **must** use `deriveChild(index)`. Using a path string like `m/0/index` relative to that key will result in the wrong private key.
    *   **Rule**: Always verify the derived public address against the database address before attempting a sweep. If they don't match, FAIL and log "Key mismatch".
53. **Per-Address Reconciliation**: *(Added v1.0.85)*
    *   **Trigger**: User pays, but credit isn't applied or is applied incorrectly across multiple addresses.
    *   **Cause**: Checking the "Total User Balance" (aggregate) fails if old "legacy" addresses still have tiny remnants of funds. The logic confuses old dust with new payments.
    *   **Rule**: Scan all active pools, but subtract `prevSum` of transactions **only for that specific address+currency**. This isolates payments to the current active address.
54. **Success Confirmation Robustness**: *(Added v1.0.85)*
    *   **Trigger**: UI immediately skips to "Success" for an already premium user, or stays stuck on "Waiting" even after payment.
    *   **Rule**: (1) Server must return a `new_payment` boolean flag. (2) UI must capture `initialExpiry` on appear. SUCCESS is triggered if `new_payment == true` OR `currentExpiry > initialExpiry`.
55. **EIP-681 URI Compatibility**: *(Added v1.0.85)*
    *   **Trigger**: Wallet apps (MetaMask, Trust, Ledger) show "0 ETH" instead of the requested amount.
    *   **Rule**: Crypto URIs must include BOTH `value` (in WEI for modern EIP-681) and `amount` (in ETH for legacy/human-readable).
    *   **Format**: `ethereum:ADDRESS?value=WEI&amount=ETH`
56. **Display Sleep vs System Sleep Trap**: *(Added v1.0.86)*
    *   **Trigger**: Using only `.idleSystemSleepDisabled` in `MPVPlaybackService`.
    *   **Symptom**: Audio continues playing, but the screen goes black or screensaver activates.
    *   **Cause**: Preventing *System Sleep* does not prevent *Display Sleep*. macOS treats them separately to save power while keeping background tasks running.
    *   **Rule**: You MUST use `[.userInitiated, .idleSystemSleepDisabled, .idleDisplaySleepDisabled]` (ALL THREE) when asserting playback activity.
57. **The Modal Loop Trap (Native Menus of Death)**: *(Added v1.0.112)*
    *   **Trigger**: Opening a `Menu { ... }` or `ContextMenu` on top of an active MPV video player.
    *   **Symptom**: Video playback immediately stutters, drops frames, or freezes completely while the menu is open. Resumes normal playback only when menu closes.
    *   **Cause**: Native macOS menus (`NSMenu`) run in a **nested modal event loop** (`waitingForUser`). This hijacking of the main run loop prevents `libmpv` (and high-frequency `Timer` publishers) from dispatching render events on the main thread, starving the video renderer.
    *   **Rule**: **NEVER** use native `Menu` or `ContextMenu` on player views. You MUST implement **Custom SwiftUI Overlays** (ZStack + Overlay) that mimic menu behavior but remain within the standard SwiftUI render loop.
    *   **Fix Applied**: v1.0.112 replaced Chat Overlay's `NSMenu` with a custom `VStack` overlay to fix stutter.
58. **Async State Debouncing (The "Double Connect" Trap)**: *(Added v1.0.115)*
    *   **Trigger**: User joins lobby, "User Joined" message appears twice.
    *   **Cause**: Connection logic checked `if status == .connected || status == .connecting` and then verified the *underlying* socket state. Since the socket is `false` (not connected *yet*) during `.connecting`, the logic treated it as a "Stale Zombie" and forced a reconnect, launching two parallel connection flows.
    *   **Rule**: Never validate health during a transitional state (`.connecting`). Explicitly **DEBOUNCE** by returning early: `if status == .connecting { return }`. Only perform stale/zombie checks if the high-level status is stable (`.connected`).
59. **Realtime Multi-Channel Conflicts**: *(Added v1.0.117)*
    *   **Trigger**: Multiple managers (Lobby, Player, Chat) sharing a single `SupabaseRealtimeClient` instance. One manager calls `cleanup()` or `leaveChannel()` during a transition while another still needs the connection.
    *   **Cause**: Global event handlers or global channel management causing one manager to "kill" another's connection or overwrite its handlers.
    *   **Rule**: `SupabaseRealtimeClient` MUST implement **Reference Counting** for topics and **Topic-Scoped Handlers**.
60. **Room Participant Duplicate Key (The "Re-Join" Race)**: *(Added v1.0.117)*
    *   **Trigger**: Host returns to Lobby from Player and immediately attempts to `joinRoom` (to ensure presence) while a previous DELETE or staleness check is pending.
    *   **Symptom**: `Supabase API Error: duplicate key value violates unique constraint "room_participants_pkey"`.
    *   **Rule**: `SupabaseClient.joinRoom` MUST be **Idempotent**. It must catch Postgres error `23505` (Unique Violation) and HTTP `409 Conflict` and treat them as success. Never block connection flow due to "user already in room".
**Landmine #97: Zero KB Disk Usage in Edge Functions**
- **Symptom**: Admin Dashboard shows "Disk Usage: 0 bytes (0%)" even when server is active.
- **Trigger**: Edge function calls `Deno.Command("df", ...)`.
- **Cause**: Security restrictions in Deno Edge Functions block direct shell command execution.
- **Rule**: Never use `Deno.Command` in edge functions. Use pre-calculated JSON files or authorized internal APIs.

**Landmine #98: Stale User Last Seen Timestamps**
- **Symptom**: Admin Dashboard shows users last seen days/weeks ago despite current activity.
- **Trigger**: Database heartbeat functions (e.g. `room_heartbeat`) only update `room_participants` table.
- **Cause**: The `users` table `last_seen` column is not updated during session heartbeats, only on registration.
- **Rule**: Every heartbeat RPC (`room_heartbeat`, `user_heartbeat`) MUST explicitly update `public.users.last_seen`.

**Landmine #99: The Void RPC Decodable Trap**
- **Symptom**: Build failure: `type 'Void' cannot conform to 'Decodable'`.
- **Trigger**: Calling `SupabaseClient.shared.rpc(fn: "...", ...)` and expecting a `Void` or `()` return.
- **Cause**: The generic `rpc<T>` function requires `T: Decodable`. Swift's `Void` does not conform to `Decodable`.
- **Rule**: For RPCs that return no data, do NOT use the generic `rpc` method. Use `makeRequest` directly or a dedicated helper (e.g., `sendUserHeartbeat`, `sendHeartbeat`).
61. **The Invisible Join Trap (Lack of Local Echo)**: *(Added v1.0.115)*
    *   **Trigger**: Relying on Realtime Broadcasts or Presence updates to confirm the sender's own actions.
    *   **Symptom**: "User Joined" or "Message Sent" appears for everyone *else* but not the sender.
    *   **Cause**: Supabase Realtime Broadcasts do NOT echo back to the sender by default. Presence events are also unreliable for self-confirmation due to potential race conditions (see #51).
    *   **Rule**: **Hybrid Strategy**. For any user action (Join/Message), you MUST: (1) **Send** the Broadcast for others, AND (2) **Immediately Update** local state for the sender. Never wait for the network to confirm your own action.
62. **The "Player Stranding" Bug (Explicit Navigation)**: *(Added v1.0.118)*
    *   **Trigger**: Exiting player while in Watch Party mode (`keepRoomState = true`).
    *   **Symptom**: The player disappears but the user is stranded on a black screen or the previous view instead of returning to the Lobby.
    *   **Cause**: Navigation logic was often guarded by `if !keepRoomState`. When keeping state, the app assumed the view was already "behind" the player, but SwiftUI view stacks often require an explicit `appState.currentView` update to re-render the sidebar and lobby components correctly.
    *   **Rule**: Every `exitPlayer` path MUST explicitly set the next `currentView`. Do not rely on view hierarchy persistence.
63. **Auto-Start Loop (Infinite Playback)**: *(Added v1.0.118)*
    *   **Trigger**: Finishing a movie in a Watch Party.
    *   **Symptom**: Guest returns to the Lobby, but then immediately bounces back into the Player for the same movie.
    *   **Cause**: (1) The database `is_playing` flag is eventually consistent. (2) The client's `isReady` flag remained `true`. When the Lobby re-appeared, its `onAppear` or polling saw the "old" playing state and the "ready" guest, and auto-started playback again.
    *   **Rule**: Clients MUST reset `isReady = false` and `canAutoJoin = false` locally in `markPlaybackEnded()` to break the loop. This force-stops auto-join until the host (or user) takes a new action.
64. **Realtime Auth Handshake (URLRequest Headers)**: *(Added v1.0.118)*
    *   **Trigger**: Subscribing to RLS-protected channels (e.g., `reported_streams`) via custom WebSocket clients.
    *   **Symptom**: Subscription fails with "unauthorized" even if a valid JWT is sent in the `phx_join` payload.
    *   **Cause**: Some Supabase configurations require the `Authorization` header during the **initial WebSocket HTTP handshake** (the GET request to upgrade to WS).
    *   **Rule**: Custom Realtime clients (`SupabaseRealtimeClient`) MUST inject the `Authorization: Bearer <token>` header into the `URLRequest` used to initialize the connection. Relying on payload-level auth alone is insufficient for high-security (RLS) channels.

**Landmine #104: Partial Payment Success (The Atomic Write Trap)**: *(Added v1.0.135)*
*   **Symptom**: User payed, transaction is logged in `payment_transactions`, but `is_premium` is NOT updated and expiry remains old.
*   **Cause**: The edge function performed three separate database writes (Write Log -> Update User -> Update Pool). If the function timed out or the database connection flickered after the first write, the user wouldn't get credit despite funds being taken.
*   **Rule**: **Use Atomic RPCs**. All payment processing MUST happen inside a single PostgreSQL function (`process_payment_batch_secure`) wrapped in a transaction. The edge function must call this RPC once.
*   **Verification**: Check `check-payment/index.ts` to ensure it uses the `process_payment_batch_secure` RPC.
65. **Event Room Guest Visibility (The "Silent Join" Bug)**: *(Added v1.0.125)*
    *   **Trigger**: Guest joins a System Event (where `isHost` is false for everyone).
    *   **Symptom**: "User Joined" messages appear in logs but not in the Chat UI for other guests.
    *   **Cause**: `LobbyEventRouter.handleLobbyJoin` only generated system messages in the `if isHost` block. Guests relied on silent Presence updates.
    *   **Rule**: Guests MUST process `LOBBY_JOIN` messages to generate UI notifications, guarding against self-echo (`senderId != myId`).
83. **Ghost Offline (Provider Connectivity)**: *(Added v1.0.126)*
    *   **Trigger**: A provider (SubDL, RD) works on its website but shows "Offline" in the app settings or fails to load media.
    *   **Cause**: (1) Cloudflare blocking requests without a browser-like `User-Agent`. (2) Aggressive timeouts (e.g., 3s) that fail during global CDN routing or cold API starts.
    *   **Rule**: EVERY provider search/health check MUST:
        1. Set a standard Browser User-Agent.
        2. Use a minimum **10s** timeout.
        3. For subtitles, use an **8s** timebox in the Resolver to handle slow responses without blocking playback.
84. **Event Loop Trap (Three-Fold Event Failure)**: *(Added v1.0.124)*
    *   **Trigger**: (1) Events stuck at 0:00 with black screen, (2) Events auto-starting 18+ minutes early (countdown bypass), (3) Events looping forever instead of auto-exiting to next event.
    *   **Cause**: (1) Events inherit `isInWatchParty=true` but have no host, triggering stream validation that seeks to 0 after 2 seconds. (2) LobbyViewModel syncs `room.createdAt` from database (room creation time) instead of using EventsView's `event.startTime`. (3) EOF handler used `lastPlaybackResumeTime` (when user joined) instead of `eventStartTime` (when event started), causing late joiners to fail the 80% duration check.
    *   **Rule**: Events are NOT watch parties. They have special handling:
        1. **Skip Ready Gate**: In `durationPub` handler, check `isEventPlayback` and skip stream validation. Set `hasSentReadySignal = true` to prevent future triggers.
        2. **Preserve Event Start Time**: In `LobbyViewModel`, never sync `createdAt` for events from database. Use local `room.createdAt` (already set to `event.startTime` by EventsView).
        3. **Use Wall Clock Time**: In EOF handler, ALWAYS use `eventStartTime` not `lastPlaybackResumeTime`. All viewers sync to event start time regardless of join time.
    *   **Detection**: Video reaches position >0 but then resets to 0, or countdown shows negative values, or `[ERROR_HANDLER] playedDuration` is much shorter than expected.
85. **Fake Torrent Fallback Trap (The ".iso Masquerade")**: *(Added v1.0.125)*
    *   **Trigger**: User tries to play new/popular content, gets "No Valid Streams" despite providers showing many results.
    *   **Cause**: Fake torrents masquerade as legitimate releases (e.g., "The Housemaid (2026) [1080p] [WEBRip]") but contain `.iso` disc images instead of video files. These pass the "clean English" filter, blocking actual working streams (often localized/dubbed CAM releases) from being tried.
    *   **Symptom**: Logs show all streams being "Blocked restricted extension: .iso" after unlock. Meanwhile, legitimate localized streams (e.g., `*.Dublado.mkv`) exist but were deprioritized and never tried.
    *   **Rule**: After ALL "clean" streams fail to unlock, StreamService MUST attempt `deprioritizedStreams` (localized/dual audio) as a "last resort" fallback. Better to play a dubbed CAM than show "No Streams Found."
    *   **Fix Location**: `StreamService.swift` - Added localized fallback loop after main unlock loop.
    *   **Detection**: Log shows repeated `Blocked Extension ["ext": ".iso"]` for every attempted stream.
90. **Room Presence Message Timing (The "Silent Join" Bug v2)**: *(Added v1.0.126)*
    *   **Trigger**: Guest joins a User Room (not Event) while Host is in Lobby.
    *   **Symptom**: "User Joined" message appears for Events but NOT for Rooms in the player chat overlay.
    *   **Cause**: For Rooms, guests join during the Lobby phase, but the Player registers its presence observer **later** (when Host starts playback). By the time the Player's observer is active, the join event already happened. Events work because users go directly to the Player (no Lobby phase).
    *   **Rule**: After `MPVPlayerViewModel.startWatchPartySync()` registers its observer, call `syncExistingParticipantsToChat()` to iterate `currentWatchPartyRoom.participants` and generate "joined" messages for any participants who joined before the observer was registered.
    *   **Guard**: Skip for Events (`isEventPlayback == true`) since they already work correctly.
91. **Guest/Host Stream Mismatch (The "DebridSearch Nil Hash" Trap)**: *(Added v1.0.126)*
    *   **Trigger**: Host resolves stream from DebridSearch provider (direct redirect URLs, no torrent hashes).
    *   **Symptom**: Guest plays a **different file** than Host.
    *   **Cause**: DebridSearch returns `infoHash = nil`. When Host calls `updateRoomStream(streamHash: nil)`, line 1108 of `SupabaseClient.swift` only adds hash if non-nil, so DB never updates. Guest reads nil and falls through to independent resolution (line 461 of `PlayerViewModel.swift`).
    *   **Rule**: Host MUST persist `source_quality` (stream filename/title) as fallback identifier. Guest resolution MUST use `source_quality` for matching when `stream_hash` is nil.
    *   **Scope**: This applies to **BOTH** standard Watch Parties (Host) AND Automated Events (System).
    *   **Event Constraint**: `EventsView` MUST capture and persist `source_quality` (stream title) during automated room creation (`createRoom`), or else guests joining the event for DebridSearch streams will fall back to independent resolution.
    *   **Detection**: Guest log shows: `⚠️ Guest: No stream hash available. Guests cannot use host's URL (IP-locked). Will attempt fresh resolution.`

92. **State Handoff Trap (The "Empty Handed" Transition)**: *(Added v1.0.129)*
    *   **Trigger**: Transitioning between complex ViewModels (e.g., Lobby to Player) via `AppState`.
    *   **Symptom**: Destination ViewModel sees stale or empty data (e.g., `participants` list is empty), even though the Source ViewModel had it.
    *   **Cause**: `AppState` is a shared container, but it doesn't auto-fetch. If the Source VM modifies its *local* copy of data (e.g. `self.participants`) but doesn't explicitly sync it back to `AppState.currentWatchPartyRoom` immediately before navigation, the Destination VM initializes with stale `AppState`.
    *   **Rule**: **Explicit Sync Before Navigation**. The Source VM MUST copy all relevant local state (participants, playlist, stream details) to the `AppState` object *synchronously* in the same Task/Block as the navigation call.
    *   **Code**: `appState.player.currentWatchPartyRoom = self.room` -> `appState.currentView = .player`

93. **VM Recreation + Shared State Trap (The "Double onAppear" Bug)**: *(Added v1.0.129)*
    *   **Trigger**: View lifecycle events (e.g., `onAppear`) cause SwiftUI to recreate the View and its ViewModel (VM2), while a shared Singleton (like `RealtimeChannelManager`) already holds state from VM1.
    *   **Symptom**: New ViewModel (VM2) is blocked from running initialization code because the shared manager reports "Already Connected". Critical local state (e.g., `timeUntilStart`) is never set, causing UI elements to be hidden or malfunction.
    *   **Cause**: `shouldAutoJoinLobby = false` toggle triggers parent View re-render -> `WatchPartyLobbyView.init` called again -> new `LobbyViewModel(VM2)` created. VM2 calls `connect()`, but shared `RealtimeChannelManager` says "Already setup". `connect()` returns early. VM2 never runs `autoStartSystemEvent()` where the timer ticker is started.
    *   **Rule**: ViewModels MUST NOT rely solely on connection flow to initialize critical UI state. Idempotent initialization (in `init`) is essential. Additionally, even when "Already Connected", local state setup (like tickers/timers) MUST still execute.
    *   **Detection**: Log shows "Already setup for room X" or "Already connected - skipping" followed by missing expected periodic logs (e.g., `[COUNTDOWN]`).

94. **Multi-Season Pack Episode Mismatch (The "Wrong Season" Bug)**: *(Added v1.0.129)*
    *   **Trigger**: User requests S01E01 from a torrent containing Seasons 1-3. S02E01 file appears before S01E01 in the torrent's file index.
    *   **Symptom**: App plays **S02E01** instead of **S01E01**. Logs show `✅ MATCH FOUND: /Season 2/...S02E01.mkv`.
    *   **Cause**: `RealDebridClient.selectEpisodeFile()` used an episode-only pattern (`e01`) that matched the first file containing "E01" without verifying the season number.
    *   **Rule**: Episode-only patterns (`Exx`) MUST NOT be trusted without additional season context validation (directory path like `/Season 1/` or inline `S01`).
    *   **Code**: `RealDebridClient.swift` - `selectEpisodeFile()` now separates "full patterns" (SxxExx) from "episode-only patterns" and validates season context for the latter.

95. **Broadcast Self-Echo Trap (The "Host Kick" Bug)**: *(Added v1.0.130)*
    *   **Trigger**: Host broadcasts a destructive signal (Room Closed / Kick) via Realtime.
    *   **Symptom**: Host receives their own broadcast and processes it as an incoming alert, effectively "kicking themselves" with a "Host has left the room" message.
    *   **Cause**: Realtime broadcasts generally do NOT echo, but some configurations or race conditions can cause loopback.
    *   **Rule**: **Always Filter Self**. In any broadcast handler (`onSync`, `onBroadcast`), explicitly check `if senderId == currentUserId { return }` before processing destructive actions. Never assume the network will filter it for you.
    *   **Impact**: Prevents false positive alerts where the sender scares themselves.

96. **The Re-Join Echo Trap (State Clearing)**: *(Added v1.0.131)*
    *   **Trigger**: A deduplication mechanism (e.g. `announcedParticipantIds`) prevents "Double Join" messages correctly, but also silences "User Joined" messages when a user leaves (gracefully) and immediately re-joins.
    *   **Symptom**: User leaves watch party, returns, and no "User Joined" message appears.
    *   **Cause**: The deduplication logic remembered the user session forever. It didn't account for the "Leave" event resetting the state.
    *   **Rule**: **Reset on Exit**. Any deduplication state used for "Once-per-session" events MUST be cleared in the `.leave` or disconnect handler.
    *   **Fix**: `announcedParticipantIds.remove(id)` added to `.leave` handler in `MPVPlayerViewModel`.
    *   **Related**: Landmine #58 (Async State Debouncing) -> This is the inverse problem (Over-debouncing).


100. **Event Heartbeat Latency Trap (The 60-Second Eviction)**: *(Added v1.0.133)*
    *   **Trigger**: Auto-joining a new event lobby immediately after the previous event ends.
    *   **Symptom**: "User Left" message appears for a user who is clearly still there (confirmed by "User Joined" shortly after).
    *   **Cause**: The first DB Heartbeat (UPSERT) can be delayed by RLS overhead, cold starts, or network race conditions during the transition. If the "Zombie Cleanup" grace period (e.g., 60s) is strictly equal to `heartbeat_interval` + `latency`, it fails. Observed latency was 61.5s.
    *   **Rule**: **Generous Padding**. The grace period for DB eviction MUST be at least **2.5x** the heartbeat interval (e.g., 90s for a 35s heartbeat) to safely absorb transition spikes.
    *   **Corollary**: Participant merging logic MUST be robust. Use **whitespace-trimmed Case-Insensitive Matching** for usernames to prevent duplicate "Self" entries (one random UUID, one DB UUID) during these transition windows.
    *   **Fix**: `LobbyPresenceManager.swift` - Extended event grace period to 90s and added `.trimmingCharacters(in: .whitespacesAndNewlines)` to matching.

101. **The "All-or-Nothing" Connection Trap (Realtime Decoupling)**: *(Added v1.0.134)*
    *   **Trigger**: Guest returns to lobby or joins a room where database write fails (RLS policies, permissions, or transient errors).
    *   **Symptom**: Guest shows "not connected" status even though Realtime WebSocket could work fine. Chat, presence, and sync messages fail entirely.
    *   **Cause**: Connection flow treats Realtime setup as dependent on database join success. When `joinRoom()` throws an error, the entire connection fails without establishing Realtime connectivity. Realtime and Database are **independent communication channels** - Realtime (WebSockets) for real-time sync/presence, Database for persistence/polling fallback.
    *   **Rule**: **Decouple Connection Layers**. Realtime MUST be established even when database operations fail for non-fatal errors. Only treat **structural errors** as fatal (e.g., Foreign Key = room deleted). Gracefully degrade to "Realtime-only" mode with a user-facing message explaining limited features.
    *   **Detection**: Log shows "Guest could not join room in database" followed by absence of "Setting up Realtime channel" message.
    *   **Fix**: `LobbyViewModel.swift` - Moved `setupRealtimeSubscription()` into the error handler for non-fatal errors (lines 725-748).

106. **Visual Continuity Trap (The "Loading Flicker")**: *(Added v1.0.138)*
    *   **Symptom**: Background art flashes black or appears "flaky" behind the loading/buffering overlay.
    *   **Cause**: The Player ViewModel resets visual properties (`backgroundURL`, `posterURL`) to `nil` at the start of `loadStream` before refetching them. This breaks the "visual chain" from the Browse page.
    *   **Rule**: **Inherit UI State Sync**. ViewModels MUST copy visual state (backgrounds/logos) from the `AppState` metadata cache *synchronously* during initialization.
    *   **Fix**: `MPVPlayerViewModel.swift` - Check `appState.player.selectedMetadata` and populate URLs immediately if the IMDB ID matches.

107. **Metadata Hydration Trap (Detail Views)**: *(Added v1.0.139)*
    *   **Trigger**: Navigating from a search/browse list to a detail-oriented view (like `QualitySelectionView`) relying solely on the passed `MediaItem`.
    *   **Symptom**: High-fidelity assets (Logos, Backgrounds) are missing or low-res. Text title shows instead of Logo.
    *   **Cause**: List widgets (Cinemeta/Trakt) often provide "Lite" models optimized for grid scrolling. They lack deep links or high-res art found in the full metadata.
    *   **Rule**: **Always Hydrate**. Views that require high-fidelity assets MUST explicitly fetch full metadata (`fetchMetadata`) on appear or init. Never assume a `MediaItem` from a list is complete.

108. **SwiftUI Partial Body Replacement Trap (The "Extraneous Brace")**: *(Added v1.0.139)*
    *   **Trigger**: Using AI tools to surgically replace *parts* of a SwiftUI `body` property.
    *   **Symptom**: Compiler errors: `extraneous '}' at top level` or `invalid redeclaration of 'body'`.
    *   **Cause**: SwiftUI's deeply nested closure syntax (stacks inside stacks) makes it incredibly clumsy for regex/line-based partial replacements. A single missed brace corrupts the entire file structure.
    *   **Rule**: **Atomic Replacement**. When modifying a complex SwiftUI `body`, the AI MUST replace the **ENTIRE** `body` property (or the whole `struct`), never just a sub-section. It is safer to re-print 50 lines than to spend 3 cycles fixing brace mismatches.

109. **The Restoration Race (Sync-before-Relaunch)**: *(Added v1.0.140)*
    *   **Symptom**: Cloud-only items (like library additions made on another device) vanish after a successful restoration/import.
    *   **Trigger**: The restoration/import flow triggers a background sync and immediately calls `appState.relaunchApp()`.
    *   **Cause**: Network requests for cloud sync are asynchronous. If the app process terminates (via relaunch) before the requests finish, data is lost.
    *   **Rule**: Any flow that modifies account identity or restores backups MUST `await` the full synchronization task before calling `relaunchApp()`.
    *   **Code**: `await SyncManager.shared.performFullSync()` followed by `appState.relaunchApp()`.

110. **Identity-Aware Startup Sync**: *(Added v1.0.140)*
    *   **Symptom**: "Unauthorized" or "User ID missing" errors in logs during startup, even for logged-in users.
    *   **Trigger**: Triggering `performFullSync()` inside `AppState.init`.
    *   **Cause**: `AppState` is initialized before `RedLemonApp` finishes `loadStoredUser()`. The sync runs with a `nil` user ID because the Keychain hasn't been read yet.
    *   **Rule**: Never trigger cloud sync in a ViewModel or State `init`. Always defer to `RedLemonApp.task` (after `loadStoredUser`) or a post-authentication hook.

125. **Safe Lobby Handoff & Background Zombies**: *(Added v1.0.141)*
    *   **Trigger**: User joins a room (Lobby A), then navigates away or joins another room (Lobby B) without an explicit disconnect, while a background timer is running.
    *   **Symptom**: The "Zombie" Lobby A timer fires later and hijacks the app (e.g. starting a movie or changing views) while the user is busy in Lobby B or a solo movie.
    *   **Cause**: Direct assignment to `activeLobbyViewModel` in `AppState` fails to decommission the previous object's active background tasks.
    *   **Rule**: **Mandatory Handoff Helper**.
        1.  `AppState` MUST use `setActiveLobbyViewModel()` to transition between lobbies. This helper handles the cleanup of the outgoing instance.
        2.  **Activity Shield**: Background tasks MUST verify `appState.activeLobbyViewModel === self` before modifying state.
    *   **Automation**: `architecture-scan.sh` (Check 54) flags direct assignment to `activeLobbyViewModel` outside `AppState`.

126. **Friend Data Visibility (The RLS & RPC Trap)**: *(Added v1.0.142)*
    *   **Trigger**: A user attempts to view a friend's watch history or library via a direct Supabase table query.
    *   **Symptom**: The list appears empty result even though the friend has data. No error is thrown.
    *   **Cause**: Row Level Security (RLS) is typically configured to only allow `auth.uid() = user_id`. PostgREST silently filters out rows that fail RLS, resulting in an empty list for friends.
    *   **Rule**: **Use Security Definer RPCs**. Cross-user data retrieval MUST use a PostgreSQL function marked as `SECURITY DEFINER`. These bypass RLS while allowing you to control exactly what is exposed via code.
    *   **Implementation**: Use `/rpc/fetch_user_watch_history` instead of direct table access.

127. **History/Library Spam (Unique ID vs Root ID)**: *(Added v1.0.142)*
    *   **Trigger**: A friend watches multiple episodes of a show.
    *   **Symptom**: The friend's "Continue Watching" view shows the same show 5 times for different episodes.
    *   **Cause**: The unique key for history is `imdbId_S_E`. Deduplicating by the full key allows different episodes of the same show to coexist.
    *   **Rule**: **Deduplicate by Root ID**. When rendering "Latest Activity" or "Continue Watching" lists, extract the root IMDB ID (e.g., `media_id.components(separatedBy: "_").first`) and use it as the unique key for filtering.
    *   **Impact**: Shows 1 unique entry per Movie/Show, preserving a clean UI.

128. **Friend History Cap (UI Performance)**: *(Added v1.0.142)*
    *   **Symptom**: Friend profile scrolling becomes laggy or application memory usage spikes after clicking several friends.
    *   **Cause**: Fetching and rendering an uncapped history list (hundreds of items) for every friend interaction.
    *   **Rule**: **Hard Cap Social Lists**. Any list displayed on a friend profile (History/Library) MUST be capped (e.g., `.prefix(20)`) after deduplication. This ensures constant-time rendering and keeps the view punchy.

129. **Sync Whitelist Drift**: *(Added v1.0.161)*
    *   **Trigger**: Adding a new feature folder in `Sources/Features` without updating `scripts/sync-to-public.sh`.
    *   **Symptom**: The feature works in development but is completely missing from the public repository and production builds.
    *   **Rule**: **Automated Whitelist Scan**. `architecture-scan.sh` MUST verify every folder in `Sources/Features` exists in the sync whitelist.
    *   **Correction**: Add `copy_safe "Sources/Features/NewFeature"` to the sync script.

130. **Release Integrity Breach**: *(Added v1.0.161)*
    *   **Trigger**: Modifying code (even "minor" scripts) after the release process has begun.
    *   **Symptom**: Public/Private repo divergence, or released executable containing code that was never committed.
    *   **Rule**: **The Clean Slate Protocol**. `release.sh` and `sync-to-public.sh` MUST fail immediately if `git status` is dirty. No overrides allowed.
    *   **Workflow**: Abort release -> Commit changes -> Restart release.

131. **Safe Dependency Injection (The ".task" Race Condition)**: *(Added v1.0.162)*
    *   **Trigger**: Relying on external property injection (e.g., `viewModel.appState = appState`) happening implicitly before async code in `.task` executes.
    *   **Symptom**: "Guest Left" messages appear immediately after joining watch party because the ViewModel failed to inherit the active session (due to nil `appState`) and created a fresh connection.
    *   **Cause**: SwiftUI's `.task` modifier runs asynchronously relative to the view body re-evaluation. If injection happens in `.onAppear` or later in the body, the `.task` block might execute first with nil dependencies.
    *   **Rule**: **Inject First, Then Act**. Any dependency assignment (like `viewModel.appState = ...`) MUST happen at the very top of the `.task` block OR in the `init` method. Never assume `.onAppear` runs before `.task`.
    *   **Fix**: Moved assignment to top of `.task` in `MPVPlayerView.swift`.

143. **Deterministic Player Geometry**: *(Added v1.0.165)*
    *   **Symptom**: The entire player container "jumps" horizontally when toggling chat or when loading overlays appear/disappear.
    *   **Cause**: SwiftUI's ZStack/HStack alignment logic recalculates the center point of the container when its children change their size or safe area properties.
    *   **Rule**: **Lock the Frame**. The player container MUST use a fixed `.frame(width:height:)` derived from a `GeometryReader` rather than relying on flexible spacers or automatic sizing. Use `.alignment(.center)` on the frame to anchor content. (Landmine #143).
    *   **Avoid**: `.ignoresSafeArea()` on full-screen overlays inside the player; it breaks the container's layout boundary.

144. **Visual Continuous-Track Protocol (Smooth Transitions)**: *(Added v1.0.165)*
    *   **Symptom**: Swapping audio/subtitle tracks causes a brief "frozen and stretched" frame of video while the decoder resets.
    *   **Cause**: `libmpv` provides the previous frame during decoder re-initialization. If the aspect ratio or window size has shifted, this frame stretches.
    *   **Rule**: **Hide the Glitch**.
        1.  Immediately set video `opacity = 0` when track selection begins (`isLoading = true`).
        2.  Show a high-quality transition overlay (e.g., "Syncing track...").
        3.  Only reveal video (`opacity = 1`) after `onFileLoaded` or once the synchronization seek has completed.

145. **The "Seek-Shield" Strategy (Hiding Catch-up Jumps)**: *(Added v1.0.165)*
    *   **Symptom**: Video resumes after a sync, but then "skips" forward shortly after, appearing non-seamless.
    *   **Cause**: In Events/Watch Parties, the app performs a snap-seek to catch up with the host/clock. If the loading overlay is cleared *before* the seek completes, the user sees the video jump.
    *   **Rule**: **Finalize Under the Hood**.
        1.  Trigger the catch-up seek while `isLoading` is still `true`.
        2.  Use a `finalizeTrackSwitch()` helper that holds `isLoading` for an extra **300-500ms** after the seek is launched.
        3.  This shields the visual "pop" of the video, making the transition feel perfectly seamless. (Landmine #145).

146. **Authoritative Premium Validation (Trust Time, Not Flags)**: *(Added v1.0.165)*
    *   **Symptom**: User displays the "Crown Emoji" (👑) even after their subscription has expired.
    *   **Cause**: Relying on binary boolean flags like `isPremium` which are prone to stale caches.
    *   **Rule**: **Timestamp Authority**. Always validate specific expiration dates (e.g., `Friend.isReallyPremium` helper checking `expires_at > Now`). (Landmine #146).

147. **The "Interference-Free" Scroll Hint Pattern**: *(Added v1.0.165)*
    *   **Symptom**: Users don't realize a view is scrollable, but adding a banner blocks interaction or feels cluttered.
    *   **Rule**: **Smart Discovery**.
        1. Use a pulsing chevron + text overlay.
        2. Set `.allowsHitTesting(false)` on the overlay so it doesn't hijack scroll/click gestures.
        3. Use a `.simultaneousGesture(DragGesture())` on the ScrollView to dissolve the tip instantly upon interaction. (Landmine #147).

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

### 🛑 Safe Playback Start (Smart Load)
**Pattern**: Prevent "Play-Buffer-Play" flash (Landmine #41) by loading paused.
```swift
// 1. Load PAUSED
player.setPause(true)
player.load(url)

// 2. Wait for tracks (Poll in background)
await waitForTheTracksToLoad()

// 3. Select Tracks (While still paused)
player.selectSubtitle(trackId)

// 4. Resume ONLY if Autoplay
if autoplay { player.setPause(false) }
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
- **Logic**:
  1.  Scans all chains (multi-asset: ETH, USDC, USDT).
  2.  **Swept Fund Reconstruction**: Calculates `NewAmount = (CurrentBalance + TotalSwept) - TotalLoggedHistory`. This ensures payments are detected even after funds have been swept to the Master Wallet.
  3.  Calculates USD value via Coinbase API.
  4.  Grants access:
      - **$4.00+** = 30 days
      - **$7.00+** = 60 days
      - **$10.00+** = 90 days
- **Note**: Actual code thresholds are slightly lower ($3.80/$6.80/$9.80) to account for price fluctuations.

### `sweep-payments` (The "Janitor")
- **Trigger**: Daily cron (9:10 AM UTC).
- **Scanner Logic**:
  - Iterates through `payment_pools` with status `assigned` or `used`.
  - Verifies Private Key against stored Address before processing.
  - Sweeps any balance >$1.50 after ensuring master wallet gas holds.

## 🩺 Payment Symptom Checker (Vitals)
- **Pulse Check**: If `check-payment` finds funds but doesn't credit, check `payment_transactions` for the address.
- **Gas Check**: If sweeps fail, verify Master Wallet has native ETH on the target chain.
- **Key Check**: Run `scripts/derive-xprv.js` with the master seed to verify the derivation chain matches `assign-address`.

## Master Wallet
- **Address**: `0x33E53714ef5dc4d28A5Ea1FD3df16E86cf6223b9`
- **Derivation**: `m/44'/60'/0'/0/0` (Index 0)

## ⚠️ Source of Truth for Premium Status
**Critical:** `LicenseManager.refreshSubscription()` relies on a **HYBRID** check:
1.  **Edge Function** (`check-payment`): Detects *new* incoming crypto transactions.
2.  **Database Profile** (`users.subscription_expires_at`): Persists valid subscriptions and Admin Grants.
3.  **Client-Side Validation** (`LobbyPresenceManager`): **Rule**: Always validate specific expiration dates (`expires_at > Now`). Do NOT trust `is_premium` booleans from the database blindly, as they may be stale due to background job latency. Trust Time, Not Flags.
**Rule:** Always check BOTH. The latest date wins. Never rely solely on the edge function, or Admin Grants will be ignored.

## Payment Stacking & Prestige (Prestige Emojis)
The `check-payment` edge function handles **Stacking** and **Streaks**:

### Stacking Logic
```typescript
let currentExpiry = userData?.subscription_expires_at ? new Date(userData.subscription_expires_at) : new Date()
if (currentExpiry < new Date()) currentExpiry = new Date()  // Reset if expired
const newExpiry = new Date(currentExpiry.getTime() + (daysToAdd * 24 * 60 * 60 * 1000))  // ADDS days
```

### Prestige Logic
- **UI**: Higher tiers (based on internal metrics or manual grant) unlock cooler emoji badges in Chat/Lobby.

**UI:** Premium users see "Extend License" button in Settings when < 365 days remain (`SettingsView.swift`).

---

# Part 4: Server Infrastructure

## Server Access

| Service | Detail |
| :--- | :--- |
| **IP Address** | `151.243.109.243` |
| **SSH User** | `root` |
| **SSH Password** | `4Y76HBYs^OxSQNbIbbfA7C0d` |
| **OS** | Ubuntu 24.04 LTS |

```bash
ssh root@151.243.109.243
```

## Supabase Access

| Component | URL | Credentials |
| :--- | :--- | :--- |
| **Dashboard** | `http://151.243.109.243:3000` | admin / `Vs8HAoo@Rp33rjKFX6xaOe6k` |
| **API** | `https://151.243.109.243.nip.io` | (Anon Key protected) |
| **Database** | Port 5432 | postgres / `uzCXxI6gs7I6tRXMCKJdCzh8` |

### API Keys
- **ANON_KEY**: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzY5NzgzNDkyLCJleHAiOjIwODUxNDM0OTJ9.n-lTY3pLyNnNOggkn1EF41N0KeibKUuiR0AC2SKuUV0`
- **JWT Secret**: `2f838bcacafbdd44a8c777572a5d908ece3a42998d4199abc44d2dd9400b8783`

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

> [!IMPORTANT]
> **DO NOT USE CLI:** `supabase db push` will fail (403 Forbidden). You MUST use the manual protocol below.

**Step 1: Copy file to server**
```bash
expect -c 'spawn scp supabase/migrations/YOUR_MIGRATION.sql root@151.243.109.243:/tmp/migration.sql; expect "password:"; send "4Y76HBYs^OxSQNbIbbfA7C0d\r"; expect eof'
```

**Step 2: Execute on database**
```bash
./remote_exec.sh "cat /tmp/migration.sql | docker exec -i supabase-db psql -U postgres postgres"
```

**One-liner SQL queries:**
```bash
./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"SELECT * FROM users LIMIT 5;\""
```

## Edge Function Deployment
**Protocol:** The `supabase functions deploy` CLI command works LOCALLY but fails relative to the production server. Use this manual update method:

**1. Copy Source to Server Volume**
```bash
expect -c 'spawn scp supabase/functions/[FUNCTION_NAME]/index.ts root@151.243.109.243:/root/supabase/docker/volumes/functions/[FUNCTION_NAME]/index.ts; expect "password:"; send "4Y76HBYs^OxSQNbIbbfA7C0d\r"; expect eof'
```

**2. Restart Functions Container (Hot Reload)**
```bash
./remote_exec.sh "cd /root/supabase/docker && docker compose restart functions"
```

## Edge Functions Location (Reference)
`/root/supabase/docker/volumes/functions/[name]/index.ts`

Functions: `assign-address`, `check-payment`, `sweep-payments`, `cleanup-rooms`, `recover-account`

## Server Backup & Migration

### Overview
The server is **fully containerized** using Docker Compose. All services (Supabase, Edge Functions, Caddy) run in containers. Zilean runs as a native service.

**Current Server Specs:**
- **IP**: `151.243.109.243`
- **Provider**: AnonVM
- **Disk**: 240 GB (using ~31 GB)
- **OS**: Ubuntu 24.04 LTS

### Backup Scripts (Located in repo root)

| Script | Purpose |
|--------|---------|
| `backup-server-to-mac.sh` | Full server backup (~2 min, ~624MB) |
| `restore-to-new-server.sh` | Deploy backup to fresh Ubuntu server |
| `remote_download.sh` | Download files from server |
| `remote_exec.sh` | Execute commands on server |
| `remote_scp.sh` | Upload files to server |

### What Gets Backed Up

| Item | Size | Importance |
|------|------|------------|
| **database.sql** | ~622 MB | 🔴 Critical - all users, payments, streams |
| **docker/.env** | 4 KB | 🔴 Critical - all secrets/API keys |
| **docker/functions/** | ~12 KB | 🟠 High - edge functions |
| **docker/docker-compose.yml** | 13 KB | 🟡 Medium |
| **zilean/*.sh** | ~5 KB | 🟡 Medium - startup scripts |
| **crontab_backup.txt** | 168 B | 🟢 Low - cron jobs |

### Automatic Backups

```
Cron: 0 3 * * * (3:00 AM daily)
Location: ~/Desktop/RedLemon-ServerBackup/
Retention: Last 7 backups kept
Log: ~/Desktop/RedLemon-ServerBackup/backup.log
```

**Note**: Mac must be awake at 3 AM for backup to run.

### Manual Backup

```bash
cd /path/to/RedLemon-Native
./backup-server-to-mac.sh
```

Backups are saved to: `~/Desktop/RedLemon-ServerBackup/redlemon_backup_YYYYMMDD_HHMMSS/`

### Migration to New Server

**Prerequisites:**
- Fresh Ubuntu 22.04/24.04 VPS
- SSH access as root
- Recent backup on Mac

**Steps:**
```bash
# 1. Update password in restore script if needed
nano restore-to-new-server.sh

# 2. Run restore
./restore-to-new-server.sh <new-server-ip>

# Script automatically:
# - Installs Docker
# - Uploads all configs
# - Starts Supabase containers
# - Restores database
# - Sets up Caddy SSL
# - Restores Zilean startup scripts
```

**Post-Migration Checklist:**
1. Test login and data integrity
2. Update `remote_exec.sh` and `remote_scp.sh` with new IP
3. Update this file (AI_BIBLE.md) with new server info
4. Set up Zilean (clone from GitHub, build, run `start_zilean.sh`)
5. Test edge functions (`/system/status`, `/system/disk`)
6. Update DNS if using custom domain

### Zilean Migration

Zilean binary is NOT backed up (large, can be rebuilt). What IS backed up:
- `start_zilean.sh` - Environment variables and startup command
- `maintain_zilean.sh` - Maintenance/janitor script
- `zilean_heartbeat.sh` - Health check script

**To set up Zilean on new server:**
```bash
# 1. Clone Zilean
git clone https://github.com/iPromKnight/zilean /root/zilean_src

# 2. Install .NET 9.0
wget https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --version 9.0.0

# 3. Build Zilean
cd /root/zilean_src
dotnet publish -c Release -o /root/zilean_bin

# 4. Start (script already restored from backup)
screen -dmS zilean /root/start_zilean.sh
```

### Disk Monitoring

The Admin Dashboard Server tab shows real-time disk usage via `/system/disk` edge function.

Stats file updated every 5 minutes: `/root/supabase/docker/volumes/functions/disk_stats.json`

Cron job on server:
```bash
*/5 * * * * /root/update_disk_stats.sh
```

### Docker Containers (Reference)

```
supabase-db          postgres:15.8.1        Database
supabase-auth        gotrue                 Authentication
supabase-rest        postgrest              REST API
supabase-realtime    realtime               WebSocket sync
supabase-edge-functions edge-runtime        Edge Functions
supabase-storage     storage-api            File Storage
supabase-kong        kong                   API Gateway
supabase-pooler      supavisor              Connection Pooling
supabase-studio      studio                 Admin Dashboard
caddy-proxy          caddy:2-alpine         HTTPS/SSL Proxy
```

---

# Part 5: Wallet Secrets

> [!CAUTION]
> **CRITICAL SECURITY INFORMATION**
> These keys control collected funds. Store offline (paper/metal backup).

**Seed Phrase:**
`motion stand mad bullet ozone rifle rare noise pear diary aware act`

**Derivation Paths:**
- **BTC**: `m/84'/0'/0'` (Native Segwit) - *Currently Inactive/Hidden in UI*
- **EVM**: `m/44'/60'/0'` (Standard BIP44) - *Active (Ethereum, Base, etc)*

**XPUBs (Server Config):**
- **XPUB_BTC**: `zpub6rDR8D6hCAkPJ3EC2VzfJRueE3neHxXcniQnxrfAN4iNoQEwbeB4R5Buwom5wuDVHFTKm6ZxPhQ1x3DQ3hXAbXT7fgcXAvnU9sYe5ruGh2M`
- **XPUB_EVM**: `xpub6DW9AXdpfsUqgRwufdH8FQSqnfeyathnpiWbcHyAMrrJPNqiaMxY2EsHMAXj2oyXbEej24kNPF8YDTuuQUEAK1Lo9PjzzjQ85jPsbcMDjzt`

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

## Contact Support
**Email:** `redlemon1272@proton.me`
**Proton ID:** `nInzen-vampym-9desve`

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

### Host Failover (Stream Exclusion / "Try Another")
- **Problem**: The resolved stream is broken, wrong language, or hardcoded subs.
- **Mechanism**: The Host puts the current stream hash into an ephemeral blocklist (`StreamResolver.attemptedHashes`) valid for the app session.
- **Action**: The "Try Another Stream" button forces a re-resolution which explicitly excludes all hashes in this blocklist, guaranteeing a *different* file is selected.

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
5. **Identity Firewall**: The `sync-to-public.sh` script MUST enforce the `redlemon1272` identity. Never manually commit to the public repo; let the script handle the "masking" to prevent private email leaks.

## Release Protocol (The "Satellite-First" Standard)
**Mandatory 10-Step Sequence for AI Assistants:**

1.  **Pre-Flight Integrity**: Ensure repository is 100% clean (`git status`). **DO NOT** release with uncommitted edits. (Landmine #130).
2.  **Architecture Scan**: Run `./scripts/architecture-scan.sh`. Every **ERROR** must be resolved.
3.  **Whitelist Check**: Observe **Check 67** (Air Gap Protocol) in the scan. New features MUST be in `sync-to-public.sh`.
4.  **Fetch & Sync**: Run `git fetch origin --tags` and `git pull origin <current_branch>`.
5.  **Tag Inspection**: Run `git describe --tags --abbrev=0`.
    - *Rule*: Your release version/build MUST be strictly greater than the latest tag.
6.  **User Confirmation**: Present the detected changelog and version to the user. **Wait for confirmation.**
7.  **Atomic Release**: Run `./scripts/release.sh <VERSION> <BUILD> "<li><NOTES></li>"`.
    - *Note*: This script auto-scrubs internal Landmine references.
8.  **Commit Artifacts**: Run `git commit -am "chore: release artifacts v<VERSION>"`.
9.  **Merge & Tag**: (Turbo-ready) Run `./scripts/merge-and-tag.sh v<VERSION>`.
    - *Action*: This merges your feature/release branch into `main`, tags it, and pushes both.
10. **Public Mirroring**: Run `./scripts/sync-to-public.sh` and push to the public repository.
    - *Protection*: This script automatically enforces the `redlemon1272` identity for the public history.

## Anti-Regression Shield (Advisory)
To prevent reintroducing known bugs ("Landmines"), run the architecture scanner during development:
- **Command**: `./scripts/architecture-scan.sh`
- **Checks**:
  - **Landmine #11**: Unsafe `NSLog` usage (Risk: Crash).
  - **Landmine #37**: Case-sensitive ID comparisons (Risk: Ghost Bugs).
  - **Landmine #43**: Optional chaining on `try await` (Risk: Silent Failure).
  - **Legacy Patterns**: `LazyVStack` (macOS 12 Stutter), `DispatchQueue.main` (MainActor Violation).
- **Policy**: Fix **Errors** immediately. Review **Warnings**. Use `// OK` or `// legacy` to suppress false positives.

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
- **Free Users**: 1 room per 24 hours (1 day)
    - *Refund Grace Period*: If a room is closed within 10 minutes, the credit is automatically refunded (to handle setup/technical issues).
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



# Part 19: Satellite-First Release Protocol

> **CRITICAL**: Do NOT release RedLemon unless ALL steps below are green. A broken release requires a manual rollback and database cleanup.

## 1. The Pre-Flight Checklist (Automated)
Before touching any build scripts, the code MUST pass the **Regression Prevention System**.
1.  **Architecture Scan**: Run `./scripts/architecture-scan.sh`.
    *   **Pass**: "✅ ERRORS: 0"
    *   **Fail**: Any error stops the release. Fix the code.
2.  **Landmine Tests**: Run `export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$(pwd)/Frameworks && swift test --filter LandmineTests`.
    *   **Pass**: All tests passed.
    *   **Fail**: A known logic bug has regressed. Fix the code.
3.  **Security Scan**: Run `./scripts/security-scan.sh`.
    *   **Pass**: No hardcoded secrets found.

## 2. The Build Process (`release.sh`)
The `./scripts/release.sh` script handles the heavy lifting, but you must invoke it correctly.
*   **Command**: `./scripts/release.sh "v1.0.X" "<li>Release Note 1</li><li>Release Note 2</li>"`
*   **What it does**:
    1.  Bumps `CFBundleVersion` in `Info.plist`.
    2.  Compiles the Release Build (Optimized).
    3.  Signs the binary with "Developer ID Application".
    4.  Notarizes the app with Apple (Staples ticket).
    5.  Generates the Sparkle `appcast.xml` and `delta` updates.

## 3. Deployment & Sync
*   **Upload**: The script syncs the `appcast.xml` and `.dmg` to the production server via `rsync`.
*   **Documentation**:
    *   Update `README.md` with the new Version and Build Number.
*   **Save State**:
    *   Commit the changes: `git commit -am "chore: release v1.0.X"`
    *   **Push**: `git push origin <current_branch>`

## 4. Finalize: Merge & Tag
*   **Command**: `./scripts/merge-and-tag.sh v1.0.X`
*   **Action**: This script automatically:
    1.  Merges the current feature branch into `main`.
    2.  Tags the release with `v1.0.X`.
    3.  Pushes both `main` and the tag to origin.
    4.  Returns to your original branch.

## 5. DISTRIBUTION: The Anti-Gravity Protocol (Bypassing Quarantine)
To avoid the $99/year Apple Tax and Gatekeeper warnings without degrading UX, we use a **Terminal Installer**.

### The "Magic" Command
Instead of downloading the DMG directly, users run this:
`curl -sL https://151.243.109.243.nip.io/updates/install | bash`

### How it works
1.  **Curl Bypass**: `curl` does not apply the `com.apple.quarantine` attribute to downloaded files (unlike Safari/Chrome).
2.  **Script Logic**:
    *   Downloads the DMG via `curl`.
    *   Mounts and copies `RedLemon.app` to `/Applications`.
    *   **Nuclear Option**: Runs `xattr -cr /Applications/RedLemon.app` to strip any lingering attributes.
    *   Launches the app immediately.

### Deployment of the Magic Script
1.  The script is located at `./install_redlemon.sh`.
2.  Deploy it to the server: `scp install_redlemon.sh root@151.243.109.243:/root/updates/install`.
3.  The User-Facing URL is: `https://151.243.109.243.nip.io/updates/install` (proxied as `/install`).

---

## Part 20: Stability & Polish Protocol (Mac Native)
...

# Part 21: Social & Cloud Sync Patterns

## Secure Cross-User Data Access
To protect user privacy while enabling social features, RedLemon uses a "Private-by-Default, Social-by-Exception" architecture.

1.  **Write Operations**: MUST be signed by the user and verified via `verify_user_signature` in the RPC.
2.  **Private Read**: Standard RLS allows users to see their own data via direct table queries.
3.  **Social Read**: Accessing a friend's records MUST use dedicated RPCs (`fetch_user_library`, `fetch_user_watch_history`) that bypass RLS using `SECURITY DEFINER`. These RPCs are "relaxed" (no signature required for read-only access) to facilitate seamless profile viewing.

## Cloud Sync Synchronization (SyncManager)
The `SyncManager` facilitates a "Newest Wins" merge strategy between local `UserDefaults` and the Supabase cloud.

- **Deduplication Key**: Always strip season/episode suffixes for the "Top Level" view.
- **Sync Trigger**: Full sync happens during app startup (after identity is verified) and after local changes are persisted.
- **Payload Integrity**: The full `MediaItem` metadata is stored as `JSONB` in the cloud to prevent "Lite Model" hydration issues on secondary devices.

---


### 1. The "Horrific Closing Animation" (Landmine #82)
**Symptom**: User sees window jitter, layout "jumps", or a flash of the loading screen when exiting solo playback.

**Root Cause**: Conflict between the macOS native fullscreen exit animation and SwiftUI layout switches (like showing the Sidebar or `restoreWindowSize()`).
**Mandatory Fix (Satellite Protocol)**:
1. **Idempotency Guard**: Always `guard showPlayer else { return }` at the top of `exitPlayer` to prevent double-triggers (e.g. from `onDisappear` + click).
2. **Sequential Transitions**:
   - `exitFullscreen()` MUST be called first.
   - For **ALL Fullscreen Exits** (including Watch Party Failovers/Restarts), a **0.3s delay** (`Task.sleep`) MUST be injected *after* `exitFullscreen` and *before* setting `showPlayer = false`. This allows the OS window animation to start smoothly before the view hierarchy changes. Without this, restarting the player immediately on a "fluid" window causes the "Zoomed In" UI bug.
   - Set `isExitingSession = true` in the UI view model to provide a "Closing..." overlay and cinematic (blur/scale) visual during this delay.
   - **Never** call `restoreWindowSize()` if the window was previously in fullscreen; the OS handles the frame restoration. Calling it manually causes a competing animation.

### 2. State Snapshots
When performing async cleanup (WS disconnect, DB updates), always capture property snapshots (e.g. `let wasEvent = isEventPlayback`) at the VERY START of the function. This prevents logic errors if the underlying properties are modified by subsequent `MainActor.run` blocks during the delay.

## Part 22: Connectivity & Provider Protocol

### 1. The "Ghost Offline" Bug (Landmine #83)
**Symptom**: A third-party provider (SubDL, Real-Debrid) reports "Offline" or fails to load, even though the website works in a browser.

**Root Cause**:
1. **Cloudflare WAF**: Providers using Cloudflare (like SubDL) often block headless `URLSession` requests that lack a standard `User-Agent`.
2. **Aggressive Timeouts**: Using very short timeouts (e.g. 3s) for health checks. While "fail fast" is good, cold APIs or global CDN hops often require 5-10s for the first byte.

**Mandatory Solution**:
1. **Mandatory User-Agent**: EVERY `URLRequest` to a third-party API MUST set a standard browser User-Agent:
   `request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36...", forHTTPHeaderField: "User-Agent")`
2. **Realistic Timeouts**:
   - Pre-flight/Health checks: **10s** minimum.
   - Resource Search/Download: **15s** minimum.
3. **Task Cancellation Safety**: When using `withThrowingTaskGroup` for time-boxed tasks (like attaching subtitles), ensures the `Task.sleep` duration allows for the network request to actually succeed (8-10s).

### 2. The "False EOF" Loop (Landmine #89)
**Symptom**: In Watch Parties, when the Host skips to the end, the player attempts to retry/restart the movie instead of returning to the lobby. Guests correctly return to the lobby.

**Root Cause**: MPV Quirk. When seeking to the very end, MPV's `currentTime` can reset to `0.0` milliseconds before the `END_FILE` event fires. The existing "Suspicious EOF" logic (which checks if progress < 95%) sees `0%` progress and flags it as a `Transient EOF Glitch` (error), triggering the `PlayerViewModel` retry logic.

**Mandatory Solution**:
1. **Track Last Good Position**: `MPVWrapper` MUST maintain a `lastKnownGoodPosition` property that updates whenever `currentTime` advances.
2. **Effective Position Calculation**: During `END_FILE` handling, use `max(currentTime, lastKnownGoodPosition)` as the effective position for progress calculations.
3. **Reset**: Always reset `lastKnownGoodPosition = 0` when starting a new file.

## Part 21: Critical Async Patterns

### 1. The Deinit Cleanup Trap (Landmine #63)
**Context**: You need to perform a network cleanup action (e.g. `leaveChannel`) when a View Model or Actor is deinitialized (e.g. user taps "Back").

**The Trap**: A standard `Task { }` inside `deinit` will be implicitly cancelled or fail to execute because the parent context is dying. `[weak self]` is already nil, and `[strong self]` can create erratic race conditions.

**Mandatory Solution**:
1.  **Use `Task.detached`**: This creates a new top-level task independent of the dying actor's lifecycle.
2.  **Capture Dependencies Strong**: Explicitly capture the **Dependency** (e.g. `realtimeManager`) strongly, NOT `self`.
3.  **Fire and Forget**: The task ensures the dependency lives just long enough to send the final message.

```swift
deinit {
    // ❌ WRONG: Task is cancelled immediately or self is nil
    // Task { await self.realtimeManager.disconnect() }

    // ✅ CORRECT: Detached task with captured dependency
    if let manager = realtimeManager {
        Task.detached {
            // Manager is kept alive by this closure just long enough
            await manager.disconnect(leaveChannel: true)
        }
    }
}

---

## Part 23: Security & RLS Protocol

### 1. The "Anonymous Writer" Trap (Landmine #103)
**Symptom**: Guests (and sometimes hosts) report being "connected" to chat but invisible to the room, or they see "403 Forbidden" or "RLS violation" in the console when joining/syncing.

**Root Cause**: Postgres Row Level Security (RLS) policies on tables like `room_participants` and `rooms` require cryptographic proof of identity. If `SupabaseClient` makes a standard `POST`, `PATCH`, or `DELETE` request WITHOUT a signature, the database rejects the row insertion/update even if the JWT is valid.

**Mandatory Solution**:
1. **Always Sign Writes**: Every database mutation (`POST`, `PATCH`, `DELETE`) in `SupabaseClient.swift` MUST include `sign: true` in the `makeRequest` call.
2. **Identity Header**: This ensures the `x-identity-signature` and `x-identity-id` headers are injected, proving to the database that the sender owns the UUID they are claiming to be.
3. **Graceful Fallback**: The `makeRequest` signature logic MUST handle cases where `auth.currentUser` is temporarily nil by reconstructing from the Keychain (Landmine #88).

```swift
// ✅ CORRECT: Signed mutation for RLS compliance
_ = try await makeRequest(
    path: "/room_participants",
    method: "POST",
    body: body,
    sign: true // 🔐 SECURE: Identity verification
)
```

---

## Part 24: Intelligent Stream Exclusion (The "Hydra" Protocol)

### 1. The Hydra Duplicate Loop (Landmine #105)
**Symptom**: Clicking "Try Another Stream" re-selects the same problematic file or a file from the same release group (e.g. seeing "FLUX" again and again). This is common for movies where one bad release is mirrored across many torrent sites.

**Root Cause**:
1. **Hash Transparency**: Streams from `DebridSearch` often lack an `infoHash` until resolved. If `PlayerViewModel` only blocks hashes, hashless streams bypass the filter completely.
2. **The "Hydra" Effect**: One release group (e.g. FLUX) might have 50 different torrents for the same movie. Blocking one by hash or exact title just selects the next one with a slightly different name.
3. **Dirty Input**: Titles passed from the UI often contain newlines, emojis, or size metadata (e.g. `Movie.FLUX.mkv\n💾 8GB`) which causes simple string matches to fail.

**Mandatory Solution**:
1. **Never Return Early on Nil Hash**: `PlayerViewModel.tryAnotherStream` MUST call `markStreamAsAttempted` even if the hash is nil.
2. **Four-Layer Defense**:
    - **Hash Block**: Prevent exact torrent duplication.
    - **Fuzzy Title Block**: `Stream.normalizeTitle` (remove extensions, punctuation) to block identical filenames.
    - **Release Group Block**: Extract the donor group (e.g. `-FLUX`) and ban the entire group for the session.
    - **Size Block**: Block files with identical size strings (e.g. `8.04 GB`) as they are likely mirrors.
3. **Sanitize First**: Always split titles by `.newlines` and take the first component before extraction.

```swift
// ✅ CORRECT: Multi-layered exclusion check in StreamResolver
var filtered = streams.filter { stream in
    if let hash = stream.infoHash, excludedHashes.contains(hash) { return false }
    if excludedTitles.contains(Stream.normalizeTitle(stream.title)) { return false }
    if let group = extractGroup(stream.title), excludedGroups.contains(group) { return false }
    if let size = stream.size, excludedSizes.contains(size) { return false }
    return true
}
```

---

## Part 25: Parallel Delivery & Subtitle Latency

### 1. Subtitle Delivery Race (Landmine #109)
**Symptom**: Subtitles are found quickly by the server, but take 15-20 seconds to appear in the player's menu after the video starts.

**Root Cause**:
1. **Sequential Loading**: The `SubtitleService` originally downloaded external subtitles one-by-one in a `for` loop. If 5 subtitles were found and each took 2s, that's a 10s base delay.
2. **Polling Latency**: The `scanEmbeddedTracks()` function relied on a fixed 5-second polling loop to detect when MPV finished loading external files. This added another 5s of dead air.

**Mandatory Solution**:
1. **Parallel Downloads**: Use `withTaskGroup` to download all external subtitles simultaneously.
2. **Reactive Menu Updates**: Do NOT rely on polling. Observe the MPV `track-list` property and trigger an immediate scan when it changes.
3. **Internal Observer**: `SubtitleService` must subscribe to `mpv.tracksChangedPublisher` to refresh its `availableTracks` list instantly.

```swift
// ✅ CORRECT: Reactive track observation in SubtitleService
observers.append(Task { [weak self] in
    for await _ in mpv.tracksChangedPublisher.values {
        // Immediate update when MPV registers a new track
        await self?.scanEmbeddedTracks(isFastPath: true)
    }
})
```

---

## Part 26: CDN & Header Enforcement

### 1. CDN User-Agent Enforcement (Landmine #110)
**Symptom**: Subtitle downloads from providers like SubDL fail with 403 Forbidden or 503 Service Unavailable, even though the URL is valid.

**Root Cause**: SubDL's CDN (and many others) explicitly block requests that do not specify a common Browser User-Agent. Default `URLSession` headers are flagged as "Bot" or "Scraper".

**Mandatory Solution**:
1. **Standard Headers**: Every subtitle download request MUST specify a modern browser User-Agent (e.g., Chrome/MacOS).
2. **Longer Timeouts**: CDN propagation and ZIP extraction can be slow. Use a minimum **30s timeout** for subtitle CDN requests.

```swift
// ✅ CORRECT: SubDL Request Headers
var request = URLRequest(url: url)
request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) ...", forHTTPHeaderField: "User-Agent")
request.timeoutInterval = 30
```

---

## Part 27: Performance & Parallelism Protocol

### 1. Horizontal Scroll Overdraw (Landmine #111)
**Symptom**: The Browse page feels "heavy", navigation jitters, and the Swift compiler takes a long time (or fails) on the View body.
**Root Cause**: **"The Rows of Death"**. Rendering multiple (10+) nested horizontal `NSScrollView` or `ScrollView` instances inside a vertical list forces the system to maintain many off-screen layout contexts. On macOS, this leads to event contention and frame drops.
**Mandatory Solution**:
1. **The Grid Pivot**: If a page requires more than 3-4 horizontal segments, pivot to a **Single Grid Layout with a Service Selector**.
2. **Lazy Rendering**: Use `LazyVGrid` with `adaptive` columns for the main content. This limits the active view hierarchy to only what is visible.

### 2. The Parallel Dispatch Mutation Trap (Landmine #112)
**Symptom**: Build Error: `main actor-isolated property 'X' can not be mutated from a non-isolated context` when using `async let`.
**Root Cause**: `async let` closures (e.g. `async let task: Void = { ... }()`) execute in a non-isolated detached context. Even if the parent `init` or method is `@MainActor`, the closure itself is not. Direct mutations of `@Published` properties within these closures will fail.
**Mandatory Solution**:
1. **Capture Weakly**: Always use `[weak self]` in the closure to prevent retain cycles.
2. **Local Variables**: Perform fetching/processing into local variables.
3. **MainActor Commitment**: Use `await MainActor.run { self?.property = localResult }` to commit changes back to the UI state.

```swift
// ✅ CORRECT: Parallel loading with MainActor commitment
async let loadHero: Void = { [weak self] in
    let results = try await fetch()
    await MainActor.run { [weak self] in
        self?.data = results
    }
}()
```

### 3. The Emoji Spacing Bug (Landmine #113)
**Symptom**: After inserting an emoji into a chat input, subsequent normal text has "huge spaces" between words (e.g., "I    want    to    go").
**Root Cause**: **Attribute Leakage**. `NSTextView` (and SwiftUI `TextField` on macOS) can "poison" its `typingAttributes` using metrics from the emoji fallback font (Apple Color Emoji). This often includes wide kerning or tracking values that persist even when typing normal characters.
**Mandatory Solution**:
1. **Disable Rich Text**: Set `textView.isRichText = false` and `textView.importsGraphics = false`.
2. **Hard Reset Attributes**: Explicitly reset `typingAttributes` and `textStorage` attributes to include `.kern: 0.0`.
3. **Avoid SwiftUI `TextField(axis: .vertical)`**: On macOS 13+, the vertical auto-growing TextField is prone to this and lacks low-level control. Use a custom `NSTextView` wrapper instead.

```swift
// ✅ CORRECT: Sanitizing NSTextView attributes
let attributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 13),
    .foregroundColor: NSColor.white,
    .kern: 0.0 // Key fix for emoji spacing
]
textView.typingAttributes = attributes
```

### 4. The Subtitle Availability Gap (Landmine #114)
**Symptom**: Subtitles don't appear in the menu on first load, or they appear in the menu but can't be selected/don't display.
**Root Cause**:
1. **Concurrency Race**: `Smart Load` timeout (previously 8s) is shorter than proxy download/unzip/VTT conversion time (can be 20s+).
2. **Encoding Mismatch**: SubDL files are often `Windows-1252` or `Latin-1`. Standard UTF-8 decoding results in empty tracks.
3. **Selection Guard**: `refreshSubtitleSelection` blocking updates during playback to prevent "flicker" stops late-arriving subs from auto-enabling.
**Mandatory Solution**:
1. **Extended Timeout**: Use at least 15s in `pollForTracksAndResume` when external subs are expected.
2. **Robust Decoding**: Attempt multiple encodings in `SubtitleService` (UTF8 -> CP1252 -> Latin1).
3. **Dynamic Engagement**: Allow `refreshSubtitleSelection` during playback IF no track is currently active (`sid == 0`).

```swift
// ✅ CORRECT: Allowing late-arrival engagement
if isPlaying && hasCompletedInitialTrackSelection && getCurrentSubtitleTrack() != 0 {
    return // Only block if we already have a track (preventing flash)
}
```

### 5. The Playlist Sync Race (Landmine #115)
**Symptom**: Host switches a playlist item and then immediately clicks "Start". Guests play the *previous* item.
**Root Cause**: **Causal Inconsistency**. When the host switches items and then starts playback rapidly, guests may receive the "Start" signal and fetch the room state before the previous playlist update has finished propagating across database clusters.
**Mandatory Solution**:
1. **Host Interlock**: Implement an `isPlaylistSyncing` flag in `LobbyViewModel`.
2. **Artificial Delay**: Set the flag to `true` when switching items and wait at least **800ms** after the DB update completes before setting it back to `false`.
3. **UI Blocking**: Disable the "Start Playback" button while `isPlaylistSyncing` is active.

```swift
// ✅ CORRECT: Delaying start for propagation
try await self.dataService.updateRoomPlaylist(...)
try? await Task.sleep(nanoseconds: 800_000_000) // 800ms grace period
self.isPlaylistSyncing = false
```

### 6. The One-Shot Logger (Landmine #116)
**Symptom**: `Illegal Instruction: 4` or `EXC_BAD_INSTRUCTION (SIGILL)` during app startup or after a logout/login cycle.
**Root Cause**: Calling `LoggingSystem.bootstrap(_:)` more than once. Swift's `swift-log` architecture throws an assertion failure if you attempt to customize the logging backend after it has already been initialized. This often happens if the `HTTPServer` (which initializes logging) is re-instantiated.
**Mandatory Solution**: Wrap the bootstrap call in a static guard to ensure it only runs once per app execution.

```swift
// ✅ CORRECT: Static guard for logging initialization
private static var isLoggingInitialized = false

init() throws {
    if !Self.isLoggingInitialized {
        try LoggingSystem.bootstrap(from: &env)
        Self.isLoggingInitialized = true
    }
}
```

## Part 28: Subtitle Reliability & Sync Protocol

### 1. Subtitle Scoring & Sync (The "TELESYNC Trap") (Landmine #117)
**Symptom**: Guest shows poor quality subtitles (CAM/TS) while Host shows high-quality ones, or Guest shows "No Subtitles" despite Host selection.

**Root Cause**:
1. **Sync Inconsistency**: Guests originally only received the movie title. Without the full release name (e.g., `Now.You.See.Me.2.2016.1080p.BluRay.x264.DTS-JYK`), the search hint is too weak to find exact release matches.
2. **Scoring Lenience**: The SubDL scoring was too relaxed regarding quality sources. It would match TELESYNC subtitles to high-quality streams because they both had "1080p", failing to apply a strong penalty for the source mismatch.
3. **Noisy Hints**: PirateBay and Debrid stream titles often contain emojis (`💾`, `🎬`, `⚡️`) and newlines that break simple string matching on the server.

**Mandatory Solution**:
1. **Sync Full Context**: `LobbyEventRouter` MUST synchronize the full `source_quality` (Release Name) to the guest's session.
2. **Aggressive Penalties**: SubDL scoring MUST apply massive penalties (at least **-300**) for source mismatches (e.g., CAM/TS subtitle for a WEBRip stream).
3. **Hint Cleaning**: The server MUST strip newlines and emojis from stream hints before matching.
4. **Digital Interoperability**: Treat `webrip`, `web-dl`, and `webdl` as interchangeable to avoid false penalties between similar digital releases.

```swift
// ✅ CORRECT: Cleaning hints in SubDLClient
streamFile = streamFile.replacingOccurrences(of: "💾", with: "")
    .replacingOccurrences(of: "\n", with: " ")
    .trimmingCharacters(in: .whitespacesAndNewlines)

// ✅ CORRECT: Stricter source penalty
if subHas && !streamHas {
    score -= 300 // Strong penalty for mismatch}

### 2. The Subtitle "Healing Loop" (Landmine #118)
**Symptom**: Movie starts with "No Subtitles" or misses specific release matches because SubDL was slow or "Offline" (timed out) at the exact moment of playback start.
**Root Cause**: **Synchronous Dependency**. The initial playback sequence ("Smart Load") allows ~8-12 seconds for subtitles. If SubDL is having a cold start or latency spike, it may fail the initial window but be perfectly ready 5 seconds later. Without a background retry mechanism, the user is "stuck" with no subtitles unless they restart the whole movie.
**Mandatory Solution**:
1. **Background Refresh Method**: `PlayerViewModel` MUST implement `manualRefreshSubtitles()` which performs a deep search and injects results into the *active* stream.
2. **Context-Aware Trigger**: `AppState.checkProviderHealth()` MUST automatically trigger `player.manualRefreshSubtitles()` if it detects a healthy SubDL status while media is playing.
3. **Deduplication**: The injection logic MUST use a Set or key matching (`id` or `URL`) to prevent duplicate tracks in the player menu.
4. **No-Stop Injection**: Subtitles MUST be injected into the existing `selectedStream.subtitles` array. SwiftUI's reactivity will update the player menu on-the-fly without interrupting playback.

```swift
// ✅ CORRECT: Healing Loop Trigger in AppState
await MainActor.run {
    self.isCheckingProviders = false
    if self.player.selectedStream != nil {
        Task { await self.player.manualRefreshSubtitles() }
    }
}
```
```
## Part 29: Modern Concurrency & Resource Safety

### 1. Actor Initialization Deadlock (Landmine #119)
**Symptom**: The app hangs indefinitely on launch or during specific actions (like fetching credentials), often with 0% CPU usage. The stack trace shows an actor waiting on a `Task`.
**Root Cause**: **Isolation Inheritance**. When you create a `Task { ... }` inside an actor's method (even an `async` one), that Task inherits the actor's isolation context. If the actor then `await`s that Task, it creates a deadlock: the Actor is blocked waiting for the Task, but the Task cannot start because it needs the Actor's lock (which is held by the `await`).

**Mandatory Solution**:
1.  **Detach the Task**: Use `Task.detached { ... }` to break the isolation inheritance.
2.  **Capture Self Weakly**: Since it's detached, you must capture `[weak self]` to avoid retain cycles and safely access the actor.

```swift
// ❌ WRONG: Creates a deadlock
let task = Task {
    await self.loadFromCache() // Inherits isolation, waits for lock -> DEADLOCK
}
await task.value

// ✅ CORRECT: Detached execution
let task = Task.detached { [weak self] in
    guard let self = self else { return }
    await self.loadFromCache() // Enters actor 'from outside' -> SAFE
}
await task.value
```

### 2. Network Client Resource Exhaustion (Landmine #120)
**Symptom**: The app becomes unresponsive after navigating between views 5-10 times. Network requests start timing out or failing with "Too many open files" or connection limits.
**Root Cause**: **Instance Proliferation**. Creating a new instance of a network client (e.g., `LocalAPIClient()`) often initializes a new `URLSession`. `URLSession` is expensive and holds system resources. Creating one for every View struct (which are recreated frequently in SwiftUI) rapidly exhausts system file descriptors and threads.

**Mandatory Solution**:
1.  **Enforce Singletons**: Always use a shared instance (`.shared`) for stateless API clients.
2.  **Stateless Clients**: Ensure the client itself doesn't hold request-specific state (like `currentRequest`), allowing it to be safely shared.

```swift
// ❌ WRONG: Creates a new URLSession every view render
@StateObject var client = LocalAPIClient()

// ✅ CORRECT: Reuses the system-optimized session
let client = LocalAPIClient.shared
```

### 3. Visual Continuity Protocol (Landmine #121)
**Symptom**: Screens "flash" (white/empty) or content jumps (spinner -> text) during navigation. This creates a "web-app" feel rather than a native feel.
**Root Cause**: **Pessimistic Rendering**. Waiting for "perfect" data (metadata/high-res images) before showing *anything*. Using `if isLoading { ProgressView() } else { Content() }` causes a layout shift when loading completes.

**Mandatory Solution**:
1.  **Optimistic Rendering**: Immediately display data passed from the previous screen (e.g., `mediaItem.name`, `mediaItem.poster`) while the high-res metadata loads.
2.  **Layered Loading**: Place the high-res content *over* or *replace* the low-res content without changing the layout geometry.
3.  **No Full-Screen Spinners**: Never hide the main content structure behind a spinner for metadata loading. Use skeleton loaders or just show the title text.

```swift
// ❌ WRONG: Flashy transition
if isLoading {
    ProgressView()
} else {
    AsyncImage(url: meta.logo)
}

// ✅ CORRECT: Visual Stability
ZStack {
    // Show passed title immediately (always visible or fallback)
    Text(mediaItem.name)

    // Fade in logo when ready
    if let url = meta?.logoURL {
        AsyncImage(url: url)
    }
}
```


### 4. Supabase Exhaustion (Landmine #122)
**Symptom**: App suddenly stops receiving real-time updates (chat, sync) or shows "PostgREST error: connection limit reached."
**Root Cause**: **WebSocket Proliferation**. Multiple `SupabaseRealtimeClient` or `RealtimeChannelManager` instances created without proper cleanup (`leave()`). Each instance holds a persistent WebSocket.
**Mandatory Solution**:
1. **Reference Counted Managers**: Managers MUST be shared singletons or tied strictly to a `NavigationStack` lifecycle.
2. **Atomic Cleanup**: Always call `manager.cleanup()` in `deinit` or `onDisappear` using the `Task.detached` pattern (Landmine #63).

### 5. The Subtitle Deduplication Hydra (Landmine #123)
**Symptom**: The subtitle menu shows the same track name multiple times (e.g., "English", "English", "English (SDH)").
**Root Cause**: **Resolver Pulse Mismatch**. The "Healing Loop" or parallel stream resolutions might return the same subtitle metadata with slightly different internal IDs or regional tags (`.en-US` vs `.en-UK`).
**Mandatory Solution**:
1. **Aggressive Normalization**: `SubDLClient.normalizeReleaseName` MUST strip extensions (`.srt`), language tags (`.en`, `.en-US`), and flavors (`.sdh`, `.forced`).
2. **Composite Deduplication**: Every subtitle collector MUST deduplicate using a composite key: `\(language.lowercased())_\(normalizedReleaseName)`.
3. **In-Flight Guard**: `SubtitleService` MUST maintain a `loadingUrls` Set to block redundant downloads of the same URL.

### 6. Resolution Cache Protocol (Landmine #124)
**Symptom**: Slow UI response or "Provider Offline" errors when clicking the same movie twice in rapid succession.
**Root Cause**: Redundant resolver pings to external APIs (SubDL/RD) causing rate-limiting or race conditions in track attachment.
**Mandatory Solution**: Implement a **Resolution Cache** with a **5-second TTL**. If the exact item + quality is requested again within 5s, return the previous `StreamResolutionResult` immediately.

### 7. The Activity Shield Protocol (Landmine #125)
**Symptom**: Navigating from Lobby A to Lobby B causes the Lobby A timer to suddenly "pull" the user back or start media for the wrong room.
**Root Cause**: Background tasks (Timers/Tasks) surviving across navigation and modifying global state.
**Mandatory Solution**:
1. **Mandatory Handoff**: `AppState` MUST use `setActiveLobbyViewModel()` to transition between lobbies. This helper handles the cleanup of the outgoing instance.
2. **Shield Check**: Every background task modification MUST be guarded by `if appState.activeLobbyViewModel === self { ... }`.

---

# Part 19: The Satellite Release Workflow (Full Protocol)

> **Mandatory Rule**: All releases MUST follow this strict sequence. Deviating from this protocol risks leaking IP or shipping unstable builds.

### 🤖 AI Assistant Quick Reference (The Release Chain)
If you are asked to "Release" or "Sync to Public", run these commands in this EXACT order:
1.  `./scripts/architecture-scan.sh` (Verify architectural stability)
2.  `./scripts/security-scan.sh` (Verify no leaked secrets or IPs)
3.  `swift build` (Ensure the project compiles successfully)
4.  `./scripts/release.sh "[v]" "[b]" "[notes]"` (Build & Deploy Internal)
5.  `./scripts/sync-to-public.sh` (Scrub & Prepare Public Mirror)
6.  `./scripts/sync-to-public.sh` (Scrub & Prepare Public Mirror)
7.  `./scripts/merge-and-tag.sh "v[v]"` (Merge to main and Tag)
8.  `./scripts/github-release.sh "v[v]" "RedLemon-Installer.dmg" "[notes]"` (Final Artifact Upload)

### 🤖 Terminology & Intent (Command Word Safety)
To prevent accidental public deployments, strict keywords are enforced:
*   **"PUSH"** = **Private Only**.
    *   *Action*: `git add` + `git commit` + `git push`.
    *   *Effect*: Saves code to the private repo (backup). Users see nothing. Public repo untouched.
*   **"RELEASE" / "SHIP"** = **Public Deployment**.
    *   *Action*: Full satellite chain (`release.sh` + `sync-to-public.sh`).
    *   *Effect*: Updates the app for 500+ users and pushes source to GitHub. **Use with caution.**

---

### 19.1 Pre-Flight Verification
Before starting any release, ensure the environment is clean and verified.
1.  **Architecture Scan**: Run `scripts/architecture-scan.sh`. Zero failures allowed.
2.  **Version Check**: New Build Number must be an integer strictly greater than the one in `README.md`.
3.  **Clean State**: Check `git status` to ensure no uncommitted local changes exist in the private repo.

### 19.2 Step 1: The "Dark Build" (Internal Deployment)
Execute the release script in the private repository. This builds the full app (including secret sauce), signs it, and deploys it to the update server.
```bash
./scripts/release.sh "[VERSION]" "[BUILD_NUMBER]" "<li>[Note 1]</li><li>[Note 2]</li>"
```
*   **Result**: RedLemon is live on the Sparkle update channel for existing users.

### 19.4 Step 4: The Public Distribution (GitHub Release)
**Mandatory Enforcement**: Once the tag is pushed and the public repo is synced, you MUST instantiate the GitHub Release object. This is no longer optional or manual.
```bash
# Automated release and DMG upload
export GH_PAT="[BIBLE_PAT]"
./scripts/github-release.sh "v[VERSION]" "RedLemon-Installer.dmg" "### Release Notes\n* [Notes]"
```
*   **Trust Verification**:
    - The public `install.sh` points to `https://github.com/redlemon1272/RedLemon/releases/latest/download/RedLemon.dmg`.
    - This ensures users are downloading the EXACT binary you uploaded to GitHub, verified by GitHub's SSL.

### 19.6 Operational Security (OpSec)
When drafting release notes or public documentation:
*   **NO Bible References**: Never mention the AI Bible, Landmines, or internal part numbers.
*   **No Secret Sauce**: Do not describe the internal mechanics of `StreamResolver` or sync algorithms.
*   **Identity Masking**: NEVER push to the public repository using a private git identity. All public commits MUST explicitly override the author and email to `RedLemon <redlemon1272@users.noreply.github.com>` via `-c user.name` and `-c user.email` git flags.
*   **User-Facing Only**: Describe features (e.g., "Improved Watch Party stability") without revealing the "how".
*   **Privacy First**: Explicitly point users to `LoggingManager.swift` to verify the "Zero Telemetry" claim.

### 19.7 Maintenance & Day-to-Day Development
To keep development seamless while maintaining the public mirror:
1.  **Workhorse Repo**: All code, logic, and Bible updates happen EXCLUSIVELY in `RedLemon-Native`.
2.  **Display Repo**: `RedLemon-Public` is a *read-only mirror*. Never write code directly in the public repo.
3.  **Sync Frequency**: Run `scripts/sync-to-public.sh` during every release or significant UI update.
4.  **Issue Triage**: Bug reports from the public repo should be converted into tasks in the private repo.
5.  **New Files**: Whenever a new `.swift` file is added to the UI, you MUST add its path to the `SAFE_FILES` whitelist in the sync script or it will not appear in the public repo.

### 19.8 The Conflict Deadlock Interlock (Hard Protocol)
**Mandatory Enforcement for AI Assistants**:
1.  **Stop Condition**: If `./scripts/merge-and-tag.sh` or any command in the release sequence fails with a code (e.g., Git Conflict), you **MUST STOP IMMEDIATELY**.
2.  **No Surgical Repairs**: Performing `replace_file_content` or any manual line-edits to resolve conflicts during a release state is **STRICTLY FORBIDDEN**.
3.  **Rationale**: A release is a "Perfect State" build. Manual edits introduced by an AI during a merge are not subject to the full review cycle and can bypass the "Satellite-First" integrity checks.
4.  **Action**: Report the conflict to the USER. Provide the `git status` output and wait for the USER to manually resolve the conflict or authorize a specifically named resolution.

---

### 19.9 Public Repo Automation & Credentials
To manage the `redlemon1272/RedLemon` public repository, use the automated deployment system.

**Credential (GH_PAT)**:
The following token is a "No Expiry" fine-grained PAT with `repo:contents` access for the public RedLemon repo.
`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`

**Automated Deployment Command**:
```bash
export GH_PAT="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"
./scripts/public-deploy.sh
```

**Automated Release Creation**:
Creating a tag is not enough. You must instantiate a **GitHub Release** object for the download link to appear.
```bash
# Create GitHub Release for v1.0.X
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/redlemon1272/RedLemon/releases \
  -d '{"tag_name":"v1.0.X","target_commitish":"main","name":"v1.0.X","body":"### Release Notes\n* [Note 1]\n* [Note 2]\n\n**Download**: [RedLemon.dmg](https://github.com/redlemon1272/RedLemon/releases/latest/download/RedLemon.dmg)","draft":false,"prerelease":false,"generate_release_notes":false}'
```

**Scrubbing Enforcement**:
The `public-deploy.sh` script (invoking `sync-to-public.sh`) is the **ONLY** way to push to public. It enforces:
*   Global replacement of `AI_BIBLE` with `Internal Note`.
*   Global replacement of `Landmine` with `Security Check`.
*   Sanitization of Supabase keys and IPs.
*   Replacement of private hero links with local `Resources/` links.

---



## Part 30: Resource & Asset Management Protocol

### 1. The "Invisible Asset" Trap (Landmine #130)
**Symptom**: New images or resources added to the `Resources/` folder do not appear in the built app, despite no compilation errors.
**Root Cause**: **Manual Bundle Construction**. The project uses `build-app-debug.sh` instead of Xcode's standard build system. This script manually `cp` (copies) specific file types from `Resources/` to the app bundle. If you add a new file type (e.g. `.wav`) or forget to update the script, the file is never copied.
**Mandatory Solution**:
1. **Update Build Script**: You MUST add a `cp` command to `build-app-debug.sh` (and `build-dmg.sh` if needed) for any new resource types.
2. **Use NSImage Loading**: For loose files in `Resources/`, use `NSImage(named: "filename")` instead of `Image("filename")` to robustly locate the bundle resource.

```swift
// ❌ WRONG: Fails for loose resources in custom builds
Image("my_new_icon")

// ✅ CORRECT: Robust bundle loading
if let img = NSImage(named: "my_new_icon") {
    Image(nsImage: img)
}
```

### 2. The Hashless File Trap (Landmine #131)
**Symptom**: "Try Another Stream" keeps selecting the same bad file repeatedly when using Debrid-only providers (like DebridSearch/DMM) where `infoHash` is often missing.
**Root Cause**: Reliance on `infoHash` as the sole unique identifier for exclusion. Cached files from DMM often lack a hash in the API response.
**Mandatory Solution**:
1. **3-Factor Exclusion**: When `infoHash` is missing/nil, you MUST exclude based on a composite key: `Filename + FileSize + Provider`.
2. **Explicit Fallback**: The exclusion logic in `StreamService` and `PlayerViewModel` must explicitly check for nil hash and fallback to blocking the specific `stream.title` and `stream.size`.

### 3. Release Integrity Protocol (The "Dirty Repo" Check)
**Symptom**: Releasing a build that contains uncommitted changes or missing files (like a partially synced feature).
**Mandatory Protocol**:
1. **Dirty Repo Check**: The release script MUST fail immediately if `git status --porcelain` is not empty.
2. **Air Gap Protocol**: The `architecture-scan.sh` script MUST verify that every directory in `Sources/Features` is explicitly whitelisted in `sync-to-public.sh`. Missing entries must trigger a build failure.


## Part 31: Advanced Real-Time Message Governance

### 1. System Message Spam (Landmine #132)
**Symptom**: "User Joined" or "Connected via Realtime" messages appear multiple times when a user enters the lobby or transitions between views.
**Root Cause**: SwiftUI `onAppear` can trigger multiple times during rapid navigation or state changes (e.g. `shouldAutoJoinLobby` toggles). This launches parallel `connect()` tasks that each generate a "welcome" message before the connection state has stabilized.
**Mandatory Solution**:
1. **Aggressive Connection Debounce**: The `connect()` method MUST set `status = .connecting` at the very first line to prevent parallel tasks.
2. **Message Manager Deduplication**: The `LobbyChatManager` must implement a **Deduplication Window** (e.g. 5 seconds) for system messages. It should maintain a `lastSystemMessages: [String: Date]` dictionary (keyed by message content/type) and ignore identical messages sent within the window.
3. **Show-Once Flags**: Critical warnings (like "Connected via Realtime") should use a persistent `didShow` flag in the View Model to ensure they only appear once per app session.

### 2. Event Sync Noise (Landmine #133)
**Symptom**: Guests in a public event are constantly interrupted by "Host seeked to..." notifications during the automated broadcast synchronization.
**Root Cause**: Events use a global wall clock. Seeks are often automated corrections (Large Drift) rather than user-initiated actions. These are "noise" in a system event.
**Mandatory Solution**:
1. **Announcement Guard**: All seek notification triggers (`announcementTriggers.send(...)`) MUST verify `!isEventPlayback` before firing.
2. **Preservation**: Keep these notifications active for regular watch party rooms to ensure guest transparency of human host actions.

### 3. Drift Correction Seek Flooding (Landmine #134)
**Symptom**: During a period of high network jitter, the chat is flooded with "Host seeked to..." messages as the app aggressively corrects drift.
**Root Cause**: Sudden jumps in host position (drift > 5s) trigger a hard seek and a corresponding notification. In a jittery session, this can happen every few seconds.
**Mandatory Solution**:
1. **Temporal Debounce**: Maintain `lastSeekNotificationTime: Date` and `lastSeekNotificationPosition: Double`.
2. **Suppression Rules**: Do NOT fire a seek announcement if:
    - (a) A notification was sent within the last **5.0 seconds**.
    - (b) The new seek position is within **3.0 seconds** of the last announced position (redundant drift correction).

    - (b) The new seek position is within **3.0 seconds** of the last announced position (redundant drift correction).

### 4. Scanner Proximity Failure (Landmine #135)
**Symptom**: `scripts/architecture-scan.sh` fails with a warning like "Missing !isEventPlayback guard" even though you added `if !isEventPlayback { ... }` nearby.
**Root Cause**: The scanner uses **regex heuristic checks**, not a full AST parser. It looks for the guard keyword (e.g. `!isEventPlayback`) within a tight proximity window (N lines) of the trigger (e.g. `announcementTriggers.send`). If you place the guard too high up or separate it with empty lines/comments, the scanner cannot "see" it.
**Mandatory Solution**:
1. **Tight Clustering**: Logic guards MUST be within **5 lines** of the sensitive call.
2. **Explicit Comments**: If separation is necessary, use `// OK: Guarded by !isEventPlayback above` to suppress the warning, but PREFER physical proximity.
3. **Zero Warning Policy**: As of v1.0.163, **0 Warnings** are tolerated in production builds. You must fix proximity issues, not ignore them.

### 6. Social Event Join Fallback (Landmine #136)
**Symptom**: Users see "Event Finished" or "Lobby Closed" when trying to join a friend who is actually still inside a stale event room.
**Root Cause**: **Strict Schedule Adherence**. The app originally blocked joining any event that was marked "stale" in the global schedule. However, friends often stay and talk or finish the movie long after the "official" end time.
**Mandatory Solution**:
1. **Friends Always Join Friends**: If a join is initiated via the Social/Friends list, the app MUST allow the join even if the event is officially stale, provided the room still exists in the database.
2. **Database Fallback**: In `SocialService` and `PlayerViewModel`, if an event is stale, you MUST call `getRoomState(roomId:)` as a final check. If the room is returned, the join is permitted.
3. **Revival**: If a friend is explicitly in a room that just vanished (e.g. host crash), a social join should attempt to "revive" (re-create) the room container.

### 7. JSON-Body Health Verification (Landmine #137)
**Symptom**: Settings page shows "Online" for a provider (SubDL, Real-Debrid) even though the API key is invalid or the account is expired.
**Root Cause**: **HTTP 200 Trap**. Many pirate-market APIs (SubDL, RD) return a `200 OK` status code even for 401-style errors, provided the request was "well-formed". They communicate the actual error inside the JSON body (e.g., `{"status": false, "error": "Invalid API Key"}`).
**Mandatory Solution**:
1. **Decode to Verify**: Every health check MUST decode the JSON response body.
2. **Field Check**: For SubDL, check `result.status == true`. For Real-Debrid, fetch the `/user` endpoint and verify the `RDUserInfo` object can be parsed.
3. **Granular Status**: Return specific UI strings like "Invalid API Key" or "Missing API Key" instead of a binary "Offline".

### 8. Fuzzy Year Matching (Landmine #138)
**Symptom**: Subtitles for movies like "The Matrix" are found, but "The Matrix (1999)" fails to find any results on SubDL, or it matches a 2021 sequel incorrectly.
**Root Cause**: **Numeric Fragility**. SubDL API's `film_name` search is extremely sensitive to trailing years and punctuation. Metadata provided by providers often has "noisy" years (e.g., `2024-`) or ±1 year offsets due to regional release differences. Furthermore, many international entries lack year metadata entirely.
**Mandatory Solution**:
1. **Year Tolerance**: When filtering search results locally, allow a **±1 year variance**.
2. **Conflict-Only Rejection**: Only reject based on year if the candidate *has* a year string that disagrees with the target. If the candidate has no year, trust the name match.
3. **Parentheses Normalization**: Split candidate titles by `(` and check the primary body (the part before brackets). This bypasses SubDL's habit of appending international titles in parentheses (e.g., `Kung Fu Hustle (Kong fu / 功夫)`).
4. **Numeric Only**: Extract the numeric 4-digit year from the candidate string before comparison.
5. **Priority-Based Ranking**: Collect all candidates and rank by confidence (Exact > Primary Title Match > Contains substring). This prevents a popular partial match (like "The Beauty Inside") from shadowing an exact match (like "The Beauty").

### 9. The URLSession Caching Trap (Landmine #139)
**Symptom**: Changing an API token (e.g., Bearer token) and immediately saving appears to work, but the app continues to display data (like "Premium Days") from the OLD token, or reports "Online" for a new invalid token.
**Root Cause**: **Headers are ignored by Cache**. `URLSession.shared` (and default configurations) caches responses based primarily on the URL string. If an API endpoint (e.g., `api.real-debrid.com/rest/1.0/user`) is identical for all users, `URLCache` will return the cached response from the previous request even if the `Authorization` header has changed, unless the server explicitly sends `Vary: Authorization` (which many don't).
**Mandatory Solution**:
1. **Explicit Cache Busting**: For sensitive API calls that depend on auth headers (Health Checks, User Info Profile), you MUST explicitly set `.reloadIgnoringLocalCacheData`.
2. **Ephemeral Sessions**: Alternatively, use `URLSession(configuration: .ephemeral)` which disables disk caching entirely.
3. **Applies To**: `checkHealth`, `getUserInfo`, and any "My Library" fetchers that rely on a token-switched context.

```swift
// ✅ CORRECT: Force fresh request for auth-dependent endpoints
var request = URLRequest(url: url)
request.setValue("Bearer \(newToken)", forHTTPHeaderField: "Authorization")
request.cachePolicy = .reloadIgnoringLocalCacheData
```

**Testing Tip**: When verifying auth invalidation, do not rely on minor token modifications (e.g., changing 1 character) as some APIs (like Real-Debrid) are lenient with Base64 padding. Always perform **destructive changes** (e.g., deleting the last 5 characters) to guarantee a server-side rejection.

### 10. The Sticky Ghost Protocol (User Left at 120s) (Landmine #140)
**Symptom**: Host sees "User Joined", then the user is silent. If the user leaves within 2 minutes, no "User Left" message appears.
**Root Cause**: **Transition Protection Overshoot**. The logic to ignore "Leave" events during the lobby-to-player transition (to prevent false positives) was hard-coded to a time window (e.g. 120s) without an early exit. It ignored valid leaves if they happened quickly.
**Mandatory Solution**:
1. **Activity Confirmation**: The protection flag (`transitioningUserIds`) MUST be cleared immediately upon receiving *any* valid Realtime message (Chat, Ready, Playback, or Reaction) from the user.
2. **Dynamic Shield**: Do not rely on time alone. Use the first proof-of-life signal to drop the shield.
3. **Log Visibility**: Log "Removing transition protection" when the shield drops to confirm correct behavior.

### 11. The Real-Debrid Guest IP-Lock Trap (Landmine #141)
**Symptom**: Watch Party guests experience instantaneous "EOF" or "Premature End of File" upon starting playback, while the host plays perfectly.
**Root Cause**: **Inter-IP Magnet Pollution**. Real-Debrid generates stream URLs based on the IP address that first "unlocks" or "links" the magnet. If the Host's URL is shared, it fails for guests (Direct IP-Lock). Furthermore, even if the guest resolves the same hash, if the debrid service has the magnet "cached" for the host's IP, it may serve a poisoned link or a 403.
**Mandatory Solution**:
1. **Cache Purge**: Guests MUST call `RealDebridClient.shared.clearCache(forHash:)` before resolving/unlocking. This forces the debrid service to purge any previous session state for that magnet.
2. **Force Fresh**: Use `forceFresh: true` (or equivalent) in the `unlock` call to ensure a new link is generated specifically for the guest's IP.
3. **Title Fallback**: If the `infoHash` is stable but resolution fails, guests MUST fall back to matching the Host's `selectedStreamTitle` against all available provider results using `Stream.normalizeTitle()`.

### 12. Targeted Provider Synchronization (Landmine #142)
**Symptom**: Watch Party synchronization takes 10-20 seconds for guests while "Resolving Streams", causing them to miss the start of the movie.
**Root Cause**: **Exhaustive Scrapping**. Guests were performing a full scrape of all 15+ providers to find a matching stream. This is redundant if the Host has already identified a working source.
**Mandatory Solution**:
1. **Handshake Enrichment**: The `LOBBY_PREPARE_PLAYBACK` signal MUST include the `provider` name (e.g., `Torrentio`, `DebridSearch`).
2. **Targeted Fetching**: Guests MUST pass the `preferredProvider` to `ProviderManager.shared.fetchStreams(providerNames: [...])`. This reduces API traffic to a single request, cutting sync time to **<2 seconds**.
3. **Protocol Consistency**: The `StreamResolving` protocol MUST include `preferredProvider` to ensure this optimization is propagated through the `PlayerViewModel` and emergency resolution loops.

### 13. The Stale Premium Flag Trap (Landmine #146)
**Symptom**: A user who recently canceled their subscription or had it expire still displays the "Crown Emoji" (👑) in chat or the lobby, even after a restart or re-join.
**Root Cause**: **Flag-Based Invalidation Failure**. Relying on binary boolean flags like `isPremium` is dangerous because flags often persist in local caches (AppState, LicenseManager, Presence Metadata) after the underlying subscription has expired.
**Mandatory Solution**:
1. **Timestamp Authority**: The `subscriptionExpiresAt` timestamp is the ONLY source of truth.
2. **Dynamic Validation**: Use the `isReallyPremium` computed property (available on `Friend`, `Participant`, and `ChatMessage`) which performs a real-time comparison: `expiryDate > Date()`.
3. **Metadata Synchronization**: Presence metadata and `SyncMessage` MUST include `subscription_expires_at` (TimeInterval) so that other participants can perform their own local validation.
4. **UI Pattern**: UI components MUST check `isReallyPremium` rather than `isPremium`.

```swift
// ✅ CORRECT: Verify timestamp, don't trust the flag
if participant.isReallyPremium {
    Text("👑")
}
```

### 14. Personal Access Token (PAT) Management (Landmine #150)
**Symptom**: Automated release scripts fail with 401/403 errors, or GitHub rejects pushes to the public mirror.
**Root Cause**: **Token Expiration or Leak**. The `sync-to-public.sh` script relies on a valid PAT for push access. If the token expires or is refreshed on GitHub without being updated locally, the release pipeline breaks.
**Mandatory Solution**:
1. **Current PAT Storage**: The valid PAT MUST be stored in the local git config of the public repo mirror. For reference, the current token is: `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`
2. **Confidentiality**: This token is for PRIVATE use in the development environment. It MUST NOT be committed to `Package.swift`, `Config.swift`, or any public-facing file.
3. **Rotation**: When rotating, update the remote with: `git remote set-url origin https://redlemon1272:NEW_PAT@github.com/redlemon1272/RedLemon.git`.

### 15. The Architecture Scan Protocol (Landmine #151)
**Symptom**: Sub-par code patterns (stale `NSLog`, MainActor violations, missing guards) leak into production, causing unpredictable UX in high-stress scenarios (Watch Parties).
**Root Cause**: **Human Fallibility**. As the codebase grows, it's impossible to manually verify every pattern.
**Mandatory Solution**:
1. **Automated Guard**: Every PUSH and RELEASE MUST pass `./scripts/architecture-scan.sh`. 
2. **Zero-Warning Policy**: Releases MUST have 0 errors and 0 warnings. No exceptions.
3. **Regex Heuristics**: Understand that the scanner uses regex. Keep your guards within 5 lines of the calls they protect (Proximity Rule).
4. **The "Truth" File**: The scan rules are defined in `scripts/architecture-scan.sh`. Update them as new "Landmines" are discovered.

### 16. The Air-Gap Guardrail (Landmine #152)
**Symptom**: Private documentation (Manuals), Wallet Seeds, XPUBs, or Production IPs are accidentally committed to the public mirror.
**Root Cause**: **Human Error or Sync Script Misconfiguration**. It only takes one `cp -R docs/*` to leak the entire production manual.
**Mandatory Solution**:
1. **Strict Whitelist (Default Deny)**: `sync-to-public.sh` MUST only copy explicitly safe files. Never copy entire directories except `Resources`, `Sources/Models`, etc.
2. **Post-Sync Audit**: The `architecture-scan.sh` script (Check 86) MANDATORILY audits the `../RedLemon-Public` directory after every sync.
3. **Regex Sentinel**: The scanner detects 12-word seed patterns, 100+ character XPUBs, and the Production IP.
4. **Scrubbing Verification**: Ensure all internal jargon (`AI_BIBLE`, `Landmine`) is replaced by the scrubber.
5. **Zero-Leak Policy**: If `architecture-scan.sh` detects a leak in the public repo, the RELEASE is blocked. No exceptions.

### 17. The Zombie Wallet Trap (Landmine #153)
**Symptom**: User funds continue to arrive at an OLD address even after **changing wallets** or rotating XPUBs on the server.
**Root Cause**: **Database Persistence**. The `payment_pools` table stores the link between a `user_id` and an `address`. If you rotate the XPUB in the engine but don't CLEAR the table, the server will keep serving the cached address from the old wallet.
**Mandatory Solution**:
1. **The Flush Rule**: Every wallet rotation MUST be accompanied by a database flush: `DELETE FROM payment_pools;`. 
2. **The Deep Recycle Rule**: Standard `docker compose restart` often fails to re-read updated `.env` files into Deno runtimes. Always use `docker compose down && docker compose up -d` for wallet changes.
3. **Automated Protocol**: Use `./scripts/rotate-wallet.sh` to ensure the correct sequence (ENV Update -> Down -> Up -> Table Flush).
4. **Verification**: After rotation, trigger an `assign-address` call via curl/app to verify the derived address matches the new mnemonic's expected Index 0.

#### Automated Rotation Script (`scripts/rotate-wallet.sh`)
```bash
#!/bin/bash
# 🍋 RedLemon Wallet Rotation Protocol (Emergency & Routine)
# Automates the safe transition to a new wallet.
set -e

NEW_BTC_XPUB=$1
NEW_EVM_XPUB=$2
NEW_EVM_XPRV=$3

# 1. Update Remote .env
./remote_exec.sh "sed -i 's/^XPUB_BTC=.*/XPUB_BTC=$NEW_BTC_XPUB/' /root/supabase/docker/.env && \
                  sed -i 's/^XPUB_EVM=.*/XPUB_EVM=$NEW_EVM_XPUB/' /root/supabase/docker/.env && \
                  sed -i 's/^XPRV_EVM=.*/XPRV_EVM=$NEW_EVM_XPRV/' /root/supabase/docker/.env"

# 2. Deep Recycle Containers (Flush ENV)
./remote_exec.sh "cd /root/supabase/docker && docker compose down && docker compose up -d"

# 3. Flush Zombie Pools (Prevent Landmine #153)
./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"\
    UPDATE key_derivation_indices SET next_index = 0; \
    DELETE FROM payment_pools; \
    ANALYZE payment_pools;\""
```

### 18. The Key Synchronicity Trap (Landmine #154)
**Symptom**: App gives `401 Unauthorized` for all users, or all users are suddenly logged out and cannot re-auth.
**Root Cause**: **JWT Secret Desync**. The `JWT_SECRET` on the server generates the `ANON_KEY`. If you rotate the secret on the server but do not update the `Config.swift` in the Mac app, the app will sign requests with an invalid key.
**Mandatory Solution**:
1. **Atomic Rotation**: You MUST update the `JWT_SECRET`, regenerate the `ANON_KEY` and `SERVICE_ROLE_KEY` using the same secret, and update the Mac app's `Config.swift` in a single operation.
2. **AI Secret Awareness**: When an AI is asked to "fix" or "update" keys, it MUST verify that the change is reflected in BOTH the server `.env` and the client `Config.swift`.
3. **Guardrail Script**: Use `scripts/gen_jwt.py` to ensure the mathematical link between the Secret and the Keys is maintained.

#### Key Generation Script (`scripts/gen_jwt.py`)
```python
import jwt # pip install pyjwt
import secrets
import time

# 1. Generate a fresh, random 64-char JWT Secret
new_secret = secrets.token_hex(32)

def generate_key(role, secret):
    iat = int(time.time())
    exp = iat + (10 * 365 * 24 * 60 * 60) # 10 years
    payload = {"role": role, "iss": "supabase", "iat": iat, "exp": exp}
    return jwt.encode(payload, secret, algorithm="HS256")

new_anon = generate_key("anon", new_secret)
new_service = generate_key("service_role", new_secret)

print(f"JWT_SECRET={new_secret}")
print(f"ANON_KEY={new_anon}")
print(f"SERVICE_ROLE_KEY={new_service}")
```

### 19. AI Secret Awareness Protocol (Landmine #155)
**Symptom**: Sensitive information (Seeds, IPs, Bible Parts) leaks to the public repository via a "helpful" AI assistant.
**Root Cause**: **Careless AI Context Injection**. AIs are designed to be helpful and often copy-paste entire files into the public repo folder without checking the "Air-Gap Whitelist."
**Mandatory Instruction to AI**:
1. **The Public Repo is Lava**: NEVER copy a file to `../RedLemon-Public` unless it is explicitly listed in `scripts/sync-to-public.sh`.
2. **Regex First**: Before completing a sync, the AI MUST run `scripts/architecture-scan.sh` to trigger the **Check 86 Air-Gap Guardrail**.
3. **No Private Jargon**: If an AI sees the words "BIBLE," "LANDMINE," or code numbers like "#150" in a public-facing file, it MUST remove them or block the push.
4. **Refuse Leaks**: If the USER asks the AI to put a seed phrase or IP into a public README, the AI MUST decline and point to this Landmine.
