//
//  TVEventModels.swift
//  RedLemon
//
//  Data models for TV show events
//

import Foundation

/// Configuration for how to find episodes for a TV series
enum TVPackConfig {
    case trustedPack(searchQuery: String)  // Search for specific pack
    case autoSelect                        // Use existing auto-selection flow
}

/// TV series event configuration
struct TVEvent: Identifiable {
    let id: String              // IMDB ID
    let title: String           // Display name
    let totalSeasons: Int       // Number of seasons
    let totalEpisodes: Int      // Total episode count across all seasons
    let packConfig: TVPackConfig // How to find episodes
    
    /// Episode counts per season (for calculating which episode is playing)
    let episodesPerSeason: [Int]
    
    /// Get season and episode number from global episode index (0-based)
    func getSeasonAndEpisode(globalIndex: Int) -> (season: Int, episode: Int) {
        var remaining = globalIndex
        var currentSeason = 1
        
        for episodeCount in episodesPerSeason {
            if remaining < episodeCount {
                return (season: currentSeason, episode: remaining + 1)
            }
            remaining -= episodeCount
            currentSeason += 1
        }
        
        // If we exceed total episodes, loop back to start
        return (season: 1, episode: 1)
    }
    
    /// Get global episode index from season and episode (0-based)
    func getGlobalIndex(season: Int, episode: Int) -> Int {
        var index = 0
        for s in 1..<season {
            if s <= episodesPerSeason.count {
                index += episodesPerSeason[s - 1]
            }
        }
        index += (episode - 1)
        return index
    }
    
    /// Get next episode (with looping)
    func getNextEpisode(currentSeason: Int, currentEpisode: Int) -> (season: Int, episode: Int) {
        let globalIndex = getGlobalIndex(season: currentSeason, episode: currentEpisode)
        let nextIndex = (globalIndex + 1) % totalEpisodes
        return getSeasonAndEpisode(globalIndex: nextIndex)
    }
}

/// Current playback state for a TV event
struct TVEventPlaybackState {
    let seriesId: String
    let season: Int
    let episode: Int
    let startTime: Date
    let episodeRuntime: TimeInterval
    
    var endTime: Date {
        startTime.addingTimeInterval(episodeRuntime)
    }
}
