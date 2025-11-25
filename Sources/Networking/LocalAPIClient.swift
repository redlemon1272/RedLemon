import Foundation

/// Client for communicating with local Vapor server
@MainActor
class LocalAPIClient: ObservableObject {
    static let shared = LocalAPIClient()

    private var baseURL: String {
        Config.serverURL
    }
    private let session: URLSession

    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 300
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        self.session = URLSession(configuration: config)
    }

    // MARK: - Metadata (Cinemeta)

    func fetchPopularMovies() async throws -> [MediaItem] {
        // Use fixed cache key (no hardware detection)
        let cacheKey = "popular_movies_fixed"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return cached
        }

        let url = URL(string: "\(baseURL)/api/metadata/catalog/movie/popular")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

        // Apply fixed catalog size (conservative for all devices)
        let fixedSize = 15
        let items = response.metas.prefix(fixedSize).map { MediaItem(from: $0) }

        print("📊 Using fixed catalog size: \(fixedSize) items")

        // Cache result
        await CacheManager.shared.setCatalog(key: cacheKey, value: items)

        return items
    }

    func fetchPopularShows() async throws -> [MediaItem] {
        // Use fixed cache key (no hardware detection)
        let cacheKey = "popular_shows_fixed"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return cached
        }

        let url = URL(string: "\(baseURL)/api/metadata/catalog/series/popular")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

        // Apply fixed catalog size (conservative for all devices)
        let fixedSize = 15
        let items = response.metas.prefix(fixedSize).map { MediaItem(from: $0) }

        print("📊 Using fixed catalog size: \(fixedSize) items")

        // Cache result
        await CacheManager.shared.setCatalog(key: cacheKey, value: items)

        return items
    }

    func fetchTopMoviesForEvents() async throws -> [MediaItem] {
        // Use the Stremio Streaming Addon directly (same as BrowseView)
        // This ensures we get high-quality streaming content (Netflix, Disney+, etc.)
        // and avoids "In Cinema" movies that are CAM quality
        let addonBaseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"
        
        let catalogs = [
            "nfx", // Netflix
            "dnp", // Disney+
            "hlu", // Hulu
            "amp"  // Prime Video
        ]
        
        var allMetas: [StremioMeta] = []
        
        // Fetch from all catalogs
        print("🚀 Fetching from \(catalogs.count) streaming catalogs (Direct Stremio)...")
        
        for catalog in catalogs {
            do {
                let catalogURL = URL(string: "\(addonBaseURL)/catalog/movie/\(catalog).json")!
                // Use standard request without heavy retry logic for catalogs
                let (data, _) = try await session.data(from: catalogURL)
                let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
                allMetas.append(contentsOf: response.metas)
                print("   ✅ Fetched \(response.metas.count) items from \(catalog)")
            } catch {
                print("   ⚠️ Failed to fetch \(catalog): \(error)")
            }
        }
        
        // Deduplicate by ID
        var seenIds = Set<String>()
        let uniqueMetas = allMetas.filter { meta in
            if seenIds.contains(meta.id) {
                return false
            }
            seenIds.insert(meta.id)
            return true
        }
        
        // DETERMINISTIC SHUFFLE WITH FIXED SEED:
        // 1. Sort by ID first to ensure a stable starting point (removing network race condition order)
        let sortedMetas = uniqueMetas.sorted { $0.id < $1.id }
        
        // 2. CYCLE-BASED SEED: Changes after each 80-movie marathon completes
        // Uses conservative estimate to ensure shuffle happens AFTER cycle ends
        
        // Calculate which "generation" we're in based on elapsed time
        let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01 00:00:00 UTC
        let timeSinceEpoch = Date().timeIntervalSince(epoch)
        
        // Use CONSERVATIVE estimate (2.5 hours avg) to ensure we don't shuffle mid-cycle
        // Most movies are 90-150 min, so 2.5 hours ensures we wait for longest movies
        // 80 movies × 2.5 hours = 200 hours per cycle
        let conservativeMovieDuration: TimeInterval = 9000  // 2.5 hours
        let cycleDuration = conservativeMovieDuration * 80  // ~200 hours (8.3 days)
        
        // Calculate which cycle we're in (0, 1, 2, ...)
        let cycleNumber = Int(timeSinceEpoch / cycleDuration)
        
        // Base seed + cycle number = new shuffle each cycle
        let baseSeed = 20250101
        let seed = baseSeed + cycleNumber
        
        print("🎲 Shuffling with cycle-based seed: \(seed) (Cycle #\(cycleNumber), ~\(Int(cycleDuration/3600))h per cycle)")
        
        // 3. Shuffle using seeded generator
        var generator = SeededGenerator(seed: seed)
        let shuffledMetas = sortedMetas.shuffled(using: &generator)
        
        // 4. Take top 30
        let selectedMetas = Array(shuffledMetas.prefix(80))  // Expanded from 30 to 80 for event marathon variety
        
        print("🚀 Processing \(selectedMetas.count) movies for Event Marathon...")
        
        // OPTIMIZATION: Manually construct MediaItems
        // This avoids 30+ network requests and prevents 502 errors/timeouts
        let fullItems = selectedMetas.map { meta -> MediaItem in
            // Construct standard MetaHub image URLs
            let backgroundURL = "https://images.metahub.space/background/medium/\(meta.id)/img"
            let logoURL = "https://images.metahub.space/logo/medium/\(meta.id)/img"
            
            return MediaItem(
                id: meta.id,
                type: meta.type,
                name: meta.name,
                poster: meta.poster,
                background: backgroundURL,
                logo: logoURL,
                description: nil,
                releaseInfo: meta.releaseInfo, // Stremio addon provides this
                year: meta.releaseInfo,        // Use releaseInfo as year
                imdbRating: meta.imdbRating,   // Stremio addon provides this
                genres: nil,
                runtime: nil
            )
        }
        
        print("📊 Ready to show \(fullItems.count) movies")
        return fullItems
    }

    // Simple Linear Congruential Generator for deterministic shuffling
    struct SeededGenerator: RandomNumberGenerator {
        private var state: UInt64
        
        init(seed: Int) {
            self.state = UInt64(seed)
        }
        
        mutating func next() -> UInt64 {
            state = 6364136223846793005 &* state &+ 1442695040888963407
            return state
        }
    }

    func searchMedia(query: String, type: String = "movie") async throws -> [MediaItem] {
        print("🔍 [DEBUG] searchMedia called with query: '\(query)', type: '\(type)'")

        // Input validation - prevent crashes from invalid input
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("🔍 [DEBUG] Empty or whitespace-only query")
            return []
        }

        guard query.count <= 100 else {
            print("🔍 [DEBUG] Query too long, truncating")
            let truncatedQuery = String(query.prefix(100))
            return try await searchMedia(query: truncatedQuery, type: type)
        }

        // Safe URL construction with hardware-compatible error handling
        var components = URLComponents(string: "\(baseURL)/api/metadata/search")
        components?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "type", value: type)
        ]

        guard let url = components?.url else {
            print("🔍 [DEBUG] Failed to create URL")
            throw APIError.invalidResponse
        }

        print("  API: GET \(url.absoluteString)")

        // Safe network request with timeout and retry logic
        do {
            let (data, response) = try await performSafeNetworkRequest(url: url)

            print("🔍 [DEBUG] Received \(data.count) bytes of data")

            // Validate response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("🔍 [DEBUG] Invalid HTTP response")
                throw APIError.invalidResponse
            }

            print("  API: Response status \(httpResponse.statusCode)")
            guard httpResponse.statusCode == 200 else {
                print("🔍 [DEBUG] HTTP error: \(httpResponse.statusCode)")
                throw APIError.invalidResponse
            }

            // Validate data
            guard data.count > 0 else {
                print("🔍 [DEBUG] Empty response received")
                throw APIError.invalidResponse
            }

            // Safe JSON parsing with multiple fallbacks
            return try await parseSearchResponse(data: data, type: type)

        } catch {
            print("🔍 [DEBUG] Network or parsing error: \(error)")

            // Return empty result instead of crashing
            if error is APIError {
                throw error
            } else {
                throw APIError.networkError(error)
            }
        }
    }

    // MARK: - Hardware-Safe Network Methods

    /// Perform network request with CPU-compatible error handling and retry logic
    private func performSafeNetworkRequest(url: URL) async throws -> (Data, URLResponse) {
        let maxRetries = 3
        var lastError: Error?
        
        for attempt in 1...maxRetries {
            do {
                if attempt > 1 {
                    print("🔍 [DEBUG] Network attempt \(attempt)/\(maxRetries) for \(url.lastPathComponent)")
                }
                
                let (data, response) = try await session.data(from: url)
                
                // Check for 502 Bad Gateway or other server errors
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 502 || httpResponse.statusCode == 503 || httpResponse.statusCode == 504 {
                        throw APIError.networkError(URLError(.badServerResponse))
                    }
                }
                
                return (data, response)
            } catch {
                lastError = error
                
                // Don't retry cancellation errors
                if let urlError = error as? URLError, urlError.code == .cancelled {
                    throw error
                }
                
                print("🔍 [DEBUG] Network attempt \(attempt) failed: \(error)")
                
                // Wait before retry (exponential backoff)
                if attempt < maxRetries {
                    let delay = UInt64(pow(2.0, Double(attempt)) * 500_000_000) // 1s, 2s, 4s
                    try await Task.sleep(nanoseconds: delay)
                }
            }
        }
        
        throw lastError ?? APIError.networkError(URLError(.notConnectedToInternet))
    }

    /// Parse search response with multiple fallback strategies
    private func parseSearchResponse(data: Data, type: String) async throws -> [MediaItem] {
        // Debug: Log raw response data for troubleshooting
        if let jsonString = String(data: data, encoding: .utf8) {
            print("🔍 [DEBUG] Response preview: \(String(jsonString.prefix(200)))")

            // Check for error responses
            if jsonString.contains("\"error\"") || jsonString.contains("\"Error\"") {
                print("🔍 [DEBUG] Response contains error message")
                throw APIError.invalidResponse
            }
        }

        // Primary JSON decoding attempt
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(CinemetaSearchResponse.self, from: data)
            print("🔍 [DEBUG] Primary JSON decoding successful")

            // Safe mapping with error handling
            let mediaItems = decoded.metas.compactMap { result -> MediaItem? in
                return MediaItem(from: result)
            }

            print("🔍 [DEBUG] Successfully created \(mediaItems.count) MediaItem objects")
            return mediaItems

        } catch {
            print("🔍 [DEBUG] Primary JSON decoding failed: \(error)")

            // Fallback 1: Try to parse as array directly
            do {
                guard let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                    throw APIError.invalidResponse
                }

                print("🔍 [DEBUG] Fallback: parsing as array directly")
                let fallbackResults = jsonArray.compactMap { dict -> MediaItem? in
                    guard let id = dict["id"] as? String,
                          let name = dict["name"] as? String,
                          let type = dict["type"] as? String else {
                        return nil
                    }

                    return MediaItem(
                        id: id,
                        type: type,
                        name: name,
                        poster: dict["poster"] as? String,
                        background: nil,
                        logo: nil,
                        description: nil,
                        releaseInfo: nil,
                        year: dict["year"] as? String,
                        imdbRating: nil,
                        genres: nil,
                        runtime: nil
                    )
                }
                print("🔍 [DEBUG] Fallback parsing returned \(fallbackResults.count) items")
                return fallbackResults

            } catch {
                print("🔍 [DEBUG] All parsing attempts failed: \(error)")
                throw APIError.invalidResponse
            }
        }
    }

    func fetchMediaDetails(imdbId: String, type: String) async throws -> MediaItem {
        let url = URL(string: "\(baseURL)/api/metadata/meta/\(type)/\(imdbId)")!
        let (data, _) = try await session.data(from: url)
        let response = try JSONDecoder().decode(CinemetaResponse.self, from: data)
        return MediaItem(from: response.meta)
    }

    func fetchMetadata(type: String, id: String) async throws -> MediaMetadata {
        let cacheKey = "\(type)_\(id)"

        // Check cache first
        if let cached = await CacheManager.shared.getMetadata(key: cacheKey) {
            return cached
        }

        let url = URL(string: "\(baseURL)/api/metadata/meta/\(type)/\(id)")!
        let (data, _) = try await session.data(from: url)

        // Debug: Log raw response
        if let jsonString = String(data: data, encoding: .utf8) {
            NSLog("📡 Raw metadata response length: %d bytes", data.count)
            if jsonString.contains("\"videos\"") {
                NSLog("✅ Raw response CONTAINS 'videos' field")
            } else {
                NSLog("❌ Raw response DOES NOT contain 'videos' field")
            }
        }

        let response = try JSONDecoder().decode(CinemetaResponse.self, from: data)
        let meta = response.meta

        NSLog("📦 Decoded CinemetaMeta - videos count: %d", meta.videos?.count ?? -1)

        let trailerURL: String? = {
            if let ytId = meta.trailers?.first?.source {
                return "https://www.youtube.com/watch?v=\(ytId)"
            }
            return nil
        }()

        let rating: Double? = {
            if let ratingStr = meta.imdbRating {
                return Double(ratingStr)
            }
            return nil
        }()

        let videos: [VideoEpisode]? = meta.videos?.map { video in
            VideoEpisode(
                id: video.id,
                title: video.displayTitle,  // Use displayTitle (handles both Cinemeta's "name" and Kitsu's "title")
                season: video.season,
                episode: video.episode,
                overview: video.description ?? video.overview,  // Try description first, fallback to overview
                released: video.released,
                thumbnail: video.thumbnail
            )
        }

        let metadata = MediaMetadata(
            id: meta.itemId,
            type: meta.type,
            title: meta.name,
            year: meta.year,
            posterURL: meta.poster,
            backgroundURL: meta.background,
            logoURL: meta.logo,
            description: meta.description,
            director: meta.director?.first,
            cast: meta.cast ?? [],
            genres: meta.genre ?? [],
            runtime: meta.runtime,
            imdbRating: rating,
            releaseInfo: meta.releaseInfo,
            trailerURL: trailerURL,
            videos: videos
        )

        // Cache result - FIXED: Use setMetadata instead of setCatalog
        await CacheManager.shared.setMetadata(key: cacheKey, value: metadata)

        return metadata
    }

    // MARK: - Stream Resolution

    func resolveAllStreams(imdbId: String, type: String, quality: String, season: Int? = nil, episode: Int? = nil, year: String? = nil) async throws -> [Stream] {
        NSLog("🔍 CLIENT: Resolving ALL streams - imdbId=%@, type=%@, quality=%@, year=%@", imdbId, type, quality, year ?? "nil")

        var components = URLComponents(string: "\(baseURL)/api/streams/resolveAll")!
        var queryItems = [
            URLQueryItem(name: "imdbId", value: imdbId),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "quality", value: quality)
        ]

        if let season = season {
            queryItems.append(URLQueryItem(name: "season", value: "\(season)"))
        }
        if let episode = episode {
            queryItems.append(URLQueryItem(name: "episode", value: "\(episode)"))
        }
        if let year = year {
            queryItems.append(URLQueryItem(name: "year", value: year))
        }

        components.queryItems = queryItems

        let request = URLRequest(url: components.url!)
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(AllStreamsResponse.self, from: data)

        NSLog("✅ CLIENT: Received %d streams from resolveAll endpoint", response.streams.count)
        return response.streams
    }

    // MARK: - Stream Resolution with Quality Buckets

    func resolveStreamsByQuality(imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, year: String? = nil) async throws -> QualityBuckets {
        NSLog("🔍 CLIENT: Resolving streams - imdbId=\(imdbId), type=\(type), year=\(year ?? "nil")")

        var components = URLComponents(string: "\(baseURL)/api/streams/resolveByQuality")!
        var queryItems = [
            URLQueryItem(name: "imdbId", value: imdbId),
            URLQueryItem(name: "type", value: type)
        ]

        if let season = season {
            queryItems.append(URLQueryItem(name: "season", value: "\(season)"))
        }
        if let episode = episode {
            queryItems.append(URLQueryItem(name: "episode", value: "\(episode)"))
        }
        if let year = year {
            queryItems.append(URLQueryItem(name: "year", value: year))
        }

        components.queryItems = queryItems

        let request = URLRequest(url: components.url!)
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(QualityBucketsResponse.self, from: data)

        // Filter only terrible quality sources (CAM, TS) - MPV plays everything else!
        let filteredBuckets = filterQualityStreams(response.buckets)

        return filteredBuckets
    }

    // MARK: - Subtitles (SubDL)

    func searchSubtitles(imdbId: String, type: String) async throws -> [SubDLSubtitle] {
        var components = URLComponents(string: "\(baseURL)/subtitles/search")!
        components.queryItems = [
            URLQueryItem(name: "imdbId", value: imdbId),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "languages", value: "en")
        ]

        let (data, _) = try await session.data(from: components.url!)
        let subtitles = try JSONDecoder().decode([SubDLSubtitle].self, from: data)
        return subtitles
    }

    func getSubtitleURL(downloadPath: String) -> String {
        // Encode download path as base64
        let encodedPath = Data(downloadPath.utf8).base64EncodedString()
        return "\(baseURL)/subtitles/subdl/\(encodedPath)"
    }

    // MARK: - Stream Quality Filtering (MPV - Universal Codec Support)

    /// Basic quality check - allow CAM/TS but let scoring handle preference
    /// MPV supports all codecs, so no codec filtering needed!
    private func isGoodQuality(_ stream: Stream) -> Bool {
        // Allow all sources through - quality scoring will handle prioritization
        // CAM/TS will score low, WEB-DL/BluRay will score high
        // This way, CAM shows when nothing else exists, but auto-upgrades when better quality releases
        return true
    }

    /// Scores a stream based on quality indicators (higher is better)
    private func scoreStream(_ stream: Stream) -> Int {
        let title = stream.title.uppercased()
        var score = 0

        // Prefer well-known reliable release groups (removed YIFY/YTS - poor quality)
        let goodGroups = ["RARBG", "PSA", "TIGOLE", "ION10", "SPARKS", "FGT", "QXR", "UTR"]
        for group in goodGroups {
            if title.contains(group) {
                score += 20
                break
            }
        }

        // Penalize known low-quality groups
        let badGroups = ["YIFY", "YTS", "YAWNTIC"]
        for group in badGroups {
            if title.contains(group) {
                score -= 30  // Heavy penalty
                break
            }
        }

        // HEAVY penalty for CAM/TS quality (theatrical recordings)
        // This ensures they only show when nothing else exists
        // But auto-upgrade to WEB-DL/BluRay when those release
        if title.contains("CAM") || title.contains("HDCAM") ||
           title.contains("HDTS") || title.contains("TELESYNC") || title.contains(" TS ") {
            score -= 100  // Massive penalty - only show if no other option
        }

        // Prefer BluRay > WEB-DL > WEBRip
        if title.contains("BLURAY") || title.contains("BLU-RAY") {
            score += 15
        } else if title.contains("WEB-DL") || title.contains("WEB DL") {
            score += 10
        } else if title.contains("WEBRIP") || title.contains("WEB-RIP") {
            score += 5
        }

        // Prefer MP4 containers (most compatible)
        if stream.ext?.lowercased() == "mp4" {
            score += 10
        }

        // Prefer H.264 over H.265 for reliability (H.265 more problematic on older macOS)
        if title.contains("H.264") || title.contains("X264") || title.contains("AVC") {
            score += 5
        }

        // Boost by seeders (capped at 50 to not override other factors)
        if let seeders = stream.seeders {
            score += min(seeders / 20, 50)
        }

        return score
    }

    /// Filters quality buckets to remove only terrible quality sources (CAM, TS)
    /// MPV supports all codecs, so minimal filtering!
    private func filterQualityStreams(_ buckets: QualityBuckets) -> QualityBuckets {
        return QualityBuckets(
            uhd4k: filterBucket(buckets.uhd4k),
            fullHD: filterBucket(buckets.fullHD),
            hd: filterBucket(buckets.hd),
            sd: filterBucket(buckets.sd)
        )
    }

    /// Filters a single quality bucket while preserving server's Netflix-first ordering
    private func filterBucket(_ bucket: QualityBucket?) -> QualityBucket? {
        guard let bucket = bucket else { return nil }

        // CRITICAL FIX: Preserve server's ordering - NO re-sorting!
        // Server already handles Netflix priority, quality ranking, and source selection
        // Client should only filter out terrible quality (CAM/TS) and preserve order

        // Filter streams for quality only, NO re-sorting to preserve server's Netflix priority
        var filteredPrimary: Stream?
        var filteredAlternates: [Stream] = []

        // Check primary stream
        if let primary = bucket.primary, isGoodQuality(primary) {
            filteredPrimary = primary
        }

        // Filter alternate streams (preserve server's order)
        if let alternates = bucket.alternates {
            filteredAlternates = alternates.filter { isGoodQuality($0) }
        }

        // Return bucket with preserved server ordering
        // Netflix will stay first because server ranked it as primary (score 100)
        return QualityBucket(
            primary: filteredPrimary,
            alternates: filteredAlternates.isEmpty ? nil : filteredAlternates
        )
    }

    // MARK: - Smart Stream Selection (ColorFruit logic ported)

    func getBestStream(for imdbId: String, type: String, quality: VideoQuality, season: Int? = nil, episode: Int? = nil) async throws -> Stream {
        print("🔍 Resolving streams by quality for: \(imdbId) @ \(quality.rawValue)")

        // Use quality buckets endpoint (ColorFruit /api/streams/resolveByQuality)
        let buckets = try await resolveStreamsByQuality(imdbId: imdbId, type: type, season: season, episode: episode)

        // Get quality bucket
        let bucket: QualityBucket?
        switch quality {
        case .uhd4k:
            bucket = buckets.uhd4k
        case .fullHD:
            bucket = buckets.fullHD
        case .hd:
            bucket = buckets.hd
        case .sd:
            bucket = buckets.sd
        }

        guard let selectedBucket = bucket, let primary = selectedBucket.primary else {
            throw APIError.noStreamsFound
        }

        print("✅ Found primary stream: \(primary.title)")
        print("   Provider: \(primary.provider)")
        print("   Seeders: \(primary.seeders ?? 0)")

        // Also log alternates for fallback
        if let alternates = selectedBucket.alternates, !alternates.isEmpty {
            print("   📦 \(alternates.count) alternate streams available for fallback")
        }

        return primary
    }

    /// Get the full quality bucket (primary + alternates) for fallback support
    func getStreamBucket(for imdbId: String, type: String, quality: VideoQuality, season: Int? = nil, episode: Int? = nil, year: String? = nil) async throws -> QualityBucket {
        let buckets = try await resolveStreamsByQuality(imdbId: imdbId, type: type, season: season, episode: episode, year: year)

        let bucket: QualityBucket?
        switch quality {
        case .uhd4k:
            bucket = buckets.uhd4k
        case .fullHD:
            bucket = buckets.fullHD
        case .hd:
            bucket = buckets.hd
        case .sd:
            bucket = buckets.sd
        }

        guard let selectedBucket = bucket else {
            throw APIError.noStreamsFound
        }

        return selectedBucket
    }

    // MARK: - Helpers

    private func parseSizeToMB(_ sizeString: String) -> Double? {
        let normalized = sizeString.lowercased().trimmingCharacters(in: .whitespaces)
        let components = normalized.components(separatedBy: CharacterSet.decimalDigits.inverted)

        guard let numStr = components.first(where: { !$0.isEmpty }),
              let value = Double(numStr) else {
            return nil
        }

        if normalized.contains("gb") {
            return value * 1024
        } else if normalized.contains("mb") {
            return value
        } else if normalized.contains("kb") {
            return value / 1024
        }

        return nil
    }
}

