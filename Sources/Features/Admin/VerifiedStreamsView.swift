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
    
    // Data Storage
    @State private var verifiedStreams: [SupabaseClient.VerifiedStream] = []
    @State private var reportedStreams: [SupabaseClient.ReportedStream] = []
    @State private var feedbackReports: [SupabaseClient.FeedbackReport] = []
    @State private var sessionLogs: [SessionLog] = []
    @State private var isLoading = false
    @State private var highlightedLogId: UUID?
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
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
            
            // Tabs
            Picker("", selection: $selectedTab) {
                Text("Verified Streams").tag("streams")
                Text("Reported Streams").tag("reported")
                Text("Feedback").tag("feedback")
                Text("Session Logs").tag("logs")
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
        .frame(minWidth: 800, minHeight: 600)
        .task(id: selectedTab) {
            await loadData()
        }
    }
    
    @ViewBuilder
    private var currentContent: some View {
        switch selectedTab {
        case "streams":
            streamsList
        case "reported":
            reportedList
        case "feedback":
            feedbackList
        case "logs":
            logsList
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
                verifiedStreams = try await SupabaseClient.shared.getAllVerifiedStreams()
                // Trigger title resolution for legacy data
                Task { await resolveMissingTitles() }
                
            case "reported":
                 reportedStreams = try await SupabaseClient.shared.getReportedStreams()
                 // Trigger title resolution for legacy reports
                 Task { await resolveMissingReportedTitles() }
                
            case "feedback":
                feedbackReports = try await SupabaseClient.shared.getFeedback()
                
            case "logs":
                sessionLogs = try await SupabaseClient.shared.getSessionLogs()
                
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
                ReportedStreamRow(report: report, onBan: {
                    banStream(hash: report.streamHash, reportId: report.id)
                }, onDismiss: {
                    dismissReport(id: report.id)
                })
            }
        }
    }
    
    private func banStream(hash: String, reportId: UUID) {
        Task {
            do {
                print("🚫 Banning stream hash: \(hash)")
                try await SupabaseClient.shared.deleteVerifiedStream(streamHash: hash)
                await SupabaseClient.shared.deleteReport(id: reportId) // Auto-dismiss report after ban
                await loadData()
            } catch {
                print("❌ Failed to ban stream: \(error)")
            }
        }
    }
    
    private func dismissReport(id: UUID) {
        Task {
            await SupabaseClient.shared.deleteReport(id: id)
            await loadData()
        }
    }
    
    private var feedbackList: some View {
        List {
            ForEach(feedbackReports) { feedback in
                FeedbackRow(feedback: feedback, onViewLog: { logId in
                    highlightedLogId = logId
                    selectedTab = "logs"
                })
            }
        }
    }
    
    private var logsList: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(sessionLogs) { log in
                    SessionLogRow(log: log, isHighlighted: log.id == highlightedLogId)
                        .id(log.id)
                }
            }
            .onChange(of: highlightedLogId) { id in
                if let id = id {
                    withAnimation {
                        proxy.scrollTo(id, anchor: .top)
                    }
                }
            }
            .onAppear {
                 if let id = highlightedLogId {
                     withAnimation {
                         proxy.scrollTo(id, anchor: .top)
                     }
                 }
            }
        }
    }
}

// MARK: - Subviews

struct ReportedStreamRow: View {
    let report: SupabaseClient.ReportedStream
    let onBan: () -> Void
    let onDismiss: () -> Void
    
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
                    Text(report.reason.capitalized)
                        .font(.caption.bold())
                        .foregroundColor(.red)
                    
                    Text("|")
                        .foregroundColor(.secondary)
                    
                    Text(report.quality)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text("Hash: \(String(report.streamHash.prefix(8)))")
                    .font(.caption2.monospaced())
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                // Ban Button
                Button(action: onBan) {
                    VStack(spacing: 2) {
                        Image(systemName: "xmark.octagon.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                        Text("Ban")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                }
                .buttonStyle(.plain)
                .help("Delete verified stream (Ban)")
                
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
    let feedback: SupabaseClient.FeedbackReport
    var onViewLog: ((UUID) -> Void)?
    
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
                
                if let sessionLogId = feedback.sessionLogId {
                    Button(action: { onViewLog?(sessionLogId) }) {
                        HStack(spacing: 4) {
                            Image(systemName: "doc.text")
                            Text("View Log")
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
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

struct SessionLogRow: View {
    let log: SessionLog
    let isHighlighted: Bool
    @State private var isExpanded = false
    
    init(log: SessionLog, isHighlighted: Bool = false) {
        self.log = log
        self.isHighlighted = isHighlighted
        _isExpanded = State(initialValue: isHighlighted)
    }
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(log.events, id: \.timestamp) { event in
                    LogEventRow(event: event)
                }
            }
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(8)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(log.sessionId.uuidString.prefix(8))
                        .font(.headline.monospaced())
                    Text(log.platform + " | " + log.appVersion)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                if isHighlighted {
                   Text("LINKED LOG")
                       .font(.caption.bold())
                       .foregroundColor(.white)
                       .padding(.horizontal, 6)
                       .padding(.vertical, 2)
                       .background(Color.blue)
                       .cornerRadius(4)
                }
                
                Text(log.createdAt, style: .time)
                    .font(.caption)
            }
        }
        .padding(4)
        .background(isHighlighted ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}

struct LogEventRow: View {
    let event: SessionEvent
    
    var body: some View {
        HStack(alignment: .top) {
            Text(event.timestamp, style: .time)
                .font(.caption.monospaced())
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)
            
            Text("[\(event.category.rawValue)]")
                .font(.caption.monospaced())
                .foregroundColor(.blue)
                .frame(width: 80, alignment: .leading)
            
            Text(event.message)
                .font(.caption)
        }
        if let meta = event.metadata {
            Text("\(meta.description)")
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.leading, 160)
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
                        .foregroundColor(.green)
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

