import SwiftUI

struct WatchPartyLobbyView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: LobbyViewModel

    var room: WatchPartyRoom { viewModel.room }
    var isHost: Bool { viewModel.isHost }

    @State private var showEmojiPicker: Bool = false
    @State private var showPaymentGate = false
    @State private var isAutoJoining = false
    @State private var showMediaPicker = false
    @State private var showDescriptionEditor = false
    @State private var editingDescription: String = ""
    @StateObject private var licenseManager = LicenseManager.shared
    @FocusState private var isChatInputFocused: Bool
    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    init(viewModel: LobbyViewModel) {
        self.viewModel = viewModel
    }

    // Social & Sidebar State
    @ObservedObject private var socialService = SocialService.shared
    @State private var sidebarTab: SidebarTab = .chat
    @State private var selectedFriend: Friend? = nil // For DM view
    @AppStorage("hasSeenLobbyScrollHint") private var hasSeenScrollHint: Bool = false
    @State private var showScrollHint: Bool = false
    @State private var scrollBounceOffset: CGFloat = 0

    enum SidebarTab {
        case chat
        case friends
    }

    private var totalUnreadCount: Int {
        socialService.unreadCounts.values.reduce(0, +)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                lobbyContent(windowHeight: geometry.size.height)

                if isAutoJoining {
                    Color.black.ignoresSafeArea()
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .tint(.white)
                        Text(room.type == .userRoom ? "Joining Room..." : "Joining Live Event...")
                            .font(.title3.weight(.medium))

                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            if !hasSeenScrollHint {
                withAnimation(Animation.easeInOut.delay(1.0)) {
                    showScrollHint = true
                }
            }
            viewModel.appState = appState  // Set weak reference
            viewModel.connect()

            // Auto-focus chat input for immediate engagement
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s delay to allow view to settle
                isChatInputFocused = true
            }

            // Broadcast "In Lobby" status
            Task {
                let movieName = room.mediaItem?.name ?? "Event"
                await SocialService.shared.updateWatchingStatus(
                    mediaTitle: movieName,
                    mediaType: room.mediaItem?.type,
                    imdbId: room.mediaItem?.id,
                    roomId: room.id,
                    status: "In Lobby: \(movieName)"
                )
            }

            if appState.shouldAutoJoinLobby {
                NSLog("%@", "[LOBBY_VIEW] onAppear: shouldAutoJoinLobby=true, room=\(room.id), timeUntilStart=\(Int(viewModel.timeUntilStart))")
                // CRITICAL FIX: Late Joiners should skip the 8s safety delay
                viewModel.enableInstantJoin()

                isAutoJoining = true
                // Auto-ready after a brief delay to allow connection
                Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5s
                    if !viewModel.isReady {
                        viewModel.toggleReady()
                    }
                    // Keep overlay for a bit longer, then hide if not switched
                    // If room is playing, LobbyViewModel will switch view automatically
                    try? await Task.sleep(nanoseconds: 3_500_000_000) // 5.0s (3.5s additional)
                    withAnimation {
                        isAutoJoining = false
                    }
                }
                // Reset flag
                appState.shouldAutoJoinLobby = false
            } else {
                NSLog("%@", "[LOBBY_VIEW] onAppear: shouldAutoJoinLobby=false, room=\(room.id), timeUntilStart=\(Int(viewModel.timeUntilStart))")
            }
        }
    }

    @ViewBuilder
    private func lobbyContent(windowHeight: CGFloat) -> some View {
        // Chat will now flexibly fill available space between Spacer and button
        let chatMinHeight: CGFloat = 140

        ZStack {
            // Background with movie poster
            GeometryReader { geometry in
                if let backdropURL = viewModel.backdropURL {
                    AsyncImage(url: URL(string: backdropURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .blur(radius: 20)
                            .overlay(Color.black.opacity(0.6))
                    } placeholder: {
                        Color.black
                    }
                    .id(backdropURL) // Force refresh when URL changes
                } else {
                    Color.black
                }
            }
            .ignoresSafeArea()

            // Content
            VStack(spacing: 0) {
                // Header with prominent Leave button
                HStack {
                    Button(action: leaveLobby) {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .semibold))
                            Text("Leave")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.top, 40) // Avoid window traffic lights

                    Spacer()
                }
                .background(Color.black.opacity(0.5))

                // Movie info and participants (scrollable)
                ScrollView {
                    VStack(spacing: 8) {
                        // Movie info - Centered layout with logo, badges, and room code
                        VStack(spacing: 8) {
                            // Logo art (prominent, centered)
                            if let logoURL = viewModel.logoURL {
                                AsyncImage(url: URL(string: logoURL)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 450, maxHeight: 140)
                                            .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 5)
                                    case .failure:
                                        VStack {
                                            Image(systemName: "photo.fill")
                                                .font(.title)
                                                .foregroundColor(.white.opacity(0.3))
                                            Text("Logo unavailable")
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.5))
                                        }
                                        .frame(maxWidth: 450, maxHeight: 140)
                                    case .empty:
                                        ProgressView()
                                            .frame(maxWidth: 450, maxHeight: 140)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .id(logoURL) // Force refresh when URL changes
                            } else {
                                // Fallback to title if no logo
                                Text(viewModel.room.mediaItem?.name ?? "Select Media")
                                    .font(.title.weight(.bold))

                                    .foregroundColor(.white)

                                if let description = viewModel.room.description {
                                    Text(description)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                        .padding(.top, 2)
                                }
                            }

                            // Season & Episode info for TV series
                            if viewModel.room.mediaItem?.type == "series", let season = viewModel.room.season, let episode = viewModel.room.episode {
                                Text("Season \(season) • Episode \(episode)")
                                    .font(.title3.weight(.medium))

                                    .foregroundColor(.white.opacity(0.9))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule()
                                            .fill(Color.white.opacity(0.15))
                                    )
                            }

                            // Badges row (year and quality) and Room Code inline (hide for events)
                            HStack(spacing: 10) {
                                if let year = viewModel.room.mediaItem?.year {
                                    Text(year)
                                        .font(.caption.weight(.medium))

                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.white.opacity(0.15))
                                        .foregroundColor(.white.opacity(0.9))
                                        .cornerRadius(5)
                                }

                                Text(viewModel.room.quality.displayName)
                                    .font(.caption.weight(.semibold))

                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.accentColor.opacity(0.3))
                                    .foregroundColor(.accentColor)
                                    .cornerRadius(5)

                                // Only show room code for non-event rooms
                                if room.type == .userRoom {
                                    Text(room.id)
                                        .font(.system(.caption, design: .monospaced))
                                        .font(.body.weight(.bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.white.opacity(0.15))
                                        .cornerRadius(5)

                                    Button(action: copyRoomID) {
                                        Image(systemName: viewModel.didCopyRoomID ? "checkmark.circle.fill" : "doc.on.doc")
                                            .foregroundColor(.accentColor)
                                            .font(.caption)
                                    }
                                    .buttonStyle(PlainButtonStyle())

                                    if isHost {
                                        // Privacy Toggle
                                        Button(action: {
                                            viewModel.togglePrivacy()
                                        }) {
                                            Image(systemName: room.isPublic ? "lock.open.fill" : "lock.fill")
                                                .font(.caption)
                                                .foregroundColor(room.isPublic ? .white.opacity(0.6) : .red)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .help(room.isPublic ? "Make Room Private" : "Make Room Public")
                                    }

                                }
                            }

                            // Room Description (with edit button for host)
                            if room.type == .userRoom {
                                HStack(spacing: 6) {
                                    if let description = viewModel.room.description, !description.isEmpty {
                                        Text(description)
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))
                                            .lineLimit(2)
                                    } else if isHost {
                                        Text("Add a description...")
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.4))
                                            .italic()
                                    }

                                    if isHost {
                                        Button(action: {
                                            editingDescription = viewModel.room.description ?? ""
                                            showDescriptionEditor = true
                                        }) {
                                            Image(systemName: "pencil.circle.fill")
                                                .font(.system(size: 16))
                                                .foregroundColor(.accentColor)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .help("Edit Description")
                                        .popover(isPresented: $showDescriptionEditor, arrowEdge: .bottom) {
                                            descriptionEditorPopover
                                        }
                                    }
                                }
                                .padding(.top, 4)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)

                        // Connection Status and Participants section (hide participants for events)
                        VStack(alignment: .leading, spacing: 12) {
                            // Realtime Connection Status Indicator
                            ConnectionStatusRow(status: viewModel.realtimeConnectionStatus)

                            // Participants header (Always show count)
                            HStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.white.opacity(0.7))
                if room.type == .event {
                    Text("Participants (\(viewModel.participants.count))")
                        .font(.headline)
                        .foregroundColor(.white)
                } else {
                    Text("Participants (\(viewModel.participants.count)/\(room.maxParticipants))")
                        .font(.headline)
                        .foregroundColor(.white)
                }

                if room.readyCount > 0 && room.readyCount < viewModel.participants.count {
                                    Text("• \(room.readyCount) ready")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }

                                Spacer()
                            }

                            // Show participant list for user rooms and events
                            if room.type == .userRoom || room.type == .event {
                                LazyVStack(spacing: 6) {
                                    ForEach(viewModel.participants) { participant in
                                    ParticipantRow(
                                            participant: participant,
                                            canKick: isHost && !participant.isHost,
                                            canBlock: !participant.isHost, // Allow everyone to block others (except host blocking themselves handled by isSelf check)
                                            canAddFriend: participant.id.caseInsensitiveCompare(appState.currentUserId?.uuidString ?? "") != .orderedSame && !socialService.friends.contains(where: { $0.id.caseInsensitiveCompare(participant.id) == .orderedSame }),
                                            onKick: { viewModel.kickParticipant(participant) },
                                            onBlock: { viewModel.blockParticipant(participant) },
                                            onMute: {
                                                // Dispatch async to avoid Menu update conflicts during view rebuild
                                                Task { @MainActor in
                                                    viewModel.toggleMute(participantId: participant.id)
                                                }
                                            },
                                            onAddFriend: { viewModel.addFriend(participantId: participant.id) },
                                            isMuted: viewModel.mutedUserIds.contains(participant.id)
                                        )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 24)

                        // NEW: Playlist Section (Visible to all, but controls restricted)
                        if room.type == .userRoom {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Image(systemName: "list.bullet")
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Playlist (\(viewModel.playlist.count) items)")
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    Spacer()

                                    if isHost {
                                        Button(action: {
                                            if !LicenseManager.shared.isPremium && !viewModel.playlist.isEmpty {
                                                showPaymentGate = true
                                                return
                                            }
                                            showMediaPicker = true
                                        }) {
                                            HStack(spacing: 4) {
                                                Image(systemName: "plus.circle.fill")
                                                Text("Add")
                                            }
                                            .font(.caption)
                                            .foregroundColor(.accentColor)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color.accentColor.opacity(0.2))
                                            .cornerRadius(6)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .help("Add to Playlist")
                                    }
                                }

                                if !viewModel.playlist.isEmpty {
                                    VStack(spacing: 6) {
                                        ForEach(Array(viewModel.playlist.enumerated()), id: \.element.id) { index, item in
                                            PlaylistItemRow(
                                                item: item,
                                                index: index,
                                                isCurrent: index == viewModel.currentPlaylistIndex,
                                                isHost: isHost,
                                                voteCount: viewModel.playlistVotes[item.id]?.count ?? 0,
                                                hasVoted: viewModel.playlistVotes[item.id]?.contains(viewModel.participantId) ?? false,
                                                onRemove: { viewModel.removeFromPlaylist(at: index) },
                                                onPlay: { viewModel.playItem(at: index) },
                                                onVote: { viewModel.toggleVote(for: item.id) }
                                            )
                                        }
                                    }
                                } else {
                                    Text("No items in playlist. Add movies or episodes to create a marathon!")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.6))
                                        .padding(.vertical, 8)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                        }
                    } // End content VStack
                } // End ScrollView
                .simultaneousGesture(
                    DragGesture().onChanged { _ in
                        if showScrollHint {
                            withAnimation { showScrollHint = false }
                            hasSeenScrollHint = true
                        }
                    }
                )
                .overlay(alignment: .bottom) {
                    if showScrollHint {
                        VStack(spacing: 4) {
                            Text("Scroll down to see the participants and playlist")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.white.opacity(0.8))
                                .shadow(radius: 2)

                            Image(systemName: "chevron.compact.down")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.accentColor)
                                .shadow(radius: 4)
                                .offset(y: scrollBounceOffset)
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 120) // Lower than 180, but still above the action bar zone
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.8), .clear],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .allowsHitTesting(false) // Don't block scroll/click gestures
                        .transition(.opacity)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                scrollBounceOffset = 6
                            }
                            Task {
                                try? await Task.sleep(nanoseconds: 8_000_000_000) // 8s
                                withAnimation {
                                    showScrollHint = false
                                }
                                hasSeenScrollHint = true
                            }
                        }
                        .onTapGesture {
                            withAnimation { showScrollHint = false }
                            hasSeenScrollHint = true
                        }
                    }
                }

                Spacer()


                // Social Sidebar (Unified Chat & Friends)
                VStack(alignment: .leading, spacing: 12) {
                    // Header / Tabs
                    HStack(spacing: 16) {
                        if let friend = selectedFriend {
                            // DM Header
                            Button(action: {
                                withAnimation { selectedFriend = nil }
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.white.opacity(0.1))
                                    .clipShape(Circle())
                            }
                            .buttonStyle(.plain)

                            Text(friend.displayName)
                                .font(.headline)
                                .foregroundColor(.white)

                            Spacer()

                            // Online/Watching Status Indicator
                            if let activity = socialService.friendActivity[friend.id] {
                                // Check for custom status first (e.g., "In Lobby")
                                if let status = activity.customStatus, !status.isEmpty, status != "online" {
                                    Image(systemName: "hourglass")
                                        .foregroundColor(.orange)
                                        .help(status)
                                } else if let watching = activity.currentlyWatching {
                                    Image(systemName: "film.fill")
                                        .foregroundColor(.accentColor)
                                        .help("Watching \(watching.mediaTitle)")
                                } else if socialService.onlineUserIds.contains(friend.id) {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 8, height: 8)
                                }
                            } else if socialService.onlineUserIds.contains(friend.id) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                            }
                        } else {
                            // Main Tabs
                            Button(action: {
                                sidebarTab = .chat
                                isChatInputFocused = true
                            }) {
                                VStack(spacing: 4) {
                                    HStack {
                                        Image(systemName: "bubble.left.and.bubble.right.fill")
                                        Text("Chat")
                                    }
                                    .foregroundColor(sidebarTab == .chat ? .white : .white.opacity(0.6))

                                    // Active Indicator
                                    Rectangle()
                                        .fill(sidebarTab == .chat ? Color.accentColor : Color.clear)
                                        .frame(height: 2)
                                }
                            }
                            .buttonStyle(.plain)

                            Button(action: { sidebarTab = .friends }) {
                                VStack(spacing: 4) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "person.2.fill")
                                        Text("Friends")

                                        if totalUnreadCount > 0 {
                                            Text("\(totalUnreadCount)")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 4)
                                                .padding(.vertical, 2)
                                                .background(Color.red)
                                                .cornerRadius(8)
                                        }
                                    }
                                    .foregroundColor(sidebarTab == .friends ? .white : .white.opacity(0.6))

                                    // Active Indicator
                                    Rectangle()
                                        .fill(sidebarTab == .friends ? Color.accentColor : Color.clear)
                                        .frame(height: 2)
                                }
                            }
                            .buttonStyle(.plain)

                            Spacer()
                        }
                    }
                    .font(.headline)
                    .padding(.bottom, 4)

                    // Content Area
                    if let friend = selectedFriend {
                        // Direct Message View (Embedded)
                        ChatView(friend: friend)
                            .cornerRadius(12)
                            // Removed stroke overlay to eliminate white border
                    } else if sidebarTab == .friends {
                        // Friends List
                        ScrollView {
                            LazyVStack(spacing: 8) {
                                if socialService.friends.isEmpty {
                                    Text("No friends online")
                                        .foregroundColor(.secondary)
                                        .padding(.top, 20)
                                } else {
                                    // Sort: Unread > Online > Alphabetical
                                    let sortedFriends = socialService.friends
                                        .filter { $0.status == .accepted }
                                        .sorted { f1, f2 in
                                            // Priority 1: Unread Messages
                                            let u1 = socialService.unreadCounts[f1.id] ?? 0
                                            let u2 = socialService.unreadCounts[f2.id] ?? 0
                                            if (u1 > 0) != (u2 > 0) {
                                                return u1 > 0
                                            }

                                            // Priority 2: Online Status
                                            let online1 = socialService.onlineUserIds.contains(f1.id)
                                            let online2 = socialService.onlineUserIds.contains(f2.id)
                                            if online1 != online2 {
                                                return online1
                                            }

                                            // Priority 3: Alphabetical
                                            return f1.displayName < f2.displayName
                                        }

                                    ForEach(sortedFriends) { friend in
                                        LobbyFriendRow(
                                            friend: friend,
                                            isHost: isHost,
                                            room: room,
                                            unreadCount: socialService.unreadCounts[friend.id] ?? 0,
                                            activity: socialService.friendActivity[friend.id],
                                            isOnline: socialService.onlineUserIds.contains(friend.id),
                                            onSelect: {
                                                withAnimation { selectedFriend = friend }
                                            },
                                            onInvite: {
                                                let roomName = room.mediaItem?.name ?? "Watch Party"
                                                Task {
                                                    await socialService.sendInvite(to: friend.id, roomId: room.id, roomName: roomName)
                                                }
                                            }
                                        )
                                    }
                                }
                            }
                            .padding(.trailing, 4)
                        }
                    } else {
                        // Existing Lobby Chat
                        VStack(spacing: 8) {
                                    ScrollViewReader { proxy in
                                        ScrollView {
                                            VStack(alignment: .leading, spacing: 8) {
                                                // Unified Message List (Interleaved System + Chat)
                                                ForEach(viewModel.unifiedMessages) { item in
                                                    switch item {
                                                    case .system(let message):
                                                        LobbyMessageRow(message: message)
                                                            .id(item.id)
                                                    case .chat(let chatMsg):
                                                        renderChatMessageRow(chatMsg)
                                                            .id(item.id)
                                                    }
                                                }

                                                // Invisible view to anchor the scroll
                                                Color.clear
                                                    .frame(height: 1)
                                                    .id("BOTTOM")
                                            }
                                            .padding()
                                        }
                                        .frame(minHeight: chatMinHeight, maxHeight: .infinity)
                                        .background(Color.black.opacity(0.3))
                                        .cornerRadius(8)
                                        .onChange(of: viewModel.unifiedMessages.count) { _ in
                                            // Scroll to bottom whenever messages change
                                            Task { @MainActor in
                                                try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
                                                if !viewModel.unifiedMessages.isEmpty {
                                                    withAnimation {
                                                        proxy.scrollTo("BOTTOM", anchor: .bottom) // OK: Guarded by !isEmpty check
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    VStack(spacing: 0) {
                                        if showEmojiPicker {
                                            // Emoji picker with close button
                                            VStack(spacing: 8) {
                                                // Header with Close Button
                                                HStack {
                                                    Text("Emojis")
                                                        .font(.caption)
                                                        .foregroundColor(.white.opacity(0.6))
                                                    Spacer()
                                                    Button(action: {
                                                        withAnimation { showEmojiPicker = false }
                                                    }) {
                                                        Image(systemName: "xmark.circle.fill")
                                                            .font(.system(size: 20))
                                                            .foregroundColor(.white.opacity(0.6))
                                                    }
                                                    .buttonStyle(.plain)
                                                }
                                                .padding(.horizontal, 4)

                                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                                                    ForEach(emojis, id: \.self) { emoji in
                                                        Button(action: {
                                                            viewModel.chatInput += emoji
                                                        }) {
                                                            Text(emoji)
                                                                .font(.system(size: 24))
                                                                .frame(width: 40, height: 40)
                                                                .background(Color.white.opacity(0.1))
                                                                .cornerRadius(8)
                                                        }
                                                        .buttonStyle(.plain)
                                                    }
                                                }
                                            }
                                            .padding(12)
                                            .background(Color.black.opacity(0.9))
                                            .cornerRadius(12)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
                                            )
                                        }

                                        HStack {
                                            Button(action: {
                                                showEmojiPicker.toggle()
                                            }) {
                                                Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                                                .foregroundColor(.white.opacity(0.7))
                                            }
                                            .buttonStyle(PlainButtonStyle())

                                            TextField("Send a message...", text: $viewModel.chatInput)
                                                .textFieldStyle(PlainTextFieldStyle())
                                                .focused($isChatInputFocused)
                                                .padding(8)
                                                .background(Color.white.opacity(0.1))
                                                .cornerRadius(8)
                                                .foregroundColor(.white)
                                                .onSubmit(sendMessage)

                                            Button(action: sendMessage) {
                                                Image(systemName: "paperplane.fill")
                                                    .foregroundColor(.accentColor)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                            .disabled(viewModel.chatInput.isEmpty)
                                        }
                                    }
                                }
                    }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)

                // Action buttons - Fixed at bottom
                VStack(spacing: 12) {
                    if isHost {


                            // Host controls
                        Button(action: {
                            startMovie()
                        }) {
                            HStack {
                                if viewModel.isPlaylistSyncing {
                                    ProgressView().scaleEffect(0.6).padding(.trailing, 4)
                                    Text("Syncing Selection...")
                                } else {
                                    Image(systemName: "play.fill")
                                    Text("Start Playback")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.isPlaylistSyncing ? Color.gray : Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                        .disabled(viewModel.isStarting || viewModel.isPlaylistSyncing)

                        if viewModel.isResolvingStream {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Resolving stream...")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        } else if viewModel.isAwaitingGuests {
                            // FIX (v1.0.77): Show "Waiting for guests..." during handshake instead of frozen countdown
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Waiting for guests to sync...")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        } else if viewModel.isStarting {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Starting in \(viewModel.countdown)...")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                    } else {
                        // Guest controls - hide ready button for events (no host coordination needed)
                        if room.type == .userRoom {
                            Button(action: toggleReady) {
                                HStack {
                                    Image(systemName: viewModel.isReady ? "checkmark.circle.fill" : "circle")
                                    Text(viewModel.isReady ? "Ready!" : "Mark as Ready")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(viewModel.isReady ? Color.green : Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            .buttonStyle(.plain)
                        }

                        if viewModel.isStarting {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Host is starting in \(viewModel.countdown)...")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }

                        if viewModel.timeUntilStart > 0 {
                            HStack {
                                Image(systemName: "timer")
                                    .font(.title2)
                                // Show different text for events vs playlists
                                if room.type == .event {
                                    Text("Event starts in \(formatDuration(viewModel.timeUntilStart))")
                                        .font(.title3.weight(.semibold))

                                        .monospacedDigit()
                                } else if viewModel.isPlaylistMode {
                                    Text("Next item in \(formatDuration(viewModel.timeUntilStart))")
                                        .font(.title3.weight(.semibold))

                                        .monospacedDigit()
                                } else {
                                    Text("Starting in \(formatDuration(viewModel.timeUntilStart))")
                                        .font(.title3.weight(.semibold))

                                        .monospacedDigit()
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(12)
                            .padding(.bottom, 20)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
            }  // Close main VStack
        }  // Close ZStack
        .onAppear {
            viewModel.appState = appState  // Set weak reference
        }
        .sheet(isPresented: $showMediaPicker) {
            MediaPickerSheet(
                onSelect: { item, season, episode in
                    Task {
                        await viewModel.addToPlaylist(item: item, season: season, episode: episode)
                    }
                },
                onBulkSelect: { items in
                    Task {
                        await viewModel.addItemsToPlaylist(items)
                    }
                }
            )
            .environmentObject(appState)
        }
        .sheet(isPresented: $showPaymentGate) {
            PremiumPaymentView()
        }

    }  // Close lobbyContent function

    // MARK: - Chat Row Rendering
    @ViewBuilder
    private func renderChatMessageRow(_ chatMsg: ChatMessage) -> some View {
        // 1. FILTER: Active Block Check
        if let senderId = chatMsg.senderId,
           socialService.blockedUserIds.contains(senderId) {
            EmptyView()
        } else {
            // 2. MUTE CHECK: Local Mute from Lobby
            let isMuted = chatMsg.senderId.map { viewModel.mutedUserIds.contains($0) } ?? false

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    // Username / Menu
                    HStack(spacing: 4) {
                        let isSenderHost = chatMsg.senderId.map { $0.caseInsensitiveCompare(viewModel.room.hostId) == .orderedSame } ?? false
                        let nameColor: Color = isSenderHost ? DesignSystem.Colors.accent : UserAvatar.primaryColor(for: chatMsg.username)

                        Text(chatMsg.username)
                            .font(.caption.weight(.semibold))
                            .foregroundColor(nameColor)

                        if let senderId = chatMsg.senderId, senderId.caseInsensitiveCompare(viewModel.room.hostId) == .orderedSame {
                            Text("Host")
                                .font(.caption2.weight(.bold))
                                .foregroundColor(DesignSystem.Colors.accent)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 1)
                                .background(DesignSystem.Colors.accent.opacity(0.15))
                                .cornerRadius(4)
                        }

                        // Prestige Badge (Check Expiration! Security Check #138)
                        let isReallyPremium = socialService.friends.first(where: { $0.id.caseInsensitiveCompare(chatMsg.senderId ?? "") == .orderedSame })?.isReallyPremium ?? chatMsg.isReallyPremium
                        if isReallyPremium {
                            Text("👑")
                                .font(.system(size: 10))
                                .help("Premium User")
                        }
                    }

                    if let senderId = chatMsg.senderId, senderId.caseInsensitiveCompare(appState.currentUserId?.uuidString ?? "") != .orderedSame {
                        Menu {
                            // Add Friend
                            if !socialService.friends.contains(where: { $0.id.caseInsensitiveCompare(senderId) == .orderedSame }) {
                                Button {
                                    viewModel.addFriend(participantId: senderId)
                                } label: {
                                    Label("Add Friend", systemImage: "person.badge.plus")
                                }
                            }

                            // Mute Toggle
                            if isMuted {
                                Button {
                                    Task { @MainActor in
                                        viewModel.toggleMute(participantId: senderId)
                                    }
                                } label: {
                                    Label("Unmute User", systemImage: "speaker.wave.2.fill")
                                }
                            } else {
                                Button {
                                    Task { @MainActor in
                                        viewModel.toggleMute(participantId: senderId)
                                    }
                                } label: {
                                    Label("Mute User", systemImage: "speaker.slash.fill")
                                }
                            }

                            // Kick (Host Only)
                            if isHost {
                                Divider()
                                Button(role: .destructive) {
                                    viewModel.kickUser(userId: senderId)
                                } label: {
                                    Label("Kick User", systemImage: "xmark.circle")
                                }
                            }

                            // Block (Always available)
                            Button(role: .destructive) {
                                viewModel.blockUser(senderId, username: chatMsg.username)
                            } label: {
                                Label("Block User", systemImage: "slash.circle")
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white.opacity(0.5))
                                .frame(width: 16, height: 16)
                                .background(Color.white.opacity(0.1))
                                .clipShape(Circle())
                        }
                        .menuStyle(.borderlessButton)
                        .menuIndicator(.hidden)
                    }

                    Spacer()
                    Text(chatMsg.timestamp, style: .time)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.4))
                }

                if isMuted {
                    Text("(Message hidden - User muted)")
                        .font(.body.italic())
                        .foregroundColor(.white.opacity(0.5))
                } else {
                    Text(chatMsg.text)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
            .padding(8)
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
        }
    }

    private func copyRoomID() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(room.id, forType: .string)
        viewModel.didCopyRoomID = true
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            viewModel.didCopyRoomID = false
        }
    }

    private func sendMessage() {
        viewModel.sendChatMessage()
    }

    private func toggleReady() {
        viewModel.toggleReady()
    }

    private func startMovie() {
        Task {
            await viewModel.startMovie(appState: appState)
        }
    }

    private func changeMovie() {
        appState.currentView = .browse
    }

    private func leaveLobby() {
        appState.setActiveLobbyViewModel(nil) // Clear persistent session safely
        appState.currentView = room.type == .event ? .events : .rooms
    }

    // MARK: - Description Editor Popover
    private var descriptionEditorPopover: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Room Description")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.primary)

            TextField("What's this room about?", text: $editingDescription)
                .textFieldStyle(.roundedBorder)
                .frame(width: 280)
                .onSubmit {
                    saveDescription()
                }

            HStack {
                Text("\(editingDescription.count)/200")
                    .font(.caption)
                    .foregroundColor(editingDescription.count > 200 ? .red : .secondary)

                Spacer()

                Button("Cancel") {
                    showDescriptionEditor = false
                }
                .buttonStyle(.plain)
                .foregroundColor(.secondary)

                Button("Save") {
                    saveDescription()
                }
                .buttonStyle(.borderedProminent)
                .disabled(editingDescription.count > 200)
            }
        }
        .padding(16)
        .frame(width: 320)
    }

    private func saveDescription() {
        Task {
            let trimmed = String(editingDescription.prefix(200))
            try? await SupabaseClient.shared.updateRoomDescription(
                roomId: room.id,
                description: trimmed.isEmpty ? nil : trimmed
            )
            // Update local state
            await MainActor.run {
                viewModel.room.description = trimmed.isEmpty ? nil : trimmed
                showDescriptionEditor = false
            }
        }
    }

    private func formatDuration(_ interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension WatchPartyLobbyView {
    // Helper view modifier for alerts if needed, or just attach to body
}


// MARK: - Participant Row

struct ParticipantRow: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject private var socialService = SocialService.shared

    let participant: Participant
    let canKick: Bool
    let canBlock: Bool
    let canAddFriend: Bool
    let onKick: () -> Void
    let onBlock: () -> Void
    let onMute: () -> Void
    let onAddFriend: () -> Void
    let isMuted: Bool

    var body: some View {
        HStack {
            UserAvatar(
                username: participant.name,
                size: 32,
                isOnline: true,
                isHost: participant.isHost,
                showOnlineIndicator: false
            )

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text(participant.name)
                        .foregroundColor(.white)
                        .font(.subheadline)

                    // Prestige Badge (Check Expiration! Security Check #138)
                    if participant.isReallyPremium {
                        Text("👑")
                            .font(.system(size: 10))
                            .help("Premium User")
                    }
                }

                if participant.isHost {
                    Text("Host")
                        .font(.caption2.weight(.bold))
                        .foregroundColor(.accentColor)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 1)
                        .background(Color.accentColor.opacity(0.15))
                        .cornerRadius(4)
                }
            }

            Spacer()

            if participant.isReady {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }

            // Menu for everyone except self
            let isCurrentUser = participant.id.caseInsensitiveCompare(appState.currentUserId?.uuidString ?? "") == .orderedSame

            if !isCurrentUser {
                Menu {
                    // Add Friend
                    if canAddFriend {
                         Button(action: onAddFriend) {
                            Label("Add Friend", systemImage: "person.badge.plus")
                        }
                    }

                    // Mute Toggle
                    Button(action: onMute) {
                        Label(isMuted ? "Unmute" : "Mute", systemImage: isMuted ? "speaker.wave.2" : "speaker.slash")
                    }

                    // Kick (Host Only)
                    if canKick {
                        Divider()

                        Button(role: .destructive, action: onKick) {
                            Label("Kick Participant", systemImage: "xmark.circle")
                        }
                    }

                    // Block (Always available)
                    if canBlock {
                        Button(role: .destructive, action: onBlock) {
                            Label("Block User", systemImage: "slash.circle")
                        }
                    }

                } label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white.opacity(0.5))
                        .frame(width: 16, height: 16)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                }
                .menuStyle(BorderlessButtonMenuStyle())
                .menuIndicator(.hidden)
                .frame(width: 24, height: 24)
            }
        }
        .padding(8)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
}

// MARK: - Lobby Message Row

struct LobbyMessageRow: View {
    let message: LobbyMessage

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text(message.displayText)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))

            Spacer()

            Text(formatTime(message.timestamp))
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
    }

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

