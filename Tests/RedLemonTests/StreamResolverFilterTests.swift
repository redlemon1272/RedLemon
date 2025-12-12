//
//  StreamResolverFilterTests.swift
//  RedLemonTests
//
//  Tests for stream filtering logic to prevent production bugs
//  like the .iso pattern matching "Prisoner" issue
//

import XCTest
@testable import RedLemon

final class StreamResolverFilterTests: XCTestCase {
    
    // MARK: - Bad Pattern Tests
    
    func testISOPatternShouldBlockActualISOFiles() {
        let titles = [
            "Movie.2020.iso",
            "Harry.Potter.2004.BDRip.iso",
            "Collection.ISO"
        ]
        
        for title in titles {
            XCTAssertTrue(shouldBlockBadPattern(title), "Should block ISO file: \(title)")
        }
    }
    
    func testISOPatternShouldNOTBlockMoviesWithISOInTitle() {
        // This test would have caught the "Prisoner" bug!
        let titles = [
            "Harry Potter and the Prisoner of Azkaban 1080p",
            "The Prisoner 2020 BluRay",
            "Edison 2005 720p",
            "Isola 2016 1080p",
            "Prison Break S01E01",
            "Comparison 2023 WEB-DL"
        ]
        
        for title in titles {
            XCTAssertFalse(shouldBlockBadPattern(title), "Should NOT block: \(title)")
        }
    }
    
    func testCAMPatternShouldBlockCAMRips() {
        let titles = [
            "Movie.2024.CAM.mkv",
            "New Release 2024 cam 720p",
            "Film.CAMRip.avi"
        ]
        
        for title in titles {
            XCTAssertTrue(shouldBlockBadPattern(title), "Should block CAM: \(title)")
        }
    }
    
    func testCAMPatternShouldNOTBlockLegitimateMovies() {
        let titles = [
            "The Cameraman 1928 BluRay",
            "Became 2023 WEB-DL",
            "Campaign 2012 1080p",
            "Camera Obscura 2017 720p"
        ]
        
        for title in titles {
            XCTAssertFalse(shouldBlockBadPattern(title), "Should NOT block: \(title)")
        }
    }
    
    func testTSPatternShouldBlockTeleSync() {
        let titles = [
            "Movie.2024.TS.mkv",
            "Release 2024 telesync 720p",
            "Film.HDTS.avi",
            "Movie.2024.file.ts" // TS extension
        ]
        
        for title in titles {
            XCTAssertTrue(shouldBlockBadPattern(title), "Should block TS: \(title)")
        }
    }
    
    func testTSPatternShouldNOTBlockNormalTitles() {
        let titles = [
            "Nights at Freddy's 2023 BluRay",
            "The Heights 2020 1080p",
            "Cats 2019 WEB-DL",
            "Lights Out 2016 720p",
            "Bats 1999 BluRay"
        ]
        
        for title in titles {
            XCTAssertFalse(shouldBlockBadPattern(title), "Should NOT block: \(title)")
        }
    }
    
    // MARK: - Audio Language Tests
    
    func testShouldBlockPortugueseDubbed() {
        let titles = [
            "Harry Potter Dublado 720p",
            "Movie 2024 dublado 1080p",
            "Film DUBLADO 5.1"
        ]
        
        for title in titles {
            XCTAssertFalse(hasAcceptableAudioLanguage(title), "Should block Portuguese: \(title)")
        }
    }
    
    func testShouldBlockSpanishDubbed() {
        let titles = [
            "Star Wars Doblado 1080p",
            "Movie Doblada 720p",
            "Film DOBLADO 5.1"
        ]
        
        for title in titles {
            XCTAssertFalse(hasAcceptableAudioLanguage(title), "Should block Spanish: \(title)")
        }
    }
    
    func testShouldBlockItalianDubbed() {
        let titles = [
            "Avengers Doppiato 1080p",
            "Movie DOPPIATO ITA"
        ]
        
        for title in titles {
            XCTAssertFalse(hasAcceptableAudioLanguage(title), "Should block Italian: \(title)")
        }
    }
    
    func testShouldAllowEnglishAudio() {
        let titles = [
            "Movie 2024 English 1080p",
            "Film.2023.ENG.BluRay",
            "Release 2024 en 720p",
            "Movie.2024.1080p.BluRay.x264-ENG"
        ]
        
        for title in titles {
            XCTAssertTrue(hasAcceptableAudioLanguage(title), "Should allow English: \(title)")
        }
    }
    
    func testShouldAllowMultiAudio() {
        let titles = [
            "Movie 2024 Multi 1080p",
            "Film Dual Audio BluRay",
            "Release 2024 MULTI 720p"
        ]
        
        for title in titles {
            XCTAssertTrue(hasAcceptableAudioLanguage(title), "Should allow Multi: \(title)")
        }
    }
    
    // MARK: - Real-World Regression Tests
    
    func testHarryPotterPrisonerShouldPass() {
        // The .iso bug - blocked "Prisoner" 1080p streams
        let titles = [
            "Harry Potter and the Prisoner of Azkaban 2004 1080p BluRay x265",
            "Harry.Potter.and.the.Prisoner.of.Azkaban.2004.1080p.BluRay.x264",
            "Harry Potter Prisoner of Azkaban 2004 720p"
        ]
        
        for title in titles {
            XCTAssertFalse(shouldBlockBadPattern(title), "Prisoner of Azkaban should NOT be blocked: \(title)")
            XCTAssertTrue(hasAcceptableAudioLanguage(title), "Should have acceptable audio: \(title)")
        }
    }
    
