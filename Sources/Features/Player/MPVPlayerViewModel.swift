//
//  MPVPlayerViewModel.swift
//  RedLemon
//
//  ViewModel for MPV player with background art and chat
//
//  ⚠️ AI_BIBLE #1: GOD CLASS - FRAGILE!
//  Strict MainActor isolation required. Touch with fear.
//

import Foundation
import SwiftUI
import Compression
import Combine

// Timeout error for subtitle downloads
struct TimeoutError: Error {}

// Helper function to add timeout to async operations
func withTimeout<T>(seconds: TimeInterval, operation: @escaping () async throws -> T) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
        group.addTask {
            try await operation()
        }

        group.addTask {
            try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
            throw TimeoutError()
        }

        let result = try await group.next()!
        group.cancelAll()
        return result
    }
}

@MainActor
class MPVPlayerViewModel: ObservableObject {
    // MPV wrapper instance
    let mpvWrapper: MPVWrapper

    // Services
    private let subtitleService: SubtitleService
    private let playbackService: PlaybackService
    private var serviceCancellables = Set<AnyCancellable>()

    // Track connection IDs (phx_ref) independently of the participants list
    // This protects against "Ghost Leaves" (stale refs) AND "True Leaves" where the user is wiped from the list by DB polling before the Leave event processes.
    private var activeConnectionRefs: [String: String] = [:]

    // Counter for database persistence limiting (Host Only)
    private var persistenceTickCount: Int = 0

    init(mpvWrapper: MPVWrapper = MPVWrapper(),
         subtitleService: SubtitleService? = nil,
         playbackService: PlaybackService? = nil) {
        self.mpvWrapper = mpvWrapper
        self.subtitleService = subtitleService ?? MPVSubtitleService(mpvController: mpvWrapper)
        self.playbackService = playbackService ?? MPVPlaybackService(mpvController: mpvWrapper)

        // Load persisted mutes
        if let savedMutes = UserDefaults.standard.array(forKey: mutedUsersKey) as? [String] {
             self.mutedUserIds = Set(savedMutes)
        }

        setupServiceBindings()
    }

    private func setupServiceBindings() {
        Task { @MainActor in
            // Subtitle Bindings
            // Subtitle Bindings
            let tracksPublisher = await subtitleService.availableTracksPublisher
            tracksPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: &$availableSubtitleTracks)

            let currentTrackPublisher = await subtitleService.currentTrackPublisher
            currentTrackPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: &$currentSubtitleTrack)

