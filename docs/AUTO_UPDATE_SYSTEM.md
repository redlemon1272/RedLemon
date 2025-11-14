# RedLemon Auto-Update System
**Last Updated:** November 8, 2025
**Status:** ⚠️ **DEPRECATED** - This document describes the old ICP-based system

---

## ⚠️ IMPORTANT NOTICE

**This documentation is outdated.** RedLemon now uses the industry-standard **Sparkle framework** for auto-updates, NOT the ICP canister system described below.

### Current Auto-Update System (v1.0.5+)

**Technology:** Sparkle 2.8.0 framework (Swift Package Manager)

**Architecture:**
- Sparkle framework handles all update logic
- `appcast.xml` feed hosted on GitHub
- DMG files hosted on GitHub Releases
- Code signing validation (ad-hoc for dev, Developer ID for production)
- Native macOS update UI

**Deployment Process:**
1. Update version in `build-app-debug.sh`
2. Build: `./build-app-debug.sh`
3. Create DMG: `./build-dmg.sh`
4. Upload DMG to GitHub Releases
5. Update `appcast.xml` with version and file size
6. Push appcast.xml to GitHub

**Configuration:**
- Info.plist: `SUFeedURL`, `SUEnableAutomaticChecks`, `SUAllowsInsecureUpdates`
- UpdateManager: `Sources/Services/UpdateManager.swift`
- Appcast: `https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml`

**See:** Sparkle documentation at https://sparkle-project.org/documentation/

---

## 🗂️ Historical Documentation (ICP-based System)

The content below describes the **deprecated** ICP canister-based auto-update system used in v1.0.3 and earlier. It is preserved for historical reference only.

---

## 🎯 Overview (DEPRECATED)

RedLemon **used to use** a hybrid decentralized auto-update system combining:
- **ICP Canister** - Stores metadata, checksums, version history (Internet Computer Protocol)
- **GitHub Releases** - Hosts DMG files (fast CDN delivery)
- **Bundled Python Proxy** - Translates HTTP ↔ Candid (automatically starts with app)

### Why This Architecture?

1. **ICP for Trust** - Immutable version metadata, cryptographic verification
2. **GitHub for Speed** - Fast CDN downloads, no canister size limits
3. **Bundled Proxy** - Zero setup for end users, seamless experience

---

## 🏗️ Architecture

```
User Opens RedLemon.app
    ↓
App auto-starts bundled proxy.py (port 3847)
    ↓
UpdateManager checks localhost:3847/api/updates/check
    ↓
Proxy queries ICP canister (metadata + checksum)
    ↓
Returns: {version, downloadUrl, checksum, releaseNotes}
    ↓
App downloads DMG from GitHub Releases URL
    ↓
Verifies SHA-256 checksum against ICP value
    ↓
Mounts DMG and installs update
    ↓
Relaunches app
```

### Components

#### 1. ICP Canister (`hn2om-kyaaa-aaaaj-qntta-cai`)
**File:** `icp-backend/backend/main.mo`

Stores version metadata:
```motoko
type AppVersion = {
  version: Text;           // "1.0.3"
  buildNumber: Nat;        // 3
  releaseNotes: Text;      // Feature description
  minOSVersion: Text;      // "13.0"
  fileSize: Nat;           // Bytes
  checksum: Text;          // SHA-256 hash
  downloadUrl: Text;       // GitHub Releases URL
  uploadedAt: Time.Time;   // Timestamp
  isRequired: Bool;        // Force update?
};
```

**Key Functions:**
- `createVersion()` - Upload new version metadata
- `getLatestVersion()` - Get current version
- `getVersionHistory()` - View all versions
- `updateDownloadUrl()` - Change download URL
- `deleteVersion()` - Remove old version

#### 2. Python Proxy
**File:** `icp-backend/proxy.py`
**Port:** 3847
**Bundled Location:** `RedLemon.app/Contents/Resources/icp-backend/proxy.py`

HTTP server that translates REST API calls to Candid format for ICP canister communication.

**Endpoints:**
- `GET /api/updates/check` - Returns latest version JSON
- `POST /api/updates/current` - Check if update needed

**Auto-Start:**
RedLemonApp.swift starts proxy automatically on launch via `startICPProxy()` function.

#### 3. UpdateManager
**File:** `Sources/Services/UpdateManager.swift`

