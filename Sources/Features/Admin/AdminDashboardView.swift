import SwiftUI

struct AdminDashboardView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var appState: AppState
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
    
    // Grant Premium State
    @State private var grantUsername: String = ""
    @State private var grantDays: Int = 30
    @State private var isGranting = false
    @State private var grantMessage: String?

    // Event Debug State
    @State private var debugEventId: String = "tt2494362" // Default to 'Now You See Me' for convenience
    @State private var isResettingStream: Bool = false
    @State private var resetMessage: String?
    @State private var activeEventRooms: [SupabaseRoom] = [] // All active rooms starting with event_

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
                        
                        Button(action: {
                            Task {
                                isLoading = true
                                do {
                                    _ = try await EventsConfigService.shared.refreshConfig(type: "movie_events")
                                    refreshData()
                                } catch {
                                    errorMessage = "Failed to refresh: \(error.localizedDescription)"
                                }
                                isLoading = false
                            }
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.secondary)
                                .padding(6)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(6)
                        }
                        .buttonStyle(.plain)
                        .help("Force Refresh Schedule")
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
                
                // Grant Premium Section
                Section(header: Text("Grant Premium")) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                            Text("Grant Premium Status")
                                .font(.headline)
                        }
                        
                        Text("Grant unlimited hosting capabilities to a specific user.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            TextField("Username", text: $grantUsername)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                            
                            Menu {
                                Button("30 Days") { grantDays = 30 }
                                Button("90 Days") { grantDays = 90 }
                                Button("1 Year") { grantDays = 365 }
                                Button("Lifetime (100y)") { grantDays = 36500 }
                            } label: {
                                HStack {
                                    Text(durationLabel(for: grantDays))
                                    Image(systemName: "chevron.down")
                                        .font(.caption)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(4)
                            }
                            .buttonStyle(.plain)
                            
                            if isGranting {
                                ProgressView()
                                    .scaleEffect(0.7)
                            } else {
                                Button(action: grantPremium) {
                                    Text("Grant")
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(grantUsername.isEmpty ? Color.gray : Color.yellow)
                                        .cornerRadius(6)
                                }
                                .buttonStyle(.plain)
                                .disabled(grantUsername.isEmpty)
                            }
                        }
                        
                        if let msg = grantMessage {
                            Text(msg)
                                .font(.caption)
                                .foregroundColor(msg.contains("Error") ? .red : .green)
                        }
                    }
                    .padding(.vertical, 8)
                }

                // Event Debug Section
                Section(header: Text("Event Management")) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "exclamationmark.arrow.triangle.2.circlepath")
                                .foregroundColor(.orange)
                            Text("Reset Event Stream")
                                .font(.headline)
                        }
                        
                        Text("Clear locked stream for an event (forces re-resolution).")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Divider()
                            .padding(.vertical, 4)
                            
                        // Actual Database Room Status
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("Active Database Room:")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            if activeEventRooms.isEmpty {
                                Text("No active event rooms found.")
                                    .font(.caption)
                                    .italic()
                                    .foregroundColor(.secondary)
                            } else {
                                ForEach(activeEventRooms, id: \.id) { dbRoom in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(dbRoom.name)
                                                .fontWeight(.medium)
                                                .font(.system(size: 13))
                                            Text("\(dbRoom.id) • \(dbRoom.participantsCount) Active")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                                .monospacedDigit()
                                            
                                            Text("\(dbRoom.id) • \(dbRoom.participantsCount) Active")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                                .monospacedDigit()
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            debugEventId = dbRoom.id.replacingOccurrences(of: "event_", with: "") // populate input
                                            resetEventStream()
                                        }) {
                                            Text("Reset Stream")
                                                .font(.caption)
                                                .fontWeight(.medium)
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                                .background(Color.orange)
                                                .cornerRadius(4)
                                        }
                                        .buttonStyle(.plain)
                                        .disabled(isResettingStream)
                                    }
                                    .padding(8)
                                    .background(Color.orange.opacity(0.05))
                                    .cornerRadius(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                    )
                                }
                            }
                        }
                        
                        if let msg = resetMessage {
                            Text(msg)
                                .font(.caption)
                                .foregroundColor(msg.contains("Error") ? .red : .green)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                // Premium Users List
                Section(header: Text("Premium Users")) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                            Text("Active Premium Users")
                                .font(.headline)
                        }
                        
                        let premiumUsers = allUsers.filter { $0.isPremium == true }
                        
                        if premiumUsers.isEmpty {
                            Text("No premium users")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.vertical, 4)
                        } else {
                            ForEach(premiumUsers, id: \.id) { user in
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(user.username)
                                            .font(.system(size: 12, weight: .medium))
                                        if let expiry = fetchSubscriptionExpiry(for: user.username) {
                                            Text("Expires: \(formattedDate(expiry))")
                                                .font(.system(size: 10))
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        revokePremium(username: user.username)
                                    }) {
                                        Text("Revoke")
                                            .font(.system(size: 11))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.red)
                                            .cornerRadius(4)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(.vertical, 8)
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
                Section(header: HStack {
                    Text("Recent Logs")
                    Spacer()
                    Button(action: {
                        Task {
                            try? await SupabaseClient.shared.deleteAllAppLogs()
                            refreshData()
                        }
                    }) {
                        Label("Delete All", systemImage: "trash")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
                    .disabled(logs.isEmpty)
                }) {
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
                
                // Fetch actual active rooms
                let allRooms = try await SupabaseClient.shared.getAllRooms(limit: 50)
                
                // Identify Current Live Event
                if let (_, mediaItem) = EventsConfigService.shared.calculateLiveEvent(config: config) {
                    
                    // PRE-FILL the input with the CORRECT current event ID
                    debugEventId = mediaItem.id
                }
                
                // Show ALL active event rooms (any room starting with "event_")
                // This allows the admin to see if old/stale rooms (like "Fury") are still running
                activeEventRooms = allRooms.filter { $0.id.starts(with: "event_") }

            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    private func grantPremium() {
        guard !grantUsername.isEmpty else { return }
        guard let currentUserId = appState.currentUserId else {
            grantMessage = "Error: You must be logged in"
            return
        }
        isGranting = true
        grantMessage = nil
        
        Task {
            do {
                let message = try await SupabaseClient.shared.grantPremium(
                    callerUserId: currentUserId,
                    username: grantUsername,
                    days: grantDays
                )
                grantMessage = "Success: \(message)"
                grantUsername = "" // Clear input on success
                refreshData() // Refresh user list to see update
            } catch {
                grantMessage = "Error: \(error.localizedDescription)"
            }
            isGranting = false
        }
    }
    
    private func durationLabel(for days: Int) -> String {
        switch days {
        case 30: return "30 Days"
        case 90: return "90 Days"
        case 365: return "1 Year"
        case 36500: return "Lifetime (100y)"
        default: return "\\(days) Days"
        }
    }
    
    private func revokePremium(username: String) {
        guard let currentUserId = appState.currentUserId else {
            grantMessage = "Error: You must be logged in"
            return
        }
        
        Task {
            do {
                let message = try await SupabaseClient.shared.revokePremium(
                    callerUserId: currentUserId,
                    username: username
                )
                grantMessage = "Success: \(message)"
                refreshData()
            } catch {
                grantMessage = "Error: \(error.localizedDescription)"
            }
        }
    }
    
    private func resetEventStream() {
        guard !debugEventId.isEmpty else { return }
        isResettingStream = true
        resetMessage = nil
        
        Task { @MainActor in
            // Construct Room ID based on Event ID format: event_<imdb_id>
            let roomId = debugEventId.starts(with: "event_") ? debugEventId : "event_\(debugEventId)"
            let simpleId = roomId.replacingOccurrences(of: "event_", with: "")

            do {
                // 1. Fetch Event Name for better feedback
                var eventName = "Unknown Event"
                
                // Try from room state first (fastest if room exists)
                if let room = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                    eventName = room.name
                } else {
                    // Fallback: Fetch metadata from LocalAPIClient
                    // Assuming it's a movie since events are mostly movies, but could be series.
                    // We'll try "movie" default.
                    if let metadata = try? await LocalAPIClient.shared.fetchMetadata(type: "movie", id: simpleId) {
                        eventName = metadata.title
                    }
                }
                
                // 2. Reset Stream
                try await SupabaseClient.shared.resetRoomStream(roomId: roomId)
                
                // 3. Success Message
                resetMessage = "Success: Stream cleared for '\(eventName)' (\(roomId))."
                debugEventId = "" // Clear input on success
            } catch {
                resetMessage = "Error: \(error.localizedDescription)"
            }
            isResettingStream = false
        }
    }
    
    private func fetchSubscriptionExpiry(for username: String) -> Date? {
        return allUsers.first(where: { $0.username == username })?.subscriptionExpiresAt
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
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
