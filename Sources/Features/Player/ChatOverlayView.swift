//
//  ChatOverlayView.swift
//  RedLemon
//
//  Slide-in chat overlay for Prime Watch
//

import SwiftUI

struct ChatOverlayView: View {
    @ObservedObject var viewModel: MPVPlayerViewModel
    @EnvironmentObject var appState: AppState
    @ObservedObject private var socialService = SocialService.shared
    @ObservedObject private var eventChatService = EventChatService.shared
    @StateObject private var friendsVM = FriendsViewModel()
    
    @FocusState private var isInputFocused: Bool
    @State private var inputText: String = ""
    @State private var showEmojiPicker: Bool = false
    @State private var manualFocus: Bool = false
    @State private var showParticipantsList: Bool = false
    @State private var isAnnouncementMode: Bool = false // Host Announcement Mode
    @State private var didCopyRoomCode: Bool = false // Room code copy confirmation

    // Chat Modes
    enum ChatMode: Equatable {
        case event
        case room
        case friends
        case dm(Friend)
    }
    @State private var chatMode: ChatMode

    init(viewModel: MPVPlayerViewModel, initialChatMode: ChatMode = .friends) {
        self.viewModel = viewModel
        self._chatMode = State(initialValue: initialChatMode)
    }

    // Common emojis for quick access
    private let emojis = ["\u{1F602}", "\u{1F60D}", "\u{1F525}", "\u{1F44D}", "\u{2764}\u{FE0F}", "\u{1F60E}", "\u{1F389}", "\u{1F4AF}", "\u{1F62D}", "\u{1F914}", "\u{1F440}", "\u{2728}", "\u{1F3AC}", "\u{1F37F}", "\u{1F631}", "\u{1F923}"]

    // ✅ Performance limit
    private let maxVisibleMessages = 100
    
    // Quick Reactions
    private let quickReactions = ["😂", "😮", "🤔", "😭", "😢", "💀", "❤️", "🔥", "👏", "🎉", "👀", "🤬", "🤮", "😴"]

