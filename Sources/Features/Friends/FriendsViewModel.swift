import Foundation
import SwiftUI
import Combine

@MainActor
class FriendsViewModel: ObservableObject {
    @Published var displayedFriends: [Friend] = []
    @Published var friendsCount: Int = 0
    @Published var onlineCount: Int = 0
    @Published var requestCount: Int = 0
    @Published var blockedCount: Int = 0
    @Published var searchText: String = ""
    @Published var selectedTab: FriendsView.FriendTab = .all
    @Published var isLargeListMode: Bool = false
    @Published var isReady: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let socialService = SocialService.shared
    
    // Config
    private let largeListThreshold = 100
    private let displayLimit = 100 // Only show top 100 loaded friends in list
    
    init() {
        // 1. Initial Synchronous Load (Fix for Flash)
        self.refreshList(
            friends: socialService.friends,
            onlineIds: socialService.onlineUserIds,
            unread: socialService.unreadCounts,
            messages: socialService.messages,
            search: searchText,
            tab: selectedTab
        )
        self.isReady = true
        
        // 2. Setup Reactive Bindings
        setupBindings()
    }
    
    private func setupBindings() {
        // Bind basic counts directly
        socialService.$friends
            .map { $0.count }
            .assign(to: &$friendsCount)
            
        socialService.$friendRequests
            .map { requests in requests.filter { $0.status == .pending }.count }
            .assign(to: &$requestCount)
            
        // Calculate Online Count (accepted friends only)
        Publishers.CombineLatest3(
            socialService.$friends,
            socialService.$onlineUserIds,
            socialService.$friendActivity
        )
        .map { friends, onlineIds, activityMap in
            friends.filter { friend in
                guard friend.status == .accepted else { return false }
                // Online if in onlineIds OR has active watching status
                if let activity = activityMap[friend.id], activity.currentlyWatching != nil {
                    return true
                }
                return onlineIds.contains(friend.id)
            }.count
        }
        .assign(to: &$onlineCount)

        socialService.$blockedUsers
            .map { $0.count }
            .assign(to: &$blockedCount)
            
        // Complex Binding: Re-calculate displayed list
        Publishers.CombineLatest4(
            socialService.$friends,
            socialService.$onlineUserIds,
            socialService.$unreadCounts,
            socialService.$messages // For last message time
        )
        .combineLatest($searchText, $selectedTab)
        .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main) // Throttle updates
        .sink { [weak self] (tuple, search, tab) in
            guard let self = self else { return }
            let (friends, onlineIds, unread, messages) = tuple
            
            self.refreshList(
                friends: friends,
                onlineIds: onlineIds,
                unread: unread,
                messages: messages,
                search: search,
                tab: tab
            )
            
            if !self.isReady {
                self.isReady = true
            }
        }
        .store(in: &cancellables)
    }
    
    private func refreshList(
        friends: [Friend],
        onlineIds: Set<String>,
        unread: [String: Int],
        messages: [String: [DirectMessage]],
        search: String,
        tab: FriendsView.FriendTab
    ) {
        let acceptedFriends = friends.filter { $0.status == .accepted }
        
        // 1. Check for Large List Mode
        let totalAccepted = acceptedFriends.count
        let isHuge = totalAccepted > largeListThreshold
        self.isLargeListMode = isHuge
        
        // 2. Base Filter
        var filtered: [Friend]
        
        switch tab {
        case .all:
            if isHuge && search.isEmpty {
                // In massive mode, "All" tab only shows:
                // 1. Online Users
                // 2. Users with unread messages
                // 3. Favorites
                // It does NOT show offline, read, non-favorite users unless searched.
                filtered = acceptedFriends.filter { friend in
                    onlineIds.contains(friend.id) ||
                    (unread[friend.id] ?? 0) > 0 ||
                    friend.isFavorite
                }
            } else {
                filtered = acceptedFriends
            }
        case .online:
            filtered = acceptedFriends.filter { friend in
                // Check social service activity OR simple online ID
                if let activity = socialService.friendActivity[friend.id] {
                    return activity.currentlyWatching != nil || onlineIds.contains(friend.id)
                }
                return onlineIds.contains(friend.id)
            }
        case .requests, .blocked:
            filtered = [] // Handled by separate views
        }
        
        // 3. Search Filter
        if !search.isEmpty {
            // If searching in "All" tab in Large Mode, we search the ENTIRE accepted list, not just the filtered one.
            let source = (tab == .all && isHuge) ? acceptedFriends : filtered
            
            filtered = source.filter { friend in
                friend.username.localizedCaseInsensitiveContains(search) ||
                friend.id.localizedCaseInsensitiveContains(search)
            }
        }
        
        // 4. Sort
        // We do this on main thread for now as it's debounced and capped by 'filtered' count usually.
        // If sorting 10k items, might still lag. But 'isHuge' logic prevents 10k items from reaching here unless searching "."
        filtered.sort { lhs, rhs in
            // Unread
            let unreadLhs = unread[lhs.id] ?? 0
            let unreadRhs = unread[rhs.id] ?? 0
            if unreadLhs != unreadRhs { return unreadLhs > unreadRhs }
            
            // Favorites
            if lhs.isFavorite != rhs.isFavorite { return lhs.isFavorite }
            
            // Online (New priority)
            let onlineL = onlineIds.contains(lhs.id)
            let onlineR = onlineIds.contains(rhs.id)
            if onlineL != onlineR { return onlineL } // Online first
            
            // Recency
            let lastMsgLhs = messages[lhs.id]?.last?.createdAt ?? Date.distantPast
            let lastMsgRhs = messages[rhs.id]?.last?.createdAt ?? Date.distantPast
            if lastMsgLhs != lastMsgRhs { return lastMsgLhs > lastMsgRhs }
            
            // Alphabetical
            return lhs.username.localizedCaseInsensitiveCompare(rhs.username) == .orderedAscending
        }
        
        // 5. Limit (Pagination Proxy)
        // Only show top N items to keep lazy stacks snappy
        let limited = Array(filtered.prefix(displayLimit))
        
        self.displayedFriends = limited
    }
}
