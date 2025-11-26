//
//  TVEventItem.swift
//  RedLemon
//
//  UI model for TV event display
//

import Foundation

struct TVEventItem: Identifiable {
    let id: String              // Series IMDB ID
    let series: TVEvent         // Series configuration
    let mediaItem: MediaItem    // Series metadata (poster, background, logo)
    let currentSeason: Int
    let currentEpisode: Int
    let startTime: Date         // When current episode started
    let episodeRuntime: TimeInterval
    
    var endTime: Date {
        startTime.addingTimeInterval(episodeRuntime)
    }
    
    /// All TV events are always "live"
    var isLive: Bool {
        return true
    }
}
