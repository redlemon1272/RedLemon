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

    // POST /api/streams/resolve (enhanced for trusted packs)
    app.post("api", "streams", "resolve") { req async throws -> Response in
        let request = try req.content.decode(ResolveRequest.self)

        print("🔍 Resolving streams for: \(request.imdbId)")

        // Check if this is a TV series with trusted pack configuration
        var trustedPackQuery: String? = nil
        if request.type == "series",
           let tvEvent = TVEventData.getSeries(id: request.imdbId),
           case let .trustedPack(searchQuery) = tvEvent.packConfig {
            trustedPackQuery = searchQuery
            print("🎯 Found trusted pack for \(tvEvent.title): \(searchQuery)")
        }

        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: request.imdbId,
            type: request.type ?? "movie",
            season: request.season,
            episode: request.episode,
            providerNames: request.providers
        )

        // Enhanced sorting: prioritize trusted pack if available
        var sorted = sortStreams(streams, trustedPackQuery: trustedPackQuery)

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

    // POST /api/streams/episodes - Get available episodes from a season pack torrent
    app.post("api", "streams", "episodes") { (req: Request) async throws -> Response in
        struct EpisodesRequest: Codable {
            let infoHash: String
        }

        struct EpisodeInfo: Codable {
            let season: Int
            let episode: Int
            let fileId: Int
            let filename: String
            let displayLabel: String // Format: "S01E05"
        }

        struct TorrentFile: Codable {
            let id: Int?
            let path: String?
            let bytes: Int?
            let selected: Int?
        }

        struct TorrentInfo: Codable {
            let files: [TorrentFile]?
            let status: String?
        }

        let body = try req.content.decode(EpisodesRequest.self)
        let keychain = KeychainManager.shared

        guard let token = await keychain.get(service: "realdebrid") else {
            throw Abort(.badRequest, reason: "No RealDebrid token stored")
        }

        NSLog("📺 Fetching episodes for torrent: \(body.infoHash.prefix(12))...")

        // Create a temporary task to fetch torrent info
        // Note: We don't have the torrentId, so we need to add the magnet first
        let trackers = [
            "udp://tracker.opentrackr.org:1337/announce",
            "udp://open.stealth.si:80/announce",
            "udp://tracker.openbittorrent.com:6969/announce",
            "udp://tracker.coppersurfer.tk:6969/announce"
        ]
        let trParams = trackers.map { "tr=\($0.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")" }.joined(separator: "&")
        let magnet = "magnet:?xt=urn:btih:\(body.infoHash)&dn=\(body.infoHash)&\(trParams)"

        do {
            // Add magnet to get torrentId
            let addURL = URL(string: "https://api.real-debrid.com/rest/1.0/torrents/addMagnet")!
            var addRequest = URLRequest(url: addURL)
            addRequest.httpMethod = "POST"
            addRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            addRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            addRequest.httpBody = "magnet=\(magnet.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")".data(using: .utf8)

            let (addData, addResponse) = try await URLSession.shared.data(for: addRequest)

            guard let httpResponse = addResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                NSLog("❌ Failed to add magnet: HTTP \((addResponse as? HTTPURLResponse)?.statusCode ?? 0)")
                throw Abort(.badGateway, reason: "Failed to add torrent to RealDebrid")
            }

            guard let addResult = try? JSONDecoder().decode([String: String].self, from: addData),
                  let torrentId = addResult["id"] else {
                NSLog("❌ Invalid magnet response")
                throw Abort(.badGateway, reason: "Invalid RealDebrid response")
            }

            // Get torrent info
            let infoURL = URL(string: "https://api.real-debrid.com/rest/1.0/torrents/info/\(torrentId)")!
            var infoRequest = URLRequest(url: infoURL)
            infoRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let (infoData, infoResponse) = try await URLSession.shared.data(for: infoRequest)

            guard let httpResponse = infoResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                NSLog("❌ Failed to get torrent info: HTTP \((infoResponse as? HTTPURLResponse)?.statusCode ?? 0)")
                throw Abort(.badGateway, reason: "Failed to fetch torrent information")
            }

            let torrentInfo = try JSONDecoder().decode(TorrentInfo.self, from: infoData)

            guard let files = torrentInfo.files, !files.isEmpty else {
                NSLog("⚠️ No files in torrent")
                throw Abort(.badGateway, reason: "Torrent has no files")
            }

            // Log torrent status for debugging
            // Status: "waiting_files_selection", "queued", "downloading", "downloaded", "error", "virus", "dead"
            if let status = torrentInfo.status {
                NSLog("📺 Torrent status: \(status)")
            }

            // Parse episodes from filenames
            var episodes: [EpisodeInfo] = []

            for file in files {
                guard let path = file.path, let fileId = file.id else { continue }

                let pathLower = path.lowercased()

                // Try to extract S##E## pattern
                if let (season, episode) = extractSeasonEpisode(from: pathLower) {
                    let label = String(format: "S%02dE%02d", season, episode)
                    let episodeInfo = EpisodeInfo(
                        season: season,
                        episode: episode,
                        fileId: fileId,
                        filename: path,
                        displayLabel: label
                    )
                    episodes.append(episodeInfo)
                }
            }

            // Remove duplicates (same season/episode), keeping first occurrence
            var seen = Set<String>()
            let uniqueEpisodes = episodes.filter { episode in
                let key = "\(episode.season)-\(episode.episode)"
                if seen.contains(key) {
                    return false
                }
                seen.insert(key)
                return true
            }

            // Sort by season, then episode
            let sortedEpisodes = uniqueEpisodes.sorted { a, b in
                if a.season != b.season {
                    return a.season < b.season
                }
                return a.episode < b.episode
            }

            NSLog("✅ Found \(sortedEpisodes.count) episodes")

            let jsonData = try JSONEncoder().encode(sortedEpisodes)
            let episodesResponse = Response(status: .ok)
            episodesResponse.body = .init(data: jsonData)
            episodesResponse.headers.contentType = .json

            return episodesResponse

        } catch {
            NSLog("❌ Episodes endpoint error: \(error)")
            throw Abort(.badGateway, reason: "Failed to fetch episodes: \(error)")
        }
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

        // Check for trusted packs from TVEventData
        let trustedPackQuery: String?
        if let series = TVEventData.getSeries(id: imdbId), case .trustedPack(let query) = series.packConfig {
            trustedPackQuery = query.lowercased()
            print("   🔒 Found trusted pack config for \(series.title): \(query)")
        } else {
            trustedPackQuery = nil
        }

        let isTrustedPack: (Stream) -> Bool = { stream in
            guard let query = trustedPackQuery else { return false }
            let titleLower = stream.title.lowercased()

            // Enhanced matching for Breaking Bad trusted pack:
            // Query: "breaking bad s01-s05 1080p nf web-dl av1 eac3 multsub"
            // Check for key components: "breaking bad", "s01-s05", "1080p", "nf web-dl", "av1", "eac3"
            if query.contains("breaking bad") && query.contains("s01-s05") {
                return titleLower.contains("breaking bad") &&
                       (titleLower.contains("s01-s05") || titleLower.contains("season 5") || titleLower.contains("complete")) &&
                       titleLower.contains("1080p") &&
                       titleLower.contains("nf") &&
                       (titleLower.contains("av1") || titleLower.contains("web-dl"))
            }

            // Fallback to original logic for other series
            return titleLower.contains(query)
        }

        // OPTIMIZATION: If we have a trusted pack, we can skip Comet (which is slow/unreliable)
        // and rely on Torrentio/Zilean which are guaranteed to have the pack.
        let providersToUse: [String]?
        if trustedPackQuery != nil {
            print("   🚀 Trusted pack detected - skipping Comet to avoid timeouts")
            providersToUse = ["torrentio", "zilean", "mediafusion"]
        } else {
            providersToUse = nil
        }

        // Fetch all streams from providers
        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            providerNames: providersToUse
        )

        print("📦 Received \(streams.count) raw streams, bucketing by quality...")

        // For movies only, pull canonical title to prioritize correct matches (avoid wrong same-year titles)
        let targetTitle: String?
        if type == "movie" {
            let metadata = await MetadataService.shared.getMetadata(imdbId: imdbId, type: type)
            targetTitle = metadata?.title
            if let title = targetTitle {
                print("🎯 Target title for matching: \(title)")
            }
        } else {
            targetTitle = nil
        }

        // OPTIMIZATION: Filter streams FIRST, then attach subtitles to the survivors
        var filteredStreams = streams

        // Filter by year if provided (removes wrong releases like 2005 version when looking for 2025)
        if let year = year {
            let allowedYears = parseAllowedYears(year)
            if allowedYears.isEmpty {
                print("   ⚠️ Year string '\(year)' could not be parsed; skipping year filter")
            }

            let beforeCount = filteredStreams.count
            filteredStreams = filteredStreams.filter { stream in
                // Movies: keep only streams whose titles include the exact year (or range member)
                if type == "movie" {
                    guard let targetYear = allowedYears.first else { return true }
                    return streamTitleContainsYear(stream.title, targetYears: [targetYear])
                }

                // Series: drop streams that explicitly mention a conflicting year (e.g., 1959)
                if allowedYears.isEmpty { return true }
                let yearsInTitle = extractYearsFromTitle(stream.title)

                // If no year is present, keep it (common for TV episode releases)
                guard !yearsInTitle.isEmpty else { return true }

                let hasAllowedYear = yearsInTitle.contains { allowedYears.contains($0) }
                if !hasAllowedYear {
                    print("   🚫 SERVER BLOCKING wrong-year series stream: \(stream.title) (years: \(yearsInTitle.joined(separator: ",")))")
                }
                return hasAllowedYear
            }
            let afterCount = filteredStreams.count
            if type == "movie" {
                print("   📅 Year filter (\(year)): \(beforeCount) → \(afterCount) streams")
            } else {
                if afterCount < beforeCount {
                    print("   📺 Year filter (series \(year)): \(beforeCount) → \(afterCount) streams")
                }
            }
        }

        // CRITICAL: Filter x265/HEVC streams (server-side, ALWAYS runs)
        // User is on 2015 hardware, so we must block x265
        let beforeCodecFilter = filteredStreams.count
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let hasBadCodec = badCodecs.contains { codec in
                titleLower.contains(codec)
            }
            if hasBadCodec {
                print("   🚫 SERVER BLOCKING x265/HEVC: \(stream.title)")
            }
            return !hasBadCodec
        }
        let afterCodecFilter = filteredStreams.count
        if afterCodecFilter < beforeCodecFilter {
            print("   🚫 SERVER FILTERED x265: \(beforeCodecFilter) → \(afterCodecFilter) streams")
        }

        // CRITICAL: Filter AV1 streams (hardware incompatibility)
        let beforeAV1Filter = filteredStreams.count
        let av1Codecs = ["av1"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let hasAV1 = av1Codecs.contains { codec in
                titleLower.contains(codec)
            }
            if hasAV1 {
                print("   🚫 SERVER BLOCKING AV1: \(stream.title)")
            }
            return !hasAV1
        }
        let afterAV1Filter = filteredStreams.count
        if afterAV1Filter < beforeAV1Filter {
            print("   🚫 SERVER FILTERED AV1: \(beforeAV1Filter) → \(afterAV1Filter) streams")
        }

        // CRITICAL: Filter "Bad Groups" / Low Quality Rips (TamilMV, etc)
        let beforeBadGroupFilter = filteredStreams.count
        let badGroups = ["tamilmv", "1tamilmv", "tamilrockers"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let isBadGroup = badGroups.contains { group in
                titleLower.contains(group)
            }
            if isBadGroup {
                print("   🚫 SERVER BLOCKING Bad Group: \(stream.title)")
            }
            return !isBadGroup
        }
        let afterBadGroupFilter = filteredStreams.count
        if afterBadGroupFilter < beforeBadGroupFilter {
            print("   🚫 SERVER FILTERED Bad Groups: \(beforeBadGroupFilter) → \(afterBadGroupFilter) streams")
        }

        // CRITICAL: Filter MPEG-2 / REMUX streams (too large/inefficient for older hardware)
        // We only block REMUX if it's explicitly MPEG-2 or if we suspect it's a massive legacy file
        let beforeMpeg2Filter = filteredStreams.count
        let mpeg2Terms = ["mpeg-2", "mpeg2", "dvd5", "dvd9"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            
            // Block explicit MPEG-2
            let isMpeg2 = mpeg2Terms.contains { term in
                titleLower.contains(term)
            }
            
            // Also block REMUX if it doesn't explicitly say x264/AVC, as it might be an old VC-1 or MPEG-2 rip
            // But if it says x264 REMUX, it might be okay (though still large). 
            // Given the user's issue with a 19GB file, let's be safe and block non-x264 REMUXes or just deprioritize them?
            // The user said "x264 must be our default".
            // Let's block MPEG-2 explicitly.
            
            if isMpeg2 {
                print("   🚫 SERVER BLOCKING MPEG-2: \(stream.title)")
                return false
            }
            
            return true
        }
        let afterMpeg2Filter = filteredStreams.count
        if afterMpeg2Filter < beforeMpeg2Filter {
            print("   🚫 SERVER FILTERED MPEG-2: \(beforeMpeg2Filter) → \(afterMpeg2Filter) streams")
        }

        // CRITICAL: Filter 3D movies (server-side, ALWAYS runs)
        let before3DFilter = filteredStreams.count
        let threeDFormats = ["3d", "sbs", "hsbs", "h-sbs", "half-sbs", "tab", "htab", "half-tab"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let is3D = threeDFormats.contains { format in
                titleLower.contains(format)
            }
            if is3D {
                print("   🚫 SERVER BLOCKING 3D: \(stream.title)")
            }
            return !is3D
        }
        let after3DFilter = filteredStreams.count
        if after3DFilter < before3DFilter {
            print("   🚫 SERVER FILTERED 3D: \(before3DFilter) → \(after3DFilter) streams")
        }

        // CRITICAL: Filter by AUDIO LANGUAGE - English/Multi preferred over foreign-only
        let beforeAudioFilter = filteredStreams.count
        filteredStreams = filteredStreams.filter { stream in
            // SPECIAL-CASE: Exempt trusted packs from audio filtering
            if isTrustedPack(stream) {
                print("   ✅ EXEMPTING trusted pack from audio filter: \(stream.title)")
                return true
            }
            
            let hasAcceptableAudio = hasAcceptableAudioLanguage(stream.title)
            if !hasAcceptableAudio {
                let audioDesc = getAudioLanguageDescription(stream.title)
                print("   🚫 SERVER BLOCKING non-English audio: \(stream.title) (\(audioDesc))")
            }
            return hasAcceptableAudio
        }
        let afterAudioFilter = filteredStreams.count
        if afterAudioFilter < beforeAudioFilter {
            print("   🎵 SERVER FILTERED audio language: \(beforeAudioFilter) → \(afterAudioFilter) streams (English/Multi only)")
        }

        print("   📊 After x265 + 3D + audio filter: \(filteredStreams.count) streams remaining")
        for (idx, stream) in filteredStreams.prefix(5).enumerated() {
            let audioDesc = getAudioLanguageDescription(stream.title)
            print("      [\(idx)] \(stream.title) (\(audioDesc))")
        }

        // CRITICAL: Filter by episode pattern for TV shows ONLY (before bucketing!)
        // Only apply episode filtering to TV series, not movies
        if type == "series" && season != nil && episode != nil {
            let beforeEpisodeFilter = filteredStreams.count

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

            filteredStreams = filteredStreams.filter { stream in
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

                // Match season pack patterns (e.g., "S01 Complete") or broad Sxx-Syy ranges
                let matchesSeasonPack = seasonOnlyPatterns.contains { pattern in
                    titleLower.contains(pattern)
                } || titleLower.contains("s01-s") || titleLower.contains("s02-s") || titleLower.contains("s03-s") || titleLower.contains("s04-s") || titleLower.contains("s05-s") || titleLower.contains("s06-s") || titleLower.contains("s07-s") || titleLower.contains("s08-s") || titleLower.contains("s09-s") || titleLower.contains("s10-s") || titleLower.range(of: "s\\d{2}-s\\d{2}", options: .regularExpression) != nil

                // SPECIAL-CASE: Allow our known good trusted packs through, even if naming doesn't match strict filters
                let matchesKnownPack = isTrustedPack(stream)

                let matches = matchesEpisode || matchesSeasonPack || matchesKnownPack

                if !matches && !isCometCached {
                    print("   ⏭️  Skipping \(stream.title) - doesn't match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!))")
                }

                return matches || isCometCached
            }

            let afterEpisodeFilter = filteredStreams.count
            print("   📺 Episode filter (S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)): \(beforeEpisodeFilter) → \(afterEpisodeFilter) streams")

            guard afterEpisodeFilter > 0 else {
                print("   ❌ No streams match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)) pattern")
                throw Abort(.notFound, reason: "No streams match requested episode")
            }
        } else if type == "movie" && (season != nil || episode != nil) {
            // SAFETY: Log if episode data is being passed for a movie (shouldn't happen after AppState fix)
            print("   ⚠️ WARNING: Movie type received season/episode data (season: \(season ?? 0), episode: \(episode ?? 0)) - this should be filtered out by client")
        }

        // OPTIMIZATION: Now that we've filtered down to the relevant streams, attach subtitles
        // This saves massive amounts of time by not processing subtitles for blocked streams
        let streamsWithSubtitles = await attachSubtitles(to: filteredStreams, imdbId: imdbId, type: type, season: season, episode: episode)

        // Partition into quality buckets (ColorFruit logic)
        var buckets: [String: [Stream]] = [
            "2160p": [],
            "1080p": [],
            "720p": [],
            "480p": []
        ]

        for stream in streamsWithSubtitles {
            let bucket = determineQualityBucket(stream.quality ?? "")

            // CRITICAL FIX: Filter out 2160p streams for TV events with trusted packs to prevent massive file selection
            if bucket == "2160p" && type == "series" && trustedPackQuery != nil {
                print("   🚫 TV EVENT FILTER: Blocking 2160p stream for series with trusted pack: \(stream.title)")
                continue
            }

            
            buckets[bucket, default: []].append(stream)
        }

        // Prefer strong season packs for TV (auto-primaries similar to Breaking Bad)
        if type == "series", let seasonNumber = season {
            func promoteBestPack(_ input: [Stream]) -> [Stream] {
                guard !input.isEmpty else { return input }

                // Simple size parser (GB/MB) for sanity checks
                func parseSizeToBytes(_ size: String?) -> Int64? {
                    guard let size = size?.lowercased() else { return nil }
                    let comps = size.components(separatedBy: CharacterSet.decimalDigits.inverted)
                    guard let numStr = comps.first(where: { !$0.isEmpty }), let value = Double(numStr) else { return nil }
                    if size.contains("gb") { return Int64(value * 1_073_741_824) }
                    if size.contains("mb") { return Int64(value * 1_048_576) }
                    return nil
                }

                // Parse size string to GB for trusted pack filtering
                func parseSizeToGB(_ size: String?) -> Double? {
                    guard let size = size?.lowercased() else { return nil }
                    let comps = size.components(separatedBy: CharacterSet.decimalDigits.inverted)
                    guard let numStr = comps.first(where: { !$0.isEmpty }), let value = Double(numStr) else { return nil }
                    if size.contains("gb") { return value }
                    if size.contains("mb") { return value / 1024.0 }
                    return nil
                }

                func packScore(_ stream: Stream) -> Int {
                    var score = 0
                    guard stream.isPack else { return 0 }
                    let titleLower = stream.title.lowercased()

                    // Target season present
                    if titleLower.contains(String(format: "s%02d", seasonNumber)) || titleLower.contains("season \(seasonNumber)") {
                        score += 60
                    }

                    // Season range / complete hints
                    if titleLower.contains("s01-") || titleLower.contains("s02-") || titleLower.contains("complete") || titleLower.contains("s0\(seasonNumber)-") {
                        score += 20
                    }

                    // Good source tags
                    if titleLower.contains("web-dl") || titleLower.contains("webdl") || titleLower.contains("nf") || titleLower.contains("amzn") || titleLower.contains("hmax") {
                        score += 50
                    } else if titleLower.contains("webrip") {
                        score += 30
                    }

                    // Embedded subs hint (only explicit multisub)
                    if titleLower.contains("multisub") || titleLower.contains("multi sub") {
                        score += 30
                    }

                    // Size sanity (prefer 1–4 GB per ep, but allow up to ~4 GB)
                    if let bytes = parseSizeToBytes(stream.size) {
                        // Rough lower bound: 0.5 GB per ep for packs
                        let minBytesPerEp: Int64 = 500_000_000
                        let maxBytesPerEp: Int64 = 4_500_000_000
                        if bytes >= minBytesPerEp && bytes <= maxBytesPerEp * 100 { // allow full-season totals
                            score += 15
                        }
                    }

                    // Seeder bonus (light)
                    score += min(stream.seeders ?? 0, 50)

                    // Hash presence
                    if stream.infoHash != nil { score += 10 }

                    return score
                }

                let packs = input.filter { $0.isPack }
                guard !packs.isEmpty else { return input }

                let scoredPacks = packs.map { ($0, packScore($0)) }.sorted { $0.1 > $1.1 }
                guard let bestPack = scoredPacks.first, bestPack.1 >= 80 else { return input }

                // Move best pack to front, keep order of others
                var reordered: [Stream] = []
                reordered.append(bestPack.0)
                for stream in input where stream.id != bestPack.0.id {
                    reordered.append(stream)
                }
                print("👑 Auto-promoting season pack as primary: \(bestPack.0.title) (score \(bestPack.1))")
                return reordered
            }

            buckets["2160p"] = buckets["2160p"].map(promoteBestPack)
            buckets["1080p"] = buckets["1080p"].map(promoteBestPack)
            buckets["720p"] = buckets["720p"].map(promoteBestPack)
            buckets["480p"] = buckets["480p"].map(promoteBestPack)
        }

        print("   📦 Bucket counts (before processBucket):")
        print("      2160p: \(buckets["2160p"]?.count ?? 0)")
        print("      1080p: \(buckets["1080p"]?.count ?? 0)")
        print("      720p: \(buckets["720p"]?.count ?? 0)")
        print("      480p: \(buckets["480p"]?.count ?? 0)")

        // Filter and sort each bucket (1 seeder minimum - Real-Debrid handles the rest)
        let preferPackPrimary = (type == "series")

        let preferMultiSubMovies = (type == "movie")

        // CRITICAL FIX: Skip 2160p processing entirely for TV events with trusted packs
        let uhd4kBucket: [Stream] = (type == "series" && trustedPackQuery != nil) ? [] : (buckets["2160p"] ?? [])
        if type == "series" && trustedPackQuery != nil {
            print("   🚫 TV EVENT FILTER: Completely skipping 2160p bucket for series with trusted pack to ensure hardcoded pack is used")
        }

        var qualityBuckets = QualityBuckets(
            uhd4k: processBucket(uhd4kBucket, minSeeders: 1, quality: "2160p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies),
            fullHD: processBucket(buckets["1080p"] ?? [], minSeeders: 1, quality: "1080p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies),
            hd: processBucket(buckets["720p"] ?? [], minSeeders: 1, quality: "720p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies),
            sd: processBucket(buckets["480p"] ?? [], minSeeders: 1, quality: "480p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies)
        )

        // If we found our trusted pack, force it as primary for 1080p while keeping prior choices as alternates
        if trustedPackQuery != nil {
            func prioritizeKnownPack(_ bucket: QualityBucket?) -> QualityBucket? {
                guard let bucket = bucket else { return nil }

                var candidates: [Stream] = []
                if let primary = bucket.primary { candidates.append(primary) }
                if let alternates = bucket.alternates { candidates.append(contentsOf: alternates) }

                // Prefer trusted pack match
                guard let pack = candidates.first(where: { stream in isTrustedPack(stream) }) else {
                    return bucket
                }

                // Keep other streams as alternates (excluding the chosen pack)
                let packId = pack.id
                let newAlternates = candidates.filter { stream in
                    // Keep all non-pack streams as alternates
                    stream.id != packId
                }

                print("👑 Using trusted pack as primary (1080p): \(pack.title)")
                return QualityBucket(primary: pack, alternates: newAlternates.isEmpty ? nil : newAlternates)
            }

            qualityBuckets = QualityBuckets(
                uhd4k: qualityBuckets.uhd4k,
                fullHD: prioritizeKnownPack(qualityBuckets.fullHD),
                hd: qualityBuckets.hd,
                sd: qualityBuckets.sd
            )
        }

        print("   📦 Bucket counts (after processBucket/seeder filter):")
        print("      2160p: \(qualityBuckets.uhd4k?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.uhd4k?.alternates?.count ?? 0) alts")
        print("      1080p: \(qualityBuckets.fullHD?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.fullHD?.alternates?.count ?? 0) alts")
        print("      720p: \(qualityBuckets.hd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.hd?.alternates?.count ?? 0) alts")
        print("      480p: \(qualityBuckets.sd?.primary != nil ? "1 primary" : "0") + \(qualityBuckets.sd?.alternates?.count ?? 0) alts")

        // CRITICAL FIX: Build streams array respecting server's ordering
        var finalStreams: [Stream] = []

        // Add 2160p bucket if available (but NOT for TV events with trusted packs)
        if let uhd4k = qualityBuckets.uhd4k, !(type == "series" && trustedPackQuery != nil) {
            if let primary = uhd4k.primary {
                finalStreams.append(primary)
                print("📦 Adding 2160p primary: \(primary.title)")
            }
            if let alternates = uhd4k.alternates {
                for alt in alternates {
                    finalStreams.append(alt)
                    print("📦 Adding 2160p alternate: \(alt.title)")
                }
            }
        } else if type == "series" && trustedPackQuery != nil {
            print("   🚫 TV EVENT FILTER: Skipping 2160p bucket in final streams for series with trusted pack")
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
        let year = req.query[String.self, at: "year"] // e.g., "2025"

        print("🔍 Resolving ALL streams for: \(imdbId) (\(quality)) (S\(season ?? 0)E\(episode ?? 0))")
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

        // FILTER BY YEAR (if provided) to ensure correct release matching
        if let year = year {
            let beforeYearFilter = streamsWithSubtitles.count

            // For movies: Apply strict year filtering to prevent remakes/reboots conflicts
            if type == "movie" {
                // Strict year patterns that match ONLY the exact target year
                let exactYearPatterns = [
                    "\\(\(year)\\)",               // (1991)
                    "\\.\(year)\\.",               // .1991.
                    " \(year) ",                   //  1991  (space-year-space)
                    " \(year)$",                   // 1991 at end (space-year-end)
                    "^\(year) ",                  // 1991 at start (year-space)
                    "\\.\(year)$",                 // .1991 at end (dot-year-end)
                    " \(year)\\.",                 // 1991. (space-year-dot)
                    "_\(year)_",                   // _1991_ (underscore-year-underscore)
                    "-\(year)-",                   // -1991- (dash-year-dash)
                    "\\[\(year)\\]",               // [1991] (brackets-year)
                    "^\(year)$",                  // 1991 as entire string
                ]

                streamsWithSubtitles = streamsWithSubtitles.filter { stream in
                    let title = stream.title

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
            } else {
                // For TV shows: Skip year filtering entirely
                // Season/episode + IMDB ID is sufficient for unique identification
                // Torrent releases rarely include year in episode titles
                print("   📺 SKIPPING year filter for TV show: IMDB ID + season/episode provides unique identification")
            }

            let afterYearFilter = streamsWithSubtitles.count
            if afterYearFilter < beforeYearFilter && type == "movie" {
                print("   📅 Year filter (\(year)) for movies: \(beforeYearFilter) → \(afterYearFilter) streams")
            }
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

                if !matchesEpisode && !isCometCached {
                    print("   ⏭️  Skipping \(stream.title) - doesn't match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!))")
                }
                return matchesEpisode || isCometCached
            }

            let afterEpisodeFilter = streamsWithSubtitles.count
            print("   📺 Episode filter (S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)): \(beforeEpisodeFilter) → \(afterEpisodeFilter) streams")

            guard afterEpisodeFilter > 0 else {
                print("   ❌ No streams match S\(String(format: "%02d", season!))E\(String(format: "%02d", episode!)) pattern")
                throw Abort(.notFound, reason: "No streams match requested episode")
            }
        }

        // CRITICAL: Filter by AUDIO LANGUAGE - English/Multi preferred over foreign-only (wild west mode applies)
        let beforeAudioFilter = streamsWithSubtitles.count
        streamsWithSubtitles = streamsWithSubtitles.filter { stream in
            let hasAcceptableAudio = hasAcceptableAudioLanguage(stream.title)
            if !hasAcceptableAudio {
                let audioDesc = getAudioLanguageDescription(stream.title)
                print("   🚫 SERVER BLOCKING non-English audio: \(stream.title) (\(audioDesc))")
            }
            return hasAcceptableAudio
        }
        let afterAudioFilter = streamsWithSubtitles.count
        if afterAudioFilter < beforeAudioFilter {
            print("   🎵 SERVER FILTERED audio language: \(beforeAudioFilter) → \(afterAudioFilter) streams (English/Multi only)")
        }

        print("   📊 After x265 + audio filter: \(streamsWithSubtitles.count) streams remaining")
        for (idx, stream) in streamsWithSubtitles.prefix(5).enumerated() {
            let audioDesc = getAudioLanguageDescription(stream.title)
            print("      [\(idx)] \(stream.title) (\(audioDesc))")
        }

        // WILD WEST MODE: SMART DEDUPLICATION BY INFOHASH FIRST
        // CRITICAL: Deduplicate by infoHash (same source), not by title
        // Different torrents with same quality/name are UNIQUE sources and should be preserved
        let beforeDedup = streamsWithSubtitles.count

        // FILTER OUT GARBAGE STREAMS (Comet placeholders with no real identifier)
        // Only remove streams that are:
        // 1. Have no infoHash AND no URL (can't be played)
        // 2. AND have generic/placeholder titles like "[RD⚡] Comet..."
        let validStreams = streamsWithSubtitles.filter { stream in
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
        // This ensures video and subtitle files are from the same release format
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
                let resolutions = ["480p", "720p", "1080p", "2160p"]
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

private func sortStreams(_ streams: [Stream], trustedPackQuery: String? = nil) -> [Stream] {
    return streams.sorted { s1, s2 in
        // 0. Highest priority: Trusted pack match
        if let trustedQuery = trustedPackQuery {
            let s1MatchesTrusted = matchesTrustedPack(s1, query: trustedQuery)
            let s2MatchesTrusted = matchesTrustedPack(s2, query: trustedQuery)

            if s1MatchesTrusted != s2MatchesTrusted {
                return s1MatchesTrusted && !s2MatchesTrusted
            }
        }

        // 1. Enhanced source quality ranking
        let sourceScore1 = sourceQualityRank(s1)
        let sourceScore2 = sourceQualityRank(s2)

        if sourceScore1 != sourceScore2 {
            return sourceScore1 > sourceScore2
        }

        // 2. Sort by quality (2160p > 1080p > 720p > 480p)
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

// MARK: - Trusted Pack Matching

private func matchesTrustedPack(_ stream: Stream, query: String) -> Bool {
    let title = stream.title.lowercased()
    let queryLower = query.lowercased()

    // For Breaking Bad: "Breaking Bad S01-S05 1080p NF WEB-DL AV1 EAC3 MultiSub"
    // Check for key components rather than exact match
    let queryComponents = queryLower.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }

    // Must contain show name
    guard title.contains("breaking bad") else { return false }

    // Must contain seasons
    guard title.contains("s01") && (title.contains("s05") || title.contains("s1-s5") || title.contains("s01-s05")) else { return false }

    // Must contain quality
    guard title.contains("1080p") else { return false }

    // Must contain Netflix or WEB-DL indicators
    guard title.contains("nf ") || title.contains("web-dl") || title.contains("webdl") else { return false }

    // Prefer AV1 but allow AVC
    let hasGoodCodec = title.contains("av1") || title.contains("avc") || title.contains("h264") || title.contains("x264")

    return hasGoodCodec
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
    if q.contains("2160p") {
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

// MARK: - Audio Language Detection and Filtering

/// Detect audio languages from stream title
/// Returns: (primaryLanguage, hasEnglish, isMultiAudio, languageScore)
private func detectAudioLanguage(_ title: String) -> (String, Bool, Bool, Int) {
    let titleLower = title.lowercased()
    let tokens = titleLower.split(whereSeparator: { !$0.isLetter && !$0.isNumber })

    // Common audio language patterns in torrent titles
    let englishPatterns = ["english", "eng", "en", "englisch"]
    let frenchPatterns = ["french", "fr", "français", "francais", "vf", "vff", "truefrench"]
    let germanPatterns = ["german", "de", "deu", "deutsch"]
    let spanishPatterns = ["spanish", "es", "esp", "español", "castellano"]
    let italianPatterns = ["italian", "it", "ita", "italiano"]

    // Multi-audio indicators (NOTE: multisub/multi.sub removed - those are subtitle indicators, not audio)
    let multiPatterns = ["multi", "multiaudio", "dual", "dual.audio"]

    var detectedLanguages: [String] = []
    var isMultiAudio = false

    // Check for multi-audio first
    for pattern in multiPatterns {
        if titleLower.contains(pattern) {
            isMultiAudio = true
            break
        }
    }

    func containsLanguagePattern(_ patterns: [String]) -> Bool {
        for pattern in patterns {
            if pattern.count <= 3 {
                if tokens.contains(where: { $0 == pattern }) {
                    return true
                }
            } else if titleLower.contains(pattern) {
                return true
            }
        }
        return false
    }

    // Detect specific languages
    if containsLanguagePattern(englishPatterns) {
        detectedLanguages.append("english")
    }
    if containsLanguagePattern(frenchPatterns) {
        detectedLanguages.append("french")
    }
    if containsLanguagePattern(germanPatterns) {
        detectedLanguages.append("german")
    }
    if containsLanguagePattern(spanishPatterns) {
        detectedLanguages.append("spanish")
    }
    if containsLanguagePattern(italianPatterns) {
        detectedLanguages.append("italian")
    }

    // If no explicit language found, assume English (most common default)
    if detectedLanguages.isEmpty {
        detectedLanguages.append("english")
    }

    let hasEnglish = detectedLanguages.contains("english")
    let primaryLanguage = detectedLanguages.first ?? "unknown"

    // Score audio language for filtering
    let languageScore: Int
    if hasEnglish {
        if isMultiAudio {
            languageScore = 80  // Multi-audio with English is good
        } else {
            languageScore = 100 // English-only is best
        }
    } else if isMultiAudio {
        languageScore = 40  // Multi-audio without English is acceptable as fallback
    } else {
        languageScore = -200 // Non-English single audio is heavily penalized
    }

    return (primaryLanguage, hasEnglish, isMultiAudio, languageScore)
}

/// Returns: (hasEnglishSubtitles, subtitleScore)
private func detectSubtitleLanguage(_ title: String) -> (Bool, Int) {
    let titleLower = title.lowercased()
    
    // English subtitle indicators
    let englishSubPatterns = ["sub.eng", "eng.sub", "english.sub", "sub.english", "engsub", "eng-sub", "english-sub"]
    
    // Multi-sub indicators (usually include English)
    let multiSubPatterns = ["multisub", "multi.sub", "multi-sub", "subs"]
    
    var hasEnglish = false
    var score = 0
    
    // Check for explicit English subs
    for pattern in englishSubPatterns {
        if titleLower.contains(pattern) {
            hasEnglish = true
            score = 20 // Explicit English subs get a nice boost
            break
        }
    }
    
    // Check for multi-subs (if no explicit English found yet)
    if !hasEnglish {
        for pattern in multiSubPatterns {
            if titleLower.contains(pattern) {
                hasEnglish = true // Assume multi-sub includes English
                score = 10 // Multi-subs get a smaller boost
                break
            }
        }
    }
    
    return (hasEnglish, score)
}

/// Check if a stream has acceptable audio language
/// Returns true if English or multi-audio, false for non-English only
private func hasAcceptableAudioLanguage(_ title: String) -> Bool {
    let (_, hasEnglish, isMultiAudio, _) = detectAudioLanguage(title)
    return hasEnglish || isMultiAudio
}

/// Get audio language description for logging
private func getAudioLanguageDescription(_ title: String) -> String {
    let (primary, hasEnglish, isMulti, _) = detectAudioLanguage(title)
    var description = primary.capitalized

    if isMulti {
        description += " (Multi)"
    }
    if hasEnglish {
        description += " ✓"
    }

    return description
}

// MARK: - Quality Bucket Helpers (ColorFruit logic)

private func determineQualityBucket(_ quality: String) -> String {
    let q = quality.lowercased()
    if q.contains("2160p") {
        return "2160p"
    } else if q.contains("1080p") {
        return "1080p"
    } else if q.contains("720p") {
        return "720p"
    } else {
        return "480p"
    }
}

private func processBucket(
    _ streams: [Stream],
    minSeeders: Int,
    quality: String,
    year: String?,
    targetTitle: String?,
    preferMultiSubPacksFirst: Bool = false,
    preferMultiSubMovies: Bool = false
) -> QualityBucket {
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
    case "2160p":
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
    // Also remove low-quality/unreliable release groups (YIFY, YTS, bitloks)
    // Also remove EXTRAS/bonus content torrents
    // Also remove incompatible codecs (AV1, MPEG-2) for older hardware
    let badPatterns = ["x265", "hevc", "h.265", "h265", "x.265", "yify", "yts", "bitloks", "extras", "av1", "mpeg-2", "mpeg2", "dvd5", "dvd9"]
    let beforeFilter = yearAndCodecFiltered.count
    yearAndCodecFiltered = yearAndCodecFiltered.filter { stream in
        let titleLower = stream.title.lowercased()
        let hasBadPattern = badPatterns.contains { pattern in
            titleLower.contains(pattern)
        }
        if hasBadPattern {
            print("  ⏭️ BLOCKING low-quality/unreliable stream: \(stream.title)")
        }
        return !hasBadPattern
    }

    if beforeFilter > yearAndCodecFiltered.count {
        print("  ✅ BLOCKED \(beforeFilter - yearAndCodecFiltered.count) streams (x265/YIFY/etc) for \(quality)")
    }
    
    // For MOVIES ONLY: Remove collection/pack torrents to avoid file index issues
    // Collections can cause Real-Debrid to return wrong file from multi-file torrents
    if targetTitle != nil {
        let collectionPatterns = ["collection", "pack", "trilogy", "quadrilogy", "pentalogy", "anthology", "complete", "1 2 3", "1-2-3", "1-5", "1 - 5", "top 250", "top 100", "imdb top", "box set", "boxset"]
        let beforeCollectionFilter = yearAndCodecFiltered.count
        yearAndCodecFiltered = yearAndCodecFiltered.filter { stream in
            let titleLower = stream.title.lowercased()
            let isCollection = collectionPatterns.contains { pattern in
                titleLower.contains(pattern)
            }
            if isCollection {
                print("  ⏭️ BLOCKING collection/pack (movies only): \(stream.title)")
            }
            return !isCollection
        }
        
        if beforeCollectionFilter > yearAndCodecFiltered.count {
            print("  ✅ BLOCKED \(beforeCollectionFilter - yearAndCodecFiltered.count) collection torrents for \(quality)")
        }
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
    let allowedYears = year.flatMap { parseAllowedYears($0) } ?? []

    func yearMatchPriority(_ stream: Stream) -> Int {
        guard !allowedYears.isEmpty else { return 0 }
        return streamTitleContainsYear(stream.title, targetYears: allowedYears) ? 1000 : 0
    }

    func codecRank(_ stream: Stream) -> Int {
        let titleLower = stream.title.lowercased()
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let hasBadCodec = badCodecs.contains { codec in
            titleLower.contains(codec)
        }
        return hasBadCodec ? 0 : 100  // x264 gets +100, x265 gets 0
    }

    // Sort by: title match (movies only) > year match > AUDIO LANGUAGE > source quality > provider > codec > seeders > extension
    let yearSorted = yearAndCodecFiltered.sorted { a, b in
        // MOVIES ONLY: prioritize titles that best match metadata title
        if let targetTitle = targetTitle {
            let titleScoreA = streamTitleMatchScore(a.title, targetTitle: targetTitle)
            let titleScoreB = streamTitleMatchScore(b.title, targetTitle: targetTitle)

            if titleScoreA != titleScoreB {
                return titleScoreA > titleScoreB
            }
        }

        // PRIMARY: Year match is ABSOLUTE PRIORITY
        let yearPriorityA = yearMatchPriority(a)
        let yearPriorityB = yearMatchPriority(b)

        if yearPriorityA != yearPriorityB {
            return yearPriorityA > yearPriorityB // A matches year, B doesn't = A wins
        }

        // NEW: AUDIO LANGUAGE PRIORITY - English/Multi preferred over foreign-only
        let audioScoreA = detectAudioLanguage(a.title).3
        let audioScoreB = detectAudioLanguage(b.title).3

        if audioScoreA != audioScoreB {
            let audioDescA = getAudioLanguageDescription(a.title)
            let audioDescB = getAudioLanguageDescription(b.title)
            print("  🎵 Audio Language: \(a.title) (\(audioDescA)) vs \(b.title) (\(audioDescB))")
            return audioScoreA > audioScoreB
        }

        // NEW: SUBTITLE PRIORITY - Prefer streams with English subtitles (tie-breaker)
        let subScoreA = detectSubtitleLanguage(a.title).1
        let subScoreB = detectSubtitleLanguage(b.title).1
        
        if subScoreA != subScoreB {
            // Only log if it makes a difference
            // print("  📝 Subtitle Score: \(a.title) (\(subScoreA)) vs \(b.title) (\(subScoreB))")
            return subScoreA > subScoreB
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

    // Preserve sorted order from yearSorted
    let sorted = filtered

    // Pack-first option: push a good multisub pack to primary if present
    var primary: Stream?
    var alternates: [Stream] = []

    // Helper: explicit multisub tag only
    func hasMultiSubTag(_ lower: String) -> Bool {
        return lower.contains("multisub") || lower.contains("multi sub")
    }

    // Baseline (current top) for closeness checks
    let baseline = sorted.first
    let baselineSource = baseline.map(sourceQualityRank) ?? 0
    let baselineSize = parseSize(baseline?.size)

    func notMuchSmallerThanBaseline(_ stream: Stream) -> Bool {
        guard let base = baselineSize, let mine = parseSize(stream.size) else { return true }
        return mine >= Int64(Double(base) * 0.85)
    }

    if preferMultiSubPacksFirst {
        let packCandidate = sorted.prefix(3).first { stream in
            guard stream.isPack else { return false }
            let titleLower = stream.title.lowercased()
            guard hasMultiSubTag(titleLower) else { return false }

            // Size sanity: prefer packs that aren't tiny (>= ~700MB) or absurdly huge per ep (> ~4.5GB)
            let sizeOk: Bool = {
                guard let size = parseSize(stream.size) else { return true } // if unknown, allow
                return size >= 700_000_000 && size <= 4_824_372_736 // ~0.7GB to 4.5GB
            }()

            // Source tag sanity
            let goodSource = titleLower.contains("web-dl") || titleLower.contains("webdl") || titleLower.contains("nf") || titleLower.contains("amzn") || titleLower.contains("hmax")

            // Only allow swap if near the current best
            let sourceClose = sourceQualityRank(stream) >= baselineSource - 10

            return sizeOk && goodSource && sourceClose && notMuchSmallerThanBaseline(stream)
        }

        if let pack = packCandidate {
            primary = pack
            alternates = sorted.filter { $0.id != pack.id }
            print("👑 Pack-first: Selecting multisub season pack as primary: \(pack.title)")
        }
    }

    // Movie multisub-first: prefer multisub WEB-DL/NF sources as primary if requested
    if preferMultiSubMovies && primary == nil {
        let movieCandidate = sorted.prefix(3).first { stream in
            let titleLower = stream.title.lowercased()
            guard hasMultiSubTag(titleLower) else { return false }
            let hasEng = titleLower.contains(" eng") || titleLower.contains("english") || titleLower.contains(" en ") || titleLower.contains("(en)")
            let goodSource = titleLower.contains("web-dl") || titleLower.contains("webdl") || titleLower.contains("nf") || titleLower.contains("amzn") || titleLower.contains("hmax")

            // Size sanity for movies: avoid tiny encodes (~3.5 GB floor as sanity)
            let sizeOk: Bool = {
                guard let size = parseSize(stream.size) else { return true }
                return size >= 3_758_096_384 // ~3.5 GB
            }()

            let sourceClose = sourceQualityRank(stream) >= baselineSource - 10

            return hasEng && goodSource && sourceClose && sizeOk
        }

        if let moviePrimary = movieCandidate {
            primary = moviePrimary
            alternates = sorted.filter { $0.id != moviePrimary.id }
            print("👑 Movie multisub-first: Selecting multisub WEB-DL/NF as primary: \(moviePrimary.title)")
        }
    }

    if primary == nil {
        // Default path: top of sorted
        primary = sorted.first
        alternates = Array(sorted.dropFirst().prefix(4))
    }

    // Debug: Show final sorted order before primary selection
    print("🏆 FINAL SORTED ORDER for bucket (top 5):")
    for (index, stream) in sorted.prefix(5).enumerated() {
        let score = sourceQualityRank(stream)
        print("   [\(index + 1)] \(stream.title) (source score: \(score))")
    }

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

// Helper: parse allowed years from a string like "2019" or "2019-2020" or "2019–2020"
private func parseAllowedYears(_ yearString: String) -> [String] {
    let separators = CharacterSet(charactersIn: "-–—")

    // Extract 4-digit years from the string
    let regex = try? NSRegularExpression(pattern: "(19|20)\\d{2}")
    let range = NSRange(location: 0, length: yearString.utf16.count)
    let matches = regex?.matches(in: yearString, range: range) ?? []
    let years = matches.compactMap { match -> Int? in
        guard let r = Range(match.range, in: yearString) else { return nil }
        return Int(yearString[r])
    }

    if years.count >= 2 && yearString.rangeOfCharacter(from: separators) != nil {
        let start = years.first!
        let end = years.dropFirst().first ?? start
        return Array(start...end).map { String($0) }
    } else if let single = years.first {
        return [String(single)]
    }

    // Fallback: split by separators and use any 4-digit tokens
    let parts = yearString.split(whereSeparator: { separators.contains($0.unicodeScalars.first!) })
    let tokens = parts.compactMap { Int($0) }
    return tokens.map { String($0) }
}

// Helper: extract all 4-digit years from a stream title
private func extractYearsFromTitle(_ title: String) -> [String] {
    let regex = try? NSRegularExpression(pattern: "(19|20)\\d{2}")
    let range = NSRange(location: 0, length: title.utf16.count)
    let matches = regex?.matches(in: title, range: range) ?? []
    return matches.compactMap { match in
        guard let r = Range(match.range, in: title) else { return nil }
        return String(title[r])
    }
}

// Helper function to check if stream title contains any of the target years
private func streamTitleContainsYear(_ title: String, targetYears: [String]) -> Bool {
    guard !targetYears.isEmpty else { return false }

    for targetYear in targetYears {
        // Comprehensive year patterns that match actual release year positions
        let yearPatterns = [
            "\\((\(targetYear))\\)",           // (1991)
            "\\.\(targetYear)\\.",               // .1991.
            " \(targetYear) ",               //  1991  (space-year-space)
            " \(targetYear)$",               // 1991 at end (space-year-end)
            "^\(targetYear) ",                  // 1991 at start (year-space)
            "\\.\(targetYear)$",                 // .1991 at end (dot-year-end)
            " \(targetYear)\\.",                 // 1991. (space-year-dot)
            "_\(targetYear)_",               // _1991_ (underscore-year-underscore)
            "-\(targetYear)-",               // -1991- (dash-year-dash)
            "\\[\(targetYear)\\]",               // [1991] (brackets-year)
            "^\(targetYear)$",                  // 1991 as entire string
        ]

        for pattern in yearPatterns {
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let range = NSRange(location: 0, length: title.utf16.count)
                if regex.firstMatch(in: title, range: range) != nil {
                    return true
                }
            }
        }
    }

    return false
}

// Helper: score how well a stream title matches canonical metadata title (movies only)
// Simple, fast heuristic: exact match > starts/contains > word overlap
private func streamTitleMatchScore(_ title: String, targetTitle: String) -> Int {
    let normalize: (String) -> String = { str in
        let lowered = str.lowercased()
        let allowed = lowered.filter { $0.isLetter || $0.isNumber || $0 == " " }
        return allowed.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    let normTitle = normalize(title)
    let normTarget = normalize(targetTitle)

    if normTitle == normTarget {
        return 2000  // perfect match
    }

    if normTitle.hasPrefix(normTarget) || normTitle.hasSuffix(normTarget) || normTitle.contains(normTarget) {
        return 1500  // strong contains
    }

    // Token overlap score
    let titleWords = Set(normTitle.split(separator: " "))
    let targetWords = Set(normTarget.split(separator: " "))
    let intersection = titleWords.intersection(targetWords)
    let overlapScore = intersection.count * 100

    return overlapScore
}

private func extractReleaseInfo(_ title: String) -> String {
    // Extract resolution and codec info for matching
    var info = ""

    let resolutions = ["480p", "720p", "1080p", "2160p"]
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

// Helper function to extract season and episode numbers from file path
func extractSeasonEpisode(from pathLower: String) -> (season: Int, episode: Int)? {
    // Pattern 1: S##E## (case-insensitive)
    if let regex = try? NSRegularExpression(pattern: "s(\\d{1,2})e(\\d{1,2})", options: []) {
        let nsString = pathLower as NSString
        let range = NSRange(location: 0, length: nsString.length)
        if let match = regex.firstMatch(in: pathLower, options: [], range: range) {
            if match.numberOfRanges >= 3,
               let seasonRange = Range(match.range(at: 1), in: pathLower),
               let episodeRange = Range(match.range(at: 2), in: pathLower),
               let season = Int(String(pathLower[seasonRange])),
               let episode = Int(String(pathLower[episodeRange])) {
                return (season: season, episode: episode)
            }
        }
    }

    // Pattern 2: Season ##, Episode ## (with variations)
    if let regex = try? NSRegularExpression(pattern: "season\\s+(\\d{1,2}).*episode\\s+(\\d{1,2})", options: []) {
        let nsString = pathLower as NSString
        let range = NSRange(location: 0, length: nsString.length)
        if let match = regex.firstMatch(in: pathLower, options: [], range: range) {
            if match.numberOfRanges >= 3,
               let seasonRange = Range(match.range(at: 1), in: pathLower),
               let episodeRange = Range(match.range(at: 2), in: pathLower),
               let season = Int(String(pathLower[seasonRange])),
               let episode = Int(String(pathLower[episodeRange])) {
                return (season: season, episode: episode)
            }
        }
    }

    return nil
}
