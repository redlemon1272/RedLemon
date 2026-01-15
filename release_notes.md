# Release v1.0.102

## 🛡️ Architecture & Stability
- **Fixed Async Scroll Race Conditions (Landmine #48)**: Resolved potential race conditions where auto-scroll commands could fire before content loaded, leading to erratic scroll behavior.
    - Guarded `scrollTo` calls in `ChatView` and `WatchPartyLobbyView`.
    - Validated `FriendProfileView` and `ChatOverlayView` safety.
- **Scanner Upgrade**: Updated `scripts/architecture-scan.sh` to automatically detect unguarded `proxy.scrollTo` usages (Landmine #48 Check).
