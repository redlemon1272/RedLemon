import SwiftUI
import Combine

@MainActor
class BrowseViewModel: ObservableObject {
    let appState: AppState
    private let apiClient = LocalAPIClient.shared
    
    @Published var recentlyWatched: [WatchHistoryItem] = []
    @Published var isLoading = false
    @Published var selectedTab: MediaType = .movies
    @Published var errorMessage: String?
    @Published var selectedHistoryItem: WatchHistoryItem?
    
    // Grid optimization: Track selected service for the main grid
    @Published var selectedService: String = "netflix" 
    @Published var isServiceLoading = false
    @Published var isPopularLoading = false
    
    // Performance optimization states
    @Published var isStabilizing = false
    @Published var isNavigating = false
    @Published var alertMessage = ""
    @Published var showMessageAlert = false
    
    private var tabSwitchTask: Task<Void, Never>?
    private var memoryCleanupTimer: Timer?
    
    // PERF: Track visible rows to prioritize loading
    // Optimization: Removed @Published to prevent whole-page re-renders on row visibility changes
    var visibleRowKeys: Set<String> = []
    
    @Published var isInitialLoad = true
    
    init(appState: AppState) {
        self.appState = appState
        // Restore tab selection from AppState
        self.selectedTab = MediaType.from(index: appState.browseSelectedTab)
        
        // If we already have content in AppState, it's not the initial load
        if !appState.popularMovies.isEmpty || !appState.popularShows.isEmpty {
            self.isInitialLoad = false
        }
    }
    
    var filteredHistoryItems: [WatchHistoryItem] {
        let filtered = recentlyWatched.filter { item in
            selectedTab == .movies ? item.mediaItem.type == "movie" : item.mediaItem.type == "series"
        }

        // For TV shows, only show the most recently watched episode per series
        if selectedTab == .shows {
            var latestBySeries: [String: WatchHistoryItem] = [:]
            for item in filtered {
                let seriesId = item.mediaItem.id
                // Keep the most recently watched episode for each series
                if let existing = latestBySeries[seriesId] {
                    if item.lastWatched > existing.lastWatched {
                        latestBySeries[seriesId] = item
                    }
                } else {
                    latestBySeries[seriesId] = item
                }
            }
            // Sort by lastWatched to ensure stable ordering
            return latestBySeries.values.sorted { $0.lastWatched > $1.lastWatched }
        }

        return filtered
    }
    
