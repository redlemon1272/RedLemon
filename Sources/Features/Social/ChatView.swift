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
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text(friend.displayName)
                    .font(.headline)
                
                if let activity = socialService.friendActivity[friend.id],
                   let watching = activity.currentlyWatching {
                    Text("• Watching \(watching.mediaTitle)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else if socialService.onlineUserIds.contains(friend.id) {
                    Text("• Online")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(nsColor: .windowBackgroundColor))
            
            Divider()
            
            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        let messages = socialService.messages[friend.id] ?? []
                        
                        if messages.isEmpty {
                            Text("No messages yet")
                                .foregroundColor(.secondary)
                                .padding(.top, 40)
                        } else {
                            ForEach(messages) { message in
                                MessageBubble(message: message, isMe: message.senderId.uuidString != friend.id)
                                    .id(message.id)
                            }
                        }
                    }
                    .padding()
                }
                .onChange(of: socialService.messages[friend.id]?.count) { _ in
                    if let lastId = socialService.messages[friend.id]?.last?.id {
                        withAnimation {
                            proxy.scrollTo(lastId, anchor: .bottom)
                        }
                    }
                }
            }
            
            Divider()
            
            // Input Area
            HStack(spacing: 12) {
                TextField("Message...", text: $messageText)
                    .textFieldStyle(.plain)
                    .padding(10)
                    .background(Color(nsColor: .controlBackgroundColor))
                    .cornerRadius(8)
                    .focused($isFocused)
                    .onSubmit {
                        sendMessage()
                    }
                
                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title2)
                        .foregroundColor(messageText.isEmpty ? .secondary : .accentColor)
                }
                .buttonStyle(.plain)
                .disabled(messageText.isEmpty)
            }
            .padding()
            .background(Color(nsColor: .windowBackgroundColor))
        }
        .task {
            await socialService.loadMessages(friendId: friend.id)
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

struct MessageBubble: View {
    let message: DirectMessage
    let isMe: Bool
    
    var body: some View {
        HStack {
            if isMe { Spacer() }
            
            VStack(alignment: isMe ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(isMe ? Color.accentColor : Color(nsColor: .controlBackgroundColor))
                    .foregroundColor(isMe ? .white : .primary)
                    .cornerRadius(12)
                
                Text(message.createdAt.formatted(date: .omitted, time: .shortened))
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            if !isMe { Spacer() }
        }
    }
}
