//
//  TVEventData.swift
//  RedLemon
//
//  Hardcoded TV series configurations for events
//

import Foundation

struct TVEventData {
    /// All TV series available for events
    static let allSeries: [TVEvent] = [
        // Breaking Bad - 5 seasons, 62 episodes
        TVEvent(
            id: "tt0903747",
            title: "Breaking Bad",
            totalSeasons: 5,
            totalEpisodes: 62,
            packConfig: .trustedPack(searchQuery: "Breaking Bad S01-S05 1080p NF WEB-DL AV1 EAC3 MultiSub"),
            episodesPerSeason: [7, 13, 13, 13, 16]
        ),
        
        // The Office (US) - 9 seasons, 201 episodes
        TVEvent(
            id: "tt0386676",
            title: "The Office",
            totalSeasons: 9,
            totalEpisodes: 201,
            packConfig: .trustedPack(searchQuery: "The Office US 2005-2013 [S01-S09] [1080p.NF.WEB-DL.x264-FT]"),
            episodesPerSeason: [6, 22, 25, 19, 28, 26, 26, 24, 25]
        ),
        
        // Friends - 10 seasons, 236 episodes
        TVEvent(
            id: "tt0108778",
            title: "Friends",
            totalSeasons: 10,
            totalEpisodes: 236,
            packConfig: .trustedPack(searchQuery: "Friends TV Series 720p Seasons 1-10 Complete + Subs maximersk"),
            episodesPerSeason: [24, 24, 25, 24, 24, 25, 24, 24, 24, 18]
        ),
        
        // Game of Thrones - 8 seasons, 73 episodes
        TVEvent(
            id: "tt0944947",
            title: "Game of Thrones",
            totalSeasons: 8,
            totalEpisodes: 73,
            packConfig: .trustedPack(searchQuery: "Game.of.Thrones.S01-S08.COMPLETE.SERIES.REPACK.1080p.Bluray.x265-HiQVE"),
            episodesPerSeason: [10, 10, 10, 10, 10, 10, 7, 6]
        )
    ]
    
    /// Get a specific series by IMDB ID
    static func getSeries(id: String) -> TVEvent? {
        return allSeries.first { $0.id == id }
    }
}
