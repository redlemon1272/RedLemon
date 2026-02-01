//
//  WaitingGateView.swift
//  RedLemon
//
//  Created for RedLemon Refactoring Phase 2
//

import SwiftUI

struct WaitingGateView: View {
    let isHost: Bool
    let streamTitle: String

    var body: some View {
        LoadingOverlay(
            streamTitle: streamTitle,
            message: isHost ? "Waiting for guests..." : "Waiting for host..."
        )
        .transition(.opacity)
    }
}
