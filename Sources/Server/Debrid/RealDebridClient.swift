//
//  RealDebridClient.swift
//  RedLemon
//
//  RealDebrid API client
//  Ports Node.js _rdUnlock logic from ColorFruit server.js
//

import Foundation

enum RDError: Error {
    case addMagnetFailed(status: Int, message: String)
    case noTorrentId
    case selectFilesFailed
    case infoFailed
    case unrestrictFailed
    case notCached
    case timeout
    case serviceUnavailable
}

struct UnlockResult {
    let url: String
    let filename: String
    let ext: String
}

struct RDUserInfo: Codable {
    let id: Int?
    let username: String?
    let email: String?
    let premium: Int? // Unix timestamp of expiration
    let expiration: String? // ISO date string
    let type: String? // "premium" or "free"

    /// Calculate actual days remaining from the premium timestamp
    var daysRemaining: Int? {
        guard let secondsRemaining = premium else { return nil }

        // Premium is seconds remaining, not a timestamp
        let daysRemaining = Int(secondsRemaining / 86400) // 86400 seconds in a day

        return max(0, daysRemaining) // Don't return negative days
    }
}

struct TorrentInfo: Codable {
    let id: String
    let hash: String?
    let filename: String?
    let status: String?  // "downloaded", "downloading", "queued", "error"
    let links: [String]?
    let files: [TorrentFile]?

    struct TorrentFile: Codable {
        let id: Int?
        let path: String?
        let bytes: Int?
        let selected: Int?
    }
}