// MARK: - Connection Status Row

struct ConnectionStatusRow: View {
    let status: RealtimeConnectionStatus

    var body: some View {
        HStack(spacing: 8) {
            // Status indicator icon
            Image(systemName: statusIconName)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(statusColor)

            // Status text
            Text(status.displayText)
                .font(.caption.weight(.medium))

                .foregroundColor(statusColor)

            Spacer()

            // Animated indicator for active connection attempts
            if status.isActive {
                HStack(spacing: 2) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(statusColor)
                            .frame(width: 4, height: 4)
                            .scaleEffect(animationScale(for: index))
                            .animation(
                                Animation.easeInOut(duration: 1.0)
                                    .repeatForever()
                                    .delay(Double(index) * 0.2),
                                value: status.isActive
                            )
                    }
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(statusColor.opacity(0.3), lineWidth: 1)
        )
    }

    private var statusIconName: String {
        switch status {
        case .connected:
            return "checkmark.circle.fill"
        case .connecting:
            return "arrow.triangle.2.circlepath"
        case .failed:
            return "exclamationmark.triangle.fill"
        case .disconnected:
            return "wifi.slash"
        }
    }

    private var statusColor: Color {
        switch status {
        case .connected:
            return .green
        case .connecting:
            return .yellow
        case .failed:
            return .red
        case .disconnected:
            return .gray
        }
    }

