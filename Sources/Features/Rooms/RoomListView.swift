import SwiftUI

struct RoomListView: View {
    @EnvironmentObject var appState: AppState
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showJoinDialog = false
    @State private var roomCodeInput = ""
    @State private var realtimeClient: SupabaseRealtimeClient?

    @State private var offset = 0
    @State private var hasMore = true
    @State private var isLoadingMore = false
    private let pageSize = 20

    var body: some View {
        VStack {
            if isLoading && appState.activeRooms.isEmpty {
                ProgressView("Loading rooms...")
                    .padding()
            } else if let error = errorMessage, appState.activeRooms.isEmpty {
                VStack {
                    Text("Error loading rooms")
                        .font(.headline)
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button("Retry") {
                        loadRooms(reset: true)
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
                    Button("Refresh") {
                        loadRooms(reset: true)
                    }
                }
                .padding()
            } else {
                ScrollView {
                    LazyVStack(spacing: 24) {
                        ForEach(appState.activeRooms) { room in
                            HeroRoomCard(room: room) {
                                joinRoom(room: room)
                            }
                        }

                        if hasMore {
                            Button(action: {
                                loadRooms(reset: false)
                            }) {
                                HStack {
                                    if isLoadingMore {
                                        ProgressView()
                                            .controlSize(.small)
                                    }
                                    Text(isLoadingMore ? "Loading..." : "Load More")
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .disabled(isLoadingMore)
                            .padding(.top, 8)
                        }
                    }
                    .padding()
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
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    loadRooms(reset: true)
                }) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
                .disabled(isLoading)
            }
        }
        .sheet(isPresented: $showJoinDialog) {
            JoinRoomDialog(roomCodeInput: $roomCodeInput, onJoin: { code in
                joinRoomByCode(code: code)
                showJoinDialog = false
            })
        }
        .onAppear {
            if appState.activeRooms.isEmpty {
                loadRooms(reset: true)
            }
            Task {
                await setupRealtimeSubscription()
            }
        }
        .onDisappear {
            Task {
                await disconnectRealtime()
            }
        }
    }

    private func loadRooms(reset: Bool = false) {
        if reset {
            isLoading = true
            errorMessage = nil
            offset = 0
            hasMore = true
        } else {
            isLoadingMore = true
        }

        Task {
            do {
                // Cleanup stale participants first to get accurate count
                try? await SupabaseClient.shared.cleanupStaleParticipants()
                
                // Fetch rooms from Supabase backend with pagination
                print("📋 Fetching rooms from Supabase backend (offset: \(offset), limit: \(pageSize))...")
                let backendRooms = try await SupabaseClient.shared.getAllRooms(limit: pageSize, offset: offset)

                if backendRooms.count < pageSize {
                    await MainActor.run { hasMore = false }
                }

                // Convert Supabase rooms to WatchPartyRooms with participants
                var newRooms: [WatchPartyRoom] = []
                for room in backendRooms {
                    // Determine media type based on season/episode
                    let mediaType = (room.season != nil || room.episode != nil) ? "series" : "movie"

                    // Create a MediaItem from the room data
                    let mediaItem = MediaItem(
                        id: room.imdbId ?? "unknown",
                        type: mediaType,
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
                        // Convert to Participant objects (excluding host)
                        for participant in roomParticipants {
                            if participant.userId.uuidString == room.hostUserId.uuidString { continue }

                            if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                                let guest = Participant(
                                    id: participant.userId.uuidString,
                                    name: user.username,
                                    isHost: participant.isHost,
                                    isReady: false,
                                    joinedAt: participant.joinedAt
                                )
                                guests.append(guest)
                            } else {
                                let guest = Participant(
                                    id: participant.userId.uuidString,
                                    name: "Unknown User",
                                    isHost: participant.isHost,
                                    isReady: false,
                                    joinedAt: participant.joinedAt
                                )
                                guests.append(guest)
                            }
                        }
                    } catch {
                        print("⚠️ Failed to fetch participants for room \(room.id): \(error)")
                    }

                    let watchPartyRoom = WatchPartyRoom(
                        id: room.id,
                        hostId: host.id,
                        hostName: room.hostUsername,
                        mediaItem: mediaItem,
                        season: nil,
                        episode: nil,
                        episodeTitle: nil,
                        quality: .fullHD,
                        sourceQuality: nil,
                        description: nil,
                        posterURL: room.posterUrl,
                        participants: [host] + guests,
                        state: room.isPlaying ? .playing : .lobby,
                        createdAt: room.createdAt,
                        lastActivity: room.lastActivity,
                        playlist: nil,
                        currentPlaylistIndex: 0,
                        lobbyDuration: 300,
                        shouldLoop: false,
                        isPersistent: true,
                        playbackPosition: TimeInterval(room.playbackPosition),
                        runtime: nil,
                        selectedStreamHash: nil,
                        selectedFileIdx: nil,
                        selectedQuality: nil,
                        unlockedStreamURL: nil
                    )
                    newRooms.append(watchPartyRoom)
                }

                await MainActor.run {
                    if reset {
                        appState.activeRooms = newRooms
                    } else {
                        // Append new rooms, avoiding duplicates
                        let existingIds = Set(appState.activeRooms.map { $0.id })
                        let uniqueNewRooms = newRooms.filter { !existingIds.contains($0.id) }
                        appState.activeRooms.append(contentsOf: uniqueNewRooms)
                    }

                    offset += pageSize
                    isLoading = false
                    isLoadingMore = false
                    print("✅ Loaded \(newRooms.count) rooms (total: \(appState.activeRooms.count))")
                }

                // Fetch poster URLs from Cinemeta for new rooms
                Task {
                    await fetchPostersForRooms(rooms: newRooms)
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                    isLoading = false
                    isLoadingMore = false
                    print("❌ Failed to load rooms from backend: \(error)")
                }
            }
        }
    }

    private func fetchPostersForRooms(rooms: [WatchPartyRoom]? = nil) async {
        // If specific rooms provided, use those. Otherwise use all active rooms.
        let targetRooms = rooms ?? appState.activeRooms

        // Fetch all posters concurrently instead of sequentially
        await withTaskGroup(of: (String, WatchPartyRoom?).self) { group in
            for room in targetRooms {
                group.addTask {
                    await self.fetchPosterForRoom(room: room)
                }
            }

            // Collect results and update appState
            var roomUpdates: [(String, WatchPartyRoom)] = []
            for await (roomId, updatedRoom) in group {
                if let updatedRoom = updatedRoom {
                    roomUpdates.append((roomId, updatedRoom))
                }
            }

            // Apply updates on MainActor
            await MainActor.run {
                var updatedRooms = appState.activeRooms
                for (roomId, updatedRoom) in roomUpdates {
                    if let index = updatedRooms.firstIndex(where: { $0.id == roomId }) {
                        updatedRooms[index] = updatedRoom
                    }
                }
                appState.activeRooms = updatedRooms
            }
        }
    }

    private func fetchPosterForRoom(room: WatchPartyRoom) async -> (String, WatchPartyRoom?) {
        var room = room

        guard let imdbId = room.mediaItem?.id, imdbId != "unknown" else {
            return (room.id, nil)
        }

        do {
            let mediaType = room.mediaItem?.type ?? "movie"

            // Use LocalAPIClient to fetch full metadata (includes episodes for series)
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaType, id: imdbId)

            // Update poster/backdrop/logo
            if let poster = metadata.posterURL {
                room.posterURL = poster
            }

            // Update MediaItem with full details
            if let existingMediaItem = room.mediaItem {
                room.mediaItem = MediaItem(
                    id: existingMediaItem.id,
                    type: metadata.type,
                    name: metadata.title,
                    poster: metadata.posterURL,
                    background: metadata.backgroundURL,
                    logo: metadata.logoURL,
                    description: metadata.description,
                    releaseInfo: metadata.releaseInfo,
                    year: metadata.year,
                    imdbRating: metadata.imdbRating.map { String($0) },
                    genres: metadata.genres,
                    runtime: metadata.runtime
                )
            }

            // If it's a series, try to find the episode title
            if mediaType == "series",
               let season = room.season,
               let episode = room.episode,
               let videos = metadata.videos {

                if let video = videos.first(where: { $0.season == season && $0.episode == episode }) {
                    room.episodeTitle = video.title
                    print("📺 Found episode title for \(metadata.title) S\(season)E\(episode): \(video.title)")
                }
            } else if let runtimeStr = metadata.runtime {
                // For movies, parse runtime string (e.g., "120 min" -> 7200 seconds)
                let runtimeMinutes = Int(runtimeStr.components(separatedBy: " ").first ?? "0") ?? 0
                room.runtime = TimeInterval(runtimeMinutes * 60)
            }

            return (room.id, room)
        } catch {
            print("❌ Failed to fetch metadata for room \(room.id): \(error)")
            return (room.id, nil)
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

    // MARK: - Realtime Subscription

    private func setupRealtimeSubscription() async {
        print("🔌 RoomListView: Setting up realtime subscription for rooms...")

        let client = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )

        await MainActor.run {
            self.realtimeClient = client
        }

        // Subscribe to Postgres Changes on rooms table
        await client.onPostgresChange { payload in
            Task { @MainActor in
                await self.handleRoomUpdate(payload)
            }
        }

        do {
            try await client.connect()

            // Listen for UPDATEs on rooms table (state, playback_position changes)
            let changesConfig: [[String: Any]] = [
                [
                    "event": "UPDATE",
                    "schema": "public",
                    "table": "rooms"
                ]
            ]

            try await client.joinChannel("rooms_updates", postgresChanges: changesConfig)
            print("✅ RoomListView: Connected to rooms realtime updates")
        } catch {
            print("❌ RoomListView: Failed to subscribe to rooms: \(error)")
        }
    }

    private func disconnectRealtime() async {
        if let client = realtimeClient {
            await client.disconnect()
            await MainActor.run {
                self.realtimeClient = nil
            }
        }
    }

    @MainActor
    private func handleRoomUpdate(_ payload: [String: Any]) async {
        guard let newRecord = payload["new"] as? [String: Any],
              let roomId = newRecord["id"] as? String else {
            return
        }

        // Find the room in active rooms
        guard let index = appState.activeRooms.firstIndex(where: { $0.id == roomId }) else {
            return
        }

        var room = appState.activeRooms[index]

        // Update state if changed
        if let isPlaying = newRecord["is_playing"] as? Bool {
            room.state = isPlaying ? .playing : .paused
        }

        // Update playback position if changed
        if let position = newRecord["playback_position"] as? Double {
            room.playbackPosition = TimeInterval(position)
        }

        // Update lastActivity if changed
        if let lastActivityStr = newRecord["last_activity"] as? String {
            let formatter = ISO8601DateFormatter()
            if let lastActivity = formatter.date(from: lastActivityStr) {
                room.lastActivity = lastActivity
            }
        }

        appState.activeRooms[index] = room
        print("🔄 RoomListView: Updated room \(roomId) - state: \(room.state), position: \(room.playbackPosition ?? 0)s")
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
