import Foundation

/// Shared constants for Event Scheduling to ensure the UI (EventsView) and 
/// Logic (EventsConfigService/Player) remain perfectly synchronized.
struct ScheduleConstants {
    /// The fixed Anchor Date for deterministic schedule calculation.
    /// Matches the hardcoded value originally used in EventsView.
    /// Reference: 2024-01-01 00:00:00 UTC (1704067200)
    static let Epoch = Date(timeIntervalSince1970: 1704067200)
    
    /// Default buffer between movies if specific config is missing
    static let DefaultBuffer: TimeInterval = 600 // 10 minutes
}
