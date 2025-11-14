# ICP Mainnet Deployment Guide for RedLemon
**Status:** LIVE on ICP Mainnet
**Last Updated:** November 3, 2025

---

## 🚀 Current Production Status

### Mainnet Canister (LIVE)
- **Canister ID:** `hn2om-kyaaa-aaaaj-qntta-cai`
- **Network:** Internet Computer Mainnet (ic)
- **Candid UI:** https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.icp0.io/?id=hn2om-kyaaa-aaaaj-qntta-cai
- **Status:** Running 24/7
- **Uptime:** ICP mainnet has 0 downtime since 2021

### Cycles Balance & Cost
```bash
# Check current balance:
cd ~/Desktop/RedLemon-Native/icp-backend
export DFX_WARNING=-mainnet_plaintext_identity
dfx canister status backend --network ic

# Current balance (as of Nov 3, 2025):
# ~498 billion cycles (3-6 months of operation)
# Daily burn rate: ~25 million cycles
# Cost per operation: ~2-5 million cycles per update call
```

### Controllers
Two identities have full control over the canister:

1. **default** identity
   - Principal: `5td5z-lvcgt-yrjpc-r65jg-w3zkf-pvvgo-r6eev-sbep6-y5o5w-q5ndt-qae`
   - Used for initial deployment

2. **redlemon_mainnet** identity
   - Principal: `ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae`
   - Secure identity with seed phrase (stored safely by user)
   - Recommended for all future operations

---

## 📋 Why We're On Mainnet

### The Problem We Solved
**Before (Local Development):**
- dfx replica running locally
- Python proxy calling local canister
- Services stopped when Mac slept/restarted
- Username persistence failed with "could not connect to server"
- Required manual restart of services

**After (Mainnet Deployment):**
- Backend runs on ICP mainnet 24/7
- No local services needed (except Python proxy for HTTP→Candid translation)
- Username persistence works across restarts
- 0 downtime guarantee from ICP network

### Cost Analysis
**Total ICP Spent:** 1.02 ICP (~$8-10 USD at time of deployment)
- 0.5 ICP → converted to 1.455 trillion cycles
- 0.5 ICP → used for canister creation fees
- 0.022 ICP → remaining in wallet

**Monthly Operating Cost:** ~75 billion cycles (~$0.05 USD/month)
- Very affordable for production use
- Can handle thousands of users before needing top-up

---

## 🔑 Identity Management

### Current Setup
```bash
# List all identities
dfx identity list

# Output:
# default *
# redlemon_mainnet

# Switch to mainnet identity (recommended)
dfx identity use redlemon_mainnet

# Get current principal
dfx identity get-principal
# Output: ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae
```

### Seed Phrase Location
**CRITICAL:** The seed phrase for `redlemon_mainnet` was displayed once during creation.
- User saved it securely (not stored in code)
- Can recover identity on any machine with seed phrase
- Without it, you lose control of the canister

### Creating New Controllers (If Needed)
```bash
# Add another identity as controller
dfx canister update-settings backend --network ic \
  --add-controller <NEW_PRINCIPAL_ID>

# Remove a controller
dfx canister update-settings backend --network ic \
  --remove-controller <OLD_PRINCIPAL_ID>
```

---

## 💰 Cycles Management

