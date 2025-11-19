import { WebSocketServer, WebSocket } from 'ws';
import { createServer } from 'http';
import { jwtVerify, createRemoteJWKSet } from 'jose';
import { createClient, SupabaseClient } from '@supabase/supabase-js';

type JsonObject = Record<string, unknown>;

type Role = 'host' | 'guest';

interface UserData {
  userId?: string;
  roomId?: string;
  role?: Role;
  lastSeq?: number;
}

type Room = {
  seq: number;
  clients: Set<WebSocket>;
  lastState?: {
    playing: boolean;
    positionMs?: number;
  };
};

const PORT = Number(process.env.WATCHPARTY_PORT || 18081);
const MAX_MESSAGE_BYTES = Number(process.env.MAX_MESSAGE_BYTES || 8192);
const LOG_LEVEL = process.env.LOG_LEVEL || 'info';
const AUTH_BYPASS = process.env.AUTH_BYPASS === 'true'; // default false for security

// Performance optimization: Use Map for O(1) lookups
const rooms = new Map<string, Room>();
const socketData = new WeakMap<WebSocket, UserData>();

// Rate limiting and abuse prevention
const rateLimiter = new Map<WebSocket, { count: number; resetTime: number }>();
const PING_TIMEOUT = 60000; // 60 seconds
const RATE_LIMIT = 10; // 10 messages per second
const EVENT_BUFFER_SIZE = 100; // Keep last 100 events for reconnection

// Event buffer for reconnection support
const eventBuffers = new Map<string, Array<{ seq: number; event: any; timestamp: number }>>();

// Performance optimization: Pre-allocate common message templates
const AUTH_REQUIRED_MSG = JSON.stringify({ type: 'error', code: 4001, message: 'auth_required' });
const ROOM_REQUIRED_MSG = JSON.stringify({ type: 'error', code: 4002, message: 'room_required' });
const AUTH_FAILED_MSG = JSON.stringify({ type: 'error', code: 4003, message: 'auth_failed' });
const INVALID_JSON_MSG = JSON.stringify({ type: 'error', code: 4000, message: 'invalid_json' });

// Stream synchronization state for each room
const roomStreamStates = new Map<string, { infoHash?: string; fileIdx?: number; quality?: string; unlockedURL?: string }>();

function log(...args: unknown[]) {
  if (LOG_LEVEL === 'info' || LOG_LEVEL === 'debug') {
    console.log(...args);
  }
}

function debug(...args: unknown[]) {
  if (LOG_LEVEL === 'debug') {
    console.log(...args);
  }
}

interface JWKSResponse {
  keys: Array<{
    kty: string;
    kid: string;
    use: string;
    n: string;
    e: string;
    x5t?: string;
    x5c?: string[];
  }>;
}

interface JWTPayload {
  aud: string;
  exp: number;
  sub: string;
  email?: string;
  user_metadata?: Record<string, any>;
  app_metadata?: Record<string, any>;
  role?: string;
  aal?: string;
  amr?: string[];
  session_id?: string;
  iss?: string;
}

// Initialize Supabase client
let supabase: SupabaseClient | null = null;

function getSupabaseClient(): SupabaseClient {
  if (!supabase) {
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseServiceKey) {
      throw new Error('SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables are required');
    }

    supabase = createClient(supabaseUrl, supabaseServiceKey);
  }
  return supabase;
}

// JWT verification using jose library with proper JWKS caching
let jwks: ReturnType<typeof createRemoteJWKSet> | null = null;

function getJWKS() {
  if (!jwks) {
    const jwksUrl = process.env.SUPABASE_JWKS_URL;
    if (!jwksUrl) {
      throw new Error('SUPABASE_JWKS_URL environment variable is required');
    }
    jwks = createRemoteJWKSet(new URL(jwksUrl));
  }
  return jwks;
}

async function verifyToken(token: string): Promise<{ valid: boolean; userId?: string; error?: string }> {
  // Bypass mode for development
  if (AUTH_BYPASS) {
    debug('Auth bypass enabled - accepting token');
    return { valid: true, userId: `user-${Math.random().toString(36).slice(2)}` };
  }

  if (!token) {
    return { valid: false, error: 'No token provided' };
  }

  try {
    const JWKS = getJWKS();

    // Verify JWT signature with proper JWKS
    const { payload } = await jwtVerify(token, JWKS, {
      issuer: process.env.SUPABASE_ISSUER,
      audience: process.env.SUPABASE_PROJECT_ID
    });

    debug('JWT verified successfully for user:', payload.sub);
    return { valid: true, userId: payload.sub as string };

  } catch (error) {
    debug('Token verification error:', error);
    return { valid: false, error: 'Token verification failed' };
  }
}

