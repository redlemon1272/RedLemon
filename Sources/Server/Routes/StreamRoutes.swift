//
//  StreamRoutes.swift
//  RedLemon
//
//  Routes for stream resolution
//

import Foundation
import Vapor

func registerStreamRoutes(_ app: Application) {
    // POST /api/streams/resolve
    app.post("api", "streams", "resolve") { req async throws -> Response in
        let request = try req.content.decode(ResolveRequest.self)

        print("🔍 Resolving streams for: \(request.imdbId)")

        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: request.imdbId,
            type: request.type ?? "movie",
            season: request.season,
            episode: request.episode,
            providerNames: request.providers
        )

        // Sort by quality and seeders
        var sorted = sortStreams(streams)

        // Attach subtitles to streams
        sorted = await attachSubtitles(
            to: sorted,
            imdbId: request.imdbId,
            type: request.type ?? "movie",
            season: request.season,
            episode: request.episode
        )

        let response = ResolveResponse(
            streams: sorted,
            count: sorted.count
        )

        let jsonData = try JSONEncoder().encode(response)
        let httpResponse = Response(status: .ok)
        httpResponse.body = .init(data: jsonData)
        httpResponse.headers.contentType = .json

        print("✅ Found \(sorted.count) streams")

        return httpResponse
    }

    // GET /api/streams/resolveByQuality - ColorFruit bucket logic
    app.get("api", "streams", "resolveByQuality") { req async throws -> Response in
        print("🔥🔥🔥 RESOLVEBY QUALITY ENDPOINT HIT!")

        guard let imdbId = req.query[String.self, at: "imdbId"] else {
            throw Abort(.badRequest, reason: "Missing imdbId")
        }

        let type = req.query[String.self, at: "type"] ?? "movie"
        let season = req.query[Int.self, at: "season"]
        let episode = req.query[Int.self, at: "episode"]
        let year = req.query[String.self, at: "year"] // e.g., "2025", "2005"

        print("🔍 Resolving streams by quality buckets for: \(imdbId) (S\(season ?? 0)E\(episode ?? 0))")
        if let year = year {
            print("   📅 Filtering by year: \(year)")
        }

        // Fetch all streams from providers
        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            providerNames: nil
        )

        print("📦 Received \(streams.count) raw streams, bucketing by quality...")

        // Attach subtitles to all streams
        var streamsWithSubtitles = await attachSubtitles(to: streams, imdbId: imdbId, type: type, season: season, episode: episode)

        // Filter by year if provided (removes wrong releases like 2005 version when looking for 2025)
        if let year = year, type == "movie" {
            let beforeCount = streamsWithSubtitles.count
            streamsWithSubtitles = streamsWithSubtitles.filter { stream in
                let title = stream.title

                // Strict year patterns that match ONLY the exact target year
                // Use explicit boundaries: space, dot, paren, bracket, underscore, dash, start/end of string
                let exactYearPatterns = [
                    "\\(\(year)\\)",               // (1991)
                    "\\.\(year)\\.",               // .1991.
                    " \(year) ",                   //  1991  (space-year-space)
                    " \(year)$",                   //  1991 at end (space-year-end)
                    "^\(year) ",                  // 1991 at start (year-space)
                    "\\.\(year)$",                 // .1991 at end (dot-year-end)
                    " \(year)\\.",                 //  1991. (space-year-dot)
                    "_\(year)_",                   // _1991_ (underscore-year-underscore)
                    "-\(year)-",                   // -1991- (dash-year-dash)
                    "\\[\(year)\\]",               // [1991] (brackets-year)
                    "^\(year)$",                  // 1991 as entire string
                ]

                // Check for exact year match first
                for pattern in exactYearPatterns {
                    if let regex = try? NSRegularExpression(pattern: pattern) {
                        let range = NSRange(location: 0, length: title.utf16.count)
                        if regex.firstMatch(in: title, range: range) != nil {
                            return true
                        }
                    }
                }

                // If no exact year match, exclude this stream
                return false
            }
            let afterCount = streamsWithSubtitles.count
            print("   📅 Year filter (\(year)): \(beforeCount) → \(afterCount) streams")
        }

        // CRITICAL: Filter x265/HEVC streams (server-side, ALWAYS runs)
        let beforeCodecFilter = streamsWithSubtitles.count
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        streamsWithSubtitles = streamsWithSubtitles.filter { stream in
            let titleLower = stream.title.lowercased()
            let hasBadCodec = badCodecs.contains { codec in
                titleLower.contains(codec)
            }
            if hasBadCodec {
                print("   🚫 SERVER BLOCKING x265/HEVC: \(stream.title)")
            }
            return !hasBadCodec
        }
        let afterCodecFilter = streamsWithSubtitles.count
        if afterCodecFilter < beforeCodecFilter {
            print("   🚫 SERVER FILTERED x265: \(beforeCodecFilter) → \(afterCodecFilter) streams")
        }

        print("   📊 After x265 filter: \(streamsWithSubtitles.count) streams remaining")
        for (idx, stream) in streamsWithSubtitles.prefix(5).enumerated() {
            print("      [\(idx)] \(stream.title)")
        }

        // CRITICAL: Filter by episode pattern for TV shows ONLY (before bucketing!)
        // Only apply episode filtering to TV series, not movies
        if type == "series" && season != nil && episode != nil {
            let beforeEpisodeFilter = streamsWithSubtitles.count

            let episodePatterns = [
                String(format: "s%02de%02d", season!, episode!),  // s01e01
                String(format: "s%de%d", season!, episode!),      // s1e1
                String(format: "s%02d e%02d", season!, episode!), // s01 e01
                String(format: "%dx%02d", season!, episode!),     // 1x01
                String(format: "season %d episode %d", season!, episode!) // season 1 episode 1
            ]

            let seasonOnlyPatterns = [
                String(format: " s%02d ", season!),    // " s01 " (season pack)
                String(format: ".s%02d.", season!),    // ".s01."
                String(format: " s%d ", season!),      // " s1 "
                String(format: ".s%d.", season!),      // ".s1."
                String(format: "season.%d.", season!), // "season.1."
                String(format: "season %d ", season!)  // "season 1 "
            ]

            streamsWithSubtitles = streamsWithSubtitles.filter { stream in
                let titleLower = stream.title.lowercased()

                // Check for Comet cached streams first - they're pre-verified and should be trusted
                let isCometCached = stream.provider.lowercased() == "comet" &&
                                  (stream.title.contains("[RD⚡]") || stream.title.contains("⚡"))

                if isCometCached {
                    // For Comet cached streams, be more lenient - they're pre-verified content
                    // Just check if it's a reasonable season/episode match, not exact naming
                    let seasonInTitle = titleLower.contains("s\(season!)") || titleLower.contains("season \(season!)")
                    let episodeInTitle = titleLower.contains("e\(episode!)") || titleLower.contains("episode \(episode!)")

                    if seasonInTitle && episodeInTitle {
                        print("   ✅ TRUSTED Comet cached stream: \(stream.title)")
                        return true
                    } else {
                        print("   ⏭️  Skipping Comet stream (wrong season/episode): \(stream.title)")
                        return false
                    }
                }

                // For non-Comet streams, use strict pattern matching
                let matchesEpisode = episodePatterns.contains { pattern in
                    titleLower.contains(pattern)
                }

                // Match season pack patterns (e.g., "S01 Complete")
                let matchesSeasonPack = seasonOnlyPatterns.contains { pattern in
                    titleLower.contains(pattern)
                }

                let matches = matchesEpisode || matchesSeasonPack

                if !matches && !isCometCached {
                    print("   ⏭️  Skipping \(stream.title) - doesn't match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!))")
                }

                return matches || isCometCached
            }

            let afterEpisodeFilter = streamsWithSubtitles.count
            print("   📺 Episode filter (S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)): \(beforeEpisodeFilter) → \(afterEpisodeFilter) streams")

            guard afterEpisodeFilter > 0 else {
                print("   ❌ No streams match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)) pattern")
                throw Abort(.notFound, reason: "No streams match the requested episode")
            }
        } else if type == "movie" && (season != nil || episode != nil) {
            // SAFETY: Log if episode data is being passed for a movie (shouldn't happen after AppState fix)
            print("   ⚠️ WARNING: Movie type received season/episode data (season: \(season ?? 0), episode: \(episode ?? 0)) - this should be filtered out by client")
        }

        // Partition into quality buckets (ColorFruit logic)
        var buckets: [String: [Stream]] = [
            "4K": [],
            "1080p": [],
            "720p": [],
            "480p": []
        ]

        for stream in streamsWithSubtitles {
            let bucket = determineQualityBucket(stream.quality ?? "")
            buckets[bucket, default: []].append(stream)
        }

        print("   📦 Bucket counts (before processBucket):")
        print("      4K: \(buckets["4K"]?.count ?? 0)")
        print("      1080p: \(buckets["1080p"]?.count ?? 0)")
        print("      720p: \(buckets["720p"]?.count ?? 0)")
        print("      480p: \(buckets["480p"]?.count ?? 0)")

        // Filter and sort each bucket (1 seeder minimum - Real-Debrid handles the rest)
        let qualityBuckets = QualityBuckets(
            uhd4k: processBucket(buckets["4K"] ?? [], minSeeders: 1, quality: "4K", year: year),
            fullHD: processBucket(buckets["1080p"] ?? [], minSeeders: 1, quality: "1080p", year: year),
            hd: processBucket(buckets["720p"] ?? [], minSeeders: 1, quality: "720p", year: year),
            sd: processBucket(buckets["480p"] ?? [], minSeeders: 1, quality: "480p", year: year)
        )

        print("   📦 Bucket counts (after processBucket/seeder filter):")
        print("      4K: \(qualityBuckets.uhd4k?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.uhd4k?.alternates?.count ?? 0) alts")
        print("      1080p: \(qualityBuckets.fullHD?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.fullHD?.alternates?.count ?? 0) alts")
        print("      720p: \(qualityBuckets.hd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.hd?.alternates?.count ?? 0) alts")
        print("      480p: \(qualityBuckets.sd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.sd?.alternates?.count ?? 0) alts")

        // CRITICAL FIX: Build streams array respecting server's ordering
        var finalStreams: [Stream] = []

        // Add 4K bucket if available
        if let uhd4k = qualityBuckets.uhd4k {
            if let primary = uhd4k.primary {
                finalStreams.append(primary)
                print("📦 Adding 4K primary: \(primary.title)")
            }
            if let alternates = uhd4k.alternates {
                for alt in alternates {
                    finalStreams.append(alt)
                    print("📦 Adding 4K alternate: \(alt.title)")
                }
            }
        }

        // Add 1080p bucket if available (highest priority for most users)
        if let fullHD = qualityBuckets.fullHD {
            if let primary = fullHD.primary {
                finalStreams.append(primary)
                print("📦 Adding 1080p primary: \(primary.title)")
            }
            if let alternates = fullHD.alternates {
                for alt in alternates {
                    finalStreams.append(alt)
                    print("📦 Adding 1080p alternate: \(alt.title)")
                }
            }
        }

        // Add 720p bucket if available
        if let hd = qualityBuckets.hd {
            if let primary = hd.primary {
                finalStreams.append(primary)
                print("📦 Adding 720p primary: \(primary.title)")
            }
            if let alternates = hd.alternates {
                for alt in alternates {
                    finalStreams.append(alt)
                    print("📦 Adding 720p alternate: \(alt.title)")
                }
            }
        }

        // Add 480p bucket if available
        if let sd = qualityBuckets.sd {
            if let primary = sd.primary {
                finalStreams.append(primary)
                print("📦 Adding 480p primary: \(primary.title)")
            }
            if let alternates = sd.alternates {
                for alt in alternates {
                    finalStreams.append(alt)
                    print("📦 Adding 480p alternate: \(alt.title)")
                }
            }
        }

        print("🏆 FINAL SERVER ORDER SENT TO CLIENT:")
        for (idx, stream) in finalStreams.prefix(10).enumerated() {
            print("   [\(idx + 1)] \(stream.title)")
        }

        let response = QualityBucketsResponse(buckets: qualityBuckets)

        let jsonData = try JSONEncoder().encode(response)
        let httpResponse = Response(status: .ok)
        httpResponse.body = .init(data: jsonData)
        httpResponse.headers.contentType = .json

        print("✅ Quality buckets ready")

        return httpResponse
    }

    // GET /api/streams/resolveAll - Returns ALL streams for specific quality (wild west mode)
    app.get("api", "streams", "resolveAll") { req async throws -> Response in
        print("🔥🔥🔥 RESOLVE ALL STREAMS ENDPOINT HIT!")

        guard let imdbId = req.query[String.self, at: "imdbId"] else {
            throw Abort(.badRequest, reason: "Missing imdbId")
        }

        guard let quality = req.query[String.self, at: "quality"] else {
            throw Abort(.badRequest, reason: "Missing quality")
        }

        let type = req.query[String.self, at: "type"] ?? "movie"
        let season = req.query[Int.self, at: "season"]
        let episode = req.query[Int.self, at: "episode"]

        print("🔍 Resolving ALL streams for: \(imdbId) (\(quality)) (S\(season ?? 0)E\(episode ?? 0))")

        // Fetch all streams from providers
        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            providerNames: nil
        )

        print("📦 Received \(streams.count) raw streams for quality: \(quality)")

        // CRITICAL DEBUG: Log all raw streams to identify duplicates
        print("🔍 DEBUG: Raw streams from providers:")
        for (idx, stream) in streams.enumerated() {
            print("   [\(idx)] \(stream.title) | \(stream.quality ?? "unknown") | \(stream.provider) | Seeders: \(stream.seeders ?? 0)")
        }

        // Attach subtitles to all streams
        var streamsWithSubtitles = await attachSubtitles(to: streams, imdbId: imdbId, type: type, season: season, episode: episode)

        // CRITICAL DEBUG: Log after subtitle attachment
        print("🔍 DEBUG: Streams after subtitle attachment: \(streamsWithSubtitles.count)")
        for (idx, stream) in streamsWithSubtitles.enumerated() {
            print("   [\(idx)] \(stream.title) | \(stream.quality ?? "unknown") | \(stream.provider)")
        }

        // CRITICAL: Filter by the requested quality ONLY
        // Remove all the complex filtering from resolveByQuality
        streamsWithSubtitles = streamsWithSubtitles.filter { stream in
            guard let streamQuality = stream.quality else { return false }
            return streamQuality.lowercased().contains(quality.lowercased()) ||
                   quality.lowercased().contains(streamQuality.lowercased())
        }

        print("   🎯 Quality filter (\(quality)): \(streams.count) → \(streamsWithSubtitles.count) streams")

        // CRITICAL DEBUG: Log after quality filter
        print("🔍 DEBUG: Streams after quality filter: \(streamsWithSubtitles.count)")
        for (idx, stream) in streamsWithSubtitles.enumerated() {
            print("   [\(idx)] \(stream.title) | \(stream.quality ?? "unknown") | \(stream.provider)")
        }

        // WILD WEST MODE: NO CODEC FILTERING
        // Let users decide if they want x265/HEVC - remove codec filter
        print("   🌵 WILD WEST: Skipping codec filtering - users choose their own codecs")

        // CRITICAL: Filter by episode pattern for TV shows ONLY (basic filtering only)
        if type == "series" && season != nil && episode != nil {
            let beforeEpisodeFilter = streamsWithSubtitles.count

            let episodePatterns = [
                String(format: "s%02de%02d", season!, episode!),  // s01e01
                String(format: "s%de%d", season!, episode!),      // s1e1
                String(format: "s%02d e%02d", season!, episode!), // s01 e01
                String(format: "%dx%02d", season!, episode!),     // 1x01
                String(format: "season %d episode %d", season!, episode!) // season 1 episode 1
            ]

            streamsWithSubtitles = streamsWithSubtitles.filter { stream in
                let titleLower = stream.title.lowercased()
                let matchesEpisode = episodePatterns.contains { pattern in
                    titleLower.contains(pattern)
                }

                if !matchesEpisode {
                    print("   ⏭️  Skipping \(stream.title) - doesn't match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!))")
                }
                return matchesEpisode
            }

            let afterEpisodeFilter = streamsWithSubtitles.count
            print("   📺 Episode filter (S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)): \(beforeEpisodeFilter) → \(afterEpisodeFilter) streams")

            guard afterEpisodeFilter > 0 else {
                print("   ❌ No streams match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)) pattern")
                throw Abort(.notFound, reason: "No streams match requested episode")
            }
        }

        // WILD WEST MODE: SMART DEDUPLICATION BY INFOHASH FIRST
        // CRITICAL: Deduplicate by infoHash (same source), not by title
        // Different torrents with same quality/name are UNIQUE sources and should be preserved
        let beforeDedup = streamsWithSubtitles.count

        // FILTER OUT GARBAGE STREAMS (Comet placeholders with no real identifier)
        // Only remove streams that are:
        // 1. Have no infoHash AND no URL (can't be played)
        // 2. AND have generic/placeholder titles like "[RD⚡] Comet..."
        var validStreams = streamsWithSubtitles.filter { stream in
            let hasHash = stream.infoHash != nil
            let hasUrl = stream.url != nil
            let hasRealTitle = !stream.title.contains("Comet") || (stream.title.count > 20 && !stream.title.contains("[RD⚡]"))

            // Skip ONLY if: no hash AND no url AND (title is generic OR title is comet placeholder)
            if !hasHash && !hasUrl && !hasRealTitle {
                print("      ⏭️  Skipping garbage stream: \(stream.title)")
                return false
            }

            // Keep all other streams - even if no hash/url, if they have real titles they might be playable
            return true
        }

        let removedCount = beforeDedup - validStreams.count
        if removedCount > 0 {
            print("      🗑️  Removed \(removedCount) garbage streams (bare Comet entries, etc.)")
        }

        // GROUP BY INFOHASH FIRST - True duplicates (same torrent from different providers)
        var infoHashGroups: [String: [Stream]] = [:]
        var urlGroups: [String: [Stream]] = [:]
        var uncategorized: [Stream] = []

        for stream in validStreams {
            if let infoHash = stream.infoHash {
                if infoHashGroups[infoHash] == nil {
                    infoHashGroups[infoHash] = []
                }
                infoHashGroups[infoHash]?.append(stream)
            } else if let url = stream.url {
                if urlGroups[url] == nil {
                    urlGroups[url] = []
                }
                urlGroups[url]?.append(stream)
            } else {
                uncategorized.append(stream)
            }
        }

        print("   🔍 Deduplication analysis:")
        print("      InfoHash groups: \(infoHashGroups.count)")
        print("      URL groups: \(urlGroups.count)")
        print("      Uncategorized (no hash/url): \(uncategorized.count)")

        var deduplicatedStreams: [Stream] = []

        // From each infoHash group, keep only the ONE with best seeders
        for (infoHash, streams) in infoHashGroups {
            if streams.count > 1 {
                print("      🚨 DUPLICATE SOURCE: InfoHash '\(infoHash.prefix(8))...' has \(streams.count) copies from \(Set(streams.map { $0.provider }).joined(separator: ", "))")
            }
            let bestStream = streams.max { s1, s2 in
                (s1.seeders ?? 0) < (s2.seeders ?? 0)
            } ?? streams.first!
            deduplicatedStreams.append(bestStream)
        }

        // From each URL group, keep only the ONE with best seeders
        for (url, streams) in urlGroups {
            if streams.count > 1 {
                print("      🚨 DUPLICATE SOURCE: URL '\(url.prefix(30))...' has \(streams.count) copies from \(Set(streams.map { $0.provider }).joined(separator: ", "))")
            }
            let bestStream = streams.max { s1, s2 in
                (s1.seeders ?? 0) < (s2.seeders ?? 0)
            } ?? streams.first!
            deduplicatedStreams.append(bestStream)
        }

        // Add uncategorized streams (no duplicates possible)
        deduplicatedStreams.append(contentsOf: uncategorized)

        print("   🔄 DEDUPLICATION: \(beforeDedup) → \(deduplicatedStreams.count) unique sources")

        // SECOND PASS: Remove streams with IDENTICAL titles (still duplicates even with different hashes)
        // Example: Multiple "MediaFusion | ElfHosted P2P 1080P ⏳" streams with different but functionally identical content
        let beforeTitleDedup = deduplicatedStreams.count
        var titleGroups: [String: [Stream]] = [:]

        for stream in deduplicatedStreams {
            if titleGroups[stream.title] == nil {
                titleGroups[stream.title] = []
            }
            titleGroups[stream.title]?.append(stream)
        }

        var finalStreams: [Stream] = []
        for (title, streams) in titleGroups {
            if streams.count > 1 {
                print("      ℹ️  Title group '\(title)' has \(streams.count) entries, keeping best")
            }
            // From streams with same title, keep the one with most seeders
            let bestStream = streams.max { s1, s2 in
                (s1.seeders ?? 0) < (s2.seeders ?? 0)
            } ?? streams.first!
            finalStreams.append(bestStream)
        }

        let removedByTitle = beforeTitleDedup - finalStreams.count
        if removedByTitle > 0 {
            print("   🏷️  TITLE DEDUP: Removed \(removedByTitle) duplicate titles")
        }

        // NOW sort final deduplicated streams by seeders
        let sortedStreams = finalStreams.sorted { s1, s2 in
            let seeders1 = s1.seeders ?? 0
            let seeders2 = s2.seeders ?? 0
            return seeders1 > seeders2
        }

        print("🌵 WILD WEST MODE: Returning \(sortedStreams.count) deduplicated streams (sorted by seeders only)")

        // Simple response model for all streams
        struct AllStreamsResponse: Codable {
            let streams: [Stream]
            let count: Int
        }

        let response = AllStreamsResponse(
            streams: sortedStreams,
            count: sortedStreams.count
        )

        let jsonData = try JSONEncoder().encode(response)
        let httpResponse = Response(status: .ok)
        httpResponse.body = .init(data: jsonData)
        httpResponse.headers.contentType = .json

        print("✅ All streams response ready")

        return httpResponse
    }

    print("✅ Stream routes registered:")
    print("   POST /api/streams/resolve")
    print("   GET  /api/streams/resolveByQuality")
    print("   GET  /api/streams/resolveAll")
}