    var body: some View {
        VStack(spacing: 0) {
            header
            roomCodeHeader

            switch chatMode {
            case .event:
                eventChatList
            case .room:
                messagesList
            case .friends:
                friendsList
            case .dm(let friend):
                dmMessagesList(friend: friend)
            }

            if case .friends = chatMode {
                // No input area for friend list
            } else {
                // Only show reactions in social contexts (Room/Event)
                if appState.isEventPlayback || viewModel.isInWatchParty {
                    reactionBar
                }
                inputArea
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .compositingGroup() // Optimize transparency blending
        .onAppear {
            LoggingManager.shared.debug(.social, message: "ChatOverlayView appeared - UI UPDATE ROUND 6")
            setupInitialMode()
            
            // Connect to event chat if applicable
            if appState.isEventPlayback, let eventId = appState.currentEventId, let userId = appState.currentUserId {
                Task {
                    await eventChatService.connect(eventId: eventId, userId: userId.uuidString, username: appState.currentUsername)
                }
            }
            
            // Auto-focus the input field if chat is open (whether animated or pre-loaded)
            if viewModel.showChat && chatMode != .friends {
                LoggingManager.shared.debug(.social, message: "ChatOverlayView: Triggering input focus (showChat=true)")
                Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
                    isInputFocused = true
                    manualFocus = true
                }
            }
        }
        .onChange(of: viewModel.isInWatchParty) { inWatchParty in
            if inWatchParty {
                chatMode = .room
            }
        }
        .onChange(of: appState.isEventPlayback) { isEvent in
            if isEvent {
                chatMode = .event
            }
        }
    }
    
    private func setupInitialMode() {
        // Intelligence to pick the best default tab
        if appState.isEventPlayback {
            chatMode = .event
        } else if viewModel.isInWatchParty {
            chatMode = .room
        } else {
            chatMode = .friends
        }
    }

    private var header: some View {
        VStack(spacing: 0) {
            HStack {
                if case .dm(let friend) = chatMode {
                    Button(action: { chatMode = .friends }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.white)
                    }
                    .buttonStyle(.plain)

                    Spacer()
                    
                    Text(friend.displayName)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Invisible spacer balance
                    Color.clear.frame(width: 50, height: 1)
                } else {
                    // Custom Segmented Control for better visibility
                    HStack(spacing: 2) {
                        if appState.isEventPlayback {
                            tabButton(title: "Event", mode: .event)
                        } else if !viewModel.isInWatchParty {
                            // Only show mute list directly in single event mode? 
                            // Actually better to have it always accessible if someone is muted
                        }
                        
                        // Show "Room" if we are in a legit room (Watch Party) OR we are in an event (which is also a room)
                        // But if we are in an event, we usually prefer "Event" tab for public chat.
                        // However, user might be in a PRIVATE party viewing the event.
                        if viewModel.isInWatchParty {
                            tabButton(title: "Room", mode: .room)
                        }
                        
                        tabButton(title: "Friends", mode: .friends, badge: totalUnreadCount)
                    }
                    .padding(2)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    // Dynamic width based on tabs
                }

                if case .dm = chatMode {
                    // No extra controls in DM header for now
                } else {
                    Spacer()
                    

                    // Reaction Toggle
                    Button(action: {
                        withAnimation {
                            viewModel.areReactionsEnabled.toggle()
                        }
                    }) {
                        Image(systemName: viewModel.areReactionsEnabled ? "eye.fill" : "eye.slash.fill")
                            .font(.system(size: 14))
                            .foregroundColor(viewModel.areReactionsEnabled ? .white.opacity(0.8) : .white.opacity(0.4))
                            .padding(6)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                    .help(viewModel.areReactionsEnabled ? "Hide Reactions" : "Show Reactions")
                    .padding(.trailing, 4)
                    
                    // Close Button
                    Button(action: { viewModel.toggleChat() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing, 8)
                }
            }
            .padding(10)
            .background(Color.black.opacity(0.3))
        }
    }
    
    private var roomCodeHeader: some View {
        Group {
            if case .room = chatMode,
               let room = appState.player.currentWatchPartyRoom,
               room.type == .userRoom {
                HStack {
                    Spacer()
                    Text("Room Code:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                    
                    HStack(spacing: 6) {
                        Text(room.id)
                            .font(.system(.caption, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(5)
                        
                        Button(action: {
                            NSPasteboard.general.clearContents()
                            NSPasteboard.general.setString(room.id, forType: .string)
                            withAnimation {
                                didCopyRoomCode = true
                            }
                            // Reset after 2 seconds
                            // Reset after 2 seconds
                            Task { @MainActor in
                                try? await Task.sleep(nanoseconds: 2_000_000_000) // 2s
                                withAnimation {
                                    didCopyRoomCode = false
                                }
                            }
                        }) {
                            Image(systemName: didCopyRoomCode ? "checkmark.circle.fill" : "doc.on.doc")
                                .font(.system(size: 12))
                                .foregroundColor(didCopyRoomCode ? .green : .white.opacity(0.7))
                        }
                        .buttonStyle(.plain)
                        .help("Copy Room Code")
                    }
                    Spacer()
                }
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.05))
            }
        }
    }

    // MARK: - List Views
    
    private func userMenu(username: String, userId: String?, isSystem: Bool, isHost: Bool, isPremium: Bool, isSenderHost: Bool, timestamp: String? = nil) -> some View {
        let nameColor: Color = isSystem ? .gray : (isSenderHost ? DesignSystem.Colors.accent : Constants.avatarColor(for: username))

        if isSystem {
            return AnyView(
                Text(username)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(nameColor)
            )
        }
        
        let uid = userId ?? ""
        let myId = appState.currentUserId?.uuidString ?? ""
        let isMe = uid.caseInsensitiveCompare(myId) == .orderedSame
        let isFriend = socialService.friends.contains(where: { $0.id.caseInsensitiveCompare(uid) == .orderedSame })
        
        // If it's me, just show text (no actions)
        if isMe {
            return AnyView(
                HStack(spacing: 4) {
                    Text(username)
                        .font(.caption.weight(.semibold))
                        .foregroundColor(nameColor)
                    
                    if isSenderHost {
                        Text("Host")
                            .font(.caption2.weight(.bold))
                            .foregroundColor(.accentColor)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 1)
                            .background(Color.accentColor.opacity(0.15))
                            .cornerRadius(4)
                    }

                    if isPremium {
                        Text("👑")
                            .font(.system(size: 10))
                            .help("Premium User")
                    }

                    if let timestamp = timestamp {
                        Text(timestamp)
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.4))
                            .padding(.leading, 4)
                    }
                }
            )
        }
        
        return AnyView(
            HStack(spacing: 4) {
                Text(username)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(nameColor)
                
                if isSenderHost {
                    Text("Host")
                        .font(.caption2.weight(.bold))
                        .foregroundColor(DesignSystem.Colors.accent)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 1)
                        .background(DesignSystem.Colors.accent.opacity(0.15))
                        .cornerRadius(4)
                }

                if isPremium {
                    Text("👑")
                        .font(.system(size: 10))
                        .help("Premium User")
                }

                if let timestamp = timestamp {
                    Text(timestamp)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.4))
                        .padding(.leading, 4)
                }
                
