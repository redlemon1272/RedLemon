# RedLemon Migration Guide: Self-Hosted → Supabase Cloud

**Date:** 2026-02-26
**Goal:** Migrate from self-hosted Supabase (Ubuntu server) to Supabase Cloud Free Tier

---

## ✅ Changes Already Made to Code

The following changes have been applied to the codebase:

### 1. Provider Changes
- ✅ Removed `ZileanService.swift`
- ✅ Removed Zilean from provider registration in `HTTPServer.swift`
- ✅ Removed `ZileanConfig` from `ProviderService.swift`
- ✅ Updated provider list in API health endpoint

**Remaining providers:** Torrentio, Comet, MediaFusion, DebridSearch (4 providers)

### 2. Payment System
- ✅ Disabled monetization in `LicenseManager.swift` (`isMonetizationEnabled = false`)
- ✅ All users are now automatically "Premium" (no payment wall)
- ✅ Crypto payment edge functions no longer needed

### 3. Admin Dashboard
- ✅ Removed "Payments" tab
- ✅ Removed "Server" tab
- ✅ Removed Zilean status card from Overview

### 4. Configuration
- ✅ Updated `Config.swift` with placeholder Supabase Cloud URL

---

## 📋 Migration Checklist

### Phase 1: Supabase Cloud Setup

- [ ] **Create Supabase Cloud Project**
  1. Go to https://supabase.com
  2. Click "New Project"
  3. Choose organization (or create free one)
  4. Project name: `redlemon-cloud` (or your choice)
  5. Database password: Generate and save securely
  6. Region: Choose closest to your users
  7. Click "Create new project"

- [ ] **Get Project Credentials**
  1. Go to Project Settings > API
  2. Copy these values:
     - `Project URL` (format: `https://xxxxxxxx.supabase.co`)
     - `anon public` key
  3. Update `Config.swift` with these values:
     ```swift
     static let supabaseURL = "https://YOUR_PROJECT_ID.supabase.co"
     static let supabaseAnonKey = "YOUR_ANON_KEY_HERE"
     ```

### Phase 2: Database Migration

- [ ] **Export from Self-Hosted**
  ```bash
  # SSH into your server
  ssh root@151.243.109.243

  # Export database
  docker exec supabase-db pg_dump -U postgres postgres > /tmp/redlemon_export.sql

  # Exit and download to Mac
  exit
  scp root@151.243.109.243:/tmp/redlemon_export.sql ~/Desktop/
  ```

- [ ] **Import to Supabase Cloud**

  **Method A: Via Supabase Dashboard (Easier)**
  1. Go to your Supabase Cloud project
  2. Navigate to SQL Editor
  3. Create a new query
  4. Paste the contents of `redlemon_export.sql`
  5. Execute (may take several minutes)

  **Method B: Via psql CLI**
  ```bash
  # Get connection string from Supabase Dashboard > Settings > Database
  psql "postgresql://postgres:[YOUR-PASSWORD]@db.[PROJECT-REF].supabase.co:5432/postgres" < redlemon_export.sql
  ```

- [ ] **Verify Data Migration**
  Run these queries in Supabase SQL Editor to verify:
  ```sql
  -- Check users
  SELECT COUNT(*) FROM users;

  -- Check rooms
  SELECT COUNT(*) FROM rooms;

  -- Check payments (if keeping history)
  SELECT COUNT(*) FROM payment_transactions;
  ```

- [ ] **Re-run Migrations (if needed)**
  Some migrations may need to be reapplied. Run any `.sql` files from `supabase/migrations/` that create functions or triggers:
  ```bash
  # Via psql
  cat supabase/migrations/*.sql | psql "postgresql://..."
  ```

### Phase 3: Test the App

- [ ] **Build and Run**
  ```bash
  # Build the app
  ./build-app-debug.sh

  # Or open in Xcode and run
  open RedLemon.xcodeproj
  ```

- [ ] **Test Core Features**
  - [ ] User registration/login
  - [ ] Browse movies/shows
  - [ ] Stream playback
  - [ ] Watch Party (create room, invite guest)
  - [ ] Chat functionality
  - [ ] Realtime sync

### Phase 4: Clean Up (Optional)

- [ ] **Cancel Server** (once migration is verified)
  - Cancel the AnonVM VPS subscription
  - Update DNS if you had any custom domains

---

## ⚠️ Important Notes

### What Still Works on Supabase Cloud Free Tier

| Feature | Status | Notes |
|---------|--------|-------|
| Database | ✅ | 500MB limit (Postgres) |
| Auth | ✅ | Unlimited users |
| Realtime | ✅ | 200 concurrent connections |
| Edge Functions | ✅ | 500K requests/month |
| Storage | ✅ | 1GB file storage |
| REST API | ✅ | Via PostgREST |

### What's Different

1. **No Custom Cron Jobs**: Self-hosted had pg_cron for Zilean maintenance. Cloud Supabase has cron extension but you may need to enable it.

2. **Database Size**: Free tier is 500MB. Monitor usage in Dashboard.

3. **Row Level Security**: All tables have RLS enabled by default. Verify policies are correct.

### What's Gone

1. **Zilean**: Self-hosted torrent hash DB (removed, 4 other providers remain)
2. **Server SSH Access**: Use Supabase Dashboard instead
3. **Crypto Payments**: Disabled (all users now premium)

---

## 🔧 Troubleshooting

### Realtime Connection Issues
If watch parties don't work:
1. Check Realtime logs in Supabase Dashboard
2. Verify RLS policies allow authenticated users
3. Check that channel names match

### Edge Function Errors
If any edge functions fail:
1. Re-deploy via Supabase CLI:
   ```bash
   supabase functions deploy --project-ref YOUR_PROJECT_ID
   ```
2. Check logs in Supabase Dashboard > Edge Functions

### Database Errors
If queries fail:
1. Check that all tables exist
2. Verify RLS policies
3. Check SQL Editor logs for errors

---

## 📊 Free Tier Limits

| Resource | Limit |
|----------|-------|
| Database | 500MB |
| Auth users | Unlimited |
| Realtime connections | 200 |
| Edge Function requests | 500K/month |
| File storage | 1GB |
| Bandwidth | 1GB/month |

Monitor usage in: Supabase Dashboard > Settings > Billing

---

## 🎯 Post-Migration Checklist

- [ ] Update AI_BIBLE.md with new architecture
- [ ] Test all core features
- [ ] Monitor database size for first week
- [ ] Cancel old server (after 1 week of stability)
- [ ] Update any documentation with new URLs

---

## 🆘 Support

If you encounter issues:
1. Check Supabase Dashboard logs
2. Review Supabase documentation: https://supabase.com/docs
3. Check GitHub issues for similar problems
