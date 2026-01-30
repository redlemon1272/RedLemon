import SwiftUI

struct EventListButton: View {
    @EnvironmentObject var appState: AppState
    @Binding var showEventListMenu: Bool
    
    var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        // Only show if we are in event playback mode and have events
        if appState.player.isEventPlayback && !appState.eventsSchedule.isEmpty {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.15)) {
                    showEventListMenu.toggle()
                }
            }) {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
            }
            .buttonStyle(.plain)
            .help("Show Event Schedule")
        }
    }
}

struct EventListModalView: View {
    @EnvironmentObject var appState: AppState
    @Binding var showEventListMenu: Bool
    
    // Helper formats
    private func formatDuration(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: interval) ?? ""
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Text("Upcoming Events")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Text("Click outside to close")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            // Event Items
            if !appState.eventsSchedule.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 12) {
                        // Limit to next 3 events (as requested)
                        ForEach(Array(appState.eventsSchedule.prefix(4)), id: \.id) { event in
                            let isCurrent = event.isLive
                            
                            HStack(spacing: 12) {
                                // Poster
                                if let poster = event.mediaItem.poster {
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
                                    Text(event.mediaItem.name)
                                        .font(.system(size: 14, weight: isCurrent ? .bold : .medium))
                                        .foregroundColor(isCurrent ? .green : .primary)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack(spacing: 6) {
                                        if isCurrent {
                                            Text("LIVE NOW")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 2)
                                                .background(Color.red.opacity(0.8))
                                                .cornerRadius(4)
                                        } else {
                                            Text(formatTime(event.startTime))
                                                .font(.system(size: 12))
                                                .foregroundColor(.secondary)
                                            
                                            // Show "Starts in X" if within hour
                                            if event.startTime.timeIntervalSince(TimeService.shared.now) < 3600 {
                                                Text("• In \(Int(event.startTime.timeIntervalSince(TimeService.shared.now) / 60))m")
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                                
                                // Indicator
                                if isCurrent {
                                    Image(systemName: "play.circle.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.green)
                                } else if event.isFinished {
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
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
                .frame(maxHeight: 400) // Slightly shorter than playlist
            } else {
                 Text("No scheduled events")
                    .foregroundColor(.secondary)
                    .padding(30)
            }
        }
        .frame(width: 400)
        .background(.regularMaterial)
        .cornerRadius(16)
        .shadow(radius: 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
    }
}
