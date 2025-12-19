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
    
    @FocusState private var isInputFocused: Bool
    @State private var inputText: String = ""
    @State private var showEmojiPicker: Bool = false
    @State private var manualFocus: Bool = false
    @State private var showParticipantsList: Bool = false
    @State private var isAnnouncementMode: Bool = false // Host Announcement Mode

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
                reactionBar
                inputArea
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .compositingGroup() // Optimize transparency blending
        .onAppear {
            print("👁️ ChatOverlayView appeared - UI UPDATE ROUND 6")
            setupInitialMode()
            
            // Connect to event chat if applicable
            if appState.isEventPlayback, let eventId = appState.currentEventId, let userId = appState.currentUserId {
                Task {
                    await eventChatService.connect(eventId: eventId, userId: userId.uuidString, username: appState.currentUsername)
                }
            }
            
            // Auto-focus the input field if chat is open (whether animated or pre-loaded)
            if viewModel.showChat && chatMode != .friends {
                print("⌨️ ChatOverlayView: Triggering input focus (showChat=true)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
                    
                    // Muted Users Menu
                    if !viewModel.mutedUserIds.isEmpty {
                        Menu {
                            Text("Muted Users")
                            Divider()
                            ForEach(Array(viewModel.mutedUserIds), id: \.self) { userId in
                                Button(action: {
                                    viewModel.toggleMute(userId: userId)
                                }) {
                                    Label("Unmute \(resolveUsername(userId: userId))", systemImage: "speaker.wave.2")
                                }
                            }
                        } label: {
                            Image(systemName: "speaker.slash.circle.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.red.opacity(0.8))
                                .padding(6)
                                .background(Color.white.opacity(0.1))
                                .clipShape(Circle())
                        }
                        .menuStyle(.borderlessButton)
                        .padding(.trailing, 4)
                        .help("Manage Muted Users")
                    }
                    
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
    
    // MARK: - List Views
    
    private func userMenu(username: String, userId: String?, isSystem: Bool, isHost: Bool) -> some View {
        if isSystem {
            return AnyView(
                Text(username)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.blue)
            )
        }
        
        let uid = userId ?? ""
        let myId = appState.currentUserId?.uuidString ?? ""
        let isMe = uid.caseInsensitiveCompare(myId) == .orderedSame
        let isFriend = socialService.friends.contains(where: { $0.id.caseInsensitiveCompare(uid) == .orderedSame })
        
        // Debug Interaction
        if username == "lemontom" || username == "ursinho" { // Debug specifics
             print("[DEBUG MENU] User: \(username) | UID: '\(uid)' | MyID: '\(myId)' | isMe: \(isMe) | isFriend: \(isFriend)")
        }
        
        // If it's me, or if it's a friend and I'm not the host (so no kick/block), 
        // there are no actions to take. Show plain text.
        if isMe || (isFriend && !isHost) {
            return AnyView(
                Text(username)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.blue)
            )
        }
        
        return AnyView(
            Menu {
                Text(username) // Header

                if !isMe {
                     if !isFriend {
                         Button(action: {
                             Task { _ = await socialService.sendRequest(toUserId: uid) }
                         }) {
                             Label("Add Friend", systemImage: "person.badge.plus")
                         }
                         
                         // Only allow muting non-friends (as per user request)
                         Button(action: {
                             viewModel.toggleMute(userId: uid)
                         }) {
                             Label(viewModel.mutedUserIds.contains(uid) ? "Unmute" : "Mute",
                                   systemImage: viewModel.mutedUserIds.contains(uid) ? "speaker.wave.2" : "speaker.slash")
                         }
                     }
                     
                     // Host Options (Verify context)
                     if isHost {
                         Divider()
                         Button(role: .destructive, action: { viewModel.kickUser(uid) }) {
                             Label("Kick User", systemImage: "xmark.circle")
                         }
                          Button(role: .destructive, action: { viewModel.blockUser(uid) }) {
                             Label("Block User", systemImage: "slash.circle")
                         }
                     }
                }
            } label: {
                Text(username)
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.blue)
            }
            .menuStyle(.borderlessButton)
        )
    }

    private var eventChatList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(eventChatService.messages.suffix(maxVisibleMessages), id: \.id) { message in
                        if !viewModel.mutedUserIds.contains(message.senderId ?? "") {
                            VStack(alignment: .leading, spacing: 4) {
                                userMenu(username: message.username, userId: message.senderId, isSystem: message.isSystem, isHost: false) // Event chat has no host moderation
                                Text(message.text)
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                            .padding(12)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .id(message.id)
                        }
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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 12) {
                // ✅ Show only most recent messages for performance
                // Reversed for inverted list (bottom-up)
                ForEach(Array(viewModel.messages.suffix(maxVisibleMessages)).reversed(), id: \.id) { message in
                    if !viewModel.mutedUserIds.contains(message.senderId ?? "") {
                        VStack(alignment: .leading, spacing: 4) {
                            userMenu(username: message.username, userId: message.senderId, isSystem: message.isSystem, isHost: viewModel.isWatchPartyHost)
                            Text(message.text)
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(8)
                        .id(message.id)
                        .rotationEffect(.degrees(180)) // Correct text orientation
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                    }
                }
            }
            .padding()
        }
        .rotationEffect(.degrees(180)) // Invert list
        .scaleEffect(x: -1, y: 1, anchor: .center)
    }

    private var friendsList: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                // Consolidated list with custom sorting
                // 1. Unread Messages (High Priority) or Online
                // 2. Offline
                
                let sortedFriends = socialService.friends.sorted { f1, f2 in
                    // Priority 1: Unread Messages
                    let u1 = socialService.unreadCounts[f1.id] ?? 0
                    let u2 = socialService.unreadCounts[f2.id] ?? 0
                    if (u1 > 0) != (u2 > 0) {
                        return u1 > 0 // Friends with unread messages go first
                    }
                    if u1 != u2 {
                         // internal sort for unread
                        return u1 > u2 
                    }
                    
                    // Priority 2: Online Status
                    let online1 = socialService.onlineUserIds.contains(f1.id)
                    let online2 = socialService.onlineUserIds.contains(f2.id)
                    if online1 != online2 {
                        return online1 // Online friends go first (after unread check)
                    }

                    // Priority 3: Last Message Time (Recency)
                    let t1 = socialService.messages[f1.id]?.last?.createdAt ?? Date.distantPast
                    let t2 = socialService.messages[f2.id]?.last?.createdAt ?? Date.distantPast
                    if t1 != t2 {
                         return t1 > t2
                    }
                    
                    // Priority 4: Alphabetical
                    return f1.displayName < f2.displayName
                }

                ForEach(sortedFriends) { friend in
                    FriendRowButton(friend: friend, unreadCount: socialService.unreadCounts[friend.id] ?? 0) {
                        openDM(friend)
                    }
                    .id(friend.id) // Simple ID, no duplicates possible
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
                                    Text(message.content)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(isMe ? Color.blue : Color(white: 0.2))
                                        .cornerRadius(12)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
                // Emoji button
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

                // Input Field
                Group {
                    if #available(macOS 13.0, *) {
                        TextField("Chat (⌘)", text: $inputText, axis: .vertical)
                            .textFieldStyle(.plain)
                            .foregroundColor(.white)
                            .focused($isInputFocused)
                            .lineLimit(1...5)
                            .onSubmit { sendMessage() }
                    } else {
                        // Fallback for macOS 12
                        ZStack(alignment: .topLeading) {
                            if inputText.isEmpty {
                                Text("Chat (⌘)")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 4) // Align with text cursor
                                    .padding(.top, 0)
                                    .allowsHitTesting(false)
                            }
                            
                            TransparentTextEditor(text: $inputText, onCommit: sendMessage, isFocused: manualFocus)
                                .frame(minHeight: 20, maxHeight: 100)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                    }
                }

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
                        Task { await appState.player.joinRoom(roomId: rId) }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(.green)
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                    .help("Join \(friend.displayName)")
                }
            }
        }
        .padding(0) // Inner padding handles it
    }

}
