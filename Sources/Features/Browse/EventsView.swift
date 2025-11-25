import SwiftUI

struct EventsView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient()
    @State private var events: [EventItem] = []
    @State private var isLoading = true
    @State private var timer: Timer?
    @State private var allMovies: [MediaItem] = []  // Store all fetched movies
    @State private var currentOffset = 0  // Track which set of 4 we're showing

    // MARK: - Constants
    private let bufferBetweenMovies: TimeInterval = 600 // 10 minutes

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Live Events")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                // DEBUG: Force refresh button
                                Button(action: {
                                    print("🔄 Force refresh triggered")
                                    loadEvents()
                                }) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "arrow.clockwise")
                                        Text("Refresh")
                                    }
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                                }
                                .buttonStyle(.plain)
                            }
                            
                            Text("Curated cinema streaming 24/7. Join any movie in progress.")
                                .font(.system(size: 16))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)

                        if events.isEmpty {
                            VStack(spacing: 20) {
                                Image(systemName: "film")
                                    .font(.system(size: 50))
                                    .foregroundColor(.secondary)
                                Text("No events scheduled right now.")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                Text("Check back later for more live screenings.")
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, minHeight: 300)
                        } else {
                            // Events List
                            LazyVStack(spacing: 20) {
                                ForEach(events) { event in
                                    HeroEventCard(event: event) {
                                        joinEvent(event)
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
        .onAppear {
            print("📅 EventsView.onAppear - allMovies.count: \(allMovies.count)")
            // Recalculate schedule on every appear to ensure status is current
            if !allMovies.isEmpty {
                print("📅 Recalculating schedule with existing movies")
                calculateDeterministicSchedule()
            } else {
                print("📅 Loading events from API")
                loadEvents()
            }
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func loadEvents() {
        Task {
            do {
                let movies = try await apiClient.fetchTopMoviesForEvents()
                // Use the daily shuffled order from the API
                allMovies = movies
                
                calculateDeterministicSchedule()
                isLoading = false
                
                // Start timer to check for event completion
                startTimer()
            } catch {
                print("❌ Failed to load events: \(error)")
                isLoading = false
            }
        }
    }
    
    private func calculateDeterministicSchedule() {
        guard !allMovies.isEmpty else { return }
        
        let now = Date()
        
        // 1. Calculate total duration of the entire playlist cycle
        var totalCycleDuration: TimeInterval = 0
        var movieDurations: [TimeInterval] = []
        
        for movie in allMovies {
            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies
            movieDurations.append(duration)
            totalCycleDuration += duration
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
            let duration = TimeInterval(runtimeMinutes * 60)
            
            let startTime: Date
            if i == 0 {
                // Live movie: Start time is in the past
                startTime = now.addingTimeInterval(-timeIntoCurrentMovie)
            } else {
                // Upcoming movies: Start time is based on previous movie's end + buffer
                let prevEvent = scheduledEvents.last!
                startTime = prevEvent.startTime.addingTimeInterval(prevEvent.duration + bufferBetweenMovies)
            }
            
            scheduledEvents.append(EventItem(
                id: UUID().uuidString,
                mediaItem: movie,
                startTime: startTime,
                duration: duration,
                index: i
            ))
        }
        
        DispatchQueue.main.async {
            self.events = scheduledEvents
            
            // Debug log
            if let live = scheduledEvents.first {
                print("📅 Schedule Updated:")
                print("   Live: \(live.mediaItem.name)")
                print("   Progress: \(Int(timeIntoCurrentMovie))s / \(Int(live.duration))s")
            }
            
            // Check for auto-join (Seamless Transition from finished movie)
            if self.appState.shouldAutoJoinLobby {
                // Priority: 1. Lobby (Next event), 2. Live (Current event if we just joined late/reloaded)
                if let lobbyEvent = scheduledEvents.first(where: { $0.isInLobby }) {
                    print("🔄 Auto-joining Lobby event: \(lobbyEvent.mediaItem.name)")
                    self.joinEvent(lobbyEvent)
                } else if let liveEvent = scheduledEvents.first(where: { $0.isLive && !$0.isFinished }) {
                    print("🔄 Auto-joining Live event: \(liveEvent.mediaItem.name)")
                    self.joinEvent(liveEvent)
                }
            }
        }
    }
    
    // Legacy method kept for reference but unused
    private func showNextBatch() {
        calculateDeterministicSchedule()
    }

    private func startTimer() {
        // Check every minute if the live event has finished
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { _ in
            Task { @MainActor in
                self.checkEventStatus()
            }
        }
    }
    
    private func checkEventStatus() {
        guard let liveEvent = events.first else { return }
        
        // If live event is finished, cycle to next batch
        if Date() >= liveEvent.endTime {
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
        print("   Current time: \(Date())")
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
                if let existingRoom = try await SupabaseClient.shared.getRoomState(roomId: roomId) {
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
    let duration: TimeInterval
    let index: Int  // Position in the list (0 = live, 1-3 = upcoming)
    
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
        let now = Date()
        return now >= endTime
    }
    
    var isInLobby: Bool {
        // The next event (index 1) is in lobby when the current event (index 0) has finished
        // This happens during the 10-minute buffer period
        let now = Date()
        return index == 1 && now >= startTime.addingTimeInterval(-600) // 600s = 10 min buffer
    }
}

struct HeroEventCard: View {
    let event: EventItem
    let onJoin: () -> Void
    
    @State private var currentTime = Date()
    @State private var timer: Timer?
    
    var body: some View {
        Button(action: {
            // Allow joining if:
            // 1. It's the live event (index 0) and not finished, OR
            // 2. It's the next event (index 1) and in lobby state
            if (event.isLive && !event.isFinished) || event.isInLobby {
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
                        } else if event.isInLobby {
                            HStack(spacing: 6) {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 11))
                                Text("LOBBY OPEN")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.blue.opacity(0.9))
                                    .shadow(color: .blue.opacity(0.4), radius: 8, x: 0, y: 2)
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
                currentTime = Date()
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    currentTime = Date()
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
        return min(max(elapsed / event.duration, 0), 1)
    }
    
    private var elapsedTime: TimeInterval {
        currentTime.timeIntervalSince(event.startTime)
    }
    
    private var remainingTime: TimeInterval {
        event.endTime.timeIntervalSince(currentTime)
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
