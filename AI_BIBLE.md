# RedLemon AI Bible
> **THE ULTIMATE CONTEXT DOCUMENT**  
> **Last Updated:** January 9, 2026  
> Read this first. Contains everything an AI assistant needs to work on this codebase.

---

# Part 1: Codebase Architecture & Landmines

## 🚨 Critical "Landmines" & Hidden Logic

### 1. The "God Class": `MPVPlayerViewModel.swift`
- **What it does**: Everything. Video playback, UI state, Chat networking, Watch Party Sync, Subtitle logic.
- **Danger**: Modifying one part (e.g., Chat) can break another (e.g., Playback).
- **Rule**: TRIPLE CHECK that changes handle `DispatchQueue.main` correctly—MPV callbacks often come from background threads.

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
- **Multi-Chain**: BTC + EVM (Ethereum, Base, Arbitrum, Optimism, Polygon).
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

## Daily Schedule (UTC)

| Time | Job |
|------|-----|
| 9:00 AM | Database backup |
| 9:10 AM | Payment sweep |

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
