import SwiftUI

struct StreamSelectionView: View {
    let mediaItem: MediaItem
    let selectedQuality: VideoQuality
    let watchMode: WatchMode
    let onStreamSelected: (Stream) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var streams: [Stream] = []
    @State private var isLoading = true
    @State private var error: String?

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
                    StreamRow(stream: stream) {
                        onStreamSelected(stream)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .frame(minWidth: 600, minHeight: 500)
        .onAppear {
            loadStreams()
        }
    }

    private func loadStreams() {
        isLoading = true
        error = nil

        Task {
            do {
                let allStreams = try await LocalAPIClient.shared.resolveAllStreams(
                    imdbId: mediaItem.id,
                    type: mediaItem.type,
                    quality: selectedQuality.rawValue,
                    season: nil, // TODO: Get from appState if available
                    episode: nil  // TODO: Get from appState if available
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

    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stream.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)

                    HStack {
                        if let quality = stream.quality {
                            Text(quality)
                                .font(.caption)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(4)
                        }

                        if let seeders = stream.seeders {
                            HStack(spacing: 2) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .font(.caption2)
                                Text("\(seeders)")
                                    .font(.caption)
                            }
                            .foregroundColor(.green)
                        }

                        if let size = stream.size {
                            Text(size)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    Text("Provider: \(stream.provider)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
