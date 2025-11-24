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
            Color.black.edgesIgnoringSafeArea(.all)

            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.white)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Live Events")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Curated cinema streaming 24/7. Join any movie in progress.")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)

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
        .onAppear {
            loadEvents()
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
                // Shuffle movies so it's different every time the app opens
                allMovies = movies.shuffled()
                
                // Start with first 4 movies
                currentOffset = 0
                showNextBatch()
                isLoading = false
                
                // Start timer to check for event completion
                startTimer()
            } catch {
                print("❌ Failed to load events: \(error)")
                isLoading = false
            }
        }
    }
    
    private func showNextBatch() {
        // Get next 4 movies, cycling back to start if needed
        var batch: [MediaItem] = []
        for i in 0..<4 {
            let index = (currentOffset + i) % allMovies.count
            if index < allMovies.count {
                batch.append(allMovies[index])
            }
        }
        
        calculateSchedule(movies: batch)
        
        // Move offset forward for next batch
        currentOffset = (currentOffset + 4) % allMovies.count
    }

    private func calculateSchedule(movies: [MediaItem]) {
        // Simple sequential schedule: first movie is "live", rest are upcoming
        var scheduledEvents: [EventItem] = []
        
        let now = Date()
        
        for (index, movie) in movies.enumerated() {
            // Parse runtime for display purposes
            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60)
            
            // First event starts NOW. Others follow sequentially with buffer.
            // This ensures the "Live" event has a valid endTime for auto-cycling.
            let startTime: Date
            if index == 0 {
                startTime = now
            } else {
                // For upcoming events, just show them as starting after the previous one
                // This is an approximation for UI display
                let prevDuration = scheduledEvents.last?.duration ?? 0
                let prevStart = scheduledEvents.last?.startTime ?? now
                startTime = prevStart.addingTimeInterval(prevDuration + bufferBetweenMovies)
            }
            
            scheduledEvents.append(EventItem(
                id: UUID().uuidString,
                mediaItem: movie,
                startTime: startTime,
                duration: duration,
                index: index
            ))
        }
        
        DispatchQueue.main.async {
            self.events = scheduledEvents
        }
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
            showNextBatch()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func joinEvent(_ event: EventItem) {
        // For now, join as a temporary watch party
        // In the full implementation, this will fetch the persistent room from Supabase
        print("🎬 Joining event: \(event.mediaItem.name)")
        
        // Calculate current position if live
        let now = Date()
        let position: Double
        if now >= event.startTime && now < event.endTime {
            position = now.timeIntervalSince(event.startTime)
        } else {
            position = 0
        }

        // Create a mock room for now (until backend worker is restored)
        let room = WatchPartyRoom(
            id: "EVENT-\(event.mediaItem.id)",
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
            state: .playing,
            createdAt: event.startTime,
            selectedStreamHash: nil,
            selectedFileIdx: nil,
            selectedQuality: nil,
            unlockedStreamURL: nil
        )
        
        appState.currentWatchPartyRoom = room
        appState.currentView = .watchPartyLobby
        
        // Set resume timestamp for late join
        appState.resumeFromTimestamp = position
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
        return false  // Events never finish in this simple model
    }
}

struct HeroEventCard: View {
    let event: EventItem
    let onJoin: () -> Void
    
    var body: some View {
        Button(action: {
            if !event.isFinished {
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
                        if event.isLive {
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
                            if event.mediaItem.runtime != nil && event.mediaItem.imdbRating != nil {
                                Text("•")
                                    .font(.system(size: 14))
                            }
                            if let rating = event.mediaItem.imdbRating {
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.yellow)
                                    Text(String(format: "%.1f", rating))
                                        .font(.system(size: 14, weight: .semibold))
                                }
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
                                    Text(formatEventTime(currentTime))
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
            .scaleEffect(event.isFinished ? 0.98 : 1.0)
            .opacity(event.isFinished ? 0.6 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(event.isFinished)
        .overlay(
            // Hover effect hint
            RoundedRectangle(cornerRadius: 16)
                .stroke(event.isLive ? Color.red.opacity(0.5) : Color.white.opacity(0.1), lineWidth: 2)
        )
    }
    
    private var progress: Double {
        let now = Date()
        let elapsed = now.timeIntervalSince(event.startTime)
        return min(max(elapsed / event.duration, 0), 1)
    }
    
    private var currentTime: TimeInterval {
        Date().timeIntervalSince(event.startTime)
    }
    
    private var remainingTime: TimeInterval {
        event.endTime.timeIntervalSince(Date())
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
