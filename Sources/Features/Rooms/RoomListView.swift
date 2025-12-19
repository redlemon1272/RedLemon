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
    @State private var searchText = ""
    private let pageSize = 20

    var body: some View {
        VStack {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search rooms...", text: $searchText)
                    .textFieldStyle(.plain)
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(10)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.top, 10)

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
                    if !searchText.isEmpty {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("No rooms found")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Try a different search term")
                            .foregroundColor(.secondary)
                    } else {
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
                }
                .padding()
            } else {
                ScrollView {
                    VStack(spacing: 24) {
                        ForEach(appState.activeRooms) { room in
                            HeroRoomCard(room: room) {
                                // Although joinRoom is synchronous, the closure is async, so we wrap it
                                joinRoom(room: room)
                            }
                        }

                        // Infinite Scroll Trigger
                        if hasMore {
                            Color.clear
                                .frame(height: 50)
                                .onAppear {
                                    if !isLoading && !isLoadingMore {
                                        loadRooms(reset: false)
                                    }
                                }
                            
                            ProgressView()
                                .scaleEffect(0.8)
                                .padding()
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
            // Always refresh list when appearing to ensure stale (private) rooms are removed
            loadRooms(reset: true)
            Task {
                await setupRealtimeSubscription()
            }
        }
        .onDisappear {
            Task {
                await disconnectRealtime()
            }
        }
        .task(id: searchText) {
            // Debounce search
            if searchText.isEmpty {
                 loadRooms(reset: true)
                 return
            }
            
            try? await Task.sleep(nanoseconds: 500_000_000) // 500ms debounce
            loadRooms(reset: true)
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

        let currentSearch = searchText // Capture for task

        Task {
            do {
                // Fetch rooms from Supabase backend with pagination
                print("📋 Fetching rooms from Supabase backend (offset: \(offset), limit: \(pageSize), search: '\(currentSearch)')...")
                let backendRooms = try await SupabaseClient.shared.getAllRooms(limit: pageSize, offset: offset, searchQuery: currentSearch)

                if backendRooms.count < pageSize {
                    await MainActor.run { hasMore = false }
                }

                // Convert Supabase rooms to WatchPartyRooms with participants
                var newRooms: [WatchPartyRoom] = []
                for room in backendRooms {
                    // FILTER: Exclude system-run events ("RedLemon Events") from the public rooms list
                    if room.hostUsername == "RedLemon Events" || room.type == .event {
                        continue
                    }

                    if let watchPartyRoom = await convertSupabaseRoomToWatchPartyRoom(room) {
                        newRooms.append(watchPartyRoom)
                    }
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

    private func convertSupabaseRoomToWatchPartyRoom(_ room: SupabaseRoom) async -> WatchPartyRoom? {
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

        // Fetch actual participants from room_participants table first to verify Host presence
        var guests: [Participant] = []
        var host: Participant?
        
        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: room.id)
            
            // ZOMBIE CHECK: Verify host is in the participant list
            guard let hostData = roomParticipants.first(where: { $0.userId.uuidString == room.hostUserId.uuidString }) else {
                print("👻 Zombie Room detected: \(room.id) (Host \(room.hostUsername) missing). Cleaning up...")
                Task {
                    try? await SupabaseClient.shared.deleteRoom(roomId: room.id)
                    print("🧹 Distributed Cleanup: Deleted zombie room \(room.id)")
                }
                return nil
            }
            
            // Create host participant from REAL data
            host = Participant(
                id: room.hostUserId.uuidString,
                name: room.hostUsername,
                isHost: true,
                isReady: true,
                joinedAt: hostData.joinedAt
            )

            // Convert guests
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
            // If we can't verify participants, skip to avoid showing invalid rooms
            return nil
        }
        
        guard let validatedHost = host else { return nil }

        return WatchPartyRoom(
            id: room.id,
            hostId: validatedHost.id,
            hostName: room.hostUsername,
            mediaItem: mediaItem,
            season: nil,
            episode: nil,
            episodeTitle: nil,
            quality: .fullHD,
            sourceQuality: nil,

            description: room.description,
            posterURL: room.posterUrl,
            participants: [validatedHost] + guests,
            state: room.isPlaying ? .playing : .lobby,
            createdAt: room.createdAt,
            lastActivity: room.lastActivity,
            playlist: room.playlist,
            currentPlaylistIndex: room.currentPlaylistIndex ?? 0,
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
        appState.player.currentWatchPartyRoom = room
        appState.player.currentRoomId = room.id
        appState.player.isWatchPartyHost = isUserHost

        // If room is already playing, set auto-join flag so lobby auto-starts immediately
        if room.state == .playing {
            print("🎬 Room is already playing - will auto-start from lobby")
            appState.shouldAutoJoinLobby = true
        }

        appState.currentView = .watchPartyLobby
    }

    private func joinRoomByCode(code: String) {
        print("🚪 Joining room by code: \(code)")
        let code = code.trimmingCharacters(in: .whitespacesAndNewlines)
        if code.isEmpty { return }

        // 1. Try local list first (fast path)
        if let room = appState.activeRooms.first(where: { $0.id == code }) {
            joinRoom(room: room)
            return
        }

        // 2. Fetch from server (fallback for private rooms)
        isLoading = true
        Task {
            do {
                print("🔍 Looking up room by code on Supabase: \(code)")
                if let supabaseRoom = try await SupabaseClient.shared.getRoomState(roomId: code) {
                    // Convert to WatchPartyRoom
                    if let watchPartyRoom = await convertSupabaseRoomToWatchPartyRoom(supabaseRoom) {
                        await MainActor.run {
                            isLoading = false
                            joinRoom(room: watchPartyRoom)
                        }
                    } else {
                        throw NSError(domain: "RoomListView", code: 404, userInfo: [NSLocalizedDescriptionKey: "Room exists but could not be processed (possibly invalid host or empty)"])
                    }
                } else {
                    throw NSError(domain: "RoomListView", code: 404, userInfo: [NSLocalizedDescriptionKey: "Room not found. Check the code and try again."])
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    print("❌ Failed to join room by code: \(error)")
                    NSAlert.showAlert(title: "Join Failed", message: error.localizedDescription, style: .critical)
                }
            }
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
                    "event": "*",
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
        // Log payload for debugging
        // print("📦 Room Update Payload: \(payload)")
        
        let eventType = payload["eventType"] as? String ?? ""
        
        // CASE 1: DELETE (Room Closed)
        if eventType == "DELETE" {
            guard let oldRecord = payload["old"] as? [String: Any],
                  let roomId = oldRecord["id"] as? String else {
                return
            }
            print("🗑️ RoomListView: Detected DELETE for room \(roomId) - Removing from list")
            if let index = appState.activeRooms.firstIndex(where: { $0.id == roomId }) {
                appState.activeRooms.remove(at: index)
            }
            return
        }

        // CASE 2: UPDATE / INSERT
        guard let newRecord = payload["new"] as? [String: Any],
              let roomId = newRecord["id"] as? String else {
            return
        }
        
        // CHECK: If room became private (Soft Close), remove it
        if let isPublic = newRecord["is_public"] as? Bool, !isPublic {
            print("🙈 RoomListView: Room \(roomId) is now private (Soft Closed) - Removing from list")
            if let index = appState.activeRooms.firstIndex(where: { $0.id == roomId }) {
                appState.activeRooms.remove(at: index)
            }
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
        
        // NEW: Update media info (for playlist progression)
        if let mediaItemData = newRecord["media_item"] as? [String: Any] {
            // Parse MediaItem from JSON
            if let data = try? JSONSerialization.data(withJSONObject: mediaItemData),
               let mediaItem = try? JSONDecoder().decode(MediaItem.self, from: data) {
                room.mediaItem = mediaItem
                // Update poster if available
                if let poster = mediaItem.poster {
                     room.posterURL = poster
                }
            }
        }
        
        // Update Season/Episode
        if let season = newRecord["season"] as? Int {
             room.season = season
        }
        if let episode = newRecord["episode"] as? Int {
             room.episode = episode
        }
        // If episode changed, we might need to fetch the episode title again
        // But for now, just having the number is good

        appState.activeRooms[index] = room
        print("🔄 RoomListView: Updated room \(roomId) - Media: \(room.mediaItem?.name ?? "nil"), S\(room.season ?? 0)E\(room.episode ?? 0), state: \(room.state)")
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
                .onSubmit {
                    if !roomCodeInput.isEmpty {
                        onJoin(roomCodeInput.uppercased())
                    }
                }

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
