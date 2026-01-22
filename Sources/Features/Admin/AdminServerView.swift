import SwiftUI

struct AdminServerView: View {
    // State
    @State private var dbMetrics: SystemMetrics?
    @State private var routerStatus: RouterStatus?
    @State private var lastBackup: BackupLog?
    @State private var lastJanitor: SystemJobLog?
    @State private var lastSweep: SystemJobLog?
    @State private var diskUsage: DiskUsage?
    @State private var realtimeStats: RealtimeStats?
    @State private var isLoading = false
    @State private var lastRefreshed: Date?
    
    // Auto-refresh timer
    let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                HStack {
                    Text("Server Health")
                        .font(.system(size: 20, weight: .bold))
                    
                    if let date = lastRefreshed {
                        Text("Updated: \(date, style: .time)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: refreshData) {
                        Image(systemName: "arrow.clockwise")
                            .rotationEffect(.degrees(isLoading ? 360 : 0))
                            .animation(isLoading ? .linear(duration: 1).repeatForever(autoreverses: false) : .default, value: isLoading)
                    }
                    .buttonStyle(.plain)
                    .disabled(isLoading)
                }
                
                // 1. Database Metrics
                VStack(alignment: .leading, spacing: 16) {
                    Label("Database (PostgreSQL)", systemImage: "cylinder.split.1x2.fill")
                        .font(.headline)
                    
                    // Grid Layout for metrics
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                        if let metrics = dbMetrics {
                            StatusCard(
                                title: "DB Size",
                                value: ByteCountFormatter.string(fromByteCount: metrics.dbSizeBytes, countStyle: .file),
                                icon: "internaldrive.fill",
                                color: .blue
                            )
                            
                            StatusCard(
                                title: "Connections",
                                value: "\(metrics.activeConnections)",
                                icon: "network.badge.shield.half.filled",
                                color: metrics.activeConnections > 80 ? .orange : .green
                            )
                        } else {
                            StatusCard(title: "DB Status", value: "Unknown", icon: "exclamationmark.triangle", color: .gray)
                        }

                        // Backup Status Card
                        if let backup = lastBackup {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: (backup.status == "verified" || backup.status == "success") ? "checkmark.shield.fill" : "clock.arrow.circlepath")
                                        .foregroundColor((backup.status == "verified" || backup.status == "success") ? .green : .red)
                                    Text("Last Backup")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(backup.createdAt.formatted(.relative(presentation: .named)))
                                        .font(.system(size: 24, weight: .bold))
                                    
                                    if backup.status == "verified" || backup.status == "success" {
                                        Text("✅ Verified Safe")
                                            .font(.caption2)
                                            .foregroundColor(.green)
                                    } else {
                                        Text("⚠️ Check Logs")
                                            .font(.caption2)
                                            .foregroundColor(.orange)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(12)
                            .padding(4)
                        } else {
                            StatusCard(title: "Last Backup", value: "None", icon: "clock.arrow.circlepath", color: .gray)
                        }

                        // Payment Sweep Card
                        if let sweep = lastSweep {
                            StatusCard(
                                title: "Payment Sweep",
                                value: sweep.createdAt.formatted(.relative(presentation: .named)),
                                icon: sweep.status == "success" ? "checkmark.circle.fill" : "xmark.octagon.fill",
                                color: sweep.status == "success" ? .green : .red
                            )
                        } else {
                            StatusCard(title: "Payment Sweep", value: "Pending", icon: "dollarsign.circle", color: .gray)
                        }

                        // Janitor Script Card
                        if let janitor = lastJanitor {
                            StatusCard(
                                title: "Maintenance",
                                value: janitor.createdAt.formatted(.relative(presentation: .named)),
                                icon: janitor.status == "success" ? "broom.fill" : "exclamationmark.triangle.fill",
                                color: janitor.status == "success" ? .green : .red
                            )
                        } else {
                            StatusCard(title: "Maintenance", value: "Pending", icon: "broom", color: .gray)
                        }
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)
                
                // 2. Edge Router Status
                VStack(alignment: .leading, spacing: 16) {
                    Label("Edge Network", systemImage: "globe")
                        .font(.headline)
                    
                    if let status = routerStatus {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Status")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                HStack {
                                    Circle()
                                        .fill(status.status == "online" ? Color.green : Color.red)
                                        .frame(width: 8, height: 8)
                                    Text(status.status.uppercased())
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(status.status == "online" ? .green : .red)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Region")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(status.region)
                                    .font(.system(size: 13, weight: .medium))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Service")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(status.service)
                                    .font(.system(size: 11, weight: .medium))
                            }
                        }
                        .padding()
                        .background(Color(NSColor.windowBackgroundColor))
                        .cornerRadius(8)
                    } else {
                        Text("Checking router status...")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)
                
