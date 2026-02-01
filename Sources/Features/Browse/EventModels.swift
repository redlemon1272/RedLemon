import SwiftUI

struct EventItem: Identifiable, Equatable {
    let id: String
    let mediaItem: MediaItem
    let startTime: Date  // Just for ordering, not actual time
    let duration: TimeInterval  // Total event slot duration (includes buffer)
    let actualMovieDuration: TimeInterval  // Actual movie runtime (no buffer)
    let index: Int  // Position in the list (0 = live, 1-3 = upcoming)
    var participantCount: Int = 0  // Number of participants in the event room

    var endTime: Date {
        startTime.addingTimeInterval(duration)
    }

    // First event (index 0) is always "live", rest are upcoming
    var isLive: Bool {
        return index == 0
    }

    var isUpcoming: Bool {
        return index > 0
    }

    var isFinished: Bool {
        // Check if current time is past the movie's actual end time (not including buffer)
        // Subtract 10-minute tolerance to account for streams that are shorter than metadata
        // (e.g., metadata says 100min but actual stream is 90min)
        let now = TimeService.shared.now
        let toleranceBuffer: TimeInterval = 600 // 10 minutes
        let adjustedMovieDuration = max(0, actualMovieDuration - toleranceBuffer)
        let actualMovieEndTime = startTime.addingTimeInterval(adjustedMovieDuration)
        return now >= actualMovieEndTime
    }

    var isInLobby: Bool {
        // The next event (index 1) is in lobby when the current event (index 0) has finished
        // This happens during the 10-minute buffer period
        let now = TimeService.shared.now
        return index == 1 && now >= startTime.addingTimeInterval(-600) // 600s = 10 min buffer
    }
    
    // Equatable conformance
    static func == (lhs: EventItem, rhs: EventItem) -> Bool {
        return lhs.id == rhs.id && 
               lhs.startTime == rhs.startTime && 
               lhs.index == rhs.index &&
               lhs.participantCount == rhs.participantCount
    }
}
