//
//  MPVPlayerView.swift
//  RedLemon
//
//  Main player view with background art during loading
//  Based on ColorFruit prime-player design
//

import SwiftUI
import AppKit

// MARK: - Key Event Handler

struct KeyEventHandler: NSViewRepresentable {
    let onKeyPress: (NSEvent) -> Bool

    func makeNSView(context: Context) -> NSView {
        let view = KeyCaptureView()
        view.keyPressHandler = onKeyPress
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

class KeyCaptureView: NSView {
    var keyPressHandler: ((NSEvent) -> Bool)?

    override var acceptsFirstResponder: Bool { true }

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        // Become first responder when added to window
        if let window = window {
            window.makeFirstResponder(self)

            // Critical: Ensure window comes to front and becomes key
            Task { @MainActor in
                NSApp.activate(ignoringOtherApps: true)
                window.makeKeyAndOrderFront(nil)
            }
        }
    }

    override func keyDown(with event: NSEvent) {
        if let handler = keyPressHandler, handler(event) {
            return // Event handled
        }
        super.keyDown(with: event)
    }

    override func flagsChanged(with event: NSEvent) {
        if let handler = keyPressHandler, handler(event) {
            return // Event handled
        }
        super.flagsChanged(with: event)
    }
}

// MARK: - Player View

struct MPVPlayerView: View {
    @StateObject private var viewModel = MPVPlayerViewModel(mpvWrapper: MPVWrapper())
    @EnvironmentObject var appState: AppState
    // Needed for DM indicator
    @EnvironmentObject var socialService: SocialService

    // Mouse tracking for UI elements
    @State private var mouseLocation: CGPoint = .zero
    @State private var showControls = false
    @State private var controlsTimer: Timer?
    @State private var showChatButton = false
    @State private var chatButtonTimer: Timer?
    @State private var showExitButton = false
    @State private var exitButtonTimer: Timer?
    @State private var localKeyMonitor: Any?
    @State private var cursorHideTimer: Timer?
    @State private var eventAutoExitTimer: Timer?

    // Track consecutive detections of MPV stopped state (position=0, duration=0, paused)
    // This prevents false positives at app startup while detecting EOF after ERROR_HANDLER ignores it
    @State private var stoppedStateDetectionCount: Int? = nil
    @State private var lastSignificantMouseLocation: CGPoint = .zero // NEW: Filter jitter

    // Track selection menus
    @State private var showAudioMenu = false
    @State private var showSubtitleMenu = false
    @State private var showPlaylistMenu = false
    @State private var showEventListMenu = false

    @State private var showReportSheet = false
    @State private var showStreamInfoSheet = false
    @State private var volume: Double = 1.0
    @State private var subtitleMenuExpanded = false

    // Stream info (passed from ContentView)
    let streamURL: String
    let imdbId: String
    let streamTitle: String
    let subtitles: [(url: String, label: String)]
    let streamQuality: String
    let sourceQuality: String
    let isSeries: Bool
    let streamHash: String?
    let season: Int? // NEW: Explicitly track season
    let episode: Int? // NEW: Explicitly track episode
    var onPlaybackFinished: (() -> Void)? = nil

    init(streamURL: String, imdbId: String, streamTitle: String, subtitles: [(url: String, label: String)], streamQuality: String = "", sourceQuality: String = "", isSeries: Bool = false, streamHash: String? = nil, season: Int? = nil, episode: Int? = nil, onPlaybackFinished: (() -> Void)? = nil) {
        self.streamURL = streamURL
        self.imdbId = imdbId
        self.streamTitle = streamTitle
        self.subtitles = subtitles
        self.streamQuality = streamQuality
        self.sourceQuality = sourceQuality
        self.isSeries = isSeries
        self.streamHash = streamHash
        self.season = season
        self.episode = episode
        self.onPlaybackFinished = onPlaybackFinished
        LoggingManager.shared.debug(.videoRendering, message: "MPVPlayerView INIT called - streamURL: \(String(streamURL.prefix(60))), subtitles: \(subtitles.count)")
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                // Video container (scales based on chat state)
                ZStack {
                    // Background layer (always black)
                    Color.black

                    // Poster/Background art (during loading or buffering or waiting for guests)
                    if (viewModel.showPoster || viewModel.isLoading || viewModel.showWaitingForGuests) {
                        let backgroundURL = viewModel.backgroundURL ?? viewModel.posterURL ?? ""
                        Group {
                            if !backgroundURL.isEmpty {
                                AsyncImage(url: URL(string: backgroundURL)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .clipped()
                                            .transition(.opacity)
                                            .id(backgroundURL)
                                    case .failure:
                                        placeholderBackground
                                    case .empty:
                                        placeholderBackground
                                    @unknown default:
                                        placeholderBackground
                                    }
                                }
                            } else {
                                placeholderBackground
                            }
                        }
                        .opacity((viewModel.showPoster || viewModel.isLoading || viewModel.showWaitingForGuests) ? 1.0 : 0.0)
                        .animation(.easeOut(duration: 0.5), value: (viewModel.showPoster || viewModel.isLoading || viewModel.showWaitingForGuests))
                    }

                    // MPV video output - IINA-style CAOpenGLLayer
                    MPVLayerVideoView(wrapper: viewModel.mpvWrapper)
                        .opacity((viewModel.isLoading || viewModel.showPoster || viewModel.showWaitingForGuests) ? 0 : (viewModel.isExitingSession || viewModel.isExitingToLobby ? 0.4 : 1))
                        .blur(radius: viewModel.isExitingSession || viewModel.isExitingToLobby ? 20 : 0)
                        .scaleEffect(viewModel.isExitingSession || viewModel.isExitingToLobby ? 1.05 : 1)
                        .animation(.easeInOut(duration: 0.5), value: (viewModel.isLoading || viewModel.showPoster || viewModel.showWaitingForGuests))
                        .animation(.easeInOut(duration: 0.4), value: viewModel.isExitingSession || viewModel.isExitingToLobby)
                        .contentShape(Rectangle()) // Capture all clicks in this area
                        .onTapGesture {
                            // Swallow clicks to prevent falling through to sidebar
                            // Double-click to toggle fullscreen could go here
                        }

                    // Overlays (Loading, Waiting, Logo)
                    overlays

                    ReactionOverlayView(viewModel: viewModel)
                        .zIndex(200) // Below controls (99) but above video

                    // Exit Room button (top-left, appears independently)
                    if showExitButton {
                        VStack {
                            HStack {
                                ExitButton(viewModel: viewModel)
                                Spacer()
                            }
                            Spacer()
                        }
                        .zIndex(100)
                    }

                    // Subtle Guest Notifications (Top-right, ONLY when chat is closed)
                    if !viewModel.showChat {
                        VStack {
                            HStack {
                                Spacer()
                                GuestNotificationOverlay(viewModel: viewModel)
                            }
                            Spacer()
                        }
                        .zIndex(201) // Above ReactionOverlay (200)
                    }

                    // Player controls (bottom bar)
                    if showControls {
                        PlayerControlsView(
                            viewModel: viewModel,
                            streamQuality: streamQuality,
                            sourceQuality: sourceQuality,
                            showSubtitleMenu: $showSubtitleMenu,
                            showAudioMenu: $showAudioMenu,
                            showPlaylistMenu: $showPlaylistMenu,
                            showEventListMenu: $showEventListMenu,

                            showReportSheet: $showReportSheet,
                            showStreamInfoSheet: $showStreamInfoSheet,
                            showControls: showControls
                        )
                        .zIndex(99)
                    }

                    // Extracted menus (Shields, Subtitles, Playlist, Chat Toggle)
                    menus
            }
            .frame(width: viewModel.showChat ? geometry.size.width * 0.8 : geometry.size.width,
                   height: geometry.size.height,
                   alignment: .center)
            .clipped() // Fix: Ensure content doesn't overflow when chat is open

