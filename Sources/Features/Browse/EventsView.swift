import SwiftUI
import AppKit

struct EventsView: View {
    @EnvironmentObject var appState: AppState

    // Simple in-memory cache for decoded images to prevent flicker in LazyVGrid
    class EventImageCache {
        static let shared = NSCache<NSString, NSImage>()
    }
    @ObservedObject private var timeService = TimeService.shared
    private let apiClient = LocalAPIClient.shared



    // Movie events
    // Local events state replaced by appState.eventsSchedule
    @State private var currentOffset = 0  // Track which set of 4 we're showing

    // Common state
    @State private var isLoading = true
    // Timer removed - AppState handles schedule updates
    @State private var lastUpdate = Date() // Force view refresh when needed


    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
            } else {
                GeometryReader { geometry in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {

                            // Dynamic Layout Calculations
                            let totalWidth = geometry.size.width
                            let horizontalPadding: CGFloat = 32 // Approximate system padding (16*2)

                            // Hero Card Height: Cinematic ratio (approx 2.4:1) or min 550
                            // On 2560px screen: ~1066px height (fills space nicely)
                            // On 1440px screen: 600px height
                            let heroHeight = max(550, totalWidth / 2.4)

                            // Grid Item Height Calculation
                            // mimic LazyVGrid's adaptive logic to find item width
                            let minItemWidth: CGFloat = 500
                            let spacing: CGFloat = 20
                            let availableGridWidth = totalWidth - horizontalPadding

                            // Calculate column count (at least 1)
                            let columnCount = max(1, floor((availableGridWidth + spacing) / (minItemWidth + spacing)))

                            // Calculate actual item width
                            let itemWidth = (availableGridWidth - (spacing * (columnCount - 1))) / columnCount

                            // Target 2:1 aspect ratio for grid items
                            let gridItemHeight = itemWidth / 2.0

                            if appState.eventsSchedule.isEmpty {
                                emptyStateView(icon: "film", message: "No movie events scheduled right now.")
                            } else {
                                // Movie Events List
                                VStack(spacing: 32) {
                                    // 1. Hero Event (First item)
                                    if let heroEvent = appState.eventsSchedule.first {
                                        VStack(alignment: .leading, spacing: 16) {
                                            // Hero Card Phase
                                            // Hero Card Phase
                                            let _ = lastUpdate
                                            let isLobbyOverride = (heroEvent.index == 1 && (appState.eventsSchedule.first?.isFinished == true || appState.player.finishedEventIds.contains(appState.eventsSchedule.first?.id ?? "")))

                                            HeroEventCard(event: heroEvent, isLobbyOverride: isLobbyOverride, lastUpdate: lastUpdate, height: heroHeight) {
                                                await joinEvent(heroEvent)
                                            }
                                            // Removed drawingGroup() and shadow() to improve scrolling performance
                                            .id(heroEvent.id) // FORCE STATE RESET: Ensures background image updates when event changes
                                        }
                                    }

                                    // 2. Upcoming Events Grid
                                    if appState.eventsSchedule.count > 1 {
                                        VStack(alignment: .leading, spacing: 16) {
                                            Text("Upcoming Events")
                                                .font(.title2.weight(.bold))

                                                .foregroundColor(.primary)
                                                .padding(.horizontal, 4)

                                            // Increased minimum to 500 to ensure items fill the row on large screens (prevents empty 5th column gap)
                                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 500), spacing: 20)], spacing: 20) {
                                                ForEach(appState.eventsSchedule.dropFirst()) { event in
                                                    let isLobbyOverride = (event.index == 1 && (appState.eventsSchedule.first?.isFinished == true || appState.player.finishedEventIds.contains(appState.eventsSchedule.first?.id ?? "")))

                                                    HeroEventCard(event: event, isLobbyOverride: isLobbyOverride, lastUpdate: lastUpdate, height: gridItemHeight) {
                                                        await joinEvent(event)
                                                    }
                                                    // Removed drawingGroup() and shadow() to improve scrolling performance
                                                }
                                            }
                                        }
                                    }
                                }
                                // Removed max width constraint to allow stretching to edges
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .padding(.bottom, 40)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            print("📅 EventsView appeared")
            // Broadcast "Browsing Events" status
            Task {
                await SocialService.shared.updateWatchingStatus(mediaTitle: nil, mediaType: nil, imdbId: nil, roomId: nil, status: "Browsing Events")
            }

            // Load events if AppState doesn't have them yet
            if appState.allMovies.isEmpty {
                loadEvents()
            } else {
                isLoading = false
            }

            if appState.shouldAutoJoinLobby {
                attemptAutoJoin()
            }
        }
        .task {
             // Fix for Event Transition Regression:
             // Force view refresh every 10 seconds to check if events have finished/started
             // Capable of updating 'Lobby Open' status without full reload

             // Combined Timer: Updates 'currentTime' every second for countdowns
             // AND 'lastUpdate' every 10s for logic checks
             // Combined Timer: Updates 'lastUpdate' every 10s for logic checks
             // 'currentTime' updates have been moved to child components to prevent full view re-renders
             while !Task.isCancelled {
                 try? await Task.sleep(nanoseconds: 10_000_000_000) // 10s
                 await MainActor.run {
                     lastUpdate = Date()
                 }
             }
        }
        .onChange(of: timeService.isSynced) { isSynced in
            if isSynced {
                print("⏰ Time synced with server! AppState should automatically recalculate.")
                // appState.calculateDeterministicSchedule() happens internally or via timer
            }
        }
        // CRITICAL: Watch for flag change (e.g. if set while view is already visible)
        .onChange(of: appState.shouldAutoJoinLobby) { shouldJoin in
            if shouldJoin {
                attemptAutoJoin()
            }
        }
        // CRITICAL: Watch for schedule updates (race condition: flag set before schedule ready)
        .onChange(of: appState.eventsSchedule) { _ in
            if appState.shouldAutoJoinLobby {
                attemptAutoJoin()
            }
        }
    }

    private func attemptAutoJoin() {
        print("🔄 EventsView: Attempting Auto-Join...")

        let scheduledEvents = appState.eventsSchedule
        guard !scheduledEvents.isEmpty else {
            print("⚠️ Auto-Join skipped: No events scheduled yet")
            return
        }

        // Find the NEXT event (not the finished one)
        // Priority: Lobby event that is NOT finished
        if let lobbyEvent = scheduledEvents.first(where: { event in
            // ✅ Must not be in finished events list
            guard !appState.player.finishedEventIds.contains(event.id) else {
                return false
            }

            // ✅ Must not be marked as finished
            guard !event.isFinished else {
                return false
            }

            // ✅ Must be in lobby OR be the next event (index == 1)
            // We check index 1 specifically because index 0 might be the "Just Finished" event if schedule hasn't rotated yet
            let isInLobby = event.isInLobby
            let isNextEvent = event.index == 1

            return isInLobby || isNextEvent
        }) {
            print("🚀 Auto-joining NEXT event lobby: \(lobbyEvent.mediaItem.name) (index: \(lobbyEvent.index))")

            // Reset flag should happen in the destination view to ensure it can use it for instant join
            // appState.shouldAutoJoinLobby = false

            Task {
                // Determine wait time if needed (optional polish, but immediate is fine for lobby)
                await self.joinEvent(lobbyEvent)
            }
        }
        // Fallback: Check if there is a LIVE event that we haven't finished yet
        // (e.g. User joined late and previous event finished, but next one is already live)
        else if let liveEvent = scheduledEvents.first(where: {
            $0.isLive && !$0.isFinished && !appState.player.finishedEventIds.contains($0.id)
        }) {
            print("🚀 Auto-joining LIVE event: \(liveEvent.mediaItem.name)")

            // Reset flag should happen in the destination view
            // appState.shouldAutoJoinLobby = false

            Task {
                await self.joinEvent(liveEvent)
            }
        } else {
            print("⚠️ Auto-Join failed: No eligible event found to join.")
            // Do NOT reset flag here? Or should we?
            // Better to leave it for a moment in case schedule is about to update.
            // But to be safe against infinite retries, we might want to reset if we are sure.
            // For now, let's leave it true and let the .onChange(eventsSchedule) retry it.
            // But add a safety timeout?
        }
    }

    private func loadEvents() {
        Task {
            // Load movie events
            do {
                let config = try await apiClient.fetchTopMoviesForEvents()
                // Submit to AppState to begin scheduling
                await MainActor.run {
                    appState.updateEventConfig(config)
                    isLoading = false
                }
            } catch {
                print("❌ Failed to load movie events: \(error)")
                await MainActor.run {
                    isLoading = false
                }
            }
        }
    }

    // Legacy calculation logic and timers removed - all handled by AppState now


    private func joinEvent(_ event: EventItem) async {
        LogManager.shared.info("🎟️ Joining event: \(event.mediaItem.name) (Live: \(event.isLive))")
        print("   Event start time: \(event.startTime)")
        print("   Event duration: \(event.duration)s")
        print("   Current time: \(TimeService.shared.now)")
        print("   Is Live: \(event.isLive)")
        print("   Is In Lobby: \(event.isInLobby)")

        // Use deterministic room ID based on movie IMDB ID
        let roomId = "event_\(event.mediaItem.id)"

        // Create/join event room in Supabase for chat
        guard let userId = appState.currentUserId else {
            print("⚠️ No user ID - skipping room creation")
            createLocalEventRoom(event: event, roomId: roomId)
            return
        }

        do {
            // Variables to hold stream selection details to ensure synchronization
            var selectedStreamHash: String? = nil
            var selectedUnlockedURL: String? = nil
            var selectedQuality: String? = nil
            var selectedFileIdx: Int? = nil

            // Try to get existing room
            let existingRoom = try? await SupabaseClient.shared.getRoomState(roomId: roomId)
            if let existingRoom = existingRoom {
                print("✅ Event room already exists: \(roomId)")

                // CRITICAL: Extract stream details from the server room to ensure we match the host/server state
                // This prevents independent resolution which causes desync (Colombiana bug)
                selectedStreamHash = existingRoom.streamHash
                selectedUnlockedURL = existingRoom.unlockedStreamUrl
                selectedQuality = existingRoom.quality
                selectedFileIdx = existingRoom.fileIdx

                if let hash = selectedStreamHash {
                    print("\n✅ [SYNC VERIFICATION] FOUND SERVER KEY - Re-unlocking for fresh URL 🔑")
                    print("   Stored Hash: \(hash)")
                    print("   Cached URL: \(selectedUnlockedURL?.prefix(30) ?? "nil")...")

                    // Re-resolve using the hash to get a fresh CDN link
                    // This ensures the URL hasn't expired (RD links timeout after ~30min of inactivity)
                    do {
                        let result = try await StreamService.shared.resolveStream(
                            item: event.mediaItem,
                            quality: .fullHD,
                            season: nil,
                            episode: nil,
                            preferredInfoHash: hash,  // Forces exact match to seeded stream
                            filterExtended: true
                        )
                        // Use the freshly unlocked URL
                        selectedUnlockedURL = result.stream.url
                        selectedFileIdx = result.stream.fileIdx ?? selectedFileIdx
                        selectedQuality = "1080p"

                        print("   ✅ Fresh URL obtained: \(selectedUnlockedURL?.prefix(40) ?? "nil")...")

                        // Update database with fresh URL for future guests
                        try? await SupabaseClient.shared.updateRoomStream(
                            roomId: roomId,
                            streamHash: hash,
                            fileIdx: selectedFileIdx,
                            quality: selectedQuality,
                            unlockedUrl: selectedUnlockedURL
                        )
                        print("   ✅ Database updated with fresh URL\n")
                    } catch {
                        print("   ⚠️ Re-unlock failed: \(error.localizedDescription)")
                        print("   ⚠️ Falling back to cached URL (may be stale)\n")
                        // Keep using the cached selectedUnlockedURL as fallback
                    }
                } else if let url = selectedUnlockedURL, !url.isEmpty {
                    // NEW: Trust the URL if it exists, even if hash is missing (e.g. Debrid direct links)
                    print("\n✅ [SYNC VERIFICATION] FOUND SERVER URL (No Hash) 🔑")
                    print("   UnlockedURL: \(url.prefix(30))...")
                    print("   Quality: \(selectedQuality ?? "nil")")
                    print("   FileIdx: \(selectedFileIdx ?? -1)")
                    print("   🔗 Locking to server-provided unlocked URL\n")
                } else {
                    // REPAIR: Room exists but has no stream_hash OR URL - resolve and persist
                    print("⚠️ Room exists but has no stream_hash - repairing...")
                    do {
                        let result = try await StreamService.shared.resolveStream(
                            item: event.mediaItem,
                            quality: .fullHD, // Enforce 1080p for events
                            season: nil,
                            episode: nil,
                            preferredInfoHash: nil,
                            filterExtended: true
                        )
                        selectedStreamHash = result.stream.infoHash
                        selectedUnlockedURL = result.stream.url
                        selectedQuality = "1080p"
                        selectedFileIdx = result.stream.fileIdx

                        // Persist to database
                        try await SupabaseClient.shared.updateRoomStream(
                            roomId: roomId,
                            streamHash: selectedStreamHash,
                            fileIdx: selectedFileIdx,
                            quality: selectedQuality,
                            unlockedUrl: selectedUnlockedURL
                        )
                        print("✅ Room repaired with stream_hash: \(selectedStreamHash ?? "nil")")
                    } catch {
                        print("❌ Failed to repair room stream: \(error)")
                        // Continue anyway - client will resolve locally as fallback
                    }
                }

                // Join the existing room
                try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)
            } else {
                // Create new event room
                print("📝 Creating new event room: \(roomId)")

                // NEW: Resolve stream beforehand (System events are created lazily by first user)
                // This ensures the room is "seeded" with a valid stream for everyone
                var initialStreamHash: String? = nil
                var initialUnlockedUrl: String? = nil
                var initialSubtitleUrl: String? = nil
                var initialStreamTitle: String? = nil

                do {
                    print("⚡️ Resolving stream for system event creation...")
                    // System events default to FullHD
                    let result = try await StreamService.shared.resolveStream(
                        item: event.mediaItem,
                        quality: .fullHD,
                        season: nil,
                        episode: nil,
                        preferredInfoHash: nil,
                        filterExtended: true // Filter extended cuts for schedule accuracy
                    )
                    initialStreamHash = result.stream.infoHash
                    initialUnlockedUrl = result.stream.url
                    initialStreamTitle = result.stream.title

                    // NEW: Pick the first best subtitle to seed the room
                    if let subs = result.stream.subtitles, !subs.isEmpty {
                        // Prefer English if available, otherwise first
                        if let bestSub = subs.first(where: { $0.lang.lowercased().contains("en") == true }) {
                            initialSubtitleUrl = bestSub.url
                        } else {
                            initialSubtitleUrl = subs.first?.url
                        }
                        print("✅ Selected seed subtitle: \(initialSubtitleUrl ?? "nil")")
                    }

                    print("✅ Stream resolved for system event: \(result.stream.title)")
                    print("   Hash: \(initialStreamHash ?? "nil")")
                    print("   URL: \(initialUnlockedUrl?.prefix(30) ?? "nil")...")
                } catch {
                    print("⚠️ Failed to resolve seed stream for system event: \(error)")
                    // Continue creation without a hash (clients will have to resolve themselves as fallback)
                }

                // Use the resolved hash for our local state too
                selectedStreamHash = initialStreamHash
                // Also capture subtitle URL for local playback if valid
                if initialSubtitleUrl != nil {
                     // We don't have a local var for it yet, but we will pass it to createRoom
                }

                _ = try await SupabaseClient.shared.createRoom(
                    id: roomId,
                    name: event.mediaItem.name,
                    hostUserId: nil, // System hosted, no user is host
                    hostUsername: "RedLemon Events",
                    streamHash: initialStreamHash,
                    imdbId: event.mediaItem.id,
                    posterUrl: event.mediaItem.poster,
                    backdropUrl: event.mediaItem.background,
                    season: nil,
                    episode: nil,
                    isPublic: true,
                    unlockedStreamUrl: initialUnlockedUrl,
                    subtitleUrl: initialSubtitleUrl,
                    sourceQuality: initialStreamTitle, // Internal Note #91: persist title for fallback
                    createdAt: event.startTime
                )
                // Join the room we just created
                try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: false)
            }

            // If we are joining an existing room, we need to fetch the subtitle URL from it if we didn't just create it
            var finalSubtitleUrl: String? = nil
            if let existing = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                 finalSubtitleUrl = existing.subtitleUrl
            }

            createLocalEventRoom(
                event: event,
                roomId: roomId,
                streamHash: selectedStreamHash,
                unlockedStreamUrl: selectedUnlockedURL,
                quality: selectedQuality,
                fileIdx: selectedFileIdx,
                subtitleUrl: finalSubtitleUrl
            )
        } catch {
            let errorString = String(describing: error)
            // Handle race condition: If room creation failed because it already exists (409/duplicate key),
            // it means another user beat us to it. We should join that room instead of falling back to local.
            if errorString.contains("409") || errorString.contains("duplicate key") {
                print("⚠️ Race condition detected: Room created by another user while joining. Retrying as guest...")

                // 1. Fetch the room AND wait for stream details (winner may still be resolving)
                // Per Internal Note: Stream resolution can take 10-15s, so we need longer retries
                var roomState: SupabaseRoom? = nil
                for i in 1...10 {
                    if let state = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                        // Check if stream details are populated (winner finished resolving)
                        if state.unlockedStreamUrl != nil || state.streamHash != nil {
                            roomState = state
                            print("✅ Race recovery: Stream details available on attempt \(i)")
                            break
                        }
                        print("⏳ Retry \(i)/10: Room exists but stream not resolved yet...")
                    } else {
                        print("⏳ Retry \(i)/10: Room not visible yet...")
                    }
                    try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5s delay
                }

                if let roomState = roomState {
                    LogManager.shared.info("✅ Recovered from race condition! Joining existing room.")

                    // 2. Join it
                    try? await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)

                    // 3. Check if we need to resolve ourselves (winner's URL might still be nil)
                    var finalUnlockedUrl = roomState.unlockedStreamUrl
                    let finalStreamHash = roomState.streamHash
                    var finalFileIdx = roomState.fileIdx
                    var finalQuality = roomState.quality

                    if finalUnlockedUrl == nil {
                        print("⚠️ Winner's stream URL not ready - resolving using hash...")
                        if let hash = finalStreamHash {
                            // Re-resolve with preferred hash to match winner's stream
                            do {
                                let result = try await StreamService.shared.resolveStream(
                                    item: event.mediaItem,
                                    quality: .fullHD,
                                    season: nil,
                                    episode: nil,
                                    preferredInfoHash: hash,
                                    filterExtended: true
                                )
                                finalUnlockedUrl = result.stream.url
                                finalFileIdx = result.stream.fileIdx ?? finalFileIdx
                                finalQuality = "1080p"
                                print("✅ Race recovery: Re-resolved stream using hash: \(finalUnlockedUrl?.prefix(40) ?? "nil")...")
                            } catch {
                                print("⚠️ Race recovery: Re-resolution failed: \(error.localizedDescription)")
                            }
                        } else {
                            // No hash available - resolve independently as last resort
                            print("⚠️ Race recovery: No hash available - resolving independently...")
                            do {
                                let result = try await StreamService.shared.resolveStream(
                                    item: event.mediaItem,
                                    quality: .fullHD,
                                    season: nil,
                                    episode: nil,
                                    preferredInfoHash: nil,
                                    filterExtended: true
                                )
                                finalUnlockedUrl = result.stream.url
                                finalFileIdx = result.stream.fileIdx
                                finalQuality = "1080p"
                                print("✅ Race recovery: Independent resolution succeeded")
                            } catch {
                                print("❌ Race recovery: Independent resolution failed: \(error.localizedDescription)")
                            }
                        }
                    }

                    // 4. Use the stream details to ensure sync
                    createLocalEventRoom(
                        event: event,
                        roomId: roomId,
                        streamHash: finalStreamHash,
                        unlockedStreamUrl: finalUnlockedUrl,
                        quality: finalQuality,
                        fileIdx: finalFileIdx
                    )
                    return
                } else {
                    print("❌ Failed to recover from race condition: Room still not visible after retries.")
                }
            }

            print("❌ Failed to create/join event room: \(error)")
            LogManager.shared.error("❌ Failed to create/join event room", error: error)
            // Fall back to local-only room (no chat sync)
            createLocalEventRoom(event: event, roomId: roomId)
        }
    }

    @MainActor
    private func createLocalEventRoom(
        event: EventItem,
        roomId: String,
        streamHash: String? = nil,
        unlockedStreamUrl: String? = nil,
        quality: String? = nil,
        fileIdx: Int? = nil,
        subtitleUrl: String? = nil
    ) {
        // Calculate current position for live events
        let now = TimeService.shared.now
        let position: Double
        if event.isLive {
            // For live events, calculate how far into the movie we should start
            position = now.timeIntervalSince(event.startTime)
            print("🎬 Live event - calculating position: \(position) seconds")
            print("   Event start time: \(event.startTime)")
            print("   Current time: \(now)")
        } else {
            position = 0
            print("🎭 Upcoming event - position: 0")
        }

        // Parse quality string to VideoQuality enum if possible
        var parsedQuality: VideoQuality = .fullHD // Default to FullHD for events
        if let q = quality, let pq = VideoQuality(rawValue: q) {
            parsedQuality = pq
        }

        // Create a WatchPartyRoom for this event
        let room = WatchPartyRoom(
            id: roomId,
            hostId: "system",
            hostName: "RedLemon System",
            mediaItem: event.mediaItem,
            season: nil,
            episode: nil,
            quality: parsedQuality,
            sourceQuality: nil,
            description: "Live Event",
            posterURL: event.mediaItem.poster,
            participants: [],
            participantCount: event.participantCount,  // Pass through event's count
            maxParticipants: 5000,
            state: event.isLive ? .playing : .lobby, // Live events start playing, upcoming go to lobby
            createdAt: event.startTime,
            lastActivity: event.startTime,
            playlist: nil,  // Events don't use playlists
            currentPlaylistIndex: 0,
            isPublic: true,
            lobbyDuration: event.isLive ? 0 : 600,  // No lobby for live events, 10 min for upcoming
            shouldLoop: false,
            isPersistent: true,  // Events are persistent
            playbackPosition: nil,
            runtime: nil,
            selectedStreamHash: streamHash,
            selectedFileIdx: fileIdx,
            selectedQuality: quality,
            unlockedStreamURL: unlockedStreamUrl,
            subtitleUrl: subtitleUrl
        )

        print("   Room createdAt: \(room.createdAt)")
        print("   Room state: \(room.state)")

        appState.player.currentEventId = event.id // Track current event ID
        appState.player.isEventPlayback = true // Mark as event playback for seamless transition support
        appState.player.currentWatchMode = .watchParty // Enable watch party mode for chat
        appState.player.currentRoomId = roomId // Linked to event ID

        appState.player.currentWatchPartyRoom = room
        appState.player.isWatchPartyHost = false // User is always guest in system events

        if event.isLive {
            // For live events, set resume position and go directly to player
            appState.player.eventStartTime = event.startTime // Opt-in to robust MPV sync logic
            appState.player.resumeFromTimestamp = max(0, position)
            print("   Setting resumeFromTimestamp to: \(appState.player.resumeFromTimestamp!)")
            print("🎬 Live event - starting playback immediately (no lobby)")

            // Set selection details for player
            appState.player.selectedMediaItem = event.mediaItem
            appState.selectedSeason = nil
            appState.selectedEpisode = nil

            // Trigger playback directly like TV events do
            Task {
                await appState.player.playMedia(
                    event.mediaItem,
                    quality: .fullHD,
                    watchMode: .watchParty,
                    roomId: roomId,
                    isHost: false,
                    isEvent: true
                )
            }
        } else {
            // For upcoming events, go to lobby
            print("🎭 Upcoming event - going to lobby")
            appState.currentView = .watchPartyLobby
        }
    }


    private func emptyStateView(icon: String, message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 48))
                .foregroundColor(.gray)
            Text(message)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
    }
}


