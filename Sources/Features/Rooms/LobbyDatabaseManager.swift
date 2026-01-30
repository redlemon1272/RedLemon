//
//  LobbyDatabaseManager.swift
//  RedLemon
//
//  Manages database polling for room state synchronization
//  Phase 2: Extract database logic from LobbyViewModel
//

import Foundation
import SwiftUI

// Phase 4: Extract Database Polling Logic
@MainActor
class LobbyDatabaseManager: ObservableObject {
    private weak var viewModel: LobbyViewModel?

    // Tasks
    private var roomStatePollingTask: Task<Void, Never>?

    init(viewModel: LobbyViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Polling

    /// Start polling for room state updates (guests only)
    func startPolling() {
        guard let viewModel = viewModel, !viewModel.isHost else { return }

        print("🔄 LobbyDatabase: Starting room state polling for guests...")

        // Poll room state every 2 seconds
        roomStatePollingTask?.cancel()
        roomStatePollingTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self else { return }
                await self.pollRoomState()
                try? await Task.sleep(nanoseconds: 2_000_000_000)
            }
        }
    }

    /// Stop all polling tasks
    func stopPolling() {
        roomStatePollingTask?.cancel()
        roomStatePollingTask = nil

        print("🛑 LobbyDatabase: Polling stopped")
    }

    // MARK: - Room State Polling

    /// Poll room state for database fallback (guests only)
    /// This provides fallback sync when Realtime is unavailable or delayed
    private func pollRoomState() async {
        guard let viewModel = viewModel else { return }

        // CRITICAL FIX: Don't poll/trigger if we are already starting
        guard !viewModel.isStarting else { return }

        do {
            guard let roomState = try await viewModel.dataService.getRoomState(roomId: viewModel.room.id) else {
                return
            }

            // CRITICAL FIX: Sync UI Metadata (Guest UI was not updating when Host changed item)
            await syncRoomMetadata(roomState: roomState)

            // Check for playback trigger
            await checkForPlaybackTrigger(roomState: roomState)

            // Update last known state
            viewModel.lastRoomPlayingState = roomState.isPlaying

        } catch {
            NSLog("%@", "⚠️ LobbyDatabase: Failed to poll room state: \(error)")
        }
    }

    // MARK: - Metadata Synchronization

    /// Sync room metadata from database state
    private func syncRoomMetadata(roomState: SupabaseRoom) async {
        guard let viewModel = viewModel else { return }

        // Construct MediaItem from SupabaseRoom flat properties
        var freshMedia: MediaItem? = nil
        if let imdbId = roomState.imdbId {
            let type = (roomState.season != nil || roomState.episode != nil) ? "series" : "movie"
            freshMedia = MediaItem(
                id: imdbId,
                type: type,
                name: roomState.name,
                poster: roomState.posterUrl,
                background: roomState.backdropUrl,
                logo: nil,
                description: roomState.description,
                releaseInfo: nil,
                year: nil,
                imdbRating: nil,
                genres: nil,
                runtime: nil
            )
        }

        let freshPlaylist = roomState.playlist
        let freshSeason = roomState.season
        let freshEpisode = roomState.episode
        let freshIndex = roomState.currentPlaylistIndex

        await MainActor.run {
            // 1. Update Media Item & UI Assets if changed
            if let mediaItem = freshMedia {
                if viewModel.room.mediaItem?.id != mediaItem.id ||
                   viewModel.room.season != freshSeason ||
                   viewModel.room.episode != freshEpisode {

                    // Update local room state
                    viewModel.room.mediaItem = mediaItem
                    viewModel.room.season = freshSeason
                    viewModel.room.episode = freshEpisode

                    // Update UI Bindings
                    viewModel.posterURL = mediaItem.poster
                    viewModel.backdropURL = mediaItem.background
                    viewModel.logoURL = mediaItem.logo

                    NSLog("%@", "✅ Guest: Synced Metadata Update -> \(mediaItem.name)")

                    // Trigger fetch for full metadata (logo etc) if needed
                    if viewModel.logoURL == nil {
                        viewModel.loadMetadata()
                    }
                }
            }

            // 2. Update Playlist & Index
            if let playlist = freshPlaylist {
                if viewModel.playlist.count != playlist.count || viewModel.room.currentPlaylistIndex != freshIndex {
                    viewModel.playlist = playlist
                    viewModel.room.playlist = playlist
                    if let idx = freshIndex {
                        viewModel.currentPlaylistIndex = idx
                        viewModel.room.currentPlaylistIndex = idx
                    }
                    viewModel.isPlaylistMode = !playlist.isEmpty
                }
            }
        }
    }

    // MARK: - Playback Trigger Detection

    /// Check if room is playing and trigger playback if needed
    private func checkForPlaybackTrigger(roomState: SupabaseRoom) async {
        guard let viewModel = viewModel else { return }

        // Only trigger if room is playing and we're not already starting
        guard roomState.isPlaying && !viewModel.isStarting else { return }

        // CRITICAL FIX: Race Condition Checks

        // 1. Check if we just finished playback (grace period)
        // Internal Note: Bypass for events to ensure seamless progression
        if viewModel.room.type != .event,
           let endedAt = viewModel.playbackEndedTimestamp,
           Date().timeIntervalSince(endedAt) < 5 {
            NSLog("%@", "🛑 Guest: Ignoring playback signal - just finished playback (Grace Period)")
            return
        }

        // 1.5. Check Idempotency (Ghost Loop Fix v2)
        // If we have already started playback for this stream hash, block it.
        // We use ONLY the streamHash (not lastActivity) because lastActivity updates constantly during playback.
        // The only way to bypass this is if the Host changes the stream (different hash).
        let sessionId = roomState.streamHash ?? ""
        if !sessionId.isEmpty && sessionId.caseInsensitiveCompare(viewModel.lastAutoStartedSessionId ?? "") == .orderedSame {
             NSLog("%@", "🛑 Guest: Blocking auto-start loop. Already played stream: \(sessionId.prefix(8))")
             return
        }

        // 2. Causality Check (The Reference Fix)
        // If we have a record of when we LAST finished playback, verify the DB signal is NEWER.
        // Internal Note: Bypass for events
        if viewModel.room.type != .event, let endedAt = viewModel.playbackEndedTimestamp {
            // CRITICAL FIX: Add 3s buffer. Updates happening *during* teardown (like "Host returned to lobby")
            // might have a slightly later timestamp but are part of the 'end' event, not a new 'start'.
            if roomState.lastActivity < endedAt.addingTimeInterval(3.0) {
                let diff = String(format: "%.1f", roomState.lastActivity.timeIntervalSince(endedAt))
                NSLog("%@", "🛑 Guest: Ignoring playback signal too close to finish time (Diff: \(diff)s)")
                return
            }
        }

        // 3. Check for stale "is_playing" signal (e.g. Host crashed or failed to clear DB)
        let activityAge = Date().timeIntervalSince(roomState.lastActivity)
        if activityAge > 60 {
            NSLog("🛑 Guest: Ignoring stale playback signal (Age: %ds)", Int(activityAge))
            return
        }

        // 4. Safety delay check (prevent immediate auto-join)
        // Internal Note: Bypass for events
        guard viewModel.room.type == .event || viewModel.canAutoJoin else {
            NSLog("🛡️ Guest: Suppressing auto-join (safety delay active)")
            return
        }

        // All checks passed - trigger playback
        NSLog("🎬 Guest: Detected room playback via database fallback")
        await triggerPlayback(roomState: roomState)
    }

    /// Trigger playback for guest after database fallback detection
    private func triggerPlayback(roomState: SupabaseRoom) async {
        guard let viewModel = viewModel else { return }

        // Start countdown
        viewModel.isStarting = true
        viewModel.transitionState.isStarting = true
        viewModel.countdown = 3

        Task { @MainActor [weak self, weak viewModel] in
            guard let self = self, let viewModel = viewModel else { return }

            // Wait for countdown (same duration as host)
            for i in (1...3).reversed() {
                viewModel.countdown = i
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
            }

            // Mark session as started (Idempotency)
            // We use ONLY the streamHash (not lastActivity) to prevent loops when Host keeps playing
            let sessionId = roomState.streamHash ?? ""
            if !sessionId.isEmpty {
                viewModel.lastAutoStartedSessionId = sessionId
                NSLog("✅ Guest: Idempotency Lock Set -> %@", String(sessionId.prefix(8)))
            }

            NSLog("🎬 Guest: Starting playback after database fallback detection")

            // Perform one final check: did the host stop playing while we were counting down?
            if let freshState = try? await viewModel.dataService.getRoomState(roomId: viewModel.room.id) {
                if !freshState.isPlaying {
                     NSLog("🛑 Guest: Host stopped playing during countdown - aborting playback")
                     viewModel.isStarting = false
                     viewModel.transitionState.isStarting = false
                     return
                }
            }

            // Validate prerequisites
            guard viewModel.room.mediaItem != nil else {
                NSLog("❌ Guest: Cannot start playback - no media selected")
                viewModel.isStarting = false
                viewModel.transitionState.isStarting = false
                return
            }

            guard let appState = viewModel.appState else {
                NSLog("❌ Guest: Cannot start playback - no appState")
                viewModel.isStarting = false
                viewModel.transitionState.isStarting = false
                return
            }

            // CRITICAL: Check for media mismatch (e.g. host changed movie to show)
            await viewModel.updateMediaItemFromRoomState(roomState)

            // Check if room has media item
            guard viewModel.room.mediaItem != nil else {
                print("⚠️ Cannot join room: No media item")
                viewModel.isStarting = false
                viewModel.transitionState.isStarting = false
                return
            }

            NSLog("🎬 Guest: Launching player via database fallback")

            // CRITICAL FIX: Sync stream details from fresh roomState to AppState
            if var currentRoom = appState.player.currentWatchPartyRoom {
                currentRoom.selectedStreamHash = roomState.streamHash
                currentRoom.selectedFileIdx = roomState.fileIdx
                currentRoom.selectedQuality = roomState.quality
                currentRoom.selectedStreamTitle = roomState.sourceQuality // Internal Note #91: Title fallback
                currentRoom.unlockedStreamURL = roomState.unlockedStreamUrl

                appState.player.currentWatchPartyRoom = currentRoom
                NSLog("✅ Guest: Synced stream details from DB fallback (Hash: %@, Title: %@)", String(roomState.streamHash?.prefix(8) ?? "nil"), String(roomState.sourceQuality?.prefix(20) ?? "nil"))
            }

            // CRITICAL: Set season/episode from room BEFORE playMedia()
            let season = roomState.season ?? viewModel.room.season
            let episode = roomState.episode ?? viewModel.room.episode

            if let season = season, let episode = episode {
                await MainActor.run {
                    appState.selectedSeason = season
                    appState.selectedEpisode = episode

                    // Also update local room state
                    viewModel.room.season = season
                    viewModel.room.episode = episode
                }
                NSLog("📺 Guest: Set season/episode from DB: S%dE%d", season, episode)
            } else {
                // Only warn if it's a series
                if viewModel.room.mediaItem?.type == "series" {
                    NSLog("⚠️ Guest: No season/episode found in DB or local state for series")
                }
            }

            // CRITICAL: Set resume timestamp so guest starts exactly where host is!
            if roomState.playbackPosition > 5 {
                await MainActor.run {
                    appState.player.resumeFromTimestamp = TimeInterval(roomState.playbackPosition)
                    NSLog("⏩ Guest: Pre-setting start time to host position: %ds", roomState.playbackPosition)
                }
            }

            // Stop polling before transition
            self.stopPolling()

            await appState.player.playMedia(
                viewModel.room.mediaItem!,
                quality: .fullHD,
                watchMode: .watchParty,
                roomId: viewModel.room.id,
                isHost: false,
                isEvent: viewModel.room.type == .event,
                triggerSource: "lobby_auto_join"
            )
        }
    }
}
