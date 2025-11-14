# RedLemon v1.0.5 Changelog
**Release Date:** November 8, 2025

## 🎉 Major Changes

### Auto-Updates: Migrated to Sparkle Framework
- **Removed**: ICP canister-based auto-update system
- **Removed**: Python proxy (no longer bundled or started)
- **Added**: Sparkle 2.8.0 framework via Swift Package Manager
- **Added**: Ad-hoc code signing (required for Sparkle)
- **Result**: Industry-standard, reliable auto-updates with native macOS UI

### Watch Party Improvements
- **Fixed**: Database polling - participants sync every 2 seconds
- **Fixed**: Chat persistence - messages saved to database, sync every 1.5 seconds
- **Fixed**: RLS policies - database write permissions corrected
- **Fixed**: Room auto-delete - rooms properly clean up when host exits
- **Fixed**: User search - can now search for users by username
- **Improved**: Reliability - watch parties work even if WebRTC fails

## 📝 Technical Details

### Added
- Sparkle.framework (2.8.0) for auto-updates
- Ad-hoc code signing in build-app-debug.sh
- appcast.xml RSS feed (GitHub-hosted)
- SPUUpdaterDelegate implementation in UpdateManager
- Info.plist keys: SUFeedURL, SUEnableAutomaticChecks, SUAllowsInsecureUpdates

### Removed
- ICP proxy (icp-backend/proxy.py) - no longer bundled
- startICPProxy() function from RedLemonApp.swift
- ICP canister-based update checking
- UpdateManager.swift.backup and MockUpdateManager.swift.backup files

### Changed
- UpdateManager.swift - Complete rewrite for Sparkle
- build-app-debug.sh - Added Sparkle framework copying and code signing
- UpdateAvailableView.swift - Simplified (Sparkle has native UI)
- Documentation updated to reflect Sparkle migration

## 🔧 Build Changes

### New Build Steps
1. Swift Package Manager resolves Sparkle dependency
2. Framework copied from .build/x86_64-apple-macosx/debug/Sparkle.framework
3. App bundle code-signed with ad-hoc signature: `codesign --sign -`

### Build Script Updates
- Removed ICP proxy bundling
- Added Sparkle.framework copying
- Added ad-hoc code signing step

## 📚 Documentation Updates

### Updated Files
- README.md - v1.0.5, Sparkle framework, removed ICP references
- HANDOFF.md - v1.0.5, updated architecture, Sparkle integration
- INDEX.md - v1.0.5, updated deployment instructions
- docs/AUTO_UPDATE_SYSTEM.md - Marked as DEPRECATED with migration notice

### Removed References
- ICP canister ID (hn2om-kyaaa-aaaaj-qntta-cai)
- Python proxy port 3847
- Internet Identity authentication
- Cycles balance and management

## 🚀 Upgrade Notes

### For Users
- Auto-updates will work seamlessly via Sparkle
- No setup required - update checking is automatic
- Native macOS update dialogs

### For Developers
- Must have Sparkle dependency in Package.swift
- Apps must be code-signed (ad-hoc acceptable for development)
- Update appcast.xml on GitHub when releasing new versions
- Build DMG with ./build-dmg.sh and upload to GitHub Releases

## 🐛 Bug Fixes
- Fixed Sparkle initialization requiring code signing
- Fixed database polling synchronization issues
- Fixed chat message persistence
- Fixed room cleanup on host exit
- Fixed user search functionality

## 📦 Distribution
- DMG Size: 88.5 MB (88,572,053 bytes)
- GitHub Release: https://github.com/orangeapple1272/Redlemon/releases/tag/v1.0.5
- Appcast Feed: https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml

