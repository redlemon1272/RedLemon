import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var updateManager: UpdateManager
    @ObservedObject var socialService = SocialService.shared

    var body: some View {
        ZStack {
            // Main navigation view
            NavigationView {
                // Sidebar - Hide when in Watch Party Lobby (immersive mode)
                if appState.currentView != .watchPartyLobby {
                    VStack(spacing: 0) {
                        // App logo/title
                        VStack(spacing: 4) {
                        if let appIconImage = NSImage(named: "AppIcon") {
                            Image(nsImage: appIconImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 64, height: 64)
                                .cornerRadius(12)
                        } else {
                            Image(systemName: "tv.circle.fill")
                                .font(.system(size: 48))
                                .foregroundStyle(DesignSystem.Colors.accent)
                                .stitchGlow()
                        }

                        // Blockbuster-styled logo text
                        HStack(spacing: 0) {
                            Text("Red")
                                .font(.system(size: 28, weight: .black, design: .default))
                                .foregroundColor(DesignSystem.Colors.accent)
                                .italic()
                            Text("Lemon")
                                .font(.system(size: 28, weight: .black, design: .default))
                                .foregroundColor(.red)
                                .italic()
                        }
                        .shadow(color: DesignSystem.Colors.accent.opacity(0.3), radius: 10, x: 0, y: 0)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 40)

                    // Main Navigation
                    VStack(spacing: 8) {
                        SidebarButton(
                            title: "Events",
                            icon: "calendar.badge.clock",
                            isSelected: appState.currentView == .events
                        ) {
                            appState.currentView = .events
                        }

                        SidebarButton(
                            title: "Browse",
                            icon: "film.fill",
                            isSelected: appState.currentView == .browse
                        ) {
                            appState.currentView = .browse
                        }

                        SidebarButton(
                            title: "Discover",
                            icon: "sparkles",
                            isSelected: appState.currentView == .discover
                        ) {
                            appState.currentView = .discover
                        }

                        SidebarButton(
                            title: "Search",
                            icon: "magnifyingglass",
                            isSelected: appState.currentView == .search
                        ) {
                            appState.currentView = .search
                        }

                        SidebarButton(
                            title: "Friends",
                            icon: "person.2.fill",
                            isSelected: appState.currentView == .friends,
                            badgeCount: socialService.unreadCounts.values.reduce(0, +)
                        ) {
                            appState.currentView = .friends
                        }

                        SidebarButton(
                            title: "Rooms",
                            icon: "person.3.fill",
                            isSelected: appState.currentView == .rooms
                        ) {
                            appState.currentView = .rooms
                        }
                    }
                    .padding(.horizontal, 16)

                    Spacer()

                    // Settings at bottom
                    VStack(spacing: 8) {
                        Divider()
                            .background(DesignSystem.Colors.glassBorder)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)

                        SidebarButton(
                            title: "Settings",
                            icon: "gearshape.fill",
                            isSelected: appState.currentView == .settings,
                            showBadge: updateManager.updateAvailable
                        ) {
                            appState.currentView = .settings
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
                .frame(width: 240)
                .background(DesignSystem.Colors.glassSurface) // Glassmorphism base
                .overlay(
                    HStack {
                         Spacer()
                         Rectangle()
                             .fill(DesignSystem.Colors.glassBorder)
                             .frame(width: 1)
                    }
                )
                } // End if !watchPartyLobby

                // Main content area (excluding player)
                Group {
                    switch appState.currentView {
                    case .browse:
                        BrowseView()
                    case .events:
                        EventsView()
                    case .discover:
                        DiscoverView()
                    case .search:
                        SearchView()
                    case .friends:
                        FriendsView()
                    case .rooms:
                        RoomListView()
                    case .settings:
                        SettingsView(updateManager: updateManager)
                    case .mediaDetail:
                        if let mediaItem = appState.player.selectedMediaItem {
                            MediaDetailView(mediaItem: mediaItem)
                                .environmentObject(appState)
                        } else {
                            Text("No media selected")
                        }
                    case .seasonEpisodeSelector:
                        if let mediaItem = appState.player.selectedMediaItem {
                            SeasonEpisodeSelectorView(mediaItem: mediaItem)
                                .environmentObject(appState)
                        } else {
                            Text("No media selected")
                        }
                    case .qualitySelection:
                        if let mediaItem = appState.player.selectedMediaItem {
                            QualitySelectionView(mediaItem: mediaItem)
                                .environmentObject(appState)
                        } else {
                            Text("No media selected")
                        }
                    case .watchPartyLobby:
                        // Handled by lobbyOverlay
                        Color.black.ignoresSafeArea()
                    case .player:
                        // Placeholder - player shown in fullscreen ZStack
                        Text("")
                    }
                }
            }

            // Fullscreen player overlay
            playerOverlay

            // Fullscreen lobby overlay (covers sidebar)
            lobbyOverlay

            // Schedule Update Overlay (Topmost)
            if appState.showScheduleUpdatePrompt {
                scheduleUpdateOverlay
            }
        }
        .sheet(isPresented: $appState.showUsernameSetup) {
            UsernameSetupView()
                .environmentObject(appState)
        }
        .alert(item: $appState.activeAlert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .task {
            // Initialize performance-optimized cache limits
            CacheManager.shared.initializeLimits()

            // NOTE: Authentication is handled by RedLemonApp.loadStoredUser()
            // Do NOT check username here - it causes a race condition where this
            // task runs before loadStoredUser() completes, showing the login modal
            // for existing users. See: Race condition fix (Jan 2026)
        }
    }

    @ViewBuilder
    private var playerOverlay: some View {
        if appState.currentView == .player,
           let metadata = appState.player.selectedMetadata {
            PlayerLoadingView(
                appState: appState,
                metadata: metadata
            )
            .id("player-view-\(metadata.id)") // Prevent recreation on parent rebuilds
            .ignoresSafeArea()
            .transition(.opacity)
        }
    }

    @ViewBuilder
    private var lobbyOverlay: some View {
        if appState.currentView == .watchPartyLobby {
            Group {
                if let room = appState.player.currentWatchPartyRoom {
                    WatchPartyLobbyView(room: room, isHost: appState.player.isWatchPartyHost)
                        .id("lobby-\(room.id)")  // CRITICAL: Stable identity prevents SwiftUI from recreating the view on AppState changes
                        .environmentObject(appState)
                } else if appState.isLoadingRoom {
                    ProgressView("Loading room...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                } else {
                    Text("No room found")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                }
            }
            .transition(.opacity)
            .ignoresSafeArea() // Ensure it covers the sidebar
        }
    }

    @ViewBuilder
    private var scheduleUpdateOverlay: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Image(systemName: "calendar.badge.exclamationmark")
                    .font(.system(size: 60))
                    .foregroundColor(.yellow)

                VStack(spacing: 8) {
                    Text("Schedule Updated")
                        .font(.title.bold())
                        .foregroundColor(.white)

                    Text("A new event schedule has been published.\nPlease restart RedLemon to sync with the new times.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Button(action: {
                    appState.restartApplication()
                }) {
                    Text("Restart Now")
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.black)
                        .frame(width: 200, height: 44)
                        .background(Color.yellow)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
            }
            .padding(40)
            .background(Color(NSColor.windowBackgroundColor))
            .cornerRadius(20)
            .shadow(radius: 20)
            .frame(maxWidth: 400)
        }
        .transition(.opacity)
        .zIndex(100)
    }
}