// MARK: - Subtitle Attachment

private func attachSubtitles(to streams: [Stream], imdbId: String, type: String, season: Int? = nil, episode: Int? = nil) async -> [Stream] {

    // CRITICAL DEBUG: Log input to attachSubtitles
    NSLog("🔍 DEBUG: attachSubtitles INPUT - streams.count: \(streams.count)")
    for (idx, stream) in streams.enumerated() {
        NSLog("   INPUT[\(idx)]: \(stream.title) | \(stream.quality ?? "unknown") | \(stream.provider)")
    }

    // Get SubDL API key from Keychain
    guard let subdlKey = await KeychainManager.shared.get(service: "subdl") else {
        NSLog("⚠️ No SubDL API key found, skipping subtitle attachment")
        return streams
    }

    // Search for subtitles
    do {
        if let season = season, let episode = episode {
            NSLog("🔍 Searching SubDL for subtitles: %@ (%@) S%02dE%02d", imdbId, type, season, episode)
        } else {
            NSLog("🔍 Searching SubDL for subtitles: %@ (%@)", imdbId, type)
        }

        let subtitles = try await SubDLClient.shared.search(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            languages: "en",
            apiKey: subdlKey
        )

        guard !subtitles.isEmpty else {
            NSLog("⚠️ No subtitles found for %@", imdbId)
            return streams
        }

        NSLog("✅ Found %d total subtitle options from SubDL", subtitles.count)

        // Filter by language - SubDL sometimes returns wrong languages despite request
        // Prefer: en, eng, english, enUS, en-US
        let validEnglishCodes = ["en", "eng", "english", "enus", "en-us"]
        var englishSubtitles = subtitles.filter { sub in
            let lang = (sub.language ?? "").lowercased()
            return validEnglishCodes.contains(lang) || lang.contains("en")
        }

        // If no English subtitles found, log warning and use all
        if englishSubtitles.isEmpty {
            NSLog("⚠️ No English subtitles found! SubDL returned: %@",
                  subtitles.map { $0.language ?? "unknown" }.joined(separator: ", "))
            englishSubtitles = subtitles
        } else {
            NSLog("✅ Filtered to %d English subtitles", englishSubtitles.count)
        }

        // Filter out "previously on" versions and other problematic formats
        // These don't match the actual episode content
        let badPatterns = ["previously on", "next on", "previously", "recap", "ehhhh", "ehhhhh"]

        // Blocklist specific subtitle releases that are mislabeled
        // Format: "title:season:episode:releaseName"
        let blockedSubtitles = [
            "tt0903747:5:14:kotuwa",  // Breaking Bad S05E14 - KoTuWa is Spanish, not English
        ]

        var cleanSubtitles = englishSubtitles.filter { sub in
            let releaseName = (sub.releaseName ?? "").lowercased()

            // Check bad patterns
            let hasBadPattern = badPatterns.contains { pattern in
                releaseName.contains(pattern)
            }
            if hasBadPattern {
                NSLog("  🚫 Filtering out: %@", sub.releaseName ?? "unknown")
                return false
            }

            // Check blocklist
            let blocklist = blockedSubtitles.filter { entry in
                let parts = entry.split(separator: ":").map(String.init)
                return parts.count == 4 && parts[0] == imdbId &&
                       (season.map { String($0) } ?? "") == parts[1] &&
                       (episode.map { String($0) } ?? "") == parts[2]
            }

            for blocked in blocklist {
                let parts = blocked.split(separator: ":").map(String.init)
                if parts.count == 4 && releaseName.contains(parts[3]) {
                    NSLog("  🚫 Blocklist: %@ (known mislabeled/wrong language)", sub.releaseName ?? "unknown")
                    return false
                }
            }

            return true
        }

        // If filtering removed everything, fall back to original list
        if cleanSubtitles.isEmpty {
            NSLog("⚠️ No subtitles after removing 'previously on' versions, using all English subtitles")
            cleanSubtitles = englishSubtitles
        } else {
            NSLog("✅ Filtered out %d problematic subtitle versions", englishSubtitles.count - cleanSubtitles.count)
        }

        // For TV shows: filter subtitles to ONLY ones matching episode
        var filteredSubtitles: [SubDLSubtitle] = []

        if let season = season, let episode = episode {
            // Define episode patterns to match (strict matching)
            let episodePatterns = [
                String(format: "s%02de%02d", season, episode),  // s05e14
                String(format: "s%de%d", season, episode),      // s5e14
                String(format: "s%02d e%02d", season, episode), // s05 e14
                String(format: "%dx%02d", season, episode),     // 5x14
                String(format: "%d%02d", season, episode),      // 514
                String(format: "episode %d", episode)           // episode 14
            ]

            NSLog("🔍 Looking for S%02dE%02d episode markers in %d English subtitles", season, episode, cleanSubtitles.count)

            for sub in cleanSubtitles {
                guard let releaseName = sub.releaseName?.lowercased() else {
                    NSLog("  ⏭️  Skipping subtitle with no release name")
                    continue
                }

                let matches = episodePatterns.contains { pattern in
                    releaseName.contains(pattern.lowercased())
                }

                if matches {
                    NSLog("  ✅ MATCH (English): %@", sub.releaseName ?? "unknown")
                    filteredSubtitles.append(sub)
                } else {
                    NSLog("  ❌ NO MATCH: %@", sub.releaseName ?? "unknown")
                }
            }

            // If English filtering gave us options, use them
            if !filteredSubtitles.isEmpty {
                NSLog("✅ Found %d English subtitles matching S%02dE%02d episode markers", filteredSubtitles.count, season, episode)
            } else {
                // Fall back to checking ALL subtitles (not just English)
                // BUT use cleanSubtitles to respect blocklist and bad patterns
                NSLog("⚠️ No English subtitles match S%02dE%02d, trying ALL subtitles (respecting filters)...", season, episode)

                for sub in cleanSubtitles {
                    guard let releaseName = sub.releaseName?.lowercased() else { continue }

                    let matches = episodePatterns.contains { pattern in
                        releaseName.contains(pattern.lowercased())
                    }

                    if matches {
                        NSLog("  ✅ MATCH (fallback): %@ [%@]", sub.releaseName ?? "unknown", sub.language ?? "unknown")
                        filteredSubtitles.append(sub)
                    }
                }

                if !filteredSubtitles.isEmpty {
                    NSLog("✅ Found %d subtitles (fallback) matching S%02dE%02d", filteredSubtitles.count, season, episode)
                } else {
                    NSLog("⚠️ No matching subtitles found for S%02dE%02d, returning streams without subtitles", season, episode)

                    // Return without subtitles rather than return wrong episode's subtitles
                    return streams.map { stream in
                        Stream(
                            url: stream.url,
                            title: stream.title,
                            quality: stream.quality,
                            seeders: stream.seeders,
                            size: stream.size,
                            provider: stream.provider,
                            infoHash: stream.infoHash,
                            fileIdx: stream.fileIdx,
                            ext: stream.ext,
                            behaviorHints: stream.behaviorHints,
                            subtitles: []  // No subtitles
                        )
                    }
                }
            }

        } else {
            // For movies or when episode not specified, use top 3 English subtitles
            filteredSubtitles = Array(englishSubtitles.prefix(3))
            NSLog("✅ Movie or no episode specified, using top %d English subtitle options", filteredSubtitles.count)
        }

        // Match subtitles to streams by release name compatibility
        // This ensures video and subtitle files are from same release format
        let result = streams.map { stream in
            // Find best matching subtitle for this stream
            var bestSubtitles: [Subtitle] = []

            // Score each subtitle based on release name similarity to stream title
            let streamTitleLower = stream.title.lowercased()

            // Find subtitles that match stream's release format
            let matchedSubs = filteredSubtitles.enumerated().map { (idx, sub) -> (Subtitle, Int) in
                let subReleaseLower = (sub.releaseName ?? "").lowercased()

                let encodedPath = Data(sub.url.utf8).base64EncodedString()
                let cdnURL = sub.url.starts(with: "http") ? sub.url : "https://dl.subdl.com\(sub.url)"
                let subtitle = Subtitle(
                    id: encodedPath,
                    url: cdnURL,
                    lang: sub.language ?? "en",
                    label: sub.releaseName ?? "English",
                    srclang: sub.language ?? "en",
                    kind: "subtitles",
                    provider: "SubDL"
                )

                // Calculate match score based on release group/format similarity
                var score = 0

                // Bonus for exact release group match (e.g., "BAJSKORV", "KILLERS")
                if let streamGroup = extractReleaseGroup(streamTitleLower),
                   let subGroup = extractReleaseGroup(subReleaseLower),
                   streamGroup == subGroup {
                    score += 1000  // Strong match
                    NSLog("    🎯 Release group match: %@ = %@", streamGroup, subGroup)
                }

                // Bonus for resolution match (720p, 1080p, etc)
                let resolutions = ["480p", "720p", "1080p", "2160p", "4k"]
                for res in resolutions {
                    if streamTitleLower.contains(res) && subReleaseLower.contains(res) {
                        score += 100
                        NSLog("    📺 Resolution match: %@", res)
                    }
                }

                // Penalty if formats seem different
                // Check for common TV broadcast markers in subtitle that aren't in stream
                let broadcastMarkers = ["hdtv", "webrip", "bdrip", "web-dl"]
                for marker in broadcastMarkers {
                    let inStream = streamTitleLower.contains(marker)
                    let inSub = subReleaseLower.contains(marker)
                    if inSub && !inStream {
                        score -= 50
                        NSLog("    ⚠️ Format mismatch: subtitle has %@ but stream doesn't", marker)
                    }
                }

                NSLog("  [%d] Score: %d | %@", idx + 1, score, sub.releaseName ?? "unknown")

                return (subtitle, score)
            }

            // Use top matching subtitle, or first if no good match
            // Return multiple options sorted by score (best first)
            let sortedByScore = matchedSubs.sorted { $0.1 > $1.1 }

            if !sortedByScore.isEmpty {
                // Return up to 5 best matching subtitles
                bestSubtitles = Array(sortedByScore.prefix(5).map { $0.0 })
                NSLog("✅ Selected %d subtitle options for stream", bestSubtitles.count)
            } else if let firstSub = filteredSubtitles.first {
                let encodedPath = Data(firstSub.url.utf8).base64EncodedString()
                let cdnURL = firstSub.url.starts(with: "http") ? firstSub.url : "https://dl.subdl.com\(firstSub.url)"
                bestSubtitles = [Subtitle(
                    id: encodedPath,
                    url: cdnURL,
                    lang: firstSub.language ?? "en",
                    label: firstSub.releaseName ?? "English",
                    srclang: firstSub.language ?? "en",
                    kind: "subtitles",
                    provider: "SubDL"
                )]
            }

            return Stream(
                url: stream.url,
                title: stream.title,
                quality: stream.quality,
                seeders: stream.seeders,
                size: stream.size,
                provider: stream.provider,
                infoHash: stream.infoHash,
                fileIdx: stream.fileIdx,
                ext: stream.ext,
                behaviorHints: stream.behaviorHints,
                subtitles: bestSubtitles
            )
        }

        NSLog("🔍 DEBUG: attachSubtitles OUTPUT - streams.count: \(result.count)")
        for (idx, stream) in result.enumerated() {
            NSLog("   OUTPUT[\(idx)]: \(stream.title) | \(stream.quality ?? "unknown") | \(stream.provider) | Subtitles: \(stream.subtitles?.count ?? 0)")
        }

        return result

    } catch {
        NSLog("❌ Failed to fetch subtitles: %@", error.localizedDescription)
        return streams
    }
}

