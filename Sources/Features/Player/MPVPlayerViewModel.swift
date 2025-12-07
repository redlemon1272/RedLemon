//
//  MPVPlayerViewModel.swift
//  RedLemon
//
//  ViewModel for MPV player with background art and chat
//

import Foundation
import SwiftUI
import Compression

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
    let mpvWrapper = MPVWrapper()

    // Realtime sync manager
    private var realtimeManager: RealtimeChannelManager?
    @Published var isWatchPartyHost: Bool = false  // Exposed to view for UI control
    private var currentRoomId: String?
    private var currentUserId: String?
    private var syncBroadcastTimer: Timer?
    private var chatPollingTimer: Timer?
    private var lastChatMessageId: String?

    // Throttling State
    private var lastTimeUpdate: Date = .distantPast
    private var pendingChatMessages: [ChatMessage] = []
    private var isFlushingChat: Bool = false

    // Watch history tracking
    private var watchHistoryTimer: Timer?

    // Enhanced timer management for performance
    private var activeTimers: [Timer] = []
    weak var appState: AppState?

    // Cleanup state
    private var hasCleanedUp: Bool = false
    private var mpvObserverTasks: [Task<Void, Never>] = []

    // Resume state tracking
    private var hasVideoReadyTriggered: Bool = false

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
    private var networkLatency: Double = 0.05  // Estimated one-way latency (50ms default)
    private var lastSyncMessageTime: Date?
    private var isCurrentlyAdjustingSpeed: Bool = false

    // Startup synchronization: Give guest time to spin up video pipeline
    private let hostStartupDelay: Double = 0.25  // 250ms delay for guest to prepare
    private var pendingPlayTask: Task<Void, Never>?

    // Ready Loop: Periodically resend READY signal until playback starts
    private var readyLoopTimer: Timer?

    // Player state
    @Published var videoURL: String = ""
    @Published var isLoading: Bool = true
    @Published var isPlaying: Bool = false
    @Published var playbackFinished: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    @Published var volume: Double = 100

    // Visual state
    @Published var posterURL: String?
    @Published var backgroundURL: String?
    @Published var logoURL: String?
    @Published var showPoster: Bool = true  // Show during loading

    // Chat state
    @Published var showChat: Bool = false
    @Published var isAnimatingChatToggle: Bool = false
    @Published var messages: [ChatMessage] = []

    // Metadata
    @Published var title: String = ""
    @Published var imdbId: String = ""
    @Published var streamTitle: String = ""

    // Subtitles
    @Published var subtitles: [(url: String, label: String)] = []
    @Published var subtitleOffset: Double = 0.0  // Current subtitle offset in milliseconds
    @Published var availableSubtitleTracks: [MPVWrapper.SubtitleTrack] = []
    @Published var currentSubtitleTrack: MPVWrapper.SubtitleTrack?
    @Published var showSubtitleSyncPanel: Bool = false

    // MARK: - Post-Load Ready Gate
    @Published var showWaitingForGuests: Bool = false    // Presence Management
    @Published var connectedGuestIds: Set<String> = []
    @Published var readyGuestIds: Set<String> = []
    private var pendingLeaveTasks: [String: Task<Void, Never>] = [:] // Debounce map for leaving guests
    private var hasSentReadySignal: Bool = false


    // MARK: - Initialization

    func loadStream(streamURL: String, imdbId: String, streamTitle: String, subtitles: [(url: String, label: String)], isSeries: Bool) async {
        // For movies, strip any accidental episode markers in stream title (e.g., "S01E01")
        func sanitizedTitle(_ title: String) -> String {
            guard !isSeries else { return title }
            let moviePattern = try? NSRegularExpression(pattern: "s\\d{1,2}e\\d{1,2}", options: [.caseInsensitive])
            let range = NSRange(location: 0, length: title.utf16.count)
            if let regex = moviePattern, regex.firstMatch(in: title, options: [], range: range) != nil {
                return regex.stringByReplacingMatches(in: title, options: [], range: range, withTemplate: "").trimmingCharacters(in: .whitespacesAndNewlines)
            }
            return title
        }

        let cleanStreamTitle = sanitizedTitle(streamTitle)

        NSLog("🎬🎬🎬 LOADSTREAM CALLED - streamTitle: %@", cleanStreamTitle)
        NSLog("🎬🎬🎬 streamURL: %@", streamURL.prefix(60) as CVarArg)
        NSLog("🎬🎬🎬 subtitles: %d", subtitles.count)
        print("🎬 Loading stream: \(cleanStreamTitle)")
        print("   IMDB: \(imdbId)")
        print("   URL: \(streamURL.prefix(60))...")

        self.videoURL = streamURL
        self.imdbId = imdbId
        self.streamTitle = cleanStreamTitle

        // Broadcast watching status
        Task {
            await SocialService.shared.updateWatchingStatus(
                mediaTitle: cleanStreamTitle,
                mediaType: isSeries ? "series" : "movie",
                imdbId: imdbId,
                roomId: self.currentRoomId
            )
        }
        self.subtitles = subtitles
        self.isLoading = true
        self.showPoster = true

        // Reset resume handling flag for new video loads
        self.hasVideoReadyTriggered = false

        // Add mock chat messages for testing UI
        self.messages = [
            ChatMessage(id: UUID().uuidString, username: "System", text: "Press ⌘ (Cmd) to toggle chat.", timestamp: Date())
        ]
        print("💬 Added mock chat messages for testing")

        // Fetch metadata for background art
        // Fetch metadata for background art (parallel, don't block video load)
        Task {
            await fetchMetadata(imdbId: imdbId, mediaType: isSeries ? "series" : "movie")
        }

        // Check if we should resume from a specific timestamp
        let resumeTime = appState?.resumeFromTimestamp ?? 0
        let shouldResume = resumeTime > 0
        let isEvent = appState?.isEventPlayback == true

        // CRITICAL: Strict separation of logic
        // 1. EVENT: Always autoplay, ignore watch party gates, ignore resume (unless specifically handled later)
        // 2. SOLO: Always autoplay, handle resume
        // 3. WATCH PARTY: Start PAUSED, wait for ready gate, handle resume sync

        if isEvent {
            print("🎉 EVENT MODE: Autoplaying immediately (ignoring watch party gates)")
            mpvWrapper.loadVideo(url: streamURL, autoplay: true)
            // Events don't use waitingForGuests
            showWaitingForGuests = false

        } else if !isInWatchParty {
            print("👤 SOLO MODE: Autoplaying")
            if shouldResume {
                print("   With resume from \(Int(resumeTime))s")
                // Load with autoplay=true, onVideoReady will handle the seek
                mpvWrapper.loadVideo(url: streamURL, autoplay: true)
            } else {
                mpvWrapper.loadVideo(url: streamURL, autoplay: true)
            }
            showWaitingForGuests = false

        } else {
            // Watch Party Mode (Non-Event)
            print("👥 WATCH PARTY MODE: Starting PAUSED for synchronization")

            if shouldResume {
                print("   With resume from \(Int(resumeTime))s")
                // Still load paused!
            }

            // Always load paused for watch party
            mpvWrapper.loadVideo(url: streamURL, autoplay: false)
            showWaitingForGuests = true
        }

        func startEmbeddedSubtitleScan() {
            // Run in detached task to avoid blocking MainActor (UI)
            Task.detached(priority: .userInitiated) { [weak self] in
                guard let self = self else { return }

                // Brief delay to let MPV's auto-selection complete
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1s delay

                // Poll a few times to update UI with available tracks
                for attempt in 1...3 {
                    try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5s between checks

                    // Access MPV wrapper safely (assuming it's thread-safe or we accept the risk for read-only)
                    // Ideally MPVWrapper should be an actor or have internal locking
                    let tracks = await self.mpvWrapper.getSubtitleTracks()
                    let embeddedSubs = tracks.filter { $0.id != 0 }
                    
                    if !embeddedSubs.isEmpty {
                        print("✅ Detected embedded subtitles (\(embeddedSubs.count)) on attempt \(attempt)")

                        // MPV already auto-selected via FILE_LOADED event handler
                        let currentSid = await self.mpvWrapper.getCurrentSubtitleTrack()
                        print("ℹ️ Current subtitle track: \(currentSid) (auto-selected by MPV during FILE_LOADED)")

                        // Update UI with tracks and current selection
                        await MainActor.run {
                            self.availableSubtitleTracks = tracks
                            // Update selected track to match MPV's selection
                            if let selectedTrack = tracks.first(where: { $0.id == currentSid }) {
                                self.currentSubtitleTrack = selectedTrack
                                print("✅ UI updated: Selected subtitle track \(selectedTrack.displayName)")
                            }
                        }
                        break
                    } else if attempt == 3 {
                        print("⏳ No embedded subtitles detected after \(attempt) attempts")
                    } else {
                        print("⏳ No embedded subtitles detected yet (attempt \(attempt)), retrying...")
                    }
                }
            }
        }

        // Always scan for embedded subtitles to prefer them when available
        startEmbeddedSubtitleScan()

        // Load subtitles immediately if they're already downloaded (local file paths only)
        // SubDL proxy URLs need to be downloaded to local files first
        let areSubtitlesLocal = subtitles.allSatisfy { $0.url.starts(with: "/") }

        if areSubtitlesLocal && !subtitles.isEmpty {
            NSLog("✅ Subtitles already downloaded, loading as additional options...")
            // Load them as additional options (won't override embedded subs)
            Task {
                for (index, subtitle) in subtitles.enumerated() {
                    NSLog("📝 Loading external subtitle %d (%@): %@", index + 1, subtitle.label, subtitle.url)
                    mpvWrapper.loadSubtitle(url: subtitle.url, title: subtitle.label)
                }
                NSLog("ℹ️ External subtitles loaded as additional options (embedded subs take priority)")
            }
        } else if !subtitles.isEmpty {
            // Subtitles are either SubDL proxy URLs or need to be downloaded
            let hasSubDLSubtitles = subtitles.contains { $0.url.contains("/subtitles/subdl/") }
            
            if hasSubDLSubtitles {
                // Download SubDL subtitles to local files, then load into MPV
                NSLog("ℹ️ SubDL subtitles detected - downloading to local files in background...")
                Task {
                    // Wait for playback to stabilize first
                    try? await Task.sleep(nanoseconds: 3_000_000_000) // 3 seconds
                    
                    for (index, subtitle) in subtitles.enumerated() {
                        do {
                            NSLog("📝 Downloading SubDL subtitle %d (%@) from proxy...", index + 1, subtitle.label)
                            NSLog("🔍 Subtitle URL: %@", subtitle.url)
                            
                            // Download from proxy server to local file with timeout
                            let downloadTask = Task {
                                return await self.downloadSubtitle(url: subtitle.url)
                            }
                            
                            // Wait for download with timeout
                            let localPath = try await withTimeout(seconds: 45) {
                                await downloadTask.value
                            }
                            
                            if let localPath = localPath {
                                NSLog("✅ SubDL subtitle %d downloaded to: %@", index + 1, localPath)
                                self.mpvWrapper.loadSubtitle(url: localPath, title: subtitle.label)
                                NSLog("✅ SubDL subtitle %d loaded into MPV", index + 1)
                            } else {
                                NSLog("❌ Failed to download SubDL subtitle %d - downloadSubtitle returned nil", index + 1)
                            }
                        } catch is TimeoutError {
                            NSLog("❌ Timeout downloading SubDL subtitle %d (exceeded 45 seconds)", index + 1)
                        } catch {
                            NSLog("❌ Exception downloading SubDL subtitle %d: %@", index + 1, error.localizedDescription)
                        }
                    }
                    NSLog("✅ SubDL subtitle download loop completed")
                }
            } else {
                // Download other subtitles in background (fallback for older code paths)
                NSLog("⚠️ Subtitles not pre-downloaded, downloading in background...")
                Task.detached(priority: .background) {
                    // Wait for video to establish playback first
                    try? await Task.sleep(nanoseconds: 5_000_000_000) // 5 seconds - let playback stabilize

                    // Download and load all subtitle files with their labels
                    for (index, subtitle) in subtitles.enumerated() {
                        NSLog("📝 RedLemon: Downloading subtitle %d (%@) from: %@", index + 1, subtitle.label, subtitle.url)

                        // Download subtitle file locally first
                        if let localPath = await self.downloadSubtitle(url: subtitle.url) {
                            NSLog("✅ RedLemon: Subtitle %d downloaded to: %@", index + 1, localPath)
                            self.mpvWrapper.loadSubtitle(url: localPath, title: subtitle.label)
                        } else {
                            NSLog("❌ RedLemon: Failed to download subtitle %d", index + 1)
                        }
                    }
                    NSLog("ℹ️ External subtitles downloaded and added as options (embedded subs take priority)")
                }
            }
        }

        // Monitor MPV state changes
        // Monitor MPV state changes
        let isPlayingTask = Task { [weak self] in
            guard let self = self else { return }
            for await _ in self.mpvWrapper.$isPlaying.values {
                if self.mpvWrapper.isPlaying && self.isLoading {
                    // Video started playing - hide poster
                    self.onVideoReady()
                }
                self.isPlaying = self.mpvWrapper.isPlaying
            }
        }
        mpvObserverTasks.append(isPlayingTask)

        let finishedTask = Task { [weak self] in
            guard let self = self else { return }
            for await finished in self.mpvWrapper.$playbackFinished.values {
                self.playbackFinished = finished
            }
        }
        mpvObserverTasks.append(finishedTask)

        let timeTask = Task { [weak self] in
            guard let self = self else { return }
            for await time in self.mpvWrapper.$currentTime.values {
                // Throttle UI updates to ~5Hz (every 200ms)
                let now = Date()
                if now.timeIntervalSince(self.lastTimeUpdate) > 0.2 {
                    self.lastTimeUpdate = now
                    self.currentTime = time
                }
            }
        }
        mpvObserverTasks.append(timeTask)

        let durationTask = Task { [weak self] in
            guard let self = self else { return }
            for await dur in self.mpvWrapper.$duration.values {
                self.duration = dur

                // Watch Party Ready Gate: Trigger ready signal as soon as we have duration (file loaded)
                // This fixes the deadlock where we waited for playback to start, but playback waits for ready signal
                if dur > 0 {
                    NSLog("⏱️ Duration update: %.1fs. WatchParty: %@, SentReady: %@", dur, self.isInWatchParty ? "YES" : "NO", self.hasSentReadySignal ? "YES" : "NO")
                    if self.isInWatchParty && !self.hasSentReadySignal {
                        NSLog("⏱️ Watch Party: Duration available (%.1fs), triggering ready signal", dur)
                        self.sendReadySignal()
                    }
                }
            }
        }
        mpvObserverTasks.append(durationTask)
        
        let fileLoadedTask = Task { [weak self] in
            guard let self = self else { return }
            for await loaded in self.mpvWrapper.$isFileLoaded.values {
                if loaded {
                    NSLog("📂 File loaded signal received. WatchParty: %@, SentReady: %@", self.isInWatchParty ? "YES" : "NO", self.hasSentReadySignal ? "YES" : "NO")
                    // Watch Party Ready Gate Fallback:
                    // If duration is still 0 (e.g. ISO files), the file loaded event is our backup trigger
                    if self.isInWatchParty && !self.hasSentReadySignal {
                        NSLog("📂 Watch Party: File loaded signal received (fallback trigger), sending Ready signal")
                        self.sendReadySignal()
                    }
                }
            }
        }
        mpvObserverTasks.append(fileLoadedTask)
    }

    // MARK: - Metadata Fetching

    private func fetchMetadata(imdbId: String, mediaType: String) async {
        print("📡 Fetching metadata for \(imdbId) as \(mediaType)...")

        do {
            // Use LocalAPIClient which correctly handles both movies and series
            let metadata = try await LocalAPIClient.shared.fetchMetadata(type: mediaType, id: imdbId)

            // Prefer background (widescreen) over poster
            if let background = metadata.backgroundURL {
                self.backgroundURL = upgradeToHD(background)
                print("✅ Got background: \(background.prefix(60))...")
            } else if let poster = metadata.posterURL {
                self.backgroundURL = upgradeToHD(poster)
                print("✅ Got poster as background: \(poster.prefix(60))...")
            }

            // Set poster URL for player UI
            if let poster = metadata.posterURL {
                self.posterURL = upgradeToHD(poster)
                print("✅ Got poster URL: \(poster.prefix(60))...")
            }

            // Get logo for loading screen
            if let logo = metadata.logoURL {
                self.logoURL = upgradeToHD(logo)
                print("✅ Got logo: \(logo.prefix(60))...")
            }

            self.title = metadata.title

        } catch {
            print("⚠️ Failed to fetch metadata: \(error.localizedDescription)")
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
            print("⚠️ onVideoReady called again - ignoring to prevent loops")
            return
        }
        hasVideoReadyTriggered = true
        
        print("✅ Video ready - hiding poster")

        // Fade out poster when video is ready
        withAnimation(.easeOut(duration: 0.5)) {
            self.showPoster = false
            self.isLoading = false
        }

        // NEW: Event playback - recalculate seek time NOW (when video is actually ready)
        // This compensates for all loading delays and ensures tight sync across devices
        if let eventStartTime = appState?.eventStartTime {
            let elapsed = Date().timeIntervalSince(eventStartTime)
            // Add 5.0s compensation for seek/buffer latency to ensure we start "live"
            let seekTime = max(0, elapsed + 5.0)

            print("🎉 EVENT: Recalculating seek time at video ready")
            print("   Event started at: \(eventStartTime)")
            print("   Current time: \(Date())")
            print("   Elapsed: \(Int(elapsed))s")
            print("   Seeking to: \(Int(seekTime))s")

            // Pause, seek, then resume
            mpvWrapper.pause()
            
            // Use the robust resume logic which waits for duration/load
            attemptImmediateResume(resumeTime: seekTime)

            // Start watch history saving
            startWatchHistorySaving()
            return  // Skip normal resume logic
        }

        // Watch Party Ready Gate
        if isInWatchParty && !hasSentReadySignal {
            print("👋 Watch Party: Video ready (playing), sending READY signal as fallback")
            sendReadySignal()
        }

        // Check if we should resume from a specific timestamp
        if let resumeTime = appState?.resumeFromTimestamp, resumeTime > 0 {
            print("🔄 Resuming playback from \(Int(resumeTime))s (appState.resumeFromTimestamp = \(appState?.resumeFromTimestamp ?? 0))")



            // Check if we're in watch party mode and set flag accordingly
            if isInWatchParty {
                isResumingInWatchParty = true
                print("👥 Resuming inside watch party - will sync resume time to guests")
            }

            print("⏸️ Pausing immediately for resume...")
            mpvWrapper.pause()

            // Then seek immediately after brief pause
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                self?.attemptImmediateResume(resumeTime: resumeTime)
            }
        } else if !isInWatchParty {
            // Only auto-play if NOT in watch party (Watch Party waits for Ready Gate)
            print("ℹ️ No resume timestamp set (starting from beginning)")

            // For normal playback, ensure MPV is playing and update UI state
            if !mpvWrapper.isPlaying {
                mpvWrapper.play()
            }
            self.isPlaying = true
            print("▶️ Auto-playing solo content from beginning")
        }

        // Start periodic watch history saving (every 10 seconds)
        startWatchHistorySaving()
    }

    /// Immediate resume: Seek right away without waiting for full buffering
    private func attemptImmediateResume(resumeTime: Double) {
        print("🎯 IMMEDIATE RESUME: Seeking to \(Int(resumeTime))s without delay")

        // Wait a brief moment for video metadata to load (much faster than buffering)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }

            // Enhanced validation before seeking
            guard self.duration > 0 else {
                print("⚠️ Video duration not available yet (\(self.duration)s), retrying...")
                // Retry after another short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.attemptImmediateResume(resumeTime: resumeTime)
                }
                return
            }

            guard resumeTime < self.duration else {
                print("⚠️ Resume time (\(Int(resumeTime))s) exceeds video duration (\(Int(self.duration))s). Event is effectively finished for this file.")
                // Seek to near the end to trigger natural completion and transition to lobby
                // This ensures the user enters the "Waiting" state for the next event, maintaining sync
                let nearEnd = max(0, self.duration - 1.0)
                self.mpvWrapper.seek(to: nearEnd)
                self.mpvWrapper.play()
                self.isPlaying = true
                
                // Clear state
                self.appState?.resumeFromTimestamp = nil
                self.appState?.eventStartTime = nil
                return
            }

            // Execute seek immediately
            print("🎯 Executing immediate seek to \(Int(resumeTime))s...")
            self.mpvWrapper.seek(to: resumeTime)

            // Resume playback after brief delay to allow seek to register
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.mpvWrapper.play()
                self.isPlaying = true
                
                // Clear state
                self.appState?.resumeFromTimestamp = nil
                self.appState?.eventStartTime = nil // Clear event start too if present
                self.isResumingInWatchParty = false
                
                print("✅ Resumed playback after seek to \(Int(resumeTime))s")
            }
        }
    }




    func togglePlayPause() {
        // Special handling for watch party host: Add startup delay when transitioning to play
        if isInWatchParty && isWatchPartyHost && !mpvWrapper.isPlaying {
            // Cancel any pending play task
            pendingPlayTask?.cancel()

            // Host is about to play - add brief delay for guest synchronization
            print("🏁 Host initiating play with \(Int(hostStartupDelay * 1000))ms startup delay for guest sync")

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

            Task {
                do {
                    try await realtimeManager?.sendSyncMessage(syncMessage)
                    NSLog("📡 Sent play message to guests (pre-delay)")
                } catch {
                    NSLog("⚠️ Failed to send play sync message: \(error)")
                }
            }

            // Mark local action to prevent echo
            markLocalAction()

            // Then delay before actually starting playback
            pendingPlayTask = Task { @MainActor in
                try? await Task.sleep(nanoseconds: UInt64(hostStartupDelay * 1_000_000_000))

                // Check if task wasn't cancelled
                guard !Task.isCancelled else {
                    print("⏹️ Startup delay cancelled")
                    return
                }

                print("▶️ Host starting playback after startup delay")
                mpvWrapper.togglePlayPause()
            }

            return
        }

        // Normal toggle for non-watch-party or pause operations
        mpvWrapper.togglePlayPause()
        let isNowPlaying = mpvWrapper.isPlaying
        print(isNowPlaying ? "▶️ Playing" : "⏸️ Paused")

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

            Task {
                do {
                    try await realtimeManager?.sendSyncMessage(syncMessage)
                    NSLog("📡 Sent explicit \(messageType) message to guests")
                } catch {
                    NSLog("⚠️ Failed to send \(messageType) sync message: \(error)")
                }
            }
        }
    }

    func seek(to time: Double) {
        mpvWrapper.seek(to: time)
        print("⏩ Seeking to \(Int(time))s")

        // Mark that we initiated this action (ignore echo from remote)
        markLocalAction()

        // Send explicit seek sync message if host in watch party
        if isInWatchParty && isWatchPartyHost {
            let syncMessage = SyncMessage(
                type: .seek,
                timestamp: Date().timeIntervalSince1970,
                position: time,
                isPlaying: mpvWrapper.isPlaying,
                senderId: currentUserId,
                chatText: nil,
                chatUsername: nil
            )

            Task {
                do {
                    try await realtimeManager?.sendSyncMessage(syncMessage)
                    NSLog("📡 Sent explicit seek message to guests: \(Int(time))s")
                } catch {
                    NSLog("⚠️ Failed to send seek sync message: \(error)")
                }
            }
        }
    }

    func setVolume(_ level: Double) {
        volume = level
        mpvWrapper.setVolume(Int(level))
        print("🔊 Volume: \(Int(level))%")
    }

    // MARK: - Subtitle Sync Controls

    /// Adjust subtitle timing offset
    /// - Parameter offsetMs: Offset in milliseconds (positive = delay, negative = advance)
    func adjustSubtitleOffset(_ offsetMs: Double) {
        subtitleOffset = offsetMs
        mpvWrapper.setSubtitleOffset(offsetMs)
        print("⏱️ Subtitle offset adjusted: \(String(format: "%.1f", offsetMs))ms")
    }

    /// Reset subtitle timing to default
    func resetSubtitleTiming() {
        subtitleOffset = 0.0
        mpvWrapper.resetSubtitleTiming()
        print("🔄 Subtitle timing reset to default")
    }

    /// Update available subtitle tracks and current selection
    func updateSubtitleTracks() {
        availableSubtitleTracks = mpvWrapper.getSubtitleTracks()

        // Find current track
        let currentId = mpvWrapper.getCurrentSubtitleTrack()
        currentSubtitleTrack = availableSubtitleTracks.first { $0.id == currentId }

        // Update current offset from MPV
        subtitleOffset = mpvWrapper.getSubtitleOffset()

        print("📊 Updated subtitle tracks: \(availableSubtitleTracks.count) available, current: \(currentSubtitleTrack?.displayName ?? "Off")")
    }

    /// Select subtitle track by ID
    /// - Parameter trackId: Track ID (0 = off, or valid track ID)
    func selectSubtitleTrack(_ trackId: Int) {
        mpvWrapper.setSubtitleTrack(trackId) { [weak self] in
            guard let self = self else { return }
            self.updateSubtitleTracks()

            if let track = self.currentSubtitleTrack {
                print("📝 Selected subtitle track: \(track.displayName)")
            } else {
                print("🔇 Subtitles disabled")
            }
        }
    }

    /// Analyze subtitle compatibility and suggest improvements
    func analyzeSubtitleCompatibility() {
        guard !subtitles.isEmpty else { return }

        print("🔍 Analyzing subtitle compatibility...")

        // Check for version mismatches between video and subtitles
        let lowerTitle = streamTitle.lowercased()
        let videoIsBluRay = lowerTitle.contains("bluray") || lowerTitle.contains("bd")
        let videoIsWEBDL = lowerTitle.contains("web-dl") || lowerTitle.contains("webdl")

        for subtitle in subtitles {
            let subtitleIsWEBDL = subtitle.label.lowercased().contains("web-dl") || subtitle.label.lowercased().contains("webdl")
            let subtitleIsBluRay = subtitle.label.lowercased().contains("blu-ray") || subtitle.label.lowercased().contains("bluray")

            if videoIsBluRay && subtitleIsWEBDL {
                print("⚠️ Version mismatch detected: BluRay video with WEB-DL subtitle '\(subtitle.label)' - sync issues likely")
                showSubtitleSyncPanel = true
            } else if videoIsWEBDL && subtitleIsBluRay {
                print("⚠️ Version mismatch detected: WEB-DL video with BluRay subtitle '\(subtitle.label)' - sync issues likely")
                showSubtitleSyncPanel = true
            } else {
                print("✅ Good version match: \(subtitle.label)")
            }
        }

        // Update available tracks
        updateSubtitleTracks()
    }

    // MARK: - Track Selection

    @discardableResult
    private func selectEnglishDefaults() -> Bool {
        print("🌐 Selecting English audio and subtitle tracks...")

        // Try to find and select English audio
        let audioTracks = mpvWrapper.getAudioTracks()
        print("📊 Found \(audioTracks.count) audio tracks")
        for track in audioTracks {
            print("   Audio: ID=\(track.id) lang=\(track.lang ?? "nil") title=\(track.title ?? "nil")")
        }

        if let englishAudio = audioTracks.first(where: { track in
            let lang = track.lang?.lowercased() ?? ""
            let title = track.title?.lowercased() ?? ""
            return lang.contains("eng") || lang == "en" || title.contains("english")
        }) {
            print("✅ Found English audio track: \(englishAudio.displayName)")
            mpvWrapper.setAudioTrack(englishAudio.id)
        } else if let firstAudio = audioTracks.first {
            print("⚠️ No English audio found, using: \(firstAudio.displayName)")
            mpvWrapper.setAudioTrack(firstAudio.id)
        }

        // Try to find and select English subtitles
        let subtitleTracks = mpvWrapper.getSubtitleTracks()
        print("📊 Found \(subtitleTracks.count) subtitle tracks (including 'Off')")
        for track in subtitleTracks {
            print("   Subtitle: ID=\(track.id) lang=\(track.lang ?? "nil") title=\(track.title ?? "nil")")
        }

        // Filter out "Off" option (ID 0) and look for English
        let actualSubtitles = subtitleTracks.filter { $0.id != 0 }
        print("📊 After filtering: \(actualSubtitles.count) actual subtitle tracks")

        // Find all English subtitles
        let englishSubs = actualSubtitles.filter { track in
            let lang = track.lang?.lowercased() ?? ""
            let title = track.title?.lowercased() ?? ""
            return lang.contains("eng") || lang == "en" || title.contains("english")
        }

        // Prioritize full subtitles over foreign-parts-only subtitles
        // First, try to find non-foreign, non-HI subtitles (ideal)
        let preferredSub = englishSubs.first(where: { track in
            let title = track.title?.lowercased() ?? ""
            let isForeignOnly = title.contains("foreign") ||
                               title.contains("forced") ||
                               title.contains("non-english") ||
                               title.contains("only")
            let isHI = title.contains(".hi") || title.contains(" hi")
            return !isForeignOnly && !isHI
        }) ?? englishSubs.first

        if let englishSub = preferredSub {
            let currentSid = mpvWrapper.getCurrentSubtitleTrack()
            if currentSid != englishSub.id {
                print("✅ Found English subtitle track: \(englishSub.displayName) (ID: \(englishSub.id))")
                mpvWrapper.setSubtitleTrack(englishSub.id)
            } else {
                print("ℹ️ English subtitle already active (ID: \(currentSid)), no switch needed")
            }

            // Update our state
            updateSubtitleTracks()

            // Analyze compatibility after selecting track
            analyzeSubtitleCompatibility()

            return true
        } else if let firstSub = actualSubtitles.first {
            let currentSid = mpvWrapper.getCurrentSubtitleTrack()
            if currentSid != firstSub.id {
                print("⚠️ No English subtitles found, using first available: \(firstSub.displayName)")
                mpvWrapper.setSubtitleTrack(firstSub.id)
            } else {
                print("ℹ️ First available subtitle already active (ID: \(currentSid)), no switch needed")
            }

            // Update our state
            updateSubtitleTracks()

            // Analyze compatibility after selecting track
            analyzeSubtitleCompatibility()

            return true
        } else {
            print("ℹ️ No subtitle tracks found in video yet")
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self = self else { return }

            // ✅ SAFEGUARD: Always reset animation state after timeout
            self.isAnimatingChatToggle = false

            // Restart broadcasting if it was active
            if self.isWatchPartyHost && originalInterval != nil {
                self.startBroadcastingState()
            }
        }

        // ✅ TIMEOUT PROTECTION: Force reset after 1 second maximum
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.isAnimatingChatToggle = false
        }

        print(showChat ? "💬 Chat opened" : "💬 Chat closed")
    }

    func sendMessage(_ text: String) {
        guard !text.isEmpty else { return }
        guard currentRoomId != nil else {
            NSLog("⚠️ Cannot send message: no room ID")
            return
        }

        let username = appState?.currentUsername ?? "Guest"
        let userId = appState?.currentUserId ?? UUID()

        let message = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date()
        )

        messages.append(message)

        // Limit message history to prevent memory bloat (keep last 100 messages)
        if messages.count > 100 {
            messages.removeFirst(messages.count - 100)
        }

        trimChatMessages()
        print("💬 Sent: \(text)")

        // Watch party chat: Send via Realtime ONLY (no database)
        // Watch party rooms don't exist in the database, only in Realtime
        if isInWatchParty {
            Task {
                let syncMessage = SyncMessage(
                    type: .chat,
                    timestamp: Date().timeIntervalSince1970,
                    isPlaying: nil,
                    senderId: userId.uuidString,
                    chatText: text,
                    chatUsername: username
                )

                do {
                    try await realtimeManager?.sendSyncMessage(syncMessage)
                    print("✅ Chat message sent via Realtime")
                } catch {
                    print("❌ Failed to send chat message: \(error)")
                }
            }
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
        activeTimers.forEach { $0.invalidate() }
        activeTimers.removeAll()
        print("🗑️ Invalidated all active timers")
    }

    /// Keep chat list bounded to avoid long-session memory bloat
    private func trimChatMessages(maxCount: Int = 200) {  // Was 500
        if messages.count > maxCount {
            messages.removeFirst(messages.count - maxCount)
        }
    }

    // MARK: - Cleanup

    func cleanup() async {
        // Prevent double cleanup
        guard !hasCleanedUp else {
            print("⚠️ Cleanup already performed, skipping")
            return
        }
        hasCleanedUp = true

        print("🧹 Cleaning up MPV player...")

        // ✅ STEP 1: Clear watching status immediately
        await SocialService.shared.updateWatchingStatus(
            mediaTitle: nil,
            mediaType: nil,
            imdbId: nil,
            roomId: nil
        )

        // ✅ STEP 2: Stop timers to prevent further updates
        invalidateAllTimers()

        // ✅ STEP 3: Cancel observer tasks to prevent callbacks
        print("🛑 Cancelling \(mpvObserverTasks.count) MPV observer tasks...")
        for task in mpvObserverTasks {
            task.cancel()
        }
        mpvObserverTasks.removeAll()

        pendingPlayTask?.cancel()
        pendingPlayTask = nil

        // Stop Ready Loop
        readyLoopTimer?.invalidate()
        readyLoopTimer = nil

        // ✅ STEP 4: Disconnect realtime FIRST and await completion
        if isInWatchParty {
            print("🔌 Disconnecting realtime manager...")
            await realtimeManager?.disconnect()
            print("✅ Realtime manager disconnected")
        }

        // ✅ STEP 5: Stop MPV AFTER websocket fully disconnected
        print("🛑 Stopping MPV playback...")
        mpvWrapper.stop()
    }

    deinit {
        print("🗑️ MPVPlayerViewModel deinit")
        // ✅ Don't create async tasks in deinit - cleanup() is already called before deallocation
        // The Task with [weak self] creates a race condition where self may be deallocated
        // between the guard check and the MainActor.run execution, causing a crash in Swift's
        // reference counting system (decrementStrong). All necessary cleanup is handled by cleanup().
    }

    // MARK: - Subtitle Download

    nonisolated private func downloadSubtitle(url: String) async -> String? {
        NSLog("🔍 downloadSubtitle() called with URL: %@", url)
        guard let subtitleURL = URL(string: url) else {
            NSLog("❌ RedLemon: Invalid subtitle URL")
            return nil
        }

        do {
            NSLog("📡 Starting URLSession download...")
            // Use custom session with longer timeout for SubDL proxy downloads
            // (server needs time to download from SubDL, extract ZIP, convert to VTT)
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 30.0  // 30 seconds
            config.timeoutIntervalForResource = 30.0
            let session = URLSession(configuration: config)
            
            NSLog("⏳ Waiting for server response...")
            let (data, response) = try await session.data(from: subtitleURL)
            NSLog("✅ Received response! Data size: %d bytes", data.count)

            // Check if it's actually a ZIP archive by inspecting the content
            // Don't rely on URL or Content-Type for SubDL proxy URLs
            let contentType = (response as? HTTPURLResponse)?.value(forHTTPHeaderField: "Content-Type") ?? ""
            NSLog("🔍 Content-Type: %@", contentType)
            NSLog("🔍 Downloaded %d bytes", data.count)
            
            // Check if content is actually VTT (proxy server returns VTT even if URL has .zip)
            if let text = String(data: data, encoding: .utf8), text.hasPrefix("WEBVTT") {
                NSLog("✅ Detected VTT content from proxy server")
                // Save VTT directly
                let tempDir = FileManager.default.temporaryDirectory
                let subtitleFileName = "subtitle_\(UUID().uuidString).vtt"
                let localURL = tempDir.appendingPathComponent(subtitleFileName)
                try text.write(to: localURL, atomically: true, encoding: .utf8)
                return localURL.path
            }
            
            // Check for ZIP magic bytes (PK\x03\x04)
            let isZip = data.count > 4 && data[0] == 0x50 && data[1] == 0x4B && data[2] == 0x03 && data[3] == 0x04

            var subtitleText: String

            if isZip {
                NSLog("📦 Extracting subtitle from ZIP archive")
                subtitleText = try extractSRTFromZip(data: data)
            } else {
                // Assume raw SRT or VTT
                guard let text = String(data: data, encoding: .utf8) else {
                    NSLog("❌ Failed to decode subtitle file")
                    return nil
                }
                subtitleText = text
            }

            // Convert SRT to VTT if needed
            if !subtitleText.hasPrefix("WEBVTT") {
                subtitleText = convertSRTToVTT(srt: subtitleText)
            }

            // Save to temporary directory
            let tempDir = FileManager.default.temporaryDirectory
            let subtitleFileName = "subtitle_\(UUID().uuidString).vtt"
            let localURL = tempDir.appendingPathComponent(subtitleFileName)

            try subtitleText.write(to: localURL, atomically: true, encoding: .utf8)

            return localURL.path
        } catch {
            NSLog("❌ RedLemon: Failed to download subtitle: %@", error.localizedDescription)
            return nil
        }
    }

    nonisolated private func extractSRTFromZip(data: Data) throws -> String {
        // Use libz to extract (7z format uses zlib internally)
        // First, try to find .srt file in archive

        // For now, use a simple approach: Look for SRT content markers
        // The file appears to be a 7z archive with an en.sdh.srt file inside

        // Swift doesn't have built-in 7z support, so let's try using unzip command
        let tempDir = FileManager.default.temporaryDirectory
        let zipFile = tempDir.appendingPathComponent("temp_\(UUID().uuidString).zip")
        let extractDir = tempDir.appendingPathComponent("extract_\(UUID().uuidString)")

        try data.write(to: zipFile)
        try FileManager.default.createDirectory(at: extractDir, withIntermediateDirectories: true)

        // Try to extract using system unzip command
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = ["-q", "-o", zipFile.path, "-d", extractDir.path]

        try process.run()
        process.waitUntilExit()

        // Find .srt file in extracted directory
        let contents = try FileManager.default.contentsOfDirectory(at: extractDir, includingPropertiesForKeys: nil)
        guard let srtFile = contents.first(where: { $0.pathExtension.lowercased() == "srt" }) else {
            throw NSError(domain: "SubtitleExtraction", code: -1, userInfo: [NSLocalizedDescriptionKey: "No SRT file found in archive"])
        }

        let srtContent = try String(contentsOf: srtFile, encoding: .utf8)

        // Cleanup
        try? FileManager.default.removeItem(at: zipFile)
        try? FileManager.default.removeItem(at: extractDir)

        return srtContent
    }

    nonisolated private func convertSRTToVTT(srt: String) -> String {
        var vtt = "WEBVTT\n\n"

        // Split into cues (separated by double newlines in SRT)
        let cues = srt.components(separatedBy: "\n\n")

        for cue in cues {
            let trimmedCue = cue.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmedCue.isEmpty { continue }

            // Convert comma to period in timestamps and add to cue
            let convertedCue = trimmedCue.replacingOccurrences(of: ",", with: ".")
            vtt += convertedCue + "\n\n"
        }

        return vtt
    }
}

