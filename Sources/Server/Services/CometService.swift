//
//  CometService.swift
//  RedLemon
//
//  Comet Stremio addon provider
//  URL: https://comet.elfhosted.com
//

import Foundation
import Vapor

// Full Comet config matching Stremio's format (from ColorFruit)
private struct CometFullConfig: Codable {
    let maxResultsPerResolution: Int
    let maxSize: Int
    let cachedOnly: Bool
    let removeTrash: Bool
    let resultFormat: [String]
    let debridService: String
    let debridApiKey: String
    let debridStreamProxyPassword: String

    struct Languages: Codable {
        let exclude: [String]
        let preferred: [String]
    }
    let languages: Languages

    struct Options: Codable {
        let remove_ranks_under: Int
        let allow_english_in_languages: Bool
        let remove_unknown_languages: Bool
    }
    let options: Options
    let resolutions: [String: Bool]
}

class CometService: ProviderService {
    let name = "comet"
    private let baseUrl = "https://comet.elfhosted.com"

    init() {}

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        // Fetch API Key Dynamically
        let apiKey = await KeychainManager.shared.get(service: "realdebrid")
        let config = buildConfig(apiKey: apiKey)
        
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode, config: config)

        print("🔍 Comet: Fetching \(url.absoluteString.prefix(100))...")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 5

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ProviderError.httpError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }

        let decoder = JSONDecoder()
        let result = try decoder.decode(CometResponse.self, from: data)

        print("✅ Comet: Got \(result.streams?.count ?? 0) streams")

        return parseStreams(result.streams ?? [])
    }
    
    private func buildConfig(apiKey: String?) -> String {
        guard let apiKey = apiKey, !apiKey.isEmpty else { return "" }
        
        let configData = CometFullConfig(
            maxResultsPerResolution: 0,
            maxSize: 0,
            cachedOnly: true,
            removeTrash: true,
            resultFormat: ["all"],
            debridService: "realdebrid",
            debridApiKey: apiKey,
            debridStreamProxyPassword: "",
            languages: CometFullConfig.Languages(
                exclude: [],
                preferred: ["en"]
            ),
            options: CometFullConfig.Options(
                remove_ranks_under: -10000000000,
                allow_english_in_languages: false,
                remove_unknown_languages: false
            ),
            resolutions: [:]
        )

        guard let jsonData = try? JSONEncoder().encode(configData),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            print("❌ Comet: Failed to encode config")
            return ""
        }

        let base64String = Data(jsonString.utf8).base64EncodedString()
        return base64String
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }

    private func buildUrl(imdbId: String, type: String, season: Int?, episode: Int?, config: String) -> URL {
        let streamPath: String
        if type == "series", let s = season, let e = episode {
            streamPath = "\(imdbId):\(s):\(e)"
        } else {
            streamPath = imdbId
        }

        if !config.isEmpty {
            return URL(string: "\(baseUrl)/\(config)/stream/\(type)/\(streamPath).json")!
        } else {
            return URL(string: "\(baseUrl)/stream/\(type)/\(streamPath).json")!
        }
    }

    private func parseStreams(_ streams: [CometStream]) -> [Stream] {
        print("🔍 Comet: Parsing \(streams.count) streams...")
        let parsed = streams.compactMap { stream -> Stream? in
            // Comet can return either:
            // 1. Torrent streams with infoHash
            // 2. RealDebrid instant streams with direct URL
            let infoHash = stream.infoHash
            let url = stream.url

            // Need at least one of them
            guard infoHash != nil || url != nil else {
                print("⚠️ Comet: Skipping stream with no infoHash or URL: \(stream.name ?? "unknown")")
                return nil
            }

            let title = stream.name ?? ""
            let quality = extractQuality(from: title) ?? extractQuality(from: stream.description ?? "")
            let seeders = extractSeeders(from: stream.description ?? "")
            let size = extractSize(from: stream.description ?? "")

            return Stream(
                url: url,  // Use direct URL if available (RD instant streams)
                title: title,
                quality: quality,
                seeders: seeders,
                size: size,
                provider: name,
                infoHash: infoHash?.lowercased(),  // Optional for RD streams
                fileIdx: stream.fileIdx,
                ext: nil,
                behaviorHints: nil,
                subtitles: nil
            )
        }
        print("✅ Comet: Parsed \(parsed.count) valid streams")
        return parsed
    }

    private func extractQuality(from text: String) -> String? {
        let qualities = ["2160p", "1080p", "720p", "480p"]
        for quality in qualities {
            if text.contains(quality) {
                return quality
            }
        }
        return nil
    }

    private func extractSeeders(from text: String) -> Int? {
        let pattern = "👤\\s*(\\d+)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)),
              let range = Range(match.range(at: 1), in: text) else {
            return nil
        }
        return Int(text[range])
    }

    private func extractSize(from text: String) -> String? {
        let pattern = "💾\\s*([\\d.]+\\s*[KMGT]B)"
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)),
              let range = Range(match.range(at: 1), in: text) else {
            return nil
        }
        return String(text[range])
    }
}

// Response models matching Comet's actual response
private struct CometResponse: Codable {
    let streams: [CometStream]?
}

private struct CometStream: Codable {
    let name: String?
    let description: String?
    let infoHash: String?  // For torrent streams
    let url: String?  // For RealDebrid instant streams
    let fileIdx: Int?
    let behaviorHints: StreamBehaviorHints?
}

