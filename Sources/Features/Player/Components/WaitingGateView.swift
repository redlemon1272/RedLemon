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



            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .transition(.opacity)
    }
}
