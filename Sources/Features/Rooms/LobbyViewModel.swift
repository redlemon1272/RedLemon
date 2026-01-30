
import Foundation

// STUB: Full implementation contains proprietary presence logic.
@MainActor
class LobbyViewModel: ObservableObject {
    @Published var participants: [String] = []
    func createLobby() async {}
    func joinLobby(id: String) async {}
}

