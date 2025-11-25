import SwiftUI

struct RoomListView: View {
    @EnvironmentObject var appState: AppState
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showJoinDialog = false
    @State private var roomCodeInput = ""

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading rooms...")
                    .padding()
            } else if let error = errorMessage {
                VStack {
                    Text("Error loading rooms")
                        .font(.headline)
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button("Retry") {
                        loadRooms()
                    }
                    .padding()
                }
            } else if appState.activeRooms.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "person.3.slash")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    Text("No Active Rooms")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Be the first to start a watch party!")
                        .foregroundColor(.secondary)
                }
                .padding()
            } else {
                List {
                    ForEach(appState.activeRooms) { room in
                        ActiveRoomRow(room: room)
                            .onTapGesture {
                                joinRoom(room: room)
                            }
                    }
                }
            }

            Button(action: { showJoinDialog = true }) {
                Label("Join with Code", systemImage: "number.circle.fill")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Watch Party Rooms")
        .sheet(isPresented: $showJoinDialog) {
            JoinRoomDialog(roomCodeInput: $roomCodeInput, onJoin: { code in
                joinRoomByCode(code: code)
                showJoinDialog = false
            })
        }
        .onAppear {
            loadRooms()
        }
    }

    private func loadRooms() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                // Fetch rooms from Supabase backend
                print("📋 Fetching rooms from Supabase backend...")
                let backendRooms = try await SupabaseClient.shared.getAllRooms()

                // Convert Supabase rooms to WatchPartyRooms with participants
                var allRooms: [WatchPartyRoom] = []
                for room in backendRooms {
                    // Create a MediaItem from the room data
                    let mediaItem = MediaItem(
                        id: room.imdbId ?? "unknown",
                        type: "movie",
                        name: room.name,
                        poster: room.posterUrl,
                        background: room.backdropUrl,
                        logo: nil,
                        description: nil,
                        releaseInfo: nil,
                        year: nil,
                        imdbRating: nil,
                        genres: nil,
                        runtime: nil
                    )

                    // Create host participant
                    let host = Participant(
                        id: room.hostUserId.uuidString,
                        name: room.hostUsername,
                        isHost: true,
                        isReady: true,
                        joinedAt: Date()
                    )

                    // Fetch actual participants from room_participants table
                    var guests: [Participant] = []
                    do {
                        let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: room.id)
                        NSLog("📋 Found \(roomParticipants.count) participants in room \(room.id)")

                        // Convert to Participant objects (excluding host)
                        for participant in roomParticipants {
                            // Skip the host since we already added them
                            if participant.userId.uuidString == room.hostUserId.uuidString {
                                continue
                            }

                            // Get username from user ID
                            if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                                let guest = Participant(
                                    id: participant.userId.uuidString,
                                    name: user.username,
                                    isHost: participant.isHost,
                                    isReady: false,
                                    joinedAt: participant.joinedAt
                                )
                                guests.append(guest)
                                NSLog("   - \(user.username) (guest)")
                            } else {
                                // Fallback if user lookup fails
                                let guest = Participant(
                                    id: participant.userId.uuidString,
                                    name: "Unknown User",
                                    isHost: participant.isHost,
                                    isReady: false,
                                    joinedAt: participant.joinedAt
                                )
                                guests.append(guest)
                                NSLog("   - Unknown User (guest)")
                            }
                        }
                    } catch {
                        NSLog("⚠️ Failed to fetch participants for room \(room.id): \(error)")
                        // Continue with empty guests list if fetch fails
                    }

                    let watchPartyRoom = WatchPartyRoom(
                        id: room.id,
                        hostId: host.id,
                        hostName: room.hostUsername,
                        mediaItem: mediaItem,
                        season: nil,  // Extract from metadata when available
                        episode: nil,  // Extract from metadata when available
                        quality: .fullHD,
                        sourceQuality: nil,
                        description: nil,
                        posterURL: room.posterUrl,
                        participants: [host] + guests,
                        state: room.isPlaying ? .playing : .lobby,
                        createdAt: room.createdAt,
                        playlist: nil,  // Will be synced from database if exists
                        currentPlaylistIndex: 0,
                        lobbyDuration: 300,
                        shouldLoop: false,
                        isPersistent: true,
                        selectedStreamHash: nil,
                        selectedFileIdx: nil,
                        selectedQuality: nil,
                        unlockedStreamURL: nil
                    )
                    allRooms.append(watchPartyRoom)
                }

                await MainActor.run {

                    // Sort by creation time (newest first) and limit to 10
                    appState.activeRooms = allRooms
                        .sorted { $0.createdAt > $1.createdAt }
                        .prefix(10)
                        .map { $0 }

                    isLoading = false
                    print("✅ Loaded \(appState.activeRooms.count) rooms from Supabase (showing 10 most recent)")
                }

                // Fetch poster URLs from Cinemeta for each room (async, don't block UI)
                Task {
                    await fetchPostersForRooms()
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                    isLoading = false
                    print("❌ Failed to load rooms from backend: \(error)")
                }
            }
        }
    }

    private func fetchPostersForRooms() async {
        // Fetch all posters concurrently instead of sequentially
        await withTaskGroup(of: (Int, WatchPartyRoom?).self) { group in
            for (index, room) in appState.activeRooms.enumerated() {
                group.addTask {
                    await self.fetchPosterForRoom(room: room, index: index)
                }
            }

            // Collect results
            var updatedRooms = appState.activeRooms
            for await (index, updatedRoom) in group {
                if let updatedRoom = updatedRoom {
                    updatedRooms[index] = updatedRoom
                }
            }

            // Update appState on main actor
            await MainActor.run {
                appState.activeRooms = updatedRooms
            }
        }
    }

    private func fetchPosterForRoom(room: WatchPartyRoom, index: Int) async -> (Int, WatchPartyRoom?) {
        var room = room

        guard let imdbId = room.mediaItem?.id, imdbId != "unknown" else {
            return (index, nil)
        }

        struct CinemetaMeta: Codable {
            let meta: MetaInfo
            struct MetaInfo: Codable {
                let name: String?
                let poster: String?
                let background: String?
                let logo: String?
                let type: String?
            }
        }

        do {
            let mediaType = room.mediaItem?.type ?? "movie"
            var cinemetaURL = URL(string: "https://v3-cinemeta.strem.io/meta/\(mediaType)/\(imdbId).json")!
            let (data, _) = try await URLSession.shared.data(from: cinemetaURL)
            var response = try JSONDecoder().decode(CinemetaMeta.self, from: data)

            // If no artwork, try opposite type
            if response.meta.poster == nil && response.meta.background == nil && response.meta.logo == nil {
                let alternateType = mediaType == "movie" ? "series" : "movie"
                cinemetaURL = URL(string: "https://v3-cinemeta.strem.io/meta/\(alternateType)/\(imdbId).json")!

                if let altData = try? await URLSession.shared.data(from: cinemetaURL).0,
                   let altResponse = try? JSONDecoder().decode(CinemetaMeta.self, from: altData),
                   (altResponse.meta.poster != nil || altResponse.meta.background != nil || altResponse.meta.logo != nil) {
                    response = altResponse
                }
            }

            if let poster = response.meta.poster {
                room.posterURL = poster
            }

            if let existingMediaItem = room.mediaItem {
                room.mediaItem = MediaItem(
                    id: existingMediaItem.id,
                    type: response.meta.type ?? existingMediaItem.type,
                    name: response.meta.name ?? existingMediaItem.name,
                    poster: response.meta.poster ?? existingMediaItem.poster,
                    background: response.meta.background ?? existingMediaItem.background,
                    logo: response.meta.logo ?? existingMediaItem.logo,
                    description: existingMediaItem.description,
                    releaseInfo: existingMediaItem.releaseInfo,
                    year: existingMediaItem.year,
                    imdbRating: existingMediaItem.imdbRating,
                    genres: existingMediaItem.genres,
                    runtime: existingMediaItem.runtime
                )
            }

            return (index, room)
        } catch {
            return (index, nil)
        }
    }

      private func joinRoom(room: WatchPartyRoom) {
        print("🚪 Joining room: \(room.id)")

        // Check if current user is the host
        let isUserHost = appState.currentUserId?.uuidString == room.hostId
        print("   User ID: \(appState.currentUserId?.uuidString ?? "nil")")
        print("   Host ID: \(room.hostId)")
        print("   Is host: \(isUserHost)")
        print("   Room state: \(room.state)")

        // Set current room
        appState.currentWatchPartyRoom = room
        appState.currentRoomId = room.id
        appState.isWatchPartyHost = isUserHost
        
        // If room is already playing, set auto-join flag so lobby auto-starts immediately
        if room.state == .playing {
            print("🎬 Room is already playing - will auto-start from lobby")
            appState.shouldAutoJoinLobby = true
        }
        
        appState.currentView = .watchPartyLobby
    }

    private func joinRoomByCode(code: String) {
        print("🚪 Joining room by code: \(code)")
        // Try to find room in active rooms
        if let room = appState.activeRooms.first(where: { $0.id == code }) {
            joinRoom(room: room)
        } else {
            // Room not found - could fetch from backend in the future
            print("❌ Room not found: \(code)")
        }
    }
}

