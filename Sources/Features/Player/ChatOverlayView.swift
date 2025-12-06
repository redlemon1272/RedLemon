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
            print("👁️ ChatOverlayView appeared")
            // Auto-focus the input field when chat opens
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isInputFocused = true
            }
        }
        .onChange(of: viewModel.showChat) { newValue in
            // Auto-focus when chat is toggled open
            if newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    isInputFocused = true
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
                    Picker("Chat Mode", selection: Binding(
                        get: {
                            if case .room = chatMode { return 0 }
                            return 1
                        },
                        set: { newValue in
                            chatMode = newValue == 0 ? .room : .friends
                        }
                    )) {
                        Text("Room").tag(0)
                        Text("Friends").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden() // Hide "Chat Mode" text
                    .frame(width: 150)
                }

                Spacer()

                // Participant Count (for room chat only)
                if case .room = chatMode, let room = appState.currentWatchPartyRoom {
                    HStack(spacing: 4) {
                        Image(systemName: "person.2.fill")
                            .font(.system(size: 11))
                        Text("\(room.participants.count)")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .overlay(
                                Capsule()
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                    )
                }

                Button(action: { viewModel.toggleChat() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                }
                .buttonStyle(.plain)
            }
            .padding()
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
            // Emoji picker (appears above input when shown)
            if showEmojiPicker {
                emojiPicker
            }

            // Input row
            HStack(spacing: 12) {
                // Emoji button
                Button(action: {
                    showEmojiPicker.toggle()
                }) {
                    Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)

                TextField("Type a message...", text: $inputText)
                    .textFieldStyle(.plain)
                    .padding(12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .focused($isInputFocused)
                    .onSubmit { sendMessage() }

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(inputText.isEmpty)
            }
            .padding()
        }
    }

    private var emojiPicker: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
            ForEach(emojis, id: \.self) { emoji in
                Button(action: {
                    inputText += emoji
                    showEmojiPicker = false
                    isInputFocused = true
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
        .padding()
        .background(Color.black.opacity(0.3))
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
