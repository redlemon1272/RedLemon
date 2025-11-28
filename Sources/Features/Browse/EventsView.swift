import SwiftUI

struct EventsView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject private var timeService = TimeService.shared
    @StateObject var apiClient = LocalAPIClient()

    // Media type selection
    @State private var selectedMediaType: MediaType = .movies

    // Movie events
    @State private var events: [EventItem] = []
    @State private var allMovies: [MediaItem] = []  // Store all fetched movies
    @State private var currentOffset = 0  // Track which set of 4 we're showing

    // TV events
    @State var tvEvents: [TVEventItem] = []

    // Common state
    @State private var isLoading = true
    @State private var timer: Timer?

    // MARK: - Constants
    private let bufferBetweenMovies: TimeInterval = 600 // 10 minutes

    enum MediaType: String, CaseIterable {
        case movies = "Movies"
        case tvShows = "TV Shows"
    }

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Media Type Toggle
                        Picker("Media Type", selection: $selectedMediaType) {
                            ForEach(MediaType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.top, 20)

                        // Header removed as requested

                        // Show appropriate events based on selected type
                        if selectedMediaType == .movies {
                            if events.isEmpty {
                                emptyStateView(icon: "film", message: "No movie events scheduled right now.")
                            } else {
                                // Movie Events List
                                LazyVStack(spacing: 20) {
                                    ForEach(events) { event in
                                        // Check if previous event is finished (either by time OR by user completion)
                                        let isLobbyOverride = (event.index == 1 && (events.first?.isFinished == true || appState.finishedEventIds.contains(events.first?.id ?? "")))

                                        HeroEventCard(event: event, isLobbyOverride: isLobbyOverride) {
                                            joinEvent(event)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 40)
                            }
                        } else {
                            if tvEvents.isEmpty {
                                emptyStateView(icon: "tv", message: "No TV show events scheduled right now.")
                            } else {
                                // TV Events List
                                LazyVStack(spacing: 20) {
                                    ForEach(tvEvents) { tvEvent in
                                        TVHeroEventCard(tvEvent: tvEvent) {
                                            joinTVEvent(tvEvent)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 40)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            print("📅 EventsView appeared")
            // Force refresh schedule on appear to ensure status is up to date
            if !allMovies.isEmpty {
                print("🔄 Recalculating schedule on appear...")
                calculateDeterministicSchedule()
            } else {
                loadEvents()
            }
            startTimer()

            // CRITICAL: If returning from finished event, recalculate immediately
            if appState.shouldAutoJoinLobby {
                print("🔄 Returned from finished event - forcing immediate schedule update")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.calculateDeterministicSchedule()
                }
            }
        }
        .onChange(of: timeService.isSynced) { isSynced in
            if isSynced {
                print("⏰ Time synced with server! Recalculating schedule...")
                calculateDeterministicSchedule()
            }
        }
        .onDisappear {
            stopTimer()
        }
        .onChange(of: selectedMediaType) { _ in
            // Reload events when switching tabs
            isLoading = true
            loadEvents()
        }
    }

    private func loadEvents() {
        Task {
            if selectedMediaType == .movies {
                // Load movie events
                do {
                    let movies = try await apiClient.fetchTopMoviesForEvents()
                    // Use the daily shuffled order from the API
                    allMovies = movies

                    calculateDeterministicSchedule()
                    isLoading = false

                    // Start timer to check for event completion
                    startTimer()
                } catch {
                    print("❌ Failed to load movie events: \(error)")
                    isLoading = false
                }
            } else {
                // Load TV events
                await loadTVEvents()
                isLoading = false

                // Fetch participant counts in background after UI is shown
                await updateParticipantCounts()
            }
        }
    }

    private func calculateDeterministicSchedule() {
        guard !allMovies.isEmpty else { return }

        let now = TimeService.shared.now

        // 1. Calculate total duration of the entire playlist cycle
        var totalCycleDuration: TimeInterval = 0
        var movieDurations: [TimeInterval] = []

        for movie in allMovies {
            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies
            movieDurations.append(duration)
            totalCycleDuration += duration
            print("   Movie: \(movie.name) | Runtime: \(runtimeMinutes)m | Duration: \(Int(duration))s")
        }

        // 2. Determine where we are in the cycle relative to a fixed epoch
        // Use 2024-01-01 as epoch to keep numbers reasonable but consistent
        let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01 00:00:00 UTC
        let timeSinceEpoch = now.timeIntervalSince(epoch)
        let currentCycleTime = timeSinceEpoch.truncatingRemainder(dividingBy: totalCycleDuration)

        // 3. Find the currently playing movie
        var accumulatedTime: TimeInterval = 0
        var currentMovieIndex = 0
        var timeIntoCurrentMovie: TimeInterval = 0

        for (index, duration) in movieDurations.enumerated() {
            if accumulatedTime + duration > currentCycleTime {
                currentMovieIndex = index
                timeIntoCurrentMovie = currentCycleTime - accumulatedTime
                break
            }
            accumulatedTime += duration
        }

        // 4. Build the schedule starting from the current movie
        var scheduledEvents: [EventItem] = []

        // Limit to available movies or 4, whichever is smaller
        let count = min(4, allMovies.count)

        for i in 0..<count {
            let index = (currentMovieIndex + i) % allMovies.count
            let movie = allMovies[index]

            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies  // Event slot includes buffer

            let startTime: Date
            if i == 0 {
                // Live movie: Start time is in the past
                startTime = now.addingTimeInterval(-timeIntoCurrentMovie)
            } else {
                // Upcoming movies: Start time is based on previous movie's end + buffer
                let prevEvent = scheduledEvents.last!
                startTime = prevEvent.startTime.addingTimeInterval(prevEvent.duration + bufferBetweenMovies)
            }

            // Debug: Log runtime for troubleshooting
            if i == 0 {
                print("🎬 Live Event: \(movie.name)")
                print("   Metadata runtime: \(movie.runtime ?? "unknown")")
                print("   Calculated duration: \(Int(duration / 60)) minutes")
            }

            scheduledEvents.append(EventItem(
                id: movie.id,  // Use IMDB ID for consistent tracking
                mediaItem: movie,
                startTime: startTime,
                duration: duration,
                actualMovieDuration: TimeInterval(runtimeMinutes * 60),
                index: i
            ))
        }

        DispatchQueue.main.async {
            self.events = scheduledEvents

            // Fetch participant counts for each event
            Task {
                await self.updateParticipantCounts()
            }

            // Debug log
            if let live = scheduledEvents.first {
                print("📅 Schedule Updated:")
                print("   Live: \(live.mediaItem.name)")
                print("   Progress: \(Int(timeIntoCurrentMovie))s / \(Int(live.duration))s")
            }

            // Check for auto-join (Seamless Transition from finished movie)
            if self.appState.shouldAutoJoinLobby {
                print("🔄 Checking for auto-join... Finished IDs: \(self.appState.finishedEventIds)")
                if let firstEvent = scheduledEvents.first {
                    print("   First event: \(firstEvent.mediaItem.name) (ID: \(firstEvent.id))")
                    print("   Is Finished: \(firstEvent.isFinished)")
                    print("   Is in FinishedIDs: \(self.appState.finishedEventIds.contains(firstEvent.id))")
                }

                // Find the NEXT event (not the finished one)
                // Priority: Lobby event that is NOT finished
                if let lobbyEvent = scheduledEvents.first(where: { event in
                    // ✅ Must not be in finished events list
                    guard !appState.finishedEventIds.contains(event.id) else {
                        print("⏭️ Skipping finished event: \(event.mediaItem.name)")
                        return false
                    }

                    // ✅ Must not be marked as finished
                    guard !event.isFinished else {
                        print("⏭️ Skipping finished event: \(event.mediaItem.name)")
                        return false
                    }

                    // ✅ Must be in lobby OR be the next event (index == 1) with previous event finished
                    let isInLobby = event.isInLobby
                    let isNextEventAfterFinished = event.index == 1 &&
                                                   (scheduledEvents.first?.isFinished == true ||
                                                    appState.finishedEventIds.contains(scheduledEvents.first?.id ?? ""))

                    print("   Checking event: \(event.mediaItem.name) (Index: \(event.index))")
                    print("     isInLobby: \(isInLobby)")
                    print("     isNextEventAfterFinished: \(isNextEventAfterFinished)")

                    return isInLobby || isNextEventAfterFinished
                }) {
                    print("🔄 Auto-joining NEXT event lobby: \(lobbyEvent.mediaItem.name) (index: \(lobbyEvent.index))")
                    self.joinEvent(lobbyEvent)
                    self.appState.shouldAutoJoinLobby = false  // ✅ Reset flag after joining
                } else if let liveEvent = scheduledEvents.first(where: {
                    $0.isLive && !$0.isFinished && !appState.finishedEventIds.contains($0.id)
                }) {
                    print("🔄 Auto-joining Live event: \(liveEvent.mediaItem.name)")
                    self.joinEvent(liveEvent)
                    self.appState.shouldAutoJoinLobby = false  // ✅ Reset flag after joining
                } else {
                    print("⚠️ No eligible event found for auto-join")
                    self.appState.shouldAutoJoinLobby = false  // ✅ Reset flag even if no event found
                }
            }
        }
    }

    @MainActor
    private func updateParticipantCounts() async {
        let currentEvents = events
        let currentTVEvents = tvEvents

        // Fetch in background task to avoid blocking main thread
        let fetchedCounts = await Task.detached {
            var newCounts: [String: Int] = [:]

            // Fetch for Movie Events
            for event in currentEvents {
                let roomId = "event_\(event.id)"
                if let roomState = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                    newCounts[event.id] = roomState.participantsCount
                }
            }

            // Fetch for TV Events
            for event in currentTVEvents {
                let roomId = "event_\(event.id)"
                if let roomState = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                    newCounts[event.id] = roomState.participantsCount
                }
            }

            return newCounts
        }.value

        // Update Movie Events state on main actor
        for i in 0..<events.count {
            if let count = fetchedCounts[events[i].id] {
                events[i].participantCount = count
            }
        }

        // Update TV Events state on main actor
        for i in 0..<tvEvents.count {
            if let count = fetchedCounts[tvEvents[i].id] {
                tvEvents[i].participantCount = count
            }
        }
    }

    // Legacy method kept for reference but unused
    private func showNextBatch() {
        calculateDeterministicSchedule()
    }

    private func startTimer() {
        // Check every 2 seconds for event status changes (immediate UI updates)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            Task { @MainActor in
                self.checkEventStatus()
            }
        }
    }

    private func checkEventStatus() {
        guard let liveEvent = events.first else { return }

        // If live event is finished, cycle to next batch
        if TimeService.shared.now >= liveEvent.endTime {
            print("🔄 Live event finished: \(liveEvent.mediaItem.name). Cycling to next batch.")
            calculateDeterministicSchedule()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func joinEvent(_ event: EventItem) {
        print("🎟️ Joining event: \(event.mediaItem.name)")
        print("   Event start time: \(event.startTime)")
        print("   Event duration: \(event.duration)s")
        print("   Current time: \(TimeService.shared.now)")
        print("   Is Live: \(event.isLive)")
        print("   Is In Lobby: \(event.isInLobby)")

        // Use deterministic room ID based on movie IMDB ID
        let roomId = "event_\(event.mediaItem.id)"

        // Create/join event room in Supabase for chat
        Task {
            do {
                guard let userId = appState.currentUserId else {
                    print("⚠️ No user ID - skipping room creation")
                    await createLocalEventRoom(event: event, roomId: roomId)
                    return
                }

                // Try to get existing room
                let existingRoom = try? await SupabaseClient.shared.getRoomState(roomId: roomId)
                if existingRoom != nil {
                    print("✅ Event room already exists: \(roomId)")
                    // Join the existing room
                    try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)
                } else {
                    // Create new event room
                    print("📝 Creating new event room: \(roomId)")
                    _ = try await SupabaseClient.shared.createRoom(
                        id: roomId,
                        name: event.mediaItem.name,
                        hostUserId: userId, // First user becomes "host" for DB purposes
                        hostUsername: "RedLemon Events",
                        streamHash: nil,
                        imdbId: event.mediaItem.id,
                        posterUrl: event.mediaItem.poster,
                        backdropUrl: event.mediaItem.background,
                        season: nil,
                        episode: nil,
                        isPublic: true
                    )
                    // Join the room we just created
                    try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: false)
                }

                await createLocalEventRoom(event: event, roomId: roomId)
            } catch {
                print("❌ Failed to create/join event room: \(error)")
                // Fall back to local-only room (no chat sync)
                await createLocalEventRoom(event: event, roomId: roomId)
            }
        }
    }

    @MainActor
    private func createLocalEventRoom(event: EventItem, roomId: String) {
        // Create a WatchPartyRoom for this event
        let room = WatchPartyRoom(
            id: roomId,
            hostId: "system",
            hostName: "RedLemon System",
            mediaItem: event.mediaItem,
            season: nil,
            episode: nil,
            quality: .fullHD,
            sourceQuality: nil,
            description: "Live Event",
            posterURL: event.mediaItem.poster,
            participants: [],
            state: .lobby, // Start in lobby state, will sync with server
            createdAt: event.startTime,
            playlist: nil,  // Events don't use playlists
            currentPlaylistIndex: 0,
            lobbyDuration: 600,  // 10 minutes for events
            shouldLoop: false,
            isPersistent: true,  // Events are persistent
            selectedStreamHash: nil,
            selectedFileIdx: nil,
            selectedQuality: nil,
            unlockedStreamURL: nil
        )

        print("   Room createdAt: \(room.createdAt)")

        // Auto-join lobby if it's the live event OR if we are seamlessly transitioning
        if event.isLive || appState.shouldAutoJoinLobby {
            appState.shouldAutoJoinLobby = true
        }

        appState.currentEventId = event.id // Track current event ID

        appState.isEventPlayback = true // Mark as event playback for seamless transition support
        appState.currentWatchMode = .watchParty // Enable watch party mode for chat

        appState.currentWatchPartyRoom = room
        appState.isWatchPartyHost = false // User is always guest in system events
        appState.currentView = .watchPartyLobby
    }
}

