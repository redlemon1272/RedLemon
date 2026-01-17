import SwiftUI

struct MediaPickerSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient.shared

    // Search State
    @State private var searchQuery = ""
    @State private var searchResults: [MediaItem] = []
    @State private var trendingItems: [MediaItem] = []
    @State private var isSearching = false
    @State private var hasSearched = false
    @State private var errorMessage: String?

    // Series Selection State
    @State private var selectedSeries: MediaItem?
    @State private var selectedSeason: Int = 1
    @State private var availableSeasons: [Int] = []
    @State private var episodesInSeason: [VideoEpisode] = []
    @State private var isLoadingEpisodes = false
    @State private var seriesMetadata: MediaMetadata?
    @State private var selectedEpisodes: Set<Int> = [] // Helper for multi-select

    // Picker Mode
    enum PickerMode {
        case browse
        case library
    }
    @State private var selectedMode: PickerMode = .browse

    // Callback now supports bulk
    let onSelect: (MediaItem, Int?, Int?) -> Void
    let onBulkSelect: ([(MediaItem, Int?, Int?)]) -> Void

    // Init wrapper to support bulk callback (adding optional parameter for compatibility)
    init(onSelect: @escaping (MediaItem, Int?, Int?) -> Void, onBulkSelect: @escaping ([(MediaItem, Int?, Int?)]) -> Void = { _ in }) {
        self.onSelect = onSelect
        self.onBulkSelect = onBulkSelect
    }

    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerView

            if let series = selectedSeries {
                // EPISODE SELECTION VIEW
                episodeSelectionView(series: series)
            } else {
                // MODE SWITCHER
                 VStack(spacing: 0) {
                     Picker("Mode", selection: $selectedMode) {
                         Text("Search & Trending").tag(PickerMode.browse)
                         Text("My Library").tag(PickerMode.library)
                     }
                     .pickerStyle(.segmented)
                     .padding()
                     .background(Color.white.opacity(0.05))
                     .onChange(of: selectedMode) { _ in
                         // Reset search query when switching to Library to show full filter opts
                         if selectedMode == .library {
                             searchQuery = "" // Defaults to "All"
                         }
                     }

                     if selectedMode == .browse {
                         searchAndDiscoveryView
                     } else {
                         libraryView
                     }
                 }
            }
        }
        .frame(width: 1100, height: 550) // Fixed size contained within app
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Dark Premium Theme
        .foregroundColor(.white)
        .onAppear {
            loadTrending()
        }
    }

    // MARK: - Header

    var headerView: some View {
        HStack {
            if selectedSeries != nil {
                Button(action: {
                    selectedSeries = nil
                    seriesMetadata = nil
                    selectedEpisodes.removeAll()
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .bold))
                        Text("Back")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Text("Add to Marathon")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }

            Spacer()

            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(8)
                    .background(Circle().fill(Color.white.opacity(0.1)))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white.opacity(0.1)),
            alignment: .bottom
        )
    }

    // MARK: - Search & Discovery

    var searchAndDiscoveryView: some View {
        VStack(spacing: 0) {
            // Search Bar
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)

                TextField("Search movies or TV shows...", text: $searchQuery)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 16))
                    .foregroundColor(.white) // Ensure text is visible
                    .onSubmit {
                        performSearch()
                    }

                if !searchQuery.isEmpty {
                    Button(action: {
                        searchQuery = ""
                        searchResults = []
                        hasSearched = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                Button("Search") {
                    performSearch()
                }
                .disabled(searchQuery.isEmpty || isSearching)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.1))
                .foregroundColor(.white)
                .cornerRadius(6)
                .buttonStyle(PlainButtonStyle())
            }
            .padding(12)
            .background(Color.white.opacity(0.15))
            .cornerRadius(10)
            .padding()

            // Content Area
            ScrollView {
                if isSearching {
                    VStack {
                        Spacer().frame(height: 100)
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Searching...")
                            .foregroundColor(.gray)
                            .padding(.top)
                    }
                } else if let error = errorMessage {
                     VStack(spacing: 16) {
                        Spacer().frame(height: 50)
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 48))
                            .foregroundColor(.orange)
                        Text(error)
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.7))
                    }
                } else if !hasSearched {
                    // Discovery / Trending State (Visible until explicit search)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Popular Now")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal)

                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(trendingItems, id: \.id) { item in
                                Button(action: { handleSelection(item) }) {
                                    MediaPickerCard(item: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                } else if searchResults.isEmpty {
                    VStack(spacing: 16) {
                        Spacer().frame(height: 50)
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 48))
                            .foregroundColor(.white.opacity(0.3))
                        Text("No results found for \"\(searchQuery)\"")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.5))
                    }
                } else {
                    // Search Results
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(searchResults, id: \.id) { item in
                            Button(action: { handleSelection(item) }) {
                                MediaPickerCard(item: item)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(20)
                }
            }
        }
    }

    // MARK: - Episode Selection

    func episodeSelectionView(series: MediaItem) -> some View {
        HStack(spacing: 0) {
            // Left Side: Info & Season Picker
            VStack(spacing: 20) {
                // Poster
                if let posterURL = series.poster {
                    AsyncImage(url: URL(string: posterURL)) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable().aspectRatio(contentMode: .fit)
                        default:
                            Rectangle().fill(Color.gray.opacity(0.2))
                        }
                    }
                    .frame(width: 160)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                }

                Text(series.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 180)

                Divider().background(Color.white.opacity(0.2))

                // Season Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("SEASON")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)

                    ScrollView {
                        VStack(spacing: 4) {
                            ForEach(availableSeasons, id: \.self) { season in
                                Button(action: {
                                    selectedSeason = season
                                    selectedEpisodes.removeAll()
                                    updateEpisodesForSeason(season)
                                }) {
                                    HStack {
                                        Text("Season \(season)")
                                            .font(.system(size: 14, weight: selectedSeason == season ? .bold : .regular))
                                        Spacer()
                                        if selectedSeason == season {
                                            Image(systemName: "checkmark")
                                                .font(.caption)
                                        }
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedSeason == season ? Color.blue : Color.clear)
                                    .cornerRadius(6)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: 200)
                }
                .frame(width: 160)

                Spacer()
            }
            .padding(20)
            .background(Color.white.opacity(0.05))

            // Right Side: Episodes List & Bulk Actions
            VStack(alignment: .leading, spacing: 0) {
                // Toolbar
                HStack {
                    Text("Season \(selectedSeason)")
                        .font(.system(size: 20, weight: .bold))

                    Spacer()

                    if !selectedEpisodes.isEmpty {
                        Button("Add \(selectedEpisodes.count) Items") {
                            addSelectedEpisodes()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))

                HStack {
                     Button("Select all") {
                         let allIds = episodesInSeason.map { $0.episode }
                         selectedEpisodes.formUnion(allIds)
                     }
                     .font(.caption)
                     .foregroundColor(.blue)

                     Text("•")

                     Button("Deselect all") {
                         selectedEpisodes.removeAll()
                     }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                .buttonStyle(PlainButtonStyle())

                Divider().background(Color.white.opacity(0.1))

                if isLoadingEpisodes {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else if episodesInSeason.isEmpty {
                     VStack {
                        Spacer()
                        Text("No episodes found.")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(episodesInSeason, id: \.episode) { episode in
                                HStack(spacing: 16) {
                                    // 1. Selection Checkbox
                                    Button(action: {
                                        if selectedEpisodes.contains(episode.episode) {
                                            selectedEpisodes.remove(episode.episode)
                                        } else {
                                            selectedEpisodes.insert(episode.episode)
                                        }
                                    }) {
                                        Image(systemName: selectedEpisodes.contains(episode.episode) ? "checkmark.circle.fill" : "circle")
                                            .font(.title2)
                                            .foregroundColor(selectedEpisodes.contains(episode.episode) ? .blue : .gray)
                                            .frame(width: 30, height: 30)
                                    }
                                    .buttonStyle(PlainButtonStyle())

                                    // 2. Thumbnail
                                    if let thumb = episode.thumbnail {
                                        AsyncImage(url: URL(string: thumb)) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image.resizable().aspectRatio(contentMode: .fill)
                                            default:
                                                Rectangle().fill(Color.gray.opacity(0.3))
                                            }
                                        }
                                        .frame(width: 120, height: 68) // Fixed 16:9ish size
                                        .cornerRadius(6)
                                        .clipped()
                                    } else {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 120, height: 68)
                                            .cornerRadius(6)
                                            .overlay(
                                                Text("\(episode.episode)")
                                                    .font(.headline)
                                                    .foregroundColor(.gray)
                                            )
                                    }

                                    // 3. Info Column
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(episode.episode). \(episode.title)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .lineLimit(1)

                                        // Air Date
                                        if let released = episode.released {
                                            let isFuture = isDateInFuture(released)
                                            HStack(spacing: 6) {
                                                Text(formatDate(released))
                                                    .font(.caption2)
                                                    .foregroundColor(isFuture ? .orange : .white.opacity(0.6))
                                                    .font(.body.weight(isFuture ? .bold : .regular))

                                                if isFuture {
                                                    Text("UNRELEASED")
                                                        .font(.caption2.weight(.bold))
                                                        
                                                        .foregroundColor(.orange)
                                                        .padding(.horizontal, 4)
                                                        .padding(.vertical, 1)
                                                        .background(Color.orange.opacity(0.2))
                                                        .cornerRadius(2)
                                                }
                                            }
                                        }

                                        if let overview = episode.overview, !overview.isEmpty {
                                            Text(overview)
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.6)) // Lighter gray for readability
                                                .lineLimit(2)
                                                .fixedSize(horizontal: false, vertical: true) // Allow wrapping
                                        }
                                    }

                                    Spacer()
                                    // Removed + Button as requested
                                }
                                .padding(12)
                                .background(Color.white.opacity(0.05)) // Subtle card bg
                                .cornerRadius(12)
                                .contentShape(Rectangle()) // Make entire row tappable for selection logic if we wanted, but checkbox is clearer.
                                // Actually, let's keep it simple.
                            }
                        }
                        .padding(20) // Padding around the scroll content
                    }
                }
            }
        }
    }

    // MARK: - Logic

    // MARK: - Library View

    var libraryView: some View {
        VStack(spacing: 20) {
            // Filter
             HStack {
                 Spacer()
                 Picker("Filter", selection: $searchQuery) { // Reusing searchQuery as filter binding for simplicity or add new state
                     Text("All").tag("")
                     Text("Movies").tag("movie")
                     Text("TV Shows").tag("series")
                 }
                 .pickerStyle(.segmented)
                 .frame(width: 300)
                 Spacer()
             }
             .padding(.top, 10)

            ScrollView {
                 let items = LibraryManager.shared.libraryItems.filter { item in
                     if searchQuery == "movie" { return item.type == "movie" }
                     if searchQuery == "series" { return item.type == "series" }
                     return true
                 }

                 if items.isEmpty {
                     VStack(spacing: 16) {
                         Spacer().frame(height: 50)
                         Image(systemName: "books.vertical")
                             .font(.system(size: 48))
                             .foregroundColor(.white.opacity(0.3))
                         Text("Your library is empty")
                             .font(.title3)
                             .foregroundColor(.white.opacity(0.5))
                         Text(searchQuery.isEmpty ? "Add items from the detail view." : "No items match your filter.")
                             .font(.caption)
                             .foregroundColor(.white.opacity(0.4))
                     }
                 } else {
                     LazyVGrid(columns: columns, spacing: 20) {
                         ForEach(items, id: \.id) { item in
                             // Convert LibraryItem to MediaItem
                             let mediaItem = MediaItem(
                                id: item.id,
                                type: item.type,
                                name: item.name,
                                poster: item.posterURL, // Correct property
                                background: nil,
                                logo: nil,
                                description: nil,
                                releaseInfo: nil,
                                year: item.year,
                                imdbRating: nil,
                                genres: nil,
                                runtime: nil
                             )

                             Button(action: { handleSelection(mediaItem) }) {
                                 MediaPickerCard(item: mediaItem)
                             }
                             .buttonStyle(PlainButtonStyle())
                         }
                     }
                     .padding(20)
                 }
            }
        }
    }

    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]

        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            return displayFormatter.string(from: date)
        }

        let simpleFormatter = DateFormatter()
        simpleFormatter.dateFormat = "yyyy-MM-dd"
        if let date = simpleFormatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            return displayFormatter.string(from: date)
        }

        return dateString
    }

    private func isDateInFuture(_ dateString: String) -> Bool {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        var date: Date? = formatter.date(from: dateString)

        if date == nil {
            let simpleFormatter = DateFormatter()
            simpleFormatter.dateFormat = "yyyy-MM-dd"
            date = simpleFormatter.date(from: dateString)
        }

        guard let validDate = date else { return false }
        return validDate > Date()
    }

    // MARK: - Logic Implementation

    private func loadTrending() {
        // Only load if in browse mode
        guard selectedMode == .browse else { return }

        // Use AppState's popular movies if available (same as Browse View)
        if !appState.popularMovies.isEmpty {
            self.trendingItems = appState.popularMovies
            return
        }

        Task {
            do {
                // Fetch popular movies to match Browse View
                let movies = try await apiClient.fetchPopularMovies()

                await MainActor.run {
                    // Update local state
                    self.trendingItems = movies
                    // Update AppState for consistency
                    if self.appState.popularMovies.isEmpty {
                        self.appState.popularMovies = movies
                    }
                }
            } catch {
                print("Failed to load trending: \(error)")
                // Fallback to simple search if fetchPopular fails
                 do {
                    let fallback = try await apiClient.searchMedia(query: "the", type: "movie")
                    await MainActor.run {
                         self.trendingItems = Array(fallback.prefix(12))
                    }
                 } catch {
                     print("Fallback failed: \(error)")
                 }
            }
        }
    }

    private func handleSelection(_ item: MediaItem) {
        if item.type == "series" {
            selectedSeries = item
            loadEpisodes(for: item)
        } else {
            onSelect(item, nil, nil)
            presentationMode.wrappedValue.dismiss()
        }
    }

    private func selectEpisode(_ episode: VideoEpisode) {
        guard let series = selectedSeries else { return }
        onSelect(series, episode.season, episode.episode)

        // Don't maintain selection after single add
        // presentationMode.wrappedValue.dismiss() // Keep open for marathon building
    }

    private func addSelectedEpisodes() {
        guard let series = selectedSeries, !selectedEpisodes.isEmpty else { return }

        var bulkItems: [(MediaItem, Int?, Int?)] = []
        let sortedIds = selectedEpisodes.sorted()

        for epId in sortedIds {
             bulkItems.append((series, selectedSeason, epId))
        }

        onBulkSelect(bulkItems)
        presentationMode.wrappedValue.dismiss()
    }

    private func performSearch() {
        guard !searchQuery.isEmpty else { return }

        isSearching = true
        hasSearched = true
        errorMessage = nil

        Task {
            do {
                async let movies = apiClient.searchMedia(query: searchQuery, type: "movie")
                async let shows = apiClient.searchMedia(query: searchQuery, type: "series")

                let (movieResults, showResults) = try await (movies, shows)
                let combined = movieResults + showResults

                let sorted = combined.sorted { $0.poster != nil && $1.poster == nil }

                await MainActor.run {
                    self.searchResults = sorted
                    self.isSearching = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isSearching = false
                }
            }
        }
    }

    private func loadEpisodes(for series: MediaItem) {
        isLoadingEpisodes = true
        errorMessage = nil
        selectedEpisodes.removeAll()

        Task {
            do {
                let metadata = try await apiClient.fetchMetadata(type: series.type, id: series.id)

                await MainActor.run {
                    self.seriesMetadata = metadata
                    self.isLoadingEpisodes = false

                    if let videos = metadata.videos, !videos.isEmpty {
                        let seasons = Set(videos.map { $0.season }).sorted().filter { $0 > 0 }
                        self.availableSeasons = seasons

                        if let firstSeason = seasons.first {
                            self.selectedSeason = firstSeason
                            updateEpisodesForSeason(firstSeason)
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    self.isLoadingEpisodes = false
                }
            }
        }
    }

    private func updateEpisodesForSeason(_ season: Int) {
        guard let videos = seriesMetadata?.videos else { return }
        let episodes = videos.filter { $0.season == season }.sorted { $0.episode < $1.episode }
        self.episodesInSeason = episodes
    }
}

// Reused Card, ensured dark theme
struct MediaPickerCard: View {
    let item: MediaItem

    var body: some View {
        VStack(spacing: 8) {
            if let posterURL = item.poster {
                AsyncImage(url: URL(string: posterURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().aspectRatio(2/3, contentMode: .fit)
                            .cornerRadius(8)
                    default:
                        placeholder
                    }
                }
            } else {
                placeholder
            }

            Text(item.name)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white) // Visible on dark
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }

    var placeholder: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .aspectRatio(2/3, contentMode: .fit)
            .cornerRadius(8)
            .overlay(Image(systemName: "film").foregroundColor(.white.opacity(0.3)))
    }
}
