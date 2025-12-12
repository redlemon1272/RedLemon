//
//  WaitingGateView.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct WaitingGateView: View {
    let isHost: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)

            Text(isHost ? "Waiting for guests to load..." : "Waiting for host to start...")
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)

            if isHost {
                Text("Playback will start automatically when everyone is ready")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .transition(.opacity)
    }
}
