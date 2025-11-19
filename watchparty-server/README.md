# RedLemon Watch Party WebSocket Server

High-performance WebSocket server for real-time watch party synchronization. Optimized for 30+ concurrent users per room with sub-5ms latency.

## Features

- 🚀 **High Performance**: Optimized WebSocket server with compression and efficient broadcasting
- 🔐 **JWT Authentication**: Secure Supabase token validation with JWKS caching
- 📊 **Real-time Sync**: Play/pause/seek synchronization across all participants
- 💬 **Live Chat**: Real-time messaging with rate limiting
- 📈 **Performance Monitoring**: Built-in metrics and health checks
- 🐳 **Docker Ready**: Optimized container deployment with health checks

## Performance Optimizations

### Memory Efficiency
- Map-based O(1) lookups for room management
- WeakMap for socket data to prevent memory leaks
- Automatic cleanup of empty rooms
- Dead connection detection and removal

### Network Performance
- WebSocket message compression (deflate)
- Pre-allocated error message templates
- Efficient broadcasting with early filtering
- Connection pooling and reuse

### Monitoring
- Real-time performance metrics (30-second intervals)
- Health check endpoint (`/healthz`)
- Performance testing suite included

## Quick Start

### Development
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Run performance tests
npm run test:performance
```

### Production (Docker)
```bash
# Build and run
docker build -t watchparty-server .
docker run -p 8080:8080 -e PORT=8080 watchparty-server

# With environment variables
docker run -p 8080:8080 \
  -e PORT=8080 \
  -e LOG_LEVEL=info \
  -e SUPABASE_JWKS_URL=https://your-project.supabase.co/auth/v1/.well-known/jwks.json \
  -e SUPABASE_PROJECT_ID=your-project-id \
  watchparty-server
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `8080` | Server port |
| `MAX_MESSAGE_BYTES` | `8192` | Maximum WebSocket message size |
| `LOG_LEVEL` | `info` | Logging level (`debug`, `info`) |
| `AUTH_BYPASS` | `true` | Development auth bypass |
| `SUPABASE_JWKS_URL` | Required | Supabase JWKS endpoint |
| `SUPABASE_PROJECT_ID` | Required | Supabase project ID |
| `SUPABASE_ISSUER` | Required | Supabase token issuer |

## API

### WebSocket Endpoint
```
ws://localhost:8080/ws
```

### Health Check
```
GET /healthz
Response: "ok"
```

## WebSocket Protocol

### Authentication
```json
{
  "type": "auth",
  "token": "supabase-jwt",
  "roomId": "room-id",
  "role": "host|guest",
  "lastSeq": 0
}
```

### Control Messages
```json
// Play
{ "type": "play" }

// Pause
{ "type": "pause" }

// Seek
{ "type": "seek", "positionMs": 12345 }

// Heartbeat
{ "type": "heartbeat", "playing": true, "positionMs": 12345 }

// Chat
{ "type": "chat", "text": "Hello everyone!" }
```

### Server Broadcasts
```json
// State updates
{ "type": "state", "event": "play", "seq": 123, "userId": "user-id" }

// Presence
{ "type": "presence", "event": "join|leave", "seq": 124, "userId": "user-id" }

// Chat
{ "type": "chat", "seq": 125, "userId": "user-id", "text": "Hello!", "ts": 1234567890 }

// Authentication
{ "type": "auth_ok", "seq": 126 }

// State snapshot
{ "type": "state_snapshot", "seq": 127 }
```

## Performance Testing

Run the included performance test suite:

```bash
npm run test:performance
```

This simulates 30 concurrent users with various message types and measures:
- Connection latency
- Message delivery rate
- Average/max/min latency
- Connection success rate

### Performance Targets
- ✅ **Latency**: <5ms average
- ✅ **Concurrent Users**: 30+ per room
- ✅ **Message Delivery**: >95% success rate
- ✅ **Connection Time**: <50ms average

## Architecture

### Room Management
```typescript
type Room = {
  seq: number;                    // Message sequence number
  clients: Set<WebSocket>;         // Connected clients
  lastState?: {                  // Cached state for snapshots
    playing: boolean;
    positionMs?: number;
  };
};
```

### Performance Features
- **Sequence Numbers**: Ensures message ordering and conflict resolution
- **State Caching**: Reduces redundant state broadcasts
- **Dead Connection Cleanup**: Prevents memory leaks
- **Compression**: Reduces bandwidth usage
- **Pre-allocated Templates**: Reduces JSON serialization overhead

## Migration Notes

This server replaces the original uWebSockets.js implementation with an optimized `ws` library version due to package deprecation. The implementation maintains 100% protocol compatibility while adding:

- Better error handling and logging
- Performance optimizations
- Comprehensive testing suite
- Improved Docker configuration

Future migration to native uWebSockets.js can be done seamlessly when package distribution is stable.

## Monitoring

### Health Monitoring
```bash
# Check server health
curl http://localhost:8080/healthz

# Monitor logs
docker logs -f watchparty-server
```

### Performance Metrics
The server outputs performance statistics every 30 seconds in debug mode:
```
Performance stats: 5 rooms, 150 total clients
```

## Security

- JWT token validation with Supabase JWKS
- Message size limits (default 8KB)
- Connection rate limiting
- Non-root Docker user
- Health check endpoint doesn't expose internal state

## Troubleshooting

### Common Issues

1. **Authentication failures**: Check SUPABASE_JWKS_URL and SUPABASE_PROJECT_ID
2. **High latency**: Ensure network connectivity and check compression settings
3. **Memory usage**: Monitor room cleanup - empty rooms should auto-delete
4. **Connection drops**: Check maxPayload and network stability

### Debug Mode
```bash
LOG_LEVEL=debug npm run dev
```

This enables detailed logging including:
- Connection lifecycle events
- Message processing details
- Performance metrics
- Room cleanup actions