Swift service that:
- Checks for updates on app launch (24hr throttle)
- Downloads DMG from GitHub URL
- Verifies SHA-256 checksum
- Installs and relaunches

#### 4. Update UI
**File:** `Sources/Features/Settings/UpdateAvailableView.swift`

SwiftUI sheet showing:
- Available version
- Release notes
- Download progress
- Install button

---

## 📦 Deployment Process

### Prerequisites
- ICP identity: `redlemon_mainnet`
- Canister ID: `hn2om-kyaaa-aaaaj-qntta-cai`
- GitHub repo: `github.com/orangeapple1272/Redlemon`
- dfx installed and authenticated

### Step 1: Build New Version

Update version in `build-app-debug.sh`:
```bash
<string>1.0.4</string>  # CFBundleShortVersionString
<string>4</string>      # CFBundleVersion
```

Build:
```bash
./build-app-debug.sh
```

### Step 2: Create DMG

```bash
./build-dmg.sh
```

Output: `RedLemon-Installer.dmg`

### Step 3: Calculate Checksum

```bash
shasum -a 256 RedLemon-Installer.dmg
```

Save this checksum - you'll need it!

### Step 4: Get File Size

```bash
ls -l RedLemon-Installer.dmg | awk '{print $5}'
```

### Step 5: Upload to GitHub Releases

1. Go to: https://github.com/orangeapple1272/Redlemon/releases
2. Click "Create a new release"
3. Tag: `v1.0.4`
4. Title: `RedLemon v1.0.4`
5. Upload `RedLemon-Installer.dmg`
6. Publish release
7. Copy download URL (right-click DMG → Copy link)

Example URL:
```
https://github.com/orangeapple1272/Redlemon/releases/download/v1.0.4/RedLemon-Installer.dmg
```

### Step 6: Update ICP Canister

```bash
cd icp-backend
dfx identity use redlemon_mainnet

dfx canister call hn2om-kyaaa-aaaaj-qntta-cai createVersion \
  '("1.0.4", 4, "Bug fixes and performance improvements", "13.0", FILE_SIZE, "CHECKSUM_HERE", "GITHUB_URL_HERE", false)' \
  --network ic
```

**Example:**
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai createVersion \
  '("1.0.4", 4, "Added dark mode support", "13.0", 88000000, "abc123def456...", "https://github.com/orangeapple1272/Redlemon/releases/download/v1.0.4/RedLemon-Installer.dmg", false)' \
  --network ic
```

### Step 7: Verify Deployment

```bash
# Check canister
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai getLatestVersion '()' --network ic

# Check proxy (if running)
curl http://localhost:3847/api/updates/check
```

---

## 🔧 Management Commands

### Check Latest Version
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai getLatestVersion '()' --network ic
```

### List All Versions
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai getVersionHistory '()' --network ic
```

### Update Download URL (if needed)
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai updateDownloadUrl \
  '("1.0.4", "https://new-url.com/RedLemon.dmg")' \
  --network ic
```

### Delete Old Version
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai deleteVersion \
  '("1.0.2")' \
  --network ic
```

### Check Canister Status
```bash
dfx canister status hn2om-kyaaa-aaaaj-qntta-cai --network ic
```

### Add Admin Principal
```bash
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai addAdmin \
  '(principal "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx")' \
  --network ic
```

---

## 🐛 Troubleshooting

### Proxy Won't Start
**Symptom:** Updates not working, connection refused to localhost:3847

**Check:**
```bash
# Is proxy running?
lsof -i :3847

# Check proxy logs
tail -f /tmp/redlemon-proxy.log

# Check if bundled
ls -la "/Applications/RedLemon.app/Contents/Resources/icp-backend/"
```

**Fix:**
- Ensure proxy.py is bundled in app (check build-app-debug.sh)
- Verify Python 3 is installed: `which python3`
- Check for port conflicts: `lsof -i :3847`

### Update Check Fails
**Symptom:** "Failed to check for updates" error

**Debug:**
```bash
# Test proxy directly
curl http://localhost:3847/api/updates/check