struct HeroEventCard: View {
    let event: EventItem
    var isLobbyOverride: Bool = false // Allow forcing lobby open (e.g. when previous event finishes)
    // removed currentTime
    var lastUpdate: Date // Force re-render on timer tick
    var height: CGFloat = 360 // Default height
    let onJoin: () async -> Void
    @EnvironmentObject var appState: AppState

    @State private var isJoining = false

    var body: some View {
        Button(action: {
            // Allow joining if:
            // 1. It's the live event (index 0) and not finished, OR
            // 2. It's the next event (index 1) and in lobby state (or override is true)
            if (event.isLive && !event.isFinished) || event.isInLobby || isLobbyOverride {
                guard !isJoining else { return }
                isJoining = true
                Task {
                    // Slight delay to ensure "Joining" state renders and provides visual feedback
                    // especially for fast operations or when the main thread is about to be busy
                    try? await Task.sleep(nanoseconds: 50_000_000) // 0.05s
                    await onJoin()
                    // We don't strictly need to set isJoining = false here if we navigate away,
                    // but it's good practice in case navigation fails or is cancelled.
                    // However, for this UX, sticking to "Loading..." until the view disappears is usually better.
                    // But if it fails, we should reset.
                    // For now, let's reset it after a timeout or if we assume success/fail handling happens elsewhere.
                    // Actually, since onJoin is async, we can wait for it.
                    // If detailed error handling isn't there, we might want to reset locally.
                    // Let's reset it on main actor after await.
                    await MainActor.run {
                        isJoining = false
                    }
                }
            }
        }) {
            HeroEventCardContent(
                event: event,
                isLobbyOverride: isLobbyOverride,
                isJoining: isJoining,
                lastUpdate: lastUpdate,
                height: height
            )
        }
        .buttonStyle(.scalableMedia)
        .opacity(event.isFinished ? 0.6 : 1.0)
        // Timer removed - relying on parent passing currentTime
        // Timer removed - relying on parent passing currentTime
        // Sync cache check moved to HeroEventCardContent to fix build error
        .task {
            // Lazy Hydration: Check if we have background art
            if event.mediaItem.background == nil && !event.mediaItem.id.isEmpty {
                 print("💧 HeroEventCard: Missing background for \(event.mediaItem.name) (\(event.mediaItem.id)). Attempting lazy hydration...")

                 do {
                     let enriched = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: event.mediaItem.id, type: "movie")

                     if enriched.background != nil {
                         print("✅ HeroEventCard: Hydrated metadata for \(enriched.name). Updating AppState...")
                         await MainActor.run {
                             appState.updateSingleMovie(enriched)
                         }
                     }
                 } catch {
                     print("⚠️ HeroEventCard: Failed to hydrate metadata: \(error)")
                 }
            }
        }
    }
}