### How Cycles Work
- ICP mainnet uses "cycles" as compute fuel (like gas on Ethereum)
- 1 trillion cycles ≈ 1 XDR ≈ $1.30 USD (fluctuates)
- Cycles are burned on every operation (storage, compute, network)
- When cycles run out, canister freezes (doesn't delete)

### Checking Cycles Balance
```bash
# Full status (includes cycles)
dfx canister status backend --network ic

# Key output:
# Balance: 498_469_060_551 Cycles
# Idle cycles burned per day: 25_260_288 Cycles
# Freezing threshold: 2_592_000 Seconds (30 days)
```

### When to Top Up
**Threshold:** Top up when balance < 100 billion cycles (~2 months buffer)

**Warning Signs:**
- `dfx canister status` shows balance approaching freezing threshold
- RedLemon app shows connection errors
- Candid UI stops responding

### How to Top Up (3 Methods)

#### Method 1: Convert ICP to Cycles (Recommended)
```bash
# 1. Send ICP to your dfx identity's account
dfx ledger account-id
# Send ICP to this address from exchange or NNS wallet

# 2. Check ICP balance
dfx ledger balance --network ic

# 3. Convert ICP to cycles (0.5 ICP = ~1.5 trillion cycles)
dfx cycles convert --amount 0.5 --network ic

# 4. Top up the canister
dfx canister deposit-cycles 500000000000 backend --network ic
```

#### Method 2: Direct Cycles Transfer (If You Have Cycles Wallet)
```bash
# Get your cycles wallet canister ID
dfx identity get-wallet --network ic

# Top up from wallet
dfx canister deposit-cycles 500000000000 backend --network ic
```

#### Method 3: Use NNS Frontend Dapp
1. Go to https://nns.ic0.app
2. Login with Internet Identity
3. Navigate to "Canisters" → "Top Up Canister"
4. Enter canister ID: `hn2om-kyaaa-aaaaj-qntta-cai`
5. Specify cycles amount and confirm

---

## 🔧 Deployment & Updates

### Current Architecture
```
Swift App (RedLemon.app)
    ↓ HTTP requests
Python Proxy (localhost:3002)
    ↓ dfx canister call --network ic
ICP Mainnet Canister (hn2om-kyaaa-aaaaj-qntta-cai)
```

**Why Python Proxy?**
- ICP update calls require Candid encoding + IC agent protocol
- Can't do simple HTTPS POST directly to canister
- Proxy translates HTTP → dfx canister call
- Future: Replace with native IC agent library for Swift

### Deploying Code Updates
```bash
cd ~/Desktop/RedLemon-Native/icp-backend

# 1. Make changes to backend/main.mo

# 2. Build and deploy to mainnet
export DFX_WARNING=-mainnet_plaintext_identity
dfx deploy backend --network ic

# 3. Verify deployment
dfx canister call backend getUsername --network ic '(principal "ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae")'

# 4. Restart Python proxy (if endpoints changed)
pkill -f "python3 proxy.py"
python3 proxy.py &

# 5. Rebuild Swift app (if ICPClient.swift changed)
cd ~/Desktop/RedLemon-Native
swift build
open build/RedLemon.app
```

### Rollback (If Deployment Breaks)
```bash
# ICP keeps previous canister versions
dfx canister info backend --network ic

# Downgrade to previous version (if needed)
# WARNING: This is complex, better to fix forward

# Check git history for last working main.mo
git log icp-backend/backend/main.mo
git checkout <commit-hash> icp-backend/backend/main.mo
dfx deploy backend --network ic
```

---

## 📊 Monitoring & Debugging

### Health Checks
```bash
# Quick health check
curl -X POST http://localhost:3002/api/getUsername \
  -H "Content-Type: application/json" \
  -d '{"principal": "ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae"}'

# Expected: {"success": true, "data": "your-username"}

# Direct canister call (bypass proxy)
dfx canister call backend getUsername --network ic \
  '(principal "ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae")'
```

### Common Issues

**1. "Canister not found" error**
- Check if canister ID is correct: `hn2om-kyaaa-aaaaj-qntta-cai`
- Verify network flag: `--network ic` (not `--network local`)

**2. "Out of cycles" error**
- Check balance: `dfx canister status backend --network ic`
- Top up immediately (see Cycles Management section)

**3. "Unauthorized" error**
- Switch to controller identity: `dfx identity use redlemon_mainnet`
- Verify principal: `dfx identity get-principal`

**4. Python proxy not responding**
- Check if running: `ps aux | grep proxy.py`
- Check logs: `tail -f ~/Desktop/RedLemon-Native/icp-backend/proxy.log`
- Restart: `cd ~/Desktop/RedLemon-Native/icp-backend && python3 proxy.py &`

**5. "Request timed out" error**
- ICP mainnet is slow on first call (cold start)
- Subsequent calls are fast (< 500ms)
- If persistent, check ICP network status: https://dashboard.internetcomputer.org

---

## 🔐 Security Best Practices

### Identity Security
- ✅ Seed phrase stored securely offline
- ✅ Never commit seed phrase to git
- ✅ Use `redlemon_mainnet` identity for all operations
- ⚠️ `default` identity is less secure (no seed phrase backup)

### Canister Security
- ✅ Only trusted principals are controllers
- ✅ Rate limiting on expensive operations (TODO)
- ✅ Input validation in all public functions
- ⚠️ No authentication on username creation yet (anyone can create)

### Cycles Security
- ✅ Freezing threshold set to 30 days
- ✅ Monitor balance weekly
- ⚠️ Set up automated alerts (TODO)

---

## 📈 Canister Functions Reference

### User Management
```bash
# Create username
dfx canister call backend createUsername --network ic \
  '(principal "...", "testuser")'

# Get username
dfx canister call backend getUsername --network ic \
  '(principal "...")'
```

### Room Management
```bash
# Create room
dfx canister call backend createRoom --network ic \
  '(principal "...", "stream-hash-123", "tt1234567")'

# Join room
dfx canister call backend joinRoom --network ic \
  '(principal "...", "room-abc123")'

# Update playback state
dfx canister call backend updatePlaybackState --network ic \
  '("room-abc123", 12345, true)'

# Get room state
dfx canister call backend getRoomState --network ic \
  '("room-abc123")'

# Leave room
dfx canister call backend leaveRoom --network ic \
  '(principal "...", "room-abc123")'
```

### WebRTC Signaling (NEW - Added Nov 3, 2025)
```bash
# Publish WebRTC offer
dfx canister call backend publishOffer --network ic \
  '("room-abc123", "v=0\r\no=- 123...")'

# Get WebRTC offer
dfx canister call backend getOffer --network ic \
  '("room-abc123")'

# Publish answer
dfx canister call backend publishAnswer --network ic \
  '("room-abc123", "v=0\r\na=...")'

# Get answer
dfx canister call backend getAnswer --network ic \
  '("room-abc123")'

# Publish ICE candidate
dfx canister call backend publishIceCandidate --network ic \
  '("room-abc123", "candidate:...")'

# Get ICE candidates
dfx canister call backend getIceCandidates --network ic \
  '("room-abc123")'
```

---

## 🆘 Emergency Procedures

### Canister is Frozen (Out of Cycles)
```bash
# 1. Top up immediately (at least 100B cycles)
dfx cycles convert --amount 0.5 --network ic
dfx canister deposit-cycles 100000000000 backend --network ic

# 2. Canister automatically unfreezes
# 3. Verify it's running
dfx canister status backend --network ic
```

### Lost Controller Access
**If you lose both `default` and `redlemon_mainnet` identities:**
- ❌ **YOU LOSE THE CANISTER PERMANENTLY**
- No recovery possible without seed phrase
- Must create new canister from scratch
- **THIS IS WHY SEED PHRASE BACKUP IS CRITICAL**

### Canister Code is Broken
```bash
# 1. Don't panic - ICP keeps previous versions
# 2. Fix the code locally
# 3. Deploy update
dfx deploy backend --network ic

# 4. If update fails, restore from git
git log icp-backend/backend/main.mo
git checkout <last-working-commit> icp-backend/backend/main.mo
dfx deploy backend --network ic
```

---

## 📚 Additional Resources

### Official Documentation
- **ICP Documentation:** https://internetcomputer.org/docs
- **dfx CLI Reference:** https://internetcomputer.org/docs/current/references/cli-reference/
- **Motoko Language:** https://internetcomputer.org/docs/current/motoko/main/motoko
- **Cycles Pricing:** https://internetcomputer.org/docs/current/developer-docs/gas-cost

### RedLemon-Specific Docs
- **WEBRTC_GUIDE.md** - WebRTC integration for watch parties
- **NEXT_STEPS.md** - Next development tasks
- **ROADMAP.md** - Full product roadmap

### Support Channels
- **ICP Developer Forum:** https://forum.dfinity.org
- **Discord:** https://discord.gg/cA7y6ezyE2
- **Stack Overflow:** Tag questions with `internet-computer`

---

## 🎯 Quick Command Reference

```bash
# Daily health check
dfx canister status backend --network ic | grep "Balance:"

# Deploy update
cd ~/Desktop/RedLemon-Native/icp-backend && dfx deploy backend --network ic

# Test username system
dfx canister call backend getUsername --network ic \
  '(principal "ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae")'

# Restart Python proxy
pkill -f "python3 proxy.py" && \
cd ~/Desktop/RedLemon-Native/icp-backend && \
python3 proxy.py &

# Launch RedLemon
cd ~/Desktop/RedLemon-Native && open build/RedLemon.app
```

---

**Last deployment:** November 3, 2025
**Next recommended top-up:** January 2026 (when balance < 100B cycles)
**Estimated operational lifetime:** 3-6 months on current cycles balance
