# Duplicate Streams Fix - November 2025

## Problem
The "Show All Streams" feature was displaying duplicate streams for the same quality, making it difficult for users to find unique stream options. The issue was particularly visible when selecting 1080p quality - users would see the same stream title repeated multiple times.

### Root Cause
The original deduplication logic was grouping streams **by normalized title**, which caused it to eliminate different streams that had similar names but came from different sources (different torrent hashes).

**Example from console logs:**
- 197 raw streams received
- Many had identical titles like "MediaFusion | ElfHosted P2P 1080P ⏳"
- But these were actually DIFFERENT streams from the same provider with different torrent hashes
- The old deduplication would keep only ONE, losing other unique sources

## Solution
Changed deduplication strategy to group streams **by their source identifier (infoHash or URL)** instead of by title.

### How It Works

1. **Group by infoHash first** - Torrents with the same infoHash are identical sources
2. **Group by URL second** - Direct HTTP streams with the same URL are identical sources
3. **Keep uncategorized streams** - Streams without hash/URL can't be duplicated
4. **From each group, select the best stream** - Keep only the stream with the highest seeder count
5. **Sort by seeders** - Return all unique sources sorted by availability

### Code Changes

**File:** `Sources/Server/Routes/StreamRoutes.swift` (in the `resolveAll` endpoint)

**Old Logic:**
```swift
// Group streams by normalized title
var titleGroups: [String: [Stream]] = [:]
for stream in streamsWithSubtitles {
    let normalizedTitle = normalizeStreamTitle(stream.title)
    titleGroups[normalizedTitle] = ...
}
// Only keep one stream per title
```

**New Logic:**
```swift
// Group streams by infoHash (true source identifier)
var infoHashGroups: [String: [Stream]] = [:]
var urlGroups: [String: [Stream]] = [:]

for stream in streamsWithSubtitles {
    if let infoHash = stream.infoHash {
        infoHashGroups[infoHash] = ...
    } else if let url = stream.url {
        urlGroups[url] = ...
    }
}
// Keep one stream per unique source
```

## Benefits

✅ **No more false duplicates** - Different torrents with similar names are now preserved
✅ **All unique sources shown** - Users see all available quality options for their selected quality
✅ **Best seeders selected** - When the same torrent comes from multiple providers, we keep the one with highest seeders
✅ **Better transparency** - Console logs show exactly how many true duplicates (same source, different providers) exist

## Console Log Output

The improved logging shows:

```
🔍 Deduplication analysis:
   InfoHash groups: 45 (unique torrents)
   URL groups: 2 (unique direct streams)
   Uncategorized (no hash/url): 0
🔄 DEDUPLICATION: 197 → 47 unique sources
🌵 WILD WEST MODE: Returning 47 deduplicated streams (sorted by seeders only)

🚨 DUPLICATE SOURCE: InfoHash 'abc12345...' has 3 copies from torrentio, mediafusion, jackettio
```

This tells you:
- Started with 197 streams
- Found 45 unique torrents (different infoHashes)
- 47 final unique sources (some torrents available through multiple providers)
- When a torrent appears from 3 providers, only 1 is kept (the one with most seeders)

## Testing

To verify the fix works:

1. Open a movie/TV show in the Browse view
2. Click "Show All Streams"
3. Select 1080p quality
4. Compare stream titles - you should see variety (different releases, different sources)
5. Check console logs for the deduplication analysis message
6. Verify that duplicate titles are now minimized while all unique sources are preserved

## Technical Details

- **IntoHash-based dedup:** Only the 40-character SHA1 hash of the torrent is compared
- **URL-based dedup:** Full URL comparison for direct streams (Comet, direct HTTP, etc.)
- **Seeder selection:** When same source exists from multiple providers, highest seeders wins
- **No title modification:** Stream titles are preserved as-is for user readability

## Removed Code

Removed the unused `normalizeStreamTitle()` function that was used for title-based deduplication. This function is no longer needed with the new infoHash-based approach.
