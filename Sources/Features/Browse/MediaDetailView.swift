import SwiftUI

struct MediaDetailView: View {
    let mediaItem: MediaItem
    @EnvironmentObject var appState: AppState
    @State private var metadata: MediaMetadata?
    @State private var isLoading = true
    @State private var selectedSeason: Int = 1
    @State private var selectedEpisode: Int = 1
    @State private var availableSeasons: [Int] = []
    @State private var episodesInSeason: [VideoEpisode] = []

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                // Blurred background art (only show after metadata loads)
                if !isLoading, let metadata = metadata, let backgroundURL = metadata.backgroundURL {
                    AsyncImage(url: URL(string: backgroundURL)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .blur(radius: 40)
                                .overlay(Color.black.opacity(0.7))
                                .clipped()
                        case .failure(_), .empty:
                            Color(NSColor.windowBackgroundColor)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        @unknown default:
                            Color(NSColor.windowBackgroundColor)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                } else {
                    Color(NSColor.windowBackgroundColor)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }

                VStack(spacing: 0) {
                // Back button toolbar
                HStack {
                    Button(action: {
                        appState.goBack()  // Use goBack() for proper navigation history
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .semibold))
                            Text("Back")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.top, 40) // Avoid window traffic lights

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                // Removed ultraThinMaterial background to match Lobby style (transparent/overlay)

                // Content
                ScrollView {
                    if isLoading {
                        VStack {
                            Spacer()
                            ProgressView("Loading details...")
                                .padding()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, minHeight: 400)
                    } else {
                        VStack(alignment: .center, spacing: 0) {
                                                        // Logo or Title
                            VStack {
                                if let logoURL = metadata?.logoURL {
                                    AsyncImage(url: URL(string: logoURL)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: min(geometry.size.width * 0.7, 700), maxHeight: 150)
                                            .shadow(color: .black.opacity(0.8), radius: 20, x: 0, y: 10)
                                    } placeholder: {
                                        Text(mediaItem.name)
                                            .font(.system(size: 48, weight: .bold))
                                            .foregroundColor(.white)
                                            .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 5)
                                    }
                                } else {
                                    Text(mediaItem.name)
                                        .font(.system(size: 48, weight: .bold))
                                        .foregroundColor(.white)
                                        .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 5)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .padding(.top, 50)
                            .padding(.horizontal, max(30, geometry.size.width * 0.05))

                            // Metadata row (Year, Rating, Genres)
                            HStack(spacing: 20) {
                                if let year = metadata?.year {
                                    Text(year)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white.opacity(0.9))
                                }

                                if let imdbRating = metadata?.imdbRating {
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                        Text(String(format: "%.1f", imdbRating))
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                }

                                if let genres = metadata?.genres, !genres.isEmpty {
                                    Text(genres.prefix(2).joined(separator: " • "))
                                        .font(.title3)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            .padding(.top, 20)

                            // Synopsis
                            if let description = metadata?.description {
                                Text(description)
                                    .font(.body)
                                    .foregroundColor(.white.opacity(0.85))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(4)
                                    .frame(maxWidth: min(geometry.size.width * 0.8, 900))
                                    .padding(.horizontal, max(30, geometry.size.width * 0.05))
                                    .padding(.top, 24)
                            }

                            // Cast and Director
                            HStack(spacing: 40) {
                                if let director = metadata?.director {
                                    VStack(spacing: 4) {
                                        Text("DIRECTOR")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white.opacity(0.5))
                                        Text(director)
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                }

                                if let cast = metadata?.cast, !cast.isEmpty {
                                    VStack(spacing: 4) {
                                        Text("STARRING")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white.opacity(0.5))
                                        Text(cast.prefix(3).joined(separator: ", "))
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.9))
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                    }
                                    .frame(maxWidth: min(geometry.size.width * 0.4, 400))
                                }
                            }
                            .padding(.top, 30)

                            // Season and Episode Pickers (for TV shows)
                            if mediaItem.type == "series" && !availableSeasons.isEmpty {
                                HStack(spacing: 16) {
                                    // Season Picker
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("SEASON")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white.opacity(0.7))

                                        Picker("Season", selection: $selectedSeason) {
                                            ForEach(availableSeasons, id: \.self) { season in
                                                Text("Season \(season)").tag(season)
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .frame(width: 150)
                                        .padding(10)
                                        .background(Color.white.opacity(0.15))
                                        .cornerRadius(8)
                                        .onChange(of: selectedSeason) { newSeason in
                                            updateEpisodesForSeason(newSeason)
                                        }
                                    }

                                    // Episode Picker
                                    if !episodesInSeason.isEmpty {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("EPISODE")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white.opacity(0.7))

                                            Picker("Episode", selection: $selectedEpisode) {
                                                ForEach(episodesInSeason, id: \.episode) { video in
                                                    Text("Episode \(video.episode): \(video.title)").tag(video.episode)
                                                }
                                            }
                                            .pickerStyle(.menu)
                                            .frame(width: 280)
                                            .padding(10)
                                            .background(Color.white.opacity(0.15))
                                            .cornerRadius(8)
                                        }
                                    }
                                }
                                .padding(.top, 30)

                                // Episode Synopsis
                                if let currentEpisode = episodesInSeason.first(where: { $0.episode == selectedEpisode }),
                                   let overview = currentEpisode.overview, !overview.isEmpty {
                                    Text(overview)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.7))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                        .frame(maxWidth: min(geometry.size.width * 0.75, 800))
                                        .padding(.horizontal, max(30, geometry.size.width * 0.05))
                                        .padding(.top, 16)
                                }
                            }

                            // Watch Now Button
                            Button(action: {
                                appState.player.selectedMediaItem = mediaItem
                                if mediaItem.type == "series" {
                                    appState.selectedSeason = selectedSeason
                                    appState.selectedEpisode = selectedEpisode
                                }
                                appState.currentView = .qualitySelection
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 18, weight: .semibold))
                                    if mediaItem.type == "series" {
                                        Text("Watch S\(selectedSeason)E\(selectedEpisode)")
                                            .font(.system(size: 18, weight: .semibold))
                                    } else {
                                        Text("Watch Now")
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                }
                                .foregroundColor(.white)
                                .frame(width: min(max(240, geometry.size.width * 0.3), 350), height: 56)
                                .background(
                                    LinearGradient(
                                        colors: [Color.blue, Color.blue.opacity(0.8)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                                .shadow(color: .blue.opacity(0.5), radius: 20, x: 0, y: 10)
                            }
                            .buttonStyle(.plain)
                            .padding(.top, 40)
                            .padding(.bottom, 60)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            }
        }
        .task {
            await loadMetadata()
        }
    }

    private func loadMetadata() async {
        isLoading = true
        defer { isLoading = false }

        print("🔍 Loading metadata for: \(mediaItem.name) (type: \(mediaItem.type), id: \(mediaItem.id))")

        do {
            let client = LocalAPIClient()
            let meta = try await client.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
            NSLog("✅ Metadata loaded successfully")
            NSLog("   Type: %@", meta.type)
            NSLog("   Background URL: %@", meta.backgroundURL ?? "nil")
            NSLog("   Poster URL: %@", meta.posterURL ?? "nil")
            NSLog("   Videos array: %d episodes", meta.videos?.count ?? 0)
            if let videos = meta.videos {
                for video in videos.prefix(5) {
                    NSLog("   - S%dE%d: %@", video.season, video.episode, video.title)
                }
            }

            await MainActor.run {
                self.metadata = meta

                // For TV series: populate seasons and episodes
                if mediaItem.type == "series" {
                    if let videos = meta.videos, !videos.isEmpty {
                        // Extract unique seasons from real data, filter out Season 0 (specials)
                        let seasons = Set(videos.map { $0.season }).sorted().filter { $0 > 0 }
                        self.availableSeasons = seasons

                        // Set initial season and episode
                        if let firstSeason = seasons.first {
                            self.selectedSeason = firstSeason
                            updateEpisodesForSeason(firstSeason)
                        }

                        NSLog("📺 Found %d seasons with %d total episodes", seasons.count, videos.count)
                    } else {
                        // No videos found
                        NSLog("❌ CRITICAL: No videos in metadata despite being a series!")
                        NSLog("   metadata.videos is nil: %@", meta.videos == nil ? "YES" : "NO")
                        NSLog("   metadata.videos?.count: %d", meta.videos?.count ?? -1)
                    }
                }
            }
        } catch {
            print("❌ Failed to load metadata: \(error)")
            // Still dismiss loading state so user can at least see the poster and play button
        }
    }

    private func updateEpisodesForSeason(_ season: Int) {
        guard let videos = metadata?.videos else {
            print("❌ No videos available when trying to load season \(season)")
            return
        }

        // Filter episodes for this season from real data
        let episodes = videos.filter { $0.season == season }.sorted { $0.episode < $1.episode }
        self.episodesInSeason = episodes

        // Set first episode as default
        if let firstEpisode = episodes.first {
            self.selectedEpisode = firstEpisode.episode
        }

        print("📺 Season \(season) has \(episodes.count) episodes")
    }
}
