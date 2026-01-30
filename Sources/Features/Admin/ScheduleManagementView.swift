import SwiftUI

struct ScheduleManagementView: View {
    @Binding var isPresented: Bool
    @State private var eventConfigVersion: Int?
    @State private var eventConfigMovieCount: Int?
    @State private var eventConfigMovies: [MediaItem] = []  // Server state (last published)
    @State private var isGeneratingSchedule = false
    @State private var isShowingExclusions = false
    @State private var errorMessage: String?
    @State private var isLoading = false

    // MARK: - Draft Mode (Batched Publishing)
    @State private var draftMovies: [MediaItem] = []  // Working copy (local edits)
    @State private var isPublishing = false
    @State private var showPublishConfirmation = false

    /// Compare draft to server state to detect unsaved changes
    private var hasUnsavedChanges: Bool {
        guard !draftMovies.isEmpty else { return false }
        // Compare IDs and order
        let draftIds = draftMovies.map { $0.id }
        let serverIds = eventConfigMovies.map { $0.id }
        return draftIds != serverIds
    }

    private var changeCount: Int {
        // Simple diff: count of added + removed items
        let draftSet = Set(draftMovies.map { $0.id })
        let serverSet = Set(eventConfigMovies.map { $0.id })
        let added = draftSet.subtracting(serverSet).count
        let removed = serverSet.subtracting(draftSet).count
        // Also check reorder by comparing positions
        var reordered = 0
        for (i, movie) in draftMovies.enumerated() {
            if let serverIndex = eventConfigMovies.firstIndex(where: { $0.id == movie.id }), serverIndex != i {
                reordered += 1
            }
        }
        return added + removed + (reordered > 0 ? 1 : 0)  // Count reorder as 1 change
    }

    // Search & Filter
    @State private var searchQuery = ""

    // Add Movie
    @State private var isShowingAddMovie = false
    @State private var addMovieQuery = ""
    @State private var addMovieResults: [MediaItem] = []
    @State private var isSearchingAddMovie = false
    @State private var isAddingMovie = false // New loading state for adding

    // Move To Position State
    @State private var isShowingMoveDialog = false
    @State private var moveTargetIndex = ""
    @State private var movieToMoveIndex: Int? = nil

