import Foundation
import Combine

/// Represents the various states of the Lobby lifecycle
enum LobbyState: Equatable {
    case initializing
    case connecting
    case connected
    case waitingForReady
    case startingCountdown(secondsRemaining: Int)
    case transitioning // Handshake/Navigating to Player
    case closed
    case error(String)
}

/// Manages the state transitions for the Lobby, ensuring valid flow and providing a central place for state logic.
class LobbyStateMachine: ObservableObject {
    @Published private(set) var currentState: LobbyState = .initializing
    
    // History for debugging
    private(set) var stateHistory: [(state: LobbyState, timestamp: Date)] = []
    
    init() {
        logStateChange(to: .initializing)
    }
    
    // MARK: - Transitions
    
    /// Transition to specific state if valid
    func transition(to newState: LobbyState) {
        // Validate transition
        guard isValidTransition(from: currentState, to: newState) else {
            print("⚠️ LobbyStateMachine: Invalid transition from \(currentState) to \(newState)")
            return
        }
        
        // Perform transition
        currentState = newState
        logStateChange(to: newState)
        
        print("🚦 Lobby State: \(newState)")
    }
    
    // MARK: - Helper getters
    
    var isConnected: Bool {
        if case .initializing = currentState { return false }
        if case .connecting = currentState { return false }
        if case .error = currentState { return false }
        return true // connected, waitingForReady, startingCountdown, transitioning, closed(maybe?)
    }
    
    var isCountingDown: Bool {
        if case .startingCountdown = currentState { return true }
        return false
    }
    
    // MARK: - Internal Logic
    
    private func isValidTransition(from oldState: LobbyState, to newState: LobbyState) -> Bool {
        // Allow error from any state
        if case .error = newState { return true }
        
        // Allow closed from any state
        if case .closed = newState { return true }
        
        switch oldState {
        case .initializing:
            return newState == .connecting
            
        case .connecting:
            return newState == .connected || newState == .error("")
            
        case .connected:
            // Allow moving to connecting (Reconnect)
            if newState == .connecting { return true }
            return newState == .waitingForReady || newState == .startingCountdown(secondsRemaining: 3) || newState == .transitioning
            
        case .waitingForReady:
            // Allow moving to connecting (Reconnect)
            if newState == .connecting { return true }
            // Can go back to connected (unready?), starting countdown, or transitioning (direct start?)
             if case .startingCountdown = newState { return true }
             if case .transitioning = newState { return true }
             return false
            
        case .startingCountdown:
            // Allow moving to connecting (Reconnect)
            if newState == .connecting { return true }
            // Can go to transitioning (count finished) or back to waitingForReady (cancelled)
            if case .transitioning = newState { return true }
            if case .waitingForReady = newState { return true }
            // Recursive countdown updates are handled by re-assignment but conceptually same state
            if case .startingCountdown = newState { return true }
            return false
            
        case .transitioning:
            // Allow moving to connecting (Reconnect)
            if newState == .connecting { return true }
            // Terminal state generally, but maybe back to waitingForReady if failed?
            return false
            
        case .closed:
            return newState == .initializing // Maybe reset?
            
        case .error:
            return newState == .initializing || newState == .connecting // Retry
        }
    }
    
    private func logStateChange(to newState: LobbyState) {
        stateHistory.append((state: newState, timestamp: Date()))
        // Keep history manageable
        if stateHistory.count > 50 {
            stateHistory.removeFirst()
        }
    }
}
