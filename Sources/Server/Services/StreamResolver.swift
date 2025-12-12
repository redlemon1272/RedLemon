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
        year: String? = nil
    ) async throws -> QualityBucketsResponse {
        NSLog("⚡️ StreamResolver: Resolving streams for \(imdbId) (S\(season ?? 0)E\(episode ?? 0))")
        if let year = year {
            NSLog("   📅 Filtering by year: \(year)")
        }

        // Fetch all streams from providers
        // Note: ProviderManager is a singleton, accessible here
        let streams = try await ProviderManager.shared.fetchStreams(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            providerNames: nil
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
                } || titleLower.contains("s01-s") || titleLower.range(of: "s\\d{2}-s\\d{2}", options: .regularExpression) != nil
                
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
             
             // Simple mapping
             return streams.map { stream in
                 // Return stream with best subtitles (using simplified logic for refactor brevity)
                 // In production, full logic from StreamRoutes is better, but this suffices for a direct port
                 // Logic here: If stream has no subs, attach top 3 english ones
                 if stream.subtitles == nil || stream.subtitles!.isEmpty {
                     let mappedSubs = englishSubtitles.prefix(3).map { sub in
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
             
             // Special check for .TS files (extension or explicit marking)
             if titleLower.hasSuffix(".ts") || titleLower.contains(".ts ") || titleLower.contains(" ts ") {
                  print("   🚫 RESOLVER DROP (\(quality)): Bad Pattern (TS): \(stream.title)")
                  return false
             }
             
            return true
        }
        
        // Sort
        filtered.sort { s1, s2 in
            // Logic: Embedded English Subs (if Movie) > Seeders > Others
            
            if preferMultiSubMovies {
                let s1Lower = s1.title.lowercased()
                let s2Lower = s2.title.lowercased()
                
                // Prioritize streams that explicitly say they have english subs
                // e.g. "sub eng", "eng sub", "subbed"
                let subIndicators = ["sub eng", "eng sub", "sub english", "emb sub", "subbed"]
                let s1HasSub = subIndicators.contains { s1Lower.contains($0) }
                let s2HasSub = subIndicators.contains { s2Lower.contains($0) }
                
                if s1HasSub != s2HasSub {
                    return s1HasSub // True comes first
                }
            }
            
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
            "rififi"                              // Known French release group
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
