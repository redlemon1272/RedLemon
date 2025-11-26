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
    
    /// Fetch episode runtimes from TMDB
    /// Falls back to 22 minutes (standard sitcom) or 45 minutes (drama) if unavailable
    private static func fetchEpisodeRuntimes(for series: TVEvent) async -> [TimeInterval] {
        // Default runtimes based on series type
        let defaultRuntime: TimeInterval
        switch series.id {
        case "tt0903747": // Breaking Bad
            defaultRuntime = 47 * 60  // 47 minutes
        case "tt0944947": // Game of Thrones
            defaultRuntime = 55 * 60  // 55 minutes
        case "tt0386676", "tt0108778": // The Office, Friends
            defaultRuntime = 22 * 60  // 22 minutes
        default:
            defaultRuntime = 30 * 60  // 30 minutes generic
        }
        
        // Try to fetch from TMDB
        let client = LocalAPIClient.shared
        var allRuntimes: [TimeInterval] = []
        
        for season in 1...series.totalSeasons {
            // Fetch season details from TMDB
            if let seasonData = try? await client.fetchSeasonDetails(imdbId: series.id, season: season) {
                // Extract episode runtimes
                for episode in seasonData.episodes {
                    let runtime = TimeInterval((episode.runtime ?? Int(defaultRuntime / 60)) * 60)
                    allRuntimes.append(runtime)
                }
            } else {
                // Fallback: use default runtime for all episodes in this season
                let episodeCount = series.episodesPerSeason[season - 1]
                allRuntimes.append(contentsOf: Array(repeating: defaultRuntime, count: episodeCount))
            }
        }
        
        return allRuntimes
    }
}

/// Extension to LocalAPIClient for TMDB season details
extension LocalAPIClient {
    func fetchSeasonDetails(imdbId: String, season: Int) async throws -> TMDBSeasonResponse {
        // Convert IMDB ID to TMDB ID first
        let tmdbId = try await convertIMDBToTMDB(imdbId: imdbId)
        
        let urlString = "https://api.themoviedb.org/3/tv/\(tmdbId)/season/\(season)?api_key=\(tmdbAPIKey)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(TMDBSeasonResponse.self, from: data)
    }
    
    private func convertIMDBToTMDB(imdbId: String) async throws -> Int {
        let urlString = "https://api.themoviedb.org/3/find/\(imdbId)?api_key=\(tmdbAPIKey)&external_source=imdb_id"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TMDBFindResponse.self, from: data)
        
        guard let tmdbId = response.tv_results.first?.id else {
            throw NSError(domain: "TMDB ID not found", code: -1)
        }
        
        return tmdbId
    }
    
    private var tmdbAPIKey: String {
        return "your_tmdb_api_key_here"  // TODO: Add TMDB API key
    }
}

/// TMDB API response models
struct TMDBSeasonResponse: Codable {
    let episodes: [TMDBEpisode]
}

struct TMDBEpisode: Codable {
    let episode_number: Int
    let name: String?
    let runtime: Int?
}

struct TMDBFindResponse: Codable {
    let tv_results: [TMDBTVResult]
}

struct TMDBTVResult: Codable {
    let id: Int
}