// MARK: - Player Loading View

struct PlayerLoadingView: View {
    @ObservedObject var appState: AppState
    let metadata: MediaMetadata

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            // Show background art and logo while loading OR if error
            if appState.player.isResolvingStream || appState.player.streamError != nil {
                BackgroundArtView(backdropURL: metadata.backgroundURL)
                LogoOverlayView(logoURL: metadata.logoURL)
            }

            // Error state
            if let error = appState.player.streamError {
                StreamErrorView(error: error, appState: appState)
            }
            // Loading state
            else if appState.player.isResolvingStream {
                LoadingIndicatorView()
            }
            // Ready to play - show actual player
            else if let stream = appState.player.selectedStream, let url = stream.url {
                StablePlayerContainer(
                    streamURL: url,
                    imdbId: metadata.id,
                    metadata: metadata,
                    subtitles: stream.subtitles?.map { (url: $0.url, label: $0.label) } ?? [],
                    quality: stream.quality ?? "",
                    sourceQuality: stream.sourceQuality,
                    selectedSeason: appState.selectedSeason,
                    selectedEpisode: appState.selectedEpisode,
                    streamHash: stream.infoHash, // Pass infoHash
                    onPlaybackFinished: {
                        Task {
                            await appState.player.handleMovieFinished()
                        }
                    }
                )
                .id("stable-player-\(url)") // Stable ID based on URL
                .ignoresSafeArea()
                .transition(.opacity)
            }
            else {
                let _ = {
                    print("❌ RedLemon: NOT showing MPVPlayerView")
                    print("   isResolvingStream: \(appState.player.isResolvingStream)")
                    print("   streamError: \(appState.player.streamError ?? "nil")")
                    print("   selectedStream: \(appState.player.selectedStream == nil ? "NIL" : "SET")")
                    if let stream = appState.player.selectedStream {
                        print("   stream.url: \(stream.url == nil ? "NIL" : "SET")")
                    }
                }()
            }
        }
    }
}

// MARK: - Stable Player Container

/// Isolated player container that captures stream data once and doesn't rebuild on appState changes
struct StablePlayerContainer: View, Equatable {
    let streamURL: String
    let imdbId: String
    let metadata: MediaMetadata
    let subtitles: [(url: String, label: String)]
    let quality: String
    let sourceQuality: String
    let selectedSeason: Int?
    let selectedEpisode: Int?
    let streamHash: String?
    var onPlaybackFinished: (() -> Void)? = nil

    var body: some View {
        // Build display title with episode info if available
        // Build display title with episode info if available
        let displayTitle: String = {
            if metadata.type == "series", let season = selectedSeason, let episode = selectedEpisode {
                var title = "\(metadata.title) - S\(String(format: "%02d", season))E\(String(format: "%02d", episode))"

                // Append episode title if available
                if let videos = metadata.videos {
                   if let videoEpisode = videos.first(where: { $0.season == season && $0.episode == episode }) {
                       title += ": \(videoEpisode.title)"
                       print("✨ StablePlayerContainer: Found episode title: \(videoEpisode.title)")
                   } else {
                       print("⚠️ StablePlayerContainer: No matching video found for S\(season)E\(episode) in \(videos.count) videos")
                   }
                } else {
                    print("⚠️ StablePlayerContainer: metadata.videos is NIL")
                }

                return title
            }
            return metadata.title
        }()

        let _ = {
            print("🎬 RedLemon: Creating MPVPlayerView")
            print("   Stream URL: \(streamURL.prefix(60))")
            print("   Display Title: \(displayTitle)")
            print("   Subtitle URLs: \(subtitles.count)")
            for (idx, sub) in subtitles.enumerated() {
                print("      [\(idx)] \(sub.label)")
            }
        }()

        return MPVPlayerView(
            streamURL: streamURL,
            imdbId: imdbId,
            streamTitle: displayTitle,
            subtitles: subtitles,
            streamQuality: quality,
            sourceQuality: sourceQuality,
            isSeries: metadata.type == "series",
            streamHash: streamHash,
            season: selectedSeason,
            episode: selectedEpisode,
            onPlaybackFinished: onPlaybackFinished
        )
    }

    // Equatable implementation - only recreate if URL changes OR metadata changes (season/episode)
    static func == (lhs: StablePlayerContainer, rhs: StablePlayerContainer) -> Bool {
        let titleChanged = lhs.selectedSeason != rhs.selectedSeason || lhs.selectedEpisode != rhs.selectedEpisode
        let urlChanged = lhs.streamURL != rhs.streamURL

        if titleChanged {
             print("♻️ StablePlayerContainer: Recreating due to Season/Episode change (S\(lhs.selectedSeason ?? -1)E\(lhs.selectedEpisode ?? -1) -> S\(rhs.selectedSeason ?? -1)E\(rhs.selectedEpisode ?? -1))")
        }

        return !urlChanged && !titleChanged
    }
}

struct BackgroundArtView: View {
    let backdropURL: String?

    private func fullImageURL(_ url: String) -> String {
        if url.starts(with: "http") {
            return url
        } else {
            return "https://image.tmdb.org/t/p/original\(url)"
        }
    }

