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
- **Paid tier**: Host watch party rooms (~0.1 ICP per room or ~1 ICP/month unlimited)
- Remote config flag switches from beta mode to production mode
- No app update needed - controlled via ICP canister

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
  - [ ] HDR/Dolby Vision support check

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
  - [ ] Rotten Tomatoes integration
  - [ ] Trailers (YouTube API)

### Auto-Updates ✅ COMPLETE
- [x] ICP canister deployed for version metadata
- [x] GitHub Releases for DMG hosting
- [x] Python proxy bundled in app (auto-starts)
- [x] UpdateManager with checksum verification
- [x] Update UI with release notes
- [x] v1.0.3 deployed and working

### Social Features (Partially Complete)
- [x] 4-character room codes (e.g., "K7M2")
- [x] MySpace Tom auto-friend feature (`lemontom`)
- [x] Friend system (Supabase-backed)
- [ ] Friend invites via username
- [ ] Friend activity feed
- [ ] Watch history sharing

### Performance
- [x] VS Code optimized
- [x] Build works flawlessly
- [ ] **Refinement Needed:**
  - [ ] App startup time profiling
  - [ ] Memory leak checks (Instruments)
  - [ ] Bundle size optimization
  - [ ] Launch time under 1 second
  - [ ] No dropped frames during playback

---

## 📋 Phase 2: Watch Parties (Do It Right)

### Infrastructure ✅
- [x] ICP canisters deployed (MAINNET LIVE: hn2om-kyaaa-aaaaj-qntta-cai)
- [x] Username system working
- [x] Python proxy working
- [x] ICPClient complete
- [x] WebRTC signaling endpoints added to canister
- [x] WebRTCManager Swift code complete
- [ ] WebRTC.xcframework installed
- [ ] Integration with MPVPlayerViewModel

### Core Sync Engine (Build This First)
- [x] **Latency Measurement System**
  - [x] Ping/pong protocol
  - [x] Moving average (10 samples)
  - [x] Outlier detection
  - [ ] Display latency in UI for debugging

- [x] **Sync Algorithm (Syncplay + WatchParty-grade)**
  - [x] Timestamp prediction with latency compensation
  - [x] Drift detection (>0.05s, >0.5s, >2.0s thresholds)
  - [x] Tiered speed adjustment (1.025x subtle, 1.25x aggressive)
  - [x] Hard seek for large desyncs (>2s)
  - [x] Median leader selection (for 3+ peers, WatchParty approach)
  - [ ] Pause state synchronization
  - [ ] Seek command propagation

- [ ] **Edge Case Handling**
  - [ ] Reconnection logic (guest drops, comes back)
  - [ ] Late joiners (sync to current position)
  - [ ] Host migration (if host leaves, promote guest)
  - [ ] Multiple seeks in quick succession
  - [ ] Buffering state sync
  - [ ] Network timeout handling

### HTTP Polling (MVP - Phase 2a)
- [ ] Host update loop (every 2s)
- [ ] Guest poll loop (every 2s)
- [ ] Exponential backoff on errors
- [ ] Visual sync indicator (in-sync vs drifting)
- [ ] Performance monitoring

### WebRTC Upgrade (Phase 2b - After HTTP works)
- [ ] Add WebRTC.framework dependency
- [ ] Signaling via ICP canister
- [ ] STUN/TURN server integration
- [ ] Data channel for sync messages
- [ ] Fallback to HTTP if WebRTC fails
- [ ] Sub-100ms latency target

### Watch Party UI/UX
- [ ] **Room Creation Flow**
  - [ ] "Create Watch Party" button on media detail
  - [ ] Room code generation and display
  - [ ] Copy code button
  - [ ] QR code generation (for mobile sharing)
  - [ ] Room privacy settings (public/private/invite-only)

- [ ] **Join Flow**
  - [ ] "Join Room" input field
  - [ ] Auto-join from shared link
  - [ ] Show room info before joining
  - [ ] File verification (ensure same torrent/debrid source)

