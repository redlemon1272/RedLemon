//
//  FriendsView.swift
//  RedLemon
//
//  Social friends list and management
//

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var appState: AppState
    @State private var friends: [Friend] = []
    @State private var friendRequests: [FriendRequest] = []
    @State private var friendActivity: [FriendActivity] = []
    @State private var isLoading = false
    @State private var showingAddFriend = false
    @State private var searchText = ""
    @State private var selectedTab: FriendTab = .all

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
                    if isLoading {
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
                await sendFriendRequest(to: principal, username: username)
            })
        }
        .task {
            await loadFriends()
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Friends")
                    .font(.system(size: 32, weight: .bold))

                Text("\(friends.filter { $0.status == .accepted }.count) friends")
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
            tabButton(title: "All", count: friends.filter { $0.status == .accepted }.count, tab: .all)
            tabButton(title: "Online", count: onlineFriends.count, tab: .online)
            tabButton(title: "Favorites", count: friends.filter { $0.isFavorite }.count, tab: .favorites)
            tabButton(title: "Requests", count: friendRequests.filter { $0.status == .pending }.count, tab: .requests)
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
            FriendRow(
                friend: friend,
                activity: friendActivity.first { $0.id == friend.id },
                onToggleFavorite: { await toggleFavorite(friend) },
                onRemove: { await removeFriend(friend) },
                onInvite: { inviteToWatchParty(friend) }
            )
        }
    }

    // MARK: - Requests List

    private var requestsList: some View {
        Group {
            if friendRequests.filter({ $0.status == .pending }).isEmpty {
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
                ForEach(friendRequests.filter { $0.status == .pending }) { request in
                    FriendRequestRow(
                        request: request,
                        onAccept: { await acceptFriendRequest(request) },
                        onDecline: { await declineFriendRequest(request) }
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
        var result = friends.filter { $0.status == .accepted }

        // Filter by tab
        switch selectedTab {
        case .all:
            break
        case .online:
            result = result.filter { friend in
                if let activity = friendActivity.first(where: { $0.id == friend.id }) {
                    return activity.currentlyWatching != nil
                }
                return false
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

        // Sort: favorites first, then by username
        return result.sorted { lhs, rhs in
            if lhs.isFavorite != rhs.isFavorite {
                return lhs.isFavorite
            }
            return lhs.username.localizedCaseInsensitiveCompare(rhs.username) == .orderedAscending
        }
    }

    private var onlineFriends: [Friend] {
        friends.filter { friend in
            if let activity = friendActivity.first(where: { $0.id == friend.id }) {
                return activity.currentlyWatching != nil
            }
            return false
        }
    }

    // MARK: - Actions

    private func loadFriends() async {
        NSLog("🚀 FriendsView: loadFriends() called")
        NSLog("   Current username: \(appState.currentUsername)")
        NSLog("   Current user ID: \(appState.currentUserId?.uuidString ?? "nil")")

        isLoading = true

        guard let userId = appState.currentUserId else {
            NSLog("❌ FriendsView: No currentUserId - cannot load friends")
            NSLog("   This means authentication failed or user is not logged in")
            isLoading = false
            return
        }

        NSLog("✅ FriendsView: Got user ID - proceeding to load friends: \(userId)")

        do {
            NSLog("📡 Supabase: Fetching friends for user \(userId)...")
            // Load friends from Supabase
            let supabaseFriends = try await SupabaseClient.shared.getFriends(userId: userId)
            NSLog("✅ Supabase: Retrieved \(supabaseFriends.count) friends from database")

            friends = supabaseFriends.map { user in
                NSLog("   Friend: \(user.username) (ID: \(user.id))")
                return Friend(
                    id: user.id.uuidString,
                    username: user.username,
                    addedDate: Date(), // Could track this in DB if needed
                    isFavorite: false,
                    status: .accepted
                )
            }

            NSLog("📡 Supabase: Fetching friend requests for user \(userId)...")
            // Load friend requests
            let supabaseRequests = try await SupabaseClient.shared.getFriendRequests(userId: userId)
            NSLog("✅ Supabase: Retrieved \(supabaseRequests.count) friend requests from database")

            friendRequests = supabaseRequests.compactMap { request in
                guard let fromUser = request.fromUser else {
                    NSLog("   ⚠️ Request \(request.id) has no fromUser - skipping")
                    return nil
                }
                NSLog("   📨 Request from: \(fromUser.username) (ID: \(fromUser.id))")
                NSLog("      Created: \(request.createdAt)")
                return FriendRequest(
                    id: request.id.uuidString,
                    fromPrincipal: fromUser.id.uuidString,
                    fromUsername: fromUser.username,
                    toPrincipal: userId.uuidString,
                    requestDate: request.createdAt,
                    status: .pending
                )
            }

            NSLog("🎉 FriendsView: SUCCESS - Loaded \(friends.count) friends and \(friendRequests.count) friend requests")

            // Check for pending requests specifically
            let pendingRequests = friendRequests.filter { $0.status == .pending }
            NSLog("   Pending requests: \(pendingRequests.count)")
            for request in pendingRequests {
                NSLog("   📨 From: \(request.fromUsername) at \(request.requestDate)")
            }

        } catch {
            NSLog("❌ FriendsView: FAILED to load friends: \(error)")
            NSLog("   Error type: \(type(of: error))")
            NSLog("   Error details: \(error.localizedDescription)")
        }

        isLoading = false
        NSLog("🏁 FriendsView: loadFriends() completed")
    }

    private func sendFriendRequest(to principal: String, username: String) async -> String? {
        print("📤 Sending friend request to \(username)")

        guard let fromUserId = appState.currentUserId else {
            print("❌ Cannot send friend request: not authenticated")
            return "Not authenticated"
        }

        do {
            try await SupabaseClient.shared.sendFriendRequest(
                fromUserId: fromUserId,
                toUsername: username
            )
            print("✅ Friend request sent to \(username)")

            // Refresh friend list
            await loadFriends()
            return nil // Success
        } catch let error as SupabaseError {
            // Handle specific Supabase errors
            switch error {
            case .httpError(409, _):
                return "Friend request already sent or you're already friends"
            case .userNotFound:
                return "User not found"
            default:
                print("❌ Failed to send friend request: \(error)")
                return "Failed to send request: \(error.localizedDescription)"
            }
        } catch {
            print("❌ Failed to send friend request: \(error)")
            return "Failed to send request: \(error.localizedDescription)"
        }
    }

    private func acceptFriendRequest(_ request: FriendRequest) async {
        print("✅ Accepting friend request from \(request.fromUsername)")

        guard let userId = appState.currentUserId,
              let requestId = UUID(uuidString: request.id),
              let friendId = UUID(uuidString: request.fromPrincipal) else {
            print("❌ Invalid UUIDs")
            return
        }

        do {
            try await SupabaseClient.shared.acceptFriendRequest(
                requestId: requestId,
                userId: userId,
                friendId: friendId
            )
            print("✅ Friend request accepted!")
            await loadFriends()
        } catch {
            print("❌ Failed to accept friend request: \(error)")
        }
    }

    private func declineFriendRequest(_ request: FriendRequest) async {
        print("❌ Declining friend request from \(request.fromUsername)")

        guard let requestId = UUID(uuidString: request.id) else {
            print("❌ Invalid request ID")
            return
        }

        do {
            try await SupabaseClient.shared.declineFriendRequest(requestId: requestId)
            print("✅ Friend request declined")
            await loadFriends()
        } catch {
            print("❌ Failed to decline friend request: \(error)")
        }
    }

    private func toggleFavorite(_ friend: Friend) async {
        print("⭐️ Toggling favorite for \(friend.username)")
        // FUTURE: Persist favorite state in Supabase user preferences
    }

    private func removeFriend(_ friend: Friend) async {
        print("🗑️ Removing friend \(friend.username)")
        // FUTURE: Remove from Supabase friendships table
    }

    private func inviteToWatchParty(_ friend: Friend) {
        print("📨 Inviting \(friend.username) to watch party")
        // FUTURE: Send push notification or in-app invite via Supabase
    }
}

// MARK: - Friend Row

struct FriendRow: View {
    let friend: Friend
    let activity: FriendActivity?
    let onToggleFavorite: () async -> Void
    let onRemove: () async -> Void
    let onInvite: () -> Void

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
                if activity?.currentlyWatching != nil {
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

            Spacer()

            // Action buttons
            if activity?.currentlyWatching != nil {
                Button(action: onInvite) {
                    Label("Invite", systemImage: "person.crop.circle.badge.plus")
                        .font(.caption)
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
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