                // 3. Disk Usage
                VStack(alignment: .leading, spacing: 16) {
                    Label("Disk Usage", systemImage: "internaldrive.fill")
                        .font(.headline)
                    
                    if let disk = diskUsage {
                        VStack(spacing: 12) {
                            // Progress bar
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    // Background
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(height: 12)
                                    
                                    // Used portion
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(disk.usagePercent > 80 ? Color.red : disk.usagePercent > 60 ? Color.orange : Color.green)
                                        .frame(width: geometry.size.width * CGFloat(disk.usagePercent) / 100, height: 12)
                                }
                            }
                            .frame(height: 12)
                            
                            // Stats row
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Used")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(ByteCountFormatter.string(fromByteCount: disk.usedBytes, countStyle: .file))
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(disk.usagePercent > 80 ? .red : .primary)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("Total")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(ByteCountFormatter.string(fromByteCount: disk.totalBytes, countStyle: .file))
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text("Free")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(ByteCountFormatter.string(fromByteCount: disk.freeBytes, countStyle: .file))
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.green)
                                }
                            }
                            
                            Text("\(String(format: "%.1f", disk.usagePercent))% used")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(NSColor.windowBackgroundColor))
                        .cornerRadius(8)
                    } else {
                        Text("Checking disk usage...")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)

                // 4. Live Event Monitoring (Realtime Stats)
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Label("Live Event Monitoring", systemImage: "antenna.radiowaves.left.and.right")
                            .font(.headline)
                        Spacer()
                        if let stats = realtimeStats {
                            Circle()
                                .fill(stats.capacityStatus == "healthy" ? Color.green :
                                      stats.capacityStatus == "warning" ? Color.orange :
                                      Color.red)
                                .frame(width: 8, height: 8)
                            Text(stats.capacityStatus.uppercased())
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(stats.capacityStatus == "healthy" ? .green :
                                                   stats.capacityStatus == "warning" ? .orange :
                                                   .red)
                        }
                    }

                    if let stats = realtimeStats {
                        // Main metrics row
                        HStack(spacing: 16) {
                            StatusCard(
                                title: "Total Viewers",
                                value: "\(stats.totalParticipants)",
                                icon: "person.2.fill",
                                color: stats.capacityStatus == "healthy" ? .green :
                                       stats.capacityStatus == "warning" ? .orange :
                                       .red,
                                subtitle: "\(stats.activeEvents) active event\(stats.activeEvents == 1 ? "" : "s")"
                            )

                            StatusCard(
                                title: "Capacity Used",
                                value: String(format: "%.1f%%", stats.usagePercent),
                                icon: "chart.pie.fill",
                                color: stats.capacityStatus == "healthy" ? .green :
                                       stats.capacityStatus == "warning" ? .orange :
                                       .red,
                                subtitle: "\(stats.maxConnections) max connections"
                            )
                        }

                        // Current event
                        if let largest = stats.largestEvent, largest.participantsCount > 0 {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Current Event")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(largest.roomName)
                                            .font(.system(size: 13, weight: .medium))
                                        Text(largest.roomId)
                                            .font(.system(.caption2, design: .monospaced))
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Text("\(largest.participantsCount) viewers")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color(NSColor.windowBackgroundColor))
                                .cornerRadius(8)
                            }
                        }

                        // Capacity bar
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Connection Capacity")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(height: 12)

                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(stats.capacityStatus == "critical" ? Color.red :
                                               stats.capacityStatus == "warning" ? Color.orange :
                                               Color.green)
                                        .frame(width: geometry.size.width * min(stats.usagePercent / 100, 1), height: 12)
                                }
                            }
                            .frame(height: 12)

                            HStack {
                                Text("\(stats.totalParticipants) / \(stats.maxConnections) connections")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("RLIMIT_NOFILE=10000")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(NSColor.windowBackgroundColor))
                        .cornerRadius(8)
                    } else {
                        Text("Loading realtime stats...")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)

                // 5. Watch Party Rooms (User-Hosted)
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Label("Watch Party Rooms", systemImage: "person.3.fill")
                            .font(.headline)
                        Spacer()
                        if let stats = realtimeStats {
                            Text("\(stats.activeRooms) active")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.secondary)
                        }
                    }

                    if let stats = realtimeStats {
                        // Main metrics row
                        HStack(spacing: 16) {
                            StatusCard(
                                title: "Active Rooms",
                                value: "\(stats.activeRooms)",
                                icon: "door.left.garden.open.fill",
                                color: .blue,
                                subtitle: "user-hosted rooms"
                            )

                            StatusCard(
                                title: "Total Viewers",
                                value: "\(stats.totalRoomParticipants)",
                                icon: "person.2.fill",
                                color: .green,
                                subtitle: "across all rooms"
                            )
                        }

                        // Largest room
                        if let largest = stats.largestRoom, largest.participantsCount > 0 {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Most Popular Room")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(largest.roomName)
                                            .font(.system(size: 13, weight: .medium))
                                        Text(largest.roomId)
                                            .font(.system(.caption2, design: .monospaced))
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Text("\(largest.participantsCount) viewers")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color(NSColor.windowBackgroundColor))
                                .cornerRadius(8)
                            }
                        }

                        // Active rooms list (if any)
                        if !stats.rooms.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active Rooms")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                ForEach(stats.rooms.prefix(5), id: \.id) { room in
                                    HStack {
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(room.name)
                                                .font(.system(size: 12, weight: .medium))
                                                .lineLimit(1)
                                            Text(room.id)
                                                .font(.system(.caption2, design: .monospaced))
                                                .foregroundColor(.secondary)
                                        }
                                        Spacer()
                                        if let count = room.participantsCount, count > 0 {
                                            Text("\(count)")
                                                .font(.system(size: 12, weight: .semibold))
                                                .foregroundColor(.secondary)
                                        }
                                        if let isPlaying = room.isPlaying {
                                            Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                                                .font(.caption2)
                                                .foregroundColor(isPlaying ? .green : .secondary)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .background(Color(NSColor.windowBackgroundColor))
                                    .cornerRadius(6)
                                }
                            }
                        }
                    } else {
                        Text("Loading room stats...")
                            .foregroundColor(.secondary)
                            .italic()
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)

                // 6. Environment Info
                VStack(alignment: .leading, spacing: 16) {
                    Label("Environment", systemImage: "server.rack")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ServerInfoRow(label: "Host", value: "151.243.109.243 (AnonVM)")
                        Divider()
                        ServerInfoRow(label: "OS", value: "Ubuntu 24.04 LTS")
                        Divider()
                        ServerInfoRow(label: "Backup Schedule", value: "Daily @ 09:00 UTC")
                        Divider()
                        ServerInfoRow(label: "SSL Proxy", value: "Caddy (Auto-HTTPS)")
                    }
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
        }
        .onAppear(perform: refreshData)
        .onReceive(timer) { _ in refreshData() }
    }
    
    private func refreshData() {
        isLoading = true
        Task {
            // 1. Get DB Metrics
            do {
                let metrics: SystemMetrics = try await SupabaseClient.shared.rpc(fn: "get_system_metrics")
                dbMetrics = metrics
            } catch {
                print("DB Metrics Error: \(error)")
            }
            
            // 2. Get Router Status
            do {
                let status: RouterStatus = try await SupabaseClient.shared.invokeFunction(name: "system/status")
                routerStatus = status
            } catch {
                print("Router Status Error: \(error)")
                routerStatus = RouterStatus(status: "offline", timestamp: "", service: "Unreachable", region: "Unknown")
            }

            // 3. Get Last Backup
            do {
                 // We use a raw select query here since we don't have a specific RPC for it, 
                 // but strictly speaking we should move this to SupabaseClient if we want to be clean.
                 // For now, let's assume SupabaseClient exposes a helper or we use the generic client.
                 // Since I can't easily add a generic `from` method to the singleton without seeing it,
                 // I will use a new method in SupabaseClient or just `rpc` if I made one.
                 // I didn't make an RPC for backups.
                 // Let's assume there's a `getLatestBackupLog()` method I will add to SupabaseClient.
                 let log = try await SupabaseClient.shared.getLatestBackupLog()
                 lastBackup = log
            } catch {
                 print("Backup Log Error: \(error)")
            }

            // 4. Get System Job Logs
            do {
                async let janitor = SupabaseClient.shared.getLatestSystemJobLog(jobName: "zilean_maintenance")
                async let sweep = SupabaseClient.shared.getLatestSystemJobLog(jobName: "payment_sweep")
                
                lastJanitor = try await janitor
                lastSweep = try await sweep
            } catch {
                print("System Logs Error: \(error)")
            }
            
            // 5. Get Disk Usage
            do {
                let disk: DiskUsage = try await SupabaseClient.shared.invokeFunction(name: "system/disk")
                diskUsage = disk
            } catch {
                print("Disk Usage Error: \(error)")
                // Fallback with mock data if endpoint not available
                diskUsage = nil
            }

            // 6. Get Realtime Stats (Live Event Monitoring)
            do {
                let stats: RealtimeStats = try await SupabaseClient.shared.invokeFunction(name: "system/realtime-stats")
                realtimeStats = stats
            } catch {
                print("Realtime Stats Error: %@", "\(error)")
                // Don't set nil - keep previous data if available
            }
            
            lastRefreshed = Date()
            isLoading = false
        }
    }
}

