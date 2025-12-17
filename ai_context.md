# RedLemon AI Context Handoff
> **READ THIS FIRST**: This codebase is in "Maintenance Mode". Do not refactor major components without explicit permission. Use this guide to navigate the complexity without breaking hidden dependencies.

## 🚨 Critical "Landmines" & Hidden Logic

### 1. The "God Class": `MPVPlayerViewModel.swift`
- **What it does**: Everything. Video playback, UI state calls, Chat networking, Watch Party Sync, Subtitle logic.
- **Danger**: Modifying one part (e.g., Chat) can break another (e.g., Playback).
- **Rule**: When editing this file, TRIPLE CHECK that your change handles `DispatchQueue.main` correctly, as MPV callbacks often come from background threads.

### 2. Verified Streams Data Model
- **File**: `SupabaseClient.swift` -> `struct VerifiedStream`
- **Crucial Detail**: The `id` is a **COMPOSITE** of `hash + season + episode`.
    - `var id: String { "\(hash)_\(season)_\(episode)" }`
    - **Why**: "Season Pack" torrents share the exact same file hash for multiple episodes. If you revert this to just `hash`, the app will crash with Duplicate ID errors in `ForEach` loops.
- **Rule**: NEVER identity a stream solely by its hash in the UI.

### 3. Subtitle Selection Logic (`MPVWrapper.swift`)
- **Key Function**: `refreshSubtitleSelection()`
- **Scoring**:
    - **Embedded Track**: +3000 points (Hard rule to beat filename matching).
    - **Filename Match**: ~1000-1500 points.
    - **Danger**: `MPVPlayerViewModel` *also* has selection logic (`autoSelectEnglishDefaults`). If these two disagree, you get an infinite loop. The `Wrapper` logic (Scoring) should usually win.

### 4. StreamResolver Filters (`StreamResolver.swift`)
- **What it does**: Scrapes and filters streams.
- **Danger**: Contains massive HARDCODED lists for blocked groups (e.g., `tamilmv`), codecs (`av1`), and audio languages.
- **Rule**: If a valid stream is missing, check these hardcoded arrays first. Do not add complex logic; just update the lists if needed.
- **Verified Short-Circuit**: If a stream is verified, it bypasses ALMOST ALL checks. This is intentional.

### 4. Realtime Sync (`RealtimeChannelManager.swift`)
- **Mechanism**: Usage of `actor` for concurrency.
- **Fragility**: Initial connection callbacks (`syncCallback`) have a history of race conditions (being nil when a message arrives).
- **Drift Logic**: Uses hardcoded thresholds (50ms, 500ms) to decide when to Seek vs. Rate Shift. Modifying these constants can destabilize sync for everyone.

## 🏗️ Architecture Shortcuts (The "Spaghetti" Map)

| Component | Responsibility | "Secret" Dependencies |
| :--- | :--- | :--- |
| `MPVWrapper.swift` | Low-level C-Interop | **Subtitle Scoring Logic** is hidden here (preferring Embedded over External). |
| `EventsConfigService` | Remote Config | Caches strictly. If config doesn't update, check the version comparison logic here. |
| `LobbyViewModel` | Rooms/Social | Tightly coupled with `RealtimeChannelManager`. Changes here often break `WatchPartyViewState`. |

## 🛠️ Common Tasks Cheat Sheet

**"I need to fix a subtitle issue"**
- Look in `MPVWrapper.swift` (`refreshSubtitleSelection`).
- Look in `MPVPlayerViewModel.swift` (`autoSelectEnglishDefaults`).
- **Warning**: These two fight each other. `Wrapper` scores them, `ViewModel` selects them.

**"I need to add a new Stream Provider"**
- Add to `ProviderManager.swift` (Singleton).
- Ensure `StreamResolver.swift` calls it.
- **Warning**: `StreamResolver` effectively re-sorts everything, so provider rank matters less than resolver scoring logic.

### 5. Admin Dashboard & Verified Streams
- **Files**: `AdminDashboardView.swift`, `VerifiedStreamsView.swift`
- **Logic**: Aggregates data from Supabase.
- **Dedup Warning**: The `VerifiedStreamsView` has its own deduplication logic (composite key `hash + season + episode`). If you change the data model in `SupabaseClient`, you MUST update this view or verified streams will disappear from the list.

### 6. Settings & User Identity
- **Settings**: `SettingsView.swift` handles local preferences. Most are stored in `UserDefaults` via `@AppStorage`.
- **Identity**: `UsernameSetupView.swift` manages the initial username creation.
### 7. Monetization & Licensing
- **Files**: `LicenseManager.swift`, `PaymentGateView.swift`
- **Logic**: Uses a local timestamp (`subscriptionExpiresAt`) in `AppStorage`. `isPremium` is calculated dynamically against `Date()`.
- **Payment System**: Uses `Crypto Payments` (HD Wallet). Checks `payment_transactions` on Supabase to extend expiry.
- **Warning**: There is a `#if DEBUG` flag in `LicenseManager`. If you are debugging IAP/Payment issues, check if you are running in Release or Debug mode as behavior differs.
- **Recovery**: Uses a custom BIP39-style phrase generated in `RecoveryPhraseManager`. Do not confuse with crypto wallets; it's just a hashed seed for the Supabase backend.

### 8. The "Minor" God Class: `BrowseView.swift`
- **What it does**: Handles all content browsing, search, and "Lazy Loading" of shelves.
- **Performance**: It uses extensive Task cancellation (`tabSwitchTask?.cancel()`) to manage performance.
- **Danger**: Modifying the `task` or `onChange` modifiers here can cause race conditions where old content overwrites new content on tab switch.

### 9. Hidden Infrastructure & Testing
- **Local Server**: The app starts a local Vapor server on port `47253` (`Config.swift`). This handles metadata proxying.
- **Testing Profiles**: `RedLemonApp.swift` checks command line args for `-user-profile host` or `-user-profile guest`. This is critical for testing multiple instances on one machine.
- **Environment**: `Config.swift` hardcodes Supabase keys.
    - **SECURITY WARNING**: The `supabaseServiceKey` is currently hardcoded in the client. Be extremely careful not to expose this in logs/UI.
