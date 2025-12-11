# RedLemon - Path to Perfection
## No rush. Just excellence.

---

## 🎯 Philosophy: Best-in-Class

RedLemon should be:
- **Faster than Plex** (native, no web overhead)
- **Smoother than IINA** (better integrations)
- **More social than anything** (watch parties done right)
- **More private than streaming services** (optional username, no tracking)
- **Open and transparent** (open source, no vendor lock-in)

---

## 🚀 Beta Launch Strategy

### Beta Period (2 months)
- **Everything is FREE** during beta
- Focus on user feedback and stability
- Gather metrics on room usage, concurrent users
- Test all features thoroughly before monetization

### Post-Beta (Production)
- **Free tier**: Browse, search, play content solo, join watch party rooms
- **Paid tier**: Host watch party rooms (Bitcoin/Lightning payment)
- Remote config flag switches from beta mode to production mode

---

## 📋 Phase 1: Perfect the Foundation

### Video Player Core
- [x] MPV integration working
- [x] Hardware acceleration
- [x] Subtitle loading (ZIP, SRT→VTT)
- [ ] **Refinement Needed:**
  - [ ] Subtitle timing fine-tuning controls
  - [ ] Audio track selection UI
  - [ ] Quality switching (if multiple streams available)
  - [ ] Remember playback position per media
  - [ ] Skip intro/outro detection (like Plex)

### Media Discovery
- [x] Search (movies + TV)
- [x] Browse functionality
- [x] Season/episode selection
- [ ] **Refinement Needed:**
  - [ ] Recommendations (based on watch history)
  - [ ] Continue watching row
  - [ ] Recently added
  - [ ] Genres/categories
  - [ ] IMDb ratings display
  - [ ] Trailers (YouTube API)

### Auto-Updates ✅ COMPLETE
- [x] GitHub Releases for DMG hosting
- [x] UpdateManager with checksum verification
- [x] Update UI with release notes
- [x] Sparkle integration working

### Social Features (Partially Complete)
- [x] 4-character room codes (e.g., "K7M2")
- [x] MySpace Tom auto-friend feature (`lemontom`)
- [x] Friend system
- [ ] Friend invite links
- [ ] Friend activity feed
- [ ] Watch history sharing

### Performance
- [x] VS Code optimized
- [x] Build works flawlessly
- [ ] **Refinement Needed:**
  - [ ] App startup time profiling
  - [ ] Memory leak checks (Instruments)
  - [ ] Launch time under 1 second
  - [ ] No dropped frames during playback

---

## 📋 Phase 2: Watch Parties (Do It Right)

### Infrastructure ✅
- [x] Supabase Realtime integration
- [x] Username system working
- [x] WebRTCManager Swift code complete
- [ ] WebRTC.xcframework integration (if upgrading from WS)

### Core Sync Engine (Build This First)
- [x] **Latency Measurement System**
  - [x] Ping/pong protocol
  - [x] Moving average (10 samples)
  - [x] Outlier detection

- [x] **Sync Algorithm (Syncplay + WatchParty-grade)**
  - [x] Timestamp prediction with latency compensation
  - [x] Drift detection (>0.05s, >0.5s, >2.0s thresholds)
  - [x] Tiered speed adjustment (1.025x subtle, 1.25x aggressive)
  - [x] Hard seek for large desyncs (>2s)
  - [x] Median leader selection

- [ ] **Edge Case Handling**
  - [ ] Reconnection logic (guest drops, comes back)
  - [ ] Late joiners (sync to current position)
  - [ ] Host migration (if host leaves, promote guest)
  - [ ] Buffering state sync

### Watch Party UI/UX
- [ ] **Room Creation Flow**
  - [ ] "Create Watch Party" button
  - [ ] Room code generation
  - [ ] Copy code button
  - [ ] QR code generation (for mobile sharing)