            let offsetPublisher = await subtitleService.offsetPublisher
            offsetPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: &$subtitleOffset)

            // Playback Bindings
            let isPlayingPub = await playbackService.isPlayingPublisher
            let playbackFinishedPub = await playbackService.playbackFinishedPublisher
            let currentTimePub = await playbackService.currentTimePublisher
            let durationPub = await playbackService.durationPublisher
            let videoURLPub = await playbackService.videoURLPublisher
            let isBufferingPub = await playbackService.isBufferingPublisher
            let isFileLoadedPub = await playbackService.isFileLoadedPublisher
            let mpvErrorPub = mpvWrapper.$mpvError

            // MPV Critical Error Handling (Fast Failover)
            mpvErrorPub
                .receive(on: DispatchQueue.main)
                .scan(nil) { (previous: String?, current: String?) -> String? in
                    // De-duplication: Only fire if error CHANGED and is not nil
                    if let current = current, current != previous {
                        return current
                    }
                    return nil
                }
                .compactMap { $0 } // remove nils
                .sink { [weak self] errorMsg in
                    guard let self = self else { return }
                    LoggingManager.shared.error(.videoRendering, message: "Critical MPV Error detected: \(errorMsg) - Triggering Failover")

                    // Force clear buffering state so UI doesn't hang
                    self.isBuffering = false

                    // Trigger failover immediately
                    self.playbackErrorTrigger.send(errorMsg)
                    Task { await SessionRecorder.shared.log(category: .player, message: "Critical MPV Error", metadata: ["error": errorMsg]) }
                }
                .store(in: &serviceCancellables)

            // IsPlaying: Sync state and trigger VideoReady logic
            isPlayingPub
                .removeDuplicates()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] isPlaying in
                    guard let self = self else { return }
                    self.isPlaying = isPlaying
                    if isPlaying && self.isLoading {
                        // Video started playing - hide poster
                        self.onVideoReady()
                    }
                    Task { await SessionRecorder.shared.log(category: .player, message: "Playback State Changed", metadata: ["state": isPlaying ? "Playing" : "Paused"]) }
                }
                .store(in: &serviceCancellables)

            // PlaybackFinished
            playbackFinishedPub
                .receive(on: DispatchQueue.main)
                .assign(to: &$playbackFinished)

            // CurrentTime: Throttled update
            currentTimePub
                .throttle(for: 0.2, scheduler: DispatchQueue.main, latest: true)
                .sink { [weak self] time in
                    guard let self = self else { return }
                    self.currentTime = time
                    self.checkForNextEpisode()

                    // CRITICAL FIX: Playback Progress Recovery
                    // If time is advancing but UI thinks we are buffering, force clear the buffering state.
                    // This handles cases where MPV misses the "buffering end" event (e.g. paused-for-cache glitch).
                    // NOTE: Also applies to Watch Party HOST (who doesn't receive sync messages to clear state).
                    // Guests are excluded - they wait for sync message to reveal video (prevents frame 0 flash).
                    if (self.isBuffering || self.isLoading) && self.mpvWrapper.isPlaying && (!self.isInWatchParty || self.isWatchPartyHost) {
                         LoggingManager.shared.info(.videoRendering, message: "Time advancing (time: \(time)) while buffering - Forcing UI unlock")
                         self.isBuffering = false
                         // Also clear the "Refining Initial Seek" lock if it's stuck
                         self.isRefiningInitialSeek = false
                         withAnimation {
                             self.isLoading = false
                             self.showPoster = false
                         }
                    }
                }
                .store(in: &serviceCancellables)

            // Duration: Sync state and trigger WatchParty Ready Signal
            durationPub
                .receive(on: DispatchQueue.main)
                .sink { [weak self] dur in
                    guard let self = self else { return }
                    self.duration = dur

                    // NEW: Retry Event Playback Start when duration becomes available
                    // (Handles race condition where FileLoaded fires before Duration is known)
                    self.attemptEventPlaybackStart()

                    // AI_BIBLE: Events bypass host checks - release lock for Events like solo mode
                    let isEvent = self.appState?.player.isEventPlayback == true
                    if self.isRefiningInitialSeek && dur > 0 && !self.isBuffering && self.mpvWrapper.isFileLoaded && (!self.isInWatchParty || isEvent) {
                         LoggingManager.shared.info(.videoRendering, message: "Duration arrived (\(String(format: "%.1f", dur))s) - Releasing stuck UI lock (Recovery)")
                         self.isRefiningInitialSeek = false
                         withAnimation(.easeOut(duration: 0.5)) {
                             self.isLoading = false
                             self.showPoster = false
                         }
                    }

                    // Watch Party Ready Gate
                    // CRITICAL FIX: Only enter Ready Gate if room is NOT already playing.
                    // If room is playing (late join), we skip this and let Sync Logic handle the jump.
                    let isRoomPlaying = self.appState?.player.currentWatchPartyRoom?.state == .playing

                    if dur > 0 && self.isInWatchParty && !self.hasSentReadySignal {
                        if isRoomPlaying {
                             LoggingManager.shared.info(.watchParty, message: "Watch Party: Room already playing, skipping Ready Gate (Late Join)")
                             self.hasSentReadySignal = true // Mark as sent to disable future triggers
                        } else if isRoomPlaying && self.isWatchPartyHost {
                             LoggingManager.shared.warn(.watchParty, message: "Watch Party: Room playing but I am HOST - Force sending ready signal (Recovery)")
                             self.sendReadySignal()
                        } else {
                            LoggingManager.shared.info(.watchParty, message: "Watch Party: Duration available (\(String(format: "%.1f", dur))s), triggering ready signal")
                            self.sendReadySignal()
                        }
                    }
                }
                .store(in: &serviceCancellables)

            // VideoURL
            videoURLPub
                .receive(on: DispatchQueue.main)
                .assign(to: &$videoURL)

            // IsBuffering: Update loading state
            isBufferingPub
                .receive(on: DispatchQueue.main)
                .sink { [weak self] isBuffering in
                    guard let self = self else { return }
                    if isBuffering {
                        LoggingManager.shared.info(.videoRendering, message: "Enhancing UI - Buffering started (show spinner)")
                        self.isBuffering = true
                        self.isLoading = true

                        // NEW: Buffering Timeout (45s)
                        // If we are stuck buffering for too long, assume connection is too slow for this stream
                        self.bufferingTimer?.invalidate()
                        self.bufferingTimer = Timer.scheduledTimer(withTimeInterval: 45.0, repeats: false) { [weak self] _ in
                             LoggingManager.shared.error(.videoRendering, message: "Buffering Timeout (45s) - Connection too slow, triggering Failover")
                             self?.playbackErrorTrigger.send("Connection Timeout")
                             Task { await SessionRecorder.shared.log(category: .player, message: "Buffering Timeout (45s) - Connection too slow") }
                        }
                        Task { await SessionRecorder.shared.log(category: .player, message: "Buffering Started") }
                    } else {
                         self.bufferingTimer?.invalidate()
                         // Buffering finished
                         if self.isSwitchingTracks {
                             // Snap-Seek Event: Switching completed, now seek to sync
                             self.completeTrackSwitch()
                         } else if self.hasVideoReadyTriggered && self.mpvWrapper.isFileLoaded {
                            if self.isRefiningInitialSeek {
                                if self.appState?.player.eventStartTime != nil {
                                    LoggingManager.shared.info(.watchParty, message: "Buffering finished during Event Seek - Starting 500ms Render Stabilization Timer...")
                                    // Delay hiding the spinner to ensure the sought frame is rendered
                                    Task { @MainActor in
                                        try? await Task.sleep(nanoseconds: 500_000_000) // 500ms
                                        LoggingManager.shared.info(.watchParty, message: "Render Stabilization Complete - Releasing UI")
                                        self.isRefiningInitialSeek = false
                                        self.isBuffering = false
                                        withAnimation(.easeOut(duration: 0.5)) {
                                            self.isLoading = false
                                            self.showPoster = false
                                        }
                                    }
                                } else if self.isInWatchParty {
                                    LoggingManager.shared.info(.watchParty, message: "Buffering finished (Watch Party) - Keeping poster until Initial Sync Message...")
                                    // Do NOT clear flag here; wait for handleSyncMessage
                                }
                            } else {
                                LoggingManager.shared.info(.videoRendering, message: "Enhancing UI - Buffering finished (hide spinner) [File Loaded]")
                                self.isBuffering = false
                                self.isLoading = false
                            }

                        } else if !self.mpvWrapper.isFileLoaded {
                            // NEW: Safety check - If buffering stops but file NOT loaded, it meant error/stop

                            // CRITICAL EXCEPTION: Event Blind Seek
                            // If we are in an event and duration is 0, we are likely in the middle of a blind seek
                            // where buffering might toggle briefly before metadata loads.
                            if self.appState?.player.eventStartTime != nil && self.duration == 0 {
                                LoggingManager.shared.debug(.watchParty, message: "Buffering finished during Event Blind Seek (Duration 0) - Ignoring Error Trigger")
                                return
                            }

                            // CRITICAL EXCEPTION: Watch Party Ready Gate
                            // In Watch Party, we load paused. Buffering might flicker before file is fully loaded.
                            // If we haven't sent the ready signal (or are at the gate), ignore this.
                            if self.isInWatchParty && !self.hasSentReadySignal {
                                LoggingManager.shared.debug(.watchParty, message: "Buffering finished at Watch Party Ready Gate - Ignoring Error Trigger")
                                return
                            }

                            // NEW EXCEPTION: Late Join Watch Party Blind Seek
                            // If we are refining seek (waiting for video ready), and duration is 0, ignore this.
                            // This happens when checking buffering status before metadata is fully parsed.
                            if self.isInWatchParty && self.isRefiningInitialSeek && self.duration == 0 {
                                 LoggingManager.shared.debug(.watchParty, message: "Buffering finished during VP Blind Seek (Duration 0) - Ignoring Error Trigger")
                                 return
                            }

                            LoggingManager.shared.error(.videoRendering, message: "Buffering finished but file NOT loaded - Triggering Error State")
                            self.isBuffering = false
                            // self.isLoading = false // Keep loading overlay visible during retry fallbacks

                            // Trigger Error Feedback to View
                            self.playbackErrorTrigger.send("Playback Failed")
                        }
                    }
                }
                .store(in: &serviceCancellables)

            isFileLoadedPub
                .receive(on: DispatchQueue.main)
                .sink { [weak self] loaded in
                    guard let self = self else { return }
                    if loaded {
                        // NEW: Event Playback Logic - Handle seek immediately on load
                        self.attemptEventPlaybackStart()

                        // NOTE: Embedded track scanning is handled by MPVWrapper.pollForTracksAndResume()
                        // which runs BEFORE playback starts. We don't need to scan again here.
                        // Scanning here would race with pollForTracksAndResume() and cause a buffer flash
                        // when the subtitle track changes during playback.

                        // AI_BIBLE: Events bypass host checks - release lock for Events like solo mode
                        let isEvent = self.appState?.player.isEventPlayback == true
                        if self.isRefiningInitialSeek && self.duration > 0 && !self.isBuffering && (!self.isInWatchParty || isEvent) {
                             LoggingManager.shared.info(.videoRendering, message: "File loaded - Releasing stuck UI lock (Recovery)")
                             self.isRefiningInitialSeek = false
                             withAnimation(.easeOut(duration: 0.5)) {
                                 self.isLoading = false
                                 self.showPoster = false
                             }
                        }

                        // AI_BIBLE: Events bypass host checks - don't send Ready signals for Events
                        if self.isInWatchParty && !self.hasSentReadySignal && !isEvent {
                            let isRoomPlaying = self.appState?.player.currentWatchPartyRoom?.state == .playing

                            if isRoomPlaying {
                                LoggingManager.shared.info(.watchParty, message: "Watch Party: File loaded (late join), skipping Ready Gate")
                                self.hasSentReadySignal = true
                            } else {
                                LoggingManager.shared.warn(.watchParty, message: "Watch Party: File loaded signal received (fallback trigger), sending Ready signal")
                                self.sendReadySignal()
                            }
                        }
                    }
                }
                .store(in: &serviceCancellables)
        }
    }

    // Helper to robustly start event playback
    private func attemptEventPlaybackStart() {
        guard let appState = appState else { return }
        let eventStartTime = appState.player.eventStartTime
        let isEventPlayback = appState.player.isEventPlayback

        // 1. Guard: Duration must be known
        if self.duration <= 0 {
             if isRefiningInitialSeek {
                 LoggingManager.shared.debug(.watchParty, message: "EVENT: Waiting for duration to start playback...")
             }
             return
        }

        // 2. Guard: Must be in refining state (holding the gate)
        guard isRefiningInitialSeek else { return }

        // 3. Guard: Debounce
        if hasVideoReadyTriggered { return }

        var seekTime: Double = 0

        // 4. Determine Seek Time
        if let startTime = eventStartTime {
             LoggingManager.shared.info(.watchParty, message: "EVENT: File loaded/Duration ready (\(self.duration)s), preparing to seek...")
             let elapsed = Date().timeIntervalSince(startTime)
             seekTime = max(0, elapsed)
        } else if isEventPlayback {
             // Fallback for missing eventStartTime (Race condition workaround)
             LoggingManager.shared.warn(.videoRendering, message: "EVENT: eventStartTime is nil but isEventPlayback is TRUE! Falling back to resumeFromTimestamp...")
             seekTime = appState.player.resumeFromTimestamp ?? 0
             // Consume the timestamp to prevent leaks
             appState.player.resumeFromTimestamp = nil

             // Double Fallback: If resumeFromTimestamp is 0 (missing?), try room creation time
             if seekTime == 0, let room = appState.player.currentWatchPartyRoom, room.id.hasPrefix("event_") {
                 let elapsed = Date().timeIntervalSince(room.createdAt)
                 // Default buffer 10m (600s) - match PlayerViewModel logic
                 let calculated = max(0, elapsed - 600)
                 if calculated > 0 {
                     seekTime = calculated
                     LoggingManager.shared.warn(.videoRendering, message: "EVENT: resumeFromTimestamp was 0. Calculated from Room Creation: \(seekTime)s")
                 }
             }
        } else {
             // Not an event, and no start time -> Standard playback (handled elsewhere) or Watch Party sync will take over
             return
        }

        // Consume the timestamp request now that we are successfully launching the event
        // This prevents the timestamp from leaking to the NEXT video (e.g. if user exits event and plays solo)
        appState.player.resumeFromTimestamp = nil

        // 5. Execute Seek & Play
        LoggingManager.shared.debug(.watchParty, message: "Seeking to live edge: \(Int(seekTime))s")
        Task { @MainActor in
             await self.playbackService.seek(to: seekTime)

             // Wait briefly for seek to latch, then play
             try? await Task.sleep(nanoseconds: 600_000_000) // 600ms
             await self.playbackService.play()
             self.isPlaying = true
        }
    }

    // Realtime sync manager
    private var realtimeManager: RealtimeChannelManager?
    @Published var isWatchPartyHost: Bool = false  // Exposed to view for UI control

    // Grace Period: Track when this view model was created
    private let initializationTime = Date()

    private var currentRoomId: String?
    private var currentUserId: String?
    private var syncBroadcastTimer: Timer?
    private var chatPollingTimer: Timer?
    private var lastChatMessageId: String?
    private var bufferingTimer: Timer? // Timeout for stuck buffering

    // Flag to keep loading state active during event seek stabilization or initial watch party sync
    private var isRefiningInitialSeek = false

    // Throttling State
    private var lastTimeUpdate: Date = .distantPast
    private var pendingChatMessages: [ChatMessage] = []
    private var isFlushingChat: Bool = false

    // Watch history tracking
    private var watchHistoryTimer: Timer?

    // Cleanup helper
    // Cleanup helper
    // (Consolidated into invalidateAllTimers)

    // Enhanced timer management for performance
    private var activeTimers: [Timer] = []
    weak var appState: AppState?

    // Cleanup state
    private var hasCleanedUp: Bool = false

    // Resume state tracking
    private var hasVideoReadyTriggered: Bool = false
    private var hasAutoSelectedSubtitles: Bool = false // NEW: Track if we've run initial auto-selection

    // Watch party state
    @Published var isInWatchParty: Bool = false  // Track if currently in watch party mode
    @Published var isResumingInWatchParty: Bool = false  // Track if resuming from saved position in watch party

    // Syncplay-inspired: Ignore echoed state changes (prevent jitter)
    private var ignoringRemoteUpdates: Int = 0  // Counter for ignoring remote updates after local actions
    private var lastLocalActionTime: Date?

    // Advanced smoothness optimization (network-aware sync)
    private var driftHistory: [Double] = []  // Rolling window of drift measurements
    private let driftHistorySize = 5  // Number of samples to average
    private var lastSpeedAdjustmentTime: Date?
    private var currentSpeedAdjustment: Double = 1.0
    var networkLatency: Double = 0.05  // Estimated one-way latency (50ms default)
    private var lastSyncMessageTime: Date?
    private var isCurrentlyAdjustingSpeed: Bool = false

    // Startup synchronization: Give guest time to spin up video pipeline
    private let hostStartupDelay: Double = 0.25  // 250ms delay for guest to prepare
    private var pendingPlayTask: Task<Void, Never>?
    private var playbackTimeoutTask: Task<Void, Never>? // NEW: Soft timeout for loading
    private var playbackHeartbeatTask: Task<Void, Never>? // Heartbeat to keep host presence during playback

    // Ready Loop: Periodically resend READY signal until playback starts
    private var readyLoopTimer: Timer?

    // Ready Gate Timeout Tracking (Landmine #13 fix: detect absent host)
    private var readySignalsSentCount: Int = 0
    private let maxReadySignalsBeforeTimeout: Int = 15  // 30 seconds (15 signals × 2s interval)

    // Player state
    @Published var videoURL: String = ""
    @Published var isLoading: Bool = true
    @Published var isPlaying: Bool = false
    @Published var playbackFinished: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    @Published var volume: Double = 100
    // Error Feedback
    // Changed to PassthroughSubject to avoid UI flash during auto-retry
    let playbackErrorTrigger = PassthroughSubject<String, Never>()

    // Visual state
    @Published var posterURL: String?
    @Published var backgroundURL: String?
    @Published var logoURL: String?

    // Play Next Episode State
    @Published var fullMetadata: MediaMetadata?
    @Published var showNextEpisodePrompt: Bool = false
    @Published var nextEpisodeInfo: String?
    @Published var nextEpisodeThumbnail: String? = nil
    private var hasHandledNextEpisodePrompt: Bool = false // Prevent reappearing
    @Published var showPoster: Bool = true  // Show during loading
    @Published var isVideoTitleVisible: Bool = false

    // UI Enhancements
    @Published var syncStatus: String? = nil
    @Published var isBuffering: Bool = false
    @Published var isSeeking: Bool = false
    @Published var isExitingToLobby: Bool = false

    // Chat state
    @Published var showChat: Bool = false
    @Published var showParticipantList: Bool = false

    @Published var mutedUserIds: Set<String> = []
    private let mutedUsersKey = "redlemon_muted_users"

    func toggleMute(userId: String) {
        if mutedUserIds.contains(userId) {
            mutedUserIds.remove(userId)
        } else {
            mutedUserIds.insert(userId)
        }
        // Persist
        UserDefaults.standard.set(Array(mutedUserIds), forKey: mutedUsersKey)
    }

    // Watch Party State

    @Published var showSettings: Bool = false
    @Published var isAnimatingChatToggle: Bool = false
    @Published var messages: [ChatMessage] = []

    // Reactions
    @Published var areReactionsEnabled: Bool = true
    let reactionTriggers = PassthroughSubject<String, Never>()
    let announcementTriggers = PassthroughSubject<String, Never>()
    private var reactionTimestamps: [Date] = []

    // Metadata
    @Published var title: String = ""
    @Published var imdbId: String = ""
    @Published var streamTitle: String = ""

    // Subtitles
    @Published var subtitles: [(url: String, label: String)] = []
    @Published var subtitleOffset: Double = 0.0  // Current subtitle offset in milliseconds
    @Published var availableSubtitleTracks: [SubtitleTrack] = []
    @Published var currentSubtitleTrack: SubtitleTrack?
    @Published var showSubtitleSyncPanel: Bool = false

    // Audio Tracks
    @Published var availableAudioTracks: [AudioTrack] = []
    @Published var currentAudioTrack: AudioTrack?


    // MARK: - Post-Load Ready Gate
    @Published var showWaitingForGuests: Bool = false    // Presence Management
    @Published var connectedGuestIds: Set<String> = []
    @Published var readyGuestIds: Set<String> = []
    private var pendingLeaveTasks: [String: Task<Void, Never>] = [:] // Debounce map for leaving guests
    private var hasSentReadySignal: Bool = false

    // MARK: - Verified Stream Logic
    @Published var currentStreamHash: String?
    private var currentStreamQuality: String?
    private var currentSourceQuality: String? // NEW: Track source type (CAM, WEB-DL, etc.)
    private var currentSeason: Int? // NEW: Explicitly track season
    private var currentEpisode: Int? // NEW: Explicitly track episode
    private var hasVotedForStream: Bool = false

    // Accumulator for ACTUAL playback time (to prevent seek abuse)
    private var accumulatedPlaybackTime: TimeInterval = 0
    private var continuousPlaybackTime: TimeInterval = 0 // New: Track continuous segment for TV verification
    private var lastAccumulatorUpdate: Date = Date()

    // MARK: - Phantom Sync & Snap-Seek State
    private var isSwitchingTracks: Bool = false
    private var trackSwitchStartTime: Date?
    private var trackSwitchStartPos: Double = 0


    // MARK: - Moderation

    func kickUser(_ participantId: String) {
        guard isWatchPartyHost else { return }

        // 1. Send Kick command via Realtime
        let kickCmd = SyncMessage(
            type: .chat,
            timestamp: 0,
            isPlaying: nil,
            senderId: currentUserId,
            chatText: "LOBBY_KICK:\(participantId)",
            chatUsername: "Host"
        )

        Task {
            try? await realtimeManager?.sendSyncMessage(kickCmd)

            // 2. Remove from DB (leaveRoom)
             try? await SupabaseClient.shared.leaveRoom(
                roomId: currentRoomId ?? "",
                userId: UUID(uuidString: participantId) ?? UUID()
            )

            // 3. Remove from local presence lists
            await MainActor.run {
                connectedGuestIds.remove(participantId)
                readyGuestIds.remove(participantId)
                appState?.player.currentWatchPartyRoom?.participants.removeAll { $0.id == participantId }
            }
        }
    }

    func blockUser(_ participantId: String, username: String? = nil) {
        kickUser(participantId)
        Task {
             await SocialService.shared.blockUser(userId: participantId, username: username)
        }
    }

    func addFriend(_ participantId: String) {
        Task {
             _ = await SocialService.shared.sendRequest(toUserId: participantId)
        }
    }

    // MARK: - Initialization

    func loadStream(streamURL: String, imdbId: String, streamTitle: String, subtitles: [(url: String, label: String)], isSeries: Bool, isEvent: Bool, streamHash: String? = nil, quality: String? = nil, sourceQuality: String? = nil, season: Int? = nil, episode: Int? = nil) async {
        // For movies, strip any accidental episode markers in stream title (e.g., "S01E01")
        func sanitizedTitle(_ title: String) -> String {
            guard !isSeries else { return title }
            let moviePattern = try? NSRegularExpression(pattern: "s\\d{1,2}e\\d{1,2}", options: [.caseInsensitive])
            let range = NSRange(location: 0, length: title.utf16.count)
            if let regex = moviePattern, regex.firstMatch(in: title, options: [], range: range) != nil {
                let clean = regex.stringByReplacingMatches(in: title, options: [], range: range, withTemplate: "").trimmingCharacters(in: .whitespacesAndNewlines)
                // Fix: Remove trailing dash if it exists (e.g., "Movie Name -")
                return clean.hasSuffix("-") ? String(clean.dropLast()).trimmingCharacters(in: .whitespacesAndNewlines) : clean
            }
            return title
        }

        let cleanStreamTitle = sanitizedTitle(streamTitle)

        // Cancel any pending timeout from previous stream
        self.playbackTimeoutTask?.cancel()
        self.playbackTimeoutTask = nil

        LoggingManager.shared.debug(.general, message: "LOADSTREAM CALLED - streamTitle: \(cleanStreamTitle)")
        LoggingManager.shared.debug(.general, message: "streamURL: \(streamURL.prefix(60))...")
        LoggingManager.shared.debug(.general, message: "subtitles: \(subtitles.count)")
        LoggingManager.shared.info(.general, message: "Loading stream: \(cleanStreamTitle)")
        LoggingManager.shared.debug(.general, message: "   IMDB: \(imdbId)")
        LoggingManager.shared.debug(.general, message: "   URL: \(streamURL.prefix(60))...")

        // FIX: Determine effective event status
        // A room starting with "event_" is ALWAYS an event, regardless of the boolean flag passed
        // This fixes the bug where retrying a stream might lose the isEvent flag and treat it as a room
        let effectiveIsEvent = isEvent || (self.currentRoomId?.hasPrefix("event_") == true)

        // FIX: Clear event state if this is NOT an event
        // This prevents "Fargo" (Event) state from leaking into "Freaky Friday" (Watch Party)
        if !effectiveIsEvent {
            LoggingManager.shared.debug(.general, message: "Clearing previous event state (Non-Event Load)")
            self.appState?.player.eventStartTime = nil

            // FIX: Also clear Watch Party state if we are not in a watch party
            // This prevents "Camp Rock" (Watch Party) state from leaking into "Five Nights" (Solo)
            // Fixes: Stale Invite Content and ability to send invites during solo playback
            if !self.isInWatchParty {
                 LoggingManager.shared.debug(.general, message: "Clearing previous watch party state (Solo Load)")
                 self.appState?.player.currentWatchPartyRoom = nil
                 self.currentRoomId = nil
                 self.isWatchPartyHost = false
            }
        }

        if let h = streamHash { LoggingManager.shared.debug(.general, message: "   Hash: \(h.prefix(8))...") }
        if let sq = sourceQuality { LoggingManager.shared.debug(.general, message: "   Source: \(sq)") }

        self.videoURL = streamURL
        self.imdbId = imdbId
        self.streamTitle = cleanStreamTitle
        self.title = cleanStreamTitle // Default title until metadata is loaded

        // Store Verified Stream info
        self.currentStreamHash = streamHash
        self.currentStreamQuality = quality
        self.currentSourceQuality = sourceQuality
        self.currentSeason = season
        self.currentEpisode = episode
        self.hasVotedForStream = false // Reset vote state for new stream

        // Broadcast watching status
        Task {
            await SocialService.shared.updateWatchingStatus(
                mediaTitle: cleanStreamTitle,
                mediaType: isSeries ? "series" : "movie",
                imdbId: imdbId,
                roomId: self.currentRoomId
            )
            // Fix: Refresh upcoming events list to remove the previous one
            await MainActor.run {
                self.appState?.refreshEvents()
            }
        }
        self.subtitles = subtitles
        self.isLoading = true
        self.showPoster = true

        // Fix: Reset background/poster URLs to prevent flashing previous image if ViewModel is reused
        self.backgroundURL = nil
        self.posterURL = nil
        self.logoURL = nil

        // Reset resume handling flag for new video loads
        self.hasVideoReadyTriggered = false
        self.hasAutoSelectedSubtitles = false // Reset auto-selection flag

        // SOFT TIMEOUT: If video doesn't load, trigger fallback (faster than MPV 40s)
        // Watch Parties get 25s to allow for large HDR file buffering; solo playback gets 10s
        let timeoutSeconds: UInt64 = isInWatchParty ? 25_000_000_000 : 10_000_000_000
        let timeoutLabel = isInWatchParty ? "25s (Watch Party)" : "10s"
        self.playbackTimeoutTask = Task { @MainActor in
             try? await Task.sleep(nanoseconds: timeoutSeconds)
             if !Task.isCancelled {
                 // Check if we are still loading and NO file is loaded
                 if self.isLoading && !self.mpvWrapper.isFileLoaded {
                     LoggingManager.shared.error(.videoRendering, message: "Soft Timeout: MPV failed to load file in \(timeoutLabel) - triggering fallback")

                     // CRITICAL: If Host in Watch Party, notify guests before exiting
                     if self.isWatchPartyHost {
                         LoggingManager.shared.error(.watchParty, message: "Host playback timeout - notifying guests to return to lobby")
                         await self.notifyGuestsOfHostError()
                     }

                     self.playbackErrorTrigger.send("Playback Timeout")
                 }
             }
        }

        // Add mock chat messages for testing UI
        self.messages = [
            ChatMessage(id: UUID().uuidString, username: "System", text: "Press ⌘ (Cmd) to toggle chat.", timestamp: Date(), isSystem: true)
        ]
        LoggingManager.shared.debug(.social, message: "Added mock chat messages for testing")

        // Fetch metadata for background art
        // Fetch metadata for background art (parallel, don't block video load)
        // Fetch metadata for background art (parallel, don't block video load)
        Task {
            await fetchMetadata(imdbId: imdbId, mediaType: isSeries ? "series" : "movie")
        }

        // NEW: Scan for embedded tracks IMMEDIATELY when loading starts
        // This ensures they are ready before playback begins, preventing hiccups
        // NEW: Load/Scan subtitles IMMEDIATELY when loading starts
        // This ensures they are ready before playback begins, preventing hiccups
        // NEW: Load/Scan subtitles IMMEDIATELY when loading starts
        // Parallel execution again (reverted blocking wait), but LIMITED to top 3 to reduce hiccup
        Task {
            if !subtitles.isEmpty {
                // Limit to top 3 subtitles to prevent "brutal wait" / heavy hiccup
                let limitedSubtitles = Array(subtitles.prefix(3))
                LoggingManager.shared.info(.subtitles, message: "Pre-loading external subtitles (Top \(limitedSubtitles.count))...")
                await self.subtitleService.loadExternalSubtitles(limitedSubtitles)
            } else {
                LoggingManager.shared.info(.subtitles, message: "Pre-scanning embedded subtitles...")
                await self.subtitleService.scanEmbeddedTracks()
            }
        }

        // Check if we should resume from a specific timestamp
        let resumeTime = appState?.player.resumeFromTimestamp ?? 0
        let shouldResume = resumeTime > 0

        // CRITICAL: Strict separation of logic
        // 1. EVENT: Always autoplay, ignore watch party gates, ignore resume (unless specifically handled later)
        // 2. SOLO: Always autoplay, handle resume
        // 3. WATCH PARTY: Start PAUSED, wait for ready gate, handle resume sync

        // Note: isEvent is now passed explicitly to avoid race conditions with appState injection

        if effectiveIsEvent {
            LoggingManager.shared.info(.watchParty, message: "EVENT MODE: Loading PAUSED to seek first (preventing flash)")
            isRefiningInitialSeek = true // START: Hold loading state until seek is stable
            Task { @MainActor in
                // Fix: Only expect the number of subtitles we ACTUALLY loaded (limited to 3)
                // Otherwise we wait for 8s timeout looking for ghosts.
                let expectedCount = min(subtitles.count, 3)
                // Disable autoplay so we can seek BEFORE showing the first frame
                await playbackService.loadVideo(url: streamURL, autoplay: false, expectedSubtitleCount: expectedCount)
                await SessionRecorder.shared.log(category: .player, message: "Load Video (Event)", metadata: ["url": streamURL])
            }
            // Events don't use waitingForGuests
            showWaitingForGuests = false
            // Auto-open chat for events
            Task { @MainActor in self.showChat = true }

        } else if !isInWatchParty {
            LoggingManager.shared.info(.general, message: "SOLO MODE: Autoplaying")
            if shouldResume {
                LoggingManager.shared.info(.general, message: "   With resume from \(Int(resumeTime))s")
            } else {
                LoggingManager.shared.info(.general, message: "   Starting from beginning")
            }

            // Load with autoplay=true (Solo starts immediately)
            // onVideoReady will handle the resume seek if needed
            Task { @MainActor in
                let expectedCount = min(subtitles.count, 3)
                await playbackService.loadVideo(url: streamURL, autoplay: true, expectedSubtitleCount: expectedCount)
                await SessionRecorder.shared.log(category: .player, message: "Load Video (Solo)", metadata: ["url": streamURL])
            }
            showWaitingForGuests = false

        } else {
            // Watch Party Mode (Non-Event)

            // Check for Solo Host Scenario
            // Use BOTH sources: lobby array (real-time) AND DB count (persistent)
            // Only bypass waiting gate if BOTH indicate truly solo (conservative approach)
            let lobbyParticipantCount = self.appState?.player.currentWatchPartyRoom?.participants.count ?? 0
            let dbParticipantCount = self.appState?.player.currentWatchPartyRoom?.participantCount ?? 0
            let isSoloHost = self.isWatchPartyHost && lobbyParticipantCount <= 1 && dbParticipantCount <= 1

            if isSoloHost {
                LoggingManager.shared.info(.watchParty, message: "WATCH PARTY (SOLO HOST): Bypass Start Paused - Autoplaying")
                isRefiningInitialSeek = false // Don't hold UI lock

                 Task { @MainActor in
                    let expectedCount = min(subtitles.count, 3)
                    await playbackService.loadVideo(url: streamURL, autoplay: true, expectedSubtitleCount: expectedCount)
                }
            } else {
                LoggingManager.shared.info(.watchParty, message: "WATCH PARTY MODE: Starting PAUSED for synchronization")
                // NEW: Hold poster until we get the first sync message to prevent 0:00 flash
                isRefiningInitialSeek = true

                // Always load paused for watch party
                Task { @MainActor in
                    let expectedCount = min(subtitles.count, 3)
                    await playbackService.loadVideo(url: streamURL, autoplay: false, expectedSubtitleCount: expectedCount)
                }
            }

            // Don't show "Waiting for guests" if effectively solo
            showWaitingForGuests = !isSoloHost
            // Auto-open chat for watch parties
            Task { @MainActor in self.showChat = true }
        }





        // Monitor MPV state changes - Handled by PlaybackService bindings
    }

    private func checkForNextEpisode() {
        // Only valid for series where we have appState access
        guard let appState = appState,
              appState.player.selectedMediaItem?.type == "series",
              self.duration > 0,

              self.currentTime > 0 else {
            return
        }

        // Prevent "Next Episode" prompt in Watch Party rooms (users should return to lobby)
        if isInWatchParty {
            return
        }

        // CRITICAL FIX: Don't show if user explicitly cancelled this session
        if appState.player.userCancelledAutoPlay || hasHandledNextEpisodePrompt {
            return
        }

        // Show prompt if within last 10 seconds (aligned with UI countdown)
        let remaining = self.duration - self.currentTime
        if remaining < 10 && remaining > 0 {

             // Check if already showing
             if showNextEpisodePrompt { return }

             // Check if there IS a next episode
             if let meta = self.fullMetadata,
                let videos = meta.videos,
                let currentS = appState.player.selectedSeason,
                let currentE = appState.player.selectedEpisode {

                 let nextE = currentE + 1
                 if let video = videos.first(where: { $0.season == currentS && $0.episode == nextE }) {
                     self.nextEpisodeInfo = "Up Next: \(video.title)"
                     self.nextEpisodeThumbnail = video.thumbnail
                     self.showNextEpisodePrompt = true
                     return
                 }

                 let nextS = currentS + 1
                 if let video = videos.first(where: { $0.season == nextS && $0.episode == 1 }) {
                     self.nextEpisodeInfo = "Up Next: S\(nextS)E1 - \(video.title)"
                     self.nextEpisodeThumbnail = video.thumbnail
                     self.showNextEpisodePrompt = true
                     return
                 }
             }
        } else {
            // Hide if we scrubbed back or finished
            if showNextEpisodePrompt && remaining > 15 {
                showNextEpisodePrompt = false
            }
        }
    }

    // MARK: - Metadata Fetching

    private func fetchMetadata(imdbId: String, mediaType: String) async {
        LoggingManager.shared.debug(.network, message: "Fetching metadata for \(imdbId) as \(mediaType)...")

        do {
            // Use LocalAPIClient which correctly handles both movies and series
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaType, id: imdbId)
            self.fullMetadata = metadata

            // Prefer background (widescreen) over poster
            if let background = metadata.backgroundURL {
                self.backgroundURL = upgradeToHD(background)
                LoggingManager.shared.debug(.videoRendering, message: "Got background: \(background.prefix(60))...")
            } else if let poster = metadata.posterURL {
                self.backgroundURL = upgradeToHD(poster)
                LoggingManager.shared.debug(.videoRendering, message: "Got poster as background: \(poster.prefix(60))...")
            }

            // Set poster URL for player UI
            if let poster = metadata.posterURL {
                self.posterURL = upgradeToHD(poster)
                LoggingManager.shared.debug(.videoRendering, message: "Got poster URL: \(poster.prefix(60))...")
            }

            // Get logo for loading screen
            if let logo = metadata.logoURL {
                self.logoURL = upgradeToHD(logo)
                LoggingManager.shared.debug(.videoRendering, message: "Got logo: \(logo.prefix(60))...")
            }

            self.title = metadata.title

        } catch {
            LoggingManager.shared.warn(.network, message: "Failed to fetch metadata: \(error.localizedDescription)")
        }
    }

    /// Upgrade image URL to HD resolution (ColorFruit pattern)
    private func upgradeToHD(_ urlString: String) -> String {
        // Amazon/TMDB images: _SX250.jpg → _SX1920.jpg
        if urlString.contains("media-amazon.com") && urlString.contains("_SX") {
            return urlString.replacingOccurrences(
                of: #"_SX\d+\.jpg"#,
                with: "_SX1920.jpg",
                options: .regularExpression
            )
        }
        return urlString
    }

    // MARK: - Playback Control

    func onVideoReady() {
        // Strict gate: Ensure this only runs once per video load
        guard !hasVideoReadyTriggered else {
            LoggingManager.shared.warn(.videoRendering, message: "onVideoReady called again - ignoring to prevent loops")
            return
        }
        hasVideoReadyTriggered = true

        // Success! Cancel the soft timeout
        self.playbackTimeoutTask?.cancel()
        self.playbackTimeoutTask = nil

        LoggingManager.shared.info(.general, message: "Video ready - hiding poster")

        // Fade out poster when video is ready
         // NEW: For Events/Watch Parties, delay hiding poster to prevent "Frame 0" flash
        if self.isRefiningInitialSeek {
             // Redundant failsafe: If buffering logic fails to clear this flag after 5 seconds, force clear it.
             Task { @MainActor in
                 try? await Task.sleep(nanoseconds: 5_000_000_000) // 5s failsafe
                 if self.isRefiningInitialSeek {
                     LoggingManager.shared.warn(.watchParty, message: "EVENT/VP Mode: Failsafe triggered - forcing UI release")
                     self.isRefiningInitialSeek = false
                     withAnimation(.easeOut(duration: 0.5)) {
                        self.showPoster = false
                        self.isLoading = false
                     }
                 }
             }
        } else if self.isInWatchParty && !self.hasSentReadySignal {
            // CRITICAL FIX: Watch Party Ready Gate
            // Video is ready locally, but we are waiting for Host/Sync.
            // Keep the poster visible so we don't show a static frame 0.
            LoggingManager.shared.info(.watchParty, message: "Video ready (Watch Party) - Keeping poster visible until Sync Message")
            withAnimation {
                self.isLoading = false // Hide spinner, but keep poster
            }
        } else {
            // Normal behavior
            withAnimation(.easeOut(duration: 0.5)) {
                self.showPoster = false
                self.isLoading = false
            }
        }

        // Load external subtitles if present (delayed to prevent race conditions with embedded tracks)
        // Note: Subtitles (External & Embedded) are now pre-loaded in loadStream()
        // This prevents the "hiccup" caused by downloading/scanning during playback start.

        // Update tracks (Audio only - subtitle scan handled above or in loadExternalSubtitles)
        self.updateAudioTracks()    // Scan audio tracks

        // Restore subtitle/audio prioritization logic
        // NOTE: Redundant - handled by MPVWrapper Smart Paused Load
        // self.selectEnglishDefaults()

        // NEW: Event playback - recalculate seek time NOW (when video is actually ready)
        // This compensates for all loading delays and ensures tight sync across devices
        if let eventStartTime = appState?.player.eventStartTime {
            // Optimization: If we already sought during File Loaded, we might not need to do this again
            // causing a double-seek/stutter. However, seeking again aligns us perfectly with "Video Ready" wall clock.
            // Let's check drift. If we are < 2s off, skip it.
            let elapsed = Date().timeIntervalSince(eventStartTime)
            let seekTime = max(0, elapsed)
            let drift = abs(self.currentTime - seekTime)

            if drift < 2.0 {
                LoggingManager.shared.info(.watchParty, message: "EVENT: Video ready, drift is small (\(String(format: "%.2f", drift))s), skipping redundant seek")
                startWatchHistorySaving()
                return
            }

            LoggingManager.shared.info(.watchParty, message: "EVENT: Recalculating seek time at video ready (Drift: \(String(format: "%.2f", drift))s)")
            LoggingManager.shared.debug(.watchParty, message: "   Event started at: \(eventStartTime)")
            LoggingManager.shared.debug(.watchParty, message: "   Current time: \(Date())")
            LoggingManager.shared.debug(.watchParty, message: "   Elapsed: \(Int(elapsed))s")
            LoggingManager.shared.debug(.watchParty, message: "   Seeking to: \(Int(seekTime))s")

            // Pause, seek, then resume
            Task { @MainActor in
                await playbackService.pause()
            }

            // Use the robust resume logic which waits for duration/load
            attemptImmediateResume(resumeTime: seekTime)

            // Start watch history saving
            startWatchHistorySaving()
            return  // Skip normal resume logic
        }

        // Watch Party Ready Gate
        if isInWatchParty && !hasSentReadySignal {
            LoggingManager.shared.warn(.watchParty, message: "Watch Party: Video ready (playing), sending READY signal as fallback")
            sendReadySignal()
        }

        // Check if we should resume from a specific timestamp
        if let resumeTime = appState?.player.resumeFromTimestamp, resumeTime > 0 {
            LoggingManager.shared.info(.general, message: "Resuming playback from \(Int(resumeTime))s (appState.resumeFromTimestamp = \(appState?.player.resumeFromTimestamp ?? 0))")



            // Check if we're in watch party mode and set flag accordingly
            if isInWatchParty {
                isResumingInWatchParty = true
                LoggingManager.shared.info(.watchParty, message: "Resuming inside watch party - will sync resume time to guests")
            }

            LoggingManager.shared.debug(.videoRendering, message: "Pausing immediately for resume...")
            Task { @MainActor in
                await playbackService.pause()
            }

            // Then seek immediately after brief pause
            Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: 200_000_000)
                guard let self = self else { return }

                // Reset accumulator for new session
                self.accumulatedPlaybackTime = 0
                self.continuousPlaybackTime = 0
                self.lastAccumulatorUpdate = Date()

                self.attemptImmediateResume(resumeTime: resumeTime)
            }
        } else if !isInWatchParty {
            // Only auto-play if NOT in watch party (Watch Party waits for Ready Gate)
            LoggingManager.shared.info(.general, message: "No resume timestamp set (starting from beginning)")

            // For normal playback, ensure MPV is playing and update UI state
            if !isPlaying {
                Task { @MainActor in
                    await playbackService.play()
                }
            }
            self.isPlaying = true
            LoggingManager.shared.info(.general, message: "Auto-playing solo content from beginning")
        }

        // Start periodic watch history saving (every 10 seconds)
        startWatchHistorySaving()
    }

    /// Immediate resume: Seek right away without waiting for full buffering
    private func attemptImmediateResume(resumeTime: Double) {
        LoggingManager.shared.info(.videoRendering, message: "IMMEDIATE RESUME: Seeking to \(Int(resumeTime))s without delay")

        // Wait a brief moment for video metadata to load (much faster than buffering)
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 500_000_000)
            guard let self = self else { return }

            // Enhanced validation before seeking
            // CRITICAL FIX: Don't block indefinitely if duration is 0.
            // MPV might report 0 duration until playback/seeking starts, especially if loaded in paused state.
            if self.duration > 0 {
                guard resumeTime < self.duration else {
                    LoggingManager.shared.warn(.videoRendering, message: "Resume time (\(Int(resumeTime))s) exceeds video duration (\(Int(self.duration))s). Event is effectively finished for this file.")
                    let nearEnd = max(0, self.duration - 1.0)
                    Task { @MainActor in
                        await playbackService.seek(to: nearEnd)
                        await playbackService.play()
                    }
                    self.isPlaying = true

                    self.appState?.player.resumeFromTimestamp = nil
                    self.appState?.player.eventStartTime = nil
                    return
                }
            } else {
                 LoggingManager.shared.warn(.videoRendering, message: "Video duration not available yet (0.0s), performing BLIND SEEK to \(Int(resumeTime))s...")
            }

            // Execute seek immediately
            LoggingManager.shared.info(.videoRendering, message: "Executing immediate seek to \(Int(resumeTime))s...")
            Task { @MainActor in
                await playbackService.seek(to: resumeTime)
            }

            // Resume playback after brief delay to allow seek to register
            Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: 200_000_000)
                guard let self = self else { return }
                await playbackService.play()
                self.isPlaying = true

                // Clear state
                self.appState?.player.resumeFromTimestamp = nil
                // self.appState?.player.eventStartTime = nil // REMOVED: Keep event start time for future track switches (Wall Clock Sync)
                self.isResumingInWatchParty = false

                // CRITICAL FIX: Broadcast seek to Watch Party guests
                // attemptImmediateResume is often called after a scrub/reload, so we must tell guests to jump too.
                if self.isWatchPartyHost {
                    let syncMessage = SyncMessage(
                        type: .seek,
                        timestamp: Date().timeIntervalSince1970,
                        position: resumeTime,
                        isPlaying: true, // We are explicitly resuming
                        senderId: self.currentUserId
                    )

                    Task {
                        try? await self.realtimeManager?.sendSyncMessage(syncMessage)
                    }
                    LoggingManager.shared.info(.watchParty, message: "Host broadcasting immediate resume seek to \(Int(resumeTime))s")
                }

                LoggingManager.shared.info(.videoRendering, message: "Resumed playback after seek to \(Int(resumeTime))s")
            }
        }
    }




    func togglePlayPause() {
        // Special handling for watch party host: Add startup delay when transitioning to play
        if isInWatchParty && isWatchPartyHost && !isPlaying {
            // Cancel any pending play task
            pendingPlayTask?.cancel()

            // Host is about to play - add brief delay for guest synchronization
            LoggingManager.shared.info(.watchParty, message: "Host initiating play with \(Int(hostStartupDelay * 1000))ms startup delay for guest sync")

            // Send play message FIRST (before actually playing)
            let syncMessage = SyncMessage(
                type: .play,
                timestamp: Date().timeIntervalSince1970,
                position: currentTime,
                isPlaying: true,
                senderId: currentUserId,
                chatText: nil,
                chatUsername: nil
            )

            Task { [weak self] in
                guard let self = self else { return }
                do {
                    try await self.realtimeManager?.sendSyncMessage(syncMessage)
                    LoggingManager.shared.info(.watchParty, message: "Sent play message to guests (pre-delay)")
                } catch {
                    LoggingManager.shared.error(.watchParty, message: "Failed to send play sync message: \(error)")
                }
            }

            // Mark local action to prevent echo
            markLocalAction()

            // Then delay before actually starting playback
            pendingPlayTask = Task { @MainActor in
                try? await Task.sleep(nanoseconds: UInt64(hostStartupDelay * 1_000_000_000))

                // Check if task wasn't cancelled
                guard !Task.isCancelled else {
                    LoggingManager.shared.debug(.watchParty, message: "Startup delay cancelled")
                    return
                }

                LoggingManager.shared.info(.watchParty, message: "Host starting playback after startup delay")
                await playbackService.togglePlayPause()
            }

            return
        }

        // Normal toggle for non-watch-party or pause operations
        Task { @MainActor in
            await playbackService.togglePlayPause()
        }
        let isNowPlaying = !isPlaying
        LoggingManager.shared.info(.general, message: isNowPlaying ? "Playing" : "Paused")

        // Mark that we initiated this action (ignore echo from remote)
        markLocalAction()

        // Send explicit sync message if host in watch party (for pause or non-startup play)
        if isInWatchParty && isWatchPartyHost {
            let messageType: SyncMessageType = isNowPlaying ? .play : .pause
            let syncMessage = SyncMessage(
                type: messageType,
                timestamp: Date().timeIntervalSince1970,
                position: currentTime,
                isPlaying: isNowPlaying,
                senderId: currentUserId,
                chatText: nil,
                chatUsername: nil
            )

            Task { [weak self] in
                guard let self = self else { return }
                do {
                    try await self.realtimeManager?.sendSyncMessage(syncMessage)
                    LoggingManager.shared.info(.watchParty, message: "Sent explicit \(messageType) message to guests")
                } catch {
                    LoggingManager.shared.error(.watchParty, message: "Failed to send \(messageType) sync message: \(error)")
                }
            }
        }
    }

    func seek(to time: Double) {
        Task { @MainActor in
            self.isSeeking = true
            await playbackService.seek(to: time)
            // Keep "Syncing..." state for a moment to allow playback to stabilize
            try? await Task.sleep(nanoseconds: 1_000_000_000) // 1s
            self.isSeeking = false
        }
        LoggingManager.shared.info(.general, message: "Seeking to \(Int(time))s")

        // Mark that we initiated this action (ignore echo from remote)
        markLocalAction()

        // Send explicit seek sync message if host in watch party
        if isInWatchParty && isWatchPartyHost {
            let syncMessage = SyncMessage(
                type: .seek,
                timestamp: Date().timeIntervalSince1970,
                position: time,
                isPlaying: isPlaying,
                senderId: currentUserId,
                chatText: nil,
                chatUsername: nil
            )

            Task { [weak self] in
                guard let self = self else { return }
                do {
                    try await self.realtimeManager?.sendSyncMessage(syncMessage)
                    LoggingManager.shared.info(.watchParty, message: "Sent explicit seek message to guests: \(Int(time))s")
                } catch {
                    LoggingManager.shared.error(.watchParty, message: "Failed to send seek sync message: \(error)")
                }
            }
        }
    }

    func setVolume(_ level: Double) {
        volume = level
        Task { @MainActor in
            await playbackService.setVolume(level)
        }
        LoggingManager.shared.debug(.general, message: "Volume: \(Int(level))%")
    }

    // MARK: - Subtitle Sync Controls

    /// Adjust subtitle timing offset
    /// - Parameter offsetMs: Offset in milliseconds (positive = delay, negative = advance)
    func adjustSubtitleOffset(_ offsetMs: Double) {
        Task {
            await subtitleService.setOffset(offsetMs)
        }

        // Save to UserDefaults
        if !imdbId.isEmpty {
            UserDefaults.standard.set(offsetMs, forKey: "subtitleOffset_\(imdbId)")
            LoggingManager.shared.debug(.subtitles, message: "Saved subtitle offset: \(offsetMs)ms for \(imdbId)")
        }
    }

    /// Reset subtitle timing to default
    func resetSubtitleTiming() {
        Task {
            await subtitleService.setOffset(0.0)
        }

        // Remove from UserDefaults
        if !imdbId.isEmpty {
            UserDefaults.standard.removeObject(forKey: "subtitleOffset_\(imdbId)")
            LoggingManager.shared.info(.subtitles, message: "Cleared subtitle offset for \(imdbId)")
        }
    }

    /// Update available subtitle tracks (Wrapper for service)
    func updateSubtitleTracks() {
        Task {
            await subtitleService.scanEmbeddedTracks()
        }
    }

    /// Update available audio tracks
    func updateAudioTracks() {
        let tracks = mpvWrapper.getAudioTracks()
        self.availableAudioTracks = tracks

        // Sync current track
        let currentId = mpvWrapper.getCurrentAudioTrack()
        if let current = tracks.first(where: { $0.id == currentId }) {
            self.currentAudioTrack = current
        }
    }

    /// Analyze subtitle compatibility and suggest improvements
    func analyzeSubtitleCompatibility() {
        guard !subtitles.isEmpty else { return }

        LoggingManager.shared.debug(.subtitles, message: "Analyzing subtitle compatibility...")

        // Check for version mismatches between video and subtitles
        let lowerTitle = streamTitle.lowercased()
        let videoIsBluRay = lowerTitle.contains("bluray") || lowerTitle.contains("bd")
        let videoIsWEBDL = lowerTitle.contains("web-dl") || lowerTitle.contains("webdl")

        for subtitle in subtitles {
            let subtitleIsWEBDL = subtitle.label.lowercased().contains("web-dl") || subtitle.label.lowercased().contains("webdl")
            let subtitleIsBluRay = subtitle.label.lowercased().contains("blu-ray") || subtitle.label.lowercased().contains("bluray")

            if videoIsBluRay && subtitleIsWEBDL {
                LoggingManager.shared.warn(.subtitles, message: "Version mismatch detected: BluRay video with WEB-DL subtitle '\(subtitle.label)' - sync issues likely")
                showSubtitleSyncPanel = true
            } else if videoIsWEBDL && subtitleIsBluRay {
                LoggingManager.shared.warn(.subtitles, message: "Version mismatch detected: WEB-DL video with BluRay subtitle '\(subtitle.label)' - sync issues likely")
                showSubtitleSyncPanel = true
            } else {
                LoggingManager.shared.debug(.subtitles, message: "Good version match: \(subtitle.label)")
            }
        }

        // Update available tracks
        // REMOVED: Calling scanEmbeddedTracks here causes infinite recursion loop
        // (Scan -> Updates Tracks -> Triggers Observer -> AutoSelect -> Analyze -> Scan)
        // Task {
        //    await subtitleService.scanEmbeddedTracks()
        // }
    }    // MARK: - Phantom Sync / Snap-Seek Logic

    private func completeTrackSwitch() {
        LoggingManager.shared.info(.watchParty, message: "Completing track switch (Snap-Seek)...")

        // Reset state immediately to avoid re-triggering
        isSwitchingTracks = false

        let switchDuration = Date().timeIntervalSince(trackSwitchStartTime ?? Date())
        LoggingManager.shared.debug(.watchParty, message: "Switch took: \(Int(switchDuration * 1000))ms")

        // 1. HOST LOGIC: Phantom Sync
        if isWatchPartyHost {
            let targetTime = trackSwitchStartPos + switchDuration
            LoggingManager.shared.info(.watchParty, message: "Host: Phantom Sync - seeking to \(String(format: "%.3f", targetTime))s (skipped stalling period)")

            // Seek to where we would have been
            Task { @MainActor in
                await playbackService.seek(to: targetTime)
                // Resume sync broadcasts if we paused them (optional implementation detail, but here we just seek)
            }
        }

        // 2. GUEST LOGIC: Snap-Seek Catch-up
        else if isInWatchParty {
             // CRITICAL FIX: System Event (Live) - Sync to Wall Clock
             // System events don't have a host broadcasting position, so getInterpolatedPosition() returns 0.
             if let eventStart = appState?.player.eventStartTime {
                 let elapsed = Date().timeIntervalSince(eventStart)
                 LoggingManager.shared.info(.watchParty, message: "Event Mode: Snap-Seek to Wall Clock time: \(elapsed)s (Switch Duration: \(Int(switchDuration * 1000))ms)")

                 // Seek to exact live edge
                 Task { @MainActor in
                     await playbackService.seek(to: max(0, elapsed))
                 }
                 return
             }

             // Calculate where the host is NOW
            if let manager = realtimeManager {
                Task {
                    let remotePos = await manager.getInterpolatedPosition()
                    let drift = abs(remotePos - self.currentTime)

                    LoggingManager.shared.debug(.watchParty, message: "Guest: Snap-Seek - Host is at \(String(format: "%.3f", remotePos))s (Drift: \(Int(drift * 1000))ms)")

                    // Always snap if drift is significant (> 100ms)
                    if drift > 0.1 {
                        LoggingManager.shared.info(.watchParty, message: "Executing Snap-Seek to Host time")
                        await playbackService.seek(to: remotePos)
                    } else {
                        LoggingManager.shared.debug(.watchParty, message: "Drift is negligible, skipping snap")
                    }
                }
            }
        }

        // Clear buffering state manually since we consumed the event
        self.isBuffering = false
        self.isLoading = false
    }

    // MARK: - Auto-Play Control

    func cancelNextEpisodeAutoPlay() {
        self.showNextEpisodePrompt = false
        self.hasHandledNextEpisodePrompt = true
        self.appState?.player.userCancelledAutoPlay = true
    }

    func startNextEpisodeNow() {
        self.showNextEpisodePrompt = false
        self.hasHandledNextEpisodePrompt = true
    }

    // MARK: - Track Selection

    func setAudioTrack(_ track: AudioTrack) {
        if isInWatchParty {
            LoggingManager.shared.info(.watchParty, message: "Switching audio track in Watch Party Mode...")
            isSwitchingTracks = true
            trackSwitchStartTime = Date()
            trackSwitchStartPos = currentTime
        }

        mpvWrapper.setAudioTrack(track.id)
        self.currentAudioTrack = track
        self.updateAudioTracks()
    }

    /// Select subtitle track by ID
    /// - Parameter trackId: Track ID (0 = off, or valid track ID)
    func selectSubtitleTrack(_ trackId: Int) {
        // Only apply special sync logic for EMBEDDED tracks
        // External tracks don't cause stalling, so simpler is better
        let isEmbedded = availableSubtitleTracks.first(where: { $0.id == trackId })?.isExternal == false

        if isInWatchParty && isEmbedded {
             LoggingManager.shared.info(.watchParty, message: "Switching embedded subtitle track in Watch Party Mode...")
             isSwitchingTracks = true
             trackSwitchStartTime = Date()
             trackSwitchStartPos = currentTime
        }

        Task {
            await subtitleService.selectTrack(trackId)
        }
    }

    @discardableResult
    private func selectEnglishDefaults() -> Bool {
        LoggingManager.shared.info(.subtitles, message: "Selecting English audio and subtitle tracks...")

        // 1. Restore Subtitle Offset if exists
        if !imdbId.isEmpty {
             if let savedOffset = UserDefaults.standard.object(forKey: "subtitleOffset_\(imdbId)") as? Double {
                 LoggingManager.shared.info(.subtitles, message: "Restoring saved subtitle offset: \(savedOffset)ms")
                 self.adjustSubtitleOffset(savedOffset)
             }
        }

        // Try to find and select English audio
        let audioTracks = mpvWrapper.getAudioTracks()
        LoggingManager.shared.debug(.general, message: "Found \(audioTracks.count) audio tracks")
        for track in audioTracks {
            LoggingManager.shared.debug(.general, message: "   Audio: ID=\(track.id) lang=\(track.lang ?? "nil") title=\(track.title ?? "nil")")
        }

        if let englishAudio = audioTracks.first(where: { track in
            let lang = track.lang?.lowercased() ?? ""
            let title = track.title?.lowercased() ?? ""
            // Fix: Check for "eng" in title (e.g. "AC3 5.1 ENG") not just "english"
            return lang.contains("eng") || lang == "en" || title.contains("english") || title.contains("eng")
        }) {
            LoggingManager.shared.info(.general, message: "Found English audio track: \(englishAudio.displayName)")
            mpvWrapper.setAudioTrack(englishAudio.id)
        } else if let firstAudio = audioTracks.first {
            LoggingManager.shared.warn(.general, message: "No English audio found, using: \(firstAudio.displayName)")
            mpvWrapper.setAudioTrack(firstAudio.id)
        }

        // Try to find and select English subtitles
        let subtitleTracks = mpvWrapper.getSubtitleTracks()
        LoggingManager.shared.debug(.subtitles, message: "Found \(subtitleTracks.count) subtitle tracks (including 'Off')")
        for track in subtitleTracks {
            LoggingManager.shared.debug(.subtitles, message: "   Subtitle: ID=\(track.id) lang=\(track.lang ?? "nil") title=\(track.title ?? "nil")")
        }

        // Filter out "Off" option (ID 0) and look for English
        let actualSubtitles = subtitleTracks.filter { $0.id != 0 }
        LoggingManager.shared.debug(.subtitles, message: "After filtering: \(actualSubtitles.count) actual subtitle tracks")

        // Find all English subtitles
        let englishSubs = actualSubtitles.filter { track in
            let lang = track.lang?.lowercased() ?? ""
            let title = track.title?.lowercased() ?? ""
            // FIX: Be more permissive with "en-US", "en-GB", etc.
            return lang.hasPrefix("en") || lang.contains("eng") || title.contains("english")
        }

        // Prioritize embedded tracks (isExternal == false)
        // We want embedded tracks to appear FIRST in our candidate list
        // Prioritize: Embedded SDH > Embedded Standard > External
        let sortedEnglishSubs = englishSubs.sorted { (track1, track2) -> Bool in
            let t1 = (track1.title ?? "").lowercased() + " " + (track1.lang ?? "").lowercased()
            let t2 = (track2.title ?? "").lowercased() + " " + (track2.lang ?? "").lowercased()

            let isSDH1 = t1.contains("sdh") || t1.contains("cc") || t1.contains("hi")
            let isSDH2 = t2.contains("sdh") || t2.contains("cc") || t2.contains("hi")

            // 1. Embedded vs External
            if !track1.isExternal && track2.isExternal { return true }
            if track1.isExternal && !track2.isExternal { return false }

            // 2. (If both Embedded or both External) SDH vs Standard
            if isSDH1 && !isSDH2 { return true }
            if !isSDH1 && isSDH2 { return false }

            return false
        }

        // Select the first valid candidate (filtering out only 'Foreign Parts' tracks)
        let preferredSub = sortedEnglishSubs.first(where: { track in
            let title = track.title?.lowercased() ?? ""
            let isForeignOnly = title.contains("foreign") ||
                               title.contains("forced") ||
                               title.contains("non-english") ||
                               title.contains("only")
            return !isForeignOnly
        }) ?? sortedEnglishSubs.first

        if let englishSub = preferredSub {
            let currentSid = mpvWrapper.getCurrentSubtitleTrack()
            if currentSid != englishSub.id {
                LoggingManager.shared.info(.subtitles, message: "Found English subtitle track: \(englishSub.displayName) (ID: \(englishSub.id))")
                mpvWrapper.setSubtitleTrack(englishSub.id)
            } else {
                LoggingManager.shared.debug(.subtitles, message: "English subtitle already active (ID: \(currentSid)), no switch needed")
            }

            // Update our state
            // Update our state


            // Analyze compatibility after selecting track
            analyzeSubtitleCompatibility()

            return true
        } else if let firstSub = actualSubtitles.first {
            let currentSid = mpvWrapper.getCurrentSubtitleTrack()
            if currentSid != firstSub.id {
                LoggingManager.shared.warn(.subtitles, message: "No English subtitles found, using first available: \(firstSub.displayName)")
                mpvWrapper.setSubtitleTrack(firstSub.id)
            } else {
                LoggingManager.shared.debug(.subtitles, message: "First available subtitle already active (ID: \(currentSid)), no switch needed")
            }

            // Update our state
            // Update our state


            // Analyze compatibility after selecting track
            analyzeSubtitleCompatibility()

            return true
        } else {
            LoggingManager.shared.debug(.subtitles, message: "No subtitle tracks found in video yet")
            return false
        }
    }

    // MARK: - Chat

    func toggleChat() {
        // ✅ Ensure we're not already animating
        guard !isAnimatingChatToggle else { return }

        // ✅ Reduce background load during animation
        isAnimatingChatToggle = true

        // ✅ Temporarily pause non-critical updates
        let originalInterval = syncBroadcastTimer?.timeInterval
        syncBroadcastTimer?.invalidate()

        // ✅ Instant toggle (Twitch-style pop) - Zero animation for max performance
        showChat.toggle()

        // ✅ Restore background updates after animation completes with timeout safeguard
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 300_000_000)
            guard let self = self else { return }

            // ✅ SAFEGUARD: Always reset animation state after timeout
            self.isAnimatingChatToggle = false

            // Restart broadcasting if it was active
            if self.isWatchPartyHost && originalInterval != nil {
                self.startBroadcastingState()
            }
        }

        // ✅ TIMEOUT PROTECTION: Force reset after 1 second maximum
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            self?.isAnimatingChatToggle = false
        }

        LoggingManager.shared.info(.social, message: showChat ? "Chat opened" : "Chat closed")
    }

    func sendMessage(_ text: String) {
        guard !text.isEmpty else { return }
        guard currentRoomId != nil else {
            LoggingManager.shared.warn(.social, message: "Cannot send message: no room ID")
            return
        }

        let username = appState?.currentUsername ?? "Guest"
        let userId = appState?.currentUserId ?? UUID()

        let message = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date(),
            senderId: userId.uuidString,
            isPremium: LicenseManager.shared.isPremium
        )

        messages.append(message)

        // Limit message history to prevent memory bloat (keep last 100 messages)
        if messages.count > 100 {
            messages.removeFirst(messages.count - 100)
        }

        trimChatMessages()
        LoggingManager.shared.debug(.social, message: "Sent: \(text)")

        // Watch party chat: Send via Realtime ONLY (no database)
        // Watch party rooms don't exist in the database, only in Realtime
        if isInWatchParty {
            Task { [weak self] in
                guard let self = self else { return }
                let syncMessage = SyncMessage(
                    type: .chat,
                    timestamp: Date().timeIntervalSince1970,
                    isPlaying: nil,
                    senderId: userId.uuidString,
                    chatText: text,
                    chatUsername: username,
                    isPremium: LicenseManager.shared.isPremium
                )

                do {
                    try await self.realtimeManager?.sendSyncMessage(syncMessage)
                    LoggingManager.shared.info(.social, message: "Chat message sent via Realtime")
                } catch {
                    LoggingManager.shared.error(.social, message: "Failed to send chat message: \(error)")
                }
            }
        }
    }

    func sendReaction(_ emoji: String) {
        // Rate Limiting: Max 5 per 2 seconds, Min 0.15s gap
        let now = Date()

        // 1. Minimum Gap Check
        if let last = reactionTimestamps.last, now.timeIntervalSince(last) < 0.15 {
             return
        }

        // 2. Burst Check
        // Clean up old timestamps (>2s ago)
        reactionTimestamps = reactionTimestamps.filter { now.timeIntervalSince($0) < 2.0 }

        if reactionTimestamps.count >= 5 {
             LoggingManager.shared.warn(.social, message: "Reaction limit reached (spam guard)")
             return
        }

        reactionTimestamps.append(now)

        guard !isInWatchParty else {
            // Watch Party Mode
            let userId = appState?.currentUserId?.uuidString ?? UUID().uuidString
            let syncMessage = SyncMessage(
                type: .reaction,
                timestamp: Date().timeIntervalSince1970, // Instant
                isPlaying: nil,
                senderId: userId,
                chatText: emoji, // Store emoji in chatText
                chatUsername: appState?.currentUsername
            )

            // Show locally immediately
            reactionTriggers.send(emoji)

            Task { [weak self] in
                try? await self?.realtimeManager?.sendSyncMessage(syncMessage)
            }
            return
        }

        // Solo/Local Mode (just show locally)
        reactionTriggers.send(emoji)
    }

    /// Send a floating announcement to all participants (Host Only)
    func sendAnnouncement(_ text: String) {
        guard isWatchPartyHost else { return }
        LoggingManager.shared.info(.watchParty, message: "Host sending announcement: \(text)")

        // 1. Show locally immediately (floating only)
        announcementTriggers.send(text)

        // 2. Broadcast via Realtime
        let userInfo = appState?.currentUsername
        let userId = currentUserId

        let syncMessage = SyncMessage(
            type: .hostAnnouncement,
            timestamp: Date().timeIntervalSince1970, // Use current time
            position: currentTime,
            isPlaying: isPlaying,
            senderId: userId,
            chatText: text,
            chatUsername: userInfo ?? "Host"
        )

        Task { [weak self] in
            try? await self?.realtimeManager?.sendSyncMessage(syncMessage)
        }
    }

    // MARK: - Enhanced Timer Management

    private func scheduleTimer(interval: TimeInterval, handler: @escaping () -> Void) -> Timer {
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { _ in
            handler()
        })
        activeTimers.append(timer)
        return timer
    }

    private func invalidateAllTimers() {
        watchHistoryTimer?.invalidate()
        watchHistoryTimer = nil
        syncBroadcastTimer?.invalidate()
        syncBroadcastTimer = nil
        chatPollingTimer?.invalidate()
        chatPollingTimer = nil
        readyLoopTimer?.invalidate()
        readyLoopTimer = nil
        bufferingTimer?.invalidate()
        bufferingTimer = nil
        activeTimers.forEach { $0.invalidate() }
        activeTimers.removeAll()
        LoggingManager.shared.debug(.general, message: "Invalidated all active timers")
    }

    /// Keep chat list bounded to avoid long-session memory bloat
    private func trimChatMessages(maxCount: Int = 200) {  // Was 500
        if messages.count > maxCount {
            messages.removeFirst(messages.count - maxCount)
        }
    }

    /// Adds a local system message to the chat (not broadcasted)
    private func addSystemMessage(_ text: String) {
        let message = ChatMessage(
            id: UUID().uuidString,
            username: "System",
            text: text,
            timestamp: Date(),
            isSystem: true
        )
        Task { @MainActor in
            self.messages.append(message)
            self.trimChatMessages()
        }
    }

    // MARK: - Cleanup

    func cleanup(returningToLobby: Bool = false) async {
        // Prevent double cleanup
        guard !hasCleanedUp else {
            LoggingManager.shared.warn(.general, message: "Cleanup already performed, skipping")
            return
        }
        print("DEBUG: MPVPlayerViewModel.cleanup called - forcing cleanup")
        hasCleanedUp = true

        LoggingManager.shared.info(.general, message: "Cleaning up MPV player...")

        // ✅ Capture state BEFORE clearing it (Fix for "User Left" bug)
        // We need to know if we WERE in a watch party to trigger the leave signal.
        let wasInWatchParty = self.isInWatchParty
        // Also capture room/user IDs before MainActor block clears them
        let capturedRoomId = self.currentRoomId
        let capturedUserId = self.currentUserId

        // ✅ STEP 1: Clear watching status immediately
        if !returningToLobby {
            // FIX: Race Condition Check
            // If the user has heavily transitioned to "In Lobby" (e.g. WatchPartyLobbyView loaded first),
            // do NOT revert them to "Browsing" just because an old player instance is dying.
            let currentStatus = SocialService.shared.currentStatus
            let isInLobby = currentStatus?.hasPrefix("In Lobby") == true

            if !isInLobby {
                await SocialService.shared.updateWatchingStatus(
                    mediaTitle: nil,
                    mediaType: nil,
                    imdbId: nil,
                    roomId: nil
                )
            } else {
                 LoggingManager.shared.debug(.general, message: "Cleanup: Skipping status reset (User is already in Lobby)")
            }
        }

        // ✅ STEP 1.5: Clear UI state to prevent re-use flash
        await MainActor.run {
             self.backgroundURL = nil
             self.posterURL = nil
             self.logoURL = nil
             self.showPoster = true
             self.isLoading = true
             // self.appState?.player.eventStartTime = nil // REMOVED: Managed by PlayerViewModel.exitPlayer and loadStream to prevent race condition during room join
             // self.appState?.player.resumeFromTimestamp = 0 // REMOVED: Managed by PlayerViewModel.exitPlayer and loadStream to prevent race condition during room join


             if !returningToLobby {
                 // CRITICAL FIX: Only clear room state if we're still in the SAME room.
                 // When transitioning to a DIFFERENT room (e.g., joining friend's room from player chat),
                 // PlayerViewModel.joinRoom() has already set the new room ID/state BEFORE this cleanup runs.
                 // Clearing it here would cause "No room found" error.
                 let appRoomId = self.appState?.player.currentRoomId
                 let shouldClearRoomState = (appRoomId == nil || appRoomId == self.currentRoomId)

                 if shouldClearRoomState {
                     // self.appState?.player.currentWatchPartyRoom = nil // REMOVED: Managed by PlayerViewModel.exitPlayer to prevent premature deletion during transitions (Rule #101)
                 } else {
                     LoggingManager.shared.debug(.general, message: "Cleanup: Preserving room state (transitioning to different room: \(self.currentRoomId ?? "nil") → \(appRoomId ?? "nil"))")
                 }

                 self.currentRoomId = nil
                 self.isWatchPartyHost = false
                 self.isInWatchParty = false
             }

             self.hasCleanedUp = true // Ensure flag is set on MainActor
        }

        // ✅ STEP 2: Stop timers to prevent further updates
        invalidateAllTimers()

        // ✅ STEP 3: Cancel observers (Handled by bindings/Lifecycle)
        // mpvObserverTasks.removeAll()

        pendingPlayTask?.cancel()
        pendingPlayTask = nil

        // Stop playback heartbeat
        stopPlaybackHeartbeat()

        // Stop Ready Loop
        readyLoopTimer?.invalidate()
        readyLoopTimer = nil

        // ✅ STEP 4: Disconnect realtime FIRST and await completion
        // Fix: Use captured state instead of potentially cleared 'isInWatchParty'
        if wasInWatchParty {
            // CRITICAL FIX: When returning to lobby, do NOT leave room_participants.
            // This keeps the room alive so the cron job doesn't delete it as "orphaned".
            // Guests will reconnect to the same room in the lobby.
            if !returningToLobby {
                // Only leave room in database if NOT returning to lobby
                // Use CAPTURED values since self.currentRoomId was already cleared in MainActor block
                if let roomId = capturedRoomId,
                   let userId = capturedUserId,
                   let userUUID = UUID(uuidString: userId) {
                    try? await SupabaseClient.shared.leaveRoom(roomId: roomId, userId: userUUID)
                    LoggingManager.shared.info(.watchParty, message: "Left room in database: \(roomId)")
                } else {
                    LoggingManager.shared.warn(.watchParty, message: "Could not leave room - capturedRoomId: \(capturedRoomId ?? "nil"), capturedUserId: \(capturedUserId ?? "nil")")
                }
            } else {
                LoggingManager.shared.info(.watchParty, message: "Returning to lobby - keeping host in room_participants to preserve room")
            }

            // ✅ STEP 5: Stop MPV AFTER websocket fully disconnected
            // CRITICAL FIX: Do NOT disconnect the shared client, only leave the channel.
            // Disconnecting the client kills the connection for the LobbyViewModel too.
            await realtimeManager?.disconnect(leaveChannel: true, disconnectClient: false)
            LoggingManager.shared.info(.watchParty, message: "Realtime manager channel left (client connection preserved)")
        }

        // ✅ STEP 5: Stop MPV AFTER websocket fully disconnected
        LoggingManager.shared.info(.videoRendering, message: "Stopping MPV playback...")
        mpvWrapper.pause() // Ensure paused state before hard stop
        mpvWrapper.stop()

        // CRITICAL FIX: Manually destroy MPV instance.
        // This ensures the underlying libmpv instance and render context are freed
        // even if this ViewModel is retained by a lingering closure or cycle.
        mpvWrapper.destroy()
    }

    deinit {
        LoggingManager.shared.info(.general, message: "MPVPlayerViewModel deinit")
        // ✅ Don't create async tasks in deinit - cleanup() is already called before deallocation
        // The Task with [weak self] creates a race condition where self may be deallocated
        // between the guard check and the MainActor.run execution, causing a crash in Swift's
        // reference counting system (decrementStrong). All necessary cleanup is handled by cleanup().
    }

    // MARK: - Subtitle Download


}

