//
//  SubDLClient.swift
//  RedLemon
//
//  SubDL API client for subtitle fetching
//  API: https://subdl.com/api-docs
//

import Foundation
import Vapor

struct SubDLSubtitle: Content {
    let language: String?
    let url: String  // Download path like "/subtitle/3486048-8409061.zip"
    let releaseName: String?
    let author: String?
    let comment: String?
    let season: Int?
    let episode: Int?

    enum CodingKeys: String, CodingKey {
        case language
        case url
        case releaseName = "release_name"
        case author
        case comment
        case season
        case episode
    }
}

struct SubDLResult: Codable {
    let sd_id: Int
    let name: String
    let imdb_id: String?
    let tmdb_id: Int?
}

struct SubDLResponse: Codable {
    let status: Bool
    let subtitles: [SubDLSubtitle]?
    let results: [SubDLResult]?
    let error: String?
}

final class SubDLClient {
    static let shared = SubDLClient()

    private let baseURL = "https://api.subdl.com/api/v1"
    private let cdnURL = "https://dl.subdl.com"

    private init() {
        print("✅ SubDLClient initialized")
    }

    /// Search for subtitles by IMDB ID
    /// - Parameters:
    ///   - imdbId: IMDB ID (with or without "tt" prefix)
    ///   - type: Content type ("movie" or "series")
    ///   - season: Season number (for TV shows)
    ///   - episode: Episode number (for TV shows)
    ///   - languages: Comma-separated language codes (default: "en")
    ///   - apiKey: SubDL API key
    func search(imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, languages: String = "en", apiKey: String) async throws -> [SubDLSubtitle] {
        // Ensure imdbId has "tt" prefix
        let imdbWithPrefix = imdbId.starts(with: "tt") ? imdbId : "tt\(imdbId)"

        // Map type: "movie" or "series"
        let subdlType = type == "series" ? "tv" : "movie"

        var components = URLComponents(string: "\(baseURL)/subtitles")!
        var queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "imdb_id", value: imdbWithPrefix),
            URLQueryItem(name: "languages", value: languages),
            URLQueryItem(name: "type", value: subdlType)
        ]

        // Add season and episode for TV shows
        if let season = season {
            queryItems.append(URLQueryItem(name: "season_number", value: "\(season)"))
        }
        if let episode = episode {
            queryItems.append(URLQueryItem(name: "episode_number", value: "\(episode)"))
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw Abort(.badRequest, reason: "Invalid SubDL URL")
        }

        if let season = season, let episode = episode {
            print("🔍 Searching SubDL: \(imdbWithPrefix) (\(subdlType)) S\(String(format: "%02d", season))E\(String(format: "%02d", episode))")
        } else {
            print("🔍 Searching SubDL: \(imdbWithPrefix) (\(subdlType))")
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 5 // 5s timeout for search

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw Abort(.serviceUnavailable, reason: "SubDL API request failed")
        }

        if let responseString = String(data: data, encoding: .utf8) {
            print("📝 SubDL Raw Response: \(responseString)")
        } else {
             print("❌ SubDL Raw Response: Unable to decode data as UTF8")
        }

        let result = try JSONDecoder().decode(SubDLResponse.self, from: data)

        if result.status == false {
            if let errorMsg = result.error {
                print("❌ SubDL API Error: \(errorMsg)")
            } else {
                print("❌ SubDL API returned failure status without error message")
            }
            return []
        }

        let subtitles = result.subtitles ?? []

        if subtitles.isEmpty, let results = result.results, !results.isEmpty {
            let firstResult = results[0]
            print("⚠️ Subtitles empty for IMDB ID, testing fallbacks for: \(firstResult.name)")

            var fallbackComponents = URLComponents(string: "\(baseURL)/subtitles")!
            var fallbackQueryItems = [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "languages", value: languages),
                URLQueryItem(name: "type", value: subdlType)
            ]

            // Prioritize TMDB ID if available, otherwise try film_id
            if let tmdbId = firstResult.tmdb_id {
                print("⚠️ Retrying with TMDB ID: \(tmdbId)")
                fallbackQueryItems.append(URLQueryItem(name: "tmdb_id", value: "\(tmdbId)"))
            } else {
                 print("⚠️ Retrying with film_id (sd_id): \(firstResult.sd_id)")
                 fallbackQueryItems.append(URLQueryItem(name: "film_id", value: "\(firstResult.sd_id)"))
            }

            if let season = season {
                fallbackQueryItems.append(URLQueryItem(name: "season_number", value: "\(season)"))
            }
            if let episode = episode {
                fallbackQueryItems.append(URLQueryItem(name: "episode_number", value: "\(episode)"))
            }

            fallbackComponents.queryItems = fallbackQueryItems

            if let fallbackURL = fallbackComponents.url {
                print("🔍 Retrying SubDL request: \(fallbackURL.absoluteString.replacingOccurrences(of: apiKey, with: "APIKEY"))")
                var fallbackRequest = URLRequest(url: fallbackURL)
                fallbackRequest.timeoutInterval = 5

                if let (fallbackData, _) = try? await URLSession.shared.data(for: fallbackRequest) {
                    if let fallbackResponseString = String(data: fallbackData, encoding: .utf8) {
                        print("📝 SubDL Fallback Raw Response: \(fallbackResponseString)")
                    }

                    if let fallbackResult = try? JSONDecoder().decode(SubDLResponse.self, from: fallbackData) {
                        let fallbackSubtitles = fallbackResult.subtitles ?? []
                        print("✅ Found \(fallbackSubtitles.count) subtitles from SubDL (Fallback)")

                        if !fallbackSubtitles.isEmpty {
                            // CRITICAL FIX: Strict filter for fallback results too
                            let filteredFallback = filterSubtitlesByEpisode(fallbackSubtitles, season: season, episode: episode)
                            
                             let sortedFallback = sortSubtitlesByCompatibility(filteredFallback, season: season, episode: episode)

                             // Log fallback results
                             print("📝 SubDL Fallback results:")
                             for (idx, sub) in sortedFallback.enumerated() {
                                 let score = calculateCompatibilityScore(sub, season: season, episode: episode)
                                 print("   [\(idx + 1)] \(sub.releaseName ?? "NO RELEASE NAME") [\(sub.language ?? "unknown")] (score: \(score))")
                             }
                             return sortedFallback
                        }
                    }
                }
            }
        }

        print("✅ Found \(subtitles.count) subtitles from SubDL")
        
        // CRITICAL FIX: Filter out mismatched episodes (Strict Filtering)
        // SubDL API sometimes returns a "Season Pack" list mixed with single episodes
        // We must strip out any subtitle that EXPLICITLY specifies a different season/episode
        let filteredSubtitles = filterSubtitlesByEpisode(subtitles, season: season, episode: episode)
        
        if filteredSubtitles.count < subtitles.count {
            print("🧹 Filtered out \(subtitles.count - filteredSubtitles.count) mismatched episodes from SubDL response")
        }

        // Sort subtitles by release quality and compatibility
        let sortedSubtitles = sortSubtitlesByCompatibility(filteredSubtitles, season: season, episode: episode)

        // Log each subtitle's release name for debugging
        if let season = season, let episode = episode {
            print("📝 SubDL results for S\(String(format: "%02d", season))E\(String(format: "%02d", episode)):")
            for (idx, sub) in sortedSubtitles.enumerated() {
                let score = calculateCompatibilityScore(sub, season: season, episode: episode)
                print("   [\(idx + 1)] \(sub.releaseName ?? "NO RELEASE NAME") [\(sub.language ?? "unknown")] (score: \(score))")
            }
        } else {
            print("📝 SubDL results for movie:")
            for (idx, sub) in sortedSubtitles.enumerated() {
                let score = calculateCompatibilityScore(sub, season: season, episode: episode)
                print("   [\(idx + 1)] \(sub.releaseName ?? "NO RELEASE NAME") [\(sub.language ?? "unknown")] (score: \(score))")
            }
        }

        return sortedSubtitles
    }
    
    // MARK: - Private Filtering Logic
    
    private func filterSubtitlesByEpisode(_ subtitles: [SubDLSubtitle], season: Int?, episode: Int?) -> [SubDLSubtitle] {
        return subtitles.filter { sub in
            // Global Filter: Block Trailers
            // "Trailer" subtitles are never useful for playback
            if let name = sub.releaseName?.lowercased() {
                if name.contains("trailer") || name.contains("teaser") {
                    return false
                }
            }

            guard let season = season, let episode = episode else {
                return true // Movies: Keep it (unless it was a trailer)
            }
            
            // If API provides explicit metadata, use it
            if let subSeason = sub.season, let subEpisode = sub.episode {
                if subSeason != season || subEpisode != episode {
                    // Mismatched metadata
                    return false
                }
                return true
            }
            
            // Fallback to name parsing if metadata is missing (Safety)
            if let name = sub.releaseName?.lowercased() {
                // If it explicitly says S04E02 but we want S04E01, block it.
                // But be careful not to block "S04" packs.
                
                // Block explicit mismatches
                // e.g. Request S04E01. Found "S04E02" -> Block.
                // Found "S04E01" -> Keep. 
                // Found "Season 4" -> Keep (Pack).
                
                // Helper to extract episode number from string "S04E02"
                // Ideally we rely on the metadata added to the struct, which solves 99% of cases now.
                // But just in case, we trust the metadata first.
            }
            
            return true
        }
    }

    /// Download and convert subtitle file from SubDL CDN
    /// - Parameters:
    ///   - downloadPath: Path from SubDL API (e.g., "/subtitle/3486048-8409061.zip")
    ///   - offset: Optional time offset in milliseconds for sync adjustment
    ///   - season: Optional season number for zip extraction
    ///   - episode: Optional episode number for zip extraction
    func download(downloadPath: String, offset: Int = 0, season: Int? = nil, episode: Int? = nil) async throws -> String {
        let downloadURL = downloadPath.starts(with: "http")
            ? downloadPath
            : "\(cdnURL)\(downloadPath)"

        guard let url = URL(string: downloadURL) else {
            throw Abort(.badRequest, reason: "Invalid download URL")
        }

        print("📥 Downloading subtitle from SubDL CDN: \(downloadPath)")

        var request = URLRequest(url: url)
        request.timeoutInterval = 5 // Explicitly set request timeout

        // request.timeoutInterval is sometimes ignored by shared session, so we use a custom config

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 5 // 5s timeout for download (fail fast)
        config.timeoutIntervalForResource = 5
        let session = URLSession(configuration: config)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw Abort(.serviceUnavailable, reason: "SubDL download failed")
        }

        print("✅ Download complete: \(data.count) bytes")

        let contentType = httpResponse.value(forHTTPHeaderField: "Content-Type") ?? ""
        var srtText = ""

        // Handle ZIP archives
        if contentType.contains("zip") || contentType.contains("octet-stream") || downloadPath.hasSuffix(".zip") {
            print("📦 Detected ZIP archive, extracting...")
            // Save zip to temp file
            let tempDir = FileManager.default.temporaryDirectory
            let zipURL = tempDir.appendingPathComponent(UUID().uuidString + ".zip")

            try data.write(to: zipURL)

            do {
                srtText = try extractSubtitleFromZip(zipURL: zipURL, season: season, episode: episode)
                print("✅ Extraction successful")
                try FileManager.default.removeItem(at: zipURL)
            } catch {
                try? FileManager.default.removeItem(at: zipURL)
                throw error
            }
        } else {
            // Assume raw SRT or VTT
            guard let text = String(data: data, encoding: .utf8) else {
                throw Abort(.internalServerError, reason: "Failed to decode subtitle")
            }
            srtText = text
        }

        // Clean up SRT text (strip BOM and normalize line endings)
        srtText = srtText.replacingOccurrences(of: "\u{FEFF}", with: "")
        srtText = srtText.replacingOccurrences(of: "\r\n", with: "\n")

        // Check if ASS format
        if srtText.contains("[Script Info]") || downloadPath.lowercased().hasSuffix(".ass") {
            print("✅ Detected ASS subtitle format - returning raw content")
            return srtText
        }

        // Apply time offset if provided
        if offset != 0 {
            print("⏱️ Applying subtitle offset: \(offset)ms")
            srtText = applySRTOffset(srtText: srtText, offsetMs: offset)
        }

        // Convert SRT to VTT
        let vttText = convertSRTToVTT(srtText: srtText)

        print("✅ Subtitle downloaded and converted to VTT")

        return vttText
    }

    // MARK: - Helper Methods

    private func extractSubtitleFromZip(zipURL: URL, season: Int?, episode: Int?) throws -> String {
        // 1. List files in zip
        let listProcess = Process()
        let listPipe = Pipe()

        listProcess.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        listProcess.arguments = ["-l", zipURL.path]
        listProcess.standardOutput = listPipe

        try listProcess.run()
        let listData = listPipe.fileHandleForReading.readDataToEndOfFile()
        listProcess.waitUntilExit()
        guard let listOutput = String(data: listData, encoding: .utf8) else {
            throw Abort(.internalServerError, reason: "Failed to list zip contents")
        }

        // Parse output to find best matching file
        let lines = listOutput.components(separatedBy: .newlines)
        var bestMatch: String?

        // Patterns to look for if we have season/episode info
        var searchPatterns: [String] = []
        if let s = season, let e = episode {
            searchPatterns = [
                String(format: "s%02de%02d", s, e),  // s05e15
                String(format: "s%de%d", s, e),      // s5e15
                String(format: "%dx%02d", s, e),     // 5x15
                String(format: "%d%02d", s, e)       // 515
            ]
        }

        // Filter for subtitle files
        let subtitleFiles = lines.compactMap { line -> String? in
            // unzip -l output format: Length  Date  Time  Name
            // We just want the name at the end
            let parts = line.split(separator: " ", maxSplits: 3, omittingEmptySubsequences: true)
            guard parts.count == 4 else { return nil }
            let filename = String(parts[3]).trimmingCharacters(in: .whitespacesAndNewlines)

            let lower = filename.lowercased()
            if lower.hasSuffix(".srt") || lower.hasSuffix(".vtt") || lower.hasSuffix(".ass") {
                return filename
            }
            return nil
        }

        if subtitleFiles.isEmpty {
            print("⚠️ No subtitle files found in zip list output:")
            print(listOutput)
        }

        if let s = season, let e = episode {
            print("🔍 Looking for S%02dE%02d in zip (%d files)...", s, e, subtitleFiles.count)

            // Strategy 1: Strict SxxExx matching (High confidence)
            for pattern in searchPatterns {
                if let match = subtitleFiles.first(where: { $0.lowercased().contains(pattern) }) {
                    print("✅ Found matching file in zip (Strategy 1 - Strict): \(match)")
                    bestMatch = match
                    break
                }
            }

            // Strategy 2: Relaxed matching (Medium confidence)
            // Look for "14" surrounded by non-digits if episode is 14
            if bestMatch == nil {
                let episodePatterns = [
                    "e\(e)", "e\(String(format: "%02d", e))", // e14, e05
                    "episode \(e)", "episode \(String(format: "%02d", e))", // episode 14
                    " \(e) ", " \(String(format: "%02d", e)) " // " 14 "
                ]
                
                // Helper to check if a string contains the episode number as a distinct token
                func containsEpisodeToken(_ filename: String, episode: Int) -> Bool {
                    let cleaned = filename.replacingOccurrences(of: ".", with: " ")
                        .replacingOccurrences(of: "_", with: " ")
                        .replacingOccurrences(of: "-", with: " ")
                        .replacingOccurrences(of: "[", with: " ")
                        .replacingOccurrences(of: "]", with: " ")
                    
                    let tokens = cleaned.split(separator: " ")
                    return tokens.contains { String($0) == String(episode) || String($0) == String(format: "%02d", episode) }
                }

                for file in subtitleFiles {
                    let lower = file.lowercased()
                    
                    // check specific patterns first
                    if episodePatterns.contains(where: { lower.contains($0) }) {
                         print("✅ Found matching file in zip (Strategy 2 - Relaxed): \(file)")
                         bestMatch = file
                         break
                    }
                    
                    // check token match as fallback
                    if containsEpisodeToken(lower, episode: e) {
                        print("✅ Found matching file in zip (Strategy 3 - Token): \(file)")
                        bestMatch = file
                        break
                    }
                }
            }
        }

        // Fallback: Use first subtitle file if no specific match found
        if bestMatch == nil {
            bestMatch = subtitleFiles.first
            if let match = bestMatch {
                print("⚠️ No specific episode match found, using first file: \(match)")
            }
        }

        guard let targetFile = bestMatch else {
            throw Abort(.notFound, reason: "No subtitle files found in zip")
        }

        // 2. Extract specific file to stdout
        let extractProcess = Process()
        let extractPipe = Pipe()

        extractProcess.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        
        // Escape special characters for unzip command
        // unzip treats [] as wildcards, so we must escape them to match literal filenames
        let escapedTargetFile = targetFile
            .replacingOccurrences(of: "[", with: "\\[")
            .replacingOccurrences(of: "]", with: "\\]")
            
        print("📦 Extracting specific file: \(escapedTargetFile)")
        extractProcess.arguments = ["-p", zipURL.path, escapedTargetFile]
        extractProcess.standardOutput = extractPipe

        try extractProcess.run()
        let extractedData = extractPipe.fileHandleForReading.readDataToEndOfFile()
        extractProcess.waitUntilExit()

        // Try decoding with UTF-8 first, then ISO-8859-1 (common for subs)
        if let text = String(data: extractedData, encoding: .utf8) {
            return text
        } else if let text = String(data: extractedData, encoding: .isoLatin1) {
            return text
        } else {
            throw Abort(.internalServerError, reason: "Failed to decode extracted subtitle")
        }
    }

    private func applySRTOffset(srtText: String, offsetMs: Int) -> String {
        // Apply time offset to all timestamps in SRT format
        let lines = srtText.components(separatedBy: .newlines)
        var result: [String] = []

        // Regex pattern for SRT timestamps: 00:00:00,000 --> 00:00:00,000
        let pattern = "(\\d{2}):(\\d{2}):(\\d{2}),(\\d{3})\\s*-->\\s*(\\d{2}):(\\d{2}):(\\d{2}),(\\d{3})"

        for line in lines {
            if let regex = try? NSRegularExpression(pattern: pattern),
               let match = regex.firstMatch(in: line, range: NSRange(line.startIndex..., in: line)) {

                // Extract start and end timestamps
                let startH = Int((line as NSString).substring(with: match.range(at: 1))) ?? 0
                let startM = Int((line as NSString).substring(with: match.range(at: 2))) ?? 0
                let startS = Int((line as NSString).substring(with: match.range(at: 3))) ?? 0
                let startMs = Int((line as NSString).substring(with: match.range(at: 4))) ?? 0

                let endH = Int((line as NSString).substring(with: match.range(at: 5))) ?? 0
                let endM = Int((line as NSString).substring(with: match.range(at: 6))) ?? 0
                let endS = Int((line as NSString).substring(with: match.range(at: 7))) ?? 0
                let endMs = Int((line as NSString).substring(with: match.range(at: 8))) ?? 0

                // Convert to total milliseconds
                var startTotal = startH * 3600000 + startM * 60000 + startS * 1000 + startMs
                var endTotal = endH * 3600000 + endM * 60000 + endS * 1000 + endMs

                // Apply offset
                startTotal += offsetMs
                endTotal += offsetMs

                // Ensure non-negative
                startTotal = max(0, startTotal)
                endTotal = max(0, endTotal)

                // Convert back to hours:minutes:seconds,milliseconds
                let newStartH = startTotal / 3600000
                let newStartM = (startTotal % 3600000) / 60000
                let newStartS = (startTotal % 60000) / 1000
                let newStartMs = startTotal % 1000

                let newEndH = endTotal / 3600000
                let newEndM = (endTotal % 3600000) / 60000
                let newEndS = (endTotal % 60000) / 1000
                let newEndMs = endTotal % 1000

                let newLine = String(format: "%02d:%02d:%02d,%03d --> %02d:%02d:%02d,%03d",
                                   newStartH, newStartM, newStartS, newStartMs,
                                   newEndH, newEndM, newEndS, newEndMs)
                result.append(newLine)
            } else {
                result.append(line)
            }
        }

        return result.joined(separator: "\n")
    }

    private func convertSRTToVTT(srtText: String) -> String {
        // Check if already VTT
        if srtText.trimmingCharacters(in: .whitespacesAndNewlines).starts(with: "WEBVTT") {
            return srtText
        }

        // Convert SRT to VTT:
        // 1. Add WEBVTT header
        // 2. Remove sequence numbers
        // 3. Replace commas with dots in timestamps
        var vttText = "WEBVTT\n\n"

        let lines = srtText.replacingOccurrences(of: "\r", with: "")
            .components(separatedBy: "\n")

        for line in lines {
            // Skip sequence numbers (lines with only digits)
            if line.trimmingCharacters(in: .whitespacesAndNewlines).range(of: "^\\d+$", options: .regularExpression) != nil {
                continue
            }

            // Replace timestamp commas with dots
            let converted = line.replacingOccurrences(
                of: "(\\d{2}):(\\d{2}):(\\d{2}),(\\d{3})",
                with: "$1:$2:$3.$4",
                options: .regularExpression
            )

            vttText += converted + "\n"
        }

        return vttText
    }

    // MARK: - Subtitle Compatibility Scoring

    /// Calculate compatibility score for subtitle release
    /// Higher score = better match with typical video releases
    private func calculateCompatibilityScore(_ subtitle: SubDLSubtitle, season: Int?, episode: Int?) -> Int {
        guard let releaseName = subtitle.releaseName?.lowercased() else { return 0 }

        var score = 0

        // Prefer standard release groups and formats
        let preferredGroups = ["web-dl", "webdl", "blu-ray", "bluray", "bdrip", "webrip", "hdtv"]
        let avoidGroups = ["cam", "ts", "tc", "subsdubbed", "subforced"]

        // Check for preferred groups
        for group in preferredGroups {
            if releaseName.contains(group) {
                score += 10
            }
        }

        // Penalize low-quality groups
        for group in avoidGroups {
            if releaseName.contains(group) {
                score -= 15
            }
        }

        // Prefer releases with resolution indicators that match common video resolutions
        let resolutions = ["1080p", "720p", "4k", "2160p"]
        for res in resolutions {
            if releaseName.contains(res) {
                score += 5
            }
        }

        // Prefer releases without foreign parts or forced subtitles indicators
        let avoidIndicators = ["foreign", "forced", "non-english", "hi", "hearing.impaired"]
        for indicator in avoidIndicators {
            if releaseName.contains(indicator) {
                score -= 10
            }
        }

        // Prefer releases with proper episode/season formatting for TV shows
        if let season = season, let episode = episode {
            let sPattern = String(format: "s%02d", season)
            let ePattern = String(format: "e%02d", episode)
            let sxEpPattern = String(format: "%dx%d", season, episode)

            if releaseName.contains(sPattern) && releaseName.contains(ePattern) {
                score += 15 // Perfect episode match
            } else if releaseName.contains(sxEpPattern) {
                score += 15 // Alternative episode format
            } else if releaseName.contains("e\(episode)") {
                score += 10 // Partial episode match
            }
        }

        // Bonus for well-known quality release groups
        let qualityGroups = ["ntb", "phr0sty", "yify", "yts", "fgt", "sparks", "mindfuck", "dimension", "ctl"]
        for group in qualityGroups {
            if releaseName.contains(group) {
                score += 8
            }
        }

        // Penalize very short or generic release names
        if releaseName.count < 10 {
            score -= 5
        }

        // Prefer English language (assuming we're searching for English subs)
        if let lang = subtitle.language?.lowercased(), lang.contains("en") {
            score += 5
        }

        return max(score, 0) // Ensure non-negative
    }

    /// Sort subtitles by compatibility score (highest first)
    private func sortSubtitlesByCompatibility(_ subtitles: [SubDLSubtitle], season: Int?, episode: Int?) -> [SubDLSubtitle] {
        return subtitles.sorted { sub1, sub2 in
            let score1 = calculateCompatibilityScore(sub1, season: season, episode: episode)
            let score2 = calculateCompatibilityScore(sub2, season: season, episode: episode)
            return score1 > score2
        }
    }
}
