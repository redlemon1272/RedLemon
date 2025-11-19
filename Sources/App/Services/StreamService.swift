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
        
        // Step 2: Get Stream Bucket
        NSLog("🔍 StreamService: Fetching stream bucket...")
        let bucket = try await LocalAPIClient.shared.getStreamBucket(
            for: item.id,
            type: item.type,
            quality: quality,
            season: season,
            episode: episode,
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
        
        // Step 4: Try to unlock streams
        var lastError: Error?
        
        for (index, stream) in filteredStreams.enumerated() {
            print("🔄 StreamService: Trying stream \(index + 1)/\(filteredStreams.count): \(stream.title)")
            
            do {
                let unlockedStream = try await unlockStream(stream: stream, item: item, season: season, episode: episode)
                return StreamResolutionResult(stream: unlockedStream, metadata: finalMetadata)
            } catch {
                print("❌ StreamService: Unlock failed: \(error.localizedDescription)")
                lastError = error
                continue
            }
        }
        
        throw lastError ?? APIError.noStreamsFound
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
