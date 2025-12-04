import SwiftUI

struct AdminDashboardView: View {
    @State private var logs: [AppLog] = []
    @State private var userCount: Int = 0
    @State private var systemLatency: Double = 0
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        List {
            // Stats Section
            Section(header: Text("System Status")) {
                HStack {
                    StatusCard(title: "Users", value: "\(userCount)", icon: "person.2.fill", color: .blue)
                    StatusCard(title: "Latency", value: String(format: "%.0f ms", systemLatency), icon: "network", color: systemLatency > 500 ? .orange : .green)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            
            // Logs Section
            Section(header: Text("Recent Logs")) {
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
                } else if logs.isEmpty && errorMessage == nil {
                    Text("No logs found.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(logs) { log in
                        LogEntryRow(log: log)
                    }
                }
            }
        }
        .navigationTitle("Admin Dashboard")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: refreshData) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .task {
            refreshData()
        }
    }
    
    private func refreshData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                // Fetch logs
                logs = try await SupabaseClient.shared.getAppLogs()
                
                // Fetch stats
                async let count = SupabaseClient.shared.getUserCount()
                async let latency = SupabaseClient.shared.checkHealth()
                
                userCount = try await count
                systemLatency = try await latency
                
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .padding(4)
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
