//
//  VerifiedStreamsView.swift (Admin Dashboard)
//  RedLemon
//
//  Created by RedLemon Assistant on 2025-12-16.
//

import SwiftUI
import Foundation

struct VerifiedStreamsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = "streams"
    var isEmbedded: Bool = false
    @EnvironmentObject var appState: AppState // NEW
    
    // Data Storage
    @State private var verifiedStreams: [SupabaseClient.VerifiedStream] = []
    @State private var reportedStreams: [SupabaseClient.ReportedStream] = []
    @State private var blockedStreams: [SupabaseClient.BlockedStream] = [] // NEW
    @State private var feedbackReports: [FeedbackReport] = []
    @State private var isLoading = false
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            if !isEmbedded {
                // Header
                HStack {
                    Text("Content & Feedback Manager")
                        .font(.title2.bold())
                    Spacer()
                    Button("Close") { dismiss() }
                        .keyboardShortcut(.cancelAction)
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
            }
            
            // Tabs
            Picker("", selection: $selectedTab) {
                Text("Verified Streams").tag("streams")
                Text("Reported Streams").tag("reported")
                Text("Blocked Streams").tag("blocked") // NEW
                Text("Feedback").tag("feedback")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Content
            Group {
                if isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    currentContent
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: isEmbedded ? nil : 800, minHeight: isEmbedded ? nil : 600)
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure it fills the container in embedded mode
        .task(id: selectedTab) {
            await loadData()
            if selectedTab == "feedback" {
                appState.feedbackCount = 0
            }
        }
    }
    
    @ViewBuilder
    private var currentContent: some View {
        switch selectedTab {
        case "streams":
            streamsList
        case "reported":
            reportedList
        case "blocked":
            blockedList // NEW
        case "feedback":
            feedbackList
        default:
            Text("Unknown Tab")
        }
    }
    
    // MARK: - Data Loading
    
    private func loadData() async {
        isLoading = true
        do {
            switch selectedTab {
            case "streams":
                let rawStreams = try await SupabaseClient.shared.getAllVerifiedStreams(limit: 100)
                
                // Deduplicate by hash
                // Deduplicate by Hash + Season + Episode
                // (Files in season packs share the same hash but are distinct verified entries)
                var seenKeys = Set<String>()
                verifiedStreams = rawStreams.filter { stream in
                    let compositeKey = "\(stream.hash)_\(stream.season)_\(stream.episode)"
                    let isNew = !seenKeys.contains(compositeKey)
                    if isNew {
                        seenKeys.insert(compositeKey)
                    } else {
                        print("⚠️ Admin: Filtered duplicate stream entry: \(compositeKey)")
                    }
                    return isNew
                }
                // Trigger title resolution for legacy data
                Task { await resolveMissingTitles() }
                
            case "reported":
                 reportedStreams = try await SupabaseClient.shared.getReportedStreams()
                 
                 // Also fetch verified streams to show context (current vote counts)
                 async let vStreams = SupabaseClient.shared.getAllVerifiedStreams(limit: 500) // Fetch more to ensure coverage
                 verifiedStreams = try await vStreams
                 
                 // Trigger title resolution for legacy reports
                 Task { await resolveMissingReportedTitles() }
                
            case "blocked":
                 blockedStreams = try await SupabaseClient.shared.getBlockedStreams()
                 
            case "feedback":
                feedbackReports = try await SupabaseClient.shared.getFeedback()
                
            default: break
            }
        } catch {
            print("❌ Admin Load Error: \(error)")
        }
        isLoading = false
    }
    
    // MARK: - Views
    
    // MARK: - Views
    
    private var filteredStreams: [SupabaseClient.VerifiedStream] {
        if searchText.isEmpty {
            return verifiedStreams
        } else {
            return verifiedStreams.filter { stream in
                stream.imdbId.localizedCaseInsensitiveContains(searchText) ||
                (stream.movieTitle?.localizedCaseInsensitiveContains(searchText) ?? false)
            }
        }
    }

    private var streamsList: some View {
        VStack {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search by IMDB ID or Title", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            List {
                ForEach(filteredStreams) { stream in
                    VerifiedStreamRow(stream: stream) {
                        deleteStream(stream: stream)
                    }
                }
            }
        }
    }
    
    private func deleteStream(stream: SupabaseClient.VerifiedStream) {
        Task {
            do {
                try await SupabaseClient.shared.deleteVerifiedStream(streamHash: stream.hash)
                await loadData() // Reload list
            } catch {
                print("Failed to delete stream: \(error)")
            }
        }
    }
    
    // MARK: - Legacy Data Migration
    
    @State private var failedResolutionIds: Set<String> = []

    private func resolveMissingTitles() async {
        // Find streams with missing titles, excluding known failures
        let missing = verifiedStreams.filter { $0.movieTitle == nil && !failedResolutionIds.contains($0.imdbId) }
        guard !missing.isEmpty else { return }
        
        print("🔍 Found \(missing.count) streams with missing titles. Resolving...")
        
        let uniqueImdbIds = Set(missing.map { $0.imdbId })
        
        for imdbId in uniqueImdbIds {
            do {
                let isSeries = verifiedStreams.first(where: { $0.imdbId == imdbId })?.season != -1
                let type = isSeries ? "series" : "movie"
                
                let details = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: imdbId, type: type)
                let title = details.name
                
                print("✅ Resolved \(imdbId) -> \(title)")
                
                // 1. Optimistic Update (Update UI Immediately)
                verifiedStreams = verifiedStreams.map { stream in
                    if stream.imdbId == imdbId {
                        return SupabaseClient.VerifiedStream(
                            hash: stream.hash,
                            imdbId: stream.imdbId,
                            quality: stream.quality,
                            season: stream.season,
                            episode: stream.episode,
                            magnetLink: stream.magnetLink,
                            movieTitle: title, // set title
                            voteCount: stream.voteCount,
                            lastVerifiedAt: stream.lastVerifiedAt
                        )
                    } else {
                        return stream
                    }
                }
                
                // 2. Persist to DB (Fire and forget)
                Task {
                    await SupabaseClient.shared.updateVerifiedStreamTitle(imdbId: imdbId, title: title)
                }
                
            } catch {
                print("⚠️ Failed to resolve title for \(imdbId): \(error)")
                failedResolutionIds.insert(imdbId)
            }
        }
    }
    
    private func resolveMissingReportedTitles() async {
        // Find streams with missing titles, excluding known failures
        let missing = reportedStreams.filter { $0.movieTitle == nil && !failedResolutionIds.contains($0.imdbId) }
        guard !missing.isEmpty else { return }
        
        print("🔍 Found \(missing.count) reported streams with missing titles. Resolving...")
        
        let uniqueImdbIds = Set(missing.map { $0.imdbId })
        
        for imdbId in uniqueImdbIds {
            do {
                // Try fetching as movie first
                let details = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: imdbId, type: "movie")
                let title = details.name
                
                print("✅ Resolved Report \(imdbId) -> \(title)")
                
                // 1. Optimistic Update (Update UI Immediately)
                reportedStreams = reportedStreams.map { report in
                    if report.imdbId == imdbId {
                        return SupabaseClient.ReportedStream(
                            id: report.id,
                            imdbId: report.imdbId,
                            quality: report.quality,
                            streamHash: report.streamHash,
                            reason: report.reason,
                            createdAt: report.createdAt,
                            movieTitle: title // set title
                        )
                    } else {
                        return report
                    }
                }
                
                // 2. Persist to DB
                // We need to update specific entries
                let reportsToUpdate = missing.filter { $0.imdbId == imdbId }
                Task {
                    for report in reportsToUpdate {
                        await SupabaseClient.shared.updateReportedStreamTitle(id: report.id, title: title)
                    }
                }
                
            } catch {
                print("⚠️ Failed to resolve title for report \(imdbId): \(error)")
                failedResolutionIds.insert(imdbId)
            }
        }
    }
    
    private var reportedList: some View {
        List {
            ForEach(reportedStreams) { report in
                // Find matching verified stream for vote context
                let matchedStream = verifiedStreams.first(where: { $0.hash == report.streamHash })
                
                ReportedStreamRow(report: report, currentVoteCount: matchedStream?.voteCount, onBan: {
                    banStream(hash: report.streamHash, reportId: report.id)
                }, onBlock: { // NEW
                    blockStream(report: report)
                }, onDismiss: {
                    dismissReport(id: report.id)
                })
            }
        }
    }
    
    private func banStream(hash: String, reportId: UUID) {
        Task {
            do {
                print("🚫 Banning stream hash: \(hash) (Un-verifying)")
                try await SupabaseClient.shared.deleteVerifiedStream(streamHash: hash)
                await SupabaseClient.shared.deleteReport(id: reportId) // Auto-dismiss report after ban
                await loadData()
            } catch {
                print("❌ Failed to ban stream: \(error)")
            }
        }
    }
    
    private func blockStream(report: SupabaseClient.ReportedStream) {
        Task {
             do {
                 print("🛑 BLOCKING stream hash: \(report.streamHash)")
                // Parse reason for metadata
                 let (mainReason, _, dict) = parseReason(report.reason)
                 
                 // 1. Add to Blocked List
                 try await SupabaseClient.shared.blockStream(
                     hash: report.streamHash,
                     filename: dict["File"] ?? "Unknown File", 
                     provider: dict["Provider"],
                     reason: mainReason
                 )
                 
                 // 2. Also Un-verify (Ban) just in case
                 try? await SupabaseClient.shared.deleteVerifiedStream(streamHash: report.streamHash)
                 
                 // 3. Dismiss Report
                 await SupabaseClient.shared.deleteReport(id: report.id)
                 
                 await loadData()
             } catch {
                 print("❌ Failed to block stream: \(error)")
             }
        }
    }
    
    // NEW: Blocked Streams List
    private var blockedList: some View {
        List {
            if blockedStreams.isEmpty {
                Text("No blocked streams found.")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                ForEach(blockedStreams) { stream in
                    BlockedStreamRow(stream: stream, onUnblock: {
                        unblockStream(hash: stream.streamHash)
                    })
                }
            }
        }
    }
    
    private func unblockStream(hash: String) {
        Task {
            do {
                try await SupabaseClient.shared.unblockStream(hash: hash)
                await loadData()
            } catch {
                print("❌ Failed to unblock: \(error)")
            }
        }
    }
    
    private func dismissReport(id: UUID) {
        Task {
            await SupabaseClient.shared.deleteReport(id: id)
            await loadData()
        }
    }
    
    private func deleteFeedback(id: UUID) {
        Task {
            await SupabaseClient.shared.deleteFeedback(id: id)
            await loadData()
        }
    }
    
    private func deleteSessionLog(id: UUID) {
        Task {
            await SupabaseClient.shared.deleteSessionLog(id: id)
            await loadData()
        }
    }
    
    private var feedbackList: some View {
        List {
            ForEach(feedbackReports) { feedback in
                FeedbackRow(feedback: feedback, onDelete: {
                    deleteFeedback(id: feedback.id)
                })
            }
        }
    }
    

}

