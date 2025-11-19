# Watch Party WebSocket Service (Work-in-Progress)

Purpose: dedicated realtime service for watch parties. Supabase remains for auth/storage; this service handles rooms/presence/state/chat. This repo includes a minimal skeleton you can run locally or on a VPS (plain WS on 8080) to test with multiple Macs on the same network.

## Responsibilities
- Auth on connect (placeholder): expects an `auth` message; Supabase JWT verification can be wired into `verifyToken` later.
- Room join/leave, presence fan-out.
- Play/pause/seek/state heartbeats with server-side sequencing (`seq`).
- Chat fan-out.
- Reconnect/resume with `lastSeq` (basic snapshot path included).

## Running locally (plain WS on :8080)
```bash
 cd watchparty-server
 npm install
 npm run build
 npm start
# server listens on ws://localhost:8080
```

## Running on your VPS (151.243.109.217)
```bash
# from repo root on your Mac, copy files up
scp -i ~/.ssh/id_ed25519_redlemon -r watchparty-server root@151.243.109.217:/opt/watchparty-server
ssh -i ~/.ssh/id_ed25519_redlemon root@151.243.109.217
cd /opt/watchparty-server
apt install -y nodejs npm   # if Node not present
npm install
npm run build
npm start                   # listens on ws://0.0.0.0:8080
```
Ensure firewall allows 8080 (see main setup instructions). You can test from your Mac with any WS client: `ws://151.243.109.217:8080`.

## Configuration (env)
- `PORT` (default 8080)
- `MAX_MESSAGE_BYTES` (default 8192)
- `LOG_LEVEL` (default `info`)
- `AUTH_BYPASS` (default `true` for now; set `false` when wiring Supabase JWT)

## Minimal protocol (JSON)
- Client first sends: `{"type":"auth","userId":"<uuid>","roomId":"<string>","lastSeq":0}`
- Server responds: `{"type":"auth_ok","seq":<number>}`
- Control/state: `{"type":"play"}`, `{"type":"pause"}`, `{"type":"seek","positionMs":1234}`, `{"type":"heartbeat","positionMs":1234,"playing":true}`, `{"type":"chat","text":"hi"}`
- Server broadcasts: `state` updates with `seq`, chat messages, and presence events.

## Docker (optional)
- A Dockerfile is included for future deployment behind a TLS proxy (Caddy/NGINX). Build: `docker build -t watchparty-ws .` then run: `docker run --rm -p 8080:8080 watchparty-ws`.

## TODO
- Wire real Supabase JWT verification in `verifyToken`.
- Add rate limiting/backpressure handling.
- Add optional Redis for multi-node presence if ever needed.
