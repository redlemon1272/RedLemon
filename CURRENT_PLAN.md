# Current Development Plan

## Goal
Prioritize and plan the development of Friends System, Watch Party enhancements, Language support, LNbits migration, and Technical Debt reduction, including a new **Admin Master Control**.

## Priority Order

### 1. 🛡️ Foundation & Admin Infrastructure (Immediate)
**Why:** "Limit silent errors" and "cleaning up code" are critical. The Admin Dashboard provides the visibility needed to monitor these errors.
- **Tasks:**
    - **Supabase Schema:**
        - Add `app_logs` table (level, message, stack_trace, user_id, version).
        - Add `analytics_events` table (event_name, metadata, user_id).
        - Add `is_admin` boolean to `users` table.
    - **Logging Service:** Implement `LogManager` to push logs to Supabase.
    - **Admin Dashboard (MVP):** Create a hidden/protected view in the app to query and display these logs and active rooms.
    - **Cleanup:** Audit and clean up "dead code" from uWebSockets removal.
    - **Verification:** Trigger an error, verify it appears in the Admin Dashboard.

### 2. 👥 Friends System (High Impact)
**Why:** The social backbone.
- **Tasks:**
    - **Presence & Activity:** Update `Friend` model to sync "Current Activity".
    - **UI Overhaul:** Update `FriendsView` to show status indicators.
    - **Join Flow:** Add "Join Watch Party" button next to active friends.
    - **Verification:** Verify status updates between two clients.

### 3. 🍿 Watch Party Enhancements
**Why:** Builds upon the Friends system.
- **Tasks:**
    - **Private Rooms:** Add `password` protection.
    - **Marathon Mode:** Implement "Up Next" queue.
    - **Public Rooms:** Create "Browse Rooms" interface.
    - **Verification:** Test private room access and queue progression.

### 4. 🌍 Language & Localization
**Why:** Accessibility.
- **Tasks:**
    - **Language Manager:** Manage app-wide locale.
    - **Player Integration:** Auto-select audio/subtitle tracks.
    - **UI Localization:** Translate interface.
    - **Verification:** Switch language, verify UI/player updates.

### 5. ⚡ Server Migration & LNbits (Long Term)
**Why:** Monetization.
- **Tasks:**
    - **Server Setup:** Deploy new server.
    - **LNbits Migration:** Move invoice generation.
    - **Verification:** Successful payment detection.