- [ ] **In-Room Experience**
  - [ ] Guest list sidebar (avatars, usernames)
  - [ ] Host indicator (crown icon)
  - [ ] Sync status indicator (green = synced, yellow = syncing, red = desynced)
  - [ ] Chat overlay (text messages)
  - [ ] Emoji reactions (❤️ 😂 😮)
  - [ ] "Request control" feature (guest asks to pause/seek)
  - [ ] Kick/ban controls (host only)

- [ ] **Polish**
  - [ ] Smooth animations
  - [ ] Sound effects (join/leave sounds)
  - [ ] Notifications (X joined, Y left)
  - [ ] Presence indicators (typing, buffering)
  - [ ] Beautiful error messages

---

## 📋 Phase 3: Features That Set Us Apart

### Continue Watching / History
- [ ] SQLite database for watch history
- [ ] Store: imdbId, season, episode, timestamp, date
- [ ] "Continue Watching" row on home screen
- [ ] "Mark as watched" functionality
- [ ] Watch statistics (total hours, most watched genre)

### Smart Recommendations
- [ ] ML-based recommendations (CoreML)
- [ ] Based on watch history
- [ ] Similar to what you watched
- [ ] Trending in your taste
- [ ] Friend recommendations (if in watch party)

### Advanced Subtitle Features
- [ ] Dual subtitle support (native + translation)
- [ ] Subtitle search (OpenSubtitles API)
- [ ] Manual subtitle file loading
- [ ] Subtitle style customization
- [ ] Subtitle offset adjustment (timing sync)
- [ ] Font size/color/position controls

### Audio Features
- [ ] Audio normalization (ReplayGain)
- [ ] Audio boost control
- [ ] Audio delay adjustment
- [ ] Multi-audio track support
- [ ] Dolby Atmos pass-through

### Keyboard Shortcuts (Power User Features)
- [ ] Customizable hotkeys
- [ ] Show hotkey overlay (press ?)
- [ ] Global media keys support
- [ ] Touch Bar support (MacBook Pro)

### macOS Integration
- [ ] Menu bar quick access
- [ ] Notification Center integration
- [ ] Picture-in-Picture mode
- [ ] Desktop widget (Ventura+)
- [ ] Siri shortcuts
- [ ] Continuity Camera support (for watch party avatars)

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
- [ ] Report abuse system

### Profiles
- [ ] User profiles with stats
- [ ] Avatar upload (IPFS storage via ICP)
- [ ] Bio/status
- [ ] Favorite genres
- [ ] Watch streak tracking
- [ ] Achievements/badges

### Chat Features
- [ ] Persistent chat history (stored in ICP)
- [ ] Emoji picker
- [ ] GIF support (Tenor API)
- [ ] Reply to messages
- [ ] @mention users
- [ ] Markdown formatting
- [ ] Code sharing (for watch party links)

---

## 📋 Phase 5: Advanced Features

### Multi-Source Support
- [ ] Multiple debrid services (AllDebrid, Premiumize)
- [ ] Direct torrent streaming (via WebTorrent)
- [ ] Local file playback
- [ ] Network share support (SMB/NFS)
- [ ] Jellyfin/Plex library integration

### Download Management
- [ ] Queue downloads to watch offline
- [ ] Download manager UI
- [ ] Pause/resume downloads
- [ ] Storage management
- [ ] Auto-delete after watching

### Chromecast/AirPlay
- [ ] Cast to TV
- [ ] Remote control from phone
- [ ] Multi-room audio
- [ ] DLNA support

### Mobile Companion App (iOS)
- [ ] Remote control
- [ ] Chat participation
- [ ] Browse and queue media
- [ ] Notifications
- [ ] Watch on iOS (MPV iOS)

---

## 📋 Phase 6: Polish & Perfection

### UI/UX Refinement
- [ ] Dark mode perfection
- [ ] Light mode support
- [ ] Custom themes
- [ ] Accessibility (VoiceOver, keyboard navigation)
- [ ] Localization (i18n for multiple languages)
- [ ] Onboarding tutorial
- [ ] Empty states (beautiful placeholders)

