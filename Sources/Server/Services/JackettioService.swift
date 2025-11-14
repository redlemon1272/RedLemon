//
//  JackettioService.swift
//  RedLemon
//
//  Jackettio Stremio addon provider (Jackett proxy)
//  Uses standard Stremio addon format
//

import Foundation
import Vapor

class JackettioService: ProviderService {
    let name = "jackettio"
    private let baseUrl: String
    
    init(url: String = "https://jackettio.elfhosted.com") {
        self.baseUrl = url
    }
    
    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode)
        
        print("🔍 Jackettio: Fetching \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 10
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("⚠️ Jackettio: HTTP \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            return []
        }
        
        let result = try JSONDecoder().decode(StremioResponse.self, from: data)
        let streams = result.streams ?? []
        
        print("✅ Jackettio: Got \(streams.count) streams")
        
        return parseStreams(streams)
    }
    
    private func buildUrl(imdbId: String, type: String, season: Int?, episode: Int?) -> URL {
        // Standard Stremio addon format
        var path = "/stream/\(type)/\(imdbId)"
        
        if let season = season, let episode = episode {
            path += ":\(season):\(episode)"
        }
        
        path += ".json"
        
        return URL(string: baseUrl + path)!
    }
    
    private func parseStreams(_ stremioStreams: [StremioStream]) -> [Stream] {
        return stremioStreams.compactMap { stream -> Stream? in
            guard let title = stream.title ?? stream.name else {
                return nil
            }
            
            let infoHash = stream.infoHash
            
            // Need either infoHash or url
            guard infoHash != nil || stream.url != nil else {
                return nil
            }
            
            // Parse quality
            let quality = extractQuality(from: title)
            
            // Parse seeders
            let seeders = extractSeeders(from: title)
            
            // Parse size
            let size = extractSize(from: title)
            
            return Stream(
                url: stream.url,
                title: title,
                quality: quality,
                seeders: seeders,
                size: size,
                provider: self.name,
                infoHash: infoHash?.lowercased(),
                fileIdx: nil,
                ext: nil,
                behaviorHints: stream.behaviorHints,
                subtitles: nil
            )
        }
    }
    
    private func extractQuality(from text: String) -> String {
        let qualityPatterns = ["2160p", "1080p", "720p", "480p", "4K"]
        for pattern in qualityPatterns {
            if text.contains(pattern) {
                return pattern
            }
        }
        return "Unknown"
    }
    
    private func extractSeeders(from text: String) -> Int? {
        let pattern = "👤\\s*(\\d+)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)),
              let seedersRange = Range(match.range(at: 1), in: text) else {
            return nil
        }
        return Int(text[seedersRange])
    }
    
    private func extractSize(from text: String) -> String? {
        let pattern = "💾\\s*([\\d.]+\\s*[KMGT]B)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)),
              let sizeRange = Range(match.range(at: 1), in: text) else {
            return nil
        }
        return String(text[sizeRange])
    }
}

// MARK: - Stremio Response Models (shared format)

struct StremioResponse: Codable {
    let streams: [StremioStream]?
}

struct StremioStream: Codable {
    let name: String?
    let title: String?
    let infoHash: String?
    let url: String?
    let seeders: Int?
    let size: String?
    let behaviorHints: StreamBehaviorHints?
}
