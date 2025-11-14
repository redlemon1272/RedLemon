# Changelog v1.0.9

## 🚀 WebRTC Connection Reliability Fixes

### 🎯 **Major Improvements**

#### ✅ **WebRTC Connection Fixes**
- **Symmetric Data Channel Creation**: Both host and guest now create data channels during setup instead of guest waiting until after connection
- **Extended Connection Timeout**: Increased from 10s to 30s with detailed progress logging every 5 seconds
- **Improved ICE Candidate Exchange**: Added 2-second delay before polling starts to allow local ICE candidates to be generated, with exponential backoff (1s → 3s max)
- **Enhanced Error Handling**: Added specific timeout and connection error detection with graceful fallbacks to database polling
- **Better State Management**: Improved ICE connection state logging with candidate counts and connection diagnostics

#### ✅ **Testing Infrastructure**
- **Command Line Profiles**: Added `-user-profile` argument support for testing multiple instances
  - `host` - TestHost profile for creating rooms
  - `guest` - TestGuest profile for joining rooms
  - `debug` - Default profile for normal usage
- **Automated Testing Scripts**:
  - `quick-test.sh` - One-click testing (launches both host and guest)
  - `test-webrtc.sh` - Advanced testing with multiple options
- **Comprehensive Documentation**:
  - `WEBRTC_TESTING.md` - Detailed testing guide and troubleshooting
  - `TESTING_QUICKSTART.md` - Quick reference for rapid testing

### 🐛 **Issues Resolved**

#### Before (v1.0.8)
```
❌ Failed to broadcast READY state via WebRTC: connectionTimeout
⏰ WebRTC connection timeout after 10.0s
⏰ ICE candidate polling timed out after 60.0s
```

#### After (v1.0.9)
```
✅ WebRTC connection established (ICE connected)
📡 Successfully broadcasted READY state via WebRTC
💡 ICE candidate exchange completed with X candidates
```

### 🔧 **Technical Details**

#### Connection State Improvements
- **Relaxed Connection Requirements**: Now considers connection ready when ICE is connected (not requiring both ICE + data channel)
- **Enhanced Failure Detection**: Better distinction between temporary disconnections and permanent failures
- **Progress Logging**: Detailed connection progress every 5 seconds during connection attempts

#### ICE Candidate Exchange
- **Race Condition Fix**: 2-second delay prevents polling before candidates are generated
- **Deduplication**: Filters out already processed candidates to reduce redundancy
- **Smart Polling**: Exponential backoff reduces server load while maintaining responsiveness

#### Error Recovery
- **Graceful Fallbacks**: All WebRTC failures now gracefully fall back to database polling
- **Specific Error Types**: Different handling for timeouts vs. connection failures
- **User Experience**: No functionality loss - chat and ready states work even with WebRTC failures

### 🧪 **Testing Guide**

#### Quick Testing
```bash
# Build and test in one command
swift build && ./quick-test.sh
```

#### Manual Testing
```bash
# Launch Host instance
open -n ~/Applications/RedLemon.app --args -user-profile host

# Launch Guest instance
open -n ~/Applications/RedLemon.app --args -user-profile guest
```

#### Monitoring
- Open Console.app
- Search for "RedLemon"
- Watch for WebRTC connection logs and progress messages

### 📊 **Expected Results**

- **Higher Success Rate**: More guests should successfully connect via WebRTC
- **Better User Experience**: Clear progress feedback and faster fallbacks when needed
- **Improved Debugging**: Detailed logs help diagnose connection issues
- **Resilient Architecture**: System works even if WebRTC completely fails

### 🔍 **What to Monitor**

#### Success Indicators
- ✅ `🧪 Using test profile: TestHost/TestGuest`
- ✅ `🔌 Guest: Created data channel during setup`
- ✅ `⏳ Waiting for WebRTC connection...` (progress tracking)
- ✅ `🧊 ICE connection state changed to: connected`
- ✅ `📡 Successfully broadcasted READY state via WebRTC`

#### Graceful Fallback
- ⚠️ `WebRTC not connected, falling back to database polling`
- 💬 Chat and ready states still work via database (slight delay)

---

## 🔄 Previous Issues

This version specifically addresses the WebRTC connection issues reported in v1.0.8 where guests experienced timeouts when joining hosts, despite successful database polling fallbacks.

---

**Build Date**: November 9, 2025
**Version**: 1.0.9
**Status**: ✅ Ready for Testing