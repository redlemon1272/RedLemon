import SwiftUI

struct LibraryView: View {
    @ObservedObject var libraryManager = LibraryManager.shared
    @EnvironmentObject var appState: AppState
    @State private var filter: String = "All" // "All", "Movies", "TV Shows"
    @State private var isNavigating = false

    // Grid columns (adaptable)
    let columns = [
        GridItem(.adaptive(minimum: 140), spacing: 20)
    ]

    var filteredItems: [LibraryItem] {
        switch filter {
        case "Movies":
            return libraryManager.getMovies()
        case "TV Shows":
            return libraryManager.getShows()
        default:
            return libraryManager.libraryItems
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header & Filter
                HStack {
                    Text("Your Library")
                        .font(.system(size: 32, weight: .bold))

                    Spacer()

                    Picker("Filter", selection: $filter) {
                        Text("All").tag("All")
                        Text("Movies").tag("Movies")
                        Text("TV Shows").tag("TV Shows")
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 250)
                }
                .padding(.top, 40)
                .padding(.horizontal)

                if libraryManager.libraryItems.isEmpty {
                    // Empty State
                    VStack(spacing: 20) {
                        Spacer()
                        Image(systemName: "books.vertical")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary.opacity(0.5))
                        Text("Your library is empty")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Text("Add movies and TV shows to track what you're watching.")
                            .foregroundColor(.secondary.opacity(0.7))

                        Button("Browse Content") {
                            // Navigation hack: appState should handle this
                            appState.currentView = .browse
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(8)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 400)
                } else {
                    // Grid
                    LazyVGrid(columns: columns, spacing: 24) {
                        ForEach(filteredItems) { item in
                            Button(action: {
                                guard !isNavigating else { return }
                                isNavigating = true

                                // Navigate to Detail
                                let mediaItem = MediaItem(
                                    id: item.id,
                                    type: item.type,
                                    name: item.name,
                                    poster: item.posterURL,
                                    background: nil,
                                    logo: nil,
                                    description: nil,
                                    releaseInfo: nil,
                                    year: item.year,
                                    imdbRating: nil,
                                    genres: nil,
                                    runtime: nil
                                )
                                appState.player.selectedMediaItem = mediaItem
                                appState.previousView = .library
                                appState.currentView = .mediaDetail
                            }) {
                                VStack(spacing: 8) {
                                    // Poster
                                    AsyncImage(url: URL(string: item.posterURL ?? "")) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(2/3, contentMode: .fill)
                                                .cornerRadius(12)
                                                .shadow(radius: 4)
                                        case .failure(_), .empty:
                                            ZStack {
                                                Color.gray.opacity(0.2)
                                                Image(systemName: "film")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.white.opacity(0.3))
                                            }
                                            .aspectRatio(2/3, contentMode: .fill)
                                            .cornerRadius(12)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .overlay(alignment: .bottom) {
                                        if let progress = appState.watchHistoryProgress[item.id], progress > 0, item.type == "movie" {
                                            ZStack(alignment: .leading) {
                                                Rectangle()
                                                    .fill(Color.black.opacity(0.6))
                                                    .frame(height: 6)

                                                Rectangle()
                                                    .fill(Color.accentColor)
                                                    .frame(width: 140 * progress, height: 6)
                                            }
                                            .cornerRadius(3)
                                            .padding([.horizontal, .bottom], 4)
                                        }
                                    }
                                    // Hover effect handled by ButtonStyle or manually if needed,
                                    // but default PlainButtonStyle is okay for now.

                                    // Title
                                    Text(item.name)
                                        .font(.system(size: 14, weight: .medium))
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        .foregroundColor(.primary)
                                }
                            }
                            .buttonStyle(.scalableMedia)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 40)
        }
        .onAppear {
            isNavigating = false
        }
    }
}