actor RealDebridClient {
    static let shared = RealDebridClient()
    private let baseURL = "https://api.real-debrid.com/rest/1.0"

    // Result cache (60 minute TTL)
    private var cache: [String: CachedResult] = [:]
    private struct CachedResult {
        let result: UnlockResult
        let expiry: Date
    }

    // De-duplicate concurrent unlocks
    private var inflightRequests: [String: Task<UnlockResult?, Error>] = [:]

    // Track bad hashes (not cached on RD)
    private var badHashes: Set<String> = []

    // CRITICAL: Blocklist for known x265 torrents (hashes without "x265" in title)
    private let x265Blocklist: Set<String> = [
        "9d117a9a06b1", // Breaking Bad S05 (MP4 files with x265 codec inside)
    ]

    private init() {}

    // MARK: - Public API

    func unlock(infoHash: String, fileIdx: Int = 0, token: String, maxPolls: Int = 3, season: Int? = nil, episode: Int? = nil, title: String? = nil) async throws -> UnlockResult? {
        // CRITICAL: Block known x265 torrents
        let hashPrefix = String(infoHash.prefix(12)).lowercased()
        if x265Blocklist.contains(where: { hashPrefix.hasPrefix($0) }) {
            NSLog("🚫 BLOCKLIST: Rejecting known x265 torrent: \(infoHash.prefix(12))...")
            throw RDError.notCached // Throw error to try next stream
        }

        let cacheKey = "\(infoHash):\(fileIdx):\(season ?? 0):\(episode ?? 0)"

        // Check cache first
        if let cached = cache[cacheKey], cached.expiry > Date() {
            print("✅ RD cache hit: \(infoHash.prefix(12))")
            return cached.result
        }

        // De-duplicate concurrent requests
        if let inflight = inflightRequests[cacheKey] {
            print("⏳ Waiting for in-flight request: \(infoHash.prefix(12))")
            return try await inflight.value
        }

        // Create new unlock task
        let task = Task<UnlockResult?, Error> {
            try await self._rdUnlock(infoHash: infoHash, fileIdx: fileIdx, token: token, maxPolls: maxPolls, season: season, episode: episode, title: title)
        }

        inflightRequests[cacheKey] = task

        defer {
            inflightRequests.removeValue(forKey: cacheKey)
        }

        let result = try await task.value

        // Cache successful result
        if let result = result {
            cache[cacheKey] = CachedResult(
                result: result,
                expiry: Date().addingTimeInterval(60 * 60) // 60 minutes
            )
        }

        return result
    }

    func isBadHash(_ infoHash: String) -> Bool {
        return badHashes.contains(infoHash.lowercased())
    }

    /// Get user account information including premium days remaining
    func getUserInfo(token: String) async throws -> RDUserInfo {
        let url = URL(string: "\(baseURL)/user")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "RealDebrid", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch user info"])
        }

        return try JSONDecoder().decode(RDUserInfo.self, from: data)
    }

    // MARK: - Core Unlock Logic (ports Node.js _rdUnlock)

    private func _rdUnlock(infoHash: String, fileIdx: Int, token: String, maxPolls: Int, season: Int?, episode: Int?, title: String?) async throws -> UnlockResult? {
        let pollDelay: UInt64 = 1_000_000_000 // 1 second

        // Build magnet with trackers
        let trackers = [
            "udp://tracker.opentrackr.org:1337/announce",
            "udp://open.stealth.si:80/announce",
            "udp://tracker.openbittorrent.com:6969/announce",
            "udp://tracker.coppersurfer.tk:6969/announce"
        ]
        let trParams = trackers.map { "tr=\($0.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")" }.joined(separator: "&")
        let magnet = "magnet:?xt=urn:btih:\(infoHash)&dn=\(infoHash)&\(trParams)"

        // Step 1: Add magnet
        let addURL = URL(string: "\(baseURL)/torrents/addMagnet")!
        var addRequest = URLRequest(url: addURL)
        addRequest.httpMethod = "POST"
        addRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        addRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        addRequest.httpBody = "magnet=\(magnet.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")".data(using: .utf8)

        let (addData, addResponse) = try await URLSession.shared.data(for: addRequest)

        guard let httpResponse = addResponse as? HTTPURLResponse else {
            throw RDError.addMagnetFailed(status: 0, message: "Invalid response")
        }

        // Handle addMagnet failure with fallback
        if !(200...299).contains(httpResponse.statusCode) {
            let errorMsg = String(data: addData, encoding: .utf8) ?? ""

            // Fallback: try unrestrict/magnet or existing torrents
            if httpResponse.statusCode == 509 || errorMsg.contains("too_many_active_downloads") {
                print("⚠️ RD addMagnet blocked (509), trying fallback...")
                return try await unrestrictMagnetFallback(magnet: magnet, token: token)
            }

            throw RDError.addMagnetFailed(status: httpResponse.statusCode, message: errorMsg)
        }

        guard let addResult = try? JSONDecoder().decode([String: String].self, from: addData),
              let torrentId = addResult["id"] else {
            throw RDError.noTorrentId
        }

        print("✅ RD addMagnet: \(torrentId)")

        // Step 2: Get torrent info to find the correct file
        let initialInfo = try await getTorrentInfo(torrentId: torrentId, token: token)

        // Determine which file to select
        let actualFileIdx: Int
        if let season = season, let episode = episode {
            // TV show: match episode pattern in filename
            let (fileIdx, filePath) = selectEpisodeFile(files: initialInfo.files, season: season, episode: episode)
            actualFileIdx = fileIdx
            print("📺 TV Show: Selected episode S\(String(format: "%02d", season))E\(String(format: "%02d", episode)) → file ID: \(actualFileIdx), path: \(filePath ?? "unknown")")

            // Validate that the selected file actually contains the requested episode
            if let path = filePath {
                let pathLower = path.lowercased()
                let seasonStr = String(format: "%02d", season)
                let episodeStr = String(format: "%02d", episode)

                let patterns = [
                    "s\(seasonStr)e\(episodeStr)",
                    "s\(season)e\(episode)"
                ]

                let matchesRequested = patterns.contains { pattern in
                    pathLower.contains(pattern)
                }

                if !matchesRequested {
                    NSLog("❌ Selected file doesn't match requested episode S%02dE%02d: %@", season, episode, path)
                    NSLog("   This torrent likely doesn't have the requested episode. Skipping.")
                    throw RDError.notCached // Throw error to try next stream
                }
            }
        } else {
        } else {
            // Movie: select largest video file OR match by title
            let videoExtensions = ["mkv", "mp4", "avi", "mov", "m4v", "webm"]
            let videoFiles = initialInfo.files?.filter { file in
                guard let path = file.path?.lowercased() else { return false }
                return videoExtensions.contains(where: { ext in path.hasSuffix(".\(ext)") })
            } ?? []

            var selectedFile: TorrentInfo.TorrentFile?

            // Priority 1: Title match (if provided)
            if let title = title, !title.isEmpty {
                let cleanTitle = title.lowercased().replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "-", with: " ")
                let titleWords = cleanTitle.components(separatedBy: " ").filter { $0.count > 2 } // Only significant words

                // Find files that contain ALL significant words from the title
                let matchingFiles = videoFiles.filter { file in
                    guard let path = file.path?.lowercased() else { return false }
                    // Simple check: path contains the full title?
                    if path.contains(cleanTitle) { return true }

                    // Fuzzy check: path contains all significant words?
                    let allWordsMatch = titleWords.allSatisfy { word in path.contains(word) }
                    return allWordsMatch
                }

                if !matchingFiles.isEmpty {
                    // If multiple matches, pick the largest one (likely higher quality)
                    selectedFile = matchingFiles.max(by: { ($0.bytes ?? 0) < ($1.bytes ?? 0) })
                    if let file = selectedFile {
                        print("🎬 Movie: Found matching file for title '\(title)': \(file.path ?? "unknown")")
                    }
                } else {
                    print("⚠️ Movie: No file matched title '\(title)', falling back to largest file")
                }
            }

            // Priority 2: Largest video file (Fallback)
            if selectedFile == nil {
                selectedFile = videoFiles.max(by: { ($0.bytes ?? 0) < ($1.bytes ?? 0) })
                if let file = selectedFile {
                    print("🎬 Movie: Auto-selected largest video file: \(file.path ?? "unknown") (ID: \(file.id ?? 0), size: \(file.bytes ?? 0) bytes)")
                }
            }

            if let videoFile = selectedFile, let videoFileId = videoFile.id {
                actualFileIdx = videoFileId
            } else {
                // Fallback to provided fileIdx
                actualFileIdx = fileIdx >= 0 ? fileIdx + 1 : 1
                print("⚠️ No video files found, using fileIdx: \(actualFileIdx)")
            }
        }

        // Step 3: Select the file (1-based index for RD API)
        // CRITICAL FIX: Only select files if the torrent is waiting for selection
        // Calling selectFiles on an already active/downloaded torrent causes a 60s timeout/hang
        if initialInfo.status == "waiting_files_selection" {
            let selectIdx = "\(actualFileIdx)"
            print("📝 RD: Selecting file ID \(selectIdx) for torrent \(torrentId)")
            try await selectFiles(torrentId: torrentId, filesParam: selectIdx, token: token)
        } else {
            print("⏩ RD: Torrent status is '\(initialInfo.status ?? "unknown")', skipping file selection (already active)")
        }

        // Step 4: Poll for completion
        var info: TorrentInfo?
        for poll in 0..<maxPolls {
            info = try await getTorrentInfo(torrentId: torrentId, token: token)

            print("📊 RD poll \(poll + 1)/\(maxPolls): status=\(info?.status ?? "unknown"), links=\(info?.links?.count ?? 0)")

            if let links = info?.links, !links.isEmpty {
                break // Ready!
            }

            // Check for failure states
            if info?.status == "error" || info?.status == "dead" {
                badHashes.insert(infoHash.lowercased())
                throw RDError.notCached
            }

            // Fast-fail for non-cached torrents (downloading or queued = not instant)
            if poll >= 1 {
                if info?.status == "downloading" || info?.status == "queued" {
                    print("⚠️ Torrent not cached (status: \(info?.status ?? "unknown")), skipping for instant playback")
                    badHashes.insert(infoHash.lowercased())
                    throw RDError.notCached
                }
            }

            try await Task.sleep(nanoseconds: pollDelay)
        }

        guard let links = info?.links, !links.isEmpty else {
            badHashes.insert(infoHash.lowercased())
            throw RDError.timeout
        }

        // Step 5: Unrestrict link (use first link since we selected a specific file)
        let linkId = links[0]
        print("🔗 Unrestricting link: \(linkId)")

        return try await unrestrictLink(linkId: linkId, token: token)
    }

    // MARK: - Episode File Selection (ported from ColorFruit)

    private func selectEpisodeFile(files: [TorrentInfo.TorrentFile]?, season: Int, episode: Int) -> (fileId: Int, filePath: String?) {
        guard let files = files, !files.isEmpty else {
            NSLog("⚠️ No files in torrent, defaulting to file ID 1")
            return (1, nil)
        }

        // Build episode pattern: S01E02, S1E2, etc.
        // Pattern matches: S0*{season}E0*{episode} with word boundary
        let seasonStr = String(format: "%02d", season)
        let episodeStr = String(format: "%02d", episode)

        // Multiple patterns to handle different naming conventions:
        // - S01E02 (most common)
        // - S1E2 (no leading zeros)
        // - s01e02 (lowercase)
        let patterns = [
            "S\(seasonStr)E\(episodeStr)",
            "S\(season)E\(episode)",
            "s\(seasonStr)e\(episodeStr)",
            "s\(season)e\(episode)"
        ]

        NSLog("🔍 Searching for episode patterns: %@", patterns.joined(separator: ", "))
        NSLog("📁 Torrent has %d files:", files.count)

        // List all files first for debugging
        for (index, file) in files.enumerated() {
            let fileId = file.id ?? (index + 1)
            let sizeStr = formatFileSize(file.bytes ?? 0)
            let sampleIndicator = isSampleFile(file) ? " [SAMPLE]" : ""
            print("   [\(fileId)] \(file.path ?? "unknown") (\(sizeStr))\(sampleIndicator)")
        }

        // CRITICAL: Filter out sample files FIRST
        let nonSampleFiles = files.filter { file in
            if isSampleFile(file) {
                print("   🚫 SAMPLE FILTER: Blocking sample file: \(file.path ?? "unknown")")
                return false
            }
            return true
        }

        let filesToSearch = nonSampleFiles.isEmpty ? files : nonSampleFiles
        if nonSampleFiles.count < files.count {
            NSLog("   🚫 SAMPLE FILTER: Blocked %d sample files, %d files remain", files.count - nonSampleFiles.count, nonSampleFiles.count)
        }

        // CRITICAL: Filter out x265/HEVC files FIRST
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let x264Files = filesToSearch.filter { file in
            guard let path = file.path else { return true } // Keep files with no path (safety)
            let pathLower = path.lowercased()
            let hasBadCodec = badCodecs.contains { codec in
                pathLower.contains(codec)
            }
            if hasBadCodec {
                NSLog("   🚫 UNLOCK FILTER: Blocking x265/HEVC file: %@", path)
            }
            return !hasBadCodec
        }

        let finalFiles = x264Files.isEmpty ? filesToSearch : x264Files
        if x264Files.count < filesToSearch.count {
            NSLog("   🚫 UNLOCK FILTER: Blocked %d x265 files, %d x264 files remain", filesToSearch.count - x264Files.count, x264Files.count)
        }

        // Try to find file matching episode pattern
        for (index, file) in finalFiles.enumerated() {
            guard let path = file.path else { continue }

            let pathLower = path.lowercased()
            let matchesPattern = patterns.contains { pattern in
                pathLower.contains(pattern.lowercased())
            }

            if matchesPattern {
                let fileId = file.id ?? (index + 1)
                let sizeStr = formatFileSize(file.bytes ?? 0)

                // Additional validation: check if file size is reasonable for a TV episode
                if isValidEpisodeSize(file.bytes ?? 0, quality: extractQualityFromPath(path)) {
                    NSLog("✅ MATCH FOUND: %@ → file ID: %d (%@)", path, fileId, sizeStr)
                    return (fileId, path)
                } else {
                    NSLog("⚠️ MATCH FOUND but size too small for episode: %@ → file ID: %d (%@) - POSSIBLE SAMPLE", path, fileId, sizeStr)
                }
            }
        }

        // Fallback: If no match found, try to select by position (episode number)
        // For season packs, episodes are usually sorted in order
        NSLog("⚠️ No pattern match found, attempting fallback by episode position")

        // Filter video files only (excluding samples)
        let videoExtensions = ["mkv", "mp4", "avi", "mov", "m4v", "webm"]
        let videoFiles = finalFiles.filter { file in
            guard let path = file.path?.lowercased() else { return false }
            return videoExtensions.contains(where: { ext in path.hasSuffix(".\(ext)") })
        }

        // Sort by size (prefer larger files for episodes)
        let sortedVideoFiles = videoFiles.sorted { ($0.bytes ?? 0) > ($1.bytes ?? 0) }

        if sortedVideoFiles.count >= episode {
            let targetFile = sortedVideoFiles[episode - 1]
            let fileId = targetFile.id ?? episode
            let sizeStr = formatFileSize(targetFile.bytes ?? 0)

            // Validate the selected file size
            if isValidEpisodeSize(targetFile.bytes ?? 0, quality: extractQualityFromPath(targetFile.path ?? "")) {
                print("📍 Fallback: Selected file at position \(episode) → \(targetFile.path ?? "unknown") (ID: \(fileId), \(sizeStr))")
                return (fileId, targetFile.path)
            } else {
                print("❌ Fallback file too small: \(targetFile.path ?? "unknown") (ID: \(fileId), \(sizeStr)) - POSSIBLE SAMPLE")
            }
        }

        // Last resort: largest valid video file
        if let largestVideo = sortedVideoFiles.first,
           isValidEpisodeSize(largestVideo.bytes ?? 0, quality: extractQualityFromPath(largestVideo.path ?? "")),
           let fileId = largestVideo.id {
            let sizeStr = formatFileSize(largestVideo.bytes ?? 0)
            print("🎲 Last resort: Using largest valid video file → \(largestVideo.path ?? "unknown") (ID: \(fileId), \(sizeStr))")
            return (fileId, largestVideo.path)
        }

        NSLog("⚠️ All fallbacks failed or files too small, defaulting to file ID 1")
        return (1, nil)
    }

    // MARK: - API Methods

    private func selectFiles(torrentId: String, filesParam: String, token: String) async throws {
        let url = URL(string: "\(baseURL)/torrents/selectFiles/\(torrentId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "files=\(filesParam)".data(using: .utf8)

        let (_, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            print("⚠️ selectFiles returned \(httpResponse.statusCode) (continuing anyway)")
        }
    }

    private func getTorrentInfo(torrentId: String, token: String) async throws -> TorrentInfo {
        let url = URL(string: "\(baseURL)/torrents/info/\(torrentId)")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw RDError.infoFailed
        }

        return try JSONDecoder().decode(TorrentInfo.self, from: data)
    }

    private func unrestrictLink(linkId: String, token: String) async throws -> UnlockResult {
        let url = URL(string: "\(baseURL)/unrestrict/link")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "link=\(linkId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")".data(using: .utf8)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let errorMsg = String(data: data, encoding: .utf8) ?? "Unknown error"
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            NSLog("❌ RealDebrid unrestrict failed: HTTP \(statusCode) - \(errorMsg)")
            throw RDError.unrestrictFailed
        }

        struct UnrestrictResponse: Codable {
            let download: String
            let filename: String?
        }

        let result = try JSONDecoder().decode(UnrestrictResponse.self, from: data)

        let ext = extractExtension(from: result.filename ?? "")

        return UnlockResult(
            url: result.download,
            filename: result.filename ?? "",
            ext: ext
        )
    }

    private func unrestrictMagnetFallback(magnet: String, token: String) async throws -> UnlockResult? {
        // Try unrestrict/magnet (works for cached torrents only)
        let url = URL(string: "\(baseURL)/unrestrict/magnet")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "magnet=\(magnet.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")".data(using: .utf8)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            return nil
        }

        struct MagnetResponse: Codable {
            let download: String?
            let link: String?
            let href: String?
            let filename: String?
        }

        guard let result = try? JSONDecoder().decode(MagnetResponse.self, from: data),
              let directUrl = result.download ?? result.link ?? result.href else {
            return nil
        }

        let ext = extractExtension(from: result.filename ?? "")

        return UnlockResult(
            url: directUrl,
            filename: result.filename ?? "",
            ext: ext
        )
    }

    // MARK: - Utilities

    private func extractExtension(from filename: String) -> String {
        let pattern = #"\.([a-z0-9]{2,5})(?:$|\s)"#
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive),
           let match = regex.firstMatch(in: filename, range: NSRange(filename.startIndex..., in: filename)),
           let range = Range(match.range(at: 1), in: filename) {
            return String(filename[range])
        }
        return "mp4" // Default fallback
    }

    // MARK: - Sample File Detection

    private func isSampleFile(_ file: TorrentInfo.TorrentFile) -> Bool {
        guard let path = file.path?.lowercased() else { return false }
        let size = file.bytes ?? 0

        // Check filename for sample indicators
        let sampleKeywords = ["sample", "trailer", "preview", "promo", "teaser"]
        let containsSampleKeyword = sampleKeywords.contains { keyword in
            path.contains(keyword)
        }

        // Check if file is too small to be a full episode
        let isTooSmall = size < 100 * 1024 * 1024 // 100MB minimum for any episode

        // Check for typical sample patterns
        let hasSamplePattern = path.contains("-sample") ||
                               path.contains("_sample") ||
                               path.contains(".sample") ||
                               path.contains("sample.")

        return containsSampleKeyword || hasSamplePattern || isTooSmall
    }

    private func formatFileSize(_ bytes: Int) -> String {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(bytes))
    }

    private func isValidEpisodeSize(_ bytes: Int, quality: String) -> Bool {
        let sizeMB = Double(bytes) / (1024 * 1024)

        // Minimum sizes based on quality
        switch quality.lowercased() {
        case let q where q.contains("1080p") || q.contains("720p"):
            return sizeMB >= 200 // 200MB minimum for HD episodes
        case let q where q.contains("480p"):
            return sizeMB >= 100 // 100MB minimum for SD episodes
        default:
            return sizeMB >= 150 // 150MB minimum for unknown quality
        }
    }

    private func extractQualityFromPath(_ path: String) -> String {
        let pathLower = path.lowercased()
        if pathLower.contains("1080p") { return "1080p" }
        if pathLower.contains("720p") { return "720p" }
        if pathLower.contains("480p") { return "480p" }
        return "unknown"
    }
}