struct EventItem: Identifiable {
    let id: String
    let mediaItem: MediaItem
    let startTime: Date  // Just for ordering, not actual time
    let duration: TimeInterval  // Total event slot duration (includes buffer)
    let actualMovieDuration: TimeInterval  // Actual movie runtime (no buffer)
    let index: Int  // Position in the list (0 = live, 1-3 = upcoming)
    var participantCount: Int = 0  // Number of participants in the event room

    var endTime: Date {
        startTime.addingTimeInterval(duration)
    }

    // First event (index 0) is always "live", rest are upcoming
    var isLive: Bool {
        return index == 0
    }

    var isUpcoming: Bool {
        return index > 0
    }

    var isFinished: Bool {
        // Check if current time is past the movie's actual end time (not including buffer)
        let now = TimeService.shared.now
        let actualMovieEndTime = startTime.addingTimeInterval(actualMovieDuration)
        return now >= actualMovieEndTime
    }

    var isInLobby: Bool {
        // The next event (index 1) is in lobby when the current event (index 0) has finished
        // This happens during the 10-minute buffer period
        let now = TimeService.shared.now
        return index == 1 && now >= startTime.addingTimeInterval(-600) // 600s = 10 min buffer
    }
}

struct HeroEventCard: View {
    let event: EventItem
    var isLobbyOverride: Bool = false // Allow forcing lobby open (e.g. when previous event finishes)
    let onJoin: () -> Void

