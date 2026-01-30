import SwiftUI

// MARK: - Badge Components

struct SourceQualityBadge: View {
    let stream: Stream

    var body: some View {
        HStack(spacing: 2) {
            Text(stream.sourceQualityEmoji)
            Text(stream.sourceQuality)
                .font(.caption.weight(.medium))
                
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(stream.sourceQualityBadgeColor.opacity(0.2))
        .foregroundColor(stream.sourceQualityBadgeColor)
        .cornerRadius(4)
    }
}

struct SeederBadge: View {
    let stream: Stream

    var body: some View {
        HStack(spacing: 2) {
            Text(stream.seederEmoji)
            if let seeders = stream.seeders {
                Text("\(seeders)")
                    .font(.caption.weight(.medium))
                    
            } else {
                Text("No seeders")
                    .font(.caption.weight(.medium))
                    
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(stream.seederBadgeColor.opacity(0.2))
        .foregroundColor(stream.seederBadgeColor)
        .cornerRadius(4)
    }
}

struct SizeBadge: View {
    let stream: Stream

    var body: some View {
        HStack(spacing: 2) {
            Text("💾")
            Text(stream.formattedSize)
                .font(.caption.weight(.medium))
                
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color.gray.opacity(0.2))
        .foregroundColor(.secondary)
        .cornerRadius(4)
    }
}

struct ProviderBadge: View {
    let stream: Stream

    var body: some View {
        HStack(spacing: 2) {
            Text(stream.providerEmoji)
            Text(stream.provider)
                .font(.caption.weight(.medium))
                
                .textCase(.uppercase)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color.purple.opacity(0.2))
        .foregroundColor(.purple)
        .cornerRadius(4)
    }
}

struct VideoCodecBadge: View {
    let stream: Stream

    var body: some View {
        HStack(spacing: 2) {
            Text(stream.videoCodecEmoji)
            Text(stream.videoCodec)
                .font(.caption.weight(.medium))
                
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(stream.videoCodecBadgeColor.opacity(0.2))
        .foregroundColor(stream.videoCodecBadgeColor)
        .cornerRadius(4)
    }
}

struct QualityResolutionBadge: View {
    let stream: Stream

    var body: some View {
        if let quality = stream.quality {
            HStack(spacing: 2) {
                Text("📺")
                Text(quality)
                    .font(.caption.weight(.medium))
                    
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color.blue.opacity(0.2))
            .foregroundColor(.blue)
            .cornerRadius(4)
        }
    }
}

struct PackBadge: View {
    var body: some View {
        HStack(spacing: 2) {
            Text("📦")
            Text("PACK")
                .font(.caption.weight(.medium))
                
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color.orange.opacity(0.2))
        .foregroundColor(.orange)
        .cornerRadius(4)
    }
}

// MARK: - Main Views

struct StreamSelectionView: View {
    let mediaItem: MediaItem
    let selectedQuality: VideoQuality
    let watchMode: WatchMode
    let onStreamSelected: (Stream) -> Void

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @State private var streams: [Stream] = []
    @State private var isLoading = true
    @State private var error: String?
    @State private var selectedPackStream: Stream?

    var body: some View {
        VStack(spacing: 0) {
            // Header with close button
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
            .background(Color(NSColor.controlBackgroundColor))

            // Content
            if isLoading {
                ProgressView("Loading all streams...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = error {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("Error Loading Streams")
                        .font(.headline)
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        loadStreams()
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            } else if streams.isEmpty {
                VStack {
                    Image(systemName: "list.bullet")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text("No Streams Found")
                        .font(.headline)
                    Text("No streams available for \(selectedQuality.rawValue) quality")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
            } else {
                List(streams, id: \.id) { stream in
                    StreamRow(
                        stream: stream,
                        onTap: {
                            onStreamSelected(stream)
                        },
                        onPackTap: stream.isPack ? {
                            selectedPackStream = stream
                        } : nil
                    )
                }
                .listStyle(PlainListStyle())
            }
        }
        .frame(minWidth: 600, minHeight: 500)
        .onAppear {
            loadStreams()
        }
        .sheet(item: $selectedPackStream) { packStream in
            PackEpisodeSelectionView(
                packStream: packStream,
                onEpisodeSelected: { season, episode in
                    // Store season/episode in appState so playSelectedStream will pass them to backend
                    appState.selectedSeason = season
                    appState.selectedEpisode = episode
                    selectedPackStream = nil
                    onStreamSelected(packStream)
                }
            )
        }
    }

    private func loadStreams() {
        isLoading = true
        error = nil

        Task {
            do {
                // Only pass season/episode for series. Avoid leaking TV filters into movie requests.
                let season = mediaItem.type == "series" ? appState.selectedSeason : nil
                let episode = mediaItem.type == "series" ? appState.selectedEpisode : nil

                let allStreams = try await LocalAPIClient.shared.resolveAllStreams(
                    imdbId: mediaItem.id,
                    type: mediaItem.type,
                    quality: selectedQuality.rawValue,
                    season: season,
                    episode: episode,
                    year: mediaItem.year
                )

                await MainActor.run {
                    self.isLoading = false
                    self.streams = allStreams
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.error = error.localizedDescription
                }
            }
        }
    }
}

struct StreamRow: View {
    let stream: Stream
    let onTap: () -> Void
    let onPackTap: (() -> Void)?

    var body: some View {
        Button(action: {
            if stream.isPack, let onPackTap = onPackTap {
                onPackTap()
            } else {
                onTap()
            }
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    // Title
                    Text(stream.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)

                    // Badges row 1 - Quality, Source, and Codec
                    HStack(spacing: 6) {
                        QualityResolutionBadge(stream: stream)
                        SourceQualityBadge(stream: stream)
                        VideoCodecBadge(stream: stream)

                        Spacer()
                    }

                    // Badges row 2 - Seeders, Size, Provider, and Pack (if applicable)
                    HStack(spacing: 6) {
                        if stream.isPack {
                            PackBadge()
                        }
                        SeederBadge(stream: stream)
                        SizeBadge(stream: stream)
                        ProviderBadge(stream: stream)

                        Spacer()
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
