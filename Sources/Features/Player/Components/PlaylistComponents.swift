//
//  PlaylistComponents.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct PlaylistButton: View {
    @EnvironmentObject var appState: AppState
    @Binding var showPlaylistMenu: Bool
    
    var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        if let room = appState.player.currentWatchPartyRoom, let playlist = room.playlist, !playlist.isEmpty {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.15)) {
                    showPlaylistMenu.toggle()
                }
            }) {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "list.and.film")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct PlaylistModalView: View {
    let room: WatchPartyRoom
    let isHost: Bool
    @Binding var showPlaylistMenu: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Text("Playlist")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Text("Click outside to close")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            // Playlist Items
            if let playlist = room.playlist, !playlist.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 12) {
                        ForEach(playlist.indices, id: \.self) { index in
                            let item = playlist[index]
                            let isCurrent = index == room.currentPlaylistIndex
                            
                            Button(action: {
                                // Only host can change playlist item
                                if isHost && index != room.currentPlaylistIndex {
                                    // TODO: Implement playlist jump logic
                                    LoggingManager.shared.debug(.general, message: "Playlist item tapped: \(index)")
                                }
                            }) {
                                HStack(spacing: 12) {
                                    // Poster
                                    if let poster = item.mediaItem.poster {
                                        AsyncImage(url: URL(string: poster)) { phase in
                                            if case .success(let image) = phase {
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40, height: 60)
                                                    .cornerRadius(4)
                                                    .clipped()
                                            } else {
                                                Rectangle()
                                                    .fill(Color.gray.opacity(0.3))
                                                    .frame(width: 40, height: 60)
                                                    .cornerRadius(4)
                                            }
                                        }
                                    } else {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 40, height: 60)
                                            .cornerRadius(4)
                                    }
                                    
                                    // Title info
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.displayTitle)
                                            .font(.system(size: 14, weight: isCurrent ? .bold : .medium))
                                            .foregroundColor(isCurrent ? .green : .primary)
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                        

                                        if isCurrent {
                                            Text("Now Playing")
                                                .font(.system(size: 12))
                                                .foregroundColor(.green.opacity(0.8))
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    // Playing Indicator
                                    if isCurrent {
                                        Image(systemName: "play.circle.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.green)
                                    } else if index < room.currentPlaylistIndex {
                                        Image(systemName: "checkmark.circle")
                                            .font(.system(size: 16))
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(isCurrent ? Color.green.opacity(0.1) : Color.primary.opacity(0.05))
                                )
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
                .frame(maxHeight: 500)
            } else {
                 Text("No playlist items")
                    .foregroundColor(.secondary)
                    .padding(30)
            }
        }
        .frame(width: 450)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
    }
}
