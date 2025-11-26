//
//  TimeService.swift
//  RedLemon
//
//  Created by RedLemon Assistant
//

import Foundation

/// Service to provide trusted server time for event synchronization
/// Prevents issues where user's local clock is incorrect
class TimeService: ObservableObject {
    static let shared = TimeService()
    
    /// Offset between server time and local time (serverTime - localTime)
    /// Positive value means server is ahead
    @Published private(set) var timeOffset: TimeInterval = 0
    
    /// Last time we synced with server
    @Published private(set) var lastSyncTime: Date?
    
    /// Whether we have successfully synced at least once
    @Published private(set) var isSynced: Bool = false
    
    private init() {}
    
    /// Get the current trusted time (Server Time)
    /// Falls back to local Date() if not synced, but applies offset if available
    var now: Date {
        return Date().addingTimeInterval(timeOffset)
    }
    
    /// Synchronize with Supabase server time
    func sync() async {
        print("⏰ TimeService: Synchronizing clock with server...")
        
        do {
            // 1. Capture local start time (for RTT calculation)
            let startTime = Date()
            
            // 2. Fetch server time
            let serverTime = try await SupabaseClient.shared.getServerTime()
            
            // 3. Capture local end time
            let endTime = Date()
            
            // 4. Calculate Round Trip Time (RTT)
            let rtt = endTime.timeIntervalSince(startTime)
            
            // 5. Estimate server time at the moment of 'endTime'
            // We assume server generated response halfway through RTT
            let adjustedServerTime = serverTime.addingTimeInterval(rtt / 2)
            
            // 6. Calculate offset: Server - Local
            let newOffset = adjustedServerTime.timeIntervalSince(endTime)
            
            await MainActor.run {
                self.timeOffset = newOffset
                self.lastSyncTime = Date()
                self.isSynced = true
                print("✅ TimeService: Synced! Offset: \(String(format: "%.3f", newOffset))s (RTT: \(Int(rtt * 1000))ms)")
                print("   Local:  \(Date())")
                print("   Server: \(self.now)")
            }
        } catch {
            print("❌ TimeService: Sync failed: \(error)")
        }
    }
}