            // Chat overlay (Pop in/out)
            if viewModel.showChat {
                // Determine initial mode based on context/persistence to prevent flash
                let initialMode: ChatOverlayView.ChatMode = {
                    if let saved = viewModel.lastActiveChatMode {
                        switch saved {
                        case .event: if appState.isEventPlayback { return .event }
                        case .room: if viewModel.isInWatchParty { return .room }
                        default: return saved
                        }
                    }

                    if appState.isEventPlayback { return .event }
                    if viewModel.isInWatchParty { return .room }
                    return .friends
                }()

                ChatOverlayView(viewModel: viewModel, initialChatMode: initialMode)
                    .frame(width: geometry.size.width * 0.2)
                    .zIndex(100)
            }
        }
        .onChange(of: showReportSheet) { isOpen in
            if isOpen {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: showPlaylistMenu) { isOpen in
            if isOpen {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: showAudioMenu) { isOpen in
            if isOpen {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: showSubtitleMenu) { isOpen in
            if isOpen {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: viewModel.showChat) { isOpen in
            // Only unhide cursor if not toggled via keyboard (Command key)
            // This prevents the cursor from flashing when using the shortcut
            let isCommandPressed = NSEvent.modifierFlags.contains(.command)

            if isOpen && !isCommandPressed {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            } else if isOpen && isCommandPressed {
                 // Even if command pressed, verify if mouse is actually still (avoid hiding if user moved mouse)
                 // But default behavior is to keep it hidden or let existing timer handle it
            }
        }
        .onChange(of: viewModel.activeChatMenuTarget) { target in
            if target != nil {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: viewModel.showNextEpisodePrompt) { show in
            if show {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: viewModel.showWaitingForGuests) { show in
            if show {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: viewModel.showParticipantList) { show in
            if show {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: viewModel.showSettings) { show in
            if show {
                NSCursor.unhide()
                cursorHideTimer?.invalidate()
            }
        }
        .onChange(of: geometry.size) { newSize in
             // Throttle logging to avoid spam
             if Int.random(in: 0...50) == 0 {
                 LoggingManager.shared.debug(.videoRendering, message: "MPVPlayerView Layout: Geometry Size = \(newSize)")
             }
        }
        .background(MouseTrackingView { location in
                mouseLocation = location

                // Show cursor when significant mouse movement is detected
                let distance = sqrt(pow(location.x - lastSignificantMouseLocation.x, 2) + pow(location.y - lastSignificantMouseLocation.y, 2))
                if distance > 2 {
                    NSCursor.unhide()
                    lastSignificantMouseLocation = location
                }

                // Reset cursor hide timer
                cursorHideTimer?.invalidate()
                cursorHideTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [mouseLocation] _ in
                    // Don't hide cursor if any modal/overlay is open or if mouse is in chat area
                    let windowWidth = NSApplication.shared.keyWindow?.frame.width ?? 1
                    let chatThreshold = windowWidth * 0.8
                    let isMouseInChat = viewModel.showChat && mouseLocation.x > chatThreshold

                    let isAnyMenuOpen = showReportSheet || showPlaylistMenu || showAudioMenu || showSubtitleMenu ||
                                       showStreamInfoSheet || showEventListMenu ||
                                       viewModel.activeChatMenuTarget != nil ||
                                       viewModel.showNextEpisodePrompt || viewModel.showWaitingForGuests || viewModel.showSubtitleSyncPanel ||
                                       viewModel.showParticipantList || viewModel.showSettings

                    if !isAnyMenuOpen && !isMouseInChat {
                        NSCursor.hide()
                    }
                }

                if let window = NSApplication.shared.keyWindow {
                    let windowHeight = window.frame.height
                    let windowWidth = window.frame.width
                    let bottomThreshold = windowHeight * 0.25
                    let rightThreshold = windowWidth * 0.75
                    let topThreshold = windowHeight * 0.75  // Top 25% (y coordinates are inverted)
                    let leftThreshold = windowWidth * 0.25  // Left 25%

                    // Debug: Log mouse position occasionally
                    if Int.random(in: 0...100) == 0 {
                        LoggingManager.shared.debug(.general, message: "Mouse: x=\(Int(location.x))/\(Int(windowWidth)) y=\(Int(location.y))/\(Int(windowHeight)) | Exit: \(showExitButton) Controls: \(showControls) Chat: \(showChatButton)")
                    }

                    // Show controls when mouse is in bottom 25% of screen
                    // 🚫 Fix: Ignore if mouse is in the chat area (Right 20%) when chat is open
                    let chatThreshold = windowWidth * 0.8
                    let isMouseInChat = viewModel.showChat && location.x > chatThreshold

                    if location.y <= bottomThreshold && location != .zero && !isMouseInChat {
                        showControls = true

                        // Keep controls visible briefly after hover
                        showControlsTemporarily()
                    }

                    // Show chat button when mouse is in right 25% of screen (independent of controls)
                    // Only in watch party mode
                    if location.x >= rightThreshold {
                        showChatButton = true

                        // Reset chat button timer
                        chatButtonTimer?.invalidate()
                        chatButtonTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                            withAnimation(.easeInOut(duration: 0.1)) {
                                showChatButton = false
                            }
                        }
                    }

                    // Show exit button when mouse is in top-left corner (independent)
                    if location.y >= topThreshold && location.x <= leftThreshold {
                        LoggingManager.shared.debug(.general, message: "Exit button triggered! x=\(Int(location.x)) <= \(Int(leftThreshold)), y=\(Int(location.y)) >= \(Int(topThreshold))")
                        showExitButton = true

                        // Reset exit button timer
                        exitButtonTimer?.invalidate()
                        exitButtonTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                            withAnimation(.easeInOut(duration: 0.1)) {
                                showExitButton = false
                            }
                        }
                    }
                }
            })
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        // Ensure the view can accept valid key events (fixes focus issue on start)
        .background(KeyEventHandler { _ in false })
        .onAppear {
            // Set appState reference for watch history tracking
            viewModel.appState = appState

            // Hide cursor immediately and again after layout settles
            NSCursor.hide()
            cursorHideTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                NSCursor.hide()
            }
            // Third attempt for robustness
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                NSCursor.hide()
            }

            // Start auto-exit timer for event movies
            if appState.player.isEventPlayback {
                LoggingManager.shared.info(.videoRendering, message: "Event playback detected - starting auto-exit monitor")
                eventAutoExitTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    checkEventMovieFinished()
                }
            }

            // Install local event monitor to capture keyboard events even when text field is focused
            localKeyMonitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .flagsChanged]) { event in
                // Command key pressed: toggle chat (only in watch party mode)
                if event.type == .flagsChanged && event.modifierFlags.contains(.command) {
                    viewModel.toggleChat()
                    return nil // Consume event
                }

                // SPACEBAR: Toggle playback (solo, events, rooms)
                // keyCode 49 = Spacebar
                if event.type == .keyDown && event.keyCode == 49 {
                    // Ignore if currently typing in an editable field
                    if let firstResponder = NSApp.keyWindow?.firstResponder {
                        if firstResponder is NSTextView || firstResponder is NSTextField {
                            return event // Pass through to text field
                        }
                    }

                    // 1. Block for all Events (System Hosted)
                    if appState.player.isEventPlayback {
                        LoggingManager.shared.debug(.videoRendering, message: "Ignored Spacebar (Event Playback Restricted)")
                        return nil // Consume event silently
                    }

                    // 2. Block for Watch Party Guests (Host Only)
                    if appState.player.currentWatchMode == .watchParty && !appState.player.isWatchPartyHost {
                        LoggingManager.shared.debug(.videoRendering, message: "Ignored Spacebar (Guest Restricted)")
                        return nil // Consume event silently
                    }

                    viewModel.togglePlayPause()
                    return nil // Consume event
                }

                return event // Pass through if not handled
            }


            // FORCE FOCUS: Ensure player window becomes Key immediately
            // This fixes the issue where user has to click to see UI
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s
                NSApp.activate(ignoringOtherApps: true)
                NSApp.windows.first { $0.isVisible }?.makeKeyAndOrderFront(nil)
            }
        }
        .task {
            LoggingManager.shared.debug(.videoRendering, message: "MPVPlayerView .task starting")

            // CRITICAL FIX: Inject appState immediately to ensure ViewModel has access to global state
            // Must be done BEFORE startWatchPartySync to allow inheriting the active lobby session.
            viewModel.appState = appState

            // CRITICAL: Start watch party sync BEFORE loading stream
            // This ensures isInWatchParty is set when video loads, activating the ready gate
            if appState.player.currentWatchMode == .watchParty, let roomId = appState.player.currentRoomId {
                LoggingManager.shared.info(.watchParty, message: "Starting watch party sync - Room: \(roomId), Host: \(appState.player.isWatchPartyHost)")

                do {
                    try await viewModel.startWatchPartySync(roomId: roomId, isHost: appState.player.isWatchPartyHost)
                    LoggingManager.shared.info(.watchParty, message: "Watch party sync started successfully - isInWatchParty is now TRUE")
                } catch {
                    LoggingManager.shared.error(.watchParty, message: "Failed to start watch party sync: \(error.localizedDescription)")
                }
            }

            // Now load stream with watch party mode properly set
            LoggingManager.shared.debug(.videoRendering, message: "About to call loadStream - isInWatchParty: \(viewModel.isInWatchParty)")
            LoggingManager.shared.debug(.subtitles, message: "Subtitles count: \(subtitles.count)")
            await viewModel.loadStream(
                streamURL: streamURL,
                imdbId: imdbId,
                streamTitle: streamTitle,
                subtitles: subtitles,
                isSeries: isSeries,
                isEvent: appState.player.isEventPlayback,
                streamHash: streamHash,
                quality: streamQuality.isEmpty ? nil : streamQuality,
                sourceQuality: sourceQuality.isEmpty ? nil : sourceQuality,
                season: self.season,
                episode: self.episode
            )

            LoggingManager.shared.debug(.videoRendering, message: "MPVPlayerView .task completed")
        }
        .onChange(of: viewModel.isLoading) { isLoading in
            if !isLoading {
                // Focus when loading finishes (playback starts)
                Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s
                    NSApp.activate(ignoringOtherApps: true)
                    NSApp.windows.first { $0.isVisible }?.makeKeyAndOrderFront(nil)
                }
            }
        }
        .onChange(of: viewModel.playbackFinished) { finished in
            LoggingManager.shared.debug(.videoRendering, message: "MPVPlayerView: onChange triggered - playbackFinished = \(finished)")
            if finished {
                // CRITICAL FIX: Ignore finish event if we are explicitly cleaning up (e.g. User Exit)
                // This prevents "Host Exiting" from triggering "Movie Finished" logic which sends everyone to lobby.
                if viewModel.hasCleanedUp || viewModel.isExitingSession || viewModel.isExitingToLobby {
                    LoggingManager.shared.info(.videoRendering, message: "MPVPlayerView: Ignoring playbackFinished (Cleanup/Exit in progress)")
                    return
                }
                // Pre-exit stabilization: Show closing overlay based on mode
                let isWatchParty = appState.player.currentWatchMode == .watchParty
                let isEvent = appState.player.isEventPlayback

                if isWatchParty && !isEvent {
                    viewModel.isExitingToLobby = true
                } else {
                    viewModel.isExitingSession = true
                }

                LoggingManager.shared.info(.videoRendering, message: "MPVPlayerView: Playback finished, triggering callback")
                onPlaybackFinished?()
            }
        }
        .onReceive(viewModel.playbackErrorTrigger) { error in
             LoggingManager.shared.error(.videoRendering, message: "Playback error detected: \(error). Triggering fallback...")
             Task {
                  // Attempt to play the next stream in the queue (or retry current if transient)
                  // This will handle the UI state update (loading -> new stream OR error)
                  await appState.player.handlePlaybackError(error)
              }
        }
        .onDisappear {
            // Stop watch history tracking
            viewModel.stopWatchHistorySaving()

            // Stop playback when view disappears - use Task for async
            Task {
                let isWatchParty = appState.player.currentWatchMode == .watchParty
                await viewModel.cleanup(returningToLobby: isWatchParty, reason: "VIEW_DISAPPEAR")
            }

            // ✅ Use centralized timer cleanup
            invalidateAllTimers()

            // Clean up event monitor
            if let monitor = localKeyMonitor {
                NSEvent.removeMonitor(monitor)
                localKeyMonitor = nil
            }

            // Show cursor when leaving player
            NSCursor.unhide()
        }
    }

    private func exitPlayer() async {
        await viewModel.cleanup(reason: "USER_EXIT_KEY")
        await appState.player.exitPlayer()
    }

    private func checkEventMovieFinished() {
        guard appState.player.isEventPlayback else { return }

        // DEBUG: Log auto-exit check
        NSLog("%@", "[AUTO_EXIT_CHECK] isEventPlayback: true")
        NSLog("%@", "[AUTO_EXIT_CHECK] isLoading: \(viewModel.isLoading), isResolvingStream: \(appState.player.isResolvingStream)")
        NSLog("%@", "[AUTO_EXIT_CHECK] playbackFinished: \(viewModel.playbackFinished), isPlaying: \(viewModel.isPlaying)")
        NSLog("%@", "[AUTO_EXIT_CHECK] Position: \(viewModel.currentTime)s / Duration: \(viewModel.duration)s")

        // CRITICAL FIX: Don't trigger auto-exit if we are already resolving a new stream or starting a transition
        // This prevents the Guest from being kicked back to the lobby when the host switches items (previous item EOF)
        guard !appState.player.isResolvingStream && !viewModel.isLoading else {
            NSLog("%@", "[AUTO_EXIT_CHECK] BLOCKED: isLoading=\(viewModel.isLoading) or isResolvingStream=\(appState.player.isResolvingStream)")
            return
        }

        let position = viewModel.currentTime
        let duration = viewModel.duration

        NSLog("%@", "[AUTO_EXIT_CHECK] Checking EOF conditions...")

        // Check if MPV reported EOF (most reliable)
        if viewModel.playbackFinished {
            LoggingManager.shared.info(.videoRendering, message: "Event movie finished detected (MPV EOF)!")
            LoggingManager.shared.debug(.videoRendering, message: "   Position: \(position)s / Duration: \(duration)s")
            LoggingManager.shared.info(.videoRendering, message: "   Auto-exiting player and returning to Events page...")

            // Stop the timer
            eventAutoExitTimer?.invalidate()
            eventAutoExitTimer = nil

            // Exit player and return to events
            Task {
                viewModel.isExitingSession = true
                await appState.player.handleMovieFinished()
            }
            return
        }

        // Fallback 1: Check if near end and paused (in case EOF wasn't detected)
        let isPaused = !viewModel.isPlaying
        if duration > 0 && position >= duration - 5 && isPaused {
            LoggingManager.shared.info(.videoRendering, message: "Event movie finished detected (time-based fallback)!")
            LoggingManager.shared.debug(.videoRendering, message: "   Position: \(position)s / Duration: \(duration)s")
            LoggingManager.shared.info(.videoRendering, message: "   Auto-exiting player and returning to Events page...")

            // Stop the timer
            eventAutoExitTimer?.invalidate()
            eventAutoExitTimer = nil

            // Exit player and return to events
            Task {
                viewModel.isExitingSession = true
                await appState.player.handleMovieFinished()
            }
            return
        }

        // CRITICAL FIX: Fallback 2 - Handle MPV stopped state after EOF
        // When MPV hits EOF and ERROR_HANDLER ignores it, MPV enters a "stopped" state where:
        // - currentTime = 0.0, duration = 0.0, playbackFinished = false, isPlaying = false
        // This is a terminal state that indicates the event has ended naturally
        // To prevent false positives at startup, we require duration to have been > 0 previously
        if position == 0.0 && duration == 0.0 && isPaused && !viewModel.playbackFinished {
            // Track consecutive detections of this state (prevents false positives)
            if stoppedStateDetectionCount == nil {
                stoppedStateDetectionCount = 0
            }
            stoppedStateDetectionCount! += 1

            // Require 3 consecutive detections (3 seconds) to confirm this is real EOF, not startup
            if stoppedStateDetectionCount! >= 3 {
                LoggingManager.shared.info(.videoRendering, message: "Event movie finished detected (MPV stopped state)!")
                LoggingManager.shared.debug(.videoRendering, message: "   Position: 0.0s, Duration: 0.0s, isPaused: \(isPaused)")
                LoggingManager.shared.debug(.videoRendering, message: "   Consecutive detections: \(stoppedStateDetectionCount!) - confirms event was playing")
                LoggingManager.shared.info(.videoRendering, message: "   Auto-exiting player and returning to Events page...")

                // Stop the timer
                eventAutoExitTimer?.invalidate()
                eventAutoExitTimer = nil

                // Exit player and return to events
                Task {
                    viewModel.isExitingSession = true
                    await appState.player.handleMovieFinished()
                }
                return
            }
        } else {
            // Reset counter if state changes
            stoppedStateDetectionCount = nil
        }

        NSLog("%@", "[AUTO_EXIT_CHECK] No exit condition met - continuing to monitor...")
    }

    // MARK: - Timer Management

    private func invalidateAllTimers() {
        LoggingManager.shared.debug(.videoRendering, message: "Invalidating all active timers")

        controlsTimer?.invalidate()
        controlsTimer = nil

        chatButtonTimer?.invalidate()
        chatButtonTimer = nil

        exitButtonTimer?.invalidate()
        exitButtonTimer = nil

        cursorHideTimer?.invalidate()
        cursorHideTimer = nil

        eventAutoExitTimer?.invalidate()
        eventAutoExitTimer = nil
    }

    private func showControlsTemporarily() {
        controlsTimer?.invalidate()
        controlsTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            withAnimation(.easeInOut(duration: 0.1)) {
                showControls = false
            }
        }
    }

    // MARK: - Subviews

    private var placeholderBackground: some View {
        Rectangle()
            .fill(LinearGradient(
                colors: [Color(white: 0.1), Color(white: 0.05)],
                startPoint: .top,
                endPoint: .bottom
            ))
    }



    @ViewBuilder
    private var overlays: some View {
        // Logo overlay (during loading)
        if viewModel.isLoading, let logoURL = viewModel.logoURL {
            HeroLogoView(logoURL: logoURL)
        }

        // Loading overlay
        if viewModel.isExitingToLobby {
            LoadingOverlay(streamTitle: "", message: "Returning to Lobby...")
        } else if viewModel.isExitingSession {
            LoadingOverlay(streamTitle: "", message: "Closing...")
        } else if viewModel.isLoading {
            let message: String = {
                if viewModel.isSwitchingTracks || viewModel.isSwitchingTracksRecently {
                    return "Syncing track..."
                }

                // Default message
                var msg = (viewModel.isBuffering && viewModel.mpvWrapper.isFileLoaded) ? "Buffering..." : "Loading stream..."

                // Watch Party Ready Gate Heuristic:
                // If we are in a watch party, file is loaded, NOT playing, and at the very beginning (time < 2s),
                // we are likely at the "Ready Gate" waiting for sync.
                let isAtReadyGate = viewModel.isInWatchParty &&
                                    viewModel.mpvWrapper.isFileLoaded &&
                                    !viewModel.isPlaying &&
                                    viewModel.currentTime < 2.0

                if isAtReadyGate {
                    msg = viewModel.isWatchPartyHost ? "Waiting for guests..." : "Waiting for host..."
                }

                return msg
            }()

            LoadingOverlay(streamTitle: viewModel.streamTitle, message: message)
                .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                .zIndex(140)
        }

        // Waiting for guests overlay (Post-Load Ready Gate)
        if viewModel.showWaitingForGuests {
             WaitingGateView(isHost: viewModel.isWatchPartyHost, streamTitle: viewModel.streamTitle)
                .zIndex(100)
        }

        // Next Episode Prompt
        if viewModel.showNextEpisodePrompt, let info = viewModel.nextEpisodeInfo {
            NextEpisodeOverlay(
                info: info,
                thumbnail: viewModel.nextEpisodeThumbnail,
                onExit: {
                    viewModel.cancelNextEpisodeAutoPlay()
                    Task {
                        await appState.player.exitPlayer(keepRoomState: false)
                    }
                },
                onPlay: {
                    viewModel.startNextEpisodeNow() // Sync hide and mark handled
                    Task {
                        await appState.player.playNextEpisode()
                    }
                }
            )
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .zIndex(150)
        }


    }











    private var fullSubtitleMenu: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Subtitle Configuration")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Text("Click outside to close")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            // SubDL Status Check & Searching Notification
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("SubDL Status:")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14))

                    if appState.isSearchingSubtitles {
                        HStack(spacing: 8) {
                            ProgressView()
                                .controlSize(.small)
                                .scaleEffect(0.6)

                            Text("Searching for subtitles...")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.blue)
                        }
                        .transition(.opacity)
                    }
                }

                Spacer()

                let subdlStatus = appState.providerHealth["subdl"] ?? "Unknown"
                let isChecking = appState.isCheckingProviders

                if isChecking {
                    ProgressView()
                        .controlSize(.small)
                        .scaleEffect(0.7)
                } else {
                    HStack(spacing: 6) {
                        Circle()
                            .fill(colorForStatus(subdlStatus))
                            .frame(width: 8, height: 8)

                        Text(subdlStatus)
                            .foregroundColor(colorForStatus(subdlStatus))
                            .font(.system(size: 11, weight: .semibold))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(4)

                    // Refresh button
                    Button(action: {
                        appState.checkProviderHealth()
                    }) {
                        Image(systemName: "arrow.clockwise")
                             .font(.system(size: 12))
                             .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Check Status")
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 4)


            // Current track info
            if let currentTrack = viewModel.currentSubtitleTrack {
                HStack {
                    Text("Currently Selected:")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14))

                    Text(currentTrack.displayName)
                        .foregroundColor(.primary)
                        .font(.system(size: 14, weight: .medium))
                        .lineLimit(1)

                    Spacer()
                }
                .padding(.horizontal, 24)
            }

            // Track selector with scrollable list
            if !viewModel.availableSubtitleTracks.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Select Subtitle Track:")
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .medium))

                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading, spacing: 6) {
                            // Available tracks (MPVWrapper already provides "Off" when needed)
                            ForEach(viewModel.availableSubtitleTracks, id: \.id) { track in
                                Button(action: {
                                    viewModel.selectSubtitleTrack(track.id)
                                }) {
                                    HStack {
                                        Text(track.displayName)
                                            .foregroundColor(.primary)
                                            .font(.system(size: 14, weight: .medium))
                                            .lineLimit(1)
                                        Spacer()
                                        if viewModel.currentSubtitleTrack?.id == track.id {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(viewModel.currentSubtitleTrack?.id == track.id ? Color.blue.opacity(0.15) : Color.primary.opacity(0.08))
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    .frame(height: 140)
                }
                .padding(.horizontal, 24)
            }

            // Timing controls
            VStack(spacing: 16) {
                // Offset control
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Timing Offset:")
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))

                        Spacer()

                        Text("\(String(format: "%.1f", viewModel.subtitleOffset))ms")
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .semibold))
                    }

                    HStack(spacing: 12) {
                        Button(action: {
                            viewModel.adjustSubtitleOffset(viewModel.subtitleOffset - 1000)
                        }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.primary)
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 36, height: 36)
                                .background(
                                    Circle()
                                        .fill(Color.primary.opacity(0.15))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            viewModel.adjustSubtitleOffset(viewModel.subtitleOffset - 100)
                        }) {
                            Text("-100ms")
                                .foregroundColor(.primary)
                                .font(.system(size: 14, weight: .medium))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.primary.opacity(0.15))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            viewModel.resetSubtitleTiming()
                        }) {
                            Text("Reset")
                                .foregroundColor(.primary)
                                .font(.system(size: 14, weight: .medium))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.primary.opacity(0.15))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            viewModel.adjustSubtitleOffset(viewModel.subtitleOffset + 100)
                        }) {
                            Text("+100ms")
                                .foregroundColor(.primary)
                                .font(.system(size: 14, weight: .medium))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.primary.opacity(0.15))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            viewModel.adjustSubtitleOffset(viewModel.subtitleOffset + 1000)
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.primary)
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 36, height: 36)
                                .background(
                                    Circle()
                                        .fill(Color.primary.opacity(0.15))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())

                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
            }
            .frame(width: 550, alignment: .leading)

            // Warning message if sync issues detected
            if viewModel.showSubtitleSyncPanel {
                HStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 18))

                    Text("Version mismatch detected between video and subtitles. Use timing controls to sync.")
                        .foregroundColor(.primary.opacity(0.9))
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(width: 502) // 550 - 48 (horizontal padding)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange.opacity(0.15))
                )
                .padding(.horizontal, 24)
            }
        }
        .frame(width: 550)
        .padding(.bottom, 24)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
    }

    @ViewBuilder
    private var streamInfoOverlay: some View {
        if showStreamInfoSheet {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    StreamInfoView(
                        streamTitle: viewModel.streamTitle,
                        url: viewModel.videoURL,
                        quality: streamQuality,
                        source: sourceQuality,
                        hash: viewModel.currentStreamHash ?? streamHash ?? "N/A",
                        isPresented: $showStreamInfoSheet
                    )
                    Spacer()
                }
                Spacer()
            }
            .transition(.opacity.combined(with: .scale))
            .zIndex(103)
        }
    }

    private var fullAudioMenu: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Audio Configuration")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Text("Click outside to close")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            // Current track info
            if let currentTrack = viewModel.currentAudioTrack {
                HStack {
                    Text("Currently Selected:")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14))

                    Text(currentTrack.displayName)
                        .foregroundColor(.primary)
                        .font(.system(size: 14, weight: .medium))
                        .lineLimit(1)

                    Spacer()
                }
                .padding(.horizontal, 24)
            }

            // Track selector with scrollable list
            if !viewModel.availableAudioTracks.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Select Audio Track:")
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .medium))

                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(viewModel.availableAudioTracks, id: \.id) { track in
                                Button(action: {
                                    viewModel.setAudioTrack(track)
                                    // Optional: Close menu on selection? User might want to verify.
                                    // withAnimation { showAudioMenu = false }
                                }) {
                                    HStack {
                                        Text(track.displayName)
                                            .foregroundColor(.primary)
                                            .font(.system(size: 14, weight: .medium))
                                            .lineLimit(1)
                                        Spacer()
                                        if viewModel.currentAudioTrack?.id == track.id {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(viewModel.currentAudioTrack?.id == track.id ? Color.blue.opacity(0.15) : Color.primary.opacity(0.08))
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    .frame(height: 140)
                }
                .padding(.horizontal, 24)
            } else {
                Text("No audio tracks found")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14))
                    .padding(.vertical, 20)
            }

            // Additional Audio Options (Future: Sync, Normalize, etc)
            // For now, consistent spacing with subtitle menu
            Spacer().frame(height: 10)
        }
        .frame(width: 450, alignment: .leading)
        .padding(.bottom, 24)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
    }




    @ViewBuilder
    private var menus: some View {
        menuShields
        menuOverlays
        reportOverlay
        streamInfoOverlay
        chatButtonOverlay
    }

    @ViewBuilder
    private var menuShields: some View {
        // Tap shield to close subtitle menu when open
        if showSubtitleMenu {
            Color.black.opacity(0.001)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showSubtitleMenu = false
                    }
                }
        }

        // Tap shield to close AUDIO menu when open
        if showAudioMenu {
            Color.black.opacity(0.001)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showAudioMenu = false
                    }
                }
        }

        // Tap shield to close playlist menu
        if showPlaylistMenu {
            Color.black.opacity(0.001)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showPlaylistMenu = false
                    }
                }
        }

        // Tap shield to close Stream Info
        if showStreamInfoSheet {
            Color.black.opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showStreamInfoSheet = false
                    }
                }
        }

        // Tap shield to close event list menu
        if showEventListMenu {
            Color.black.opacity(0.001)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showEventListMenu = false
                    }
                }
        }

        // Tap shield to close report sheet
        if showReportSheet {
             Color.black.opacity(0.5)
                 .frame(maxWidth: .infinity, maxHeight: .infinity)
                 .zIndex(101)
                 .onTapGesture {
                     withAnimation(.easeInOut(duration: 0.15)) {
                         showReportSheet = false
                     }
                 }
        }
    }

    @ViewBuilder
    private var menuOverlays: some View {
        // Subtitle Menu (Bottom Left)
        if showSubtitleMenu {
            fullSubtitleMenu
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .offset(x: 50, y: -80)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
                .zIndex(102)
        }

        // Audio Menu (Bottom Left next to subtitle)
        if showAudioMenu {
            fullAudioMenu
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .offset(x: 100, y: -80)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
                .zIndex(102)
        }

        // Playlist Menu (Bottom Left)
        if showPlaylistMenu {
            Group {
                if let room = appState.player.currentWatchPartyRoom {
                    PlaylistModalView(
                        room: room,
                        isHost: appState.player.isWatchPartyHost,
                        showPlaylistMenu: $showPlaylistMenu
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .offset(x: 150, y: -80)
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }

        // Event List Menu (Bottom Left)
        if showEventListMenu {
            EventListModalView(
                showEventListMenu: $showEventListMenu
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .offset(x: 200, y: -80)
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }
    }

    @ViewBuilder
    private var reportOverlay: some View {
        // Report Stream Modal (Center)
        if showReportSheet {
            VStack {
                 Spacer()
                 HStack {
                     Spacer()
                     ReportStreamView(
                         imdbId: imdbId,
                         season: season ?? -1,      // Pass for episode-specific decay
                         episode: episode ?? -1,   // Pass for episode-specific decay
                         quality: streamQuality,
                         streamHash: viewModel.currentStreamHash ?? streamHash ?? "",
                         movieTitle: streamTitle, // Pass title for admin visibility
                         filename: URL(string: viewModel.videoURL)?.lastPathComponent,
                         provider: viewModel.streamTitle, // usually holds release name
                         onDismiss: {
                             withAnimation(.easeInOut(duration: 0.15)) {
                                 showReportSheet = false
                             }
                         },
                         // Enable "Try Another Stream" only if queue has items (Matches Solo Behavior)
                         // For Watch Party, strict limitation to Host only.
                         hasAlternativeStreams: (!appState.isEventPlayback && appState.player.streamQueue.count > 0) && (!viewModel.isInWatchParty || viewModel.isWatchPartyHost),
                         isWatchParty: viewModel.isInWatchParty,
                         onTryAnother: {
                             if viewModel.isWatchPartyHost {
                                 // Watch Party Host Path: Show stable transition state
                                 viewModel.isExitingToLobby = true

                                 // Block hash and return all to lobby
                                 appState.player.tryAnotherStreamForWatchParty(
                                     hash: viewModel.currentStreamHash ?? streamHash ?? "",
                                     filename: URL(string: viewModel.videoURL)?.lastPathComponent,
                                     provider: viewModel.streamTitle
                                 )
                             } else {
                                 // Solo Playback Path: Explicitly reject current stream and try next
                                 appState.player.tryAnotherStream()
                             }
                         }
                     )
                     Spacer()
                 }
                 Spacer()
            }
            .transition(.opacity.combined(with: .scale))
            .zIndex(103)
        }
    }



    @ViewBuilder
    private var chatButtonOverlay: some View {
        // Chat toggle button (appears on right side when mouse is there OR unread messages exist)
        // Only show in watch party mode
        if (showChatButton || hasUnreadMessages) && !viewModel.showChat {
            chatToggleButton
                .transition(.opacity.combined(with: .move(edge: .trailing)))
                .zIndex(98)
        }
    }

    private var chatToggleButton: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Button(action: {
                    viewModel.toggleChat()
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .font(.system(size: 16))

                        if hasUnreadMessages {
                            Text("Chat (\(totalUnreadCount))")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Text("Chat (⌘)")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .foregroundColor(hasUnreadMessages ? .white : .white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(hasUnreadMessages ? Color.red.opacity(0.15) : Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(
                         RoundedRectangle(cornerRadius: 20)
                             .stroke(hasUnreadMessages ? Color.red.opacity(0.5) : Color.clear, lineWidth: 1)
                     )
                    .shadow(color: .black.opacity(0.3), radius: 10)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 30)
                .transition(.opacity.combined(with: .move(edge: .trailing)))
                .animation(.easeInOut(duration: 0.2), value: showControls)
            }

            Spacer()
        }
    }

    // Helper for unread count
    private var totalUnreadCount: Int {
        socialService.unreadCounts.values.reduce(0, +)
    }

    private var hasUnreadMessages: Bool {
        totalUnreadCount > 0
    }

    private func colorForStatus(_ status: String) -> Color {
        switch status {
        case "Online": return .green
        case "Degraded": return .orange
        case "Missing", "Missing API Key", "Missing Token": return .secondary
        case "Invalid API Key", "Invalid Token": return .red
        case "Offline": return .red
        default: return .secondary
        }
    }

}

// MARK: - Mouse Tracking View

struct MouseTrackingView: NSViewRepresentable {
    let onMouseMoved: (CGPoint) -> Void

    func makeNSView(context: Context) -> MouseTrackingNSView {
        let view = MouseTrackingNSView()
        view.onMouseMoved = onMouseMoved
        return view
    }

    func updateNSView(_ nsView: MouseTrackingNSView, context: Context) {
        nsView.onMouseMoved = onMouseMoved
    }
}

class MouseTrackingNSView: NSView {
    var onMouseMoved: ((CGPoint) -> Void)?
    private var trackingArea: NSTrackingArea?

    override func updateTrackingAreas() {
        super.updateTrackingAreas()

        if let trackingArea = trackingArea {
            removeTrackingArea(trackingArea)
        }

        let options: NSTrackingArea.Options = [.activeAlways, .mouseMoved, .inVisibleRect]
        trackingArea = NSTrackingArea(rect: bounds, options: options, owner: self, userInfo: nil)

        if let trackingArea = trackingArea {
            addTrackingArea(trackingArea)
        }
    }

    override func mouseMoved(with event: NSEvent) {
        let location = convert(event.locationInWindow, from: nil)
        onMouseMoved?(location)
    }

    // MARK: - Enhanced Mouse Click Handling
    // Prevent crashes by implementing proper hit testing and safe event forwarding

    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return false // Don't intercept clicks
    }

    override func hitTest(_ point: NSPoint) -> NSView? {
        // Convert point to view coordinates
        let location = convert(point, from: nil)
        let viewBounds = bounds

        // Define "Right Chat Zone" (Right 40%) - SAFE to pass through (no sidebar behind it)
        // This restores interactivity for the Chat Overlay and Reaction buttons
        let rightChatZone = CGRect(x: viewBounds.width * 0.60, y: 0, width: viewBounds.width * 0.40, height: viewBounds.height)

        // If in safe zone, return nil to let event pass through to views behind/underneath (Chat Overlay)
        if rightChatZone.contains(location) {
            return nil
        }

        // Otherwise, handle normally (will be blocked by mouseDown below)
        // This BLOCKS clicks in the Bottom/Left zones, preventing the Sidebar crash
        return super.hitTest(point)
    }

    override func mouseDown(with event: NSEvent) {
        // Block clicks in the background (if hitTest returned self)
        return
    }

    override func mouseUp(with event: NSEvent) {
        // Block clicks in the background (if hitTest returned self)
        return
    }

    override func rightMouseDown(with event: NSEvent) {
        // Block right-clicks in the background
        return
    }

    override func rightMouseUp(with event: NSEvent) {
        // Block right-clicks in the background
        return
    }
}

// MARK: - Preview

struct MPVPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MPVPlayerView(
            streamURL: "http://127.0.0.1:21834/play/rd/test/0",
            imdbId: "tt0133093",
            streamTitle: "The Matrix 1999 2160p BluRay",
            subtitles: [],
            streamQuality: "4K",
            sourceQuality: "BluRay",
            isSeries: false
        )
        .frame(width: 1280, height: 720)
    }
}

// MARK: - Playlist Subviews



struct NextEpisodeOverlay: View {
    let info: String
    let thumbnail: String?
    let onExit: () -> Void
    let onPlay: () -> Void

    @State private var remainingSeconds = 10
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Spacer()

            HStack(alignment: .bottom) {
                Spacer()

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Up Next in \(remainingSeconds)s")
                            .font(.headline)
                            .foregroundColor(.white)

                        Spacer()

                        Button(action: onExit) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .buttonStyle(.plain)
                        .help("Exit Player")
                    }

                    HStack(spacing: 16) {
                        if let thumbnail = thumbnail, let url = URL(string: thumbnail) {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Rectangle().fill(Color.gray.opacity(0.3))
                            }
                            .frame(width: 160, height: 90)
                            .cornerRadius(8)
                        } else {
                             // Fallback placeholder
                             Rectangle()
                                 .fill(Color.gray.opacity(0.3))
                                 .frame(width: 160, height: 90)
                                 .cornerRadius(8)
                                 .overlay(Image(systemName: "play.tv.fill").foregroundColor(.white.opacity(0.5)))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(info)
                                .font(.subheadline.weight(.semibold))
                                .foregroundColor(.white)
                                .lineLimit(2)

                            Button(action: onPlay) {
                                HStack {
                                    Image(systemName: "play.fill")
                                    Text("Play Now")
                                }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(20)
                            }
                            .buttonStyle(.plain)
                            .padding(.top, 8)
                        }
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black.opacity(0.85))
                        .shadow(radius: 20)
                )
                .padding(40)
                .padding(.bottom, 80) // Above controls
                .frame(maxWidth: 500)
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                timer?.invalidate()
                onPlay()
            }
        }
    }
}
