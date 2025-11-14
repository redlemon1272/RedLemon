//
//  ProviderService.swift
//  RedLemon
//
//  Protocol for all stream provider services
//

import Foundation
import Vapor

/// Provider service protocol
protocol ProviderService {
    /// Provider name (torrentio, comet, zilean, jackettio, mediafusion)
    var name: String { get }
    
    /// Fetch streams for IMDB ID
    /// - Parameters:
    ///   - imdbId: IMDB ID (e.g., "tt0133093" for The Matrix)
    ///   - type: Content type (movie or series)
    ///   - season: Season number (for series)
    ///   - episode: Episode number (for series)
    /// - Returns: Array of Stream objects
    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int?,
        episode: Int?
    ) async throws -> [Stream]
}

/// Provider configuration
struct ProviderConfig {
    let torrentio: TorrentioConfig?
    let comet: CometConfig?
    let zilean: ZileanConfig?
    let jackettio: JackettioConfig?
    let mediafusion: MediaFusionConfig?
    
    struct TorrentioConfig {
        let rdConfig: String  // "realdebrid" or empty
    }
    
    struct CometConfig {
        let indexers: [String]
        let debridService: String
        let debridApiKey: String
    }
    
    struct ZileanConfig {
        let url: String
    }
    
    struct JackettioConfig {
        let serverUrl: String
        let apiKey: String
        let indexers: [String]
    }
    
    struct MediaFusionConfig {
        let config: String  // Encrypted config string
    }
}

/// Provider manager to coordinate all providers
actor ProviderManager {
    static let shared = ProviderManager()
    
    private var providers: [String: ProviderService] = [:]
    
    private init() {}
    
    func register(provider: ProviderService) {
        providers[provider.name] = provider
    }
    
    func fetchStreams(
        imdbId: String,
        type: String,
        season: Int? = nil,
        episode: Int? = nil,
        providerNames: [String]? = nil
    ) async throws -> [Stream] {
        // Use specified providers or all registered
        let providersToUse = providerNames?.compactMap { providers[$0] } ?? Array(providers.values)
        
        // Fetch from all providers concurrently
        let results = await withTaskGroup(of: [Stream].self) { group in
            for provider in providersToUse {
                group.addTask {
                    do {
                        return try await provider.fetchStreams(
                            imdbId: imdbId,
                            type: type,
                            season: season,
                            episode: episode
                        )
                    } catch {
                        print("❌ Provider \(provider.name) failed: \(error)")
                        return []
                    }
                }
            }
            
            var allStreams: [Stream] = []
            for await streams in group {
                allStreams.append(contentsOf: streams)
            }
            return allStreams
        }
        
        // Deduplicate by info hash
        return deduplicateStreams(results)
    }
    
    private func deduplicateStreams(_ streams: [Stream]) -> [Stream] {
        var seen: Set<String> = []
        var unique: [Stream] = []
        
        for stream in streams {
            // Use infoHash if available, otherwise use URL as unique key
            let key: String?
            if let hash = stream.infoHash {
                key = hash
            } else if let url = stream.url {
                key = url
            } else {
                // No unique identifier - skip
                continue
            }
            
            if !seen.contains(key!) {
                seen.insert(key!)
                unique.append(stream)
            }
        }
        
        return unique
    }
}
