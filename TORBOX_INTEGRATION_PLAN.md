# Torbox Integration & User Segregation Plan

This document outlines the findings and implementation strategy for integrating **Torbox** as an alternative debrid service in RedLemon, while maintaining strict segregation from **Real-Debrid** users to ensure cached stream compatibility during Watch Parties and Events.

## 1. Torbox API Implementation Findings

Unlike Real-Debrid, Torbox uses a slightly different flow for "unrestricting" torrents. Based on research into the `https://api.torbox.app/v1/api` documentation:

### Core Endpoints
- **Base URL:** `https://api.torbox.app/v1/api`
- **Authentication:** Bearer Token (`Authorization: Bearer <token>`)
- **Cache Verification:** `GET /torrents/checkcached?hash=<hash>`
- **Instant Unrestrict Flow:**
    1.  `POST /torrents/createtorrent` with `add_only_if_cached=true`.
    2.  This yields a `torrent_id`.
    3.  `GET /torrents/requestdl?torrent_id=<id>&file_id=<file_id>&token=<key>` to get the CDN link.
- **User Verification:** `GET /user/me` (Returns plan level and usage limits).

### Key Differences from Real-Debrid
- **Permalinks:** Torbox supports a "requestdl" permalink that can automatically redirect to the CDN: `.../requestdl?token=APIKEY&torrent_id=ID&file_id=ID&redirect=true`. This might be useful for legacy player support but RedLemon should use direct links for better logging and error handling.
- **Poll Logic:** Similar to RD, we will need to poll `torrents/mylist` if it's not instantly cached, though for RedLemon we prioritize instant playback.

## 2. User Segregation Strategy

To prevent "No stream found" errors or sync failures caused by different cache states between providers, RedLemon will implement **Provider Isolation**.

### A. Database Updates (Supabase)
We need to track which debrid service a Room or Event is locked to.
- **Table:** `rooms`
- **New Column:** `debrid_service` (VARCHAR)
- **Values:** `realdebrid` | `torbox`

### B. Logic Changes

#### 1. Room Creation
When a Host creates a room, their **active debrid service** (the one they have a key stored for and is currently selected) is stamped onto the room record.
- If a user has both, they must choose which one the room uses.
- Default: `realdebrid`.

#### 2. Room Joining (The Guardrail)
When a Guest attempts to join a room:
- `LobbyViewModel` or `SupabaseClient` checks the `debrid_service` of the target room.
- If the Guest **does not have a valid key** for that specific service, they are blocked with an error:
  > "This party is hosted on **Torbox**. Please add a Torbox API key in Settings to join."

#### 3. Stream Resolution
- During a Watch Party, the `StreamResolver` will receive the `debrid_service` context.
- It will filter out providers that don't support the room's debrid service (e.g., if a provider only returns RD-cached hashes, it's ignored for a Torbox room).

## 3. Implementation Roadmap

### Phase 1: Authentication & Client
- Create `TorboxClient.swift` mirroring the `RealDebridClient` architecture (Actor-based, thread-safe).
- Update `SettingsView` and `KeychainManager` to support Torbox API keys.

### Phase 2: Resolver Integration
- Modify `ProviderManager` to allow filtering by debrid service.
- Update `StreamResolver` to accept an optional `requiredDebridService` parameter.

### Phase 3: Watch Party Lockdown
- Update `SupabaseRoom` model to include `debrid_service`.
- Implement the "Compatibility Check" in `LobbyViewModel`.
- Update `SupabaseClient.createRoom` to send the service type.

### Phase 4: UI/UX
- Add a visual indicator in the Room List showing which service is being used (e.g., a small "RD" or "TB" badge).
- Add "Join Requirement" warnings to the Join Room dialog.

## 4. Risks & Landmines
- **Cache Discrepancy:** Torbox might have a smaller cache than Real-Debrid for obscure titles. Users must be aware that content availability depends on the service.
- **IP Locking:** Ensure Torbox doesn't have restrictive IP locking similar to RD's "unrestrict" links (Landmine #44). Preliminary research suggests Torbox links are also tied to the requester, so guests will still need to re-resolve/request their own links.
