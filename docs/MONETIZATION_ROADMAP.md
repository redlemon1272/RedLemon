# RedLemon Monetization Roadmap

> [!NOTE]
> **Current Strategy: Automated Address Pools (Serverless)**
> We are proceeding with a **"Direct Username Grant"** model using **Pre-Generated Address Pools**.
> *   **No Private Keys Online**: We pre-generate 1,000+ "clean" addresses for BTC, ETH (Base/Arb), and SOL offline.
> *   **No Dedicated Server**: We rely on Supabase Edge Functions + Public APIs (Etherscan, Mempool) for verification.
> *   **Automation**: Users pay -> System detects payment -> System grants `is_premium` to Username.

---

## 🏗️ Architecture Overview

### 1. The Core Components
1.  **Supabase Database**:
    *   `payment_pools`: Stores unused addresses (`chain`, `address`, `status`).
    *   `transactions`: Records incoming payments.
    *   `users`: Has an `is_premium` boolean flag.
2.  **Edge Functions**:
    *   `assign-address`: Locks an idle address for 24h for a specific user.
    *   `check-payment`: Polls public APIs (Mempool, Etherscan, Solscan) to see if the assigned address received funds.
3.  **Client (RedLemon App)**:
    *   UI to select Chain/Currency.
    *   Displays Address + QR Code.
    *   Polls/Websocket for "Success" confirmation.

### 2. Data Flow
1.  **User** clicks "Unlock Hosting" -> Selects "Ethereum (USDC)".
2.  **App** calls `assign-address` RPC.
3.  **Supabase** grabs a 'free' ETH address from pool -> marks as 'assigned' to UserID.
4.  **App** shows address `0x123...abc`.
5.  **User** sends 5 USDC.
6.  **Edge Function** (triggered by Cron or App polling) checks Etherscan for `0x123...abc`.
7.  **Edge Function** sees balance increase -> Updates `users.is_premium = true`.
8.  **App** receives Realtime update -> "Premium Unlocked! 🎉"

---

## 🪙 Supported Currencies & Chains

We will effectively support "Any Chain" by simply generating address pools for them.

| Chain | Currencies | Verification API | Implementation Status |
| :--- | :--- | :--- | :--- |
| **Bitcoin** | BTC, Satoshis | `mempool.space` | ✅ Priority |
| **EVM** (Base, Arb, ETH) | ETH, USDC, USDT | `etherscan.io`, `basescan.org` | ✅ Priority |
| **Solana** | SOL, USDC | `solscan.io` (or RPC) | ⏳ Secondary |

---

## 📋 Implementation Steps

### Phase 1: Database & Address Pools
- [ ] Create `payment_pools` table (chain, address, assigned_to_user_id, status).
- [ ] Create `payment_txs` table (user_id, tx_hash, amount, currency).
- [ ] Add `is_premium` (boolean) to `users` table.

### Phase 2: Edge Functions (The "Brain")
- [ ] `assign-address`: Logic to find an unused address, handle concurrency (SKIP LOCKED), and return it.
- [ ] `check-payment`: 
    - Adapter for Bitcoin (Mempool API).
    - Adapter for EVM (Etherscan/RPC).
    - Logic to verify amount >= Price.
    - Grant Premium access.

### Phase 3: Client UI
- [ ] **Settings -> Premium**: New UI with automated flow.
- [ ] **Crypto Selector**: Picker for "Pay with Bitcoin", "Pay with Base", etc.
- [ ] **QR Display**: Show the assigned unique address.
- [ ] **Success State**: Lottie animation when `is_premium` flips to true.

---

## 🔒 Security & Privacy

*   **Offline Generation**: Private keys are NEVER on the server. We only upload the public addresses.
*   **Privacy**: We only link "Address X" to "User Y" temporarily to verify payment. 
*   **Safety**: If Supabase is hacked, no funds are lost (hacker only gets public addresses).

## ✅ Verdict: The "Set and Forget" Choice
This **Address Pool** architecture is the chosen long-term solution because:
1.  **Zero Maintenance**: No servers to patch, backup, or secure.
2.  **Multi-Chain**: Supports BTC, ETH, and SOL natively.
3.  **Resilient**: Relies on redundant public APIs, not a single node.