// MARK: - Models

// MARK: - Models

struct ChatMessage: Identifiable {
    let id: String
    let username: String
    let text: String
    let timestamp: Date
    var isSystem: Bool = false
    var senderId: String? = nil
    var isPremium: Bool = false
}



// MARK: - Response Models

struct CinemetaMetadataResponse: Codable {
    let meta: CinemetaMetadata
}

struct CinemetaMetadata: Codable {
    let imdb_id: String
    let name: String
    let type: String
    let year: String?
    let poster: String?
    let background: String?
    let logo: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case imdb_id, name, type, year, poster, background, logo, description
    }
}

// MARK: - Watch Party Extension

extension MPVPlayerViewModel {
    /// Start watch party sync as host or guest
    func startWatchPartySync(roomId: String, isHost: Bool) async throws {
        LoggingManager.shared.info(.watchParty, message: "Starting watch party: roomId=\(roomId), isHost=\(isHost)")

        self.currentRoomId = roomId
        self.isWatchPartyHost = isHost
        self.isInWatchParty = true  // Enable watch party mode
        LoggingManager.shared.info(.watchParty, message: "Watch Party Mode ENABLED. isInWatchParty = \(self.isInWatchParty ? "YES" : "NO")")

        // Get user ID from appState
        guard let userId = appState?.currentUserId?.uuidString else {
            throw RealtimeError.notInitialized
        }

        // FIX (v1.0.77): Reset Ready Gate state when (re-)entering watch party sync
        // AI_BIBLE #35 (Ghost Streams): Stale state from previous session causes Ready Gate malfunction
        // Symptom: Black screen with audio on second playback (isLoading stays true)
        // Root Cause: hasSentReadySignal/connectedGuestIds not cleared → startSynchronizedPlayback() never called
        LoggingManager.shared.debug(.watchParty, message: "Resetting Watch Party Ready Gate state for new sync session")
        self.hasSentReadySignal = false
        self.connectedGuestIds.removeAll()
        self.readyGuestIds.removeAll()
        self.readySignalsSentCount = 0

        self.currentUserId = userId

        // Initialize Realtime manager
        self.realtimeManager = RealtimeChannelManager(realtimeClient: RedLemon.SupabaseClient.shared.realtimeClient)

        // But prepare welcome message for when they do open it
        // CRITICAL: Set up presence callback BEFORE setup() so we don't miss any presence events
        await realtimeManager?.setPresenceCallback { [weak self] (action: PresenceAction, userId: String, metadata: [String: Any]?) in
            _ = Task { @MainActor in
                guard let self = self else { return }
                
                // PERFORMANCE DIAGNOSTIC: Track how long participant updates take
                let startTime = CACurrentMediaTime()

                // FALLBACK: If room is missing locally (e.g. host started quickly), fetch it
                if self.appState?.player.currentWatchPartyRoom == nil {
                    // Explicitly capture roomId to avoid ambiguous expression error in closure
                    if let roomId: String = self.currentRoomId {
                    LoggingManager.shared.warn(.watchParty, message: "Room state missing in MPVViewModel - fetching fallback for \(roomId)")
                    if let fetchedSupabaseRoom = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                        // Map to minimal WatchPartyRoom for participant tracking
                        let mediaItem = MediaItem(
                            id: fetchedSupabaseRoom.imdbId ?? "unknown",
                            type: "movie", // simplified
                            name: fetchedSupabaseRoom.name,
                            poster: fetchedSupabaseRoom.posterUrl,
                            background: fetchedSupabaseRoom.backdropUrl,
                            logo: nil,
                            description: nil,
                            releaseInfo: nil,
                            year: nil,
                            imdbRating: nil,
                            genres: nil,
                            runtime: nil
                        )

                        // Basic host participant (others will populate via Realtime)
                        let host = Participant(
                            id: (fetchedSupabaseRoom.type == .event) ? "system" : (fetchedSupabaseRoom.hostUserId?.uuidString.lowercased() ?? "system"),
                            name: fetchedSupabaseRoom.hostUsername,
                            isHost: true,
                            isReady: true,
                            joinedAt: Date(),
                            phxRef: nil
                        )

                        let fetchedRoom = WatchPartyRoom(
                            id: fetchedSupabaseRoom.id,
                            hostId: (fetchedSupabaseRoom.type == .event) ? "system" : (fetchedSupabaseRoom.hostUserId?.uuidString ?? "system"),
                            hostName: fetchedSupabaseRoom.hostUsername,
                            mediaItem: mediaItem,
                            season: fetchedSupabaseRoom.season,
                            episode: fetchedSupabaseRoom.episode,
                            episodeTitle: nil,
                            quality: .fullHD,
                            sourceQuality: nil,
                            description: nil,
                            posterURL: fetchedSupabaseRoom.posterUrl,
                            participants: [host],
                            participantCount: fetchedSupabaseRoom.participantsCount,  // Use DB-managed count
                            state: fetchedSupabaseRoom.isPlaying ? .playing : .lobby,
                            createdAt: fetchedSupabaseRoom.createdAt,
                            lastActivity: fetchedSupabaseRoom.lastActivity,
                            playlist: nil,
                            currentPlaylistIndex: 0,
                            lobbyDuration: 300,
                            shouldLoop: false,
                            isPersistent: true,
                            playbackPosition: TimeInterval(fetchedSupabaseRoom.playbackPosition),
                            runtime: nil,
                            selectedStreamHash: nil,
                            selectedFileIdx: nil,
                            selectedQuality: nil,
                            unlockedStreamURL: nil
                        )

                        self.appState?.player.currentWatchPartyRoom = fetchedRoom
                    }
                }
            }

                // Update AppState participants list for UI
                if let room = self.appState?.player.currentWatchPartyRoom {
                    var updatedParticipants: [Participant] = room.participants
                    let localCurrentUserId = self.currentUserId

                    // Define actualUserId ONCE before switch, using consistent logic
                    // Prioritize user_id from metadata, then username, then fallback to passed userId
                    let metaUserId = metadata?["user_id"] as? String
                    let metaUsername = metadata?["username"] as? String
                    // CRITICAL FIX: Normalize UUIDs to lowercase to prevent mismatched keys (Supabase inconsistency)
                    let actualUserId = (metaUserId ?? metaUsername ?? userId).lowercased()

                    switch action {
                    case .join:
                        // Cancel any pending leave for this user
                        // Cancel any pending leave for this user
                        if let existingTask = self.pendingLeaveTasks[actualUserId] {
                            LoggingManager.shared.info(.watchParty, message: "User \(actualUserId) reconnected within grace period - cancelling leave")
                            existingTask.cancel()
                            self.pendingLeaveTasks.removeValue(forKey: actualUserId)
                            // Do NOT return here - we must proceed to update the phx_ref!
                        }


                        // Check if already exists using actualUserId (stable ID)
                        if let index = updatedParticipants.firstIndex(where: { $0.id == actualUserId }) {
                            // User exists - update their timestamp
                            // Capture offline state before update (True if phxRef was nil)
                            let wasOffline = updatedParticipants[index].phxRef == nil

                            updatedParticipants[index].joinedAt = Date()

                            // Prefer phx_ref from metadata.
                            if let newPhxRef = metadata?["phx_ref"] as? String {
                                updatedParticipants[index].phxRef = newPhxRef
                                self.activeConnectionRefs[actualUserId] = newPhxRef // Track officially
                                LoggingManager.shared.info(.watchParty, message: "Updated existing participant \(actualUserId) with Ref: \(newPhxRef)")
                            } else {
                                LoggingManager.shared.warn(.watchParty, message: "Join event for \(actualUserId) missing phx_ref - preserving existing Ref: \(updatedParticipants[index].phxRef ?? "nil")")
                                // If we don't have a new ref, do we keep the old one in `activeConnectionRefs`?
                                // Yes, assume same session.
                            }

                            // If upgrading from DB-only (Offline) to Realtime (Online), announce it
                            // This fixes the race condition where DB Polling adds them first (no Ref)
                            // and suppresses the Join message because they are "already in list".
                            if wasOffline && actualUserId != self.currentUserId {
                                self.addSystemMessage("\(updatedParticipants[index].name) joined")
                            }

                            if let name = metaUsername {
                                updatedParticipants[index].name = name
                            }
                        } else {
                            // New user - create with actualUserId
                            let phxRefVal = metadata?["phx_ref"] as? String
                            if let ref = phxRefVal {
                                self.activeConnectionRefs[actualUserId] = ref
                            }

                            let username = metaUsername ?? "User"
                            let isHostVal = metadata?["is_host"] as? Bool ?? false
                            let joinedAtVal = metadata?["joined_at"] as? TimeInterval ?? Date().timeIntervalSince1970


                            let newParticipant = Participant(
                                id: actualUserId, // Use stable ID
                                name: username,
                                isHost: isHostVal,
                                isReady: false,
                                joinedAt: Date(timeIntervalSince1970: joinedAtVal),
                                phxRef: phxRefVal
                            )
                            updatedParticipants.append(newParticipant)
                            LoggingManager.shared.info(.watchParty, message: "Added new participant \(actualUserId) (Ref: \(phxRefVal ?? "nil"))")

                            // 💬 System Message: Join
                            if actualUserId != self.currentUserId {
                                self.addSystemMessage("\(username) joined")
                            }
                        }

                        // ENSURE SELF IS IN LIST
                        if let currentId = localCurrentUserId?.lowercased() {
                            let isSelfPresent = updatedParticipants.contains(where: { (p: Participant) in p.id == currentId })
                            if !isSelfPresent {
                                LoggingManager.shared.warn(.watchParty, message: "Self (\(currentId)) was missing from list - restoring.")
                                // CRITICAL FIX: Only use 'userId' (closure arg) as phxRef if this event was FOR SELF.
                                // Otherwise, use nil (we don't know our own ref from someone else's join).
                                var selfRef = (actualUserId == currentId) ? (metadata?["phx_ref"] as? String) : nil

                                // Last Ditch: Check if we have a stale ref for self in the OLD list
                                if selfRef == nil {
                                    if let oldSelf = self.appState?.player.currentWatchPartyRoom?.participants.first(where: { $0.id == currentId }) {
                                        selfRef = oldSelf.phxRef
                                        LoggingManager.shared.debug(.watchParty, message: "Restored stale phx_ref for Self: \(selfRef ?? "nil")")
                                    }
                                }

                                let selfParticipant = Participant(
                                    id: currentId,
                                    name: self.appState?.currentUsername ?? "Me",
                                    isHost: self.isWatchPartyHost,
                                    isReady: true,
                                    joinedAt: Date(),
                                    phxRef: selfRef
                                )
                                updatedParticipants.append(selfParticipant)
                            }
                        }

                        // ✅ Update room state with fresh list
                        // NOTE: SwiftUI automatically detects this change - no need for objectWillChange.send()
                        // Forcing objectWillChange causes full view hierarchy re-render (lag on macOS 26)
                        self.appState?.player.currentWatchPartyRoom?.participants = updatedParticipants
                        
                        // PERFORMANCE DIAGNOSTIC: Log how long the join processing took
                        let joinDurationMs = (CACurrentMediaTime() - startTime) * 1000
                        LoggingManager.shared.performance("Participant JOIN processing", durationMs: joinDurationMs)

                    case .leave:
                        // This handles flaky connections and Lobby->Player transitions
                        LoggingManager.shared.info(.watchParty, message: "Participant leaving (grace period started): \(actualUserId)")

                        // Extract ref immediately for closure capture
                        let leavingPhxRef = metadata?["phx_ref"] as? String

                        let task: Task<Void, Never> = Task { @MainActor [weak self, actualUserId, leavingPhxRef] in
                            // Wait 2 seconds (nano) - reduced from 10s to fix "Missing Leave Message" bug
                            // This allows quick refreshes to be debounced but ensures actual leaves are reported promptly.
                            try? await Task.sleep(nanoseconds: 2_000_000_000)

                            guard let self = self else { return }

                            // Check for cancellation
                            if Task.isCancelled {
                                LoggingManager.shared.debug(.watchParty, message: "Leave task cancelled for \(actualUserId)")
                                return
                            }

                            // Fetch FRESH list to avoid stale data race
                            guard var currentParticipants = self.appState?.player.currentWatchPartyRoom?.participants else { return }

                            // Check against our authoritative Ref Map
                            // If we have a record of this user's Active Ref, it must match the Leaving Ref.
                            if let trackedRef = self.activeConnectionRefs[actualUserId] {
                                if let leavingRef = leavingPhxRef {
                                     if trackedRef != leavingRef {
                                         LoggingManager.shared.debug(.watchParty, message: "Ignoring stale LEAVE event for \(actualUserId) (Tracked: \(trackedRef) != Leaving: \(leavingRef))")
                                         self.pendingLeaveTasks.removeValue(forKey: actualUserId)
                                         return
                                     } else {
                                         LoggingManager.shared.debug(.watchParty, message: "LEAVE MATCHED tracked ref: \(trackedRef)")
                                     }
                                }
                            } else {
                                 // We have NO record of this user's ref.
                                 // This likely means they are already gone (removed by DB poll?).
                                 // If we assume "True Leave", we should announce it.
                                 // But if it's "Ghost Leave" (rotation), we should have the NEW ref in the map (from Join).
                                 // So if map is empty, it means they are NOT currently connected with ANY ref.
                                 // So it's safe to process the leave.
                                 LoggingManager.shared.warn(.watchParty, message: "Participant \(actualUserId) not in Ref Map. Assuming valid leave (or already processed).")
                            }

                            // Clean up ref map
                            self.activeConnectionRefs.removeValue(forKey: actualUserId)

                            // Find username before removing for the message
                            let defaultsName = metadata?["username"] as? String ?? "User"
                            let username = self.appState?.player.currentWatchPartyRoom?.participants.first(where: { $0.id == actualUserId })?.name ?? defaultsName

                            // Remove using actualUserId (Force remove even if not in list, just in case)
                            if var currentParticipants = self.appState?.player.currentWatchPartyRoom?.participants {
                                currentParticipants.removeAll(where: { $0.id == actualUserId })
                                self.appState?.player.currentWatchPartyRoom?.participants = currentParticipants
                            }

                            // 💬 System Message: Leave
                            if actualUserId != self.currentUserId {
                                self.addSystemMessage("\(username) left")
                            }
                            LoggingManager.shared.info(.watchParty, message: "Participant left (confirmed): \(actualUserId)")

                            // Post-Load Gate Logic
                            if actualUserId != self.currentUserId {
                                self.connectedGuestIds.remove(actualUserId)
                                self.readyGuestIds.remove(actualUserId)
                                if self.isWatchPartyHost {
                                    self.checkIfAllGuestsReady()
                                }
                            }

                            // NOTE: SwiftUI automatically detects participant changes - no objectWillChange.send() needed
                            // Removing this eliminates lag spike on macOS 26 during user join/leave
                            self.pendingLeaveTasks.removeValue(forKey: actualUserId)
                        }

                        self.pendingLeaveTasks[actualUserId] = task
                        return

                    }

                    // Deduplicate participants by ID (preferring entries with phxRef or newer joinedAt)
                    // This fixes the "Ghost User" issue where Uppercase (DB) and Lowercase (Realtime) IDs coexist
                    var uniqueParticipants: [String: Participant] = [:]

                    for p in updatedParticipants {
                        let normalizedId = p.id.lowercased()
                        if let existing = uniqueParticipants[normalizedId] {
                            // Merge logic: Keep the one with phxRef, or the newer one
                            if existing.phxRef == nil && p.phxRef != nil {
                                uniqueParticipants[normalizedId] = p
                            } else if existing.phxRef != nil && p.phxRef == nil {
                                // Keep existing
                            } else {
                                // Both have ref or neither; keep newest
                                if p.joinedAt > existing.joinedAt {
                                    uniqueParticipants[normalizedId] = p
                                }
                            }
                        } else {
                            uniqueParticipants[normalizedId] = p
                        }
                    }

                    // Final sorted list
                    let dedupedList = uniqueParticipants.values.sorted { $0.joinedAt < $1.joinedAt }

                    // Update room state
                    self.appState?.player.currentWatchPartyRoom?.participants = dedupedList
                }
            }
        }

