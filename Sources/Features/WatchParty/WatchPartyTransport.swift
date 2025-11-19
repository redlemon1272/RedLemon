import Foundation

/// Transport abstraction for watch party realtime.
/// Implementations:
/// - LocalLoopbackTransport: in-process mock for UI/dev (no server).
/// - WebSocketTransport: production/LAN WebSocket client.
protocol WatchPartyTransport {
    func connect(token: String, roomId: String, role: Role) async throws
    func disconnect()
    func send(_ message: OutgoingMessage) async
    var delegate: WatchPartyTransportDelegate? { get set }
}

enum Role {
    case host
    case guest
}

enum OutgoingMessage {
    case play
    case pause
    case seek(positionMs: Int)
    case chat(text: String)
    case heartbeat(positionMs: Int, playing: Bool)
}

struct StateUpdate {
    let playing: Bool
    let positionMs: Int
    let seq: Int
    let updatedBy: UUID
}

struct ChatMessageWire {
    let from: UUID
    let text: String
    let seq: Int
    let timestamp: Date
}

protocol WatchPartyTransportDelegate: AnyObject {
    func transportDidReceiveState(_ state: StateUpdate)
    func transportDidReceiveChat(_ message: ChatMessageWire)
    func transportDidUpdatePresence(userId: UUID, event: PresenceEvent)
    func transportDidRequestReconnect()
}

enum PresenceEvent {
    case join
    case leave
}

/// Minimal in-process loopback transport for development without a server.
/// It echoes messages back locally to drive UI while building the protocol.
final class LocalLoopbackTransport: WatchPartyTransport {
    weak var delegate: WatchPartyTransportDelegate?
    private var seq: Int = 0
    private var playing: Bool = false
    private var positionMs: Int = 0
    private var currentUser: UUID = UUID()
    private var timer: Timer?

    func connect(token: String, roomId: String, role: Role) async throws {
        currentUser = UUID()
        // Simulate presence join
        delegate?.transportDidUpdatePresence(userId: currentUser, event: .join)
    }

    func disconnect() {
        timer?.invalidate()
        delegate?.transportDidUpdatePresence(userId: currentUser, event: .leave)
    }

    func send(_ message: OutgoingMessage) async {
        seq += 1
        switch message {
        case .play:
            playing = true
            emitState()
            scheduleHeartbeats()
        case .pause:
            playing = false
            emitState()
            timer?.invalidate()
        case .seek(let positionMs):
            self.positionMs = positionMs
            emitState()
        case .chat(let text):
            delegate?.transportDidReceiveChat(ChatMessageWire(from: currentUser, text: text, seq: seq, timestamp: Date()))
        case .heartbeat(let positionMs, let playing):
            self.positionMs = positionMs
            self.playing = playing
            emitState()
        }
    }

    private func emitState() {
        delegate?.transportDidReceiveState(StateUpdate(playing: playing, positionMs: positionMs, seq: seq, updatedBy: currentUser))
    }

    private func scheduleHeartbeats() {
        timer?.invalidate()
        guard playing else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.positionMs += 1000
            self.seq += 1
            self.emitState()
        }
        RunLoop.main.add(timer!, forMode: .common)
    }
}
