# 🧪 WebRTC Testing - Quick Start

## One-Command Testing
```bash
# Build and test in one command
swift build && ./quick-test.sh
```

## What This Does
1. **Builds** the app with WebRTC testing profiles
2. **Launches** two instances:
   - **Host**: TestHost (creates rooms)
   - **Guest**: TestGuest (joins rooms)
3. **Enables** enhanced WebRTC logging

## Testing Steps
1. **Host Window**: Create a room → Select media
2. **Guest Window**: Join same room with room code
3. **Monitor**: Open Console.app → Search "RedLemon"

## Expected Results
✅ **Before Fix**: Connection timeouts, fallback to polling
✅ **After Fix**: Direct WebRTC connection, instant sync

## Key Log Messages to Watch
- ✅ `🔌 Guest: Created data channel during setup`
- ✅ `⏳ Waiting for WebRTC connection...` (progress)
- ✅ `🧊 ICE connection state changed to: connected`
- ✅ `📡 Successfully broadcasted READY state via WebRTC`

## If It Still Fails
The app will now gracefully fall back to database polling - chat and ready states will still work!

---

**Full docs**: See `WEBRTC_TESTING.md` for detailed troubleshooting