//
//  StreamServiceExtensionTests.swift
//  RedLemonTests
//
//  Tests for StreamService file extension and sample blocking logic.
//

import XCTest
@testable import RedLemon

final class StreamServiceExtensionTests: XCTestCase {

    func testShouldBlockStandardSampleFiles() {
        let blockedURLs = [
            "https://debrid.com/d/1234/movie.sample.mkv",
            "http://server.com/Something.2024.1080p-sample.mp4",
            "https://cdn.real-debrid.com/file/Margin.Call.2011.1080p.BluRay.x265-RARBG-sample.mkv",
            "https://test.com/file_sample.avi",
            "https://test.com/video.sample.qt"
        ]
        
        for url in blockedURLs {
            XCTAssertTrue(StreamService.shared.isBlockedFileExtension(url: url), "Should block sample file: \(url)")
        }
    }
    
    func testShouldBlockTrailerFiles() {
        let blockedURLs = [
            "https://debrid.com/d/1234/movie.trailer.mkv",
            "http://server.com/Something.2024.1080p_trailer.mp4",
            "https://cdn.real-debrid.com/file/Margin.Call.2011.trailer.mov"
        ]
        
        for url in blockedURLs {
            XCTAssertTrue(StreamService.shared.isBlockedFileExtension(url: url), "Should block trailer file: \(url)")
        }
    }

    func testShouldAllowValidVideoFiles() {
        let allowedURLs = [
            "https://debrid.com/d/1234/movie.mkv",
            "http://server.com/Something.2024.1080p.mp4",
            "https://cdn.real-debrid.com/file/Margin.Call.2011.1080p.BluRay.x265-RARBG.mkv",
            "https://test.com/my_cool_video.avi",
            // Edge cases: "sample" in title but not as extension delimiter (needs care, currently our logic is strict on delimiters)
            "https://test.com/The.Sampler.2024.mkv"
        ]
        
        for url in allowedURLs {
            XCTAssertFalse(StreamService.shared.isBlockedFileExtension(url: url), "Should allow valid file: \(url)")
        }
    }
    
    func testShouldBlockMalwareExtensions() {
        let blockedURLs = [
            "https://hack.com/game_of_thrones.exe",
            "http://bad.com/movie.iso", // ISO blocked by existing logic
            "https://test.com/script.vbs"
        ]
        
        for url in blockedURLs {
            XCTAssertTrue(StreamService.shared.isBlockedFileExtension(url: url), "Should block malware extension: \(url)")
        }
    }
    
    func testShouldBlockTorrentioPlaceholders() {
        let blockedURLs = [
            "https://torrentio.strem.fun/videos/failed_1234.mp4",
            "https://torrentio.strem.fun/videos/failed_conversion"
        ]
        
        for url in blockedURLs {
            XCTAssertTrue(StreamService.shared.isBlockedFileExtension(url: url), "Should block Torrentio placeholder: \(url)")
        }
    }
}
