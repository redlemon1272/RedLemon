import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient.shared

    // Consolidated streaming service data structure
    @State private var streamingCatalogs: [String: [MediaItem]] = [:]
    @State private var movies: [MediaItem] = []
    @State private var shows: [MediaItem] = []
    @State private var recentlyWatched: [WatchHistoryItem] = []

    @State private var isLoading = false
    @State private var selectedTab: MediaType = .movies
    @State private var errorMessage: String?
    @State private var selectedHistoryItem: WatchHistoryItem?

    // Performance optimization states
    @State private var visibleSections: Set<String> = []
    @State private var isLoadingCatalogs: Set<String> = []
    @State private var memoryCleanupTimer: Timer?
    @State private var tabSwitchTask: Task<Void, Never>?
    @State private var lastTabSwitchTime: Date = Date()

    // Alert state for global messages (e.g. Watch Party disconnect)
    @State private var showMessageAlert = false
    @State private var alertMessage = ""

    enum MediaType: String, CaseIterable {
        case movies = "Movies"
        case shows = "TV Shows"
    }

    // Helper for filtered history to reduce body complexity
    private var filteredHistoryItems: [WatchHistoryItem] {
        recentlyWatched.filter { item in
            selectedTab == .movies ? item.mediaItem.type == "movie" : item.mediaItem.type == "series"
        }
    }

    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Tab selector
            Picker("Media Type", selection: $selectedTab) {
                ForEach(MediaType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            if isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 48))
                        .foregroundColor(.orange)
                    Text("Error Loading Content")
                        .font(.title2)
                    Text(error)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        Task {
                            await loadContent()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            } else {
                ScrollView(.vertical, showsIndicators: true) {
                    ScrollViewReader { proxy in
                        // CRITICAL FIX (macOS 26): Use LazyVStack for proper scroll gesture handling
                        // VStack captures all gestures; LazyVStack properly separates vertical/horizontal domains
                        LazyVStack(alignment: .leading, spacing: 24) {
                            // Continue Watching section
                            continueWatchingView

                            // Popular section - horizontal row
                            StreamingServiceRow(
                                title: selectedTab == .movies ? "Popular Movies" : "Popular TV Shows",
                                items: selectedTab == .movies ? movies : shows,
                                onTap: selectMedia
                            )

                            // Trending section with lazy loading
                            LazyStreamingServiceRow(
                                title: selectedTab == .movies ? "Trending Movies" : "Trending TV Shows",
                                catalogKey: "trending",
                                items: streamingCatalogs["trending"] ?? [],
                                isLoading: isLoadingCatalogs.contains("trending"),
                                onTap: selectMedia,
                                onAppear: { await loadCatalogIfNeeded(key: "trending", isTrending: true) }
                            )

                            // Streaming service catalogs with lazy loading
                            ForEach(getStreamingServiceKeys(), id: \.self) { serviceKey in
                                LazyStreamingServiceRow(
                                    title: getServiceDisplayName(serviceKey),
                                    catalogKey: serviceKey,
                                    items: streamingCatalogs[serviceKey] ?? [],
                                    isLoading: isLoadingCatalogs.contains(serviceKey),
                                    onTap: selectMedia,
                                    onAppear: { await loadCatalogIfNeeded(key: serviceKey) }
                                )
                            }
                        }
                        .padding(.bottom)
                        .onAppear {
                            // Restore scroll position if coming back from detail
                            if let scrollTo = appState.browseScrollPosition {
                                Task { @MainActor in
                                    try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
                                    withAnimation {
                                        proxy.scrollTo(scrollTo, anchor: .center)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(selectedTab == .movies ? "Browse Movies" : "Browse TV Shows")
        .sheet(item: $selectedHistoryItem) { historyItem in
            WatchModeSelectionView(historyItem: historyItem, appState: appState)
        }
        .task {
            // Wait for server to be ready before loading content
            while !appState.isServerReady {
                try? await Task.sleep(nanoseconds: 100_000_000) //100ms
            }
            print("✅ BrowseView: Server is ready, loading content...")
            await loadContent()
            loadRecentlyWatched()
        }
        .onChange(of: selectedTab) { _ in
            // Cancel any existing tab switch task
            tabSwitchTask?.cancel()

            // Create new debounced task
            tabSwitchTask = Task {
                // Small delay to prevent rapid tab switches
                try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds

                // Check if task was cancelled
                guard !Task.isCancelled else { return }

                // Only proceed if this is still the current tab
                await MainActor.run {
                    lastTabSwitchTime = Date()
                }

                await loadContent()

                // Only reload streaming services if cache is expired or empty
                await smartReloadStreamingServices()
            }
        }
        .onAppear {
            // Check for pending messages from other views (e.g. Watch Party timeout)
            if let message = appState.pendingLobbyMessage {
                print("📢 BrowseView: Found pending message: \(message)")
                self.alertMessage = message
                self.showMessageAlert = true

                // Clear the message so it doesn't show again
                appState.pendingLobbyMessage = nil
            }

            setupMemoryCleanupTimer()
            // Broadcast "Browsing Library" status
            Task {
                await SocialService.shared.updateWatchingStatus(mediaTitle: nil, mediaType: nil, imdbId: nil, roomId: nil, status: "Browsing")
            }
        }
        .onDisappear {
            memoryCleanupTimer?.invalidate()

            // Cancel any ongoing tab switch task
            tabSwitchTask?.cancel()

            // Cancel all ongoing catalog loading tasks
            for key in isLoadingCatalogs {
                // This will trigger the defer block in loadCatalogIfNeeded
                Task { @MainActor in
                    isLoadingCatalogs.remove(key)
                }
            }

            print("🛑 BrowseView disappeared - cancelled all ongoing tasks")
        }
        .alert("Notice", isPresented: $showMessageAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    private func loadContent() async {
        isLoading = true
        errorMessage = nil

        print("🔍 BrowseView: Loading content for tab: \(selectedTab.rawValue)")

        // Clear catalogs when switching tabs to free memory
        clearCatalogs()

        do {
            if selectedTab == .movies {
                if movies.isEmpty {
                    print("📽️ Fetching popular movies...")
                    movies = try await apiClient.fetchPopularMovies()
                    print("✅ Loaded \(movies.count) movies")
                }
            } else if selectedTab == .shows {
                if shows.isEmpty {
                    print("📺 Fetching popular shows...")
                    shows = try await apiClient.fetchPopularShows()
                    print("✅ Loaded \(shows.count) shows")
                }
            }
        } catch {
            print("❌ Error loading content: \(error)")
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    private func fetchAnimeCatalog(from urlString: String) async -> [MediaItem] {
        guard let url = URL(string: urlString) else { return [] }

        // Create cache key from URL (fixed, no performance profile)
        let pathComponents = url.pathComponents.suffix(2).joined(separator: "_")
        let cacheKey = "catalog_\(pathComponents)"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return cached
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)

            // Fixed catalog size (conservative for all devices)
            let fixedSize = 15
            let items = response.metas.prefix(fixedSize).compactMap { meta in
                MediaItem(
                    id: meta.id,
                    type: meta.type,
                    name: meta.name,
                    poster: meta.poster,
                    background: nil,
                    logo: nil,
                    description: nil,
                    releaseInfo: meta.releaseInfo,
                    year: meta.releaseInfo,
                    imdbRating: meta.imdbRating,
                    genres: nil,
                    runtime: nil
                )
            }

            // Cache result
            await CacheManager.shared.setCatalog(key: cacheKey, value: items)
            print("📊 Using fixed catalog size: \(fixedSize) items")

            return items
        } catch {
            print("Failed to fetch catalog from \(urlString): \(error)")
            return []
        }
    }

    private func fetchCatalog(from urlString: String) async -> [MediaItem] {
        guard let url = URL(string: urlString) else { return [] }

        // Create cache key from URL (fixed, no performance profile)
        let pathComponents = url.pathComponents.suffix(2).joined(separator: "_")
        let cacheKey = "catalog_\(pathComponents)"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return cached
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)

            // Convert Stremio items to MediaItems (fixed size)
            let fixedSize = 15
            let items = response.metas.prefix(fixedSize).compactMap { meta in
                MediaItem(
                    id: meta.id,
                    type: meta.type,
                    name: meta.name,
                    poster: meta.poster,
                    background: nil,
                    logo: nil,
                    description: nil,
                    releaseInfo: meta.releaseInfo,
                    year: meta.releaseInfo,
                    imdbRating: meta.imdbRating,
                    genres: nil,
                    runtime: nil
                )
            }

            // Cache result
            await CacheManager.shared.setCatalog(key: cacheKey, value: items)
            print("📊 Using fixed catalog size: \(fixedSize) items")

            return items
        } catch {
            print("Failed to fetch catalog from \(urlString): \(error)")
            return []
        }
    }

    /// Fetch catalog with fallback mechanism for unreliable external services
    private func fetchCatalogWithFallback(from urlString: String, serviceKey: String) async -> [MediaItem] {
        print("🔍 Starting catalog fetch for \(serviceKey) from: \(urlString)")

        // First try: primary external service with retry logic
        let items = await fetchCatalogWithRetry(from: urlString, serviceKey: serviceKey)

        if !items.isEmpty {
            print("✅ Successfully fetched \(items.count) items for \(serviceKey) from primary service")
            return items
        }

        print("⚠️ Primary service failed for \(serviceKey), trying fallback mechanisms...")

        // Fallback 1: Try alternative catalog services
        if let fallbackItems = await tryAlternativeCatalogServices(serviceKey: serviceKey) {
            print("✅ Fallback service successful for \(serviceKey): \(fallbackItems.count) items")
            return fallbackItems
        }

        // Fallback 2: Try cached content with extended TTL
        if let cachedItems = await getCachedContentWithExtendedTTL(serviceKey: serviceKey) {
            print("✅ Using extended cache for \(serviceKey): \(cachedItems.count) items")
            return cachedItems
        }

        // Fallback 3: Return empty array but log failure for debugging
        print("❌ All fallback mechanisms failed for \(serviceKey)")
        await logServiceFailure(serviceKey: serviceKey, urlString: urlString)

        return []
    }

    /// Fetch catalog with retry logic and detailed error reporting
    private func fetchCatalogWithRetry(from urlString: String, serviceKey: String, maxRetries: Int = 3) async -> [MediaItem] {
        for attempt in 1...maxRetries {
            print("🔄 Attempt \(attempt)/\(maxRetries) for \(serviceKey)")

            let items = await fetchCatalog(from: urlString)

            if !items.isEmpty {
                print("✅ Attempt \(attempt) successful for \(serviceKey)")
                return items
            } else {
                print("⚠️ Attempt \(attempt) returned empty results for \(serviceKey)")
            }

            // Don't wait on the last attempt
            if attempt < maxRetries {
                let delay = Double(pow(2.0, Double(attempt))) // Exponential backoff
                print("⏳ Waiting \(delay)s before retry...")
                try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            }
        }

        print("❌ All \(maxRetries) attempts failed for \(serviceKey)")
        return []
    }

    /// Try alternative catalog services as fallback
    private func tryAlternativeCatalogServices(serviceKey: String) async -> [MediaItem]? {
        let alternatives = getAlternativeCatalogURLs(serviceKey: serviceKey)

        for (index, altURL) in alternatives.enumerated() {
            print("🔄 Trying alternative \(index + 1)/\(alternatives.count) for \(serviceKey): \(altURL)")

            let items = await fetchCatalog(from: altURL)
            if !items.isEmpty {
                print("✅ Alternative \(index + 1) successful for \(serviceKey)")
                return items
            }
        }

        return nil
    }

    /// Get alternative catalog URLs for a service
    private func getAlternativeCatalogURLs(serviceKey: String) -> [String] {
        let mediaType = selectedTab == .movies ? "movie" : "series"
        let serviceMapKey = getServiceMapKey(serviceKey)

        // Alternative Stremio addon services
        let alternatives = [
            "https://stremio-jackett-addon.herokuapp.com",
            "https://stremio-anime-addon.herokuapp.com",
            "https://stremio-torrentio.herokuapp.com"
        ]

        return alternatives.map { baseURL in
            "\(baseURL)/catalog/\(mediaType)/\(serviceMapKey).json"
        }
    }

    /// Get cached content with extended TTL as fallback
    private func getCachedContentWithExtendedTTL(serviceKey: String) async -> [MediaItem]? {
        let serviceMapKey = getServiceMapKey(serviceKey)
        let pathComponents = selectedTab == .movies ? "catalog_movie_\(serviceMapKey)" : "catalog_series_\(serviceMapKey)"

        // Try fixed cache key
        let cacheKey = pathComponents
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            print("✅ Found cached content for \(serviceKey)")
            return cached
        }

        return nil
    }

    /// Log service failures for debugging and monitoring
    private func logServiceFailure(serviceKey: String, urlString: String) async {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let logEntry = [
            "timestamp": timestamp,
            "serviceKey": serviceKey,
            "urlString": urlString,
            "mediaType": selectedTab.rawValue,
            "userAgent": "RedLemon-iOS"
        ]

        // Log to console for now - could be extended to send to monitoring service
        print("🚨 SERVICE FAILURE LOG: \(logEntry)")
    }

    private func selectMedia(_ item: MediaItem) {
        // Navigate to detail view in main content area
        // CRITICAL: This function MUST be synchronous (not async) to prevent Landmine #24
        // Making it async keeps the calling Task alive, which gets cancelled by onDisappear,
        // causing intermittent freezes during navigation.
        print("👆 Selected media item: \(item.name)")

        // Direct assignment - gesture handlers already run on MainActor
        // AppState is @MainActor isolated, so this is safe from SwiftUI gesture context
        appState.player.selectedMediaItem = item
        appState.currentView = .mediaDetail
    }

    private func loadRecentlyWatched() {
        guard let data = UserDefaults.standard.data(forKey: "watchHistory"),
              let history = try? JSONDecoder().decode([WatchHistoryItem].self, from: data) else {
            return
        }

        // Enhanced deduplication: Remove duplicates based on media ID and episode info
        let deduplicatedHistory = removeDuplicates(from: history)
        recentlyWatched = Array(deduplicatedHistory.prefix(20)) // Show last 20 unique items
    }

    /// Remove duplicate watch history items, keeping most recent watch progress for each unique media
    private func removeDuplicates(from history: [WatchHistoryItem]) -> [WatchHistoryItem] {
        var uniqueItems: [WatchHistoryItem] = []
        var seenMediaKeys: Set<String> = []

        for item in history {
            // Create a unique key for each media item
            let mediaKey: String
            if item.mediaItem.type == "movie" {
                // For movies, use just the media ID
                mediaKey = item.mediaItem.id
            } else if item.mediaItem.type == "series" {
                // For TV shows, use media ID + season + episode
                let season = item.season ?? 0
                let episode = item.episode ?? 0
                mediaKey = "\(item.mediaItem.id)_\(season)_\(episode)"
            } else {
                // Fallback for other types
                mediaKey = item.id
            }

            // If we haven't seen this media key before, add it
            if !seenMediaKeys.contains(mediaKey) {
                seenMediaKeys.insert(mediaKey)
                uniqueItems.append(item)
            }
            // If we have seen this media key before, skip this duplicate
        }

        print("🧹 Deduplication: \(history.count) → \(uniqueItems.count) items")
        return uniqueItems
    }

    // MARK: - Subviews to reduce body complexity (Landmine #6)

    @ViewBuilder
    private var continueWatchingView: some View {
        let history = filteredHistoryItems
        if !history.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text("Continue Watching")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Version-aware horizontal scroll view (Custom NSScrollView for macOS 15+, native for others)
                VersionAwareHorizontalScrollView {
                    HStack(spacing: 16) {
                        ForEach(history) { historyItem in
                            RecentlyWatchedCard(historyItem: historyItem)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("🖱️ Continue Watching clicked for: \(historyItem.mediaItem.name)")
                                    Task { @MainActor in
                                        showWatchModeSelection(for: historyItem)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 280) // Increased height to prevent clipping (MediaCard is ~260pt)
            }
            .padding(.top)
        }
    }

    private func showWatchModeSelection(for historyItem: WatchHistoryItem) {
        selectedHistoryItem = historyItem
    }

    // MARK: - Performance Optimization Methods

    /// Get streaming service keys based on current tab
    private func getStreamingServiceKeys() -> [String] {
        if selectedTab == .movies {
            return ["netflix", "prime", "disney", "hbo", "appleTv", "paramount", "hulu", "peacock", "starz", "showtime"]
        } else {
            return ["netflix", "prime", "disney", "hbo", "appleTv", "paramount", "hulu", "peacock", "starz", "showtime", "discovery"]
        }
    }

    /// Get display name for streaming service
    private func getServiceDisplayName(_ key: String) -> String {
        switch key {
        case "netflix": return "Netflix"
        case "prime": return "Prime Video"
        case "disney": return "Disney+"
        case "hbo": return "HBO Max"
        case "appleTv": return "Apple TV+"
        case "paramount": return "Paramount+"
        case "hulu": return "Hulu"
        case "peacock": return "Peacock"
        case "starz": return "Starz"
        case "showtime": return "Showtime"
        case "discovery": return "Discovery+"
        default: return key.capitalized
        }
    }

    /// Load catalog only if needed (lazy loading) with improved tab switching logic and progressive loading
    private func loadCatalogIfNeeded(key: String, isTrending: Bool = false, forceReload: Bool = false) async {
        // Load if not currently loading
        guard !isLoadingCatalogs.contains(key) else {
            return
        }

        // Always load if catalog is nil, empty, force reload is requested, or if this is a fresh tab switch
        let currentCatalog = streamingCatalogs[key]
        let shouldLoad = forceReload ||
                         currentCatalog == nil ||
                         currentCatalog?.isEmpty == true ||
                         (currentCatalog?.count == 0) // Always reload empty catalogs

        guard shouldLoad else {
            print("⏭️ Skipping load for \(key) - already loaded \(currentCatalog?.count ?? 0) items")
            return
        }

        await MainActor.run {
            isLoadingCatalogs.insert(key)
            return ()
        }

        defer {
            Task { @MainActor in
                isLoadingCatalogs.remove(key)
            }
        }

        if isTrending {
            // Load trending from Cinemeta with progressive loading
            await loadTrendingProgressively(key: key)
        } else {
            // Load streaming service catalog with fallback and progressive loading
            await loadStreamingServiceProgressively(key: key)
        }

        print("✅ Progressive loading completed for \(key)")
    }

    /// Progressive loading for trending content
    private func loadTrendingProgressively(key: String) async {
        let cinemetaURL = "https://v3-cinemeta.strem.io"
        let urlString = "\(cinemetaURL)/catalog/\(selectedTab == .movies ? "movie" : "series")/top.json"

        // First, load a small batch quickly for immediate display
        let quickBatch = await fetchCatalogWithLimit(from: urlString, limit: 7)
        if !quickBatch.isEmpty {
            streamingCatalogs[key] = quickBatch
            print("🚀 Quick batch loaded: \(quickBatch.count) items for \(key)")
        }

        // Then load full catalog in background
        let fullBatch = await fetchCatalog(from: urlString)
        streamingCatalogs[key] = fullBatch
        print("📦 Full batch loaded: \(fullBatch.count) items for \(key)")
    }

    /// Progressive loading for streaming service content
    private func loadStreamingServiceProgressively(key: String) async {
        let baseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"

        let mediaType = selectedTab == .movies ? "movie" : "series"

        let serviceKey: String
        switch key {
        case "netflix": serviceKey = "nfx"
        case "prime": serviceKey = "amp"
        case "disney": serviceKey = "dnp"
        case "hbo": serviceKey = "hbm"
        case "appleTv": serviceKey = "atp"
        case "paramount": serviceKey = "pmp"
        case "hulu": serviceKey = "hlu"
        case "peacock": serviceKey = "pcp"
        case "starz": serviceKey = "stz"
        case "showtime": serviceKey = "sst"
        case "discovery": serviceKey = "dpe"
        case "crunchyroll": serviceKey = "cru"
        default: serviceKey = key
        }

        let urlString = "\(baseURL)/catalog/\(mediaType)/\(serviceKey).json"

        // First, try quick batch from cache or limited fetch
        let quickBatch = await fetchCatalogWithLimit(from: urlString, limit: 7)
        if !quickBatch.isEmpty {
            streamingCatalogs[key] = quickBatch
            print("🚀 Quick batch loaded: \(quickBatch.count) items for \(key)")
        }

        // Then load full catalog with fallback
        let fullBatch = await fetchCatalogWithFallback(from: urlString, serviceKey: key)
        streamingCatalogs[key] = fullBatch
        print("📦 Full batch loaded: \(fullBatch.count) items for \(key)")
    }

    /// Fetch catalog with limited items for quick loading
    private func fetchCatalogWithLimit(from urlString: String, limit: Int) async -> [MediaItem] {
        guard let url = URL(string: urlString) else { return [] }

        let pathComponents = url.pathComponents.suffix(2).joined(separator: "_")
        let cacheKey = "quick_\(pathComponents)_\(limit)"

        // Check cache first
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return Array(cached.prefix(limit))
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)

            let items = response.metas.prefix(limit).compactMap { meta -> MediaItem? in
                // Only include if it has a poster
                guard meta.poster != nil else { return nil }
                return MediaItem(
                    id: meta.id,
                    type: meta.type,
                    name: meta.name,
                    poster: meta.poster,
                    background: nil,
                    logo: nil,
                    description: nil,
                    releaseInfo: meta.releaseInfo,
                    year: meta.releaseInfo,
                    imdbRating: meta.imdbRating,
                    genres: nil,
                    runtime: nil
                )
            }

            // Cache quick batch with shorter TTL
            await CacheManager.shared.setCatalog(key: cacheKey, value: Array(items))
            return Array(items)
        } catch {
            print("Failed to fetch quick catalog from \(urlString): \(error)")
            return []
        }
    }

    /// Setup memory cleanup timer
    private func setupMemoryCleanupTimer() {
        memoryCleanupTimer?.invalidate()
        memoryCleanupTimer = Timer.scheduledTimer(withTimeInterval: 300.0, repeats: true) { _ in
            Task {
                await performMemoryCleanup()
            }
        }
    }

    /// Perform memory cleanup
    private func performMemoryCleanup() async {
        print("🧹 Performing memory cleanup...")

        // Clear expired cache items
        await CacheManager.shared.clearExpired()

        // Fixed: use conservative behavior for all devices
        // Note: Performance-based cache clearing has been disabled for stability
        // Previously: AppState.isLowMemoryDevice
        // if AppState.isLowMemoryDevice {
        //     await CacheManager.shared.clearAll()
        //     print("🗑️ Aggressive cache clear for low memory device")
        // }

        // Log memory usage
        let stats = await CacheManager.shared.getCacheStats()
        print("📊 Cache stats - Catalogs: \(stats.catalogCount), Metadata: \(stats.metadataCount), Images: \(stats.imageCount)")
    }

    /// Clear all catalogs when switching tabs
    private func clearCatalogs() {
        streamingCatalogs.removeAll()
        isLoadingCatalogs.removeAll()
        print("🗑️ Cleared all streaming catalogs")
    }

    /// Smart reload - only reload if cache is expired or empty
    private func smartReloadStreamingServices() async {
        print("🧠 Smart reload checking streaming services for tab: \(selectedTab.rawValue)")

        let serviceKeys = getStreamingServiceKeys()
        var servicesNeedingReload: [String] = []

        // Check which services need reloading
        for serviceKey in serviceKeys {
            let currentCatalog = streamingCatalogs[serviceKey]

            // Reload if catalog is empty, nil, or if it's been more than 30 minutes since last tab switch
            let shouldReload = currentCatalog == nil ||
                             currentCatalog?.isEmpty == true ||
                             (currentCatalog?.count == 0) ||
                             (Date().timeIntervalSince(lastTabSwitchTime) > 1800) // 30 minutes

            if shouldReload {
                servicesNeedingReload.append(serviceKey)
                print("🔄 \(serviceKey) needs reload")
            } else {
                print("⏭️ Skipping \(serviceKey) - cache is valid")
            }
        }

        guard !servicesNeedingReload.isEmpty else {
            print("✅ All services have valid cache, skipping reload")
            return
        }

        print("🔄 Smart reloading \(servicesNeedingReload.count) services: \(servicesNeedingReload.joined(separator: ", "))")

        // Small delay to ensure view has settled
        try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds

        // Check trending first
        let trendingCatalog = streamingCatalogs["trending"]
        let shouldReloadTrending = trendingCatalog == nil ||
                                 trendingCatalog?.isEmpty == true ||
                                 (Date().timeIntervalSince(lastTabSwitchTime) > 1800)

        if shouldReloadTrending {
            await loadCatalogIfNeeded(key: "trending", isTrending: true, forceReload: false)
        }

        // Then reload only services that need it
        for (index, serviceKey) in servicesNeedingReload.enumerated() {
            // Small stagger between requests
            if index > 0 {
                try? await Task.sleep(nanoseconds: 50_000_000) // 0.05 seconds
            }

            await loadCatalogIfNeeded(key: serviceKey, isTrending: false, forceReload: false)
        }

        print("✅ Smart reload completed")
    }

    /// Automatically reload all streaming services after tab switch (legacy method for explicit reloads)
    private func reloadAllStreamingServices() async {
        print("🔄 Auto-reloading streaming services for tab: \(selectedTab.rawValue)")

        // Small delay to ensure view has settled after tab switch
        try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds

        let serviceKeys = getStreamingServiceKeys()

        // Reload trending first
        await loadCatalogIfNeeded(key: "trending", isTrending: true, forceReload: true)

        // Then reload all streaming services with a small stagger to avoid overwhelming the server
        for (index, serviceKey) in serviceKeys.enumerated() {
            // Small stagger between requests
            if index > 0 {
                try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 seconds
            }

            await loadCatalogIfNeeded(key: serviceKey, isTrending: false, forceReload: true)
        }

        print("✅ Auto-reload completed for \(serviceKeys.count + 1) services (trending + \(serviceKeys.count) streaming services)")
    }

    /// Get service key mapping for cache keys
    private func getServiceMapKey(_ serviceKey: String) -> String {
        switch serviceKey {
        case "netflix": return "nfx"
        case "prime": return "amp"
        case "disney": return "dnp"
        case "hbo": return "hbm"
        case "appleTv": return "atp"
        case "paramount": return "pmp"
        case "hulu": return "hlu"
        case "peacock": return "pcp"
        case "starz": return "stz"
        case "showtime": return "sst"
        case "discovery": return "dpe"
        case "crunchyroll": return "cru"
        default: return serviceKey
        }
    }
}

// Watch Mode Selection Sheet
struct WatchModeSelectionView: View {
    let historyItem: WatchHistoryItem
    let appState: AppState
    @Environment(\.dismiss) var dismiss
    @State private var isCreatingRoom = false

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text("Continue Watching")
                        .font(.title)
                        .fontWeight(.bold)

                    Text(historyItem.mediaItem.name)
                        .font(.title3)
                        .foregroundColor(.secondary)

                    // Progress info
                    HStack(spacing: 12) {
                        Text("\(historyItem.progressPercent)% watched")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        if let season = historyItem.season, let episode = historyItem.episode {
                            Text("•")
                                .foregroundColor(.secondary)
                            Text("S\(season) E\(episode)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.top, 32)

                Spacer()

                // Watch mode buttons
                VStack(spacing: 16) {
                    // Solo options
                    VStack(spacing: 12) {
                        Text("Solo Options")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        HStack(spacing: 12) {
                            // Continue button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .solo, shouldResume: true)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "play.fill")
                                    Text("Continue")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)

                            // Start from beginning button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .solo, shouldResume: false)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "play.circle.fill")
                                    Text("Start from Beginning")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    // Watch Party options
                    VStack(spacing: 12) {
                        Text("Watch Party Options")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        HStack(spacing: 12) {
                            // Resume button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .watchParty, shouldResume: true)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "person.2.fill")
                                    Text("Continue from \(formatTime(historyItem.timestamp))")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)

                            // Start from beginning button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .watchParty, shouldResume: false)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "person.2.fill")
                                    Text("Start from Beginning")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    // Go to Detail Page button
                    Button(action: {
                        goToDetailPage()
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Go to Detail Page")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 32)

                Spacer()

                // Cancel button
                Button("Cancel") {
                    dismiss()
                }
                .padding(.bottom, 24)
            }
            .frame(width: 450, height: 550) // Increased height to accommodate new buttons
            .disabled(isCreatingRoom)

            // Loading overlay
            if isCreatingRoom {
                ZStack {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 16) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))

                        Text("Creating room...")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding(32)
                    .background(Color(white: 0.2))
                    .cornerRadius(16)
                }
            }
        }
    }

    private func resumePlayback(mode: WatchMode, shouldResume: Bool = true) async {
        print("📼 Resume playback called - mode: \(mode), shouldResume: \(shouldResume), timestamp: \(historyItem.timestamp)s")

        // Show loading if creating watch party
        if mode == .watchParty {
            await MainActor.run {
                isCreatingRoom = true
            }
        }

        // Set media item on main actor
        await MainActor.run {
            appState.player.selectedMediaItem = historyItem.mediaItem

            // Only set resume timestamp if shouldResume is true
            if shouldResume {
                appState.player.resumeFromTimestamp = historyItem.timestamp
                print("✅ Set appState.player.resumeFromTimestamp = \(historyItem.timestamp)s")
            } else {
                appState.player.resumeFromTimestamp = nil
                print("✅ Cleared resumeFromTimestamp - starting from beginning")
            }

            // Set season/episode if it's a TV show
            if let season = historyItem.season, let episode = historyItem.episode {
                appState.selectedSeason = season
                appState.selectedEpisode = episode
                print("✅ BrowseView: Set season \(season) episode \(episode) (via AppState)")
            }
        }

        // Start playback directly (will seek once player is ready if resumeFromTimestamp is set)
        let quality = VideoQuality(rawValue: historyItem.quality ?? "1080p") ?? .fullHD

        if mode == .watchParty {
            // Redirect to QualitySelectionView to allow configuring description/public settings
            // This replaces the "Quick Add" immediate creation flow
            await MainActor.run {
                appState.player.currentWatchMode = .watchParty
                appState.currentView = .qualitySelection
                isCreatingRoom = false
            }
            dismiss()
        } else {
            // Play solo - dismiss immediately
            dismiss()
            await appState.player.playMedia(
                historyItem.mediaItem,
                quality: quality,
                watchMode: .solo
            )
        }
    }

    private func goToDetailPage() {
        Task { @MainActor in
            // Set media item and navigation state
            appState.player.selectedMediaItem = historyItem.mediaItem

            // If it's a TV show, set the season and episode context
            if let season = historyItem.season, let episode = historyItem.episode {
                appState.selectedSeason = season
                appState.selectedEpisode = episode
            }

            // Navigate to detail page
            appState.currentView = .mediaDetail

            // Dismiss popup
            dismiss()
        }
    }

    // Helper function to format time as HH:MM or MM:SS
    private func formatTime(_ seconds: Double) -> String {
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) % 3600 / 60
        let secs = Int(seconds) % 60

        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, secs)
        } else {
            return String(format: "%d:%02d", minutes, secs)
        }
    }
}

struct RecentlyWatchedCard: View {
    let historyItem: WatchHistoryItem
    @State private var imageData: Data?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image with progress overlay
            ZStack(alignment: .bottom) {
                if let imageData = imageData, let nsImage = NSImage(data: imageData) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 220)
                        .overlay(
                            ProgressView()
                        )
                }

                // Progress bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 4)

                        Rectangle()
                            .fill(Color.accentColor)
                            .frame(width: geometry.size.width * historyItem.progress, height: 4)
                    }
                }
                .frame(height: 4)
                .cornerRadius(2)
            }

            // Title
            Text(historyItem.mediaItem.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)

            // Progress percentage
            Text("\(historyItem.progressPercent)% watched")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
        .task {
            await loadPoster()
        }
    }

    private func loadPoster() async {
        guard let posterURL = historyItem.mediaItem.posterURL else { return }
        let cacheKey = posterURL.absoluteString

        // Check cache and load image in detached task to avoid actor isolation issues
        let data: Data? = await Task.detached {
            // Check cache first
            if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
                return cachedData
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: posterURL)
                // Cache
                await CacheManager.shared.setImageData(key: cacheKey, value: data)
                return data
            } catch {
                print("Failed to load poster: \(error)")
                return nil
            }
        }.value

        // Update UI on main actor
        if let data = data {
            await MainActor.run {
                self.imageData = data
            }
        }
    }
}

