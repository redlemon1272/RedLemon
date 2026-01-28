import Foundation

/// Protocol for fetching media metadata
protocol MetadataProvider {
    func fetchMetadata(type: String, id: String) async throws -> MediaMetadata
    func fetchMediaDetails(imdbId: String, type: String) async throws -> MediaItem
    func fetchPopularMovies() async throws -> [MediaItem]
    func fetchPopularShows() async throws -> [MediaItem]
    func searchMedia(query: String, type: String) async throws -> [MediaItem]
}

/// Client for communicating with local Vapor server
class LocalAPIClient: ObservableObject, MetadataProvider {
    static let shared = LocalAPIClient()

    private var baseURL: String {
        Config.serverURL
    }
    private let session: URLSession

    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15 // Fail fast for metadata
        config.timeoutIntervalForResource = 300
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        self.session = URLSession(configuration: config)
    }

    private func makeAuthorizedRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue(Config.localAuthToken, forHTTPHeaderField: "X-RedLemon-Auth")
        return request
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
        let request = makeAuthorizedRequest(url: url)

        // APPLY HOLY PATTERN #82: Run network and decoding off-thread
        return try await Task.detached(priority: .userInitiated) {
            let (data, _) = try await self.session.data(for: request)

            // Heavy decoding on background thread
            let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

            // Apply fixed catalog size (conservative for all devices)
            let fixedSize = 18
            let items = response.metas.prefix(fixedSize).map { MediaItem(from: $0) }

            // Update cache and return
            await CacheManager.shared.setCatalog(key: cacheKey, value: items)
            return items
        }.value
    }



    func fetchPopularShows() async throws -> [MediaItem] {
        // Use fixed cache key (no hardware detection)
        let cacheKey = "popular_shows_fixed"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return cached
        }

        let url = URL(string: "\(baseURL)/api/metadata/catalog/series/popular")!
        let request = makeAuthorizedRequest(url: url)

        // APPLY HOLY PATTERN #82: Run network and decoding off-thread
        return try await Task.detached(priority: .userInitiated) {
            let (data, _) = try await self.session.data(for: request)

            // Heavy decoding on background thread
            let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

            // Apply fixed catalog size (conservative for all devices)
            let fixedSize = 18
            let items = response.metas.prefix(fixedSize).map { MediaItem(from: $0) }

            // Update cache and return
            await CacheManager.shared.setCatalog(key: cacheKey, value: items)
            return items
        }.value
    }

    func fetchTopMoviesForEvents() async throws -> EventsConfig {
        print("🎬 [EventsView] Fetching movie events from centralized config...")

        // Fetch centralized config from Supabase
        // This ensures ALL RedLemon instances show identical movie lists
        do {
            let config = try await EventsConfigService.shared.fetchMovieEventsConfig()
            print("✅ [EventsView] Loaded \(config.movies.count) movies from config version \(config.version)")
            return config
        } catch {
            print("❌ [EventsView] Failed to fetch events config: \(error)")
            // Fallback: Throw error to user
            throw APIError.networkError(error)
        }
    }

    func fetchLargeCatalogForAdmin() async throws -> [MediaItem] {
        // Use a specific cache key for the large admin catalog
        // Use a specific cache key for the large admin catalog
        let cacheKey = "popular_movies_large_admin_v3" // Bump version for new size

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            print("📦 [Admin] Using cached large catalog (\(cached.count) items)")
            return cached
        }

        print("🌐 [Admin] Fetching large catalog (1000 items)...")
        var allItems: [MediaItem] = []
        var currentSkip = 0
        let targetCount = 2000
        let maxPages = 40 // Safety break

        for page in 0..<maxPages {
            if allItems.count >= targetCount { break }

            // Try to request 100 items, but the API might return fewer
            let urlString = "\(baseURL)/api/metadata/catalog/movie/popular?skip=\(currentSkip)&limit=100"
            guard let url = URL(string: urlString) else { continue }

            do {
                print("   [Admin] Fetching page \(page + 1) (skip=\(currentSkip))...")
                let (data, _) = try await session.data(for: makeAuthorizedRequest(url: url))
                let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

                let pageItems = response.metas.map { MediaItem(from: $0) }
                if pageItems.isEmpty {
                    print("   [Admin] No more items found at skip \(currentSkip). Stopping.")
                    break
                }

                allItems.append(contentsOf: pageItems)
                print("   [Admin] Received \(pageItems.count) items. Total: \(allItems.count)")

                // Increment skip by the ACTUAL number of items received to ensure no gaps
                // If the API supports limit, we might get 100. If not, we might get 20 or 50.
                // This adapts to whatever the server gives us.
                currentSkip += pageItems.count

                // Small delay to be nice to the server
                try await Task.sleep(nanoseconds: 200_000_000) // 0.2s
            } catch {
                print("   ⚠️ [Admin] Failed to fetch page \(page + 1): \(error)")
                // If we fail, we might want to stop or retry, but for now let's just break to avoid infinite loops of errors
                break
            }
        }

        // Deduplicate based on ID
        var uniqueItems: [MediaItem] = []
        var seenIds: Set<String> = []

        for item in allItems {
            if !seenIds.contains(item.id) {
                seenIds.insert(item.id)
                uniqueItems.append(item)
            }
        }

        print("📊 [Admin] Fetched \(uniqueItems.count) unique items (Target: \(targetCount))")

        // Cache result
        await CacheManager.shared.setCatalog(key: cacheKey, value: uniqueItems)

        return uniqueItems
    }

    /// ADMIN ONLY: Generates a new random schedule and uploads it to Supabase
    /// This becomes the single source of truth for ALL clients
    func generateAndUploadSchedule() async throws -> Int {
        print("🎲 [Admin] Generating new global schedule...")

        // Fetch a LARGE pool of movies (100+) to ensure variety
        // We do NOT use the standard fetchPopularMovies() because it's limited to 15 for older devices
        let allMovies = try await fetchLargeCatalogForAdmin()
        print("   [Admin] Pool size: \(allMovies.count) movies")

        // Fetch current config to preserve exclusions
        // FORCE REFRESH to ensure we have the latest exclusions (e.g. from a recent delete)
        NSLog("📝 [Admin] Fetching current config to retrieve exclusions...")
        let currentConfig = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
        let previouslyExcludedIds = Set(currentConfig.excludedMovieIds ?? [])

        NSLog("📝 [Admin] Found %d previously excluded movies", previouslyExcludedIds.count)
        if !previouslyExcludedIds.isEmpty {
            NSLog("📝 [Admin] Exclusions list: %@", String(describing: previouslyExcludedIds))
        } else {
            NSLog("⚠️ [Admin] Exclusions list is EMPTY. If you just deleted a movie, this is WRONG.")
        }
        if !previouslyExcludedIds.isEmpty {
            NSLog("📝 [Admin] Exclusions: %@", previouslyExcludedIds.joined(separator: ", "))
        }

        // Filter for "Thrilling" content
        let thrillingGenres: Set<String> = ["action", "adventure", "sci-fi", "thriller", "mystery", "crime", "horror"]
        // excludedTitles removed as it was unused
        // For now, popular movies is a good start.

        // 2. (REMOVED) Paramount Specific Fetching
        // User requested to remove specific Paramount movies and let it be random.

        // 3. Enrich and Filter for Thrilling Genres
        print("   [Admin] Processing \(allMovies.count) movies (fetching metadata if needed)...")

        var filteredMovies: [MediaItem] = []


        // Batch processing to avoid rate limiting
        let batchSize = 20
        let batches = allMovies.chunked(into: batchSize)

        // Debug counters
        var totalProcessed = 0
        var kept = 0

        for (batchIndex, batch) in batches.enumerated() {
            print("   [Admin] Processing batch \(batchIndex + 1)/\(batches.count) (\(batch.count) items)...")

            await withTaskGroup(of: MediaItem?.self) { group in
                for movie in batch {
                    group.addTask {
                        // Check persistent exclusions first
                        let cleanMovieId = movie.id.trimmingCharacters(in: .whitespacesAndNewlines)

                        if previouslyExcludedIds.contains(cleanMovieId) || previouslyExcludedIds.contains(movie.id) {
                            // NSLog("🚫 [Admin] Skipping excluded movie: \(movie.name) (ID: \(cleanMovieId))")
                            return nil
                        }

                        // Exclude specific titles
                        let excludedTitles = [
                            "the stringer: the man who took the photo",
                            "kinds of kindness",
                            "deaf president now"
                        ]
                        if excludedTitles.contains(movie.name.lowercased()) { return nil }

                        // Check if we need to fetch full metadata
                        var movieToUse = movie
                        let needsMetadata = (movie.genres?.isEmpty ?? true) || movie.background == nil || movie.logo == nil

                        if needsMetadata {
                            if let fullItem = try? await self.fetchMediaDetails(imdbId: movie.id, type: "movie") {
                                movieToUse = fullItem
                            } else {
                                print("   ⚠️ [Admin] Failed to fetch metadata for: \(movie.name)")
                                if movie.genres?.isEmpty ?? true {
                                    return nil
                                }
                            }
                        }

                        // Filter by genre
                        let genres = (movieToUse.genres ?? []).map { $0.lowercased() }
                        let movieGenresSet = Set(genres)

                        if !movieGenresSet.isDisjoint(with: thrillingGenres) {
                            return movieToUse
                        } else {
                            return nil
                        }
                    }
                }

                for await movie in group {
                    totalProcessed += 1
                    if let movie = movie {
                        filteredMovies.append(movie)
                        kept += 1
                    }
                }
            }

            // Small delay between batches
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s
        }

        print("📊 [Admin] Filtering Report:")
        print("   Total Processed: \(totalProcessed)")
        print("   Kept: \(kept)")
        print("   Total movies after filtering: \(filteredMovies.count)")

        // SAFETY CHECK: Never upload an empty list!
        guard !filteredMovies.isEmpty else {
            print("❌ [Admin] Generated list is empty! Aborting upload.")
            throw APIError.invalidResponse
        }

        // 6. Sort and Shuffle
        // Sort by popularity (vote_count) first to ensure quality
        // Then shuffle deterministically based on date seed
        // But for now, we want a random shuffle for the schedule since we are generating a static list
        // The admin can regenerate if they don't like it.
        var shuffledMovies = filteredMovies.shuffled()

        // Ensure we have enough movies
        if shuffledMovies.isEmpty {
            print("⚠️ [Admin] No movies found after filtering!")
            // Fallback to raw list if filtering was too aggressive
            shuffledMovies = allMovies.prefix(20).map { $0 }
        }

        // Log the final list for verification
        NSLog("✅ [Admin] Final list contains %d movies:", shuffledMovies.count)
        for (index, movie) in shuffledMovies.enumerated() {
            NSLog("   %d. %@ (ID: %@)", index + 1, movie.name, movie.id)
        }

        // 7. Upload to Supabase
        print("📤 [Admin] Uploading new schedule with \(shuffledMovies.count) movies...")

        // Pass the preserved excludedMovieIds to the upload function
        // This ensures they are persisted in the new config row
        let exclusionsToPersist = Array(previouslyExcludedIds)
        NSLog("📤 [Admin] Persisting %d exclusions: %@", exclusionsToPersist.count, String(describing: exclusionsToPersist))

        let newVersion = try await EventsConfigService.shared.uploadNewConfig(
            movies: shuffledMovies,
            excludedMovieIds: exclusionsToPersist
        )

        print("✅ [Admin] Schedule generated and uploaded successfully! Version: \(newVersion)")

        return newVersion
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
        let maxRetries = 5 // Increased retries for rate limits
        var lastError: Error?

        for attempt in 1...maxRetries {
            do {
                if attempt > 1 {
                    print("🔍 [DEBUG] Network attempt \(attempt)/\(maxRetries) for \(url.lastPathComponent)")
                }


                let request = makeAuthorizedRequest(url: url)
                let (data, response) = try await session.data(for: request)

                // Check for 502 Bad Gateway, 503 Service Unavailable, 504 Gateway Timeout, or 429 Too Many Requests
                if let httpResponse = response as? HTTPURLResponse {
                    if [429, 502, 503, 504].contains(httpResponse.statusCode) {
                        // Throw error to trigger retry
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
                    // Base delay 1s, max 10s
                    let baseDelay = 1_000_000_000.0 // 1 second
                    let delay = UInt64(min(baseDelay * pow(2.0, Double(attempt)), 10_000_000_000.0))
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
        let (data, _) = try await performSafeNetworkRequest(url: url)
        let response = try JSONDecoder().decode(CinemetaResponse.self, from: data)
        return MediaItem(from: response.meta)
    }

    // MARK: - Helper Methods

    func fetchMetadata(type: String, id: String) async throws -> MediaMetadata {
        // Check cache first
        let cacheKey = "meta_\(type)_\(id)"
        if let cached = await CacheManager.shared.getMetadata(key: cacheKey) {
            return cached
        }

        // Fetch from API
        let url = URL(string: "\(baseURL)/api/metadata/meta/\(type)/\(id)")!
        let (data, _) = try await performSafeNetworkRequest(url: url)
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

        // Cache result
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

        let request = makeAuthorizedRequest(url: components.url!)
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(AllStreamsResponse.self, from: data)

        NSLog("✅ CLIENT: Received %d streams from resolveAll endpoint", response.streams.count)
        return response.streams
    }

    // MARK: - Stream Resolution with Quality Buckets

    func resolveStreamsByQuality(imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, year: String? = nil) async throws -> QualityBuckets {
        NSLog("%@", "🔍 CLIENT: Resolving streams - imdbId=\(imdbId), type=\(type), year=\(year ?? "nil")")

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

        let request = makeAuthorizedRequest(url: components.url!)
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(QualityBucketsResponse.self, from: data)

        // Filter only terrible quality sources (CAM, TS) - MPV plays everything else!
        let filteredBuckets = filterQualityStreams(response.buckets)

        return filteredBuckets
    }

    // MARK: - Subtitles (SubDL)

    func searchSubtitles(imdbId: String, type: String, season: Int? = nil, episode: Int? = nil, name: String? = nil, year: Int? = nil, streamFilename: String? = nil) async throws -> [SubDLSubtitle] {
        var components = URLComponents(string: "\(baseURL)/subtitles/search")!
        var queryItems = [
            URLQueryItem(name: "imdbId", value: imdbId),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "languages", value: "en")
        ]

        if let season = season {
             queryItems.append(URLQueryItem(name: "season", value: "\(season)"))
        }
        if let episode = episode {
             queryItems.append(URLQueryItem(name: "episode", value: "\(episode)"))
        }
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        if let year = year {
            queryItems.append(URLQueryItem(name: "year", value: "\(year)"))
        }
        if let streamFilename = streamFilename {
            queryItems.append(URLQueryItem(name: "filename", value: streamFilename))
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 30 // Increased for deep searches on SubDL

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
             throw APIError.invalidResponse
        }

        if httpResponse.statusCode != 200 {
            // Try to read error from body
            if let errorMsg = String(data: data, encoding: .utf8) {
                print("❌ Subtitle search failed: \(errorMsg)")
            }
             throw APIError.serverError(statusCode: httpResponse.statusCode)
        }

        let subtitles = try JSONDecoder().decode([SubDLSubtitle].self, from: data)
        return subtitles
    }


    func getSubtitleURL(downloadPath: String, season: Int? = nil, episode: Int? = nil, streamFilename: String? = nil) -> String {
        // Encode download path as base64
        let base64 = Data(downloadPath.utf8).base64EncodedString()

        // Percent encode the base64 string to ensure it doesn't break path routing (e.g. '/' or '+')
        let encodedPath = base64.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? base64

        var url = "\(baseURL)/subtitles/subdl/\(encodedPath)"

        var queryItems: [String] = []
        if let s = season { queryItems.append("season=\(s)") }
        if let e = episode { queryItems.append("episode=\(e)") }
        if let filename = streamFilename, let encoded = filename.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            queryItems.append("filename=\(encoded)")
        }

        if !queryItems.isEmpty {
            url += "?" + queryItems.joined(separator: "&")
        }

        return url
    }

    // MARK: - Stream Quality Filtering (MPV - Universal Codec Support)

    /// Basic quality check - filter out 3D and allow rest for scoring
    /// MPV supports all codecs, so no codec filtering needed!
    private func isGoodQuality(_ stream: Stream) -> Bool {
        let title = stream.title.uppercased()

        // Filter out 3D movies (all common 3D formats)
        let is3D = title.contains("3D") ||
                   title.contains("SBS") ||
                   title.contains("HSBS") ||
                   title.contains("H-SBS") ||
                   title.contains("HALF-SBS") ||
                   title.contains("TAB") ||
                   title.contains("HTAB") ||
                   title.contains("HALF-TAB")

        if is3D {
            print("🚫 Filtered out 3D stream: \(stream.title)")
            return false
        }

        // Filter out Dolby Vision (DoVi) Profile 5 which causes purple/green tint on non-supported displays
        // Look for "DV", "DoVi", "Dolby Vision" in title
        // Note: "HDR" and "HDR10" are usually fine (tone mapped by MPV), but DV Profile 5 is problematic
        let isDoVi = title.contains("DV") ||
                     title.contains("DOVI") ||
                     title.contains("DOLBY VISION") ||
                     title.contains("DOLBYVISION")

        if isDoVi {
            print("🚫 Filtered out Dolby Vision stream (potential color issues): \(stream.title)")
            return false
        }

        // Allow all other sources through - quality scoring will handle prioritization
        // CAM/TS will score low, WEB-DL/BluRay will score high
        // This way, CAM shows when nothing else exists, but auto-upgrades when better quality releases
        return true
    }

    /// Scores a stream based on quality indicators (higher is better)
    private func scoreStream(_ stream: Stream) -> Int {
        let title = stream.title.uppercased()
        var score = 0

        // Prefer well-known reliable release groups (removed YIFY/YTS - poor quality)
        // Prefer well-known reliable release groups (removed YIFY/YTS - poor quality)
        let goodGroups = ["LORD", "DON", "WIKI", "TAYTO", "SARTRE", "CTRLHD", "RARBG", "PSA", "TIGOLE", "ION10", "SPARKS", "FGT", "QXR", "UTR"]
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

        // 🌟 Size "Sweet Spot" Logic
        // Bonus for files that are high quality but not huge (2GB - 12GB)
        // Penalty for very large files (>15GB) if 1080p to prevent buffering
        let lowerTitle = title.lowercased()
        if let sizeStr = stream.size {
             let sizeUpper = sizeStr.uppercased()
             var sizeGB: Double = 0.0

             if sizeUpper.contains("GB") {
                 let numStr = sizeUpper.replacingOccurrences(of: " GB", with: "").trimmingCharacters(in: .whitespaces)
                 sizeGB = Double(numStr) ?? 0.0
             } else if sizeUpper.contains("MB") {
                 let numStr = sizeUpper.replacingOccurrences(of: " MB", with: "").trimmingCharacters(in: .whitespaces)
                 sizeGB = (Double(numStr) ?? 0.0) / 1024.0
             }

             // Sweet Spot Bonus (High quality rips, manageable size)
             if sizeGB >= 2.5 && sizeGB <= 12.0 {
                 score += 15
             }

             // "Heavy" Penalty (Only for 1080p)
             // If 4K, 15GB+ is normal, so don't penalize
             let is4K = lowerTitle.contains("2160p") || lowerTitle.contains("4k")
             if !is4K && sizeGB > 15.0 {
                 score -= 10 // Mild penalty - lets it play but prefers smaller efficient encodes if available
             }
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

    // MARK: - Specific Movie Fetching

    private func fetchParamountHorrorMovies() async -> [MediaItem] {
        let cacheKey = "cached_paramount_horror_movies"

        // 1. Try to load from cache first (Fast & Consistent)
        if let data = UserDefaults.standard.data(forKey: cacheKey),
           let cachedMovies = try? JSONDecoder().decode([MediaItem].self, from: data) {
            print("💾 [Paramount] Loaded \(cachedMovies.count) movies from cache")
            // Return cached movies immediately, but still fetch in background to update cache if needed?
            // For now, just return cache to ensure consistency and speed.
            // We can add a TTL later if needed, but these specific movies are static.
            return cachedMovies
        }

        // 2. Fetch from Network
        // Paramount catalog URL from DiscoverView
        let baseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"
        let urlString = "\(baseURL)/catalog/movie/pmp.json"

        guard let url = URL(string: urlString) else {
            print("❌ [Paramount] Invalid URL")
            return []
        }

        do {
            print("☁️ [Paramount] Fetching from network...")
            let (data, _) = try await session.data(from: url)
            let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data) // Reusing CinemetaSearchResponse as structure is likely similar (metas array)

            let targetTitles = ["smile", "smile 2", "longlegs"]

            var foundMovies: [MediaItem] = []

            for meta in response.metas {
                // Check title
                if targetTitles.contains(meta.name.lowercased()) {
                    print("🔍 [Paramount] Found candidate: \(meta.name)")

                    var movie = MediaItem(from: meta)

                    // Fetch full metadata to verify rating and genre if needed
                    if let fullItem = try? await fetchMediaDetails(imdbId: movie.id, type: "movie") {
                        movie = fullItem // Update with full details

                        // Verify Genre
                        let genres = (movie.genres ?? []).map { $0.lowercased() }
                        if !genres.contains("horror") {
                            print("   🚫 Not Horror (Genres: \(genres))")
                            continue
                        }

                        // Verify Rating (6.5+)
                        if let ratingStr = movie.imdbRating, let rating = Double(ratingStr) {
                            if rating < 6.5 {
                                print("   🚫 Rating too low: \(rating)")
                                continue
                            }
                        }

                        print("   ✅ Matches criteria! Adding to list.")
                        foundMovies.append(movie)
                    }
                }
            }

            // 3. Save to Cache
            if !foundMovies.isEmpty {
                if let encoded = try? JSONEncoder().encode(foundMovies) {
                    UserDefaults.standard.set(encoded, forKey: cacheKey)
                    print("💾 [Paramount] Cached \(foundMovies.count) movies for future runs")
                }
            }

            return foundMovies

        } catch {
            print("❌ [Paramount] Failed to fetch catalog: \(error)")
            return []
        }
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
    var name: String
    let poster: String?
    var background: String?
    let logo: String?
    var description: String?
    let releaseInfo: String?
    var year: String?
    let imdbRating: String?
    var genres: [String]?
    var runtime: String?

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

    }

    // HARDWARE-SAFE initializer from CinemetaMeta - avoid computed properties
    init(from meta: CinemetaMeta) {

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

    }

    // HARDWARE-SAFE initializer from MediaMetadata
    init(from meta: MediaMetadata) {

        self.id = meta.id
        self.type = meta.type
        self.name = meta.title
        self.poster = meta.posterURL
        self.background = meta.backgroundURL
        self.logo = meta.logoURL
        self.description = meta.description
        self.releaseInfo = meta.releaseInfo
        self.year = meta.year
        self.imdbRating = meta.imdbRating.map { String($0) }
        self.genres = meta.genres
        self.runtime = meta.runtime

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
    case invalidURL
    case invalidStream  // URL resolved to non-video file (e.g., .iso, .exe)
    case serverError(statusCode: Int)
    case networkError(Error)

    var errorDescription: String? {
        switch self {
        case .noStreamsFound:
            return "No streams found for this quality"
        case .invalidResponse:
            return "Invalid response from server"
        case .invalidURL:
            return "Invalid URL"
        case .invalidStream:
            return "Stream resolved to invalid file type"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

// MARK: - Actionable Stream Errors

/// Rich error type with user-friendly messages and solutions
enum StreamError: LocalizedError {
    case noRealDebridKey
    case invalidRealDebridKey
    case realDebridExpired
    case noStreamsAvailable
    case allStreamsFake       // All streams were blocked (.iso, malware, etc)
    case torrentNotCached
    case networkError(underlying: Error)
    case timeout
    case unknownError(message: String)

    /// User-friendly error title
    var title: String {
        switch self {
        case .noRealDebridKey:
            return "Real-Debrid Not Configured"
        case .invalidRealDebridKey:
            return "Invalid API Key"
        case .realDebridExpired:
            return "Real-Debrid Subscription Expired"
        case .noStreamsAvailable:
            return "No Streams Available"
        case .allStreamsFake:
            return "No Valid Streams"
        case .torrentNotCached:
            return "Stream Not Ready"
        case .networkError:
            return "Connection Error"
        case .timeout:
            return "Connection Timeout"
        case .unknownError:
            return "Playback Error"
        }
    }

    /// Detailed explanation for the user
    var errorDescription: String? {
        switch self {
        case .noRealDebridKey:
            return "RedLemon requires a Real-Debrid account to stream content."
        case .invalidRealDebridKey:
            return "Your Real-Debrid API key appears to be invalid or revoked."
        case .realDebridExpired:
            return "Your Real-Debrid subscription has expired."
        case .noStreamsAvailable:
            return "No streams were found for this title. It may not be available yet."
        case .allStreamsFake:
            return "All available streams were blocked as suspicious or malware."
        case .torrentNotCached:
            return "This stream is not cached on Real-Debrid and cannot be played instantly."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .timeout:
            return "The connection timed out while trying to load the stream."
        case .unknownError(let message):
            return message
        }
    }

    /// Actionable solution for the user
    var solution: String {
        switch self {
        case .noRealDebridKey:
            return "Go to Settings and add your Real-Debrid API key."
        case .invalidRealDebridKey:
            return "Go to Settings, remove the old key, and add a fresh API key from real-debrid.com."
        case .realDebridExpired:
            return "Renew your subscription at real-debrid.com, then try again."
        case .noStreamsAvailable:
            return "Try again later when the title becomes available."
        case .allStreamsFake:
            return "This title may have been targeted by fake uploads. Try again in a few days."
        case .torrentNotCached:
            return "Try a different stream or wait for caching to complete."
        case .networkError:
            return "Check your internet connection and try again."
        case .timeout:
            return "Check your connection and retry."
        case .unknownError:
            return "Try again or select a different stream."
        }
    }

    /// SF Symbol icon for the error type
    var icon: String {
        switch self {
        case .noRealDebridKey, .invalidRealDebridKey:
            return "key.fill"
        case .realDebridExpired:
            return "creditcard.trianglebadge.exclamationmark"
        case .noStreamsAvailable, .allStreamsFake:
            return "film.fill"
        case .torrentNotCached:
            return "icloud.slash.fill"
        case .networkError, .timeout:
            return "wifi.exclamationmark"
        case .unknownError:
            return "exclamationmark.triangle.fill"
        }
    }

    /// Whether Settings button should be shown
    var showSettingsButton: Bool {
        switch self {
        case .noRealDebridKey, .invalidRealDebridKey:
            return true
        default:
            return false
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