    func onAppear() {
        isNavigating = false
        
        // Optimization: Check if we are returning from player
        if appState.isReturningFromPlayer {
            print("🏁 returning from player - deferring render")
            self.isStabilizing = true
            
            // Clear the flag immediately so future visits are normal
            appState.isReturningFromPlayer = false
            
            // Trigger stabilization delay
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 400_000_000) // 0.4s buffer for window animation
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.isStabilizing = false
                }
            }
        }
        
        // Check for pending messages from other views (e.g. Watch Party timeout)
        if let message = appState.pendingLobbyMessage {
            self.alertMessage = message
            self.showMessageAlert = true
            appState.pendingLobbyMessage = nil
        }
        
        setupMemoryCleanupTimer()
        
        // Broadcast "Browsing Library" status
        Task {
            await SocialService.shared.updateWatchingStatus(mediaTitle: nil, mediaType: nil, imdbId: nil, roomId: nil, status: "Browsing")
        }
        
        loadRecentlyWatched()
    }
    
    func onDisappear() {
        memoryCleanupTimer?.invalidate()
        tabSwitchTask?.cancel()
        
        // Cancel all ongoing catalog loading tasks in one batch to avoid flurry of UI updates
        appState.browseIsLoadingCatalogs.removeAll()
        visibleRowKeys.removeAll()
    }
    
    func handleTabChange(to newValue: MediaType) {
        // Persist tab selection to AppState
        appState.browseSelectedTab = newValue.index
        
        // PERF: Reset visibility tracking on tab switch
        visibleRowKeys.removeAll()
        
        // Skip reload if this is a navigation restore
        if appState.browseScrollPosition != nil {
            return
        }
        
        tabSwitchTask?.cancel()
        tabSwitchTask = Task {
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s debounce
            guard !Task.isCancelled else { return }
            
            await loadContent()
            await loadSelectedService() // Immediately load the selected service for the grid
            await smartReloadStreamingServices()
        }
    }
    
    func handleServiceChange(to serviceKey: String) {
        selectedService = serviceKey
        Task {
            await loadSelectedService()
        }
    }
    
    func loadSelectedService() async {
        isServiceLoading = true
        let isTrending = selectedService == "trending"
        await loadCatalogIfNeeded(key: selectedService, isTrending: isTrending)
        isServiceLoading = false
    }
    
    func loadContent() async {
        // Only show full-screen loader if this is the first execution and we have no content
        if isInitialLoad {
            isLoading = true
            isInitialLoad = false
        }
        errorMessage = nil
        
        // Start loading both sections in parallel for "blazing fast" experience
        async let loadHero: Void = { [weak self] in
            guard let self = self else { return }
            do {
                if await selectedTab == .movies {
                    if await appState.popularMovies.isEmpty {
                        await MainActor.run { self.isPopularLoading = true }
                        let movies = try await apiClient.fetchPopularMovies()
                        await MainActor.run { [weak self] in
                            self?.appState.popularMovies = movies
                            self?.isPopularLoading = false
                        }
                    }
                } else if await selectedTab == .shows {
                    if await appState.popularShows.isEmpty {
                        await MainActor.run { self.isPopularLoading = true }
                        let shows = try await apiClient.fetchPopularShows()
                        await MainActor.run { [weak self] in
                            self?.appState.popularShows = shows
                            self?.isPopularLoading = false
                        }
                    }
                }
                
                // ALSO load Trending for the hero section
                await loadCatalogIfNeeded(key: "trending", isTrending: true)
            } catch {
                let desc = error.localizedDescription
                await MainActor.run { [weak self] in
                    self?.errorMessage = desc
                }
            }
        }()
        
        async let loadGrid = loadSelectedService()
        
        // Wait for both to complete
        _ = await (loadHero, loadGrid)
        
        isLoading = false
    }
    
    func loadRecentlyWatched() {
        guard let data = UserDefaults.standard.data(forKey: "watchHistory"),
              let history = try? JSONDecoder().decode([WatchHistoryItem].self, from: data) else {
            return
        }
        let deduplicatedHistory = removeDuplicates(from: history)
        recentlyWatched = Array(deduplicatedHistory.prefix(20))
    }
    
    private func removeDuplicates(from history: [WatchHistoryItem]) -> [WatchHistoryItem] {
        var uniqueItems: [WatchHistoryItem] = []
        var seenMediaKeys: Set<String> = []
        
        for item in history {
            let mediaKey: String
            if item.mediaItem.type == "movie" {
                mediaKey = item.mediaItem.id
            } else if item.mediaItem.type == "series" {
                let season = item.season ?? 0
                let episode = item.episode ?? 0
                mediaKey = "\(item.mediaItem.id)_\(season)_\(episode)"
            } else {
                mediaKey = item.id
            }
            
            if !seenMediaKeys.contains(mediaKey) {
                seenMediaKeys.insert(mediaKey)
                uniqueItems.append(item)
            }
        }
        return uniqueItems
    }
    
    func selectMedia(_ item: MediaItem, fromRow rowId: String? = nil) {
        guard !isNavigating else { return }
        isNavigating = true
        
        if let rowId = rowId {
            appState.browseScrollPosition = rowId
        }
        
        appState.player.selectedMediaItem = item
        appState.navigateTo(.mediaDetail)
    }
    
    func showWatchModeSelection(for historyItem: WatchHistoryItem) {
        selectedHistoryItem = historyItem
    }
    
    // MARK: - Catalog Loading Logic
    
    func getStreamingServiceKeys() -> [String] {
        var baseKeys = ["netflix", "prime", "disney", "hbo", "appleTv", "paramount", "hulu", "peacock", "starz", "showtime"]
        if selectedTab == .shows {
            baseKeys.append("discovery")
        }
        return baseKeys
    }
    
    func getServiceDisplayName(_ key: String) -> String {
        switch key {
        case "trending": return "Trending Now"
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
    
    func getStorageKey(_ key: String) -> String {
        return "\(key)_\(selectedTab.rawValue)"
    }
    
    func loadCatalogIfNeeded(key: String, isTrending: Bool = false, forceReload: Bool = false) async {
        let storageKey = getStorageKey(key)
        guard !appState.browseIsLoadingCatalogs.contains(storageKey) else { return }
        
        let currentCatalog = appState.browseCatalogs[storageKey]
        let shouldLoad = forceReload || currentCatalog == nil || currentCatalog?.isEmpty == true
        
        guard shouldLoad else { return }
        
        appState.browseIsLoadingCatalogs.insert(storageKey)
        defer { appState.browseIsLoadingCatalogs.remove(storageKey) }
        
        if isTrending {
            await loadTrendingProgressively(key: key, storageKey: storageKey)
        } else {
            await loadStreamingServiceProgressively(key: key, storageKey: storageKey)
        }
    }
    
    private func loadTrendingProgressively(key: String, storageKey: String) async {
        let urlString = "https://v3-cinemeta.strem.io/catalog/\(selectedTab == .movies ? "movie" : "series")/top.json"
        let quickBatch = await fetchCatalogWithLimit(from: urlString, limit: 7)
        if !quickBatch.isEmpty {
            appState.browseCatalogs[storageKey] = quickBatch
        }
        let fullBatch = await fetchCatalog(from: urlString)
        appState.browseCatalogs[storageKey] = fullBatch
    }
    
    private func loadStreamingServiceProgressively(key: String, storageKey: String) async {
        let baseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"
        let mediaType = selectedTab == .movies ? "movie" : "series"
        let serviceKey = getServiceMapKey(key)
        let urlString = "\(baseURL)/catalog/\(mediaType)/\(serviceKey).json"
        
        let quickBatch = await fetchCatalogWithLimit(from: urlString, limit: 7)
        if !quickBatch.isEmpty {
            appState.browseCatalogs[storageKey] = quickBatch
        }
        let fullBatch = await fetchCatalogWithFallback(from: urlString, serviceKey: key)
        appState.browseCatalogs[storageKey] = fullBatch
    }
    
    private func fetchCatalogWithLimit(from urlString: String, limit: Int) async -> [MediaItem] {
        guard let url = URL(string: urlString) else { return [] }
        let cacheKey = "quick_\(url.pathComponents.suffix(2).joined(separator: "_"))_\(limit)"
        
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) {
            return Array(cached.prefix(limit))
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
            let items = response.metas.prefix(limit).compactMap { meta -> MediaItem? in
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
            await CacheManager.shared.setCatalog(key: cacheKey, value: Array(items))
            return Array(items)
        } catch {
            return []
        }
    }
    
    private func fetchCatalog(from urlString: String) async -> [MediaItem] {
        guard let url = URL(string: urlString) else { return [] }
        let cacheKey = "catalog_\(url.pathComponents.suffix(2).joined(separator: "_"))"
        if let cached = await CacheManager.shared.getCatalog(key: cacheKey) { return cached }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
            let items = response.metas.prefix(18).compactMap { meta in
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
            await CacheManager.shared.setCatalog(key: cacheKey, value: items)
            return items
        } catch {
            return []
        }
    }
    
    private func fetchCatalogWithFallback(from urlString: String, serviceKey: String) async -> [MediaItem] {
        let items = await fetchCatalogWithRetry(from: urlString, serviceKey: serviceKey)
        if !items.isEmpty { return items }
        if let fallbackItems = await tryAlternativeCatalogServices(serviceKey: serviceKey) { return fallbackItems }
        if let cachedItems = await getCachedContentWithExtendedTTL(serviceKey: serviceKey) { return cachedItems }
        return []
    }
    
    private func fetchCatalogWithRetry(from urlString: String, serviceKey: String, maxRetries: Int = 3) async -> [MediaItem] {
        for attempt in 1...maxRetries {
            let items = await fetchCatalog(from: urlString)
            if !items.isEmpty { return items }
            if attempt < maxRetries {
                try? await Task.sleep(nanoseconds: UInt64(pow(2.0, Double(attempt)) * 1_000_000_000))
            }
        }
        return []
    }
    
    private func tryAlternativeCatalogServices(serviceKey: String) async -> [MediaItem]? {
        let alternatives = getAlternativeCatalogURLs(serviceKey: serviceKey)
        for altURL in alternatives {
            let items = await fetchCatalog(from: altURL)
            if !items.isEmpty { return items }
        }
        return nil
    }
    
    private func getAlternativeCatalogURLs(serviceKey: String) -> [String] {
        let mediaType = selectedTab == .movies ? "movie" : "series"
        let serviceMapKey = getServiceMapKey(serviceKey)
        let alternatives = ["https://stremio-jackett-addon.herokuapp.com", "https://stremio-anime-addon.herokuapp.com", "https://stremio-torrentio.herokuapp.com"]
        return alternatives.map { "\(String($0))/catalog/\(mediaType)/\(serviceMapKey).json" }
    }
    
    private func getCachedContentWithExtendedTTL(serviceKey: String) async -> [MediaItem]? {
        let serviceMapKey = getServiceMapKey(serviceKey)
        let cacheKey = selectedTab == .movies ? "catalog_movie_\(serviceMapKey)" : "catalog_series_\(serviceMapKey)"
        return await CacheManager.shared.getCatalog(key: cacheKey)
    }
    
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
    
    private func smartReloadStreamingServices() async {
        let serviceKeys = getStreamingServiceKeys()
        var servicesNeedingReload: [String] = []
        
        for serviceKey in serviceKeys {
            let currentCatalog = appState.browseCatalogs[getStorageKey(serviceKey)]
            if currentCatalog == nil || currentCatalog?.isEmpty == true {
                servicesNeedingReload.append(serviceKey)
            }
        }
        
        guard !servicesNeedingReload.isEmpty else { return }
        
        // PERF: Prioritize visible rows first
        let visibleFirst = servicesNeedingReload.sorted { key1, key2 in
            let vis1 = visibleRowKeys.contains(key1)
            let vis2 = visibleRowKeys.contains(key2)
            if vis1 && !vis2 { return true }
            if vis2 && !vis1 { return false }
            return false
        }
        
        try? await Task.sleep(nanoseconds: 50_000_000) // 0.05s initial delay
        
        let trendingCatalog = appState.browseCatalogs[getStorageKey("trending")]
        if trendingCatalog == nil || trendingCatalog?.isEmpty == true {
            await loadCatalogIfNeeded(key: "trending", isTrending: true)
        }
        
        // PERF: Load with staggered delays and concurrency limit
        for (index, serviceKey) in visibleFirst.enumerated() {
            // Stagger: 150ms between each, increases for non-visible rows
            let isVisible = visibleRowKeys.contains(serviceKey)
            let delay: UInt64 = isVisible ? 30_000_000 : UInt64(100_000_000 + (index * 30_000_000))
            if index > 0 { try? await Task.sleep(nanoseconds: delay) }
            await loadCatalogIfNeeded(key: serviceKey)
        }
    }
    
    private func setupMemoryCleanupTimer() {
        memoryCleanupTimer?.invalidate()
        memoryCleanupTimer = Timer.scheduledTimer(withTimeInterval: 300.0, repeats: true) { _ in
            Task { await self.performMemoryCleanup() }
        }
    }
    
    private func performMemoryCleanup() async {
        await CacheManager.shared.clearExpired()
        let stats = await CacheManager.shared.getCacheStats()
        print("📊 Cache stats - Catalogs: \(stats.catalogCount), Metadata: \(stats.metadataCount), Images: \(stats.imageCount)")
    }
}
