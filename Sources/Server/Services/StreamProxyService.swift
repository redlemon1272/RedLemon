//
//  StreamProxyService.swift
//  RedLemon
//
//  Stream proxy helper for RealDebrid playback
//  Simplified - RealDebridClient already handles caching/unlocking
//

import Foundation
import Vapor

actor StreamProxyService {
    static let shared = StreamProxyService()
    
    private init() {
        print("✅ StreamProxyService initialized")
    }
    
    /// Get stream URL for a torrent hash and file index
    /// Uses RealDebridClient which handles caching and deduplication
    func getStreamURL(infoHash: String, fileIdx: Int, rdToken: String) async throws -> UnlockResult {
        print("🔓 Getting stream URL for \(infoHash):\(fileIdx)")
        
        // RealDebridClient.shared already handles caching and concurrent deduplication
        guard let result = try await RealDebridClient.shared.unlock(
            infoHash: infoHash,
            fileIdx: fileIdx,
            token: rdToken
        ) else {
            throw Abort(.serviceUnavailable, reason: "Failed to unlock stream")
        }
        
        print("✅ Got stream URL: \(result.url.prefix(60))...")
        return result
    }
}
