import SwiftUI

struct EventsView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var apiClient = LocalAPIClient()
    @State private var events: [EventItem] = []
    @State private var isLoading = true
    @State private var timer: Timer?

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
                calculateSchedule(movies: movies)
                isLoading = false
            } catch {
                print("❌ Failed to load events: \(error)")
                isLoading = false
            }
        }
    }

    private func calculateSchedule(movies: [MediaItem]) {
        let now = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: now)
        
        var cumulativeTime: TimeInterval = 0
        var scheduledEvents: [EventItem] = []

        for movie in movies {
            // Parse runtime (e.g., "148 min")
            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60)
            
            let startTime = startOfDay.addingTimeInterval(cumulativeTime)
            let endTime = startTime.addingTimeInterval(duration)
            
            scheduledEvents.append(EventItem(
                id: UUID().uuidString,
                mediaItem: movie,
                startTime: startTime,
                duration: duration
            ))
            
            // Add duration + buffer for next start time
            cumulativeTime += duration + bufferBetweenMovies
        }
        
        // Handle loop wrapping (if current time is past all events, shift them to next day or loop)
        // For simplicity in this client-side view, we just display the calculated schedule relative to today's midnight.
        // The backend worker handles the actual persistent room creation.
        
        DispatchQueue.main.async {
            self.events = scheduledEvents
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            // Force UI update for progress bars and timestamps
            self.events = self.events.map { $0 }
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
            hostUserId: "system",
            hostUsername: "RedLemon System",
            imdbId: event.mediaItem.id,
            name: event.mediaItem.name,
            posterUrl: event.mediaItem.poster,
            backdropUrl: event.mediaItem.background,
            isPlaying: true, // System events are always "playing"
            createdAt: event.startTime,
            participants: []
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
    let startTime: Date
    let duration: TimeInterval
    
    var endTime: Date {
        startTime.addingTimeInterval(duration)
    }
    
    var isLive: Bool {
        let now = Date()
        return now >= startTime && now < endTime
    }
    
    var isUpcoming: Bool {
        Date() < startTime
    }
    
    var isFinished: Bool {
        Date() >= endTime
    }
}

struct HeroEventCard: View {
    let event: EventItem
    let onJoin: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            AsyncImage(url: URL(string: event.mediaItem.background ?? event.mediaItem.poster ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.3))
            }
            .frame(height: 250)
            .clipped()
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(12)
            
            // Content
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    // Status Badge
                    if event.isLive {
                        HStack(spacing: 6) {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 8, height: 8)
                            Text("NOW PLAYING")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(4)
                    } else if event.isUpcoming {
                        Text("STARTS \(formatTime(event.startTime))")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.yellow)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.yellow.opacity(0.2))
                            .cornerRadius(4)
                    } else {
                        Text("FINISHED")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(4)
                    }
                    
                    // Logo or Title
                    if let logoUrl = event.mediaItem.logo, let url = URL(string: logoUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Text(event.mediaItem.name)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(height: 60, alignment: .leading)
                    } else {
                        Text(event.mediaItem.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    // Metadata
                    HStack {
                        Text(event.mediaItem.releaseInfo ?? "")
                        Text("•")
                        Text(event.mediaItem.runtime ?? "")
                        Text("•")
                        Text(String(format: "⭐️ %.1f", event.mediaItem.imdbRating ?? 0))
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                    
                    // Progress Bar (if live)
                    if event.isLive {
                        VStack(alignment: .leading, spacing: 4) {
                            ProgressView(value: progress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .red))
                            
                            HStack {
                                Text(formatEventTime(currentTime))
                                Spacer()
                                Text("-\(formatEventTime(remainingTime))")
                            }
                            .font(.caption2)
                            .foregroundColor(.gray)
                        }
                        .frame(width: 200)
                    }
                }
                
                Spacer()
                
                // Join Button
                if !event.isFinished {
                    Button(action: onJoin) {
                        Text(event.isLive ? "Join Now" : "Notify Me")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(event.isLive ? Color.red : Color.white.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(20)
        }
        .frame(height: 250)
        .shadow(radius: 10)
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
