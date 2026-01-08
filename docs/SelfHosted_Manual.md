# RedLemon Self-Hosting Master Docs

> **STATUS:** MIGRATION COMPLETE & VERIFIED
> **DATE:** January 5, 2026

This document contains **everything** you need to manage your new self-hosted backend.
**KEEP THIS SAFE.** It contains root passwords and API keys.

---

## 1. Server Access (AnonVM)

| Service | Detail |
| :--- | :--- |
| **IP Address** | `151.243.109.243` |
| **SSH User** | `root` |
| **SSH Password** | `123Scarface123!` |
| **OS** | Ubuntu 24.04 LTS |
| **Location** | AnonVM (Netherlands) |

**To Connect:**
```bash
ssh root@151.243.109.243
# Enter password: 123Scarface123!
```

---

## 2. Supabase Access

| Component | URL / Value | Credentials |
| :--- | :--- | :--- |
| **Dashboard** | `http://151.243.109.243:3000` | User: `admin`<br>Pass: `7a65fa960cfbcd1da2e3c1da3a4c8b2e` |
| **API (Kong)** | `https://151.243.109.243.nip.io` | (Protected by Anon Key) |
| **Database** | Port `5432` (Direct) | User: `postgres`<br>Pass: `6be071e915e2f9246408639def0a07bd` |

### API Keys (Permanent)
These keys are hardcoded in your app and server. If you change them, you must update both.

*   **ANON_KEY (Public):**
    `eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogImFub24iLCAiaXNzIjogInN1cGFiYXNlIiwgImlhdCI6IDE3Njc2NTAwMzIsICJleHAiOiAyMDgzMDEwMDMyfQ.zY-FKTBjIi4dvhR7En5i5ULALx9QM_2O4QWMbedkBus`

*   **SERVICE_ROLE_KEY (Secret - Admin API):**
    `REMOVED (Security: Used on Server-Side Only)`


*   **JWT Secret (For Token Generation):**
    `0c759034b5faeabea30200006df6cfed979ea6a95891a33080fb0d8677e671de`

---

## 3. Migration Summary

### A. Data
*   **Source:** Hosted Supabase.
*   **Destination:** Self-Hosted Postgres.
*   **Verification:**
    *   `public.users`: 12 rows (transferred successfully).
    *   `auth.users`: 0 rows (Correct - App uses Custom Auth in `public.users` via `register_user_secure`).
    *   **Cron Jobs:** 11 active jobs (e.g. `cleanup-rooms`) running successfully.
    *   **Blocked Streams:** 0 rows (New table `public.blocked_streams` deployed Jan 7, 2026).

### B. Edge Functions
*   **Location:** `/root/supabase/docker/volumes/functions`
*   **Router:** `main/index.ts` routes requests to:
    *   `assign-address`
    *   `check-payment`
    *   `cleanup-rooms`
    *   `create-invoice`
    *   `lnbits-webhook`
    *   `recover-account`
    *   `hello`
*   **Deployment:** To update functions, edit the files in `/root/supabase/docker/volumes/functions/[name]/index.ts` and restart the container.

