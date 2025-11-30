import Foundation
import Combine

/// Manages stream resolution, unlocking, and subtitle downloading
actor StreamService {
    static let shared = StreamService()

    private init() {}

    // MARK: - Stream Resolution

    struct StreamResolutionResult {
        let stream: Stream
        let metadata: MediaMetadata
    }

    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata? = nil) async throws -> StreamResolutionResult {
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

        // Step 2: Get Stream Bucket
        NSLog("🔍 StreamService: Fetching stream bucket...")
        let bucket = try await LocalAPIClient.shared.getStreamBucket(
            for: item.id,
            type: item.type,
            quality: quality,
            season: finalSeason,
            episode: finalEpisode,
            year: finalMetadata.year
        )

        // Build list of streams to try
        var streamsToTry: [Stream] = []
        if let primary = bucket.primary {
            streamsToTry.append(primary)
        }
        if let alternates = bucket.alternates {
            streamsToTry.append(contentsOf: alternates)
        }

        guard !streamsToTry.isEmpty else {
            throw APIError.noStreamsFound
        }

        print("📦 StreamService: Found \(streamsToTry.count) streams to try")

        // Step 3: Apply x265 Safety Filter
        // Preserve server order but remove x265/HEVC
        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let filteredStreams = streamsToTry.compactMap { stream -> Stream? in
            let titleLower = stream.title.lowercased()
            let hasBadCodec = badCodecs.contains { codec in
                titleLower.contains(codec)
            }
            if hasBadCodec {
                print("🚫 StreamService: Blocking x265/HEVC: \(stream.title)")
                return nil
            }
            return stream
        }

        guard !filteredStreams.isEmpty else {
            print("❌ StreamService: No streams available after x265 safety filter")
            throw APIError.noStreamsFound
        }

        // Step 4: Apply File Size Limit (Max 12GB) for 1080p
        // Older hardware (2015 Macs) struggles with large files, especially H.264 Remuxes (30GB+)
        var finalStreams = filteredStreams

        if quality == .fullHD {
            let maxSizeBytes: Double = 12 * 1024 * 1024 * 1024 // 12 GB in bytes

            let sizeFiltered = finalStreams.compactMap { stream -> Stream? in
                guard let sizeString = stream.size else { return stream }

                // Parse size string (e.g., "15.2 GB", "850 MB")
                let components = sizeString.components(separatedBy: CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ".")).inverted)
                let numbers = components.filter { !$0.isEmpty }

                guard let numberString = numbers.first, let number = Double(numberString) else {
                    return stream // Can't parse, keep it
                }

                // Convert to bytes based on unit
                var sizeInBytes: Double = 0
                let upperSize = sizeString.uppercased()
                if upperSize.contains("GB") {
                    sizeInBytes = number * 1_073_741_824.0 // GB to bytes
                } else if upperSize.contains("MB") {
                    sizeInBytes = number * 1_048_576.0 // MB to bytes
                } else {
                    return stream // Unknown unit, keep it
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

        let components = sizeString.components(separatedBy: CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ".")).inverted)
        let numbers = components.filter { !$0.isEmpty }

        guard let numberString = numbers.first, let number = Double(numberString) else {
            return Double.greatestFiniteMagnitude
        }

        let upperSize = sizeString.uppercased()
        if upperSize.contains("GB") {
            return number * 1_073_741_824.0
        } else if upperSize.contains("MB") {
            return number * 1_048_576.0
        }

        return Double.greatestFiniteMagnitude
    }

    // MARK: - Stream Unlocking

    func unlockStream(stream: Stream, item: MediaItem, season: Int?, episode: Int?) async throws -> Stream {
        guard let infoHash = stream.infoHash else {
            throw APIError.noStreamsFound
        }

        print("🔓 StreamService: Unlocking with infoHash: \(infoHash.prefix(12))...")

        let fileIndex = stream.fileIdx ?? 0
        let unlockURL = URL(string: "\(Config.serverURL)/api/streams/unlock")!
        var request = URLRequest(url: unlockURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        var unlockBody: [String: Any] = [
            "infoHash": infoHash,
            "fileIdx": fileIndex,
            "service": "realdebrid"
        ]

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
        await withTaskGroup(of: Subtitle?.self) { group -> [Subtitle] in
            for subtitle in subtitles {
                group.addTask { () -> Subtitle? in
                    guard let url = URL(string: subtitle.url) else { return nil }

                    do {
                        let (data, response) = try await URLSession.shared.data(from: url)

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
