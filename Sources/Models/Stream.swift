//
//  Stream.swift
//  RedLemon
//

import Foundation

struct Stream: Codable {
    let url: String?
    let title: String
    let quality: String?
    let seeders: Int?
    let size: String?
    let provider: String
    let infoHash: String?
    let fileIdx: Int?
    let ext: String?
    let behaviorHints: StreamBehaviorHints?
    var subtitles: [Subtitle]?

    init(
        url: String? = nil,
        title: String,
        quality: String? = nil,
        seeders: Int? = nil,
        size: String? = nil,
        provider: String,
        infoHash: String? = nil,
        fileIdx: Int? = nil,
        ext: String? = nil,
        behaviorHints: StreamBehaviorHints? = nil,
        subtitles: [Subtitle]? = nil
    ) {
        self.url = url
        self.title = title
        self.quality = quality
        self.seeders = seeders
        self.size = size
        self.provider = provider
        self.infoHash = infoHash
        self.fileIdx = fileIdx
        self.ext = ext
        self.behaviorHints = behaviorHints
        self.subtitles = subtitles
    }

    // MARK: - Source Quality Detection

    /// Extract the source quality from title (CAM, WEB-DL, BluRay, etc.)
    var sourceQuality: String {
        let titleUpper = title.uppercased()

        // Check for specific sources (order matters - check specific first)
        if titleUpper.contains("BLURAY") || titleUpper.contains("BLU-RAY") || titleUpper.contains("BDRIP") || titleUpper.contains("BD-RIP") {
            return "BluRay"
        } else if titleUpper.contains("WEB-DL") || titleUpper.contains("WEBDL") || titleUpper.contains("WEB DL") {
            return "WEB-DL"
        } else if titleUpper.contains("WEBRIP") || titleUpper.contains("WEB-RIP") {
            return "WEBRip"
        } else if titleUpper.contains("HDCAM") {
            return "CAM"
        } else if titleUpper.contains("CAM") {
            return "CAM"
        } else if titleUpper.contains("HDTS") || titleUpper.contains("TELESYNC") || titleUpper.contains("TS") {
            return "TS"
        } else if titleUpper.contains("HDTV") {
            return "HDTV"
        } else if titleUpper.contains("DVDRIP") || titleUpper.contains("DVD-RIP") {
            return "DVDRip"
        }

        return "Unknown"
    }

    /// Badge color for source quality
    var sourceQualityColor: String {
        switch sourceQuality {
        case "BluRay": return "blue"
        case "WEB-DL", "WEBRip": return "green"
        case "CAM", "TS": return "red"
        case "HDTV", "DVDRip": return "orange"
        default: return "gray"
        }
    }
}


struct StreamBehaviorHints: Codable {
    let bingeGroup: String?
    let filename: String?
}

struct Subtitle: Codable {
    let id: String
    let url: String
    let lang: String
    let label: String
    let srclang: String
    let kind: String
    let provider: String
}

// MARK: - Request/Response Models

struct ResolveRequest: Codable {
    let imdbId: String
    let type: String?
    let season: Int?
    let episode: Int?
    let providers: [String]?
    let year: String? // e.g., "2025", "2005" - for filtering wrong releases
}

struct UnlockRequest: Codable {
    let infoHash: String
    let fileIdx: Int?
    let service: String
}

struct TokenSaveRequest: Codable {
    let service: String
    let token: String
}

struct TokenDeleteRequest: Codable {
    let service: String
}

// MARK: - Response Models

struct UnlockResponse: Codable {
    let url: String
    let filename: String?
}

struct TokenResponse: Codable {
    let saved: Bool
}

struct TokenListResponse: Codable {
    let services: [String]
}

struct ErrorResponse: Codable {
    let error: String
}

// MARK: - Stream Resolution Requests

struct ResolveByQualityRequest: Codable {
    let imdbId: String
    let type: String?
    let season: Int?
    let episode: Int?
    let providers: [String]?
    let preferredQuality: String?
}

struct ResolveResponse: Codable {
    let streams: [Stream]
    let count: Int
}

// MARK: - Quality Bucketing (ColorFruit logic)

struct QualityBucket: Codable {
    let primary: Stream?
    let alternates: [Stream]?
}

struct QualityBuckets: Codable {
    let uhd4k: QualityBucket?
    let fullHD: QualityBucket?
    let hd: QualityBucket?
    let sd: QualityBucket?

    enum CodingKeys: String, CodingKey {
        case uhd4k = "4K"
        case fullHD = "1080p"
        case hd = "720p"
        case sd = "480p"
    }
}

struct QualityBucketsResponse: Codable {
    let buckets: QualityBuckets
}