// MARK: - Sorting and Filtering

private func sortStreams(_ streams: [Stream]) -> [Stream] {
    return streams.sorted { s1, s2 in
        // 1. Enhanced source quality ranking
        let sourceScore1 = sourceQualityRank(s1)
        let sourceScore2 = sourceQualityRank(s2)

        if sourceScore1 != sourceScore2 {
            return sourceScore1 > sourceScore2
        }

        // 2. Sort by quality (4K > 2160p > 1080p > 720p > 480p)
        let q1 = qualityRank(s1.quality ?? "Unknown")
        let q2 = qualityRank(s2.quality ?? "Unknown")

        if q1 != q2 {
            return q1 > q2
        }

        // 3. Sort by codec quality (x264 preferred over others)
        let codecScore1 = codecQualityRank(s1)
        let codecScore2 = codecQualityRank(s2)

        if codecScore1 != codecScore2 {
            return codecScore1 > codecScore2
        }

        // 4. Sort by provider reputation
        let providerScore1 = providerReputationRank(s1.provider.lowercased())
        let providerScore2 = providerReputationRank(s2.provider.lowercased())

        if providerScore1 != providerScore2 {
            return providerScore1 > providerScore2
        }

        // 5. Sort by seeders (but with reduced priority)
        let seeders1 = s1.seeders ?? 0
        let seeders2 = s2.seeders ?? 0

        if seeders1 != seeders2 {
            return seeders1 > seeders2
        }

        // 6. Sort by size (prefer larger files = better quality)
        let size1 = parseSizeInBytes(s1.size)
        let size2 = parseSizeInBytes(s2.size)

        return size1 > size2
    }
}
// MARK: - Enhanced Quality Ranking Functions

