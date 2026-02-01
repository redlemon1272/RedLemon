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
    @Published var currentWatchPartyRoom: WatchPartyRoom? { // Current lobby/room
        didSet {
            if currentWatchPartyRoom == nil {
                NSLog("⚠️ PlayerVM: currentWatchPartyRoom set to NIL. Stack Trace unavailable, but check recent logs.")
            } else if oldValue == nil {
                NSLog("✅ PlayerVM: currentWatchPartyRoom set to %@", currentWatchPartyRoom?.id ?? "unknown")
            }
        }
    }

    @Published var showPremiumLimitAlert: Bool = false // Alert for free user limit logic
    @Published var premiumLimitMessage: String? = nil // Store specific error message from backend

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

    // Internal state guards
    private var isExitInProgress = false

    // Subtitles
    @Published var hasAutoSelectedSubtitles: Bool = false

    // Auto-Play Control
    @Published var userCancelledAutoPlay: Bool = false
    @Published var lastAutoStartedSessionId: String? = nil // Persist auto-start session ID (Guest Loop Fix)
    @Published var playbackEndedTimestamp: Date? = nil // Persist end time to prevent grace period loops
    @Published var lastLobbyJoinBroadcast: Date? = nil // CRITICAL FIX (Security Check #93): Dedupe join broadcasts during VM recreation

    // Pre-resolved stream for Watch Party Optimization
    var preResolvedStream: Stream?

    func preloadStream(mediaItem: MediaItem, quality: VideoQuality, streamHash: String?, season: Int?, episode: Int?, preferredTitle: String? = nil, preferredProvider: String? = nil) async throws {
        // Run on main actor to update published properties if needed,
        // though we are mostly updating internal state here.
        await MainActor.run {
             self.isResolvingStream = true
        }
        defer {
            Task { @MainActor in self.isResolvingStream = false }
        }

        LoggingManager.shared.info(.watchParty, message: "⚡️ PlayerVM: Pre-loading stream for hash: \(streamHash ?? "nil") (Title: \(preferredTitle ?? "nil"))")

        // Step 1: Fetch metadata
        let metadata = try await metadataProvider.fetchMetadata(type: mediaItem.type, id: mediaItem.id)

        // Step 2: GUEST DIRECT UNLOCK OPTIMIZATION (v1.0.83)
        // If we have a preferredStreamHash from the host, skip full resolution and unlock directly.
        // This saves 8-10 seconds by avoiding redundant provider queries.
        if let directHash = streamHash, !directHash.isEmpty {
            NSLog("🚀 PlayerVM: Preload - Using DIRECT UNLOCK path (Guest Optimization)")

            // Clear RD cache for this hash to ensure a fresh link (IP-lock prevention)
            await RealDebridClient.shared.clearCache(forHash: directHash)

            let syntheticStream = Stream(
                title: preferredTitle ?? "Shared Stream (Direct)",
                provider: preferredProvider ?? "direct",
                infoHash: directHash
            )

            do {
                let unlockedStream = try await streamResolver.unlockStream(
                    stream: syntheticStream,
                    item: mediaItem,
                    season: season,
                    episode: episode,
                    bypassTorrentCache: true // Force fresh for Guest
                )

                await MainActor.run {
                    self.preResolvedStream = unlockedStream
                }
                LoggingManager.shared.info(.watchParty, message: "✅ PlayerVM: Direct unlock PRELOAD succeeded! URL: \(String(unlockedStream.url?.prefix(60) ?? "nil"))")
                return // SUCCESS
            } catch {
                NSLog("⚠️ PlayerVM: Preload direct unlock failed (%@), falling back to full resolution...", error.localizedDescription)
            }
        }

        // Step 3: Fallback - Resolve using metadata
        let result = try await streamResolver.resolveStream(
            item: mediaItem,
            quality: quality,
            season: season,
            episode: episode,
            metadata: metadata,
            preferredInfoHash: streamHash,
            preferredTitle: preferredTitle,
            preferredProvider: preferredProvider,
            filterExtended: false,
            triggerSource: "preload"
        )

        await MainActor.run {
            self.preResolvedStream = result.stream
        }
        LoggingManager.shared.info(.watchParty, message: "✅ PlayerVM: Stream pre-loaded successfully via resolution: \(result.stream.title)")
    }

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

    func playMedia(
        _ item: MediaItem,
        quality: VideoQuality,
        watchMode: WatchMode = .solo,
        roomId: String? = nil,
        isHost: Bool = false,
        isEvent: Bool = false,
        triggerSource: String = "manual",
        preferredStreamHash: String? = nil,
        preferredStreamTitle: String? = nil,
        preferredStreamProvider: String? = nil
    ) async {
        streamError = nil

        // Step 0: Clear state IMMEDIATELY to prevent stale UI
        selectedStream = nil // Clear previous stream to prevent stale playback
        streamQueue = [] // Clear stream queue
        playbackRetryCount = 0 // Reset retry count
        userCancelledAutoPlay = false // Reset auto-play cancellation

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
            releaseInfo: nil,
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

            // CRITICAL FIX: Clear background lobby sessions for solo playback
            // For Watch Parties, we MUST preserve the LobbyViewModel so the Player can inherit the Realtime manager.
            if let zombieVM = appState.activeLobbyViewModel {
                if watchMode == .solo {
                    NSLog("🧹 PlayerVM: Solo playback started. Clearing active lobby session: %@", zombieVM.room.id)
                    appState.setActiveLobbyViewModel(nil)
                } else {
                    NSLog("🤝 PlayerVM: Watch Party playback started. Preserving lobby session for handoff: %@", zombieVM.room.id)
                }
            }
        }

        // FIX: Enter fullscreen immediately for Watch Party mode
        // This ensures guests see the full-screen loading overlay with chat (matching host experience)
        // Previously, enterFullscreen() was only called after stream resolution (line ~548),
        // causing guests to see windowed mode with background art first.
        // Host path (navigateToPlayer) already enters fullscreen immediately.
        if watchMode == .watchParty {
            enterFullscreen()
        }

        do {
            LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Starting playback for: \(item.name)")
            LoggingManager.shared.debug(.videoRendering, message: "   Quality: \(quality.rawValue)")
            LoggingManager.shared.debug(.videoRendering, message: "   Mode: \(watchMode)")

            // Step 1: Fetch metadata immediately for UI feedback
            NSLog("📡 Fetching metadata for %@...", item.id)
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
                 NSLog("🎬 PlayerVM: Using Playlist Metadata: S%dE%d", effectiveSeason ?? 0, effectiveEpisode ?? 0)
            }

            // Step 2: Resolve stream (Optimized for Guest)
            var resolvedStream: Stream? = self.preResolvedStream // Check pre-load first
            var resolvedMetadata: MediaMetadata? = metadata

            if let pre = resolvedStream {
                 NSLog("🚀 PlayerVM: Using pre-resolved stream (Zero-Wait Start)")
                 NSLog("   Pre-resolved URL: %@", String(pre.url?.prefix(80) ?? "nil"))
                 // Clear it after use so we don't reuse it for next media
                 self.preResolvedStream = nil
            } else {
                // ... Normal Logic ...

            // GUEST DIRECT UNLOCK OPTIMIZATION (v1.0.83)
            // If we have a preferredStreamHash from the host, skip full resolution and unlock directly.
            // This saves 8-10 seconds by avoiding redundant provider queries.
            // Documentation Security Check #44 compliance: We still get a fresh RD URL (IP-locked to guest),
            // we just skip the stream discovery phase since we already know the exact hash.
            if let directHash = preferredStreamHash, !directHash.isEmpty, !isHost, watchMode == .watchParty {
                NSLog("🚀 PlayerVM: Using DIRECT UNLOCK path (Guest Optimization)")
                NSLog("   Hash: %@...", String(directHash.prefix(12)))

                // CRITICAL: Clear RD cache BEFORE unlock to prevent IP-locked URL reuse
                // This fixes the race condition where LobbyEventRouter's async cache clear
                // hasn't completed yet when we call unlockStream.
                await RealDebridClient.shared.clearCache(forHash: directHash)
                NSLog("🗑️ PlayerVM: RD cache cleared for direct unlock")

                // Create synthetic stream with just the hash for unlocking
                let syntheticStream = Stream(
                    title: "Shared Stream (Direct)",
                    provider: "direct",
                    infoHash: directHash
                )

                do {
                    // CRITICAL UPDATE (Security Check #44): We generally cannot bypass RD's server-side cache.
                    // The "magnet unrestrict" endpoint does not exist.
                    var unlockedStream = try await streamResolver.unlockStream(
                        stream: syntheticStream,
                        item: item,
                        season: effectiveSeason,
                        episode: effectiveEpisode,
                        bypassTorrentCache: false // Feature disabled (Dead Endpoint)
                    )
                    NSLog("✅ PlayerVM: Direct unlock succeeded! URL: %@", String(unlockedStream.url?.prefix(60) ?? "nil"))

                    // FIX: Fetch SubDL subtitles for direct unlock path (Security Check #45)
                    // The direct unlock optimization bypasses resolveStream() where subtitles are normally attached.
                    // We need to fetch them separately to ensure guests see SubDL subtitles in the menu.
                    do {
                        // Build stream hint from room data (RD URLs are truncated)
                        var streamHint = item.name.replacingOccurrences(of: " ", with: ".")
                        if let room = currentWatchPartyRoom {
                            let source = (room.selectedStreamTitle ?? room.sourceQuality) ?? ""
                            let quality = room.selectedQuality ?? ""
                            if !source.isEmpty || !quality.isEmpty {
                                // Prioritize full release name (source) if available
                                if source.count > 15 {
                                    streamHint = source.lowercased()
                                } else {
                                    streamHint = "\(item.name.replacingOccurrences(of: " ", with: ".")).\(quality).\(source)".lowercased()
                                }
                            }
                        }

                        let subDLSubtitles = try await LocalAPIClient.shared.searchSubtitles(
                            imdbId: item.id,
                            type: item.type,
                            season: effectiveSeason,
                            episode: effectiveEpisode,
                            name: item.name,
                            year: (item.year ?? metadata.year).flatMap { Int($0) },
                            streamFilename: streamHint
                        )

                        if !subDLSubtitles.isEmpty {
                            NSLog("✅ Direct Unlock: Found %d SubDL subtitles", subDLSubtitles.count)

                            let externalSubs = subDLSubtitles.map { sub -> Subtitle in
                                let encodedPath = Data(sub.url.utf8).base64EncodedString()
                                var proxyURL = LocalAPIClient.shared.getSubtitleURL(
                                    downloadPath: sub.url,
                                    season: effectiveSeason,
                                    episode: effectiveEpisode,
                                    streamFilename: streamHint
                                )
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

                            unlockedStream.subtitles = (unlockedStream.subtitles ?? []) + externalSubs
                            NSLog("✅ Direct Unlock: Attached %d SubDL subtitles to stream", externalSubs.count)
                        }
                    } catch {
                        NSLog("⚠️ Direct Unlock: Subtitle search failed: %@", error.localizedDescription)
                        // Non-fatal: Continue with stream even without SubDL subtitles
                    }

                    resolvedStream = unlockedStream
                    resolvedMetadata = metadata
                } catch {
                    NSLog("⚠️ PlayerVM: Direct unlock failed (%@), falling back to full resolution...", error.localizedDescription)
                    // resolvedStream stays nil, falls through to normal resolution below
                }
            }

            // CRITICAL: Skip remaining resolution if we already have a stream (from direct unlock)
            if resolvedStream == nil {

            // GUEST OPTIMIZATION
            // First check if host's URL is still valid (RD links expire after ~30min inactivity)
            var validatedHostURL: String? = nil
            /*
            // GUEST OPTIMIZATION - DISABLED (Causes EOF on RealDebrid due to IP Locking)
            // RealDebrid links are IP-locked to the creator. If we reuse the Host's URL, remote guests get dropped.
            // We must force resolution via the Hash fallback below.

            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               (roomId == nil || watchPartyRoom.id.caseInsensitiveCompare(roomId ?? "") == .orderedSame), // OK
               let hostUnlockedURL = watchPartyRoom.unlockedStreamURL {

                // Quick HEAD request to validate URL (Documentation #27: 3s timeout)
                NSLog("%@", "🔍 GUEST: Validating host's stream URL...")
                var urlValid = false
                if let url = URL(string: hostUnlockedURL) {
                    var request = URLRequest(url: url)
                    request.httpMethod = "HEAD"
                    request.timeoutInterval = 3

                    do {
                        let (_, response) = try await URLSession.shared.data(for: request)
                        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                            urlValid = true
                            NSLog("%@", "✅ GUEST: Host's URL is valid (HTTP 200)")
                        } else {
                            NSLog("%@", "⚠️ GUEST: Host's URL returned non-200, will re-resolve")
                        }
                    } catch {
                        NSLog("%@", "⚠️ GUEST: Host's URL validation failed: \(error.localizedDescription)")
                    }
                }

                if urlValid {
                    validatedHostURL = hostUnlockedURL
                }
            }
            */

            if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
               (roomId == nil || watchPartyRoom.id.caseInsensitiveCompare(roomId ?? "") == .orderedSame), // OK
               let hostUnlockedURL = validatedHostURL { // Use VALIDATED URL

                let hostStreamHash = watchPartyRoom.selectedStreamHash

                let hostQuality = watchPartyRoom.selectedQuality ?? "Unknown" // Relaxed check

                LoggingManager.shared.info(.watchParty, message: "[SYNC VERIFICATION] LOCKING TO SHARED STREAM (SYSTEM/HOST) 🔒")
                NSLog("%@", "🎬 GUEST: Using host's stream selection (skipping resolution)")

                // Extract filename from URL for better metadata
                let filename = URL(string: hostUnlockedURL)?.lastPathComponent.removingPercentEncoding ?? "Host Stream"

                // Fallback: Detect quality from filename if room state is missing it
                var finalQuality = hostQuality
                if hostQuality == "Unknown" || hostQuality.isEmpty {
                    finalQuality = Stream.detectVideoQuality(from: filename)
                    NSLog("⚠️ GUEST: Detected quality from filename: %@", finalQuality)
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
                // Fetch subtitles from SubDL via local server, passing stream info for release-type matching

                // Build stream filename for subtitle matching
                // Real-Debrid URLs are truncated (e.g., /d/xxx/TR), so use room's sourceQuality as hint
                var streamHint = filename
                NSLog("%@", "📝 GUEST: Extracted filename='\(filename)' (len=\(filename.count)), sourceQuality=\(watchPartyRoom.sourceQuality ?? "nil"), selectedQuality=\(watchPartyRoom.selectedQuality ?? "nil"), selectedStreamTitle=\(watchPartyRoom.selectedStreamTitle ?? "nil")")
                if filename.count < 15 || filename == "Host Stream" {
                    // URL filename is truncated, construct from room data
                    let source = (watchPartyRoom.selectedStreamTitle ?? watchPartyRoom.sourceQuality) ?? ""
                    let quality = watchPartyRoom.selectedQuality ?? ""

                    // Prioritize full release name (source) if available
                    if source.count > 15 {
                        streamHint = source.lowercased()
                    } else {
                        // Build a release-like string: "Movie.Name.1080p.WEB-DL"
                        streamHint = "\(item.name.replacingOccurrences(of: " ", with: ".")).\(quality).\(source)".lowercased()
                    }
                    NSLog("%@", "📝 GUEST: Using enhanced stream hint for subtitle matching: \(streamHint)")
                }

                do {
                    let subDLSubtitles = try await LocalAPIClient.shared.searchSubtitles(
                        imdbId: item.id,
                        type: item.type,
                        season: effectiveSeason, // Use derived playlist metadata
                        episode: effectiveEpisode, // Use derived playlist metadata
                        name: item.name,
                        year: (item.year ?? metadata.year).flatMap { Int($0) }, // Fallback to metadata year
                        streamFilename: streamHint // Pass stream hint for release-type matching
                    )

                    NSLog("✅ GUEST: Found %d subtitles", subDLSubtitles.count)

                    // Convert to Subtitle objects
                    let externalSubs = subDLSubtitles.enumerated().map { (index, sub) -> Subtitle in
                        let encodedPath = Data(sub.url.utf8).base64EncodedString()

                        // Route through local server proxy to handle zip extraction and VTT conversion
                        let pUrl = LocalAPIClient.shared.getSubtitleURL(downloadPath: sub.url, season: watchPartyRoom.season, episode: watchPartyRoom.episode, streamFilename: streamHint)

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

                } catch {
                    NSLog("❌ GUEST: Subtitle search failed for %@: %@", item.name, error.localizedDescription)
                }

                resolvedStream = hostStream

            } else if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
                      (roomId == nil || watchPartyRoom.id.caseInsensitiveCompare(roomId ?? "") == .orderedSame), // OK
                      let hostStreamHash = watchPartyRoom.selectedStreamHash {

                 // PARTIAL LOCK (Hash only)
                 LoggingManager.shared.info(.watchParty, message: "[SYNC VERIFICATION] LOCKING TO SHARED STREAM (HASH ONLY) 🔒")

                 let result = try await streamResolver.resolveStream(
                     item: item,
                     quality: quality,
                     season: effectiveSeason, // Use effective variables
                     episode: effectiveEpisode, // Use effective variables
                     metadata: metadata,
                     preferredInfoHash: hostStreamHash,
                     preferredTitle: nil, // Have hash, don't need title fallback
                     preferredProvider: preferredStreamProvider, // Optimization
                     filterExtended: false,
                     triggerSource: triggerSource
                 )
                 resolvedStream = result.stream
                 resolvedMetadata = result.metadata
                 Task { @MainActor in self.streamQueue = result.candidateStreams }

            // Internal Note #91: Title-based fallback when hash is nil (DebridSearch streams)
            } else if !isHost, watchMode == .watchParty, let watchPartyRoom = currentWatchPartyRoom,
                      (roomId == nil || watchPartyRoom.id.caseInsensitiveCompare(roomId ?? "") == .orderedSame), // OK
                      watchPartyRoom.selectedStreamHash == nil,
                      let hostStreamTitle = watchPartyRoom.selectedStreamTitle, !hostStreamTitle.isEmpty {

                 // TITLE-BASED LOCK (For DebridSearch / no-hash providers)
                 LoggingManager.shared.info(.watchParty, message: "[SYNC VERIFICATION] LOCKING TO SHARED STREAM (TITLE FALLBACK) 🔒")
                 NSLog("🔗 GUEST: Using title fallback for stream matching: %@", hostStreamTitle.prefix(50).description)

                 let result = try await streamResolver.resolveStream(
                     item: item,
                     quality: quality,
                     season: effectiveSeason,
                     episode: effectiveEpisode,
                     metadata: metadata,
                     preferredInfoHash: nil, // No hash available
                     preferredTitle: hostStreamTitle, // Use title for matching
                     preferredProvider: preferredStreamProvider, // Targeted search
                     filterExtended: false,
                     triggerSource: triggerSource
                 )
                 resolvedStream = result.stream
                 resolvedMetadata = result.metadata
                 Task { @MainActor in self.streamQueue = result.candidateStreams }

            } else {
                // Standard resolution with Auto-Retry
                let maxRetries = 3
                var lastError: Error?

                for attempt in 1...maxRetries {
                    // Check cancellation
                    if Task.isCancelled { throw CancellationError() }

                    if attempt > 1 {
                         LoggingManager.shared.info(.network, message: "Stream Resolution: Retry attempt \(attempt)/\(maxRetries)...")
                         // Wait 2s between retries (gives providers time to recover)
                         try? await Task.sleep(nanoseconds: 2_000_000_000)
                    }

                    do {
                        let result = try await streamResolver.resolveStream(
                            item: item,
                            quality: quality,
                            season: effectiveSeason, // Use effective variables
                            episode: effectiveEpisode, // Use effective variables
                            metadata: metadata,
                            preferredInfoHash: preferredStreamHash,
                            preferredTitle: preferredStreamTitle,
                            preferredProvider: preferredStreamProvider,
                            filterExtended: false,
                            triggerSource: triggerSource
                        )

                        resolvedStream = result.stream
                        resolvedMetadata = result.metadata

                        // Capture safe copy of candidates for the actor boundary
                        let candidateStreams = result.candidateStreams

                        Task { @MainActor in
                            self.streamQueue = candidateStreams
                        }

                        // Success! Break the loop
                        break
                    } catch {
                        LoggingManager.shared.warn(.network, message: "Resolution failed on attempt \(attempt): \(error.localizedDescription)")
                        lastError = error

                        // Only retry specific transient errors
                        // 1. No streams found (e.g. provider aggregation failed initially)
                        // 2. Network timeouts
                        // 2. Network timeouts
                        let isRetryable: Bool = {
                            if let apiError = error as? APIError, case .noStreamsFound = apiError { return true }
                            if (error as? URLError)?.code == .timedOut { return true }
                            return error.localizedDescription.contains("timed out")
                        }()

                        if !isRetryable {
                            throw error // Fatal error, don't retry
                        }
                    }
                }

                // If we still don't have a stream after retries, throw the last error
                // If we still don't have a stream after retries, throw the last error
                if resolvedStream == nil {
                    throw lastError ?? APIError.noStreamsFound
                }
            }

            } // End: if resolvedStream == nil (skip if already resolved from direct unlock)

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
            LoggingManager.shared.error(.videoRendering, message: "Playback error: \(error)")
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
            LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Preloading playback for: \(item.name)")

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
                    preferredTitle: nil,
                    preferredProvider: nil,
                    filterExtended: false,
                    triggerSource: "preload"
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
            LoggingManager.shared.error(.videoRendering, message: "Preload error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
                isPreloading = false
            }
        }
    }

    func startPreloadedPlayback() {
        guard isPreloading else { return }
        LoggingManager.shared.info(.videoRendering, message: "Starting preloaded playback")
        isPreloading = false
    }

    // Resolve and persist stream BEFORE starting watch party
    func resolveAndPersistForWatchParty(mediaItem: MediaItem, quality: VideoQuality, roomId: String, season: Int? = nil, episode: Int? = nil, preferredTitle: String? = nil, preferredProvider: String? = nil) async throws -> Stream {
        LoggingManager.shared.info(.watchParty, message: "Resolving & Persisting stream for Watch Party Room: \(roomId) (Preferred Title: \(preferredTitle ?? "nil"))")

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
                LoggingManager.shared.info(.network, message: "Watch Party Resolve: Retry attempt \(attempt)/\(maxRetries)...")
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
                    preferredInfoHash: nil, // We resolve fresh to find candidate pool
                    preferredTitle: preferredTitle,
                    preferredProvider: preferredProvider,
                    filterExtended: false,
                    triggerSource: "watch_party_resolve"
                )

                // Populate failover queue for Host
                await MainActor.run {
                    self.streamQueue = result.candidateStreams
                    LoggingManager.shared.debug(.watchParty, message: "Watch Party Queue: Loaded \(result.candidateStreams.count) candidate streams for failover")
                }

                // Build retry queue: Primary + Candidates
                let streamsToTry = [result.stream] + result.candidateStreams

                if streamsToTry.isEmpty {
                    throw APIError.noStreamsFound
                }

                LoggingManager.shared.info(.videoRendering, message: "Stream Resolution (Attempt \(attempt)): Found \(streamsToTry.count) streams to attempt unlock...")

                // Try to unlock candidates
                for (index, stream) in streamsToTry.enumerated() {
                    if Task.isCancelled { throw CancellationError() }

                    do {
                        if index > 0 {
                            LoggingManager.shared.debug(.videoRendering, message: "Candidate #\(index): \(stream.title)")
                        }

                        unlockedStream = try await streamResolver.unlockStream(
                            stream: stream,
                            item: mediaItem,
                            season: targetSeason,
                            episode: targetEpisode,
                            bypassTorrentCache: nil
                        )

                        LoggingManager.shared.info(.videoRendering, message: "Successfully unlocked stream on attempt \(attempt) (Candidate #\(index))")
                        break // Break unlock loop
                    } catch {
                        LoggingManager.shared.warn(.videoRendering, message: "Unlock failed for candidate #\(index): \(error.localizedDescription)")

                        // Smart Retry: Mark this hash as bad so we don't try it again this session
                        if let hash = stream.infoHash {
                             Task { await StreamService.shared.markStreamAsAttempted(imdbId: mediaItem.id, hash: hash) }
                        }

                        lastError = error
                        continue // Try next candidate
                    }
                }

                // If we found a stream, break the retry loop
                if unlockedStream != nil {
                    break
                }

            } catch {
                LoggingManager.shared.warn(.network, message: "Resolution failed on attempt \(attempt): \(error.localizedDescription)")
                lastError = error
            }
        }

        guard let finalStream = unlockedStream else {
            LoggingManager.shared.error(.videoRendering, message: "All Watch Party resolution attempts failed.")
            throw lastError ?? APIError.noStreamsFound
        }

        // Persist
        LoggingManager.shared.info(.watchParty, message: "Persisting resolved stream to room \(roomId)...")

        await MainActor.run {
            self.selectedMetadata = metadata

            if var room = self.currentWatchPartyRoom {
                room.selectedStreamHash = finalStream.infoHash
                room.selectedFileIdx = finalStream.fileIdx
                room.selectedQuality = finalStream.quality
                room.selectedStreamTitle = finalStream.title // Internal Note #91: Fallback for title matching
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
            sourceQuality: finalStream.title, // Internal Note #91: Fallback for Guest matching when hash is nil
            resetPlayback: true // RESET STATE: Ensure room is paused/lobby for new media
        )

        LoggingManager.shared.info(.watchParty, message: "Stream persisted! Hash: \(finalStream.infoHash ?? "nil"), Title: \(finalStream.title)")
        return finalStream
    }

    func playSelectedStream(_ stream: Stream, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false, forceFresh: Bool = false) async {
        guard let mediaItem = selectedMediaItem else {
            streamError = "No media item selected"
            return
        }

        streamError = nil
        playbackRetryCount = 0 // Reset retry count for manual selections

        do {
            LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Starting playback with selected stream: \(stream.title)")

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
                episode: episode,
                bypassTorrentCache: forceFresh
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
                NSLog("📡 Persisting stream selection to room %@", roomId)

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
                            sourceQuality: unlockedStream.title, // Internal Note #91
                            resetPlayback: true // RESET STATE: Manual stream change implies new session start
                        )
                    } catch {
                        LogManager.shared.error("❌ Failed to persist stream selection to room \(roomId)", error: error)
                    }
                }
            }

            enterFullscreen()

        } catch {
            LoggingManager.shared.error(.videoRendering, message: "Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
                isResolvingStream = false
            }
        }
    }

    func handlePlaybackError(_ error: String) {
        LoggingManager.shared.warn(.videoRendering, message: "PlayerVM: Handling playback error: \(error)")

        // Check for transient "Playback Timeout" error
        if error.contains("Timeout") {
            // RedLemon: Increased retry limit to 3 (was 1) for better stability
            if playbackRetryCount < 3 && selectedStream != nil {
                playbackRetryCount += 1
                LoggingManager.shared.info(.videoRendering, message: "Transient Timeout detected. Retrying current stream (Attempt \(playbackRetryCount)/3)...")

                // Silent retry of the SAME stream
                Task { @MainActor in
                    if let stream = self.selectedStream {
                         // Re-lock (refresh URL) and play
                         await self.playSelectedStream(stream, watchMode: self.currentWatchMode, roomId: self.currentRoomId, isHost: self.isWatchPartyHost)
                    }
                }
                return
            } else {
                 LoggingManager.shared.warn(.videoRendering, message: "Timeout retry limit reached or no stream selected. Proceeding to fallback.")
            }
        }

        // CRITICAL FIX (Security Check #44): Premature EOF Logic (Purge Retry)
        if error == "PREMATURE_EOF" {
            LoggingManager.shared.error(.videoRendering, message: "PlayerVM: Handling PREMATURE_EOF - Triggering PURGE retry.")

            // If we have a stream selected, try to replay it with FORCE FRESH (Purge) mode
            if let stream = self.selectedStream {
                Task { @MainActor in
                     // Wait a moment for UI to reflect loading
                     try? await Task.sleep(nanoseconds: 500_000_000)
                     await self.playSelectedStream(stream, watchMode: self.currentWatchMode, roomId: self.currentRoomId, isHost: self.isWatchPartyHost, forceFresh: true)
                }
                return
            }
        }

        // Default: Try next stream in queue
        if let currentStream = selectedStream, let hash = currentStream.infoHash, let item = selectedMediaItem {
             LoggingManager.shared.info(.videoRendering, message: "Marking failed stream hash as attempted/bad: \(hash.prefix(8))")
             Task { await StreamService.shared.markStreamAsAttempted(imdbId: item.id, hash: hash) }
        }

        tryNextStream()
    }

    // MARK: - Watch Party Failover (Host)

    /// Blocks the current stream and returns all participants to the lobby.
    /// Used by Watch Party hosts when a bad file is encountered.
    func tryAnotherStreamForWatchParty(hash: String, filename: String?, provider: String?) {
        guard isWatchPartyHost else { return }

        LoggingManager.shared.warn(.watchParty, message: "Host is reporting/excluding stream and returning to lobby: \(hash)")

        Task {
            // 1. Report the stream globally (non-destructive flagging for admins)
            await SupabaseClient.shared.reportStream(
                imdbId: selectedMediaItem?.id ?? "unknown",
                season: selectedSeason ?? -1,
                episode: selectedEpisode ?? -1,
                quality: selectedQuality.rawValue,
                streamHash: hash,
                reason: "Inaccurate/Broken file (Host reported via Watch Party)",
                movieTitle: selectedMetadata?.title,
                filename: filename,
                provider: provider
            )

            // 2. Mark stream as attempted locally (session-level exclusion)
            // This ensures the next resolution for this title avoids this specific file.
            if let imdbId = selectedMediaItem?.id {
                await StreamService.shared.markStreamAsAttempted(
                    imdbId: imdbId,
                    hash: hash,
                    title: filename ?? selectedStream?.title, // Use filename/title fallback
                    size: selectedStream?.size,
                    provider: provider
                )
            }

            // 3. Clear room playback state in DB so "Start" button is visible for everyone
            if let roomId = currentRoomId {
                try? await SupabaseClient.shared.updateRoomPlayback(roomId: roomId, position: 0, isPlaying: false)
            }

            // 4. Broadcast LOBBY_RETURN to all participants
            // This ensures everyone sees the "Returning to Lobby..." overlay and transitions together.
            if let roomId = currentRoomId {
                let msg = SyncMessage(
                    type: .returnToLobby, // Typed message for stability
                    timestamp: Date().timeIntervalSince1970,
                    isPlaying: false,
                    senderId: SupabaseClient.shared.auth.currentUser?.id.uuidString ?? "host",
                    chatText: "LOBBY_RETURN", // Legacy fallback
                    chatUsername: "Host"
                )

                // Broadcast to the watch-party topic (matching RealtimeChannelManager standard)
                try? await SupabaseClient.shared.realtimeClient.broadcast(
                    topic: "watch-party:\(roomId)",
                    event: "sync",
                    payload: msg.dictionary ?? [:]
                )
            }

            // 5. Small delay to ensure message propagates through Realtime
            // This mirrors triggerReturnToLobby for a smooth transition logic.
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s

            // 3. Exit player and return to lobby locally
            await exitPlayer(keepRoomState: true, notifyGuests: false)
        }
    }

    /// Explicitly rejects the current stream (Solo Mode) and tries the next one.
    /// This ensures the rejected hash is recorded in StreamService so it isn't picked up again by emergency resolution.
    func tryAnotherStream() {
        guard let imdbId = selectedMediaItem?.id else {
            tryNextStream()
            return
        }

        let stream = selectedStream
        let hash = stream?.infoHash ?? ""
        let title = stream?.title
        let size = stream?.size
        let provider = stream?.provider

        LoggingManager.shared.info(.videoRendering, message: "PlayerVM: User requested another stream. Excluding current file: \(title ?? "unknown")")

        Task {
            // 1. Mark as attempted globally for this session
            await StreamService.shared.markStreamAsAttempted(
                imdbId: imdbId,
                hash: hash,
                title: title,
                size: size,
                provider: provider
            )

            await MainActor.run {
                // 2. Filter out the blocked hash from the existing queue to avoid retrying it immediately
                self.streamQueue.removeAll { s in
                    if let h = s.infoHash, !h.isEmpty, let targetHash = hash as String?, !targetHash.isEmpty {
                        return h == targetHash
                    } else {
                        // Hashless fallback (3-factor composite matching)
                        return s.title == title && s.size == size
                    }
                }

                // 3. Try next
                self.tryNextStream()
            }
        }
    }

    func tryNextStream() {
        if streamQueue.isEmpty {
            // CRITICAL: Failover for Guests (or initial failure)
            // If we are a guest and the host's stream failed (queue empty),
            // OR if we just ran out of streams, try to resolve fresh streams as a last resort.
            // We verify 'isResolvingStream' to prevent infinite loops if resolution itself returns empty.
            if !isResolvingStream {
                LoggingManager.shared.warn(.videoRendering, message: "PlayerVM: Stream queue empty. Attempting emergency resolution...")
                Task { @MainActor in
                    self.isResolvingStream = true
                    do {
                       guard let item = self.selectedMediaItem else { throw APIError.noStreamsFound }
                       let season = self.selectedMediaItem?.type == "series" ? self.selectedSeason : nil
                       let episode = self.selectedMediaItem?.type == "series" ? self.selectedEpisode : nil

                       // Resolve fresh streams
                       // Note: We use the existing resolve logic which will fetch providers
                       let result = try await self.streamResolver.resolveStream(
                           item: item,
                           quality: self.selectedQuality ?? .fullHD,
                           season: season,
                           episode: episode,
                           metadata: self.selectedMetadata ?? nil,
                           preferredInfoHash: nil, // Don't force the failed hash
                           preferredTitle: nil,
                           preferredProvider: nil,
                           filterExtended: false,
                           triggerSource: "emergency_resolve"
                       )

                       // Populate queue
                       self.streamQueue = result.candidateStreams.dropFirst().map { $0 } // Candidates
                       let primary = result.stream

                       if self.streamQueue.isEmpty && primary == nil {
                           throw APIError.noStreamsFound
                       }

                       LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Emergency resolution found \(self.streamQueue.count + 1) streams.")
                       self.isResolvingStream = false

                       // If we found a primary, try it (or add to queue and recursive call?)
                       // Let's treat the new primary as the next stream
                       self.streamQueue.insert(primary, at: 0)
                       self.tryNextStream()

                    } catch {
                       LoggingManager.shared.error(.videoRendering, message: "PlayerVM: Emergency resolution failed: \(error)")
                       self.isResolvingStream = false
                       self.streamError = "Playback Failed: No working streams found."
                    }
                }
                return
            } else {
                 LoggingManager.shared.warn(.videoRendering, message: "PlayerVM: No more streams in queue and resolution already attempted. Playback failed.")
                 self.streamError = "Playback Failed: No working streams found."
                 return
            }
        }

        let nextStream = streamQueue.removeFirst()
        LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Falling back to next stream: \(nextStream.title)")


        Task { @MainActor in
             // RedLemon: Silent retry (no UI flash)
             LoggingManager.shared.info(.videoRendering, message: "Silently retrying next stream (\(self.streamQueue.count + 1) left)")
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
                    episode: episode,
                    bypassTorrentCache: nil
                )

                // Step 2: Update Selected Stream (Triggers Player Reload)
                await MainActor.run {
                    self.selectedStream = unlockedStream
                    self.streamError = nil // Clear error if unlock succeeded
                    // Note: MPVPlayerView should react to this change if the parent view passes the new binding/data

                    // CRITICAL: If Host, persist new stream selection to Room so guests follow
                    if self.isWatchPartyHost, let room = self.currentWatchPartyRoom, let roomId = self.currentRoomId {
                        LoggingManager.shared.warn(.watchParty, message: "Watch Party Failover: Persisting new stream to room \(roomId)...")

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
                                    sourceQuality: unlockedStream.title, // Internal Note #91
                                    resetPlayback: true // RESET STATE: Failover needs to sync guests to new file
                                )
                                LoggingManager.shared.info(.watchParty, message: "Watch Party Failover: Room updated successfully")
                            } catch {
                                LoggingManager.shared.error(.watchParty, message: "Watch Party Failover: Failed to update room: \(error)")
                            }
                        }
                    }
                }

            } catch {
                LoggingManager.shared.error(.videoRendering, message: "PlayerVM: Fallback stream failed to unlock: \(error.localizedDescription)")
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

        // CRITICAL: Entry Stabilization
        // If we just returned from a failover, wait a tiny bit for the lobby window to settle
        // before slamming it back into fullscreen.
        Task {
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
            await MainActor.run {
                enterFullscreen()
            }
        }
    }

    func exitPlayer(keepRoomState: Bool = false, notifyGuests: Bool = true) async {
        // 1. Idempotency Check - prevent multiple simultaneous exit calls (Security Check #82)
        // This stops the dual-trigger from MPVPlayerView (onDisappear + manual click)
        // or concurrent failover triggers.
        guard showPlayer && !isExitInProgress else {
            LoggingManager.shared.debug(.general, message: "Player already exited/exiting, skipping duplicate call")
            return
        }
        isExitInProgress = true
        defer { isExitInProgress = false }

        LoggingManager.shared.info(.videoRendering, message: "PlayerVM: exitPlayer called (keepRoomState: \(keepRoomState), notifyGuests: \(notifyGuests))")

        // Capture state before ANY property resets
        let wasFullscreen = NSApplication.shared.windows.first(where: { $0.isVisible && $0.styleMask.contains(.fullScreen) }) != nil
        let wasEvent = isEventPlayback
        let wasWatchParty = currentWatchMode == .watchParty

        // 2. Start window transition IMMEDIATELY
        exitFullscreen()

        // 3. CRITICAL: Exit Stabilization (Security Check #82)
        // We MUST wait for the OS to start the fullscreen exit animation before we clear 'showPlayer'.
        // This is mandatory for all exits from Fullscreen, including Watch Party Failovers.
        // Failing to do this causes the "Zoomed In UI" bug where the next player instance inherits a fluid window scale.
        if wasFullscreen {
            LoggingManager.shared.debug(.videoRendering, message: "PlayerVM: Enforcing window stabilization delay (0.5s)")
            try? await Task.sleep(nanoseconds: 500_000_000) // Increased to 0.5s for safety
        }

        // 4. Lobby State Sync (Keep this before clearing showPlayer)
        if keepRoomState {
             appState?.activeLobbyViewModel?.markPlaybackEnded()
             if isWatchPartyHost && notifyGuests {
                  appState?.activeLobbyViewModel?.announceReturnToLobby()
             }
        }
        else {
             if let roomId = currentRoomId {
                 LoggingManager.shared.info(.watchParty, message: "Leaving room: \(roomId)")
             }
        }

        // 4. Update UI State - now that window has stabilized
        await MainActor.run {
            withAnimation(.easeInOut(duration: 0.3)) {
                showPlayer = false
                selectedStream = nil
                selectedMediaItem = nil
                // Note: We don't clear selectedMetadata immediately as it looks nice for transitions

                if !keepRoomState {
                    currentRoomId = nil
                    currentWatchPartyRoom = nil // Clear stale room state
                    currentWatchMode = .solo
                    isWatchPartyHost = false

                    // Clear persistent lobby session
                    if let appState = appState {
                        appState.setActiveLobbyViewModel(nil)
                    }
                }

                isEventPlayback = false // Reset event flag
                eventStartTime = nil // FIX: Clear event start time on explicit exit
                resumeFromTimestamp = nil // FIX: Clear resume timestamp

                // 5. Navigate back
                if !keepRoomState {
                    if wasEvent {
                       appState?.currentView = .events
                    } else if wasWatchParty {
                       appState?.currentView = .rooms
                    } else {
                       // Optimization: Signal BrowseView to defer heavy rendering
                       appState?.isReturningFromPlayer = true
                       appState?.currentView = .browse

                       // Reset flag after transition (handled by View but good safety)
                    }
                } else {
                    // CRITICAL: Return to lobby if keeping room state (Watch Party)
                    // This ensures guests see the lobby UI instead of a black screen after video ends
                    appState?.currentView = .watchPartyLobby
                }
            }

            // 6. Final Window Polish
            // ONLY restore window size if we were NOT in fullscreen.
            // If we WERE in fullscreen, exitFullscreen() (via toggleFullScreen) handles the restore.
            // Calling this during the OS switch creates a second, competing animation (horrific jitter).
            if !wasFullscreen {
                WindowManager.shared.restoreWindowSize()
            }

            // Check for deferred schedule update notification
            appState?.checkPendingScheduleUpdate()
        }
    }

    func handleMovieFinished() async {
        LoggingManager.shared.debug(.videoRendering, message: "PlayerVM.handleMovieFinished() called")

        // Auto-play next episode logic
        if let item = selectedMediaItem, item.type == "series",
           let meta = selectedMetadata, let videos = meta.videos {

            // Check if we have a next episode available
            let (targetS, targetE) = findNextEpisode(currentS: selectedSeason ?? 1, currentE: selectedEpisode ?? 1, videos: videos)

            if let s = targetS, let e = targetE {
                // Fix: Watch Parties must return to lobby (no auto-play)
                if currentWatchMode == .watchParty {
                    LoggingManager.shared.info(.watchParty, message: "Series playback finished in Watch Party - returning to lobby (skipping auto-play)")
                } else {
                    // Check if user explicitly cancelled auto-play (via UI prompt)
                    if userCancelledAutoPlay {
                        LoggingManager.shared.info(.videoRendering, message: "Auto-play cancelled by user. Exiting player.")
                        await exitPlayer(keepRoomState: false)
                        return
                    }

                    LoggingManager.shared.info(.videoRendering, message: "Series playback finished, auto-playing next episode: S\(s)E\(e)")

                    // Binge Blocking: Free hosts cannot auto-play next episode in Watch Parties
                    // (Note: This is technically redundant now given the check above, but kept for logic safety if mode changes)
                    let isPremium = SupabaseClient.shared.auth.currentUser?.isPremium ?? false
                    if isWatchPartyHost && !isPremium {
                        LoggingManager.shared.warn(.watchParty, message: "Auto-play blocked (Free Tier Host)")
                        await exitPlayer(keepRoomState: false)
                        return
                    }

                    // Add a small delay for better UX
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    await playNextEpisode()
                    return
                }
            }
        }

        // Premature EOF Detection for System Events
        if isEventPlayback, let start = eventStartTime, let metadata = selectedMetadata {
             // START: RELAXED EOF CHECK
             // Original logic was too strict (300s/5min tolerance) which caused infinite loops
             // when metadata runtime (IMDb) didn't match actual file runtime (e.g. different cuts, long credits).

             let cleanedRuntime = (metadata.runtime ?? "0").filter { "0123456789.".contains($0) }
             let runtimeMinutes = Double(cleanedRuntime) ?? 0
             let runtimeSeconds = runtimeMinutes * 60

             if runtimeSeconds > 0 {
                  let now = Date()
                  let timeSinceStart = now.timeIntervalSince(start)
                  let timeRemaining = runtimeSeconds - timeSinceStart

                  // Calculate percentage of expected runtime completed
                  let percentCompleted = (timeSinceStart / runtimeSeconds) * 100

                  LoggingManager.shared.debug(.videoRendering, message: "Event EOF Check: Metadata Runtime: \(Int(runtimeMinutes))m, Time Since Start: \(Int(timeSinceStart))s, Remaining: \(Int(timeRemaining))s (\(Int(percentCompleted))%)")

                  // New Tolerance Logic:
                  // 1. If we have played > 85% of expected runtime, trust EOF (credits, variable runtimes).
                  // 2. OR if time remaining is less than 15 minutes (900s) (catch-all for shorter items).
                  // 3. ONLY trigger failover if we are significantly early (e.g. 50% through).

                  if percentCompleted < 85.0 && timeRemaining > 900 {
                       LoggingManager.shared.error(.videoRendering, message: "⚠️ Premature EOF detected (Too Early)! Played \(Int(percentCompleted))% (<85%) and \(Int(timeRemaining))s (>900s) remaining. Triggering Failover.")
                       handlePlaybackError("Premature EOF (Played \(Int(percentCompleted))%)")
                       return
                  } else {
                       LoggingManager.shared.info(.videoRendering, message: "✅ Event EOF Accepted (Within tolerance). Played \(Int(percentCompleted))%.")
                  }
             }
             // END: RELAXED EOF CHECK
        }

        // Dead room detection: If room was deleted (host left), go to browse instead of lobby
        if let roomId = currentRoomId {
            let roomExists = try? await roomManager.getRoomState(roomId: roomId)
            if roomExists == nil {
                LoggingManager.shared.warn(.watchParty, message: "PlayerVM: Room \(roomId) no longer exists - returning to rooms")
                await exitPlayer(keepRoomState: false)
                return
            } else {
                LoggingManager.shared.info(.watchParty, message: "PlayerVM: Room \(roomId) still exists, proceeding with session persistence")
            }
        }

        let wasEventPlayback = isEventPlayback
        let isPlaylistRoom = currentWatchPartyRoom?.hasPlaylist ?? false
        let isPersistentRoom = currentWatchPartyRoom?.isPersistent ?? false

        let shouldKeepRoomState = !wasEventPlayback && (currentWatchMode == .watchParty || isPlaylistRoom || isPersistentRoom)


        LoggingManager.shared.info(.videoRendering, message: "PlayerVM: Movie finished. isWatchParty=\(currentWatchMode == .watchParty), shouldKeepRoomState=\(shouldKeepRoomState)")
        await exitPlayer(keepRoomState: shouldKeepRoomState)

        if wasEventPlayback {
            if let eventId = currentEventId {
                finishedEventIds.insert(eventId)
                currentEventId = nil
            }
            // CRITICAL FIX: Clear room state to force clean exit and re-join
            self.currentRoomId = nil
            self.currentWatchPartyRoom = nil

            if let appState = appState {
                 appState.currentView = .events
                 appState.shouldAutoJoinLobby = true

                 // CRITICAL FIX: Reset idempotency lock for events
                 // This ensures the NEXT event can start even if it uses the same stream/media
                 lastAutoStartedSessionId = nil
            }
            return
        }

        if isPlaylistRoom, let room = currentWatchPartyRoom {
            await handlePlaylistTransition(room: room)
            return
        }

        // Catch-all for regular Watch Parties
        if currentWatchMode == .watchParty || isPersistentRoom {
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
            LoggingManager.shared.info(.videoRendering, message: "No next episode found")
            return
        }

        LoggingManager.shared.info(.videoRendering, message: "Playing Next Episode: S\(s)E\(e)")

        // Binge Blocking: Free Hosts cannot play next episode in same room
        let isPremium = SupabaseClient.shared.auth.currentUser?.isPremium ?? false
        if isWatchPartyHost && !isPremium {
            LoggingManager.shared.warn(.watchParty, message: "Binge Blocked (Watch Party): User is not premium")
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

        self.appState?.isLoadingRoom = true // Update AppState UI

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

            NSLog("🎬 Creating Watch Party for: %@", mediaItem.name)

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
                description: description,
                createdAt: nil
            )
             } catch {
                NSLog("❌ Creation failed or timed out: %@", String(describing: error))
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
                isPremium: LicenseManager.shared.isPremium,
                joinedAt: Date(),
                phxRefs: []
            )

            let watchPartyRoom = WatchPartyRoom(
                id: room.id,
                hostId: room.hostUserId?.uuidString ?? userId.uuidString.lowercased(),
                hostName: room.hostUsername,
                mediaItem: mediaItem,
                season: finalSeason,
                episode: finalEpisode,
                quality: quality,
                sourceQuality: nil,
                description: description,
                posterURL: room.posterUrl,
                participants: [hostParticipant],
                participantCount: 1,  // Host only at creation
                maxParticipants: 25,
                state: .lobby,
                createdAt: room.createdAt,
                lastActivity: room.createdAt,
                playlist: nil,
                currentPlaylistIndex: 0,
                isPublic: isPublic,
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

                // CRITICAL FIX: Create persistent Lobby Session via safe handoff
                let vm = LobbyViewModel(room: watchPartyRoom, isHost: true)
                appState.setActiveLobbyViewModel(vm)

                appState.currentView = .watchPartyLobby
                appState.isLoadingRoom = false
            }

            } catch {
                NSLog("❌ Failed to create room: %@", String(describing: error))
                let msg = "\(error)"
                // Handle various limit error formats (Postgres P0001 or standard API error)
                if msg.contains("Limit Reached") || msg.contains("P0001") || msg.contains("one room every 24 hours") {
                    // Refresh limit status so UI shows correct time
                    await LicenseManager.shared.checkHostingLimit()

                    await MainActor.run {
                        appState.isLoadingRoom = false
                        // Extract the user-friendly message if possible, otherwise use the full error
                        // The backend sends: "Free User Limit Reached: You can host 1 item every 24 hours. Unlock in X hours Y minutes."
                        // This usually comes in error.localizedDescription or within the userMessage wrapper.
                        self.premiumLimitMessage = error.localizedDescription
                        self.showPremiumLimitAlert = true
                    }
                } else {
                    await MainActor.run { appState.isLoadingRoom = false }
                }
            }
    }

    func joinRoom(roomId: String) async {
        guard let appState = appState else { return }
        NSLog("🚪 Joining room: %@", roomId)

        await MainActor.run { appState.isLoadingRoom = true }

        do {
            // STRICT LIVENESS CHECK: Prevent joining/reviving stale events
            // SMART LIVENESS CHECK: Prevent joining/reviving stale events, but allow Upcoming Lobbies
            if roomId.hasPrefix("event_") {
                let config = try await EventsConfigService.shared.fetchMovieEventsConfig()

                if EventsConfigService.shared.isEventJoinable(eventId: roomId, config: config) {
                    // Valid to join (either Live or Next Up)
                    NSLog("✅ PlayerVM: Event %@ is JOINABLE (Live or Next Up)", roomId)
                } else {
                    // NEW: Relaxed Social Join
                    // Check if room exists anyway. If it does, a friend might be in it or it was recently active.
                    // This allows "friends joining friends" even if the card says 'finished'.
                    NSLog("⚠️ PlayerVM: Event %@ is STALE on schedule. Checking database for active room...", roomId)
                    let roomState = try await roomManager.getRoomState(roomId: roomId)
                    if roomState != nil {
                        NSLog("✅ PlayerVM: Event room %@ still exists. Allowing social join.", roomId)
                    } else {
                        NSLog("🚫 PlayerVM: Blocking join to STALE event room %@ (Room not found in DB).", roomId)
                        await MainActor.run {
                            appState.isLoadingRoom = false
                        }
                        return
                    }
                }
            }

            let roomState = try await roomManager.getRoomState(roomId: roomId)

            var room = roomState

            // REVIVAL LOGIC: If Event Room is missing, recreate it JIT so friend can join
            if room == nil, roomId.hasPrefix("event_") {
                 NSLog("👻 Room %@ not found - Attempting REVIVAL for Event Join...", roomId)
                 let imdbId = roomId.replacingOccurrences(of: "event_", with: "")
                 if !imdbId.isEmpty {
                     // 1. Fetch Metadata
                     if let meta = try? await metadataProvider.fetchMetadata(type: "movie", id: imdbId) { // Try movie first
                         // 2. Recreate Room
                         let mediaItem = MediaItem(
                             id: meta.id,
                             type: meta.type,
                             name: meta.title,
                             poster: meta.posterURL,
                             background: meta.backgroundURL,
                             logo: meta.logoURL, description: meta.description, releaseInfo: meta.releaseInfo, year: meta.year, imdbRating: String(meta.imdbRating ?? 0), genres: meta.genres, runtime: meta.runtime
                         )

                         // Re-use creation logic (this creates it in DB)
                         if let newRoom = try? await performRoomCreation(
                             roomManager: roomManager,
                             roomId: roomId,
                             roomName: meta.title,
                             userId: appState.currentUserId ?? UUID(),
                             hostUsername: "RedLemon Events", // System Host Name
                             mediaItem: mediaItem,
                             finalSeason: nil,
                             finalEpisode: nil,
                             isPublic: true,
                             description: "System Event",
                             createdAt: nil
                         ) {
                             NSLog("✨ REVIVAL SUCCESS: Room %@ restored!", roomId)
                             room = newRoom
                         }
                     }
                 }
            }

            guard let room = room else {
                NSLog("❌ Room not found (and revival failed): %@", roomId)
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
                     isPremium: false,
                     joinedAt: p.joinedAt,
                     phxRefs: []
                ))
            }

            var watchPartyRoom = WatchPartyRoom(
                id: room.id,
                hostId: (room.type == .event) ? "system" : (room.hostUserId?.uuidString ?? "system"),
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
                participantCount: room.participantsCount,  // Use DB-managed count
                maxParticipants: room.maxParticipants,
                state: .lobby,
                createdAt: room.createdAt,
                lastActivity: room.createdAt,
                playlist: room.playlist,
                currentPlaylistIndex: room.currentPlaylistIndex ?? 0,
                isPublic: room.isPublic,
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

            // CRITICAL FIX: For system events, ensure createdAt matches the scheduled startTime
            // This prevents negative offsets in LobbyViewModel for late joiners.
            if roomId.hasPrefix("event_"),
               let config = try? await EventsConfigService.shared.fetchMovieEventsConfig(),
               let liveEvent = EventsConfigService.shared.calculateLiveEvent(config: config),
               liveEvent.mediaItem.id == (room.imdbId ?? "") {

                NSLog("🛡️ PlayerVM: Overriding Room createdAt (%@) with Scheduled Start (%@)", String(describing: watchPartyRoom.createdAt), String(describing: liveEvent.startTime))
                watchPartyRoom.createdAt = liveEvent.startTime
                watchPartyRoom.lastActivity = liveEvent.startTime
            }

            // Fetch dynamic lobby duration from config (Async)
            let eventsConfig = try? await EventsConfigService.shared.fetchMovieEventsConfig()

            await MainActor.run {
                var shouldJoinPlayback = false

                // 1. Determine Mode based on Room Type and Schedule
                // Check if room is active (Playing state)
                let isActuallyPlaying = room.isPlaying

                if roomId.hasPrefix("event_") {
                    // Event Room: Check Global Schedule
                     let rawId = roomId.replacingOccurrences(of: "event_", with: "")

                     // REDLEMON: If room is already in playback (e.g. friend is watching), trust that over strict schedule
                     if isActuallyPlaying {
                         shouldJoinPlayback = true
                         NSLog("✅ Event Join: %@ is already PLAYING. Joining Playback.", rawId)
                     } else if let config = eventsConfig,
                        let liveEvent = EventsConfigService.shared.calculateLiveEvent(config: config),
                        liveEvent.mediaItem.id == rawId {
                         // Matched current live event
                         shouldJoinPlayback = true
                         NSLog("✅ Event Join: %@ is LIVE according to schedule. Joining Playback.", rawId)
                     } else {
                         // Future/Past or No Config
                         shouldJoinPlayback = false
                         NSLog("ℹ️ Event Join: Joining Lobby (Not currently live)")
                     }
                } else {
                    // User Room: Trust DB State
                    shouldJoinPlayback = isActuallyPlaying
                }

                // 2. Execute Mode
                if shouldJoinPlayback {
                    NSLog("🎬 Room is playing (or Live Event) - joining playback")
                    self.currentRoomId = roomId
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isWatchPartyHost = (room.hostUserId == appState.currentUserId)
                    self.currentWatchMode = .watchParty

                    // Handle Event Specifics
                    if roomId.hasPrefix("event_") {
                        self.isEventPlayback = true
                        let rawId = roomId.replacingOccurrences(of: "event_", with: "")
                        self.currentEventId = rawId

                        // Recalculate start time for sync
                        if let config = eventsConfig,
                           let liveEvent = EventsConfigService.shared.calculateLiveEvent(config: config),
                           liveEvent.mediaItem.id == self.currentEventId {
                                self.eventStartTime = liveEvent.startTime
                                let position = max(0, TimeService.shared.now.timeIntervalSince(liveEvent.startTime))
                                self.resumeFromTimestamp = position
                        } else {
                            // Fallback (unlikely given check above)
                            self.eventStartTime = room.createdAt
                            self.resumeFromTimestamp = max(0, TimeService.shared.now.timeIntervalSince(room.createdAt) - Double(eventsConfig?.bufferBetweenMoviesSeconds ?? 600))
                        }
                        NSLog("🎉 Detected Event Room join! StartTime: %@", String(describing: self.eventStartTime ?? Date()))
                    } else {
                        self.isEventPlayback = false
                        self.resumeFromTimestamp = Double(room.playbackPosition)
                    }

                    if let imdbId = room.imdbId, !imdbId.isEmpty {
                        self.selectedMediaItem = watchPartyRoom.mediaItem

                        // Async metadata fetch (fire and forget visual update)
                        Task {
                            self.selectedMetadata = try? await self.metadataProvider.fetchMetadata(
                                type: room.season != nil ? "series" : "movie",
                                id: imdbId
                            )
                        }

                        self.selectedSeason = room.season
                        self.selectedEpisode = room.episode
                        self.selectedQuality = .fullHD

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
                    // Lobby Mode
                    NSLog("🚪 Room is in lobby")
                    self.currentRoomId = roomId
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isWatchPartyHost = (room.hostUserId == appState.currentUserId)
                    self.currentWatchMode = .watchParty
                    self.isEventPlayback = roomId.hasPrefix("event_") // Can be in lobby of event
                    self.currentEventId = roomId.hasPrefix("event_") ? roomId.replacingOccurrences(of: "event_", with: "") : nil

                    if let imdbId = room.imdbId, !imdbId.isEmpty {
                        self.selectedMediaItem = watchPartyRoom.mediaItem
                         Task {
                            self.selectedMetadata = try? await self.metadataProvider.fetchMetadata(
                                type: room.season != nil ? "series" : "movie",
                                id: imdbId
                            )
                        }
                    }

                    // CRITICAL FIX: Create persistent Lobby Session via safe handoff
                    let vm = LobbyViewModel(room: watchPartyRoom, isHost: self.isWatchPartyHost)
                    appState.setActiveLobbyViewModel(vm)

                    appState.currentView = .watchPartyLobby
                }

                appState.isLoadingRoom = false

            }
        } catch {
            NSLog("❌ Failed to join room: %@", String(describing: error))
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
            LoggingManager.shared.info(.watchHistory, message: "Saved to watch history: \(mediaItem.name) at \(Int(timestamp))s")

            // Refresh global progress mapping in AppState
            appState?.updateWatchHistoryMapping()

            // Sync to Cloud
            Task {
                await SupabaseClient.shared.syncWatchHistoryItem(historyItem)
            }
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
        description: String?,
        createdAt: Date? = nil
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
                        playlist: nil,
                        subtitleUrl: nil,
                        createdAt: createdAt
                    )
                    NSLog("Background: ✅ createRoom task finished")
                    continuationWrapper.resume(returning: r)
                } catch {
                     NSLog("Background: ❌ createRoom task failed: %@", String(describing: error))
                     continuationWrapper.resume(throwing: error)
                }
            }

            // 2. The Timeout Task
            Task {
                try? await Task.sleep(nanoseconds: 35_000_000_000) // 35 seconds
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

    /// Refresh subtitles for the current stream manually (e.g. if SubDL was down during initial play)
    func manualRefreshSubtitles() async {
        guard let item = selectedMediaItem, var stream = selectedStream else {
            NSLog("🏥 [PlayerVM] Manual Refresh: No active stream to refresh subtitles for")
            return
        }

        // 🔍 Show "Searching for Subtitles..." notification
        await MainActor.run {
            self.appState?.isSearchingSubtitles = true
        }

        defer {
            Task { @MainActor in
                self.appState?.isSearchingSubtitles = false
            }
        }

        NSLog("🏥 [PlayerVM] Manual Refresh: Triggering deep subtitle search for %@", item.name)


        do {
            // Build stream hint for better matching
            var streamHint = stream.title
            if streamHint.lowercased().contains("video.mkv") || streamHint.lowercased().contains("stream.mkv") {
                // Try to get better info from current room metadata if available
                if let room = currentWatchPartyRoom {
                    streamHint = room.selectedStreamTitle ?? room.sourceQuality ?? stream.title
                }
            }

            // Recalculate season/episode for series
            let season = selectedSeason
            let episode = selectedEpisode

            // Use metadata year if available (Documentation #131: Handle "2025–" and other range formats)
            let yearStr = selectedMetadata?.year ?? item.year
            let year: Int? = {
                guard let str = yearStr, !str.isEmpty else { return nil }
                // Extract first 4-digit sequence (e.g. "2025–" -> 2025)
                let pattern = "\\b(19|20)\\d{2}\\b"
                if let range = str.range(of: pattern, options: .regularExpression),
                   let val = Int(str[range]) {
                    return val
                }
                return Int(str) // Fallback
            }()

            let subDLSubtitles = try await LocalAPIClient.shared.searchSubtitles(
                imdbId: item.id,
                type: item.type,
                season: season,
                episode: episode,
                name: item.name,
                year: year,
                streamFilename: streamHint
            )

            if !subDLSubtitles.isEmpty {
                NSLog("✅ [PlayerVM] Manual Refresh: Found %d SubDL subtitles", subDLSubtitles.count)

                let externalSubs = subDLSubtitles.map { sub -> Subtitle in
                    let encodedPath = Data(sub.url.utf8).base64EncodedString()
                    var proxyURL = LocalAPIClient.shared.getSubtitleURL(
                        downloadPath: sub.url,
                        season: season,
                        episode: episode,
                        streamFilename: streamHint
                    )
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

                // Add to existing subtitles (deduplicate by URL/ID)
                var existingSubs = stream.subtitles ?? []
                let existingIds = Set(existingSubs.map { $0.id })

                let newSubs = externalSubs.filter { !existingIds.contains($0.id) }

                if !newSubs.isEmpty {
                    existingSubs.append(contentsOf: newSubs)
                    stream.subtitles = existingSubs

                    // Update state on Main Actor
                    await MainActor.run {
                        self.selectedStream = stream
                        if var health = self.appState?.providerHealth {
                            health["subdl"] = "Degraded"
                            self.appState?.providerHealth = health
                        }
                        NSLog("✅ [PlayerVM] Manual Refresh: Added %d new subtitles to current stream", newSubs.count)
                    }
                } else {
                     NSLog("ℹ️ [PlayerVM] Manual Refresh: No additional subtitles found (already have %d)", existingSubs.count)
                }
            } else {
                NSLog("⚠️ [PlayerVM] Manual Refresh: No subtitles found for %@", item.name)
            }
        } catch {
            NSLog("❌ [PlayerVM] Manual Refresh: Subtitle search failed: %@", error.localizedDescription)
        }
    }

}