                Menu {
                Text(username) // Header

                // Friend Actions
                if isFriend {
                    Button(action: {
                        Task { await socialService.removeFriend(friendId: uid) }
                    }) {
                        Label("Remove Friend", systemImage: "person.badge.minus")
                    }
                } else {
                    Button(action: {
                        Task { _ = await socialService.sendRequest(toUserId: uid) }
                    }) {
                        Label("Add Friend", systemImage: "person.badge.plus")
                    }
                }
                 
                // Mute (Always available)
                Button(action: {
                    viewModel.toggleMute(userId: uid)
                }) {
                    Label(viewModel.mutedUserIds.contains(uid) ? "Unmute User" : "Mute User",
                          systemImage: viewModel.mutedUserIds.contains(uid) ? "speaker.wave.2" : "speaker.slash")
                }
                
                // Block (Always available)
                 Button(role: .destructive, action: { viewModel.blockUser(uid, username: username) }) {
                    Label("Block User", systemImage: "slash.circle")
                }
                
                // Kick (Host Only)
                if isHost {
                    Divider()
                    Button(role: .destructive, action: { viewModel.kickUser(uid) }) {
                        Label("Kick User", systemImage: "xmark.circle")
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
            .menuStyle(.borderlessButton)
            .menuIndicator(.hidden)
            }
        )
    }

    private var eventChatList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(eventChatService.messages.suffix(maxVisibleMessages), id: \.id) { message in
                        let isMuted = viewModel.mutedUserIds.contains(message.senderId ?? "")
                        
                        // Show message (masked if muted)
                        VStack(alignment: .leading, spacing: 4) {
                            userMenu(username: message.username, userId: message.senderId, isSystem: message.isSystem, isHost: false, isPremium: message.isPremium, isSenderHost: false) 
                            
                            if isMuted {
                                Text("Message muted")
                                    .font(.caption)
                                    .italic()
                                    .foregroundColor(.white.opacity(0.5))
                            } else {
                                Text(message.text)
                                    .font(.body)
                                    .foregroundColor(.white)
                                
                                Text(message.timestamp.toMessageTime())
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.4))
                                    .padding(.top, 2)
                            }
                        }
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                        .id(message.id)
                        .opacity(isMuted ? 0.6 : 1.0)
                    }
                }
                .padding()
            }
            .onChange(of: eventChatService.messages.count) { _ in
                if let lastId = eventChatService.messages.last?.id {
                     withAnimation { proxy.scrollTo(lastId, anchor: .bottom) }
                }
            }
        }
    }

    private var messagesList: some View {
        let hostId = appState.player.currentWatchPartyRoom?.hostId

        return ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                // ✅ Show only most recent messages for performance
                // Reversed for inverted list (bottom-up)
                ForEach(Array(viewModel.messages.suffix(maxVisibleMessages)).reversed(), id: \.id) { message in
                    messageRow(message, hostId: hostId)
                }
            }
            .padding()
        }
        .rotationEffect(.degrees(180)) // Invert list
        .scaleEffect(x: -1, y: 1, anchor: .center)
    }

    private func messageRow(_ message: ChatMessage, hostId: String?) -> some View {
        let isMuted = viewModel.mutedUserIds.contains(message.senderId ?? "")
        let isSenderHost = (message.senderId != nil && hostId != nil && message.senderId!.caseInsensitiveCompare(hostId!) == .orderedSame)
        
        return VStack(alignment: .leading, spacing: 4) {
            userMenu(username: message.username, userId: message.senderId, isSystem: message.isSystem, isHost: viewModel.isWatchPartyHost, isPremium: message.isPremium, isSenderHost: isSenderHost, timestamp: message.timestamp.toMessageTime())
            
            if isMuted {
                Text("Message muted")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.white.opacity(0.5))
            } else {
                Text(message.text)
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
        .padding(12)
        .background(Color.black.opacity(0.2))
        .cornerRadius(8)
        .id(message.id)
        .rotationEffect(.degrees(180)) // Correct text orientation
        .scaleEffect(x: -1, y: 1, anchor: .center)
        .opacity(isMuted ? 0.6 : 1.0)
    }

    private var friendsList: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                // Large List Prompt in Overlay
                if friendsVM.isLargeListMode && friendsVM.searchText.isEmpty {
                     Text("Showing online & recent")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.vertical, 4)
                }

                ForEach(friendsVM.displayedFriends) { friend in
                    FriendRowButton(friend: friend, unreadCount: socialService.unreadCounts[friend.id] ?? 0) {
                        openDM(friend)
                    }
                    .id(friend.id)
                }
                
                if friendsVM.isReady {
                    if friendsVM.displayedFriends.isEmpty {
                        Text("No friends found")
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    }
                } else {
                    ProgressView()
                        .scaleEffect(0.8)
                        .padding(.top, 20)
                }
            }
            .padding()
        }
    }

