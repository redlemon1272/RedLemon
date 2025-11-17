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

    @Published var currentView: AppView = .browse
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
    @Published var searchResults: [MediaItem] = []  // Persist search results across navigation
    @Published var lastSearchQuery: String = ""  // Remember last search query
    @Published var resumeFromTimestamp: Double? = nil  // When resuming playback, seek to this position
    @Published var isServerReady: Bool = false  // Track if HTTP server is ready to accept requests
    @Published var showUsernameSetup: Bool = false  // Show username setup dialog

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

    // Helper function to download subtitles in parallel before playback
    private func downloadSubtitlesInParallel(subtitles: [Subtitle]) async -> [Subtitle] {
        await withTaskGroup(of: Subtitle?.self) { group -> [Subtitle] in
            for subtitle in subtitles {
                group.addTask { () -> Subtitle? in
                    // Download subtitle to temp file
                    guard let url = URL(string: subtitle.url) else { return nil }

                    do {
                        let (data, response) = try await URLSession.shared.data(from: url)

                        // Check if it's a zip file
                        let isZip = subtitle.url.lowercased().hasSuffix(".zip") ||
                                   (response as? HTTPURLResponse)?.allHeaderFields["Content-Type"] as? String == "application/zip"

                        if isZip {
                            // Extract .srt from zip
                            if let extractedPath = try? await self.extractSubtitleFromZip(data: data) {
                                NSLog("✅ Extracted subtitle: %@ -> %@", subtitle.label, extractedPath)
                                return Subtitle(
                                    id: subtitle.id,
                                    url: extractedPath,
                                    lang: subtitle.lang,
                                    label: subtitle.label,
                                    srclang: subtitle.srclang,
                                    kind: subtitle.kind,
                                    provider: subtitle.provider
                                )
                            }
                        } else {
                            // Save directly as .srt
                            let tempDir = FileManager.default.temporaryDirectory
                            let filename = "subtitle_\(UUID().uuidString).srt"
                            let localURL = tempDir.appendingPathComponent(filename)
                            try data.write(to: localURL)
                            NSLog("✅ Downloaded subtitle: %@ -> %@", subtitle.label, localURL.path)
                            return Subtitle(
                                id: subtitle.id,
                                url: localURL.path,
                                lang: subtitle.lang,
                                label: subtitle.label,
                                srclang: subtitle.srclang,
                                kind: subtitle.kind,
                                provider: subtitle.provider
                            )
                        }
                    } catch {
                        NSLog("❌ Failed to download subtitle %@: %@", subtitle.label, error.localizedDescription)
                    }

                    return nil
                }
            }

            var downloaded: [Subtitle] = []
            for await result in group {
                if let subtitle = result {
                    downloaded.append(subtitle)
                }
            }
            return downloaded
        }
    }

    private func extractSubtitleFromZip(data: Data) throws -> String? {
        let tempDir = FileManager.default.temporaryDirectory
        let zipPath = tempDir.appendingPathComponent("temp_\(UUID().uuidString).zip")
        try data.write(to: zipPath)

        // Use unzip command
        let extractDir = tempDir.appendingPathComponent("extract_\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: extractDir, withIntermediateDirectories: true)

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = ["-q", zipPath.path, "-d", extractDir.path]
        try process.run()
        process.waitUntilExit()

        // Find .srt file
        let contents = try FileManager.default.contentsOfDirectory(at: extractDir, includingPropertiesForKeys: nil)
        if let srtFile = contents.first(where: { $0.pathExtension.lowercased() == "srt" }) {
            return srtFile.path
        }

        return nil
    }

    func playMedia(_ item: MediaItem, quality: VideoQuality, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        streamError = nil

        do {
            print("🎬 Starting playback for: \(item.name)")
            NSLog("   Quality: \(quality.rawValue)")
            NSLog("   Mode: \(watchMode)")
            if let season = selectedSeason, let episode = selectedEpisode {
                NSLog("   Season: \(season), Episode: \(episode)")
            }

            // Step 1: Load metadata FIRST
            NSLog("📡 Fetching metadata for \(item.id)...")
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: item.type, id: item.id)

            // CRITICAL: Update UI state on main thread
            await MainActor.run {
                selectedMetadata = metadata
                selectedMediaItem = item
                selectedQuality = quality
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
            }

            NSLog("✅ Metadata loaded")
            NSLog("   Title: \(metadata.title)")
            NSLog("   Background URL: \(metadata.backgroundURL ?? "nil")")
            NSLog("   Logo URL: \(metadata.logoURL ?? "nil")")

            // Step 2: Switch to player view IMMEDIATELY with metadata (background art will show)
            await MainActor.run {
                currentView = .player
            }
            NSLog("🎬 Player view opened with background art...")

            // Step 3: Resolve streams FIRST (before fullscreen to avoid animation delay)
            await MainActor.run {
                isResolvingStream = true
            }
            NSLog("🔍 Starting stream resolution in background...")

            // Only pass season/episode for TV series, not movies
            let season = item.type == "series" ? selectedSeason : nil
            let episode = item.type == "series" ? selectedEpisode : nil

            let bucket = try await LocalAPIClient.shared.getStreamBucket(
                for: item.id,
                type: item.type,
                quality: quality,
                season: season,
                episode: episode,
                year: metadata.year // CRITICAL: Use metadata year (reliable) not item.year (nil from discovery)
            )

            // Build list of streams to try: primary first, then alternates
            var streamsToTry: [Stream] = []
            if let primary = bucket.primary {
                streamsToTry.append(primary)
            }
            if let alternates = bucket.alternates {
                streamsToTry.append(contentsOf: alternates)
            }

            guard !streamsToTry.isEmpty else {
                throw APIError.noStreamsFound
            }

            print("📦 Found \(streamsToTry.count) streams to try for \(quality.rawValue)")
            for (idx, stream) in streamsToTry.enumerated() {
                print("   [\(idx + 1)] \(stream.title)")
            }

            // CRITICAL FIX: Selective filtering that preserves server order AND blocks x265
            // Server handles most filtering, but we need safety net for x265 variants
            print("🎯 PRESERVING SERVER ORDER + x265 SAFETY NET")
            print("   Server handled: episode patterns, quality ranking, primary selection")
            print("   Client adds: x265 safety filter (without reordering)")

            // Apply ONLY x265 filtering as safety net - preserve server's ordering
            print("🔥 x265 SAFETY FILTER - BEFORE: \(streamsToTry.count) streams")
            let beforeX265Filter = streamsToTry.count
            let badCodecs = ["x265", "hevc", "h.265", "h265", "x.265"]

            // CRITICAL: Use compactMap to preserve order while removing x265
            let filteredStreams = streamsToTry.compactMap { stream -> Stream? in
                let titleLower = stream.title.lowercased()
                let hasBadCodec = badCodecs.contains { codec in
                    titleLower.contains(codec)
                }
                if hasBadCodec {
                    print("🚫 CLIENT BLOCKING x265/HEVC: \(stream.title)")
                    return nil  // Remove but keep order of remaining streams
                }
                return stream  // Keep stream in original position
            }

            streamsToTry = filteredStreams
            let afterX265Filter = streamsToTry.count

            print("🔥 x265 SAFETY FILTER - AFTER: \(streamsToTry.count) streams")
            if afterX265Filter < beforeX265Filter {
                print("🚫 CLIENT BLOCKED \(beforeX265Filter - afterX265Filter) x265 streams")
                print("   Netflix priority preserved: server's primary still #1")
            }

            guard !streamsToTry.isEmpty else {
                print("❌ ERROR: No streams available after x265 safety filter")
                throw APIError.noStreamsFound
            }

            // Step 4: Try each stream until one successfully unlocks
            var lastError: Error?
            var unlockedStream: Stream?

            for (index, stream) in streamsToTry.enumerated() {
                print("🔄 Trying stream \(index + 1)/\(streamsToTry.count): \(stream.title)")
                print("   Provider: \(stream.provider)")
                print("   Seeders: \(stream.seeders ?? 0)")

                guard let infoHash = stream.infoHash else {
                    print("⚠️ No infoHash, skipping...")
                    continue
                }

                do {
                    print("🔓 Unlocking with infoHash: \(infoHash.prefix(12))...")

                    let fileIndex = stream.fileIdx ?? 0
                    print("   File index: \(fileIndex)")

                    let unlockURL = URL(string: "\(Config.serverURL)/api/streams/unlock")!
                    var request = URLRequest(url: unlockURL)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                    var unlockBody: [String: Any] = [
                        "infoHash": infoHash,
                        "fileIdx": fileIndex,
                        "service": "realdebrid"
                    ]

                    // Add season/episode for TV shows ONLY
                    if item.type == "series" {
                        if let season = selectedSeason {
                            unlockBody["season"] = season
                        }
                        if let episode = selectedEpisode {
                            unlockBody["episode"] = episode
                        }
                    }

                    request.httpBody = try JSONSerialization.data(withJSONObject: unlockBody)

                    let (data, response) = try await URLSession.shared.data(for: request)

                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw APIError.invalidResponse
                    }

                    if httpResponse.statusCode != 200 {
                        let errorMessage: String
                        if let errorBody = String(data: data, encoding: .utf8) {
                            errorMessage = errorBody
                        } else {
                            errorMessage = "HTTP \(httpResponse.statusCode)"
                        }
                        throw APIError.networkError(NSError(domain: "UnlockError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
                    }

                    struct UnlockResponse: Codable {
                        let url: String
                        let filename: String
                    }

                    let unlockResult = try JSONDecoder().decode(UnlockResponse.self, from: data)

                    print("✅ Stream unlocked successfully!")
                    print("   URL: \(unlockResult.url.prefix(60))...")
                    print("   File: \(unlockResult.filename)")

                    // Success! Create unlocked stream
                    unlockedStream = Stream(
                        url: unlockResult.url,
                        title: stream.title,
                        quality: stream.quality,
                        seeders: stream.seeders,
                        size: stream.size,
                        provider: stream.provider,
                        infoHash: stream.infoHash,
                        fileIdx: stream.fileIdx,
                        ext: stream.ext,
                        behaviorHints: stream.behaviorHints,
                        subtitles: stream.subtitles
                    )

                    break // Exit loop on success

                } catch {
                    print("❌ Unlock failed: \(error.localizedDescription)")
                    lastError = error

                    // If not the last stream, try next one
                    if index < streamsToTry.count - 1 {
                        print("🔄 Trying next stream...")
                        continue
                    } else {
                        print("❌ All streams exhausted")
                    }
                }
            }

            // Check if we successfully unlocked a stream
            guard var finalStream = unlockedStream else {
                throw lastError ?? APIError.noStreamsFound
            }

            // Stream is ready with subtitles already attached by server
            if let subtitles = finalStream.subtitles, !subtitles.isEmpty {
                NSLog("✅ Stream has %d subtitle option(s) available", subtitles.count)
                for (idx, sub) in subtitles.enumerated() {
                    NSLog("   [%d] %@", idx + 1, sub.label)
                }

                // Pre-download subtitles NOW (before fullscreen) so they're ready immediately
                NSLog("📥 Pre-downloading subtitles...")
                let downloadedSubs = await downloadSubtitlesInParallel(subtitles: subtitles)
                NSLog("✅ Pre-downloaded %d/%d subtitles", downloadedSubs.count, subtitles.count)

                // Update stream with downloaded local subtitle paths
                finalStream.subtitles = downloadedSubs
            } else {
                NSLog("⚠️ No subtitles available (add SubDL API key in Settings)")
            }

            await MainActor.run {
                selectedStream = finalStream
            }
            NSLog("✅ Stream unlocked successfully!")

            // Enter fullscreen now that stream AND subtitles are ready
            enterFullscreen()

            // Set room ID only if provided (for watch parties), not for solo playback
            if let roomId = roomId {
                // Use provided room ID for watch parties
                currentRoomId = roomId
                print(" Using provided room ID: \(roomId)")
            } else if watchMode == .watchParty {
                // Create room for watch party mode when no specific room provided
                let roomVisibility: RoomVisibility = .friendsCanJoin
                print(" Creating watch party room...")
                print("   Mode: \(watchMode)")
                print("   Visibility: \(roomVisibility)")

                // TODO: Create room on ICP when ready
                // currentRoomId = try await createICPRoom(
                //     imdbId: item.id,
                //     title: item.name,
                //     streamHash: infoHash,
                //     mode: watchMode,
                //     visibility: roomVisibility
                // )

                currentRoomId = "room_\(UUID().uuidString.prefix(8))" // Placeholder until ICP integration
                print("   Room ID: \(currentRoomId ?? "none")")
            } else {
                // No room ID for solo playback
                currentRoomId = nil
                print(" Solo playback - no room created")
            }

            print("✅ Stream ready, starting playback...")
        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
            }
            // Stay on player view to show error on background art
        }

        await MainActor.run {
            isResolvingStream = false
        }
        NSLog("🏁 playMedia() completed")
    }

    func playSelectedStream(_ stream: Stream, watchMode: WatchMode, roomId: String? = nil, isHost: Bool = false) async {
        guard let mediaItem = selectedMediaItem else {
            streamError = "No media item selected"
            return
        }

        streamError = nil

        do {
            print("🎬 Starting playback with selected stream: \(stream.title)")
            NSLog("   Provider: \(stream.provider)")
            NSLog("   Mode: \(watchMode)")

            // Step 1: Load metadata if not already loaded
            var metadata = selectedMetadata
            if metadata == nil {
                NSLog("📡 Fetching metadata for \(mediaItem.id)...")
                metadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
                selectedMetadata = metadata
            }

            // Step 2: Switch to player view
            currentView = .player
            NSLog("🎬 Player view opened...")

            // Step 3: Unlock the selected stream
            await MainActor.run {
                isResolvingStream = true
            }

            guard let infoHash = stream.infoHash else {
                throw APIError.noStreamsFound
            }

            print("🔓 Unlocking selected stream with infoHash: \(infoHash.prefix(12))...")

            let fileIndex = stream.fileIdx ?? 0
            let unlockURL = URL(string: "\(Config.serverURL)/api/streams/unlock")!
            var request = URLRequest(url: unlockURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            var unlockBody: [String: Any] = [
                "infoHash": infoHash,
                "fileIdx": fileIndex,
                "service": "realdebrid"
            ]

            // Add season/episode for TV shows ONLY
            if mediaItem.type == "series" {
                if let season = selectedSeason {
                    unlockBody["season"] = season
                }
                if let episode = selectedEpisode {
                    unlockBody["episode"] = episode
                }
            }

            request.httpBody = try JSONSerialization.data(withJSONObject: unlockBody)

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            if httpResponse.statusCode != 200 {
                let errorMessage: String
                if let errorBody = String(data: data, encoding: .utf8) {
                    errorMessage = errorBody
                } else {
                    errorMessage = "HTTP \(httpResponse.statusCode)"
                }
                throw APIError.networkError(NSError(domain: "UnlockError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
            }

            struct UnlockResponse: Codable {
                let url: String
                let filename: String
            }

            let unlockResult = try JSONDecoder().decode(UnlockResponse.self, from: data)

            print("✅ Stream unlocked successfully!")
            print("   URL: \(unlockResult.url.prefix(60))...")
            print("   File: \(unlockResult.filename)")

            // Create unlocked stream
            var unlockedStream = Stream(
                url: unlockResult.url,
                title: stream.title,
                quality: stream.quality,
                seeders: stream.seeders,
                size: stream.size,
                provider: stream.provider,
                infoHash: stream.infoHash,
                fileIdx: stream.fileIdx,
                ext: stream.ext,
                behaviorHints: stream.behaviorHints,
                subtitles: stream.subtitles
            )

            // Step 4: Download subtitles if available
            if let subtitles = unlockedStream.subtitles, !subtitles.isEmpty {
                NSLog("✅ Stream has %d subtitle option(s) available", subtitles.count)

                // Pre-download subtitles
                NSLog("📥 Pre-downloading subtitles...")
                let downloadedSubs = await downloadSubtitlesInParallel(subtitles: subtitles)
                NSLog("✅ Pre-downloaded %d/%d subtitles", downloadedSubs.count, subtitles.count)

                // Update stream with downloaded local subtitle paths
                unlockedStream.subtitles = downloadedSubs
            }

            // Step 5: Set up playback state
            await MainActor.run {
                selectedStream = unlockedStream
                selectedMediaItem = mediaItem
                selectedQuality = selectedQuality
                currentWatchMode = watchMode
                isWatchPartyHost = isHost
            }

            // Step 6: Set room ID if provided or create for watch party
            if let roomId = roomId {
                currentRoomId = roomId
                print(" Using provided room ID: \(roomId)")
            } else if watchMode == .watchParty {
                currentRoomId = "room_\(UUID().uuidString.prefix(8))" // Placeholder
                print(" Created room ID: \(currentRoomId ?? "none")")
            } else {
                currentRoomId = nil
                print(" Solo playback - no room created")
            }

            // Step 7: Enter fullscreen
            enterFullscreen()

            print("✅ Selected stream ready for playback!")

        } catch {
            print("❌ Playback error: \(error)")
            await MainActor.run {
                streamError = error.localizedDescription
            }
        }

        await MainActor.run {
            isResolvingStream = false
        }
        NSLog("🏁 playSelectedStream() completed")
    }

    func navigateToPlayer(stream: Stream) {
        selectedStream = stream
        currentView = .player
        showPlayer = true

        // Enter fullscreen when starting playback
        enterFullscreen()
    }

    func exitPlayer() async {
        // Leave the room (always, even for solo watching)
        if let roomId = currentRoomId {
            print("👋 Leaving room: \(roomId)")
            print("   Mode was: \(currentWatchMode)")

            // TODO: Notify ICP canister that user is leaving room
            // This updates friend feeds, removes from active rooms list, etc.
            // await leaveICPRoom(roomId: roomId, mode: currentWatchMode)

            // For watch parties, notify other users
            if currentWatchMode == .watchParty {
                print("   Notifying other users in watch party...")
                // await broadcastUserLeft(roomId: roomId)
            }
        }

        // Clean up player state
        showPlayer = false
        selectedStream = nil
        selectedMediaItem = nil
        currentRoomId = nil
        currentWatchMode = .solo
        isWatchPartyHost = false
        currentView = .browse

        // Exit fullscreen when leaving player
        exitFullscreen()

        // Restore window to original small size (not expanded lobby size)
        restoreWindowSize()

        print("✅ Exited room and returned to browse")
    }

    // MARK: - Window Management

    private func enterFullscreen() {
        NSLog("🖥️ enterFullscreen() called")

        // Try all windows
        let windows = NSApplication.shared.windows
        NSLog("   Found %d windows", windows.count)

        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            NSLog("   ❌ No window found!")
            return
        }

        NSLog("   Window: %@", window.description)
        NSLog("   Is fullscreen: %d", window.styleMask.contains(.fullScreen) ? 1 : 0)

        if !window.styleMask.contains(.fullScreen) {
            NSLog("   ✅ Toggling fullscreen ON")
            window.toggleFullScreen(nil)
        } else {
            NSLog("   ⚠️ Already in fullscreen")
        }
    }

    private func exitFullscreen() {
        NSLog("🖥️ exitFullscreen() called")

        // Try all windows
        let windows = NSApplication.shared.windows
        NSLog("   Found %d windows", windows.count)

        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            NSLog("   ❌ No window found!")
            return
        }

        NSLog("   Window: %@", window.description)
        NSLog("   Is fullscreen: %d", window.styleMask.contains(.fullScreen) ? 1 : 0)

        if window.styleMask.contains(.fullScreen) {
            NSLog("   ✅ Toggling fullscreen OFF")
            window.toggleFullScreen(nil)
        } else {
            NSLog("   ⚠️ Already windowed mode")
        }
    }

    private func restoreWindowSize() {
        NSLog("🪟 restoreWindowSize() called - restoring to expanded size")

        guard let window = NSApplication.shared.windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? NSApplication.shared.windows.first else {
            NSLog("   ❌ No window found!")
            return
        }

        // Don't restore if in fullscreen
        if window.styleMask.contains(.fullScreen) {
            NSLog("   ⚠️ Window is fullscreen, skipping restore")
            return
        }

        // Restore to expanded size (visible screen frame)
        guard let screen = window.screen ?? NSScreen.main else {
            NSLog("   ❌ No screen found!")
            return
        }

        let visibleFrame = screen.visibleFrame
        NSLog("   📐 Restoring to expanded size: \(visibleFrame)")
        window.setFrame(visibleFrame, display: true, animate: true)
        NSLog("   ✅ Window restored to expanded size")
    }

    // Public method for views to restore window size (no-op now since window stays expanded)
    func restoreWindowFromLobby() {
        // Window stays at expanded size, no need to do anything
        NSLog("🪟 restoreWindowFromLobby() called - no action needed (window stays expanded)")
    }

    // Create a new watch party room and navigate to lobby
    @MainActor
    func createWatchPartyAndNavigate(mediaItem: MediaItem, season: Int?, episode: Int?, quality: VideoQuality = .fullHD) async {
        NSLog("🎬 Creating Watch Party for: \(mediaItem.name)")
        if let season = season, let episode = episode {
            NSLog("   Season: \(season), Episode: \(episode)")
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

            _ = try await SupabaseClient.shared.createRoom(
                id: roomId,
                name: roomName,
                hostUserId: userId,
                hostUsername: currentUsername,
                streamHash: nil,
                imdbId: mediaItem.id,
                posterUrl: mediaItem.poster,
                backdropUrl: nil,
                isPublic: true
            )

            NSLog("✅ Room created: \(roomId)")

            // Host joins their own room with isHost flag
            try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: true)
            NSLog("✅ Host joined room: \(roomId)")

            // Set up local state
            self.selectedMediaItem = mediaItem
            self.selectedSeason = season
            self.selectedEpisode = episode
            self.selectedQuality = quality
            self.currentRoomId = roomId
            self.isWatchPartyHost = true

            // Create room object
            let host = Participant(
                id: userId.uuidString,
                name: currentUsername,
                isHost: true,
                isReady: false,
                joinedAt: Date()
            )

            let watchPartyRoom = WatchPartyRoom(
                id: roomId,
                hostId: userId.uuidString,
                hostName: currentUsername,
                mediaItem: mediaItem,
                season: season,
                episode: episode,
                quality: quality,
                sourceQuality: nil,
                description: nil,
                posterURL: mediaItem.poster,
                participants: [host],
                state: .lobby,
                createdAt: Date()
            )

            self.currentWatchPartyRoom = watchPartyRoom

            // Add to active rooms
            if !activeRooms.contains(where: { $0.id == roomId }) {
                activeRooms.append(watchPartyRoom)
            }

            isLoadingRoom = false

            // Navigate to lobby (window stays at expanded size)
            self.currentView = .watchPartyLobby

            NSLog("🚪 Navigated to lobby for room: \(roomId)")

        } catch {
            NSLog("❌ Failed to create watch party: \(error)")
            isLoadingRoom = false
            streamError = "Failed to create watch party: \(error.localizedDescription)"
        }
    }

    // Navigate to watch party lobby after creating a room
    @MainActor
    func navigateToLobby(roomId: String) async {
        self.currentRoomId = roomId
        self.isLoadingRoom = true
        self.currentView = .watchPartyLobby // Switch view immediately to show loading (window stays expanded)

        // Find room in activeRooms and set it as current
        if let room = activeRooms.first(where: { $0.id == roomId }) {
            self.currentWatchPartyRoom = room
            self.isLoadingRoom = false
            NSLog("🚪 Navigating to lobby for room: \(roomId)")
        } else {
            NSLog("⚠️ Room \(roomId) not found in activeRooms, fetching from backend...")

            // Room not in local cache, fetch from Supabase
            do {
                let backendRooms = try await SupabaseClient.shared.getAllRooms()
                NSLog("📋 Fetched \(backendRooms.count) rooms from backend")

                // Find specific room
                if let room = backendRooms.first(where: { $0.id == roomId }) {
                    NSLog("✅ Found room \(room.id) in backend: \(room.name)")

                    // Create MediaItem only if imdbId exists
                    let mediaItem: MediaItem?
                    if let imdbId = room.imdbId, !imdbId.isEmpty {
                        mediaItem = MediaItem(
                            id: imdbId,
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
                    } else {
                        mediaItem = nil // No media selected yet
                    }

                    let host = Participant(
                        id: room.hostUserId.uuidString,
                        name: room.hostUsername,
                        isHost: true,
                        isReady: false,
                        joinedAt: Date()
                    )

                    // Fetch actual participants from room_participants table
                    var allParticipants: [Participant] = []
                    do {
                        let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: roomId)
                        NSLog("📋 Found \(roomParticipants.count) participants in room")

                        // Convert to Participant objects
                        for participant in roomParticipants {
                            // Get username from user ID
                            if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                                let p = Participant(
                                    id: participant.userId.uuidString,
                                    name: user.username,
                                    isHost: participant.isHost,
                                    isReady: false,
                                    joinedAt: participant.joinedAt
                                )
                                allParticipants.append(p)
                                NSLog("   - \(user.username) (host: \(participant.isHost))")
                            }
                        }
                    } catch {
                        NSLog("⚠️ Failed to fetch participants: \(error), using host only")
                        allParticipants = [host]
                    }

                    let watchPartyRoom = WatchPartyRoom(
                        id: roomId,
                        hostId: room.hostUserId.uuidString,
                        hostName: room.hostUsername,
                        mediaItem: mediaItem, // Now optional
                        season: nil,  // TODO: Extract from room metadata
                        episode: nil,  // TODO: Extract from room metadata
                        quality: .fullHD,
                        sourceQuality: nil,
                        description: nil,
                        posterURL: room.posterUrl,
                        participants: allParticipants,
                        state: .lobby,
                        createdAt: room.createdAt
                    )

                    // Set room and stop loading
                    self.currentWatchPartyRoom = watchPartyRoom
                    self.isLoadingRoom = false
                    NSLog("🚪 Successfully navigated to lobby for room: \(roomId)")
                } else {
                    self.isLoadingRoom = false
                    NSLog("❌ Room \(roomId) not found in backend response")
                    NSLog("   Available rooms: \(backendRooms.map { $0.id })")
                }
            } catch {
                self.isLoadingRoom = false
                NSLog("❌ Failed to fetch room from backend: \(error)")
            }
        }
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
            id: "\(mediaItem.id)_\(selectedSeason ?? 0)_\(selectedEpisode ?? 0)",
            mediaItem: mediaItem,
            timestamp: timestamp,
            duration: duration,
            lastWatched: Date(),
            quality: selectedQuality.rawValue,
            season: selectedSeason,
            episode: selectedEpisode
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

    /// Generate a 4-character alphanumeric room code (e.g., A3H9, K7M2)
    private func generateRoomCode() -> String {
        let characters = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789" // Exclude confusing chars: I,O,1,0
        var result = ""
        for _ in 0..<4 {
            if let char = characters.randomElement() {
                result.append(char)
            }
        }
        return result
    }
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
