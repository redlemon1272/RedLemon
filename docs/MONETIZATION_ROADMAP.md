# RedLemon Monetization Roadmap: The "Premium Key" Model

## 🎯 Executive Summary

RedLemon is well-positioned to adopt a "Donation + Premium Utility" monetization model. However, the current **username-only authentication system** is insufficiently secure to attach premium status directly to user accounts (as anyone can spoof a username).

**Recommendation:** Implement a **"Premium Key" (License Key)** model.
- Users donate (Bitcoin/Lightning) to receive a unique key string (e.g., `RL-PRO-XXXX`).
- This key works like a software license or API key.
- The key unlocks "Premium Hosting" capabilities (larger rooms, higher bitrates) regardless of the username usage.

This approach **bypasses the need to rewrite the entire authentication system** while providing robust security for paid features.

---

## 🏗️ Architecture Overview

### 1. The Core Components
1.  **Payment Gateway**: Existing `LNBitsClient` (Lightning Network) to generate invoices and detect payments.
2.  **Key Vault**: A new Supabase table `premium_keys` to valid issuance and usage of keys.
3.  **Key Validation**: Supabase Edge Functions to validate keys during room creation.
4.  **Client UI**: New "Premium" settings tab for key redemption and status display.

### 2. Data Flow
1.  User opens **"Donate"** screen -> Selects amount -> QR Code generated via `LNBitsClient`.
2.  User pays Lightning Invoice.
3.  Backend (Webhook/Edge Function) detects payment -> Generates a **Premium Key**.
4.  Key is displayed to User (and optionally emailed if we add that later).
5.  User enters Key in **RedLemon Settings**.
6.  Key is stored in **Keychain** (not just UserDefaults).
7.  When Host starts a Watch Party -> App sends Key + standard room data.
8.  Server validates Key -> Grants **Premium Room Limits**.

---

## 🛠️ Implementation Steps

### Phase 1: Database Schema (Supabase)

We need a secure table to track keys. This table should NOT be publicly readable.

```sql
-- Premium Keys Table
create table premium_keys (
  id uuid primary key default gen_random_uuid(),
  key_code text unique not null,
  tier text default 'supporter', -- 'supporter', 'pro', 'whale'
  is_active boolean default true,
  max_guests int default 50,     -- Free tier is 5 (example)
  created_at timestamptz default now(),
  expires_at timestamptz,        -- Optional: specific expiration
  redeemed_by_user_id uuid       -- Optional: lock to first user who claims it?
);

-- RLS: Only Service Role (Edge Functions) can read/write this table.
-- Users cannot query this table directly to guess keys.
alter table premium_keys enable row level security;
```

### Phase 2: Payment Integration (Frontend)

Modify `LNBitsClient` and add a UI.

1.  **DonationView.swift**:
    *   UI with "Support RedLemon" banner.
    *   3 Tiers: "Coffee" ($5), "Server Time" ($10), "Pro Host" ($25).
    *   Call `LNBitsClient.createInvoice`.
    *   Display QR Code (using `CoreImage` QR generator).
    *   Poll for success.

2.  **Success Handling**:
    *   Upon payment confirmation, the LNBits callback (or Edge Function polling) should return the **Premium Key**.
    *   **Crucial**: The key must be generated securely server-side, not client-side.

### Phase 3: Premium Logic Enforcement (The "Quota" System)

**The "Real-Debrid Model"**: Premium status is sold in **Time Buckets** (e.g., 30 Days, 90 Days, 180 Days).
*   **Free Users**:
    *   **1 Room per 48 hours**. (Prevents couples from alternating daily hosting to bypass limits).
    *   **Max Playlist Size: 1 Item**.
*   **Premium Key Holders**:
    *   **Unlimited hosting** & **Unlimited playlist** for the duration of their key.

**1. Room Creation Logic (`create_premium_room` RPC):**

```sql
create or replace function create_premium_room(
  p_room_id text,
  p_host_id uuid,
  p_premium_key text default null
) returns json as $$
declare
  v_is_premium boolean := false;
  v_recent_room_count int;
begin
  -- 1. Check Premium Key Validity AND Expiration
  if p_premium_key is not null then
    select true into v_is_premium
    from premium_keys
    where key_code = p_premium_key 
      and is_active = true
      and expires_at > now(); -- Key must not be expired
  end if;

  -- 2. If NOT Premium, enforce 48-hour limit
  if not v_is_premium then
    select count(*) into v_recent_room_count
    from rooms
    where host_user_id = p_host_id
      and created_at > now() - interval '48 hours';

    if v_recent_room_count >= 1 then
       return json_build_object('success', false, 'error', 'Free limit reached (1 host every 48h). Upgrade for unlimited!');
    end if;
  end if;

  -- 3. Create Room
  insert into rooms (id, host_user_id, ...)
  values (p_room_id, p_host_id, ...);

  return json_build_object('success', true);
end;
$$ language plpgsql security definer;
```

**2. Playlist Logic (RLS or RPC):**

(Same as before: Premium users get unlimited items, Free users get 1 item max).

### Phase 4: UI Changes

1.  **Settings > Monetization**:
    *   "Enter Premium Key" text field.
    *   **Action**: "Donate & Upgrade" button -> Opens Donation View.
2.  **Lobby Creation**:
    *   If Free User: Show "Daily Rooms Remaining: 1/1" or "0/1".
    *   If Premium: Show "Premium Active: Unlimited Hosting".

---

## 🔒 Security Considerations

1.  **Key Leaking**: Since the key is the only proof of purchase, users shouldn't stream their Settings screen.
    *   *Mitigation*: Mask the key in UI (e.g., `RL-PRO-••••`).
2.  **Key Sharing**: A user could share their key with friends.
    *   *Mitigation*: Rate limiting. One key = One active room at a time.
    *   *Mitigation*: "Soft binding". The first time a key is used, bind it to that `user_id` in the DB. If a different `user_id` tries to use it, block it (or warn).
3.  **Authentication**: We are deliberately **accepting** that the `user_id` itself is insecure, so we rely 100% on the `premium_key` for authorization of privileges.

## 📅 Phasing

*   **Week 1**: Design DB Schema & Edge Functions.
*   **Week 2**: Build `DonationView` & Key Generation logic.
*   **Week 3**: Implement Key Validation in Room Creation (RPC).
*   **Week 4**: UI Polish & Release.
