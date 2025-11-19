# Watch Party Handoff (Supabase + WebSocket Service)

This is the current state and next steps to finish watch parties with Supabase for auth/storage and a WebSocket service for realtime.

## Repo state (uncommitted)
- `docs/watchparty-websockets.md`: Architecture/protocol notes, Supabase vs WebSocket service responsibilities, reconnect/backpressure, LAN testing, deploy shape.
- `Sources/Features/WatchParty/WatchPartyTransport.swift`: Client transport abstraction with a `LocalLoopbackTransport` so the UI can run without a server; ready for a future `WebSocketTransport`.
- `watchparty-server/` scaffold:
  - `package.json`, `tsconfig.json`
  - `src/index.ts`: Minimal WebSocket server using `ws` library (AUTH_BYPASS default), rooms/presence/state/chat, healthz.
  - `Dockerfile`, `.dockerignore`, README.

## Server (anonvm) status
- Host: `151.243.109.217`, Ubuntu 24.04.
- SSH: `ssh -i ~/.ssh/id_ed25519_redlemon root@151.243.109.217`
- Firewall: ufw enabled; 22/80/443/8080 open.
- Docker: installed and verified (`hello-world`).
- Node: install was in progress; if missing, run `apt install -y nodejs npm`.

## To run the WS skeleton on the server
1) Copy code from your Mac (repo root):
   ```bash
   scp -i ~/.ssh/id_ed25519_redlemon -r watchparty-server root@151.243.109.217:/opt/watchparty-server
   ```
2) SSH in and run:
   ```bash
   ssh -i ~/.ssh/id_ed25519_redlemon root@151.243.109.217
   cd /opt/watchparty-server
   apt install -y nodejs npm   # if needed
   npm install
   npm run build
   npm start   # serves ws://0.0.0.0:8080
   ```
   Keep the terminal open for logs. Plain WS on port 8080; TLS can be added later with a proxy.
   - Docker alternative:
   ```bash
   docker build -t watchparty-ws .
   docker run --rm -p 8080:8080 watchparty-ws
   ```
3) Test from your Mac:
   ```bash
   node -e "const WebSocket=require('ws'); const ws=new WebSocket('ws://151.243.109.217:8080'); ws.on('open',()=>{ws.send(JSON.stringify({type:'auth',roomId:'test',token:'dev'})); ws.send(JSON.stringify({type:'chat',text:'hi'}));}); ws.on('message',m=>console.log('msg',m.toString()));"
   ```

## Protocol (initial)
- Client first: `{"type":"auth","userId":"<uuid>","roomId":"<string>","lastSeq":0}` (token is ignored when AUTH_BYPASS=true).
- Server responds: `{"type":"auth_ok","seq":<n>}`; broadcasts presence join.
- State/control: `play`, `pause`, `seek{positionMs}`, `heartbeat{positionMs,playing}` → server broadcasts `state` with `seq`.
- Chat: `{"type":"chat","text":"hi"}` → broadcast with `seq`, `userId`, `ts`.
- Presence: join/leave broadcasts with `seq`.
- `lastSeq` on reconnect is accepted; snapshot stub exists.

## Next steps (client)
- Implement `WebSocketTransport` (Swift, URLSessionWebSocketTask) using the above protocol; add reconnect/backoff and `lastSeq` resume.
- Add a feature toggle to choose `LocalLoopbackTransport` (default) vs `WebSocketTransport` with a configurable endpoint (`ws://151.243.109.217:8080` for now).

## Next steps (server)
- Wire Supabase JWT verification in `verifyToken` (JWKS fetch/cache); set `AUTH_BYPASS=false` when ready.
- Add basic rate limiting/backpressure handling (beyond max payload).
- Optional: Dockerize behind Caddy/NGINX with TLS if you get a domain; otherwise keep plain WS for LAN tests.
- Optional: Redis for multi-node presence later.

## Notes
- No commits have been made; changes are local/untracked.
- Server needs a reboot to load the new kernel (pending from updates), but not required for the WS service.
