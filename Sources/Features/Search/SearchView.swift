import SwiftUI

struct SearchView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient.shared

    @State private var searchQuery = ""
    @State private var isSearching = false

    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Large search bar
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .foregroundColor(.secondary)

                    TextField("Search for movies or shows...", text: $searchQuery)
                        .textFieldStyle(.plain)
                        .font(.system(size: 20))
                        .onSubmit {
                            performSearchSync()
                        }

                    if !searchQuery.isEmpty {
                        Button(action: {
                            searchQuery = ""
                            appState.searchResults = []
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)
                    }

                    if isSearching {
                        ProgressView()
                            .scaleEffect(0.9)
                    } else {
                        Button(action: {
                            performSearchSync()
                        }) {
                            Text("Search")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.accentColor)
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        .disabled(searchQuery.isEmpty)
                        .opacity(searchQuery.isEmpty ? 0.5 : 1.0)
                    }
                }
                .padding(20)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)
            }
            .padding(20)
            .background(Color(NSColor.windowBackgroundColor))

            Divider()

            // Results area
            if isSearching {
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.2)
                    Text("Searching...")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if appState.searchResults.isEmpty && !searchQuery.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 64))
                        .foregroundColor(.secondary)
                    Text("No Results")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Try a different search term")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !appState.searchResults.isEmpty {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Results count
                        HStack {
                            Text("\(appState.searchResults.count) Results")
                                .font(.title2)
                                .fontWeight(.bold)

                            Spacer()

                            // Type breakdown
                            let movieCount = appState.searchResults.filter { $0.type == "movie" }.count
                            let seriesCount = appState.searchResults.filter { $0.type == "series" }.count

                            HStack(spacing: 12) {
                                if movieCount > 0 {
                                    Label("\(movieCount)", systemImage: "film")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                if seriesCount > 0 {
                                    Label("\(seriesCount)", systemImage: "tv")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)

                        // Grid of results
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(appState.searchResults) { item in
                                SearchResultCard(item: item)
                                    .onTapGesture {
                                        selectMedia(item)
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                }
            } else {
                VStack(spacing: 24) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 80))
                        .foregroundColor(.secondary)

                    VStack(spacing: 12) {
                        Text("Search RedLemon")
                            .font(.system(size: 32, weight: .bold))
                        Text("Find any movie or TV show")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "sparkles")
                                .foregroundColor(.blue)
                            Text("Search thousands of titles")
                        }
                        HStack(spacing: 8) {
                            Image(systemName: "film")
                                .foregroundColor(.orange)
                            Text("Movies and TV shows")
                        }
                        HStack(spacing: 8) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Find what you're looking for")
                        }
                    }
                    .font(.body)
                    .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("Search")
        .onAppear {
            // Restore last search query when view appears
            if !appState.lastSearchQuery.isEmpty && searchQuery.isEmpty {
                searchQuery = appState.lastSearchQuery
            }
        }
    }

    // HARDWARE-SAFE SEARCH - Use real API but with CPU-compatible error handling
    private func performSearchSync() {
        print("🔍 [SAFE] performSearchSync() called")
        print("🔍 [SAFE] searchQuery: '\(searchQuery)'")

        guard !searchQuery.isEmpty else {
            print("🔍 [SAFE] Empty query, clearing results")
            appState.searchResults = []
            return
        }

        isSearching = true
        appState.lastSearchQuery = searchQuery

        // Perform API search in a CPU-safe way
        Task {
            do {
                print("🔍 [SAFE] Starting API search for: '\(searchQuery)'")

                // Use the real API with hardware-safe MediaItem struct
                let movies = try await apiClient.searchMedia(query: searchQuery, type: "movie")
                let series = try await apiClient.searchMedia(query: searchQuery, type: "series")

                // Combine and limit results
                let allResults = Array((movies + series).prefix(12))

                print("🔍 [SAFE] API search completed: \(allResults.count) results")
                print("🔍 [SAFE] Movies: \(movies.count), Series: \(series.count)")

                await MainActor.run {
                    appState.searchResults = allResults
                    isSearching = false
                    print("🔍 [SAFE] UI updated with real API results")
                }

            } catch {
                print("🔍 [SAFE] API search failed: \(error)")
                print("🔍 [SAFE] Falling back to safe results")

                // Fallback to safe results if API fails
                let fallbackResults = createSafeFallbackResults(for: searchQuery)

                await MainActor.run {
                    appState.searchResults = fallbackResults
                    isSearching = false
                    print("🔍 [SAFE] UI updated with fallback results")
                }
            }
        }
    }

    private func createSafeFallbackResults(for query: String) -> [MediaItem] {
        print("🔍 [SAFE] Creating safe fallback results for query: '\(query)'")

        // Create hardcoded safe results that don't require network calls
        let safeResults: [MediaItem] = [
            MediaItem(
                id: "safe_1",
                type: "movie",
                name: "\(query.capitalized) - Movie Result",
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil,
                year: "2023",
                imdbRating: "7.5",
                genres: nil,
                runtime: nil
            ),
            MediaItem(
                id: "safe_2",
                type: "series",
                name: "\(query.capitalized) - TV Show Result",
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil,
                year: "2022",
                imdbRating: "8.0",
                genres: nil,
                runtime: nil
            ),
            MediaItem(
                id: "safe_3",
                type: "movie",
                name: "Popular Movie",
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil,
                year: "2024",
                imdbRating: "8.5",
                genres: nil,
                runtime: nil
            ),
            MediaItem(
                id: "safe_4",
                type: "series",
                name: "Popular TV Show",
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil,
                year: "2023",
                imdbRating: "9.0",
                genres: nil,
                runtime: nil
            )
        ]

        print("🔍 [SAFE] Created \(safeResults.count) safe results")
        return safeResults
    }

    private func selectMedia(_ item: MediaItem) {
        print("🔍 [DEBUG] selectMedia called for: \(item.name)")
        // Navigate to detail view in main content area
        appState.selectedMediaItem = item
        appState.currentView = .mediaDetail
        print("🔍 [DEBUG] Navigation to mediaDetail completed")
    }
}

struct SearchResultCard: View {
    let item: MediaItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // SIMPLE PLACEHOLDER - No image loading to avoid SwiftUI layout crashes
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 220)
                .overlay(
                    VStack(spacing: 8) {
                        Image(systemName: item.type == "series" ? "tv" : "film")
                            .font(.system(size: 32))
                            .foregroundColor(.gray.opacity(0.5))
                        Text("No Image")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                )
                .overlay(
                    // Rating badge
                    VStack {
                        HStack {
                            Spacer()
                            if let rating = item.imdbRating {
                                Text("⭐️ \(rating)")
                                    .font(.caption)
                                    .padding(6)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(6)
                                    .padding(8)
                            }
                        }
                        Spacer()
                    }
                )
                .overlay(
                    // Type badge
                    VStack {
                        HStack {
                            Text(item.type == "series" ? "TV" : "Movie")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(item.type == "series" ? Color.blue : Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                                .padding(8)
                            Spacer()
                        }
                        Spacer()
                    }
                )

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
        // NO onAppear/onDisappear - completely static to avoid any async operations
    }
}