// MARK: - Models

struct ChatMessage: Identifiable {
    let id: String
    let username: String
    let text: String
    let timestamp: Date
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
        print("🎉 Starting watch party: roomId=\(roomId), isHost=\(isHost)")

        self.currentRoomId = roomId
        self.isWatchPartyHost = isHost
        self.isInWatchParty = true  // Enable watch party mode
        NSLog("🎉 Watch Party Mode ENABLED. isInWatchParty = %@", self.isInWatchParty ? "YES" : "NO")

        // Get user ID from appState
        guard let userId = appState?.currentUserId?.uuidString else {
            throw RealtimeError.notInitialized
        }
        self.currentUserId = userId

        // Initialize Realtime manager
        self.realtimeManager = RealtimeChannelManager(realtimeClient: RedLemon.SupabaseClient.shared.realtimeClient)

        // But prepare welcome message for when they do open it
        // CRITICAL: Set up presence callback BEFORE setup() so we don't miss any presence events
        await realtimeManager?.setPresenceCallback { [weak self] (action: PresenceAction, userId: String, metadata: [String: Any]?) in
            _ = Task { @MainActor in
                guard let self = self else { return }

                // FALLBACK: If room is missing locally (e.g. host started quickly), fetch it
                if self.appState?.currentWatchPartyRoom == nil, let roomId = self.currentRoomId {
                    print("⚠️ Room state missing in MPVViewModel - fetching fallback for \(roomId)")
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
                            id: fetchedSupabaseRoom.hostUserId.uuidString,
                            name: fetchedSupabaseRoom.hostUsername,
                            isHost: true,
                            isReady: true,
                            joinedAt: Date()
                        )

                        let fetchedRoom = WatchPartyRoom(
                            id: fetchedSupabaseRoom.id,
                            hostId: fetchedSupabaseRoom.hostUserId.uuidString,
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
                        
                        self.appState?.currentWatchPartyRoom = fetchedRoom
                    }
                }

                // Update AppState participants list for UI
                if let room = self.appState?.currentWatchPartyRoom {
                    var updatedParticipants: [Participant] = room.participants
                    let localCurrentUserId = self.currentUserId

                    // Define actualUserId ONCE before switch, using consistent logic
                    // Prioritize user_id from metadata, then username, then fallback to passed userId
                    let metaUserId = metadata?["user_id"] as? String
                    let metaUsername = metadata?["username"] as? String
                    let actualUserId = metaUserId ?? metaUsername ?? userId
                    
                    switch action {
                    case .join:
                        // Cancel any pending leave for this user
                        if let existingTask = self.pendingLeaveTasks[actualUserId] {
                            print("🔄 User \(actualUserId) reconnected within grace period - cancelling leave")
                            existingTask.cancel()
                            self.pendingLeaveTasks.removeValue(forKey: actualUserId)
                            return // Skip re-adding since they never technically left our model
                        }

                        // Check if already exists
                        if !updatedParticipants.contains(where: { $0.id == userId }) {
                            // Extract metadata
                            let username = metaUsername ?? "User"
                            let isHostVal = metadata?["is_host"] as? Bool ?? false
                            // let avatarUrl = metadata?["avatar_url"] as? String // Unused
                            let joinedAtVal = metadata?["joined_at"] as? TimeInterval ?? Date().timeIntervalSince1970 

                            let newParticipant = Participant(
                                id: userId,
                                name: username,
                                isHost: isHostVal,
                                isReady: false,
                                joinedAt: Date(timeIntervalSince1970: joinedAtVal)
                            )
                            updatedParticipants.append(newParticipant)
                        }
                        
                        // ENSURE SELF IS IN LIST
                        if let currentId = localCurrentUserId {
                            let isSelfPresent = updatedParticipants.contains(where: { (p: Participant) in p.id == currentId })
                            if !isSelfPresent {
                                let selfParticipant = Participant(
                                    id: currentId,
                                    name: self.appState?.currentUsername ?? "Me",
                                    isHost: self.isWatchPartyHost,
                                    isReady: true,
                                    joinedAt: Date()
                                )
                                updatedParticipants.append(selfParticipant)
                            }
                        }
                        
                    case .leave:
                        // DEBOUNCE LEAVE: Wait 10 seconds before actually removing
                        // This handles flaky connections and Lobby->Player transitions
                        print("⏳ Participant leaving (grace period started): \(userId)")
                        
                        let task: Task<Void, Never> = Task { [weak self] in
                            // Wait 10 seconds (nano)
                            try? await Task.sleep(nanoseconds: 10_000_000_000)
                            
                            guard let self = self else { return }
                            
                            // Check for cancellation
                            if Task.isCancelled { return }
                            
                            await MainActor.run {
                                // Fetch FRESH list to avoid stale data race
                                guard var currentParticipants = self.appState?.currentWatchPartyRoom?.participants else { return }
                                
                                // Remove
                                currentParticipants.removeAll(where: { $0.id == userId })
                                print("👋 Participant left (confirmed): \(userId)")

                                // Post-Load Gate Logic
                                if actualUserId != self.currentUserId {
                                    self.connectedGuestIds.remove(actualUserId)
                                    self.readyGuestIds.remove(actualUserId)
                                    if self.isWatchPartyHost {
                                        self.checkIfAllGuestsReady()
                                    }
                                }
                                
                                // Update room state with fresh list
                                self.appState?.currentWatchPartyRoom?.participants = currentParticipants
                                self.pendingLeaveTasks.removeValue(forKey: actualUserId)
                            }
                        }
                        self.pendingLeaveTasks[actualUserId] = task
                        return

                    }
                    
                    // Update room state
                    self.appState?.currentWatchPartyRoom?.participants = updatedParticipants
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

        print("✅ Watch party sync initialized with Realtime")

        // Post-Setup Check: If video already loaded, send ready signal now
        // This handles the race condition where duration loaded before Realtime was ready
        if duration > 0 && !hasSentReadySignal {
             NSLog("👋 Watch Party: Setup complete, sending delayed READY signal")
             sendReadySignal()
        }
    }

    /// Start polling chat messages from Supabase
    private func startChatPolling() {
        guard let roomId = currentRoomId else { return }

        NSLog("🔄 Starting chat polling for room: \(roomId)")

        // Poll chat every 2 seconds
        chatPollingTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                await self.pollChatMessages()
            }
        }