    var body: some View {
        Group {
            if let backdropURL = backdropURL {
                let fullURL = fullImageURL(backdropURL)
                let _ = NSLog("🖼️ Loading background art: \(fullURL)")
                AsyncImage(url: URL(string: fullURL)) { phase in
                    switch phase {
                    case .success(let image):
                        let _ = NSLog("✅ Background art loaded successfully")
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                    case .failure(let error):
                        let _ = NSLog("❌ Background art failed: \(error)")
                        Color.black.ignoresSafeArea()
                    case .empty:
                        let _ = NSLog("⏳ Background art loading...")
                        Color.black.ignoresSafeArea()
                    @unknown default:
                        Color.black.ignoresSafeArea()
                    }
                }
            } else {
                let _ = NSLog("⚠️ No backdrop URL provided")
                Color.black.ignoresSafeArea()
            }
        }
    }
}

struct LogoOverlayView: View {
    let logoURL: String?

    private func fullImageURL(_ url: String) -> String {
        if url.starts(with: "http") {
            return url
        } else {
            return "https://image.tmdb.org/t/p/original\(url)"
        }
    }

    var body: some View {
        Group {
            if let logoURL = logoURL {
                let fullLogoURL = fullImageURL(logoURL)
                let _ = NSLog("🎨 Loading logo: \(fullLogoURL)")
                AsyncImage(url: URL(string: fullLogoURL)) { phase in
                    switch phase {
                    case .success(let image):
                        let _ = NSLog("✅ Logo loaded successfully")
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 400, maxHeight: 200)
                            .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
                    case .failure(let error):
                        let _ = NSLog("❌ Logo failed: \(error)")
                        EmptyView()
                    case .empty:
                        let _ = NSLog("⏳ Logo loading...")
                        ProgressView()
                            .tint(.white)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct LoadingIndicatorView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1.5)
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
    }
}

struct StreamErrorView: View {
    let error: String
    @ObservedObject var appState: AppState

    /// Parse error string to extract StreamError info if available
    private var errorInfo: (title: String, message: String, solution: String, icon: String, showSettings: Bool) {
        // Check for known error patterns and return actionable info
        let errorLower = error.lowercased()

        // No Real-Debrid key (Matches StreamError.noRealDebridKey localized string)
        if errorLower.contains("requires a real-debrid account") || errorLower.contains("no realdebrid token") || errorLower.contains("realdebrid not configured") {
            return (
                title: "Real-Debrid Not Configured",
                message: "RedLemon requires a Real-Debrid account to stream content.",
                solution: "Go to Settings and add your Real-Debrid API key.",
                icon: "key.fill",
                showSettings: true
            )
        }

        // Invalid/expired key
        if errorLower.contains("401") || errorLower.contains("unauthorized") || (errorLower.contains("invalid") && errorLower.contains("key")) {
            return (
                title: "Invalid API Key",
                message: "Your Real-Debrid API key appears to be invalid or revoked.",
                solution: "Go to Settings and add a fresh API key from real-debrid.com.",
                icon: "key.fill",
                showSettings: true
            )
        }

        // Expired subscription
        if errorLower.contains("expired") {
            return (
                title: "Subscription Expired",
                message: "Your Real-Debrid subscription has expired.",
                solution: "Renew at real-debrid.com, then try again.",
                icon: "creditcard.trianglebadge.exclamationmark",
                showSettings: false
            )
        }

        // All streams fake/blocked (Matches StreamError.allStreamsFake localized string)
        if errorLower.contains("invalid file type") || errorLower.contains("blocked as suspicious") || (errorLower.contains("all streams") && errorLower.contains("fake")) {
            return (
                title: "No Valid Streams",
                message: "All available streams were blocked as suspicious.",
                solution: "This title may have fake uploads. Try again in a few days.",
                icon: "film.fill",
                showSettings: false
            )
        }

        // No streams found
        if errorLower.contains("no streams") {
            return (
                title: "No Streams Available",
                message: "No streams were found for this title.",
                solution: "It may not be available yet. Try again later.",
                icon: "film.fill",
                showSettings: false
            )
        }

        // Torrent not cached
        if errorLower.contains("not cached") {
            return (
                title: "Stream Not Ready",
                message: "This stream is not cached on Real-Debrid.",
                solution: "Try a different stream or wait for caching.",
                icon: "icloud.slash.fill",
                showSettings: false
            )
        }

        // Network/timeout errors
        if errorLower.contains("timeout") || errorLower.contains("timed out") {
            return (
                title: "Connection Timeout",
                message: "The connection timed out while loading.",
                solution: "Check your connection and retry.",
                icon: "wifi.exclamationmark",
                showSettings: false
            )
        }

        if errorLower.contains("network") || errorLower.contains("connection") {
            return (
                title: "Connection Error",
                message: "A network error occurred.",
                solution: "Check your internet connection and try again.",
                icon: "wifi.exclamationmark",
                showSettings: false
            )
        }

        // Fallback for unknown errors
        return (
            title: "Playback Error",
            message: error,
            solution: "Try again or select a different stream.",
            icon: "exclamationmark.triangle.fill",
            showSettings: false
        )
    }

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: errorInfo.icon)
                .font(.system(size: 72))
                .foregroundColor(errorInfo.showSettings ? .yellow : .red)
                .shadow(color: (errorInfo.showSettings ? Color.yellow : Color.red).opacity(0.3), radius: 10)

            VStack(spacing: 8) {
                Text(errorInfo.title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text(errorInfo.message)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                // Actionable solution
                Text(errorInfo.solution)
                    .font(.callout)
                    .foregroundColor(.yellow.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 4)
            }

            VStack(spacing: 16) {
                // Primary action button
                if errorInfo.showSettings {
                    Button(action: {
                        appState.player.streamError = nil
                        appState.currentView = .settings
                    }) {
                        HStack {
                            Image(systemName: "gearshape.fill")
                            Text("Go to Settings")
                        }
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.black)
                        .frame(width: 220, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .shadow(radius: 5)
                } else {
                    Button(action: {
                        retryPlayback()
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Retry Connection")
                        }
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.black)
                        .frame(width: 220, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .shadow(radius: 5)

                    Text("Retrying can improve stream reliability")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .padding(.top, 10)

            Button("Go Back") {
                appState.player.streamError = nil
                appState.currentView = .mediaDetail
            }
            .buttonStyle(.plain)
            .foregroundColor(.white.opacity(0.7))
            .padding(.top, 10)
        }
        .padding(40)
        .background(Color.black.opacity(0.85))
        .cornerRadius(20)
    }

    private func retryPlayback() {
        guard let item = appState.player.selectedMediaItem else { return }

        Task {
            let quality = appState.player.selectedQuality
            let mode = appState.player.currentWatchMode
            let roomId = appState.player.currentRoomId
            let isHost = appState.player.isWatchPartyHost

            await appState.player.playMedia(
                item,
                quality: quality,
                watchMode: mode,
                roomId: roomId,
                isHost: isHost
            )
        }
    }
}

// MARK: - Sidebar Button Component

struct SidebarButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    var showBadge: Bool = false
    var badgeCount: Int = 0
    let action: () -> Void

    @State private var isHovered = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .medium))
                        .frame(width: 24)
                        .foregroundColor(isSelected ? .white : (isHovered ? .white : DesignSystem.Colors.textSecondary))

                    if badgeCount > 0 {
                        Text("\(badgeCount)")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 4)
                            .frame(minWidth: 14, minHeight: 14)
                            .background(DesignSystem.Colors.accent)
                            .clipShape(Capsule())
                            .offset(x: 10, y: -8)
                    } else if showBadge {
                        Circle()
                            .fill(DesignSystem.Colors.accent)
                            .frame(width: 10, height: 10)
                            .offset(x: 6, y: -6)
                            .stitchGlow()
                    }
                }

                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isSelected ? .white : (isHovered ? .white : DesignSystem.Colors.textSecondary))

                Spacer()

                // Active indicator dot
                if isSelected {
                    Circle()
                        .fill(DesignSystem.Colors.accent)
                        .frame(width: 6, height: 6)
                        .stitchGlow(color: DesignSystem.Colors.accent, radius: 5)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? DesignSystem.Colors.accent.opacity(0.15) : (isHovered ? DesignSystem.Colors.glassSurface : Color.clear))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(isSelected ? DesignSystem.Colors.accent.opacity(0.5) : Color.clear, lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: isHovered)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
    }
}