// Helper view for the card content to keep the main body clean and flat
// Helper view for the card content to keep the main body clean and flat
struct HeroEventCardContent: View {
    let event: EventItem
    let isLobbyOverride: Bool
    let isJoining: Bool
    // removed currentTime
    let lastUpdate: Date
    let height: CGFloat

    @State private var cachedImage: NSImage?

    private func loadImage() async {
        // Optimization: If already loaded synchronously by onAppear, skip async work
        if cachedImage != nil { return }

        let url = event.mediaItem.backgroundURL ?? event.mediaItem.posterURL
        guard let imageURL = url else { return }

        let cacheKey = imageURL.absoluteString

        // Check cache first
        if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
            // Decode OFF the main thread
            if let img = NSImage(data: cachedData) {
                // Populate fast cache
                EventsView.EventImageCache.shared.setObject(img, forKey: cacheKey as NSString)

                await MainActor.run {
                    self.cachedImage = img
                }
            }
            return
        }

        // Fetch
        do {
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            // Cache
            await CacheManager.shared.setImageData(key: cacheKey, value: data)

            // Decode newly fetched data
            if let img = NSImage(data: data) {
                // Populate fast cache
                EventsView.EventImageCache.shared.setObject(img, forKey: cacheKey as NSString)

                await MainActor.run {
                    self.cachedImage = img
                }
            }
        } catch {
            print("❌ Failed to load hero image: \(error)")
        }
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            // LAYER 0: Sizing Anchor (Stable Layout)
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: height)
                .frame(maxWidth: .infinity)

            // LAYER 1: Background Image
            // LAYER 1: Background Image
            ZStack {
                // Base: Placeholder (Always visible to maintain layout stability)
                Rectangle().fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: height)
                .frame(maxWidth: .infinity)

                // Overlay: Image (Appears on top when loaded)
                if let nsImage = cachedImage {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: height)
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
            }
            .allowsHitTesting(false)
            .task {
                await loadImage()
            }
            .onAppear {
                // SYNC CHECK: Check memory cache immediately to prevent flickers in LazyVGrid
                if cachedImage == nil {
                    let url = event.mediaItem.backgroundURL ?? event.mediaItem.posterURL
                    if let url = url {
                        let key = url.absoluteString as NSString
                        if let cached = EventsView.EventImageCache.shared.object(forKey: key) {
                            self.cachedImage = cached
                        }
                    }
                }
            }

            // LAYER 2: Gradients
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.7), .clear, .black.opacity(0.9)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }

            // LAYER 3: Content (Will be nested inside this ZStack)

            VStack(alignment: .leading, spacing: 0) {
                 // Top Section: Status Badge
                 HStack {
                     if event.isFinished {
                         HStack(spacing: 6) {
                             Image(systemName: "checkmark.circle.fill")
                                 .font(.system(size: 11))
                             Text("EVENT FINISHED")
                                 .font(.system(size: 13, weight: .bold))
                                 .foregroundColor(.white)
                         }
                         .padding(.horizontal, 12)
                         .padding(.vertical, 6)
                         .background(
                             Capsule()
                                 .fill(Color.gray.opacity(0.8))
                                 .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 2)
                         )

                     } else if event.isInLobby || isLobbyOverride {
                         EventLobbyStatusBadge(event: event)
                     } else if event.isLive {
                         HStack(spacing: 6) {
                             Circle()
                                 .fill(Color.red)
                                 .frame(width: 10, height: 10)
                             Text("LIVE NOW")
                                 .font(.system(size: 13, weight: .bold))
                                 .foregroundColor(.white)
                         }
                         .padding(.horizontal, 12)
                         .padding(.vertical, 6)
                         .background(
                             Capsule()
                                 .fill(Color.red.opacity(0.9))
                                 .shadow(color: .red.opacity(0.5), radius: 8, x: 0, y: 2)
                         )
                     } else if event.isUpcoming {
                         HStack(spacing: 6) {
                             Image(systemName: "clock.fill")
                                 .font(.system(size: 11))
                             // Static start time doesn't need constant updates
                             Text("STARTS " + DateFormatter.shortTime.string(from: event.startTime))
                                 .font(.system(size: 12, weight: .semibold))
                         }
                         .foregroundColor(.white)
                         .padding(.horizontal, 12)
                         .padding(.vertical, 6)
                         .background(
                             Capsule()
                                 .fill(Color.orange.opacity(0.9))
                                 .shadow(color: .orange.opacity(0.3), radius: 6, x: 0, y: 2)
                         )
                     }

                     Spacer()

                     // Participant Count
                     if event.participantCount > 0 {
                         HStack(spacing: 4) {
                             Image(systemName: "person.2.fill")
                                 .font(.system(size: 11))
                             Text("\(event.participantCount)")
                                 .font(.system(size: 13, weight: .semibold))
                         }
                         .foregroundColor(.white)
                         .padding(.horizontal, 10)
                         .padding(.vertical, 6)
                         .background(
                             Capsule()
                                 .fill(Color.white.opacity(0.2))
                                 .overlay(
                                     Capsule()
                                         .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                 )
                         )
                     }
                 }
                 .padding(.top, 20)
                 .padding(.horizontal, 20)

                 Spacer()

                 // Bottom Section: Logo, Metadata, Progress
                 VStack(alignment: .leading, spacing: 12) {
                     // Logo or Title
                     if let logoURL = event.mediaItem.logoURL {
                         AsyncImage(url: logoURL) { image in
                             image
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                         } placeholder: {
                             Text(event.mediaItem.name)
                                 .font(.system(size: 28, weight: .bold))
                                 .foregroundColor(.white)
                                 .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                         }
                         .frame(maxWidth: 300, maxHeight: 80, alignment: .leading)
                         .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 4)
                     } else {
                         Text(event.mediaItem.name)
                             .font(.system(size: 28, weight: .bold))
                             .foregroundColor(.white)
                             .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                     }

                     // Metadata Row
                     HStack(spacing: 8) {
                         if let year = event.mediaItem.releaseInfo {
                             Text(year)
                                 .font(.system(size: 14, weight: .medium))
                         }
                         if event.mediaItem.releaseInfo != nil && event.mediaItem.runtime != nil {
                             Text("•")
                                 .font(.system(size: 14))
                         }
                         if let runtime = event.mediaItem.runtime {
                             Text(runtime)
                                 .font(.system(size: 14, weight: .medium))
                         }
                     }
                     .foregroundColor(.white.opacity(0.9))

                     // Progress Bar (if live)
                     if event.isLive {
                        EventLiveProgressView(event: event)
                     }
                 }
                 .padding(24)
            }

            // LAYER 4: Loading State (Safe Mode: No Spinner/Anim)
            if isJoining {
                ZStack {
                    Color.black.opacity(0.6)
                    VStack(spacing: 8) {
                        Text("Joining...")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .allowsHitTesting(false)
            }

            // LAYER 5: Status Border (Formerly in .overlay)
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    event.isFinished ? Color.gray.opacity(0.3) :
                    (event.isInLobby ? Color.blue.opacity(0.5) :
                    (event.isLive ? Color.red.opacity(0.5) : Color.white.opacity(0.1))),
                    lineWidth: 2
                )
        }
        .cornerRadius(12) // Round the entire card
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 6)
        .frame(maxWidth: .infinity) // Center the constrained card
    }
}

