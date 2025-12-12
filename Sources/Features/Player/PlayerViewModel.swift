import SwiftUI
import Combine

@MainActor
class PlayerViewModel: ObservableObject {
    
    // Dependencies
    private let metadataProvider: MetadataProvider
    private let streamResolver: StreamResolving
    private let roomManager: RoomManager
    
    // Playback State
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
    
    // Event specific state
    @Published var isPreloading: Bool = false // Track if we are in preload phase (Watch Party)
    @Published var isEventPlayback: Bool = false // Track if this is a public event playback
    @Published var currentEventId: String? = nil // Track ID of current event
    @Published var finishedEventIds: Set<String> = [] // Track IDs of finished events to prevent auto-rejoin
    @Published var resumeFromTimestamp: Double? = nil  // When resuming playback, seek to this position
    @Published var eventStartTime: Date? = nil  // For live events: absolute start time
    
    // TV specific state
    @Published var selectedSeason: Int?
    @Published var selectedEpisode: Int?
    
    // Weak reference to AppState for navigation callbacks
    weak var appState: AppState?
    
    init(
        metadataProvider: MetadataProvider = LocalAPIClient.shared,
        streamResolver: StreamResolving = StreamService.shared,
        roomManager: RoomManager = SupabaseClient.shared
    ) {
        self.metadataProvider = metadataProvider
        self.streamResolver = streamResolver
        self.roomManager = roomManager
    }
    
    // MARK: - Playback Logic
    
    func playMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        streamError = nil
        
        do {
            print("🎬 PlayerVM: Starting playback for: \(item.name)")
            NSLog("   Quality: \(quality.rawValue)")
            NSLog("   Mode: \(watchMode)")
            
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
                
                // Show player immediately
                showPlayer = true
                if let appState = appState {
                    appState.currentView = .player
                }
            }
            
            // Only pass season/episode for TV series
            let season = item.type == "series" ? selectedSeason : nil
            let episode = item.type == "series" ? selectedEpisode : nil
            
            // Step 2: Resolve stream (Optimized for Guest)
            var resolvedStream: Stream?
            var resolvedMetadata: MediaMetadata? = metadata
            
            // GUEST OPTIMIZATION
            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               let hostStreamHash = watchPartyRoom.selectedStreamHash,
               let hostQuality = watchPartyRoom.selectedQuality,
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {
                
                print("\n\n✅ [SYNC VERIFICATION] LOCKING TO SHARED STREAM (SYSTEM/HOST) 🔒")
                NSLog("🎬 GUEST: Using host's stream selection (skipping resolution)")
                
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
                
                // NEW: Fetch subtitles for Guest
                NSLog("🎬 GUEST: Fetching subtitles for shared stream...")
                if let subDLSubtitles = try? await LocalAPIClient.shared.searchSubtitles(imdbId: item.id, type: item.type) {
                     NSLog("✅ GUEST: Found \(subDLSubtitles.count) subtitles")
                     let internalSubtitles = subDLSubtitles.map { sub in
                         Subtitle(
                             id: UUID().uuidString,
                             url: LocalAPIClient.shared.getSubtitleURL(downloadPath: sub.url),
                             lang: sub.language ?? "en",
                             label: sub.releaseName ?? (sub.language ?? "Unknown"),
                             srclang: sub.language ?? "en",
                             kind: "subtitles",
                             provider: "SubDL"
                         )
                     }
                     hostStream.subtitles = internalSubtitles
                }
                
                resolvedStream = hostStream
                
            } else if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
                      let hostStreamHash = watchPartyRoom.selectedStreamHash {
                 
                 // PARTIAL LOCK (Hash only)
                 print("\n\n✅ [SYNC VERIFICATION] LOCKING TO SHARED STREAM (HASH ONLY) 🔒")
                 
                 let result = try await streamResolver.resolveStream(
                     item: item,
                     quality: quality,
                     season: season,
                     episode: episode,
                     metadata: metadata,
                     preferredInfoHash: hostStreamHash
                 )
                 resolvedStream = result.stream
                 resolvedMetadata = result.metadata
            } else {
                // Standard resolution
                let result = try await streamResolver.resolveStream(
                    item: item,
                    quality: quality,
                    season: season,
                    episode: episode,
                    metadata: metadata,
                    preferredInfoHash: nil
                )
                resolvedStream = result.stream
                resolvedMetadata = result.metadata
            }
            
