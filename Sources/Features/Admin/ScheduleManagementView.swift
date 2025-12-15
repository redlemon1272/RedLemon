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
    
    // Search & Filter
    @State private var searchQuery = ""
    
    // Add Movie
    @State private var isShowingAddMovie = false
    @State private var addMovieQuery = ""
    @State private var addMovieResults: [MediaItem] = []
    @State private var isSearchingAddMovie = false
    @State private var isAddingMovie = false // New loading state for adding
    
    var filteredMovies: [(index: Int, movie: MediaItem)] {
        let enumerated = Array(eventConfigMovies.enumerated())
        if searchQuery.isEmpty {
            return enumerated.map { (index: $0.offset, movie: $0.element) }
        } else {
            return enumerated.filter { $0.element.name.localizedCaseInsensitiveContains(searchQuery) }
                .map { (index: $0.offset, movie: $0.element) }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Manage Schedule")
                    .font(.title2.weight(.bold))
                
                Spacer()
                
                Button(action: {
                    isPresented = false
                }) {
                    Text("Done")
                        .font(.body.weight(.semibold))
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
            VStack(spacing: 12) {
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
                                    .font(.body.weight(.medium))
                                    .foregroundColor(.primary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(6)
                            }
                            .buttonStyle(.plain)
                            
                            Button(action: {
                                isShowingAddMovie = true
                            }) {
                                Label("Add Movie", systemImage: "plus")
                                    .font(.body.weight(.medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.green)
                                    .cornerRadius(6)
                            }
                            .buttonStyle(.plain)
                            
                            Button(action: {
                                generateSchedule()
                            }) {
                                Label("Regenerate", systemImage: "arrow.triangle.2.circlepath")
                                    .font(.body.weight(.medium))
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
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search schedule...", text: $searchQuery)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(8)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(8)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
            .sheet(isPresented: $isShowingExclusions) {
                ExclusionManagementView(isPresented: $isShowingExclusions)
            }
            .sheet(isPresented: $isShowingAddMovie) {
                addMovieSheet
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
                        ForEach(filteredMovies, id: \.index) { item in
                             HStack {
                                Text("\(item.index + 1)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .frame(width: 30, alignment: .trailing)
                                
                                VStack(alignment: .leading) {
                                    Text(item.movie.name)
                                        .font(.body)
                                    if let genres = item.movie.genres {
                                        Text(genres.joined(separator: ", "))
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                                Spacer()
                                
                                if let rating = item.movie.imdbRating {
                                    Text("★ \(rating)")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                }
                                
                                // Boost Button
                                Button(action: {
                                    boostMovie(item.movie)
                                }) {
                                    Text("Boost") // Just text, no icon for simplicity
                                        .font(.caption.weight(.bold))
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(4)
                                }
                                .buttonStyle(.plain)
                                .help("Add another copy of this movie to increase frequency")
                                
                                Button(action: {
                                    deleteMovie(at: item.index)
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
                            .background(item.index % 2 == 0 ? Color.white.opacity(0.05) : Color.clear)
                            .overlay(
                                // Edit Mode Controls (Reordering)
                                HStack {
                                    Spacer()
                                    VStack(spacing: 2) {
                                        Button(action: {
                                            moveMovie(from: item.index, to: item.index - 1)
                                        }) {
                                            Image(systemName: "chevron.up")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(item.index > 0 ? .white : .gray.opacity(0.3))
                                                .padding(4)
                                                .background(Color.black.opacity(0.4))
                                                .clipShape(Circle())
                                        }
                                        .buttonStyle(.plain)
                                        .disabled(item.index == 0)
                                        
                                        Button(action: {
                                            moveMovie(from: item.index, to: item.index + 1)
                                        }) {
                                            Image(systemName: "chevron.down")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(item.index < filteredMovies.count - 1 ? .white : .gray.opacity(0.3))
                                                .padding(4)
                                                .background(Color.black.opacity(0.4))
                                                .clipShape(Circle())
                                        }
                                        .buttonStyle(.plain)
                                        .disabled(item.index >= filteredMovies.count - 1)
                                    }
                                    .padding(.trailing, 40) // Make space for delete button
                                }
                            )
                            
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
    
    private var addMovieSheet: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Add Movie to Schedule")
                    .font(.headline)
                Spacer()
                Button("Close") { isShowingAddMovie = false }
                    .buttonStyle(.plain)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            HStack {
                TextField("Search IMDb...", text: $addMovieQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        performAddMovieSearch()
                    }
                
                Button("Search") {
                    performAddMovieSearch()
                }
                .disabled(addMovieQuery.isEmpty || isSearchingAddMovie)
            }
            .padding()
            
            if isSearchingAddMovie {
                ProgressView()
                    .padding()
            }
            
            List(addMovieResults) { movie in
                HStack {
                    AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 30, height: 45)
                    .cornerRadius(4)
                    
                    VStack(alignment: .leading) {
                        Text(movie.name)
                            .font(.body.weight(.medium))
                        Text(movie.year ?? "")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button("Add") {
                        addMovieToSchedule(movie)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .frame(width: 500, height: 400)
        .overlay(
            Group {
                if isAddingMovie {
                    ZStack {
                        Color.black.opacity(0.6)
                        VStack(spacing: 12) {
                            ProgressView()
                                .scaleEffect(1.2)
                            Text("Fetching full metadata...")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        )
    }
    
    private func performAddMovieSearch() {
        guard !addMovieQuery.isEmpty else { return }
        isSearchingAddMovie = true
        Task {
            do {
                let results = try await LocalAPIClient.shared.searchMedia(query: addMovieQuery, type: "movie")
                await MainActor.run {
                    self.addMovieResults = results
                    self.isSearchingAddMovie = false
                }
            } catch {
                print("Search failed: \(error)")
                await MainActor.run {
                    self.isSearchingAddMovie = false
                }
            }
        }
    }
    
    // Logic Methods
    
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
    
    private func deleteMovie(at index: Int) {
        // Need to find the actual movie in the source array, not filtered
        // But since we pass 'at: item.index' from the view which maps directly to the enumerated offset, this IS the correct index in eventConfigMovies
        guard index < eventConfigMovies.count else { return }
        
        // Optimistically update UI
        var updatedMovies = eventConfigMovies
        let movieToDelete = updatedMovies[index]
        updatedMovies.remove(at: index)
        
        updateSchedule(newMovies: updatedMovies, excludedMovieId: movieToDelete.id)
    }
    
    private func addMovieToSchedule(_ movie: MediaItem) {
        // Prevent double adds
        guard !isAddingMovie else { return }
        isAddingMovie = true
        
        Task {
            var movieToAdd = movie
            
            // Hydrate metadata if needed
            // Check if we have essential metadata (background, logo, rating)
            let needsHydration = movie.background == nil || movie.logo == nil || movie.imdbRating == nil
            
            if needsHydration {
                print("💧 [Admin] Fetching full metadata for: \(movie.name)")
                do {
                    // Fetch full details
                    let fullItem = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: movie.id, type: "movie")
                    movieToAdd = fullItem
                    print("✅ [Admin] Hydrated metadata: \(movieToAdd.name) (Background: \(movieToAdd.background != nil), Rating: \(movieToAdd.imdbRating ?? "N/A"))")
                } catch {
                    print("⚠️ [Admin] Failed to hydrate metadata: \(error)")
                    // Fallback to original item, but maybe try to at least get it into the schedule
                }
            }
            
            let finalMovieToAdd = movieToAdd
            
            await MainActor.run {
                var updatedMovies = eventConfigMovies
                updatedMovies.insert(finalMovieToAdd, at: 0) // Add to top
                
                updateSchedule(newMovies: updatedMovies)
                
                isAddingMovie = false
                isShowingAddMovie = false
                addMovieQuery = ""
                addMovieResults = []
            }
        }
    }
    
    private func moveMovie(from fromIndex: Int, to toIndex: Int) {
        guard !searchQuery.isEmpty == false else {
            // Cannot reorder while searching
            return
        }
        
        var updatedMovies = eventConfigMovies
        guard fromIndex >= 0, fromIndex < updatedMovies.count,
              toIndex >= 0, toIndex < updatedMovies.count else { return }
        
        // Swap or move logic?
        // Let's do a simple move
        let movie = updatedMovies.remove(at: fromIndex)
        updatedMovies.insert(movie, at: toIndex)
        
        // Optimistic update
        eventConfigMovies = updatedMovies
        
        // Persist
        updateSchedule(newMovies: updatedMovies)
    }
    
    private func boostMovie(_ movie: MediaItem) {
        var updatedMovies = eventConfigMovies
        
        // Insert a duplicate at a random position to spread them out
        let randomIndices = (0...updatedMovies.count).map { $0 }
        let insertIndex = randomIndices.randomElement() ?? 0
        
        updatedMovies.insert(movie, at: insertIndex)
        
        updateSchedule(newMovies: updatedMovies)
    }
    
    private func updateSchedule(newMovies: [MediaItem], excludedMovieId: String? = nil) {
        // Update local state immediately
        eventConfigMovies = newMovies
        eventConfigMovieCount = newMovies.count
        
        Task {
            do {
                print("📤 [Admin] Updating schedule with \(newMovies.count) movies...")
                
                // Get current exclusions to persist/update them
                let currentConfig = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                var excludedIds = currentConfig.excludedMovieIds ?? []
                
                if let newExclusion = excludedMovieId {
                    if !excludedIds.contains(newExclusion) {
                        excludedIds.append(newExclusion)
                    }
                }
                
                let newVersion = try await EventsConfigService.shared.uploadNewConfig(
                    movies: newMovies,
                    excludedMovieIds: excludedIds
                )
                
                await MainActor.run {
                    self.eventConfigVersion = newVersion
                    self.errorMessage = nil
                }
                print("✅ [Admin] Schedule synced successfully!")
            } catch {
                await MainActor.run {
                    self.errorMessage = "Sync failed: \(error.localizedDescription)"
                    refreshData() // Revert on failure
                }
            }
        }
    }
}
