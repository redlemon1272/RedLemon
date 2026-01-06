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
| **Location** | AnonVM (Netherlands/Panama) |

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

## 6. Automated Backups
**Status:** ✅ Active (Daily at 9:00 AM UTC)

*   **Script:** `/root/backup.sh`
*   **Destination:** `/root/backups/`
*   **Retention:** 7 Days

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

## 5. Client Configuration

Your **macOS App** (`Sources/App/Config.swift`) requires:

```swift
static let supabaseURL = "https://151.243.109.243.nip.io"
static let supabaseAnonKey = "eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9..."
```


*(Already updated in your codebase)*.

## 6. Admin Dashboard (New)
**Usage:** Press `Cmd+Shift+A` in the macOS app to open.

**New Server Tab:**
*   **Database Stats:** Real-time DB size and connection count.
*   **Router Status:** Edge Function health check (`/system/status`).
*   **Backups:** Displays the time and status of the last automated backup (read from `public.backup_logs`).

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



### Security Migration (01/2026)
To fix the Security Audit issues (Hardcoded Secrets), you must run the `database-migration-fix-logs-rls.sql` migration.
This script sets up:
1. Public RLS for App Logs (no credentials needed to report crashes).
2. Secure Admin RPCs (`get_admin_logs`) that check your Public Key and Signature to allow viewing logs.
