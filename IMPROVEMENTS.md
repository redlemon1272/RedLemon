# RedLemon - Areas for Improvement

This document outlines potential improvements and optimizations for the RedLemon codebase.

---

## 1. Error Handling & User Feedback

### Current Issues
- Silent error swallowing with `try?` in critical paths
- Network failures don't always surface to the user
- Some error messages are only in console logs

### Recommendations

#### Add User-Facing Error States
```swift
// Example: In EventsView
@State private var errorMessage: String?
@State private var showErrorAlert = false

// Instead of:
if let mediaItem = try? await apiClient.fetchMediaDetails(...)

// Do:
do {
    let mediaItem = try await apiClient.fetchMetadata(type: "series", id: series.id)
    // ... success path
} catch {
    await MainActor.run {
        errorMessage = "Failed to load \(series.title). Please check your connection."
        showErrorAlert = true
    }
}
```

#### Create Centralized Error Handler
```swift
// App/ErrorHandler.swift
@MainActor
class ErrorHandler: ObservableObject {
    @Published var currentError: AppError?
    @Published var showError = false

    func handle(_ error: Error, context: String) {
        // Log to analytics
        // Show user-friendly message
        // Retry logic if applicable
    }
}
```

**Priority**: Medium
**Impact**: Better user experience, easier debugging

---

## 2. Code Duplication

### Current Issues
- Metadata fetching logic duplicated across views
- Room creation logic repeated for events vs regular rooms
- Similar error handling patterns throughout

### Recommendations

#### Extract Metadata Service
```swift
// App/Services/MetadataService.swift
@MainActor
class MetadataService {
    private let apiClient: LocalAPIClient
    private let cache: CacheManager

    /// Fetch metadata with automatic caching and error handling
    func fetchMetadata(
        type: String,
        id: String,
        forceRefresh: Bool = false
    ) async throws -> MediaMetadata {
        // Centralized caching logic
        // Centralized error handling
        // Automatic retry logic
    }

    /// Pre-warm cache for multiple items
    func prewarmCache(items: [(type: String, id: String)]) async {
        await withTaskGroup(of: Void.self) { group in
            for item in items {
                group.addTask {
                    try? await self.fetchMetadata(type: item.type, id: item.id)
                }
            }
        }
    }
}
```

#### Unify Room Creation
```swift
// Models/RoomFactory.swift
struct RoomFactory {
    static func createEventRoom(
        eventId: String,
        mediaItem: MediaItem,
        season: Int?,
        episode: Int?
    ) async throws -> WatchPartyRoom {
        // Shared room creation logic
    }

    static func createWatchPartyRoom(
        hostId: String,
        mediaItem: MediaItem
    ) async throws -> WatchPartyRoom {
        // Shared room creation logic
    }
}
```

**Priority**: Medium
**Impact**: Easier maintenance, fewer bugs

---

## 3. Performance Optimizations

### Current Issues
- Some views load all data upfront
- Participant avatars could be lazy-loaded
- Large event lists could benefit from pagination

### Recommendations

#### Lazy Loading for Participant Avatars
```swift
// Models/Participant.swift
struct Participant: Identifiable {
    let id: String
    let name: String

    // Lazy-loaded avatar
    @MainActor
    func loadAvatar() async -> Image? {
        // Fetch only when needed
    }
}
```

#### Virtual Scrolling for Large Lists
```swift
// For event lists with 80+ movies
LazyVStack {
    ForEach(scheduledEvents) { event in
        EventRow(event: event)
            .onAppear {
                // Load metadata only when visible
            }
    }
}
```

#### Background Task Prioritization
```swift
// Use Task priorities for non-critical work
Task(priority: .background) {
    await updateParticipantCounts()
}

Task(priority: .userInitiated) {
    await loadTVEvents()
}
```

**Priority**: Low (already quite performant)
**Impact**: Smoother UI, lower memory usage

---

## 4. Testing Infrastructure

### Current Issues
- No unit tests visible in the codebase
- Complex logic (scheduling, sync) could benefit from tests
- Regression risk when making changes

### Recommendations

#### Add Unit Tests for Core Logic
```swift
// Tests/TVEventSchedulerTests.swift
import XCTest
@testable import RedLemon

class TVEventSchedulerTests: XCTestCase {
    func testDeterministicScheduling() {
        // Given a fixed epoch and series
        let series = TVEventData.allSeries[0]

        // When calculating current episode
        let result = TVEventScheduler.getCurrentEpisode(for: series)

        // Then it should be deterministic
        XCTAssertEqual(result.season, expectedSeason)
        XCTAssertEqual(result.episode, expectedEpisode)
    }

    func testEpisodeProgression() {
        // Test that episodes progress correctly
    }
}
```

