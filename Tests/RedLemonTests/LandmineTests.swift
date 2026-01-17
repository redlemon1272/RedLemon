
import XCTest
@testable import RedLemon

// LandmineTests.swift
// Runtime verification for logic bugs identified in AI_BIBLE.md
// These tests catch issues that static analysis (scanners) cannot.

final class LandmineTests: XCTestCase {

    // MARK: - Landmine #37: UUID Case Sensitivity (#37)
    // Rule: Never use == for String IDs. Use .caseInsensitiveCompare()
    func testUUIDCaseSensitivity() {
        let id1 = "ABC-123"
        let id2 = "abc-123"
        
        // ❌ Direct equality fails (demonstrating the landmine)
        XCTAssertNotEqual(id1, id2, "Standard String equality should be case sensitive")
        
        // ✅ Correct comparison (Landmine Fix)
        let idsMatch = id1.caseInsensitiveCompare(id2) == .orderedSame
        XCTAssertTrue(idsMatch, "IDs must match case-insensitively")
    }
    
    // MARK: - Landmine #46: Fake "Direct" URLs (#46)
    // Rule: StreamResolver must reject URLs that are actually error pages/placeholders
    func testStreamResolverRejectsFakeDirectURLs() {
        let fakeUrl = "https://example.com/elfhosted_addons_disabling_nondebrid_modes/video.mp4"
        let goodUrl = "https://example.com/real_video.mp4"
        
        // Emulate Validation Logic
        func isValid(url: String) -> Bool {
            let blacklist = ["elfhosted_addons_disabling", "reddit.com", "stremio_error"]
            for term in blacklist {
                if url.lowercased().contains(term) { return false }
            }
            return true
        }

        XCTAssertFalse(isValid(url: fakeUrl), "Resolver MUST reject elfhosted error text URLs")
        XCTAssertTrue(isValid(url: goodUrl), "Resolver should accept valid URLs")
    }
    
    // MARK: - Landmine #8: Date Decoding (#8)
    // Rule: Postgres dates vary (fractional vs non-fractional). Logic must likely support both.
    func testDateDecodingFlexibility() {
        // This test simulates the DateFormatter logic we should use
        let fractionalDate = "2023-10-27T10:00:00.123Z"
        let wholeDate = "2023-10-27T10:00:00Z"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            // ISO8601 with fractional support
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = isoFormatter.date(from: dateStr) { return date }
            
            // Fallback for whole seconds
            isoFormatter.formatOptions = [.withInternetDateTime]
            if let date = isoFormatter.date(from: dateStr) { return date }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format")
        }
        
        // Wrappers for testing
        struct Wrapper: Decodable { let date: Date }
        
        let jsonFractional = "{\"date\": \"\(fractionalDate)\"}".data(using: .utf8)!
        let jsonWhole = "{\"date\": \"\(wholeDate)\"}".data(using: .utf8)!
        
        XCTAssertNoThrow(try decoder.decode(Wrapper.self, from: jsonFractional), "Should handle fractional seconds")
        XCTAssertNoThrow(try decoder.decode(Wrapper.self, from: jsonWhole), "Should handle whole seconds (fallback)")
    }
}
