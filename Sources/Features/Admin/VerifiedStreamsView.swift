import SwiftUI

struct VerifiedStreamsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Tab Selection
    enum AdminTab: String, CaseIterable, Identifiable {
        case verified = "Verified"
        case reported = "Reported"
        var id: String { self.rawValue }
    }
    @State private var selectedTab: AdminTab = .verified
    
    // Data Sources
    @State private var verifiedStreams: [SupabaseClient.VerifiedStream] = []
    @State private var reportedStreams: [SupabaseClient.ReportedStream] = []
    @State private var titles: [String: String] = [:]
    
    @State private var isLoading = false
    @State private var errorMessage: String?

    @State private var searchText = ""
    
    // Alert State
    @State private var showDeleteConfirmation = false
    @State private var streamToDelete: SupabaseClient.VerifiedStream?
    @State private var reportToDelete: SupabaseClient.ReportedStream?
    @State private var deleteVerificationFromReport = false
    
    // Computed Properties for Filtering
    var filteredVerified: [SupabaseClient.VerifiedStream] {
        if searchText.isEmpty { return verifiedStreams }
        return verifiedStreams.filter { stream in
            let title = titles[stream.imdbId]?.lowercased() ?? ""
            return stream.imdbId.localizedCaseInsensitiveContains(searchText) ||
                   title.localizedCaseInsensitiveContains(searchText) ||
                   stream.quality.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var filteredReported: [SupabaseClient.ReportedStream] {
        if searchText.isEmpty { return reportedStreams }
        return reportedStreams.filter { stream in
            let title = titles[stream.imdbId]?.lowercased() ?? ""
            return stream.imdbId.localizedCaseInsensitiveContains(searchText) ||
                   title.localizedCaseInsensitiveContains(searchText) ||
                   stream.reason.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Content Admin")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                Picker("Tab", selection: $selectedTab) {
                    ForEach(AdminTab.allCases) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
                
                Spacer()
                
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search by ID, Title, or Reason", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

            // Content
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
                Spacer()
            } else {
                if selectedTab == .verified {
                    if filteredVerified.isEmpty {
                        Text(searchText.isEmpty ? "No verified streams found." : "No matches found.")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        verifiedList
                    }
                } else { // selectedTab == .reported
                    if filteredReported.isEmpty {
                        Text(searchText.isEmpty ? "No reported streams found." : "No matches found.")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        reportedList
                    }
                }
            }
        }
        .task {
            await loadData()
        }
        .onChange(of: selectedTab) { _ in
            Task { await loadData() }
        }
        // Unified Alert
        .alert("Confirm Action", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Confirm", role: .destructive) {
                Task {
                    await executeDelete()
                }
            }
        } message: {
            if let _ = streamToDelete {
                Text("Are you sure you want to unlock this verified stream? It will force a re-scrape next time.")
            } else if let report = reportToDelete {
                if deleteVerificationFromReport {
                    Text("This will UNLOCK the verified stream associated with this report and dismiss the report. Proceed?")
                } else {
                    Text("This will dismiss the report but KEEP the verified stream active. Use this if the report is false. Proceed?")
                }
            } else {
                Text("Are you sure you want to perform this action?")
            }
        }
    }
    
    // MARK: - Lists
    
    var verifiedList: some View {
        List(filteredVerified, id: \.id) { stream in
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(titles[stream.imdbId] ?? stream.imdbId)
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.primary)
                        
                        if titles[stream.imdbId] == nil {
                            Text(stream.imdbId)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(stream.quality)
                            .font(.caption)
                            .padding(4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(4)
                    }
                    
                    Text("Hash: \(stream.hash)")
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .truncationMode(.middle)
                    
                    HStack {
                        Image(systemName: "hand.thumbsup.fill").foregroundColor(.green)
                        Text("\(stream.voteCount) votes")
                        
                        Spacer()
                        
                        Text(stream.lastVerifiedAt.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    .font(.caption)
                }
                
                Divider()
                
                Button(action: {
                    streamToDelete = stream
                    reportToDelete = nil
                    showDeleteConfirmation = true
                }) {
                    Image(systemName: "lock.open.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(8)
                }
                .buttonStyle(.borderless)
                .help("Unlock verified stream")
            }
            .padding(.vertical, 4)
            .task { if titles[stream.imdbId] == nil { await fetchTitle(for: stream.imdbId) } }
        }
    }
    
    var reportedList: some View {
        List(filteredReported, id: \.id) { report in
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    titleView(for: report.imdbId)
                    
                    Text(report.reason)
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    Text("Hash: \(report.streamHash)")
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .truncationMode(.middle)
                    
                    Text("Reported: \(report.createdAt.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Actions for Reports
                HStack(spacing: 12) {
                    Button(action: {
                        reportToDelete = report
                        streamToDelete = nil
                        deleteVerificationFromReport = false
                        showDeleteConfirmation = true
                    }) {
                        Text("Dismiss")
                            .font(.caption)
                            .padding(6)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(6)
                    }
                    .buttonStyle(.plain)
                    .help("Dismiss report (Keep stream verified)")
                    
                    Button(action: {
                        reportToDelete = report
                        streamToDelete = nil
                        deleteVerificationFromReport = true
                        showDeleteConfirmation = true
                    }) {
                        Label("Unlock & Fix", systemImage: "lock.open.fill")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.red)
                            .cornerRadius(6)
                    }
                    .buttonStyle(.plain)
                    .help("Unlock verified stream AND dismiss report")
                }
            }
            .padding(.vertical, 4)
            .task { if titles[report.imdbId] == nil { await fetchTitle(for: report.imdbId) } }
        }
    }
    
    func titleView(for imdbId: String) -> some View {
        HStack {
            Text(titles[imdbId] ?? imdbId)
                .font(.headline)
            
            if titles[imdbId] == nil {
                Text(imdbId).font(.caption).foregroundColor(.secondary)
            }
        }
    }
    
    // MARK: - Logic
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        do {
            if selectedTab == .verified {
                verifiedStreams = try await SupabaseClient.shared.getAllVerifiedStreams()
            } else {
                reportedStreams = try await SupabaseClient.shared.getReportedStreams()
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func executeDelete() async {
        do {
            if let stream = streamToDelete {
                // Just delete verify lock
                try await SupabaseClient.shared.deleteVerifiedStream(streamHash: stream.hash)
            } else if let report = reportToDelete {
                // Always delete report first/jointly
                try await SupabaseClient.shared.deleteReportedStream(id: report.id.uuidString)
                
                if deleteVerificationFromReport {
                    try await SupabaseClient.shared.deleteVerifiedStream(streamHash: report.streamHash)
                }
            }
            await loadData()
        } catch {
            errorMessage = "Action failed: \(error.localizedDescription)"
        }
    }
    
    private func fetchTitle(for imdbId: String) async {
        guard let url = URL(string: "https://v3-cinemeta.strem.io/meta/movie/\(imdbId).json") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MinimalCinemetaResponse.self, from: data)
            if let title = response.meta.name {
                await MainActor.run { titles[imdbId] = title }
            }
        } catch {
            print("Failed to fetch title: \(error)")
        }
    }
}

// Minimal decodables for title fetching
struct MinimalCinemetaResponse: Codable {
    let meta: MinimalCinemetaMeta
}

struct MinimalCinemetaMeta: Codable {
    let name: String?
}
