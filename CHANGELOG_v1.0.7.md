# Changelog v1.0.7

**Release Date:** November 10, 2025
**Build Number:** 7

## 🐛 Bug Fixes

### WebRTC Connection Fixes
- **Fixed WebRTC Stability**: Resolved `channelNotReady` errors with proper connection state tracking
- **Fixed Participant ID Mismatch**: Resolved participant ID lookup failures for consistent user tracking
- **Added Connection Monitoring**: Comprehensive WebRTC connection state monitoring and logging
- **Improved Bidirectional Communication**: Data channels now work properly for both hosts and guests
- **Added Retry Logic**: Implemented connection timeout (10s) and retry mechanisms for failed messages
- **Fixed Delegate Pattern**: Corrected WebRTC delegate handling with proper actor-isolated methods

### Technical Details
- **WebRTCManager.swift**: Added `WebRTCDelegateHandler` class for proper NSObject delegate management
- **LobbyViewModel.swift**: Fixed participant ID generation to use consistent user IDs
- **Connection State Tracking**: Added `isConnected` and `isDataChannelOpen` state management
- **Message Sending**: Implemented `waitForConnectionReady()` with timeout handling

## 🔧 Improvements
- Better error handling for WebRTC connection failures
- Enhanced logging for connection state changes
- More robust data channel setup for both host and guest roles
- Improved participant ready state synchronization

## 📝 Notes
This release specifically addresses the WebRTC connection issues that were causing:
- `Failed to broadcast READY state via WebRTC: channelNotReady` errors
- `Could not find participant with ID... to update ready state` errors

WebRTC connections should now establish properly and allow reliable synchronization between watch party participants.

---

## Previous Version: v1.0.6
- Watch Party Room Fixes
- Host role detection improvements
- Chat username fixes
- Participant counting corrections
- Real-time polling enhancements