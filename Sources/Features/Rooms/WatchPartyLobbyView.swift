import SwiftUI

struct WatchPartyLobbyView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: LobbyViewModel

    let room: WatchPartyRoom
    let isHost: Bool

    @State private var showEmojiPicker: Bool = false
    @State private var showPaymentGate = false
    @State private var isAutoJoining = false
    @State private var showMediaPicker = false
    @StateObject private var licenseManager = LicenseManager.shared
    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    init(room: WatchPartyRoom, isHost: Bool) {
        self.room = room
        self.isHost = isHost
        _viewModel = StateObject(wrappedValue: LobbyViewModel(room: room, isHost: isHost))
    }

    // Social & Sidebar State
    @ObservedObject private var socialService = SocialService.shared
    @State private var sidebarTab: SidebarTab = .chat
    @State private var selectedFriend: Friend? = nil // For DM view

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
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            viewModel.appState = appState  // Set weak reference
            viewModel.connect()
            
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
                // CRITICAL FIX: Late Joiners should skip the 8s safety delay
                viewModel.enableInstantJoin()

                isAutoJoining = true
                // Auto-ready after a brief delay to allow connection
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if !viewModel.isReady {
                        viewModel.toggleReady()
                    }
                    // Keep overlay for a bit longer, then hide if not switched
                    // If room is playing, LobbyViewModel will switch view automatically
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        withAnimation {
                            isAutoJoining = false
                        }
                    }
                }
                // Reset flag
                appState.shouldAutoJoinLobby = false
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
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .fontWeight(.bold)
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
                                    .font(.title3)
                                    .fontWeight(.medium)
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
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.white.opacity(0.15))
                                        .foregroundColor(.white.opacity(0.9))
                                        .cornerRadius(5)
                                }

                                Text(viewModel.room.quality.displayName)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.accentColor.opacity(0.3))
                                    .foregroundColor(.accentColor)
                                    .cornerRadius(5)

                                // Only show room code for non-event rooms
                                if room.type == .userRoom {
                                    Text(room.id)
                                        .font(.system(.caption, design: .monospaced))
                                        .fontWeight(.bold)
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
                                }
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
                                Text("Participants (\(viewModel.participants.count))")
                                    .font(.headline)
                                    .foregroundColor(.white)

                                if room.readyCount > 0 && room.readyCount < viewModel.participants.count {
                                    Text("• \(room.readyCount) ready")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }

                                Spacer()
                            }

                            // Only show participant list for non-event rooms (to avoid clutter in large events)
                            if room.type == .userRoom {
                                VStack(spacing: 6) {
                                    ForEach(viewModel.participants) { participant in
                                    ParticipantRow(
                                            participant: participant,
                                            canKick: isHost && !participant.isHost,
                                            canBlock: !participant.isHost, // Allow everyone to block others (except host blocking themselves handled by isSelf check)
                                            canAddFriend: participant.id != (appState.currentUserId?.uuidString.lowercased() ?? "") && !socialService.friends.contains(where: { $0.id == participant.id }),
                                            onKick: { viewModel.kickParticipant(participant) },
                                            onBlock: { viewModel.blockParticipant(participant) },
                                            onMute: { viewModel.toggleMute(participantId: participant.id) },
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
                                        Button(action: { showMediaPicker = true }) {
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
                                                onRemove: { viewModel.removeFromPlaylist(at: index) },
                                                onPlay: { viewModel.playItem(at: index) }
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
                            Button(action: { sidebarTab = .chat }) {
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
                                            Button(action: {
                                                withAnimation { selectedFriend = friend }
                                            }) {
                                                HStack {
                                                    // Avatar (Existing)
                                                    ZStack(alignment: .topTrailing) {
                                                        Circle()
                                                            .fill(Constants.avatarColor(for: friend.username))
                                                            .frame(width: 32, height: 32)
                                                            .overlay(
                                                                Text(friend.username.prefix(1).uppercased())
                                                                    .font(.caption.bold())
                                                                    .foregroundColor(.white)
                                                            )
                                                        
                                                        if let count = socialService.unreadCounts[friend.id], count > 0 {
                                                            Circle()
                                                                .fill(Color.red)
                                                                .frame(width: 12, height: 12)
                                                                .overlay(Text("\(count)").font(.system(size: 8)).foregroundColor(.white))
                                                                .offset(x: 2, y: -2)
                                                        }
                                                    }
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text(friend.displayName)
                                                            .foregroundColor(.white)
                                                            .font(.callout)
                                                        
                                                        // Status (Check custom status first)
                                                        if let activity = socialService.friendActivity[friend.id] {
                                                            if let status = activity.customStatus, !status.isEmpty, status != "online" {
                                                                Text(status)
                                                                    .font(.caption2)
                                                                    .foregroundColor(.orange)
                                                            } else if let watching = activity.currentlyWatching {
                                                                Text("Watching \(watching.mediaTitle)")
                                                                    .font(.caption2)
                                                                    .foregroundColor(.accentColor)
                                                            } else if socialService.onlineUserIds.contains(friend.id) {
                                                                Text("Online")
                                                                    .font(.caption2)
                                                                    .foregroundColor(.green)
                                                            } else {
                                                                Text("Offline")
                                                                    .font(.caption2)
                                                                    .foregroundColor(.gray)
                                                            }
                                                        } else if socialService.onlineUserIds.contains(friend.id) {
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
                                                    
                                                    // Invite Button (Only show if room exists)
                                                    if isHost || room.type == .userRoom {
                                                        Button(action: {
                                                            let roomName = room.mediaItem?.name ?? "Watch Party"
                                                            Task {
                                                                await socialService.sendInvite(to: friend.id, roomId: room.id, roomName: roomName)
                                                            }
                                                        }) {
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
                                                        // 1. FILTER: Active Block Check
                                                        // If socialService says blocked, do not show AT ALL
                                                        if let senderId = chatMsg.senderId, 
                                                           socialService.blockedUserIds.contains(senderId) {
                                                            EmptyView()
                                                        } else {
                                                            // 2. MUTE CHECK: Local Mute from Lobby
                                                            let isMuted = chatMsg.senderId.map { viewModel.mutedUserIds.contains($0) } ?? false
                                                            
                                                            VStack(alignment: .leading, spacing: 4) {
                                                                HStack {
                                                                    // Username Menu
                                                                    Menu {
                                                                        if let senderId = chatMsg.senderId {
                                                                            // Add Friend
                                                                            if !socialService.friends.contains(where: { $0.id == senderId }) && senderId != appState.currentUserId?.uuidString.lowercased() {
                                                                                Button {
                                                                                    viewModel.addFriend(participantId: senderId)
                                                                                } label: {
                                                                                    Label("Add Friend", systemImage: "person.badge.plus")
                                                                                }
                                                                            }

                                                                            // Mute Toggle
                                                                            if isMuted {
                                                                                Button {
                                                                                    viewModel.toggleMute(participantId: senderId)
                                                                                } label: {
                                                                                    Label("Unmute User", systemImage: "speaker.wave.2.fill")
                                                                                }
                                                                            } else {
                                                                                Button {
                                                                                    viewModel.toggleMute(participantId: senderId)
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
                                                                            
                                                                            // Block (Always available for strangers)
                                                                            Button(role: .destructive) {
                                                                                viewModel.blockUser(userId: senderId)
                                                                            } label: {
                                                                                Label("Block User", systemImage: "slash.circle")
                                                                            }
                                                                        }
                                                                    } label: {
                                                                        Text(chatMsg.username)
                                                                            .font(.caption.weight(.semibold))
                                                                            .foregroundColor(.blue)
                                                                    }
                                                                    .menuStyle(BorderlessButtonMenuStyle())
                                                                    
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
                                                            .id(item.id)
                                                        }
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
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                withAnimation {
                                                    proxy.scrollTo("BOTTOM", anchor: .bottom)
                                                }
                                            }
                                        }
                                    }
    
                                    VStack(spacing: 0) {
                                        if showEmojiPicker {
                                            // Emoji picker
                                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                                                ForEach(emojis, id: \.self) { emoji in
                                                    Button(action: {
                                                        viewModel.chatInput += emoji
                                                        showEmojiPicker = false
                                                    }) {
                                                        Text(emoji)
                                                    }
                                                    .buttonStyle(PlainButtonStyle())
                                                }
                                            }
                                            .padding(8)
                                            .background(Color.white.opacity(0.1))
                                            .cornerRadius(8)
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
                        // NEW: Solo Launch Toggle (Only visible if alone)
                        if viewModel.participants.count <= 1 {
                            Toggle(isOn: $viewModel.forceSoloStart) {
                                Text("Launch Solo (Don't wait for guests)")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .toggleStyle(.checkbox)
                            .padding(.bottom, 4)
                        }
                        
                            // Host controls
                        Button(action: {
                            startMovie()
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Start Playback")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                        .disabled(viewModel.isStarting)

                        if viewModel.isResolvingStream {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Resolving stream...")
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
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .monospacedDigit()
                                } else if viewModel.isPlaylistMode {
                                    Text("Next item in \(formatDuration(viewModel.timeUntilStart))")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .monospacedDigit()
                                } else {
                                    Text("Starting in \(formatDuration(viewModel.timeUntilStart))")
                                        .font(.title3)
                                        .fontWeight(.semibold)
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
        }
        .sheet(isPresented: $showPaymentGate) {
            PaymentGateView()
        }

    }  // Close lobbyContent function

    private func copyRoomID() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(room.id, forType: .string)
        viewModel.didCopyRoomID = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
        viewModel.initiateLeave()
        appState.restoreWindowFromLobby()
        appState.currentView = .browse
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
            Circle()
                .fill(participant.isHost ? Color.accentColor : Color.gray)
                .frame(width: 32, height: 32)
                .overlay(
                    Text(String(participant.name.prefix(1)))
                        .foregroundColor(.white)
                        .font(.caption.bold())
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(participant.name)
                    .foregroundColor(.white)
                    .font(.subheadline)

                if participant.isHost {
                    Text("Host")
                        .font(.caption)
                        .foregroundColor(.accentColor)
                }
            }

            Spacer()

            if participant.isReady {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }

            // Only show menu for strangers (not self, not friends)
            // Check if this participant is the current user or a friend
            let isCurrentUser = participant.id.caseInsensitiveCompare(appState.currentUserId?.uuidString ?? "") == .orderedSame
            let isFriend = socialService.friends.contains(where: { $0.id.caseInsensitiveCompare(participant.id) == .orderedSame })
            
            // Only show menu if it's a stranger AND (we can add friend OR mute OR kick OR block)
            if !isCurrentUser && !isFriend && (canAddFriend || canKick || canBlock) {
                Menu {
                    if canAddFriend {
                         Button(action: onAddFriend) {
                            Label("Add Friend", systemImage: "person.badge.plus")
                        }
                    }
                    
                    Button(action: onMute) {
                        Label(isMuted ? "Unmute" : "Mute", systemImage: isMuted ? "speaker.wave.2" : "speaker.slash")
                    }

                    if canKick {
                        Divider()
                        
                        Button(role: .destructive, action: onKick) {
                            Label("Kick Participant", systemImage: "xmark.circle")
                        }
                    }
                    
                    if canBlock {
                        Button(role: .destructive, action: onBlock) {
                            Label("Block User", systemImage: "slash.circle")
                        }
                    }

                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 20))
                }
                .menuStyle(BorderlessButtonMenuStyle())
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
                .font(.caption)
                .fontWeight(.medium)
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
    let onRemove: () -> Void
    let onPlay: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Index number
            Text("\(index + 1)")
                .font(.caption)
                .fontWeight(.bold)
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
                    .font(.subheadline)
                    .fontWeight(isCurrent ? .semibold : .regular)
                    .foregroundColor(.white)
                    .lineLimit(1)

                if let runtime = item.mediaItem.runtime {
                    Text(runtime)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                }
            }

            Spacer()

            // Play button (Host only, if not current)
            if isHost && !isCurrent {
                Button(action: onPlay) {
                    Image(systemName: "play.circle")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 18))
                }
                .buttonStyle(PlainButtonStyle())
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