private func sourceQualityRank(_ stream: Stream) -> Int {
    let title = stream.title.lowercased()

    // Premium sources with highest priority
    if title.contains("nf ") || title.contains("nf ") || title.contains("netflix") || title.contains("amazon") || title.contains("hbo max") || title.contains("disney+") {
        return 100 // Premium streaming sources
    }

    // High quality physical media
    if title.contains("blu-ray") || title.contains("bluray") || title.contains("bdrip") || title.contains("bd-rip") {
        return 90 // BluRay sources
    }

    // Web downloads with good quality
    if title.contains("web-dl") || title.contains("webdl") || title.contains("web dl") {
        return 85 // WEB-DL sources
    }

    // Web rips
    if title.contains("webrip") || title.contains("web-rip") {
        return 75 // WEBRip sources
    }

    // Broadcast TV
    if title.contains("hdtv") {
        return 70 // HDTV sources
    }

    // DVD sources
    if title.contains("dvdrip") || title.contains("dvd-rip") {
        return 60 // DVD sources
    }

    // Unknown/Low quality
    return 50 // Unknown sources
}

private func codecQualityRank(_ stream: Stream) -> Int {
    let title = stream.title.lowercased()

    // Prefer x264/AVC for compatibility
    if title.contains("x264") || title.contains("avc") || title.contains("h.264") || title.contains("h264") {
        return 100 // x264 preferred
    }

    // Acceptable codecs
    if title.contains("xvid") {
        return 80 // XVID acceptable
    }

    // Lower priority codecs
    if title.contains("divx") {
        return 60 // DIVX lower priority
    }

    return 50 // Unknown codec
}

