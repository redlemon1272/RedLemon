# ⚠️ CRITICAL: LNBits Backend Configuration

## Current Status: TESTING ONLY (FakeWallet)

**DO NOT USE IN PRODUCTION!**

### What is FakeWallet?
LNBits is currently configured with `FakeWallet` backend. This means:
- ✅ Invoices are generated (QR codes work)
- ✅ You can test the payment flow
- ❌ **NO REAL MONEY** - Payments are simulated
- ❌ **NOT PRODUCTION READY**

### Current Configuration
```bash
LNBITS_BACKEND_WALLET_CLASS=FakeWallet
```

---

## Before Production Launch: REPLACE WITH REAL BACKEND

You **MUST** configure a real Lightning backend before accepting real payments.

### Option 1: Voltage Cloud (Recommended for Beta)
**Best balance of sovereignty and ease**

**Pros:**
- ✅ No KYC required
- ✅ Your own Lightning node
- ✅ Non-custodial (you control keys)
- ✅ Managed infrastructure
- ✅ Ready in 10 minutes

**Cons:**
- ❌ ~$10/month cost
- ❌ Trust Voltage to run infrastructure

**Setup:**
1. Sign up at https://voltage.cloud (use alias email if desired)
2. Create a new LND node
3. Get the LNDhub connection URL
4. Update LNBits environment:
   ```bash
   docker stop lnbits
   docker rm lnbits
   docker run -d --name lnbits -p 5000:5000 \
     -v lnbits-data:/app/data \
     -e LNBITS_BACKEND_WALLET_CLASS=LndRestWallet \
     -e LND_REST_ENDPOINT=https://your-voltage-node.m.voltageapp.io:8080 \
     -e LND_REST_MACAROON=your_admin_macaroon \
     --restart unless-stopped \
     lnbits/lnbits:latest
   ```

---

### Option 2: Your Own LND Node (Maximum Sovereignty)
**Full control, but requires infrastructure**

**Pros:**
- ✅ Complete sovereignty
- ✅ No third parties
- ✅ No monthly fees (after setup)

**Cons:**
- ❌ Requires Bitcoin Core (~500GB)
- ❌ Requires LND setup
- ❌ Requires channel management
- ❌ 2-4 hours setup time

**Requirements:**
- Bitcoin Core (full node)
- LND or Core Lightning
- Inbound liquidity (open channels)
- Static IP or Tor

**Setup Guide:**
1. Install Bitcoin Core on AnonVM
2. Install LND
3. Open channels for inbound liquidity
4. Configure LNBits to use your LND node

---

### Option 3: LNDhub (BlueWallet) - Custodial
**Easiest but custodial**

**Pros:**
- ✅ No KYC
- ✅ Works immediately
- ✅ Free

**Cons:**
- ❌ Custodial (BlueWallet holds funds)
- ❌ Less sovereignty

**Setup:**
1. Download BlueWallet app
2. Create Lightning wallet
3. Get LNDhub URL from wallet settings
4. Configure LNBits with LNDhub backend

---

## Migration Checklist

Before going live with real payments:

- [ ] Choose a backend (Voltage recommended for beta)
- [ ] Set up the Lightning node/service
- [ ] Update LNBits Docker configuration
- [ ] Test with small payment (10-100 sats)
- [ ] Verify webhook receives payment confirmation
- [ ] Test full flow: invoice → payment → license unlock
- [ ] Update `LNBITS_URL` in Supabase secrets (if needed)
- [ ] Document backup/recovery for Lightning node

---

## Testing with FakeWallet

While in FakeWallet mode, you can test the flow:
1. Generate invoice (QR code appears)
2. Manually mark invoice as paid in database:
   ```sql
   UPDATE invoices SET status = 'paid' WHERE payment_hash = 'xxx';
   UPDATE users SET is_host = true WHERE id = 'user_id';
   ```
3. App detects payment via polling
4. License unlocks

---

## Current LNBits Instance

**URL:** http://151.243.109.217:5000
**Wallet:** Redlemon Store
**Backend:** FakeWallet (TESTING ONLY)
**API Key:** 680b5f628f2945a0a451ff5b9f92f8ec

---

## ⚠️ REMINDER

**FakeWallet is for TESTING ONLY.**

Before beta launch with real users, you MUST:
1. Configure a real Lightning backend
2. Test with real sats
3. Verify the entire payment flow works

**Do not accept real payments with FakeWallet configured!**
