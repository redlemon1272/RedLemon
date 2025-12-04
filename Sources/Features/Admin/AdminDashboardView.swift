import SwiftUI

struct AdminDashboardView: View {
    @Binding var isPresented: Bool
    @State private var logs: [AppLog] = []
    @State private var activeRooms: [SupabaseRoom] = []
    @State private var allUsers: [SupabaseUser] = []
    @State private var versionStats: [AppVersionStat] = []
    @State private var contentStats: [ContentPopularityStat] = []
    @State private var userCount: Int = 0
    @State private var systemLatency: Double = 0
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 0) {
            // Custom Window Header
            HStack {
                Text("Admin Dashboard")
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

                Button("Close") {
                    isPresented = false
                }
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))

            Divider()

            // Stats Header
            HStack(spacing: 16) {
                StatusCard(title: "Users", value: "\(userCount)", icon: "person.2.fill", color: .blue)
                StatusCard(title: "Latency", value: String(format: "%.0f ms", systemLatency), icon: "network", color: systemLatency > 500 ? .orange : .green)
                Spacer() // Push to left, but fill width
            }
            .padding()
            .frame(maxWidth: .infinity) // Force full width
            .background(Color(NSColor.controlBackgroundColor))

            Divider()

            // Active Rooms Section
            if !activeRooms.isEmpty {
                List {
                    Section(header: Text("Active Rooms (\(activeRooms.count))")) {
                        ForEach(activeRooms, id: \.id) { room in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(room.name)
                                        .font(.headline)
                                    Text("Host: \(room.hostUsername)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "person.2.fill")
                                        Text("\(room.participantsCount)")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    
                                    if room.isPlaying {
                                        Text("Playing")
                                            .font(.caption2)
                                            .foregroundColor(.green)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Color.green.opacity(0.1))
                                            .cornerRadius(4)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .frame(height: 200) // Limit height for this section
                
                Divider()
            }

            // User Management Section
            if !allUsers.isEmpty {
                 List {
                     Section(header: Text("Users (\(allUsers.count))")) {
                         ForEach(allUsers, id: \.id) { user in
                             HStack {
                                 VStack(alignment: .leading) {
                                     Text(user.username)
                                         .font(.headline)
                                     Text("Joined: \(user.createdAt, style: .date)")
                                         .font(.caption)
                                         .foregroundColor(.secondary)
                                 }
                                 
                                 Spacer()
                                 
                                 VStack(alignment: .trailing) {
                                     if let isAdmin = user.isAdmin, isAdmin {
                                         Text("Admin")
                                             .font(.caption2)
                                             .fontWeight(.bold)
                                             .foregroundColor(.white)
                                             .padding(.horizontal, 6)
                                             .padding(.vertical, 2)
                                             .background(Color.blue)
                                             .cornerRadius(4)
                                     }
                                     
                                     Text("Last seen: \(user.lastSeen, style: .relative) ago")
                                         .font(.caption)
                                         .foregroundColor(.secondary)
                                 }
                             }
                             .padding(.vertical, 4)
                         }
                     }
                 }
                 .frame(height: 200)
                 
                 Divider()
            }

            // Analytics Section
            if !versionStats.isEmpty || !contentStats.isEmpty {
                HStack(alignment: .top, spacing: 16) {
                    // App Versions
                    VStack(alignment: .leading) {
                        Text("App Versions")
                            .font(.headline)
                        ForEach(versionStats) { stat in
                            HStack {
                                Text(stat.version ?? "Unknown")
                                Spacer()
                                Text("\(stat.count)")
                                    .foregroundColor(.secondary)
                            }
                            .font(.caption)
                        }
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                    
                    // Content Popularity
                    VStack(alignment: .leading) {
                        Text("Top Content")
                            .font(.headline)
                        ForEach(contentStats) { stat in
                            HStack {
                                Text(stat.title)
                                    .lineLimit(1)
                                Spacer()
                                Text("\(stat.count)")
                                    .foregroundColor(.secondary)
                            }
                            .font(.caption)
                        }
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Divider()
            }

            // Logs List
            List {
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Force full size
        .background(Color(NSColor.windowBackgroundColor))
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
                async let rooms = SupabaseClient.shared.getActiveRooms()
                async let users = SupabaseClient.shared.getAllUsers()
                async let versions = SupabaseClient.shared.getAppVersionStats()
                async let content = SupabaseClient.shared.getContentPopularity()
                
                userCount = try await count
                systemLatency = try await latency
                activeRooms = try await rooms
                allUsers = try await users
                versionStats = try await versions
                contentStats = try await content

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
