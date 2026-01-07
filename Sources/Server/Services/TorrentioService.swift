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

    init() {}

    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil
    ) async throws -> [Stream] {
        // Dynamic Config Resolution
        let customTorrentioConfig = await KeychainManager.shared.getTorrentioConfig()
        let rdApiKey = await KeychainManager.shared.get(service: "realdebrid")
        
        let config: String
        if let custom = customTorrentioConfig, !custom.isEmpty {
             NSLog("🔧 Torrentio: Using User-Defined Config")
             config = custom
        } else if let key = rdApiKey, !key.isEmpty {
             NSLog("✨ Torrentio: Using Auto-Generated Config (RealDebrid)")
             // Use minimal config - just RealDebrid key (Torrentio default providers are fine)
             // Format: realdebrid=KEY (no need for providers or sort, Torrentio has good defaults)
             config = "realdebrid=\(key)"
        } else {
             config = ""
        }
        
        let url = buildUrl(imdbId: imdbId, type: type, season: season, episode: episode, config: config)

        NSLog("🔍 Torrentio: Fetching \(url)")

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 8

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                NSLog("❌ Torrentio: No HTTP response")
                throw ProviderError.httpError(statusCode: 0)
            }
            
            NSLog("📡 Torrentio: HTTP \(httpResponse.statusCode), received \(data.count) bytes")
            
            guard httpResponse.statusCode == 200 else {
                NSLog("❌ Torrentio: HTTP error \(httpResponse.statusCode)")
                throw ProviderError.httpError(statusCode: httpResponse.statusCode)
            }

            let result = try JSONDecoder().decode(TorrentioResponse.self, from: data)
            let streams = parseStreams(result.streams ?? [])
            NSLog("✅ Torrentio: Parsed \(streams.count) streams from \(result.streams?.count ?? 0) raw")
            
            return streams
        } catch let error as ProviderError {
            throw error
        } catch {
            NSLog("❌ Torrentio: Request failed - \(error.localizedDescription)")
            throw ProviderError.httpError(statusCode: 0)
        }
    }

    private func buildUrl(imdbId: String, type: String, season: Int?, episode: Int?, config: String) -> URL {
        // Build the path components
        var pathComponents: [String] = []
        
        if !config.isEmpty {
            // Torrentio expects the config UNENCODED in the URL path
            // e.g., /realdebrid=KEY/stream/movie/tt123.json (NOT /realdebrid%3DKEY/...)
            // The config only contains alphanumerics and '=' which are safe in URL paths
            pathComponents.append(config)
        }
        
        pathComponents.append("stream")
        pathComponents.append(type)
        
        // Build the media ID part
        var mediaId = imdbId
        if let season = season, let episode = episode {
            mediaId += ":\(season):\(episode)"
            NSLog("📺 Torrentio: Building URL for S\(String(format: "%02d", season))E\(String(format: "%02d", episode))")
        } else {
            NSLog("🎬 Torrentio: Building URL for movie (no season/episode)")
        }
        mediaId += ".json"
        pathComponents.append(mediaId)
        
        // Construct the full URL
        let path = "/" + pathComponents.joined(separator: "/")
        let fullUrl = baseUrl + path
        
        NSLog("🔗 Torrentio URL (length: \(fullUrl.count)): \(fullUrl.prefix(150))...")
        
        guard let url = URL(string: fullUrl) else {
            NSLog("❌ Torrentio: Failed to create URL from: \(fullUrl)")
            // Fallback to basic URL without config
            let fallbackPath = "/stream/\(type)/\(imdbId).json"
            return URL(string: baseUrl + fallbackPath)!
        }
        
        return url
    }

    private func parseStreams(_ torrentioStreams: [TorrentioStream]) -> [Stream] {
        return torrentioStreams.compactMap { torrentioStream -> Stream? in
            guard let title = torrentioStream.title else {
                return nil
            }
            
            // Get infoHash either directly or by extracting from URL
            // URL format: https://torrentio.strem.fun/resolve/realdebrid/{KEY}/{INFOHASH}/null/{IDX}/{FILENAME}
            var infoHash: String? = torrentioStream.infoHash
            if infoHash == nil, let url = torrentioStream.url {
                // Extract infoHash from resolve URL
                // Pattern: /resolve/realdebrid/{key}/{infohash}/
                let components = url.components(separatedBy: "/")
                if let keyIdx = components.firstIndex(of: "realdebrid"),
                   keyIdx + 2 < components.count {
                    let possibleHash = components[keyIdx + 2]
                    // Validate it looks like a hash (40 hex chars)
                    if possibleHash.count == 40, possibleHash.allSatisfy({ $0.isHexDigit }) {
                        infoHash = possibleHash
                    }
                }
            }
            
            guard let finalInfoHash = infoHash else {
                // If we still have no infoHash but have a URL, use the URL directly
                if torrentioStream.url != nil {
                    // Parse quality from title (e.g., "1080p", "2160p", "720p")
                    let quality = extractQuality(from: title)
                    let seeders = extractSeeders(from: title)
                    let size = extractSize(from: title)
                    
                    return Stream(
                        url: torrentioStream.url,
                        title: title,
                        quality: quality,
                        seeders: seeders,
                        size: size,
                        provider: name,
                        infoHash: nil,
                        fileIdx: torrentioStream.fileIdx,
                        ext: nil,
                        behaviorHints: torrentioStream.behaviorHints,
                        subtitles: nil
                    )
                }
                return nil
            }

            // Parse quality from title (e.g., "1080p", "2160p", "720p")
            let quality = extractQuality(from: title)

            // Parse seeders from title (e.g., "👤 150")
            let seeders = extractSeeders(from: title)

            // Parse size from title (e.g., "💾 4.5 GB")
            let size = extractSize(from: title)

            return Stream(
                url: torrentioStream.url,  // Use the resolve URL directly if available
                title: title,
                quality: quality,
                seeders: seeders,
                size: size,
                provider: name,
                infoHash: finalInfoHash.lowercased(),
                fileIdx: torrentioStream.fileIdx,
                ext: nil,
                behaviorHints: torrentioStream.behaviorHints,
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

// MARK: - Torrentio Response Models

struct TorrentioResponse: Codable {
    let streams: [TorrentioStream]?
}

struct TorrentioStream: Codable {
    let name: String?
    let title: String?
    let url: String?
    let infoHash: String?
    let fileIdx: Int?
    let behaviorHints: StreamBehaviorHints?

    enum CodingKeys: String, CodingKey {
        case name
        case title
        case url
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
