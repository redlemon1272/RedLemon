import Foundation
import Combine
import SwiftUI

/// Unified message type for interleaved display
enum UnifiedLobbyMessage: Identifiable {
    case system(LobbyMessage)
    case chat(ChatMessage)
    
    var id: String {
        switch self {
        case .system(let m): return m.id
        case .chat(let m): return m.id
        }
    }
    
    var timestamp: Date {
        switch self {
        case .system(let m): return m.timestamp
        case .chat(let m): return m.timestamp
        }
    }
}

/// Manages chat messages and input for the Lobby
/// Extracts chat logic from the God Object LobbyViewModel
@MainActor
class LobbyChatManager: ObservableObject {
    // Unified storage for chronological display
    @Published var unifiedMessages: [UnifiedLobbyMessage] = []
    
    // Legacy support (computed filters) - or we can remove if we update View
    var messages: [LobbyMessage] {
        unifiedMessages.compactMap {
            if case .system(let m) = $0 { return m }
            return nil
        }
    }
    
    var chatMessages: [ChatMessage] {
        unifiedMessages.compactMap {
            if case .chat(let m) = $0 { return m }
            return nil
        }
    }
    
    @Published var chatInput: String = ""
    
    // Limits
    private let maxMessages = 150
    
    // Dependencies
    // The handler is responsible for the actual network transmission
    private let sendMessageHandler: (SyncMessage) async throws -> Void
    
    init(sendMessageHandler: @escaping (SyncMessage) async throws -> Void) {
        self.sendMessageHandler = sendMessageHandler
    }
    
    // MARK: - Actions
    
    func send(senderId: String, username: String) async {
        let trimmed = chatInput.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        // Optimistic clear
        chatInput = ""
        
        // Add message locally for instant feedback (optimistic UI)
        addLocalMessage(username: username, text: trimmed, senderId: senderId)
        
        // Construct SyncMessage
        let syncMsg = SyncMessage(
            type: .chat,
            timestamp: Date().timeIntervalSince1970,
            isPlaying: nil,
            senderId: senderId,
            chatText: trimmed,
            chatUsername: username
        )
        
        // Delegate actual sending to the owner
        do {
            try await sendMessageHandler(syncMsg)
            NSLog("📡 ChatManager: Chat message sent via Realtime")
        } catch {
            NSLog("❌ ChatManager: Failed to send chat message: \(error)")
        }
    }
    
    func handleIncomingChat(chatText: String, senderId: String?, username: String?, timestamp: TimeInterval, currentUserId: String, mutedUserIds: Set<String>) {
        guard let validSenderId = senderId else { return }
        
        // Mute check
        if mutedUserIds.contains(validSenderId) {
             // System messages (LOBBY_*) should be handled by Router before calling this
             return
        }
        
        // Skip own messages (optimistically added)
        if validSenderId == currentUserId {
            return
        }

        let chatMessage = ChatMessage(
            id: UUID().uuidString,
            username: username ?? "Unknown",
            text: chatText,
            timestamp: Date(timeIntervalSince1970: timestamp),
            isSystem: false,
            senderId: validSenderId
        )
        
        addChatMessage(chatMessage)
        // print("💬 ChatManager: Received chat: [\(username ?? "Unknown")] \(chatText)")
    }
    
    func addSystemMessage(_ type: LobbyMessageType, userName: String, data: [String: String] = [:]) {
        let message = LobbyMessage(
            id: UUID().uuidString,
            type: type,
            userId: "system",
            userName: userName,
            timestamp: Date(),
            data: data
        )
        
        withAnimation {
            addUnified(.system(message))
        }
    }
    
    func addChatMessage(_ message: ChatMessage) {
        withAnimation {
            addUnified(.chat(message))
        }
    }
    
    private func addUnified(_ item: UnifiedLobbyMessage) {
        unifiedMessages.append(item)
        if unifiedMessages.count > maxMessages {
            unifiedMessages.removeFirst()
        }
    }
    
    // Helper to add a local optimistic message
    public func addLocalMessage(username: String, text: String, senderId: String? = nil) {
        let msg = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date(),
            isSystem: false,
            senderId: senderId
        )
        addChatMessage(msg)
    }
    
    func clearMessages() {
        unifiedMessages.removeAll()
    }
}
