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
        window?.makeFirstResponder(self)
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
    @StateObject private var viewModel = MPVPlayerViewModel()
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

    // Track selection menus
    @State private var showAudioMenu = false
    @State private var showSubtitleMenu = false
    @State private var showPlaylistMenu = false
    @State private var showEventListMenu = false
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
    var onPlaybackFinished: (() -> Void)? = nil

    init(streamURL: String, imdbId: String, streamTitle: String, subtitles: [(url: String, label: String)], streamQuality: String = "", sourceQuality: String = "", isSeries: Bool = false, onPlaybackFinished: (() -> Void)? = nil) {
        self.streamURL = streamURL
        self.imdbId = imdbId
        self.streamTitle = streamTitle
        self.subtitles = subtitles
        self.streamQuality = streamQuality
        self.sourceQuality = sourceQuality
        self.isSeries = isSeries
        self.onPlaybackFinished = onPlaybackFinished
        NSLog("🎬🎬🎬 MPVPlayerView INIT called - streamURL: %@, subtitles: %d", streamURL.prefix(60) as CVarArg, subtitles.count)
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                // Video container (scales based on chat state)
                ZStack {
                    // Background layer (always black)
                    Color.black

                    // Poster/Background art (during loading)
                    if viewModel.showPoster, let backgroundURL = viewModel.backgroundURL {
                        AsyncImage(url: URL(string: backgroundURL)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .clipped()
                                    .transition(.opacity)
                            case .failure:
                                placeholderBackground
                            case .empty:
                                placeholderBackground
                            @unknown default:
                                placeholderBackground
                            }
                        }
                        .opacity(viewModel.showPoster ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: viewModel.showPoster)
                    }

                    // MPV video output - IINA-style CAOpenGLLayer
                    MPVLayerVideoView(wrapper: viewModel.mpvWrapper)
                        .opacity(viewModel.isLoading ? 0 : 1)
                        .contentShape(Rectangle()) // Capture all clicks in this area
                        .onTapGesture {
                            // Swallow clicks to prevent falling through to sidebar
                            // Double-click to toggle fullscreen could go here
                        }

                    // Overlays (Loading, Waiting, Logo)
                    overlays
                    
                    // Floating Reactions (Always visible, even if chat is closed)
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
                        .zIndex(101)
                        .transition(.opacity)
                    }

                    // Player controls (bottom bar)
                    if showControls && !viewModel.isLoading {
                        PlayerControlsView(
                            viewModel: viewModel,
                            streamQuality: streamQuality,
                            sourceQuality: sourceQuality,
                            showSubtitleMenu: $showSubtitleMenu,
                            showAudioMenu: $showAudioMenu,
                            showPlaylistMenu: $showPlaylistMenu,
                            showEventListMenu: $showEventListMenu,
                            showControls: showControls
                        )
                        .zIndex(99)
                    }

                    // Extracted menus (Shields, Subtitles, Playlist, Chat Toggle)
                    menus
            }
            .frame(width: viewModel.showChat ? geometry.size.width * 0.8 : geometry.size.width)

            // Chat overlay (Pop in/out)
            if viewModel.showChat {
                // Determine initial mode based on context to prevent flash
                let initialMode: ChatOverlayView.ChatMode = {
                    if appState.isEventPlayback { return .event }
                    if viewModel.isInWatchParty { return .room }
                    return .friends
                }()

                ChatOverlayView(viewModel: viewModel, initialChatMode: initialMode)
                    .frame(width: geometry.size.width * 0.2)
                    // .transition(.identity) // Explicitly no transition
                    .zIndex(100)
            }
        }
        .background(MouseTrackingView { location in
                mouseLocation = location

                // Show cursor when mouse moves
                NSCursor.unhide()

                // Reset cursor hide timer
                cursorHideTimer?.invalidate()
                cursorHideTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    NSCursor.hide()
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
                        NSLog("🖱️ Mouse: x=%.0f/%.0f y=%.0f/%.0f | Exit: %d Controls: %d Chat: %d",
                              location.x, windowWidth, location.y, windowHeight,
                              showExitButton, showControls, showChatButton)
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
                        NSLog("✅ Exit button triggered! x=%.0f <= %.0f, y=%.0f >= %.0f",
                              location.x, leftThreshold, location.y, topThreshold)
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

            // Hide cursor initially
            cursorHideTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                NSCursor.hide()
            }

            // Start auto-exit timer for event movies
            if appState.player.isEventPlayback {
                print("🎬 Event playback detected - starting auto-exit monitor")
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

                // Escape key: exit player - DISABLED during watch party playback
                // Users must use "Exit Room" button instead to prevent accidental exits
                // if event.keyCode == 53 && event.type == .keyDown {
                //     Task {
                //         await exitPlayer()
                //     }
                //     return nil // Consume event
                // }

                return event // Pass through if not handled
            }
        }
        .task {
            NSLog("🎬🎬🎬 MPVPlayerView .task starting")

            // CRITICAL: Start watch party sync BEFORE loading stream
            // This ensures isInWatchParty is set when video loads, activating the ready gate
            if appState.player.currentWatchMode == .watchParty, let roomId = appState.player.currentRoomId {
                NSLog("🎉 Starting watch party sync - Room: %@, Host: %@", roomId, appState.player.isWatchPartyHost ? "YES" : "NO")
                
                // NEW: Inject Solo Mode intent
                viewModel.forceSoloStart = appState.player.forceSoloStart
                
                do {
                    try await viewModel.startWatchPartySync(roomId: roomId, isHost: appState.player.isWatchPartyHost)
                    NSLog("✅ Watch party sync started successfully - isInWatchParty is now TRUE")
                } catch {
                    NSLog("❌ Failed to start watch party sync: %@", error.localizedDescription)
                }
            }

            // CRITICAL: Inject appState immediately to ensure ViewModel has access to global state
            viewModel.appState = appState

            // Now load stream with watch party mode properly set
            NSLog("🎬🎬🎬 About to call loadStream - isInWatchParty: %@", viewModel.isInWatchParty ? "YES" : "NO")
            NSLog("🎬🎬🎬 Subtitles: %d", subtitles.count)
            await viewModel.loadStream(
                streamURL: streamURL,
                imdbId: imdbId,
                streamTitle: streamTitle,
                subtitles: subtitles,
                isSeries: isSeries,
                isEvent: appState.player.isEventPlayback
            )

            NSLog("🎬🎬🎬 MPVPlayerView .task completed")
        }
        .onChange(of: viewModel.playbackFinished) { finished in
            print("🎬 MPVPlayerView: onChange triggered - playbackFinished = \(finished)")
            if finished {
                print("🎬 MPVPlayerView: Playback finished, triggering callback")
                print("🎬 MPVPlayerView: onPlaybackFinished callback exists: \(onPlaybackFinished != nil)")
                onPlaybackFinished?()
                print("🎬 MPVPlayerView: Callback invoked")
            }
        }
        .onDisappear {
            // Stop watch history tracking
            viewModel.stopWatchHistorySaving()

            // Stop playback when view disappears - use Task for async
            Task {
                await viewModel.cleanup()
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
        await viewModel.cleanup()
        await appState.player.exitPlayer()
    }

    private func checkEventMovieFinished() {
        guard appState.player.isEventPlayback else { return }

        let position = viewModel.currentTime
        let duration = viewModel.duration

        // Check if MPV reported EOF (most reliable)
        if viewModel.playbackFinished {
            print("🎬 Event movie finished detected (MPV EOF)!")
            print("   Position: \(position)s / Duration: \(duration)s")
            print("   Auto-exiting player and returning to Events page...")

            // Stop the timer
            eventAutoExitTimer?.invalidate()
            eventAutoExitTimer = nil

            // Exit player and return to events
            Task {
                await appState.player.handleMovieFinished()
            }
            return
        }

        // Fallback: Check if near end and paused (in case EOF wasn't detected)
        let isPaused = !viewModel.isPlaying
        if duration > 0 && position >= duration - 5 && isPaused {
            print("🎬 Event movie finished detected (time-based fallback)!")
            print("   Position: \(position)s / Duration: \(duration)s")
            print("   Auto-exiting player and returning to Events page...")

            // Stop the timer
            eventAutoExitTimer?.invalidate()
            eventAutoExitTimer = nil

            // Exit player and return to events
            Task {
                await appState.player.handleMovieFinished()
            }
        }
    }

    // MARK: - Timer Management

    private func invalidateAllTimers() {
        print("⏱️ Invalidating all active timers")

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
        if viewModel.isLoading {
            LoadingOverlay(streamTitle: viewModel.streamTitle)
        }

        // Waiting for guests overlay (Post-Load Ready Gate)
        if viewModel.showWaitingForGuests {
             WaitingGateView(isHost: viewModel.isWatchPartyHost)
                .zIndex(100)
        }


    }











    private var fullSubtitleMenu: some View {
        VStack(spacing: 16) {
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
                                    viewModel.mpvWrapper.setSubtitleTrack(track.id) {
                                        viewModel.updateSubtitleTracks()
                                    }
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
            }
            .padding(.horizontal, 24)

            // Warning message if sync issues detected
            if viewModel.showSubtitleSyncPanel {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 18))

                    Text("Version mismatch detected between video and subtitles. Use timing controls to sync.")
                        .foregroundColor(.primary.opacity(0.9))
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)

                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange.opacity(0.15))
                )
            }
        }
        .padding(.bottom, 24)
        .frame(maxWidth: 600)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
    }

    private var fullAudioMenu: some View {
        VStack(spacing: 16) {
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
                    .id(UUID()) // Force redraw if list changes
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
        .padding(.bottom, 24)
        .frame(width: 450)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
    }



    @ViewBuilder
    private var menus: some View {
        // Tap shield to close subtitle menu when open
        if showSubtitleMenu {
            Color.black.opacity(0.001)
                .ignoresSafeArea()
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
                .ignoresSafeArea()
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
                .ignoresSafeArea()
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showPlaylistMenu = false
                    }
                }
        }
        
        // Tap shield to close event list menu
        if showEventListMenu {
            Color.black.opacity(0.001)
                .ignoresSafeArea()
                .zIndex(101)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        showEventListMenu = false
                    }
                }
        }

        // Subtitle Menu (Bottom Left)
        if showSubtitleMenu {
            VStack {
                Spacer()
                HStack {
                    fullSubtitleMenu
                        .padding(.leading, 50)
                        .padding(.bottom, 80)
                    Spacer()
                }
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }

        // Audio Menu (Bottom Left next to subtitle)
        if showAudioMenu {
            VStack {
                Spacer()
                HStack {
                    fullAudioMenu
                        .padding(.leading, 100)
                        .padding(.bottom, 80)
                    Spacer()
                }
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }
        
        // Playlist Menu (Bottom Left)
        if showPlaylistMenu {
            VStack {
                Spacer()
                HStack {
                    if let room = appState.player.currentWatchPartyRoom {
                        PlaylistModalView(
                            room: room,
                            isHost: appState.player.isWatchPartyHost,
                            showPlaylistMenu: $showPlaylistMenu
                        )
                        .padding(.leading, 150)
                        .padding(.bottom, 80)
                    }
                    Spacer()
                }
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }
        
        // Event List Menu (Bottom Left)
        if showEventListMenu {
            VStack {
                Spacer()
                HStack {
                    EventListModalView(
                        showEventListMenu: $showEventListMenu
                    )
                    .padding(.leading, 200)
                    .padding(.bottom, 80)
                    Spacer()
                }
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .zIndex(102)
        }

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

        // Define safe zones (Pass-through areas)
        let bottomZone = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height * 0.25)
        let topExitZone = CGRect(x: 0, y: viewBounds.height * 0.75, width: viewBounds.width * 0.25, height: viewBounds.height * 0.25)
        let rightChatZone = CGRect(x: viewBounds.width * 0.60, y: 0, width: viewBounds.width * 0.40, height: viewBounds.height)

        // If in safe zone, return nil to let event pass through to views behind/underneath
        if bottomZone.contains(location) || topExitZone.contains(location) || rightChatZone.contains(location) {
            return nil
        }

        // Otherwise, handle normally (will be blocked by mouseDown)
        return super.hitTest(point)
    }

    override func mouseDown(with event: NSEvent) {
        // Since hitTest returns nil for safe zones, this is only called for blocking zones.
        NSLog("⛔️ Blocking click in video area")
        return
    }

    override func mouseUp(with event: NSEvent) {
        // Since hitTest returns nil for safe zones, this is only called for blocking zones.
        return
    }

    override func rightMouseDown(with event: NSEvent) {
        // Use the same hit testing logic for right-click
        let location = convert(event.locationInWindow, from: nil)
        let viewBounds = bounds

        let bottomZone = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height * 0.25)
        let topExitZone = CGRect(x: 0, y: viewBounds.height * 0.75, width: viewBounds.width * 0.25, height: viewBounds.height * 0.25)

        if bottomZone.contains(location) || topExitZone.contains(location) {
            window?.firstResponder?.rightMouseDown(with: event)
            return
        }

        // For clicks in video area, don't forward events - let video layer handle them naturally
        // This prevents crashes in the main video viewing area
        return
    }

    override func rightMouseUp(with event: NSEvent) {
        // Use the same hit testing logic for right-click
        let location = convert(event.locationInWindow, from: nil)
        let viewBounds = bounds

        let bottomZone = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height * 0.25)
        let topExitZone = CGRect(x: 0, y: viewBounds.height * 0.75, width: viewBounds.width * 0.25, height: viewBounds.height * 0.25)

        if bottomZone.contains(location) || topExitZone.contains(location) {
            window?.firstResponder?.rightMouseUp(with: event)
            return
        }

        // For clicks in video area, don't forward events - let video layer handle them naturally
        // This prevents crashes in the main video viewing area
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


