# RedLemon Codebase & Architecture Review

## Overview
RedLemon is a sophisticated native macOS media application that blends local playback (MPV) with real-time social features. The core distinction in the application is between **User Hosted Rooms** (synchronized watch parties) and **System Hosted Events** (simulated global broadcasts).

## "Events" vs. "Rooms" Architecture

The application handles these two concepts with distinct but overlapping strategies:

### 1. User Hosted Rooms ("Watch Parties")
*   **Concept**: Ephemeral, user-controlled sessions for small groups.
*   **Technology**: Relies heavily on **WebSockets** (Supabase Realtime) via `RealtimeChannelManager`.
*   **Sync Logic**: "Master-Slave" logic. If the host seeks/pauses, the state is broadcasted to all peers. Latency is critical here.
*   **Data Model**: Defined in `SupabaseRoom` (Table: `rooms`).

### 2. System Hosted Events ("Broadcasts")
*   **Concept**: Persistent, globally scheduled content (like a TV channel).
*   **Technology**: Relies on **Polled Configuration** (Supabase `events_config`) via `EventsConfigService`.
*   **Sync Logic**: "Calculated" logic. The play position is derived from `(CurrentTime - StartTime)`. There is no "host" to pause or seek.
*   **Data Model**: Defined in `EventsConfig`.
*   **Optimization**: This is a smart architectural choice. By calculating position locally based on a global schedule, you avoid the definition of a "host" and the massive WebSocket traffic required to keep thousands of users in sync for a passive stream.

### 3. The "Hybrid Lobby" Pattern
Interestingly, while the **Playback Source** differs, the **Social Layer** is shared.
*   **Implementation**: `LobbyViewModel.swift` handles both.
*   **Discovery**: The code detects an Event by checking if the Room ID starts with `event_` (`id.hasPrefix("event_")`).
*   **Effect**: This allows "Events" to have a chat room and user presence list (reusing the `rooms` table for social state) without the overhead of playback sync messages.

## Key Observations & Risks

### 1. Use of "God Classes"
*   **`MPVPlayerViewModel.swift`**: As noted in your `ai_context.md`, this class is massive and handles too many responsibilities (Playback, Chat, Sync, UI State). It is the most fragile part of the app.
*   **`LobbyViewModel.swift`**: This class is also becoming a "God Class". It handles:
    *   Room State (Participants)
    *   Chat (via delegation)
    *   **Both** User-Room logic AND Event-Room logic.
    *   Conditional checks like `if isHost && room.type == .userRoom` are scattered, which introduces regression risks when modifying one mode.

### 2. Stream Verification Logic
*   The `VerifiedStream` ID being a composite of `hash + season + episode` is a critical detail found in `SupabaseClient.swift`. This handles the edge case of "Season Pack" torrents effectively.

### 3. Hardcoded Logic
*   There are significant hardcoded thresholds for sync drift (e.g., 50ms vs 500ms) in `RealtimeChannelManager`. These are "load-bearing constants" that should be touched with extreme care.

## Conclusion
The architecture is well-reasoned for the specific problem domain (Social Video). The split between **Realtime Sync (Rooms)** and **Calculated Sync (Events)** is the standout architectural feature, enabling both intimate interaction and scalable broadcasting. The main technical debt lies in the large ViewModels which tightly couple logic to the UI.