### Performance Optimization
- [ ] Lazy loading everywhere
- [ ] Image caching strategy
- [ ] Prefetch metadata
- [ ] Background task optimization
- [ ] Memory footprint under 200MB idle
- [ ] Startup time under 0.5s

### Error Handling
- [ ] Graceful degradation
- [ ] Offline mode
- [ ] Retry logic with exponential backoff
- [ ] User-friendly error messages
- [ ] Automatic error reporting (opt-in)
- [ ] Connection quality indicators

### Testing
- [ ] Unit tests (80% coverage)
- [ ] Integration tests
- [ ] UI tests
- [ ] Performance tests
- [ ] Stress tests (100 guests in room)
- [ ] Network simulation (lag, packet loss)
- [ ] Beta testing program

### Security
- [ ] Code signing
- [ ] Notarization (macOS)
- [ ] Keychain hardening
- [ ] Rate limiting
- [ ] DDoS protection (ICP level)
- [ ] Encrypted room passwords (optional)
- [ ] 2FA support (TOTP)

### Analytics (Privacy-Respecting)
- [ ] Anonymous usage stats (opt-in)
- [ ] Crash reporting (opt-in)
- [ ] Performance metrics
- [ ] No personal data collection
- [ ] All data on ICP (decentralized)

---

## 📋 Phase 7: Launch Preparation

### Documentation
- [ ] User guide
- [ ] Video tutorials
- [ ] Developer docs (for contributors)
- [ ] API documentation (for ICP integration)
- [ ] FAQ
- [ ] Troubleshooting guide

### Marketing Materials
- [ ] Landing page
- [ ] Demo video
- [ ] Screenshots
- [ ] Press kit
- [ ] Reddit post
- [ ] Product Hunt launch
- [ ] Hacker News post

### Distribution
- [ ] Mac App Store submission
- [ ] Homebrew cask
- [ ] Direct download (GitHub releases)
- [ ] Auto-update system
- [ ] Crash reporter
- [ ] Feedback system

### Legal
- [ ] Privacy policy
- [ ] Terms of service
- [ ] DMCA compliance
- [ ] License selection (GPL-3.0 like IINA?)
- [ ] Contributor agreement

---

## 🎯 Success Metrics

### Performance Benchmarks
- [ ] **Startup time**: < 0.5s
- [ ] **Memory usage**: < 200MB idle, < 500MB playing
- [ ] **CPU usage**: < 5% idle, < 30% playing 4K
- [ ] **Sync latency**: < 100ms (WebRTC), < 2s (HTTP)
- [ ] **Network usage**: Efficient, no unnecessary polling

### User Experience Goals
- [ ] **Intuitive**: No tutorial needed for basic features
- [ ] **Fast**: Every action feels instant
- [ ] **Reliable**: No crashes, no bugs
- [ ] **Beautiful**: Pixel-perfect design
- [ ] **Accessible**: Everyone can use it

### Social Features
- [ ] **Active rooms**: 100+ concurrent watch parties
- [ ] **User retention**: 70%+ monthly active
- [ ] **NPS score**: 9+ (exceptional)

---

## 🚀 Development Principles

1. **No Technical Debt**: Fix it right, not fast
2. **Test Everything**: Write tests before features
3. **User First**: Every decision from user's perspective
4. **Performance Obsession**: Profile, optimize, repeat
5. **Beautiful Code**: Others should enjoy reading it
6. **Open Source**: Build in public, accept contributions
7. **Privacy Matters**: No tracking, no data collection
8. **Decentralized**: ICP for everything possible

---

## 📝 Current Priority Queue

### This Week (Foundation)
1. Fix any remaining video player issues
2. Add continue watching feature
3. Perfect subtitle system
4. Test Internet Identity login flow

### Next Week (Watch Party Core)
1. Build sync engine (HTTP polling MVP)
2. Latency measurement system
3. Room UI/UX
4. Guest list and chat

