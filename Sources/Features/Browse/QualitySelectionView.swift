import SwiftUI

struct QualitySelectionView: View {
    @EnvironmentObject var appState: AppState

    let mediaItem: MediaItem

    @State private var selectedQuality: VideoQuality = .fullHD
    @State private var watchMode: WatchMode = .solo
    @State private var showingStreamSelection = false

    var body: some View {
        VStack(spacing: 0) {
            // Back button toolbar
            HStack {
                Button(action: {
                    appState.currentView = .mediaDetail
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Back")
                            .font(.system(size: 15, weight: .semibold))
                    }
                    .foregroundColor(.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                .padding()

                Spacer()
            }
            .background(Color(NSColor.windowBackgroundColor))

            // Content - No ScrollView, everything fits
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    Text(mediaItem.name)
                        .font(.title2)
                        .fontWeight(.bold)

                    if let year = mediaItem.year {
                        Text(year)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)

                Spacer()

                // Main content - Horizontal layout
                HStack(alignment: .center, spacing: 40) {
                    // Quality Selection
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Video Quality")
                            .font(.headline)
                            .foregroundColor(.primary)

                        VStack(spacing: 8) {
                            ForEach(VideoQuality.allCases.filter { $0 != .sd }) { quality in
                                Button(action: {
                                    selectedQuality = quality
                                }) {
                                    QualityOption(
                                        quality: quality,
                                        isSelected: selectedQuality == quality
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(width: 280)

                        // Show All Streams button
                        Button(action: {
                            showingStreamSelection = true
                        }) {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .font(.system(size: 12))
                                Text("Show All Streams")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .foregroundColor(.accentColor)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.accentColor.opacity(0.1))
                            .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 8)
                    }

                    Divider()
                        .frame(height: 240)

                    // Watch Mode Selection
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Watch Mode")
                            .font(.headline)
                            .foregroundColor(.primary)

                        HStack(spacing: 16) {
                            Button(action: {
                                watchMode = .solo
                            }) {
                                WatchModeButton(
                                    title: "Watch Solo",
                                    icon: "person.fill",
                                    description: "Private room",
                                    isSelected: watchMode == .solo
                                )
                            }
                            .buttonStyle(.plain)
                            .frame(width: 180, height: 120)
                        }

                        Button(action: {
                                watchMode = .watchParty
                            }) {
                                WatchModeButton(
                                    title: "Watch Party",
                                    icon: "person.3.fill",
                                    description: "Invite friends",
                                    isSelected: watchMode == .watchParty
                                )
                            }
                            .buttonStyle(.plain)
                            .frame(width: 180, height: 120)
                        }
                    }
                }
                .padding(.horizontal, 40)

                Spacer()

                // Action Buttons
                VStack(spacing: 12) {
                    if appState.isResolvingStream || appState.isLoadingRoom {
                        ProgressView(appState.isLoadingRoom ? "Creating room..." : "Finding best stream...")
                            .frame(maxWidth: .infinity)
                            .padding()
                    } else {
                        Button(action: startPlayback) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Start Watching")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)

                        if let error = appState.streamError {
                            Text(error)
                                .font(.caption)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }

                    Button("Cancel") {
                        appState.currentView = .mediaDetail
                    }
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            }
            .sheet(isPresented: $showingStreamSelection) {
            StreamSelectionView(
                mediaItem: mediaItem,
                selectedQuality: selectedQuality,
                watchMode: watchMode,
                onStreamSelected: { stream in
                    // Handle manual stream selection
                    Task {
                        await appState.playSelectedStream(stream, watchMode: watchMode)
                    }
                    showingStreamSelection = false
                }
            )
        }
    }

    private func startPlayback() {
        if watchMode == .watchParty {
            // Create ICP room and navigate to lobby
            Task {
                await appState.createWatchPartyAndNavigate(
                    mediaItem: mediaItem,
                    season: appState.selectedSeason,
                    episode: appState.selectedEpisode,
                    quality: selectedQuality
                )
            }
        } else {
            // Start solo playback immediately
            Task {
                await appState.playMedia(mediaItem, quality: selectedQuality, watchMode: watchMode)
            }
        }
    }
}

struct QualityOption: View {
    let quality: VideoQuality
    let isSelected: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(quality.rawValue)
                    .font(.headline)
                Text(quality.displayName)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.title3)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.secondary)
                    .font(.title3)
            }
        }
        .padding()
        .background(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.accentColor : Color.secondary.opacity(0.3), lineWidth: 2)
        )
    }
}

struct WatchModeButton: View {
    let title: String
    let icon: String
    let description: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(isSelected ? .accentColor : .secondary)

            Text(title)
                .font(.headline)

            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.accentColor : Color.secondary.opacity(0.3), lineWidth: 2)
        )
    }
}
