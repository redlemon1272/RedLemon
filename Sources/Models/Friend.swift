//
//  Friend.swift
//  RedLemon
//
//  Friend model for social features
//

import Foundation

struct Friend: Codable, Identifiable, Equatable {
    let id: String // Principal ID
    let username: String
    let addedDate: Date
    var isFavorite: Bool
    var status: FriendStatus
    var isPremium: Bool? // Premium hosting status (Legacy boolean)
    var subscriptionExpiresAt: Date? // ✅ New: Trust Time, Not Flags (Security Check #138)

    // Helper to check if user is actually premium
    var isReallyPremium: Bool {
        if let expiry = subscriptionExpiresAt {
            return expiry > Date()
        }
        return isPremium ?? false
    }

    enum FriendStatus: String, Codable {
        case pending // Friend request sent, awaiting acceptance
        case accepted // Mutual friends
        case blocked // User blocked this person
    }

    // For displaying in UI
    var displayName: String {
        username.isEmpty ? truncatedPrincipal : username
    }

    var truncatedPrincipal: String {
        if id.count > 12 {
            return "\(id.prefix(6))...\(id.suffix(4))"
        }
        return id
    }
}

struct FriendRequest: Codable, Identifiable {
    let id: String // Unique request ID
    let fromPrincipal: String
    let fromUsername: String
    let toPrincipal: String
    let requestDate: Date
    var status: RequestStatus

    enum RequestStatus: String, Codable {
        case pending
        case accepted
        case declined
    }
}

struct FriendActivity: Identifiable, Codable {
    let id: String // User ID
    let username: String
    var currentlyWatching: WatchingInfo?
    var lastSeen: Date
    // New: Custom status string (e.g. "Browsing", "In Lobby")
    // If currentlyWatching is set, that takes precedence usually.
    // If currentlyWatching is nil, this string is shown.
    var customStatus: String? = nil
    var isPremium: Bool? = nil
    var subscriptionExpiresAt: Date? = nil // ✅ New: For presence verification

    // Helper to check if user is actually premium
    var isReallyPremium: Bool {
        if let expiry = subscriptionExpiresAt {
            return expiry > Date()
        }
        return isPremium ?? false
    }


    struct WatchingInfo: Codable, Equatable {
        let mediaTitle: String
        let mediaType: String // "movie" or "series"
        let imdbId: String
        let startedAt: Date
        let roomId: String? // If in a watch party
        var isJoinable: Bool = true // False if room is dead (no host)
    }
}

struct DirectMessage: Codable, Identifiable {
    let id: UUID
    let senderId: UUID
    let receiverId: UUID
    let content: String
    var isRead: Bool
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case senderId = "sender_id"
        case receiverId = "receiver_id"
        case content
        case isRead = "is_read"
        case createdAt = "created_at"
    }
}
