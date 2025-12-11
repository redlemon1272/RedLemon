import Foundation
import Combine
import SwiftUI

/// Manages chat messages and input for the Lobby
/// Extracts chat logic from the God Object LobbyViewModel
@MainActor
class LobbyChatManager: ObservableObject {
    @Published var messages: [LobbyMessage] = []
    @Published var chatMessages: [ChatMessage] = []
    @Published var chatInput: String = ""
    
    // Limits
    private let maxSystemMessages = 50
    private let maxChatMessages = 100
    
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
            messages.append(message)
            if messages.count > maxSystemMessages {
                messages.removeFirst()
            }
        }
    }
    
    func addChatMessage(_ message: ChatMessage) {
        withAnimation {
            chatMessages.append(message)
            if chatMessages.count > maxChatMessages {
                chatMessages.removeFirst()
            }
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
        messages.removeAll()
        chatMessages.removeAll()
    }
}
