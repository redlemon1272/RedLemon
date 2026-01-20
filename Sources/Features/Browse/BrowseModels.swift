import Foundation
import SwiftUI

enum MediaType: String, CaseIterable {
    case movies = "Movies"
    case shows = "TV Shows"

    var index: Int {
        self == .movies ? 0 : 1
    }

    static func from(index: Int) -> MediaType {
        index == 0 ? .movies : .shows
    }
}


// MARK: - Browse View Related Models

// Stremio addon response models
struct StremioMetaResponse: Codable {
    let metas: [StremioMeta]
}

struct StremioMeta: Codable {
    let id: String
    let name: String
    let type: String
    let poster: String?
    let background: String?
    let logo: String?
    let releaseInfo: String?
    let released: String?
    let imdbRating: String?
    let genre: [String]?
    let runtime: String?
}
