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
    private let quickReactions = ["😂", "❤️", "🔥", "👏", "😮", "😢", "😭", "🎉", "💯", "💀", "🤬", "🤮", "😴"]

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
            
            // Auto-focus the input field ONLY if explicitly toggled (prevents stealing focus on load)
            if viewModel.isAnimatingChatToggle && chatMode != .friends {
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
    
    // MARK: - List Views
    
    private var eventChatList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(eventChatService.messages.suffix(maxVisibleMessages), id: \.id) { message in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.username)
                                .font(.caption.weight(.semibold))
                                .foregroundColor(.purple) // Events get purple
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
                    VStack(alignment: .leading, spacing: 4) {
                        Text(message.username)
                            .font(.caption.weight(.semibold))
                            .foregroundColor(.blue)
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

    private func dmMessagesList(friend: Friend) -> some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    if case .dm(let friend) = chatMode, let messages = socialService.messages[friend.id] {
                        ForEach(messages) { message in
                            let isMe = message.senderId.uuidString.lowercased() != friend.id.lowercased()
                            HStack {
                                if isMe { Spacer() }
                                VStack(alignment: isMe ? .trailing : .leading, spacing: 4) {
                                    Text(message.content)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(isMe ? Color.blue : Color.white.opacity(0.2))
                                        .cornerRadius(12)
                                }
                                if !isMe { Spacer() }
                            }
                            .id(message.id)
                        }
                    }
                }
                .padding()
            }
            .onChange(of: getMessageCount()) { _ in
                if case .dm(let friend) = chatMode {
                    scrollToBottom(proxy: proxy, lastId: socialService.messages[friend.id]?.last?.id)
                    // Mark as read
                    Task { await socialService.clearUnread(friendId: friend.id) }
                }
            }
            .onAppear {
                if case .dm(let friend) = chatMode {
                    scrollToBottom(proxy: proxy, lastId: socialService.messages[friend.id]?.last?.id)
                    Task { await socialService.clearUnread(friendId: friend.id) }
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
            .background(Color.white.opacity(0.1))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
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
            viewModel.sendMessage(contentToSend)
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
        switch chatMode {
        case .event:
            eventChatService.sendReaction(emoji)
        case .room:
            viewModel.sendReaction(emoji)
        default:
            break
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
}

struct FriendRowButton: View {
    let friend: Friend
    let unreadCount: Int
    let action: () -> Void
    @EnvironmentObject var appState: AppState
    @State private var isHovering: Bool = false

    var body: some View {
        HStack(spacing: 8) {
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
                        Text(friend.displayName)
                            .foregroundColor(.white)
                            .font(.body)

                        // Activity Status
                        if let activity = SocialService.shared.friendActivity[friend.id],
                           let watching = activity.currentlyWatching {
                            Text("Watching \(watching.mediaTitle)")
                                .font(.caption)
                                .foregroundColor(.accentColor)
                        } else if SocialService.shared.onlineUserIds.contains(friend.id) {
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
            .onHover { hovering in
                isHovering = hovering
            }

            // Join Button (if friend is in a room)
            if let activity = SocialService.shared.friendActivity[friend.id],
               let watching = activity.currentlyWatching,
               let roomId = watching.roomId {
                
                Button(action: {
                    Task { await appState.player.joinRoom(roomId: roomId) }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .help("Join \(friend.displayName)")
            } else if SocialService.shared.onlineUserIds.contains(friend.id) {
                // Online indicator
                 Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(0) // Inner padding handles it
    }
}
