import SwiftUI
import Combine
import AppKit

@MainActor
class AppState: ObservableObject {

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
    @Published var isServerReady: Bool = false  // Track if HTTP server is ready to accept requests
    @Published var showUsernameSetup: Bool = false  // Show username setup dialog
    @Published var isPreloading: Bool = false // Track if we are in preload phase (Watch Party)
    @Published var isEventPlayback: Bool = false // Track if this is a public event playback
    @Published var isTVEvent: Bool = false // Track if this is a TV show event
    @Published var currentTVSeries: TVEvent? // Current TV series for events
    @Published var currentEpisodeIndex: Int = 0 // Track current episode in series
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
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: item.type, id: item.id)
            
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
            
            // Step 2: Resolve stream via StreamService (passing metadata)
            let result = try await StreamService.shared.resolveStream(
                item: item,
                quality: quality,
                season: season,
                episode: episode,
                metadata: metadata
            )
            
            // Step 2: Update UI with resolved data
            await MainActor.run {
                selectedStream = result.stream
                
                // Set room ID logic
                if let roomId = roomId {
                    currentRoomId = roomId
                    print(" Using provided room ID: \(roomId)")
                    
                    // GUEST LOGIC: Check if we should use host's stream instead
                    // This logic remains here as it depends on AppState properties
                    if !isHost, let watchPartyRoom = currentWatchPartyRoom,
                       let hostStreamHash = watchPartyRoom.selectedStreamHash,
                       let hostQuality = watchPartyRoom.selectedQuality,
                       let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {
                        
                        NSLog("🎬 GUEST: Using host's stream selection")
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
                        
                        // Use subtitles from resolved stream if available
                        if let subtitles = result.stream.subtitles {
                            hostStream.subtitles = subtitles
                        }
                        
                        selectedStream = hostStream
                    }
                    
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
                        if let meta = try? await LocalAPIClient.shared.fetchMetadata(type: item.type, id: item.id) {
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
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: item.type, id: item.id)
            
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
            
            // Step 2: Resolve stream
            let result = try await StreamService.shared.resolveStream(
                item: item,
                quality: quality,
                season: season,
                episode: episode,
                metadata: metadata
            )
            
            // Step 3: Update UI with resolved data
            await MainActor.run {
                selectedStream = result.stream
                
                // Set room ID logic (same as playMedia)
                if let roomId = roomId {
                    currentRoomId = roomId
                    
                    // GUEST LOGIC: Check if we should use host's stream
                    if !isHost, let watchPartyRoom = currentWatchPartyRoom,
                       let hostStreamHash = watchPartyRoom.selectedStreamHash,
                       let hostQuality = watchPartyRoom.selectedQuality,
                       let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {
                        
                        NSLog("🎬 GUEST: Using host's stream selection for preload")
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
                        
                        if let subtitles = result.stream.subtitles {
                            hostStream.subtitles = subtitles
                        }
                        
                        selectedStream = hostStream
                    }
                    
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
                metadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
                await MainActor.run { selectedMetadata = metadata }
            }

            // Step 2: Unlock stream via StreamService
            let season = mediaItem.type == "series" ? selectedSeason : nil
            let episode = mediaItem.type == "series" ? selectedEpisode : nil
            
            let unlockedStream = try await StreamService.shared.unlockStream(
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

    func exitPlayer() async {
        // Leave room logic
        if let roomId = currentRoomId {
            print("👋 Leaving room: \(roomId)")
            if currentWatchMode == .watchParty {
                print("   Notifying other users in watch party...")
            }
        }

        // Clean up player state
        // Clean up player state
        showPlayer = false
        selectedStream = nil
        selectedMediaItem = nil
        currentRoomId = nil
        currentWatchMode = .solo
        isWatchPartyHost = false
        
        // Capture event state before resetting
        let wasEventPlayback = isEventPlayback
        isEventPlayback = false // Reset event flag
        
        // Navigate back to appropriate view
        if wasEventPlayback {
            print("🔙 Returning to Events view")
            currentView = .events
        } else {
            print("🔙 Returning to Browse view")
            currentView = .browse
        }

        exitFullscreen()
        restoreWindowSize()

        print("✅ Exited room and returned to browse")
    }

    func handleMovieFinished() async {
        print("🎬 AppState.handleMovieFinished() called")
        
        // TV Event Logic - Continuous Playback
        if isTVEvent, let series = currentTVSeries {
            print("📺 TV Event finished - loading next episode")
            await loadNextTVEpisode(series: series)
            return
        }
        
        print("🎬   isEventPlayback: \(isEventPlayback)")
        print("🎬   currentWatchPartyRoom: \(currentWatchPartyRoom?.id ?? "nil")")
        print("🎬   currentView: \(currentView)")
        
        print("🎬 Calling exitPlayer()...")
        await exitPlayer()
        print("🎬 exitPlayer() completed")
        
        // Priority 1: Event playback (existing logic)
        if isEventPlayback {
            print("🔄 Event finished - transitioning to Events flow")
            print("🔄   Setting currentView = .events")
            print("🔄   Setting shouldAutoJoinLobby = true")
            
            // Mark current event as finished to prevent auto-rejoin
            if let eventId = currentEventId {
                print("🔄   Marking event \(eventId) as finished")
                await MainActor.run {
                    finishedEventIds.insert(eventId)
                    currentEventId = nil
                }
            }
            
            await MainActor.run {
                currentView = .events
                shouldAutoJoinLobby = true
            }
            print("🔄   Transition complete - currentView is now \(currentView)")
            return
        }
        
        // Priority 2: Watch party with playlist (NEW)
        if let room = currentWatchPartyRoom, room.hasPlaylist {
            print("🔄 Playlist item finished - returning to lobby")
            await handlePlaylistTransition(room: room)
            return
        }
        
        // Priority 3: Single movie watch party (persistent by default now)
        if let room = currentWatchPartyRoom, room.isPersistent {
            print("🔄 Movie finished - returning to persistent lobby")
            await MainActor.run {
                currentView = .watchPartyLobby
            }
            return
        }
        
        // Fallback: Solo watching (no action needed, just exit)
        print("✅ Playback finished - solo watching")
    }

    // NEW: Handle playlist progression
    private func handlePlaylistTransition(room: WatchPartyRoom) async {
        await MainActor.run {
            // Return to lobby
            currentView = .watchPartyLobby
            
            // The lobby will handle:
            // 1. Showing countdown (using room.lobbyDuration)
            // 2. Auto-advancing to next item
            // 3. Looping if needed
        }
    }

    // NEW: Handle TV event progression
    private func loadNextTVEpisode(series: TVEvent) async {
        guard let currentSeason = selectedSeason, let currentEpisode = selectedEpisode, let mediaItem = selectedMediaItem else {
            print("❌ No current season/episode/media found for TV event")
            await exitPlayer()
            return
        }
        
        // Calculate next episode
        let (nextSeason, nextEpisode) = series.getNextEpisode(currentSeason: currentSeason, currentEpisode: currentEpisode)
        
        print("📺 Loading next episode: S\(nextSeason)E\(nextEpisode)")
        
        // Update state
        await MainActor.run {
            selectedSeason = nextSeason
            selectedEpisode = nextEpisode
            // Reset stream resolution state
            isResolvingStream = true
            streamError = nil
        }
        
        // Play next episode
        await playMedia(
            mediaItem,
            quality: .fullHD,
            watchMode: .watchParty,
            roomId: currentRoomId,
            isHost: false
        )
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
    func createWatchPartyAndNavigate(mediaItem: MediaItem, season: Int?, episode: Int?, quality: VideoQuality = .fullHD) async {
        // FIX: Ensure movies don't inherit stale season/episode data
        let isMovie = mediaItem.type == "movie"
        let finalSeason = isMovie ? nil : season
        let finalEpisode = isMovie ? nil : episode
        
        NSLog("🎬 Creating Watch Party for: \(mediaItem.name)")
        if let s = finalSeason, let e = finalEpisode {
            NSLog("   Season: \(s), Episode: \(e)")
        } else {
            NSLog("   Type: \(mediaItem.type) (No Season/Episode)")
        }
        NSLog("   Quality: \(quality.rawValue)")

        isLoadingRoom = true

        do {
            // Ensure we have a user
            guard let userId = currentUserId, !currentUsername.isEmpty else {
                throw NSError(domain: "AppState", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }

            // Create room on Supabase
            let roomName = mediaItem.name
            let roomId = generateRoomCode()  // 4-digit alphanumeric (e.g., A3H9)
            
            // Create room in database
            let room = try await SupabaseClient.shared.createRoom(
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
                isPublic: true
            )
            
            NSLog("✅ Room created: \(roomId)")

            // CRITICAL: Host must join the room in the database immediately
            // Otherwise polling will think the host "left" because they aren't in the participants table
            try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: true)
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
                description: nil,
                posterURL: room.posterUrl,
                participants: [hostParticipant],
                state: .lobby,
                createdAt: room.createdAt,
                playlist: nil,  // Start with no playlist
                currentPlaylistIndex: 0,
                lobbyDuration: 300,  // 5 minutes default
                shouldLoop: false,
                isPersistent: true,  // All watch parties are persistent now
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
                self.selectedMetadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
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
            guard let userId = currentUserId else {
                throw NSError(domain: "AppState", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }
            
            // Fetch room details
            guard let room = try await SupabaseClient.shared.getRoomState(roomId: roomId) else {
                throw NSError(domain: "AppState", code: 404, userInfo: [NSLocalizedDescriptionKey: "Room not found"])
            }
            
            // Join as participant
            try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)
            
            NSLog("✅ Joined room: \(roomId)")
            
            // Convert SupabaseRoom to WatchPartyRoom
            // We need to fetch participants to create a complete WatchPartyRoom
            let participants = try await SupabaseClient.shared.getRoomParticipants(roomId: roomId)
            let watchPartyParticipants = participants.compactMap { p -> Participant? in
                // We don't have full user details here, just IDs. 
                // In a real app we'd fetch user profiles. For now use placeholders or fetch if critical.
                return Participant(
                    id: p.userId.uuidString,
                    name: "User", // Placeholder, will be updated by realtime
                    isHost: p.isHost,
                    isReady: false,
                    joinedAt: p.joinedAt
                )
            }

            let watchPartyRoom = WatchPartyRoom(
                id: room.id,
                hostId: room.hostUserId.uuidString,
                hostName: room.hostUsername,
                mediaItem: nil, // Will be set below
                season: room.season,
                episode: room.episode,
                quality: .fullHD,
                sourceQuality: nil,
                description: nil,
                posterURL: room.posterUrl,
                participants: watchPartyParticipants,
                state: .lobby,
                createdAt: room.createdAt,
                playlist: nil,  // Will be synced from host if exists
                currentPlaylistIndex: 0,
                lobbyDuration: 300,
                shouldLoop: false,
                isPersistent: true,
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
                self.isWatchPartyHost = (room.hostUserId == userId)
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
                    self.selectedMetadata = try await LocalAPIClient.shared.fetchMetadata(
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
                self.isWatchPartyHost = (room.hostUserId == userId)
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
                    self.selectedMetadata = try await LocalAPIClient.shared.fetchMetadata(
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

    func saveToWatchHistory(timestamp: Double, duration: Double) {
        guard let mediaItem = selectedMediaItem else { return }

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
