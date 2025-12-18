//
//  FriendsView.swift
//  RedLemon
//
//  Social friends list and management
//

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var socialService = SocialService.shared
    
    @State private var showingAddFriend = false
    @State private var searchText = ""
    @State private var selectedTab: FriendTab = .all
    @State private var selectedFriend: Friend?

    enum FriendTab {
        case all
        case online
        case favorites
        case requests
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            header

            // Search bar
            searchBar

            // Tab selector
            tabSelector

            // Friend list
            ScrollView {
                LazyVStack(spacing: 12) {
                    if socialService.isLoading && socialService.friends.isEmpty {
                        ProgressView()
                            .padding(40)
                    } else if filteredFriends.isEmpty && selectedTab != .requests {
                        emptyState
                    } else {
                        switch selectedTab {
                        case .all, .online, .favorites:
                            friendsList
                        case .requests:
                            requestsList
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color(NSColor.windowBackgroundColor))
        .sheet(isPresented: $showingAddFriend) {
            AddFriendSheet(isPresented: $showingAddFriend, onAdd: { principal, username in
                await socialService.sendRequest(username: username)
            })
        }
        .sheet(item: $selectedFriend) { friend in
            FriendProfileView(friend: friend)
        }
        .task {
            // Refresh friends on view appear
            await socialService.loadFriends()
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Friends")
                    .font(.system(size: 32, weight: .bold))

                Text("\(socialService.friends.filter { $0.status == .accepted }.count) friends")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button(action: { showingAddFriend = true }) {
                Label("Add Friend", systemImage: "person.badge.plus")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("Search friends...", text: $searchText)
                .textFieldStyle(.plain)

            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(8)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
        .padding(.horizontal)
    }

    // MARK: - Tab Selector

    private var tabSelector: some View {
        HStack(spacing: 4) {
            tabButton(title: "All", count: socialService.friends.filter { $0.status == .accepted }.count, tab: .all)
            tabButton(title: "Online", count: onlineFriends.count, tab: .online)
            tabButton(title: "Favorites", count: socialService.friends.filter { $0.isFavorite }.count, tab: .favorites)
            tabButton(title: "Requests", count: socialService.friendRequests.filter { $0.status == .pending }.count, tab: .requests)
        }
        .padding()
    }

    private func tabButton(title: String, count: Int, tab: FriendTab) -> some View {
        Button(action: { selectedTab = tab }) {
            HStack {
                Text(title)
                if count > 0 {
                    Text("\(count)")
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(selectedTab == tab ? Color.white.opacity(0.3) : Color.secondary.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(selectedTab == tab ? Color.blue : Color.clear)
            .foregroundColor(selectedTab == tab ? .white : .primary)
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Friends List

    private var friendsList: some View {
        ForEach(filteredFriends) { friend in
            Button(action: {
                selectedFriend = friend
            }) {
                FriendRow(
                    friend: friend,
                    activity: socialService.friendActivity[friend.id],
                    unreadCount: socialService.unreadCounts[friend.id] ?? 0,
                    onToggleFavorite: { await toggleFavorite(friend) },
                    onRemove: { await removeFriend(friend) },
                    onInvite: { inviteToWatchParty(friend) },
                    onJoin: { joinFriend(friend) }
                )
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Requests List

    private var requestsList: some View {

        Group {
            if socialService.friendRequests.filter({ $0.status == .pending }).isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "envelope.open")
                    .font(.system(size: 50))
                    .foregroundColor(.secondary)
                    Text("No pending requests")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(40)
            } else {
                ForEach(socialService.friendRequests.filter { $0.status == .pending }) { request in
                    FriendRequestRow(
                        request: request,
                        onAccept: { await socialService.acceptRequest(request) },
                        onDecline: { await socialService.declineRequest(request) }
                    )
                }
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.2")
                .font(.system(size: 64))
                .foregroundColor(.secondary)

            Text("No friends yet")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Add friends to watch together and see what they're watching")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 400)

            Button(action: { showingAddFriend = true }) {
                Label("Add Your First Friend", systemImage: "person.badge.plus")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
    }

    // MARK: - Filtered Friends

    private var filteredFriends: [Friend] {
        var result = socialService.friends.filter { $0.status == .accepted }

        // Filter by tab
        switch selectedTab {
        case .all:
            break
        case .online:
            result = result.filter { friend in
                if let activity = socialService.friendActivity[friend.id] {
                    return activity.currentlyWatching != nil || socialService.onlineUserIds.contains(friend.id)
                }
                return socialService.onlineUserIds.contains(friend.id)
            }
        case .favorites:
            result = result.filter { $0.isFavorite }
        case .requests:
            return [] // Handled separately
        }

        // Filter by search
        if !searchText.isEmpty {
            result = result.filter { friend in
                friend.username.localizedCaseInsensitiveContains(searchText) ||
                friend.id.localizedCaseInsensitiveContains(searchText)
            }
        }

        // Sort: Unread -> Favorites -> Last Message -> Username
        return result.sorted { lhs, rhs in
            // 1. Unread messages (High priority)
            let unreadLhs = socialService.unreadCounts[lhs.id] ?? 0
            let unreadRhs = socialService.unreadCounts[rhs.id] ?? 0
            if unreadLhs != unreadRhs {
                return unreadLhs > unreadRhs
            }
            
            // 2. Favorites
            if lhs.isFavorite != rhs.isFavorite {
                return lhs.isFavorite
            }
            
            // 3. Last Message Time (Recent conversations first)
            // Note: messages might be empty if not loaded, treating as distantPast
            let lastMsgLhs = socialService.messages[lhs.id]?.last?.createdAt ?? Date.distantPast
            let lastMsgRhs = socialService.messages[rhs.id]?.last?.createdAt ?? Date.distantPast
            if lastMsgLhs != lastMsgRhs {
                 return lastMsgLhs > lastMsgRhs
            }
            
            // 4. Alphabetical
            return lhs.username.localizedCaseInsensitiveCompare(rhs.username) == .orderedAscending
        }
    }

    private var onlineFriends: [Friend] {
        socialService.friends.filter { friend in
            socialService.onlineUserIds.contains(friend.id)
        }
    }

    // MARK: - Actions

    private func toggleFavorite(_ friend: Friend) async {
        print("⭐️ Toggling favorite for \(friend.username)")
        socialService.toggleFavorite(friendId: friend.id)
    }

    private func removeFriend(_ friend: Friend) async {
        print("🗑️ Removing friend \(friend.username)")
        // FUTURE: Remove from Supabase friendships table
    }

    private func inviteToWatchParty(_ friend: Friend) {
        // Check if we are hosting or in a room
        if let room = appState.player.currentWatchPartyRoom {
            let roomName = room.mediaItem?.name ?? "Watch Party"
            print("📨 Inviting \(friend.username) to room: \(room.id)")
            Task {
                await socialService.sendInvite(to: friend.id, roomId: room.id, roomName: roomName)
            }
        } else {
             // Future: Prompt to create a room?
             print("⚠️ Cannot invite: Not in a room")
        }
    }
    
    private func joinFriend(_ friend: Friend) {
        guard let activity = socialService.friendActivity[friend.id],
              let watching = activity.currentlyWatching,
              let roomId = watching.roomId else {
            return
        }
        
        print("🚀 Joining friend \(friend.username) in room: \(roomId)")
        Task {
            await appState.player.joinRoom(roomId: roomId)
        }
    }
}

// MARK: - Friend Row

struct FriendRow: View {
    let friend: Friend
    let activity: FriendActivity?
    let unreadCount: Int
    let onToggleFavorite: () async -> Void
    let onRemove: () async -> Void
    let onInvite: () -> Void
    let onJoin: (() -> Void)? // Optional join action
    
    init(friend: Friend, activity: FriendActivity?, unreadCount: Int = 0, onToggleFavorite: @escaping () async -> Void, onRemove: @escaping () async -> Void, onInvite: @escaping () -> Void, onJoin: (() -> Void)? = nil) {
        self.friend = friend
        self.activity = activity
        self.unreadCount = unreadCount
        self.onToggleFavorite = onToggleFavorite
        self.onRemove = onRemove
        self.onInvite = onInvite
        self.onJoin = onJoin
    }

    @State private var showingMenu = false

    var body: some View {
        HStack(spacing: 12) {
            // Avatar
            ZStack {
                Circle()
                    .fill(friend.isFavorite ? Color.yellow.opacity(0.2) : Color.blue.opacity(0.2))
                    .frame(width: 50, height: 50)

                Text(friend.username.prefix(1).uppercased())
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(friend.isFavorite ? .yellow : .blue)

                // Online indicator
                if activity != nil || activity?.currentlyWatching != nil { // Check if online or watching
                     // We need to know if they are just online (no activity object might mean offline if we use map)
                     // But activity object is created for online users.
                     // So if activity exists, they are online.
                    Circle()
                        .fill(Color.green)
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle()
                                .stroke(Color(NSColor.windowBackgroundColor), lineWidth: 2)
                        )
                        .offset(x: 18, y: 18)
                }
            }

            // Info
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(friend.username)
                        .font(.headline)

                    if friend.isFavorite {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }

                if let activity = activity, let watching = activity.currentlyWatching {
                    HStack(spacing: 4) {
                        Image(systemName: "play.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text("Watching \(watching.mediaTitle)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                } else {
                    Text(friend.truncatedPrincipal)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Unread Badge
            if unreadCount > 0 {
                Text("\(unreadCount)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.red)
                    .clipShape(Capsule())
            }

            Spacer()

            // Action buttons
            if let activity = activity, activity.currentlyWatching != nil {
                if let onJoin = onJoin, activity.currentlyWatching?.roomId != nil {
                     Button(action: onJoin) {
                         Label("Join", systemImage: "play.fill")
                             .font(.caption)
                     }
                     .buttonStyle(.borderedProminent)
                     .controlSize(.small)
                } else {
                    Button(action: onInvite) {
                        Label("Join", systemImage: "play.fill")
                            .font(.caption)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                    .disabled(true) // Disable if we can't actually join (e.g. no room ID)
                }
            }

            // Menu
            Menu {
                Button(action: { Task { await onToggleFavorite() } }) {
                    Label(friend.isFavorite ? "Remove from Favorites" : "Add to Favorites",
                          systemImage: friend.isFavorite ? "star.slash" : "star")
                }

                Button(action: onInvite) {
                    Label("Invite to Watch Party", systemImage: "envelope")
                }

                Divider()

                Button(role: .destructive, action: { Task { await onRemove() } }) {
                    Label("Remove Friend", systemImage: "person.crop.circle.badge.minus")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .menuStyle(.borderlessButton)
            .frame(width: 30, height: 30)
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
    }
}

// MARK: - Friend Request Row

struct FriendRequestRow: View {
    let request: FriendRequest
    let onAccept: () async -> Void
    let onDecline: () async -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Avatar
            Circle()
                .fill(Color.purple.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay(
                    Text(request.fromUsername.prefix(1).uppercased())
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                )

            // Info
            VStack(alignment: .leading, spacing: 4) {
                Text(request.fromUsername)
                    .font(.headline)

                Text("Sent friend request")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Actions
            HStack(spacing: 8) {
                Button(action: { Task { await onAccept() } }) {
                    Label("Accept", systemImage: "checkmark")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.small)

                Button(action: { Task { await onDecline() } }) {
                    Label("Decline", systemImage: "xmark")
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
            }
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Add Friend Sheet

struct AddFriendSheet: View {
    @Binding var isPresented: Bool
    let onAdd: (String, String) async -> String?  // Returns error message if failed

    @State private var searchInput = ""
    @State private var isSearching = false
    @State private var isSending = false
    @State private var foundUser: (principal: String, username: String)?
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
                Image(systemName: "person.badge.plus")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)

                Text("Add Friend")
                    .font(.system(size: 28, weight: .bold))

                Text("Search by username or principal ID")
                    .font(.body)
                    .foregroundColor(.secondary)
            }

            // Search input
            VStack(alignment: .leading, spacing: 8) {
                TextField("Enter username or principal ID", text: $searchInput)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        Task {
                            await searchUser()
                        }
                    }

                if let error = errorMessage {
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }

            // Found user
            if let user = foundUser {
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text(user.username.prefix(1).uppercased())
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        )

                    Text(user.username)
                        .font(.headline)

                    Text(user.principal)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)
            }

            Spacer()

            // Action buttons
            HStack(spacing: 12) {
                Button("Cancel") {
                    isPresented = false
                }
                .buttonStyle(.bordered)
                .controlSize(.large)

                Button(action: {
                    if let user = foundUser {
                        Task {
                            isSending = true
                            errorMessage = nil

                            if let error = await onAdd(user.principal, user.username) {
                                // Show error in the sheet
                                errorMessage = error
                                isSending = false
                            } else {
                                // Success - close the sheet
                                isSending = false
                                isPresented = false
                            }
                        }
                    } else {
                        Task {
                            await searchUser()
                        }
                    }
                }) {
                    HStack {
                        if isSearching || isSending {
                            ProgressView()
                                .scaleEffect(0.8)
                        }
                        Text(foundUser != nil ? "Send Friend Request" : "Search")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(searchInput.isEmpty || isSearching || isSending)
            }
        }
        .padding(40)
        .frame(width: 500, height: 450)
    }

    private func searchUser() async {
        isSearching = true
        errorMessage = nil
        foundUser = nil

        // Search in Supabase by username
        do {
            let users = try await SupabaseClient.shared.searchUsers(username: searchInput)

            if let user = users.first {
                // Found user in Supabase
                foundUser = (principal: user.id.uuidString, username: user.username)
            } else {
                errorMessage = "User not found"
            }
        } catch {
            errorMessage = "Search failed: \(error.localizedDescription)"
            NSLog("❌ User search error: \(error)")
        }

        isSearching = false
    }
}
