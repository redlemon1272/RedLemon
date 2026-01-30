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





            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .transition(.opacity)
    }
}