### Week 3 (Polish Watch Parties)
1. Edge case handling
2. Reconnection logic
3. Performance testing
4. User feedback round

### Week 4 (WebRTC)
1. Add WebRTC.framework
2. Implement data channels
3. Sub-100ms sync
4. Stress testing

---

## 🔐 Phase 3: Sovereign Infrastructure & Monetization

### 🔐 Identity & Security (IN PROGRESS ⚙️)
- [x] **Ed25519 Authentication (Per-User Identity)**
  - [x] Node.js proxy with @icp-sdk/core v4.2.1
  - [x] Ed25519KeyIdentity.fromSecretKey() for per-user principals
  - [x] Swift generates unique 32-byte seed per app (SecRandomCopyBytes)
  - [x] Seed stored in Keychain (icp_identity_seed key)
  - [x] Proxy receives seed via X-Identity-Seed header
  - [x] Each RedLemon app has unique, persistent principal
  - [ ] Test authenticated canister calls (createRoom)
  - [ ] Verify unique principals between app instances

**Implementation:** Per-user Ed25519 identity using documented methods:
```javascript
// Proxy: Ed25519KeyIdentity.fromSecretKey() (official @icp-sdk/core method)
const seed = new Uint8Array(32);  // from Swift app
const identity = Ed25519KeyIdentity.fromSecretKey(seed);
const agent = await HttpAgent.create({ host: 'https://icp-api.io', identity });
```

```swift
// Swift: Generate and store unique seed
var seed = Data(count: 32)
SecRandomCopyBytes(kSecRandomDefault, 32, &seed)
KeychainManager.shared.save(seed.base64EncodedString(), for: "icp_identity_seed")
```

**Architecture:**
- Swift app: Generates 32-byte seed → Stores in Keychain
- Swift app: Sends seed with each request (X-Identity-Seed header)
- Node.js proxy: Creates Ed25519KeyIdentity from seed → Signs ICP calls
- Result: Each app installation = unique principal
- Mainnet canister sees different msg.caller per user

### 🔄 Auto-Update System (ICP-Native)
**Goal:** 100% sovereign updates, no GitHub/centralized dependency

#### Phase 1: Config Canister
- [ ] Create config canister in icp-backend
- [ ] Define version config structure:
  ```motoko
  {
    version: "1.0.0",
    beta_mode: true,
    hosting_paywall: false,
    tipping_enabled: false,
    download_url: "https://<canister>.raw.icp0.io/RedLemon.dmg",
    changelog: "- Feature updates\n- Bug fixes",
    minimum_version: "0.9.0"  // Force update if below this
  }
  ```
- [ ] Implement query endpoint for version checks
- [ ] Add cycle monitoring query function

#### Phase 2: Swift Update Client
- [ ] Add version checking on app startup (RedLemonApp.swift)
- [ ] Fetch config from canister (http query)
- [ ] Compare current version vs latest version
- [ ] Store current version in Config.swift or Info.plist

#### Phase 3: Update UI
- [ ] Create UpdateAvailableModal.swift
- [ ] Display changelog in modal
- [ ] "Download Update" button → open download_url
- [ ] "Skip This Version" option (for non-critical updates)
- [ ] "Required Update" mode (for security fixes)

#### Phase 4: Asset Storage
- [ ] Create ICP asset canister for .dmg storage
- [ ] Upload RedLemon.dmg builds to asset canister
- [ ] Implement version history (last 3 versions)
- [ ] Document deployment process for updates

**Benefits:**
- ✅ Remote feature flags (beta_mode → production)
- ✅ No GitHub dependency
- ✅ Unstoppable updates via ICP
- ✅ Cycle costs: ~$1/year
- ✅ Can gate updates behind payments if needed

---

### 💰 Wallet System (ICP/ckBTC/ckETH)
**Goal:** Native crypto wallet using mnemonic-derived principal