private func providerReputationRank(_ provider: String) -> Int {
    // Known high-quality providers
    switch provider {
    case "zilean", "mediafusion", "torrentio":
        return 100 // Premium providers
    case "comet":
        return 95 // Cached/premium
    case "jackettio":
        return 85 // Good secondary
    default:
        return 70 // Unknown provider
    }
}

private func filterByQuality(_ streams: [Stream], preferredQuality: String?) -> [Stream] {
    guard let preferred = preferredQuality else {
        return streams
    }

    // Filter streams that match the preferred quality
    let matching = streams.filter { stream in
        let quality = stream.quality ?? "Unknown"
        return quality.lowercased().contains(preferred.lowercased()) ||
               preferred.lowercased().contains(quality.lowercased())
    }

    // If no matches, return all streams
    return matching.isEmpty ? streams : matching
}

private func qualityRank(_ quality: String) -> Int {
    let q = quality.lowercased()
    if q.contains("4k") || q.contains("2160p") {
        return 5
    } else if q.contains("1080p") {
        return 4
    } else if q.contains("720p") {
        return 3
    } else if q.contains("480p") {
        return 2
    }
    return 1
}

private func parseSizeInBytes(_ size: String?) -> Int64 {
    guard let size = size else { return 0 }

    let pattern = "([\\d.]+)\\s*([KMGT]?B)"
    guard let regex = try? NSRegularExpression(pattern: pattern),
          let match = regex.firstMatch(in: size, range: NSRange(size.startIndex..., in: size)),
          let numberRange = Range(match.range(at: 1), in: size),
          let unitRange = Range(match.range(at: 2), in: size),
          let number = Double(size[numberRange]) else {
        return 0
    }

    let unit = String(size[unitRange]).uppercased()
    var multiplier: Int64 = 1

    switch unit {
    case "TB":
        multiplier = 1_099_511_627_776  // 1024^4
    case "GB":
        multiplier = 1_073_741_824      // 1024^3
    case "MB":
        multiplier = 1_048_576          // 1024^2
    case "KB":
        multiplier = 1_024
    default:
        multiplier = 1
    }

    return Int64(number * Double(multiplier))
}