// ... (existing code)

    private func dmMessagesList(friend: Friend) -> some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    if case .dm(let friend) = chatMode, let messages = socialService.messages[friend.id] {
                        ForEach(messages) { message in
                            let isMe = message.senderId.uuidString.lowercased() != friend.id.lowercased()
                            HStack {
                                if isMe { Spacer() }
                                
                                if message.content.hasPrefix("INVITE|") {
                                    InviteMessageView(message: message, isMe: isMe)
                                } else {
                                    VStack(alignment: isMe ? .trailing : .leading, spacing: 4) {
                                        Text(message.content)
                                            .font(.body)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(isMe ? Color.blue : Color(white: 0.2))
                                            .cornerRadius(12)
                                        
                                        Text(message.createdAt.toMessageTime())
                                            .font(.caption2)
                                            .foregroundColor(.white.opacity(0.4))
                                            .padding(.horizontal, 4)
                                    }
                                }
                                
                                if !isMe { Spacer() }
                            }
                            .id(message.id)
                        }
                    } else {
                        // Pending state or empty
                        Text("Start a conversation")
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    }
                }
                .padding()
            }
            .onChange(of: getMessageCount()) { _ in
                if case .dm(let friend) = chatMode {
                    scrollToBottom(proxy: proxy, lastId: socialService.messages[friend.id]?.last?.id)
                    // Mark as read
                    Task { socialService.clearUnread(friendId: friend.id) }
                }
            }
            .onAppear {
                if case .dm(let friend) = chatMode {
                    scrollToBottom(proxy: proxy, lastId: socialService.messages[friend.id]?.last?.id)
                    Task { socialService.clearUnread(friendId: friend.id) }
                }
            }
        }
    }
    
    private func openDM(_ friend: Friend) {
        chatMode = .dm(friend)
        Task { await socialService.loadMessages(friendId: friend.id) }
    }

    private func getMessageCount() -> Int {
        if case .dm(let friend) = chatMode {
            return socialService.messages[friend.id]?.count ?? 0
        }
        return 0
    }

    private func scrollToBottom(proxy: ScrollViewProxy, lastId: AnyHashable?) {
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
            if let id = lastId {
                withAnimation {
                    proxy.scrollTo(id, anchor: .bottom)
                }
            }
        }
    }

    private var inputArea: some View {
        VStack(spacing: 0) {
            // Emoji picker (appears above)
            if showEmojiPicker {
                emojiPicker
                    .padding(.bottom, 8)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            // Unified Input Bar (Sleek)
            HStack(alignment: .bottom, spacing: 6) {
                
                if chatMode != .friends {
                    // Emoji button (Hide in search mode)
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            showEmojiPicker.toggle()
                        }
                    }) {
                        Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                            .font(.system(size: 18))
                            .foregroundColor(showEmojiPicker ? .yellow : .white.opacity(0.7))
                            .frame(width: 22, height: 22)
                            // Align visually with text center (approx)
                            .padding(.bottom, 5)
                    }
                    .buttonStyle(.plain)

                    // Host Announcement Toggle (Megaphone)
                    if viewModel.isWatchPartyHost && chatMode == .room {
                        Button(action: {
                            withAnimation { isAnnouncementMode.toggle() }
                        }) {
                            Image(systemName: isAnnouncementMode ? "megaphone.fill" : "megaphone")
                                .font(.system(size: 16))
                                .foregroundColor(isAnnouncementMode ? .yellow : .white.opacity(0.5))
                                .frame(width: 22, height: 22)
                                .padding(.bottom, 5)
                        }
                        .buttonStyle(.plain)
                        .help("Broadcast Announcement")
                    }
                } else {
                     // Search Icon for Friends mode
                     Image(systemName: "magnifyingglass")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.5))
                        .frame(width: 22, height: 22)
                        .padding(.bottom, 5)
                }

                // Input Field
                Group {
                    if #available(macOS 13.0, *) {
                        TextField(inputPlaceholder, text: (chatMode == .friends) ? $friendsVM.searchText : $inputText, axis: .vertical)
                            .textFieldStyle(.plain)
                            .foregroundColor(.white)
                            .focused($isInputFocused)
                            .lineLimit(1...5)
                            .onSubmit { 
                                if chatMode != .friends { sendMessage() }
                            }
                    } else {
                        // Fallback for macOS 12
                        ZStack(alignment: .topLeading) {
                            if (chatMode == .friends ? friendsVM.searchText : inputText).isEmpty {
                                Text(inputPlaceholder)
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 4) // Align with text cursor
                                    .padding(.top, 0)
                                    .allowsHitTesting(false)
                            }
                            
                            if chatMode == .friends {
                                TextField("", text: $friendsVM.searchText)
                                    .textFieldStyle(.plain)
                                    .foregroundColor(.white)
                            } else {
                                TransparentTextEditor(text: $inputText, onCommit: sendMessage, isFocused: manualFocus)
                                    .frame(minHeight: 20, maxHeight: 100)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                    }
                }
                
                if chatMode != .friends {
                    // Send Button
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 20))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(inputText.isEmpty ? .gray : .blue)
                    }
                    .buttonStyle(.plain)
                    .disabled(inputText.isEmpty)
                    .padding(.bottom, 2)
                }
            }
            .padding(.horizontal, 8)
            .padding(.horizontal, 8)
            .background(isAnnouncementMode ? Color.yellow.opacity(0.2) : Color.white.opacity(0.1))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isAnnouncementMode ? Color.yellow.opacity(0.8) : Color.white.opacity(0.1), lineWidth: isAnnouncementMode ? 1.0 : 0.5)
            )
            .padding(.horizontal, 16)
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            .frame(height: 32)
        }
    }
    
    private var inputPlaceholder: String {
        switch chatMode {
        case .friends: return "Search friends..."
        case .room: return isAnnouncementMode ? "Broadcast to Room..." : "Chat (⌘)"
        case .event: return "Chat (⌘)"
        case .dm: return "Chat (⌘)"
        }
    }

    private var emojiPicker: some View {
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
                        inputText += emoji
                        isInputFocused = true
                        manualFocus = true
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

    private func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let contentToSend = inputText
        inputText = ""

        switch chatMode {
        case .event:
            Task { await eventChatService.sendMessage(contentToSend) }
        case .room:
            if isAnnouncementMode && viewModel.isWatchPartyHost {
                viewModel.sendAnnouncement(contentToSend)
                // Auto-disable after sending to prevent spam? 
                // Let's keep it enabled for multi-message flows, user can toggle off.
            } else {
                viewModel.sendMessage(contentToSend)
            }
        case .friends:
            break
        case .dm(let friend):
            Task { await socialService.sendMessage(to: friend.id, content: contentToSend) }
        }
    }
    
    private var totalUnreadCount: Int {
        socialService.unreadCounts.values.reduce(0, +)
    }

    private var reactionBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(quickReactions, id: \.self) { emoji in
                    Button(action: {
                        sendReaction(emoji)
                    }) {
                        Text(emoji)
                            .font(.system(size: 20))
                            .frame(width: 36, height: 36)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 8)
        .background(Color.black.opacity(0.3)) // Slight separation
        // Ensure frame height is sufficient
        .frame(height: 52)
        .overlay(
            HStack {
                Spacer()
                LinearGradient(
                    gradient: Gradient(colors: [.clear, Color.black.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 40)
            }
            .allowsHitTesting(false)
        )
    }
    
    private func sendReaction(_ emoji: String) {
        // Route reaction based on Playback Context, not UI Tab
        if appState.isEventPlayback {
            eventChatService.sendReaction(emoji)
        } else if viewModel.isInWatchParty {
            viewModel.sendReaction(emoji)
        } else {
            // Solo playback or unknown: Default to PlayerViewModel for local display
            viewModel.sendReaction(emoji)
        }
    }

    private func tabButton(title: String, mode: ChatMode, badge: Int = 0) -> some View {
        Button(action: { chatMode = mode }) {
            HStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                
                if badge > 0 {
                    Text("\(badge)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(Color.red)
                        .cornerRadius(8)
                }
            }
            .foregroundColor(chatMode == mode ? .white : .white.opacity(0.5))
            .padding(.horizontal, 12)
            .frame(height: 28)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(chatMode == mode ? Color.white.opacity(0.2) : Color.clear)
            )
        }
        .buttonStyle(.plain)
    }


    private func resolveUsername(userId: String) -> String {
        // 1. Check Friends
        if let friend = socialService.friends.first(where: { $0.id == userId }) {
            return friend.username
        }
        
        // 2. Check Room Messages
        if let msg = viewModel.messages.first(where: { $0.senderId == userId }) {
            return msg.username
        }
        
        // 3. Check Event Messages
        if let msg = eventChatService.messages.first(where: { $0.senderId == userId }) {
            return msg.username
        }
        
        return "Unknown User"
    }
}

