//
//  ChatView.swift
//  RedLemon
//
//  Direct Messaging Interface
//

import SwiftUI

struct ChatView: View {
    let friend: Friend
    @StateObject private var socialService = SocialService.shared
    @State private var messageText = ""
    @FocusState private var isFocused: Bool

    @State private var showEmojiPicker = false
    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    @State private var showDeleteConfirmation = false
    @State private var isDeleting = false
    @State private var deleteError: String?

    var body: some View {
        VStack(spacing: 8) { // Matches Lobby styling
            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) { // Matches Lobby styling
                        let messages = socialService.messages[friend.id] ?? []

                        if messages.isEmpty {
                            Text("No messages yet")
                                .foregroundColor(.secondary)
                                .padding(.top, 40)
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            ForEach(messages) { message in
                                DMMessageRow(message: message, friend: friend)
                                    .id(message.id)
                            }
                        }

                        Color.clear
                            .frame(height: 1)
                            .id("BOTTOM")
                    }
                    .padding()
                }
                .onChange(of: socialService.messages[friend.id]?.count) { _ in
                    if let lastId = socialService.messages[friend.id]?.last?.id {
                        Task { @MainActor in
                            try? await Task.sleep(nanoseconds: 100_000_000)
                            withAnimation {
                                proxy.scrollTo("BOTTOM", anchor: .bottom) // OK: Guarded by 'if let lastId' check above
                            }
                        }
                    }
                    Task {
                        socialService.clearUnread(friendId: friend.id)
                    }
                }
                .onAppear {
                    // Scroll to bottom on appear
                    Task { @MainActor in
                         try? await Task.sleep(nanoseconds: 100_000_000)
                         if !(socialService.messages[friend.id]?.isEmpty ?? true) {
                             proxy.scrollTo("BOTTOM", anchor: .bottom) // OK: Guarded by !items.isEmpty check
                         }
                    }
                    // Mark as read when new messages arrive while viewing
                    Task {
                        socialService.clearUnread(friendId: friend.id)
                    }
                }
            }
            .background(Color.black.opacity(0.3)) // Matches Lobby Chat
            .cornerRadius(8)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Menu {
                        Button(role: .destructive, action: {
                            showDeleteConfirmation = true
                        }) {
                            Label("Delete All Messages", systemImage: "trash")
                        }
                        .disabled(socialService.messages[friend.id]?.isEmpty ?? true)
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.secondary)
                    }
                }
            }

            // Input Area (Reuse Lobby Layout)
            VStack(spacing: 0) {
                if showEmojiPicker {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                        ForEach(emojis, id: \.self) { emoji in
                            Button(action: {
                                messageText += emoji
                                showEmojiPicker = false
                            }) {
                                Text(emoji)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(8)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.bottom, 8)
                }

                HStack {
                    Button(action: { showEmojiPicker.toggle() }) {
                        Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .buttonStyle(.plain)

                    TextField("Send a message...", text: $messageText)
                        .textFieldStyle(.plain)
                        .padding(8)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .focused($isFocused)
                        .onSubmit(sendMessage)

                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(.plain)
                    .disabled(messageText.isEmpty)
                }
            }
        }
        .padding(.horizontal, 24) // Matches Lobby padding
        .padding(.bottom, 16)     // Matches Lobby padding
        .background(Color.black) // Ensure dark background for visibility
        .confirmationDialog(
            "Delete All Messages?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete All Messages", role: .destructive) {
                Task {
                    await deleteAllMessages()
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will permanently delete all messages with \(friend.username). This action cannot be undone.")
        }
        .alert("Error", isPresented: .constant(deleteError != nil)) {
            Button("OK") {
                deleteError = nil
            }
        } message: {
            Text(deleteError ?? "")
        }
        .task {
            await socialService.loadMessages(friendId: friend.id)
            socialService.clearUnread(friendId: friend.id)
        }
    }

    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        let content = messageText
        messageText = ""

        Task {
            await socialService.sendMessage(to: friend.id, content: content)
        }
    }

    private func deleteAllMessages() async {
        isDeleting = true
        do {
            try await socialService.deleteAllMessages(friendId: friend.id)
        } catch {
            deleteError = error.localizedDescription
        }
        isDeleting = false
    }
}

struct DMMessageRow: View {
    let message: DirectMessage
    let friend: Friend
    @EnvironmentObject var appState: AppState

    var body: some View {
        let isMe = message.senderId.uuidString.lowercased() != friend.id.lowercased()

        HStack {
            if isMe { Spacer() }

            VStack(alignment: isMe ? .trailing : .leading, spacing: 4) {
                // Timestamp Above
                Text(formatDate(message.createdAt))
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.4))
                    .padding(.horizontal, 4)

                // Only show name for friend if not me (and not redundant with avatar if we had one, but here we keep it)
                if !isMe {
                   Text(friend.username)
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.purple)
                }

                if message.content.hasPrefix("INVITE|") {
                    inviteCard(isMe: isMe)
                } else {
                    textMessage(isMe: isMe)
                }
            }

            if !isMe { Spacer() }
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: date)
    }

    private func textMessage(isMe: Bool) -> some View {
        Text(message.content)
            .font(.body)
            .foregroundColor(.white)
            .padding(10)
            .background(isMe ? Color.blue : Color(white: 0.2)) // Safer dark grey than opacity
            .cornerRadius(12)
    }

    private func inviteCard(isMe: Bool) -> some View {
        let components = message.content.split(separator: "|")
        let roomId = components.count >= 2 ? String(components[1]) : ""
        let roomName = components.count >= 3 ? String(components[2]) : "Watch Party"

        return VStack(spacing: 8) {
            Text("🎬 Watch Party Invite")
                .font(.caption.weight(.bold))
                
                .foregroundColor(isMe ? .white.opacity(0.8) : .secondary)

            Text(roomName)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(1)

            if !isMe {
                Button(action: {
                    Task {
                        await appState.player.joinRoom(roomId: roomId)
                    }
                }) {
                    Text("Join Party")
                        .font(.body.weight(.semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            } else {
                Text("Invite Sent")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(12)
        .background(isMe ? Color.blue.opacity(0.8) : Color.white.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}
