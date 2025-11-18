//
//  MPVPlayerViewModel.swift
//  RedLemon
//
//  ViewModel for MPV player with background art and chat
//

import Foundation
import SwiftUI
import Compression

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

    // Watch history tracking
    private var watchHistoryTimer: Timer?

    // Enhanced timer management for performance
    private var activeTimers: [Timer] = []
    weak var appState: AppState?

    // Cleanup state
    private var hasCleanedUp: Bool = false

    // Watch party state
    @Published var isInWatchParty: Bool = false  // Track if currently in watch party mode
    @Published var isResumingInWatchParty: Bool = false  // Track if resuming from saved position in watch party

    // Syncplay-inspired: Ignore echoed state changes (prevent jitter)
    private var ignoringRemoteUpdates: Int = 0  // Counter for ignoring remote updates after local actions
    private var lastLocalActionTime: Date?

    // Player state
    @Published var videoURL: String = ""
    @Published var isLoading: Bool = true
    @Published var isPlaying: Bool = false
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

    // MARK: - Initialization

    func loadStream(streamURL: String, imdbId: String, streamTitle: String, subtitles: [(url: String, label: String)]) async {
        NSLog("🎬🎬🎬 LOADSTREAM CALLED - streamTitle: %@", streamTitle)
        NSLog("🎬🎬🎬 streamURL: %@", streamURL.prefix(60) as CVarArg)
        NSLog("🎬🎬🎬 subtitles: %d", subtitles.count)
        print("🎬 Loading stream: \(streamTitle)")
        print("   IMDB: \(imdbId)")
        print("   URL: \(streamURL.prefix(60))...")

        self.videoURL = streamURL
        self.imdbId = imdbId
        self.streamTitle = streamTitle
        let isBreakingBad = imdbId == "tt0903747"

        // Breaking Bad trusted pack: skip external subs so we can use embedded multisubs (even if title doesn’t contain S01-S05)
        let effectiveSubtitles: [(url: String, label: String)] = {
            if isBreakingBad {
                print("📝 Breaking Bad detected - skipping external subtitles to prefer embedded multisubs")
                return []
            }
            return subtitles
        }()

        self.subtitles = effectiveSubtitles
        self.isLoading = true
        self.showPoster = true

        // Add mock chat messages for testing UI
        self.messages = [
            ChatMessage(id: "1", username: "Alice", text: "Hey! Ready to watch?", timestamp: Date()),
            ChatMessage(id: "2", username: "Bob", text: "Yeah! Let's start!", timestamp: Date().addingTimeInterval(2)),
            ChatMessage(id: "3", username: "System", text: "Press C to toggle chat overlay", timestamp: Date().addingTimeInterval(4)),
            ChatMessage(id: "4", username: "Charlie", text: "This is so cool! Native Swift player with chat 🎉", timestamp: Date().addingTimeInterval(8))
        ]
        print("💬 Added mock chat messages for testing")

        // Fetch metadata for background art
        await fetchMetadata(imdbId: imdbId)

        // Check if we should resume from a specific timestamp
        let shouldResume = appState?.resumeFromTimestamp != nil && (appState?.resumeFromTimestamp ?? 0) > 0

        if shouldResume {
            print("🔄 Resume mode: Will load video and immediately pause+seek")
            // Load video normally but will immediately pause and seek
            mpvWrapper.loadVideo(url: streamURL, autoplay: true)
        } else {
            print("▶️ Normal mode: Will load video and play immediately")
            // Load video normally with autoplay
            mpvWrapper.loadVideo(url: streamURL, autoplay: true)
        }

        func startEmbeddedSubtitleScan() {
            Task { [weak self] in
                guard let self = self else { return }

                // Give playback more head start before polling to avoid startup stutter
                try? await Task.sleep(nanoseconds: 5_000_000_000) // 5s initial delay

                // Poll a few times to give MPV a chance to parse embedded tracks
                for attempt in 1...3 {
                    try? await Task.sleep(nanoseconds: 3_000_000_000) // 3s between checks

                    let tracks = self.mpvWrapper.getSubtitleTracks()
                    let embeddedSubs = tracks.filter { $0.id != 0 }
                    if !embeddedSubs.isEmpty {
                        print("✅ Detected embedded subtitles (\(embeddedSubs.count)) on attempt \(attempt)")
                        await MainActor.run {
                            self.availableSubtitleTracks = tracks
                        }
                        // Only switch if no subtitle is currently active to avoid stutter
                        let currentSid = self.mpvWrapper.getCurrentSubtitleTrack()
                        if currentSid == 0 {
                            _ = self.selectEnglishDefaults()
                        } else {
                            print("ℹ️ Embedded subs found but current sid=\(currentSid), not switching to avoid stutter")
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

        // Load subtitles immediately if they're already downloaded (local paths)
        // Otherwise download them in background
        let areSubtitlesLocal = effectiveSubtitles.allSatisfy { $0.url.starts(with: "/") }

        if areSubtitlesLocal && !effectiveSubtitles.isEmpty {
            NSLog("✅ Subtitles already downloaded, loading immediately...")
            // Load them right away (no delay needed)
            Task {
                for (index, subtitle) in effectiveSubtitles.enumerated() {
                    NSLog("📝 Loading pre-downloaded subtitle %d (%@): %@", index + 1, subtitle.label, subtitle.url)
                    mpvWrapper.loadSubtitle(url: subtitle.url, title: subtitle.label)
                }

                // Wait briefly for subtitles to register, then select English
                try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
                selectEnglishDefaults()
            }
        } else if !effectiveSubtitles.isEmpty {
            // Subtitles need to be downloaded (fallback for older code paths)
            NSLog("⚠️ Subtitles not pre-downloaded, downloading in background...")
            Task.detached(priority: .background) {
                // Wait for video to establish playback first
                try? await Task.sleep(nanoseconds: 5_000_000_000) // 5 seconds - let playback stabilize

                // Download and load all subtitle files with their labels
                for (index, subtitle) in effectiveSubtitles.enumerated() {
                    NSLog("📝 RedLemon: Downloading subtitle %d (%@) from: %@", index + 1, subtitle.label, subtitle.url)

                    // Download subtitle file locally first
                    if let localPath = await self.downloadSubtitle(url: subtitle.url) {
                        NSLog("✅ RedLemon: Subtitle %d downloaded to: %@", index + 1, localPath)
                        self.mpvWrapper.loadSubtitle(url: localPath, title: subtitle.label)
                    } else {
                        NSLog("❌ RedLemon: Failed to download subtitle %d", index + 1)
                    }
                }

                // Wait for all subtitles to load, then select first English one
                if !subtitles.isEmpty {
                    try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second

                    // Try to select English subtitle multiple times
                    for attempt in 1...3 {
                        print("🔄 Attempt \(attempt) to select subtitle track...")
                        let hadSubtitles = await self.selectEnglishDefaults()
                        if hadSubtitles {
                            break // Success, stop trying
                        }
                        try? await Task.sleep(nanoseconds: 2_000_000_000) // Wait 2s between attempts
                    }
                }
            }
        }

        // Monitor MPV state changes
        Task {
            for await _ in mpvWrapper.$isPlaying.values {
                if mpvWrapper.isPlaying && self.isLoading {
                    // Video started playing - hide poster
                    self.onVideoReady()
                }
                self.isPlaying = mpvWrapper.isPlaying
            }
        }

        Task {
            for await time in mpvWrapper.$currentTime.values {
                self.currentTime = time
            }
        }

        Task {
            for await dur in mpvWrapper.$duration.values {
                self.duration = dur
            }
        }
    }

    // MARK: - Metadata Fetching

    private func fetchMetadata(imdbId: String) async {
        guard let url = Config.metadataMovieURL(imdbId: imdbId) else {
            print("❌ Invalid metadata URL")
            return
        }

        print("📡 Fetching metadata for \(imdbId)...")

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(CinemetaMetadataResponse.self, from: data)
            let metadata = response.meta

            // Prefer background (widescreen) over poster
            if let background = metadata.background {
                self.backgroundURL = upgradeToHD(background)
                print("✅ Got background: \(background.prefix(60))...")
            } else if let poster = metadata.poster {
                self.backgroundURL = upgradeToHD(poster)
                print("✅ Got poster as background: \(poster.prefix(60))...")
            }

            // Set poster URL for player UI
            if let poster = metadata.poster {
                self.posterURL = upgradeToHD(poster)
                print("✅ Got poster URL: \(poster.prefix(60))...")
            }

            // Get logo for loading screen
            if let logo = metadata.logo {
                self.logoURL = upgradeToHD(logo)
                print("✅ Got logo: \(logo.prefix(60))...")
            }

            self.title = metadata.name

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
        print("✅ Video ready - hiding poster")

        // Fade out poster when video is ready
        withAnimation(.easeOut(duration: 0.5)) {
            self.showPoster = false
            self.isLoading = false
        }

        // Check if we should resume from a specific timestamp
        if let resumeTime = appState?.resumeFromTimestamp, resumeTime > 0 {
            print("🔄 Resuming playback from \(Int(resumeTime))s (appState.resumeFromTimestamp = \(appState?.resumeFromTimestamp ?? 0))")

            // Check if we're in watch party mode and set flag accordingly
            if isInWatchParty {
                isResumingInWatchParty = true
                print("🎉 Watch party resume: Jumping to saved position")
            }

            // For resume mode: pause immediately then seek
            print("⏸️ Pausing immediately for resume...")
            mpvWrapper.pause()

            // Then seek immediately after brief pause
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                self?.attemptImmediateResume(resumeTime: resumeTime)
            }
        } else {
            print("ℹ️ No resume timestamp set (starting from beginning)")

            // For normal playback, set isPlaying to true since video started
            self.isPlaying = true
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
                print("⚠️ Resume time (\(Int(resumeTime))s) exceeds video duration (\(Int(self.duration))s), starting from beginning")
                self.appState?.resumeFromTimestamp = nil
                self.isPlaying = true  // Start playing normally
                return
            }

            // Execute seek immediately
            print("🎯 Executing immediate seek to \(Int(resumeTime))s...")
            self.mpvWrapper.seek(to: resumeTime)

            // Verify seek was successful after a brief delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let actualTime = self.currentTime
                let timeDifference = abs(actualTime - resumeTime)
                let tolerance: Double = resumeTime > 300 ? 5.0 : 2.0  // Smaller tolerance since we're seeking immediately

                if timeDifference <= tolerance {
                    print("✅ Immediate resume successful: Seeked to \(Int(actualTime))s (target: \(Int(resumeTime))s, diff: \(String(format: "%.1f", timeDifference))s)")

                    // Clear resume timestamp and reset watch party resume flag after successful seek
                    self.appState?.resumeFromTimestamp = nil
                    self.isResumingInWatchParty = false
                    self.mpvWrapper.play()  // Explicitly start playback after successful seek
                    print("🧹 Cleared resumeFromTimestamp after successful immediate resume")
                    print("🧹 Reset isResumingInWatchParty after successful immediate resume")
                } else {
                    print("⚠️ Immediate seek inaccurate: Current time \(Int(actualTime))s, target \(Int(resumeTime))s, diff \(String(format: "%.1f", timeDifference))s, retrying...")

                    // Retry with fallback logic
                    self.fallbackResume(resumeTime: resumeTime)
                }
            }
        }
    }

    /// Fallback resume with progressive delays if immediate seek fails
    private func fallbackResume(resumeTime: Double) {
        print("🔄 FALLBACK RESUME: Using progressive delays for \(Int(resumeTime))s")

        var retryCount = 0
        let maxRetries = 5  // Reduced from 8 since we tried immediate first
        let baseDelay: TimeInterval = 1.0  // Much shorter initial delays
        let maxDelay: TimeInterval = 5.0  // Much shorter max delay

        func attemptSeek() {
            guard retryCount < maxRetries else {
                print("❌ Failed to resume after fallback attempts, starting from beginning")
                // Clear resume timestamp after all retries fail
                appState?.resumeFromTimestamp = nil
                self.isPlaying = true  // Start playing normally
                return
            }

            retryCount += 1
            // Use much shorter progressive delays: 1s, 2s, 3s, 5s, 5s
            let delay = retryCount <= 2 ? baseDelay * Double(retryCount) : maxDelay

            print("⏩ Fallback attempt \(retryCount)/\(maxRetries): Seeking to \(Int(resumeTime))s after \(delay)s delay...")

            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                guard let self = self else { return }

                // Enhanced validation before seeking
                guard self.duration > 0 else {
                    print("⚠️ Video duration not available yet (\(self.duration)s), retrying...")
                    attemptSeek()
                    return
                }

                guard resumeTime < self.duration else {
                    print("⚠️ Resume time (\(Int(resumeTime))s) exceeds video duration (\(Int(self.duration))s), starting from beginning")
                    self.appState?.resumeFromTimestamp = nil
                    return
                }

                // Attempt seek
                print("🎯 Executing fallback seek to \(Int(resumeTime))s...")
                self.mpvWrapper.seek(to: resumeTime)

                // Verify seek was successful after a brief delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let actualTime = self.currentTime
                    let timeDifference = abs(actualTime - resumeTime)
                    let tolerance: Double = resumeTime > 300 ? 5.0 : 2.0

                    if timeDifference <= tolerance {
                        print("✅ Fallback resume successful: Seeked to \(Int(actualTime))s (target: \(Int(resumeTime))s, diff: \(String(format: "%.1f", timeDifference))s)")

                        // Clear resume timestamp and reset watch party resume flag after successful seek
                        self.appState?.resumeFromTimestamp = nil
                        self.isResumingInWatchParty = false
                        self.mpvWrapper.play()  // Explicitly start playback after successful seek
                        print("🧹 Cleared resumeFromTimestamp after successful fallback resume")
                        print("🧹 Reset isResumingInWatchParty after successful fallback resume")
                    } else {
                        print("⚠️ Fallback seek inaccurate: Current time \(Int(actualTime))s, target \(Int(resumeTime))s, diff \(String(format: "%.1f", timeDifference))s, retrying...")
                        // Retry if seek was not accurate enough
                        attemptSeek()
                    }
                }
            }
        }

        attemptSeek()
    }


    func togglePlayPause() {
        mpvWrapper.togglePlayPause()
        let isNowPlaying = mpvWrapper.isPlaying
        print(isNowPlaying ? "▶️ Playing" : "⏸️ Paused")

        // Mark that we initiated this action (ignore echo from remote)
        markLocalAction()

        // Send explicit sync message if host in watch party
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
        mpvWrapper.setSubtitleTrack(trackId)
        updateSubtitleTracks()

        if let track = currentSubtitleTrack {
            print("📝 Selected subtitle track: \(track.displayName)")
        } else {
            print("🔇 Subtitles disabled")
        }
    }

    /// Analyze subtitle compatibility and suggest improvements
    func analyzeSubtitleCompatibility() {
        guard !subtitles.isEmpty else { return }

        print("🔍 Analyzing subtitle compatibility...")

        // Check for version mismatches between video and subtitles
        let videoIsBluRay = streamTitle.lowercased().contains("bluray") || streamTitle.lowercased().contains("bd")
        let videoIsWEBDL = streamTitle.lowercased().contains("web-dl") || streamTitle.lowercased().contains("webdl")

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
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            showChat.toggle()
        }
        print(showChat ? "💬 Chat opened" : "💬 Chat closed")
    }

    func sendMessage(_ text: String) {
        guard !text.isEmpty else { return }
        guard let roomId = currentRoomId else {
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
        print("💬 Sent: \(text)")

        // Save to Supabase database (primary method)
        Task {
            do {
                try await SupabaseClient.shared.sendChatMessage(
                    roomId: roomId,
                    userId: userId,
                    username: username,
                    message: text
                )
                NSLog("✅ Chat message saved to database")
            } catch {
                NSLog("❌ Failed to save chat message: \(error)")
            }
        }

        // Also send via WebRTC for low-latency (backup method)
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
        activeTimers.forEach { $0.invalidate() }
        activeTimers.removeAll()
        print("🗑️ Invalidated all active timers")
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

        // Stop all timers first to prevent any more sync messages
        invalidateAllTimers()

        // Disconnect realtime if in watch party - AWAIT to ensure it completes
        if isInWatchParty {
            print("🔌 Disconnecting realtime manager...")
            await realtimeManager?.disconnect()
            print("✅ Realtime manager disconnected")
        }

        // Just stop playback - layer will handle OpenGL cleanup
        mpvWrapper.stop()
    }

    deinit {
        print("🗑️ MPVPlayerViewModel deinit")
        // Stop playback synchronously - it's safe since we're just sending a command
        mpvWrapper.stop()
    }

    // MARK: - Subtitle Download

    private func downloadSubtitle(url: String) async -> String? {
        guard let subtitleURL = URL(string: url) else {
            NSLog("❌ RedLemon: Invalid subtitle URL")
            return nil
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: subtitleURL)

            // Check if it's a ZIP archive
            let contentType = (response as? HTTPURLResponse)?.value(forHTTPHeaderField: "Content-Type") ?? ""
            NSLog("🔍 Content-Type: %@", contentType)
            NSLog("🔍 URL: %@", url)
            NSLog("🔍 URL ends with .zip: %@", url.lowercased().hasSuffix(".zip") ? "YES" : "NO")
            let isZip = contentType.contains("zip") || contentType.contains("octet-stream") || url.lowercased().hasSuffix(".zip")
            NSLog("🔍 isZip = %@", isZip ? "YES" : "NO")

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

    private func extractSRTFromZip(data: Data) throws -> String {
        // Use libz to extract (7z format uses zlib internally)
        // First, try to find .srt file in the archive

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

    private func convertSRTToVTT(srt: String) -> String {
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

        // Get user ID from appState
        guard let userId = appState?.currentUserId?.uuidString else {
            throw RealtimeError.notInitialized
        }
        self.currentUserId = userId

        // Initialize Realtime manager
        self.realtimeManager = RealtimeChannelManager(realtimeClient: RedLemon.SupabaseClient.shared.realtimeClient)

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

        try await realtimeManager?.setup(
            roomId: roomId,
            isHost: isHost,
            userId: userId,
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
        guard !isWatchPartyHost else {
            // Host doesn't respond to sync messages (host is authoritative)
            return
        }

        // Syncplay-inspired: Ignore remote updates if we just made a local action
        if shouldIgnoreRemoteUpdate() {
            return
        }

        switch message.type {
        case .playbackState:
            // Guest syncs to host's playback state
            let timestamp = message.timestamp
            guard let isPlaying = message.isPlaying else { return }

            // Calculate drift
            let drift = currentTime - timestamp
            let absDrift = abs(drift)

            // Syncplay-inspired tiered sync approach
            if absDrift < 0.05 {
                // Perfect sync (<50ms), do nothing
                print("✅ Perfect sync: \(Int(absDrift * 1000))ms drift")
            } else if absDrift < 0.5 {
                // Small drift (50-500ms) - use subtle speed adjustment (Syncplay method)
                // Gradually catch up with 1-5% speed change
                if absDrift > 0.1 {
                    let speedFactor = drift > 0 ? 0.98 : 1.02  // Slow down or speed up
                    mpvWrapper.setSpeed(speedFactor)
                    print("⚡ Subtle speed sync: \(speedFactor)x to fix \(Int(absDrift * 1000))ms drift")

                    // Reset speed after 1 second
                    Task {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        await MainActor.run {
                            mpvWrapper.setSpeed(1.0)
                        }
                    }
                }
            } else if absDrift < 2.0 {
                // Medium drift (500ms-2s) - soft seek
                print("🔄 Medium drift (\(String(format: "%.1f", absDrift))s) - seeking to sync")
                seek(to: timestamp)
            } else {
                // Large drift (>2s) - hard seek and sync play state
                print("⚠️ Large drift (\(String(format: "%.1f", absDrift))s) - hard resync")
                seek(to: timestamp)
                if isPlaying && !mpvWrapper.isPlaying {
                    togglePlayPause()
                } else if !isPlaying && mpvWrapper.isPlaying {
                    togglePlayPause()
                }
            }

        case .play:
            print("▶️ Host pressed play")
            if !mpvWrapper.isPlaying {
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
            if let text = message.chatText, let username = message.chatUsername {
                let chatMessage = ChatMessage(
                    id: UUID().uuidString,
                    username: username,
                    text: text,
                    timestamp: Date(timeIntervalSince1970: message.timestamp)
                )
                await MainActor.run {
                    messages.append(chatMessage)
                }
                print("💬 Received chat from \(username): \(text)")
            }

        case .ping, .pong:
            // Handled by RealtimeChannelManager
            break
        }
    }

    /// Start broadcasting playback state (host only)
    private func startBroadcastingState() {
        guard isWatchPartyHost else { return }

        // Cancel any existing timer
        syncBroadcastTimer?.invalidate()

        // Broadcast state every 100ms (10 Hz)
        syncBroadcastTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

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
        isResumingInWatchParty = false  // Reset the resume flag when leaving watch party

        // Hide chat when leaving watch party
        showChat = false

        // Add farewell message
        messages.append(ChatMessage(
            id: UUID().uuidString,
            username: "System",
            text: "👋 Left watch party",
            timestamp: Date()
        ))

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
