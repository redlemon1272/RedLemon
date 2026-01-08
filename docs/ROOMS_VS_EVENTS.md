# Rooms vs. Events: Core Concepts

This document clarifies the fundamental distinction between **User Hosted Watch Parties (Rooms)** and **System Hosted Movie Events (Events)** in the RedLemon ecosystem. This distinction is critical for developers to understand as they handle completely different use cases, lifecycles, and technical implementations.

## Quick Comparison

| Feature | User Hosted Rooms ("Watch Parties") | System Hosted Events ("Movie Nights") |
| :--- | :--- | :--- |
| **Primary entity** | `SupabaseRoom` | `EventsConfig` |
| **Host** | A specific User (the "Host") | The System (Automated/Admin) |
| **Lifecycle** | Ephemeral (created by user, deleted when empty) | Persistent / Scheduled (defined by config) |
| **Content** | Chosen by Host (can be anything) | Curated List (global for all users) |
| **Playback Control** | Host controls (pause/seek/play) | System controlled (simulated broadcast) |
| **Joining** | Users manually join a specific room ID | Users "tune in" to a scheduled slot |
| **Interaction** | Real-time chat, seeking, presence | Global chat (optional), no seeking |
| **Tech Stack** | WebSockets (Realtime), `rooms` table | Static Config (Supabase), Local Calculation |

---

## 1. User Hosted Rooms (Watch Parties)

**"Rooms"** are dynamic, user-created sessions where a group of friends or strangers can watch content together in sync. 

*   **Key Behavior**: If the host pauses, everyone pauses. If the host seeks, everyone seeks.
*   **Data Source**: `SupabaseRoom` struct in `SupabaseClient.swift`.
*   **Database Table**: `rooms` and `room_participants`.
*   **Persistence**: Rooms are generally ephemeral. They exist as long as there are participants (or explicitly managed by the host).
*   **Latency**: Critical. Uses high-performance WebSockets to sync state within milliseconds.

**Use Case**: "I want to watch *Inception* with my friend right now."

## 2. System Hosted Events (Movie Events)

**"Events"** are scheduled, system-wide broadcasts. They function more like a traditional TV channel or a scheduled cinema screening.

*   **Key Behavior**: The movie plays at a specific time. Users cannot pause or seek. Everyone sees the same specific frame at the same wall-clock time globally.
*   **Data Source**: `EventsConfig` struct in `EventsConfigService.swift`.
*   **Database Table**: `events_config`.
*   **Persistence**: The schedule is persistent and defined by admins/scripts.
*   **Latency**: Less critical for sync, as it relies on calculating current position based on wall-clock time relative to start time.

**Use Case**: "Friday Night Horror Marathon" or "24/7 Action Channel".

## 3. Joinability & "Dead Rooms"

A critical distinction exists in how joining is handled when the "Host" is missing or the event is "Finished":

### User Hosted "Dead Rooms"
*   **Definition**: A room where the original Host has left the session.
*   **Behavior**: The room is considered "Dead". The system **blocks** new users from joining to prevent them from entering an empty, standardless state.
*   **Logic**: `SocialService` checks if `host_user_id` is present in the participant list. If missing -> Join blocked.

### System Hosted Events (Always Joinable)
*   **Definition**: A persistent event room (e.g., `event_tt12345`).
*   **Behavior**: These rooms are **Always Joinable**, even if the "Event Finished" badge is shown in the UI.
*   **Logic**: The system bypasses the "Host Check" for any room ID starting with `event_`.
*   **Use Case**: You can always join a friend who is lingering in an event lobby, even if the scheduled movie has ended.

## Confusion Avoidance

*   **Variables**: Avoid generic names like `event` or `session`. Use `room` for watch parties and `eventSlot` or `broadcast` for system events.
*   **UI**: "Join Room" implies entering a user session. "Tune In" or "Watch Now" implies viewing a system event.