// MARK: - Quality Bucket Helpers (ColorFruit logic)

private func determineQualityBucket(_ quality: String) -> String {
    let q = quality.lowercased()
    if q.contains("4k") || q.contains("2160p") {
        return "4K"
    } else if q.contains("1080p") {
        return "1080p"
    } else if q.contains("720p") {
        return "720p"
    } else {
        return "480p"
    }
}

private func processBucket(_ streams: [Stream], minSeeders: Int, quality: String, year: String?) -> QualityBucket {
    print("🔥🔥🔥 processBucket CALLED for \(quality) with \(streams.count) streams")

    // Parse size from string like "15 GB" to bytes
    func parseSize(_ sizeString: String?) -> Int64? {
        guard let sizeStr = sizeString?.lowercased() else { return nil }

        // Extract number
        let components = sizeStr.components(separatedBy: CharacterSet.decimalDigits.inverted)
        guard let numStr = components.first(where: { !$0.isEmpty }),
              let value = Double(numStr) else {
            return nil
        }

        // Convert to bytes
        if sizeStr.contains("gb") {
            return Int64(value * 1_073_741_824) // 1024^3
        } else if sizeStr.contains("mb") {
            return Int64(value * 1_048_576) // 1024^2
        }
        return nil
    }

    // Size limits for better playback performance
    let maxSize: Int64?
    switch quality {
    case "4K":
        maxSize = 32_212_254_720 // 30 GB
    case "1080p", "720p":
        maxSize = 10_737_418_240 // 10 GB
    case "480p":
        maxSize = 5_368_709_120  // 5 GB
    default:
        maxSize = nil
    }

    // CRITICAL: Apply year and codec filtering BEFORE seeder filtering
    // This ensures year-matching streams get priority even if they have fewer seeders
    print("  🎯 Year/Codec filter (\(quality)):")

    var yearAndCodecFiltered = streams

    // COMPLETELY REMOVE x265/HEVC streams (terrible quality) - CHECK TITLE
    let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
    let beforeX265Filter = yearAndCodecFiltered.count
    yearAndCodecFiltered = yearAndCodecFiltered.filter { stream in
        let titleLower = stream.title.lowercased()
        let hasBadCodec = badCodecs.contains { codec in
            titleLower.contains(codec)
        }
        if hasBadCodec {
            print("  ⏭️ BLOCKING x265/HEVC: \(stream.title)")
        }
        return !hasBadCodec  // Only keep x264 and other good codecs
    }

    if beforeX265Filter > yearAndCodecFiltered.count {
        print("  ✅ BLOCKED \(beforeX265Filter - yearAndCodecFiltered.count) x265 streams for \(quality)")
    }

    // Size filtering
    if let maxSize = maxSize {
        yearAndCodecFiltered = yearAndCodecFiltered.filter { stream in
            if let size = parseSize(stream.size) {
                return size <= maxSize
            }
            // If we can't parse size, include it (benefit of the doubt)
            return true
        }
    }

    // CRITICAL: Sort by YEAR MATCH first (before any seeder filtering)
    // This ensures year-matching streams get priority regardless of seeder count
    func yearMatchPriority(_ stream: Stream) -> Int {
        guard let year = year else { return 0 }
        return streamTitleContainsYear(stream.title, targetYear: year) ? 1000 : 0
    }

    func codecRank(_ stream: Stream) -> Int {
        let titleLower = stream.title.lowercased()
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let hasBadCodec = badCodecs.contains { codec in
            titleLower.contains(codec)
        }
        return hasBadCodec ? 0 : 100  // x264 gets +100, x265 gets 0
    }

    // Sort by: year match (ABSOLUTE PRIORITY), then source quality, then provider, then codec, then seeders, then extension
    let yearSorted = yearAndCodecFiltered.sorted { a, b in
        // PRIMARY: Year match is ABSOLUTE PRIORITY
        let yearPriorityA = yearMatchPriority(a)
        let yearPriorityB = yearMatchPriority(b)

        if yearPriorityA != yearPriorityB {
            return yearPriorityA > yearPriorityB // A matches year, B doesn't = A wins
        }

        // SECONDARY: Enhanced source quality ranking (Netflix > BluRay > WEB-DL > WEBRip)
        let sourceScoreA = sourceQualityRank(a)
        let sourceScoreB = sourceQualityRank(b)

        if sourceScoreA != sourceScoreB {
            print("  🎯 Source Quality: \(a.title) (\(sourceScoreA)) vs \(b.title) (\(sourceScoreB))")
            return sourceScoreA > sourceScoreB
        }

        // TERTIARY: Provider reputation ranking
        let providerScoreA = providerReputationRank(a.provider.lowercased())
        let providerScoreB = providerReputationRank(b.provider.lowercased())

        if providerScoreA != providerScoreB {
            return providerScoreA > providerScoreB
        }

        // QUATERNARY: Codec quality (x264 preferred)
        let codecA = codecRank(a)
        let codecB = codecRank(b)

        if codecA != codecB {
            return codecA > codecB
        }

        // QUINARY: Seeders (reduced priority)
        let seedersA = a.seeders ?? 0
        let seedersB = b.seeders ?? 0

        if seedersA != seedersB {
            return seedersA > seedersB // More seeders = better
        }

        // SENARY: Extension rank
        func extRank(_ ext: String?) -> Int {
            guard let ext = ext?.lowercased() else { return 0 }
            if ext == "mkv" { return 3 }
            if ext == "mp4" { return 2 }
            if ext == "avi" { return 1 }
            return 0
        }

        return extRank(a.ext) > extRank(b.ext)
    }

    // NOW apply seeder filter, but preserve year priority ordering
    print("  🌱 Seeder filter (\(quality)): minSeeders=\(minSeeders)")
    let beforeSeederFilter = yearSorted.count
    let filtered = yearSorted.filter { stream in
        // RD-cached streams (from Comet, etc.) are marked with [RD⚡] or similar
        let isCached = stream.title.contains("[RD⚡]") ||
                       stream.title.contains("⚡") ||
                       stream.provider.lowercased().contains("comet")

        if isCached {
            // Cached streams bypass seeder requirement - they're instantly available
            return true
        }

        let seeders = stream.seeders ?? 0
        let passes = seeders >= minSeeders
        if !passes {
            print("     ❌ Too few seeders (\(seeders) < \(minSeeders)): \(stream.title)")
        }
        return passes
    }
    print("  🌱 After seeder filter: \(beforeSeederFilter) → \(filtered.count) streams")

    if filtered.isEmpty {
        return QualityBucket(primary: nil, alternates: nil)
    }

    // The sorted order is already preserved from yearSorted
    let sorted = filtered

    // Debug: Show final sorted order before primary selection
    print("🏆 FINAL SORTED ORDER for bucket (top 5):")
    for (index, stream) in sorted.prefix(5).enumerated() {
        let score = sourceQualityRank(stream)
        print("   [\(index + 1)] \(stream.title) (source score: \(score))")
    }

    let primary = sorted.first
    let alternates = Array(sorted.dropFirst().prefix(4))

    // Debug: Show what's being assigned as primary
    if let primary = primary {
        let score = sourceQualityRank(primary)
        print("👑 ASSIGNED AS PRIMARY: \(primary.title) (source score: \(score))")
    }

    if let primary = primary {
        let sizeStr = primary.size ?? "unknown"
        print("  \(quality): \(sorted.count) streams (after filtering), primary has \(primary.seeders ?? 0) seeders, size: \(sizeStr)")
    } else {
        print("  \(quality): 0 streams after filtering")
    }

    return QualityBucket(primary: primary, alternates: alternates.isEmpty ? nil : alternates)
}

