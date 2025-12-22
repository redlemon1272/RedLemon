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
    func search(imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, languages: String = "en", name: String? = nil, year: Int? = nil, apiKey: String) async throws -> [SubDLSubtitle] {
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
        
        if let name = name {
            print("   ℹ️ Fallback Name: \(name) (\(year != nil ? "\(year!)" : "No Year"))")
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 5 // 5s timeout for search

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw Abort(.serviceUnavailable, reason: "SubDL API request failed")
        }

        if let responseString = String(data: data, encoding: .utf8) {
            // print("📝 SubDL Raw Response: \(responseString)")
        }

        let result = try JSONDecoder().decode(SubDLResponse.self, from: data)
        var subtitles = result.subtitles ?? []
        
        // CHECK FOR FAILURE -> TRIGGER FALLBACK
        if result.status == false || subtitles.isEmpty {
            if let errorMsg = result.error {
                print("❌ SubDL API Error: \(errorMsg)")
            } else if subtitles.isEmpty {
                print("⚠️ SubDL API returned empty subtitles list")
            }
            
            // Try standard API fallback (results list)
            if let results = result.results, !results.isEmpty {
                let firstResult = results[0]
                print("⚠️ Testing API-provided fallback for: \(firstResult.name)")
                // ... (Existing API Fallback Logic could go here, but we will use the improved shared helper below)
                // Actually, let's just create a helper to query by ID to keep this clean
                subtitles = try await fetchByInternalId(sdId: firstResult.sd_id, tmdbId: firstResult.tmdb_id, type: subdlType, season: season, episode: episode, languages: languages, apiKey: apiKey)
            } 
            // NEW: Try Scraping Fallback if API totally failed (e.g. "can't find movie") AND we have a name
            else if let name = name {
                print("🕸️ Attempting Web Scraping Fallback for '\(name)'...")
                if let scrapedId = try await searchByWebScraping(name: name, year: year, type: subdlType) {
                    print("✅ Scraping found SubDL ID: \(scrapedId). Fetching subtitles...")
                    // We treat the scraped ID as an 'sd_id' (film_id)
                    // Extract numeric part if it has 'sd' prefix (API usually expects just the number, but let's be safe)
                    let cleanId = Int(scrapedId.replacingOccurrences(of: "sd", with: ""))
                    if let fid = cleanId {
                         subtitles = try await fetchByInternalId(sdId: fid, tmdbId: nil, type: subdlType, season: season, episode: episode, languages: languages, apiKey: apiKey)
                    }
                } else {
                    print("❌ Scraping found no matches.")
                }
            }
        }

        // Post-Processing (Filtering & Sorting)
        print("✅ Found \(subtitles.count) subtitles from SubDL (Final)")
        
        let filteredSubtitles = filterSubtitlesByEpisode(subtitles, season: season, episode: episode)
        
        if filteredSubtitles.count < subtitles.count {
            print("🧹 Filtered out \(subtitles.count - filteredSubtitles.count) mismatched episodes")
        }

        let sortedSubtitles = sortSubtitlesByCompatibility(filteredSubtitles, season: season, episode: episode)

        return sortedSubtitles
    }
    
    // MARK: - Private Fallback Methods
    
    private func fetchByInternalId(sdId: Int, tmdbId: Int?, type: String, season: Int?, episode: Int?, languages: String, apiKey: String) async throws -> [SubDLSubtitle] {
        var components = URLComponents(string: "\(baseURL)/subtitles")!
        var queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "languages", value: languages),
            URLQueryItem(name: "type", value: type)
        ]
        
        // Prioritize TMDB ID if available
        if let tmdbId = tmdbId {
            print("⚠️ Retrying with TMDB ID: \(tmdbId)")
            queryItems.append(URLQueryItem(name: "tmdb_id", value: "\(tmdbId)"))
        } else {
             print("⚠️ Retrying with sd_id: \(sdId)")
             queryItems.append(URLQueryItem(name: "sd_id", value: "\(sdId)"))
        }

        if let season = season {
            queryItems.append(URLQueryItem(name: "season_number", value: "\(season)"))
        }
        if let episode = episode {
            queryItems.append(URLQueryItem(name: "episode_number", value: "\(episode)"))
        }

        components.queryItems = queryItems
        
        guard let url = components.url else { return [] }
        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        
        // print("🔍 Retrying URL: \(url)")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(SubDLResponse.self, from: data)
        return result.subtitles ?? []
    }
    
    private func searchByWebScraping(name: String, year: Int?, type: String) async throws -> String? {
        // Construct search URL: https://subdl.com/search/Name
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return nil }
        let searchURLStr = "https://subdl.com/search/\(encodedName)"
        guard let url = URL(string: searchURLStr) else { return nil }
        
        print("🕸️ Scraping: \(searchURLStr)")
        
        var request = URLRequest(url: url)
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15", forHTTPHeaderField: "User-Agent")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let html = String(data: data, encoding: .utf8) else { return nil }
        
        // Regex to find links: <a href="https://subdl.com/subtitle/sd12345/slug">Title (Year)</a>
        // Or relative: <a href="/subtitle/sd12345/slug">
        // We look for the 'sd' ID pattern
        
        // Pattern: href=".*?\/subtitle\/(sd\d+)\/.*?".*?>(.*?)<\/a>
        // We need to match the name/year in the text to be safe
        
        let linkPattern = "href=[\"'](?:https://subdl\\.com)?/subtitle/(sd\\d+)/[^\"']+[\"'][^>]*>(.*?)</a>"
        
        let regex = try NSRegularExpression(pattern: linkPattern, options: [.caseInsensitive])
        let nsString = html as NSString
        let matches = regex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))
        
        print("🕸️ Found \(matches.count) potential matches on search page")
        
        for match in matches {
            if match.numberOfRanges >= 3 {
                let sdId = nsString.substring(with: match.range(at: 1))
                let linkText = nsString.substring(with: match.range(at: 2)) // e.g. "Joker (2019)" or "<h3>Joker (2019)</h3>"
                
                // Clean link text (remove tags if any)
                let cleanText = linkText.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                
                print("   Candidate: ID=\(sdId) | Text='\(cleanText)'")
                
                // 1. Check Year Match (Strongest Signal)
                if let year = year {
                    if cleanText.contains("\(year)") {
                        print("   ✅ Year Match (\(year))! Selected ID: \(sdId)")
                        return sdId
                    }
                }
                
                // 2. Check Exact Name Match (if year missing or failed)
                // Normalize names
                if cleanText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
                     print("   ✅ Exact Name Match! Selected ID: \(sdId)")
                     return sdId
                }
            }
        }
        
        // Fallback: If we have results but no perfect match, return the first one IF likely relevant
        if let first = matches.first, matches.count > 0 {
             let sdId = nsString.substring(with: first.range(at: 1))
             print("⚠️ No exact match found, using first result: \(sdId)")
             return sdId
        }
        
        return nil
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
            if sub.releaseName?.lowercased() != nil {
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

            // Normalize filename helper
            func normalize(_ name: String) -> String {
                return name.lowercased()
                    .replacingOccurrences(of: ".", with: " ")
                    .replacingOccurrences(of: "_", with: " ")
                    .replacingOccurrences(of: "-", with: " ")
                    .replacingOccurrences(of: "[", with: " ")
                    .replacingOccurrences(of: "]", with: " ")
            }

            // Regex patterns for episode matching
            let patterns = [
                // S09E24, S9E24, s09e24
                "s\(String(format: "%02d", s))e\(String(format: "%02d", e))",
                "s\(s)e\(e)",
                // 9x24, 09x24
                "\(s)x\(e)",
                "\(String(format: "%02d", s))x\(String(format: "%02d", e))",
                // E24 (with boundary check done via regex later)
            ]
            
            // Helper to check for multi-episode ranges (e.g. E23-24, E23-E24)
            func isMultiEpisodeMatch(_ filename: String, targetEpisode: Int) -> Bool {
                // Look for patterns like "E23-24", "E23-E24", "Episodes 23-24"
                // Regex: (?:e|episode|ep)\s*(\d+)\s*(?:-|to|thru)\s*(?:e|episode|ep)?\s*(\d+)
                let rangePattern = "(?:e|episode|ep|\\s)\\s*(\\d+)\\s*(?:-|to|thru)\\s*(?:e|episode|ep)?\\s*(\\d+)"
                
                guard let regex = try? NSRegularExpression(pattern: rangePattern, options: .caseInsensitive) else { return false }
                let nsString = filename as NSString
                let matches = regex.matches(in: filename, options: [], range: NSRange(location: 0, length: nsString.length))
                
                for match in matches {
                    if match.numberOfRanges >= 3 {
                        let startStr = nsString.substring(with: match.range(at: 1))
                        let endStr = nsString.substring(with: match.range(at: 2))
                        
                        if let start = Int(startStr), let end = Int(endStr) {
                            if targetEpisode >= start && targetEpisode <= end {
                                return true
                            }
                        }
                    }
                }
                return false
            }

            // Strategy 1: Multi-episode Check (Highest Priority)
            for file in subtitleFiles {
                if isMultiEpisodeMatch(file, targetEpisode: e) {
                    print("✅ Found matching file in zip (Strategy 1 - Multi-Episode): \(file)")
                    bestMatch = file
                    break
                }
            }
            
            // Strategy 2: Specific Patterns (SxxExx)
            if bestMatch == nil {
                for file in subtitleFiles {
                    let lower = file.lowercased()
                    // Check standard patterns
                    for pattern in patterns {
                        if lower.contains(pattern.lowercased()) {
                            print("✅ Found matching file in zip (Strategy 2 - Pattern \(pattern)): \(file)")
                            bestMatch = file
                            break
                        }
                    }
                    if bestMatch != nil { break }
                }
            }

            // Strategy 3: Loose "Episode XX" matching with boundary checks
            if bestMatch == nil {
                // Regex for "E24", "Episode 24", " 24 " ensuring distinct numbers
                // checks for "e24" surrounded by non-digits, or start/end of string
                // or just "24" surrounded by non-digits
                let episodeNum = String(e)
                let paddedNum = String(format: "%02d", e)
                
                let loosePatterns = [
                    "(?:^|[^\\d])e\(episodeNum)(?:[^\\d]|$)",        // e24
                    "(?:^|[^\\d])e\(paddedNum)(?:[^\\d]|$)",      // e05
                    "(?:^|[^\\d])episode\\s*\(episodeNum)(?:[^\\d]|$)", // episode 24
                    "(?:^|[^\\d])\(episodeNum)(?:[^\\d]|$)",          // 24 (risky, but useful for plain numbers)
                    "(?:^|[^\\d])\(paddedNum)(?:[^\\d]|$)"        // 05
                ]
                
                for file in subtitleFiles {
                    let norm = normalize(file)
                    // If we are looking for loose match, we should verify Season if possible
                    // If file contains S09, and we want S09, that's good.
                    // If file contains S08, we should skip it.
                    
                    let seasonStr = String(s)
                    let paddedSeason = String(format: "%02d", s)
                    
                    // Simple negative check: if it explicitly says a DIFFERENT season, skip it
                    // Regex for Sxx where xx != season
                    let otherSeasonPattern = "s(\\d+)"
                    if let sRegex = try? NSRegularExpression(pattern: otherSeasonPattern, options: .caseInsensitive) {
                         let checkStr = norm.replacingOccurrences(of: " ", with: "")
                         let matches = sRegex.matches(in: checkStr, options: [], range: NSRange(location: 0, length: checkStr.utf16.count))
                         var hasWrongSeason = false
                         for m in matches {
                             let foundS = (checkStr as NSString).substring(with: m.range(at: 1))
                             if let sInt = Int(foundS), sInt != s {
                                 hasWrongSeason = true
                                 break
                             }
                         }
                         if hasWrongSeason { continue }
                    }

                    // Check for loose episode match
                    for pattern in loosePatterns {
                        if file.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil {
                            // Boost confidence if it also matches season explicitly
                            if norm.contains("s\(seasonStr)") || norm.contains("s\(paddedSeason)") || norm.contains("season \(seasonStr)") {
                                print("✅ Found matching file in zip (Strategy 3 - Loose w/ Season): \(file)")
                                bestMatch = file
                                break
                            }
                            
                            // If no season info, we accept it as Candidate but keep looking for a better one? 
                            // For now, accept it. Use first loose match.
                             print("✅ Found matching file in zip (Strategy 3 - Loose): \(file)")
                             bestMatch = file
                             break
                        }
                    }
                    if bestMatch != nil { break }
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