    var filteredMovies: [(index: Int, movie: MediaItem)] {
        // CRITICAL: Use draftMovies (working copy) not eventConfigMovies (server state)
        let enumerated = Array(draftMovies.enumerated())
        if searchQuery.isEmpty {
            return enumerated.map { (index: $0.offset, movie: $0.element) }
        } else {
            return enumerated.filter { $0.element.name.localizedCaseInsensitiveContains(searchQuery) }
                .map { (index: $0.offset, movie: $0.element) }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header (extracted to fix compiler timeout - Documentation Security Check #6)
            scheduleHeaderView

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
                            HStack(alignment: .center, spacing: 12) {
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

                                // Reordering Controls
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

                                Button(action: {
                                    movieToMoveIndex = item.index
                                    moveTargetIndex = "" // Reset
                                    isShowingMoveDialog = true
                                }) {
                                    Image(systemName: "arrow.turn.down.right")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(4)
                                        .background(Color.blue.opacity(0.8))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.plain)
                                .help("Move to specific position")

                                Button(action: {
                                    playNow(movieIndex: item.index)
                                }) {
                                    Image(systemName: "play.circle.fill")
                                        .font(.system(size: 14))
                                        .foregroundColor(.green)
                                        .padding(4)
                                        .background(Color.white.opacity(0.1))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.plain)
                                .help("Play Now (Force Schedule Start)")

                                if let rating = item.movie.imdbRating {
                                    Text("★ \(rating)")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                }

                                // Boost Button
                                Button(action: {
                                    boostMovie(item.movie)
                                }) {
                                    Text("Boost")
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
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(item.index % 2 == 0 ? Color.white.opacity(0.05) : Color.clear)

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
        .sheet(isPresented: $isShowingMoveDialog) {
            VStack(spacing: 20) {
                Text("Move Movie to Position")
                    .font(.headline)

                Text("Enter the new position number (1-\(eventConfigMovies.count)):")
                    .font(.caption)
                    .foregroundColor(.secondary)

                TextField("Position", text: $moveTargetIndex)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .onSubmit {
                        performMoveToPosition()
                    }

                HStack {
                    Button("Cancel") {
                        isShowingMoveDialog = false
                    }
                    .keyboardShortcut(.cancelAction)

                    Button("Move") {
                        performMoveToPosition()
                    }
                    .keyboardShortcut(.defaultAction)
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .frame(width: 300, height: 200)
        }
        .alert("Publish Schedule Changes?", isPresented: $showPublishConfirmation) {
            Button("Publish", role: .destructive) {
                publishChanges()
            }
            Button("Discard Changes", role: .destructive) {
                discardChanges()
            }
            Button("Cancel", role: .cancel) {
                // Stay in edit mode
            }
        } message: {
            Text("Publishing will update the schedule for all users. Users currently watching Events will be notified to restart. You have \(changeCount) unsaved change\(changeCount == 1 ? "" : "s").")
        }
    }

    // MARK: - Extracted Views (Documentation Security Check #6: SwiftUI Compiler Timeouts)

    @ViewBuilder
    private var scheduleHeaderView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Manage Schedule")
                    .font(.title2.weight(.bold))

                // Draft indicator
                if hasUnsavedChanges {
                    Text("Draft – \(changeCount) unsaved change\(changeCount == 1 ? "" : "s")")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
            }

            Spacer()

            // Publish Changes button (only shown when there are changes)
            if hasUnsavedChanges {
                if isPublishing {
                    ProgressView()
                        .scaleEffect(0.8)
                        .padding(.trailing, 8)
                } else {
                    Button(action: {
                        showPublishConfirmation = true
                    }) {
                        Label("Publish Changes", systemImage: "arrow.up.circle.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
            }

            Button(action: {
                if hasUnsavedChanges {
                    showPublishConfirmation = true
                } else {
                    isPresented = false
                }
            }) {
                Text(hasUnsavedChanges ? "Discard & Close" : "Done")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(hasUnsavedChanges ? Color.red.opacity(0.8) : Color.blue)
                    .cornerRadius(8)
            }
            .buttonStyle(.plain)
            .keyboardShortcut(.escape, modifiers: [])
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
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
        .sheet(isPresented: $isShowingMoveDialog) {
            VStack(spacing: 20) {
                Text("Move Movie")
                    .font(.headline)

                if let index = movieToMoveIndex, index < eventConfigMovies.count {
                    Text("Moving: \(eventConfigMovies[index].name)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("To Position:")
                    TextField("Index (1-\(eventConfigMovies.count))", text: $moveTargetIndex)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 80)
                        .onSubmit {
                            performMoveToPosition()
                        }
                }

                HStack {
                    Button("Cancel") {
                        isShowingMoveDialog = false
                    }
                    .keyboardShortcut(.cancelAction)

                    Button("Move") {
                        performMoveToPosition()
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(moveTargetIndex.isEmpty)
                }
            }
            .padding()
            .frame(width: 300)
        }
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
                    self.draftMovies = config.movies  // Initialize draft with server state
                    self.eventConfigVersion = config.version
                    self.eventConfigMovieCount = config.movies.count
                    self.errorMessage = nil
                    NSLog("%@", "✅ [ScheduleManagement] Refreshed data. Loaded \(config.movies.count) movies. Version: \(config.version)")
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
        // DRAFT MODE: Modify local draft only, don't upload
        guard index < draftMovies.count else { return }
        draftMovies.remove(at: index)
        print("🗑️ [Draft] Deleted movie at index \\(index). Draft now has \\(draftMovies.count) movies.")
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
                    // Fallback to original item
                }
            }

            let finalMovieToAdd = movieToAdd

            await MainActor.run {
                // DRAFT MODE: Add to local draft only
                draftMovies.insert(finalMovieToAdd, at: 0) // Add to top
                print("➕ [Draft] Added '\(finalMovieToAdd.name)'. Draft now has \(draftMovies.count) movies.")

                isAddingMovie = false
                isShowingAddMovie = false
                addMovieQuery = ""
                addMovieResults = []
            }
        }
    }

    private func moveMovie(from fromIndex: Int, to toIndex: Int) {
        guard searchQuery.isEmpty else {
            // Cannot reorder while searching
            return
        }

        // DRAFT MODE: Modify local draft only
        guard fromIndex >= 0, fromIndex < draftMovies.count,
              toIndex >= 0, toIndex < draftMovies.count else { return }

        let movie = draftMovies.remove(at: fromIndex)
        draftMovies.insert(movie, at: toIndex)
        print("↕️ [Draft] Moved movie from \(fromIndex) to \(toIndex).")
    }

    private func performMoveToPosition() {
        guard let fromIndex = movieToMoveIndex,
              let targetPos = Int(moveTargetIndex) else { return }

        // DRAFT MODE: Modify local draft only
        // Convert 1-based input to 0-based index
        let toIndex = max(0, min(draftMovies.count - 1, targetPos - 1))

        // Don't reorder if it's the same index
        if fromIndex == toIndex {
            isShowingMoveDialog = false
            return
        }

        let movie = draftMovies.remove(at: fromIndex)
        draftMovies.insert(movie, at: toIndex)
        print("↕️ [Draft] Moved movie from \(fromIndex) to position \(targetPos).")

        isShowingMoveDialog = false
    }

    private func playNow(movieIndex: Int) {
        // "Play Now" means we shift the Schedule Epoch so that the selected movie starts EXACTLY NOW.
        // Logic:
        // 1. Calculate the total duration of all movies BEFORE this one.
        // 2. Set Epoch = Now - (Sum of previous durations).
        // 3. This effectively places the scheduler cursor at the start of this movie.

        let movies = eventConfigMovies
        guard movieIndex < movies.count else { return }

        // Calculate offset
        var accumulatedOffset: TimeInterval = 0
        let buffer = 600.0 // Default buffer from ScheduleConstants/Config (hardcoded here for admin calculation, strictly should fetch)

        for i in 0..<movieIndex {
            let movie = movies[i]
            let runtimeString = movie.runtime?.components(separatedBy: " ").first ?? "120"
            let runtimeMinutes = Double(runtimeString) ?? 120.0
            let duration = (runtimeMinutes * 60.0) + buffer
            accumulatedOffset += duration
        }

        // Epoch Calculation
        // If we want the movie to start NOW:
        // CurrentTimeSinceEpoch = accumulatedOffset
        // Now - Epoch = accumulatedOffset
        // Epoch = Now - accumulatedOffset

        // Add a tiny buffer (e.g. 10s) to "Now" so users have a moment to breathe before it starts?
        // Or just exact. Let's do exact.
        let newEpochDate = Date().addingTimeInterval(-accumulatedOffset)
        let newEpochTimestamp = Int(newEpochDate.timeIntervalSince1970)

        print("▶️ [Admin] Play Now for '\(movies[movieIndex].name)' (Index: \(movieIndex))")
        print("   accumulatedOffset: \(accumulatedOffset)s")
        print("   newEpoch: \(newEpochTimestamp)")

        // Upload new config with SAME movies but NEW epoch (immediate publish)
        updateScheduleImmediate(newMovies: movies, newEpoch: newEpochTimestamp)
    }

    private func boostMovie(_ movie: MediaItem) {
        // DRAFT MODE: Add duplicate to local draft only
        // Insert at a random position to spread them out
        let insertIndex = Int.random(in: 0...draftMovies.count)
        draftMovies.insert(movie, at: insertIndex)
        print("⚡️ [Draft] Boosted '\(movie.name)' - inserted at index \(insertIndex). Draft now has \(draftMovies.count) movies.")
    }

    // MARK: - Publishing (Batched Upload)

    private func publishChanges() {
        isPublishing = true

        Task {
            do {
                print("📤 [Admin] Publishing draft with \(draftMovies.count) movies...")

                // Calculate excluded IDs (movies that were in server state but removed from draft)
                let draftIds = Set(draftMovies.map { $0.id })
                let serverIds = Set(eventConfigMovies.map { $0.id })
                let removedIds = serverIds.subtracting(draftIds)

                // Get current exclusions and add newly removed ones
                let currentConfig = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                var excludedIds = currentConfig.excludedMovieIds ?? []
                for id in removedIds {
                    if !excludedIds.contains(id) {
                        excludedIds.append(id)
                    }
                }

                let newVersion = try await EventsConfigService.shared.uploadNewConfig(
                    movies: draftMovies,
                    excludedMovieIds: excludedIds,
                    epochTimestamp: nil  // Preserve existing epoch
                )

                await MainActor.run {
                    // Sync server state with draft
                    self.eventConfigMovies = self.draftMovies
                    self.eventConfigVersion = newVersion
                    self.eventConfigMovieCount = self.draftMovies.count
                    self.errorMessage = nil
                    self.isPublishing = false
                    self.showPublishConfirmation = false
                }
                print("✅ [Admin] Published successfully! Version: \(newVersion)")
            } catch {
                await MainActor.run {
                    self.errorMessage = "Publish failed: \(error.localizedDescription)"
                    self.isPublishing = false
                }
            }
        }
    }

    private func discardChanges() {
        // Reset draft to server state
        draftMovies = eventConfigMovies
        showPublishConfirmation = false
        isPresented = false
    }

    // MARK: - Legacy Update (for immediate actions like Play Now)

    private func updateScheduleImmediate(newMovies: [MediaItem], newEpoch: Int? = nil) {
        // Used for actions that must publish immediately (e.g., Play Now)
        Task {
            do {
                print("📤 [Admin] Immediate upload with \(newMovies.count) movies...")

                let currentConfig = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                let excludedIds = currentConfig.excludedMovieIds ?? []

                let newVersion = try await EventsConfigService.shared.uploadNewConfig(
                    movies: newMovies,
                    excludedMovieIds: excludedIds,
                    epochTimestamp: newEpoch
                )

                await MainActor.run {
                    self.eventConfigMovies = newMovies
                    self.draftMovies = newMovies  // Sync draft too
                    self.eventConfigVersion = newVersion
                    self.eventConfigMovieCount = newMovies.count
                    self.errorMessage = nil
                }
                print("✅ [Admin] Immediate sync successful!")
            } catch {
                await MainActor.run {
                    self.errorMessage = "Sync failed: \(error.localizedDescription)"
                    self.refreshData() // Revert on failure
                }
            }
        }
    }
}
