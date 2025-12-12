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

    enum MediaType: String, CaseIterable {
        case movies = "Movies"
        case shows = "TV Shows"
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
                        ForEach(CatalogProvider.allCases, id: \.self) { provider in
                            Text(provider.rawValue).tag(provider)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedCatalog) { _ in
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
                .onChange(of: selectedTab) { _ in
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
                    .onChange(of: selectedGenre) { _ in
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
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredItems, id: \.id) { item in
                            Button(action: {
                                Task {
                                    await selectMedia(item)
                                }
                            }) {
                                DiscoverMediaCard(item: item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Discover")
        .onAppear {
            if mediaItems.isEmpty {
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
        mediaItems = []

        let type = selectedTab == .movies ? "movie" : "series"
        let catalogId = selectedCatalog.catalogId
        let baseURL = selectedCatalog.baseURL

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
                mediaItems = metas.map { meta in
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
                print("✅ Displaying \(mediaItems.count) total items")
            }

            isLoading = false
        } catch {
            print("❌ Error loading catalog: \(error)")
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    private func selectMedia(_ item: MediaItem) async {
        // Navigate to detail view in main content area (same as BrowseView)
        appState.player.selectedMediaItem = item
        appState.currentView = .mediaDetail
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

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let posterURL = item.poster {
                AsyncImage(url: URL(string: posterURL)) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .aspectRatio(2/3, contentMode: .fit)
                            .overlay(
                                ProgressView()
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .aspectRatio(2/3, contentMode: .fit)
                            .clipped()
                    case .failure:
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .aspectRatio(2/3, contentMode: .fit)
                            .overlay(
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
                .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(2/3, contentMode: .fit)
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
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
}
