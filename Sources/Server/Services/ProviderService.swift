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
    /// Provider name (torrentio, comet, mediafusion, debridsearch)
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

    /// Search streams by query string
    /// - Parameter query: Search query
    /// - Returns: Array of Stream objects
    func search(query: String) async throws -> [Stream]
    
    /// Check if the provider is healthy/reachable
    /// - Returns: True if healthy
    func checkHealth() async -> Bool
}

/// Default implementation for search method
extension ProviderService {
    func search(query: String) async throws -> [Stream] {
        // Default implementation - providers should override this if they support search
        print("⚠️ Provider \(name) does not support search functionality")
        return []
    }
    
    func checkHealth() async -> Bool {
        // Default to true for local/simple providers
        return true
    }
}

/// Provider configuration
struct ProviderConfig {
    let torrentio: TorrentioConfig?
    let comet: CometConfig?
    // Note: Zilean removed - migrated from self-hosted to Supabase Cloud
    let jackettio: JackettioConfig?
    let mediafusion: MediaFusionConfig?
    let debridsearch: DebridSearchConfig?

    struct TorrentioConfig {
        let rdConfig: String  // "realdebrid" or empty
    }

    struct CometConfig {
        let indexers: [String]
        let debridService: String
        let debridApiKey: String
    }

    struct JackettioConfig {
        let serverUrl: String
        let apiKey: String
        let indexers: [String]
    }

    struct MediaFusionConfig {
        let config: String  // Encrypted config string
    }

    struct DebridSearchConfig {
        let debridProvider: String  // "RealDebrid", "AllDebrid", "DebridLink", "Premiumize", "TorBox"
        let debridApiKey: String
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
        NSLog("%@", "🔍 ProviderManager: Fetching streams for \(imdbId)...")
        
        // Use specified providers or all registered
        let providersToUse = providerNames?.compactMap { providers[$0] } ?? Array(providers.values)
        
        // Fetch from all providers concurrently WITH TIMEOUT
        let results = try await withThrowingTaskGroup(of: [Stream].self) { group -> [Stream] in
            // Task 1: The actual fetch from all providers
            group.addTask {
                let fetched = await withTaskGroup(of: [Stream].self) { providerGroup in
                    for provider in providersToUse {
                        providerGroup.addTask {
                            do {
                                return try await provider.fetchStreams(
                                    imdbId: imdbId,
                                    type: type,
                                    season: season,
                                    episode: episode
                                )
                            } catch {
                                NSLog("%@", "❌ Provider \(provider.name) failed: \(error)")
                                return []
                            }
                        }
                    }
                    
                    var all: [Stream] = []
                    for await streams in providerGroup {
                        all.append(contentsOf: streams)
                    }
                    return all
                }
                return fetched
            }
            
            // Task 2: Global timeout (15 seconds)
            group.addTask {
                try await Task.sleep(nanoseconds: 15 * 1_000_000_000)
                // Throw specific timeout error
                throw URLError(.timedOut)
            }
            
            // Process whichever finishes first
            guard let result = try await group.next() else {
                return []
            }
            
            // If we got here, one task finished. Cancel the other.
            group.cancelAll()
            return result
        }
        
        // Deduplicate by info hash
        let unique = deduplicateStreams(results)
        NSLog("%@", "✅ ProviderManager: Fetched \(results.count) raw, returning \(unique.count) unique streams")
        return unique
    }

    func searchTorrents(query: String) async throws -> [Stream] {
        NSLog("%@", "🔍 Searching torrents for query: \(query)")

        // Use all providers but search with specific query instead of broad IMDB search
        let providersToUse = Array(providers.values)
        var searchResults: [Stream] = []

        for provider in providersToUse {
            do {
                let results = try await provider.search(query: query)
                NSLog("%@", "   🔍 Provider \(provider.name) found \(results.count) results")
                searchResults.append(contentsOf: results)
            } catch {
                NSLog("%@", "❌ Provider \(provider.name) search failed: \(error)")
            }
        }

        NSLog("%@", "📦 Search completed: \(searchResults.count) total results")
        return deduplicateStreams(searchResults)
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
    
    /// Check health of all registered providers
    /// - Returns: Dictionary of ProviderName -> StatusString
    func checkAllHealth() async -> [String: String] {
        var results: [String: String] = [:]
        
        // We use a throwing task group to run checks in parallel
        await withTaskGroup(of: (String, String).self) { group in
            for (name, provider) in providers {
                group.addTask {
                    let isHealthy = await provider.checkHealth()
                    return (name, isHealthy ? "Online" : "Offline")
                }
            }
            
            for await (name, status) in group {
                results[name] = status
            }
        }
        
        return results
    }
}

// MARK: - Errors

enum ProviderError: Error {
    case httpError(statusCode: Int)
    case parseError(String)
    case notFound
}
