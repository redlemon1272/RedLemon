import SwiftUI
import Combine
import AppKit

@MainActor
class AppState: ObservableObject {
    
    // Dependencies
    private let metadataProvider: MetadataProvider
    private let streamResolver: StreamResolving
    private let roomManager: RoomManager
    private let userManager: UserManager
    
    init(
        metadataProvider: MetadataProvider = LocalAPIClient.shared,
        streamResolver: StreamResolving = StreamService.shared,
        roomManager: RoomManager = SupabaseClient.shared,
        userManager: UserManager = SupabaseClient.shared
    ) {
        self.metadataProvider = metadataProvider
        self.streamResolver = streamResolver
        self.roomManager = roomManager
        self.userManager = userManager
    }

    // MARK: - Performance Settings (Hardware Detection Removed)
    // Fixed conservative settings for all devices to prevent crashes

    /// Fixed performance profile (no hardware detection)
    nonisolated static var effectivePerformanceProfile: PerformanceProfile {
        return .medium // Use conservative medium profile for all devices
    }

    /// Fixed catalog size for all devices (conservative to prevent memory issues)
    nonisolated static var adaptiveCatalogSize: Int {
        return 15 // Conservative limit for all devices
    }

    /// Fixed image cache limit for all devices
    nonisolated static var adaptiveImageCacheLimit: Int {
        return 50 // Conservative cache limit for all devices
    }

    enum PerformanceProfile: String {
        case low = "Low"      // < 8GB RAM or < 4 cores
        case medium = "Medium" // 8-16GB RAM and 4-8 cores
        case high = "High"    // > 16GB RAM and > 8 cores
    }

    @Published var currentView: AppView = .events
    @Published var selectedStream: Stream?
    @Published var selectedMediaItem: MediaItem?
    @Published var selectedMetadata: MediaMetadata?
    @Published var showPlayer = false
    @Published var showQualitySelection = false
    @Published var showMediaDetail = false
    @Published var selectedQuality: VideoQuality = .fullHD
    @Published var isResolvingStream = false
    @Published var streamError: String?
    @Published var currentWatchMode: WatchMode = .solo
    @Published var currentRoomId: String?
    @Published var isWatchPartyHost: Bool = false
    @Published var currentWatchPartyRoom: WatchPartyRoom? // Current lobby/room
    @Published var browseScrollPosition: String? = nil  // Track scroll position in browse view
    @Published var activeRooms: [WatchPartyRoom] = []  // Track all active rooms locally
    @Published var isLoadingRoom: Bool = false  // Track room loading state
    @Published var shouldAutoJoinLobby: Bool = false  // Flag to auto-join lobby for live events
    @Published var searchResults: [MediaItem] = []  // Persist search results across navigation
    @Published var lastSearchQuery: String = ""  // Remember last search query
    @Published var resumeFromTimestamp: Double? = nil  // When resuming playback, seek to this position
    @Published var eventStartTime: Date? = nil  // For live events: absolute start time (recalculate seek on load)
    @Published var isServerReady: Bool = false  // Track if HTTP server is ready to accept requests
    @Published var showUsernameSetup: Bool = false  // Show username setup dialog
    @Published var isPreloading: Bool = false // Track if we are in preload phase (Watch Party)
    @Published var isEventPlayback: Bool = false // Track if this is a public event playback
    @Published var currentEventId: String? = nil // Track ID of current event
    @Published var finishedEventIds: Set<String> = [] // Track IDs of finished events to prevent auto-rejoin

    // User authentication (simple username)
    @Published var currentUsername: String = ""
    @Published var currentUserId: UUID?

    // TV Show support
    @Published var selectedSeason: Int?
    @Published var selectedEpisode: Int?

    // Window management
    private var wasFullscreen = false

    enum AppView {
        case browse
        case events
        case discover
        case search
        case friends
        case rooms
        case settings
        case mediaDetail
        case seasonEpisodeSelector
        case qualitySelection
        case watchPartyLobby // New: Lobby view
        case player
    }

    // MARK: - Playback Logic

    func playMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        streamError = nil

