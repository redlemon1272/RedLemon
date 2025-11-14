//
//  TorrentioService.swift
//  RedLemon
//
//  Torrentio Stremio addon provider
//  URL: https://torrentio.strem.fun
//

import Foundation
import Vapor

class TorrentioService: ProviderService {
    let name = "torrentio"
    private let baseUrl = "https://torrentio.strem.fun"
    private let rdConfig: String

    init(rdConfig: String = "realdebrid") {
        self.rdConfig = rdConfig
    }

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode)

        print("🔍 Torrentio: Fetching \(url)")

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ProviderError.httpError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }

        let result = try JSONDecoder().decode(TorrentioResponse.self, from: data)

        return parseStreams(result.streams ?? [])
    }

    private func buildUrl(imdbId: String, type: String, season: Int?, episode: Int?) -> URL {
        var path = "/\(rdConfig)/stream/\(type)/\(imdbId)"

        if let season = season, let episode = episode {
            path += ":\(season):\(episode)"
            print("📺 Torrentio: Building URL for S\(String(format: "%02d", season))E\(String(format: "%02d", episode))")
        } else {
            print("🎬 Torrentio: Building URL for movie (no season/episode)")
        }

        path += ".json"

        let url = URL(string: baseUrl + path)!
        print("🔗 Torrentio URL: \(url)")
        return url
    }

    private func parseStreams(_ torrentioStreams: [TorrentioStream]) -> [Stream] {
        return torrentioStreams.compactMap { torrentioStream -> Stream? in
            guard let infoHash = torrentioStream.infoHash,
                  let title = torrentioStream.title else {
                return nil
            }

            // Parse quality from title (e.g., "1080p", "2160p", "720p")
            let quality = extractQuality(from: title)

            // Parse seeders from title (e.g., "👤 150")
            let seeders = extractSeeders(from: title)

            // Parse size from title (e.g., "💾 4.5 GB")
            let size = extractSize(from: title)

            return Stream(
                url: nil,
                title: title,
                quality: quality,
                seeders: seeders,
                size: size,
                provider: name,
                infoHash: infoHash.lowercased(),
                fileIdx: torrentioStream.fileIdx,
                ext: nil,
                behaviorHints: torrentioStream.behaviorHints,
                subtitles: nil
            )
        }
    }

    private func extractQuality(from title: String) -> String {
        let qualityPatterns = ["2160p", "1080p", "720p", "480p", "4K"]
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

// MARK: - Torrentio Response Models

struct TorrentioResponse: Codable {
    let streams: [TorrentioStream]?
}

struct TorrentioStream: Codable {
    let title: String?
    let infoHash: String?
    let fileIdx: Int?
    let behaviorHints: StreamBehaviorHints?

    enum CodingKeys: String, CodingKey {
        case title
        case infoHash
        case fileIdx
        case behaviorHints
    }
}

// MARK: - Errors

enum ProviderError: Error {
    case httpError(statusCode: Int)
    case parseError(String)
    case notFound
}