#### Phase 1: Wallet UI
- [ ] Create Wallet tab in Settings
- [ ] Show balances:
  - [ ] ICP balance
  - [ ] ckBTC balance
  - [ ] ckETH balance
- [ ] "Receive" view:
  - [ ] Display principal ID
  - [ ] QR code generation
  - [ ] Copy address button
- [ ] "Send" view:
  - [ ] Token selection (ICP/ckBTC/ckETH)
  - [ ] Amount input with USD equivalent
  - [ ] Recipient address input
  - [ ] Transaction fee display
  - [ ] Confirm & send button

#### Phase 2: ICP Ledger Integration
- [ ] Add ICP Ledger canister client
- [ ] Implement balance query (account_balance)
- [ ] Implement transfer function
- [ ] Transaction confirmation UI
- [ ] Error handling (insufficient balance, invalid address)

#### Phase 3: ckBTC Ledger Integration
- [ ] Add ckBTC Ledger canister client (mxzaz-hqaaa-aaaar-qaada-cai)
- [ ] Query ckBTC balance
- [ ] Implement ckBTC transfers
- [ ] Display BTC price conversion

#### Phase 4: ckETH Ledger Integration
- [ ] Add ckETH Ledger canister client (ss2fx-dyaaa-aaaar-qacoq-cai)
- [ ] Query ckETH balance
- [ ] Implement ckETH transfers
- [ ] Display ETH price conversion

#### Phase 5: Transaction History
- [ ] Query ledger for transaction history
- [ ] Display sent/received transactions
- [ ] Show timestamps and amounts
- [ ] Link to ICP dashboard for details

**Architecture:**
```
Mnemonic (12 words)
    ↓
Principal ID (derived)
    ↓
Controls 3 wallets:
  - ICP Ledger account
  - ckBTC Ledger account
  - ckETH Ledger account
```

---

### 💸 Monetization System
**Business Model:** Free to browse/play/join, paid to host

#### Phase 1: Hosting License System
- [ ] **Canister Backend:**
  - [ ] Add license storage in main.mo:
    ```motoko
    type HostingLicense = {
      principal: Principal;
      type: { #perRoom; #monthly };
      expiry: ?Time;
      roomsHosted: Nat;
    };
    ```
  - [ ] Implement `checkHostingLicense(principal: Principal)` query
  - [ ] Implement `grantHostingLicense(principal, type, payment)` update
  - [ ] Store licenses in stable storage
  - [ ] Add license expiry checks

- [ ] **Swift Client:**
  - [ ] Query license status before room creation
  - [ ] Show "Unlock Hosting" modal if no license
  - [ ] Cache license locally (check every 24h)

#### Phase 2: Payment UI
- [ ] Create HostingPaymentModal.swift
- [ ] Show pricing options:
  - [ ] Per-room: 0.1 ICP (~$0.10)
  - [ ] Monthly unlimited: 1 ICP (~$1.00)
- [ ] Token selection (ICP/ckBTC/ckETH)
- [ ] Display equivalent USD value
- [ ] Show canister's payment address
- [ ] Payment confirmation screen
- [ ] Receipt/transaction ID display

#### Phase 3: Payment Verification
- [ ] User sends payment to canister
- [ ] Canister verifies transaction in ledger
- [ ] Grant hosting license on success
- [ ] Update user's license status
- [ ] Send confirmation to app
- [ ] Handle payment failures (refund logic)

#### Phase 4: Access Control
- [ ] Check license before "Create Room" button
- [ ] Show license status in UI:
  - [ ] "Free during beta" badge
  - [ ] "X rooms remaining" (per-room type)
  - [ ] "Subscription active until X" (monthly type)
- [ ] Block room creation if expired
- [ ] Graceful upgrade prompts

**Pricing Strategy:**
- **Beta (2 months):** Everything free, remote flag: `beta_mode = true`
- **Post-beta:** Enable via `hosting_paywall = true`
- **Revenue split:**
  - 50% → Cycle top-ups (self-sustaining)
  - 50% → Treasury (your canister wallet)

---