    private var backgroundColor: Color {
        switch status {
        case .connected:
            return Color.green.opacity(0.1)
        case .connecting:
            return Color.yellow.opacity(0.1)
        case .failed:
            return Color.red.opacity(0.1)
        case .disconnected:
            return Color.gray.opacity(0.1)
        }
    }

    private func animationScale(for index: Int) -> CGFloat {
        switch status {
        case .connecting:
            return index == 0 ? 1.2 : 1.0
        default:
            return 1.0
        }
    }
}

// MARK: - Playlist Item Row

struct PlaylistItemRow: View {
    let item: PlaylistItem
    let index: Int
    let isCurrent: Bool
    let isHost: Bool
    let voteCount: Int
    let hasVoted: Bool
    let onRemove: () -> Void
    let onPlay: () -> Void
    let onVote: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Index number
            Text("\(index + 1)")
                .font(.caption.weight(.bold))

                .foregroundColor(isCurrent ? .accentColor : .white.opacity(0.5))
                .frame(width: 24)

            // Thumbnail (if available)
            if let posterURL = item.mediaItem.poster {
                AsyncImage(url: URL(string: posterURL)) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 40, height: 60)
                .cornerRadius(4)
            }

            // Title
            VStack(alignment: .leading, spacing: 2) {
                Text(item.displayTitle)
                    .font(.subheadline.weight(isCurrent ? .semibold : .regular))

                    .foregroundColor(.white)
                    .lineLimit(1)

                if let runtime = item.mediaItem.runtime {
                    Text(runtime)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                }
            }

            Spacer()

            // Vote button (everyone can vote)
            Button(action: onVote) {
                HStack(spacing: 4) {
                    Image(systemName: hasVoted ? "heart.fill" : "heart")
                        .foregroundColor(hasVoted ? .pink : .white.opacity(0.6))
                    if voteCount > 0 {
                        Text("\(voteCount)")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .font(.system(size: 14))
            }
            .buttonStyle(PlainButtonStyle())
            .help(hasVoted ? "Remove Vote" : "Vote for this")
            .padding(.trailing, 8)

            // Play button (Host only, if not current)
            if isHost && !isCurrent {
                Button(action: onPlay) {
                    Image(systemName: "play.circle")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 18))
                }
                .buttonStyle(PlainButtonStyle())
                .help("Select to queue")
                .padding(.trailing, 4)
            }

            // Current indicator
            if isCurrent {
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.accentColor)
            }

            // Remove button (Host only)
            if isHost {
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red.opacity(0.8))
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isCurrent ? Color.accentColor.opacity(0.2) : Color.white.opacity(0.05))
        .cornerRadius(8)
    }
}

