//
//  PlayerOverlays.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct LoadingOverlay: View {
    let streamTitle: String

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)

            Text("Loading stream...")
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))

            if !streamTitle.isEmpty {
                Text(streamTitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
            }

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
        .transition(.opacity)
    }
}

struct HeroLogoView: View {
    let logoURL: String

    var body: some View {
        AsyncImage(url: URL(string: logoURL)) { phase in
            if case .success(let image) = phase {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                    .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
            }
        }
        .transition(.opacity.combined(with: .scale))
    }
}

struct ExitButton: View {
    @ObservedObject var viewModel: MPVPlayerViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        // Logic:
        // 1. Event -> "Exit Event" (Standard behavior)
        // 2. Watch Party Host -> "Back to Lobby" (Triggers synchronized return)
        // 3. Watch Party Guest / Other -> "Exit Room" (Standard behavior)

        let isEvent = appState.player.isEventPlayback == true
        let isHost = viewModel.isWatchPartyHost

        Button(action: {
            Task {
                if !isEvent && isHost {
                     // Trigger synchronized return
                     viewModel.triggerReturnToLobby()
                } else {
                     // Standard exit
                     await appState.player.exitPlayer()
                }
            }
        }) {
            HStack(spacing: 6) {
                Image(systemName: (!isEvent && isHost) ? "arrow.turn.up.left" : "arrow.left.circle.fill")
                    .font(.system(size: 14))
                // Note: User requested "Back to Lobby" for hosts, "Exit Room" for guests.
                // Events logic remains "Exit Room" (or Event)
                Text(isEvent ? "Exit Event" : (isHost ? "Back to Lobby" : "Exit Room"))
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
        .padding(12)
    }
}
