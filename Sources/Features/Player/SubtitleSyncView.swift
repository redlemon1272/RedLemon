//
//  SubtitleSyncView.swift
//  RedLemon
//
//  Subtitle synchronization controls for fixing timing issues
//

import SwiftUI

struct SubtitleSyncView: View {
    @ObservedObject var viewModel: MPVPlayerViewModel
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            // Header bar (always visible)
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "text.bubble")
                        .foregroundColor(.white)
                        .font(.system(size: 14))

                    Text("Subtitles")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))

                    if viewModel.showSubtitleSyncPanel {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 12))
                    }

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 12))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.black.opacity(0.7))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Expanded controls (hidden by default)
            if isExpanded {
                VStack(spacing: 16) {
                    // Current track info
                    if let currentTrack = viewModel.currentSubtitleTrack {
                        HStack {
                            Text("Current:")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 12))

                            Text(currentTrack.displayName)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium))
                                .lineLimit(1)

                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }

                    // Track selector
                    if !viewModel.availableSubtitleTracks.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Subtitle Track:")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 12))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(viewModel.availableSubtitleTracks, id: \.id) { track in
                                        Button(action: {
                                            viewModel.selectSubtitleTrack(track.id)
                                        }) {
                                            Text(track.displayName)
                                                .foregroundColor(.white)
                                                .font(.system(size: 11, weight: .medium))
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .fill(
                                                            viewModel.currentSubtitleTrack?.id == track.id
                                                            ? Color.blue
                                                            : Color.white.opacity(0.15)
                                                        )
                                                )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }

                    // Timing controls
                    VStack(spacing: 12) {
                        // Offset control
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Timing Offset:")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 12))

                                Spacer()

                                Text("\(String(format: "%.1f", viewModel.subtitleOffset))ms")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))
                            }

                            HStack(spacing: 12) {
                                Button(action: {
                                    viewModel.adjustSubtitleOffset(viewModel.subtitleOffset - 1000) // -1 second
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 10, weight: .bold))
                                        .frame(width: 24, height: 24)
                                        .background(
                                            Circle()
                                                .fill(Color.white.opacity(0.2))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())

                                Button(action: {
                                    viewModel.adjustSubtitleOffset(viewModel.subtitleOffset - 100) // -100ms
                                }) {
                                    Text("-100ms")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .medium))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.white.opacity(0.15))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())

                                Button(action: {
                                    viewModel.resetSubtitleTiming()
                                }) {
                                    Text("Reset")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .medium))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.white.opacity(0.15))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())

                                Button(action: {
                                    viewModel.adjustSubtitleOffset(viewModel.subtitleOffset + 100) // +100ms
                                }) {
                                    Text("+100ms")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .medium))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.white.opacity(0.15))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())

                                Button(action: {
                                    viewModel.adjustSubtitleOffset(viewModel.subtitleOffset + 1000) // +1 second
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 10, weight: .bold))
                                        .frame(width: 24, height: 24)
                                        .background(
                                            Circle()
                                                .fill(Color.white.opacity(0.2))
                                        )
                                }
                                .buttonStyle(PlainButtonStyle())

                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 16)

                    // Warning message if sync issues detected
                    if viewModel.showSubtitleSyncPanel {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: 14))

                            Text("Version mismatch detected between video and subtitles. Use timing controls to sync.")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.system(size: 11))
                                .multilineTextAlignment(.leading)

                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.orange.opacity(0.2))
                        )
                    }
                }
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.black.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
                .padding(.horizontal, 16)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isExpanded)
    }
}

// MARK: - Preview

struct SubtitleSyncView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            // Simulate video background
            Color.black

            VStack {
                Spacer()

                SubtitleSyncView(viewModel: MPVPlayerViewModel())
                    .padding()

                Spacer()
            }
        }
        .frame(width: 800, height: 600)
    }
}