struct MediaCard: View {
    let item: MediaItem
    @State private var imageData: Data?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image
            ZStack {
                if let imageData = imageData, let nsImage = NSImage(data: imageData) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 220)
                        .overlay(
                            ProgressView()
                        )
                }

                // Rating badge
                if let rating = item.imdbRating {
                    VStack {
                        HStack {
                            Spacer()
                            Text("⭐️ \(rating)")
                                .font(.caption)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .cornerRadius(6)
                                .padding(8)
                        }
                        Spacer()
                    }
                }
            }

            // Title
            Text(item.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)

            // Year
            if let year = item.year {
                Text(year)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 150)
        .task {
            await loadPoster()
        }
    }

    private func loadPoster() async {
        guard let posterURL = item.posterURL else { return }

        let cacheKey = posterURL.absoluteString

        // Check cache and load image in detached task to avoid actor isolation issues
        let data: Data? = await Task.detached {
            // Check cache first
            if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
                return cachedData
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: posterURL)

                // Cache image data
                await CacheManager.shared.setImageData(key: cacheKey, value: data)

                return data
            } catch {
                print("Failed to load poster: \(error)")
                return nil
            }
        }.value

        // Update UI on main actor
        if let data = data {
            imageData = data
        }
    }
}

// Streaming service grid section with title
struct StreamingServiceRow: View {
    let title: String
    let items: [MediaItem]
    let onTap: (MediaItem) -> Void

