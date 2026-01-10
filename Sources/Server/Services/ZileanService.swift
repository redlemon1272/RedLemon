//
//  ZileanService.swift
//  RedLemon
//
//  Zilean DMM database provider
//  URL: https://zilean.elfhosted.com
//  Requires metadata service for title lookup
//

import Foundation
import Vapor

class ZileanService: ProviderService {
    let name = "zilean"
    private let baseUrl: String

    init(url: String = "https://151.243.109.243.nip.io/zilean") {
        self.baseUrl = url
    }

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        // Build URL: /dmm/filtered?imdbId={imdbId}&season={season}&episode={episode}
        var urlComponents = URLComponents(string: "\(baseUrl)/dmm/filtered")
        var queryItems = [URLQueryItem(name: "imdbId", value: imdbId)]
        
        if let season = season {
            queryItems.append(URLQueryItem(name: "season", value: String(season)))
        }
        
        if let episode = episode {
            queryItems.append(URLQueryItem(name: "episode", value: String(episode)))
        }
        
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            return []
        }

        NSLog("%@", "🔍 Zilean: Searching via IMDB ID: \(imdbId)")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 10

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        let session = URLSession(configuration: config)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ProviderError.httpError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }

        let results = try JSONDecoder().decode([ZileanResult].self, from: data)

        NSLog("%@", "✅ Zilean: Got \(results.count) results")

        return parseStreams(results)
    }
    
    func checkHealth() async -> Bool {
        // Use the verified health check endpoint
        let urlString = "\(baseUrl)/healthchecks/ping"
        guard let url = URL(string: urlString) else { return false }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 5
        
        do {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 5
            let session = URLSession(configuration: config)
            let (data, response) = try await session.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200, let body = String(data: data, encoding: .utf8), body.contains("Pong!") {
                    return true
                }
                print("⚠️ Zilean Health Check returned status: \(httpResponse.statusCode)")
            }
        } catch {
            print("❌ Zilean Health Check Failed: \(error)")
        }
        return false
    }


    private func parseStreams(_ zileanResults: [ZileanResult]) -> [Stream] {
        return zileanResults.compactMap { result -> Stream? in
            guard let hash = result.info_hash else {
                return nil
            }

            let title = result.raw_title ?? "Unknown"

            // Parse quality
            let quality = extractQuality(from: title)

            // Parse size (Zilean returns bytes as string or int)
            let size = result.size

            return Stream(
                url: nil,
                title: title,
                quality: quality,
                seeders: 999, // Fake high seeders for DMM cached items (as in ColorFruit)
                size: size,
                provider: self.name,
                infoHash: hash.lowercased(),
                fileIdx: nil,
                ext: extractExtension(from: title),
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

    private func extractExtension(from filename: String) -> String? {
        let extensions = ["mkv", "mp4", "avi", "mov"]
        let lower = filename.lowercased()
        for ext in extensions {
            if lower.hasSuffix(".\(ext)") {
                return ext
            }
        }
        return nil
    }
}

// MARK: - Zilean Response Models

struct ZileanResult: Codable {
    let info_hash: String?
    let raw_title: String?
    let size: String?
    let seasons: [Int]?
    let episodes: [Int]?
    let imdb_id: String?
}

