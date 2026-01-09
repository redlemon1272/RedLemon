# Security Audit Report 2026
**Date:** January 9, 2026
**Status:** ❌ FAILED - Critical vulnerabilities found

---

## Executive Summary

A security audit was performed on the RedLemon codebase following the migration to self-hosted Supabase. **Critical security vulnerabilities were identified**, including the exposure of the production server's root password in plain text and Logic flaws in Database functions allowing for IDOR (Insecure Direct Object Reference).

**Immediate action is required to secure the infrastructure.**

---

## 🚨 Critical Findings (Urgent)

### 1. Exposed Root Password
**Severity:** **CRITICAL**
**File:** `remote_exec.sh`, `remote_scp.sh`

The root password for the production server (`151.243.109.243`) is hardcoded in plain text in these scripts.

```bash
set password "123Scarface123!"
```

**Risk:** Anyone with access to the codebase can gain full **root access** to your production server. They can delete all data, install malware, or access all user data.
**Impact:** Total compromise of infrastructure.
**Remediation:**
1.  **IMMEDIATELY CHANGE THE ROOT PASSWORD** on the server.
2.  Remove `remote_exec.sh` and `remote_scp.sh` from the repository.
3.  Use SSH Keys for authentication instead of passwords.
4.  Scrub the git history to remove these files from previous commits (using `git filter-repo` or BFG).

---

## 🔴 High-Risk Findings

### 2. IDOR in Payment Assignment RPC
**Severity:** **HIGH**
**File:** `supabase/migrations/20251212000000_payment_pools.sql`

The function `assign_payment_address(p_chain TEXT, p_user_id UUID)` takes `p_user_id` as an argument and blindly uses it.

```sql
UPDATE payment_pools
SET status = 'assigned',
    assigned_to_user_id = p_user_id, -- Uses input directly
    ...
```

**Risk:** An authenticated attacker can call this function for *any other user ID*. This allows them to:
*   Assign payment addresses to other users, potentially confusing the payment system.
*   Exhaust the pool of available addresses by assigning them all to random users.
**Remediation:**
Modify the function to use `auth.uid()` instead of accepting `p_user_id` as a parameter.

```sql
-- Fix
DECLARE
  v_user_id UUID := auth.uid(); -- Use the authenticated user's ID
BEGIN
  -- Use v_user_id in logic
```

### 3. IDOR in Room Heartbeat RPC
**Severity:** **HIGH**
**File:** `supabase/migrations/20260105000000_room_heartbeat.sql`

The function `room_heartbeat(p_room_id text, p_user_id uuid)` allows specifying the user ID.

```sql
UPDATE public.room_participants
SET last_seen = NOW()
WHERE room_id = p_room_id AND user_id = p_user_id;
```

**Risk:** An attacker can keep any user's session alive indefinitely or spoof activity for other users.
**Remediation:**
Modify the function to enforce `user_id = auth.uid()`.

---

## 🟡 Medium-Risk Findings

### 4. Supabase Configuration
**Severity:** Low (Expected for Client Apps)
**File:** `Sources/App/Config.swift`

The Supabase Anon Key and URL are hardcoded.
*   URL: `https://151.243.109.243.nip.io`
*   Key: `eyJhb...`

This is standard for client-side applications, but it relies heavily on your Postgres RLS policies being perfect. Given the IDOR issues found above, this highlights the importance of fixing the RPC functions.

---

## Recommendations

1.  **Emergency Password Change:** Change the root password for `151.243.109.243` immediately.
2.  **Switch to SSH Keys:** Configure SSH key-based authentication for deployments and CI/CD. Disable password login for SSH.
3.  **Fix Postgres Functions:** Update `assign_payment_address` and `room_heartbeat` to use `auth.uid()`.
4.  **Git History Cleanup:** You must rewrite git history to remove the exposed password, otherwise it remains accessible in the history.
