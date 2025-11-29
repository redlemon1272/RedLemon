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
    @State private var showSubtitleMenu = false
    @State private var showAudioMenu = false
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

                    // Overlays (Loading, Waiting, Logo)
                    overlays

                    // Exit Room button (top-left, appears independently)
                    if showExitButton {
                        VStack {
                            HStack {
                                exitButton
                                Spacer()
                            }
                            Spacer()
                        }
                        .zIndex(101)
                        .transition(.opacity)
                    }

                    // Player controls (bottom bar)
                    if showControls && !viewModel.isLoading {
                        playerControlsBar
                            .zIndex(99)
                    }

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

                    // Full subtitle menu (appears when player controls are hidden)
                    if showSubtitleMenu {
                        fullSubtitleMenu
                            .zIndex(102)
                            .transition(.opacity.combined(with: .scale))
                    }

                    // Chat toggle button (appears on right side when mouse is there and chat is closed)
                    // Only show in watch party mode
                    if showChatButton && !viewModel.showChat && viewModel.isInWatchParty {
                        chatToggleButton
                            .transition(.opacity.combined(with: .move(edge: .trailing)))
                            .zIndex(98)
                    }
            }
            .frame(width: viewModel.showChat ? geometry.size.width * 0.68 : geometry.size.width)

            // Chat overlay (slides in from right)
            if viewModel.showChat {
                ChatOverlayView(viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.32)
                    .transition(.move(edge: .trailing))
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
                    if location.y <= bottomThreshold {
                        showControls = true

                        // Keep controls visible briefly after hover
                        showControlsTemporarily()
                    }

                    // Show chat button when mouse is in right 25% of screen (independent of controls)
                    // Only in watch party mode
                    if location.x >= rightThreshold && viewModel.isInWatchParty {
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
        .onAppear {
            // Set appState reference for watch history tracking
            viewModel.appState = appState

            // Hide cursor initially
            cursorHideTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                NSCursor.hide()
            }

            // Start auto-exit timer for event movies
            if appState.isEventPlayback {
                print("🎬 Event playback detected - starting auto-exit monitor")
                eventAutoExitTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    checkEventMovieFinished()
                }
            }
            
            // Install local event monitor to capture keyboard events even when text field is focused
            localKeyMonitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .flagsChanged]) { event in
                // Spacebar (keyCode 49): open chat (only if in watch party and closed)
                if event.keyCode == 49 && event.type == .keyDown && !viewModel.showChat && viewModel.isInWatchParty {
                    viewModel.toggleChat()
                    return nil // Consume event
                }

                // Command key pressed: close chat if open
                if event.type == .flagsChanged && event.modifierFlags.contains(.command) && viewModel.showChat {
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
            if appState.currentWatchMode == .watchParty, let roomId = appState.currentRoomId {
                NSLog("🎉 Starting watch party sync - Room: %@, Host: %@", roomId, appState.isWatchPartyHost ? "YES" : "NO")
                do {
                    try await viewModel.startWatchPartySync(roomId: roomId, isHost: appState.isWatchPartyHost)
                    NSLog("✅ Watch party sync started successfully - isInWatchParty is now TRUE")
                } catch {
                    NSLog("❌ Failed to start watch party sync: %@", error.localizedDescription)
                }
            }
            
            // Now load stream with watch party mode properly set
            NSLog("🎬🎬🎬 About to call loadStream - isInWatchParty: %@", viewModel.isInWatchParty ? "YES" : "NO")
            NSLog("🎬🎬🎬 Subtitles: %d", subtitles.count)
            await viewModel.loadStream(
                streamURL: streamURL,
                imdbId: imdbId,
                streamTitle: streamTitle,
                subtitles: subtitles,
                isSeries: isSeries
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
        await appState.exitPlayer()
    }
    
    private func checkEventMovieFinished() {
        guard appState.isEventPlayback else { return }
        
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
                await appState.handleMovieFinished()
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
                await appState.handleMovieFinished()
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

    private var loadingOverlay: some View {
        VStack(spacing: 20) {
            Spacer()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)

            Text("Loading stream...")
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))

            if !viewModel.streamTitle.isEmpty {
                Text(viewModel.streamTitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
            }

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
        .transition(.opacity)
    }

    @ViewBuilder
    private var overlays: some View {
        // Logo overlay (during loading)
        if viewModel.isLoading, let logoURL = viewModel.logoURL {
            AsyncImage(url: URL(string: logoURL)) { phase in
                if case .success(let image) = phase {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400)
                        .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
                }
            }
            .transition(.opacity.combined(with: .scale))
        }

        // Loading overlay
        if viewModel.isLoading {
            loadingOverlay
        }
        
        // Waiting for guests overlay (Post-Load Ready Gate)
        if viewModel.showWaitingForGuests {
            waitingForGuestsOverlay
                .zIndex(100)
        }
    }

    private var waitingForGuestsOverlay: some View {
        VStack(spacing: 20) {
            Spacer()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)

            Text(viewModel.isWatchPartyHost ? "Waiting for guests to load..." : "Waiting for host to start...")
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)

            if viewModel.isWatchPartyHost {
                Text("Playback will start automatically when everyone is ready")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .transition(.opacity)
    }

    private var exitButton: some View {
        Button(action: {
            Task {
                await exitPlayer()
            }
        }) {
            HStack(spacing: 6) {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.system(size: 14))
                Text("Exit Room")
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
        .padding(12)
    }

    private var playerControlsBar: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 3) {
                // Title bar with poster art
                HStack(spacing: 20) {
                    // Poster art
                    if let posterURL = viewModel.posterURL {
                        let fullURL = posterURL.starts(with: "http") ? posterURL : "https://image.tmdb.org/t/p/original\(posterURL)"
                        AsyncImage(url: URL(string: fullURL)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 95, height: 142)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(color: .black.opacity(0.5), radius: 10, y: 5)
                            default:
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: 95, height: 142)
                            }
                        }
                    }

                    // Title text with quality badges
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.streamTitle)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .shadow(color: .black.opacity(0.5), radius: 8, y: 4)

                        // Quality badges
                        HStack(spacing: 8) {
                            if !streamQuality.isEmpty {
                                Text(streamQuality)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(6)
                            }

                            if !sourceQuality.isEmpty && sourceQuality != "Unknown" {
                                Text(sourceQuality)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(sourceQualityBackgroundColor)
                                    .cornerRadius(6)
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 8)
                .padding(.bottom, 6)

                // Seek bar with time indicators
                VStack(spacing: 2) {
                    // Seek bar - only show if solo or host
                    if !viewModel.isInWatchParty || viewModel.isWatchPartyHost {
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // Background track
                                Capsule()
                                    .fill(Color.white.opacity(0.25))
                                    .frame(height: 3)

                                // Progress
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width: progressWidth(in: geometry.size.width), height: 3)

                                // Scrubber handle
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 10, height: 10)
                                    .shadow(color: .black.opacity(0.3), radius: 3)
                                    .offset(x: progressWidth(in: geometry.size.width) - 5)
                            }
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        let progress = max(0, min(1, value.location.x / geometry.size.width))
                                        let seekTime = Double(progress) * viewModel.mpvWrapper.duration
                                        viewModel.mpvWrapper.seek(to: seekTime)
                                    }
                            )
                        }
                        .frame(height: 8)
                        .padding(.horizontal, 10)
                    } else {
                        // Guest view - show progress bar without interaction
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // Background track
                                Capsule()
                                    .fill(Color.white.opacity(0.25))
                                    .frame(height: 3)

                                // Progress (read-only)
                                Capsule()
                                    .fill(Color.white.opacity(0.6))
                                    .frame(width: progressWidth(in: geometry.size.width), height: 3)
                            }
                        }
                        .frame(height: 8)
                        .padding(.horizontal, 10)
                    }

                    // Time display - ENLARGED and more visible
                    HStack {
                        Text(formatTime(viewModel.mpvWrapper.currentTime))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .monospacedDigit()
                            .shadow(color: .black.opacity(0.5), radius: 3, y: 1)

                        Spacer()

                        Text(formatTime(viewModel.mpvWrapper.duration))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white.opacity(0.85))
                            .monospacedDigit()
                            .shadow(color: .black.opacity(0.5), radius: 3, y: 1)
                    }
                    .padding(.horizontal, 10)
                }

                // Control buttons - all on left side
                HStack(spacing: 8) {
                    // Play/Pause button - only for solo or host
                    if !viewModel.isInWatchParty || viewModel.isWatchPartyHost {
                        Button(action: {
                            viewModel.mpvWrapper.togglePlayPause()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 40, height: 40)

                                Image(systemName: viewModel.mpvWrapper.isPlaying ? "pause.fill" : "play.fill")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.plain)
                    }

                    // Volume control
                    Button(action: {
                        let currentVolume = viewModel.mpvWrapper.volume
                        let newVolume = currentVolume == 0 ? 50 : (currentVolume < 50 ? 75 : (currentVolume < 75 ? 100 : 0))
                        viewModel.mpvWrapper.setVolume(newVolume)
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: volumeIcon(viewModel.mpvWrapper.volume))
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)

                    // Simple subtitle button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            showSubtitleMenu.toggle()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: "captions.bubble.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)

                    // Audio button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            showAudioMenu.toggle()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: "waveform.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)
                    .overlay(alignment: .top) {
                        if showAudioMenu {
                            VStack(alignment: .leading, spacing: 0) {
                                let currentAudioId = viewModel.mpvWrapper.getCurrentAudioTrack()

                                ForEach(viewModel.mpvWrapper.getAudioTracks(), id: \.id) { track in
                                    Button(action: {
                                        viewModel.mpvWrapper.setAudioTrack(track.id)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            withAnimation(.easeInOut(duration: 0.15)) {
                                                showAudioMenu = false
                                            }
                                        }
                                    }) {
                                        HStack {
                                            Text(track.displayName)
                                                .font(.system(size: 13))
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if currentAudioId == track.id {
                                                Image(systemName: "checkmark")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .foregroundColor(.blue)
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .contentShape(Rectangle())
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 10)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .background(.regularMaterial)
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .frame(minWidth: 250)
                            .offset(y: -10)
                            .transition(.opacity)
                            .zIndex(100)
                            .onHover { isHovering in
                                if !isHovering {
                                    withAnimation(.easeInOut(duration: 0.15)) {
                                        showAudioMenu = false
                                    }
                                }
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 16)
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .animation(.easeInOut(duration: 0.25), value: showControls)
        }
    }

    private func progressWidth(in totalWidth: CGFloat) -> CGFloat {
        guard viewModel.mpvWrapper.duration > 0 else { return 0 }
        return totalWidth * CGFloat(viewModel.mpvWrapper.currentTime / viewModel.mpvWrapper.duration)
    }

    private func formatTime(_ seconds: Double) -> String {
        let totalSeconds = Int(seconds)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60

        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, secs)
        } else {
            return String(format: "%d:%02d", minutes, secs)
        }
    }

    private func volumeIcon(_ volume: Int) -> String {
        if volume == 0 {
            return "speaker.slash.fill"
        } else if volume < 33 {
            return "speaker.wave.1.fill"
        } else if volume < 66 {
            return "speaker.wave.2.fill"
        } else {
            return "speaker.wave.3.fill"
        }
    }

    private var sourceQualityBackgroundColor: Color {
        switch sourceQuality {
        case "BluRay":
            return Color.blue.opacity(0.8)
        case "WEB-DL", "WEBRip":
            return Color.green.opacity(0.8)
        case "CAM", "TS":
            return Color.red.opacity(0.8)
        case "HDTV", "DVDRip":
            return Color.orange.opacity(0.8)
        default:
            return Color.gray.opacity(0.8)
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
                        Text("Chat")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
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

    override func mouseDown(with event: NSEvent) {
        // Enhanced hit testing - check if click is near UI controls
        let location = convert(event.locationInWindow, from: nil)
        let viewBounds = bounds

        // Define safe zones for UI controls (bottom 25% for controls, top-left for exit button)
        let bottomZone = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height * 0.25)
        let topExitZone = CGRect(x: 0, y: viewBounds.height * 0.75, width: viewBounds.width * 0.25, height: viewBounds.height * 0.25)

        // If click is in UI control zones, don't handle it - let SwiftUI buttons handle it
        if bottomZone.contains(location) || topExitZone.contains(location) {
            // Forward to window's first responder (likely SwiftUI)
            window?.firstResponder?.mouseDown(with: event)
            return
        }

        // For clicks in video area, don't forward events - let video layer handle them naturally
        // This prevents crashes in the main video viewing area
        return
    }

    override func mouseUp(with event: NSEvent) {
        // Use the same hit testing logic as mouseDown
        let location = convert(event.locationInWindow, from: nil)
        let viewBounds = bounds

        let bottomZone = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height * 0.25)
        let topExitZone = CGRect(x: 0, y: viewBounds.height * 0.75, width: viewBounds.width * 0.25, height: viewBounds.height * 0.25)

        if bottomZone.contains(location) || topExitZone.contains(location) {
            window?.firstResponder?.mouseUp(with: event)
            return
        }

        // For clicks in video area, don't forward events - let video layer handle them naturally
        // This prevents crashes in the main video viewing area
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
