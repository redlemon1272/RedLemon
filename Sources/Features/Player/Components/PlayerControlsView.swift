//
//  PlayerControlsView.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct PlayerControlsView: View {
    @ObservedObject var viewModel: MPVPlayerViewModel

    // Config
    let streamQuality: String
    let sourceQuality: String

    // Bindings
    @Binding var showSubtitleMenu: Bool
    @Binding var showAudioMenu: Bool
    @Binding var showPlaylistMenu: Bool
    @Binding var showEventListMenu: Bool
    @Binding var showReportSheet: Bool
    @Binding var showStreamInfoSheet: Bool

    // State for animation
    let showControls: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 3) {
                // Title bar with poster art
                HStack(spacing: 20) {
                    // Poster art
                    if let posterURL = viewModel.posterURL {
                        let fullURL = posterURL.starts(with: "http") ? posterURL : "https://image.tmdb.org/t/p/original\(posterURL)"
                        AsyncImage(url: URL(string: fullURL)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 95, height: 142)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(color: .black.opacity(0.5), radius: 10, y: 5)
                            default:
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: 95, height: 142)
                            }
                        }
                    }

                    // Title text with quality badges
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.streamTitle)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .shadow(color: .black.opacity(0.5), radius: 8, y: 4)

                        // Quality badges
                        HStack(spacing: 8) {
                            if !streamQuality.isEmpty {
                                Text(streamQuality)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(6)
                            }

                            if !sourceQuality.isEmpty && sourceQuality != "Unknown" {
                                Text(sourceQuality)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(sourceQualityBackgroundColor)
                                    .cornerRadius(6)
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 8)
                .padding(.bottom, 6)

                // Seek bar with time indicators
                VStack(spacing: 2) {
                    // Seek bar - only show if solo or host
                    if !viewModel.isInWatchParty || viewModel.isWatchPartyHost {
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // Background track
                                Capsule()
                                    .fill(Color.white.opacity(0.25))
                                    .frame(height: 3)

                                // Progress
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width: progressWidth(in: geometry.size.width), height: 3)

                                // Scrubber handle
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 10, height: 10)
                                    .shadow(color: .black.opacity(0.3), radius: 3)
                                    .offset(x: progressWidth(in: geometry.size.width) - 5)
                            }
                            .contentShape(Rectangle()) // Hit test the entire expanded area
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        let progress = max(0, min(1, value.location.x / geometry.size.width))
                                        let seekTime = Double(progress) * viewModel.mpvWrapper.duration
                                        viewModel.seek(to: seekTime)
                                    }
                            )
                        }
                        .frame(height: 20) // Increased hit area
                        .padding(.horizontal, 10)
                    } else {
                        // Guest view - show progress bar without interaction
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // Background track
                                Capsule()
                                    .fill(Color.white.opacity(0.25))
                                    .frame(height: 3)

                                // Progress (read-only)
                                Capsule()
                                    .fill(Color.white.opacity(0.6))
                                    .frame(width: progressWidth(in: geometry.size.width), height: 3)
                            }
                        }
                        .frame(height: 20)
                        .padding(.horizontal, 10)
                    }

                    // Time display - ENLARGED and more visible
                    HStack {
                        Text(formatTime(viewModel.mpvWrapper.currentTime))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .monospacedDigit()
                            .shadow(color: .black.opacity(0.5), radius: 3, y: 1)

                        Spacer()

                        Text(formatTime(viewModel.mpvWrapper.duration))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white.opacity(0.85))
                            .monospacedDigit()
                            .shadow(color: .black.opacity(0.5), radius: 3, y: 1)
                    }
                    .padding(.horizontal, 10)
                }

                // Control buttons - all on left side
                HStack(spacing: 8) {
                    // Sync Status Pill (Watch Party Only)
                    if viewModel.isInWatchParty, let syncStatus = viewModel.syncStatus {
                        Text(syncStatus)
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
                            )
                            .padding(.trailing, 4)
                    }
                    // Play/Pause button - only for solo or host
                    if !viewModel.isInWatchParty || viewModel.isWatchPartyHost {
                        Button(action: {
                            viewModel.togglePlayPause()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 40, height: 40)

                                Image(systemName: viewModel.mpvWrapper.isPlaying ? "pause.fill" : "play.fill")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.plain)
                    }

                    // Next Episode Button
                    if !viewModel.isInWatchParty,
                       let appState = viewModel.appState,
                       appState.player.selectedMediaItem?.type == "series" {
                        Button(action: {
                            Task {
                                await appState.player.playNextEpisode()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 40, height: 40)

                                Image(systemName: "forward.end.fill")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.plain)
                        .help("Next Episode")
                    }

                    // Volume control
                    Button(action: {
                        let currentVolume = viewModel.mpvWrapper.volume
                        let newVolume = currentVolume == 0 ? 50 : (currentVolume < 50 ? 75 : (currentVolume < 75 ? 100 : 0))
                        viewModel.mpvWrapper.setVolume(newVolume)
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: volumeIcon(viewModel.mpvWrapper.volume))
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)

                    // Simple subtitle button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            showSubtitleMenu.toggle()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: "captions.bubble.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)

                    // Audio button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            showAudioMenu.toggle()
                            // Update tracks when menu opens
                            if showAudioMenu {
                                viewModel.updateAudioTracks()
                            }
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(showAudioMenu ? Color.white.opacity(0.3) : Color.white.opacity(0.2))
                                .frame(width: 40, height: 40)

                            Image(systemName: "waveform.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)



                    // Secondary Controls Group
                    Group {
                        // Playlist Button
                        PlaylistButton(showPlaylistMenu: $showPlaylistMenu)

                        // Event List Button (Movies)
                        EventListButton(showEventListMenu: $showEventListMenu)

                        // Report Stream Button
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                showReportSheet.toggle()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(showReportSheet ? Color.red.opacity(0.3) : Color.white.opacity(0.2))
                                    .frame(width: 40, height: 40)

                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(showReportSheet ? .red : .white)
                            }
                        }
                        .buttonStyle(.plain)
                        .help("Report Stream")

                        // Stream Info Button
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                showStreamInfoSheet.toggle()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(showStreamInfoSheet ? Color.white.opacity(0.3) : Color.white.opacity(0.2))
                                    .frame(width: 40, height: 40)

                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.plain)
                        .help("Stream Info")
                    }

                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 16)
            .transition(.opacity.combined(with: .move(edge: .bottom)))
            .animation(.easeInOut(duration: 0.25), value: showControls)
        }
        .background(Color.black.opacity(0.01)) // Invisible background to capture hovers/clicks
        .contentShape(Rectangle()) // Ensure entire area is hittable
    }

    // MARK: - Helpers

    private func progressWidth(in totalWidth: CGFloat) -> CGFloat {
        guard viewModel.mpvWrapper.duration > 0 else { return 0 }
        return totalWidth * CGFloat(viewModel.mpvWrapper.currentTime / viewModel.mpvWrapper.duration)
    }

    private func formatTime(_ seconds: Double) -> String {
        let totalSeconds = Int(seconds)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60

        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, secs)
        } else {
            return String(format: "%d:%02d", minutes, secs)
        }
    }

    private func volumeIcon(_ volume: Int) -> String {
        if volume == 0 {
            return "speaker.slash.fill"
        } else if volume < 33 {
            return "speaker.wave.1.fill"
        } else if volume < 66 {
            return "speaker.wave.2.fill"
        } else {
            return "speaker.wave.3.fill"
        }
    }

    private var sourceQualityBackgroundColor: Color {
        switch sourceQuality {
        case "BluRay":
            return Color.blue.opacity(0.8)
        case "WEB-DL", "WEBRip":
            return Color.green.opacity(0.8)
        case "CAM", "TS":
            return Color.red.opacity(0.8)
        case "HDTV", "DVDRip":
            return Color.orange.opacity(0.8)
        default:
            return Color.gray.opacity(0.8)
        }
    }
}
