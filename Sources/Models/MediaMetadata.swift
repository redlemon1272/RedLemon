import Foundation

struct MediaMetadata: Identifiable {
    let id: String
    let type: String
    let title: String
    let year: String?
    let posterURL: String?
    let backgroundURL: String?
    let logoURL: String?
    let description: String?
    let director: String?
    let cast: [String]
    let genres: [String]
    let runtime: String?
    let imdbRating: Double?
    let releaseInfo: String?
    let trailerURL: String?
    let videos: [VideoEpisode]?  // For series: episode list
}

struct VideoEpisode: Identifiable {
    let id: String  // Format: "tt123456:1:1"
    let title: String
    let season: Int
    let episode: Int
    let overview: String?
    let released: String?
    let thumbnail: String?
}