// Room authorization with Supabase validation
async function validateRoomAccess(userId: string, roomId: string, role: string): Promise<{ valid: boolean; error?: string }> {
  try {
    const supabase = getSupabaseClient();

    // Check if room exists and user is a participant
    const { data: participant, error } = await supabase
      .from('room_participants')
      .select('*')
      .eq('room_id', roomId)
      .eq('user_id', userId)
      .eq('role', role)
      .single();

    if (error || !participant) {
      debug(`Room access denied for user ${userId} to room ${roomId} as ${role}`);
      return { valid: false, error: 'Room access denied' };
    }

    // Check if room exists
    const { data: room, error: roomError } = await supabase
      .from('rooms')
      .select('*')
      .eq('id', roomId)
      .single();

    if (roomError || !room) {
      debug(`Room ${roomId} not found`);
      return { valid: false, error: 'Room not found' };
    }

    return { valid: true };
  } catch (error) {
    debug('Room validation error:', error);
    return { valid: false, error: 'Room validation failed' };
  }
}

function getRoom(roomId: string): Room {
  let room = rooms.get(roomId);
  if (!room) {
    room = { seq: 0, clients: new Set() };
    rooms.set(roomId, room);
  }
  return room;
}

// Performance optimization: Efficient broadcasting with early filtering
function broadcast(room: Room, payload: JsonObject) {
  const data = JSON.stringify(payload);
  const deadClients: WebSocket[] = [];

  // Add to event buffer for reconnection support
  if (payload.seq) {
    addToEventBuffer(roomIdFromMap(rooms, room), payload.seq as number, payload);
  }

  for (const client of room.clients) {
    if (client.readyState === WebSocket.OPEN) {
      try {
        client.send(data);
      } catch (error) {
        debug('Failed to send to client:', error);
        deadClients.push(client);
      }
    } else {
      deadClients.push(client);
    }
  }

  // Clean up dead connections
  for (const deadClient of deadClients) {
    room.clients.delete(deadClient);
  }
}

// Helper function to find room ID from room object
function roomIdFromMap(roomMap: Map<string, Room>, room: Room): string {
  for (const [id, r] of roomMap.entries()) {
    if (r === room) return id;
  }
  return 'unknown';
}

// Rate limiting function
function checkRateLimit(ws: WebSocket): boolean {
  const now = Date.now();
  const rateData = rateLimiter.get(ws) || { count: 0, resetTime: now + 1000 };

  if (now > rateData.resetTime) {
    rateData.count = 0;
    rateData.resetTime = now + 1000;
  }

  rateData.count++;
  rateLimiter.set(ws, rateData);

  if (rateData.count > RATE_LIMIT) {
    debug(`Rate limit exceeded for connection`);
    return false;
  }

  return true;
}

// Event buffer management
function addToEventBuffer(roomId: string, seq: number, event: any) {
  const buffer = eventBuffers.get(roomId) || [];
  buffer.push({ seq, event, timestamp: Date.now() });

  // Keep only the last EVENT_BUFFER_SIZE events
  if (buffer.length > EVENT_BUFFER_SIZE) {
    buffer.splice(0, buffer.length - EVENT_BUFFER_SIZE);
  }

  eventBuffers.set(roomId, buffer);
}

function getEventBufferSnapshot(roomId: string, fromSeq: number): any[] {
  const buffer = eventBuffers.get(roomId) || [];
  return buffer.filter(item => item.seq > fromSeq).map(item => item.event);
}

function closeWithCode(ws: WebSocket, code: number, message: string) {
  try {
    ws.close(code, message);
  } catch {
    /* ignore */
  }
}

// Create HTTP server for health checks with proper validation
const server = createServer((req, res) => {
  // Only allow WebSocket upgrades on /ws and health checks
  if (req.url === '/healthz') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('ok');
  } else if (req.url === '/ws') {
    // Let WebSocket server handle upgrade
    res.writeHead(426, { 'Content-Type': 'text/plain' });
    res.end('Upgrade Required');
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
  }
});

// Create WebSocket server with performance optimizations
const wss = new WebSocketServer({
  server,
  maxPayload: MAX_MESSAGE_BYTES,
  perMessageDeflate: {
    // Performance optimization: Enable compression
    zlibDeflateOptions: {
      level: 3 // Balance between CPU and compression
    }
  }
});

