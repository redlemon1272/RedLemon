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
    @FocusState private var isInputFocused: Bool
    @State private var inputText: String = ""
    @State private var showEmojiPicker: Bool = false
    @State private var manualFocus: Bool = false
    @State private var showParticipantsList: Bool = false

    // Chat Modes
    enum ChatMode {
        case room
        case friends
        case dm(Friend)
    }
    @State private var chatMode: ChatMode = .room

    // Common emojis for quick access
    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    // ✅ Performance limit
    private let maxVisibleMessages = 100

    var body: some View {
        VStack(spacing: 0) {
            header

            switch chatMode {
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
                inputArea
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .compositingGroup() // Optimize transparency blending
        .onAppear {
            print("👁️ ChatOverlayView appeared - UI UPDATE ROUND 5 VERIFIED ✅")
            // Auto-focus the input field ONLY if explicitly toggled (prevents stealing focus on load)
            if viewModel.isAnimatingChatToggle {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isInputFocused = true
                    manualFocus = true
                }
            }
        }
    }

    private var header: some View {
        VStack(spacing: 0) {
            HStack {
                if case .dm(let friend) = chatMode {
                    Button(action: { chatMode = .friends }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.plain)

                    Text(friend.displayName)
                        .font(.headline)
                        .foregroundColor(.white)
                } else {
                    // Custom Segmented Control for better visibility
                    HStack(spacing: 2) {
                        tabButton(title: "Room", isSelected: isRoomMode) {
                            chatMode = .room
                        }
                        tabButton(title: "Friends", isSelected: isFriendsMode) {
                            chatMode = .friends
                        }
                    }
                    .padding(2)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .frame(width: 160)
                }

                Spacer()

                // Participant Count (for room chat only)
                if case .room = chatMode, let room = appState.player.currentWatchPartyRoom {
                    Button(action: { showParticipantsList.toggle() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 11))
                            Text("\(room.participants.count)")
                                .font(.system(size: 13, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                )
                        )
                    }
                    .buttonStyle(.plain)
                    .popover(isPresented: $showParticipantsList, arrowEdge: .bottom) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Participants (\(room.participants.count))")
                                .font(.headline)
                                .padding(.bottom, 4)
                            
                            ScrollView {
                                VStack(alignment: .leading, spacing: 8) {
                                    ForEach(room.participants) { participant in
                                        HStack {
                                            Circle()
                                                .fill(Color.blue.opacity(0.8))
                                                .frame(width: 24, height: 24)
                                                .overlay(Text(participant.name.prefix(1).uppercased()).font(.caption).foregroundColor(.white))
                                            
                                            Text(participant.name)
                                                .font(.body)
                                            
                                            if participant.isHost {
                                                Text("HOST")
                                                    .font(.system(size: 9, weight: .bold))
                                                    .padding(.horizontal, 4)
                                                    .padding(.vertical, 2)
                                                    .background(Color.yellow)
                                                    .foregroundColor(.black)
                                                    .cornerRadius(4)
                                            }
                                            
                                            Spacer()
                                        }
                                        .padding(.vertical, 2)
                                    }
                                }
                            }
                            .frame(maxHeight: 250)
                        }
                        .padding()
                        .frame(width: 250)
                    }
                }

                Button(action: { viewModel.toggleChat() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16)) // Round 3: Aggressive reduction to 16pt
                        .foregroundColor(.white.opacity(0.7))
                }
                .buttonStyle(.plain)
                .padding(.trailing, 8) // Round 5: Explicitly pull away from right edge
            }
            .padding(10) // Round 4: Reduced from generic .padding() (16) to 10
            .background(Color.black.opacity(0.3))
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
                // Online Friends
                if !socialService.onlineUserIds.isEmpty {
                    Section(header: Text("Online").font(.caption).foregroundColor(.secondary).frame(maxWidth: .infinity, alignment: .leading)) {
                        ForEach(socialService.friends.filter { socialService.onlineUserIds.contains($0.id) }) { friend in
                            FriendRowButton(friend: friend) {
                                chatMode = .dm(friend)
                                Task { await socialService.loadMessages(friendId: friend.id) }
                            }
                        }
                    }
                }

                // All Friends
                Section(header: Text("All Friends").font(.caption).foregroundColor(.secondary).frame(maxWidth: .infinity, alignment: .leading)) {
                    ForEach(socialService.friends) { friend in
                        FriendRowButton(friend: friend) {
                            chatMode = .dm(friend)
                            Task { await socialService.loadMessages(friendId: friend.id) }
                        }
                    }
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
                            let isMe = message.senderId.uuidString != friend.id
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
                }
            }
        }
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
                        TextField("Message...", text: $inputText, axis: .vertical)
                            .textFieldStyle(.plain)
                            .foregroundColor(.white)
                            .focused($isInputFocused)
                            .lineLimit(1...5)
                            .onSubmit { sendMessage() }
                            //.padding(.vertical, 2) // Removed entirely for max compactness
                    } else {
                        // Fallback for macOS 12
                        ZStack(alignment: .topLeading) {
                            if inputText.isEmpty {
                                Text("Message...")
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
                        .font(.system(size: 20)) // Round 4: Reduced from 26 to 20 to allow box to shrink
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(inputText.isEmpty ? .gray : .blue)
                }
                .buttonStyle(.plain)
                .disabled(inputText.isEmpty)
                .padding(.bottom, 2)
            }
            .padding(.horizontal, 8)
            //.padding(.vertical, 2) // Removed entirely for max compactness
            .background(Color.white.opacity(0.1))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
            )
            .padding(.horizontal, 16)
            .padding(.horizontal, 16)
            .padding(.bottom, 8) // Round 3: Reduced from 16 to 8 for compactness
            .frame(height: 32) // Round 5: FORCE COMPACT HEIGHT
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
                        .font(.system(size: 20)) // Larger target
                        .foregroundColor(.white.opacity(0.6))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 4)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                ForEach(emojis, id: \.self) { emoji in
                    Button(action: {
                        inputText += emoji
                        // Kept open for multiple selections
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

        switch chatMode {
        case .room:
            viewModel.sendMessage(inputText)
        case .friends:
            break
        case .dm(let friend):
            Task {
                await socialService.sendMessage(to: friend.id, content: inputText)
            }
        }

        inputText = ""
    }

    private var isRoomMode: Bool {
        if case .room = chatMode { return true }
        return false
    }

    private var isFriendsMode: Bool {
        if case .friends = chatMode { return true }
        return false
    }

    private func tabButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(isSelected ? .white : .white.opacity(0.5))
                .frame(maxWidth: .infinity)
                .frame(height: 28)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isSelected ? Color.white.opacity(0.2) : Color.clear)
                )
        }
        .buttonStyle(.plain)
    }
}

struct FriendRowButton: View {
    let friend: Friend
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Circle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 32, height: 32)
                    .overlay(Text(friend.username.prefix(1).uppercased()).foregroundColor(.white))

                Text(friend.displayName)
                    .foregroundColor(.white)

                Spacer()

                if SocialService.shared.onlineUserIds.contains(friend.id) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(8)
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}