# Test canister directly
dfx canister call hn2om-kyaaa-aaaaj-qntta-cai getLatestVersion '()' --network ic
```

**Common Issues:**
- Proxy not running (see above)
- Canister out of cycles: `dfx canister status hn2om-kyaaa-aaaaj-qntta-cai --network ic`
- Network issues (firewall blocking port 3847)

### Download Fails
**Symptom:** Download starts but fails mid-way

**Check:**
- GitHub URL is correct and public
- File hasn't been deleted from GitHub Releases
- Network connection stable

**Test:**
```bash
curl -I "https://github.com/orangeapple1272/Redlemon/releases/download/v1.0.3/RedLemon-Installer.dmg"
# Should return 200 OK
```

### Checksum Mismatch
**Symptom:** "Integrity check failed" error

**Cause:** Downloaded file doesn't match ICP checksum

**Fix:**
1. Verify checksum on GitHub file:
   ```bash
   shasum -a 256 RedLemon-Installer.dmg
   ```
2. Compare with ICP canister value
3. If different, update canister:
   ```bash
   dfx canister call hn2om-kyaaa-aaaaj-qntta-cai updateDownloadUrl \
     '("1.0.3", "CORRECT_URL")' --network ic
   ```

---

## 📊 Version History

### v1.0.3 (Current)
**Build:** 3
**Date:** November 8, 2025
**Size:** 83 MB
**Checksum:** `5aa5be9da2d6ce5061783376067031bbe23047cb724f233327b485e3ffb084ca`
**URL:** https://github.com/orangeapple1272/Redlemon/releases/download/v1.0.3/RedLemon-Installer.dmg

**Features:**
- ✅ Bundled ICP proxy (auto-starts with app)
- ✅ 4-character room codes (e.g., "K7M2")
- ✅ MySpace Tom auto-friend feature (lemontom)
- ✅ Port 3847 (unique, avoids conflicts)
- ✅ Hybrid ICP+GitHub architecture

---

## 🔒 Security

### Checksum Verification
Every download is verified against SHA-256 checksum stored in ICP canister. If checksums don't match, installation is aborted.

### Admin-Only Uploads
Only principals in the admin list can call `createVersion()`. Current admin:
- `ggjfp-2cemt-e7lqk-qirwp-dbxds-mkhgj-bqopr-3z4oh-ifq4v-xsrcd-tae` (redlemon_mainnet)

### GitHub Anonymous Account
Updates are hosted on anonymous GitHub account to protect developer privacy:
- **Account:** orangeapple1272
- **Repo:** github.com/orangeapple1272/Redlemon

---

## 💰 Costs

### ICP Canister Cycles
Storing metadata only (no binary data) = minimal cycle usage.

**Current Balance:** ~1.035 trillion cycles (~$0.69 USD)
**Estimated Duration:** Years at current usage

**Monitor:**
```bash
dfx canister status hn2om-kyaaa-aaaaj-qntta-cai --network ic
```

**Top Up (if needed):**
```bash
dfx cycles convert --amount 1.0  # Convert 1 ICP to cycles
dfx canister deposit-cycles 1000000000000 hn2om-kyaaa-aaaaj-qntta-cai --network ic
```

### GitHub Releases
**Cost:** Free (public repo, unlimited releases)
**Bandwidth:** Unlimited via GitHub CDN

---

## 🚀 Future Enhancements

### Planned
- [ ] Delta updates (download only changed files)
- [ ] Background downloads (while app is running)
- [ ] Rollback capability (revert to previous version)
- [ ] Beta channel (opt-in early updates)
- [ ] Update scheduling (install on next launch)

### Considered
- [ ] P2P distribution (IPFS integration)
- [ ] Automatic code signing
- [ ] In-app changelog viewer
- [ ] Update notifications (push via ICP)

---

## 📚 Related Documentation

- **[ICP_MAINNET_GUIDE.md](ICP_MAINNET_GUIDE.md)** - ICP canister deployment
- **[HANDOFF.md](../HANDOFF.md)** - Current project status
- **[README.md](../README.md)** - Project overview

---

## 🆘 Support

### Logs Location
- **App Logs:** `/var/log/system.log` (search for "RedLemon")
- **Proxy Logs:** `/tmp/redlemon-proxy.log`
- **System Console:** Applications → Utilities → Console.app

### Debugging UpdateManager
Enable verbose logging in `UpdateManager.swift`:
```swift
private let verbose = true  // Set to true for debug logs
```

### Contact
- **Issues:** File on GitHub (private repo)
- **ICP Support:** https://forum.dfinity.org/
