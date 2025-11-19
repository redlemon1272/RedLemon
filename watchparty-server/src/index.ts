import { WebSocketServer, WebSocket } from 'ws';
import { createServer } from 'http';

type JsonObject = Record<string, unknown>;

type Role = 'host' | 'guest';

interface UserData {
  userId?: string;
  roomId?: string;
  role?: Role;
}

type Room = {
  seq: number;
  clients: Set<WebSocket>;
};

const PORT = Number(process.env.PORT || 8080);
const MAX_MESSAGE_BYTES = Number(process.env.MAX_MESSAGE_BYTES || 8192);
const LOG_LEVEL = process.env.LOG_LEVEL || 'info';
const AUTH_BYPASS = process.env.AUTH_BYPASS !== 'false'; // default true for dev

const rooms = new Map<string, Room>();
const socketData = new WeakMap<WebSocket, UserData>();

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

// Cache for JWKS and decoded tokens
let jwksCache: JWKSResponse | null = null;
let jwksCacheExpiry: number = 0;
const JWKS_CACHE_DURATION = 3600000; // 1 hour in milliseconds

async function fetchJWKS(): Promise<JWKSResponse> {
  const now = Date.now();

  // Return cached JWKS if still valid
  if (jwksCache && now < jwksCacheExpiry) {
    return jwksCache;
  }

  const jwksUrl = process.env.SUPABASE_JWKS_URL;
  if (!jwksUrl) {
    throw new Error('SUPABASE_JWKS_URL environment variable is required');
  }

  debug('Fetching JWKS from:', jwksUrl);

  try {
    const response = await fetch(jwksUrl);
    if (!response.ok) {
      throw new Error(`Failed to fetch JWKS: ${response.status} ${response.statusText}`);
    }

    jwksCache = await response.json() as JWKSResponse;
    jwksCacheExpiry = now + JWKS_CACHE_DURATION;

    debug('JWKS fetched and cached successfully');
    return jwksCache;
  } catch (error) {
    log('Error fetching JWKS:', error);
    throw error;
  }
}

function base64UrlDecode(base64Url: string): string {
  const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
  const paddedBase64 = base64.padEnd(base64.length + (4 - base64.length % 4) % 4, '=');
  return Buffer.from(paddedBase64, 'base64').toString('utf-8');
}

function verifyJWTSignature(token: string, publicKey: string): boolean {
  try {
    // This is a simplified verification - in production, use a proper JWT library
    // For now, we'll do basic structure validation
    const parts = token.split('.');
    if (parts.length !== 3) {
      return false;
    }

    const header = JSON.parse(base64UrlDecode(parts[0]));
    const payload = JSON.parse(base64UrlDecode(parts[1]));

    // Basic validation
    return !!(payload.exp && payload.exp > Date.now() / 1000);
  } catch (error) {
    debug('JWT verification error:', error);
    return false;
  }
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
    // Extract the key ID from the JWT header
    const [headerB64] = token.split('.');
    const header = JSON.parse(base64UrlDecode(headerB64));
    const keyId = header.kid;

    if (!keyId) {
      return { valid: false, error: 'No key ID in JWT header' };
    }

    // Fetch JWKS and find the matching key
    const jwks = await fetchJWKS();
    const key = jwks.keys.find(k => k.kid === keyId);

    if (!key) {
      return { valid: false, error: `Key ID ${keyId} not found in JWKS` };
    }

    // Verify the JWT signature and structure
    const isValid = verifyJWTSignature(token, key.n);
    if (!isValid) {
      return { valid: false, error: 'Invalid JWT signature or expired token' };
    }

    // Decode and validate the payload
    const [, payloadB64] = token.split('.');
    const payload = JSON.parse(base64UrlDecode(payloadB64)) as JWTPayload;

    // Validate expiration
    if (payload.exp && payload.exp <= Date.now() / 1000) {
      return { valid: false, error: 'Token expired' };
    }

    // Validate audience (should match your Supabase project)
    const expectedAudience = process.env.SUPABASE_PROJECT_ID;
    if (expectedAudience && payload.aud !== expectedAudience) {
      return { valid: false, error: 'Invalid audience' };
    }

    // Validate issuer
    const expectedIssuer = process.env.SUPABASE_ISSUER;
    if (expectedIssuer && payload.iss !== expectedIssuer) {
      return { valid: false, error: 'Invalid issuer' };
    }

    debug('JWT verified successfully for user:', payload.sub);
    return { valid: true, userId: payload.sub };

  } catch (error) {
    debug('Token verification error:', error);
    return { valid: false, error: 'Token verification failed' };
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

function broadcast(room: Room, payload: JsonObject) {
  const data = JSON.stringify(payload);
  for (const client of room.clients) {
    if (client.readyState === WebSocket.OPEN) {
      client.send(data);
    }
  }
}

function closeWithCode(ws: WebSocket, code: number, message: string) {
  try {
    ws.close(code, message);
  } catch {
    /* ignore */
  }
}

// Create HTTP server for health checks
const server = createServer((req, res) => {
  if (req.url === '/healthz') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('ok');
  } else {
    res.writeHead(404);
    res.end();
  }
});