        // Do initial fetch immediately
        Task { @MainActor in
            await pollChatMessages()
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
                    timestamp: msg.createdAt
                )
                messages.append(chatMsg)
                trimChatMessages()
                lastChatMessageId = msg.id.uuidString

                NSLog("💬 New chat message from \(msg.username): \(msg.message)")
            }

        } catch {
            NSLog("⚠️ Failed to poll chat messages: \(error)")
        }
    }

    /// Stop chat polling when leaving watch party
    private func stopChatPolling() {
        chatPollingTimer?.invalidate()
        chatPollingTimer = nil
        NSLog("🛑 Chat polling stopped")
    }

    /// Handle incoming sync messages from peers
    private func handleSyncMessage(_ message: SyncMessage) async {
        // DEBUG: Log ALL incoming messages before any filtering
        NSLog("🔍 DEBUG: Received sync message - type: \(message.type), sender: \(message.senderId ?? "unknown")")

        // Host is authoritative for playback, but should still receive chat messages and READY signals
        if isWatchPartyHost && message.type != .chat && message.type != .ready {
            NSLog("🚫 DEBUG: Host filtering out message type: \(message.type)")
            return
        }

        // Syncplay-inspired: Ignore remote updates if we just made a local action
        // CRITICAL: NEVER ignore READY or CHAT messages - they must always be processed
        if message.type != .ready && message.type != .chat && shouldIgnoreRemoteUpdate() {
            NSLog("🚫 DEBUG: Filtering message due to recent local action - type: \(message.type)")
            return
        }

        switch message.type {
        case .ready:
            // Handle Ready signal
            if let senderId = message.senderId {
                NSLog("✅ Received READY signal from \(senderId)")
                readyGuestIds.insert(senderId)

                // PRESENCE FALLBACK: Ensure sender is in connectedGuestIds
                // This handles cases where Presence events are delayed/missing
                if !connectedGuestIds.contains(senderId) && senderId != currentUserId {
                    NSLog("⚠️ Adding \(senderId) to connectedGuestIds (presence fallback)")
                    connectedGuestIds.insert(senderId)
                }

                if isWatchPartyHost {
                    checkIfAllGuestsReady()
                }
            }

        case .play:
            // Handle Play signal (Start of movie)
            if showWaitingForGuests {
                print("🎬 Received PLAY signal - All guests ready! Starting playback.")
                showWaitingForGuests = false
                mpvWrapper.play()
                isPlaying = true

                // Stop Ready Loop
                readyLoopTimer?.invalidate()
                readyLoopTimer = nil
            } else {
                // Normal play sync
                if !mpvWrapper.isPlaying {
                    print("▶️ Sync: Playing")
                    mpvWrapper.play()
                    isPlaying = true
                }
            }

        case .playbackState:
            // Guest syncs to host's playback state with advanced smoothness optimization
            let hostTimestamp = message.timestamp
            guard let isPlaying = message.isPlaying else { return }

            // FIX: Ensure waiting overlay is dismissed if host is playing
            // This handles cases where the initial .play command was missed
            if isPlaying && showWaitingForGuests {
                print("🎬 Received playback state (playing) - Dismissing waiting overlay")
                showWaitingForGuests = false

                // Stop Ready Loop
                readyLoopTimer?.invalidate()
                readyLoopTimer = nil
            }

            // Update network latency estimate
            updateNetworkLatency()

            // Predictive compensation: Account for network latency
            // By the time we receive this message, the host has moved forward
            let predictedHostPosition = hostTimestamp + networkLatency

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

            // Advanced tiered sync with hysteresis and adaptive thresholds
            // CRITICAL: Avoid seeks on weaker hardware - they cause video pipeline stalls

            // CRITICAL: Avoid seeks on weaker hardware - they cause video pipeline stalls
            // EVENTS: Disable speed sync (adaptive sync) as requested - rely on initial seek and large drift correction only
            let isEvent = appState?.isEventPlayback == true

            if absSmoothedDrift < 0.1 {
                // Perfect sync (<100ms smoothed drift)
                // If we're currently adjusting speed, reset to normal
                if isCurrentlyAdjustingSpeed {
                    mpvWrapper.setSpeed(1.0)
                    isCurrentlyAdjustingSpeed = false
                    currentSpeedAdjustment = 1.0
                    print("✅ Perfect sync achieved: \(Int(absSmoothedDrift * 1000))ms - resetting to 1.0x")
                }
            } else if absSmoothedDrift < 5.0 && !isEvent {
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
                        print("⚡ Adaptive speed sync: \(String(format: "%.3f", speedFactor))x to fix \(String(format: "%.1f", absSmoothedDrift))s drift")
                    } else if absSmoothedDrift > 0.4 {
                        // Medium drift (400ms-1s): Gentle correction
                        speedFactor = smoothedDrift > 0 ? 0.99 : 1.01  // ±1%
                        print("⚡ Gentle speed sync: \(speedFactor)x to fix \(Int(absSmoothedDrift * 1000))ms drift")
                    } else {
                        // Small drift (100-400ms): Ultra-gentle correction
                        speedFactor = smoothedDrift > 0 ? 0.995 : 1.005  // ±0.5%
                        print("⚡ Ultra-gentle sync: \(speedFactor)x to fix \(Int(absSmoothedDrift * 1000))ms drift")
                    }

                    mpvWrapper.setSpeed(speedFactor)
                    currentSpeedAdjustment = speedFactor
                    isCurrentlyAdjustingSpeed = true
                    lastSpeedAdjustmentTime = Date()

                    // Auto-reset speed after correction period (proportional to drift)
                    let resetDelay = min(max(absSmoothedDrift * 2.0, 2.0), 5.0)  // 2-5 seconds
                    Task {
                        try? await Task.sleep(nanoseconds: UInt64(resetDelay * 1_000_000_000))
                        await MainActor.run {
                            // Only reset if we haven't made another adjustment
                            if self.currentSpeedAdjustment == speedFactor {
                                self.mpvWrapper.setSpeed(1.0)
                                self.isCurrentlyAdjustingSpeed = false
                                self.currentSpeedAdjustment = 1.0
                            }
                        }
                    }
                }
            } else {
                // Large drift (>5s) - seek required
                // PREDICTIVE SEEK: Add offset to compensate for seek/buffer latency
                // This is especially important when guest joins an active room mid-playback
                let seekBufferOffset: Double = 1.2  // 1.2s to account for seek + buffer time
                let targetPosition = predictedHostPosition + seekBufferOffset

                print("🔄 Large drift (\(String(format: "%.1f", absSmoothedDrift))s) - seeking to \(String(format: "%.1f", targetPosition))s (host at \(String(format: "%.1f", predictedHostPosition))s + \(seekBufferOffset)s offset)")
                seek(to: targetPosition)
                // Reset drift history after seek
                driftHistory.removeAll()
                isCurrentlyAdjustingSpeed = false
                currentSpeedAdjustment = 1.0
            }

            // Sync play/pause state
            if isPlaying && !mpvWrapper.isPlaying {
                togglePlayPause()
            } else if !isPlaying && mpvWrapper.isPlaying {
                togglePlayPause()
            }



        case .pause:
            print("⏸️ Host pressed pause")
            if mpvWrapper.isPlaying {
                togglePlayPause()
            }

        case .seek:
            let timestamp = message.timestamp
            print("⏩ Host seeked to \(timestamp)s")
            seek(to: timestamp)

        case .chat:
            // Receive chat message from other participants
            // CRITICAL: Skip messages from self (already added locally when sent)
            if message.senderId == currentUserId {
                print("💬 Skipping own message (already displayed locally)")
                return
            }

            if let text = message.chatText, let username = message.chatUsername {
                // Convert LOBBY_JOIN to a friendly join message, filter out other system messages
                let displayText: String
                if text == "LOBBY_JOIN" {
                    displayText = "joined! 👋"
                } else if text.starts(with: "LOBBY_") {
                    // Filter out LOBBY_READY, LOBBY_UNREADY, etc.
                    print("💬 Skipping system message: \(text)")
                    return
                } else {
                    displayText = text
                }

                let chatMessage = ChatMessage(
                    id: UUID().uuidString,
                    username: username,
                    text: displayText,
                    timestamp: Date(timeIntervalSince1970: message.timestamp)
                )
                // Batch chat updates to avoid UI thrashing
                await MainActor.run {
                    pendingChatMessages.append(chatMessage)

                    if !isFlushingChat {
                        isFlushingChat = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
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
                print("💬 Received chat from \(username): \(text)")
            }

        case .streamSelected:
            // Host selected a new stream - guests should update their stream info
            if let infoHash = message.infoHash,
               let quality = message.quality,
               let unlockedURL = message.unlockedURL {

                print("🎬 Host selected new stream:")
                print("   InfoHash: \(infoHash)")
                print("   Quality: \(quality)")
                print("   File Index: \(message.fileIdx ?? -1)")

                // Update local stream information
                // Note: Guests might need to reload stream with new URL
                if videoURL != unlockedURL {
                    print("🔄 Stream URL changed, reloading...")
                    videoURL = unlockedURL

                    // If currently playing, reload with new stream
                    if mpvWrapper.isPlaying {
                        mpvWrapper.loadVideo(url: unlockedURL, autoplay: true)
                    }
                }
            } else {
                print("⚠️ Received streamSelected message with incomplete data")
            }

        case .requestStream:
            // Guest requested current stream info - only host should handle this
            if isWatchPartyHost {
                print("📤 Guest requested stream info, sending current stream details")

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
                        print("✅ Sent stream info to requesting guest")
                    } catch {
                        print("❌ Failed to send stream info: \(error)")
                    }
                }
            } else {
                print("⚠️ Non-host received requestStream message, ignoring")
            }

        case .preload:
            // Preload message - handled in LobbyViewModel, not here
            break



        case .ping, .pong:
            // Handled by RealtimeChannelManager
            break
        }
    }

    // MARK: - Post-Load Ready Gate Helpers

    private func sendReadySignal() {
        guard !hasSentReadySignal else { return }

        // Optimistically set true to prevent rapid-fire calls
        hasSentReadySignal = true

        NSLog("👋 Watch Party: Sending INITIAL READY signal and starting loop")

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

            Task {
                do {
                    if let manager = self.realtimeManager {
                        try await manager.sendSyncMessage(syncMessage)
                        if isRetry {
                            NSLog("🔄 Watch Party: Resent READY signal (loop)")
                        } else {
                            NSLog("✅ Watch Party: READY signal sent successfully")
                        }
                    } else {
                        NSLog("❌ Watch Party: realtimeManager is nil, cannot send READY signal")
                    }
                } catch {
                    NSLog("❌ Watch Party: Failed to send READY signal: %@", error.localizedDescription)
                }
            }
        }

        // Send immediately
        transmit(false)

        // Start Ready Loop (resend every 2 seconds until playback starts)
        readyLoopTimer?.invalidate()
        readyLoopTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            // Only continue loop if we are still waiting for guests (waiting for host to start)
            if self.showWaitingForGuests {
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

    private func checkIfAllGuestsReady() {
        guard isWatchPartyHost else { return }

        NSLog("🔍 DEBUG: checkIfAllGuestsReady called")
        NSLog("🔍 DEBUG: hasSentReadySignal = %@", hasSentReadySignal ? "true" : "false")
        NSLog("🔍 DEBUG: connectedGuestIds = %@", Array(connectedGuestIds).joined(separator: ", "))
        NSLog("🔍 DEBUG: readyGuestIds = %@", Array(readyGuestIds).joined(separator: ", "))

        // Ensure Host is ready (video loaded)
        guard hasSentReadySignal else {
            NSLog("⏳ Host not ready yet (but %d guests are ready)", readyGuestIds.count)
            return
        }

        // CRITICAL FIX: Ensure we have at least one guest before starting
        // Without this, fast hosts would start immediately if guests haven't joined presence yet
        guard !connectedGuestIds.isEmpty else {
            NSLog("⏳ No guests connected yet (waiting for presence updates)")
            return
        }

        // Check if all connected guests are ready
        // Note: connectedGuestIds comes from Presence
        let allReady = connectedGuestIds.isSubset(of: readyGuestIds)
        NSLog("🔍 DEBUG: allReady = %@", allReady ? "true" : "false")

        if allReady {
            NSLog("🚀 All guests ready! Starting playback in 1s...")

            // Small delay to ensure UI updates
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                guard let self = self else { return }
                self.startSynchronizedPlayback()
            }
        } else {
            let missing = connectedGuestIds.subtracting(readyGuestIds)
            NSLog("⏳ Waiting for guests: %d remaining - %@", missing.count, Array(missing).joined(separator: ", "))
        }
    }

    private func startSynchronizedPlayback() {
        NSLog("🎬 Host: Initiating synchronized start")
        showWaitingForGuests = false
        mpvWrapper.play()
        isPlaying = true

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

        // ✅ Reduce from 10Hz to 4Hz
        syncBroadcastTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            // ✅ Don't broadcast during chat animation
            if self.isAnimatingChatToggle {
                return
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

            Task {
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
        Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            await MainActor.run {
                if self.ignoringRemoteUpdates > 0 {
                    self.ignoringRemoteUpdates -= 1
                }
            }
        }
    }

    /// Check if we should ignore remote updates (recently made local action)
    private func shouldIgnoreRemoteUpdate() -> Bool {
        if ignoringRemoteUpdates > 0 {
            print("🚫 Ignoring remote update (recent local action)")
            return true
        }

        // Also check time-based (backup in case counter gets out of sync)
        if let lastAction = lastLocalActionTime, Date().timeIntervalSince(lastAction) < 0.5 {
            print("🚫 Ignoring remote update (recent local action by time)")
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
        print("👋 Stopping watch party sync")

        // Stop broadcast timer
        syncBroadcastTimer?.invalidate()
        syncBroadcastTimer = nil

        // Stop chat polling
        stopChatPolling()

        // Disconnect Realtime
        await realtimeManager?.disconnect()
        realtimeManager = nil

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
            timestamp: Date()
        ))
        trimChatMessages()

        print("✅ Watch party sync stopped, returned to solo mode")
    }

    // MARK: - Watch History

    private func startWatchHistorySaving() {
        // Cancel any existing timer
        watchHistoryTimer?.invalidate()

        // Save watch history every 10 seconds
        watchHistoryTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                self.saveWatchHistory()
            }
        }

        print("📝 Started watch history tracking")
    }

    private func saveWatchHistory() {
        guard currentTime > 0 && duration > 0 else { return }
        appState?.saveToWatchHistory(timestamp: currentTime, duration: duration)
    }

    func stopWatchHistorySaving() {
        // Save one final time before stopping
        saveWatchHistory()

        // Stop timer
        watchHistoryTimer?.invalidate()
        watchHistoryTimer = nil

        print("📝 Stopped watch history tracking")
    }
}
