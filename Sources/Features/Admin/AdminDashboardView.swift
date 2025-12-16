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
    @State private var eventConfigVersion: Int?
    @State private var eventConfigMovieCount: Int?
    @State private var isShowingScheduleManagement = false
    @State private var isShowingVerifiedStreams = false

    var body: some View {
        VStack(spacing: 0) {
            // Custom Window Header
            HStack {
                Text("Admin Dashboard")
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

                Button(action: {
                    isPresented = false
                }) {
                    Text("Done")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor)) // Slightly different background

            // Main Content List
            List {
                // Event Configuration Section
                Section(header: Text("Event Configuration")) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Movie Schedule")
                                .font(.headline)
                            if let version = eventConfigVersion {
                                Text("Version: \(version)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            if let count = eventConfigMovieCount {
                                Text("Movies: \(count)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isShowingScheduleManagement = true
                        }) {
                            Text("Manage Schedule")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.blue)
                                .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical, 4)
                }

                // Content & Feedback Section
                Section(header: Text("Content & Feedback")) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Content Manager")
                                .font(.headline)
                            Text("Verified Streams, Feedback & Logs")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isShowingVerifiedStreams = true
                        }) {
                            Text("View List")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.green)
                                .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical, 4)
                }

                // Stats Section
                Section {
                    HStack(spacing: 16) {
                        StatusCard(title: "Users", value: "\(userCount)", icon: "person.2.fill", color: .blue)
                        StatusCard(title: "Latency", value: String(format: "%.0f ms", systemLatency), icon: "network", color: systemLatency > 500 ? .orange : .green)
                    }
                    .padding(.vertical, 8)
                } header: {
                    Text("System Status")
                }

                // Active Rooms Section
                if !activeRooms.isEmpty {
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

                // User Management Section
                if !allUsers.isEmpty {
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

                // Analytics Section
                if !versionStats.isEmpty || !contentStats.isEmpty {
                    Section(header: Text("Analytics")) {
                        HStack(alignment: .top, spacing: 16) {
                            // App Versions
                            VStack(alignment: .leading) {
                                Text("App Versions")
                                    .font(.headline)
                                    .padding(.bottom, 4)
                                ForEach(versionStats) { stat in
                                    HStack {
                                        Text(stat.version ?? "Unknown")
                                        Spacer()
                                        Text("\(stat.count)")
                                            .foregroundColor(.secondary)
                                    }
                                    .font(.caption)
                                    .padding(.vertical, 2)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                            
                            // Content Popularity
                            VStack(alignment: .leading) {
                                Text("Top Content")
                                    .font(.headline)
                                    .padding(.bottom, 4)
                                ForEach(contentStats) { stat in
                                    HStack {
                                        Text(stat.title)
                                            .lineLimit(1)
                                        Spacer()
                                        Text("\(stat.count)")
                                            .foregroundColor(.secondary)
                                    }
                                    .font(.caption)
                                    .padding(.vertical, 2)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, 8)
                    }
                }

                // Logs List
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
            .listStyle(InsetListStyle()) // Use InsetListStyle for a cleaner look inside the window
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Force full size
        .background(Color(NSColor.windowBackgroundColor))
        .sheet(isPresented: $isShowingScheduleManagement) {
            ScheduleManagementView(isPresented: $isShowingScheduleManagement)
        }
        .sheet(isPresented: $isShowingVerifiedStreams) {
            VerifiedStreamsView()
                .frame(minWidth: 600, minHeight: 400)
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
                async let rooms = SupabaseClient.shared.getActiveRooms()
                async let users = SupabaseClient.shared.getAllUsers()
                async let versions = SupabaseClient.shared.getAppVersionStats()
                async let content = SupabaseClient.shared.getContentPopularity()
                
                // Fetch Event Config
                async let eventConfig = EventsConfigService.shared.fetchMovieEventsConfig()
                
                userCount = try await count
                systemLatency = try await latency
                activeRooms = try await rooms
                allUsers = try await users
                versionStats = try await versions
                contentStats = try await content
                
                let config = try await eventConfig
                eventConfigVersion = config.version
                eventConfigMovieCount = config.movies.count

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
                
                // Action Buttons
                HStack(spacing: 12) {
                    Button(action: {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(log.message, forType: .string)
                    }) {
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Copy Message")
                    
                    Button(action: {
                        Task {
                            await SupabaseClient.shared.deleteAppLog(id: log.id)
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
                    .help("Delete Log")
                }
                .padding(.leading, 8)
            }

            Text(log.message)
                .font(.body)
                .lineLimit(3)
                .textSelection(.enabled) // Allow text selection

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
