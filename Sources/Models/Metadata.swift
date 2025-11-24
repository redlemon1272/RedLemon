//
//  Metadata.swift
//  RedLemon
//
//  Movie/Series metadata from Cinemeta and TVMaze
//

import Foundation

struct Metadata: Codable {
    let imdbId: String
    let title: String
    let type: String  // "movie" or "series"
    let year: String?
    let poster: String?
    let background: String?
    let logo: String?
    let description: String?

    // For series
    let releaseInfo: String?  // "2013-2019"
}

struct CinemetaResponse: Codable {
    let meta: CinemetaMeta
}

struct CinemetaMeta: Codable {
    let imdb_id: String?  // IMDB ID like "tt0133093" - optional as some items may not have it
    let id: String?       // Alternative ID field
    let name: String
    let type: String
    let year: String?
    let poster: String?
    let background: String?
    let logo: String?
    let description: String?
    let releaseInfo: String?
    let released: String? // ISO date string e.g. "2023-11-24T00:00:00.000Z"
    let director: [String]?
    let cast: [String]?
    let genre: [String]?  // Note: Cinemeta uses "genre" not "genres"
    let runtime: String?
    let imdbRating: String?  // Cinemeta returns this as a String
    let trailers: [TrailerStream]?
    let videos: [CinemetaVideo]?  // For series: episode list

    enum CodingKeys: String, CodingKey {
        case imdb_id, id, name, type, year, poster, background, logo, description
        case releaseInfo, released, director, cast, genre, runtime, imdbRating, trailers, videos
    }

    // Computed property for compatibility - use imdb_id or fallback to id
    var itemId: String { imdb_id ?? id ?? "unknown" }
}

struct CinemetaVideo: Codable {
    let id: String  // Format: "tt123456:1:1" (imdbId:season:episode)
    let name: String?  // Cinemeta uses "name"
    let title: String?  // Kitsu uses "title"
    let season: Int
    let episode: Int
    let released: String?  // ISO date string
    let overview: String?  // Episode synopsis
    let thumbnail: String?  // Episode thumbnail URL
    let description: String?  // Alternative synopsis field

    // Convenience computed property - use title if available, fallback to name
    var displayTitle: String { title ?? name ?? "Episode \(season)x\(episode)" }
}

struct TrailerStream: Codable {
    let source: String  // YouTube video ID
    let type: String
}


struct TVMazeShow: Codable {
    let name: String
    let premiered: String?
    let summary: String?
    let image: TVMazeImage?
}

struct TVMazeImage: Codable {
    let medium: String?
    let original: String?
}

struct CinemetaSearchResponse: Codable {
    let metas: [CinemetaSearchResult]
}

struct CinemetaSearchResult: Codable {
    let id: String
    let name: String
    let type: String
    let year: String?
    let poster: String?
}