    var body: some View {
        if !items.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Version-aware horizontal scroll view (Custom NSScrollView for macOS 15+, native for others)
                VersionAwareHorizontalScrollView {
                    LazyHStack(spacing: 16) {
                        ForEach(items) { item in
                            MediaCard(item: item)
                                .onTapGesture {
                                    onTap(item)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 280) // Increased height to prevent clipping (MediaCard is ~260pt)
            }
        }
    }
}

// Lazy loading streaming service row with performance optimization
struct LazyStreamingServiceRow: View {
    let title: String
    let catalogKey: String
    let items: [MediaItem]
    let isLoading: Bool
    let onTap: (MediaItem) -> Void
    let onAppear: () async -> Void

    @State private var hasAppeared = false
    @State private var lastKnownItemCount = 0

    // Fixed: use conservative behavior for all devices
    private var isPerformanceMode: Bool {
        true // Previously: AppState.effectivePerformanceProfile == .low
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            if isLoading {
                HStack {
                    ProgressView()
                        .scaleEffect(0.8)
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .frame(height: 240)
            } else if !items.isEmpty {
                // Version-aware horizontal scroll view (Custom NSScrollView for macOS 15+, native for others)
                VersionAwareHorizontalScrollView {
                    LazyHStack(spacing: 16) {
                        ForEach(items) { item in
                            OptimizedMediaCard(item: item)
                                .onTapGesture {
                                    onTap(item)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 280) // Increased height to prevent clipping (MediaCard is ~260pt)
            }
        }
        .onAppear {
            // Always reload if items are empty or if this is a fresh appearance after tab switch
            // This ensures content loads properly after catalog clearing
            let shouldLoad = !hasAppeared || items.isEmpty || lastKnownItemCount == 0

            if shouldLoad {
                hasAppeared = true
                Task {
                    await onAppear()
                }
            }

            // Update: last known item count
            lastKnownItemCount = items.count
        }
        .onChange(of: items.count) { newCount in
            // If items become empty after being loaded, trigger a retry after a delay
            if newCount == 0 && lastKnownItemCount > 0 {
                Task {
                    // Wait a bit before retrying to avoid rapid successive attempts
                    try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
                    await onAppear()
                }
            }
            lastKnownItemCount = newCount
        }
    }
}

// Optimized MediaCard with memory management
struct OptimizedMediaCard: View {
    let item: MediaItem
    @State private var imageData: Data?
    @State private var imageLoadTask: Task<Void, Never>?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image with memory optimization
            ZStack {
                if let imageData = imageData, let nsImage = NSImage(data: imageData) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 220)
                        .overlay(
                            ProgressView()
                                .scaleEffect(0.8)
                        )
                }

                // Rating badge
                if let rating = item.imdbRating {
                    VStack {
                        HStack {
                            Spacer()
                            Text("⭐️ \(rating)")
                                .font(.caption)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .cornerRadius(6)
                                .padding(8)
                        }
                        Spacer()
                    }
                }
            }

            // Title
            Text(item.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)

            // Year
            if let year = item.year {
                Text(year)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 150)
        .onAppear {
            loadImage()
        }
        .onDisappear {
            // Cancel image loading when view disappears
            imageLoadTask?.cancel()
        }
    }

    private func loadImage() {
        // Cancel any existing task
        imageLoadTask?.cancel()

        imageLoadTask = Task {
            await loadPoster()
        }
    }

    private func loadPoster() async {
        guard let posterURL = item.posterURL else { return }

        let cacheKey = posterURL.absoluteString

        // Check cache first
        if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
            // Update UI on main actor if task wasn't cancelled
            if !Task.isCancelled {
                await MainActor.run {
                    imageData = cachedData
                }
            }
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: posterURL)

            // Check if task was cancelled before updating UI
            if !Task.isCancelled {
                // Cache image data
                await CacheManager.shared.setImageData(key: cacheKey, value: data)

                // Update UI on main actor
                await MainActor.run {
                    imageData = data
                }
            }
        } catch {
            if !Task.isCancelled {
                print("Failed to load poster: \(error)")
            }
        }
    }
}

// Stremio addon response models
struct StremioMetaResponse: Codable {
    let metas: [StremioMeta]
}

struct StremioMeta: Codable {
    let id: String
    let name: String
    let type: String
    let poster: String?
    let background: String?
    let logo: String?
    let releaseInfo: String?
    let released: String?
    let imdbRating: String?
    let genre: [String]?
    let runtime: String?
}