    @State private var currentTime = TimeService.shared.now
    @State private var timer: Timer?

    var body: some View {
        Button(action: {
            // Allow joining if:
            // 1. It's the live event (index 0) and not finished, OR
            // 2. It's the next event (index 1) and in lobby state (or override is true)
            if (event.isLive && !event.isFinished) || event.isInLobby || isLobbyOverride {
                onJoin()
            }
        }) {
            ZStack(alignment: .topLeading) {
                // Full Background Image with Gradient
                AsyncImage(url: event.mediaItem.backgroundURL ?? event.mediaItem.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle().fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                }
                .frame(height: 320)
                .clipped()
                .overlay(
                    // Multi-layer gradient for better readability
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.7), .clear, .black.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                )
                .cornerRadius(16)

                // Content Overlay
                VStack(alignment: .leading, spacing: 0) {
                    // Top Section: Status Badge
                    HStack {
                        if event.isFinished {
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 11))
                                Text("EVENT FINISHED")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.gray.opacity(0.8))
                                    .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 2)
                            )

                        } else if event.isInLobby || isLobbyOverride {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 8, height: 8)
                                    .shadow(color: .yellow.opacity(0.6), radius: 4)
                                Text("Lobby Open")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.yellow.opacity(0.2))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                            )
                        } else if event.isLive {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                Text("LIVE NOW")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.red.opacity(0.9))
                                    .shadow(color: .red.opacity(0.5), radius: 8, x: 0, y: 2)
                            )
                        } else if event.isUpcoming {
                            HStack(spacing: 6) {
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 11))
                                Text("STARTS \(formatTime(event.startTime))")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.orange.opacity(0.9))
                                    .shadow(color: .orange.opacity(0.3), radius: 6, x: 0, y: 2)
                            )
                        }

                        Spacer()

                        // Participant Count
                        if event.participantCount > 0 {
                            HStack(spacing: 4) {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 11))
                                Text("\(event.participantCount)")
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.2))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)

                    Spacer()

                    // Bottom Section: Logo, Metadata, Progress
                    VStack(alignment: .leading, spacing: 12) {
                        // Logo or Title
                        if let logoURL = event.mediaItem.logoURL {
                            AsyncImage(url: logoURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Text(event.mediaItem.name)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                            }
                            .frame(maxWidth: 300, maxHeight: 80, alignment: .leading)
                            .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 4)
                        } else {
                            Text(event.mediaItem.name)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                        }

                        // Metadata Row
                        HStack(spacing: 8) {
                            if let year = event.mediaItem.releaseInfo {
                                Text(year)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            if event.mediaItem.releaseInfo != nil && event.mediaItem.runtime != nil {
                                Text("•")
                                    .font(.system(size: 14))
                            }
                            if let runtime = event.mediaItem.runtime {
                                Text(runtime)
                                    .font(.system(size: 14, weight: .medium))
                            }
                        }
                        .foregroundColor(.white.opacity(0.9))

                        // Progress Bar (if live)
                        if event.isLive {
                            VStack(alignment: .leading, spacing: 6) {
                                ProgressView(value: progress, total: 1.0)
                                    .progressViewStyle(LinearProgressViewStyle(tint: .red))
                                    .scaleEffect(x: 1, y: 1.5, anchor: .center)

                                HStack {
                                    Text(formatEventTime(elapsedTime))
                                        .font(.system(size: 13, weight: .medium))
                                    Spacer()
                                    Text("-\(formatEventTime(remainingTime))")
                                        .font(.system(size: 13, weight: .medium))
                                }
                                .foregroundColor(.white.opacity(0.8))
                            }
                            .padding(.top, 4)
                        }
                    }
                    .padding(24)
                }
            }
            .frame(height: 320)
            .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 6)
        }
        .buttonStyle(PlainButtonStyle())
        .opacity(event.isFinished ? 0.6 : 1.0)
        .overlay(
            // Hover effect hint
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    event.isFinished ? Color.gray.opacity(0.3) :
                    (event.isInLobby ? Color.blue.opacity(0.5) :
                    (event.isLive ? Color.red.opacity(0.5) : Color.white.opacity(0.1))),
                    lineWidth: 2
                )
        )
        .onAppear {
            // Only start timer for live events
            if event.isLive {
                currentTime = TimeService.shared.now
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    currentTime = TimeService.shared.now
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }

    private var progress: Double {
        let elapsed = currentTime.timeIntervalSince(event.startTime)
        return min(max(elapsed / event.actualMovieDuration, 0), 1)
    }

    private var elapsedTime: TimeInterval {
        currentTime.timeIntervalSince(event.startTime)
    }

    private var remainingTime: TimeInterval {
        let actualMovieEndTime = event.startTime.addingTimeInterval(event.actualMovieDuration)
        return max(actualMovieEndTime.timeIntervalSince(currentTime), 0)
    }

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func formatEventTime(_ interval: TimeInterval) -> String {
        let hours = Int(interval) / 3600
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