- [ ] **In-Room Experience**
  - [ ] Guest list sidebar (avatars, usernames)
  - [ ] Host indicator (crown icon)
  - [ ] Sync status indicator
  - [ ] Chat overlay (text messages)
  - [ ] Emoji reactions
  - [ ] "Request control" feature

---

## 📋 Phase 3: Monetization (Bitcoin/Lightning)

**Goal:** Sustainable, private monetization via LNBits.

### Strategy: "The Hidden Host License"
- **Model:** One-time payment (or subscription) to unlock "Host" capability.
- **Backend:** LNBits (Lightweight, modular, Python-based).
- **Launch State:** Disabled (Free Beta).
- **Post-Beta State:** Enabled (Paid Host License).

### Implementation Plan

#### 1. LNBits Setup (Backend)
- Deploy LNBits instance (e.g. on Fly.io or VPS)
- Create a "RedLemon Store" wallet
- Secure the `Read/Invoice` API Key

#### 2. Client-Side Logic (The "Gate")
- **New Component:** `PaymentGateView`
    - Checks `UserDefaults` for `isHostLicenseActive`
    - If false, shows "Upgrade to Host" screen
- **API Client:** `LNBitsClient`
    - `createInvoice(amount: satoshis, memo: "RedLemon Host License")`
    - `checkPaymentStatus(paymentHash: String)`

#### 3. Subscription Management (Future)
- Design subscription database schema
- Build subscription API
- Create admin dashboard for managing users

#### Revenue Projections (Conservative)
- Target: $5/month (Basic) to $25/month (Enterprise)
- Estimated Year 1: ~$3,000 revenue
- Low overhead (self-hosted or cheap VPS)

---

## 📋 Phase 4: Social & Discovery

### Friends System
- [ ] Add friends by username
- [ ] See what friends are watching (opt-in)
- [ ] "Watch with friend" quick invite
- [ ] Friend activity feed
- [ ] Private watch parties (friends only)

### Public Rooms
- [ ] Browse public watch parties
- [ ] Join open rooms
- [ ] Room categories (Movies, TV Shows, Anime, etc.)
- [ ] Room moderation tools

### Profiles
- [ ] User profiles with stats
- [ ] Avatar upload
- [ ] Bio/status
- [ ] Watch streak tracking

---

## 📋 Phase 5: Advanced Features

### Multi-Source Support
- [ ] Multiple debrid services (AllDebrid, Premiumize)
- [ ] Direct torrent streaming (via WebTorrent)
- [ ] Local file playback
- [ ] Jellyfin/Plex library integration

### Download Management
- [ ] Download manager UI
- [ ] Storage management aka "Offline Mode"

### Mobile Companion App (iOS)
- [ ] Remote control
- [ ] Chat participation
- [ ] Browse and queue media

---

## 📋 Phase 6: Polish & Perfection

### UI/UX Refinement
- [ ] Dark mode perfection
- [ ] Light mode support
- [ ] Localization (i18n)
- [ ] Onboarding tutorial

### Performance Optimization
- [ ] Lazy loading everywhere
- [ ] Image caching strategy
- [ ] Startup time under 0.5s

### Security
- [ ] Code signing (Developer ID)
- [ ] Notarization (macOS)
- [ ] Keychain hardening

---

## 🎯 Success Metrics

### Performance Benchmarks
- [ ] **Startup time**: < 0.5s
- [ ] **Memory usage**: < 200MB idle
- [ ] **Sync latency**: < 100ms
- [ ] **Network usage**: Efficient, no unnecessary polling

### User Experience Goals
- [ ] **Intuitive**: No tutorial needed
- [ ] **Reliable**: No crashes
- [ ] **Beautiful**: Pixel-perfect design

---

## 🚀 Development Principles

1. **No Technical Debt**: Fix it right, not fast
2. **User First**: Every decision from user's perspective
3. **Performance Obsession**: Profile, optimize, repeat
4. **Beautiful Code**: Others should enjoy reading it
5. **Open Source**: Build in public, accept contributions
6. **Privacy Matters**: No tracking, no data collection