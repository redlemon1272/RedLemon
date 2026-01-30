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
    @StateObject private var viewModel = FriendsViewModel()

    @State private var showingAddFriend = false
    @State private var selectedFriend: Friend?
    @State private var joiningFriendId: String?

    // Tabs are now just for view logic, handled by VM

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
                VStack(spacing: 12) {
                    if socialService.isLoading && socialService.friends.isEmpty {
                        ProgressView()
                            .padding(40)
                    } else {
                        switch viewModel.selectedTab {
                        case .all, .online:
                            if viewModel.displayedFriends.isEmpty {
                                emptyState
                            } else {
                                friendsList
                            }
                        case .requests:
                            requestsList
                        case .blocked:
                            blockedList
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color(NSColor.windowBackgroundColor))
        .sheet(isPresented: $showingAddFriend) {
            AddFriendSheet(isPresented: $showingAddFriend, onAdd: { principal, username in
                // Use the user ID directly instead of re-searching by username
                await socialService.sendRequest(toUserId: principal)
            })
        }
        .sheet(item: $selectedFriend) { friend in
            FriendProfileView(friend: friend)
        }
        .task {
            // Refresh friends on view appear
            await SocialService.shared.loadFriends()
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Friends")
                    .font(.system(size: 32, weight: .bold))

                Text("\(viewModel.friendsCount) friends")
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

            TextField("Search friends...", text: $viewModel.searchText)
                .textFieldStyle(.plain)

            if !viewModel.searchText.isEmpty {
                Button(action: { viewModel.searchText = "" }) {
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
            tabButton(title: "All", count: viewModel.friendsCount, tab: .all)
            tabButton(title: "Online", count: viewModel.onlineCount, tab: .online)
            tabButton(title: "Requests", count: viewModel.requestCount, tab: .requests)
             tabButton(title: "Blocked", count: viewModel.blockedCount, tab: .blocked)
        }
        .padding()
    }

    private func tabButton(title: String, count: Int, tab: FriendsView.FriendTab) -> some View {
        Button(action: { viewModel.selectedTab = tab }) {
            HStack {
                Text(title)
                if count > 0 {
                    Text("\(count)")
                        .font(.caption)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(viewModel.selectedTab == tab ? Color.white.opacity(0.3) : Color.secondary.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(viewModel.selectedTab == tab ? Color.blue : Color.clear)
            .foregroundColor(viewModel.selectedTab == tab ? .white : .primary)
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Friends List

    private var friendsList: some View {
        Group {
            if viewModel.isLargeListMode && viewModel.selectedTab == .all && viewModel.searchText.isEmpty {
                // Large List Prompt (Only for 'All' tab when not searching)
                VStack(spacing: 12) {
                    Text("Showing online & favorite friends")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 4)

                    ForEach(viewModel.displayedFriends) { friend in
                        friendRow(for: friend)
                    }

                    if viewModel.displayedFriends.isEmpty {
                        Text("All quiet right now.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.top, 20)
                    }

                    Divider()
                        .padding(.vertical, 8)

                    Text("Search to find offline friends")
                        .font(.caption)
                        .italic()
                        .foregroundColor(.secondary)
                }
            } else {
                // Standard List
                ForEach(viewModel.displayedFriends) { friend in
                    friendRow(for: friend)
                }
            }
        }
    }

    private func friendRow(for friend: Friend) -> some View {
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

                onJoin: { joinFriend(friend) },
                isJoining: joiningFriendId == friend.id
            )
        }
        .buttonStyle(.plain)
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

    // MARK: - Blocked List

    private var blockedList: some View {
        Group {
            if socialService.blockedUsers.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "shield")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                    Text("No blocked users")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(40)
            } else {
                ForEach(socialService.blockedUsers, id: \.id) { user in
                    HStack {
                         VStack(alignment: .leading) {
                             Text(user.username)
                                 .font(.headline)
                             Text("Blocked")
                                 .font(.caption)
                                 .foregroundColor(.secondary)
                         }
                         Spacer()
                         Button(action: {
                             Task { await socialService.unblockUser(userId: user.id.uuidString) }
                         }) {
                             Label("Unblock", systemImage: "lock.open")
                         }
                         .buttonStyle(.bordered)
                         .controlSize(.small)
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 20) {

            if viewModel.selectedTab == .online {
                Image(systemName: "moon.zzz")
                    .font(.system(size: 64))
                    .foregroundColor(.secondary)

                Text("No friends online")
                    .font(.title2.weight(.semibold))


                Text("None of your friends are currently online.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            } else if viewModel.isLargeListMode && viewModel.selectedTab == .all {
                 // Large List Empty State (Search Prompt)
                 Image(systemName: "person.crop.circle.badge.questionmark")
                     .font(.system(size: 64))
                     .foregroundColor(.secondary)

                 Text("Find a Friend")
                     .font(.title2.weight(.semibold))


                 Text("You have many friends! Use the search bar to find someone specific.")
                     .font(.body)
                     .foregroundColor(.secondary)
                     .multilineTextAlignment(.center)
                     .padding(.horizontal)
            } else {
                Image(systemName: "person.2")
                    .font(.system(size: 64))
                    .foregroundColor(.secondary)

                Text("No friends yet")
                    .font(.title2.weight(.semibold))


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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
    }

    // MARK: - Legacy FriendTab for View State (kept for compatibility)
    enum FriendTab {
       case all, online, requests, blocked
    }

    // MARK: - Actions

    private func toggleFavorite(_ friend: Friend) async {
        print("⭐️ Toggling favorite for \(friend.username)")
        socialService.toggleFavorite(friendId: friend.id)
    }

    private func removeFriend(_ friend: Friend) async {
        print("🗑️ Removing friend \(friend.username)")
        await socialService.removeFriend(friendId: friend.id)
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
        joiningFriendId = friend.id

        Task {
            await appState.player.joinRoom(roomId: roomId)
            joiningFriendId = nil
        }
    }
}

// ... Rest of the file (FriendRow, etc...) code kept below as helper structs


// MARK: - Friend Row

struct FriendRow: View {
    let friend: Friend
    let activity: FriendActivity?
    let unreadCount: Int
    let onToggleFavorite: () async -> Void
    let onRemove: () async -> Void
    let onInvite: () -> Void
    let onJoin: (() -> Void)? // Optional join action
    let isJoining: Bool

    init(friend: Friend, activity: FriendActivity?, unreadCount: Int = 0, onToggleFavorite: @escaping () async -> Void, onRemove: @escaping () async -> Void, onInvite: @escaping () -> Void, onJoin: (() -> Void)? = nil, isJoining: Bool = false) {
        self.friend = friend
        self.activity = activity
        self.unreadCount = unreadCount
        self.onToggleFavorite = onToggleFavorite
        self.onRemove = onRemove
        self.onInvite = onInvite
        self.onJoin = onJoin
        self.isJoining = isJoining
    }

    @State private var showingMenu = false

    var body: some View {
        HStack(spacing: 12) {
            // Avatar
            UserAvatar(
                username: friend.username,
                size: 50,
                isOnline: activity != nil,
                showOnlineIndicator: true
            )
            .overlay(
                // Favorite star indicator
                Group {
                    if friend.isFavorite {
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.yellow)
                            .offset(x: -18, y: -18)
                    }
                }
            )

            // Info
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(friend.username)
                        .font(.headline)

                    // Prioritize DB-verified premium status for friends (Check Expiration! Security Check #138)
                    if friend.isReallyPremium || (activity?.isReallyPremium ?? false) {
                        Text("👑")
                            .font(.system(size: 12))
                            .help("Premium Host")
                    }

                    if friend.isFavorite {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }

                if let activity = activity {
                    // Check for custom status first (e.g., "In Lobby: Movie Name")
                    if let status = activity.customStatus, !status.isEmpty, status != "online" {
                        HStack(spacing: 4) {
                            Image(systemName: "hourglass")
                                .font(.caption)
                                .foregroundColor(.orange)
                            Text(status)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    } else if let watching = activity.currentlyWatching {
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
                } else {
                    Text(friend.truncatedPrincipal)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            // Unread Badge
            if unreadCount > 0 {
                Text("\(unreadCount)")
                    .font(.caption.weight(.bold))

                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.red)
                    .clipShape(Capsule())
            }

            Spacer()

            // Action buttons
            if let activity = activity, activity.currentlyWatching != nil {
                if let onJoin = onJoin, let watching = activity.currentlyWatching, watching.roomId != nil, watching.isJoinable {
                     Button(action: onJoin) {
                         if isJoining {
                             ProgressView()
                                 .scaleEffect(0.5)
                                 .frame(maxWidth: 40) // Match approximate width of label
                         } else {
                             Label("Join", systemImage: "play.fill")
                                 .font(.caption)
                         }
                     }
                     .buttonStyle(.borderedProminent)
                     .controlSize(.small)
                     .disabled(isJoining)
                } else {
                    Button(action: onInvite) {
                        Label("Join", systemImage: "play.fill")
                            .font(.caption)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                    .disabled(true) // Disable if we can't actually join (e.g. no room ID or unjoinable)
                }
            }


            // Menu
            Menu {
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
            UserAvatar(
                username: request.fromUsername,
                size: 50,
                isOnline: false,
                showOnlineIndicator: false
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
    @State private var foundUsers: [(principal: String, username: String)] = []
    @State private var selectedUser: (principal: String, username: String)?
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

            // Found users list
            if !foundUsers.isEmpty {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(foundUsers, id: \.principal) { user in
                            Button(action: {
                                selectedUser = user
                            }) {
                                HStack(spacing: 12) {
                                    UserAvatar(
                                        username: user.username,
                                        size: 40,
                                        isOnline: false,
                                        showOnlineIndicator: false
                                    )

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(user.username)
                                            .font(.headline)
                                            .foregroundColor(.primary)

                                        Text(user.principal.prefix(8) + "...")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }

                                    Spacer()

                                    if selectedUser?.principal == user.principal {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(12)
                                .background(
                                    selectedUser?.principal == user.principal
                                        ? Color.blue.opacity(0.1)
                                        : Color(NSColor.controlBackgroundColor)
                                )
                                .cornerRadius(10)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .frame(maxHeight: 150)
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
                    if let user = selectedUser {
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
                    } else if !foundUsers.isEmpty {
                        // Auto-select the only result if there's just one
                        if foundUsers.count == 1 {
                            selectedUser = foundUsers.first
                        } else {
                            errorMessage = "Please select a user"
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
                        Text(selectedUser != nil ? "Send Friend Request" : (foundUsers.isEmpty ? "Search" : "Select a User"))
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(searchInput.isEmpty || isSearching || isSending)
            }
        }
        .padding(40)
        .frame(width: 500, height: 500)
    }

    private func searchUser() async {
        isSearching = true
        errorMessage = nil
        foundUsers = []
        selectedUser = nil

        // Search in Supabase by username
        do {
            let users = try await SupabaseClient.shared.searchUsers(username: searchInput)

            if users.isEmpty {
                errorMessage = "User not found"
            } else {
                foundUsers = users.map { (principal: $0.id.uuidString, username: $0.username) }
                // Auto-select if only one result
                if foundUsers.count == 1 {
                    selectedUser = foundUsers.first
                }
            }
        } catch {
            errorMessage = "Search failed: \(error.localizedDescription)"
            NSLog("❌ User search error: %@", String(describing: error))
        }

        isSearching = false
    }
}
