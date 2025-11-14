import Foundation

struct WatchHistoryItem: Codable, Identifiable {
    let id: String
    let mediaItem: MediaItem
    let timestamp: Double  // Last playback position in seconds
    let duration: Double   // Total duration
    let lastWatched: Date
    let quality: String?
    let season: Int?
    let episode: Int?

    var progress: Double {
        duration > 0 ? timestamp / duration : 0
    }

    var progressPercent: Int {
        Int(progress * 100)
    }
}
