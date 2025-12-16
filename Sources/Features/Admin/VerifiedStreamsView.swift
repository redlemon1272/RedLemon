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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 800, minHeight: 600)
        .task(id: selectedTab) {
            await loadData()
        }
    }
    
    // MARK: - Data Loading
    
    private func loadData() async {
        isLoading = true
        do {
            switch selectedTab {
            case "streams":
                verifiedStreams = [] // Placeholder
                
            case "reported":
                 reportedStreams = try await SupabaseClient.shared.getReportedStreams()
                
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
    
    private var streamsList: some View {
        VStack {
            Text("Verified Streams Management")
                .font(.headline)
            Text("Search functionality to be added.")
                .foregroundColor(.secondary)
        }
    }
    
    private var reportedList: some View {
        List {
            ForEach(reportedStreams) { report in
                ReportedStreamRow(report: report)
            }
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(report.reason.capitalized)
                    .font(.headline)
                    .foregroundColor(.red)
                Spacer()
                Text(report.createdAt, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Text("IMDB: \(report.imdbId) | Hash: \(String(report.streamHash.prefix(8)))")
                .font(.caption.monospaced())
            

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
