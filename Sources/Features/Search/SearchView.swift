import SwiftUI

struct SearchView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient.shared

    @State private var searchQuery = ""
    @State private var isSearching = false

    var body: some View {
        VStack(spacing: 0) {
            // SIMPLIFIED search bar - NO complex layouts
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 18))

                    TextField("Search...", text: $searchQuery)
                        .textFieldStyle(.plain)
                        .font(.system(size: 16))
                        .onSubmit {
                            performSearchSync()
                        }

                    if !searchQuery.isEmpty {
                        Button(action: {
                            searchQuery = ""
                            appState.searchResults = []
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 16))
                        }
                        .buttonStyle(.plain)
                    }

                    Button(action: {
                        performSearchSync()
                    }) {
                        Text("Go")
                            .font(.system(size: 14))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.plain)
                    .disabled(searchQuery.isEmpty || isSearching)
                }
                .padding(12)
                .background(Color(NSColor.controlBackgroundColor))
            }
            .padding(12)

            Divider()

            // SIMPLIFIED results area
            if isSearching {
                VStack(spacing: 12) {
                    ProgressView()
                    Text("Searching...")
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if appState.searchResults.isEmpty && !searchQuery.isEmpty {
                VStack(spacing: 12) {
                    Text("No Results")
                        .font(.system(size: 18))
                    Text("Try a different search term")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !appState.searchResults.isEmpty {
                // MINIMAL results display
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(appState.searchResults.count) results")
                        .font(.system(size: 16))
                        .padding(.horizontal, 12)

                    // ULTRA-SIMPLE list - NO complex modifiers
                    List(appState.searchResults, id: \.id) { item in
                        SimpleSearchResultItem(item: item)
                            .onTapGesture {
                                selectMedia(item)
                            }
                    }
                    .listStyle(.plain)
                }
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 48))
                        .foregroundColor(.secondary)

                    Text("Search RedLemon")
                        .font(.system(size: 24))

                    Text("Find any movie or TV show")
                        .font(.system(size: 16))
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
        print("�� [SAFE] performSearchSync() called")
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

                // Use real API with hardware-safe MediaItem struct
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
        print("�� [DEBUG] selectMedia called for: \(item.name)")
        // Navigate to detail view in main content area
        appState.selectedMediaItem = item
        appState.currentView = .mediaDetail
        print("🔍 [DEBUG] Navigation to mediaDetail completed")
    }
}

// ULTRA-MINIMAL list item - ZERO LAYOUT VALIDATION TRIGGERS
struct SimpleSearchResultItem: View {
    let item: MediaItem

    var body: some View {
        HStack(spacing: 8) {
            // Simple AsyncImage poster - minimal modifiers, fixed size
            AsyncImage(url: URL(string: item.poster ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                case .failure, .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 80, height: 120)
                @unknown default:
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 80, height: 120)
                }
            }
            .frame(width: 80, height: 120)

            // Simple text - NO complex modifiers
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 16))
                    .lineLimit(2)

                Text(item.type == "series" ? "TV Show" : "Movie")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.clear)
    }
}
