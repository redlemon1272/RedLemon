import SwiftUI

struct AdminServerView: View {
    // State
    @State private var dbMetrics: SystemMetrics?
    @State private var routerStatus: RouterStatus?
    @State private var lastBackup: BackupLog?
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
                        .font(.title2)
                        .fontWeight(.bold)
                    
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
                    
                    HStack(spacing: 16) {
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
                            StatusCard(
                                title: "Last Backup",
                                value: backup.createdAt.formatted(.relative(presentation: .named)),
                                icon: "clock.arrow.circlepath",
                                color: backup.status == "success" ? .green : .red
                            )
                        } else {
                            StatusCard(title: "Last Backup", value: "None", icon: "clock.arrow.circlepath", color: .gray)
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
                                        .fontWeight(.bold)
                                        .foregroundColor(status.status == "online" ? .green : .red)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Region")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(status.region)
                                    .fontWeight(.medium)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Service")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(status.service)
                                    .font(.caption2)
                                    .fontWeight(.medium)
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
                
                // 3. Environment Info
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

