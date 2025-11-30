# Events Config Setup Guide

This guide explains how to set up and populate the centralized events configuration system.

## Overview

The events config system ensures all RedLemon instances show identical movie/TV event schedules by storing curated lists in Supabase instead of fetching from dynamic streaming catalogs.

## Prerequisites

- Supabase project with admin access
- Supabase URL and anon key
- Swift 5.9+ (for running the generation script)

## Step 1: Run Database Migration

1. Log into your Supabase dashboard
2. Go to **SQL Editor**
3. Open `supabase/migrations/001_create_events_config.sql`
4. Copy and paste the entire SQL script
5. Click **Run** to execute the migration

This creates:
- `events_config` table
- Indexes for fast lookups
- Auto-update triggers
- Row Level Security policies
- Initial empty config row

## Step 2: Configure the Generation Script

1. Open `Scripts/generate_events_config.swift`
2. Update the configuration at the top:

```swift
let supabaseURL = "https://YOUR_PROJECT.supabase.co"
let supabaseAnonKey = "YOUR_ANON_KEY"
let configVersion = 1  // Increment when updating
```

**Finding your Supabase credentials:**
- Go to Supabase Dashboard → Settings → API
- Copy **Project URL** (for `supabaseURL`)
- Copy **anon/public** key (for `supabaseAnonKey`)

## Step 3: Run the Generation Script

The script will:
1. Fetch movies from streaming catalogs (Netflix, Disney+, etc.)
2. Apply your quality filters (genres, ratings, blacklist)
3. Use deterministic shuffle for consistent ordering
4. Upload the curated list to Supabase

**Run the script:**

```bash
cd /Users/danielnoble/Desktop/RedLemon-Native
swift Scripts/generate_events_config.swift
```

**Expected output:**

```
🎬 RedLemon Events Config Generator
==================================================

📡 Step 1: Fetching movies from streaming catalogs...
   ✅ Fetched 245 items from nfx
   ✅ Fetched 189 items from dnp
   ...
📊 Total fetched: 1234 movies

🔄 Step 2: Deduplicating and sorting...
📊 Unique movies: 987 movies

🎲 Step 3: Applying deterministic shuffle...
   Seed: 20250209 (Cycle #83)

🔍 Step 4: Applying quality filters...
📊 Filtered to 156 high-quality movies

📦 Step 5: Converting to MediaItem format...
✅ Generated 156 movies for events

📋 Step 6: Creating events config...

☁️  Step 7: Uploading to Supabase...
✅ Successfully uploaded config version 1
   Movies: 156
   Cycle duration: 200 hours

📽️  First 10 movies:
   1. Inception (8.8)
   2. The Dark Knight (9.0)
   ...

✅ Done! All RedLemon instances will now use this config.
==================================================
```

## Step 4: Verify in Supabase

1. Go to Supabase Dashboard → Table Editor
2. Select `events_config` table
3. Verify you see a row with:
   - `config_type`: "movie_events"
   - `version`: 1
   - `is_active`: true
   - `data`: JSON object with movie array

## Step 5: Test in RedLemon

1. Launch RedLemon
2. Check logs for:
   ```
   ✅ [EventsConfig] Fetched movie_events version 1 with 156 movies
   ```
3. Go to Events tab
4. Verify movies are displayed

## Updating the Config

To update the movie list (e.g., add new movies, change filters):

1. **Increment the version** in `generate_events_config.swift`:
   ```swift
   let configVersion = 2  // Was 1, now 2
   ```

2. **Run the script again**:
   ```bash
   swift Scripts/generate_events_config.swift
   ```

3. **Deactivate old version** (optional, in Supabase SQL Editor):
   ```sql
   UPDATE events_config 
   SET is_active = false 
   WHERE config_type = 'movie_events' AND version = 1;
   ```

4. **Restart RedLemon** - it will automatically fetch the new version

## Customizing Filters

Edit the filters in `generate_events_config.swift`:

### Genre Filters

```swift
// Unwanted genres (will be excluded)
let unwantedGenres = ["Documentary", "Short", "Animation", ...]

// Required genres (must have at least one)
let excitingGenres = ["Thriller", "Horror", "Action", "Sci-Fi", "Crime"]
```

### Rating Filter

```swift
// Minimum IMDB rating
rating >= 7.0
```

### Release Year Filter

```swift
// Minimum release year
year >= 1990
```

### Blacklist

```swift
let blacklistedTitles = [
    "Movie Title 1",
    "Movie Title 2",
    ...
]
```

## Troubleshooting

### Script fails with "invalidResponse"

- Check your Supabase URL and anon key
- Verify the `events_config` table exists
- Check Supabase logs for errors

### No movies in RedLemon

- Check logs for EventsConfig errors
- Verify Supabase table has data
- Check `is_active = true` in database

### Different movies on different devices

- Verify all devices are using the same config version
- Check logs for version number
- Clear cache: Delete UserDefaults key `events_config_cache_movie_events`

## Architecture

```
┌─────────────────┐
│ generate_events │  (One-time script)
│   _config.swift │
└────────┬────────┘
         │
         │ Uploads curated list
         ▼
┌─────────────────┐
│    Supabase     │
│ events_config   │  (Central source of truth)
│     table       │
└────────┬────────┘
         │
         │ Fetches on startup
         ▼
┌─────────────────┐
│ EventsConfig    │  (Swift service)
│    Service      │
└────────┬────────┘
         │
         │ Provides movies
         ▼
┌─────────────────┐
│  LocalAPIClient │
│ .fetchTopMovies │
│   ForEvents()   │
└────────┬────────┘
         │
         │ Displays
         ▼
┌─────────────────┐
│   EventsView    │  (UI)
└─────────────────┘
```

## Benefits

✅ **Consistency**: All users see identical movie lists
✅ **Control**: You curate the exact movies shown
✅ **Reliability**: No dependency on external catalog changes
✅ **Performance**: Cached locally, fast loading
✅ **Versioning**: Easy to update and rollback

## Next Steps

- Set up automated script to regenerate config weekly
- Add TV events config (same process, different `config_type`)
- Monitor Supabase usage and optimize queries
