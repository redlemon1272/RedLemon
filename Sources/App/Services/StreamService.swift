import Foundation
import Combine

/// Manages stream resolution, unlocking, and subtitle downloading
/// Result of stream resolution
struct StreamResolutionResult {
    let stream: Stream
    let metadata: MediaMetadata
}

/// Protocol for resolving and unlocking streams
protocol StreamResolving {
    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata?, preferredInfoHash: String?) async throws -> StreamResolutionResult
    func unlockStream(stream: Stream, item: MediaItem, season: Int?, episode: Int?) async throws -> Stream
}

/// Manages stream resolution, unlocking, and subtitle downloading
actor StreamService: StreamResolving {
    static let shared = StreamService()
    
    private init() {}

    // MARK: - Stream Resolution


    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata? = nil, preferredInfoHash: String? = nil) async throws -> StreamResolutionResult {
        print("🎬 StreamService: Starting resolution for: \(item.name)")

        // Step 1: Load metadata
        let finalMetadata: MediaMetadata
        if let metadata = metadata {
            NSLog("✅ StreamService: Using provided metadata: \(metadata.title)")
            finalMetadata = metadata
        } else {
            NSLog("📡 StreamService: Fetching metadata for \(item.id)...")
            finalMetadata = try await LocalAPIClient.shared.fetchMetadata(type: item.type, id: item.id)
            NSLog("✅ StreamService: Metadata loaded: \(finalMetadata.title)")
        }

        // FIX: Defensive check - ensure movies don't have season/episode
        let isMovie = item.type == "movie"
        let finalSeason = isMovie ? nil : season
        let finalEpisode = isMovie ? nil : episode

        if isMovie && (season != nil || episode != nil) {
            print("⚠️ StreamService: Corrected movie request - removed season/episode")
        }

        // Step 2: Continue with regular stream resolution (trusted pack filtering happens server-side)
        print("🎬 StreamService: Resolving \(item.type) - trusted pack filtering will be applied server-side")

        // Step 3: Get Stream Bucket (Direct Resolver Call)
        NSLog("⚡️ StreamService: Resolving streams via StreamResolver (Bypassing HTTP)...")

        let bucketsResponse = try await StreamResolver.shared.resolveStreamsByQuality(
            imdbId: item.id,
            type: item.type,
            season: finalSeason,
            episode: finalEpisode,
            year: finalMetadata.year
        )

        let buckets = bucketsResponse.buckets
        let rawBucket: QualityBucket?
        switch quality {
        case .uhd4k: rawBucket = buckets.uhd4k
        case .fullHD: rawBucket = buckets.fullHD
        case .hd: rawBucket = buckets.hd
        case .sd: rawBucket = buckets.sd
        }

        // Build list of streams to try with Cross-Quality Fallback
        // Priority: Requested (1080p) -> 720p -> 4K (Hail Mary)
        var streamsToTry: [Stream] = []
        
        
        var forcedStream: Stream? = nil
        
        // Helper to extract streams from a bucket
        func extractStreams(from bucket: QualityBucket?) -> [Stream] {
            var extracted: [Stream] = []
            if let primary = bucket?.primary { extracted.append(primary) }
            if let alternates = bucket?.alternates { extracted.append(contentsOf: alternates) }
            return extracted
        }
        
        // NEW: Check for preferred hash (Synchronization Logic)
        if let targetHash = preferredInfoHash {
            print("🔗 StreamService: Attempting to resolve specific stream hash: \(targetHash)")
            let allBuckets = [buckets.uhd4k, buckets.fullHD, buckets.hd, buckets.sd]
            for bucket in allBuckets {
                let streams = extractStreams(from: bucket)
                // Case-insensitive comparison for reliability
                if let match = streams.first(where: { $0.infoHash?.lowercased() == targetHash.lowercased() }) {
                    print("✅ StreamService: Found requested stream hash! Locking selection.")
                    forcedStream = match
                    break
                }
            }
            if forcedStream == nil {
                print("⚠️ StreamService: Requested hash not found in resolved streams. Falling back to standard selection.")
            }
        }

        // If forced stream is found, we skip standard selection logic
        if let match = forcedStream {
            streamsToTry = [match]
        } else {
            // 1. Requested Quality (usually 1080p)
            streamsToTry.append(contentsOf: extractStreams(from: rawBucket))
        }
        
        if forcedStream == nil && quality == .fullHD {
            // 2. Fallback: 720p (Safe for older hardware)
            let hdStreams = extractStreams(from: buckets.hd)
             if !hdStreams.isEmpty {
                print("   ➕ Added \(hdStreams.count) 720p streams as backup")
                streamsToTry.append(contentsOf: hdStreams)
            }
            
            // 3. Fallback: 4K (Last Resort - may lag on old hardware)
            let uhdStreams = extractStreams(from: buckets.uhd4k)
            if !uhdStreams.isEmpty {
                print("   ➕ Added \(uhdStreams.count) 4K streams as 'Hail Mary' backup")
                streamsToTry.append(contentsOf: uhdStreams)
            }
        }
        
        guard !streamsToTry.isEmpty else {
            throw APIError.noStreamsFound
        }
        
        print("📦 StreamService: Found \(streamsToTry.count) total streams to try (across all qualities)")

        // Step 3: Apply Tiered Codec Safety Filter
        // Goal: Prioritize H.264 (best compat), then 8-bit x265 (okay), then anything (last resort)
        
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let tenBitKeywords = ["10bit", "10-bit", "10 bit"]
        
        // Tier 1: Strict H.264 Preference (Original Behavior)
        // Completely removes anything looking like x265
        let tier1Streams = streamsToTry.compactMap { stream -> Stream? in
            let titleLower = stream.title.lowercased()
            let hasBadCodec = badCodecs.contains { titleLower.contains($0) }
            return hasBadCodec ? nil : stream
        }
        
        var filteredStreams: [Stream] = tier1Streams
        
        if !filteredStreams.isEmpty {
            print("✅ StreamService: Found \(filteredStreams.count) H.264 streams (Tier 1)")
        } else {
            print("⚠️ StreamService: No H.264 streams found. Attempting Tier 2 (x265 8-bit)...")
            
            // Tier 2: Allow x265 but BLOCK 10-bit (causes performance issues on old hardware)
            let tier2Streams = streamsToTry.compactMap { stream -> Stream? in
                let titleLower = stream.title.lowercased()
                let isTenBit = tenBitKeywords.contains { titleLower.contains($0) }
                if isTenBit {
                    return nil // block 10-bit
                }
                return stream // allow 8-bit x265 (and any other codec)
            }
            
            filteredStreams = tier2Streams
            
            if !filteredStreams.isEmpty {
                print("⚠️ StreamService: Fallback to Tier 2 (x265 8-bit). Found \(filteredStreams.count) streams.")
            } else {
                print("⚠️ StreamService: No 8-bit streams found. Attempting Tier 3 (Everything)...")
                
                // Tier 3: "Hail Mary" - Use whatever we have
                // Better to play with lag than not play at all
                filteredStreams = streamsToTry
                print("⚠️ StreamService: Fallback to Tier 3 (All Codecs). Found \(filteredStreams.count) streams.")
            }
        }
        
        guard !filteredStreams.isEmpty else {
            print("❌ StreamService: No streams available even after Tier 3 fallback")
            throw APIError.noStreamsFound
        }

        // Step 3.5: Apply Keyword Safety Filter (Remux, etc)
        // User reported performance issues (spinning beach ball) with Remux files
        let blockedKeywords = ["remux"]
        let keywordFiltered = filteredStreams.compactMap { stream -> Stream? in
            let titleLower = stream.title.lowercased()
            if blockedKeywords.contains(where: { titleLower.contains($0) }) {
                print("🚫 StreamService: Blocking stream with restricted keyword: \(stream.title)")
                return nil
            }
            return stream
        }

        guard !keywordFiltered.isEmpty else {
            print("❌ StreamService: No streams available after keyword filter")
            throw APIError.noStreamsFound
        }

        // Step 4: Apply File Size Limit (Max 12GB) for 1080p
        // Older hardware (2015 Macs) struggles with large files, especially H.264 Remuxes (30GB+)
        var finalStreams = keywordFiltered
        
        // Force bypass filters if we have a locked stream
        if let match = forcedStream {
            print("🔒 StreamService: Bypassing filters for enforced stream")
            // Ensure the forced stream is the only one in finalStreams. 
            // Note: keywordFiltered might have removed it? 
            // We should ideally assume 'match' is valid if the host played it, but let's check keyword safety?
            // Actually, for sync, we should force it even if it has a 'bad' keyword locally if the user is joining a party.
            finalStreams = [match]
        } else {

        if quality == .fullHD {
            let maxSizeBytes: Double = 12 * 1024 * 1024 * 1024 // 12 GB in bytes

            let sizeFiltered = finalStreams.compactMap { stream -> Stream? in
                let sizeInBytes = self.parseSizeToBytes(stream.size)
                
                // If parsing failed (returns infinity), we keep the stream to be safe
                if sizeInBytes == Double.greatestFiniteMagnitude {
                    return stream 
                }

                if sizeInBytes > maxSizeBytes {
                    let sizeGB = sizeInBytes / 1_073_741_824.0
                    print("⚠️ StreamService: Skipping large file (1080p limit): \(stream.title) (\(String(format: "%.2f", sizeGB)) GB)")
                    return nil
                }
                return stream
            }

            if !sizeFiltered.isEmpty {
                finalStreams = sizeFiltered
                print("📦 StreamService: \(finalStreams.count) streams remain after size filter")
            } else {
                print("⚠️ StreamService: Size filter removed all streams, falling back to smallest available")
                // Find smallest by parsing all sizes
                if let smallest = filteredStreams.min(by: { stream1, stream2 in
                    let size1 = parseSizeToBytes(stream1.size)
                    let size2 = parseSizeToBytes(stream2.size)
                    return size1 < size2
                }) {
                    finalStreams = [smallest]
                }
            }
            }
        }

        // Step 5: Try to unlock streams
        var lastError: Error?

        for (index, stream) in finalStreams.enumerated() {
            print("🔄 StreamService: Trying stream \(index + 1)/\(finalStreams.count): \(stream.title)")

            do {
                let unlockedStream = try await unlockStream(stream: stream, item: item, season: finalSeason, episode: finalEpisode)
                print("✅ StreamService: Selected stream: \(stream.title)")
                if let sizeString = stream.size {
                    let sizeBytes = parseSizeToBytes(sizeString)
                    if sizeBytes < Double.greatestFiniteMagnitude {
                        let sizeGB = sizeBytes / 1_073_741_824.0
                        print("📊 Stream Size: \(String(format: "%.2f", sizeGB)) GB")
                    } else {
                        print("📊 Stream Size: \(sizeString)")
                    }
                } else {
                    print("📊 Stream Size: Unknown")
                }
                return StreamResolutionResult(stream: unlockedStream, metadata: finalMetadata)
            } catch {
                print("❌ StreamService: Unlock failed: \(error.localizedDescription)")
                lastError = error
                continue
            }
        }

        throw lastError ?? APIError.noStreamsFound
    }

    // MARK: - Helper Functions

    /// Parse size string (e.g., "15.2 GB", "850 MB") to bytes
    private func parseSizeToBytes(_ sizeString: String?) -> Double {
        guard let sizeString = sizeString else { return Double.greatestFiniteMagnitude }

        // Sanitize
        let sanitized = sizeString.replacingOccurrences(of: ",", with: "")
        
        // Extract numeric part
        let components = sanitized.components(separatedBy: CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ".")).inverted)
        let numbers = components.filter { !$0.isEmpty }

        guard let numberString = numbers.first, let number = Double(numberString) else {
            return Double.greatestFiniteMagnitude
        }

        let upperSize = sizeString.uppercased()
        
        // Check units
        if upperSize.contains("GB") || upperSize.contains("GIB") {
            return number * 1_073_741_824.0
        } else if upperSize.contains("MB") || upperSize.contains("MIB") {
            return number * 1_048_576.0
        } else if upperSize.contains("KB") || upperSize.contains("KIB") {
            return number * 1024.0
        }
        
        // If no units found, assume it's raw bytes if it looks like a whole number
        // This handles cases where providers send raw byte counts (e.g. "24421538041")
        if !upperSize.contains("B") { // No "B" unit found
             return number
        }

        return Double.greatestFiniteMagnitude
    }

    // MARK: - Stream Unlocking

    func unlockStream(stream: Stream, item: MediaItem, season: Int?, episode: Int?) async throws -> Stream {
        guard let infoHash = stream.infoHash else {
            throw APIError.noStreamsFound
        }

        print("🔓 StreamService: Unlocking with infoHash: \(infoHash.prefix(12))...")
        
        // CRITICAL FIX: Don't default to 0 if fileIdx is nil (Pack support)
        let unlockURL = URL(string: "\(Config.serverURL)/api/streams/unlock")!
        var request = URLRequest(url: unlockURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        var unlockBody: [String: Any] = [
            "infoHash": infoHash,
            "service": "realdebrid",
            "title": item.name
        ]
        
        if let fileIdx = stream.fileIdx {
            unlockBody["fileIdx"] = fileIdx
        }

        if item.type == "series" {
            if let season = season { unlockBody["season"] = season }
            if let episode = episode { unlockBody["episode"] = episode }
        }

        request.httpBody = try JSONSerialization.data(withJSONObject: unlockBody)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        if httpResponse.statusCode != 200 {
            let errorMessage = String(data: data, encoding: .utf8) ?? "HTTP \(httpResponse.statusCode)"
            throw APIError.networkError(NSError(domain: "UnlockError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
        }

        struct UnlockResponse: Codable {
            let url: String
            let filename: String
        }

        let unlockResult = try JSONDecoder().decode(UnlockResponse.self, from: data)

        print("✅ StreamService: Stream unlocked successfully!")

        // Create unlocked stream
        var unlockedStream = Stream(
            url: unlockResult.url,
            title: stream.title,
            quality: stream.quality,
            seeders: stream.seeders,
            size: stream.size,
            provider: stream.provider,
            infoHash: stream.infoHash,
            fileIdx: stream.fileIdx,
            ext: stream.ext,
            behaviorHints: stream.behaviorHints,
            subtitles: stream.subtitles
        )

        // Download subtitles if available
        if let subtitles = unlockedStream.subtitles, !subtitles.isEmpty {
            NSLog("📥 StreamService: Pre-downloading %d subtitles...", subtitles.count)
            let downloadedSubs = await downloadSubtitlesInParallel(subtitles: subtitles)
            unlockedStream.subtitles = downloadedSubs
        }

        return unlockedStream
    }

    // MARK: - Subtitle Downloading

    func downloadSubtitlesInParallel(subtitles: [Subtitle]) async -> [Subtitle] {
        // Use a custom session with short timeout to avoid blocking playback
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 3.0 // 3 seconds max per subtitle
        config.timeoutIntervalForResource = 3.0
        let session = URLSession(configuration: config)

        return await withTaskGroup(of: Subtitle?.self) { group -> [Subtitle] in
            for subtitle in subtitles {
                group.addTask { () -> Subtitle? in
                    NSLog("🔍 DEBUG: Processing subtitle URL: %@", subtitle.url)
                    
                    // Handle SubDL subtitles (both proxy URLs and raw API paths)
                    // Proxy URLs: http://127.0.0.1:47253/subtitles/subdl/... (already converted, skip download)
                    // Raw API URLs: /subtitle/... (need to convert to proxy URL)
                    if subtitle.url.contains("/subtitles/subdl/") {
                        NSLog("✅ DEBUG: SubDL proxy URL detected, skipping download")
                        return subtitle // Already a proxy URL, return as-is
                    }
                    
                    if subtitle.url.hasPrefix("/subtitle/") {
                        NSLog("✅ DEBUG: Raw SubDL URL detected, converting to proxy URL")
                        // Convert raw SubDL URL to proxy URL
                        let encodedPath = Data(subtitle.url.utf8).base64EncodedString()
                        let proxyURL = "http://127.0.0.1:47253/subtitles/subdl/\(encodedPath)"
                        
                        // Create new subtitle with proxy URL
                        return Subtitle(
                            id: subtitle.id,
                            url: proxyURL,
                            lang: subtitle.lang,
                            label: subtitle.label,
                            srclang: subtitle.srclang,
                            kind: subtitle.kind,
                            provider: subtitle.provider
                        )
                    }
                    
                    NSLog("⚠️ DEBUG: Not a SubDL URL, attempting download")
                    guard let url = URL(string: subtitle.url) else { 
                        NSLog("❌ StreamService: Failed to download subtitle: unsupported URL")
                        return nil 
                    }

                    do {
                        let (data, response) = try await session.data(from: url)

                        let isZip = subtitle.url.lowercased().hasSuffix(".zip") ||
                                   (response as? HTTPURLResponse)?.allHeaderFields["Content-Type"] as? String == "application/zip"

                        if isZip {
                            if let extractedPath = try? await self.extractSubtitleFromZip(data: data) {
                                return self.createLocalSubtitle(from: subtitle, path: extractedPath)
                            }
                        } else {
                            let tempDir = FileManager.default.temporaryDirectory
                            let filename = "subtitle_\(UUID().uuidString).srt"
                            let localURL = tempDir.appendingPathComponent(filename)
                            try data.write(to: localURL)
                            return self.createLocalSubtitle(from: subtitle, path: localURL.path)
                        }
                    } catch {
                        NSLog("❌ StreamService: Failed to download subtitle: %@", error.localizedDescription)
                    }
                    return nil
                }
            }

            var downloaded: [Subtitle] = []
            for await result in group {
                if let subtitle = result {
                    downloaded.append(subtitle)
                }
            }
            return downloaded
        }
    }



    nonisolated private func extractSubtitleFromZip(data: Data) async throws -> String? {
        let tempDir = FileManager.default.temporaryDirectory
        let zipPath = tempDir.appendingPathComponent("temp_\(UUID().uuidString).zip")
        try data.write(to: zipPath)

        let extractDir = tempDir.appendingPathComponent("extract_\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: extractDir, withIntermediateDirectories: true)

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = ["-q", zipPath.path, "-d", extractDir.path]
        try process.run()
        process.waitUntilExit()

        let contents = try FileManager.default.contentsOfDirectory(at: extractDir, includingPropertiesForKeys: nil)
        if let srtFile = contents.first(where: { $0.pathExtension.lowercased() == "srt" }) {
            return srtFile.path
        }

        return nil
    }

    nonisolated private func createLocalSubtitle(from subtitle: Subtitle, path: String) -> Subtitle {
        return Subtitle(
            id: subtitle.id,
            url: path,
            lang: subtitle.lang,
            label: subtitle.label,
            srclang: subtitle.srclang,
            kind: subtitle.kind,
            provider: subtitle.provider
        )
    }
}
