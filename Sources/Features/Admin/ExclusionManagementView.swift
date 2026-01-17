import SwiftUI

struct ExclusionManagementView: View {
    @Binding var isPresented: Bool
    @State private var excludedMovies: [MediaItem] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Manage Exclusions")
                    .font(.title2.weight(.bold))
                    
                
                Spacer()
                
                Button("Done") {
                    isPresented = false
                }
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if isLoading {
                Spacer()
                ProgressView("Loading excluded movies...")
                Spacer()
            } else if excludedMovies.isEmpty {
                Spacer()
                Text("No movies are currently excluded.")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                List {
                    ForEach(excludedMovies) { movie in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(movie.name)
                                    .font(.body.weight(.medium))
                                    
                                Text(movie.id)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Button("Restore") {
                                restoreMovie(movie)
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(InsetListStyle())
            }
        }
        .frame(minWidth: 500, minHeight: 400)
        .background(Color(NSColor.windowBackgroundColor))
        .task {
            await loadExclusions()
        }
    }
    
    private func loadExclusions() async {
        isLoading = true
        errorMessage = nil
        excludedMovies = []
        
        do {
            // 1. Fetch current config to get IDs
            let config = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
            guard let excludedIds = config.excludedMovieIds, !excludedIds.isEmpty else {
                isLoading = false
                return
            }
            
            print("📝 [Exclusions] Found \(excludedIds.count) excluded IDs. Fetching metadata...")
            
            // 2. Fetch metadata for each ID in parallel
            await withTaskGroup(of: MediaItem?.self) { group in
                for id in excludedIds {
                    group.addTask {
                        do {
                            // Try to fetch metadata to get the name
                            let movie = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: id, type: "movie")
                            return movie
                        } catch {
                            print("⚠️ [Exclusions] Failed to fetch metadata for \(id): \(error)")
                            // If fetch fails, return a placeholder item so the user can still restore it by ID
                            return MediaItem(
                                id: id,
                                type: "movie",
                                name: "Unknown Movie (\(id))",
                                poster: nil,
                                background: nil,
                                logo: nil,
                                description: nil,
                                releaseInfo: nil,
                                year: nil,
                                imdbRating: nil,
                                genres: nil,
                                runtime: nil
                            )
                        }
                    }
                }
                
                for await movie in group {
                    if let movie = movie {
                        await MainActor.run {
                            self.excludedMovies.append(movie)
                        }
                    }
                }
            }
            
            // Sort by name for easier finding
            await MainActor.run {
                self.excludedMovies.sort { $0.name < $1.name }
            }
            
        } catch {
            errorMessage = "Failed to load exclusions: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    private func restoreMovie(_ movie: MediaItem) {
        Task {
            do {
                // 1. Fetch latest config
                let config = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                var currentExclusions = config.excludedMovieIds ?? []
                
                // 2. Remove the ID
                if let index = currentExclusions.firstIndex(of: movie.id) {
                    currentExclusions.remove(at: index)
                    
                    // 3. Upload new config
                    // We keep the current movie list as is, just updating exclusions
                    _ = try await EventsConfigService.shared.uploadNewConfig(
                        movies: config.movies,
                        excludedMovieIds: currentExclusions
                    )
                    
                    // 4. Update UI
                    await MainActor.run {
                        if let uiIndex = excludedMovies.firstIndex(where: { $0.id == movie.id }) {
                            excludedMovies.remove(at: uiIndex)
                        }
                    }
                    print("✅ [Exclusions] Restored movie: \(movie.name) (\(movie.id))")
                }
            } catch {
                errorMessage = "Failed to restore movie: \(error.localizedDescription)"
            }
        }
    }
}
