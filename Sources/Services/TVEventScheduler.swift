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
    
    /// Cache for episode runtimes to avoid re-fetching
    private static var runtimeCache: [String: [TimeInterval]] = [:]

    /// Fetch episode runtimes from TVMaze (Free, no key, one request per show)
    /// Falls back to default runtimes if unavailable
    private static func fetchEpisodeRuntimes(for series: TVEvent) async -> [TimeInterval] {
        // Check cache first
        if let cached = runtimeCache[series.id] {
            return cached
        }

        // Default runtimes based on series type (Fallback)
        let defaultRuntime: TimeInterval
        switch series.id {
        case "tt0903747": // Breaking Bad
            defaultRuntime = 47 * 60
        case "tt0944947": // Game of Thrones
            defaultRuntime = 55 * 60
        case "tt0386676", "tt0108778": // The Office, Friends
            defaultRuntime = 22 * 60
        default:
            defaultRuntime = 30 * 60
        }
        
        // Try to fetch from TVMaze
        do {
            guard let encodedTitle = series.title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: "https://api.tvmaze.com/singlesearch/shows?q=\(encodedTitle)&embed=episodes") else {
                throw NSError(domain: "Invalid URL", code: -1)
            }
            
            print("📺 Fetching runtimes from TVMaze for: \(series.title)")
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(TVMazeShowResponse.self, from: data)
            
            var allRuntimes: [TimeInterval] = []
            
            // Map episodes by season/number for easy lookup
            var episodeMap: [String: Int] = [:]
            for ep in response._embedded.episodes {
                let key = "\(ep.season)-\(ep.number)"
                episodeMap[key] = ep.runtime
            }
            
            // Reconstruct the flat list based on our expected season/episode counts
            // This ensures alignment with our internal structure
            for season in 1...series.totalSeasons {
                let episodeCount = series.episodesPerSeason[season - 1]
                for episodeNum in 1...episodeCount {
                    let key = "\(season)-\(episodeNum)"
                    if let runtimeMinutes = episodeMap[key] {
                        allRuntimes.append(TimeInterval(runtimeMinutes * 60))
                    } else {
                        // If specific episode missing in TVMaze, use default
                        allRuntimes.append(defaultRuntime)
                    }
                }
            }
            
            print("   ✅ Loaded \(allRuntimes.count) exact runtimes for \(series.title)")
            runtimeCache[series.id] = allRuntimes
            return allRuntimes
            
        } catch {
            print("⚠️ Failed to fetch from TVMaze for \(series.title): \(error)")
            // Fallback to defaults
            var allRuntimes: [TimeInterval] = []
            for season in 1...series.totalSeasons {
                let episodeCount = series.episodesPerSeason[season - 1]
                allRuntimes.append(contentsOf: Array(repeating: defaultRuntime, count: episodeCount))
            }
            runtimeCache[series.id] = allRuntimes
            return allRuntimes
        }
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