struct InviteMessageView: View {
    let message: DirectMessage
    let isMe: Bool
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        let components = message.content.split(separator: "|")
        if components.count >= 3 {
            let roomId = String(components[1])
            let roomName = String(components[2])
            
            VStack(spacing: 4) {
                Text("🎬 Watch Party Invite")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(isMe ? .white.opacity(0.8) : .secondary)
                
                Text(roomName)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                if !isMe {
                    Button(action: {
                        Task {
                            await appState.player.joinRoom(roomId: roomId)
                        }
                    }) {
                        Text("Join")
                            .font(.caption2.weight(.bold))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(8)
            .background(isMe ? Color.blue.opacity(0.8) : Color.white.opacity(0.1))
            .cornerRadius(8)
        } else {
            EmptyView()
        }
    }
}

struct FriendRowButton: View {
    let friend: Friend
    let unreadCount: Int
    let action: () -> Void
    @EnvironmentObject var appState: AppState
    @State private var isHovering: Bool = false
    @State private var isJoining: Bool = false

    var body: some View {
        let isOnline = SocialService.shared.onlineUserIds.contains(friend.id)
        let activity = SocialService.shared.friendActivity[friend.id]
        
        // Determine Room contexts
        let myRoomId = appState.player.currentWatchPartyRoom?.id
        let friendRoomId = activity?.currentlyWatching?.roomId
        
        // Check if we are in the same room
        let isSameRoom = (myRoomId != nil && friendRoomId != nil && myRoomId == friendRoomId)
        
        // Logic for Buttons
        // Show Join if friend is in a room AND NOT in same room (regardless of premium/free)
        let canJoin = (friendRoomId != nil) && !isSameRoom
        
        // Show Invite if I am in a room AND friend is online AND NOT in same room
        // User request: "only have envelopes ... for users that are online"
        let canInvite = (myRoomId != nil) && isOnline && !isSameRoom

        return HStack(spacing: 8) {
            // Main Row Action (Open DM) - Wrapper Button
            Button(action: action) {
                HStack {
                    // Avatar
                    ZStack(alignment: .topTrailing) {
                        Circle()
                            .fill(Constants.avatarColor(for: friend.username))
                            .frame(width: 32, height: 32)
                            .overlay(Text(friend.username.prefix(1).uppercased()).foregroundColor(.white))
                        
                        if unreadCount > 0 {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 12, height: 12)
                                .overlay(Text("\(unreadCount)").font(.system(size: 8)).foregroundColor(.white))
                                .offset(x: 2, y: -2)
                        }
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 4) {
                            Text(friend.displayName)
                                .foregroundColor(.white)
                                .font(.body)
                            
                            // Premium Host Badge
                            if friend.isPremium == true {
                                Text("👑")
                                    .font(.system(size: 12))
                                    .help("Premium Host")
                            }
                        }

                        // Activity Status
                        if let activity = activity {
                            // Priority 1: Custom status (e.g., "In Lobby: Movie Name")
                            if let status = activity.customStatus, !status.isEmpty, status != "online" {
                                Text(status)
                                    .font(.caption)
                                    .foregroundColor(.accentColor)
                            } else if let watching = activity.currentlyWatching {
                                Text("Watching \(watching.mediaTitle)")
                                    .font(.caption)
                                    .foregroundColor(.accentColor)
                            } else if isOnline {
                                Text("Online")
                                    .font(.caption)
                                    .foregroundColor(.green)
                            } else {
                                Text("Offline")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        } else if isOnline {
                             Text("Online")
                                 .font(.caption)
                                 .foregroundColor(.green)
                         } else {
                             Text("Offline")
                                 .font(.caption)
                                 .foregroundColor(.secondary)
                         }
                    }
                    
                    Spacer()
                }
                .padding(8)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .background(isHovering ? Color.white.opacity(0.2) : Color.clear)
            .cornerRadius(8)
            .contextMenu {
                Button(role: .destructive, action: {
                    Task { await SocialService.shared.blockUser(userId: friend.id) }
                }) {
                    Label("Block User", systemImage: "slash.circle")
                }
            }
            .onHover { hovering in
                isHovering = hovering
            }

            // Action Buttons Group
            HStack(spacing: 4) {
                // Online Indicator (Requested: "green online indicator beside the envelope")
                // We show it for any online user, even if buttons are also shown.
                // If they are offline, no indicator.
                if isOnline {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                        .help("Online")
                        .padding(.trailing, 4)
                }
                
                // Invite Button
                if canInvite {
                   Button(action: {
                       let room = appState.player.currentWatchPartyRoom
                       let roomName = room?.mediaItem?.name ?? "Watch Party"
                       let rId = room?.id ?? ""
                       
                       if !rId.isEmpty {
                           Task {
                               await SocialService.shared.sendInvite(to: friend.id, roomId: rId, roomName: roomName)
                           }
                       }
                   }) {
                       Image(systemName: "envelope.fill")
                           .foregroundColor(.white.opacity(0.8))
                           .font(.system(size: 16))
                           .padding(6)
                           .background(Color.white.opacity(0.1))
                           .clipShape(Circle())
                   }
                   .buttonStyle(.plain)
                   .help("Invite to Room")
                }
                
                // Join Button
                if canJoin, let rId = friendRoomId {
                    Button(action: {
                        isJoining = true
                        Task {
                            await appState.player.joinRoom(roomId: rId)
                            await MainActor.run { isJoining = false }
                        }
                    }) {
                        if isJoining {
                            ProgressView()
                                .controlSize(.small)
                                .scaleEffect(0.7)
                                .frame(width: 20, height: 20)
                        } else {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                    }
                    .buttonStyle(.plain)
                    .disabled(isJoining)
                    .help("Join \(friend.displayName)")
                }
            }
        }
        .padding(0) // Inner padding handles it
    }

    private func isMessageSenderHost(_ message: ChatMessage) -> Bool {
        guard let senderId = message.senderId else { return false }
        return senderId == appState.player.currentWatchPartyRoom?.hostId
    }
}

// Helper extension for clean timestamp formatting
extension Date {
    func toMessageTime() -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: self)
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, HH:mm"
            return formatter.string(from: self)
        }
    }
}