            guard let finalStream = resolvedStream else {
                throw APIError.noStreamsFound
            }
            
            // Step 3: Update UI
            await MainActor.run {
                selectedStream = finalStream
                if let meta = resolvedMetadata {
                    selectedMetadata = meta
                }
                
                // Set room ID logic
                if let roomId = roomId {
                    currentRoomId = roomId
                } else if watchMode == .watchParty {
                    currentRoomId = "room_\(UUID().uuidString.prefix(8))"
                } else {
                    currentRoomId = nil
                }
                
                isResolvingStream = false
            }
            
            NSLog("✅ Stream ready, starting playback...")
            enterFullscreen()
            
        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                
                if selectedMetadata == nil {
                    Task {
                        if let meta = try? await metadataProvider.fetchMetadata(type: item.type, id: item.id) {
                            await MainActor.run { self.selectedMetadata = meta }
                        }
                    }
                }
            }
        }
    }
    
    func preloadMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        streamError = nil

        do {
            print("🎬 PlayerVM: Preloading playback for: \(item.name)")
            
            let metadata = try await metadataProvider.fetchMetadata(type: item.type, id: item.id)

            await MainActor.run {
                selectedMetadata = metadata
                selectedMediaItem = item
                isResolvingStream = true
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
                selectedQuality = quality
                isPreloading = true
                
                showPlayer = true
                if let appState = appState {
                    appState.currentView = .player
                }
            }
            
            let season = item.type == "series" ? selectedSeason : nil
            let episode = item.type == "series" ? selectedEpisode : nil
            
            var resolvedStream: Stream?
            
            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
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
                resolvedStream = hostStream
            } else {
                let result = try await streamResolver.resolveStream(
                    item: item,
                    quality: quality,
                    season: season,
                    episode: episode,
                    metadata: metadata,
                    preferredInfoHash: nil
                )
                resolvedStream = result.stream
            }
            
            guard let finalStream = resolvedStream else {
                throw APIError.noStreamsFound
            }
            
            await MainActor.run {
                selectedStream = finalStream
                
                if let roomId = roomId {
                    currentRoomId = roomId
                } else if watchMode == .watchParty {
                    currentRoomId = "room_\(UUID().uuidString.prefix(8))"
                } else {
                    currentRoomId = nil
                }
                
                isResolvingStream = false
            }
            
            NSLog("✅ Stream preloaded, waiting for play signal...")
            enterFullscreen()
            
        } catch {
            print("❌ Preload error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                isPreloading = false
            }
        }
    }
    
    func startPreloadedPlayback() {
        guard isPreloading else { return }
        print("▶️ Starting preloaded playback")
        isPreloading = false
    }
    
    // Resolve and persist stream BEFORE starting watch party
    func resolveAndPersistForWatchParty(mediaItem: MediaItem, quality: VideoQuality, roomId: String, season: Int? = nil, episode: Int? = nil) async throws -> Stream {
        print("🎬 Resolving & Persisting stream for Watch Party Room: \(roomId)")
        
        await MainActor.run {
            self.isResolvingStream = true
            self.streamError = nil
        }
        
        defer {
            Task { @MainActor in self.isResolvingStream = false }
        }

        let metadata = try await metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
        
        let targetSeason = season ?? (mediaItem.type == "series" ? selectedSeason : nil)
        let targetEpisode = episode ?? (mediaItem.type == "series" ? selectedEpisode : nil)
        
        let result = try await streamResolver.resolveStream(
            item: mediaItem,
            quality: quality,
            season: targetSeason,
            episode: targetEpisode,
            metadata: metadata,
            preferredInfoHash: nil
        )
        
        let unlockedStream = try await streamResolver.unlockStream(
            stream: result.stream,
            item: mediaItem,
            season: targetSeason,
            episode: targetEpisode
        )
        
        // Persist
        print("📡 Persisting resolved stream to room \(roomId)...")
        
        await MainActor.run {
            self.selectedMetadata = metadata
            
            if var room = self.currentWatchPartyRoom {
                room.selectedStreamHash = unlockedStream.infoHash
                room.selectedFileIdx = unlockedStream.fileIdx
                room.selectedQuality = unlockedStream.quality
                room.unlockedStreamURL = unlockedStream.url
                self.currentWatchPartyRoom = room
            }
        }
        
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
            print("🎬 PlayerVM: Starting playback with selected stream: \(stream.title)")

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
                
                showPlayer = true
                if let appState = appState {
                    appState.currentView = .player
                }
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

        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
            }
        }
    }
    
    func navigateToPlayer(stream: Stream) {
        selectedStream = stream
        showPlayer = true
        if let appState = appState {
            appState.currentView = .player
        }
        enterFullscreen()
    }
    
    func exitPlayer(keepRoomState: Bool = false) async {
        if !keepRoomState {
            if let roomId = currentRoomId {
                print("👋 Leaving room: \(roomId)")
            }
        }
        
        // Clean up player state
        showPlayer = false
        selectedStream = nil
        selectedMediaItem = nil
        // Note: We don't clear selectedMetadata immediately as it looks nice for transitions
        
        
        if !keepRoomState {
            currentRoomId = nil
            currentWatchMode = .solo
            isWatchPartyHost = false
        }
        
        // Capture event state before resetting
        let wasEventPlayback = isEventPlayback
        isEventPlayback = false // Reset event flag
        
        exitFullscreen()
        
        // Navigate back
        if !keepRoomState {
            if wasEventPlayback {
               if let appState = appState {
                   appState.currentView = .events
               }
            } else {
               if let appState = appState {
                   appState.currentView = .browse
               }
            }
        }
        
        WindowManager.shared.restoreWindowSize()
    }
    
    func handleMovieFinished() async {
        print("🎬 PlayerVM.handleMovieFinished() called")
        
        let wasEventPlayback = isEventPlayback
        let isPlaylistRoom = currentWatchPartyRoom?.hasPlaylist ?? false
        let isPersistentRoom = currentWatchPartyRoom?.isPersistent ?? false
        
        let shouldKeepRoomState = !wasEventPlayback && (isPlaylistRoom || isPersistentRoom)
        
        await exitPlayer(keepRoomState: shouldKeepRoomState)
        
        if wasEventPlayback {
            if let eventId = currentEventId {
                finishedEventIds.insert(eventId)
                currentEventId = nil
            }
            if let appState = appState {
                 appState.currentView = .events
                 appState.shouldAutoJoinLobby = true
            }
            return
        }
        
        if isPlaylistRoom, let room = currentWatchPartyRoom {
            await handlePlaylistTransition(room: room)
            return
        }
        
        if isPersistentRoom {
            if let appState = appState {
                appState.currentView = .watchPartyLobby
            }
            return
        }
    }
    
    private func handlePlaylistTransition(room: WatchPartyRoom) async {
        await MainActor.run {
            var updatedRoom = room
            updatedRoom.currentPlaylistIndex += 1
            
            if updatedRoom.currentPlaylistIndex >= (updatedRoom.playlist?.count ?? 0) {
                if updatedRoom.shouldLoop {
                    updatedRoom.currentPlaylistIndex = 0
                }
            }
            
            self.currentWatchPartyRoom = updatedRoom
            if let appState = appState {
                 appState.currentView = .watchPartyLobby
            }
        }
    }
    
    // MARK: - Room Management
    
    // Generate a short 4-character room code
    private func generateRoomCode() -> String {
        let chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789" // Exclude I, O, 1, 0 to avoid confusion
        return String((0..<4).map { _ in chars.randomElement()! })
    }
    
    func createWatchPartyAndNavigate(
        mediaItem: MediaItem,
        season: Int? = nil,
        episode: Int? = nil,
        quality: VideoQuality = .fullHD,
        isPublic: Bool = true,
        description: String? = nil
    ) async {
        guard let appState = appState else { return }
        
        await MainActor.run {
             appState.isLoadingRoom = true // Update AppState UI
        }
        
        do {
            guard let userId = appState.currentUserId, !appState.currentUsername.isEmpty else {
                throw NSError(domain: "PlayerViewModel", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])
            }
            
            // Handle Series logic (default to S1E1 if missing)
            var finalSeason = season
            var finalEpisode = episode
            if mediaItem.type == "series" && (season == nil || episode == nil) {
                 finalSeason = 1
                 finalEpisode = 1
            }

            NSLog("🎬 Creating Watch Party for: \(mediaItem.name)")

            let roomName = mediaItem.name
            let roomId = generateRoomCode()

            // Attempts to create room (omitted duplicate retry logic for brevity, assuming backend is aligned or we keep it simple)
            // Keeping the retry logic from original for safety
            var room: SupabaseRoom!
            do {
                room = try await roomManager.createRoom(
                    id: roomId,
                    name: roomName,
                    hostUserId: userId,
                    hostUsername: appState.currentUsername,
                    streamHash: nil,
                    imdbId: mediaItem.id,
                    posterUrl: mediaItem.poster,
                    backdropUrl: mediaItem.background,
                    season: finalSeason,
                    episode: finalEpisode,
                    isPublic: isPublic,
                    unlockedStreamUrl: nil,
                    description: description,
                    playlist: nil
                )
             } catch {
                // Retry without new fields
                room = try await roomManager.createRoom(
                    id: roomId,
                    name: roomName,
                    hostUserId: userId,
                    hostUsername: appState.currentUsername,
                    streamHash: nil,
                    imdbId: mediaItem.id,
                    posterUrl: mediaItem.poster,
                    backdropUrl: mediaItem.background,
                    season: finalSeason,
                    episode: finalEpisode,
                    isPublic: false,
                    unlockedStreamUrl: nil,
                    description: nil,
                    playlist: nil
                )
             }

            // Host join DB
            try await roomManager.joinRoom(roomId: roomId, userId: userId, isHost: true)
            
            // Create Host Participant
            let hostParticipant = Participant(
                id: userId.uuidString,
                name: appState.currentUsername,
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
                playlist: nil,
                currentPlaylistIndex: 0,
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

            await MainActor.run {
                self.currentRoomId = roomId
                self.currentWatchPartyRoom = watchPartyRoom
                self.isWatchPartyHost = true
                self.currentWatchMode = .watchParty
                
                self.selectedMediaItem = mediaItem
                self.selectedSeason = finalSeason
                self.selectedEpisode = finalEpisode
                self.selectedQuality = quality
                
                if self.selectedMetadata == nil || self.selectedMetadata?.id != mediaItem.id {
                    Task {
                        self.selectedMetadata = try? await self.metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
                    }
                }
                
                appState.currentView = .watchPartyLobby
                appState.isLoadingRoom = false
            }

        } catch {
            NSLog("❌ Failed to create room: \(error)")
            await MainActor.run { appState.isLoadingRoom = false }
        }
    }
    
    func joinRoom(roomId: String) async {
        guard let appState = appState else { return }
        NSLog("🚪 Joining room: \(roomId)")
        
        await MainActor.run { appState.isLoadingRoom = true }

        do {
            let roomState = try await roomManager.getRoomState(roomId: roomId)
            
            guard let room = roomState else {
                NSLog("❌ Room not found: \(roomId)")
                await MainActor.run { appState.isLoadingRoom = false }
                return
            }
            
            if let userId = appState.currentUserId {
                try await roomManager.joinRoom(roomId: roomId, userId: userId, isHost: false)
            }

            // Create local WatchPartyRoom object
            let participants = try await roomManager.getRoomParticipants(roomId: roomId)
            var participantList: [Participant] = []
            // Getting user names (could be optimized)
            // Ideally we should have a user cache or get names from participants table if stored
            for p in participants {
                // Mock name or fetch? Assuming existing logic was sufficient
                // We'll use "User" as fallback if we can't access userManager easily here without dependency cycle or extra logic
                // But roomManager might not expose UserManager.
                // We can skip fetching names one by one if it's slow, or rely on Lobby to refresh.
                participantList.append(Participant(
                     id: p.userId.uuidString,
                     name: "User", // Placeholder, Lobby will refresh
                     isHost: p.isHost,
                     isReady: false,
                     joinedAt: p.joinedAt
                ))
            }

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
                    logo: nil, description: nil, releaseInfo: nil, year: nil, imdbRating: nil, genres: nil, runtime: nil
                ),
                season: room.season,
                episode: room.episode,
                quality: .fullHD,
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

            await MainActor.run {
                if room.isPlaying {
                    NSLog("🎬 Room is already playing - joining playback")
                    self.currentRoomId = roomId
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isWatchPartyHost = (room.hostUserId == appState.currentUserId)
                    self.currentWatchMode = .watchParty
                    
                    if let imdbId = room.imdbId, !imdbId.isEmpty {
                        self.selectedMediaItem = watchPartyRoom.mediaItem // Use constructed one
                        
                        Task {
                            self.selectedMetadata = try? await self.metadataProvider.fetchMetadata(
                                type: room.season != nil ? "series" : "movie",
                                id: imdbId
                            )
                        }
                        
                        self.selectedSeason = room.season
                        self.selectedEpisode = room.episode
                        self.selectedQuality = .fullHD
                        self.resumeFromTimestamp = Double(room.playbackPosition)
                        
                        // Play immediately
                        Task {
                            await self.playMedia(
                                self.selectedMediaItem!,
                                quality: .fullHD,
                                watchMode: .watchParty,
                                roomId: roomId,
                                isHost: false
                            )
                        }
                    }
                } else {
                    NSLog("🚪 Room is in lobby")
                    self.currentRoomId = roomId
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isWatchPartyHost = (room.hostUserId == appState.currentUserId)
                    self.currentWatchMode = .watchParty
                    
                    if let imdbId = room.imdbId, !imdbId.isEmpty {
                        self.selectedMediaItem = watchPartyRoom.mediaItem
                         Task {
                            self.selectedMetadata = try? await self.metadataProvider.fetchMetadata(
                                type: room.season != nil ? "series" : "movie",
                                id: imdbId
                            )
                        }
                    }
                    
                    appState.currentView = .watchPartyLobby
                }
                appState.isLoadingRoom = false
            }

        } catch {
            NSLog("❌ Failed to join room: \(error)")
            await MainActor.run { appState.isLoadingRoom = false }
        }
    }
    
    // MARK: - Watch History
    
    private var lastHistorySaveTime: Date = .distantPast
    
    func saveToWatchHistory(timestamp: Double, duration: Double, force: Bool = false) {
        guard let mediaItem = selectedMediaItem else { return }

        // Throttle saving to once every 60 seconds unless forced
        let timeSinceLastSave = Date().timeIntervalSince(lastHistorySaveTime)
        if !force && timeSinceLastSave < 60.0 {
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
    
    // MARK: - Window Management
    
    private func enterFullscreen() {
        WindowManager.shared.enterFullscreen()
    }
    
    private func exitFullscreen() {
        WindowManager.shared.exitFullscreen()
    }
}