// Optimized component to isolate countdown timer updates
struct EventLobbyStatusBadge: View {
    let event: EventItem
    @State private var now = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 6) {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 8, height: 8)
                    .shadow(color: .yellow.opacity(0.6), radius: 4)
                Text("Lobby Open")
                    .font(.body.weight(.bold))
                    .foregroundColor(.white)
            }

            // Add countdown timer
            if event.startTime.timeIntervalSince(now) > 0 {
                Text("Starts in \(formatDuration(event.startTime.timeIntervalSince(now)))")
                    .font(.system(size: 11, weight: .semibold))

                    .foregroundColor(.white.opacity(0.9))
                    .monospacedDigit()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
        )
        .onReceive(timer) { input in
            now = input
        }
    }

    func formatDuration(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? ""
    }
}

// Optimized component to isolate live progress bar updates
struct EventLiveProgressView: View {
    let event: EventItem
    @State private var now = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var elapsedTime: TimeInterval {
        return now.timeIntervalSince(event.startTime)
    }

    var remainingTime: TimeInterval {
        return event.duration - elapsedTime
    }

    var progress: Double {
        return min(max(elapsedTime / event.duration, 0), 1)
    }

    func formatEventTime(_ interval: TimeInterval) -> String {
         let formatter = DateComponentsFormatter()
         formatter.allowedUnits = [.hour, .minute, .second]
         formatter.zeroFormattingBehavior = .pad
         return formatter.string(from: interval) ?? "0:00"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Custom Progress Bar (GPU Compatible)
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 4)
                        .cornerRadius(2)

                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geo.size.width * CGFloat(progress), height: 4)
                        .cornerRadius(2)
                }
            }
            .frame(height: 4)

            HStack {
                Text(formatEventTime(elapsedTime))
                    .font(.system(size: 13, weight: .medium))
                Spacer()
                Text("-\(formatEventTime(remainingTime))")
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(.white.opacity(0.8))
        }
        .padding(.top, 4)
        .onReceive(timer) { input in
            now = input
        }
    }
}

extension DateFormatter {
    static let shortTime: DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .short
        return f
    }()
}


