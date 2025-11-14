# WebRTC Testing Guide for RedLemon Native

This guide shows you how to test WebRTC host/guest connections on a single machine using the new testing infrastructure.

## Quick Start

### 1. Build the App
```bash
# Build for testing
swift build
# Or use Xcode to build the Debug configuration
```

### 2. Launch Test Instances

#### Method 1: Quick Test (Recommended)
```bash
./quick-test.sh
```
This will automatically launch both host and guest instances.

#### Method 2: Manual Launch
```bash
# Launch Host instance
open -n ~/Applications/RedLemon.app --args -user-profile host

# Launch Guest instance
open -n ~/Applications/RedLemon.app --args -user-profile guest
```

#### Method 3: Advanced Testing Script
```bash
# Launch both instances
./test-webrtc.sh both

# Or launch individually
./test-webrtc.sh host
./test-webrtc.sh guest

# Stop all instances
./test-webrtc.sh stop

# View logs
./test-webrtc.sh logs
```

## Testing Scenarios

### 1. Basic Connection Test
1. **Host**: Create a new room and select media
2. **Guest**: Join the same room using the room code
3. **Verify**: Check Console.app for WebRTC connection logs

### 2. Connection Success Indicators
✅ **Success**: You should see logs like:
```
✅ WebRTC setup complete (isHost: true/false)
🧊 ICE connection state changed to: connected
✅ Data channel open and ready for messaging
📡 Sent WebRTC message: chat
```

❌ **Failure**: You might see:
```
⏰ WebRTC connection timeout after 30.0s
❌ Failed to broadcast READY state via WebRTC: connectionTimeout
⚠️ WebRTC not connected, falling back to database polling
```

### 3. Testing WebRTC Fixes

The following fixes have been implemented and should be tested:

#### ✅ Symmetric Data Channel Creation
- **Before**: Guest waited for connection before creating data channel
- **After**: Both host and guest create data channels during setup
- **Test**: Should see "🔌 Guest: Created data channel during setup" in logs

#### ✅ Improved Connection Timeout
- **Before**: 10-second timeout requiring both ICE + data channel
- **After**: 30-second timeout with progress logging
- **Test**: Should see "⏳ Waiting for WebRTC connection..." progress messages

#### ✅ Enhanced ICE Candidate Exchange
- **Before**: Polling started immediately, causing race conditions
- **After**: 2-second delay before polling with exponential backoff
- **Test**: Should see better ICE candidate processing with fewer timeouts

#### ✅ Graceful Error Handling
- **Before**: WebRTC failures broke functionality
- **After**: Graceful fallback to database polling
- **Test**: Chat and ready states should work even if WebRTC fails

### 4. Monitoring WebRTC Logs

#### Console.app Setup
1. Open Console.app
2. In the search bar, type "RedLemon"
3. Look for these key log markers:
   - `🧪 Testing Profile: host/guest`
   - `🤝 Signaling state changed`
   - `🧊 ICE connection state changed`
   - `🔌 Data channel state changed`
   - `📡 WebRTC message` (success) or `⏰ WebRTC connection timeout` (failure)

#### Key Log Patterns to Watch

**Successful Connection:**
```
🧪 Using test profile: TestHost/TestGuest
🤝 Signaling state changed to: have-local-offer/have-remote-offer
🧊 ICE connection state changed to: connected
✅ Data channel open and ready for messaging
📡 Sent WebRTC message: chat
```

**Connection Issues:**
```
⏳ Waiting for WebRTC connection... (10s elapsed, ICE: false, DataChannel: false)
⏰ WebRTC connection timeout after 30.0s
⚠️ WebRTC not connected, falling back to database polling
```

### 5. Testing Different Network Conditions

#### Local Network Testing
- All instances on same machine (current setup)
- Tests STUN server functionality
- Most reliable connection scenario

#### Simulated Poor Network (Optional)
```bash
# Use Network Link Conditioner (Xcode > Open Developer Tool > Network Link Conditioner)
# Set to "3G" or "Very Bad Network" to test resilience
```

### 6. Test User Profiles

Three test profiles are available:

| Profile | Username | User ID | Purpose |
|---------|----------|---------|---------|
| `host` | TestHost | `11111111-...` | Create rooms |
| `guest` | TestGuest | `22222222-...` | Join rooms |
| `debug` | DebugUser | `33333333-...` | Default/development |

### 7. Troubleshooting

#### Common Issues

**App won't launch with profile:**
```bash
# Check app path
ls ~/Applications/RedLemon.app

# Or specify custom path
export REDLEMON_BUILD_PATH="/path/to/RedLemon.app"
./test-webrtc.sh host
```

**No WebRTC logs:**
1. Make sure profiles are being used (check for "🧪 Testing Profile")
2. Verify Console.app is filtering correctly
3. Try restarting with clean state

**Connection always fails:**
1. Check STUN server connectivity
2. Verify firewall allows local traffic
3. Test with only one instance at a time first

#### Debug Mode
For extra verbose logging, you can modify the log level in Console.app:
1. Console.app > Action > Include Info Messages & Debug Messages
2. Filter for "RedLemon"

### 8. Success Criteria

✅ **WebRTC Working**:
- Both instances connect successfully
- Chat messages appear instantly (not just via polling)
- Ready state changes sync via WebRTC
- No connection timeout errors

✅ **Fallback Working**:
- If WebRTC fails, chat still works via database polling
- Ready states still update (with slight delay)
- Users can still participate in watch parties

## Expected Results

With the WebRTC fixes implemented, you should see:
- **Higher success rate** for guest connections
- **No more 10-second timeouts** (extended to 30s with progress)
- **Better error handling** with graceful database fallback
- **Clearer debugging** with enhanced logging

The tests will help verify that the WebRTC connection issues from your original logs are resolved:
```
❌ Failed to broadcast READY state via WebRTC: connectionTimeout
⏰ WebRTC connection timeout after 10.0s
⏰ ICE candidate polling timed out after 60.0s
```

Should become:
```
✅ WebRTC connection established (ICE connected)
📡 Successfully broadcasted READY state via WebRTC
💡 ICE candidate exchange completed with X candidates
```