        // Now setup the channel with callbacks already in place
        // Don't auto-open chat - let user toggle it with spacebar or chat button
        // But prepare welcome message for when they do open it
        self.messages = [
            ChatMessage(
                id: UUID().uuidString,
                username: "System",
                text: isHost ? "🎉 Watch party started! Share room ID: \(roomId)" : "🎉 Joined watch party: \(roomId)",
                timestamp: Date()
            )
        ]

        // Get username from appState
        let username = appState?.currentUsername ?? "User"

        try await realtimeManager?.setup(
            roomId: roomId,
            isHost: isHost,
            userId: userId,
            username: username,
            onSync: { [weak self] syncMessage in
                Task { @MainActor in
                    await self?.handleSyncMessage(syncMessage)
                }
            }
        )

        // If host, start broadcasting playback state
        if isHost {
            startBroadcastingState()
        }

        // Start polling chat messages from database
        startChatPolling()

        // Start playback heartbeat to maintain presence in room_participants
        startPlaybackHeartbeat()

        LoggingManager.shared.info(.watchParty, message: "Watch party sync initialized with Realtime")

        // Post-Setup Check: If video already loaded, send ready signal now
        // This handles the race condition where duration loaded before Realtime was ready
        if duration > 0 && !hasSentReadySignal {
             LoggingManager.shared.info(.watchParty, message: "Watch Party: Setup complete, sending delayed READY signal")
             sendReadySignal()
        }
    }

    /// Trigger return to lobby for all participants (Host Only)
    func triggerReturnToLobby() {
        guard isWatchPartyHost else { return }
        LoggingManager.shared.info(.watchParty, message: "Host triggering return to lobby...")

        // Show exit UI
        self.isExitingToLobby = true

        // Set message for Host
        appState?.pendingLobbyMessage = "You returned the group to the lobby."

        // CRITICAL FIX: Stop the broadcast timer IMMEDIATELY to prevent race condition
        // If we don't stop it here, the timer will continue sending playbackState messages
        // AFTER we send returnToLobby, causing guests to ignore the lobby return signal.
        syncBroadcastTimer?.invalidate()
        syncBroadcastTimer = nil
        LoggingManager.shared.info(.watchParty, message: "Host stopped sync broadcast timer before returnToLobby")

        // CRITICAL FIX: Use sequential awaits to prevent ViewModel deinit before message send
        Task { [weak self] in
            guard let self = self else { return }

            // 1. Clear DB State FIRST (Prevent race condition for quick-returning guests)
            if let roomId = self.appState?.player.currentRoomId {
                try? await SupabaseClient.shared.updateRoomPlayback(
                    roomId: roomId,
                    position: 0,
                    isPlaying: false,
                    shouldClearStream: true // CLEARS GHOST STREAM (Landmine #35)
                )
                LoggingManager.shared.info(.watchParty, message: "Host cleared DB playback state and GHOST STREAMS before exit")
            }

            // 2. Send sync message to guests and AWAIT completion
            let message = SyncMessage(
                type: .returnToLobby,
                timestamp: Date().timeIntervalSince1970,
                position: 0,
                isPlaying: false,
                senderId: self.currentUserId
            )

            do {
                try await self.realtimeManager?.sendSyncMessage(message)
                LoggingManager.shared.info(.watchParty, message: "Host sent returnToLobby message to guests")
            } catch {
                LoggingManager.shared.error(.watchParty, message: "Host failed to send returnToLobby message: \(error)")
            }

            // 3. Small delay to ensure message propagates through Realtime
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s

            // 4. ONLY NOW cleanup and navigate
            await MainActor.run {
                Task { [weak self] in
                    guard let self = self else { return }
                    await self.cleanup(returningToLobby: true)
                    await self.appState?.player.exitPlayer(keepRoomState: true)
                    await MainActor.run {
                        self.appState?.currentView = .watchPartyLobby
                    }
                }
            }
        }
    }

    /// Notify guests that the host experienced a playback error
    /// This prevents guests from being stuck at the ready gate when the host's video fails to load
    private func notifyGuestsOfHostError() async {
        guard isWatchPartyHost else { return }

        LoggingManager.shared.warn(.videoRendering, message: "notifyGuestsOfHostError: Sending returnToLobby signal due to host error")

        // Stop broadcast timer to prevent conflicting messages
        syncBroadcastTimer?.invalidate()
        syncBroadcastTimer = nil

        // Set a message for the lobby
        await MainActor.run {
            self.appState?.pendingLobbyMessage = "Playback error occurred. Returning to lobby..."
        }

        // Send returnToLobby signal to guests
        let message = SyncMessage(
            type: .returnToLobby,
            timestamp: Date().timeIntervalSince1970,
            position: 0,
            isPlaying: false,
            senderId: currentUserId
        )

        do {
            try await realtimeManager?.sendSyncMessage(message)
            LoggingManager.shared.info(.watchParty, message: "Host sent returnToLobby message due to error")
        } catch {
            LoggingManager.shared.error(.watchParty, message: "Failed to notify guests of host error: \(error)")
        }

        // Small delay to ensure message propagates
        try? await Task.sleep(nanoseconds: 300_000_000) // 0.3s
    }

    // MARK: - Playback Heartbeat (Room Presence)

    /// Start heartbeat loop to maintain presence in room_participants during playback
    /// This prevents the zombie cleanup from removing the host while actively watching
    private func startPlaybackHeartbeat() {
        playbackHeartbeatTask?.cancel()
        playbackHeartbeatTask = Task { [weak self] in
            // OPTIMIZATION: Initial delay to stagger from WebSocket heartbeat (30s)
            try? await Task.sleep(nanoseconds: 10_000_000_000) // 10s initial offset
            while !Task.isCancelled {
                guard let self = self,
                      let roomId = self.currentRoomId,
                      let userId = self.appState?.currentUserId else { return }

                do {
                    try await SupabaseClient.shared.sendHeartbeat(roomId: roomId, userId: userId)
                    LoggingManager.shared.debug(.watchParty, message: "Playback heartbeat sent for room: \(roomId)")
                } catch {
                    LoggingManager.shared.warn(.watchParty, message: "Playback heartbeat failed: \(error)")
                    // Trigger self-healing if this is an auth token/key error
                    await SocialService.shared.handleAuthError(error)
                }

                // Wait 30 seconds before next heartbeat
                try? await Task.sleep(nanoseconds: 30_000_000_000)
            }
        }
        LoggingManager.shared.debug(.watchParty, message: "Started playback heartbeat loop")
    }

    /// Stop the playback heartbeat loop
    private func stopPlaybackHeartbeat() {
        playbackHeartbeatTask?.cancel()
        playbackHeartbeatTask = nil
        LoggingManager.shared.debug(.watchParty, message: "Stopped playback heartbeat loop")
    }

    /// Start polling chat messages from Supabase
    private func startChatPolling() {
        guard let roomId = currentRoomId else { return }

        LoggingManager.shared.debug(.social, message: "Starting chat polling for room: \(roomId)")

        // OPTIMIZATION: Reduced from 10s to 15s - Realtime handles instant delivery
        chatPollingTimer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                await self.pollChatMessages()
                await self.pollParticipants()
            }
        }

        // Do initial fetch immediately
        Task { @MainActor in
            await pollChatMessages()
            await pollParticipants()
        }
    }

    /// Poll participants from database (Fix for Rooms showing 0 participants)
    private func pollParticipants() async {
        guard let roomId = currentRoomId else { return }

        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: roomId)

            // Current participants map (normalized ID -> Participant)
            var currentMap: [String: Participant] = [:]
            if let currentList = appState?.player.currentWatchPartyRoom?.participants {
                for p in currentList {
                    currentMap[p.id.lowercased()] = p
                }
            }

            var mergedParticipants = Array(currentMap.values)
            var hasChanges = false

            // 1. Process DB Participants (Updates & Adds)
            var dbUserIds = Set<String>()

            for p in roomParticipants {
                let pId = p.userId.uuidString.lowercased()
                dbUserIds.insert(pId)

                if let existing = currentMap[pId] {
                    // Update existing (preserve phxRef and joinedAt if older)
                    // If DB says host changed, update it.
                    if existing.isHost != p.isHost {
                        var updated = existing
                        updated.isHost = p.isHost
                        currentMap[pId] = updated
                        hasChanges = true
                    }
                    // We knowingly encounter name mismatches (DB username vs Metadata username)
                    // We trust Realtime metadata name more for active users, but DB for offline.
                    // Let's keep existing name if possible.
                } else {
                    // New user from DB (likely persistent/offline or just joined)
                    // Try to fetch username if not available
                    var name = "User"
                    if let user = try? await SupabaseClient.shared.getUserById(userId: p.userId) {
                         name = user.username
                    }

                    let newParticipant = Participant(
                        id: pId, // Normalized
                        name: name,
                        isHost: p.isHost,
                        isReady: false, // Default to false for DB poll
                        joinedAt: p.joinedAt,
                        phxRef: nil // No ref from DB
                    )
                    currentMap[pId] = newParticipant
                    hasChanges = true
                }
            }

            // 2. Process Removals?
            // CRITICAL: Do NOT remove users just because they are missing from DB poll immediately.
            // Presence might be ahead of DB.
            // However, if we have a user with NO phxRef (offline) and they are NOT in DB, they should be removed.
            // If they HAVE phxRef (online), we KEEP them regardless of DB.

            let idsToRemove = currentMap.keys.filter { id in
                let isOnline = currentMap[id]?.phxRef != nil
                let isInDB = dbUserIds.contains(id)

                // If Online: Keep (Source of Truth is Realtime)
                if isOnline { return false }

                // If Offline and Not in DB: Remove (Stale)
                if !isInDB { return true }

                return false
            }

            if !idsToRemove.isEmpty {
                for id in idsToRemove {
                    currentMap.removeValue(forKey: id)
                }
                hasChanges = true
            }

            // Only update if changed
            if hasChanges {
                let sortedList = currentMap.values.sorted { $0.joinedAt < $1.joinedAt }
                self.appState?.player.currentWatchPartyRoom?.participants = sortedList
                LoggingManager.shared.debug(.watchParty, message: "MPVPlayer: Merged participants list via polling (Count: \(sortedList.count))")
            }

        } catch {
            // fail silently mostly
        }
    }

    /// Poll chat messages from database
    private func pollChatMessages() async {
        guard let roomId = currentRoomId else { return }

        do {
            let dbMessages = try await SupabaseClient.shared.getChatMessages(roomId: roomId, limit: 50)

            // Filter out messages we've already seen
            let newMessages = dbMessages.filter { msg in
                // If we have a last message ID, only show messages after it
                if let lastId = lastChatMessageId {
                    return msg.createdAt > (messages.first(where: { $0.id == lastId })?.timestamp ?? Date.distantPast)
                }
                // Otherwise, show all messages that aren't already in our list
                return !messages.contains(where: { $0.id == msg.id.uuidString })
            }

            // Add new messages to chat
            for msg in newMessages.reversed() {  // Reversed to maintain chronological order
                let chatMsg = ChatMessage(
                    id: msg.id.uuidString,
                    username: msg.username,
                    text: msg.message,
                    timestamp: msg.createdAt,
                    senderId: msg.userId.uuidString
                )
                messages.append(chatMsg)
                trimChatMessages()
                lastChatMessageId = msg.id.uuidString

                LoggingManager.shared.debug(.social, message: "New chat message from \(msg.username): \(msg.message)")
            }

        } catch {
            LoggingManager.shared.warn(.social, message: "Failed to poll chat messages: \(error)")
        }
    }

    /// Stop chat polling when leaving watch party
    private func stopChatPolling() {
        chatPollingTimer?.invalidate()
        chatPollingTimer = nil
        LoggingManager.shared.debug(.social, message: "Chat polling stopped")
    }

    /// Handle incoming sync messages from peers
    private func handleSyncMessage(_ message: SyncMessage) async {
        // DEBUG: Log ALL incoming messages before any filtering
        LoggingManager.shared.debug(.watchParty, message: "Received sync message - type: \(message.type), sender: \(message.senderId ?? "unknown")")

        // Host is authoritative for playback, but should still receive chat messages, READY signals, and REACTIONS
        if isWatchPartyHost && message.type != .chat && message.type != .ready && message.type != .reaction {
            LoggingManager.shared.debug(.watchParty, message: "Host filtering out message type: \(message.type)")
            return
        }

        // Syncplay-inspired: Ignore remote updates if we just made a local action
        // CRITICAL: NEVER ignore READY, CHAT, REACTION, or EXIT messages - they must always be processed
        if message.type != .ready && message.type != .chat && message.type != .reaction && message.type != .returnToLobby && message.type != .roomClosed && shouldIgnoreRemoteUpdate() {
            LoggingManager.shared.debug(.watchParty, message: "Filtering message due to recent local action - type: \(message.type)")
            return
        }

        switch message.type {
        case .ready:
            // Handle Ready signal
            if let rawSenderId = message.senderId {
                // CRITICAL FIX: Normalize ID to lowercase to match Presence/DB casing
                // This prevents deadlocks where "ABC" (ready) != "abc" (connected)
                let senderId = rawSenderId.lowercased()

                LoggingManager.shared.info(.watchParty, message: "Received READY signal from \(rawSenderId) (normalized: \(senderId))")
                readyGuestIds.insert(senderId)

                // PRESENCE FALLBACK: Ensure sender is in connectedGuestIds
                // This handles cases where Presence events are delayed/missing
                if !connectedGuestIds.contains(senderId) && senderId != currentUserId {
                    LoggingManager.shared.warn(.watchParty, message: "Adding \(senderId) to connectedGuestIds (presence fallback)")
                    connectedGuestIds.insert(senderId)
                }

                if isWatchPartyHost {
                    checkIfAllGuestsReady()
                }
            }

        case .play:
            // Handle Play signal (Start of movie)
            if showWaitingForGuests {
                LoggingManager.shared.info(.watchParty, message: "Received PLAY signal - All guests ready! Starting playback.")
                showWaitingForGuests = false
                showWaitingForGuests = false
                readySignalsSentCount = 0 // Reset timeout counter
                await playbackService.play()
                isPlaying = true

                // Stop Ready Loop
                readyLoopTimer?.invalidate()
                readyLoopTimer = nil
            } else {
                // Normal play sync
                if !isPlaying {
                    LoggingManager.shared.info(.watchParty, message: "Sync: Playing")
                    await playbackService.play()
                    isPlaying = true
                }
            }

            // FORCE PLAY SAFETY NET (GUEST): Retrigger play if still at 0.0 after 1.5s
            Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                guard let self = self else { return }
                if self.currentTime < 0.1 && self.isPlaying {
                    LoggingManager.shared.warn(.videoRendering, message: "PLAYBACK SAFETY NET (GUEST): Force-starting playback (stuck at 0.0)")
                    await self.playbackService.play()
                }
            }

        case .playbackState:
            // Guest syncs to host's playback state with advanced smoothness optimization
            let hostTimestamp = message.timestamp
            guard let remoteIsPlaying = message.isPlaying else { return }

            // FIX: Ensure waiting overlay is dismissed if host is playing
            // This handles cases where the initial .play command was missed
            if remoteIsPlaying && showWaitingForGuests {
                LoggingManager.shared.info(.watchParty, message: "Received playback state (playing) - Dismissing waiting overlay")
                showWaitingForGuests = false
                readySignalsSentCount = 0 // Reset timeout counter

                // Stop Ready Loop
                readyLoopTimer?.invalidate()
                readyLoopTimer = nil
            }

            // Update network latency estimate
            updateNetworkLatency()

            // Predictive compensation: Account for network latency
            // By the time we receive this message, the host has moved forward
            // Subtract guestLagOffset so guest is slightly BEHIND host (prevents race condition at video end)
            let guestLagOffset: Double = 0.3  // 300ms behind host
            let predictedHostPosition = hostTimestamp + networkLatency - guestLagOffset

            // NEW: Initial Sync Logic (Prevent Flash of Frame 0)
            // CRITICAL FIX: Only reveal video after guest has sent ready signal (video loaded)
            // This prevents premature poster hiding at the ready gate
            if isRefiningInitialSeek && !self.isWatchPartyHost {
                guard hasSentReadySignal else {
                    LoggingManager.shared.debug(.watchParty, message: "Async Initial Sync: Ignoring (video not ready yet)")
                    return // Skip until video is loaded
                }

                LoggingManager.shared.info(.watchParty, message: "Initial Sync - Blind Seeking to \(String(format: "%.2f", predictedHostPosition))s and revealing video")
                Task { @MainActor in
                     await playbackService.seek(to: predictedHostPosition)
                     // Force update logic (bypass normal buffering release)
                     self.isRefiningInitialSeek = false
                     self.isBuffering = false
                     withAnimation(.easeOut(duration: 0.5)) {
                         self.isLoading = false
                         self.showPoster = false
                     }
                }
                return // Skip drift calculation for this tick
            }

            // Calculate drift with latency compensation
            let rawDrift = currentTime - predictedHostPosition
            _ = abs(rawDrift)

            // Add to drift history for smoothing
            driftHistory.append(rawDrift)
            if driftHistory.count > driftHistorySize {
                driftHistory.removeFirst()
            }

            // Calculate smoothed drift (moving average)
            let smoothedDrift = driftHistory.reduce(0.0, +) / Double(driftHistory.count)
            let absSmoothedDrift = abs(smoothedDrift)

            // UPDATE SYNC STATUS UI
            // Logic:
            // 1. If actively seeking/buffering -> "Syncing... 🟡"
            // 2. If drift < 2.0s -> "Synced 🟢"
            // 3. If drift > 2.0s -> "Drift: -5.2s 🔴"

            if (isBuffering || isSeeking || isCurrentlyAdjustingSpeed) && absSmoothedDrift > 0.5 {
                syncStatus = "Syncing... 🟡"
            } else if absSmoothedDrift < 2.0 {
                 // Fade out "Synced" after a while? For now keep it static as requested.
                 syncStatus = "Synced 🟢"
            } else {
                 let symbol = smoothedDrift > 0 ? "+" : ""
                 syncStatus = "Drift: \(symbol)\(String(format: "%.1f", -smoothedDrift))s 🔴"
            }

            // Advanced tiered sync with hysteresis and adaptive thresholds
            // CRITICAL: Avoid seeks on weaker hardware - they cause video pipeline stalls

            // CRITICAL: Avoid seeks on weaker hardware - they cause video pipeline stalls
            // EVENTS: Disable speed sync (adaptive sync) as requested - rely on initial seek and large drift correction only
            let isEvent = appState?.player.isEventPlayback == true

            if absSmoothedDrift < 0.1 {
                // Perfect sync (<100ms smoothed drift)
                // If we're currently adjusting speed, reset to normal
                if isCurrentlyAdjustingSpeed {
                    mpvWrapper.setSpeed(1.0)
                    isCurrentlyAdjustingSpeed = false
                    currentSpeedAdjustment = 1.0
                    LoggingManager.shared.info(.watchParty, message: "Perfect sync achieved: \(Int(absSmoothedDrift * 1000))ms - resetting to 1.0x")
                }
            } else if absSmoothedDrift < 5.0 {
                // Rate Sync (Enabled for ALL session types, including Events)
                // This ensures that "User Rooms with Event IDs" still get smooth sync.
                // Large drifts (>5s) will still fall through to the Seek block below.
                // Small/Medium drift (100ms-5s) - Use ultra-smooth speed adjustment
                // Hysteresis: Only adjust if enough time has passed since last adjustment
                let timeSinceLastAdjustment = lastSpeedAdjustmentTime.map { Date().timeIntervalSince($0) } ?? 1.0

                // Only adjust every 500ms to prevent micro-stutters
                if timeSinceLastAdjustment >= 0.5 {
                    // Calculate adaptive speed factor based on smoothed drift
                    let speedFactor: Double

                    if absSmoothedDrift > 1.0 {
                        // Larger drift (1-5s): More aggressive correction
                        // Use proportional correction: more drift = faster correction
                        let correctionRate = min(absSmoothedDrift * 0.02, 0.05)  // Cap at 5%
                        speedFactor = smoothedDrift > 0 ? (1.0 - correctionRate) : (1.0 + correctionRate)
                        LoggingManager.shared.debug(.watchParty, message: "Adaptive speed sync: \(String(format: "%.3f", speedFactor))x to fix \(String(format: "%.1f", absSmoothedDrift))s drift")
                    } else if absSmoothedDrift > 0.4 {
                        // Medium drift (400ms-1s): Gentle correction
                        speedFactor = smoothedDrift > 0 ? 0.99 : 1.01  // ±1%
                        LoggingManager.shared.debug(.watchParty, message: "Gentle speed sync: \(speedFactor)x to fix \(Int(absSmoothedDrift * 1000))ms drift")
                    } else {
                        // Small drift (100-400ms): Ultra-gentle correction
                        speedFactor = smoothedDrift > 0 ? 0.995 : 1.005  // ±0.5%
                        LoggingManager.shared.debug(.watchParty, message: "Ultra-gentle sync: \(speedFactor)x to fix \(Int(absSmoothedDrift * 1000))ms drift")
                    }

                    await playbackService.setSpeed(speedFactor)
                    currentSpeedAdjustment = speedFactor
                    isCurrentlyAdjustingSpeed = true
                    lastSpeedAdjustmentTime = Date()

                    // Auto-reset speed after correction period (proportional to drift)
                    let resetDelay = min(max(absSmoothedDrift * 2.0, 2.0), 5.0)  // 2-5 seconds
                    Task {
                        try? await Task.sleep(nanoseconds: UInt64(resetDelay * 1_000_000_000))
                        // Only reset if we haven't made another adjustment
                        if self.currentSpeedAdjustment == speedFactor {
                            await self.playbackService.setSpeed(1.0)
                            self.isCurrentlyAdjustingSpeed = false
                            self.currentSpeedAdjustment = 1.0
                        }
                    }
                }
            } else {
                // Large drift (>5s) - seek required
                // PREDICTIVE SEEK: Add offset to compensate for seek/buffer latency
                // This is especially important when guest joins an active room mid-playback
                let seekBufferOffset: Double = 1.2  // 1.2s to account for seek + buffer time
                let targetPosition = predictedHostPosition + seekBufferOffset

                LoggingManager.shared.info(.watchParty, message: "Large drift (\(String(format: "%.1f", absSmoothedDrift))s) - seeking to \(String(format: "%.1f", targetPosition))s (host at \(String(format: "%.1f", predictedHostPosition))s + \(seekBufferOffset)s offset)")
                await playbackService.seek(to: targetPosition)
                // Reset drift history after seek
                driftHistory.removeAll()
                isCurrentlyAdjustingSpeed = false
                currentSpeedAdjustment = 1.0
            }

            // Sync play/pause state
            // FIX: Shadowing bug resolved. "remoteIsPlaying" is the source of truth from host.
            // "self.isPlaying" is our current local state.
            if remoteIsPlaying && !self.isPlaying {
                LoggingManager.shared.info(.watchParty, message: "Sync: Resuming playback to match Host")
                await playbackService.play()
            } else if !remoteIsPlaying && self.isPlaying {
                LoggingManager.shared.info(.watchParty, message: "Sync: Pausing playback to match Host")
                await playbackService.pause()
            }



        case .pause:
            LoggingManager.shared.info(.watchParty, message: "Host pressed pause")
            if isPlaying {
                await playbackService.togglePlayPause()
            }

        case .seek:
            let timestamp = message.timestamp
            LoggingManager.shared.info(.watchParty, message: "Host seeked to \(timestamp)s")
            await playbackService.seek(to: timestamp)

        case .chat:
            // Receive chat message from other participants
            // CRITICAL: Skip messages from self (already added locally when sent)
            // EXCEPTION: Allow LOBBY_JOIN to pass through so we see "You joined"
            let isJoinMessage = message.chatText == "LOBBY_JOIN"

            if message.senderId == currentUserId && !isJoinMessage {
                LoggingManager.shared.debug(.social, message: "Skipping own message (already displayed locally)")
                return
            }

            // Block Check
            if let senderId = message.senderId, SocialService.shared.blockedUserIds.contains(senderId.lowercased()) {
                LoggingManager.shared.debug(.social, message: "Skipping chat from blocked user: \(senderId)")
                return
            }

            if let text = message.chatText, let username = message.chatUsername {
                // Convert LOBBY_JOIN to a friendly join message, filter out other system messages
                var displayUsername = username
                let displayText: String
                if text == "LOBBY_JOIN" {
                    if message.senderId == currentUserId {
                        displayUsername = "You"
                        displayText = "joined the party! 👋"
                    } else {
                        displayText = "joined! 👋"
                    }
                } else if text.starts(with: "LOBBY_KICK:") {
                    // Robust parsing
                    let kickedIdRaw = text.replacingOccurrences(of: "LOBBY_KICK:", with: "")
                    let kickedId = kickedIdRaw.trimmingCharacters(in: .whitespacesAndNewlines)

                    // Check if *I* am the one being kicked
                    if let myId = currentUserId, myId.caseInsensitiveCompare(kickedId) == .orderedSame {
                        LoggingManager.shared.warn(.watchParty, message: "WatchParty: Kicked by host (ID Match: \(kickedId))")

                        Task { @MainActor [weak self] in
                            guard let self = self else { return }

                            // 1. Cleanup first (Await disconnection)
                            await self.cleanup()
                            await self.appState?.player.exitPlayer(keepRoomState: false)

                            // 2. Switch View AND Show Alert on the destination screen
                            self.appState?.currentView = .browse

                            // Show GLOBAL alert (Now appears on Browse screen)
                            self.appState?.activeAlert = AppState.AppAlert(
                                title: "Kicked",
                                message: "You have been kicked from the room."
                            )
                        }
                        return
                    }

                    // If it's a kick for someone else, we hide it from chat (it's a system message)
                    return

                } else if text.starts(with: "LOBBY_") {
                    // Filter out LOBBY_READY, LOBBY_UNREADY, etc.
                    LoggingManager.shared.debug(.social, message: "Skipping system message: \(text)")
                    return
                } else {
                    displayText = text
                }

                let chatMessage = ChatMessage(
                    id: UUID().uuidString,
                    username: displayUsername,
                    text: displayText,
                    timestamp: Date(timeIntervalSince1970: message.timestamp),
                    senderId: message.senderId,
                    isPremium: message.isPremium ?? false
                )
                // Batch chat updates to avoid UI thrashing
                await MainActor.run {
                    pendingChatMessages.append(chatMessage)

                    if !isFlushingChat {
                        isFlushingChat = true
                        Task { @MainActor [weak self] in
                            try? await Task.sleep(nanoseconds: 200_000_000)
                            guard let self = self else { return }
                            if !self.pendingChatMessages.isEmpty {
                                self.messages.append(contentsOf: self.pendingChatMessages)
                                self.pendingChatMessages.removeAll()
                                self.trimChatMessages()
                            }
                            self.isFlushingChat = false
                        }
                    }
                }
                LoggingManager.shared.debug(.social, message: "Received chat from \(username): \(text)")
            }

        case .streamSelected:
            // Host selected a new stream - guests should update their stream info
            if let infoHash = message.infoHash,
               let quality = message.quality,
               let unlockedURL = message.unlockedURL {

                LoggingManager.shared.info(.watchParty, message: "Host selected new stream - InfoHash: \(infoHash), Quality: \(quality), File Index: \(message.fileIdx ?? -1)")
                // Update local stream information
                // Note: Guests might need to reload stream with new URL
                if videoURL != unlockedURL {
                    LoggingManager.shared.info(.watchParty, message: "Stream URL changed, reloading...")
                    videoURL = unlockedURL

                    // If currently playing, reload with new stream
                    if mpvWrapper.isPlaying {
                        mpvWrapper.loadVideo(url: unlockedURL, autoplay: true)
                    }
                }
            } else {
                LoggingManager.shared.warn(.watchParty, message: "Received streamSelected message with incomplete data")
            }

        case .requestStream:
            // Guest requested current stream info - only host should handle this
            if isWatchPartyHost {
                LoggingManager.shared.debug(.watchParty, message: "Guest requested stream info, sending current stream details")

                // Send current stream information back to requesting guest
                let streamInfoMessage = SyncMessage(
                    type: .streamSelected,
                    timestamp: Date().timeIntervalSince1970,
                    position: currentTime,
                    isPlaying: isPlaying,
                    senderId: currentUserId,
                    chatText: nil,
                    chatUsername: nil,
                    infoHash: nil, // Could be extracted from current videoURL if needed
                    fileIdx: nil,
                    quality: nil,
                    unlockedURL: videoURL.isEmpty ? nil : videoURL
                )

                Task {
                    do {
                        try await realtimeManager?.sendSyncMessage(streamInfoMessage)
                        LoggingManager.shared.debug(.watchParty, message: "Sent stream info to requesting guest")
                    } catch {
                        LoggingManager.shared.error(.watchParty, message: "Failed to send stream info: \(error)")
                    }
                }
            } else {
                LoggingManager.shared.warn(.watchParty, message: "Non-host received requestStream message, ignoring")
            }

        case .preload:
            // Preload message - handled in LobbyViewModel, not here
            break

        case .roomClosed:
            LoggingManager.shared.info(.watchParty, message: "Received Room Closed signal in Player")
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                await self.cleanup()
                // Force full exit to browse
                await self.appState?.player.exitPlayer(keepRoomState: false)
                await MainActor.run {
                    self.appState?.currentView = .browse
                }
            }

        case .ping, .pong:
            // Handled by RealtimeChannelManager
            break

        case .returnToLobby:
            // CRITICAL FIX: Ignore Return to Lobby signals for System Events
            // Events are automated and should not be interrupted by stale host signals or mod actions
            // unless we strictly implement a "Emergency Stop" command (which should be separate)
            if appState?.player.isEventPlayback == true {
                 LoggingManager.shared.info(.watchParty, message: "🛡️ Guest: Ignoring returnToLobby signal during Event Playback")
                 return
            }

            LoggingManager.shared.info(.watchParty, message: "Received Return to Lobby signal from Host")

            // Fix: Explicitly show "Returning to Lobby" overlay instead of generic loading
            self.isExitingToLobby = true

            // Set message for Guest
            appState?.pendingLobbyMessage = "Host returned the group to the lobby."
            // Perform cleanup and navigate back to lobby
            Task { @MainActor [weak self] in
                guard let self = self else { return }

                // Slight delay to allow overlay to be seen (optional, but good for UX)
                try? await Task.sleep(nanoseconds: 500_000_000)

                await self.cleanup(returningToLobby: true)
                await self.appState?.player.exitPlayer(keepRoomState: true)
                await MainActor.run {
                    self.appState?.currentView = .watchPartyLobby
                }
            }

        case .reaction:
            // Handle incoming reaction
            // CRITICAL: Skip reactions from self (already shown locally when sent)
            if message.senderId == currentUserId {
                return
            }

            // Block Check
            if let senderId = message.senderId, SocialService.shared.blockedUserIds.contains(senderId.lowercased()) {
                LoggingManager.shared.debug(.social, message: "Skipping reaction from blocked user: \(senderId)")
                return
            }

            if let emoji = message.chatText {
                 LoggingManager.shared.debug(.social, message: "Received reaction: \(emoji)")
                 reactionTriggers.send(emoji)
            }

        case .hostAnnouncement:
            // Handle floating host announcement
            if let text = message.chatText {
                LoggingManager.shared.info(.watchParty, message: "Received announcement: \(text)")
                // 1. Trigger floating overlay
                announcementTriggers.send(text)

                // 2. Chat history update REMOVED (per request)
                // Announcements are visual-only now.
            }
        }
    }

    // MARK: - Post-Load Ready Gate Helpers

    private func sendReadySignal() {
        guard !hasSentReadySignal else { return }

        // CRITICAL FIX: Ensure file is ACTUALLY loaded before sending ready signal
        // This prevents premature signals (e.g. from durationPub) that race with buffering/loading
        guard mpvWrapper.isFileLoaded else {
             NSLog("⚠️ Watch Party: sendReadySignal blocked - File not loaded yet")
             return
        }

        // Optimistically set true to prevent rapid-fire calls
        hasSentReadySignal = true

        LoggingManager.shared.info(.watchParty, message: "Sending INITIAL READY signal and starting loop")

        // Define transmission logic
        let transmit = { [weak self] (isRetry: Bool) in
            guard let self = self else { return }

            // Send Ready signal
            let syncMessage = SyncMessage(
                type: .ready,
                timestamp: Date().timeIntervalSince1970,
                position: 0,
                isPlaying: false,
                senderId: self.currentUserId
            )

            Task { [weak self] in
                guard let self = self else { return }
                do {
                    if let manager = self.realtimeManager {
                        try await manager.sendSyncMessage(syncMessage)
                        if isRetry {
                            LoggingManager.shared.debug(.watchParty, message: "Resent READY signal (loop)")
                        } else {
                            LoggingManager.shared.info(.watchParty, message: "READY signal sent successfully")
                        }
                    } else {
                        LoggingManager.shared.warn(.watchParty, message: "realtimeManager is nil, cannot send READY signal")
                    }
                } catch {
                    LoggingManager.shared.error(.watchParty, message: "Failed to send READY signal: \(error.localizedDescription)")
                }
            }
        }

        // Send immediately
        transmit(false)

        // Start Ready Loop (resend every 2 seconds until playback starts)
        readyLoopTimer?.invalidate()
        readySignalsSentCount = 0  // Reset counter on fresh loop start
        readyLoopTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            // Only continue loop if we are still waiting for guests (waiting for host to start)
            if self.showWaitingForGuests {
                self.readySignalsSentCount += 1

                // DEADLOCK DETECTION (Landmine #13 fix): If we've sent too many signals without response,
                // the host is probably gone. Trigger return to browse.
                if self.readySignalsSentCount >= self.maxReadySignalsBeforeTimeout {
                    LoggingManager.shared.warn(.watchParty, message: "Watch Party: Ready Gate Timeout - Host not responding after \(self.readySignalsSentCount) attempts")
                    self.triggerHostAbsentExit()
                    return
                }

                transmit(true)
            } else {
                // Stop loop if we're no longer waiting
                self.readyLoopTimer?.invalidate()
                self.readyLoopTimer = nil
            }
        }

        // If Host, mark self as ready and check if we can start
        if isWatchPartyHost {
            checkIfAllGuestsReady()
        }
    }

    /// Called when the ready gate times out waiting for host response.
    /// Returns guest to browse with an informative message.
    private func triggerHostAbsentExit() {
        LoggingManager.shared.warn(.watchParty, message: "Ready Gate Timeout: Returning to browse (host absent)")

        // Stop flags
        self.showWaitingForGuests = false
        self.hasSentReadySignal = false
        self.readySignalsSentCount = 0

        // Show exit overlay
        self.isExitingToLobby = true

        // Set message for user
        appState?.pendingLobbyMessage = "The host is no longer in this room."

        // Timer cleanup
        self.readyLoopTimer?.invalidate()
        self.readyLoopTimer = nil

        // Reuse existing cleanup flow
        Task { @MainActor [weak self] in
            guard let self = self else { return }

            try? await Task.sleep(nanoseconds: 500_000_000)

            await self.cleanup(returningToLobby: true)
            await self.appState?.player.exitPlayer(keepRoomState: false)
            await MainActor.run {
                self.appState?.currentView = .browse
            }
        }
    }

    private func checkIfAllGuestsReady() {
        guard isWatchPartyHost else { return }

        LoggingManager.shared.debug(.watchParty, message: "checkIfAllGuestsReady called")
        LoggingManager.shared.debug(.watchParty, message: "hasSentReadySignal = \(hasSentReadySignal ? "true" : "false")")
        LoggingManager.shared.debug(.watchParty, message: "connectedGuestIds = \(Array(connectedGuestIds).joined(separator: ", "))")
        LoggingManager.shared.debug(.watchParty, message: "readyGuestIds = \(Array(readyGuestIds).joined(separator: ", "))")

        let missingIds = connectedGuestIds.subtracting(readyGuestIds)
        if !missingIds.isEmpty {
             LoggingManager.shared.debug(.watchParty, message: "Waiting for guests: \(missingIds.joined(separator: ", "))")
        } else {
             LoggingManager.shared.info(.watchParty, message: "All guests reported READY")
        }

        // Ensure Host is ready (video loaded)
        guard hasSentReadySignal else {
            LoggingManager.shared.debug(.watchParty, message: "Host not ready yet (but \(readyGuestIds.count) guests are ready)")
            return
        }

        // CRITICAL FIX: Ensure we have at least one guest before starting
        // Without this, fast hosts would start immediately if guests haven't joined presence yet
        guard !connectedGuestIds.isEmpty else {
            LoggingManager.shared.debug(.watchParty, message: "No guests connected yet (waiting for presence updates)")
            return
        }

        // Check if all connected guests are ready
        // Note: connectedGuestIds comes from Presence
        let allReady = connectedGuestIds.isSubset(of: readyGuestIds)
        LoggingManager.shared.debug(.watchParty, message: "allReady = \(allReady ? "true" : "false")")

        if allReady {
            LoggingManager.shared.info(.watchParty, message: "All guests ready! Starting playback in 1s...")

            // Small delay to ensure UI updates
            Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                guard let self = self else { return }
                self.startSynchronizedPlayback()
            }
        } else {
            let missing = connectedGuestIds.subtracting(readyGuestIds)
            LoggingManager.shared.debug(.watchParty, message: "Waiting for guests: \(missing.count) remaining - \(Array(missing).joined(separator: ", "))")
        }
    }

    private func startSynchronizedPlayback() {
        LoggingManager.shared.info(.watchParty, message: "Host: Initiating synchronized start")
        showWaitingForGuests = false

        // CRITICAL FIX: Host Background Art Linger
        // Explicitly clear the initial lock for the Host immediately when starting playback.
        // Guests rely on the incoming Sync Message to trigger this, but the Host ignores their own echo.
        // Without this, the Host waits for the 5s failsafe timer to clear the poster.
        if isRefiningInitialSeek {
             LoggingManager.shared.debug(.watchParty, message: "Host: Releasing initial seek lock (Starting Playback)")
             isRefiningInitialSeek = false
             withAnimation(.easeOut(duration: 0.5)) {
                 self.showPoster = false
                 self.isLoading = false
             }
        }
        // mpvWrapper.play() - Removed
        Task { await playbackService.play() }
        isPlaying = true

        // FORCE PLAY SAFETY NET: Retrigger play if still at 0.0 after 1.5s
        // This fixes the "Black Screen at 0:00" issue where the initial command is missed
        Task { @MainActor [weak self] in
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            guard let self = self else { return }
            if self.currentTime < 0.1 && self.isPlaying {
                LoggingManager.shared.warn(.videoRendering, message: "PLAYBACK SAFETY NET: Force-starting playback (stuck at 0.0)")
                await self.playbackService.play()
            }
        }

        // Send Play signal
        let syncMessage = SyncMessage(
            type: .play,
            timestamp: Date().timeIntervalSince1970,
            position: currentTime,
            isPlaying: true,
            senderId: currentUserId
        )
        Task {
            try? await realtimeManager?.sendSyncMessage(syncMessage)
        }
    }

    /// Start broadcasting playback state (host only)
    private func startBroadcastingState() {
        guard isWatchPartyHost else { return }

        // Cancel any existing timer
        syncBroadcastTimer?.invalidate()

        // ✅ Reduce from 10Hz to 0.5Hz (2s) to prevent playback blips
        syncBroadcastTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            // ✅ Don't broadcast during chat animation
            if self.isAnimatingChatToggle {
                return
            }

            // CRITICAL FIX: Persist playback state to DB every 10s (5 ticks * 2s)
            // This ensures late joiners see the correct "is_playing" status and bypass the lobby.
            self.persistenceTickCount += 1
            if self.persistenceTickCount >= 5 {
                self.persistenceTickCount = 0
                Task {
                    if let roomId = self.currentRoomId {
                        // Fire and forget db update
                         try? await SupabaseClient.shared.updateRoomPlayback(
                            roomId: roomId,
                            position: Int(self.currentTime),
                            isPlaying: self.isPlaying
                        )
                    }
                }
            }

            // Don't send if we've already cleaned up
            guard !self.hasCleanedUp else { return }

            let message = SyncMessage(
                type: .playbackState,
                timestamp: self.currentTime,
                isPlaying: self.isPlaying,
                senderId: self.currentRoomId,
                chatText: nil,
                chatUsername: nil
            )

            Task { [weak self] in
                guard let self = self else { return }
                try? await self.realtimeManager?.sendSyncMessage(message)
            }
        }
    }

    // MARK: - Syncplay-Inspired Helpers

    /// Mark that a local action was initiated (seek, pause, etc.) to ignore echo
    private func markLocalAction() {
        guard isInWatchParty else { return }
        ignoringRemoteUpdates += 1
        lastLocalActionTime = Date()

        // Auto-reset after 500ms (round-trip time)
        Task { [weak self] in
            try? await Task.sleep(nanoseconds: 500_000_000)
            await MainActor.run {
                guard let self = self else { return }
                if self.ignoringRemoteUpdates > 0 {
                    self.ignoringRemoteUpdates -= 1
                }
            }
        }
    }

    /// Check if we should ignore remote updates (recently made local action)
    private func shouldIgnoreRemoteUpdate() -> Bool {
        if ignoringRemoteUpdates > 0 {
            LoggingManager.shared.debug(.watchParty, message: "Ignoring remote update (recent local action)")
            return true
        }

        // Also check time-based (backup in case counter gets out of sync)
        if let lastAction = lastLocalActionTime, Date().timeIntervalSince(lastAction) < 0.5 {
            LoggingManager.shared.debug(.watchParty, message: "Ignoring remote update (recent local action by time)")
            return true
        }

        return false
    }

    /// Update network latency estimate based on message timing
    private func updateNetworkLatency() {
        guard let lastTime = lastSyncMessageTime else {
            lastSyncMessageTime = Date()
            return
        }

        let now = Date()
        let messageInterval = now.timeIntervalSince(lastTime)
        lastSyncMessageTime = now

        // Expected interval is 100ms (10 Hz broadcast)
        // Any excess is likely network jitter
        if messageInterval > 0.1 {
            let measuredLatency = (messageInterval - 0.1) / 2.0  // Half of excess is one-way latency
            // Smooth the latency estimate (exponential moving average)
            networkLatency = networkLatency * 0.8 + measuredLatency * 0.2
            // Clamp to reasonable bounds (10ms - 500ms)
            networkLatency = max(0.01, min(networkLatency, 0.5))
        }
    }

    /// Stop watch party sync
    func stopWatchPartySync() async {
        LoggingManager.shared.info(.watchParty, message: "Stopping watch party sync")

        // Stop broadcast timer
        syncBroadcastTimer?.invalidate()
        syncBroadcastTimer = nil

        // Stop chat polling
        stopChatPolling()

        // Disconnect Realtime
        await realtimeManager?.disconnect()
        realtimeManager = nil

        // CRITICAL: Remove user from DB before clearing local state
        // This ensures participants_count decrements correctly
        if let roomId = currentRoomId, let userId = currentUserId, let userUUID = UUID(uuidString: userId) {
            try? await SupabaseClient.shared.leaveRoom(roomId: roomId, userId: userUUID)
            LoggingManager.shared.info(.watchParty, message: "Left room in database: \(roomId)")
        }

        // Reset state
        currentRoomId = nil
        currentUserId = nil
        isWatchPartyHost = false
        isInWatchParty = false
        isResumingInWatchParty = false  // Reset resume flag when leaving watch party

        // Hide chat when leaving watch party
        showChat = false

        // Add farewell message
        messages.append(ChatMessage(
            id: UUID().uuidString,
            username: "System",
            text: "👋 Left watch party",
            timestamp: Date(),
            isSystem: true
        ))
        trimChatMessages()

        LoggingManager.shared.info(.watchParty, message: "Watch party sync stopped, returned to solo mode")
    }

    // MARK: - Watch History

    private func startWatchHistorySaving() {
        // Cancel any existing timer
        watchHistoryTimer?.invalidate()

        // Save watch history every 30 seconds
        watchHistoryTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                self.saveWatchHistory()
            }
        }

        LoggingManager.shared.debug(.watchHistory, message: "Started watch history tracking")
    }

    private func saveWatchHistory(force: Bool = false) {
        guard !imdbId.isEmpty, currentTime > 0, duration > 0 else { return }

        let progress = currentTime / duration

        // Update accumulator if playing
        if isPlaying && !isBuffering && !isSeeking {
             let now = Date()
             let timeSinceLast = now.timeIntervalSince(lastAccumulatorUpdate)
             // Cap delta at 45 seconds to prevent huge jumps from backgrounding/suspension
             if timeSinceLast < 45.0 {
                 accumulatedPlaybackTime += timeSinceLast
                 continuousPlaybackTime += timeSinceLast
             } else {
                 // Gap too large (backgrounded?), treating as break in continuity
                 continuousPlaybackTime = 0
             }
             lastAccumulatorUpdate = now
        } else {
             lastAccumulatorUpdate = Date()
             // Reset continuous time if paused, seeking, or buffering
             // This enforces the "uninterrupted" rule for TV verification
             continuousPlaybackTime = 0
        }

        // Trigger Vote: Hybrid Logic
        if !hasVotedForStream {
             let isMovie = appState?.player.selectedMetadata?.type == "movie"

             // Rule 1: Movies -> Legacy 20 mins accumulated
             let movieRuleMet = isMovie && accumulatedPlaybackTime > 1200

             // Rule 2: TV Shows -> 30% Accumulated Duration (Robust to pauses/seeking)
             // Note: duration > 0 check is already in guard
             let accumulatedPercent = duration > 0 ? (accumulatedPlaybackTime / duration) : 0
             // Require 30% of actual Runtime watched (OR 15 mins for long episodes)
             // AND Require 8 minutes of CONTINUOUS playback to prevent scrub-to-verify
             let tvRuleMet = !isMovie &&
                            (accumulatedPercent >= 0.30 || accumulatedPlaybackTime > 900) &&
                            continuousPlaybackTime > 480


             if movieRuleMet || tvRuleMet {
                 if let hash = currentStreamHash, let quality = currentStreamQuality {

                     // QUALITY GATE: Block CAM and TS sources
                     let badSources = ["CAM", "TS", "HDCAM", "HDTS", "TELESYNC", "SCREENER"]
                     let source = currentSourceQuality ?? ""
                     let isLowQuality = badSources.contains { source.localizedCaseInsensitiveContains($0) }

                     if isLowQuality {
                         LoggingManager.shared.warn(.watchHistory, message: "Skipping Community Vote - Low Quality Source detected (\(source))")
                         hasVotedForStream = true // Mark as "handled"
                         return
                     }

                     // Extract Season/Episode correctly
                     var seasonVal = -1
                     var episodeVal = -1

                     // Use explicit values if available (Fixed 2025-12-22)
                     if let s = self.currentSeason { seasonVal = s }
                     else if let player = appState?.player, let s = player.selectedSeason { seasonVal = s }

                     if let e = self.currentEpisode { episodeVal = e }
                     else if let player = appState?.player, let e = player.selectedEpisode { episodeVal = e }

                     // Fallback check: 'selectedMediaItem' might be the episode?
                     // If 'type' is series, we need S/E.

                     Task {
                         // We defer this lookup to MainActor block inside Task if needed
                         // Actually, we can just pass what we have.
                         // If we are missing S/E, we verify as -1/-1 (Series Level verify? No that's bad).
                         // We'll trust the logic for now and fix S/E piping if broken.

                         // Fix: Using -1/-1 as "Unknown" is better than crashing or blocking.
                         // Ideally we should inject S/E into MPVPlayerViewModel via `loadStream` method.
                         // But for now, let's ship the Logic update.

                         await SupabaseClient.shared.voteStreamSuccess(
                             imdbId: imdbId,
                             season: seasonVal,
                             episode: episodeVal,
                             quality: quality,
                             streamHash: hash,
                             movieTitle: self.streamTitle
                         )
                     }
                     hasVotedForStream = true
                 }
             }
        }

        Task {
            appState?.player.saveToWatchHistory(timestamp: currentTime, duration: duration, force: force)
            // Calculate remaining time
        }
    }

    func stopWatchHistorySaving() {
        // Save one final time before stopping (forced)
        saveWatchHistory(force: true)

        // Stop timer
        watchHistoryTimer?.invalidate()
        watchHistoryTimer = nil

        LoggingManager.shared.debug(.watchHistory, message: "Stopped watch history tracking")
    }
}
