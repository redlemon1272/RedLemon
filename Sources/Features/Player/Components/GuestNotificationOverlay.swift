import SwiftUI

struct GuestNotificationOverlay: View {
    @ObservedObject var viewModel: MPVPlayerViewModel

    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            ForEach(viewModel.guestNotifications) { notification in
                HStack(spacing: 8) {
                    Image(systemName: "person.fill.badge.plus")
                        .font(.system(size: 12))
                        .foregroundColor(.blue)

                    Text(notification.text)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.8))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                        )
                )
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .opacity.combined(with: .scale(scale: 0.9))
                ))
            }
        }
        .padding(.top, 60) // Stay below any top-bar elements if they exist
        .padding(.trailing, 20)
    }
}