### 🎁 Tipping System
**Goal:** Let users tip hosts, optional platform fee

#### Phase 1: Tip UI
- [ ] Add "Tip Host 💛" button in watch party room
- [ ] Create TipHostModal.swift:
  - [ ] Show host's username and principal
  - [ ] Token selection (ICP/ckBTC/ckETH)
  - [ ] Amount input (with quick amounts: 0.1, 0.5, 1.0)
  - [ ] Optional message/note
  - [ ] Display USD equivalent
  - [ ] Confirm & send button

#### Phase 2: Direct Transfers
- [ ] Implement direct principal-to-principal transfer
- [ ] Use ledger transfer functions
- [ ] Show transaction confirmation
- [ ] Display in transaction history

#### Phase 3: Platform Fee (Optional)
- [ ] Implement 5-10% platform fee:
  ```
  User tips 1 ICP
  → 0.9 ICP to host
  → 0.1 ICP to platform canister
  ```
- [ ] Split transfer in canister logic
- [ ] Track platform revenue on-chain

#### Phase 4: Tip History
- [ ] Store tip records in canister:
  ```motoko
  type Tip = {
    from: Principal;
    to: Principal;
    amount: Nat;
    token: { #ICP; #ckBTC; #ckETH };
    timestamp: Time;
    message: ?Text;
  };
  ```
- [ ] Show "Tips Received" in profile
- [ ] Leaderboard for top tippers/hosts (optional)

**Enable via remote config:** `tipping_enabled = true` after beta

---

### 📊 Scaling Architecture (Future)
**Goal:** Handle 10k+ concurrent rooms

#### Current Setup (0-1000 rooms)
- Single canister: `hn2om-kyaaa-aaaaj-qntta-cai`
- Cycle monitoring via NNS dashboard
- Sufficient for beta + early production

#### Multi-Canister Architecture (1000+ rooms)
```
┌─────────────────────────────────────┐
│    Main Controller Canister         │
│  (routing, payments, config)        │
└──────────┬──────────────────────────┘
           │
    ┌──────┴───────┐
    │              │
┌───▼────┐  ┌─────▼─────┐  ┌──────────┐
│ Room   │  │   Room    │  │  Room    │
│ Can 1  │  │   Can 2   │  │  Can N   │
│(0-1k)  │  │(1k-2k)    │  │(Nk-Nk+1k)│
└────────┘  └───────────┘  └──────────┘
```

**Implementation Plan:**
1. Main canister tracks room count per child canister
2. When capacity hit (1000 rooms), spawn new canister
3. Dynamic routing to least-loaded canister
4. Cycles funded from hosting revenue (10% of payments)

**Cycle Management:**
- Monitor all canister balances
- Auto top-up from treasury when low
- Alert if treasury balance < 10 ICP

**Cost Projections:**
- 1,000 rooms: ~$5/year in cycles, $100 revenue → $95 profit
- 10,000 rooms: ~$20/year in cycles, $1000 revenue → $980 profit
- ICP is INSANELY cheap vs AWS/traditional hosting

**When to scale:**
- Implement at 500 active rooms
- Test multi-canister in testnet first
- Deploy gradually to production

---

## 📋 Phase 4: Content & Discovery (Anime Complete ✅)

### Browse Page
- [x] **Streaming Catalogs:**
  - [x] Netflix, Prime, Disney+, HBO Max, Apple TV+
  - [x] Peacock, Paramount+, Hulu
  - [x] Trending from Cinemeta
  - [x] Separate Movies and TV Shows tabs
- [x] **Anime Integration:**
  - [x] Kitsu addon (anime-kitsu.strem.fun)
  - [x] 14 trending anime series in TV Shows tab
  - [x] Kitsu metadata routing for artwork
  - [x] Episode title compatibility (Cinemeta + Kitsu)
  - [x] Type filtering (movies vs series)

### Refinements Needed
- [ ] Continue watching row (from watch history)
- [ ] Recommendations based on watch history
- [ ] Recently added content
- [ ] Genre/category filtering
- [ ] IMDb ratings display
- [ ] Rotten Tomatoes integration
- [ ] Trailers (YouTube API)

