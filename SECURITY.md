# Security & Privacy

## Public Information (Safe to Share)

✅ **These are PUBLIC and safe:**
- Supabase anon key in `Config.swift` - This is a **public** client key with RLS policies
- GitHub repository and releases
- All code in this repository

## Private Information (NEVER Share)

🔒 **KEEP THESE SECRET:**
- Supabase service_role key (NOT in this repo)
- Real-Debrid API tokens (stored in user's Keychain only)
- SubDL API keys (stored in user's Keychain only)

## Current Architecture (2025)

RedLemon uses **native Swift** with:
- ✅ **URLSession WebSocketTask** for real-time (no external dependencies)
- ✅ **Vapor** for local HTTP server (stream resolution)
- ✅ **Sparkle** for auto-updates (GitHub-hosted)
- ✅ **Supabase** for PostgreSQL database + Realtime WebSocket
- ✅ **Keychain** for secure local credential storage

**No Supabase SDK dependency** - we use URLSession's built-in WebSocket implementation for watch party sync via our production uWebSockets.js server (wss://151.243.109.217.nip.io/ws).

## For Anonymous Developers

If you want to remain anonymous:

1. **Remove from documentation:**
   - Your username from `HANDOFF.md`, `INDEX.md`
   - Replace with generic placeholders like `<YOUR_USERNAME>` or `<PROJECT_ROOT>`

2. **Git commits:**
   - Use a pseudonymous email: `git config user.email "anonymous@example.com"`
   - Use a pseudonymous name: `git config user.name "Anonymous Builder"`

3. **Before publishing:**
   - Review all `.md` files for personal info
   - Check git history: `git log --all --format='%an <%ae>' | sort -u`
   - Consider squashing commits to remove metadata

## Supabase Row Level Security

The Supabase anon key is **intentionally public**. Security is enforced by:

- **RLS Policies** on all tables (defined in `docs/SUPABASE_SETUP.md`)
- Users can only access their own data
- No sensitive data in database
- Real-Debrid tokens stored locally in macOS Keychain, never uploaded

## Auto-Update Security

Updates are delivered via:
- **Sparkle Framework** - Industry-standard macOS auto-updater
- **GitHub Releases** - DMG files hosted on GitHub
- **Appcast XML** - Public feed at `https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml`

Security features:
- HTTPS-only downloads
- File size verification
- Optional code signing (Ed25519 keys for production)

## ICP Canister Security

The canister has admin-only methods protected by:

```motoko
assert(Principal.isController(caller));
```

Only the controller principal can upload updates. Public users can only:
- Query latest version
- Download update chunks

## Reporting Security Issues

If you find a vulnerability, please:
1. **Do NOT** open a public GitHub issue
2. Contact privately or create a draft security advisory
3. Allow time for a fix before disclosure

## Safe Distribution

When distributing RedLemon:
- ✅ Share the DMG publicly (via GitHub Releases)
- ✅ Share this source code publicly
- ✅ Share appcast.xml feed URL
- ❌ Never share Supabase service_role key

## No Telemetry or Tracking

RedLemon does **not** collect:
- ❌ Usage statistics
- ❌ Crash reports
- ❌ IP addresses
- ❌ Watch history (stored locally only)
- ❌ Analytics

We only use:
- ✅ Supabase for usernames and friend lists (opt-in, requires username setup)
- ✅ uWebSockets.js server for watch party sync (WSS encrypted, production deployment)

---

**Remember:** The "anon" key is meant to be public. That's why it's called "anon" (anonymous). The real security is in the database policies. 🔒
