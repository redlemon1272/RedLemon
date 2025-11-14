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

                // More specific year patterns that match actual release year positions
                let yearPatterns = [
                    "\\((\\d{4})\\)",           // (2025)
                    "\\.(\\d{4})\\.",           // .2025.
                    " (\\d{4}) ",               //  2025
                    " (\\d{4})$",               //  2025 at end
                    "^(\\d{4})",                 // 2025 at start
                    "\\.(\\d{4})$"              // .2025 at end
                ]

                for pattern in yearPatterns {
                    if let regex = try? NSRegularExpression(pattern: pattern),
                       let match = regex.firstMatch(in: title, range: NSRange(title.startIndex..., in: title)),
                       let yearRange = Range(match.range(at: 1), in: title) {
                        let extractedYear = String(title[yearRange])
                        // Additional validation: reasonable year range (1900-2030)
                        if let yearInt = Int(extractedYear), yearInt >= 1900 && yearInt <= 2030 {
                            return extractedYear == year
                        }
                    }
                }

                // If no year pattern matches, keep it (might be correct)
                return true
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
            uhd4k: processBucket(buckets["4K"] ?? [], minSeeders: 1, quality: "4K"),
            fullHD: processBucket(buckets["1080p"] ?? [], minSeeders: 1, quality: "1080p"),
            hd: processBucket(buckets["720p"] ?? [], minSeeders: 1, quality: "720p"),
            sd: processBucket(buckets["480p"] ?? [], minSeeders: 1, quality: "480p")
        )

        print("   📦 Bucket counts (after processBucket/seeder filter):")
        print("      4K: \(qualityBuckets.uhd4k?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.uhd4k?.alternates?.count ?? 0) alts")
        print("      1080p: \(qualityBuckets.fullHD?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.fullHD?.alternates?.count ?? 0) alts")
        print("      720p: \(qualityBuckets.hd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.hd?.alternates?.count ?? 0) alts")
        print("      480p: \(qualityBuckets.sd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.sd?.alternates?.count ?? 0) alts")

        let response = QualityBucketsResponse(buckets: qualityBuckets)

        let jsonData = try JSONEncoder().encode(response)
        let httpResponse = Response(status: .ok)
        httpResponse.body = .init(data: jsonData)
        httpResponse.headers.contentType = .json

        print("✅ Quality buckets ready")

        return httpResponse
    }

    print("✅ Stream routes registered:")
    print("   POST /api/streams/resolve")
    print("   GET  /api/streams/resolveByQuality")
}

// MARK: - Subtitle Attachment

private func attachSubtitles(to streams: [Stream], imdbId: String, type: String, season: Int? = nil, episode: Int? = nil) async -> [Stream] {

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
        return streams.map { stream in
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

    } catch {
        NSLog("❌ Failed to fetch subtitles: %@", error.localizedDescription)
        return streams
    }
}

// MARK: - Sorting and Filtering

private func sortStreams(_ streams: [Stream]) -> [Stream] {
    return streams.sorted { s1, s2 in
        // 1. Sort by quality (4K > 2160p > 1080p > 720p > 480p)
        let q1 = qualityRank(s1.quality ?? "Unknown")
        let q2 = qualityRank(s2.quality ?? "Unknown")

        if q1 != q2 {
            return q1 > q2
        }

        // 2. Sort by seeders
        let seeders1 = s1.seeders ?? 0
        let seeders2 = s2.seeders ?? 0

        if seeders1 != seeders2 {
            return seeders1 > seeders2
        }

        // 3. Sort by size (prefer larger files = better quality)
        let size1 = parseSizeInBytes(s1.size)
        let size2 = parseSizeInBytes(s2.size)

        return size1 > size2
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

private func processBucket(_ streams: [Stream], minSeeders: Int, quality: String) -> QualityBucket {
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

    // Filter by seeder threshold and size limit
    // EXCEPT: Skip seeder filter for RD-cached streams (instant availability)
    print("  🌱 Seeder filter (\(quality)): minSeeders=\(minSeeders)")
    let beforeSeederFilter = streams.count
    var filtered = streams.filter { stream in
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

    // COMPLETELY REMOVE x265/HEVC streams (terrible quality) - CHECK TITLE
    let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
    let beforeX265Filter = filtered.count
    filtered = filtered.filter { stream in
        let titleLower = stream.title.lowercased()
        let hasBadCodec = badCodecs.contains { codec in
            titleLower.contains(codec)
        }
        if hasBadCodec {
            print("  ⏭️ BLOCKING x265/HEVC: \(stream.title)")
        }
        return !hasBadCodec  // Only keep x264 and other good codecs
    }

    if beforeX265Filter > filtered.count {
        print("  ✅ BLOCKED \(beforeX265Filter - filtered.count) x265 streams for \(quality)")
    }

    if let maxSize = maxSize {
        filtered = filtered.filter { stream in
            if let size = parseSize(stream.size) {
                return size <= maxSize
            }
            // If we can't parse size, include it (benefit of the doubt)
            return true
        }
    }

    if filtered.isEmpty {
        return QualityBucket(primary: nil, alternates: nil)
    }

    // Extension ranking (mkv/mp4 > avi)
    func extRank(_ ext: String?) -> Int {
        guard let ext = ext?.lowercased() else { return 0 }
        if ext == "mkv" { return 3 }
        if ext == "mp4" { return 2 }
        if ext == "avi" { return 1 }
        return 0
    }

    // Codec ranking (x264 >> x265 as absolute last resort)
    func codecRank(_ stream: Stream) -> Int {
        let title = stream.title.lowercased()
        let badCodecs = ["x265", "hevc", "h.265", "h265"]
        let hasBadCodec = badCodecs.contains { codec in
            title.contains(codec)
        }
        return hasBadCodec ? 0 : 100  // x264 gets +100, x265 gets 0
    }

    // Sort by: codec (x264 first), then seeders (most), then extension rank (highest)
    // x265 is absolute last resort - only after all x264 exhausted
    let sorted = filtered.sorted { a, b in
        let codecA = codecRank(a)
        let codecB = codecRank(b)

        // Codec is PRIMARY sort key - x264 always wins over x265
        if codecA != codecB {
            return codecA > codecB
        }

        // Within same codec tier, sort by seeders
        let seedersA = a.seeders ?? 0
        let seedersB = b.seeders ?? 0

        if seedersA != seedersB {
            return seedersA > seedersB // More seeders = better
        }

        // If same seeders, use extension rank
        return extRank(a.ext) > extRank(b.ext)
    }

    // Primary stream + up to 4 alternates
    let primary = sorted.first
    let alternates = Array(sorted.dropFirst().prefix(4))

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
