//
//  EventsView+TVEvents.swift
//  RedLemon
//
//  TV event helper functions for EventsView
//

import SwiftUI

extension EventsView {
    // MARK: - Helper Views
    
    @ViewBuilder
    func emptyStateView(icon: String, message: String) -> some View {
        VStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 50))
                .foregroundColor(.secondary)
            Text(message)
                .font(.title2)
                .foregroundColor(.primary)
            Text("Check back later for more live screenings.")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
    }
    
    // MARK: - TV Event Functions
    
    func loadTVEvents() {
        Task {
            print("📺 Loading TV events...")
            var tvEventItems: [TVEventItem] = []
            
            for series in TVEventData.allSeries {
                // Calculate current episode
                let playbackState = await TVEventScheduler.getCurrentEpisode(for: series)
                
                // Fetch series metadata
                if let mediaItem = try? await apiClient.fetchMediaDetails(imdbId: series.id, type: "series") {
                    let tvEventItem = TVEventItem(
                        id: series.id,
                        series: series,
                        mediaItem: mediaItem,
                        currentSeason: playbackState.season,
                        currentEpisode: playbackState.episode,
                        startTime: playbackState.startTime,
                        episodeRuntime: playbackState.episodeRuntime
                    )
                    tvEventItems.append(tvEventItem)
                }
            }
            
            DispatchQueue.main.async {
                self.tvEvents = tvEventItems
                print("✅ Loaded \(tvEventItems.count) TV events")
            }
        }
    }
    
    func joinTVEvent(_ tvEvent: TVEventItem) {
        print("📺 Joining TV event: \(tvEvent.series.title)")
        print("   Current episode: S\(String(format: "%02d", tvEvent.currentSeason))E\(String(format: "%02d", tvEvent.currentEpisode))")
        
        let roomId = "tv_event_\(tvEvent.series.id)"
        
        // Create/join event room
        Task {
            do {
                guard let userId = appState.currentUserId else {
                    print("⚠️ No user ID - skipping room creation")
                    await createLocalTVEventRoom(tvEvent: tvEvent, roomId: roomId)
                    return
                }
                
                // Try to get existing room
                let existingRoom = try? await SupabaseClient.shared.getRoomState(roomId: roomId)
                if existingRoom != nil {
                    print("✅ TV event room already exists: \(roomId)")
                    try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId)
                } else {
                    // Create new TV event room
                    print("📝 Creating new TV event room: \(roomId)")
                    _ = try await SupabaseClient.shared.createRoom(
                        id: roomId,
                        name: "\(tvEvent.series.title) - Live",
                        hostUserId: userId,
                        hostUsername: "RedLemon Events",
                        streamHash: nil,
                        imdbId: tvEvent.series.id,
                        posterUrl: tvEvent.mediaItem.poster,
                        backdropUrl: tvEvent.mediaItem.background,
                        season: tvEvent.currentSeason,
                        episode: tvEvent.currentEpisode,
                        isPublic: true
                    )
                    try await SupabaseClient.shared.joinRoom(roomId: roomId, userId: userId, isHost: false)
                }
                
                await createLocalTVEventRoom(tvEvent: tvEvent, roomId: roomId)
            } catch {
                print("❌ Failed to create/join TV event room: \(error)")
                await createLocalTVEventRoom(tvEvent: tvEvent, roomId: roomId)
            }
        }
    }
    
    @MainActor
    func createLocalTVEventRoom(tvEvent: TVEventItem, roomId: String) {
        let room = WatchPartyRoom(
            id: roomId,
            hostId: "system",
            hostName: "RedLemon System",
            mediaItem: tvEvent.mediaItem,
            season: tvEvent.currentSeason,
            episode: tvEvent.currentEpisode,
            quality: .fullHD,
            sourceQuality: nil,
            description: "Live TV Event",
            posterURL: tvEvent.mediaItem.poster,
            participants: [],
            state: .playing,  // TV events go straight to playing (no lobby)
            createdAt: tvEvent.startTime,
            playlist: nil,
            currentPlaylistIndex: 0,
            lobbyDuration: 0,  // No lobby for TV events
            shouldLoop: false,
            isPersistent: true,
            selectedStreamHash: nil,
            selectedFileIdx: nil,
            selectedQuality: nil,
            unlockedStreamURL: nil
        )
        
        appState.isTVEvent = true
        appState.currentTVSeries = tvEvent.series
        appState.isEventPlayback = true
        appState.currentWatchMode = .watchParty
        appState.currentWatchPartyRoom = room
        appState.isWatchPartyHost = false
        appState.currentView = .player  // Go straight to player (no lobby)
    }
}
