import Foundation
import Combine

/// Manages stream resolution, unlocking, and subtitle downloading
/// Result of stream resolution
struct StreamResolutionResult {
    let stream: Stream
    let metadata: MediaMetadata
    var candidateStreams: [Stream] = []
}

/// Protocol for resolving and unlocking streams
protocol StreamResolving {
    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata?, preferredInfoHash: String?, filterExtended: Bool) async throws -> StreamResolutionResult
    func unlockStream(stream: Stream, item: MediaItem, season: Int?, episode: Int?) async throws -> Stream
}

/// Manages stream resolution, unlocking, and subtitle downloading
actor StreamService: StreamResolving {
    static let shared = StreamService()

    private init() {}

    // MARK: - Smart Retry State
    /// Tracks attempted infoHashes per IMDB ID for the current session
    /// [IMDB_ID: Set<InfoHash>]
    private var attemptedHashes: [String: Set<String>] = [:]

    /// Mark a stream hash as attempted for a specific item
    func markStreamAsAttempted(imdbId: String, hash: String) {
        if attemptedHashes[imdbId] == nil {
            attemptedHashes[imdbId] = []
        }
        attemptedHashes[imdbId]?.insert(hash)
        print("🧠 StreamService: Marked hash \(hash.prefix(8)) as attempted for \(imdbId)")
    }

    /// Get list of hashes to exclude for a specific item
    func getAttemptedHashes(for imdbId: String) -> Set<String> {
        return attemptedHashes[imdbId] ?? []
    }

    // MARK: - File Extension Validation
    
    /// Block suspicious file extensions that indicate fake/malware torrents
    /// Also blocks known error placeholder videos from providers
    /// Made internal for testing
    internal func isBlockedFileExtension(url: String) -> Bool {
        let urlLower = url.lowercased()
        // Remove query params for extension check
        let path = urlLower.components(separatedBy: "?").first ?? urlLower

        // Block malware/non-video extensions
        let blockedExtensions = [".iso", ".exe", ".dll", ".bat", ".cmd", ".msi", ".scr", ".vbs"]
        if blockedExtensions.contains(where: { path.hasSuffix($0) }) {
            return true
        }

        // Block Torrentio error placeholder videos
        // These indicate Real-Debrid couldn't provide the stream
        if path.contains("/videos/failed_") || path.contains("torrentio.strem.fun/videos/") {
            print("🚫 StreamService: Detected Torrentio error placeholder video")
            return true
        }
        
        // NEW: Block "Sample" files
        // Often torrents include a sample video (e.g. movie.sample.mkv) which is selected by mistake
        if path.contains("sample") {
             // Avoid false positives (rare, but possible if movie has "sample" in title?)
             // We check for specific delimiters usually found in sample filenames
             if path.contains(".sample.") || path.contains("-sample.") || path.contains("_sample.") || path.contains(" sample.") || path.hasSuffix("-sample.mkv") || path.hasSuffix("-sample.mp4") {
                 print("🚫 StreamService: Detected Sample video: \(url)")
                 return true
             }
        }
        
        // Block Trailers
        if path.contains("trailer.") || path.contains("_trailer") || path.contains("-trailer") {
            print("🚫 StreamService: Detected Trailer video: \(url)")
            return true
        }

        return false
    }

    // MARK: - Stream Resolution


    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata? = nil, preferredInfoHash: String? = nil, filterExtended: Bool = false) async throws -> StreamResolutionResult {
        LogManager.shared.info("🎬 StreamService: Starting resolution for: \(item.name)")
        
        // Step 0: Early validation - Check for Real-Debrid API key
        let rdKey = await KeychainManager.shared.get(service: "realdebrid")
        if rdKey == nil || rdKey?.isEmpty == true {
            LogManager.shared.warning("❌ StreamService: No Real-Debrid key configured")
            throw StreamError.noRealDebridKey
        }

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
            LogManager.shared.warning("⚠️ StreamService: Corrected movie request - removed season/episode")
        }

        // Step 2: Continue with regular stream resolution (trusted pack filtering happens server-side)
        print("🎬 StreamService: Resolving \(item.type) - trusted pack filtering will be applied server-side")

        // Step 3: Get Stream Bucket (Direct Resolver Call)
        NSLog("⚡️ StreamService: Resolving streams via StreamResolver (Bypassing HTTP)...")

        // Get exclusion list for this item (Smart Retry)
        let excludedHashes = getAttemptedHashes(for: item.id)
        if !excludedHashes.isEmpty {
            print("🧠 StreamService: Exclusion list has \(excludedHashes.count) previous attempts for \(item.id)")
        }

        var bucketsResponse = try await StreamResolver.shared.resolveStreamsByQuality(
            imdbId: item.id,
            type: item.type,
            season: finalSeason,
            episode: finalEpisode,
            name: item.name,
            year: finalMetadata.year,
            excludedHashes: excludedHashes,
            ignoreVerified: false
        )

        // Robustness Check: If we got a Verified Stream, test it immediately.
        // If it works, return successfully. If it fails, force a full scrape.
        if let primary = bucketsResponse.buckets.fullHD?.primary, primary.provider == "verified" {
            print("⚡️ StreamService: Testing verified stream viability...")
            do {
                let unlocked = try await unlockStream(stream: primary, item: item, season: finalSeason, episode: finalEpisode)
                print("✅ StreamService: Verified stream is VIABLE. Returning immediately.")
                return StreamResolutionResult(stream: unlocked, metadata: finalMetadata, candidateStreams: [])
            } catch {
                print("❌ StreamService: Verified stream FAILED to unlock. Falling back to full scrape.")
                // Retry with verification ignored
                // Retry with verification ignored
                bucketsResponse = try await StreamResolver.shared.resolveStreamsByQuality(
                    imdbId: item.id,
                    type: item.type,
                    season: finalSeason,
                    episode: finalEpisode,
                    name: item.name,
                    year: finalMetadata.year,
                    excludedHashes: excludedHashes,
                    ignoreVerified: true
                )
            }
        }

        // NEW: Enforce 1080p Max for Events
        var effectiveQuality = quality
        if filterExtended && quality == .uhd4k {
            print("🚫 StreamService: Event Mode detected. Downgrading requested 2160p to 1080p.")
            effectiveQuality = .fullHD
        }

        let buckets = bucketsResponse.buckets
        let rawBucket: QualityBucket?
        switch effectiveQuality {
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
                print("⚠️ StreamService: Requested hash not found in resolved streams. Attempting forced direct resolve.")
                // Attempt to force resolve the hash directly via Debrid (Unlocker)
                // We construct a synthetic stream object with the required Hash
                forcedStream = Stream(
                    title: "Shared Stream (Exact Match)",
                    provider: "direct",
                    infoHash: targetHash
                )
            }
        }

        // If forced stream is found, we skip standard selection logic
        if let match = forcedStream {
            streamsToTry = [match]
        } else {
            // 1. Requested Quality (usually 1080p)
            streamsToTry.append(contentsOf: extractStreams(from: rawBucket))
        }

        if forcedStream == nil && effectiveQuality == .fullHD {
            // 2. Fallback: 720p (Safe for older hardware)
            // RESTRICTION: Disable 720p fallback for Events (Strict 1080p)
            // UNLESS we have no 1080p streams, then we must accept lower quality
            if !filterExtended || streamsToTry.isEmpty {
                let hdStreams = extractStreams(from: buckets.hd)
                 if !hdStreams.isEmpty {
                    print("   ➕ Added \(hdStreams.count) 720p streams as backup")
                    streamsToTry.append(contentsOf: hdStreams)
                }
            } else {
                print("   🚫 StreamService: Skipping 720p backup streams (Event Mode - Strict 1080p)")
            }

            // 3. Fallback: 480p (SD) - Safe for all hardare
            if !filterExtended || streamsToTry.isEmpty {
                 let sdStreams = extractStreams(from: buckets.sd)
                 if !sdStreams.isEmpty {
                    print("   ➕ Added \(sdStreams.count) 480p streams as backup")
                    streamsToTry.append(contentsOf: sdStreams)
                 }
            } else {
                 print("   🚫 StreamService: Skipping 480p backup streams (Event Mode - Strict 1080p)")
            }
        }

        guard !streamsToTry.isEmpty else {
            throw APIError.noStreamsFound
        }

        LogManager.shared.info("📦 StreamService: Found \(streamsToTry.count) total streams to try (across all qualities)")

        // Step 3: Apply Tiered Codec Safety Filter
        // Goal: Prioritize H.264 (best compat), then 8-bit x265 (okay), then anything (last resort)

        let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]
        let tenBitKeywords = ["10bit", "10-bit", "10 bit"]

        // Tier 1: Strict H.264 Preference (Original Behavior)
        // Completely removes anything looking like x265
        let tier1Streams = streamsToTry.compactMap { stream -> Stream? in
            let titleLower = stream.title.lowercased()
            // REMOVED: DebridSearch whitelist. We want Strict H.264 in Tier 1.
            // x265 Debrid streams will fall to Tier 2 (8-bit) or Tier 3 (10-bit fallback).
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
                // Add "Hi10P" to 10-bit keywords
                let extendedTenBitKeywords = tenBitKeywords + ["hi10p"]
                let isTenBit = extendedTenBitKeywords.contains { titleLower.contains($0) }
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
            LogManager.shared.error("❌ StreamService: No streams available even after Tier 3 fallback")
            throw APIError.noStreamsFound
        }

        // Step 3.5: Apply Keyword Safety Filter (Remux, etc) AND Extended Cut Filter
        // User reported performance issues (spinning beach ball) with Remux files
        var blockedKeywords = ["remux"]

        // NEW: Filter extended cuts if requested (for events)
        if filterExtended {
            print("🚫 StreamService: Applying Extended Cut Filter (Event Mode)")
            blockedKeywords.append(contentsOf: ["extended", "director", "uncut", "unrated", "special edition"])
        }

        let keywordFiltered = filteredStreams.compactMap { stream -> Stream? in
            let titleLower = stream.title.lowercased()
            if blockedKeywords.contains(where: { titleLower.contains($0) }) {
                // Whitelist DebridSearch (User Cloud)
                if stream.provider == "debridsearch" {
                    print("🛡️ StreamService: Allowing restricted keyword for DebridSearch: \(stream.title)")
                    return stream
                }
                print("🚫 StreamService: Blocking stream with restricted keyword: \(stream.title)")
                return nil
            }
            return stream
        }

        guard !keywordFiltered.isEmpty else {
            LogManager.shared.error("❌ StreamService: No streams available after keyword filter")

            // Fallback: If we filtered everything because of "extended" but we have no other choice,
            // we should probably fail rather than play the wrong runtime event?
            // User requested explicit filtering for schedule accuracy.

            // However, if it's just REMUX blocking that caused empty, maybe we relax?
            // For now, let's strict fail to respect the user's intent to avoid issues.
            throw APIError.noStreamsFound
        }

        // Step 3.6: Language Purity Filter
        // Goal: Deprioritize streams with localized/dual audio tags (e.g. "Ita", "Multi") unless no other option exists

        // Safe keywords (unlikely to be part of a normal English word)
        let safeLocalizedKeywords = ["german", "french", "italian", "russian", "spanish", "truefrench", "multi", "dual", "dubbed", "dublado", "doblado"]

        // Risky keywords (must be surrounded by delimiters to avoid false positives like "Stranger" -> "ger")
        let riskyLocalizedKeywords = ["ger", "fre", "ita", "rus", "latino", "vff", "vfq"]

        var cleanStreams: [Stream] = []
        var deprioritizedStreams: [Stream] = []

        for stream in keywordFiltered {
            let titleLower = stream.title.lowercased()
            var isLocalized = false

            // 1. Check safe keywords (loose match)
            if safeLocalizedKeywords.contains(where: { titleLower.contains($0) }) {
                isLocalized = true
            }
            
            // Whitelist DebridSearch from language deprioritization
            if stream.provider == "debridsearch" {
                isLocalized = false
            }

            // 2. Check risky keywords (strict delimiter match)
            if !isLocalized {
                for keyword in riskyLocalizedKeywords {
                    // Check common delimiter patterns
                    if titleLower.contains(" \(keyword) ") ||
                       titleLower.contains(".\(keyword).") ||
                       titleLower.contains("-\(keyword)-") ||
                       titleLower.contains("_\(keyword)_") ||
                       titleLower.contains("(\(keyword))") ||
                       titleLower.contains("[\(keyword)]") ||
                       titleLower.hasSuffix("-\(keyword)") ||
                       titleLower.hasSuffix(".\(keyword)") ||
                       titleLower.hasSuffix(" \(keyword)") {
                        isLocalized = true
                        break
                    }
                }
            }

            if isLocalized {
                deprioritizedStreams.append(stream)
            } else {
                cleanStreams.append(stream)
            }
        }

        var languageFilteredStreams = keywordFiltered

        if !cleanStreams.isEmpty {
            print("✅ StreamService: Found \(cleanStreams.count) 'Clean' English streams. Deprioritizing \(deprioritizedStreams.count) localized/dual streams.")
            languageFilteredStreams = cleanStreams
        } else if !deprioritizedStreams.isEmpty {
             print("⚠️ StreamService: No 'Clean' English streams found. Falling back to \(deprioritizedStreams.count) localized/dual streams.")
             languageFilteredStreams = deprioritizedStreams
        }

        // Step 4: Apply File Size Limit (Max 12GB) for 1080p
        // Older hardware (2015 Macs) struggles with large files, especially H.264 Remuxes (30GB+)
        var finalStreams = languageFilteredStreams

        // Force bypass filters if we have a locked stream
        if let match = forcedStream {
            print("🔒 StreamService: Bypassing filters for enforced stream")
            // Ensure the forced stream is the only one in finalStreams.
            // Note: keywordFiltered might have removed it?
            // We should ideally assume 'match' is valid if the host played it, but let's check keyword safety?
            // Actually, for sync, we should force it even if it has a 'bad' keyword locally if the user is joining a party.
            finalStreams = [match]
        } else {

        if quality == .fullHD || quality == .uhd4k {
            let maxSizeBytes: Double = 22 * 1024 * 1024 * 1024 // 22 GB in bytes

            // MIN SIZE RULE: 1080p/4K movies should not be tiny (filters out fake files/samples)
            // Movies: Min 600MB for 1080p
            // Series: Min 150MB for 1080p (allows short anime/cartoons)
            let minSizeBytes: Double = (item.type == "movie") ? (600 * 1024 * 1024) : (150 * 1024 * 1024)

            let sizeFiltered = finalStreams.compactMap { stream -> Stream? in
                let sizeInBytes = self.parseSizeToBytes(stream.size)

                // If parsing failed (returns infinity), we keep the stream to be safe
                if sizeInBytes == Double.greatestFiniteMagnitude {
                    return stream
                }

                // Check Minimum Size
                if sizeInBytes < minSizeBytes {
                   let sizeMB = sizeInBytes / 1_048_576.0
                   print("⚠️ StreamService: Skipping tiny file (Possible fake/sample): \(stream.title) (\(String(format: "%.0f", sizeMB)) MB < \(Int(minSizeBytes/1048576)) MB)")
                   return nil
                }

                if quality == .fullHD && sizeInBytes > maxSizeBytes {
                    let sizeGB = sizeInBytes / 1_073_741_824.0

                    // 🌟 Smart Limit: Allow larger files (up to 30GB) for trusted "Elite" groups
                    // These groups (LoRD, DON, Wiki) produce high-quality encodes that justify the size
                    let trustedHeavyGroups = ["lord", "don", "wiki", "tayto", "sartre", "ctrlhd", "flux", "ntb"]
                    let isTrusted = trustedHeavyGroups.contains { stream.title.lowercased().contains($0) }

                    // 📦 Season Pack Exception: Allow massive files (up to 300GB) if it's a pack
                    if stream.isPack {
                        let maxPackBytes: Double = 300 * 1024 * 1024 * 1024
                        if sizeInBytes < maxPackBytes {
                            print("📦 StreamService: Allowing massive Season Pack (\(String(format: "%.2f", sizeGB)) GB): \(stream.title)")
                            return stream
                        } else {
                            print("⚠️ StreamService: Skipping Season Pack (Too Large >300GB): \(stream.title) (\(String(format: "%.2f", sizeGB)) GB)")
                            return nil
                        }
                    }

                    if isTrusted && sizeInBytes < (30 * 1024 * 1024 * 1024) {
                        print("✨ StreamService: Allowing large file (\(String(format: "%.2f", sizeGB)) GB) from trusted group: \(stream.title)")
                        return stream
                    }

                    print("⚠️ StreamService: Skipping large file (1080p limit): \(stream.title) (\(String(format: "%.2f", sizeGB)) GB)")
                    return nil
                }
                return stream
            }

            if !sizeFiltered.isEmpty {
                finalStreams = sizeFiltered
                print("📦 StreamService: \(finalStreams.count) streams remain after size filter")
            } else {
                print("⚠️ StreamService: Size filter removed all streams, falling back to largest available (likely best quality)")
                // Fallback to LARGEST available if we filtered everything out (e.g. all were small or all were too big)
                // Prefer largest as it usually means better quality / actual movie
                if let largest = filteredStreams.max(by: { stream1, stream2 in
                    let size1 = parseSizeToBytes(stream1.size)
                    let size2 = parseSizeToBytes(stream2.size)
                    // Treat infinity as 0 for comparison to prioritize known sizes
                    let s1 = size1 == Double.greatestFiniteMagnitude ? 0 : size1
                    let s2 = size2 == Double.greatestFiniteMagnitude ? 0 : size2
                    return s1 < s2
                }) {
                    finalStreams = [largest]
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
                
                // Return selected stream AND remaining candidates
                // We use finalStreams (all valid streams) and remove the one we just unlocked/selected
                // NOTE: We do NOT remove previous failed attempts because they failed for a reason (unlock error),
                // but technically they are still 'candidates' if we wanted to retry them later?
                // No, if they failed unlock loop here, they are dead.
                // The loop continues on failure. So 'index' is the current successful one.
                // The streams AFTER index are candidates.
                // The streams BEFORE index failed unlock.
                
                // However, for robustness, let's just return ALL streams except the current one?
                // Or just the subsequent ones?
                // If the previous ones failed "Unlock" (HTTP error), retrying them is probably futile.
                // So let's return streams from index + 1 onwards.
                
                // Build candidate streams for failover:
                // 1. Remaining streams from the same priority tier (finalStreams)
                // 2. APPEND all other valid streams (including 10-bit) as "last resort" fallback
                // This ensures if the CDN returns a broken file, we can try alternate codecs
                var candidateStreams = Array(finalStreams.dropFirst(index + 1))
                
                // Append deprioritized streams (10-bit, etc.) that weren't in finalStreams
                // These are from streamsToTry (pre-filter) minus what's already in candidateStreams
                let alreadyIncluded = Set(candidateStreams.map { $0.id })
                let fallbackStreams = streamsToTry.filter { !alreadyIncluded.contains($0.id) && $0.id != stream.id }
                if !fallbackStreams.isEmpty {
                    print("📦 StreamService: Appending \(fallbackStreams.count) fallback streams (alternate codecs)")
                    candidateStreams.append(contentsOf: fallbackStreams)
                }
                
                print("📦 StreamService: Returning \(candidateStreams.count) candidate streams for fallback")
                
                return StreamResolutionResult(stream: unlockedStream, metadata: finalMetadata, candidateStreams: candidateStreams)
            } catch {
                // Auto-Report Server Errors (5xx) to Admin Dashboard
                let errorMsg = error.localizedDescription
                if errorMsg.contains("HTTP 5") {
                    LogManager.shared.error("🚨 StreamService: [Server Fail] Unlock failed for \(stream.title): \(errorMsg)", error: error)
                } else {
                    LogManager.shared.warning("❌ StreamService: [Attempt \(index + 1)/\(finalStreams.count)] Unlock failed for \(stream.title): \(errorMsg)")
                }

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
        // Check for direct HTTP URL (Pre-unlocked)
        if let url = stream.url, (url.hasPrefix("http://") || url.hasPrefix("https://")) {
            
            // NEW: Resolve "resolve" URLs (Debrid Search) to final direct links
            // These URLs are redirects (302) to the actual file. MPV fails on them, so we must resolve them now.
            var finalURL = url
            if url.contains("/resolve/") {
                 print("🔍 StreamService: Resolving redirect URL: \(url)")
                 if let resolved = await resolveRedirect(url: url) {
                     print("✅ StreamService: Resolved to: \(resolved)")
                     
                     // CRITICAL: Validate resolved URL is a valid video file
                     if isBlockedFileExtension(url: resolved) {
                         print("🚫 StreamService: Blocked suspicious file extension in resolved URL. Skipping stream.")
                         throw APIError.invalidStream
                     }
                     
                     finalURL = resolved
                 } else {
                     print("⚠️ StreamService: Failed to resolve URL, using original.")
                 }
            }

            print("⚡️ StreamService: Stream is already a direct URL. Skipping backend unlock.")

            // Still process subtitles
            var finalStream = stream
            
            // Update URL if resolved
            if finalURL != url {
                finalStream = Stream(
                     url: finalURL,
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
            }
            
             if let subtitles = finalStream.subtitles, !subtitles.isEmpty {
                // Optimize: Cap at 5 subtitles to prevent blocking playback start
                let limitedSubtitles = Array(subtitles.prefix(5))
                NSLog("📥 StreamService: Pre-downloading %d (capped from %d) subtitles for direct stream...", limitedSubtitles.count, subtitles.count)
                let downloadedSubs = await downloadSubtitlesInParallel(subtitles: limitedSubtitles, season: season, episode: episode)
                finalStream.subtitles = downloadedSubs
            }
            return finalStream
        }

        guard let infoHash = stream.infoHash else {
            throw APIError.noStreamsFound
        }

        print("🔓 StreamService: Unlocking with infoHash: \(infoHash.prefix(12))...")

        // CRITICAL FIX: Don't default to 0 if fileIdx is nil (Pack support)
        let unlockURL = URL(string: "\(Config.serverURL)/api/streams/unlock")!
        var request = URLRequest(url: unlockURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(Config.localAuthToken, forHTTPHeaderField: "X-RedLemon-Auth")

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
            let responseBody = String(data: data, encoding: .utf8) ?? "No body"
            let errorMessage = "HTTP \(httpResponse.statusCode): \(responseBody)"
            throw APIError.networkError(NSError(domain: "UnlockError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
        }

        struct UnlockResponse: Codable {
            let url: String
            let filename: String
        }

        let unlockResult = try JSONDecoder().decode(UnlockResponse.self, from: data)

        // CRITICAL: Validate unlocked URL is a valid video file
        if isBlockedFileExtension(url: unlockResult.url) {
            print("🚫 StreamService: Unlocked URL has suspicious extension. Skipping stream.")
            throw APIError.invalidStream
        }

        print("✅ StreamService: Stream unlocked successfully!")

        // Create unlocked stream
        var unlockedStream = Stream(
            url: unlockResult.url,
            title: unlockResult.filename.isEmpty ? stream.title : unlockResult.filename, // Fix: Use returned filename
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
            // Optimize: Cap at 5 subtitles to prevent blocking playback start
            let limitedSubtitles = Array(subtitles.prefix(5))
            NSLog("📥 StreamService: Pre-downloading %d (capped from %d) subtitles...", limitedSubtitles.count, subtitles.count)
            let downloadedSubs = await downloadSubtitlesInParallel(subtitles: limitedSubtitles, season: season, episode: episode)
            unlockedStream.subtitles = downloadedSubs
        }

        return unlockedStream
    }

    // MARK: - Subtitle Downloading

    func downloadSubtitlesInParallel(subtitles: [Subtitle], season: Int? = nil, episode: Int? = nil) async -> [Subtitle] {
        NSLog("🐛 StreamService: downloadSubtitlesInParallel called. Season: \(String(describing: season)), Episode: \(String(describing: episode)), Count: \(subtitles.count)")
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
                        if !subtitle.url.contains("token=") {
                            // Append token if missing
                            var newUrl = subtitle.url
                            if newUrl.contains("?") {
                                newUrl += "&token=\(Config.localAuthToken)"
                            } else {
                                newUrl += "?token=\(Config.localAuthToken)"
                            }
                            // Create copy with new URL
                            return Subtitle(
                                id: subtitle.id,
                                url: newUrl,
                                lang: subtitle.lang,
                                label: subtitle.label,
                                srclang: subtitle.srclang,
                                kind: subtitle.kind,
                                provider: subtitle.provider
                            )
                        }
                        return subtitle // Already has token, return as-is
                    }

                    if subtitle.url.hasPrefix("/subtitle/") {
                        NSLog("✅ DEBUG: Raw SubDL URL detected, converting to proxy URL")
                        // Convert raw SubDL URL to proxy URL
                        // Use shared helper for robust URL construction (handles encoding & params)
                        let url = LocalAPIClient.shared.getSubtitleURL(downloadPath: subtitle.url, season: season, episode: episode)
                        let finalProxyURL = url + (url.contains("?") ? "&" : "?") + "token=\(Config.localAuthToken)"
                        
                        NSLog("🐛 StreamService: Constructed Proxy URL: %@", finalProxyURL)

                        return Subtitle(
                            id: subtitle.id,
                            url: finalProxyURL,
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
                        var request = URLRequest(url: url)
                        // Add auth token if requesting from local server
                        if url.absoluteString.contains("127.0.0.1") || url.absoluteString.contains("localhost") {
                            request.setValue(Config.localAuthToken, forHTTPHeaderField: "X-RedLemon-Auth")
                        }

                        let (data, response) = try await session.data(for: request)

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

    /// Helper to resolve HTTP redirects (e.g. for DebridSearch /resolve/ URLs)
    private func resolveRedirect(url: String) async -> String? {
        guard let urlObj = URL(string: url) else { return nil }
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 8.0 // 8 seconds max to resolve
        config.timeoutIntervalForResource = 8.0
        let session = URLSession(configuration: config)
        
        var request = URLRequest(url: urlObj)
        request.httpMethod = "HEAD"
        
        do {
            let (_, response) = try await session.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                // Return the final URL (URLSession follows redirects by default)
                return httpResponse.url?.absoluteString
            }
        } catch {
            print("⚠️ StreamService: HEAD resolution failed (\(error.localizedDescription)). Falling back to GET (Range: 0-0)...")
            
            // Fallback to GET with Range header (minimal data download)
            var getRequest = URLRequest(url: urlObj)
            getRequest.httpMethod = "GET"
            getRequest.setValue("bytes=0-0", forHTTPHeaderField: "Range")
            
            do {
                let (_, response) = try await session.data(for: getRequest)
                if let httpResponse = response as? HTTPURLResponse {
                    return httpResponse.url?.absoluteString
                }
            } catch {
                print("❌ StreamService: Final redirect resolution failed: \(error)")
            }
        }
        return nil
    }
}
