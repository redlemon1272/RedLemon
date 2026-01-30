import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient.shared

    @State private var selectedCatalog: CatalogProvider = .netflix
    @State private var selectedTab: MediaType = .movies
    @State private var selectedGenre: String = "All"

    @State private var mediaItems: [MediaItem] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var isNavigating = false

    enum MediaType: String, CaseIterable {
        case movies = "Movies"
        case shows = "TV Shows"

        var index: Int {
            self == .movies ? 0 : 1
        }

        static func from(index: Int) -> MediaType {
            index == 0 ? .movies : .shows
        }
    }

    enum CatalogProvider: String, CaseIterable {
        case trending = "Trending (Cinemeta)"
        case netflix = "Netflix"
        case prime = "Prime Video"
        case disney = "Disney+"
        case hboMax = "HBO Max"
        case appleTv = "Apple TV+"
        case paramount = "Paramount+"
        case hulu = "Hulu"
        case peacock = "Peacock"
        case starz = "Starz"
        case showtime = "Showtime"
        case discovery = "Discovery+"
        case crunchyroll = "Crunchyroll"
        case anime = "Anime (Kitsu)"

        var catalogId: String {
            switch self {
            case .trending: return "top"
            case .netflix: return "nfx"
            case .prime: return "amp"
            case .disney: return "dnp"
            case .hboMax: return "hbm"
            case .appleTv: return "atp"
            case .paramount: return "pmp"
            case .hulu: return "hlu"
            case .peacock: return "pcp"
            case .starz: return "stz"
            case .showtime: return "sst"
            case .discovery: return "dpe"
            case .crunchyroll: return "cru"
            case .anime: return "kitsu-anime-trending"
            }
        }

        var baseURL: String {
            switch self {
            case .trending:
                return "https://v3-cinemeta.strem.io"
            case .anime:
                return "https://anime-kitsu.strem.fun"
            default:
                // Use the configured addon URL with all services enabled
                return "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"
            }
        }
    }

    let genres = ["All", "Action", "Comedy", "Drama", "Horror", "Sci-Fi", "Romance", "Thriller", "Documentary", "Animation", "Fantasy", "Crime", "Mystery", "Adventure", "Family"]

    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Controls section
            VStack(spacing: 12) {
                // Provider picker
                HStack {
                    Text("Provider:")
                        .font(.headline)
                    Picker("Provider", selection: $selectedCatalog) {
                        ForEach(CatalogProvider.allCases.filter { provider in
                            // Discovery+ only has TV Shows, not Movies.
                            // Hide it when Movies tab is active to prevent empty/error state.
                            if selectedTab == .movies && provider == .discovery {
                                return false
                            }
                            return true
                        }, id: \.self) { provider in
                            Text(provider.rawValue).tag(provider)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedCatalog) { newValue in
                        appState.discoverSelectedCatalog = newValue.rawValue
                        Task {
                            await loadContent()
                        }
                    }
                }

                // Media type tabs
                Picker("Media Type", selection: $selectedTab) {
                    ForEach(MediaType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)

                .onChange(of: selectedTab) { newValue in
                    // Persist tab selection to AppState
                    appState.discoverSelectedTab = newValue.index
                    Task {
                        await loadContent()
                    }
                }

                // Genre filter
                HStack {
                    Text("Genre:")
                        .font(.headline)
                    Picker("Genre", selection: $selectedGenre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre).tag(genre)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedGenre) { newValue in
                        appState.discoverSelectedGenre = newValue
                        Task {
                            await loadContent()
                        }
                    }
                }
            }
            .padding()
            .background(Color(nsColor: .controlBackgroundColor))

            Divider()

            // Content area
            if isLoading && mediaItems.isEmpty {
                ProgressView("Loading content...")
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if mediaItems.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "film")
                        .font(.system(size: 48))
                        .foregroundColor(.secondary)
                    Text("No content found")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredItems, id: \.id) { item in
                                Button(action: {
                                    selectMedia(item)
                                }) {
                                    DiscoverMediaCard(item: item)
                                }
                                .buttonStyle(.scalableMedia)
                                .id(item.id)  // Add ID for scroll position tracking
                            }
                        }
                        .padding()
                    }
                    .onAppear {
                        // Restore scroll position instantly (no animation) when coming back from detail
                        if let scrollTo = appState.discoverScrollPosition {
                            Task { @MainActor in
                                // Minimal delay just for view to render
                                try? await Task.sleep(nanoseconds: 50_000_000) // 0.05s
                                proxy.scrollTo(scrollTo, anchor: .top)  // Instant, no animation
                                // Clear scroll position after use
                                appState.discoverScrollPosition = nil
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Discover")
        .onAppear {
            isNavigating = false
            // Restore state from AppState
            var stateChanged = false

            // 1. Restore Tab
            let savedTab = MediaType.from(index: appState.discoverSelectedTab)
            if selectedTab != savedTab {
                selectedTab = savedTab
                stateChanged = true
            }

            // 2. Restore Catalog (Provider)
            if let savedCatalog = CatalogProvider(rawValue: appState.discoverSelectedCatalog),
               selectedCatalog != savedCatalog {
                selectedCatalog = savedCatalog
                stateChanged = true
            }

            // 3. Restore Genre
            if selectedGenre != appState.discoverSelectedGenre {
                selectedGenre = appState.discoverSelectedGenre
                stateChanged = true
            }

            // 4. Load Content
            // If state changed, the .onChange handlers above will trigger loadContent().
            // If state DID NOT change (e.g. defaults match AppState), no onChange fires, so we must load manually if empty.
            if !stateChanged && mediaItems.isEmpty {
                Task {
                    await loadContent()
                }
            }
        }
    }

    var filteredItems: [MediaItem] {
        if selectedGenre == "All" {
            return mediaItems
        }
        return mediaItems.filter { item in
            item.genres?.contains(selectedGenre) ?? false
        }
    }

    func loadContent() async {
        isLoading = true
        errorMessage = nil
        // mediaItems = [] // Optimization: Keep existing items visible while loading new ones to prevent flashing

        let type = selectedTab == .movies ? "movie" : "series"
        let catalogId = selectedCatalog.catalogId
        let baseURL = selectedCatalog.baseURL

        // unique cache key
        let cacheKey = "\(selectedCatalog.rawValue)_\(type)_\(selectedGenre)"

        // 1. Check Cache
        if let cachedItems = appState.discoverCatalogs[cacheKey], !cachedItems.isEmpty {
            print("📦 Using cached discover results for: \(cacheKey)")
            self.mediaItems = cachedItems
            self.isLoading = false
            return
        }

        // Build catalog URL
        let urlString: String
        if selectedCatalog == .anime {
            // Kitsu uses "anime" instead of movie/series for the type
            urlString = "\(baseURL)/catalog/anime/\(catalogId).json"
        } else {
            urlString = "\(baseURL)/catalog/\(type)/\(catalogId).json"
        }

        print("🔍 Fetching catalog: \(urlString)")

        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid catalog URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(CatalogResponse.self, from: data)

            if let metas = response.metas {
                print("📊 Loaded \(metas.count) items from \(selectedCatalog.rawValue)")
                let items = metas.map { meta in
                    MediaItem(
                        id: meta.id,
                        type: meta.type,
                        name: meta.name,
                        poster: meta.poster,
                        background: nil,
                        logo: nil,
                        description: meta.description,
                        releaseInfo: nil,
                        year: nil,
                        imdbRating: nil,
                        genres: meta.genres,
                        runtime: nil
                    )
                }
                self.mediaItems = items

                // 2. Write to Cache
                appState.discoverCatalogs[cacheKey] = items

                print("✅ Displaying \(mediaItems.count) total items")
            }

            isLoading = false
        } catch {
            print("❌ Error loading catalog: \(error)")
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    private func selectMedia(_ item: MediaItem) {
        // Navigate to detail view in main content area (same as BrowseView)
        // CRITICAL: Must be synchronous to prevent Security Check #24 race conditions

        guard !isNavigating else { return }
        isNavigating = true

        // Save scroll position for restoration when coming back
        appState.discoverScrollPosition = item.id

        // Direct assignment - gesture handlers already run on MainActor
        appState.player.selectedMediaItem = item
        appState.navigateTo(.mediaDetail)  // Use navigateTo for back navigation support
    }
}

// MARK: - Models
struct CatalogResponse: Codable {
    let metas: [CatalogMeta]?
}

struct CatalogMeta: Codable {
    let id: String
    let name: String
    let poster: String?
    let type: String
    let genres: [String]?
    let description: String?
}

// MARK: - Card Component
struct DiscoverMediaCard: View {
    let item: MediaItem
    @EnvironmentObject var appState: AppState
    @State private var imageData: Data?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let imageData = imageData, let nsImage = NSImage(data: imageData) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .aspectRatio(2/3, contentMode: .fit)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(2/3, contentMode: .fit)
                        .cornerRadius(8)
                        .overlay(
                            ProgressView()
                        )
                }
            }
            .task {
                await loadPoster()
            }
            .overlay(alignment: .bottom) {
                if let progress = appState.watchHistoryProgress[item.id], progress > 0, item.type == "movie" {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.black.opacity(0.6))
                            .frame(height: 6)

                        Rectangle()
                            .fill(Color.accentColor)
                            .frame(width: 150 * progress, height: 6)
                    }
                    .cornerRadius(3)
                    .padding([.horizontal, .bottom], 4)
                }
            }

            Text(item.name)
                .font(.caption)
                .lineLimit(2)
                .foregroundColor(.primary)

            if let genres = item.genres, !genres.isEmpty {
                Text(genres.prefix(2).joined(separator: ", "))
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(width: 150)
    }

    private func loadPoster() async {
        guard let posterURL = item.poster else { return }

        // Check cache first
        if let cachedData = await CacheManager.shared.getImageData(key: posterURL) {
            await MainActor.run {
                self.imageData = cachedData
            }
            return
        }

        guard let url = URL(string: posterURL) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Cache
            await CacheManager.shared.setImageData(key: posterURL, value: data)

            await MainActor.run {
                self.imageData = data
            }
        } catch {
            // Silently fail or log debug
        }
    }
}
