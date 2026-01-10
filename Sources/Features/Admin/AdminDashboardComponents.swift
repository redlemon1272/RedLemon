import SwiftUI

// MARK: - Navigation Enum
enum AdminCategory: String, CaseIterable, Identifiable {
    case overview = "Overview"
    case users = "Users"
    case payments = "Payments"
    case events = "Events"
    case server = "Server"
    case logs = "Logs"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .overview: return "chart.bar.fill"
        case .users: return "person.2.fill"
        case .payments: return "dollarsign.circle.fill"
        case .events: return "play.tv.fill"
        case .server: return "server.rack"
        case .logs: return "list.bullet.rectangle.portrait"
        }
    }
}

// MARK: - Admin Overview View
struct AdminOverviewView: View {
    let userCount: Int
    let zileanCount: Int
    let systemLatency: Double
    let versionStats: [AppVersionStat]
    let contentStats: [ContentPopularityStat]
    var onRefresh: (() -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // System Status
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("System Status")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        if let onRefresh = onRefresh {
                            Button(action: onRefresh) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.secondary)
                            }
                            .buttonStyle(.plain)
                            .help("Refresh Data")
                        }
                    }
                    
                    HStack(spacing: 16) {
                        StatusCard(title: "Users", value: "\(userCount)", icon: "person.2.fill", color: .blue)
                        StatusCard(title: "Zilean Torrents", value: "\(zileanCount.formatted())", icon: "magnifyingglass.circle.fill", color: .purple)
                        StatusCard(title: "Latency", value: String(format: "%.0f ms", systemLatency), icon: "network", color: systemLatency > 500 ? .orange : .green)
                    }
                }
                
                Divider()
                
                // Analytics
                VStack(alignment: .leading, spacing: 16) {
                    Text("Analytics")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack(alignment: .top, spacing: 24) {
                        // App Versions
                        VStack(alignment: .leading) {
                            Text("App Versions")
                                .font(.headline)
                                .padding(.bottom, 8)
                            
                            if versionStats.isEmpty {
                                Text("No version data")
                                    .foregroundColor(.secondary)
                            } else {
                                ForEach(versionStats) { stat in
                                    HStack {
                                        Text(stat.version ?? "Unknown")
                                        Spacer()
                                        Text("\(stat.count)")
                                            .font(.system(size: 13, weight: .medium))
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 4)
                                    Divider()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(NSColor.controlBackgroundColor))
                        .cornerRadius(12)
                        
                        // Content Popularity
                        VStack(alignment: .leading) {
                            Text("Top Content")
                                .font(.headline)
                                .padding(.bottom, 8)
                            
                            if contentStats.isEmpty {
                                Text("No content data")
                                    .foregroundColor(.secondary)
                            } else {
                                ForEach(contentStats) { stat in
                                    HStack {
                                        Text(stat.title)
                                            .lineLimit(1)
                                        Spacer()
                                        Text("\(stat.count)")
                                            .font(.system(size: 13, weight: .medium))
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 4)
                                    Divider()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(NSColor.controlBackgroundColor))
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Admin Users View
struct AdminUsersView: View {
    @EnvironmentObject var appState: AppState
    @State private var users: [SupabaseUser] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    // Pagination & Search
    @State private var currentPage = 1
    @State private var searchText = ""
    @State private var totalUsersCount: Int = 0 
    private let pageSize = 50
    
    // Manage Premiums
    @State private var grantUsername: String = ""
    @State private var grantDays: Int = 30
    @State private var isGranting = false
    @State private var grantMessage: String?
    
    var body: some View {
        VStack(spacing: 0) {
            // Header / Toolbar
            HStack {
                Text("User Management")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search username...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .onSubmit {
                            currentPage = 1
                            loadUsers()
                        }
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                            currentPage = 1
                            loadUsers()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                Button(action: { loadUsers() }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
                .help("Refresh List")
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            // Grant Premium Bar
            HStack(spacing: 12) {
                Image(systemName: "crown.fill")
                    .foregroundColor(.yellow)
                Text("Grant Premium:")
                    .font(.caption)
                    .font(.system(size: 11, weight: .medium))
                
                TextField("Username", text: $grantUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 120)
                
                Menu {
                    Button("1 Day") { grantDays = 1 }
                    Button("3 Days") { grantDays = 3 }
                    Button("7 Days") { grantDays = 7 }
                    Button("30 Days") { grantDays = 30 }
                    Button("60 Days") { grantDays = 60 }
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
                
                Button(action: grantPremium) {
                    Text("Grant")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(grantUsername.isEmpty ? Color.gray : Color.yellow)
                        .cornerRadius(6)
                }
                .buttonStyle(.plain)
                .disabled(grantUsername.isEmpty || isGranting)
                
                if let msg = grantMessage {
                    Text(msg)
                        .font(.caption)
                        .foregroundColor(msg.contains("Error") ? .red : .green)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            .background(Color(NSColor.controlBackgroundColor))
            
            Divider()
            
            // Content
            if isLoading && users.isEmpty {
                Spacer()
                ProgressView()
                Spacer()
            } else if let error = errorMessage {
                Spacer()
                Text("Error: \(error)")
                    .foregroundColor(.red)
                Spacer()
            } else {
                List {
                    ForEach(users, id: \.id) { user in
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(user.username)
                                        .font(.system(size: 13, weight: .medium))
                                        .font(.headline)
                                    if user.isPremium == true {
                                        Image(systemName: "crown.fill")
                                            .font(.caption2)
                                            .foregroundColor(.yellow)
                                            .help("Premium User")
                                    }
                                }
                                
                                Text("Joined: \(user.createdAt, style: .date)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                if let isAdmin = user.isAdmin, isAdmin {
                                    Text("ADMIN")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(Color.blue)
                                        .cornerRadius(4)
                                } else {
                                    // Revoke Button just for premium users (non-admins)
                                    if user.isPremium == true {
                                        Button("Revoke Premium") {
                                            revokePremium(username: user.username)
                                        }
                                        .font(.caption2)
                                        .foregroundColor(.red)
                                        .buttonStyle(.plain)
                                    }
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
            
            // Footer (Pagination)
            HStack {
                Button(action: {
                    if currentPage > 1 {
                        currentPage -= 1
                        loadUsers()
                    }
                }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentPage <= 1 || isLoading)
                
                Text("Page \(currentPage)")
                    .monospacedDigit()
                
                Button(action: {
                    // Primitive check: if we got a full page, assume there might be more
                    if users.count == pageSize {
                        currentPage += 1
                        loadUsers()
                    }
                }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(users.count < pageSize || isLoading)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
        }
        .onAppear {
            loadUsers()
        }
    }
    
    // MARK: - Logic
    
    private func loadUsers() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                if !searchText.isEmpty {
                    // Search mode (no pagination for simplicity in first pass, or just page 1)
                    // SupabaseClient.searchUsers returns all matches currently.
                    // We can implement better search later.
                    users = try await SupabaseClient.shared.searchUsers(username: searchText)
                } else {
                    let offset = (currentPage - 1) * pageSize
                    users = try await SupabaseClient.shared.getAllUsers(limit: pageSize, offset: offset)
                }
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    private func grantPremium() {
        guard !grantUsername.isEmpty else { return }
        guard let currentUserId = appState.currentUserId else { return }
        
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
                grantUsername = ""
                loadUsers() // Refresh list
            } catch {
                grantMessage = "Error: \(error.localizedDescription)"
            }
            isGranting = false
        }
    }
    
    private func revokePremium(username: String) {
        guard let currentUserId = appState.currentUserId else { return }
        
        Task {
            do {
                _ = try await SupabaseClient.shared.revokePremium(
                    callerUserId: currentUserId,
                    username: username
                )
                loadUsers()
            } catch {
                print("Error revoking: \(error)")
            }
        }
    }
    
    private func durationLabel(for days: Int) -> String {
        switch days {
        case 1: return "1 Day"
        case 3: return "3 Days"
        case 7: return "7 Days"
        case 30: return "30 Days"
        case 60: return "60 Days"
        case 90: return "90 Days"
        case 365: return "1 Year"
        case 36500: return "Lifetime"
        default: return "\(days) Days"
        }
    }
}

// MARK: - Admin Events View
struct AdminEventsView: View {
    @State private var activeEventRooms: [SupabaseRoom] = []
    @State private var debugEventId: String = ""
    @State private var isResettingStream: Bool = false
    @State private var resetMessage: String?
    
    // Deletion State
    @State private var isDeletingRoom: Bool = false
    @State private var deleteMessage: String?
    
    // Schedule Management
    @State private var isShowingScheduleManagement = false
    @State private var isShowingVerifiedStreams = false
    @State private var eventConfigVersion: Int?
    @State private var eventConfigMovieCount: Int?
    @State private var isLoading = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                HStack {
                    Text("Events & Rooms")
                    .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                
                // Config Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Configuration")
                        .font(.headline)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Movie Schedule")
                                .font(.system(size: 13, weight: .medium))
                            if let version = eventConfigVersion {
                                Text("Version: \(version)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        Button("Manage Schedule") {
                            isShowingScheduleManagement = true
                        }
                        
                        Button(action: refreshConfig) {
                            Image(systemName: "arrow.clockwise")
                        }
                        .buttonStyle(.plain)
                        .help("Force Refresh Schedule")
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Content Manager")
                                .font(.system(size: 13, weight: .medium))
                            Text("Verified Streams & Feedback")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button("View List") {
                            isShowingVerifiedStreams = true
                        }
                        .tint(.green)
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }
                
                Divider()
                
                // Debug / Reset Stream
                VStack(alignment: .leading, spacing: 12) {
                    Text("Emergency Controls")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    HStack {
                        TextField("Event ID (e.g. tt1234567)", text: $debugEventId)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Reset Stream") {
                            resetEventStream()
                        }
                        .disabled(debugEventId.isEmpty || isResettingStream)
                    }
                    
                    if let msg = resetMessage {
                        Text(msg)
                            .font(.caption)
                            .foregroundColor(msg.contains("Error") ? .red : .green)
                    }
                    
                    Text("Use this to clear a locked stream if an event is stuck or playing the wrong file.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.orange.opacity(0.05))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.orange.opacity(0.2)))
                
                Divider()
                
                // Active Event Rooms
                VStack(alignment: .leading, spacing: 12) {
                    Text("Active Event Rooms")
                        .font(.headline)
                    
                    if let msg = deleteMessage {
                        Text(msg)
                            .font(.caption)
                            .foregroundColor(msg.contains("Error") ? .red : .green)
                    }
                    
                    if activeEventRooms.isEmpty {
                        Text("No active event rooms.")
                            .foregroundColor(.secondary)
                            .italic()
                    } else {
                        ForEach(activeEventRooms, id: \.id) { room in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(room.name)
                                        .font(.system(size: 13, weight: .medium))
                                    Text(room.id)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("\(room.participantsCount) Active")
                                    .font(.caption)
                                    .monospacedDigit()
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(4)
                                
                                Button("Reset") {
                                    debugEventId = room.id
                                    resetEventStream()
                                }
                                .font(.caption)
                                
                                Button("Delete") {
                                    deleteEventRoom(roomId: room.id)
                                }
                                .font(.caption)
                                .foregroundColor(.red)
                                .disabled(isDeletingRoom)
                            }
                            .padding()
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(8)
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowingScheduleManagement) {
            ScheduleManagementView(isPresented: $isShowingScheduleManagement)
        }
        .sheet(isPresented: $isShowingVerifiedStreams) {
            VerifiedStreamsView()
                .frame(minWidth: 600, minHeight: 400)
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        Task {
            // Fetch Config Info
            if let config = try? await EventsConfigService.shared.fetchMovieEventsConfig() {
                eventConfigVersion = config.version
                eventConfigMovieCount = config.movies.count
                
                // Auto-fill active event
                 if let (_, mediaItem) = EventsConfigService.shared.calculateLiveEvent(config: config) {
                     if debugEventId.isEmpty {
                         debugEventId = mediaItem.id
                     }
                 }
            }
            
            // Fetch Rooms
            if let rooms = try? await SupabaseClient.shared.getAllRooms(limit: 100) {
                 activeEventRooms = rooms.filter { $0.id.starts(with: "event_") }
            }
        }
    }
    
    private func refreshConfig() {
        Task {
            isLoading = true
            _ = try? await EventsConfigService.shared.refreshConfig(type: "movie_events")
            loadData()
            isLoading = false
        }
    }
    
    private func resetEventStream() {
        guard !debugEventId.isEmpty else { return }
        isResettingStream = true
        resetMessage = nil
        
        Task { @MainActor in
            let roomId = debugEventId.starts(with: "event_") ? debugEventId : "event_\(debugEventId)"
            do {
                try await SupabaseClient.shared.resetRoomStream(roomId: roomId)
                resetMessage = "Success: Stream cleared for \(roomId)"
                debugEventId = ""
                loadData()
            } catch {
                resetMessage = "Error: \(error.localizedDescription)"
            }
            isResettingStream = false
        }
    }
    
    private func deleteEventRoom(roomId: String) {
        isDeletingRoom = true
        deleteMessage = nil
        
        Task { @MainActor in
            do {
                try await SupabaseClient.shared.deleteRoom(roomId: roomId)
                deleteMessage = "Success: Deleted room \(roomId)"
                // Remove locally to update UI immediately
                activeEventRooms.removeAll(where: { $0.id == roomId })
            } catch {
                deleteMessage = "Error deleting: \(error.localizedDescription)"
            }
            isDeletingRoom = false
        }
    }
}

// MARK: - Admin Payments View
struct AdminPaymentsView: View {
    @State private var transactions: [PaymentTransaction] = []
    @State private var stats: PaymentStats?
    @State private var isLoading = false
    @State private var currentPage = 1
    @State private var selectedUserId: UUID?
    @State private var searchQuery = ""
    @State private var isSweeping = false
    @State private var sweepMessage: String?
    private let pageSize = 50
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Payment Transactions")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    sweepFunds()
                }) {
                    HStack {
                        if isSweeping {
                            ProgressView()
                                .scaleEffect(0.5)
                        } else {
                            Image(systemName: "arrow.triangle.merge")
                        }
                        Text(isSweeping ? "Sweeping..." : "Sweep Funds")
                    }
                    .foregroundColor(isSweeping ? .secondary : .green)
                }
                .buttonStyle(.plain)
                .disabled(isSweeping)
                .help("Manually sweep funds to master wallet")

                Button(action: loadData) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
                .help("Refresh")
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            if let msg = sweepMessage {
                Text(msg)
                    .font(.caption)
                    .foregroundColor(msg.contains("Error") ? .red : .green)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
            }
            
            // Stats Cards
            if let stats = stats {
                HStack(spacing: 16) {
                    PaymentStatCard(
                        title: "Total Revenue",
                        value: String(format: "$%.2f", stats.totalRevenueUsd),
                        subtitle: "\(stats.totalTransactions) transactions",
                        color: .green
                    )
                    PaymentStatCard(
                        title: "Last 30 Days",
                        value: String(format: "$%.2f", stats.revenue30d),
                        subtitle: "Recent activity",
                        color: .blue
                    )
                    PaymentStatCard(
                        title: "Last 90 Days",
                        value: String(format: "$%.2f", stats.revenue90d),
                        subtitle: "Quarter revenue",
                        color: .purple
                    )
                }
                .padding()
            }
            
            // Search Bar
            HStack {
                TextField("Search by username...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        currentPage = 1
                        loadTransactions()
                    }
                
                Button(action: {
                    currentPage = 1
                    loadTransactions()
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .disabled(isLoading)
                
                if !searchQuery.isEmpty {
                    Button(action: {
                        searchQuery = ""
                        currentPage = 1
                        loadTransactions()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            Divider()
            
            // Transaction List
            if isLoading && transactions.isEmpty {
                Spacer()
                ProgressView()
                Spacer()
            } else if transactions.isEmpty {
                Spacer()
                VStack(spacing: 12) {
                    Image(systemName: "banknote")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text("No transactions yet")
                        .foregroundColor(.secondary)
                }
                Spacer()
            } else {
                List {
                    ForEach(transactions) { tx in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(spacing: 8) {
                                    Text(tx.username ?? "Unknown")
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    // Chain badge
                                    Text(tx.chain.uppercased())
                                        .font(.system(size: 10, weight: .bold)) // caption2 equivalent
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(tx.chain == "btc" ? Color.orange : Color.blue)
                                        .cornerRadius(4)
                                    
                                    // Currency badge
                                    Text(tx.currency)
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundColor(.secondary)

                                    // Duration badge
                                    if let days = tx.durationDays {
                                        Text("\(days)D")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(.cyan)
                                            .padding(.horizontal, 4)
                                            .padding(.vertical, 2)
                                            .background(Color.cyan.opacity(0.1))
                                            .cornerRadius(4)
                                    }
                                }
                                
                                Text(tx.txHash.prefix(16) + "...")
                                    .font(.system(.caption, design: .monospaced))
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                Text(String(format: "$%.2f", tx.amount))
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.green)
                                
                                Text(tx.createdAt, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(InsetListStyle())
            }
            
            // Pagination
            HStack {
                Button(action: {
                    if currentPage > 1 {
                        currentPage -= 1
                        loadTransactions()
                    }
                }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentPage <= 1 || isLoading)
                
                Text("Page \(currentPage)")
                    .monospacedDigit()
                
                Button(action: {
                    if transactions.count == pageSize {
                        currentPage += 1
                        loadTransactions()
                    }
                }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(transactions.count < pageSize || isLoading)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
        }
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
        loadStats()
        loadTransactions()
    }
    
    private func loadStats() {
        Task {
            do {
                stats = try await SupabaseClient.shared.getPaymentStats()
            } catch {
                print("Error loading payment stats: \(error)")
            }
        }
    }
    
    private func loadTransactions() {
        isLoading = true
        Task {
            do {
                let offset = (currentPage - 1) * pageSize
                transactions = try await SupabaseClient.shared.getAllPaymentTransactions(limit: pageSize, offset: offset, search: searchQuery.isEmpty ? nil : searchQuery)
            } catch {
                print("Error loading transactions: \(error)")
            }
            isLoading = false
        }
    }
    
    private func sweepFunds() {
        isSweeping = true
        sweepMessage = nil
        Task {
            do {
                let result = try await SupabaseClient.shared.sweepPayments()
                sweepMessage = "✅ Sweep Executed: \(result)"
            } catch {
                sweepMessage = "❌ Error: \(error.localizedDescription)"
            }
            isSweeping = false
        }
    }
}

// MARK: - Payment Stat Card
struct PaymentStatCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(color)
            
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
    }
}

// MARK: - Admin Logs View
struct AdminLogsView: View {
    @State private var logs: [AppLog] = []
    @State private var isLoading = false
    @State private var currentPage = 1
    private let pageSize = 50
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("App Logs")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    Task {
                        try? await SupabaseClient.shared.deleteAllAppLogs()
                        loadLogs()
                    }
                }) {
                    Label("Delete All", systemImage: "trash")
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
                .disabled(logs.isEmpty)
                
                Button(action: loadLogs) {
                    Image(systemName: "arrow.clockwise")
                }
                .buttonStyle(.plain)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            Divider()
            
            if isLoading && logs.isEmpty {
                Spacer()
                ProgressView()
                Spacer()
            } else if logs.isEmpty {
                Spacer()
                Text("No logs found.")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                List {
                    ForEach(logs) { log in
                        LogEntryRow(log: log)
                    }
                }
                .listStyle(InsetListStyle())
            }
            
            // Pagination
            HStack {
                Button(action: {
                    if currentPage > 1 {
                        currentPage -= 1
                        loadLogs()
                    }
                }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentPage <= 1 || isLoading)
                
                Text("Page \(currentPage)")
                    .monospacedDigit()
                
                Button(action: {
                    if logs.count == pageSize {
                        currentPage += 1
                        loadLogs()
                    }
                }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(logs.count < pageSize || isLoading)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
        }
        .onAppear {
            loadLogs()
        }
    }
    
    private func loadLogs() {
        isLoading = true
        Task {
            do {
                let offset = (currentPage - 1) * pageSize
                logs = try await SupabaseClient.shared.getAppLogs(limit: pageSize, offset: offset)
            } catch {
                print("Error loading logs: \(error)")
            }
            isLoading = false
        }
    }
}
