//
//  FriendProfileView.swift
//  RedLemon
//
//  Detailed profile view for a friend, including watch history and chat.
//

import SwiftUI

struct FriendProfileView: View {
    let friend: Friend
    @StateObject private var socialService = SocialService.shared
    @EnvironmentObject var appState: AppState // For navigation to media
    
    @State private var friendHistory: [SupabaseWatchHistoryEntry] = []
    @State private var isLoadingHistory = false
    
    // Chat state
    @State private var messageText = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerView
            
            Divider()
            
            HStack(spacing: 0) {
                // Left: Chat Interface (Main focus)
                chatInterface
                    .frame(maxWidth: .infinity)
                
                Divider()
                
                // Right: Profile & History (Side panel)
                profileSidebar
                    .frame(width: 300)
                    .background(Color(NSColor.controlBackgroundColor))
            }
        }
        .task {
            // Load messages
            await socialService.loadMessages(friendId: friend.id)
            
            // Load history
            isLoadingHistory = true
            friendHistory = await socialService.fetchFriendHistory(friendId: friend.id)
            isLoadingHistory = false
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        HStack(spacing: 16) {
            // Avatar
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Text(friend.username.prefix(1).uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // Online indicator
                if isOnline {
                     Circle()
                         .fill(Color.green)
                         .frame(width: 10, height: 10)
                         .offset(x: 14, y: 14)
                 }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(friend.username)
                    .font(.headline)
                
                if let activity = socialService.friendActivity[friend.id],
                   let watching = activity.currentlyWatching {
                    Text("Watching \(watching.mediaTitle)")
                        .font(.caption)
                        .foregroundColor(.green)
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
        .padding()
        .background(Color(NSColor.windowBackgroundColor))
    }
    
    private var isOnline: Bool {
        socialService.onlineUserIds.contains(friend.id) || socialService.friendActivity[friend.id] != nil
    }
    
    // MARK: - Chat Interface
    
    private var chatInterface: some View {
        VStack(spacing: 0) {
            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        let messages = socialService.messages[friend.id] ?? []
                        
                        if messages.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "bubble.left.and.bubble.right")
                                    .font(.system(size: 40))
                                    .foregroundColor(.secondary.opacity(0.5))
                                Text("Start a conversation with \(friend.username)")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.top, 60)
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
                TextField("Message \(friend.username)...", text: $messageText)
                    .textFieldStyle(.plain)
                    .padding(10)
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(20) // More rounded for "sleek" look
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
                    )
                    .focused($isFocused)
                    .onSubmit {
                        sendMessage()
                    }
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.title3)
                        .foregroundColor(messageText.isEmpty ? .secondary : .blue)
                }
                .buttonStyle(.plain)
                .disabled(messageText.isEmpty)
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
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
    
    // MARK: - Profile Sidebar (History)
    
    private var profileSidebar: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Continue Watching Section
                VStack(alignment: .leading, spacing: 12) {
                    Label("Continue Watching", systemImage: "clock")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.secondary)
                    
                    if isLoadingHistory {
                        ProgressView()
                            .scaleEffect(0.8)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if friendHistory.isEmpty {
                        Text("No recent activity")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 8)
                    } else {
                        ForEach(friendHistory) { item in
                            HistoryItemRow(item: item)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Helper Views

struct HistoryItemRow: View {
    let item: SupabaseWatchHistoryEntry
    
    var body: some View {
        HStack(spacing: 10) {
            // Poster
            AsyncImage(url: URL(string: item.posterUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.3))
            }
            .aspectRatio(2/3, contentMode: .fill)
            .frame(width: 40, height: 60)
            .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.callout)
                    .lineLimit(2)
                
                if let season = item.season, let episode = item.episode {
                    Text("S\(season) E\(episode)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                } else if item.mediaType == "movie" {
                    Text("Movie")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                // Progress Bar (Visual only)
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geo.size.width * item.progress)
                    }
                }
                .frame(height: 2)
                .padding(.top, 4)
            }
            
            Spacer()
        }
        .padding(8)
        .background(Color(NSColor.textBackgroundColor))
        .cornerRadius(8)
    }
}
