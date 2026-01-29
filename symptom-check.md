# 🩺 Symptom Checker & Quick Fixes

> **Purpose**: A fast lookup guide for common issues. Use the [AI Bible](AI_BIBLE.md) for detailed root cause analysis.

| Symptom | Probable Cause | Fix / Landmine |
| :--- | :--- | :--- |
| **Guest shows "Left" immediately** | Race condition in dependency injection. | **Landmine #132**: Ensure `appState` is injected *before* sync logic in `.task`. |
| **Guest "Online" but video paused** | Realtime connection established, but playback state not synced. | Check `startWatchPartySync` logic. |
| **Host plays, Guest stuck buffering** | "Ghost Stream" or wrong file selected. | **Landmine #35**: Ensure old room state is cleared. |
| **"Duplicate Key" error on Join** | Double-join or race condition. | **Landmine #60**: Ensure `joinRoom` is idempotent. |
| **Authentication fails silently** | Missing User Context. | **Landmine #88**: Check Keychain fallback. |
| **Zero KB Disk Usage** | Deno Edge Function limitation. | **Landmine #97**: Don't use `df` command. |
| **UI Freeze on Menu Open** | Native Menu blocking main thread. | **Landmine #57**: Use SwiftUI Overlay instead. |
| **Scroll Stutter on macOS 15** | Scroll event swallowing. | **Landmine #49**: Subclass NSScrollView. |
| **Crown Emoji (👑) won't go away** | Relying on stale boolean flags. | **Landmine #143**: Use `isReallyPremium` (Time-based). |

## 🛠 Usage
1. Match the symptom to the table above.
2. Read the corresponding **Landmine** in `AI_BIBLE.md`.
3. Run `./scripts/architecture-scan.sh` to check for regressions.