    func testFiveNightsAtFreddysShouldPass() {
        // The TS bug - " ts " pattern matches "Nigh**ts** at"
        let titles = [
            "Five Nights at Freddy's 2023 1080p BluRay",
            "Five.Nights.at.Freddys.2023.1080p.WEB-DL",
            "Nights at Freddy's 2023 720p"
        ]
        
        for title in titles {
            XCTAssertFalse(shouldBlockBadPattern(title), "Five Nights should NOT be blocked by TS filter: \(title)")
        }
    }

    func testScreamAudioFiltering() {
        // Regression: FiDELiO releases (French) were slipping through as "MULTi"
        let badStreams = [
            "Scream.1996.MULTi.1080p.BluRay.x264-FiDELiO.mkv",
            "Scream.1996.MULTi.VFF.1080p.BluRay.x264-FiDELiO.mkv",
            "Scream.1996.1080p.BluRay.TrueFrench.mkv"
        ]
        
        for title in badStreams {
             XCTAssertFalse(hasAcceptableAudioLanguage(title), "Should block French release: \(title)")
        }
        
        let goodStreams = [
            "Scream.1996.1080p.BluRay.DD+5.1.x264-NTb",
            "Scream.1996.2160p.UHD.BluRay.x265-SCARYMOVIE",
            "Scream.1996.UNCUT.720p.BluRay.H264.AAC-RARBG"
        ]
        
        for title in goodStreams {
             XCTAssertTrue(hasAcceptableAudioLanguage(title), "Should allow English release: \(title)")
        }
    }
    
    // MARK: - Helper Functions (Mirror StreamResolver logic)
    
    private func shouldBlockBadPattern(_ title: String) -> Bool {
        let titleLower = title.lowercased()
        let badPatterns = ["telesync", "hdcam", "hdtc", "dvdscr", "screener", "camrip"]
        
        // Check simple patterns
        for pattern in badPatterns {
            if titleLower.contains(pattern) {
                return true
            }
        }
        
        // CAM word boundary check
        if let regex = try? NSRegularExpression(pattern: "\\bcam\\b") {
            let range = NSRange(location: 0, length: titleLower.utf16.count)
            if regex.firstMatch(in: titleLower, options: [], range: range) != nil {
                return true
            }
        }
        
        // ISO word boundary or file extension check
        if let regex = try? NSRegularExpression(pattern: "\\biso\\b|\\.iso$") {
            let range = NSRange(location: 0, length: titleLower.utf16.count)
            if regex.firstMatch(in: titleLower, options: [], range: range) != nil {
                return true
            }
        }
        
        // TS file extension or word boundary check
        // Note: Also need to check for "hdts" pattern
        if let regex = try? NSRegularExpression(pattern: "\\bts\\b|\\.ts$|\\bhdts\\b") {
            let range = NSRange(location: 0, length: titleLower.utf16.count)
            if regex.firstMatch(in: titleLower, options: [], range: range) != nil {
                return true
            }
        }
        
        return false
    }
    
    private func hasAcceptableAudioLanguage(_ title: String) -> Bool {
        let lower = title.lowercased()
        
        // Check if explicitly marked as English
        let hasEnglish = lower.contains("english") ||
                        lower.contains(".eng.") || lower.contains(" eng ") ||
                        lower.contains("-eng-") || lower.hasSuffix(".eng") ||
                        lower.contains(".en.") || lower.contains(" en ") ||
                        lower.contains("-en-") || lower.hasSuffix(".en")
        if hasEnglish { return true }
        
        // Check for foreign language indicators
        let isForeign = lower.contains("french") ||
                       lower.contains("german") ||
                       lower.contains("spanish") ||
                       lower.contains("italian") ||
                       lower.contains("portuguese") ||
                       lower.contains("dublado") ||  // Portuguese
                       lower.contains("doblado") ||  // Spanish
                       lower.contains("doblada") ||  // Spanish feminine
                       lower.contains("doppiato") || // Italian
                       lower.contains("doublé") ||   // French
                       lower.contains("dablyazh")    // Russian
        
        // Check for French-specific audio indicators (VF = Version Française)
        let frenchAudioIndicators = [
            " vf ", ".vf.", "-vf-", "_vf_",  // Version Française
            " vff ", ".vff.", "-vff-",         // Version Française Française
            " vfq ", ".vfq.", "-vfq-",         // Version Française Québécoise
            " vf2 ", ".vf2.", "-vf2-",         // Version Française 2
            "vostfr",                             // Version Originale Sous-Titrée FRançais
            "truefrench",                         // TrueFrench (French audio)
            "rififi",                             // Known French release group
            "fidelio"                             // Known French release group
        ]
        let hasFrenchAudio = frenchAudioIndicators.contains { lower.contains($0) }
        
        if isForeign || hasFrenchAudio { return false }
        
        // Allow Multi/Dual audio
        let isMulti = lower.contains("multi") || lower.contains("dual")
        if isMulti { return true }
        
        return true // Default to acceptable if unknown
    }
}