        do {
            print("🎬 Starting playback for: \(item.name)")
            NSLog("   Quality: \(quality.rawValue)")
            NSLog("   Mode: \(watchMode)")
            if let season = selectedSeason, let episode = selectedEpisode {
                NSLog("   Season: \(season), Episode: \(episode)")
            }

            // Step 1: Fetch metadata immediately for UI feedback
            NSLog("📡 Fetching metadata for \(item.id)...")
            let metadata = try await metadataProvider.fetchMetadata(type: item.type, id: item.id)

            // Update UI immediately so background art shows
            await MainActor.run {
                selectedMetadata = metadata
                selectedMediaItem = item
                isResolvingStream = true
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
                selectedQuality = quality

                // Switch to player view immediately
                currentView = .player
            }

            // Only pass season/episode for TV series, not movies
            let season = item.type == "series" ? selectedSeason : nil
            let episode = item.type == "series" ? selectedEpisode : nil

            // Step 2: Resolve stream (Optimized for Guest)
            var resolvedStream: Stream?
            var resolvedMetadata: MediaMetadata? = metadata

            // GUEST OPTIMIZATION: Check if we can use host's stream directly
            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               let hostStreamHash = watchPartyRoom.selectedStreamHash,
               let hostQuality = watchPartyRoom.selectedQuality,
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {

                NSLog("🎬 GUEST: Using host's stream selection (skipping resolution)")
                // Create stream with host's unlocked URL
                var hostStream = Stream(
                    url: hostUnlockedURL,
                    title: "Host Stream (\(hostQuality))",
                    quality: hostQuality,
                    seeders: nil,
                    size: nil,
                    provider: "realdebrid",
                    infoHash: hostStreamHash,
                    fileIdx: watchPartyRoom.selectedFileIdx,
                    ext: nil,
                    behaviorHints: nil,
                    subtitles: []
                )
                
                // We still need to resolve subtitles if possible, but we can do that separately or lazily
                // For now, let's try to get them from the room if available (not currently synced fully)
                // Or we can trigger a lightweight subtitle fetch
                
                resolvedStream = hostStream
                
            } else {
                // Standard resolution
                let result = try await streamResolver.resolveStream(
                    item: item,
                    quality: quality,
                    season: season,
                    episode: episode,
                    metadata: metadata
                )
                resolvedStream = result.stream
                resolvedMetadata = result.metadata // Might have been updated
            }

            guard let finalStream = resolvedStream else {
                throw APIError.noStreamsFound
            }

            // Step 3: Update UI with resolved data
            await MainActor.run {
                selectedStream = finalStream
                if let meta = resolvedMetadata {
                    selectedMetadata = meta
                }

                // Set room ID logic
                if let roomId = roomId {
                    currentRoomId = roomId
                    print(" Using provided room ID: \(roomId)")
                } else if watchMode == .watchParty {
                    currentRoomId = "room_\(UUID().uuidString.prefix(8))"
                    print(" Created room ID: \(currentRoomId ?? "none")")
                } else {
                    currentRoomId = nil
                    print(" Solo playback - no room created")
                }

                currentView = .player
                isResolvingStream = false
            }

            NSLog("✅ Stream ready, starting playback...")
            enterFullscreen()

        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                // Show metadata even on error so background art shows
                if selectedMetadata == nil {
                    // Try to at least fetch metadata for background
                    Task {
                        if let meta = try? await metadataProvider.fetchMetadata(type: item.type, id: item.id) {
                            await MainActor.run { self.selectedMetadata = meta }
                        }
                    }
                }
                currentView = .player // Show player view to display error
            }
        }
    }

    func preloadMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        streamError = nil

        do {
            print("🎬 Preloading playback for: \(item.name)")
            NSLog("   Quality: \(quality.rawValue)")

            // Step 1: Fetch metadata immediately
            let metadata = try await metadataProvider.fetchMetadata(type: item.type, id: item.id)

            // Update UI immediately
            await MainActor.run {
                selectedMetadata = metadata
                selectedMediaItem = item
                isResolvingStream = true
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
                selectedQuality = quality
                isPreloading = true // Set preloading flag

                // Switch to player view
                currentView = .player
            }

            // Only pass season/episode for TV series
            let season = item.type == "series" ? selectedSeason : nil
            let episode = item.type == "series" ? selectedEpisode : nil

            // Step 2: Resolve stream (Optimized for Guest)
            var resolvedStream: Stream?
            
            // GUEST OPTIMIZATION: Check if we can use host's stream directly
            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               let hostStreamHash = watchPartyRoom.selectedStreamHash,
               let hostQuality = watchPartyRoom.selectedQuality,
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {

                NSLog("🎬 GUEST: Using host's stream selection for preload (skipping resolution)")
                var hostStream = Stream(
                    url: hostUnlockedURL,
                    title: "Host Stream (\(hostQuality))",
                    quality: hostQuality,
                    seeders: nil,
                    size: nil,
                    provider: "realdebrid",
                    infoHash: hostStreamHash,
                    fileIdx: watchPartyRoom.selectedFileIdx,
                    ext: nil,
                    behaviorHints: nil,
                    subtitles: []
                )
                resolvedStream = hostStream
                
            } else {
                let result = try await streamResolver.resolveStream(
                    item: item,
                    quality: quality,
                    season: season,
                    episode: episode,
                    metadata: metadata
                )
                resolvedStream = result.stream
            }
            
            guard let finalStream = resolvedStream else {
                throw APIError.noStreamsFound
            }

            // Step 3: Update UI with resolved data
            await MainActor.run {
                selectedStream = finalStream

                // Set room ID logic (same as playMedia)
                if let roomId = roomId {
                    currentRoomId = roomId
                } else if watchMode == .watchParty {
                    currentRoomId = "room_\(UUID().uuidString.prefix(8))"
                } else {
                    currentRoomId = nil
                }

                currentView = .player
                isResolvingStream = false
            }

            NSLog("✅ Stream preloaded, waiting for play signal...")
            // Do NOT call enterFullscreen() yet? Or maybe yes so they see the loading screen?
            // Let's enter fullscreen so they are ready
            enterFullscreen()

        } catch {
            print("❌ Preload error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                isPreloading = false
                currentView = .player
            }
        }
    }

    func startPreloadedPlayback() {
        guard isPreloading else { return }
        print("▶️ Starting preloaded playback")
        isPreloading = false
        // The PlayerView should observe this change and start playing
    }

    // NEW: Resolve and persist stream BEFORE starting watch party
    // This fixes the race condition where guests join before the stream is ready
    func resolveAndPersistForWatchParty(mediaItem: MediaItem, quality: VideoQuality, roomId: String, season: Int? = nil, episode: Int? = nil) async throws -> Stream {
        print("🎬 Resolving & Persisting stream for Watch Party Room: \(roomId)")
        
        await MainActor.run {
            self.isResolvingStream = true
            self.streamError = nil
        }
        
        defer {
            Task { @MainActor in self.isResolvingStream = false }
        }

        // Step 0: Ensure metadata is loaded
        let metadata = try await metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
        
        // Step 1: Resolve Stream
        // Use passed parameters if available, otherwise fallback to AppState selection (legacy behavior)
        let targetSeason = season ?? (mediaItem.type == "series" ? selectedSeason : nil)
        let targetEpisode = episode ?? (mediaItem.type == "series" ? selectedEpisode : nil)
        
        let result = try await streamResolver.resolveStream(
            item: mediaItem,
            quality: quality,
            season: targetSeason,
            episode: targetEpisode,
            metadata: metadata
        )
        
        // Step 2: Unlock Stream
        let unlockedStream = try await streamResolver.unlockStream(
            stream: result.stream,
            item: mediaItem,
            season: targetSeason,
            episode: targetEpisode
        )
        
        // Step 3: Persist to Supabase & Local State
        print("📡 Persisting resolved stream to room \(roomId)...")
        
        // Update local room object & metadata
        await MainActor.run {
            self.selectedMetadata = metadata // Use the fetched metadata
            
            if var room = self.currentWatchPartyRoom {
                room.selectedStreamHash = unlockedStream.infoHash
                room.selectedFileIdx = unlockedStream.fileIdx
                room.selectedQuality = unlockedStream.quality
                room.unlockedStreamURL = unlockedStream.url
                self.currentWatchPartyRoom = room
            }
        }
        
        // Persist to Supabase
        try await roomManager.updateRoomStream(
            roomId: roomId,
            streamHash: unlockedStream.infoHash,
            fileIdx: unlockedStream.fileIdx,
            quality: unlockedStream.quality,
            unlockedUrl: unlockedStream.url
        )
        
        print("✅ Stream persisted! Hash: \(unlockedStream.infoHash ?? "nil")")
        return unlockedStream
    }

    func playSelectedStream(_ stream: Stream, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        guard let mediaItem = selectedMediaItem else {
            streamError = "No media item selected"
            return
        }

        streamError = nil

        do {
            print("🎬 Starting playback with selected stream: \(stream.title)")

            await MainActor.run {
                isResolvingStream = true
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
            }

            // Step 1: Load metadata if needed
            var metadata = selectedMetadata
            if metadata == nil || metadata?.id != mediaItem.id {
                metadata = try await metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
                await MainActor.run { selectedMetadata = metadata }
            }

            // Step 2: Unlock stream via StreamService
            let season = mediaItem.type == "series" ? selectedSeason : nil
            let episode = mediaItem.type == "series" ? selectedEpisode : nil

            let unlockedStream = try await streamResolver.unlockStream(
                stream: stream,
                item: mediaItem,
                season: season,
                episode: episode
            )

            // Step 3: Update UI
            await MainActor.run {
                selectedStream = unlockedStream

                if let roomId = roomId {
                    currentRoomId = roomId
                } else if watchMode == .watchParty {
                    currentRoomId = "room_\(UUID().uuidString.prefix(8))"
                } else {
                    currentRoomId = nil
                }

                currentView = .player
                isResolvingStream = false
            }

            // Step 4: If hosting Watch Party, persist stream selection to specific room
            if isHost, let roomId = currentRoomId, watchMode == .watchParty {
                NSLog("📡 Persisting stream selection to room \(roomId)")
                
                // Update local room object
                if var room = self.currentWatchPartyRoom {
                    room.selectedStreamHash = unlockedStream.infoHash
                    room.selectedFileIdx = unlockedStream.fileIdx
                    room.selectedQuality = unlockedStream.quality
                    room.unlockedStreamURL = unlockedStream.url
                    self.currentWatchPartyRoom = room
                }
                
                // Persist to Supabase
                Task {
                    try? await roomManager.updateRoomStream(
                        roomId: roomId,
                        streamHash: unlockedStream.infoHash,
                        fileIdx: unlockedStream.fileIdx,
                        quality: unlockedStream.quality,
                        unlockedUrl: unlockedStream.url
                    )
                }
            }

            enterFullscreen()
            print("✅ Selected stream ready for playback!")

        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                currentView = .player
            }
        }
    }

    func navigateToPlayer(stream: Stream) {
        selectedStream = stream
        currentView = .player
        showPlayer = true
        enterFullscreen()
    }

    func exitPlayer(keepRoomState: Bool = false) async {
        // Leave room logic (only if fully exiting)
        if !keepRoomState {
            if let roomId = currentRoomId {
                print("👋 Leaving room: \(roomId)")
                if currentWatchMode == .watchParty {
                    print("   Notifying other users in watch party...")
                }
            }
        }

        // Clean up player state
        showPlayer = false
        selectedStream = nil
        selectedMediaItem = nil
        
        if !keepRoomState {
            currentRoomId = nil
            currentWatchMode = .solo
            isWatchPartyHost = false
        }

        // Capture event state before resetting
        let wasEventPlayback = isEventPlayback
        isEventPlayback = false // Reset event flag

        // Navigate back to appropriate view
        if keepRoomState {
            // Do not change view here, caller handles it (or defaults to lobby)
        } else if wasEventPlayback {
            print("🔙 Returning to Events view")
            currentView = .events
        } else {
            print("🔙 Returning to Browse view")
            currentView = .browse
        }

        exitFullscreen()
        restoreWindowSize()

        if keepRoomState {
             print("✅ Player exited (Room state preserved)")
        } else {
             print("✅ Exited room and returned to browse")
        }
    }

    func handleMovieFinished() async {
        print("🎬 AppState.handleMovieFinished() called")
        print("🎬   isEventPlayback: \(isEventPlayback)")
        print("🎬   currentWatchPartyRoom: \(currentWatchPartyRoom?.id ?? "nil")")
        print("🎬   currentView: \(currentView)")

        // Identify logic path BEFORE calling exitPlayer
        let wasEventPlayback = isEventPlayback
        // Priority 2: Watch party with playlist
        let isPlaylistRoom = currentWatchPartyRoom?.hasPlaylist ?? false
        // Priority 3: Persistent room
        let isPersistentRoom = currentWatchPartyRoom?.isPersistent ?? false

        // Determine if we should keep room state
        // Events: NO (handled separately)
        // Playlist/Persistent: YES
        let shouldKeepRoomState = !wasEventPlayback && (isPlaylistRoom || isPersistentRoom)

        print("🎬 Calling exitPlayer(keepRoomState: \(shouldKeepRoomState))...")
        await exitPlayer(keepRoomState: shouldKeepRoomState)
        print("🎬 exitPlayer() completed")

        // Priority 1: Event playback (existing logic)
        if wasEventPlayback {
            print("🔄 Event finished - transitioning to Events flow")
            // Logic handled by exitPlayer mostly, but specific event logic here
            if let eventId = currentEventId {
                await MainActor.run {
                    finishedEventIds.insert(eventId)
                    currentEventId = nil
                }
            }
            await MainActor.run {
                currentView = .events
                shouldAutoJoinLobby = true
            }
            return
        }

        // Priority 2: Watch party with playlist (NEW)
        if isPlaylistRoom, let room = currentWatchPartyRoom {
            print("🔄 Playlist item finished - returning to lobby")
            await handlePlaylistTransition(room: room)
            return
        }

        // Priority 3: Single movie watch party (persistent by default now)
        if isPersistentRoom {
            print("🔄 Movie finished - returning to persistent lobby")
            await MainActor.run {
                currentView = .watchPartyLobby
            }
            // CRITICAL: Ensure LobbyViewModel knows we just finished playing
            // The LobbyViewModel.init will see isHost=true and clear the DB state
            return
        }

        // Fallback: Solo watching (no action needed, already handled by exitPlayer default)
        print("✅ Playback finished - solo watching")
    }

    // NEW: Handle playlist progression
    private func handlePlaylistTransition(room: WatchPartyRoom) async {
        await MainActor.run {
            // Increment index for next item
            var updatedRoom = room
            updatedRoom.currentPlaylistIndex += 1
            
            // Loop functionality check
            if updatedRoom.currentPlaylistIndex >= (updatedRoom.playlist?.count ?? 0) {
                if updatedRoom.shouldLoop {
                    updatedRoom.currentPlaylistIndex = 0
                }
                // If not looping, we'll let LobbyViewModel handle the "Playlist Finished" state
                // But we still return to lobby to show "Finished" message or similar
            }
            
            self.currentWatchPartyRoom = updatedRoom
            
            // Return to lobby
            currentView = .watchPartyLobby

            // usage: LobbyViewModel will see the updated index via room/appState and update its UI/State
        }
    }



    // MARK: - Window Management (Delegated to WindowManager)

    private func enterFullscreen() {
        WindowManager.shared.enterFullscreen()
    }

    private func exitFullscreen() {
        WindowManager.shared.exitFullscreen()
    }

    private func restoreWindowSize() {
        WindowManager.shared.restoreWindowSize()
    }

    // Public method for views to restore window size
    func restoreWindowFromLobby() {
        // Window stays at expanded size, no need to do anything
        NSLog("🪟 restoreWindowFromLobby() called - no action needed (window stays expanded)")
    }

    // Create a new watch party room and navigate to lobby
    @MainActor

    func createWatchPartyAndNavigate(
        mediaItem: MediaItem,
        season: Int? = nil,
        episode: Int? = nil,
        quality: VideoQuality = .fullHD,
        isPublic: Bool = true,
        description: String? = nil
    ) async {
        isLoadingRoom = true
        self.isLoadingRoom = true // Bind to main thread published property

        do {
            guard let userId = currentUserId else {
                throw NSError(domain: "AppState", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }
            
            // Handle Series logic (default to S1E1 if missing)
            var finalSeason = season
            var finalEpisode = episode
            if mediaItem.type == "series" && (season == nil || episode == nil) {
                 finalSeason = 1
                 finalEpisode = 1
            }

            NSLog("🎬 Creating Watch Party for: \(mediaItem.name)")
            if let s = finalSeason, let e = finalEpisode {
                NSLog("   Season: \(s), Episode: \(e)")
            } else {
                NSLog("   Type: \(mediaItem.type) (No Season/Episode)")
            }
            NSLog("   Quality: \(quality.rawValue)")

            // Ensure we have a user
            guard let userId = currentUserId, !currentUsername.isEmpty else {
                throw NSError(domain: "AppState", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }

            // Create room on Supabase
            let roomName = mediaItem.name
            let roomId = generateRoomCode()  // 4-digit alphanumeric (e.g., A3H9)

            // Create room in database
            NSLog("📝 Creating room with parameters:")
            NSLog("   Name: \(roomName)")
            NSLog("   Description: \(description ?? "nil")")
            NSLog("   IsPublic: \(isPublic)")

            // Create room in database
            // Attempt 1: Try with new fields (Description / IsPublic)
            var room: SupabaseRoom!
            do {
                room = try await roomManager.createRoom(
                    id: roomId,
                    name: roomName,
                    hostUserId: userId,
                    hostUsername: currentUsername,
                    streamHash: nil,
                    imdbId: mediaItem.id,
                    posterUrl: mediaItem.poster,
                    backdropUrl: mediaItem.background,
                    season: finalSeason,
                    episode: finalEpisode,
                    isPublic: isPublic,
                    description: description,
                    playlist: nil
                )
                NSLog("✅ SupabaseRoom created successfully with Description: \(room.description ?? "nil")")
             } catch {
                NSLog("⚠️ Failed to create room with description/public flags. Retrying fallback... Error: \(error)")
                // Attempt 2: Retry without new fields (Backward compatibility for non-migrated backend)
                room = try await roomManager.createRoom(
                    id: roomId,
                    name: roomName,
                    hostUserId: userId,
                    hostUsername: currentUsername,
                    streamHash: nil,
                    imdbId: mediaItem.id,
                    posterUrl: mediaItem.poster,
                    backdropUrl: mediaItem.background,
                     season: finalSeason,
                    episode: finalEpisode,
                    isPublic: nil,      // Don't send is_public
                    description: nil,    // Don't send description
                    playlist: nil
                )
                NSLog("⚠️ Fallback room created (No Description logged in returned object)")
             }

            NSLog("✅ Room created: \(roomId)")

            // CRITICAL: Host must join the room in the database immediately
            // Otherwise polling will think the host "left" because they aren't in the participants table
            try await roomManager.joinRoom(roomId: roomId, userId: userId, isHost: true)
            NSLog("✅ Host joined room in database")

            // Create host participant
            let hostParticipant = Participant(
                id: userId.uuidString,
                name: currentUsername,
                isHost: true,
                isReady: false,
                joinedAt: Date()
            )

            let watchPartyRoom = WatchPartyRoom(
                id: room.id,
                hostId: room.hostUserId.uuidString,
                hostName: room.hostUsername,
                mediaItem: mediaItem,
                season: finalSeason,
                episode: finalEpisode,
                quality: quality,
                sourceQuality: nil,
                description: description,
                posterURL: room.posterUrl,
                participants: [hostParticipant],
                state: .lobby,
                createdAt: room.createdAt,
                lastActivity: room.createdAt,
                playlist: nil,  // Start with no playlist
                currentPlaylistIndex: 0,
                lobbyDuration: 300,  // 5 minutes default
                shouldLoop: false,
                isPersistent: true,  // All watch parties are persistent now
                playbackPosition: nil,
                runtime: nil,
                selectedStreamHash: nil,
                selectedFileIdx: nil,
                selectedQuality: nil,
                unlockedStreamURL: nil
            )

            // Set state
            self.currentRoomId = roomId
            self.currentWatchPartyRoom = watchPartyRoom
            self.isWatchPartyHost = true
            self.currentWatchMode = .watchParty

            // Set selection details for the lobby
            self.selectedMediaItem = mediaItem
            self.selectedSeason = finalSeason
            self.selectedEpisode = finalEpisode
            self.selectedQuality = quality
            // Fetch metadata if needed
            if self.selectedMetadata == nil || self.selectedMetadata?.id != mediaItem.id {
                self.selectedMetadata = try await metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
            }

            // Navigate to lobby
            self.currentView = .watchPartyLobby

        } catch {
            NSLog("❌ Failed to create room: \(error)")
            // Show error alert?
        }

        isLoadingRoom = false
    }

    // Generate a short 4-character room code
    func generateRoomCode() -> String {
        let chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789" // Exclude I, O, 1, 0 to avoid confusion
        return String((0..<4).map { _ in chars.randomElement()! })
    }

    // Join an existing room
    @MainActor
    func joinRoom(roomId: String) async {
        NSLog("🚪 Joining room: \(roomId)")
        isLoadingRoom = true

        do {
            // Join in database first (to ensure participant record exists)
            // But first, fetch room details to ensure it exists
            let roomState = try await roomManager.getRoomState(roomId: roomId)
            
            // Check if we found the room
            guard let room = roomState else {
                NSLog("❌ Room not found: \(roomId)")
                isLoadingRoom = false
                return
            }
            
            NSLog("✅ Guest fetched room state: \(room.name)")
            NSLog("   Description: \(room.description ?? "nil")")
            NSLog("   Playlist: \(room.playlist != nil ? "Yes (\(room.playlist!.count) items)" : "nil")")
            NSLog("   PlaylistIndex: \(room.currentPlaylistIndex)")

            // Now join as participant
            if let userId = currentUserId {
                try await roomManager.joinRoom(roomId: roomId, userId: userId, isHost: false)
                NSLog("✅ Guest joined room in database")
            } else {
                 NSLog("⚠️ Guest has no user ID, skipping DB join (Realtime will handle)")
            }

            // Create local WatchPartyRoom object
            let participants = try await roomManager.getRoomParticipants(roomId: roomId)
            var participantList: [Participant] = []
            for p in participants {
                // Fetch user metadata for name
                var name = "User"
                if let user = try? await userManager.getUserById(userId: p.userId) {
                    name = user.username
                }
                participantList.append(Participant(
                     id: p.userId.uuidString,
                     name: name,
                     isHost: p.isHost,
                     isReady: false,
                     joinedAt: p.joinedAt
                ))
            }

            // Map SupabaseRoom -> WatchPartyRoom
            let watchPartyRoom = WatchPartyRoom(
                id: room.id,
                hostId: room.hostUserId.uuidString,
                hostName: room.hostUsername,
                mediaItem: MediaItem(
                    id: room.imdbId ?? "",
                    type: (room.season != nil) ? "series" : "movie",
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
                ),
                season: room.season,
                episode: room.episode,
                quality: .fullHD, // Default, will sync from host
                sourceQuality: nil,
                description: room.description,
                posterURL: room.posterUrl,
                participants: participantList,
                state: .lobby,
                createdAt: room.createdAt,
                lastActivity: room.createdAt,
                playlist: room.playlist,
                currentPlaylistIndex: room.currentPlaylistIndex ?? 0,
                lobbyDuration: 300,
                shouldLoop: false,
                isPersistent: true,
                playbackPosition: nil,
                runtime: nil,
                selectedStreamHash: nil,
                selectedFileIdx: nil,
                selectedQuality: nil,
                unlockedStreamURL: nil
            )

            if let season = room.season, let episode = room.episode {
                NSLog("✅ Guest: Initialized room with S\(season)E\(episode)")
            } else {
                NSLog("⚠️ Guest: Initialized room with missing season/episode (DB returned nil)")
            }


            NSLog("🔍 Room state - isPlaying: \(room.isPlaying), playbackPosition: \(room.playbackPosition)")

            // Check if room is already playing
            if room.isPlaying {
                NSLog("🎬 Room is already playing - navigating directly to playback")

                // Set state for playback
                self.currentRoomId = roomId
                self.currentWatchPartyRoom = watchPartyRoom
                self.isWatchPartyHost = (room.hostUserId == currentUserId)
                self.currentWatchMode = .watchParty

                // Set selection details from room
                if let imdbId = room.imdbId, !imdbId.isEmpty {
                    self.selectedMediaItem = MediaItem(
                        id: imdbId,
                        type: room.season != nil ? "series" : "movie",
                        name: room.name,
                        poster: nil,
                        background: nil,
                        logo: nil,
                        description: nil,
                        releaseInfo: nil,
                        year: nil,
                        imdbRating: nil,
                        genres: nil,
                        runtime: nil
                    )

                    // Fetch metadata
                    self.selectedMetadata = try await metadataProvider.fetchMetadata(
                        type: room.season != nil ? "series" : "movie",
                        id: imdbId
                    )

                    // Set season/episode if applicable
                    self.selectedSeason = room.season
                    self.selectedEpisode = room.episode
                    self.selectedQuality = .fullHD

                    // Calculate seek position based on room's playback position
                    self.resumeFromTimestamp = Double(room.playbackPosition)

                    // Navigate directly to player
                    await playMedia(
                        self.selectedMediaItem!,
                        quality: .fullHD,
                        watchMode: .watchParty,
                        roomId: roomId,
                        isHost: false
                    )
                }
            } else {
                NSLog("🚪 Room is in lobby - navigating to lobby view")

                // Set state
                self.currentRoomId = roomId
                self.currentWatchPartyRoom = watchPartyRoom
                self.isWatchPartyHost = (room.hostUserId == currentUserId)
                self.currentWatchMode = .watchParty

                // Set selection details from room
                if let imdbId = room.imdbId, !imdbId.isEmpty {
                    // We need to fetch the media item details
                    // For now, create a placeholder item - metadata fetch will fill in details
                    self.selectedMediaItem = MediaItem(
                        id: imdbId,
                        type: "movie", // Default to movie, logic needs improvement for series
                        name: room.name,
                        poster: nil,
                        background: nil,
                        logo: nil,
                        description: nil,
                        releaseInfo: nil,
                        year: nil,
                        imdbRating: nil,
                        genres: nil,
                        runtime: nil
                    )

                    // Fetch metadata
                    self.selectedMetadata = try await metadataProvider.fetchMetadata(
                        type: "movie", // Default
                        id: imdbId
                    )
                }

                // Navigate to lobby
                self.currentView = .watchPartyLobby
            }

        } catch {
            NSLog("❌ Failed to join room: \(error)")
            // Show error
        }

        isLoadingRoom = false
    }

    // MARK: - Watch History

    private var lastHistorySaveTime: Date = .distantPast

    func saveToWatchHistory(timestamp: Double, duration: Double, force: Bool = false) {
        guard let mediaItem = selectedMediaItem else { return }

        // Throttle saving to once every 60 seconds unless forced
        let timeSinceLastSave = Date().timeIntervalSince(lastHistorySaveTime)
        if !force && timeSinceLastSave < 60.0 {
            // print("⏳ Skipping watch history save (throttled): \(Int(timeSinceLastSave))s since last save")
            return
        }

        // Load existing history
        var history: [WatchHistoryItem] = []
        if let data = UserDefaults.standard.data(forKey: "watchHistory"),
           let decoded = try? JSONDecoder().decode([WatchHistoryItem].self, from: data) {
            history = decoded
        }

        // Create new history item
        let historyItem = WatchHistoryItem(
            id: "\(mediaItem.id)_\(self.selectedSeason ?? 0)_\(self.selectedEpisode ?? 0)",
            mediaItem: mediaItem,
            timestamp: timestamp,
            duration: duration,
            lastWatched: Date(),
            quality: self.selectedQuality.rawValue,
            season: self.selectedSeason,
            episode: self.selectedEpisode
        )

        // Remove if already exists (to move to front)
        history.removeAll { $0.id == historyItem.id }

        // Add to front
        history.insert(historyItem, at: 0)

        // Keep only last 50 items
        history = Array(history.prefix(50))

        // Save to UserDefaults
        if let data = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(data, forKey: "watchHistory")
            lastHistorySaveTime = Date()
            print("💾 Saved to watch history: \(mediaItem.name) at \(Int(timestamp))s")
        }
    }

    // MARK: - Helper Functions


}

enum WatchMode {
    case solo
    case watchParty
}

enum RoomVisibility {
    case `private`           // Hidden - no one can see
    case friendsCanSee       // Visible to friends, but can't join
    case friendsCanJoin      // Friends can see AND join
    case publicOpen          // Public - anyone can discover and join
}
