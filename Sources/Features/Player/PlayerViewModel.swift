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
    var streamQueue: [Stream] = [] // Fallback queue for auto-retry logic
    var playbackRetryCount: Int = 0 // Track retries for transient errors
    @Published var currentWatchMode: WatchMode = .solo
    @Published var currentRoomId: String?
    @Published var isWatchPartyHost: Bool = false
    @Published var currentWatchPartyRoom: WatchPartyRoom? // Current lobby/room

    @Published var showPremiumLimitAlert: Bool = false // Alert for free user limit logic

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

    // Subtitles
    @Published var hasAutoSelectedSubtitles: Bool = false

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

    func playMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false, isEvent: Bool = false) async {
        streamError = nil

        // Step 0: Clear state IMMEDIATELY to prevent stale UI
        await MainActor.run {
            selectedStream = nil // Clear previous stream to prevent stale playback
            streamQueue = [] // Clear stream queue
            playbackRetryCount = 0 // Reset retry count

            // ✅ OPTIMISTIC UPDATE: Set metadata immediately to prevent background flash
            // This ensures the generic background (from Browse) is shown while fetching full details
            selectedMetadata = MediaMetadata(
                id: item.id,
                type: item.type,
                title: item.name,
                year: item.year,
                posterURL: item.poster,
                backgroundURL: item.background,
                logoURL: item.logo,
                description: item.description,
                director: nil,
                cast: [],
                genres: item.genres ?? [],
                runtime: item.runtime,
                imdbRating: Double(item.imdbRating ?? ""),
                releaseInfo: item.releaseInfo,
                trailerURL: nil,
                videos: []
            )
            selectedMediaItem = item // Ensure item is set

            isResolvingStream = true
            currentWatchMode = watchMode
            isWatchPartyHost = isHost
            selectedQuality = quality
            
            // CRITICAL FIX: Enforce event playback state to ensure UI correctness
            isEventPlayback = isEvent

            // Show player immediately
            showPlayer = true
            if let appState = appState {
                appState.currentView = .player
            }
        }

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
            }

            // Determine effective Season/Episode
            // Priority: Watch Party Playlist Item > Selected Season/Episode
            var effectiveSeason = item.type == "series" ? selectedSeason : nil
            var effectiveEpisode = item.type == "series" ? selectedEpisode : nil

            if let room = currentWatchPartyRoom,
               let playlistItem = room.currentPlaylistItem {
                 // Use specific season/episode from playlist if available (Highest Priority)
                 if let s = playlistItem.season { effectiveSeason = s }
                 if let e = playlistItem.episode { effectiveEpisode = e }
                 NSLog("🎬 PlayerVM: Using Playlist Metadata: S\(effectiveSeason ?? 0)E\(effectiveEpisode ?? 0)")
            }

            // Step 2: Resolve stream (Optimized for Guest)
            var resolvedStream: Stream?
            var resolvedMetadata: MediaMetadata? = metadata

            // GUEST OPTIMIZATION
            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               (roomId == nil || watchPartyRoom.id == roomId), // Ensure we matched the correct room
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {

                let hostStreamHash = watchPartyRoom.selectedStreamHash

                let hostQuality = watchPartyRoom.selectedQuality ?? "Unknown" // Relaxed check

                print("\n\n✅ [SYNC VERIFICATION] LOCKING TO SHARED STREAM (SYSTEM/HOST) 🔒")
                NSLog("🎬 GUEST: Using host's stream selection (skipping resolution)")

                // Extract filename from URL for better metadata
                let filename = URL(string: hostUnlockedURL)?.lastPathComponent.removingPercentEncoding ?? "Host Stream"

                // Fallback: Detect quality from filename if room state is missing it
                var finalQuality = hostQuality
                if hostQuality == "Unknown" || hostQuality.isEmpty {
                    finalQuality = Stream.detectVideoQuality(from: filename)
                    NSLog("⚠️ GUEST: Detected quality from filename: \(finalQuality)")
                }

                var hostStream = Stream(
                    url: hostUnlockedURL,
                    title: filename, // Use actual filename for badge detection
                    quality: finalQuality,
                    seeders: nil,
                    size: nil,
                    provider: "realdebrid",
                    infoHash: hostStreamHash,
                    fileIdx: watchPartyRoom.selectedFileIdx,
                    ext: nil,
                    behaviorHints: nil,
                    subtitles: []
                )

                // Standard Behavior: Search for subtitles locally (SubDL)
                // We no longer enforce "Shared Subtitles" from the host, allowing guests to pick their own.
                // Fetch subtitles from SubDL via local server
                if let subDLSubtitles = try? await LocalAPIClient.shared.searchSubtitles(
                    imdbId: item.id,
                    type: item.type,
                    season: effectiveSeason, // Use derived playlist metadata
                    episode: effectiveEpisode, // Use derived playlist metadata
                    name: item.name,
                    year: item.year.flatMap { Int($0) }
                ) {
                     NSLog("✅ GUEST: Found \(subDLSubtitles.count) subtitles")

                     // Convert to Subtitle objects
                     // Convert to Subtitle objects
                     let externalSubs = subDLSubtitles.enumerated().map { (index, sub) -> Subtitle in
                         let encodedPath = Data(sub.url.utf8).base64EncodedString()

                         // Route through local server proxy to handle zip extraction and VTT conversion
                         // This is CRITICAL for MPV to be able to read the files, as it cannot handle
                         // raw relative paths or zip files directly without this proxy.
                         let pUrl = LocalAPIClient.shared.getSubtitleURL(downloadPath: sub.url, season: watchPartyRoom.season, episode: watchPartyRoom.episode)
                         // Add token manually or let getSubtitleURL handle it? getSubtitleURL does NOT add token currently, so we add it here?
                         // Wait, StreamService adds token. PlayerViewModel logic I saw earlier did NOT add token?
                         // Line 179: var proxyURL = "\(Config.serverURL)/subtitles/subdl/\(encodedPath)"
                         // It did NOT add token! Is token optional for local requests?
                         // Server middleware might require it.
                         // Let's add it to be safe if StreamService adds it.
                         // But if I add it, I need access to Config.localAuthToken.
                         // PlayerViewModel imports... checking if Config is available. `Config.serverURL` is used so Config is available.
                         // But `Config.localAuthToken`?

                         var proxyURL = pUrl
                         // Safe append
                         proxyURL += (proxyURL.contains("?") ? "&" : "?") + "token=\(Config.localAuthToken)"

                         return Subtitle(
                            id: encodedPath,
                            url: proxyURL,
                            lang: sub.language ?? "en",
                            label: sub.releaseName ?? "English",
                            srclang: sub.language ?? "en",
                            kind: "subtitles",
                            provider: "SubDL"
                         )
                     }

                     hostStream.subtitles = (hostStream.subtitles ?? []) + externalSubs
                }

                resolvedStream = hostStream

            } else if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
                      (roomId == nil || watchPartyRoom.id == roomId),
                      let hostStreamHash = watchPartyRoom.selectedStreamHash {

                 // PARTIAL LOCK (Hash only)
                 print("\n\n✅ [SYNC VERIFICATION] LOCKING TO SHARED STREAM (HASH ONLY) 🔒")

                 let result = try await streamResolver.resolveStream(
                     item: item,
                     quality: quality,
                     season: effectiveSeason, // Use effective variables
                     episode: effectiveEpisode, // Use effective variables
                     metadata: metadata,
                     preferredInfoHash: hostStreamHash,
                     filterExtended: false
                 )
                 resolvedStream = result.stream
                 resolvedMetadata = result.metadata
                 Task { @MainActor in self.streamQueue = result.candidateStreams }
            } else {
                // Standard resolution
                let result = try await streamResolver.resolveStream(
                    item: item,
                    quality: quality,
                    season: effectiveSeason, // Use effective variables
                    episode: effectiveEpisode, // Use effective variables
                    metadata: metadata,
                    preferredInfoHash: nil,
                    filterExtended: false
                )

                resolvedStream = result.stream
                resolvedMetadata = result.metadata
                Task { @MainActor in self.streamQueue = result.candidateStreams }
            }

            guard let finalStream = resolvedStream else {
                throw APIError.noStreamsFound
            }

            // Step 3: Update UI
            await MainActor.run {
                selectedStream = finalStream

                // Smart Retry: Mark this hash as attempted for this session
                if let hash = finalStream.infoHash {
                    Task {
                        await StreamService.shared.markStreamAsAttempted(imdbId: item.id, hash: hash)
                    }
                }

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
               let hostQuality = watchPartyRoom.selectedQuality,
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {

                let hostStreamHash = watchPartyRoom.selectedStreamHash

                NSLog("🎬 GUEST: Using host's stream selection for preload")
                // Extract filename from URL for better metadata
                let filename = URL(string: hostUnlockedURL)?.lastPathComponent.removingPercentEncoding ?? "Host Stream"

                // Fallback: Detect quality from filename if room state is missing it
                var finalQuality = hostQuality
                // Use relaxed check for "Unknown" since hostQuality is non-optional string here (derived from optional room prop)
                if hostQuality == "Unknown" || hostQuality.isEmpty {
                     finalQuality = Stream.detectVideoQuality(from: filename)
                }

                var hostStream = Stream(
                    url: hostUnlockedURL,
                    title: filename, // Use actual filename
                    quality: finalQuality,
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
                    preferredInfoHash: nil,
                    filterExtended: false
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

        let targetSeason = (mediaItem.type == "series") ? (season ?? selectedSeason) : nil
        let targetEpisode = (mediaItem.type == "series") ? (episode ?? selectedEpisode) : nil

        var unlockedStream: Stream?
        var lastError: Error?
        let maxRetries = 5

        // CRITICAL: Retry loop for Watch Party resolution (Task 14)
        // This matches the robustness of standard playback (tryNextStream logic)
        for attempt in 1...maxRetries {
            // Check cancellation
            if Task.isCancelled { throw CancellationError() }

            if attempt > 1 {
                print("🔄 Watch Party Resolve: Retry attempt \(attempt)/\(maxRetries)...")
                // Wait 1.5s between retries to let providers realize their mistake or network to settle
                try? await Task.sleep(nanoseconds: 1_500_000_000)
            }

            do {
                let result = try await streamResolver.resolveStream(
                    item: mediaItem,
                    quality: quality,
                    season: targetSeason,
                    episode: targetEpisode,
                    metadata: metadata,
                    preferredInfoHash: nil,
                    filterExtended: false
                )

                // Populate failover queue for Host
                await MainActor.run {
                    self.streamQueue = result.candidateStreams
                    print("📊 Watch Party Queue: Loaded \(result.candidateStreams.count) candidate streams for failover")
                }

                // Build retry queue: Primary + Candidates
                let streamsToTry = [result.stream] + result.candidateStreams

                if streamsToTry.isEmpty {
                    throw APIError.noStreamsFound
                }

                print("🎬 Stream Resolution (Attempt \(attempt)): Found \(streamsToTry.count) streams to attempt unlock...")

                // Try to unlock candidates
                for (index, stream) in streamsToTry.enumerated() {
                    if Task.isCancelled { throw CancellationError() }

                    do {
                        if index > 0 {
                            print("   🔄 Candidate #\(index): \(stream.title)")
                        }

                        unlockedStream = try await streamResolver.unlockStream(
                            stream: stream,
                            item: mediaItem,
                            season: targetSeason,
                            episode: targetEpisode
                        )

                        print("✅ Successfully unlocked stream on attempt \(attempt) (Candidate #\(index))")
                        break // Break unlock loop
                    } catch {
                        print("   ⚠️ Unlock failed for candidate #\(index): \(error.localizedDescription)")
                        lastError = error
                        continue // Try next candidate
                    }
                }

                // If we found a stream, break the retry loop
                if unlockedStream != nil {
                    break
                }

            } catch {
                print("⚠️ Resolution failed on attempt \(attempt): \(error.localizedDescription)")
                lastError = error
            }
        }

        guard let finalStream = unlockedStream else {
            print("❌ All Watch Party resolution attempts failed.")
            throw lastError ?? APIError.noStreamsFound
        }

        // Persist
        print("📡 Persisting resolved stream to room \(roomId)...")

        await MainActor.run {
            self.selectedMetadata = metadata

            if var room = self.currentWatchPartyRoom {
                room.selectedStreamHash = finalStream.infoHash
                room.selectedFileIdx = finalStream.fileIdx
                room.selectedQuality = finalStream.quality
                room.unlockedStreamURL = finalStream.url
                self.currentWatchPartyRoom = room
            }
        }

        try await roomManager.updateRoomStream(
            roomId: roomId,
            streamHash: finalStream.infoHash,
            fileIdx: finalStream.fileIdx,
            quality: finalStream.quality,
            unlockedUrl: finalStream.url,
            resetPlayback: true // RESET STATE: Ensure room is paused/lobby for new media
        )

        print("✅ Stream persisted! Hash: \(finalStream.infoHash ?? "nil")")
        return finalStream
    }

    func playSelectedStream(_ stream: Stream, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        guard let mediaItem = selectedMediaItem else {
            streamError = "No media item selected"
            return
        }

        streamError = nil
        playbackRetryCount = 0 // Reset retry count for manual selections

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
                    do {
                        try await roomManager.updateRoomStream(
                            roomId: roomId,
                            streamHash: unlockedStream.infoHash,
                            fileIdx: unlockedStream.fileIdx,
                            quality: unlockedStream.quality,
                            unlockedUrl: unlockedStream.url,
                            resetPlayback: true // RESET STATE: Manual stream change implies new session start
                        )
                    } catch {
                        LogManager.shared.error("❌ Failed to persist stream selection to room \(roomId)", error: error)
                    }
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

    func handlePlaybackError(_ error: String) {
        print("⚠️ PlayerVM: Handling playback error: \(error)")

        // Check for transient "Playback Timeout" error
        if error.contains("Timeout") {
            if playbackRetryCount < 1 && selectedStream != nil {
                playbackRetryCount += 1
                print("🔄 Transient Timeout detected. Retrying current stream (Attempt \(playbackRetryCount)/1)...")
                
                // Silent retry of the SAME stream
                Task { @MainActor in
                    if let stream = self.selectedStream {
                         // Re-lock (refresh URL) and play
                         await self.playSelectedStream(stream, watchMode: self.currentWatchMode, roomId: self.currentRoomId, isHost: self.isWatchPartyHost)
                    }
                }
                return
            } else {
                 print("🚫 Timeout retry limit reached or no stream selected. Proceeding to fallback.")
            }
        }

        // Default: Try next stream in queue
        tryNextStream()
    }

    func tryNextStream() {
        guard !streamQueue.isEmpty else {
            print("🚫 PlayerVM: No more streams in queue. Playback failed.")
            self.streamError = "Playback Failed: No working streams found."
            return
        }

        let nextStream = streamQueue.removeFirst()
        print("⏭️ PlayerVM: Falling back to next stream: \(nextStream.title)")


        DispatchQueue.main.async {
             // RedLemon: Silent retry (no UI flash)
             // self.streamError = "Stream failed. Retrying... (\(self.streamQueue.count + 1) left)"
             print("🔄 Silently retrying next stream (\(self.streamQueue.count + 1) left)")
        }

        Task {
            do {
                // Step 1: Unlock the stream
                let season = selectedMediaItem?.type == "series" ? selectedSeason : nil
                let episode = selectedMediaItem?.type == "series" ? selectedEpisode : nil

                guard let item = selectedMediaItem else { return }

                let unlockedStream = try await streamResolver.unlockStream(
                    stream: nextStream,
                    item: item,
                    season: season,
                    episode: episode
                )

                // Step 2: Update Selected Stream (Triggers Player Reload)
                await MainActor.run {
                    self.selectedStream = unlockedStream
                    self.streamError = nil // Clear error if unlock succeeded
                    // Note: MPVPlayerView should react to this change if the parent view passes the new binding/data

                    // CRITICAL: If Host, persist new stream selection to Room so guests follow
                    if self.isWatchPartyHost, let room = self.currentWatchPartyRoom, let roomId = self.currentRoomId {
                        print("📡 Watch Party Failover: Persisting new stream to room \(roomId)...")

                        // Update local room object
                        var updatedRoom = room
                        updatedRoom.selectedStreamHash = unlockedStream.infoHash
                        updatedRoom.selectedFileIdx = unlockedStream.fileIdx
                        updatedRoom.selectedQuality = unlockedStream.quality
                        updatedRoom.unlockedStreamURL = unlockedStream.url
                        self.currentWatchPartyRoom = updatedRoom

                        // Persist to Supabase
                        Task {
                            do {
                                try await self.roomManager.updateRoomStream(
                                    roomId: roomId,
                                    streamHash: unlockedStream.infoHash,
                                    fileIdx: unlockedStream.fileIdx,
                                    quality: unlockedStream.quality,
                                    unlockedUrl: unlockedStream.url,
                                    resetPlayback: true // RESET STATE: Failover needs to sync guests to new file
                                )
                                print("✅ Watch Party Failover: Room updated successfully")
                            } catch {
                                print("❌ Watch Party Failover: Failed to update room: \(error)")
                            }
                        }
                    }
                }

            } catch {
                print("❌ PlayerVM: Fallback stream failed to unlock: \(error.localizedDescription)")
                // Recursive retry if unlock fails immediately
                tryNextStream()
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
            currentWatchPartyRoom = nil // Clear stale room state
            currentWatchMode = .solo
            isWatchPartyHost = false

        }

        // Capture event state before resetting
        let wasEventPlayback = isEventPlayback
        isEventPlayback = false // Reset event flag
        eventStartTime = nil // FIX: Clear event start time on explicit exit
        resumeFromTimestamp = nil // FIX: Clear resume timestamp

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

        // Auto-play next episode logic
        if let item = selectedMediaItem, item.type == "series",
           let meta = selectedMetadata, let videos = meta.videos {

            // Check if we have a next episode available
            let (targetS, targetE) = findNextEpisode(currentS: selectedSeason ?? 1, currentE: selectedEpisode ?? 1, videos: videos)

            if let s = targetS, let e = targetE {
                print("⏭️ Series playback finished, auto-playing next episode: S\(s)E\(e)")

                // Binge Blocking: Free hosts cannot auto-play next episode in Watch Parties
                let isPremium = SupabaseClient.shared.auth.currentUser?.isPremium ?? false
                if isWatchPartyHost && !isPremium {
                    print("🚫 Auto-play blocked (Free Tier Host)")
                    await exitPlayer(keepRoomState: false)
                    return
                }

                // Add a small delay for better UX
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                await playNextEpisode()
                return
            }
        }

        // Premature EOF Detection for System Events
        if isEventPlayback, let start = eventStartTime, let metadata = selectedMetadata {
             // Calculate expected end time based on runtime
             // Note: eventStartTime is the SCHEDULED start, not when we started watching.
             // We need to check if we are significantly before the scheduled end.
             
             // Get total runtime in seconds
             // runtime is usually string "120 min" or similar. Need to parse or rely on `duration` from MPV if valid?
             // Actually, `Sessions/Events` have fixed slots.
             
             // Better approach: Check `TimeService.shared.serverTime`.
             // Compare current server time with `eventEndTime` (which we need to calculate or store).
             
             // Let's use the MPV duration vs Expected duration? No, MPV duration is the issue (it's short).
             // We should check if we are "near" the end of the event slot.
             
             // If we don't have event slot info readily available here (we have `eventStartTime` but maybe not duration/end),
             // let's rely on a simpler metric: We know it's an event.
             // We know we just hit EOF.
             // If this was a "normal" finish, we should be near the end of the schedule.
             
             // Let's look at `EventsConfigService` which usually has the current event.
             // Or rely on `TimeService`.
             
             // Let's calculate Time Remaining in the Event Slot.
             // We need to know when the event *should* end.
             // `PlayerViewModel` has `selectedMediaItem` but not the `EventSlot` directly.
             // However, `eventStartTime` is set for sync.
             
             // Let's assume runtime from metadata is truth for the movie content.
             // If we finish 10 minutes before runtime implies, that's "Credits" maybe.
             // If we finish 50 minutes before, that's a crash.
             
             // Parsed "107 min" -> 107.0
             let cleanedRuntime = (metadata.runtime ?? "0").filter { "0123456789.".contains($0) }
             let runtimeMinutes = Double(cleanedRuntime) ?? 0
             let runtimeSeconds = runtimeMinutes * 60
             
             if runtimeSeconds > 0 {
                  // Calculate how long we've been "playing" or where we are relative to start.
                  // `eventStartTime` is the wall-clock time the event started.
                  let now = Date()
                  let timeSinceStart = now.timeIntervalSince(start)
                  let timeRemaining = runtimeSeconds - timeSinceStart
                  
                  // Tolerance: 5 minutes (300s) + Credits allowance
                  // If we are more than 10% or 10 minutes "early", it's suspicious.
                  // Let's use 5 minutes for "xXx" case (1h 20m vs 10s file).
                  
                  if timeRemaining > 300 {
                       print("🚨 PlayerVM: Premature EOF detected! Time remaining: \(Int(timeRemaining))s. Triggering Failover.")
                       handlePlaybackError("Premature EOF (Target: \(Int(timeRemaining))s left)")
                       return
                  }
             }
        }

        // Dead room detection: If room was deleted (host left), go to browse instead of lobby
        if let roomId = currentRoomId {
            let roomExists = try? await roomManager.getRoomState(roomId: roomId)
            if roomExists == nil {
                print("👻 PlayerVM: Room \(roomId) no longer exists - returning to browse")
                await exitPlayer(keepRoomState: false)
                if let appState = appState {
                    appState.currentView = .browse
                }
                return
            }
        }

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

    // Check if next episode exists
    func hasNextEpisode() -> Bool {
        guard let item = selectedMediaItem, item.type == "series",
              let meta = selectedMetadata, let videos = meta.videos,
              let currentS = selectedSeason, let currentE = selectedEpisode else {
            return false
        }

        let (targetS, targetE) = findNextEpisode(currentS: currentS, currentE: currentE, videos: videos)
        return targetS != nil && targetE != nil
    }

    // Play next episode
    func playNextEpisode() async {
        guard let item = selectedMediaItem, item.type == "series",
              let meta = selectedMetadata, let videos = meta.videos,
              let currentS = selectedSeason, let currentE = selectedEpisode else {
            return
        }

        let (targetS, targetE) = findNextEpisode(currentS: currentS, currentE: currentE, videos: videos)

        guard let s = targetS, let e = targetE else {
            print("🚫 No next episode found")
            return
        }

        print("⏭️ Playing Next Episode: S\(s)E\(e)")

        // Binge Blocking: Free Hosts cannot play next episode in same room
        let isPremium = SupabaseClient.shared.auth.currentUser?.isPremium ?? false
        if isWatchPartyHost && !isPremium {
            print("🚫 Binge Blocked (Watch Party): User is not premium")
            await MainActor.run {
                streamError = "Upgrade to Premium to binge watch with friends!"
                showPlayer = false
            }
            return
        }

        await MainActor.run {
             if let appState = appState {
                 appState.selectedSeason = s
                 appState.selectedEpisode = e
             } else {
                 selectedSeason = s
                 selectedEpisode = e
             }
        }

        // Use the same watch mode and host status
        await playMedia(item, quality: selectedQuality, watchMode: currentWatchMode, roomId: currentRoomId, isHost: isWatchPartyHost)
    }

    private func findNextEpisode(currentS: Int, currentE: Int, videos: [VideoEpisode]) -> (Int?, Int?) {
        // 1. Try next episode in current season
        let nextE = currentE + 1
        if videos.contains(where: { $0.season == currentS && $0.episode == nextE }) {
            return (currentS, nextE)
        }

        // 2. Try first episode of next season
        let nextS = currentS + 1
        if videos.contains(where: { $0.season == nextS && $0.episode == 1 }) {
            return (nextS, 1)
        }

        return (nil, nil)
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
            // CRITICAL: Ensure movies NEVER have season/episode set, even if passed in (e.g. stale state)
            var finalSeason: Int? = nil
            var finalEpisode: Int? = nil

            if mediaItem.type == "series" {
                finalSeason = season ?? 1
                finalEpisode = episode ?? 1
            }

            NSLog("🎬 Creating Watch Party for: \(mediaItem.name)")

            let roomName = mediaItem.name
            let roomId = generateRoomCode()

            // Attempts to create room (omitted duplicate retry logic for brevity, assuming backend is aligned or we keep it simple)
            // Keeping the retry logic from original for safety
            var room: SupabaseRoom!
            do {
            // Capture dependencies to avoid MainActor isolation violations
            let roomManager = self.roomManager
            let hostUsername = appState.currentUsername

             // nonisolated helper to run off MainActor
            room = try await performRoomCreation(
                roomManager: roomManager,
                roomId: roomId,
                roomName: roomName,
                userId: userId,
                hostUsername: hostUsername,
                mediaItem: mediaItem,
                finalSeason: finalSeason,
                finalEpisode: finalEpisode,
                isPublic: isPublic,
                description: description
            )
             } catch {
                NSLog("❌ Creation failed or timed out: \(error)")
                throw error
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
            let msg = "\(error)"
            if msg.contains("Limit Reached") || msg.contains("P0001") || msg.contains("one room every 72 hours") {
                // Refresh limit status so UI shows correct time
                await LicenseManager.shared.checkHostingLimit()

                await MainActor.run {
                    appState.isLoadingRoom = false
                    self.showPremiumLimitAlert = true
                }
            } else {
                await MainActor.run { appState.isLoadingRoom = false }
            }
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

            // CRITICAL FIX: Only join here for PLAYING rooms.
            // For lobby rooms, LobbyViewModel.connect() will handle the database join.
            // This prevents double-join race conditions and 409 errors.
            if room.isPlaying || roomId.hasPrefix("event_") {
                if let userId = appState.currentUserId {
                    try await roomManager.joinRoom(roomId: roomId, userId: userId, isHost: false)
                }
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
                selectedStreamHash: room.streamHash,
                selectedFileIdx: room.fileIdx,
                selectedQuality: room.quality,
                unlockedStreamURL: room.unlockedStreamUrl
            )

            // Fetch dynamic lobby duration from config (Async)
            let eventsConfig = try? await EventsConfigService.shared.fetchMovieEventsConfig()

            await MainActor.run {
                if room.isPlaying || roomId.hasPrefix("event_") {
                    NSLog("🎬 Room is playing (or is Event) - joining playback")
                    self.currentRoomId = roomId
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isWatchPartyHost = (room.hostUserId == appState.currentUserId)
                    self.currentWatchMode = .watchParty

                    // NEW: Handle Event Rooms specifically
                    if roomId.hasPrefix("event_") {
                        self.isEventPlayback = true
                        // Extract ID from roomId (event_tt12345) or use imdbId if available
                        let rawId = roomId.replacingOccurrences(of: "event_", with: "")
                        self.currentEventId = rawId

                        // Set start time and resume position based on creation time (Schedule start)
                        self.eventStartTime = room.createdAt // Crucial for MPVPlayerView sync

                        let now = TimeService.shared.now
                        var position: Double = 0
                        let buffer = Double(eventsConfig?.bufferBetweenMoviesSeconds ?? 600)

                        // CRITICAL: Use authoritative deterministic schedule if possible to avoid "Late Room Creation" drift.
                        // If we rely on room.createdAt, we inherit the delay of the first user who joined.
                        // CRITICAL: Use authoritative deterministic schedule if possible to avoid "Late Room Creation" drift.
                        // 1. Try "Global Live" event first
                        if let config = eventsConfig,
                           let liveEvent = EventsConfigService.shared.calculateLiveEvent(config: config),
                           liveEvent.mediaItem.id == self.currentEventId {

                            let slotPosition = now.timeIntervalSince(liveEvent.startTime)
                            position = max(0, slotPosition)
                            self.eventStartTime = liveEvent.startTime

                            NSLog("✅ Using Global Live Schedule! Start: \(liveEvent.startTime), Pos: \(position)")

                        }
                        // 2. Try matching ANY scheduled event (e.g. if we are joining a friend in a previous/overlapping slot)
                        else if let scheduledEvent = appState.eventsSchedule.first(where: { $0.mediaItem.id == self.currentEventId }) {
                             let slotPosition = now.timeIntervalSince(scheduledEvent.startTime)
                             position = max(0, slotPosition)
                             self.eventStartTime = scheduledEvent.startTime

                             NSLog("✅ Using Specific Schedule Item! Start: \(scheduledEvent.startTime), Pos: \(position)")
                        }
                        else {
                            // 3. Fallback: Trust Room DB Position if available (Sync to Host)
                            if room.playbackPosition > 0 {
                                position = Double(room.playbackPosition)
                                NSLog("⚠️ Event Schedule Mismatch - Using Room DB Position: \(position)s")
                            } else {
                                // 4. Last resort: Room Creation Time (High risk of staleness for persistent rooms)
                                position = max(0, now.timeIntervalSince(room.createdAt) - buffer)
                                NSLog("⚠️ Using Room Creation Time (Fallback). Start: \(room.createdAt), Pos: \(position)")
                            }
                        }

                        self.resumeFromTimestamp = position

                        NSLog("🎉 Detected Event Room join! StartTime: \(room.createdAt), Pos: \(position)s")
                    }

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
                        if !roomId.hasPrefix("event_") {
                            self.resumeFromTimestamp = Double(room.playbackPosition)
                        }

                        // Play immediately
                        Task {
                            await self.playMedia(
                                self.selectedMediaItem!,
                                quality: .fullHD,
                                watchMode: .watchParty,
                                roomId: roomId,
                                isHost: false,
                                isEvent: roomId.hasPrefix("event_")
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

    // MARK: - Non-Isolated Helpers

    /// Performs room creation off the Main Actor to prevent UI blocking issues
    nonisolated private func performRoomCreation(
        roomManager: RoomManager,
        roomId: String,
        roomName: String,
        userId: UUID,
        hostUsername: String,
        mediaItem: MediaItem,
        finalSeason: Int?,
        finalEpisode: Int?,
        isPublic: Bool,
        description: String?
    ) async throws -> SupabaseRoom {
        NSLog("Background: ⏳ Starting room creation (Unstructured Race)...")

        // We use a continuation to allow returning *before* the network task completes/cancels
        return try await withCheckedThrowingContinuation { continuation in
            let continuationWrapper = ContinuationWrapper(continuation)

            // 1. The Network Task (Detached to avoid ANY context inheritance)
            Task.detached(priority: .userInitiated) {
                do {
                    NSLog("Background: ▶️ createRoom task started (Direct Singleton Access)")
                    // Bypass protocol witness table and capture - use Singleton directly
                    let r = try await SupabaseClient.shared.createRoom(
                        id: roomId,
                        name: roomName,
                        hostUserId: userId,
                        hostUsername: hostUsername,
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
                    NSLog("Background: ✅ createRoom task finished")
                    continuationWrapper.resume(returning: r)
                } catch {
                     NSLog("Background: ❌ createRoom task failed: \(error)")
                     continuationWrapper.resume(throwing: error)
                }
            }

            // 2. The Timeout Task
            Task {
                try? await Task.sleep(nanoseconds: 8_000_000_000) // 8 seconds
                NSLog("Background: ⏰ Timeout fired! Attempting to fail continuation...")
                continuationWrapper.resume(throwing: NSError(domain: "PlayerViewModel", code: -2, userInfo: [NSLocalizedDescriptionKey: "Room creation timed out"]))
            }
        }
    }

    // Thread-safe wrapper to ensure continuation is resumed exactly once
    private class ContinuationWrapper {
        private var continuation: CheckedContinuation<SupabaseRoom, Error>?
        private let lock = NSLock()

        init(_ continuation: CheckedContinuation<SupabaseRoom, Error>) {
            self.continuation = continuation
        }

        func resume(returning value: SupabaseRoom) {
            lock.lock()
            defer { lock.unlock() }
            if let c = continuation {
                c.resume(returning: value)
                continuation = nil
            }
        }

        func resume(throwing error: Error) {
            lock.lock()
            defer { lock.unlock() }
            if let c = continuation {
                c.resume(throwing: error)
                continuation = nil
            }
        }
    }
}
