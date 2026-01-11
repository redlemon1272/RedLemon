import SwiftUI

// MARK: - Navigation Enum
enum AdminCategory: String, CaseIterable, Identifiable {
    case overview = "Overview"
    case users = "Users"
    case payments = "Payments"
    case events = "Events"
    case content = "Content"
    case server = "Server"
    case logs = "Logs"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .overview: return "chart.bar.fill"
        case .users: return "person.2.fill"
        case .payments: return "dollarsign.circle.fill"
        case .events: return "play.tv.fill"
        case .content: return "film.fill"
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
    let zileanLastUpdate: Date?
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
                        StatusCard(
                            title: "Zilean Torrents",
                            value: "\(zileanCount.formatted())",
                            icon: "magnifyingglass.circle.fill",
                            color: .purple,
                            subtitle: zileanLastUpdate.map { "Updated \($0.timeAgoDisplay())" }
                        )
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

enum AdminLogTab: String, CaseIterable, Identifiable {
    case app = "App Logs"
    case session = "Session Logs"
    case system = "System Logs"
    
    var id: String { self.rawValue }
    var icon: String {
        switch self {
        case .app: return "terminal"
        case .session: return "person.text.rectangle"
        case .system: return "gearshape.2"
        }
    }
}

struct AdminLogsView: View {
    @State private var selectedTab: AdminLogTab = .app
    @State private var appLogs: [AppLog] = []
    @State private var sessionLogs: [SessionLog] = []
    @State private var feedbackReports: [FeedbackReport] = [] // Add state for feedback reports
    @State private var systemLogs: [SystemJobLog] = []
    
    @State private var isLoading = false
    @State private var searchText = ""
    @State private var selectedLevel: String = "ALL"
    
    @State private var appPage = 1
    @State private var sessionPage = 1
    @State private var systemPage = 1
    private let pageSize = 50
    
