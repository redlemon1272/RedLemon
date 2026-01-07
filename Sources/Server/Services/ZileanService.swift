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

    init(url: String = "https://zilean.elfhosted.com") {
        self.baseUrl = url
    }

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        // Zilean uses text search, not IMDB ID - need to get title from metadata
        guard let metadata = await MetadataService.shared.getMetadata(imdbId: imdbId, type: type) else {
            print("⚠️ Zilean: Could not get metadata for \(imdbId)")
            return []
        }

        let title = metadata.title
        NSLog("🔍 Zilean: Searching for \"\(title)\"")

        // URL encode the title
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return []
        }

        // Build URL: /dmm/search?query={title}
        let urlString = "\(baseUrl)/dmm/search?query=\(encodedTitle)"
        guard let url = URL(string: urlString) else {
            return []
        }

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

        // Zilean returns JSON array directly, not {streams: []}
        let results = try JSONDecoder().decode([ZileanResult].self, from: data)

        NSLog("✅ Zilean: Got \(results.count) results")

        // Filter by season/episode if needed
        let filtered: [ZileanResult]
        if let season = season, let episode = episode {
            filtered = results.filter { result in
                let rawTitle = result.raw_title ?? ""

                // Check if it's a season pack that includes this season
                if let seasons = result.seasons, seasons.contains(season) {
                    return true
                }

                // Check if filename matches S01E01 pattern
                let pattern = "S\\d{1,2}E\\d{1,2}"
                let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
                if let match = regex?.firstMatch(in: rawTitle, options: [], range: NSRange(rawTitle.startIndex..., in: rawTitle)) {
                    let matchedText = (rawTitle as NSString).substring(with: match.range)
                    // Extract season and episode numbers
                    let parts = matchedText.dropFirst().split(separator: "E")
                    if parts.count == 2,
                       let matchSeason = Int(parts[0].filter { $0.isNumber }),
                       let matchEpisode = Int(parts[1].filter { $0.isNumber }) {
                        return matchSeason == season && matchEpisode == episode
                    }
                }

                return false
            }
        } else {
            filtered = results
        }

        NSLog("🔍 Zilean: Filtered to \(filtered.count) streams")

        return parseStreams(filtered)
    }
    
    func checkHealth() async -> Bool {
        // Try to reach the root endpoint or search for a Common title
        // Note: The curl verification showed 404 for /dmm/search, so this might fail until the endpoint is corrected upstream or configured correctly.
        // We will try a known query.
        let encodedTitle = "The Matrix".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "The Matrix"
        let urlString = "\(baseUrl)/dmm/search?query=\(encodedTitle)"
        guard let url = URL(string: urlString) else { return false }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.timeoutInterval = 5
        
        do {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 5
            let session = URLSession(configuration: config)
            let (_, response) = try await session.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
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
    let size: String?  // Changed from Int64? to String? since Zilean returns string
    let seasons: [Int]?  // For season packs
}
