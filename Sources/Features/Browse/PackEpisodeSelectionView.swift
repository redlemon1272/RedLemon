//
//  PackEpisodeSelectionView.swift
//  RedLemon
//
//  Modal for selecting individual episodes from a season pack
//

import SwiftUI

struct PackEpisodeSelectionView: View {
    let packStream: Stream
    let onEpisodeSelected: (Int, Int) -> Void  // (season, episode)

    @Environment(\.dismiss) private var dismiss
    @State private var episodes: [EpisodeItem] = []
    @State private var isLoading = true
    @State private var error: String?

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Select Episode")
                        .font(.headline)
                    Text(packStream.title)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .border(Color.gray.opacity(0.3), width: 1)

            // Content
            if isLoading {
                VStack(spacing: 12) {
                    ProgressView()
                    Text("Loading episodes...")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top)
            } else if let error = error {
                VStack(spacing: 12) {
                    Image(systemName: "triangle.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                    Text(error)
                        .foregroundColor(.secondary)
                    Button(action: { loadEpisodes() }) {
                        Text("Retry")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top)
            } else if episodes.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "questionmark.circle")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text("No Episodes Found")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top)
            } else {
                List(episodes) { episode in
                    Button(action: {
                        selectEpisode(episode)
                    }) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(episode.displayLabel)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(episode.filename)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .listStyle(PlainListStyle())
            }
        }
        .frame(minWidth: 500, minHeight: 400)
        .onAppear {
            loadEpisodes()
        }
    }

    private func loadEpisodes() {
        isLoading = true
        error = nil
        episodes = []

        guard let infoHash = packStream.infoHash else {
            error = "No torrent hash available"
            isLoading = false
            return
        }

        Task {
            do {
                // Call backend endpoint
                let request = EpisodesRequest(infoHash: infoHash)
                let url = URL(string: "\(Config.serverURL)/api/streams/episodes")!
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = try JSONEncoder().encode(request)

                let (data, response) = try await URLSession.shared.data(for: urlRequest)

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    await MainActor.run {
                        self.error = "Failed to fetch episodes: HTTP \((response as? HTTPURLResponse)?.statusCode ?? 0)"
                        self.isLoading = false
                    }
                    return
                }

                let fetchedEpisodes = try JSONDecoder().decode([EpisodeItem].self, from: data)

                await MainActor.run {
                    self.episodes = fetchedEpisodes
                    self.isLoading = false
                    if fetchedEpisodes.isEmpty {
                        self.error = "Could not parse episode information"
                    }
                }
            } catch {
                await MainActor.run {
                    self.error = "Error: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }

    private func selectEpisode(_ episode: EpisodeItem) {
        onEpisodeSelected(episode.season, episode.episode)
        dismiss()
    }
}

// MARK: - Models

struct EpisodeItem: Codable, Identifiable {
    let season: Int
    let episode: Int
    let fileId: Int
    let filename: String
    let displayLabel: String

    var id: String {
        "\(season)-\(episode)"
    }
}

struct EpisodesRequest: Codable {
    let infoHash: String
}

#if DEBUG
struct PackEpisodeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleStream = Stream(
            title: "Breaking Bad S01-S05 Complete Series",
            provider: "torrentio",
            infoHash: "abcd1234567890"
        )

        PackEpisodeSelectionView(packStream: sampleStream) { season, episode in
            print("Selected S\(String(format: "%02d", season))E\(String(format: "%02d", episode))")
        }
    }
}
#endif
