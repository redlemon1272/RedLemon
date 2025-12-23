//
//  DebridSearchService.swift
//  RedLemon
//
//  Debrid Search Stremio addon provider
//  URL: https://68d69db7dc40-debrid-search.baby-beamup.club
//  Searches downloads and torrents in your Debrid cloud
//

import Foundation
import Vapor

class DebridSearchService: ProviderService {
    let name = "debridsearch"
    private let baseUrl = "https://68d69db7dc40-debrid-search.baby-beamup.club"
    private let debridProvider: String
    private let debridApiKey: String?
    
    init(debridProvider: String = "RealDebrid", debridApiKey: String? = nil) {
        self.debridProvider = debridProvider
        self.debridApiKey = debridApiKey
    }
    
    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        // Debrid Search requires API key configuration
        guard let apiKey = debridApiKey, !apiKey.isEmpty else {
            NSLog("⚠️ DebridSearch: No API key configured, skipping")
            return []
        }
        
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode)
        
        NSLog("🔍 DebridSearch: Fetching \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 8
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ProviderError.httpError(statusCode: 0)
        }
        
        // Handle 400 errors gracefully (no configuration or no results)
        if httpResponse.statusCode == 400 {
            NSLog("⚠️ DebridSearch: Bad request (likely missing configuration or no cached content)")
            return []
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ProviderError.httpError(statusCode: httpResponse.statusCode)
        }
        
        let result = try JSONDecoder().decode(DebridSearchResponse.self, from: data)
        
        let streams = parseStreams(result.streams ?? [])
        NSLog("✅ DebridSearch: Parsed \(streams.count) streams")
        return streams
    }
    
    private func buildUrl(imdbId: String, type: String, season: Int?, episode: Int?) -> URL {
        // Build config JSON object
        // The addon expects specific keys: DebridProvider and DebridApiKey
        // Code: https://github.com/MrMonkey42/stremio-addon-debrid-search/blob/main/addon.js
        let configDict: [String: String] = [
            "DebridProvider": debridProvider,
            "DebridApiKey": debridApiKey ?? ""
        ]
        
        // Serialize to JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: configDict, options: []),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            NSLog("❌ DebridSearch: Failed to verify JSON config")
            return URL(string: baseUrl)!
        }
        
        // URL Encode the JSON string
        // We use allowedCharacters .urlPathAllowed but remove specific chars that might confuse routing
        // However, usually putting encoded JSON in path works if server decodes it
        // Stremio addons often accept unencoded JSON if it doesn't contain slashes, but encoding is safer
        let encodedConfig = jsonString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        
        // Build path: /{config}/stream/{type}/{imdbId}[:{season}:{episode}].json
        var path = "/\(encodedConfig)/stream/\(type)/\(imdbId)"
        
        if let season = season, let episode = episode {
            path += ":\(season):\(episode)"
            NSLog("📺 DebridSearch: Building URL for S\(String(format: "%02d", season))E\(String(format: "%02d", episode))")
        } else {
            NSLog("🎬 DebridSearch: Building URL for movie (no season/episode)")
        }
        
        path += ".json"
        
        // Fix for double encoding or encoding issues:
        // Some servers expect raw JSON in path, others encoded.
        // Given 'router' middleware in Node usually decodes params, sending encoded %7B... should result in { in req.params
        
        guard let url = URL(string: baseUrl + path) else {
            NSLog("❌ DebridSearch: Failed to build URL with config")
            return URL(string: baseUrl)!
        }
        
        NSLog("🔗 DebridSearch URL: \(url.absoluteString.replacingOccurrences(of: debridApiKey ?? "", with: "***"))")
        return url
    }
    
    private func parseStreams(_ debridSearchStreams: [DebridSearchStream]) -> [Stream] {
        return debridSearchStreams.compactMap { debridStream -> Stream? in
            // DebridSearch can return streams with either:
            // 1. infoHash (for torrents in debrid cloud)
            // 2. url (for direct downloads in debrid cloud)
            
            guard let title = debridStream.title else {
                return nil
            }

            // FILTER: Malformed URLs from addon (ending in /undefined)
            // This happens when the addon fails to resolve the source link
            if let url = debridStream.url, url.hasSuffix("/undefined") {
                NSLog("⚠️ DebridSearch: Dropping stream with malformed URL (undefined): \(title)")
                return nil
            }
            
            // Parse quality from title (e.g., "1080p", "2160p", "720p")
            let quality = extractQuality(from: title)
            
            // Parse seeders from title if available
            let seeders = extractSeeders(from: title)
            
            // Parse size from title if available
            let size = extractSize(from: title)
            
            return Stream(
                url: debridStream.url,
                title: title,
                quality: quality,
                seeders: seeders ?? 999, // High seeders for cached content
                size: size,
                provider: name,
                infoHash: debridStream.infoHash?.lowercased(),
                fileIdx: debridStream.fileIdx,
                ext: nil,
                behaviorHints: debridStream.behaviorHints,
                subtitles: nil
            )
        }
    }
    
    private func extractQuality(from title: String) -> String {
        let qualityPatterns = ["2160p", "1080p", "720p", "480p"]
        for pattern in qualityPatterns {
            if title.contains(pattern) {
                return pattern
            }
        }
        return "Unknown"
    }
    
    private func extractSeeders(from title: String) -> Int? {
        // Match "👤 150" or "👤150" or similar patterns
        let pattern = "👤\\s*(\\d+)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: title, range: NSRange(title.startIndex..., in: title)),
              let seedersRange = Range(match.range(at: 1), in: title) else {
            return nil
        }
        
        return Int(title[seedersRange])
    }
    
    private func extractSize(from title: String) -> String? {
        // Match "💾 4.5 GB" or "💾 1.2 TB" or similar
        let pattern = "💾\\s*([\\d.]+\\s*[KMGT]B)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: title, range: NSRange(title.startIndex..., in: title)),
              let sizeRange = Range(match.range(at: 1), in: title) else {
            return nil
        }
        
        return String(title[sizeRange])
    }
}

// MARK: - DebridSearch Response Models

struct DebridSearchResponse: Codable {
    let streams: [DebridSearchStream]?
}

struct DebridSearchStream: Codable {
    let title: String?
    let url: String?
    let infoHash: String?
    let fileIdx: Int?
    let behaviorHints: StreamBehaviorHints?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case infoHash
        case fileIdx
        case behaviorHints
    }
}