    var filteredAppLogs: [AppLog] {
        appLogs.filter { log in
            let matchesSearch = searchText.isEmpty || log.message.localizedCaseInsensitiveContains(searchText) || (log.userId?.uuidString.contains(searchText) ?? false)
            let matchesLevel = selectedLevel == "ALL" || log.level.uppercased() == selectedLevel
            return matchesSearch && matchesLevel
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header & Tabs
            VStack(spacing: 0) {
                HStack {
                    Text("Logs Management")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                    
                    if selectedTab == .app {
                        Button(action: {
                            Task {
                                try? await SupabaseClient.shared.deleteAllAppLogs()
                                await loadData()
                            }
                        }) {
                            Label("Clear App Logs", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.plain)
                        .disabled(appLogs.isEmpty)
                    } else if selectedTab == .session {
                        Button(action: {
                            Task {
                                try? await SupabaseClient.shared.deleteAllSessionLogs()
                                await loadData()
                            }
                        }) {
                            Label("Clear Session Logs", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.plain)
                        .disabled(sessionLogs.isEmpty)

                    } else if selectedTab == .system {
                         Button(action: {
                            Task {
                                try? await SupabaseClient.shared.deleteAllSystemLogs()
                                await loadData()
                            }
                        }) {
                            Label("Clear System Logs", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.plain)
                        .disabled(systemLogs.isEmpty)
                    }
                    
                    Button(action: { Task { await loadData() } }) {
                        Image(systemName: "arrow.clockwise")
                    }
                    .buttonStyle(.plain)
                }
                .padding()
                
                HStack(spacing: 0) {
                    ForEach(AdminLogTab.allCases) { tab in
                        Button(action: { selectedTab = tab }) {
                            VStack(spacing: 8) {
                                Label(tab.rawValue, systemImage: tab.icon)
                                    .foregroundColor(selectedTab == tab ? .blue : .primary)
                                
                                Rectangle()
                                    .fill(selectedTab == tab ? Color.blue : Color.clear)
                                    .frame(height: 2)
                            }
                        }
                        .buttonStyle(.plain)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            
            // Search & Filter Bar
            if selectedTab == .app {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search logs, user IDs...", text: $searchText)
                        .textFieldStyle(.plain)
                    
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Divider().frame(height: 20)
                    
                    Picker("Level", selection: $selectedLevel) {
                        Text("All Levels").tag("ALL")
                        Text("Error").tag("ERROR")
                        Text("Warning").tag("WARNING")
                        Text("Info").tag("INFO")
                        Text("Debug").tag("DEBUG")
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 300)
                }
                .padding(8)
                .background(Color.black.opacity(0.05))
            }
            
            Divider()
            
            // Content
            ZStack {
                if isLoading && currentLogsEmpty() {
                    ProgressView()
                } else {
                    switch selectedTab {
                    case .app:
                        appLogsList
                    case .session:
                        sessionLogsList
                    case .system:
                        systemLogsList
                    }
                }
            }
            
            Divider()
            
            // Footer (Pagination)
            HStack {
                Button(action: { changePage(delta: -1) }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentPage() <= 1 || isLoading)
                
                Text("Page \(currentPage())")
                    .font(.system(.body, design: .monospaced))
                
                Button(action: { changePage(delta: 1) }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(!canGoNext() || isLoading)
                
                Spacer()
                
                Text(countSummary())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
        }
        .onAppear {
            Task { await loadData() }
        }
        .onChange(of: selectedTab) { _ in
            Task { await loadData() }
        }
    }
    
    @ViewBuilder
    private var appLogsList: some View {
        if filteredAppLogs.isEmpty {
            emptyView(text: "No app logs found.")
        } else {
            List {
                ForEach(filteredAppLogs) { log in
                    LogEntryRow(log: log)
                }
            }
            .listStyle(InsetListStyle())
        }
    }
    
    @ViewBuilder
    private var sessionLogsList: some View {
        if sessionLogs.isEmpty {
            emptyView(text: "No session logs found.")
        } else {
            List {
                ForEach(sessionLogs) { log in
                    // Find associated feedback report
                    let report = feedbackReports.first(where: { $0.sessionLogId == log.sessionId })
                    
                    SessionLogRow(log: log, feedbackReport: report, onDelete: {
                        Task { await loadData() }
                    })
                }
            }
            .listStyle(InsetListStyle())
        }
    }
    
    @ViewBuilder
    private var systemLogsList: some View {
        if systemLogs.isEmpty {
            emptyView(text: "No system job logs found.")
        } else {
            List {
                ForEach(systemLogs) { log in
                    SystemJobLogRow(log: log)
                }
            }
            .listStyle(InsetListStyle())
        }
    }
    
    private func emptyView(text: String) -> some View {
        VStack {
            Spacer()
            Text(text)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
    
    private func currentLogsEmpty() -> Bool {
        switch selectedTab {
        case .app: return appLogs.isEmpty
        case .session: return sessionLogs.isEmpty
        case .system: return systemLogs.isEmpty
        }
    }
    
    private func currentPage() -> Int {
        switch selectedTab {
        case .app: return appPage
        case .session: return sessionPage
        case .system: return systemPage
        }
    }
    
    private func canGoNext() -> Bool {
        switch selectedTab {
        case .app: return appLogs.count == pageSize
        case .session: return sessionLogs.count == pageSize
        case .system: return systemLogs.count == pageSize
        }
    }
    
    private func countSummary() -> String {
        switch selectedTab {
        case .app: return "\(appLogs.count) entries loaded"
        case .session: return "\(sessionLogs.count) sessions loaded"
        case .system: return "\(systemLogs.count) jobs loaded"
        }
    }
    
    private func changePage(delta: Int) {
        switch selectedTab {
        case .app: appPage += delta
        case .session: sessionPage += delta
        case .system: systemPage += delta
        }
        Task { await loadData() }
    }
    
    private func loadData() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let offset = (currentPage() - 1) * pageSize
            switch selectedTab {
            case .app:
                appLogs = try await SupabaseClient.shared.getAppLogs(limit: pageSize, offset: offset)
            case .session:
                async let logs = SupabaseClient.shared.getSessionLogs(limit: pageSize, offset: offset)
                async let reports = SupabaseClient.shared.getFeedback(limit: 50)
                let (fetchedLogs, fetchedReports) = try await (logs, reports)
                sessionLogs = fetchedLogs
                feedbackReports = fetchedReports
            case .system:
                systemLogs = try await SupabaseClient.shared.getSystemJobLogs(limit: pageSize, offset: offset)
            }
        } catch {
            print("❌ Error loading \(selectedTab.rawValue): \(error)")
        }
    }
}

struct SystemJobLogRow: View {
    let log: SystemJobLog
    
    var statusColor: Color {
        switch log.status.lowercased() {
        case "success": return .green
        case "failed": return .red
        default: return .orange
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(log.jobName)
                    .font(.headline)
                
                Spacer()
                
                Text(log.status.uppercased())
                    .font(.caption.bold())
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(statusColor.opacity(0.2))
                    .foregroundColor(statusColor)
                    .cornerRadius(4)
                
                Text(log.createdAt, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(log.createdAt, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if let details = log.details {
                Text(details)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
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
                .font(.system(size: 11, weight: .bold))
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
                        .font(.system(.caption2, design: .monospaced))
                        .foregroundColor(.secondary)
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
        return metadata.map { "\($0.key): \($0.value.value)" }.joined(separator: " | ")
    }
}

struct SessionLogRow: View {
    let log: SessionLog
    var feedbackReport: FeedbackReport? // Inject optional feedback
    var isHighlighted: Bool = false
    var onDelete: (() -> Void)? // Optional callback for refresh
    @State private var isCopied = false
    
    var body: some View {
        DisclosureGroup {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Metadata")
                        .font(.caption.bold())
                    Spacer()
                    Button(action: copyToClipboard) {
                        Label(isCopied ? "Copied!" : "Copy Full Log", systemImage: isCopied ? "checkmark" : "doc.on.doc")
                            .font(.caption)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: deleteLog) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
                    .help("Delete Session Log")
                }
                
                if let report = feedbackReport {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                           Text("📣 Feedback Report")
                               .font(.caption)
                               .fontWeight(.bold)
                               .foregroundColor(.orange)
                           
                           if let email = report.contactEmail {
                               Text("• \(email)")
                                   .font(.caption)
                                   .foregroundColor(.secondary)
                           }
                       }
                       Text(report.message)
                           .font(.caption)
                           .foregroundColor(.white)
                           .padding(4)
                           .background(Color.orange.opacity(0.1))
                           .cornerRadius(4)
                    }
                    .padding(.bottom, 4)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if let imdbId = log.imdbId {
                        HStack {
                            Text("IMDb ID").foregroundColor(.secondary).frame(width: 80, alignment: .leading)
                            Text(imdbId).font(.system(.caption2, design: .monospaced))
                        }
                    }
                    if let hash = log.streamHash {
                        HStack {
                            Text("Hash").foregroundColor(.secondary).frame(width: 80, alignment: .leading)
                            Text(hash.prefix(12) + "...").font(.system(.caption2, design: .monospaced))
                        }
                    }
                    HStack {
                        Text("App").foregroundColor(.secondary).frame(width: 80, alignment: .leading)
                        Text(log.appVersion)
                    }
                }
                .font(.caption2)
                
                Divider()
                
                Text("Events (\(log.events.count))")
                    .font(.caption.bold())
                
                ForEach(log.events.indices, id: \.self) { index in
                    LogEventRow(event: log.events[index])
                    if index < log.events.count - 1 {
                        Divider().opacity(0.3)
                    }
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
    
    private func copyToClipboard() {
        let text = log.events.map { "[\($0.timestamp)] [\($0.category.rawValue)] \($0.message) \($0.metadata?.description ?? "")" }.joined(separator: "\n")
        NSPasteboard.general.clearContents()
        _ = NSPasteboard.general.setString(text, forType: .string)
        
        withAnimation { isCopied = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { isCopied = false }
        }
    }
    
    private func deleteLog() {
        Task {
            await SupabaseClient.shared.deleteSessionLog(id: log.sessionId)
            onDelete?()
        }
    }
}

struct LogEventRow: View {
    let event: SessionEvent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(alignment: .top) {
                Text(event.timestamp, style: .time)
                    .font(.caption.monospaced())
                    .foregroundColor(.secondary)
                    .frame(width: 80, alignment: .leading)
                
                Text("[\(event.category.rawValue)]")
                    .font(.caption.monospaced())
                    .foregroundColor(event.category == .error ? .red : .blue)
                    .frame(width: 90, alignment: .leading)
                
                Text(event.message)
                    .font(.caption)
            }
            if let meta = event.metadata, !meta.isEmpty {
                Text("\(meta.description)")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(.secondary)
                    .padding(.leading, 175)
            }
        }
    }
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