// MARK: - MediaItem (UI-friendly wrapper)

struct StreamResponse: Codable {
    let streams: [Stream]
}

struct AllStreamsResponse: Codable {
    let streams: [Stream]
    let count: Int
}

struct MediaItem: Identifiable, Codable, Equatable {
    let id: String
    let type: String
    let name: String
    let poster: String?
    let background: String?
    let logo: String?
    let description: String?
    let releaseInfo: String?
    let year: String?
    let imdbRating: String?
    let genres: [String]?
    let runtime: String?

    // SIMPLIFIED hardware-safe initializer - avoid complex property access
    init(id: String, type: String, name: String, poster: String?, background: String?, logo: String?, description: String?, releaseInfo: String?, year: String?, imdbRating: String?, genres: [String]?, runtime: String?) {
        // Use direct assignment - avoid computed properties that might cause CPU instruction issues
        self.id = id
        self.type = type
        self.name = name
        self.poster = poster
        self.background = background
        self.logo = logo
        self.description = description
        self.releaseInfo = releaseInfo
        self.year = year
        self.imdbRating = imdbRating
        self.genres = genres
        self.runtime = runtime
    }

    // HARDWARE-SAFE initializer from CinemetaSearchResult - avoid computed properties
    init(from result: CinemetaSearchResult) {
        print("🔍 [DEBUG] Creating MediaItem from CinemetaSearchResult")
        print("🔍 [DEBUG] result.id: \(result.id)")
        print("🔍 [DEBUG] result.type: \(result.type)")
        print("🔍 [DEBUG] result.name: \(result.name)")

        // Direct property access - avoid computed properties that might crash on older hardware
        self.id = result.id
        self.type = result.type
        self.name = result.name
        self.poster = result.poster
        self.background = nil  // Set to nil to avoid potential issues
        self.logo = nil
        self.description = nil
        self.releaseInfo = nil
        self.year = result.year
        self.imdbRating = nil
        self.genres = nil
        self.runtime = nil

        print("🔍 [DEBUG] Successfully created MediaItem: \(self.name)")
    }

