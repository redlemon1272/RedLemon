//
//  PlayerOverlays.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct LoadingOverlay: View {
    let streamTitle: String
    var message: String = "Loading stream..."

    var body: some View {
        ZStack {
            // Premium glassmorphic background
            Rectangle()
                .fill(.ultraThinMaterial)

            VStack(spacing: 24) {
                // Enhanced spinner with subtle glow
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 4)
                        .frame(width: 54, height: 54)

                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.3)
                }
                .stitchGlow(color: .white.opacity(0.5), radius: 12)

                VStack(spacing: 8) {
                    Text(message)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)

                    if !streamTitle.isEmpty {
                        Text(streamTitle)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                            .padding(.horizontal, 60)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        let isSoloPlayback = !viewModel.isInWatchParty && !isEvent

        Button(action: {
            Task {
                if !isEvent && isHost && viewModel.isInWatchParty {
                     // Trigger synchronized return
                     viewModel.triggerReturnToLobby()
                } else {
                     // Solo / Event / Guest exit
                     // Preparation: prevent "horrific" transition jitter
                     // by showing a stable state before the heavy window/view switch
                     viewModel.isExitingSession = true
                     // Removed 0.3s delay here - relying on exitPlayer internal stabilization for responsiveness

                     await appState.player.exitPlayer()
                }
            }
        }) {
            HStack(spacing: 6) {
                Image(systemName: (!isEvent && isHost && viewModel.isInWatchParty) ? "arrow.turn.up.left" : "arrow.left.circle.fill")
                    .font(.system(size: 14))
                // Solo playback = "Exit", Events = "Exit Event", Room Host = "Back to Lobby", Room Guest = "Exit Room"
                Text(isSoloPlayback ? "Exit" : (isEvent ? "Exit Event" : (isHost ? "Back to Lobby" : "Exit Room")))
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
