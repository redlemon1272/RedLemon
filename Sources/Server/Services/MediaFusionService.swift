//
//  MediaFusionService.swift
//  RedLemon
//
//  MediaFusion Stremio addon provider
//  Uses standard Stremio addon format
//

import Foundation
import Vapor

class MediaFusionService: ProviderService {
    let name = "mediafusion"
    private let baseUrl: String

    init(url: String = "https://mediafusion.elfhosted.com") {
        self.baseUrl = url
    }

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode)

        print("🔍 MediaFusion: Fetching \(url)")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        // Add User-Agent to bypass some bot protection (Teapot 418)
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 10

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        let session = URLSession(configuration: config)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("⚠️ MediaFusion: HTTP \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            return []
        }

        let result = try JSONDecoder().decode(StremioResponse.self, from: data)
        let streams = result.streams ?? []

        print("✅ MediaFusion: Got \(streams.count) streams")

        return parseStreams(streams)
    }
    
    func checkHealth() async -> Bool {
        // Fetch manifest.json as a health check (more reliable than searching for a stream)
        guard let url = URL(string: baseUrl + "/manifest.json") else { return false }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        // Use standard browser user-agent
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 5
        
        do {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 5
            let session = URLSession(configuration: config)
            let (_, response) = try await session.data(for: request)
            
            // Accept 200 or 405 (Method Not Allowed) as "Online" signals, 
            // since 405 means the server is up and enforcing semantic rules, unlike 404/Timeout.
            if let httpResponse = response as? HTTPURLResponse {
                // MediaFusion sometimes returns 405 for HEAD, but we are sending GET.
                // If it returns 200, we are golden.
                if httpResponse.statusCode == 200 {
                    return true
                }
                print("⚠️ MediaFusion Health Check returned status: \(httpResponse.statusCode)")
            }
        } catch {
            print("❌ MediaFusion Health Check Failed: \(error)")
        }
        return false
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

            // Parse seeders (MediaFusion might provide this directly)
            let seeders = stream.seeders ?? extractSeeders(from: title)

            // Parse size (MediaFusion might provide this directly)
            let size = stream.size ?? extractSize(from: title)

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
                behaviorHints: nil,
                subtitles: nil
            )
        }
    }

    private func extractQuality(from text: String) -> String {
        let qualityPatterns = ["2160p", "1080p", "720p", "480p"]
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

// MARK: - Stremio API Response Types

struct StremioResponse: Codable {
    let streams: [StremioStream]?
}

struct StremioStream: Codable {
    let url: String?
    let title: String?
    let name: String?
    let infoHash: String?
    let seeders: Int?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case url
        case title
        case name
        case infoHash = "info_hash"
        case seeders
        case size
    }
}