// MARK: - Release Info Extraction (for subtitle matching)

private func extractReleaseGroup(_ title: String) -> String? {
    // Common release group pattern: capitalized words at end or in brackets
    // e.g., "Breaking Bad S05E14 1080p x264 - BAJSKORV" or "[KILLERS]"

    let patterns = [
        "-\\s*([A-Z0-9]{4,})$",              // " - GROUPNAME" at end
        "\\[([A-Z0-9]{4,})\\]",              // "[GROUPNAME]"
        "\\(([A-Z0-9]{4,})\\)"               // "(GROUPNAME)"
    ]

    for pattern in patterns {
        if let regex = try? NSRegularExpression(pattern: pattern),
           let match = regex.firstMatch(in: title, range: NSRange(title.startIndex..., in: title)),
           let range = Range(match.range(at: 1), in: title) {
            return String(title[range]).uppercased()
        }
    }

    return nil
}

// Helper function to check if stream title contains target year
private func streamTitleContainsYear(_ title: String, targetYear: String) -> Bool {
    // Comprehensive year patterns that match actual release year positions
    let yearPatterns = [
        "\\((\(targetYear))\\)",           // (1991)
        "\\.\(targetYear)\\.",           // .1991.
        " \(targetYear) ",               //  1991  (space-year-space)
        " \(targetYear)$",               // 1991 at end (space-year-end)
        "^\(targetYear) ",               // 1991 at start (year-space)
        "\\.\(targetYear)$",              // .1991 at end (dot-year-end)
        " \(targetYear)\\.",             // 1991. (space-year-dot)
        "_\(targetYear)_",               // _1991_ (underscore-year-underscore)
        "-\(targetYear)-",               // -1991- (dash-year-dash)
        "[\(targetYear)]",               // [1991] (brackets-year)
    ]

    for pattern in yearPatterns {
        if let regex = try? NSRegularExpression(pattern: pattern) {
            let range = NSRange(location: 0, length: title.utf16.count)
            if regex.firstMatch(in: title, range: range) != nil {
                return true
            }
        }
    }

    return false
}

private func extractReleaseInfo(_ title: String) -> String {
    // Extract resolution and codec info for matching
    var info = ""

    let resolutions = ["480p", "720p", "1080p", "2160p", "4k"]
    for res in resolutions {
        if title.contains(res) {
            info += res
            break
        }
    }

    if title.contains("x264") {
        info += " x264"
    } else if title.contains("x265") || title.contains("hevc") {
        info += " hevc"
    }

    return info
}
