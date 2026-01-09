//
//  StreamResolver.swift
//  RedLemon
//
//  Service for resolving streams independently of HTTP routes
//  Allows direct local execution without network overhead
//

import Foundation
import Vapor

actor StreamResolver {
    static let shared = StreamResolver()

    private init() {}

    // MARK: - Main Resolution Method

    func resolveStreamsByQuality(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil,
        name: String? = nil,
        year: String? = nil,
        excludedHashes: Set<String> = [],
        ignoreVerified: Bool = false
    ) async throws -> QualityBucketsResponse {
        NSLog("⚡️ StreamResolver: Resolving streams for \(imdbId) (S\(season ?? 0)E\(episode ?? 0))")
        await SessionRecorder.shared.startNewSession(imdbId: imdbId)
        await SessionRecorder.shared.log(category: .resolver, message: "Started Resolution", metadata: ["type": type, "season": "\(season ?? 0)", "episode": "\(episode ?? 0)"])
        
        // Fetch Blacklisted Streams (Parallel)
        // We fetch this fresh every time to ensure blocks are immediate
        var blockedHashes: Set<String> = []
        if let blockedList = try? await SupabaseClient.shared.getBlockedStreams() {
            blockedHashes = Set(blockedList.map { $0.streamHash })
            print("🛡️ StreamResolver: Loaded \(blockedHashes.count) blocked streams from blacklist")
        }

        if let year = year {

            NSLog("   📅 Filtering by year: \(year)")
        }

        // Fetch all streams from providers
        // Note: ProviderManager is a singleton, accessible here

        // MARK: - Verified Stream Short-Circuit

        var verifiedStream: SupabaseClient.VerifiedStream?
        if !ignoreVerified {
             // Pass season/episode (defaulting to -1 if nil, to match DB default)
             let s = season ?? -1
             let e = episode ?? -1
             verifiedStream = try? await SupabaseClient.shared.getVerifiedStream(imdbId: imdbId, season: s, episode: e, quality: "1080p")
        }

        if let verified = verifiedStream, let hash = verified.hash as String?, !hash.isEmpty {
             // CRITICAL: Ensure verified stream isn't blacklisted (e.g. if we banned it but cache persists)
             if blockedHashes.contains(hash) {
                 print("🛡️ StreamResolver: Verified stream is BLACKLISTED. Ignoring verification.")
             } else {

            // Check Guardrail: Soft Decay
            let isStale: Bool
            let daysSince = Date().timeIntervalSince(verified.lastVerifiedAt) / 86400
            isStale = daysSince > 30

            if isStale {
                print("⚠️ StreamResolver: Verified stream is STALE (>30 days). Will verify cache status strictly.")
                await SessionRecorder.shared.log(category: .resolver, message: "Verified Stream Stale", metadata: ["days_since": String(daysSince)])
            } else {
                print("⚡️ StreamResolver: Found Community Verified stream with \(verified.voteCount) votes!")
                print("   ℹ️ Hash: \(hash)")
                print("   ℹ️ Last Verified: \(verified.lastVerifiedAt)")
                await SessionRecorder.shared.log(category: .resolver, message: "Found Verified Stream", metadata: ["vote_count": "\(verified.voteCount)", "hash": hash])
            }

            // Reconstruct a strict stream object
            let candidateStream = Stream(
                url: verified.magnetLink,
                title: "Community Verified Stream (1080p)",
                quality: "1080p",
                seeders: 9999,
                size: "0 GB", // Unknown, but trusted
                provider: "verified",
                infoHash: verified.hash
            )

            // OPTIMIZATION: Attach subtitles for verified stream
            let streamsWithSubtitles = await attachSubtitles(
                to: [candidateStream],
                imdbId: imdbId,
                type: type,
                season: season,
                episode: episode
            )

            let finalStream = streamsWithSubtitles.first ?? candidateStream

            let bucket = QualityBucket(primary: finalStream, alternates: [])

            // If satisfied, we can return early!
            print("⚡️ StreamResolver: SHORT CIRCUIT - Returning verified stream immediately.")
            return QualityBucketsResponse(buckets: QualityBuckets(
                uhd4k: QualityBucket(primary: nil, alternates: nil),
                fullHD: bucket,
                hd: QualityBucket(primary: nil, alternates: nil),
                sd: QualityBucket(primary: nil, alternates: nil)
            ))
            }
        }


        // Fetch streams if not verified
        NSLog("📦 StreamResolver: Fetching streams from ProviderManager...")
        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode
        )

        NSLog("📦 StreamResolver: Received \(streams.count) raw streams, bucketing...")

        // For movies only, pull canonical title to prioritize correct matches
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

        // CRITICAL: Filter Blocked Streams immediately
        if !blockedHashes.isEmpty {
            let beforeBlockFilter = filteredStreams.count
            filteredStreams = filteredStreams.filter { stream in
                guard let hash = stream.infoHash else { return true }
                if blockedHashes.contains(hash) {
                    print("   🛡️ RESOLVER BLOCKING blacklisted stream: \(stream.title) (Hash: \(hash))")
                    return false
                }
                return true
            }
            if filteredStreams.count < beforeBlockFilter {
                print("   🛡️ RESOLVER FILTERED Blocked Streams: \(beforeBlockFilter) → \(filteredStreams.count) streams")
            }
        }

        // Filter by year if provided
        if let year = year {
            let allowedYears = parseAllowedYears(year)
            if allowedYears.isEmpty {
                print("   ⚠️ Year string '\(year)' could not be parsed; skipping year filter")
            } else {
                let beforeCount = filteredStreams.count
                filteredStreams = filteredStreams.filter { stream in
                    // Movies: keep only streams whose titles include the exact year (or Year + 1)
                    if type == "movie" {
                        return streamTitleContainsYear(stream.title, targetYears: allowedYears)
                    }

                    // Series: drop streams that explicitly mention a conflicting year
                    if allowedYears.isEmpty { return true }
                    let yearsInTitle = extractYearsFromTitle(stream.title)

                    // If no year is present, keep it (common for TV episode releases)
                    guard !yearsInTitle.isEmpty else { return true }

                    let hasAllowedYear = yearsInTitle.contains { allowedYears.contains($0) }
                    
                    // FIX: If the "wrong year" is actually part of the show's title (e.g. "1923", "2012"), allow it.
                    if !hasAllowedYear {
                         // Check if any of the "wrong" years are present in the target title
                         // e.g. targetTitle="1923", yearsInTitle=["1923"]. 1923 != 2022 (release year), but it matches title.
                         if let target = targetTitle {
                             let targetYears = extractYearsFromTitle(target)
                             let matchesTitleYear = yearsInTitle.contains { y in targetYears.contains(y) || target.contains(y) }
                             if matchesTitleYear {
                                 print("   ✅ RESOLVER KEEPING Title-Match Year: \(stream.title) (Matched title year)")
                                 return true
                             }
                         }
                        
                        print("   🚫 RESOLVER BLOCKING wrong-year series stream: \(stream.title) (years: \(yearsInTitle.joined(separator: ",")))")
                    } else {
                        print("   ✅ RESOLVER KEEPING correct-year series stream: \(stream.title)")
                    }
                    return hasAllowedYear
                }
                let afterCount = filteredStreams.count
                if type == "movie" {
                    print("   📅 Year filter (\(year)): \(beforeCount) → \(afterCount) streams")
                    
                    // FIX: If year filter removed EVERYTHING or ALMOST EVERYTHING, it was likely too strict
                    // (e.g. valid streams missing year in title).
                    // Restore streams and let title matching handle it.
                    if (afterCount == 0 && beforeCount > 0) || (beforeCount > 20 && afterCount < 3) {
                        print("   ⚠️ Year filter too strict! Restoring \(beforeCount) streams to attempt title matching.")
                        filteredStreams = streams
                    }
                } else {
                    if afterCount < beforeCount {
                        print("   📺 Year filter (series \(year)): \(beforeCount) → \(afterCount) streams")
                    }
                }
            }
        }

        // REMOVED: Upstream x265/HEVC filter
        // We now handle this safely in StreamService with a tiered fallback (H.264 > x265 8bit > x265 10bit)
        // This allows movies like "Five Nights at Freddy's" (which are 100% x265) to play.


        // CRITICAL: Filter AV1 streams (hardware incompatibility)
        let beforeAV1Filter = filteredStreams.count
        let av1Codecs = ["av1"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let hasAV1 = av1Codecs.contains { codec in
                titleLower.contains(codec)
            }
            if hasAV1 {
                print("   🚫 RESOLVER BLOCKING AV1: \(stream.title)")
            }
            return !hasAV1
        }
        let afterAV1Filter = filteredStreams.count
        if afterAV1Filter < beforeAV1Filter {
            print("   🚫 RESOLVER FILTERED AV1: \(beforeAV1Filter) → \(afterAV1Filter) streams")
        }

        // CRITICAL: Filter Samples, Trailers, and Extras
        let beforeSampleFilter = filteredStreams.count
        let sampleTerms = ["sample", "trailer", "featurette", "teaser", "bonus", "making of", "deleted scenes"]
        
        let targetLower = targetTitle?.lowercased() ?? ""
        
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = getExtendedSearchText(for: stream)
            
            // Check for terms with delimiters to avoid false positives (e.g. "teasers" -> "teaser" is okay, but "sample" in "example" is not)
            // Actually "example" doesn't contain "sample". 
            // But strict delimiters are safer.
            // Terms to check strictly: "sample", "trailer", "teaser", "bonus"
            // Terms to check loosely: "featurette", "making of", "deleted scenes"
            
            let isSample = sampleTerms.contains { term in
                // Optimization: Ignore if term is in the official title (e.g. "Sample People", "Trailer Park Boys")
                if !targetLower.isEmpty && targetLower.contains(term) {
                    return false
                }
                
                if term == "featurette" || term == "making of" || term == "deleted scenes" {
                    return titleLower.contains(term)
                }
                // For short words, use delimiters
                return titleLower.contains(" \(term) ") || 
                       titleLower.contains(".\(term).") || 
                       titleLower.contains("-\(term)-") || 
                       titleLower.hasSuffix("-\(term)") ||
                       titleLower.hasSuffix(".\(term)") ||
                       titleLower.hasSuffix(" \(term)") ||
                       titleLower == term
            }
            
            if isSample {
                print("   🚫 RESOLVER BLOCKING Sample/Trailer: \(stream.title)")
                return false
            }
            return true
        }
        if filteredStreams.count < beforeSampleFilter {
            print("   🚫 RESOLVER FILTERED Samples/Trailers: \(beforeSampleFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter "Bad Groups"
        let beforeBadGroupFilter = filteredStreams.count
        let badGroups = ["tamilmv", "1tamilmv", "tamilrockers", "le-production", "le production", "rgzsrutracker"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = getExtendedSearchText(for: stream)
            let isBadGroup = badGroups.contains { group in
                // Optimization: Ignore if group name is in the official title
                if !targetLower.isEmpty && targetLower.contains(group) {
                    return false
                }
                
                // Use strict delimiters for "le production" to prevent "Simple Production" matches
                if group == "le production" || group == "le-production" {
                     return titleLower.contains(" le production ") || titleLower.contains(".le.production.") || titleLower.contains("-le-production-")
                }
                
                return titleLower.contains(group)
            }
            if isBadGroup {
                print("   🚫 RESOLVER BLOCKING Bad Group: \(stream.title)")
            }
            return !isBadGroup
        }
        if filteredStreams.count < beforeBadGroupFilter {
            print("   🚫 RESOLVER FILTERED Bad Groups: \(beforeBadGroupFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter Spam/Watermarked Streams (e.g. Gambling sites)
        let beforeSpamFilter = filteredStreams.count
        let spamTerms = ["1xbet", "casino", "winline", "azino", "bet", "vavada", "joycasino", "parimatch", "mostbet", "melbet"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = getExtendedSearchText(for: stream)
             // Use strict delimiters for "bet" to avoid false positives (e.g. "Better call saul")
            let isSpam = spamTerms.contains { term in
                // Optimization: Ignore if term is in the official title (e.g. "Casino Royale", "The Bet")
                if !targetLower.isEmpty && targetLower.contains(term) {
                    return false
                }

                if term == "bet" {
                     return titleLower.contains(".bet.") || titleLower.contains(" bet ") || titleLower.contains("-bet-")
                }
                return titleLower.contains(term)
            }
            if isSpam {
                print("   🚫 RESOLVER BLOCKING Spam/Watermark: \(stream.title)")
            }
            return !isSpam
        }
        if filteredStreams.count < beforeSpamFilter {
            print("   🚫 RESOLVER FILTERED Spam/Watermarks: \(beforeSpamFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter MPEG-2 / REMUX streams
        let beforeMpeg2Filter = filteredStreams.count
        let mpeg2Terms = ["mpeg-2", "mpeg2", "dvd5", "dvd9"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = getExtendedSearchText(for: stream)
            let isMpeg2 = mpeg2Terms.contains { term in
                titleLower.contains(term)
            }
            if isMpeg2 {
                print("   🚫 RESOLVER BLOCKING MPEG-2: \(stream.title)")
                return false
            }
            return true
        }
        if filteredStreams.count < beforeMpeg2Filter {
            print("   🚫 RESOLVER FILTERED MPEG-2: \(beforeMpeg2Filter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter 3D movies
        let before3DFilter = filteredStreams.count
        // Use stricter patterns for 3D detection to avoid false positives (like "Sp33dy94")
        // "3d" is the most dangerous one, so we check it with delimiters
        let threeDFormats = ["sbs", "hsbs", "h-sbs", "half-sbs", "tab", "htab", "half-tab"]

        filteredStreams = filteredStreams.filter { stream in
            let titleLower = getExtendedSearchText(for: stream)

            // Check implicit 3D ("3d" surrounded by delimiters)
            if titleLower.contains(".3d.") || titleLower.contains(" 3d ") || titleLower.contains("-3d-") || titleLower.hasSuffix(".3d") || titleLower.hasSuffix(" 3d") {
                 print("   🚫 RESOLVER BLOCKING 3D (Strict): \(stream.title)")
                 return false
            }

            let is3D = threeDFormats.contains { format in
                // Optimization: Ignore if format is in the official title (e.g. "Taboo", "SBS Start-Up")
                if !targetLower.isEmpty && targetLower.contains(format) {
                    return false
                }
                return titleLower.contains(format)
            }
            if is3D {
                print("   🚫 RESOLVER BLOCKING 3D: \(stream.title)")
            }
            return !is3D
        }
        if filteredStreams.count < before3DFilter {
            print("   🚫 RESOLVER FILTERED 3D: \(before3DFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter by AUDIO LANGUAGE - English/Multi preferred
        let beforeAudioFilter = filteredStreams.count
        filteredStreams = filteredStreams.filter { stream in
            let combinedText = getExtendedSearchText(for: stream)
            let hasAcceptableAudio = hasAcceptableAudioLanguage(combinedText, targetTitle: targetTitle)
            if !hasAcceptableAudio {
                let audioDesc = getAudioLanguageDescription(combinedText)
                print("   🚫 RESOLVER BLOCKING non-English audio: \(stream.title) (\(audioDesc))")
            }
            return hasAcceptableAudio
        }
        if filteredStreams.count < beforeAudioFilter {
            print("   🎵 RESOLVER FILTERED audio language: \(beforeAudioFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter by episode pattern for TV shows
        if type == "series" && season != nil && episode != nil {
            let beforeEpisodeFilter = filteredStreams.count

            var episodePatterns = [
                String(format: "s%02de%02d", season!, episode!),  // s01e01
                String(format: "s%de%d", season!, episode!),      // s1e1
                String(format: "s%02d e%02d", season!, episode!), // s01 e01
                String(format: "%dx%02d", season!, episode!),     // 1x01
                String(format: "season %d episode %d", season!, episode!) // season 1 episode 1
            ]
            
            // FIX: Special handling for "Pilot" / "Unaired Pilot" often labeled as 1x00
            // If we are looking for Season 0, Episode 1 (S00E01), allow searching for 1x00 (S01E00) patterns
            if season == 0 && episode == 1 {
                episodePatterns.append("s01e00")
                episodePatterns.append("1x00")
                episodePatterns.append("s1e0")
                print("   ℹ️ StreamResolver: Added alias patterns for S00E01 -> [s01e00, 1x00, s1e0]")
            }

            let seasonOnlyPatterns = [
                String(format: " s%02d ", season!),    // " s01 "
                String(format: ".s%02d.", season!),    // ".s01."
                String(format: " s%d ", season!),      // " s1 "
                String(format: ".s%d.", season!),      // ".s1."
                String(format: "season.%d.", season!), // "season.1."
                String(format: "season %d ", season!)  // "season 1 "
            ]

            filteredStreams = filteredStreams.filter { stream in
                let titleLower = stream.title.lowercased()

                // Allow trusted Comet cached streams
                let isCometCached = stream.provider.lowercased() == "comet" &&
                                  (stream.title.contains("[RD⚡]") || stream.title.contains("⚡"))
                if isCometCached {
                    let seasonInTitle = titleLower.contains("s\(season!)") || titleLower.contains("season \(season!)")
                    let episodeInTitle = titleLower.contains("e\(episode!)") || titleLower.contains("episode \(episode!)")
                    if seasonInTitle && episodeInTitle { return true }
                }

                let matchesEpisode = episodePatterns.contains { titleLower.contains($0) }

                let matchesSeasonPack = seasonOnlyPatterns.contains { pattern in
                    titleLower.contains(pattern)
                } || titleLower.contains("s01-s") || titleLower.range(of: "s\\d{2}-s\\d{2}", options: [.regularExpression]) != nil

                return matchesEpisode || matchesSeasonPack || isCometCached
            }

            print("   📺 Episode filter: \(beforeEpisodeFilter) → \(filteredStreams.count) streams")
        }

        // OPTIMIZATION: Attach subtitles
        let streamsWithSubtitles = await attachSubtitles(to: filteredStreams, imdbId: imdbId, type: type, season: season, episode: episode, name: targetTitle ?? name, year: year != nil ? Int(year!) : nil)

        // Partition into quality buckets
        var buckets: [String: [Stream]] = ["2160p": [], "1080p": [], "720p": [], "480p": []]
        for stream in streamsWithSubtitles {
            // First try to use the explicit quality, then fall back to parsing from title
            let quality = stream.quality ?? ""
            var bucket = determineQualityBucket(quality)
            // If bucket defaulted to 480p but quality wasn't explicitly 480p, try parsing from title
            if bucket == "480p" && !quality.contains("480p") {
                bucket = determineQualityBucket(stream.title)
            }
            buckets[bucket, default: []].append(stream)
        }

        // Promote best TV packs
        if type == "series", let seasonNumber = season {
             // Logic extracted from promoteBestPack
             func promoteBestPack(_ input: [Stream]) -> [Stream] {
                // Simplified for brevity, reusing core logic
                guard !input.isEmpty else { return input }

                // Helper to score packs
                func packScore(_ stream: Stream) -> Int {
                    guard stream.isPack else { return 0 }
                    let titleLower = stream.title.lowercased()
                    var score = 0
                    if titleLower.contains(String(format: "s%02d", seasonNumber)) { score += 60 }
                    if titleLower.contains("web-dl") || titleLower.contains("nf") { score += 50 }
                    if titleLower.contains("multisub") { score += 30 }
                    return score
                }

                let packs = input.filter { $0.isPack }
                guard !packs.isEmpty else { return input }
                let scoredPacks = packs.map { ($0, packScore($0)) }.sorted { $0.1 > $1.1 }
                guard let best = scoredPacks.first, best.1 >= 80 else { return input }

                var reordered = [best.0]
                reordered.append(contentsOf: input.filter { $0.id != best.0.id })
                print("👑 Auto-promoting season pack: \(best.0.title)")
                return reordered
            }

            buckets["2160p"] = buckets["2160p"].map(promoteBestPack)
            buckets["1080p"] = buckets["1080p"].map(promoteBestPack)
            buckets["720p"] = buckets["720p"].map(promoteBestPack)
            buckets["480p"] = buckets["480p"].map(promoteBestPack)
        }

        let preferPackPrimary = (type == "series")
        let preferMultiSubMovies = (type == "movie")

        let uhd4kBucket = processBucket(buckets["2160p"] ?? [], minSeeders: 1, quality: "2160p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies, excludedHashes: excludedHashes)
        let fullHDBucket = processBucket(buckets["1080p"] ?? [], minSeeders: 1, quality: "1080p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies, excludedHashes: excludedHashes)
        let hdBucket = processBucket(buckets["720p"] ?? [], minSeeders: 1, quality: "720p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies, excludedHashes: excludedHashes)
        let sdBucket = processBucket(buckets["480p"] ?? [], minSeeders: 1, quality: "480p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies, excludedHashes: excludedHashes)

        // Log final primary selections
        if let primary = uhd4kBucket.primary { print("📦 2160p Primary: \(primary.title)") }
        if let primary = fullHDBucket.primary { print("📦 1080p Primary: \(primary.title)") }
        if let primary = hdBucket.primary { print("📦 720p Primary: \(primary.title)") }

        print("✅ StreamResolver: Quality buckets ready")

        await SessionRecorder.shared.log(category: .resolver, message: "Resolution Complete", metadata: [
            "2160p": "\(uhd4kBucket.primary != nil ? "1" : "0")",
            "1080p": "\(fullHDBucket.primary != nil ? "1" : "0")",
            "720p": "\(hdBucket.primary != nil ? "1" : "0")"
        ])

        return QualityBucketsResponse(buckets: QualityBuckets(
            uhd4k: uhd4kBucket,
            fullHD: fullHDBucket,
            hd: hdBucket,
            sd: sdBucket
        ))
    }

    // MARK: - Subtitle Attachment Copy
    // Note: Copied from StreamRoutes logic to be standalone

    private func attachSubtitles(to streams: [Stream], imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, name: String? = nil, year: Int? = nil) async -> [Stream] {
         guard let subdlKey = await KeychainManager.shared.get(service: "subdl") else {
             return streams
         }

         do {
             let subtitles = try await SubDLClient.shared.search(
                 imdbId: imdbId,
                 type: type,
                 season: season,
                 episode: episode,
                 languages: "en",
                 name: name,
                 year: year,
                 apiKey: subdlKey
             )

             guard !subtitles.isEmpty else { return streams }

             // Simplistic filtering for speed
             let englishSubtitles = subtitles.filter {
                 let lang = ($0.language ?? "").lowercased()
                 return lang == "en" || lang == "eng" || lang.contains("english")
             }

             // Map streams to attach the BEST matching subtitles for THAT specific stream
             return streams.map { stream in
                 if stream.subtitles == nil || stream.subtitles!.isEmpty {

                     // Rank subtitles specifically for this stream's filename/title
                     let rankedSubs = rankSubtitlesForStream(englishSubtitles, streamTitle: stream.title)

                     // Select top 20 matches (effectively "all" relevant ones)
                     let mappedSubs = rankedSubs.prefix(20).map { sub in
                        Subtitle(
                            id: Data((sub.url).utf8).base64EncodedString(),
                            url: sub.url,
                            lang: sub.language ?? "en",
                            label: sub.releaseName ?? "English",
                            srclang: sub.language ?? "en",
                            kind: "subtitles",
                            provider: "SubDL"
                        )
                     }

                     if !mappedSubs.isEmpty {
                        // Log the match for debugging
                        let bestMatch = mappedSubs.first?.label ?? "Unknown"
                        print("✅ StreamResolver: Attached best sub for '\(stream.title.prefix(30))...': \(bestMatch.prefix(30))...")
                     }

                     var newStream = stream
                     newStream.subtitles = Array(mappedSubs)
                     return newStream
                 }
                 return stream
             }
         } catch {
             print("❌ StreamResolver: Subtitle error: \(error)")
             return streams
         }
    }

    /// Rank subtitles based on how well they match the stream's Release Type
    /// Returns sorted list (Best match first)
    private func rankSubtitlesForStream(_ subtitles: [SubDLSubtitle], streamTitle: String) -> [SubDLSubtitle] {
        let streamLower = streamTitle.lowercased()

        return subtitles.sorted { sub1, sub2 in
            let score1 = calculateStreamMatchScore(streamTitle: streamLower, subtitle: sub1)
            let score2 = calculateStreamMatchScore(streamTitle: streamLower, subtitle: sub2)
            return score1 > score2
        }
    }

    private func calculateStreamMatchScore(streamTitle: String, subtitle: SubDLSubtitle) -> Int {
        guard let releaseName = subtitle.releaseName?.lowercased() else { return 0 }
        var score = 0

        // Tokens to check for matching
        let sourceTokens = ["webrip", "web-dl", "web", "bluray", "brrip", "bdrip", "dvdrip", "hdrip", "cam", "ts", "tc", "scr", "remux"]
        let qualityTokens = ["1080p", "720p", "2160p", "4k", "480p"]
        let groupTokens = ["yts", "rarbg", "galaxy", "psa", "qxr", "tgx"]

        // 1. Source Match (Critical: +500)
        // If stream is WEBRip, we want WEBRip subs.
        for token in sourceTokens {
            if streamTitle.contains(token) && releaseName.contains(token) {
                score += 500
            } else if streamTitle.contains(token) && !releaseName.contains(token) {
                // If mismatch, check if subtitle has a CONFLICTING source
                // e.g. Stream=WEBRip, Sub=BluRay -> Match failed
                for other in sourceTokens where other != token {
                    if releaseName.contains(other) {
                        score -= 200 // Penalty for explicit mismatch
                    }
                }
            }
        }

        // 2. Quality Match (+100)
        for token in qualityTokens {
            if streamTitle.contains(token) && releaseName.contains(token) {
                score += 100
            }
        }

        // 3. Group Match (+50)
        for token in groupTokens {
            if streamTitle.contains(token) && releaseName.contains(token) {
                score += 50
            }
        }

        // 4. Penalty for "Ai-Enhanced" / "60fps" if stream is standard
        // These are often modified versions with different timing
        let nicheTokens = ["60fps", "ai-enhanced", "upscaled", "interpolated"]
        for token in nicheTokens {
            if releaseName.contains(token) && !streamTitle.contains(token) {
                score -= 1000 // Huge penalty - push to bottom
                print("   📉 Penalizing niche subtitle: \(releaseName) (Stream is standard)")
            }
        }

        return score
    }

    // MARK: - Helpers (Copied from StreamRoutes)

    private func determineQualityBucket(_ quality: String) -> String {
        let q = quality.lowercased()
        if q.contains("2160p") { return "2160p" }
        if q.contains("1080p") { return "1080p" }
        if q.contains("720p") { return "720p" }
        return "480p"
    }

    private func processBucket(
        _ streams: [Stream],
        minSeeders: Int,
        quality: String,
        year: String?,
        targetTitle: String?,
        preferMultiSubPacksFirst: Bool,
        preferMultiSubMovies: Bool,
        excludedHashes: Set<String>
    ) -> QualityBucket {

        print("   --- Processing Bucket: \(quality) (Input: \(streams.count)) ---")

        // Filter out bad patterns (redundant but safe)
        // Note: Removed x265/hevc from here to allow StreamService to decide

        // FIX: Use stricter matching for bad patterns to avoid frequent false positives
        // REMOVED: Hard filtering of 'bad patterns' (CAM, TS, etc.)
        // We now allow these as last resorts but penalize them heavily in sorting logic below.
        
        var filtered = streams.filter { stream in
             // Check EXCLUDED hashes (Smart Retry)
             if let hash = stream.infoHash, excludedHashes.contains(hash) {
                 print("   🧠 RESOLVER DROP (\(quality)): Previously Attempted: \(stream.title)")
                 return false
             }

             let titleLower = stream.title.lowercased()

             // Special check for ISO files (word boundary or file extension only)
             // This prevents false positives like "Pr(iso)ner"
             let isoRegex = try? NSRegularExpression(pattern: "\\biso\\b|\\.iso$")
             let range = NSRange(location: 0, length: titleLower.utf16.count)
             if isoRegex?.firstMatch(in: titleLower, options: [], range: range) != nil {
                  print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern (ISO): \(stream.title)")
                  return false
             }

            return true
        }

        // Sort
        // Sort
        filtered.sort { s1, s2 in
            func getScore(_ stream: Stream) -> Int {
                var score = 0
                let title = stream.title.lowercased()

                if let target = targetTitle {
                    let matchScore = calculateTitleMatchScore(streamTitle: stream.title, targetTitle: target)
                    score += matchScore
                }

                // 0.5. Direct URL Boost (Instant Playback)
                // Prioritize DebridSearch/Direct streams over Torrents that need unlocking
                if let url = stream.url, (url.hasPrefix("http") || url.hasPrefix("https")) {
                    score += 100
                }

                // 1. Explicit English (Highest Priority)
                let englishIndicators = ["english", ".eng.", " eng ", "-eng-"]
                let hasEnglish = englishIndicators.contains(where: { title.contains($0) })
                if hasEnglish {
                    score += 20
                }

                // 2. Web Sources (High probability of embedded subs)
                let webSources = ["hulu", "netflix", "nf", "amazon", "amzn", "dsnp", "disney", "hbo", "max"]
                if webSources.contains(where: { title.contains($0) }) {
                   score += 15
                }

                // 3. Subtitle Indicators (Explicit embedded subs)
                let subIndicators = ["sub eng", "eng sub", "sub english", "emb sub", "subbed", "multisub", "multi-sub", "softcoded", "msubs", "msub"]
                if subIndicators.contains(where: { title.contains($0) }) {
                    score += 40 // Major boost
                }

                // 4. Reputable Scene Groups (Boost)
                // Includes high-quality P2P groups (LoRD, DON, Wiki) known for reliable embedded subs
                // REMOVED: YTS/MX (often contain gambling watermarks)
                let goodGroups = ["lord", "don", "wiki", "tayto", "sartre", "ctrlhd", "ntb", "flux", "galaxyrg", "rarbg", "qxr", "mzabi"]
                if goodGroups.contains(where: { title.contains($0) }) {
                    score += 25 // Increased boost for quality groups
                }

                // 4b. Filter out Gambling Watermarks (YTS/YIFY)
                // These releases often contain hardcoded 1xBet ads. We penalize them heavily so they are only used as last resort.
                let adGroups = ["yts", "mx", "yify"]
                if adGroups.contains(where: { title.contains($0) }) {
                    score -= 2000 // Heavy penalty to push to bottom
                    print("   📉 Penalizing Ad-Supported Release (YTS): \(stream.title)")
                }

                // 5. "MULTi" Handling
                // Only penalize if we don't have explicit English indication
                if title.contains("multi") {
                    if hasEnglish {
                        // Multi + English usually means good quality release with multiple audio/subs
                        score += 5
                    } else {
                         // Multi without explicit English might default to foreign audio
                        score -= 10
                    }
                }
                
                // 6. CAM / TS Penalty (Last Resort)
                // We want these allowed but ALWAYS at the bottom
                // Use strict regex for CAM/TS to avoid false positives
                let badPatterns = ["telesync", "hdcam", "hdtc", "dvdscr", "screener"]
                if badPatterns.contains(where: { title.contains($0) }) {
                     score -= 5000 // Massive penalty
                } else {
                     // Regex checks for tricky ones
                     let camRegex = try? NSRegularExpression(pattern: "\\bcam\\b")
                     let tsRegex = try? NSRegularExpression(pattern: "\\bts\\b|\\.ts$")
                     let range = NSRange(location: 0, length: title.utf16.count)
                     
                     if camRegex?.firstMatch(in: title, options: [], range: range) != nil {
                         score -= 5000
                     } else if tsRegex?.firstMatch(in: title, options: [], range: range) != nil {
                         score -= 5000
                     }
                }

                // 7. 10-bit Penalty (Compatibility mode)
                // Deprioritize 10-bit streams to ensure better compatibility with older hardware
                // unless explicitly preferred (which this resolver logic assumes general case)
                let tenBitTerms = ["10bit", "10-bit", "10 bit", "hi10p"]
                if tenBitTerms.contains(where: { title.contains($0) }) {
                    score -= 2000 // Significant penalty (below normal streams, but above CAM)
                } 


                return score
            }

            let score1 = getScore(s1)
            let score2 = getScore(s2)

            if score1 != score2 {
                return score1 > score2
            }

            // Fallback to Seeders
            let seeders1 = s1.seeders ?? 0
            let seeders2 = s2.seeders ?? 0
            return seeders1 > seeders2
        }

        // Seeder filter (skipped for cached streams and RD direct URLs)
        filtered = filtered.filter { stream in
            // Skip seeder check for cached streams (⚡) or streams with direct URLs (RD instant)
            if stream.title.contains("⚡") { return true }
            if stream.url != nil { return true } // RD-cached streams have direct URLs, no seeder count
            let hasSeeders = (stream.seeders ?? 0) >= minSeeders
            if !hasSeeders {
                print("   🚫 RESOLVER DROP (\(quality)): Low Seeders (\(stream.seeders ?? 0)): \(stream.title)")
            }
            return hasSeeders
        }

        print("   ✅ Bucket \(quality) Final Count: \(filtered.count)")

        if filtered.isEmpty { return QualityBucket(primary: nil, alternates: nil) }

        // Select primary
        let primary = filtered.first
        let alternates = Array(filtered.dropFirst().prefix(10))

        return QualityBucket(primary: primary, alternates: alternates)
    }

    private func parseAllowedYears(_ yearString: String) -> [String] {
        // Allow Year AND Year + 1 (for physical releases that come out later)
        if let year = Int(yearString) {
             return ["\(year)", "\(year + 1)"]
        }
        return []
    }

    private func extractYearsFromTitle(_ title: String) -> [String] {
        // Simplified
        let regex = try? NSRegularExpression(pattern: "(19|20)\\d{2}")
        let range = NSRange(location: 0, length: title.utf16.count)
        let matches = regex?.matches(in: title, range: range) ?? []
        return matches.compactMap {
            guard let r = Range($0.range, in: title) else { return nil }
            return String(title[r])
        }
    }

    private func streamTitleContainsYear(_ title: String, targetYears: [String]) -> Bool {
        return targetYears.contains { title.contains($0) }
    }

    private func getExtendedSearchText(for stream: Stream) -> String {
        var text = stream.title
        
        if let filename = stream.behaviorHints?.filename {
            text += " " + filename
        } else if let urlStr = stream.url, !urlStr.lowercased().hasPrefix("magnet:") {
             // Fallback: Check URL for filename (e.g. Debrid links)
             // Strip query parameters
             let path = urlStr.components(separatedBy: "?").first ?? urlStr
             if let urlFilename = path.components(separatedBy: "/").last {
                text += " " + urlFilename
             }
        }
        
        return text.lowercased()
    }

    private func hasAcceptableAudioLanguage(_ title: String, targetTitle: String? = nil) -> Bool {
        let lower = title.lowercased()

        // 0. Explicit Whitelist for known Multi-Audio groups
        // 'Alusia' releases always include original audio + local dub
        if lower.contains("alusia") { return true }
        
        // 0.1. Allow CAM/Screener streams (User request: last resort fallback, even if dubbed/foreign)
        let camKeywords = ["camrip", "cam-rip", "cam rip", "hdcam", "hd-cam", "screener", "dvdscr", "telesync", "hdtc"]
        // Check strict "cam" separately to avoid false positives
        let isSimpleCam = lower.contains(".cam.") || lower.contains(" cam ") || lower.contains("-cam-") || lower.hasSuffix(".cam")
        
        if isSimpleCam || camKeywords.contains(where: { lower.contains($0) }) {
            // It's a CAM! Allow it regardless of language.
            return true
        }

        // 1. Check if explicitly marked as English FIRST
        // Use strict matching for short codes to avoid false positives (e.g. "Fr-en-ch" matching "en")
        let hasEnglish = lower.contains("english") ||
                        lower.contains(".eng.") || lower.contains(" eng ") || lower.contains("-eng-") || lower.hasSuffix(".eng") ||
                        lower.contains(".en.") || lower.contains(" en ") || lower.contains("-en-") || lower.hasSuffix(".en")
        if hasEnglish { return true }

        // 2. Explicit foreign language indicators (primary audio is NOT English)
        
        let targetLower = targetTitle?.lowercased() ?? ""
        
        let foreignKeywords = [
             "french", "german", "spanish", "latino", "castellano", "italian", "portuguese",
             "dublado", "doblado", "doblada", "doppiato", "doublé", "dablyazh", "russian",
             "japanese", "korean", "chinese", "国粤", "中文字幕", "韓文", "polish", "lektor", "polski",
             "swha"
        ]
        
        // Special case for Polish flag patterns
        let polishFlags = [" pl ", "-pl-", ".pl."]

        let isForeign = foreignKeywords.contains { kw in
             if lower.contains(kw) {
                 // Optimization: If the keyword is in the movie title (e.g. "Italian Job"), ignore it
                 if !targetLower.isEmpty && targetLower.contains(kw) {
                     return false
                 }
                 return true
             }
             return false
        } || polishFlags.contains { lower.contains($0) }

        // Check for Multi/Dual audio
        // Moved up to allow exceptions for Russian Multi releases
        let isMulti = lower.contains("multi") || lower.contains("dual")

        // Block "Rus" ONLY if it's NOT a Multi release
        // (Many high quality P2P releases are Multi + include Rus)
        let isRussian = lower.contains(" rus ") || lower.contains(".rus.") || lower.contains("-rus-") || lower.contains("rudub")
        if isRussian && !isMulti {
            return false
        }
        
        if isForeign { return false }

        // 3. French-specific audio indicators (VF = Version Française)
        let frenchAudioIndicators = [
            " vf ", ".vf.", "-vf-", "_vf_",  // Version Française
            " vff ", ".vff.", "-vff-",         // Version Française Française
            " vfq ", ".vfq.", "-vfq-",         // Version Française Québécoise
            " vf2 ", ".vf2.", "-vf2-",         // Version Française 2
            "vostfr",                             // Version Originale Sous-Titrée FRançais
            "truefrench",                         // TrueFrench (French audio)
            "rififi",                             // Known French release group
            "fidelio"                             // Known French release group
        ]
        let hasFrenchAudio = frenchAudioIndicators.contains { lower.contains($0) }

        // If it has French audio indicators, block it
        if hasFrenchAudio { return false }

        // Block explicit foreign languages next
        if isForeign { return false }

        // 4. THEN allow Multi/Dual if it wasn't already blocked as foreign
        // (Calculated above: isMulti)
        if isMulti { return true }

        // Block "DUB" releases if they aren't marked as English/Multi
        // "DUB" usually implies dubbing into a non-English language (for English movies)
        // or just "Dubbed" without specifying English (risky)
        // EXCEPTION: "Dubbed" is sometimes used for English dubs of foreign content, but here we assume English content.
        let isDubbed = lower.contains(".dub.") || lower.contains(" dub ") || lower.contains("-dub-") || lower.hasSuffix("-dub") || lower.hasSuffix(".dub")
        if isDubbed { return false }

        // 5. Block Hardcoded Foreign Subtitles
        // These are streams with burned-in subtitles for other languages
        let isHardcodedForeign = lower.contains("plsubbed") || // Polish Subbed
                                lower.contains("korsub") ||   // Korean Subbed
                                lower.contains("hcsub") ||    // Hardcoded Sub (Generic)
                                lower.contains("hc") && (lower.contains("kor") || lower.contains("chi") || lower.contains("vie")) // Hardcoded specific

        if isHardcodedForeign { return false }

        return true // Default to true if unknown
    }

    private func getAudioLanguageDescription(_ title: String) -> String {
        return "Audio" // Simplified
    }

    // MARK: - Title Matching Helpers
    
    private func calculateTitleMatchScore(streamTitle: String, targetTitle: String) -> Int {
        let sTitle = cleanTitleForMatching(streamTitle)
        let tTitle = cleanTitleForMatching(targetTitle)
        
        // 1. Exact Match (Highest honors)
        // e.g. "Contact" == "Contact"
        if sTitle == tTitle {
            return 1000
        }
        
        // 2. Exact start (Very good)
        // e.g. "Contact 1997..." starts with "Contact"
        // We look for "Target + Space" or just "Target" to avoid partial word matches like "Contacting"
        if sTitle.hasPrefix(tTitle + " ") || sTitle == tTitle {
            return 500
        }
        
        // 3. Containment with delimiters (Good)
        // e.g. "The Contact" contains " Contact "
        if sTitle.contains(" " + tTitle + " ") {
            // Check for contaminating prefixes like "The"
            // If the stream is "The Contact" and target is "Contact", this is likely a different movie
            // We penalize based on extra length to favor the most concise match mechanism
            return 100
        }
        
        // 4. Fuzzy / Partial (Neutral)
        return 0
    }
    
    private func cleanTitleForMatching(_ text: String) -> String {
        return text.lowercased()
            // Replace dots/underscores with spaces
            .replacingOccurrences(of: ".", with: " ")
            .replacingOccurrences(of: "_", with: " ")
            // Simplify to alphanumerics
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined(separator: " ")
            // Normalize spaces
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            // Regex to condense multiple spaces
            .replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
    }
}
