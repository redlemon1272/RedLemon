
import Foundation
import Combine

// STUB: Full implementation contains proprietary sync logic.
@MainActor
class MPVPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    func loadMedia(_ item: MediaItem) async { print("Stub") }
    func togglePlayPause() {}
    func seek(to time: Double) {}
}

