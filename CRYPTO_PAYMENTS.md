# Crypto Payment System - Source of Truth

**Last Updated:** December 2025  
**Status:** Live on Supabase (Project: `nhvsojszwfvcinkyvzmf`)

## 1. Overview
This system provides a serverless, non-custodial **Crypto Payment Gateway** for RedLemon.  
It replaces legacy 3rd-party services (like LNBits) with a custom **HD Wallet** architecture hosted on Supabase Edge Functions.

### Key Features
- **Non-Custodial**: Private keys never touch the server. Funds go directly to the owner's hardware/software wallet.
- **Multi-Chain**: Supports Bitcoin (BTC) and EVM Chains (Ethereum, Base, Arbitrum).
- **Multi-Asset**: Detects payments in Native ETH, USDC, and USDT.
- **Automated**: Derives unique addresses for every user to track payments automatically.

---

## 2. Architecture

### A. Extended Public Keys (xPubs)
The server uses **Extended Public Keys** (xPubs) to generate millions of unique "Receive Only" addresses without ever knowing the Private Key.
- **BTC Derivation**: `m/84'/0'/0'` (Native Segwit `zpub` standard).
- **EVM Derivation**: `m/44'/60'/0'` (Standard BIP44 Ethereum).

### B. Database Schema
1.  **`key_derivation_indices`**: Tracks the `next_index` for each chain (BTC/EVM) to ensure no two users get the same address.
2.  **`payment_pools`**: Maps a derived `address` to a `user_id`. (Status: `assigned`, `available`).
3.  **`payment_transactions`**: Logs every detected incoming payment (Chain, Currency, Amount, USD Value).
4.  **`users`**: Stores the `subscription_expires_at` timestamp.

### C. Edge Functions ("The Brains")

#### 1. `assign-address`
- **Trigger**: Called when a user opens the Payment Screen.
- **Logic**:
    1.  Checks `key_derivation_indices` for the next available index.
    2.  Derives a unique address using `ethers.js` (EVM) or `scure-bip32` (BTC).
    3.  Assigns this address to the User in `payment_pools`.
- **Security**: Uses `XPUB_BTC` and `XPUB_EVM` secrets.

#### 2. `check-payment`
- **Trigger**: Called by the User's App (polling) to check if they paid.
- **Logic**:
    1.  Retrieves the User's assigned address.
    2.  **Scans Blockchains**:
        *   **BTC**: Queries Mempool.space API.
        *   **EVM**: Queries RPCs for **Ethereum**, **Base**, and **Arbitrum** in parallel.
        *   **Tokens**: Checks `balanceOf` for **USDC** and **USDT** on all EVM chains.
    3.  **Calculates Value**: Fetches real-time prices (Coinbase API) to convert total detected funds to USD.
    4.  **Grants Access**:
        *   $4.00+ = 30 Days
        *   $7.00+ = 60 Days
        *   $10.00+ = 90 Days
    5.  Updates `users.subscription_expires_at`.

---

## 3. Configuration & Secrets

The system relies on these Supabase Secrets:

| Secret | Description |
| :--- | :--- |
| `XPUB_BTC` | Extended Public Key for Bitcoin (Base58 string start with `xpub`/`zpub`). |
| `XPUB_EVM` | Extended Public Key for Ethereum (Base58 string starting with `xpub`). |

### How to Regenerate Keys (If Lost/Compromised)
1.  Navigate to project root locally.
2.  Run the secure generator script:
    ```bash
    node generate-keys.js
    ```
3.  **Save the Seed Phrase**.
4.  Update Supabase:
    ```bash
    supabase secrets set XPUB_BTC="..." XPUB_EVM="..."
    ```

---

## 4. Deployment

If you change the TypeScript code in `supabase/functions/`, deploy using:

```bash
# Deploy Address Generator
supabase functions deploy assign-address --no-verify-jwt

# Deploy Payment Checker
supabase functions deploy check-payment --no-verify-jwt
```

---

## 5. Testing Guide

### Manual Test (Real Money)
Since this is "On-Chain", the best test is a real transaction. Chains like **Base** or **Arbitrum** are recommended due to low fees (<$0.10).

1.  **Open App**: Navigate to Premium/Subscription screen.
2.  **Select Chain**: Choose "Base" (or Eth/Arb).
3.  **Send Funds**:
    *   Send a small amount (e.g., $0.50 worth of ETH or USDC) to the QR code displayed.
4.  **Wait**:
    *   Wait ~30 seconds for the transaction to confirm on the blockchain.
    *   The app polls every few seconds.
    *   **Success**: The screen should turn Green, and "Premium Active" should appear.

### Debugging
If a payment is not detected:
1.  Check the **Supabase Dashboard > Edge Functions > Logs**.
2.  Look for `Check-Payment Scan` logs to see what balances the server sees.
    *   *Example Log*: `[{ chain: 'base', native: 0.002, usdc: 0, ... }]`
3.  Verify the address on a block explorer (e.g., [basescan.org](https://basescan.org)).

---

## 6. Client Integration (iOS)
- **File**: `SupabaseClient.swift`
- **Method**: `assignPaymentAddress(chain:)` -> Returns string.
- **Method**: `checkPaymentStatus()` -> Returns `(isPremium, expiresAt)`.
- **Logic**: The client relies entirely on the server to tell it if a payment occurred. It currently trusts the server's `subscription_expires_at` date.
