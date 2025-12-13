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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                proxy.scrollTo("BOTTOM", anchor: .bottom)
                            }
                        }
                    }
                    Task {
                        socialService.clearUnread(friendId: friend.id)
                    }
                }
                .onAppear {
                    // Scroll to bottom on appear
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                         proxy.scrollTo("BOTTOM", anchor: .bottom)
                    }
                    // Mark as read when new messages arrive while viewing
                    Task {
                        socialService.clearUnread(friendId: friend.id)
                    }
                }
            }
            .background(Color.black.opacity(0.3)) // Matches Lobby Chat
            .cornerRadius(8)
            
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
}

struct DMMessageRow: View {
    let message: DirectMessage
    let friend: Friend
    
    var body: some View {
        let isMe = message.senderId.uuidString.lowercased() != friend.id.lowercased()
        
        HStack {
            if isMe { Spacer() }
            
            VStack(alignment: isMe ? .trailing : .leading, spacing: 4) {
                // Only show name for friend, or if we want to be explicit
                if !isMe {
                   Text(friend.username)
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.purple)
                }
                
                Text(message.content)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(isMe ? Color.blue : Color.white.opacity(0.1))
                    .cornerRadius(12)
            }
            // Removed manual padding/bg wrap to let Text bubble handle it
            
            if !isMe { Spacer() }
        }
    }
}