extension NSAlert {
    static func showAlert(title: String, message: String, style: NSAlert.Style) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.alertStyle = style
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}

struct ActiveRoomRow: View {
    let room: WatchPartyRoom

    var body: some View {
        HStack(spacing: 16) {
            // Poster art (left side)
            posterView
                .frame(width: 80, height: 120)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.3), radius: 5)

            // Room info (main content)
            VStack(alignment: .leading, spacing: 8) {
                // Title - show movie name if available, otherwise show room name
                if let movieName = room.mediaItem?.name, room.mediaItem?.id != "unknown" {
                    Text(movieName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                } else {
                    Text("Room: \(room.id)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }

                // Description (if available)
                if let description = room.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .italic()
                        .lineLimit(2)
                }

                // Host info and room age
                HStack(spacing: 6) {
                    if let hostName = room.hostName {
                        Text("Hosted by @\(hostName)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        Text("Hosted by \(String(room.hostId.prefix(8)))...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Text("•")
                        .foregroundColor(.secondary)

                    Text(timeAgoString)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                // Bottom row: participants, quality badges, status
                HStack(spacing: 8) {
                    // Participant count
                    Label("\(room.participants.count)", systemImage: "person.2.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    // Quality badges
                    HStack(spacing: 6) {
                        // Resolution badge
                        Text(room.quality.displayName)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.blue)
                            .cornerRadius(4)

                        // Source quality badge (if available)
                        if let sourceQuality = room.sourceQuality, !sourceQuality.isEmpty {
                            Text(sourceQuality)
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(sourceQualityColor.opacity(0.2))
                                .foregroundColor(sourceQualityColor)
                                .cornerRadius(4)
                        }

                        // Status badge
                        HStack(spacing: 3) {
                            Circle()
                                .fill(statusColor)
                                .frame(width: 6, height: 6)
                            Text(statusText)
                                .font(.caption2)
                                .fontWeight(.medium)
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(statusColor.opacity(0.15))
                        .foregroundColor(statusColor)
                        .cornerRadius(4)
                    }
                }
            }
        }
        .padding(12)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }

    @ViewBuilder
    private var posterView: some View {
        if let posterURL = room.posterURL, !posterURL.isEmpty {
            let fullURL = posterURL.starts(with: "http") ? posterURL : "https://image.tmdb.org/t/p/w200\(posterURL)"
            AsyncImage(url: URL(string: fullURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure, .empty:
                    placeholderPoster
                @unknown default:
                    placeholderPoster
                }
            }
        } else {
            placeholderPoster
        }
    }

    private var placeholderPoster: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
            Image(systemName: "film")
                .font(.system(size: 32))
                .foregroundColor(.gray)
        }
    }

    private var timeAgoString: String {
        let now = Date()
        let interval = now.timeIntervalSince(room.createdAt)

        if interval < 60 {
            return "Just now"
        } else if interval < 3600 {
            let minutes = Int(interval / 60)
            return "\(minutes)m ago"
        } else if interval < 86400 {
            let hours = Int(interval / 3600)
            return "\(hours)h ago"
        } else {
            let days = Int(interval / 86400)
            return "\(days)d ago"
        }
    }

    private var sourceQualityColor: Color {
        guard let sourceQuality = room.sourceQuality else { return .gray }
        switch sourceQuality {
        case "BluRay":
            return .blue
        case "WEB-DL", "WEBRip":
            return .green
        case "CAM", "TS":
            return .red
        case "HDTV", "DVDRip":
            return .orange
        default:
            return .gray
        }
    }

    var statusColor: Color {
        switch room.state {
        case .lobby:
            return .orange
        case .playing:
            return .green
        case .paused:
            return .yellow
        case .ended:
            return .gray
        }
    }

    var statusText: String {
        switch room.state {
        case .lobby:
            return "Lobby"
        case .playing:
            return "Playing"
        case .paused:
            return "Paused"
        case .ended:
            return "Ended"
        }
    }
}

struct JoinRoomDialog: View {
    @Binding var roomCodeInput: String
    let onJoin: (String) -> Void
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Join Watch Party")
                .font(.title)
                .fontWeight(.bold)

            Text("Enter the room code shared by the host")
                .foregroundColor(.secondary)

            TextField("Room Code (e.g., A3H9)", text: $roomCodeInput)
                .font(.system(.title3, design: .monospaced))
                .textFieldStyle(.roundedBorder)
                .textCase(.uppercase)
                .padding(.horizontal)

            HStack(spacing: 12) {
                Button("Cancel") {
                    dismiss()
                }
                .keyboardShortcut(.cancelAction)

                Button("Join") {
                    onJoin(roomCodeInput.uppercased())
                }
                .keyboardShortcut(.defaultAction)
                .disabled(roomCodeInput.isEmpty)
            }
        }
        .padding()
        .frame(width: 400, height: 250)
    }
}

struct RoomRow: View {
    let room: MockRoom

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(room.name)
                    .font(.headline)

                Spacer()

                Image(systemName: room.isPrivate ? "lock.fill" : "globe")
                    .foregroundColor(room.isPrivate ? .orange : .green)
            }

            Text("\(room.memberCount) watching")
                .font(.caption)
                .foregroundColor(.secondary)

            if let movie = room.currentMovie {
                Text("Playing: \(movie)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct MockRoom: Identifiable {
    let id = UUID()
    let name: String
    let isPrivate: Bool
    let memberCount: Int
    let currentMovie: String?

    static let samples = [
        MockRoom(name: "Movie Night 🍿", isPrivate: false, memberCount: 12, currentMovie: "The Matrix"),
        MockRoom(name: "Friends Only", isPrivate: true, memberCount: 3, currentMovie: "Inception"),
        MockRoom(name: "Sci-Fi Marathon", isPrivate: false, memberCount: 8, currentMovie: nil),
        MockRoom(name: "Chill Zone", isPrivate: false, memberCount: 5, currentMovie: "Forrest Gump"),
    ]
}
