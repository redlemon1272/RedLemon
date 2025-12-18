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
    
    @Environment(\.dismiss) var dismiss
    
    // Chat state
    @State private var messageText = ""
    @FocusState private var isFocused: Bool
    @State private var showEmojiPicker = false
    
    // Common emojis (same as player chat)
    private let emojis = ["\u{1F602}", "\u{1F60D}", "\u{1F525}", "\u{1F44D}", "\u{2764}\u{FE0F}", "\u{1F60E}", "\u{1F389}", "\u{1F4AF}", "\u{1F62D}", "\u{1F914}", "\u{1F440}", "\u{2728}", "\u{1F3AC}", "\u{1F37F}", "\u{1F631}", "\u{1F923}"]
    
    @State private var showDeleteConfirmation = false
    @State private var isDeleting = false
    @State private var deleteError: String?
    
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
                    .frame(width: 320) // Slightly wider sidebar
                    .background(Color(NSColor.controlBackgroundColor))
            }
        }
        .frame(minWidth: 900, minHeight: 500) // Compact modal size
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
                }
            }
        }
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
            // Load messages
            await socialService.loadMessages(friendId: friend.id)
            socialService.clearUnread(friendId: friend.id)
            
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
                
                if let activity = socialService.friendActivity[friend.id] {
                    // Check for custom status first (e.g., "In Lobby")
                    if let status = activity.customStatus, !status.isEmpty, status != "online" {
                        Text(status)
                            .font(.caption)
                            .foregroundColor(.green)
                    } else if let watching = activity.currentlyWatching {
                        Text("Watching \(watching.mediaTitle)")
                            .font(.caption)
                            .foregroundColor(.green)
                    } else if isOnline {
                        Text("Online")
                            .font(.caption)
                            .foregroundColor(.green)
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
            
            // Close Button
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
            .keyboardShortcut(.cancelAction)
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
                                DMMessageRow(message: message, friend: friend)
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
                    // Clear unread count when new messages arrive while viewing
                    socialService.clearUnread(friendId: friend.id)
                }
            }
            
            Divider()
            
            // Emoji Picker (Slide up)
            if showEmojiPicker {
                emojiPicker
                    .padding(8)
                    .background(Color(NSColor.controlBackgroundColor))
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                Divider()
            }
            
            // Input Area
            HStack(spacing: 8) {
                // Emoji Button
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        showEmojiPicker.toggle()
                    }
                }) {
                    Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                        .font(.system(size: 18))
                        .foregroundColor(showEmojiPicker ? .orange : .secondary)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)

                TextField("Message \(friend.username)...", text: $messageText)
                    .textFieldStyle(.plain)
                    .padding(10)
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(20)
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

    private var emojiPicker: some View {
        VStack(spacing: 8) {
            // Header with Close
             HStack {
                 Text("Emojis")
                     .font(.caption)
                     .foregroundColor(.secondary)
                 Spacer()
                 Button(action: { withAnimation { showEmojiPicker = false } }) {
                     Image(systemName: "xmark.circle.fill")
                         .foregroundColor(.secondary)
                 }
                 .buttonStyle(.plain)
             }
             .padding(.horizontal, 4)
             
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                ForEach(emojis, id: \.self) { emoji in
                    Button(action: {
                        messageText += emoji
                        isFocused = true
                    }) {
                        Text(emoji)
                            .font(.system(size: 24))
                            .frame(width: 40, height: 40)
                            .background(Color(NSColor.windowBackgroundColor))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary.opacity(0.1), lineWidth: 1))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .frame(maxHeight: 160)
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
                
                if let season = item.season, season > 0, let episode = item.episode, episode > 0 {
                    Text("S\(season) E\(episode)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                } else {
                    Text(item.mediaType.capitalized) // "Movie" or fallback
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
