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
            ZStack(alignment: .topLeading) {
                // Full Background Image with Gradient
                AsyncImage(url: URL(string: room.mediaItem?.background ?? room.mediaItem?.poster ?? room.posterURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle().fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                }
                .frame(height: 280) // Slightly shorter than event card (320)
                .clipped()
                .overlay(
                    // Multi-layer gradient for better readability
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.6), .clear, .black.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.4), .clear]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                )
                .cornerRadius(16)
                .overlay(
                    ZStack {
                        Color.black.opacity(0.6)
                        VStack(spacing: 12) {
                            ProgressView()
                                .scaleEffect(1.2)
                                .tint(.white)
                            Text("Joining...")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    .opacity(isJoining ? 1 : 0)
                    .animation(.easeInOut(duration: 0.2), value: isJoining)
                    .allowsHitTesting(false)
                )

                // Content Overlay
                VStack(alignment: .leading, spacing: 0) {
                    // Top Section: Badges
                    HStack {
                        // Status Badge
                        if room.state == .playing {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                Text("LIVE")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule()
                                    .fill(Color.red.opacity(0.9))
                                    .shadow(color: .red.opacity(0.5), radius: 4, x: 0, y: 2)
                            )
                        } else {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                                Text("LOBBY")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule()
                                    .fill(Color.green.opacity(0.9))
                                    .shadow(color: .green.opacity(0.5), radius: 4, x: 0, y: 2)
                            )
                        }

                        Spacer()

                        // Language Badge (Mocked for now)
                        HStack(spacing: 4) {
                            Text("🇺🇸") // Placeholder flag
                            Text("EN")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Material.thinMaterial)
                        .clipShape(Capsule())

                        // Participants Badge
                        HStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 10))
                            Text("\(room.participants.count)")
                                .font(.system(size: 11, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Material.thinMaterial)
                        .clipShape(Capsule())
                    }
                    .padding(16)

                    Spacer()

                    // Bottom Section: Info
                    VStack(alignment: .leading, spacing: 6) {
                        // Host Description (if available)
                        if let description = room.description, !description.isEmpty {
                            Text(description)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.yellow)
                                .lineLimit(1)
                                .padding(.bottom, 2)
                        }

                        // Title
                        Text(room.mediaItem?.name ?? room.episodeTitle ?? "Unknown Title")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)

                        // Metadata Row
                        HStack(spacing: 12) {
                            // Host Name
                            HStack(spacing: 4) {
                                Image(systemName: "crown.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(.yellow)
                                Text(room.hostName ?? "Unknown Host")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.white.opacity(0.9))
                            }

                            if let year = room.mediaItem?.year {
                                Text("•")
                                    .foregroundColor(.white.opacity(0.5))
                                Text(year)
                                    .font(.system(size: 13))
                                    .foregroundColor(.white.opacity(0.8))
                            }

                            if let runtime = room.mediaItem?.runtime {
                                Text("•")
                                    .foregroundColor(.white.opacity(0.5))
                                Text(runtime)
                                    .font(.system(size: 13))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
            }
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle()) // Prevent default button styling
    }
}