    // HARDWARE-SAFE initializer from CinemetaMeta - avoid computed properties
    init(from meta: CinemetaMeta) {
        print("🔍 [DEBUG] Creating MediaItem from CinemetaMeta")
        print("🔍 [DEBUG] meta.itemId: \(meta.itemId)")
        print("🔍 [DEBUG] meta.type: \(meta.type)")
        print("🔍 [DEBUG] meta.name: \(meta.name)")

        // Use direct property access instead of computed property
        let itemId = meta.imdb_id ?? meta.id ?? "unknown"

        self.id = itemId
        self.type = meta.type
        self.name = meta.name
        self.poster = meta.poster
        self.background = meta.background
        self.logo = meta.logo
        self.description = meta.description
        self.releaseInfo = meta.releaseInfo
        self.year = meta.year
        self.imdbRating = meta.imdbRating  // Use the actual rating instead of nil
        self.genres = meta.genre  // Use the actual genres instead of nil
        self.runtime = meta.runtime

        print("🔍 [DEBUG] Successfully created MediaItem from meta: \(self.name)")
    }

    // Cinemeta returns full URLs, no need for construction
    var posterURL: URL? {
        guard let poster = poster else { return nil }
        return URL(string: poster)
    }

    var backgroundURL: URL? {
        guard let background = background else { return nil }
        return URL(string: background)
    }
    
    var logoURL: URL? {
        guard let logo = logo else { return nil }
        return URL(string: logo)
    }
}

enum VideoQuality: String, CaseIterable, Identifiable {
    case uhd4k = "2160p"
    case fullHD = "1080p"
    case hd = "720p"
    case sd = "480p"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .uhd4k: return "2160p Ultra HD"
        case .fullHD: return "1080p Full HD"
        case .hd: return "720p HD"
        case .sd: return "480p SD"
        }
    }
}

enum APIError: LocalizedError {
    case noStreamsFound
    case invalidResponse
    case networkError(Error)

    var errorDescription: String? {
        switch self {
        case .noStreamsFound:
            return "No streams found for this quality"
        case .invalidResponse:
            return "Invalid response from server"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}
// MARK: - Array Extension for Chunking
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
