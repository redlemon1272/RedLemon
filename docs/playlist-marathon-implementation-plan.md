# Watch Party Playlist/Marathon Implementation Plan

## Executive Summary

This document outlines the implementation plan for adding **playlist/marathon functionality** to RedLemon watch parties. This feature allows hosts to create persistent rooms that play multiple movies or entire TV seasons, with automatic transitions between items and lobby countdowns.

## Current State

### Existing Infrastructure ✅

The data model foundation is **already in place**:

**[WatchPartyModels.swift](file:///Users/danielnoble/Desktop/Redlemon/Sources/Models/WatchPartyModels.swift#L5-L95)**
- `PlaylistItem` struct with media, season, episode
- `WatchPartyRoom.playlist: [PlaylistItem]?`
- `WatchPartyRoom.currentPlaylistIndex: Int`
- `WatchPartyRoom.lobbyDuration: TimeInterval`
- `WatchPartyRoom.shouldLoop: Bool`
- `WatchPartyRoom.isPersistent: Bool`
- Helper methods: `hasPlaylist`, `currentPlaylistItem`, `isLastItemInPlaylist`

### Missing Components ❌

1. **UI for creating playlists** - No interface to add multiple items
2. **Playlist management logic** - No auto-advance between items
3. **Database schema** - Playlist not stored in Supabase
4. **Lobby countdown UI** - No "Next up in 5:00" display
5. **State transitions** - No handling of playlist item changes

---

## Implementation Strategy

### Phase 1: Database Schema (Week 1)

#### Supabase Schema Changes

```sql
-- Add playlist support to rooms table
ALTER TABLE rooms ADD COLUMN playlist JSONB DEFAULT NULL;
ALTER TABLE rooms ADD COLUMN current_playlist_index INTEGER DEFAULT 0;
ALTER TABLE rooms ADD COLUMN lobby_duration INTEGER DEFAULT 300; -- 5 minutes in seconds
ALTER TABLE rooms ADD COLUMN should_loop BOOLEAN DEFAULT false;
ALTER TABLE rooms ADD COLUMN is_persistent BOOLEAN DEFAULT false;

-- Index for querying persistent rooms
CREATE INDEX idx_rooms_persistent ON rooms(is_persistent) WHERE is_persistent = true;

-- Example playlist JSON structure:
-- [
--   {
--     "id": "uuid-1",
--     "imdb_id": "tt0468569",
--     "name": "The Dark Knight",
--     "type": "movie",
--     "season": null,
--     "episode": null
--   },
--   {
--     "id": "uuid-2",
--     "imdb_id": "tt1345836",
--     "name": "The Dark Knight Rises",
--     "type": "movie",
--     "season": null,
--     "episode": null
--   }
-- ]
```

#### SupabaseRoom Model Update

**[SupabaseClient.swift](file:///Users/danielnoble/Desktop/Redlemon/Sources/Networking/SupabaseClient.swift)** - Add to `SupabaseRoom` struct:

```swift
struct SupabaseRoom: Codable {
    // ... existing fields ...

    // Playlist support
    let playlist: [PlaylistItemDTO]?
    let currentPlaylistIndex: Int?
    let lobbyDuration: Int? // seconds
    let shouldLoop: Bool?
    let isPersistent: Bool?

    enum CodingKeys: String, CodingKey {
        // ... existing keys ...
        case playlist = "playlist"
        case currentPlaylistIndex = "current_playlist_index"
        case lobbyDuration = "lobby_duration"
        case shouldLoop = "should_loop"
        case isPersistent = "is_persistent"
    }
}

struct PlaylistItemDTO: Codable {
    let id: String
    let imdbId: String
    let name: String
    let type: String
    let season: Int?
    let episode: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, type, season, episode
        case imdbId = "imdb_id"
    }
}
```

---

### Phase 2: Playlist Creation UI (Week 2)

#### New Component: PlaylistBuilderView

Create `Sources/Features/Rooms/PlaylistBuilderView.swift`:

```swift
struct PlaylistBuilderView: View {
    @Environment(\.dismiss) var dismiss
    @State private var playlistItems: [PlaylistItem] = []
    @State private var showMediaPicker = false
    @State private var lobbyDuration: TimeInterval = 300 // 5 minutes
    @State private var shouldLoop = false
    @State private var isPersistent = true

    let onCreateRoom: (PlaylistRoomConfig) -> Void

    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Create Marathon")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button("Cancel") { dismiss() }
            }
            .padding()

            // Playlist items list (drag to reorder)
            List {
                ForEach(playlistItems) { item in
                    PlaylistItemRow(item: item)
                }
                .onMove { from, to in
                    playlistItems.move(fromOffsets: from, toOffset: to)
                }
                .onDelete { indexSet in
                    playlistItems.remove(atOffsets: indexSet)
                }
            }

            // Add content button
            Button(action: { showMediaPicker = true }) {
                Label("Add Movie/Episode", systemImage: "plus.circle.fill")
            }
            .buttonStyle(.borderedProminent)

            // Settings
            VStack(alignment: .leading, spacing: 12) {
                // Lobby duration slider
                VStack(alignment: .leading) {
                    Text("Break between items: \(formatDuration(lobbyDuration))")
                        .font(.caption)
                    Slider(value: $lobbyDuration, in: 60...600, step: 60)
                }

                Toggle("Loop playlist", isOn: $shouldLoop)
                Toggle("Persistent room", isOn: $isPersistent)
                    .help("Room stays open after playlist ends")
            }
            .padding()

            // Create button
            Button("Create Marathon Room") {
                let config = PlaylistRoomConfig(
                    items: playlistItems,
                    lobbyDuration: lobbyDuration,
                    shouldLoop: shouldLoop,
                    isPersistent: isPersistent
                )
                onCreateRoom(config)
                dismiss()
            }
            .disabled(playlistItems.isEmpty)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .sheet(isPresented: $showMediaPicker) {
            MediaPickerView { mediaItem, season, episode in
                let item = PlaylistItem(
                    mediaItem: mediaItem,
                    season: season,
                    episode: episode
                )
                playlistItems.append(item)
            }
        }
    }
}

struct PlaylistRoomConfig {
    let items: [PlaylistItem]
    let lobbyDuration: TimeInterval
    let shouldLoop: Bool
    let isPersistent: Bool
}
```

#### Quick Season Marathon Button

Add to `MediaDetailView.swift`:

```swift
// For TV shows, add "Marathon Season" button
if mediaItem.type == "series" {
    Button(action: {
        showSeasonMarathonPicker = true
    }) {
        Label("Marathon Season", systemImage: "play.rectangle.on.rectangle")
    }
    .sheet(isPresented: $showSeasonMarathonPicker) {
        SeasonMarathonPickerView(
            mediaItem: mediaItem,
            onCreateMarathon: { season, episodes in
                createSeasonMarathon(season: season, episodes: episodes)
            }
        )
    }
}
```

---

### Phase 3: Playlist State Management (Week 3)

#### LobbyViewModel Enhancements

Update `Sources/Features/Rooms/LobbyViewModel.swift`:

```swift
class LobbyViewModel: ObservableObject {
    // ... existing properties ...

    // Playlist state
    @Published var playlist: [PlaylistItem] = []
    @Published var currentPlaylistIndex: Int = 0
    @Published var lobbyCountdownRemaining: TimeInterval = 0
    @Published var isInPlaylistLobby: Bool = false

    private var lobbyCountdownTimer: Timer?

    // Playlist helpers
    var hasPlaylist: Bool {
        !playlist.isEmpty
    }

    var currentPlaylistItem: PlaylistItem? {
        guard currentPlaylistIndex < playlist.count else { return nil }
        return playlist[currentPlaylistIndex]
    }

    var nextPlaylistItem: PlaylistItem? {
        let nextIndex = currentPlaylistIndex + 1
        guard nextIndex < playlist.count else { return nil }
        return playlist[nextIndex]
    }

    var isLastItem: Bool {
        currentPlaylistIndex >= playlist.count - 1
    }

    // Called when current item ends
    func handlePlaylistItemEnded() {
        guard hasPlaylist else { return }

        if isLastItem {
            if room.shouldLoop {
                // Loop back to first item
                advanceToPlaylistItem(index: 0)
            } else if room.isPersistent {
                // Stay in lobby, wait for host action
                enterPersistentLobby()
            } else {
                // End room
                endRoom()
            }
        } else {
            // Advance to next item
            advanceToNextPlaylistItem()
        }
    }

    private func advanceToNextPlaylistItem() {
        let nextIndex = currentPlaylistIndex + 1
        advanceToPlaylistItem(index: nextIndex)
    }

    private func advanceToPlaylistItem(index: Int) {
        guard index < playlist.count else { return }

        // Update room state
        currentPlaylistIndex = index
        isInPlaylistLobby = true
        lobbyCountdownRemaining = room.lobbyDuration

        // Start countdown
        startLobbyCountdown()

        // Update database
        Task {
            await updatePlaylistIndex(index)
        }
    }

    private func startLobbyCountdown() {
        lobbyCountdownTimer?.invalidate()

        lobbyCountdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.lobbyCountdownRemaining > 0 {
                self.lobbyCountdownRemaining -= 1
            } else {
                self.lobbyCountdownTimer?.invalidate()
                self.startNextPlaylistItem()
            }
        }
    }

    private func startNextPlaylistItem() {
        guard let nextItem = currentPlaylistItem else { return }

        isInPlaylistLobby = false

        // Load and start next item
        Task {
            await loadAndStartPlaylistItem(nextItem)
        }
    }

    private func loadAndStartPlaylistItem(_ item: PlaylistItem) async {
        // Fetch metadata
        // Resolve streams
        // Update room with new media
        // Start playback
    }
}
```

---

### Phase 4: Playlist Lobby UI (Week 4)

#### Update WatchPartyLobbyView

Add playlist-specific UI to `WatchPartyLobbyView.swift`:

```swift
// Add to lobby content
if viewModel.isInPlaylistLobby {
    PlaylistLobbyOverlay(
        currentItem: viewModel.currentPlaylistItem,
        nextItem: viewModel.nextPlaylistItem,
        countdownRemaining: viewModel.lobbyCountdownRemaining,
        playlistProgress: "\(viewModel.currentPlaylistIndex + 1)/\(viewModel.playlist.count)"
    )
}

// New component
struct PlaylistLobbyOverlay: View {
    let currentItem: PlaylistItem?
    let nextItem: PlaylistItem?
    let countdownRemaining: TimeInterval
    let playlistProgress: String

    var body: some View {
        VStack(spacing: 20) {
            // Progress indicator
            Text("Marathon Progress: \(playlistProgress)")
                .font(.headline)
                .foregroundColor(.white)

            // Current item completed
            if let current = currentItem {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Finished: \(current.displayTitle)")
                        .font(.subheadline)
                }
            }

            // Next up
            if let next = nextItem {
                VStack(spacing: 8) {
                    Text("Next Up")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Text(next.displayTitle)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    // Countdown
                    Text("Starting in \(formatCountdown(countdownRemaining))")
                        .font(.title3)
                        .foregroundColor(.accentColor)
                        .monospacedDigit()
                }
            }

            // Skip button (host only)
            if viewModel.isHost {
                Button("Start Now") {
                    viewModel.skipLobbyCountdown()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.8))
        )
    }

    private func formatCountdown(_ seconds: TimeInterval) -> String {
        let mins = Int(seconds) / 60
        let secs = Int(seconds) % 60
        return String(format: "%d:%02d", mins, secs)
    }
}
```

#### Playlist Queue Display

Add a sidebar showing upcoming items:

```swift
struct PlaylistQueueView: View {
    let playlist: [PlaylistItem]
    let currentIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Queue")
                .font(.headline)
                .foregroundColor(.white)

            ScrollView {
                VStack(spacing: 8) {
                    ForEach(Array(playlist.enumerated()), id: \.offset) { index, item in
                        HStack {
                            // Status indicator
                            if index < currentIndex {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else if index == currentIndex {
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.accentColor)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                            }

                            Text(item.displayTitle)
                                .font(.caption)
                                .foregroundColor(index == currentIndex ? .white : .gray)

                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.6))
        .cornerRadius(12)
    }
}
```

---

### Phase 5: Database Integration (Week 5)

#### SupabaseClient Methods

Add to `SupabaseClient.swift`:

```swift
// Create room with playlist
func createPlaylistRoom(
    hostUserId: String,
    hostUsername: String,
    playlist: [PlaylistItem],
    lobbyDuration: TimeInterval,
    shouldLoop: Bool,
    isPersistent: Bool
) async throws -> SupabaseRoom {
    let playlistDTO = playlist.map { item in
        [
            "id": item.id,
            "imdb_id": item.mediaItem.id,
            "name": item.mediaItem.name,
            "type": item.mediaItem.type,
            "season": item.season as Any,
            "episode": item.episode as Any
        ]
    }

    let body: [String: Any] = [
        "id": UUID().uuidString,
        "host_user_id": hostUserId,
        "host_username": hostUsername,
        "playlist": playlistDTO,
        "current_playlist_index": 0,
        "lobby_duration": Int(lobbyDuration),
        "should_loop": shouldLoop,
        "is_persistent": isPersistent,
        "is_public": true,
        "max_participants": 50
    ]

    let data = try await makeRequest(
        path: "/rooms",
        method: "POST",
        body: body
    )

    return try jsonDecoder.decode(SupabaseRoom.self, from: data)
}

// Update playlist index
func updatePlaylistIndex(roomId: String, index: Int) async throws {
    let body: [String: Any] = [
        "current_playlist_index": index
    ]

    _ = try await makeRequest(
        path: "/rooms?id=eq.\(roomId)",
        method: "PATCH",
        body: body
    )
}

// Add item to playlist
func addToPlaylist(roomId: String, item: PlaylistItem) async throws {
    // Fetch current playlist
    // Append new item
    // Update database
}

// Remove item from playlist
func removeFromPlaylist(roomId: String, itemId: String) async throws {
    // Fetch current playlist
    // Remove item
    // Update database
}
```

---

### Phase 6: Playback Integration (Week 6)

#### MPVPlayerViewModel Updates

Update `Sources/Features/Player/MPVPlayerViewModel.swift`:

```swift
class MPVPlayerViewModel: ObservableObject {
    // ... existing properties ...

    // Playlist tracking
    var isPlaylistMode: Bool = false
    var onPlaylistItemEnded: (() -> Void)?

    // Override end-of-file handling
    private func handleEndOfFile() {
        if isPlaylistMode {
            // Notify lobby to advance playlist
            onPlaylistItemEnded?()
        } else {
            // Normal single-item behavior
            handleNormalEndOfFile()
        }
    }
}
```

#### Wire up in LobbyViewModel

```swift
func startPlayback() {
    // ... existing setup ...

    if hasPlaylist {
        playerViewModel.isPlaylistMode = true
        playerViewModel.onPlaylistItemEnded = { [weak self] in
            self?.handlePlaylistItemEnded()
        }
    }
}
```

---

## User Experience Flow

### Creating a Marathon

1. User clicks "Create Marathon" button
2. `PlaylistBuilderView` opens
3. User adds movies/episodes via search
4. User drags to reorder items
5. User sets lobby duration (1-10 minutes)
6. User toggles loop and persistent options
7. User clicks "Create Marathon Room"
8. Room created with playlist in database

### Joining a Marathon

1. Guest joins room via code
2. Lobby shows current item + queue sidebar
3. "Marathon Progress: 2/5" displayed
4. Queue shows all items with status indicators

### During Marathon

1. Item 1 plays to completion
2. Automatic transition to lobby
3. "Next Up: The Dark Knight Rises" overlay
4. Countdown: "Starting in 5:00"
5. Host can skip countdown
6. Item 2 auto-loads and starts
7. Repeat until playlist complete

### After Marathon

**If `shouldLoop = true`:**
- Loop back to first item

**If `isPersistent = true`:**
- Stay in lobby
- Host can add more items or restart

**Otherwise:**
- Room ends
- Participants returned to browse

---

## Database Schema Summary

```sql
-- rooms table additions
ALTER TABLE rooms ADD COLUMN playlist JSONB DEFAULT NULL;
ALTER TABLE rooms ADD COLUMN current_playlist_index INTEGER DEFAULT 0;
ALTER TABLE rooms ADD COLUMN lobby_duration INTEGER DEFAULT 300;
ALTER TABLE rooms ADD COLUMN should_loop BOOLEAN DEFAULT false;
ALTER TABLE rooms ADD COLUMN is_persistent BOOLEAN DEFAULT false;

CREATE INDEX idx_rooms_persistent ON rooms(is_persistent) WHERE is_persistent = true;
```

---

## Testing Plan

### Unit Tests
- [ ] Playlist item ordering
- [ ] Auto-advance logic
- [ ] Loop behavior
- [ ] Persistent room handling

### Integration Tests
- [ ] Create playlist room
- [ ] Join playlist room
- [ ] Advance through playlist
- [ ] Skip lobby countdown
- [ ] Loop playlist
- [ ] Add/remove items mid-marathon

### Manual Testing
- [ ] 2-movie marathon
- [ ] Full TV season (10 episodes)
- [ ] Loop behavior
- [ ] Persistent room after completion
- [ ] Host controls during lobby
- [ ] Guest experience

---

## Future Enhancements

### Phase 7: Advanced Features
- [ ] **Collaborative playlists** - Guests can suggest items
- [ ] **Voting system** - Vote on next item
- [ ] **Smart shuffle** - Randomize playlist
- [ ] **Save playlists** - Reusable marathon templates
- [ ] **Public marathons** - Browse ongoing marathons
- [ ] **Scheduled marathons** - Start at specific time

### Phase 8: Social Features
- [ ] **Marathon leaderboards** - Longest marathons
- [ ] **Achievements** - "Binge Master" badges
- [ ] **Marathon invites** - Invite friends to join
- [ ] **Marathon chat** - Persistent chat across items

---

## Success Metrics

- **Adoption**: 30% of rooms use playlist feature
- **Engagement**: Average 3+ items per playlist
- **Retention**: Users stay through entire marathon
- **Completion**: 70%+ playlists complete without host leaving

---

## Conclusion

The playlist/marathon feature builds on existing infrastructure and provides significant value:

✅ **Foundation exists** - Data models already in place
✅ **Clear use cases** - Movie marathons, TV season binges
✅ **Scalable design** - Works for 2 items or 20+ episodes
✅ **Social enhancement** - Shared marathon experiences

**Estimated Timeline**: 6 weeks for full implementation
**Complexity**: Medium (leverages existing watch party system)
**User Value**: High (enables new use cases)

---

**Next Steps:**
1. Review and approve this plan
2. Implement Phase 1 (Database schema)
3. Build Phase 2 (Playlist creation UI)
4. Test with 2-3 movie marathon
5. Iterate based on feedback
