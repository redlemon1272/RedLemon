import SwiftUI

struct AdminDashboardView: View {
    @State private var logs: [AppLog] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        List {
            if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
            
            if isLoading {
                HStack {
                    Spacer()
                    ProgressView("Loading logs...")
                    Spacer()
                }
                .listRowSeparator(.hidden)
            } else if logs.isEmpty {
                Text("No logs found.")
                    .foregroundColor(.secondary)
            } else {
                ForEach(logs) { log in
                    LogEntryRow(log: log)
                }
            }
        }
        .navigationTitle("Admin Dashboard")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: fetchLogs) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .task {
            fetchLogs()
        }
    }
    
    private func fetchLogs() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                logs = try await SupabaseClient.shared.getAppLogs()
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}

struct LogEntryRow: View {
    let log: AppLog
    
    var levelColor: Color {
        switch log.level.uppercased() {
        case "ERROR": return .red
        case "WARNING": return .orange
        case "INFO": return .blue
        default: return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(log.level.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(levelColor.opacity(0.2))
                    .foregroundColor(levelColor)
                    .cornerRadius(4)
                
                Text(log.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                if let userId = log.userId {
                    Text(userId.uuidString.prefix(8))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .monospacedDigit()
                }
            }
            
            Text(log.message)
                .font(.body)
                .lineLimit(3)
            
            if let metadata = log.metadata, !metadata.isEmpty {
                Text(metadataDescription(metadata))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 4)
    }
    
    private func metadataDescription(_ metadata: [String: AnyCodable]) -> String {
        metadata.map { "\($0.key): \($0.value.value)" }.joined(separator: " | ")
    }
}
