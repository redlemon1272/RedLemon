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
    private let sendCallback: (String) async -> Void
    
    init(sendCallback: @escaping (String) async -> Void) {
        self.sendCallback = sendCallback
    }
    
    // MARK: - Actions
    
    func send() async {
        let trimmed = chatInput.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        // Optimistic clear
        chatInput = ""
        
        // Delegate actual sending to the owner (who handles Realtime plumbing)
        await sendCallback(trimmed)
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
    func addLocalMessage(username: String, text: String) {
        let msg = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date()
        )
        addChatMessage(msg)
    }
    
    func clearMessages() {
        unifiedMessages.removeAll()
    }
}