wss.on('connection', (ws) => {
  debug('open connection');

  // Initialize user data
  socketData.set(ws, {});

  // Set up ping/pong timeout for connection health
  const pingInterval = setInterval(() => {
    if (ws.readyState === WebSocket.OPEN) {
      ws.ping();
    } else {
      clearInterval(pingInterval);
    }
  }, PING_TIMEOUT);

  let pongReceived = true;
  ws.on('pong', () => {
    pongReceived = true;
  });

  // Monitor pong responses
  const pongTimeout = setInterval(() => {
    if (!pongReceived && ws.readyState === WebSocket.OPEN) {
      debug('Connection timeout - no pong received');
      closeWithCode(ws, 1000, 'connection_timeout');
      clearInterval(pongTimeout);
      clearInterval(pingInterval);
    }
    pongReceived = false;
  }, PING_TIMEOUT);

  ws.on('message', async (message) => {
    // Rate limiting check
    if (!checkRateLimit(ws)) {
      ws.send(JSON.stringify({ type: 'error', code: 4006, message: 'Rate limit exceeded' }));
      return;
    }

    // Message size validation
    if (Buffer.byteLength(message.toString()) > MAX_MESSAGE_BYTES) {
      ws.send(JSON.stringify({ type: 'error', code: 4007, message: 'Message too large' }));
      return;
    }

    let parsed: any;
    try {
      parsed = JSON.parse(message.toString());
    } catch {
      ws.send(INVALID_JSON_MSG);
      closeWithCode(ws, 4000, 'invalid_json');
      return;
    }

    const userData = socketData.get(ws) || {};
    if (!userData.userId) {
      // Expect auth message first
      if (parsed?.type !== 'auth') {
        ws.send(AUTH_REQUIRED_MSG);
        closeWithCode(ws, 4001, 'auth_required');
        return;
      }
      const { token, roomId, role = 'guest', lastSeq = 0 } = parsed || {};
      if (!roomId || typeof roomId !== 'string') {
        ws.send(ROOM_REQUIRED_MSG);
        closeWithCode(ws, 4002, 'room_required');
        return;
      }
      const result = await verifyToken(token);
      if (!result.valid || !result.userId) {
        ws.send(AUTH_FAILED_MSG);
        closeWithCode(ws, 4003, 'auth_failed');
        return;
      }

      // Validate room access with Supabase
      const normalizedRole = role === 'host' ? 'host' : 'guest';
      const roomAccess = await validateRoomAccess(result.userId, roomId, normalizedRole);
      if (!roomAccess.valid) {
        ws.send(JSON.stringify({ type: 'error', code: 4004, message: roomAccess.error || 'Room access denied' }));
        closeWithCode(ws, 4004, 'room_access_denied');
        return;
      }

      userData.userId = result.userId;
      userData.roomId = roomId;
      userData.role = normalizedRole;
      userData.lastSeq = lastSeq;
      socketData.set(ws, userData);

      const room = getRoom(roomId);
      room.clients.add(ws);

      // Send auth_ok with current seq
      ws.send(JSON.stringify({ type: 'auth_ok', seq: room.seq }));

      // Presence join
      room.seq += 1;
      broadcast(room, { type: 'presence', event: 'join', userId: userData.userId, seq: room.seq });

      // If client provided lastSeq, send snapshot with missed events
      if (lastSeq < room.seq) {
        const missedEvents = getEventBufferSnapshot(roomId, lastSeq);
        ws.send(JSON.stringify({
          type: 'state_snapshot',
          seq: room.seq,
          lastState: room.lastState,
          events: missedEvents
        }));
      }
      return;
    }

    // Authenticated path
    const roomId = userData.roomId!;
    const room = getRoom(roomId);
    switch (parsed?.type) {
      case 'play':
      case 'pause':
      case 'seek': {
        // Host-only operations
        if (userData.role !== 'host') {
          ws.send(JSON.stringify({ type: 'error', code: 4005, message: 'Host-only operation' }));
          return;
        }
        room.seq += 1;
        const payload: JsonObject = {
          type: 'state',
          event: parsed.type,
          seq: room.seq,
          userId: userData.userId,
        };

        // Performance optimization: Cache last state for snapshots
        if (parsed.type === 'play') {
          room.lastState = { playing: true, positionMs: room.lastState?.positionMs };
        } else if (parsed.type === 'pause') {
          room.lastState = { playing: false, positionMs: room.lastState?.positionMs };
        } else if (parsed.type === 'seek' && typeof parsed.positionMs === 'number') {
          payload.positionMs = parsed.positionMs;
          room.lastState = { playing: room.lastState?.playing ?? false, positionMs: parsed.positionMs };
        }

        broadcast(room, payload);
        break;
      }
      case 'heartbeat': {
        room.seq += 1;
        const payload: JsonObject = {
          type: 'state',
          event: parsed.type,
          seq: room.seq,
          userId: userData.userId,
        };

        if (typeof parsed.positionMs === 'number') payload.positionMs = parsed.positionMs;
        if (typeof parsed.playing === 'boolean') payload.playing = parsed.playing;
        room.lastState = {
          playing: parsed.playing ?? room.lastState?.playing ?? false,
          positionMs: parsed.positionMs ?? room.lastState?.positionMs
        };

        broadcast(room, payload);
        break;
      }
      case 'chat': {
        if (typeof parsed.text !== 'string' || parsed.text.length === 0) return;
        room.seq += 1;
        broadcast(room, {
          type: 'chat',
          seq: room.seq,
          userId: userData.userId,
          text: parsed.text.slice(0, 2000),
          ts: Date.now(),
        });
        break;
      }
      case 'stream_selected': {
        // Host-only operation - broadcast stream info to guests
        if (userData.role !== 'host') {
          ws.send(JSON.stringify({ type: 'error', code: 4005, message: 'Host-only operation' }));
          return;
        }

        const { infoHash, fileIdx, quality, unlockedURL } = parsed;
        if (!infoHash || !quality) {
          ws.send(JSON.stringify({ type: 'error', code: 4008, message: 'Missing stream data' }));
          return;
        }

        // Store stream state for this room
        roomStreamStates.set(roomId, { infoHash, fileIdx, quality, unlockedURL });

        room.seq += 1;
        broadcast(room, {
          type: 'stream_selected',
          seq: room.seq,
          userId: userData.userId,
          infoHash,
          fileIdx,
          quality,
          unlockedURL
        });

        debug(`Stream selected for room ${roomId}: ${infoHash} (file: ${fileIdx}, quality: ${quality})`);
        break;
      }
      case 'request_stream': {
        // Guest-only operation - send current stream state if available
        if (userData.role !== 'guest') {
          ws.send(JSON.stringify({ type: 'error', code: 4009, message: 'Guest-only operation' }));
          return;
        }

        const streamState = roomStreamStates.get(roomId);
        if (streamState && streamState.infoHash) {
          room.seq += 1;
          ws.send(JSON.stringify({
            type: 'stream_selected',
            seq: room.seq,
            userId: 'host',
            infoHash: streamState.infoHash,
            fileIdx: streamState.fileIdx,
            quality: streamState.quality,
            unlockedURL: streamState.unlockedURL
          }));
          debug(`Sent stream info to guest in room ${roomId}`);
        } else {
          ws.send(JSON.stringify({ type: 'error', code: 4010, message: 'No stream selected yet' }));
        }
        break;
      }
      default:
        debug('unknown message', parsed?.type);
    }
  });

  ws.on('close', (code, reason) => {
    // Clean up ping/pong intervals
    clearInterval(pingInterval);
    clearInterval(pongTimeout);

    // Clean up rate limiter
    rateLimiter.delete(ws);

    const userData = socketData.get(ws) || {};
    const roomId = userData.roomId;
    if (!roomId) return;
    const room = rooms.get(roomId);
    if (!room) return;
    room.clients.delete(ws);
    room.seq += 1;
    broadcast(room, { type: 'presence', event: 'leave', userId: userData.userId, seq: room.seq });
    debug('closed', code, reason.toString());

    // Performance optimization: Clean up empty rooms
    if (room.clients.size === 0) {
      rooms.delete(roomId);
      eventBuffers.delete(roomId);
      debug('Cleaned up empty room:', roomId);
    }
  });

  ws.on('error', (error) => {
    debug('WebSocket error:', error);
  });
});

// Performance monitoring
setInterval(() => {
  const totalClients = Array.from(rooms.values()).reduce((sum, room) => sum + room.clients.size, 0);
  debug(`Performance stats: ${rooms.size} rooms, ${totalClients} total clients`);
}, 30000); // Every 30 seconds

// Start server
server.listen(PORT, () => {
  console.log(`🚀 watchparty server listening on port ${PORT}`);
  console.log(`🔗 WebSocket endpoint: ws://localhost:${PORT}/ws`);
  console.log(`❤️  Health check: http://localhost:${PORT}/healthz`);
});