### C. SSL / HTTPS
*   **Domain:** `https://151.243.109.243.nip.io`
*   **Technology:** **Caddy** Reverse Proxy (Auto-SSL via Let's Encrypt).
*   **Config:** `/root/supabase/docker/Caddyfile`.

---

## 4. Maintenance Commands

Run these as `root` on the server:

**Restart Everything:**
```bash
cd /root/supabase/docker
docker compose restart
```

**Check Logs:**
```bash
cd /root/supabase/docker
docker compose logs -f --tail 100
```

**Check Database:**
```bash
docker exec -it supabase-db psql -U postgres
```

---

## 5. Automated Backups
**Status:** ✅ Active (Daily at 9:00 AM UTC)

*   **Script:** `/root/backup.sh` (which calls `/root/verify_backup.sh`)
*   **Destination:** `/root/backups/`
*   **Retention:** 7 Days
*   **Verification:** Automatically restores to a temp container.
    *   **Checks:** `users`, `rooms`, `payment_pools`, `payment_transactions`, `key_derivation_indices` (ensures rows > 0).
    *   **Status:** Logged to `public.backup_logs` (`verified` or `verification_failed`).

**Manual Backup:**
```bash
/root/backup.sh
```

**Restore:**
```bash
# Unzip the backup
gunzip /root/backups/backup_YYYYMMDD_HHMMSS.sql.gz

# Restore to Postgres
cat /root/backups/backup_YYYYMMDD_HHMMSS.sql | docker exec -i supabase-db psql -U postgres postgres
```

---


## 6. Admin Dashboard (New)
**Usage:** Open **Settings** in the macOS app → Scroll to **Administration** section (visible only to admins).

**New Server Tab:**
*   **Database Stats:** Real-time DB size and connection count.
*   **Router Status:** Edge Function health check (`/system/status`).
*   **Backups:** Displays the time and status of the last automated backup (read from `public.backup_logs`).
*   **Blocked Streams:** New tab to view and unblock streams (Blacklist).

### Blocked Streams (Jan 7, 2026)
A persistent blacklist table `public.blocked_streams` was added to permanently block bad files even if they bypass heuristic filters.
*   **Columns:** `stream_hash` (PK), `filename`, `provider`, `reason`.
*   **Logic:** The `StreamResolver` checks this list before playing. `VerifiedStreams` also respects it.
*   **Admin UI:** You can block a stream from the "Reported Streams" list (Red Hand icon). This also auto-unverifies the stream.

---

## 7. Database Migrations

To apply new SQL migrations (e.g. from `supabase/migrations/`) to the production server:

**Option 1: Via SSH (Recommended)**
1.  Copy the SQL file to the server (or just copy the content).
2.  Run the following command (pipes content to the database container):

```bash
# If file is local to the server:
cat migration.sql | docker exec -i supabase-db psql -U postgres postgres

# If pasting content directly:
docker exec -i supabase-db psql -U postgres postgres
# (Paste SQL content, then press Ctrl+D)
```

**Option 2: One-Liner from Local Machine**
```bash
cat supabase/migrations/YOUR_MIGRATION.sql | ssh root@151.243.109.243 "docker exec -i supabase-db psql -U postgres postgres"
```

**Option 3: Automated (Expect Script)**
If `sshpass` is missing, you can use `expect` to handle the password prompt automatically. This is what the AI assistant uses.

```bash
expect -c 'spawn scp -o StrictHostKeyChecking=no supabase/migrations/YOUR_MIGRATION.sql root@151.243.109.243:/root/migration.sql; expect "password:"; send "123Scarface123!\r"; expect eof'
expect -c 'spawn ssh root@151.243.109.243 "cat /root/migration.sql | docker exec -i supabase-db psql -U postgres postgres"; expect "password:"; send "123Scarface123!\r"; expect eof'
```




### Security Migration (01/2026)
To fix the Security Audit issues (Hardcoded Secrets), you must run the `database-migration-fix-logs-rls.sql` migration.
This script sets up:
1. Public RLS for App Logs (no credentials needed to report crashes).
2. Secure Admin RPCs (`get_admin_logs`) that check your Public Key and Signature to allow viewing logs.

### Room Creation History Migration (01/09/2026)
**Migration:** `20260109000000_room_creation_history.sql`

Fixes the free user room limit bypass. Previously, the 72-hour limit didn't work because rooms are deleted when hosts leave, resetting the counter. This migration:
1. Creates `room_creation_history` table to persistently track room creation events
2. Updates `check_room_creation_limits()` trigger to check history table instead of ephemeral `rooms` table
3. Enables RLS and adds cleanup function for old records

---

## 8. Production Wallet Secrets
> [!CAUTION]
> **CRITICAL SECURITY INFORMATION**
> These keys control the funds collected by the application.
> **DO NOT SHARE THIS SEED PHRASE.**
> Store it safely offline (Paper/Metal backup). The server only needs the XPUBs (Public Keys) to generate addresses; it does NOT need the Private Key or Seed Phrase.

**Seed Phrase (Mnemonic):**
`moment absent unfair song unusual neck panther asset clock conduct doll voice`

**Derivation Paths:**
*   **BTC:** `m/84'/0'/0'` (Native Segwit / BIP84)
*   **EVM (ETH/Base):** `m/44'/60'/0'` (Standard BIP44)

**Extended Public Keys (XPUBs) - Injected into Server:**
*   **XPUB_BTC:** `xpub6CNJnaQ1bu7oLQH4g8ZGSJUbVtRLqu3ikYm9PhiFohEb9LdFCsz4QTK1aWob5nR1P7uzDmRR7GKm5aJvKgzrrWmh6CahF95K5Vtb3TgzLoq`
*   **XPUB_EVM:** `xpub6CUocXeQEa3MZ7QWXn4uwjcaXS2y84MAN1KTQRq9TscPvJk5kMj4fSKYxNC1ooyAf9ysT15cwJW3UP6HEcCPUKVu67wwoKqsyJNAeWQ6i1y`

**Usage:**
*   **Importing to Wallet:** Use the Seed Phrase in MetaMask, electrum, or Ledger to access funds.
*   **Server Config:** These XPUBs are set in `/root/supabase/docker/docker-compose.yml` (injected via `.env`).