---

## 🧪 Testing & Quality Assurance

### Critical Tests (Before Beta Launch)
- [ ] **Mnemonic System:**
  - [ ] Test first-launch recovery phrase modal
  - [ ] Test mnemonic export from Settings
  - [ ] Test mnemonic import (delete keychain, restore)
  - [ ] Verify same principal restored
  - [ ] Test with multiple accounts

- [ ] **Watch Parties:**
  - [ ] 2-person sync test
  - [ ] 5-person sync test
  - [ ] High latency simulation (VPN)
  - [ ] Reconnection after disconnect
  - [ ] Mid-playback join behavior

- [ ] **Wallet System:**
  - [ ] Balance queries (ICP/ckBTC/ckETH)
  - [ ] Send transactions (testnet first!)
  - [ ] Receive transactions
  - [ ] Transaction history
  - [ ] Error handling (invalid address, insufficient funds)

- [ ] **Payment Flow:**
  - [ ] License check before hosting
  - [ ] Payment modal display
  - [ ] Payment verification in canister
  - [ ] License granting
  - [ ] Access control (block if expired)

- [ ] **Auto-Update:**
  - [ ] Version check on startup
  - [ ] Update modal display
  - [ ] Remote config flag changes
  - [ ] Beta mode → production mode transition

### Performance Testing
- [ ] Memory leak checks (Instruments)
- [ ] App startup time (<2s target)
- [ ] Video playback smoothness (no dropped frames)
- [ ] UI responsiveness during sync
- [ ] Canister query latency (<500ms)

---

4. Test Internet Identity login flow

### Next Week (Watch Party Core)
1. Build sync engine (HTTP polling MVP)
2. Latency measurement system
3. Room UI/UX
4. Guest list and chat

### Week 3 (Polish Watch Parties)
1. Edge case handling
2. Reconnection logic
3. Performance testing
4. User feedback round

### Week 4 (WebRTC)
1. Add WebRTC.framework
2. Implement data channels
3. Sub-100ms sync
4. Stress testing

---

## 📅 Development Priorities

### Immediate (This Week)
1. ✅ Test first-launch recovery phrase modal
2. ✅ Test mnemonic import/export flow
3. Start auto-update system (config canister)

### Short-term (Next 2 Weeks)
1. Complete auto-update system (Phase 1-3)
2. Begin wallet UI (Phase 1)
3. ICP Ledger integration (Phase 2)

### Medium-term (Next Month)
1. ckBTC/ckETH wallet support
2. Hosting license system backend
3. Payment UI implementation
4. Watch party sync refinements

### Long-term (Next 2 Months - Before Beta Ends)
1. Complete payment verification
2. Tipping system
3. Full testing suite
4. Beta feedback iteration
5. Production mode preparation

---

## �💬 Notes

**Why This Approach?**
- Build foundation solid first
- Watch parties are killer feature - do them right
- Social features make it sticky
- Performance makes it usable
- Polish makes it delightful
- **Sovereignty:** No centralized dependencies, ICP-native infrastructure
- **Self-sustaining:** Revenue funds infrastructure (cycles)

**No Compromises:**
- Don't ship buggy features
- Don't skip testing
- Don't ignore edge cases
- Don't forget accessibility
- Don't rush launch
- **Don't depend on centralized services**

**Timeline:**
- No deadline = no pressure = better quality
- Take time to get it right
- Beta test thoroughly (2 months, everything free)
- Listen to feedback
- Iterate until excellent
- Remote config controls production transition

**Business Model:**
- Free: Browse, search, play solo, join rooms
- Paid: Host rooms (~$0.10-$1.00 in crypto)
- Optional: Tipping for hosts (5-10% platform fee)
- Self-sustaining: Revenue → cycles → infrastructure
- Fully on-chain: Payments, licenses, tips all ICP-native

---

**Let's build something people will love for years.** 🍋