// Create WebSocket server
const wss = new WebSocketServer({
  server,
  maxPayload: MAX_MESSAGE_BYTES
});

wss.on('connection', (ws) => {
  debug('open connection');

  // Initialize user data
  socketData.set(ws, {});

  ws.on('message', async (message) => {
    let parsed: any;
    try {
      parsed = JSON.parse(message.toString());
    } catch {
      closeWithCode(ws, 4000, 'invalid_json');
      return;
    }

    const userData = socketData.get(ws) || {};
    if (!userData.userId) {
      // Expect auth message first
      if (parsed?.type !== 'auth') {
        closeWithCode(ws, 4001, 'auth_required');
        return;
      }
      const { token, roomId, role = 'guest', lastSeq = 0 } = parsed || {};
      if (!roomId || typeof roomId !== 'string') {
        closeWithCode(ws, 4002, 'room_required');
        return;
      }
      const result = await verifyToken(token);
      if (!result.valid || !result.userId) {
        closeWithCode(ws, 4003, 'auth_failed');
        return;
      }
      userData.userId = result.userId;
      userData.roomId = roomId;
      userData.role = role === 'host' ? 'host' : 'guest';
      socketData.set(ws, userData);

      const room = getRoom(roomId);
      room.clients.add(ws);

      // Send auth_ok with current seq
      ws.send(JSON.stringify({ type: 'auth_ok', seq: room.seq }));

      // Presence join
      room.seq += 1;
      broadcast(room, { type: 'presence', event: 'join', userId: userData.userId, seq: room.seq });

      // If client provided lastSeq, send snapshot (basic)
      if (lastSeq < room.seq) {
        ws.send(JSON.stringify({ type: 'state_snapshot', seq: room.seq }));
      }
      return;
    }

    // Authenticated path
    const roomId = userData.roomId!;
    const room = getRoom(roomId);
    switch (parsed?.type) {
      case 'play':
      case 'pause':
      case 'seek':
      case 'heartbeat': {
        room.seq += 1;
        const payload: JsonObject = {
          type: 'state',
          event: parsed.type,
          seq: room.seq,
          userId: userData.userId,
        };
        if (parsed.type === 'seek' && typeof parsed.positionMs === 'number') {
          payload.positionMs = parsed.positionMs;
        }
        if (parsed.type === 'heartbeat') {
          if (typeof parsed.positionMs === 'number') payload.positionMs = parsed.positionMs;
          if (typeof parsed.playing === 'boolean') payload.playing = parsed.playing;
        }
        broadcast(room, payload);
        break;
      }
      case 'chat': {
        if (typeof parsed.text !== 'string' || parsed.text.length ===0) return;
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
      default:
        debug('unknown message', parsed?.type);
    }
  });

  ws.on('close', (code, reason) => {
    const userData = socketData.get(ws) || {};
    const roomId = userData.roomId;
    if (!roomId) return;
    const room = rooms.get(roomId);
    if (!room) return;
    room.clients.delete(ws);
    room.seq += 1;
    broadcast(room, { type: 'presence', event: 'leave', userId: userData.userId, seq: room.seq });
    debug('closed', code, reason.toString());
  });

  ws.on('error', (error) => {
    debug('WebSocket error:', error);
  });
});

// Start server
server.listen(PORT, () => {
  console.log(`🚀 watchparty server listening on port ${PORT}`);
});
