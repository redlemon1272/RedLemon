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
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }

                        // Blockbuster-styled logo text
                        HStack(spacing: 0) {
                            Text("Red")
                                .font(.system(size: 28, weight: .black, design: .default))
                                .foregroundColor(Color(red: 1.0, green: 0.84, blue: 0.0)) // Yellow like Blockbuster
                                .italic()
                            Text("Lemon")
                                .font(.system(size: 28, weight: .black, design: .default))
                                .foregroundColor(Color(red: 0.9, green: 0.0, blue: 0.0)) // Bright red
                                .italic()
                        }
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
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
                .background(Color(NSColor.controlBackgroundColor))
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
                        SettingsView()
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

            // Check if user has a username on launch
            if let username = await KeychainManager.shared.getUsername() {
                appState.currentUsername = username
                // Get user from Supabase
                if let user = try? await SupabaseClient.shared.createOrGetUser(username: username) {
                    appState.currentUserId = user.id
                    NSLog("✅ Loaded user: \(username) (ID: \(user.id))")
                    
                    // Connect to Social Service (Presence)
                    await SocialService.shared.connect(userId: user.id.uuidString, username: username)
                }
            } else {
                // Show username setup if no username found
                appState.showUsernameSetup = true
            }
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
        let displayTitle: String = {
            if let season = selectedSeason, let episode = selectedEpisode,
               let videos = metadata.videos {
                // Find the episode title
                if let videoEpisode = videos.first(where: { $0.season == season && $0.episode == episode }) {
                    return "\(metadata.title) - S\(String(format: "%02d", season))E\(String(format: "%02d", episode)): \(videoEpisode.title)"
                }
                return "\(metadata.title) - S\(String(format: "%02d", season))E\(String(format: "%02d", episode))"
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
            onPlaybackFinished: onPlaybackFinished
        )
    }

    // Equatable implementation - only recreate if URL changes
    static func == (lhs: StablePlayerContainer, rhs: StablePlayerContainer) -> Bool {
        return lhs.streamURL == rhs.streamURL
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

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 60))
                .foregroundColor(.red)

            Text("Stream Error")
                .font(.title)
                .foregroundColor(.white)

            Text(error)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Button("Back") {
                appState.currentView = .mediaDetail
            }
            .buttonStyle(.borderedProminent)
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

                    if badgeCount > 0 {
                        Text("\(badgeCount)")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                            .frame(minWidth: 14, minHeight: 14)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .offset(x: 10, y: -8)
                    } else if showBadge {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 10, height: 10)
                            .offset(x: 6, y: -6)
                    }
                }

                Text(title)
                    .font(.system(size: 16, weight: .medium))

                Spacer()
            }
            .foregroundColor(isSelected ? .white : .primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(borderColor, lineWidth: isSelected ? 2 : 0)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
    }

    private var backgroundColor: Color {
        if isSelected {
            return Color.accentColor
        } else if isHovered {
            return Color(NSColor.controlBackgroundColor).opacity(0.5)
        } else {
            return Color.clear
        }
    }

    private var borderColor: Color {
        if isSelected {
            return Color.accentColor.opacity(0.5)
        } else {
            return Color.clear
        }
    }
}