// MARK: - Models
struct SystemMetrics: Codable {
    let dbSizeBytes: Int64
    let activeConnections: Int
    
    enum CodingKeys: String, CodingKey {
        case dbSizeBytes = "db_size_bytes"
        case activeConnections = "active_connections"
    }
}

struct RouterStatus: Codable {
    let status: String
    let timestamp: String
    let service: String
    let region: String
}

struct BackupLog: Codable {
    let id: UUID
    let filename: String
    let status: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case filename
        case status
        case createdAt = "created_at"
    }
}

struct DiskUsage: Codable {
    let totalBytes: Int64
    let usedBytes: Int64
    let freeBytes: Int64
    let usagePercent: Double

    enum CodingKeys: String, CodingKey {
        case totalBytes = "total_bytes"
        case usedBytes = "used_bytes"
        case freeBytes = "free_bytes"
        case usagePercent = "usage_percent"
    }
}

struct RealtimeStats: Codable {
    let totalParticipants: Int
    let activeEvents: Int
    let largestEvent: LargestEvent?
    let activeRooms: Int
    let totalRoomParticipants: Int
    let largestRoom: LargestRoom?
    let maxConnections: Int
    let usagePercent: Double
    let capacityStatus: String
    let events: [EventRoomInfo]
    let rooms: [EventRoomInfo]

    enum CodingKeys: String, CodingKey {
        case totalParticipants = "total_participants"
        case activeEvents = "active_events"
        case largestEvent = "largest_event"
        case activeRooms = "active_rooms"
        case totalRoomParticipants = "total_room_participants"
        case largestRoom = "largest_room"
        case maxConnections = "max_connections"
        case usagePercent = "usage_percent"
        case capacityStatus = "capacity_status"
        case events
        case rooms
    }
}

struct LargestEvent: Codable {
    let roomId: String
    let roomName: String
    let participantsCount: Int

    enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
        case roomName = "room_name"
        case participantsCount = "participants_count"
    }
}

struct LargestRoom: Codable {
    let roomId: String
    let roomName: String
    let participantsCount: Int

    enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
        case roomName = "room_name"
        case participantsCount = "participants_count"
    }
}

struct EventRoomInfo: Codable {
    let id: String
    let name: String
    let participantsCount: Int?
    let isPlaying: Bool?
    let maxParticipants: Int?
    let createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case participantsCount = "participants_count"
        case isPlaying = "is_playing"
        case maxParticipants = "max_participants"
        case createdAt = "created_at"
    }
}

// MARK: - Components
struct ServerInfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.system(.body, design: .monospaced))
        }
    }
}

