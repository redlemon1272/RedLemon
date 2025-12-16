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
        year: String? = nil,
        ignoreVerified: Bool = false
    ) async throws -> QualityBucketsResponse {
        NSLog("⚡️ StreamResolver: Resolving streams for \(imdbId) (S\(season ?? 0)E\(episode ?? 0))")
        if let year = year {
            NSLog("   📅 Filtering by year: \(year)")
        }

        // Fetch all streams from providers
        // Note: ProviderManager is a singleton, accessible here

        // MARK: - Verified Stream Short-Circuit
        
        var verifiedStream: SupabaseClient.VerifiedStream?
        if !ignoreVerified {
             verifiedStream = try? await SupabaseClient.shared.getVerifiedStream(imdbId: imdbId, quality: "1080p")
        }
        
        if let verified = verifiedStream, let hash = verified.streamHash as String?, !hash.isEmpty {
            
            // Check Guardrail: Soft Decay
            let isStale: Bool
            if let lastVerified = verified.lastVerifiedAt {
                let daysSince = Date().timeIntervalSince(lastVerified) / 86400
                isStale = daysSince > 30
            } else {
                isStale = false
            }
            
            if isStale {
                print("⚠️ StreamResolver: Verified stream is STALE (>30 days). Will verify cache status strictly.")
            } else {
                print("⚡️ StreamResolver: Found Community Verified stream with \(verified.voteCount) votes!")
            }
            
            // Reconstruct a strict stream object
            let candidateStream = Stream(
                url: verified.magnetLink,
                title: "Community Verified Stream (1080p)", 
                quality: "1080p", 
                seeders: 9999, 
                size: "0 GB", // Unknown, but trusted
                provider: "verified", 
                infoHash: verified.streamHash
            )
            
            // Check cache status quickly via RealDebrid (unlock) or just return it if we are confident?
            // Safer to return it and let StreamService handle the unlocking/fallback if it fails.
            // But to return it "instantly" we need to put it in a bucket.
            
            let bucket = QualityBucket(primary: candidateStream, alternates: [])
            
            // If satisfied, we can return early!
            // But we requested "buckets", so verify if we need to return ALL buckets or just the best one?
            // The caller (StreamService) will pick the requested quality.
            // If we only return 1080p, and user wants 4K, we might fail?
            // For now, let's ONLY short circuit if we match the likely requested quality.
            
            // Actually, let's just return this in the 1080p bucket and empty the others.
            // If the user wants 4K, they will be disappointed if we return empty 4K bucket.
            // So we should probably CONTINUE to scrape if we can't fulfill the user's dream?
            // BUT the whole point is "Faster". 
            
            // Compromise: If we found a verified 1080p stream, we return it as the 1080p primary.
            // We still scrape, or skip? 
            // The prompt says "drastically speed up".
            // So we should RETURN immediately.
            
            print("⚡️ StreamResolver: SHORT CIRCUIT - Returning verified stream immediately.")
            return QualityBucketsResponse(buckets: QualityBuckets(
                uhd4k: QualityBucket(primary: nil, alternates: nil),
                fullHD: bucket,
                hd: QualityBucket(primary: nil, alternates: nil),
                sd: QualityBucket(primary: nil, alternates: nil)
            ))
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

        // Filter by year if provided
        if let year = year {
            let allowedYears = parseAllowedYears(year)
            if allowedYears.isEmpty {
                print("   ⚠️ Year string '\(year)' could not be parsed; skipping year filter")
            } else {
                let beforeCount = filteredStreams.count
                filteredStreams = filteredStreams.filter { stream in
                    // Movies: keep only streams whose titles include the exact year
                    if type == "movie" {
                        guard let targetYear = allowedYears.first else { return true }
                        return streamTitleContainsYear(stream.title, targetYears: [targetYear])
                    }

                    // Series: drop streams that explicitly mention a conflicting year
                    if allowedYears.isEmpty { return true }
                    let yearsInTitle = extractYearsFromTitle(stream.title)

                    // If no year is present, keep it (common for TV episode releases)
                    guard !yearsInTitle.isEmpty else { return true }

                    let hasAllowedYear = yearsInTitle.contains { allowedYears.contains($0) }
                    if !hasAllowedYear {
                        print("   🚫 RESOLVER BLOCKING wrong-year series stream: \(stream.title) (years: \(yearsInTitle.joined(separator: ",")))")
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

        // CRITICAL: Filter "Bad Groups"
        let beforeBadGroupFilter = filteredStreams.count
        let badGroups = ["tamilmv", "1tamilmv", "tamilrockers"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
            let isBadGroup = badGroups.contains { group in
                titleLower.contains(group)
            }
            if isBadGroup {
                print("   🚫 RESOLVER BLOCKING Bad Group: \(stream.title)")
            }
            return !isBadGroup
        }
        if filteredStreams.count < beforeBadGroupFilter {
            print("   🚫 RESOLVER FILTERED Bad Groups: \(beforeBadGroupFilter) → \(filteredStreams.count) streams")
        }

        // CRITICAL: Filter MPEG-2 / REMUX streams
        let beforeMpeg2Filter = filteredStreams.count
        let mpeg2Terms = ["mpeg-2", "mpeg2", "dvd5", "dvd9"]
        filteredStreams = filteredStreams.filter { stream in
            let titleLower = stream.title.lowercased()
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
            let titleLower = stream.title.lowercased()
            
            // Check implicit 3D ("3d" surrounded by delimiters)
            if titleLower.contains(".3d.") || titleLower.contains(" 3d ") || titleLower.contains("-3d-") || titleLower.hasSuffix(".3d") || titleLower.hasSuffix(" 3d") {
                 print("   🚫 RESOLVER BLOCKING 3D (Strict): \(stream.title)")
                 return false
            }
            
            let is3D = threeDFormats.contains { format in
                titleLower.contains(format)
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
            let hasAcceptableAudio = hasAcceptableAudioLanguage(stream.title)
            if !hasAcceptableAudio {
                let audioDesc = getAudioLanguageDescription(stream.title)
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
            
            let episodePatterns = [
                String(format: "s%02de%02d", season!, episode!),  // s01e01
                String(format: "s%de%d", season!, episode!),      // s1e1
                String(format: "s%02d e%02d", season!, episode!), // s01 e01
                String(format: "%dx%02d", season!, episode!),     // 1x01
                String(format: "season %d episode %d", season!, episode!) // season 1 episode 1
            ]

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
        let streamsWithSubtitles = await attachSubtitles(to: filteredStreams, imdbId: imdbId, type: type, season: season, episode: episode)

        // Partition into quality buckets
        var buckets: [String: [Stream]] = ["2160p": [], "1080p": [], "720p": [], "480p": []]
        for stream in streamsWithSubtitles {
            let bucket = determineQualityBucket(stream.quality ?? "")
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

        let uhd4kBucket = processBucket(buckets["2160p"] ?? [], minSeeders: 1, quality: "2160p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies)
        let fullHDBucket = processBucket(buckets["1080p"] ?? [], minSeeders: 1, quality: "1080p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies)
        let hdBucket = processBucket(buckets["720p"] ?? [], minSeeders: 1, quality: "720p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies)
        let sdBucket = processBucket(buckets["480p"] ?? [], minSeeders: 1, quality: "480p", year: year, targetTitle: targetTitle, preferMultiSubPacksFirst: preferPackPrimary, preferMultiSubMovies: preferMultiSubMovies)

        // Log final primary selections
        if let primary = uhd4kBucket.primary { print("📦 2160p Primary: \(primary.title)") }
        if let primary = fullHDBucket.primary { print("📦 1080p Primary: \(primary.title)") }
        if let primary = hdBucket.primary { print("📦 720p Primary: \(primary.title)") }

        print("✅ StreamResolver: Quality buckets ready")

        return QualityBucketsResponse(buckets: QualityBuckets(
            uhd4k: uhd4kBucket,
            fullHD: fullHDBucket,
            hd: hdBucket,
            sd: sdBucket
        ))
    }
    
    // MARK: - Subtitle Attachment Copy
    // Note: Copied from StreamRoutes logic to be standalone
    
    private func attachSubtitles(to streams: [Stream], imdbId: String, type: String, season: Int? = nil, episode: Int? = nil) async -> [Stream] {
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
        preferMultiSubMovies: Bool
    ) -> QualityBucket {
        
        print("   --- Processing Bucket: \(quality) (Input: \(streams.count)) ---")
        
        // Filter out bad patterns (redundant but safe)
        // Note: Removed x265/hevc from here to allow StreamService to decide
        
        // FIX: Use stricter matching for bad patterns to avoid frequent false positives
        // e.g. "ts" matching "Nigh(ts)" or "iso" matching "Pr(iso)ner"
        let badPatterns = ["cam", "telesync", "hdcam", "hdtc", "dvdscr", "screener"]
        
        var filtered = streams.filter { stream in
             let titleLower = stream.title.lowercased()
             
             // Check against bad terms
             for pattern in badPatterns {
                 if titleLower.contains(pattern) {
                     // Extra check for "cam" to avoid matching "webcam" or "camera"
                     if pattern == "cam" {
                         let regex = try? NSRegularExpression(pattern: "\\bcam\\b")
                         let range = NSRange(location: 0, length: titleLower.utf16.count)
                         if let match = regex?.firstMatch(in: titleLower, options: [], range: range) {
                             print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern (Strict): \(stream.title)")
                             return false
                         }
                         continue // Contains "cam" but not as a word, so it's safe (e.g. "came")
                     }
                     
                     print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern: \(stream.title)")
                     return false
                 }
             }
             
             // Special check for ISO files (word boundary or file extension only)
             // This prevents false positives like "Pr(iso)ner"
             let isoRegex = try? NSRegularExpression(pattern: "\\biso\\b|\\.iso$")
             let range = NSRange(location: 0, length: titleLower.utf16.count)
             if let match = isoRegex?.firstMatch(in: titleLower, options: [], range: range) {
                  print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern (ISO): \(stream.title)")
                  return false
             }
             
             // Special check for TS files (word boundary or file extension only)
             // This prevents false positives like "Nigh(ts) at Freddy's"
             let tsRegex = try? NSRegularExpression(pattern: "\\bts\\b|\\.ts$")
             if let match = tsRegex?.firstMatch(in: titleLower, options: [], range: range) {
                  print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern (TS): \(stream.title)")
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
                let subIndicators = ["sub eng", "eng sub", "sub english", "emb sub", "subbed", "multisub", "multi-sub", "softcoded"]
                if subIndicators.contains(where: { title.contains($0) }) {
                    score += 40 // Major boost
                }
                
                // 4. Reputable Scene Groups (Boost)
                // Includes high-quality P2P groups (LoRD, DON, Wiki) known for reliable embedded subs
                let goodGroups = ["lord", "don", "wiki", "tayto", "sartre", "ctrlhd", "ntb", "flux", "galaxyrg", "rarbg", "yts", "mx", "qxr", "mzabi"]
                if goodGroups.contains(where: { title.contains($0) }) {
                    score += 25 // Increased boost for quality groups
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
        
        // Seeder filter (skipped for cached)
        filtered = filtered.filter { stream in
            if stream.title.contains("⚡") { return true }
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
        // Simplified parser
        if let year = Int(yearString) { return ["\(year)"] }
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

    private func hasAcceptableAudioLanguage(_ title: String) -> Bool {
        let lower = title.lowercased()
        
        // 1. Check if explicitly marked as English FIRST
        // Use strict matching for short codes to avoid false positives (e.g. "Fr-en-ch" matching "en")
        let hasEnglish = lower.contains("english") || 
                        lower.contains(".eng.") || lower.contains(" eng ") || lower.contains("-eng-") || lower.hasSuffix(".eng") ||
                        lower.contains(".en.") || lower.contains(" en ") || lower.contains("-en-") || lower.hasSuffix(".en")
        if hasEnglish { return true }
        
        // 2. Explicit foreign language indicators (primary audio is NOT English)
        let isForeign = lower.contains("french") || 
                       lower.contains("german") || 
                       lower.contains("spanish") || 
                       lower.contains("italian") || 
                       lower.contains("portuguese") || 
                       lower.contains("dublado") ||  // Portuguese: dubbed
                       lower.contains("doblado") ||  // Spanish: dubbed (masculine)
                       lower.contains("doblada") ||  // Spanish: dubbed (feminine)
                       lower.contains("doppiato") || // Italian: dubbed
                       lower.contains("doublé") ||   // French: doubled/dubbed
                       lower.contains("dablyazh") || // Russian: dubbing (romanized)
                       lower.contains("russian") || 
                       lower.contains("japanese") || 
                       lower.contains("korean") || 
                       lower.contains("chinese") || 
                       lower.contains("国粤") || // Mandarin/Cantonese
                       lower.contains("中文字幕") || // Chinese Subs
                       lower.contains("韓文") // Korean
        
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
        let isMulti = lower.contains("multi") || lower.contains("dual")
        if isMulti { return true }
        
        // Block "DUB" releases if they aren't marked as English/Multi
        // "DUB" usually implies dubbing into a non-English language (for English movies) 
        // or just "Dubbed" without specifying English (risky)
        let isDubbed = lower.contains(".dub.") || lower.contains(" dub ") || lower.contains("-dub-") || lower.hasSuffix("-dub") || lower.hasSuffix(".dub")
        if isDubbed { return false }
        
        return true // Default to true if unknown
    }
    
    private func getAudioLanguageDescription(_ title: String) -> String {
        return "Audio" // Simplified
    }
}
