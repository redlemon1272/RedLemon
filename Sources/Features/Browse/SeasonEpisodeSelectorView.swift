//
//  SeasonEpisodeSelectorView.swift
//  RedLemon
//
//  Season and Episode selector for TV shows
//

import SwiftUI

struct SeasonEpisodeSelectorView: View {
    let mediaItem: MediaItem
    @EnvironmentObject var appState: AppState
    @State private var selectedSeason: Int = 1
    @State private var selectedEpisode: Int = 1
    @State private var metadata: MediaMetadata?
    @State private var seasons: [Season] = []
    @State private var isLoadingSeasons = true

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text(mediaItem.name)
                .font(.title)
                .foregroundColor(.white)

            if isLoadingSeasons {
                ProgressView("Loading seasons...")
                    .foregroundColor(.white)
            } else {
                // Season Picker
                HStack {
                    Text("Season:")
                        .font(.headline)
                        .foregroundColor(.white)

                    Picker("Season", selection: $selectedSeason) {
                        ForEach(seasons, id: \.number) { season in
                            Text("Season \(season.number)")
                                .tag(season.number)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 150)
                }

                // Episode Grid
                if let currentSeason = seasons.first(where: { $0.number == selectedSeason }) {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 150), spacing: 16)
                        ], spacing: 16) {
                            ForEach(1...currentSeason.episodeCount, id: \.self) { episode in
                                Button(action: {
                                    selectedEpisode = episode
                                    playEpisode(season: selectedSeason, episode: episode)
                                }) {
                                    VStack(spacing: 8) {
                                        Text("Episode \(episode)")
                                            .font(.headline)
                                            .foregroundColor(.white)

                                        if let epMeta = currentSeason.episodes.first(where: { $0.number == episode }) {
                                            Text(epMeta.title)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                    .frame(width: 140, height: 80)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedEpisode == episode ? Color.blue : Color.clear, lineWidth: 2)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding()
                    }
                }

                Spacer()

                // Play Button
                Button(action: {
                    playEpisode(season: selectedSeason, episode: selectedEpisode)
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Watch S\(selectedSeason)E\(selectedEpisode)")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: 300)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.9))
        .task {
            await loadSeasons()
        }
    }

    private func loadSeasons() async {
        isLoadingSeasons = true

        // For now, create default season structure
        // FUTURE: Fetch actual season/episode data from metadata API (TVDB, TMDb)
        var seasonList: [Season] = []

        // Most shows have 1-10 seasons with 6-24 episodes each
        // We'll default to showing seasons 1-3 with 10 episodes each
        // This will be replaced with actual metadata
        for seasonNum in 1...3 {
            var episodes: [Episode] = []
            for epNum in 1...10 {
                episodes.append(Episode(number: epNum, title: "Episode \(epNum)"))
            }
            seasonList.append(Season(number: seasonNum, episodeCount: 10, episodes: episodes))
        }

        seasons = seasonList
        isLoadingSeasons = false
    }

    private func playEpisode(season: Int, episode: Int) {
        // Store season/episode in app state
        appState.selectedSeason = season
        appState.selectedEpisode = episode
        appState.player.selectedMediaItem = mediaItem
        appState.currentView = .qualitySelection
    }
}

// Models for Season/Episode data
struct Season {
    let number: Int
    let episodeCount: Int
    let episodes: [Episode]
}

struct Episode {
    let number: Int
    let title: String
}
