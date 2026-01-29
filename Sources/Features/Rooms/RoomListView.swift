import SwiftUI

struct RoomListView: View {
    @EnvironmentObject var appState: AppState
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showJoinDialog = false
    @State private var roomCodeInput = ""
    @State private var postgresHandlerId: UUID?

    @State private var offset = 0
    @State private var hasMore = true
    @State private var isLoadingMore = false
    @State private var searchText = ""
    @State private var participantPollingTimer: Timer? // Polls participant counts every 10s
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

            // Header Actions
            HStack {
                Spacer()
                Button(action: { showJoinDialog = true }) {
                    Label("Join with Code", systemImage: "number.circle.fill")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                Spacer()
            }
            .padding(.bottom, 10)

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
                            .font(.title2.weight(.bold))

                        Text("Try a different search term")
                            .foregroundColor(.secondary)
                    } else {
                        Image(systemName: "person.3.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("No Active Rooms")
                            .font(.title2.weight(.bold))

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
                                // joinRoom is now async, so the card will show loading state while this awaits
                                await joinRoom(room: room)
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


        }
        .navigationTitle("Watch Party Rooms")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                // Manual refresh removed as Realtime auto-update handles this
                EmptyView()
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
            // Start participant count polling
            startParticipantCountPolling()
        }
        .onDisappear {
            // Stop polling when view disappears
            stopParticipantCountPolling()
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

                // ENRICHMENT: Fetch metadata concurrently BEFORE updating state to prevent UI flash
                // This ensures we have the high-res background art ready for the first render
                let enrichedRooms = await RoomListView.enrichRoomsWithMetadata(newRooms)

                await MainActor.run {
                    if reset {
                        appState.activeRooms = enrichedRooms
                    } else {
                        // Append new rooms, avoiding duplicates
                        let existingIds = Set(appState.activeRooms.map { $0.id })
                        let uniqueNewRooms = enrichedRooms.filter { !existingIds.contains($0.id) }
                        appState.activeRooms.append(contentsOf: uniqueNewRooms)
                    }

                    offset += pageSize
                    isLoading = false
                    isLoadingMore = false
                    print("✅ Loaded \(enrichedRooms.count) rooms (total: \(appState.activeRooms.count))")
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

    private static func enrichRoomsWithMetadata(_ rooms: [WatchPartyRoom]) async -> [WatchPartyRoom] {
        if rooms.isEmpty { return [] }

        var enrichedRooms = rooms

        await withTaskGroup(of: (Int, WatchPartyRoom).self) { group in
            for (index, room) in rooms.enumerated() {
                group.addTask {
                    // Reuse existing fetch logic
                    let (_, updatedRoom) = await RoomListView.fetchPosterForRoom(room: room)
                    // If updatedRoom is nil (failed), keep original. If not, use enriched.
                    return (index, updatedRoom ?? room)
                }
            }

            // Collect results safely
            for await (index, enrichedRoom) in group {
                if index < enrichedRooms.count {
                    enrichedRooms[index] = enrichedRoom
                }
            }
        }

        return enrichedRooms
    }

    private func convertSupabaseRoomToWatchPartyRoom(_ room: SupabaseRoom) async -> WatchPartyRoom? {
        // Determine media type: Check Playlist first to prevent stale "series" inference
        var mediaType = (room.season != nil || room.episode != nil) ? "series" : "movie"

        // CRITICAL FIX: Check Playlist first to override stale inference from DB
        if let playlist = room.playlist,
           let index = room.currentPlaylistIndex,
           index >= 0, index < playlist.count {
            let playlistItem = playlist[index]
            // Only trust playlist type if IDs match (or if checking against raw room data)
             if playlistItem.mediaItem.id == room.imdbId {
                mediaType = playlistItem.mediaItem.type
            }
        }

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

        // Handle System Host (Legacy or Explicit)
        // Force "system" if it's an event, overriding any accidental user assignment in DB
        let isPreExistingEvent = room.type == .event
        let hostIdString = isPreExistingEvent ? "system" : (room.hostUserId?.uuidString.lowercased() ?? "system")
        let isSystemHost = (hostIdString == "system")

        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: room.id)

            if isSystemHost {
                 // System Host is always "present" virtually
                 host = Participant(
                    id: "system",
                    name: room.hostUsername,
                    isHost: true,
                    isReady: true,
                    isPremium: false,
                    joinedAt: room.createdAt,
                    phxRefs: []
                )
            } else {
                // ZOMBIE CHECK: Verify host is in the participant list
                guard let hostData = roomParticipants.first(where: { $0.userId.uuidString.caseInsensitiveCompare(hostIdString) == .orderedSame }) else {
                    print("👻 Room anomaly detected: \(room.id) (Host \(room.hostUsername) missing). Hiding from list but preserving.")
                    return nil
                }

                // Create host participant from REAL data
                 host = Participant(
                    id: hostIdString,
                    name: room.hostUsername,
                    isHost: true,
                    isReady: true,
                    isPremium: false,
                    joinedAt: hostData.joinedAt,
                    phxRefs: []
                )
            }

            // Convert guests
            for participant in roomParticipants {
                let pId = participant.userId.uuidString.lowercased()
                if pId.caseInsensitiveCompare(hostIdString) == .orderedSame { continue }

                if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                    let guest = Participant(
                        id: pId,
                        name: user.username,
                        isHost: participant.isHost,
                        isReady: false,
                        isPremium: false,
                        joinedAt: participant.joinedAt,
                        phxRefs: []
                    )
                    guests.append(guest)
                } else {
                    let guest = Participant(
                        id: pId,
                        name: "Unknown User",
                        isHost: participant.isHost,
                        isReady: false,
                        isPremium: false,
                        joinedAt: participant.joinedAt,
                        phxRefs: []
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
            season: (mediaType == "series") ? room.season : nil,
            episode: (mediaType == "series") ? room.episode : nil,
            episodeTitle: nil,
            quality: .fullHD,
            sourceQuality: nil,

            description: room.description,
            posterURL: room.posterUrl,
            participants: [validatedHost] + guests,
            participantCount: room.participantsCount,  // Use DB-managed count
            maxParticipants: room.maxParticipants,
            state: room.isPlaying ? .playing : .lobby,
            createdAt: room.createdAt,
            lastActivity: room.lastActivity,
            playlist: room.playlist,
            currentPlaylistIndex: room.currentPlaylistIndex ?? 0,
            isPublic: room.isPublic,
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
                    await RoomListView.fetchPosterForRoom(room: room)
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
                    if let index = updatedRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
                        updatedRooms[index] = updatedRoom
                    }
                }
                appState.activeRooms = updatedRooms
            }
        }
    }

    private static func fetchPosterForRoom(room: WatchPartyRoom) async -> (String, WatchPartyRoom?) {
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

    private func joinRoom(room: WatchPartyRoom) async {
        print("🚪 Joining room: \(room.id)")

        // REDLEMON: Delegate to PlayerViewModel canonical logic
        // This handles lobby bypass for active rooms/events and transitions to the correct view (Player vs Lobby)
        await appState.player.joinRoom(roomId: room.id)
    }

    private func joinRoomByCode(code: String) {
        print("🚪 Joining room by code: \(code)")
        let code = code.trimmingCharacters(in: .whitespacesAndNewlines)
        if code.isEmpty { return }

        // 1. Try local list first (fast path)
        if let room = appState.activeRooms.first(where: { $0.id.caseInsensitiveCompare(code) == .orderedSame }) {
            // Capacity Check
            if room.type != .event && room.participantCount >= room.maxParticipants {
                NSAlert.showAlert(title: "Room Full", message: "This watch party is currently at capacity (\(room.participantCount)/\(room.maxParticipants)).", style: .warning)
                return
            }
            Task {
                await joinRoom(room: room)
            }
            return
        }

        // 2. Fetch from server (fallback for private rooms)
        isLoading = true
        Task {
            do {
                print("🔍 Looking up room by code on Supabase: \(code)")
                if let supabaseRoom = try await SupabaseClient.shared.getRoomState(roomId: code) {
                    // Capacity Check (Server Side)
                    if supabaseRoom.type != .event && supabaseRoom.participantsCount >= supabaseRoom.maxParticipants {
                         await MainActor.run {
                             isLoading = false
                             NSAlert.showAlert(title: "Room Full", message: "This watch party is currently at capacity (\(supabaseRoom.participantsCount)/\(supabaseRoom.maxParticipants)).", style: .warning)
                         }
                         return
                    }

                    // Convert to WatchPartyRoom
                    if let watchPartyRoom = await convertSupabaseRoomToWatchPartyRoom(supabaseRoom) {
                        await MainActor.run {
                            isLoading = false
                        }
                        await joinRoom(room: watchPartyRoom)
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

        // CRITICAL FIX: Use shared client to avoid duplicate sockets and disconnection issues
        let client = SupabaseClient.shared.realtimeClient

        // Subscribe to Postgres Changes on rooms table (topic-scoped)
        let handlerId = await client.onPostgresChange(topic: "rooms_updates") { payload in
            Task { @MainActor in
                await self.handleRoomUpdate(payload)
            }
        }

        await MainActor.run {
            self.postgresHandlerId = handlerId
        }

        do {
            try await client.connect() // Idempotent check inside

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
        let client = SupabaseClient.shared.realtimeClient

        // Remove handler to prevent leaks
        if let id = postgresHandlerId {
            await client.removePostgresChange(id: id)
            await MainActor.run {
                self.postgresHandlerId = nil
            }
        }

        // Leave the channel, but DO NOT disconnect the socket (connection is shared)
        try? await client.leaveChannel(topic: "realtime:rooms_updates")
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
            if let index = appState.activeRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
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
            if let index = appState.activeRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
                appState.activeRooms.remove(at: index)
            }
            return
        }

        // Find the room in active rooms
        let index = appState.activeRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame })

        // NEW: If INSERT or Missing Room Update -> Fetch and Add
        if eventType == "INSERT" || (eventType == "UPDATE" && index == nil) {
            print("🆕 RoomListView: Detected new/missing room \(roomId) - Fetching details...")
            Task {
                 await fetchAndAddNewRoom(roomId: roomId)
            }
            return
        }

        guard let index = index else {
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

        // NEW: Update participant count if changed (Realtime)
        if let count = newRecord["participants_count"] as? Int {
             room.participantCount = count
        }

        // NEW: Update media info (for playlist progression) from flat columns
        // The DB uses flat columns (imdb_id, name, poster_url, etc.) not a nested media_item JSON
        if let imdbId = newRecord["imdb_id"] as? String {
            let name = newRecord["name"] as? String ?? room.mediaItem?.name ?? "Unknown Title"
            let poster = newRecord["poster_url"] as? String
            let backdrop = newRecord["backdrop_url"] as? String

            // Reconstruct MediaItem with updated data
            // We use the existing type if possible, or infer from season/episode
            let currentType = room.mediaItem?.type ?? ((newRecord["season"] != nil || newRecord["episode"] != nil) ? "series" : "movie")

            let updatedMedia = MediaItem(
                id: imdbId,
                type: currentType,
                name: name,
                poster: (poster?.isEmpty == false) ? poster : room.mediaItem?.poster,
                background: (backdrop?.isEmpty == false) ? backdrop : room.mediaItem?.background,
                logo: room.mediaItem?.logo, // Preserve logo if we have it
                description: newRecord["description"] as? String ?? room.mediaItem?.description,
                releaseInfo: room.mediaItem?.releaseInfo,
                year: room.mediaItem?.year,
                imdbRating: room.mediaItem?.imdbRating,
                genres: room.mediaItem?.genres,
                runtime: room.mediaItem?.runtime
            )

            // Check if identity changed (triggering fresh metadata load)
            let isNewMedia = room.mediaItem?.id != imdbId
            room.mediaItem = updatedMedia

            if let poster = updatedMedia.poster {
                room.posterURL = poster
            }

            // If it's a new media item, trigger a background metadata enrichment
            if isNewMedia {
                NSLog("%@", "🆕 RoomListView: Detected media change to \(name) (\(imdbId)) - Triggering enrichment")
                let state = appState
                Task { @MainActor in
                    let (_, enrichedRoom) = await RoomListView.fetchPosterForRoom(room: room)
                    if let enriched = enrichedRoom {
                        if let idx = state.activeRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
                            state.activeRooms[idx] = enriched
                        }
                    }
                }
            }
        }

        // Update room description (separate from MediaItem.description)
        // This handles host editing description in lobby
        if let newDescription = newRecord["description"] as? String {
            room.description = newDescription.isEmpty ? nil : newDescription
        } else if newRecord.keys.contains("description") {
            // Description was explicitly set to NULL
            room.description = nil
        }

        // Update Season/Episode (Only if Series)
        if let type = room.mediaItem?.type, type == "series" {
            if let season = newRecord["season"] as? Int {
                 room.season = season
            }
            if let episode = newRecord["episode"] as? Int {
                 room.episode = episode
            }
        } else if let type = room.mediaItem?.type, type == "movie" {
            // For movies, ensure these are cleared (NULL in DB maps to NSNull in JSON/Dictionary if present, but usually just missing)
            // If they are missing or nulled in DB, we should clear them
            room.season = nil
            room.episode = nil
        }
        // If episode changed, we might need to fetch the episode title again
        // But for now, just having the number is good

        appState.activeRooms[index] = room
    }

    // MARK: - Auto-Refresh Helper

    private func fetchAndAddNewRoom(roomId: String) async {
        do {
            guard let supabaseRoom = try await SupabaseClient.shared.getRoomState(roomId: roomId) else { return }

            // FILTER: Exclude system-run events
            if supabaseRoom.hostUsername == "RedLemon Events" || supabaseRoom.type == .event {
                 return
            }

            // Convert
            guard let watchPartyRoom = await convertSupabaseRoomToWatchPartyRoom(supabaseRoom) else { return }

            // Enrich (Poster, etc)
            let (_, enrichedRoom) = await RoomListView.fetchPosterForRoom(room: watchPartyRoom)
            let finalRoom = enrichedRoom ?? watchPartyRoom

            await MainActor.run {
                // Double check uniqueness
                if !appState.activeRooms.contains(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
                    appState.activeRooms.append(finalRoom)
                    print("✅ RoomListView: Added new room \(roomId) from Realtime")
                }
            }
        } catch {
            print("❌ Failed to fetch/add new room \(roomId): \(error)")
        }
    }

    // MARK: - Participant Count Polling

    private func startParticipantCountPolling() {
        participantPollingTimer?.invalidate()
        // Poll every 10 seconds
        participantPollingTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak appState] _ in
            Task { @MainActor [weak appState] in
                guard let appState = appState, !appState.activeRooms.isEmpty else { return }

                // Fetch counts for all active rooms concurrently
                await withTaskGroup(of: (String, Int?).self) { group in
                    for room in appState.activeRooms {
                        group.addTask {
                            if let state = try? await SupabaseClient.shared.getRoomState(roomId: room.id) {
                                return (room.id, state.participantsCount)
                            }
                            return (room.id, nil)
                        }
                    }

                    // Collect results
                    var updates: [String: Int] = [:]
                    for await (roomId, count) in group {
                        if let count = count {
                            updates[roomId] = count
                        }
                    }

                    // Update state on MainActor
                    await MainActor.run {
                        var updatedRooms = appState.activeRooms
                        var hasChanges = false

                        for (roomId, count) in updates {
                            if let index = updatedRooms.firstIndex(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame }) {
                                if updatedRooms[index].participantCount != count {
                                    updatedRooms[index].participantCount = count
                                    hasChanges = true
                                }
                            }
                        }

                        if hasChanges {
                            appState.activeRooms = updatedRooms
                            // print("📊 RoomListView: Polled participant counts updated")
                        }
                    }
                }
            }
        }
    }

    private func stopParticipantCountPolling() {
        participantPollingTimer?.invalidate()
        participantPollingTimer = nil
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
                .font(.title.weight(.bold))


            Text("Enter the room code shared by the host")
                .foregroundColor(.secondary)

            TextField("Room Code (e.g., A3H9)", text: $roomCodeInput)
                .font(.system(.title3, design: .monospaced))
                .textFieldStyle(.roundedBorder)
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
