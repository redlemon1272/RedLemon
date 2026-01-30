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
                                        
                                        if let expiry = user.subscriptionExpiresAt {
                                            let days = Calendar.current.dateComponents([.day], from: Date(), to: expiry).day ?? 0
                                            Text(days > 36000 ? "(Lifetime)" : "(\(max(0, days))d)")
                                                .font(.system(size: 10))
                                                .foregroundColor(.secondary)
                                                .monospacedDigit()
                                        }
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
                            ActiveEventRowView(
                                room: room,
                                isDeletingRoom: isDeletingRoom,
                                debugEventId: $debugEventId,
                                onReset: resetEventStream,
                                onDelete: deleteEventRoom,
                                onBlockAndReset: blockAndReset
                            )
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
    

    


    private func blockAndReset(roomId: String, hash: String) {
        isResettingStream = true
        resetMessage = nil
        
        Task { @MainActor in
            do {
                // 1. Block the stream
                try await SupabaseClient.shared.blockStream(
                    hash: hash,
                    filename: nil,
                    provider: nil,
                    reason: "Blocked via Admin Dashboard (Bad Stream)"
                )
                
                // 2. Reset the room to force re-resolution
                try await SupabaseClient.shared.resetRoomStream(roomId: roomId)
                
                resetMessage = "Success: Blocked hash \(hash.prefix(8))... and reset room."
                loadData()
            } catch {
                resetMessage = "Error: \(error.localizedDescription)"
            }
            isResettingStream = false
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
                activeEventRooms.removeAll(where: { $0.id.caseInsensitiveCompare(roomId) == .orderedSame })
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
            if let msg = sweepMessage {
                Text(msg)
                    .font(.caption)
                    .foregroundColor(msg.contains("Error") ? .red : .green)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
            }
            
            // Dispute Resolver
            DisputeResolverView()
                .padding(.horizontal)
                .padding(.bottom, 8)
            
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
                                if let usd = tx.amountUsd {
                                    Text(String(format: "$%.2f", usd))
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.green)
                                } else {
                                    Text(String(format: "%.4f %@", tx.amount, tx.currency))
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.green)
                                }
                                
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
    @State private var selectedTab: AdminLogTab = .session
    @State private var appLogs: [AppLog] = []
    
    @State private var sessionLogs: [SessionLog] = []
    @State private var feedbackReports: [FeedbackReport] = [] // Add state for feedback reports
    @State private var systemLogs: [SystemJobLog] = []
    
    @State private var isLoading = false
    @State private var searchText = ""
    @State private var selectedLevel: String = "ALL"
    
    @State private var appPage = 1
    @State private var sessionPage = 1
    
    var filteredAppLogs: [AppLog] {
        appLogs.filter { log in
            let matchesSearch = searchText.isEmpty || log.message.localizedCaseInsensitiveContains(searchText) || (log.userId?.uuidString.contains(searchText) ?? false)
            let matchesLevel = selectedLevel == "ALL" || log.level.uppercased() == selectedLevel
            return matchesSearch && matchesLevel
        }
    }
    

    @State private var systemPage = 1
    private let pageSize = 50
    

    
    var body: some View {
        VStack(spacing: 0) {
            // Header & Tabs
            VStack(spacing: 0) {
                HStack {
                    Text("Logs Management")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                    
                    if selectedTab == .session {
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

                    ForEach(AdminLogTab.allCases.filter { $0 != .app }) { tab in

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
                    let report = feedbackReports.first(where: { $0.sessionLogId == log.id })
                    
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
                               .font(.caption.weight(.bold))
                               
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
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 2_000_000_000)
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
// MARK: - Dispute Resolver View
struct DisputeResolverView: View {
    @State private var txHash: String = ""
    @State private var searchResult: PaymentTransaction?
    @State private var hasSearched: Bool = false
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    // Grant Premium State
    @State private var manualUsername: String = ""
    @State private var manualDays: Int = 30
    @State private var isGranting: Bool = false
    @State private var grantMessage: String?
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Dispute Resolution")
                .font(.headline)
            
            // Search Input
            HStack {
                TextField("Enter Transaction Hash (0x...)", text: $txHash)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(.body, design: .monospaced))
                    .onSubmit {
                        performSearch()
                    }
                
                Button(action: performSearch) {
                    if isLoading {
                        ProgressView().scaleEffect(0.5)
                    } else {
                        Text("Verify Payment")
                    }
                }
                .disabled(txHash.count < 10 || isLoading)
            }
            
            // Results Area
            if hasSearched {
                if let tx = searchResult {
                    // CASE 1: FOUND
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("Payment Processed Successfully")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("User:")
                                    .foregroundColor(.secondary)
                                    .frame(width: 60, alignment: .leading)
                                Text(tx.username ?? "Unknown")
                                    .bold()
                            }
                            HStack {
                                Text("Amount:")
                                    .foregroundColor(.secondary)
                                    .frame(width: 60, alignment: .leading)
                                if let usd = tx.amountUsd {
                                    Text(String(format: "$%.2f", usd))
                                        .bold()
                                    Text("(\(String(format: "%.4f %@", tx.amount, tx.currency)))")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                } else {
                                    Text(String(format: "%.4f %@", tx.amount, tx.currency))
                                        .bold()
                                }
                            }
                            HStack {
                                Text("Date:")
                                    .foregroundColor(.secondary)
                                     .frame(width: 60, alignment: .leading)
                                Text(tx.createdAt, style: .date)
                            }
                        }
                        
                        Button("View on Block Explorer") {
                            openExplorer(hash: tx.txHash)
                        }
                        .buttonStyle(.link)
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.green.opacity(0.3)))
                    
                } else {
                    // CASE 2: NOT FOUND (Dispute)
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .top) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                                .font(.title2)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Transaction Not Found in Database")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                                Text("This payment was not processed by our system. Please verify it on-chain.")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Divider()
                        
                        // 1. Verify On-Chain
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Step 1: Check Blockchain")
                                .font(.subheadline.weight(.medium))
                                
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    explorerButton(name: "Base", url: "https://basescan.org/tx/\(txHash)")
                                    explorerButton(name: "Ethereum", url: "https://etherscan.io/tx/\(txHash)")
                                    explorerButton(name: "Optimism", url: "https://optimistic.etherscan.io/tx/\(txHash)")
                                    explorerButton(name: "Arbitrum", url: "https://arbiscan.io/tx/\(txHash)")
                                    explorerButton(name: "Polygon", url: "https://polygonscan.com/tx/\(txHash)")
                                }
                            }
                        }
                        
                        Divider()
                        
                        // 2. Resolve (Grant)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Step 2: Resolve Dispute")
                                .font(.subheadline.weight(.medium))
                                
                            
                            HStack(alignment: .top, spacing: 12) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Username")
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                    TextField("username", text: $manualUsername)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(width: 150)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Duration")
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                    Picker("", selection: $manualDays) {
                                        Text("30 Days").tag(30)
                                        Text("90 Days").tag(90)
                                        Text("1 Year").tag(365)
                                    }
                                    .labelsHidden()
                                    .frame(width: 100)
                                }
                                
                                Button(action: grantPremium) {
                                    if isGranting {
                                        ProgressView().scaleEffect(0.5)
                                    } else {
                                        Text("Grant Premium & Close")
                                    }
                                }
                                .disabled(manualUsername.isEmpty || isGranting)
                                .padding(.top, 18) // Align with fields
                                
                                if let msg = grantMessage {
                                    Text(msg)
                                        .font(.caption)
                                        .foregroundColor(msg.contains("Error") ? .red : .green)
                                        .padding(.top, 22)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.05))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.orange.opacity(0.2)))
                }
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(NSColor.separatorColor), lineWidth: 1))
    }
    
    // MARK: - Logic
    
    private func performSearch() {
        guard !txHash.isEmpty else { return }
        
        // Auto-clean hash
        txHash = txHash.trimmingCharacters(in: .whitespacesAndNewlines)
        
        isLoading = true
        errorMessage = nil
        hasSearched = false
        searchResult = nil
        grantMessage = nil // Reset grant state
        
        Task {
            do {
                // We use the existing getAllPaymentTransactions with search.
                // It searches username OR txHash if we implemented backend correctly,
                // otherwise we assume it might fetch a list.
                // Ideally backend RPC `get_all_payment_transactions` supports partial hash search.
                // If it returns a match, great.
                
                let results = try await SupabaseClient.shared.getAllPaymentTransactions(limit: 5, offset: 0, search: txHash)
                
                // Exact match check (or contains)
                if let match = results.first(where: { $0.txHash.localizedCaseInsensitiveContains(txHash) }) {
                    searchResult = match
                }
                
                hasSearched = true
            } catch {
                errorMessage = "Search failed: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
    private func openExplorer(hash: String) {
        // Default to Ethereum for unknown chain, but typically we know the chain from the TX object.
        // If we have the object, we can be smarter.
        // But for generic button, let's just use etherscan if unknown.
        let url = "https://etherscan.io/tx/\(hash)"
        if let nsUrl = URL(string: url) {
            NSWorkspace.shared.open(nsUrl)
        }
    }
    
    private func explorerButton(name: String, url: String) -> some View {
        Button(action: {
            if let nsUrl = URL(string: url) {
                NSWorkspace.shared.open(nsUrl)
            }
        }) {
            HStack(spacing: 4) {
                Text(name)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
    
    private func grantPremium() {
        guard let currentUserId = appState.currentUserId else { return }
        isGranting = true
        grantMessage = nil
        
        Task {
            do {
                let message = try await SupabaseClient.shared.grantPremium(
                    callerUserId: currentUserId,
                    username: manualUsername,
                    days: manualDays
                )
                grantMessage = "✅ Success: \(message)"
                // Optional: Clear fields? Keep them for record?
                // Let's keep them so admin sees what they did.
                
                // Log safe
                NSLog("%@", "Admin granted premium to \(manualUsername) for \(manualDays) days via Dispute Resolver")
            } catch {
                grantMessage = "❌ Error: \(error.localizedDescription)"
            }
            isGranting = false
        }
    }
}

// Helper struct to isolate compiler complexity
struct BlockResetButton: View {
    let roomId: String
    let hash: String
    let performBlock: (String, String) -> Void
    
    var body: some View {
        Button("Block & Reset") {
            performBlock(roomId, hash)
        }
        .font(.caption2)
        .foregroundColor(.red)
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .padding(.top, 2)
    }
}

struct ActiveEventRowView: View {
    let room: SupabaseRoom
    let isDeletingRoom: Bool
    @Binding var debugEventId: String
    let onReset: () -> Void
    let onDelete: (String) -> Void
    let onBlockAndReset: (String, String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
                    onReset()
                }
                .font(.caption)
                
                Button("Delete") {
                    onDelete(room.id)
                }
                .font(.caption)
                .foregroundColor(.red)
                .disabled(isDeletingRoom)
            }
            
            // Seeded Stream Info
            if room.streamHash != nil || room.unlockedStreamUrl != nil {
                Divider()
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.green)
                            .font(.caption2)
                        Text("Seeded Stream")
                            .font(.caption.weight(.semibold))
                            .foregroundColor(.green)
                    }
                    
                    if let hash = room.streamHash {
                        HStack {
                            Text("Hash:")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                            Text(hash.prefix(16) + "...")
                                .font(.system(.caption2, design: .monospaced))
                                .foregroundColor(.orange)
                            
                            Button(action: {
                                NSPasteboard.general.clearContents()
                                NSPasteboard.general.setString(hash, forType: .string)
                            }) {
                                Image(systemName: "doc.on.doc")
                                    .font(.caption2)
                            }
                            .buttonStyle(.plain)
                            .help("Copy full hash")
                        }
                    }
                    
                    if let quality = room.quality {
                        HStack {
                            Text("Quality:")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                            Text(quality)
                                .font(.caption2.weight(.medium))
                                .foregroundColor(.cyan)
                        }
                    }
                    
                    if room.unlockedStreamUrl != nil {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.caption2)
                            Text("URL Unlocked")
                                .font(.caption2)
                                .foregroundColor(.green)
                        }
                    }
                    
                    if let hash = room.streamHash {
                        BlockResetButton(roomId: room.id, hash: hash, performBlock: onBlockAndReset)
                    }
                }
                .padding(.leading, 8)
            } else {
                // No seeded stream
                HStack {
                    Image(systemName: "lock.open")
                        .foregroundColor(.secondary)
                    Text("No stream locked")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 8)
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(6)
    }
}
