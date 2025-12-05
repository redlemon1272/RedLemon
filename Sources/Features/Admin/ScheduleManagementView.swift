import SwiftUI

struct ScheduleManagementView: View {
    @Binding var isPresented: Bool
    @State private var eventConfigVersion: Int?
    @State private var eventConfigMovieCount: Int?
    @State private var eventConfigMovies: [MediaItem] = []
    @State private var isGeneratingSchedule = false
    @State private var isShowingExclusions = false
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Manage Schedule")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    isPresented = false
                }) {
                    Text("Done")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            // Controls & Stats
            HStack {
                VStack(alignment: .leading) {
                    if let version = eventConfigVersion {
                        Text("Version: \(version)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if let count = eventConfigMovieCount {
                        Text("Movies: \(count)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                if isGeneratingSchedule {
                    ProgressView()
                        .scaleEffect(0.8)
                } else {
                    HStack {
                        Button(action: {
                            isShowingExclusions = true
                        }) {
                            Text("Restore Movies")
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            generateSchedule()
                        }) {
                            Text("Regenerate Schedule")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.orange)
                                .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
            .sheet(isPresented: $isShowingExclusions) {
                ExclusionManagementView(isPresented: $isShowingExclusions)
            }
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            // Movie List
            ScrollView {
                LazyVStack(spacing: 0) {
                    if isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading schedule...")
                            Spacer()
                        }
                        .padding()
                    } else if eventConfigMovies.isEmpty {
                        Text("No movies scheduled.")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        ForEach(Array(eventConfigMovies.enumerated()), id: \.element.id) { index, movie in
                            HStack {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .frame(width: 30, alignment: .trailing)
                                
                                VStack(alignment: .leading) {
                                    Text(movie.name)
                                        .font(.body)
                                    if let genres = movie.genres {
                                        Text(genres.joined(separator: ", "))
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                                Spacer()
                                
                                if let rating = movie.imdbRating {
                                    Text("★ \(rating)")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                }
                                
                                Button(action: {
                                    deleteMovie(movie: movie)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .padding(4)
                                }
                                .buttonStyle(.plain)
                                .padding(.leading, 8)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(index % 2 == 0 ? Color.white.opacity(0.05) : Color.clear)
                            
                            Divider()
                        }
                    }
                }
                .padding(.vertical)
            }
        }
        .frame(minWidth: 600, minHeight: 500)
        .background(Color(NSColor.windowBackgroundColor))
        .task {
            refreshData()
        }
    }
    
    private func refreshData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let config = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                await MainActor.run {
                    self.eventConfigMovies = config.movies
                    self.eventConfigVersion = config.version
                    self.eventConfigMovieCount = config.movies.count
                    self.errorMessage = nil
                    NSLog("✅ [ScheduleManagement] Refreshed data. Loaded \(config.movies.count) movies. Version: \(config.version)")
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                }
            }
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
    
    private func generateSchedule() {
        isGeneratingSchedule = true
        Task {
            do {
                let newVersion = try await LocalAPIClient.shared.generateAndUploadSchedule()
                eventConfigVersion = newVersion
                refreshData()
            } catch {
                errorMessage = "Failed to generate schedule: \(error.localizedDescription)"
            }
            isGeneratingSchedule = false
        }
    }
    
    private func deleteMovie(movie: MediaItem) {
        guard let index = eventConfigMovies.firstIndex(of: movie) else { return }
        let movieToDelete = movie
        
        // Optimistically update UI
        var updatedMovies = eventConfigMovies
        updatedMovies.remove(at: index)
        eventConfigMovies = updatedMovies
        eventConfigMovieCount = updatedMovies.count
        
        // Capture immutable copy for async task
        let moviesToUpload = updatedMovies
        let deletedMovieId = movieToDelete.id
        
        Task {
            do {
                print("🗑️ [Admin] Removing movie from schedule...")
                
                // Get current exclusions - FORCE REFRESH to be safe
                let currentConfig = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                var excludedIds = currentConfig.excludedMovieIds ?? []
                
                NSLog("📝 [Admin] Current exclusions: \(excludedIds.count)")
                if !excludedIds.contains(deletedMovieId) {
                    excludedIds.append(deletedMovieId)
                    NSLog("➕ [Admin] Added to exclusions: \(deletedMovieId)")
                } else {
                    NSLog("⚠️ [Admin] Movie already in exclusions: \(deletedMovieId)")
                }
                
                NSLog("📤 [Admin] Uploading config with \(excludedIds.count) exclusions")
                
                // Upload to Supabase with updated exclusions
                let newVersion = try await EventsConfigService.shared.uploadNewConfig(
                    movies: moviesToUpload,
                    excludedMovieIds: excludedIds
                )
                
                // Update version in UI
                eventConfigVersion = newVersion
                print("✅ [Admin] Schedule updated (Movie removed & excluded)")
                
            } catch {
                errorMessage = "Failed to remove movie: \(error.localizedDescription)"
                refreshData()
            }
        }
    }
}
