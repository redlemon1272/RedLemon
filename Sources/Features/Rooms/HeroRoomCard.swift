import SwiftUI

struct HeroRoomCard: View {
    let room: WatchPartyRoom
    let onJoin: () async -> Void
    @State private var isJoining = false

    var body: some View {
        Button(action: {
            guard !isJoining else { return }
            isJoining = true
            Task {
                // Slight delay to ensure "Joining" state renders
                try? await Task.sleep(nanoseconds: 50_000_000) // 0.05s
                await onJoin()
                await MainActor.run {
                    isJoining = false
                }
            }
        }) {
            HeroRoomCardContent(room: room, isJoining: isJoining)
        }
        .buttonStyle(PlainButtonStyle()) // Prevent default button styling
    }
}

// Helper view for the room card content
struct HeroRoomCardContent: View {
    let room: WatchPartyRoom
    let isJoining: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            // LAYER 0: Sizing Anchor (Stable Layout)
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: 280)
                .frame(maxWidth: .infinity)

            // LAYER 1: Background Image (DISABLED FOR DEBUGGING)
            Color.purple.opacity(0.2)
                .frame(height: 280)
                .frame(maxWidth: .infinity)
                .allowsHitTesting(false)

            // LAYERS 2-4 REMOVED FOR DEBUGGING
            /*
             ZStack { Gradients, content, etc. }
             */
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}
