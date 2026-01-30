//
//  Stream.swift
//  RedLemon
//

import Foundation
import SwiftUI

struct Stream: Codable, Identifiable {
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

    // MARK: - Computed Properties

    /// Unique ID for SwiftUI List identification
    /// Uses infoHash if available, otherwise uses URL, otherwise uses title+provider combination
    var id: String {
        if let hash = infoHash {
            return hash
        } else if let streamUrl = url {
            return streamUrl
        } else {
            // For streams without hash or URL (like MediaFusion P2P), use title + provider
            return "\(title)-\(provider)"
        }
    }

    /// Helper to detect video quality from title (for fallback scenarios)
    static func detectVideoQuality(from title: String) -> String {
        let titleUpper = title.uppercased()

        if titleUpper.contains("2160P") {
            return "4K"
        } else if titleUpper.contains("1080P") {
            return "1080p"
        } else if titleUpper.contains("4K") || titleUpper.contains("UHD") {
            return "4K"
        } else if titleUpper.contains("720P") {
            return "720p"
        } else if titleUpper.contains("480P") {
            return "480p"
        }

        return "Unknown"
    }

    // MARK: - Normalization
    
    /// Normalizes a title for robust comparison (lowercase, remove extensions, replace delimiters with spaces)
    static func normalizeTitle(_ title: String) -> String {
        var normalized = title.lowercased()
        
        // Remove common video extensions
        for ext in [".mkv", ".mp4", ".avi", ".mov", ".ts", ".webm"] {
            if normalized.hasSuffix(ext) {
                normalized = String(normalized.dropLast(ext.count))
            }
        }
        
        // Pre-processing: Standardize 5.1/7.1/2.0 patterns to "d p d" (e.g. "5.1" -> "5 1")
        // This ensures "DDP5.1" and "DDP5 1" normalize to the same string
        normalized = normalized.replacingOccurrences(of: "5.1", with: "5 1")
        normalized = normalized.replacingOccurrences(of: "7.1", with: "7 1")
        normalized = normalized.replacingOccurrences(of: "2.0", with: "2 0")

        // Replace all non-alphanumeric characters with spaces to handle different delimiter styles
        // (dots, dashes, underscores, etc.)
        normalized = normalized.map { char in
            if char.isLetter || char.isNumber {
                return String(char)
            } else {
                return " "
            }
        }.joined()
        
        // Condense multiple spaces and trim
        return normalized.components(separatedBy: .whitespaces)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
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

    /// Emoji for source quality
    var sourceQualityEmoji: String {
        switch sourceQuality {
        case "BluRay": return "💎"
        case "WEB-DL": return "🌐"
        case "WEBRip": return "🌍"
        case "CAM": return "🎬"
        case "TS": return "📽️"
        case "HDTV": return "📺"
        case "DVDRip": return "💿"
        default: return "❓"
        }
    }

    /// SwiftUI Color for source quality badge
    var sourceQualityBadgeColor: Color {
        switch sourceQuality {
        case "BluRay": return .blue
        case "WEB-DL", "WEBRip": return .green
        case "CAM", "TS": return .red
        case "HDTV", "DVDRip": return .orange
        default: return .gray
        }
    }

    // MARK: - Codec Detection

    /// Extract the video codec from title (x264, x265, H.264, H.265, HEVC, AVC)
    var videoCodec: String {
        let titleUpper = title.uppercased()

        // Check for x265/HEVC/H.265 first (more specific)
        if titleUpper.contains("X265") || titleUpper.contains("H.265") || titleUpper.contains("HEVC") {
            return "x265"
        }
        // Then check for x264/H.264/AVC
        else if titleUpper.contains("X264") || titleUpper.contains("H.264") || titleUpper.contains("AVC") {
            return "x264"
        }

        return "Unknown"
    }

    /// Emoji for video codec
    var videoCodecEmoji: String {
        switch videoCodec {
        case "x265": return "🔥"
        case "x264": return "⚡"
        default: return "❓"
        }
    }

    /// SwiftUI Color for video codec badge
    var videoCodecBadgeColor: Color {
        switch videoCodec {
        case "x265": return .orange
        case "x264": return .blue
        default: return .gray
        }
    }

    /// Seeder tier for display purposes
    var seederTier: String {
        guard let seeders = seeders else { return "none" }
        if seeders >= 100 { return "high" }
        if seeders >= 20 { return "medium" }
        if seeders >= 1 { return "low" }
        return "none"
    }

    /// Emoji for seeder count
    var seederEmoji: String {
        switch seederTier {
        case "high": return "🌳"
        case "medium": return "🌿"
        case "low": return "🌱"
        default: return "🔻"
        }
    }

    /// SwiftUI Color for seeder badge
    var seederBadgeColor: Color {
        switch seederTier {
        case "high": return .green
        case "medium": return .yellow
        case "low": return .orange
        default: return .red
        }
    }

    /// Formatted size display
    var formattedSize: String {
        guard let size = size else { return "Unknown" }

        // Extract numeric value and unit
        let components = size.components(separatedBy: CharacterSet.decimalDigits.inverted)
        let numbers = components.filter { !$0.isEmpty }

        if let numberString = numbers.first, let number = Double(numberString) {
            if size.uppercased().contains("GB") {
                return String(format: "%.1f GB", number)
            } else if size.uppercased().contains("MB") {
                return String(format: "%.0f MB", number)
            }
        }

        return size
    }

    /// Emoji for provider
    var providerEmoji: String {
        switch provider.lowercased() {
        case "torrentio": return "🚀"
        case "mediafusion": return "🔮"
        case "comet": return "☄️"
        case "zilean": return "📡"
        case "jackettio": return "🧥"
        case "debridsearch": return "☁️"
        default: return "📡"
        }
    }

    /// Detect if this is a season/multi-episode pack
    var isPack: Bool {
        let titleUpper = title.uppercased()

        // Check for season-only indicators (S01, S05, S1, S2, etc. without E##)
        // "Breaking Bad (2008) S05" → has S05 but no E## = pack
        if let regex = try? NSRegularExpression(pattern: "\\bS\\d{1,2}\\b", options: []) {
            let nsString = titleUpper as NSString
            let range = NSRange(location: 0, length: nsString.length)
            if regex.firstMatch(in: titleUpper, options: [], range: range) != nil {
                // Make sure it's not "S##E##" format (that's a single episode)
                if !titleUpper.contains("E") || !titleUpper.contains("EPISODE") {
                    return true
                }
            }
        }

        // Check for explicit range indicators (S01-S05, S1-5, etc.)
        if titleUpper.contains("S01-") || titleUpper.contains("S02-") || titleUpper.contains("S03-") ||
            titleUpper.contains("S04-") || titleUpper.contains("S05-") || titleUpper.contains("S06-") ||
            titleUpper.contains("S07-") || titleUpper.contains("S08-") || titleUpper.contains("S09-") ||
            titleUpper.contains("S10-") || titleUpper.contains("S1-") || titleUpper.contains("S2-") ||
            titleUpper.contains("S3-") || titleUpper.contains("S4-") || titleUpper.contains("S5-") ||
            titleUpper.contains("S6-") || titleUpper.contains("S7-") || titleUpper.contains("S8-") ||
            titleUpper.contains("S9-") {
            return true
        }

        // Check for "Season X" without episode number
        if titleUpper.contains("SEASON") && !titleUpper.contains("E") && !titleUpper.contains("EPISODE") {
            return true
        }

        // Check for complete series
        if titleUpper.contains("COMPLETE SERIES") || titleUpper.contains("ALL SEASONS") ||
            titleUpper.contains("SEASONS 1") || titleUpper.contains("FULL SERIES") {
            return true
        }

        return false
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