#### Add Integration Tests for Sync
```swift
// Tests/WatchPartySyncTests.swift
class WatchPartySyncTests: XCTestCase {
    func testReadyGateWithMultipleGuests() async {
        // Simulate multiple guests joining
        // Verify ready gate logic
    }

    func testPlaybackSync() async {
        // Verify drift correction
        // Verify seek synchronization
    }
}
```

#### Add UI Tests for Critical Flows
```swift
// UITests/EventFlowTests.swift
class EventFlowTests: XCTestCase {
    func testJoinEventAndPlayback() {
        // Launch app
        // Navigate to events
        // Join event
        // Verify playback starts
    }
}
```

**Priority**: High (for long-term maintainability)
**Impact**: Catch regressions early, safer refactoring

---

## 5. Code Organization

### Current Issues
- Some files are quite large (800+ lines)
- Related functionality could be grouped better
- Some extensions could be in separate files

### Recommendations

#### Split Large ViewModels
```swift
// Instead of one 1800-line MPVPlayerViewModel.swift:

// MPVPlayerViewModel.swift (core state)
// MPVPlayerViewModel+Sync.swift (watch party sync)
// MPVPlayerViewModel+Subtitles.swift (subtitle management)
// MPVPlayerViewModel+Chat.swift (chat functionality)
```

#### Group Related Services
```
App/
  Services/
    Streaming/
      StreamService.swift
      StreamResolver.swift
      QualitySelector.swift
    Social/
      SocialService.swift
      PresenceManager.swift
      FriendsManager.swift
    Events/
      TVEventScheduler.swift
      MovieEventScheduler.swift
      EventCache.swift
```

**Priority**: Low (current organization is acceptable)
**Impact**: Easier navigation, better discoverability

---

## 6. Configuration & Environment Management

### Current Issues
- API keys and URLs might be hardcoded
- No clear dev/staging/prod environment separation

### Recommendations

#### Environment Configuration
```swift
// App/Config+Environment.swift
enum Environment {
    case development
    case staging
    case production

    static var current: Environment {
        #if DEBUG
        return .development
        #else
        return .production
        #endif
    }

    var supabaseURL: String {
        switch self {
        case .development: return "https://dev.supabase.co"
        case .staging: return "https://staging.supabase.co"
        case .production: return "https://prod.supabase.co"
        }
    }
}
```

#### Secrets Management
```swift
// Use .xcconfig files or environment variables
// Never commit API keys to git
// Use Keychain for sensitive data
```

**Priority**: Medium (important for security)
**Impact**: Better security, easier deployment

---

## 7. Logging & Observability

### Current Issues
- Lots of `print()` statements
- No structured logging
- Hard to filter logs by component

### Recommendations

#### Structured Logging
```swift
// App/Logger.swift
import os.log

extension Logger {
    static let networking = Logger(subsystem: "com.redlemon", category: "networking")
    static let playback = Logger(subsystem: "com.redlemon", category: "playback")
    static let sync = Logger(subsystem: "com.redlemon", category: "sync")
    static let events = Logger(subsystem: "com.redlemon", category: "events")
}

// Usage:
Logger.networking.info("Fetching metadata for \(imdbId)")
Logger.playback.error("Failed to load stream: \(error)")
```

#### Analytics Integration
```swift
// Track key user actions
Analytics.track(.eventJoined(eventId: event.id))
Analytics.track(.playbackStarted(mediaId: media.id))
Analytics.track(.watchPartyCreated(roomId: room.id))
```

**Priority**: Medium
**Impact**: Better debugging, usage insights

---

## 8. Accessibility

### Current Issues
- VoiceOver support could be improved
- Keyboard navigation might be incomplete
- Color contrast not verified

### Recommendations

#### Add Accessibility Labels
```swift
Button(action: joinEvent) {
    Image(systemName: "play.circle.fill")
}
.accessibilityLabel("Join event")
.accessibilityHint("Start watching this event")
```

#### Keyboard Shortcuts
```swift
.keyboardShortcut("c", modifiers: [.command])  // Toggle chat
.keyboardShortcut(.space)                       // Play/pause
.keyboardShortcut(.leftArrow)                   // Seek backward
```

**Priority**: Low (but important for inclusivity)
**Impact**: Better accessibility, wider user base

---

## Implementation Priority

### High Priority
1. **Testing Infrastructure** - Prevents regressions
2. **Error Handling** - Better user experience
3. **Configuration Management** - Security & deployment

### Medium Priority
4. **Code Duplication** - Maintainability
5. **Logging** - Debugging & monitoring
6. **Performance** - Already good, but can be better

### Low Priority
7. **Code Organization** - Nice to have
8. **Accessibility** - Important but not blocking

---

## Next Steps

1. **Start with testing** - Add tests for `TVEventScheduler` and sync logic
2. **Improve error handling** - Add user-facing error messages
3. **Extract common services** - Reduce duplication
4. **Add structured logging** - Replace `print()` statements
5. **Security audit** - Review API key management

---

*This document should be treated as a living roadmap. Update it as improvements are implemented.*
