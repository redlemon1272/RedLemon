# RedLemon Watch Party: Supabase + WebSocket Service Plan

This document is the handoff for moving watch parties off Supabase Realtime and onto a lightweight WebSocket service while keeping Supabase for auth/data. It also describes how to test on your LAN with 3 Macs *without* any hosted infra, and the minimal client abstractions to keep the UI working with a loopback transport during build-out.

## Responsibilities
- **Supabase**: auth (JWT), user profiles/friends, durable history (watch history, maybe chat archive), metadata for rooms if desired. Not in the hot path for play/pause/seek.
- **WebSocket service**: ephemeral room state (presence, play/pause/seek, chat fan-out), sequencing, backpressure, reconnect/resume. No DB writes on the hot path. Optional Redis later for cross-node presence.

## Protocol (initial cut)
- **Connect**: client opens WS and sends `{type:"auth", token:"<supabase_jwt>", roomId, role:"host|guest", lastSeq?}`. Server verifies JWT against Supabase JWKS/public key and returns `{type:"auth_ok", userId, seq}` or `auth_error`.
- **Control messages** (server assigns/bumps per-room `seq`, echoes back):
  - `play`, `pause`, `seek {positionMs}`, `state_heartbeat {positionMs, playing}`.
  - `chat {text}`.
  - `presence` is implicit on join/leave; server broadcasts joins/leaves.
- **Server broadcasts**: `{type:"state", seq, playing, positionMs, updatedBy}`, `{type:"chat", seq, from, text, ts}`, `{type:"presence", seq, event:"join|leave", userId}`.
- **Reconnect/resume**: client includes `lastSeq` on reconnect; server replays from buffer or sends `state_snapshot` with latest state and new `seq`.
- **Limits**: max message bytes (e.g., 4–8 KB), per-conn rate limits, coalesce heartbeats if lagging.

## Client abstractions (Swift)
- Define `WatchPartyTransport` protocol: `connect(token:roomId:role:)`, `send(.play/.pause/.seek/.chat)`, callbacks for `onState`, `onChat`, `onPresence`, `onReconnectNeeded`.
- Provide two impls:
  1) `LocalLoopbackTransport` (in-process mock) for UI/dev without a server.
  2) `WebSocketTransport` (URLSessionWebSocketTask) for LAN/production.
- Feature flag/setting to choose transport (loopback vs LAN endpoint).

## Local testing (3 Macs on same Wi‑Fi)
- Run the WebSocket service on one Mac (or Docker) listening on a LAN IP, e.g. `ws://192.168.x.x:8080`.
- Disable macOS firewall blocking for that port/process.
- Point the clients on all Macs to that WS URL (not `localhost`).
- Test reconnect: kill the server or toggle Wi‑Fi; clients should back off and resume with `lastSeq`.
- Keep a health ping route (HTTP `/healthz` or WS ping).

## Deployment shape
- **Server**: TypeScript + Node.js WebSocket server (ws library), stateless, env-driven. TLS terminated by Caddy/NGINX/Cloudflare in front.
- **Docker**: small image, envs: `PORT`, `JWKS_URL` (Supabase), `MAX_MESSAGE_BYTES`, `LOG_LEVEL`, `REDIS_URL` (optional later).
- **Scaling**: start single-node; add Redis for presence/room registry if you need >1 node; otherwise DNS/LB swap to move hosts.

## Todo (next steps)
- Add `WatchPartyTransport` protocol + loopback stub to the client.
- Scaffold WebSocket server directory (package.json + src/index.ts) with auth/rooms/state skeleton.
- Wire a feature flag in the app to select loopback vs WS endpoint.
