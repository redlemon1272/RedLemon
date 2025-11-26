//
//  TVHeroEventCard.swift
//  RedLemon
//
//  Hero card component for TV show events
//

import SwiftUI

struct TVHeroEventCard: View {
    let tvEvent: TVEventItem
    let onJoin: () -> Void
    
    @State private var currentTime = TimeService.shared.now
    @State private var timer: Timer?
    
    var body: some View {
        Button(action: onJoin) {
            ZStack(alignment: .topLeading) {
                // Full Background Image with Gradient
                AsyncImage(url: tvEvent.mediaItem.backgroundURL ?? tvEvent.mediaItem.posterURL) { image in
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
                .frame(height: 320)
                .clipped()
                .overlay(
                    // Multi-layer gradient for better readability
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.7), .clear, .black.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                )
                .cornerRadius(16)
                
                // Content Overlay
                VStack(alignment: .leading, spacing: 0) {
                    // Top Section: Status Badge
                    HStack {
                        // Always show LIVE NOW for TV events
                        HStack(spacing: 6) {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                            Text("LIVE NOW")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.red.opacity(0.9))
                                .shadow(color: .red.opacity(0.5), radius: 8, x: 0, y: 2)
                        )
                        
                        
                        Spacer()
                        
                        // Participant Count
                        if tvEvent.participantCount > 0 {
                            HStack(spacing: 4) {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 11))
                                Text("\(tvEvent.participantCount)")
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.2))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Bottom Section: Logo, Episode Info, Progress
                    VStack(alignment: .leading, spacing: 12) {
                        // Logo or Title
                        if let logoURL = tvEvent.mediaItem.logoURL {
                            AsyncImage(url: logoURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Text(tvEvent.series.title)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                            }
                            .frame(maxWidth: 300, maxHeight: 80, alignment: .leading)
                            .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 4)
                        } else {
                            Text(tvEvent.series.title)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                        }
                        
                        // Episode Info
                        HStack(spacing: 8) {
                            Text("S\(String(format: "%02d", tvEvent.currentSeason))E\(String(format: "%02d", tvEvent.currentEpisode))")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(6)
                        }
                        
                        // Progress Bar
                        VStack(alignment: .leading, spacing: 6) {
                            ProgressView(value: progress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .red))
                                .scaleEffect(x: 1, y: 1.5, anchor: .center)
                            
                            HStack {
                                Text(formatEventTime(elapsedTime))
                                    .font(.system(size: 13, weight: .medium))
                                Spacer()
                                Text("-\(formatEventTime(remainingTime))")
                                    .font(.system(size: 13, weight: .medium))
                            }
                            .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.top, 4)
                    }
                    .padding(24)
                }
            }
            .frame(height: 320)
            .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 6)
        }
        .buttonStyle(PlainButtonStyle())
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red.opacity(0.5), lineWidth: 2)
        )
        .onAppear {
            currentTime = TimeService.shared.now
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                currentTime = TimeService.shared.now
            }
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private var progress: Double {
        let elapsed = currentTime.timeIntervalSince(tvEvent.startTime)
        return min(max(elapsed / tvEvent.episodeRuntime, 0), 1)
    }
    
    private var elapsedTime: TimeInterval {
        currentTime.timeIntervalSince(tvEvent.startTime)
    }
    
    private var remainingTime: TimeInterval {
        let episodeEndTime = tvEvent.startTime.addingTimeInterval(tvEvent.episodeRuntime)
        return max(episodeEndTime.timeIntervalSince(currentTime), 0)
    }
    
    private func formatEventTime(_ interval: TimeInterval) -> String {
        let hours = Int(interval) / 3600
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