// MARK: - Lobby Friend Row

struct LobbyFriendRow: View {
    let friend: Friend
    let isHost: Bool
    let room: WatchPartyRoom
    let unreadCount: Int
    let activity: FriendActivity?
    let isOnline: Bool
    let onSelect: () -> Void
    let onInvite: () -> Void

    var body: some View {
        Button(action: onSelect) {
            HStack {
                // Avatar
                ZStack(alignment: .topTrailing) {
                    UserAvatar(
                        username: friend.username,
                        size: 32,
                        isOnline: true,
                        showOnlineIndicator: false
                    )

                    if unreadCount > 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                            .overlay(Text("\(unreadCount)").font(.system(size: 8)).foregroundColor(.white))
                            .offset(x: 2, y: -2)
                    }
                }

                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Text(friend.displayName)
                            .foregroundColor(.white)
                            .font(.callout)

                        if friend.isReallyPremium || (activity?.isReallyPremium ?? false) {
                            Text("👑")
                                .font(.system(size: 10))
                                .help("Premium Host")
                        }
                    }

                    // Status
                    if let activity = activity {
                        if let status = activity.customStatus, !status.isEmpty, status != "online" {
                            Text(status)
                                .font(.caption2)
                                .foregroundColor(.orange)
                        } else if let watching = activity.currentlyWatching {
                            Text("Watching \(watching.mediaTitle)")
                                .font(.caption2)
                                .foregroundColor(.accentColor)
                        } else if isOnline {
                            Text("Online")
                                .font(.caption2)
                                .foregroundColor(.green)
                        } else {
                            Text("Offline")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    } else if isOnline {
                        Text("Online")
                            .font(.caption2)
                            .foregroundColor(.green)
                    } else {
                        Text("Offline")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                // Invite Button
                if isHost || room.type == .userRoom {
                    Button(action: onInvite) {
                        Label("Invite", systemImage: "envelope.fill")
                            .font(.caption2)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    .buttonStyle(.plain)
                }

                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
                    .font(.caption)
            }
            .padding(10)
            .background(Color.white.opacity(0.05))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}