// MARK: - Subviews

struct ReportedStreamRow: View {
    let report: SupabaseClient.ReportedStream
    let currentVoteCount: Int? // NEW
    let onBan: () -> Void
    let onBlock: () -> Void 
    let onDismiss: () -> Void
    
    // Helper to extract metadata
    // Returns (MainReason, [Metadata Strings], [Metadata Key:Value])
    private var reasonParts: (main: String, metadata: [String], dict: [String:String]) {
        return parseReason(report.reason)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(report.movieTitle ?? "IMDB: \(report.imdbId)")
                        .font(.headline)
                        .foregroundColor(report.movieTitle == nil ? .primary : .primary)
                    
                    if let _ = report.movieTitle {
                        Text(report.imdbId)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    Text(report.createdAt, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text(reasonParts.main.capitalized)
                        .font(.caption.bold())
                        .foregroundColor(.red)
                    
                    Text("|")
                        .foregroundColor(.secondary)
                    
                    Text(report.quality)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Display Metadata
                if !reasonParts.metadata.isEmpty {
                     VStack(alignment: .leading, spacing: 2) {
                         ForEach(reasonParts.metadata, id: \.self) { meta in
                             Text(meta)
                                 .font(.caption2)
                                 .foregroundColor(.secondary)
                         }
                     }
                }
                
                Text( "Hash: \(String(report.streamHash.prefix(8)))")
                    .font(.caption2.monospaced())
                    .foregroundColor(.secondary)
                
                // Show Vote Count Impact
                if let votes = currentVoteCount {
                    HStack(spacing: 4) {
                        Image(systemName: "chart.bar.fill")
                        Text("Current Score: \(votes)")
                            .font(.body.weight(.bold))
                    }
                    .font(.caption)
                    .foregroundColor(votes < 0 ? .red : .green)
                    .padding(.top, 2)
                }
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                // Ban Button (Unverify)
                Button(action: onBan) {
                    VStack(spacing: 2) {
                        Image(systemName: "flag.slash")
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                        Text("Unverify")
                            .font(.caption2)
                            .foregroundColor(.orange)
                    }
                }
                .buttonStyle(.plain)
                .help("Remove 'Verified' status (Soft Ban)")
                
                // Block Button (Blacklist)
                Button(action: onBlock) {
                    VStack(spacing: 2) {
                        Image(systemName: "hand.raised.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                        Text("Block")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                }
                .buttonStyle(.plain)
                .help("Permanently Block Stream (Blacklist)")
                
                // Dismiss Button
                Button(action: onDismiss) {
                    VStack(spacing: 2) {
                        Image(systemName: "trash")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                        Text("Dismiss")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .buttonStyle(.plain)
                .help("Dismiss report (Keep stream)")
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}

struct Badge: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(4)
    }
}

struct FeedbackRow: View {
    let feedback: FeedbackReport
    var onDelete: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Badge(text: feedback.type, color: colorForType(feedback.type))
                Spacer()
                Text(feedback.createdAt, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(feedback.createdAt, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(feedback.message)
                .font(.body)
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(8)
            
            HStack {
                if let email = feedback.contactEmail {
                    HStack {
                        Image(systemName: "envelope")
                        Text(email)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Delete Button
                if let onDelete = onDelete {
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Delete Feedback")
                    .padding(.trailing, 8)
                }
                
                if let sessionLogId = feedback.sessionLogId {
                    Button(action: {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(sessionLogId.uuidString, forType: .string)
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "doc.on.doc")
                            Text("Copy Session ID")
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                    .help("Search this ID in Logs section")
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private func colorForType(_ type: String) -> Color {
        switch type.lowercased() {
        case "bug": return .red
        case "stream issue": return .orange
        case "feature request": return .green
        default: return .blue
        }
    }
}



struct VerifiedStreamRow: View {
    let stream: SupabaseClient.VerifiedStream
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(stream.movieTitle ?? stream.imdbId)
                        .font(.headline)
                    if let _ = stream.movieTitle {
                        Text(stream.imdbId)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    Text(stream.quality)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(4)
                        .font(.caption.bold())
                    
                    if stream.season != -1 {
                        Text("S\(stream.season) E\(stream.episode)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        Text("Movie")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Votes: \(stream.voteCount)")
                        .font(.caption)
                        .foregroundColor(stream.voteCount < 0 ? .red : .green)
                }
                
                Text(stream.hash)
                    .font(.caption2.monospaced())
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
}

struct BlockedStreamRow: View {
    let stream: SupabaseClient.BlockedStream
    let onUnblock: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
               
                HStack {
                    Text("BLOCKED STREAM")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.red)
                        .cornerRadius(4)
                    
                    Text(stream.createdAt, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                if let reason = stream.reason {
                    Text(reason)
                        .font(.headline)
                        .foregroundColor(.red)
                }
                
                if let provider = stream.provider {
                    Text("Provider: \(provider)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                if let filename = stream.filename {
                    Text("File: \(filename)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
                
                Text("Hash: \(stream.streamHash)")
                    .font(.caption2.monospaced())
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: onUnblock) {
                VStack(spacing: 2) {
                    Image(systemName: "lock.open.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.green)
                    Text("Unblock")
                        .font(.caption2)
                        .foregroundColor(.green)
                }
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
}

// Helper function global to the file
private func parseReason(_ reason: String) -> (main: String, metadata: [String], dict: [String:String]) {
    let parts = reason.components(separatedBy: "\n")
    let main = parts.first ?? "Unknown"
    
    var meta: [String] = []
    var dict: [String:String] = [:]
    
    for part in parts.dropFirst() {
        if part.hasPrefix("[") && part.hasSuffix("]") {
            meta.append(part)
            
            // Try to extract key-value
            let content = String(part.dropFirst().dropLast())
            let kv = content.components(separatedBy: ": ")
            if kv.count == 2 {
                dict[kv[0]] = kv[1]
            }
        }
    }
    return (main, meta, dict)
}

