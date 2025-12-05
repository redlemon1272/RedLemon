//
//  TVEventScheduler.swift
//  RedLemon
//
//  Calculates which episode is currently playing for TV events
//

import Foundation

class TVEventScheduler {
    /// Calculate which episode is currently playing for a TV series
    /// Uses deterministic scheduling based on epoch time (like movie events)
    static func getCurrentEpisode(for series: TVEvent) async -> TVEventPlaybackState {
        let now = TimeService.shared.now
        
        // Use 2024-01-01 as epoch for consistency
        let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01 00:00:00 UTC
        let timeSinceEpoch = now.timeIntervalSince(epoch)
        
        // Fetch episode runtimes from TMDB
        let episodeRuntimes = await fetchEpisodeRuntimes(for: series)
        
        // Calculate total cycle duration
        let totalCycleDuration = episodeRuntimes.reduce(0, +)
        
        // Find position in current cycle
        let currentCycleTime = timeSinceEpoch.truncatingRemainder(dividingBy: totalCycleDuration)
        
        // Find which episode is currently playing
        var accumulatedTime: TimeInterval = 0
        var globalEpisodeIndex = 0
        
        for (index, runtime) in episodeRuntimes.enumerated() {
            if accumulatedTime + runtime > currentCycleTime {
                globalEpisodeIndex = index
                break
            }
            accumulatedTime += runtime
        }
        
        // Convert global index to season/episode
        let (season, episode) = series.getSeasonAndEpisode(globalIndex: globalEpisodeIndex)
        
        // Calculate when this episode started
        let timeIntoEpisode = currentCycleTime - accumulatedTime
        let episodeStartTime = now.addingTimeInterval(-timeIntoEpisode)
        let episodeRuntime = episodeRuntimes[globalEpisodeIndex]
        
        return TVEventPlaybackState(
            seriesId: series.id,
            season: season,
            episode: episode,
            startTime: episodeStartTime,
            episodeRuntime: episodeRuntime
        )
    }

    /// Get the start time for a specific episode
    static func getEpisodeStartTime(series: TVEvent, season: Int, episode: Int) async -> Date {
        let now = TimeService.shared.now
        let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01
        let timeSinceEpoch = now.timeIntervalSince(epoch)

        let episodeRuntimes = await fetchEpisodeRuntimes(for: series)
        let totalCycleDuration = episodeRuntimes.reduce(0, +)
        let currentCycleTime = timeSinceEpoch.truncatingRemainder(dividingBy: totalCycleDuration)

        // Find target episode index
        let targetIndex = series.getGlobalIndex(season: season, episode: episode)
        
        // Calculate time offset for target episode
        var targetOffset: TimeInterval = 0
        for i in 0..<targetIndex {
            targetOffset += episodeRuntimes[i]
        }
        
        // Calculate start time relative to now
        // If target is ahead in current cycle: start = now + (targetOffset - currentCycleTime)
        // If target is behind: start = now + (targetOffset - currentCycleTime) + totalCycleDuration
        
        var timeUntilStart = targetOffset - currentCycleTime
        if timeUntilStart < -120 { // Allow 2 min buffer for "just started"
            timeUntilStart += totalCycleDuration
        }
        
        return now.addingTimeInterval(timeUntilStart)
    }
    
    /// Cache for episode runtimes to avoid re-fetching
    private static let cache = RuntimeCache()
    
    /// Thread-safe cache actor
    private actor RuntimeCache {
        private var cache: [String: [TimeInterval]] = [:]
        
        func get(_ id: String) -> [TimeInterval]? {
            return cache[id]
        }
        
        func set(_ id: String, values: [TimeInterval]) {
            cache[id] = values
        }
    }

    /// Fetch episode runtimes
    /// Uses hardcoded exact runtimes from TVEventRuntimes.swift
    private static func fetchEpisodeRuntimes(for series: TVEvent) async -> [TimeInterval] {
        // Check cache first
        if let cached = await cache.get(series.id) {
            return cached
        }

        // Check Hardcoded Exact Runtimes
        if let exactRuntimes = TVEventRuntimes.runtimes[series.id] {
            print("💎 Using EXACT runtimes for \(series.title)")
            var allRuntimes: [TimeInterval] = []
            
            // Reconstruct the flat list
            for season in 1...series.totalSeasons {
                let episodeCount = series.episodesPerSeason[season - 1]
                for episodeNum in 1...episodeCount {
                    let key = "\(season)-\(episodeNum)"
                    if let duration = exactRuntimes[key] {
                        allRuntimes.append(duration)
                    } else {
                        // Missing exact runtime? Fallback to average of knowns or default
                        // Only print if it's not one of the known missing ones (to reduce log noise)
                        // Breaking Bad has some known missing ones in S4/S5
                        if series.id != "tt0903747" || (season != 4 && season != 5) {
                            print("⚠️ Missing exact runtime for \(series.title) S\(season)E\(episodeNum)")
                        }
                        allRuntimes.append(30 * 60) // Safe fallback
                    }
                }
            }
            
            await cache.set(series.id, values: allRuntimes)
            return allRuntimes
        }
        
        // Fallback for unknown series (should not happen for our 4 shows)
        print("⚠️ No exact runtimes found for \(series.title) - using defaults")
        let defaultRuntime: TimeInterval = 30 * 60
        var allRuntimes: [TimeInterval] = []
        for season in 1...series.totalSeasons {
            let episodeCount = series.episodesPerSeason[season - 1]
            allRuntimes.append(contentsOf: Array(repeating: defaultRuntime, count: episodeCount))
        }
        await cache.set(series.id, values: allRuntimes)
        return allRuntimes
    }
}

// MARK: - TVMaze Models
struct TVMazeShowResponse: Codable {
    let name: String
    let _embedded: TVMazeEmbedded
}

struct TVMazeEmbedded: Codable {
    let episodes: [TVMazeEpisode]
}

struct TVMazeEpisode: Codable {
    let season: Int
    let number: Int
    let runtime: Int
}


