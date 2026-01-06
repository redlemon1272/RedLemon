import SwiftUI

struct AdminDashboardView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var appState: AppState
    @State private var selectedCategory: AdminCategory = .overview
    
    // Overview Data State (Lifted up or we can pass it, but for now let's keep it simple and let Overview load it or pass bindings)
    // Actually, to keep the shell clean, we will let AdminOverviewView manage its own data loading or just do it here if it's small.
    // However, the original code had everything here.
    // Let's create a wrapper for Overview that loads data to keep AdminDashboardView clean.
    
    // We'll define state variables for Overview here just to pass them down so we don't have to rewrite the data fetching logic entirely if we don't want to,
    // BUT avoiding massive State in the parent is better.
    // Let's modify AdminOverviewView in 'AdminDashboardComponents.swift' to be self-sufficient?
    // No, I defined `AdminOverviewView` as taking arguments. That means I need to fetch them here.
    
    @State private var versionStats: [AppVersionStat] = []
    @State private var contentStats: [ContentPopularityStat] = []
    @State private var userCount: Int = 0
    @State private var systemLatency: Double = 0
    @State private var isLoadingOverview = false
    
    var body: some View {
        HStack(spacing: 0) {
            // MARK: - Sidebar
            VStack(spacing: 0) {
                Text("Admin Panel")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(NSColor.controlBackgroundColor))
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(AdminCategory.allCases) { category in
                            AdminSidebarRow(category: category, isSelected: selectedCategory == category)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                }
                
                
                Divider()
                
                Button(action: {
                    isPresented = false
                }) {
                    HStack {
                        Image(systemName: "xmark.circle")
                        Text("Close")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.plain)
                .keyboardShortcut(.escape, modifiers: [])
            }
            .frame(width: 200)
            .background(Color(NSColor.windowBackgroundColor))
            
            Divider()
            
            // MARK: - Main Content Area
            VStack(spacing: 0) {
                switch selectedCategory {
                case .overview:
                    AdminOverviewView(
                        userCount: userCount,
                        systemLatency: systemLatency,
                        versionStats: versionStats,
                        contentStats: contentStats
                    )
                    .onAppear(perform: loadOverviewData)
                case .users:
                    AdminUsersView()
                case .events:
                    AdminEventsView()
                case .server:
                    AdminServerView()
                case .logs:
                    AdminLogsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(NSColor.controlBackgroundColor))
        }
        .frame(minWidth: 900, minHeight: 600)
    }
    
    private func loadOverviewData() {
        isLoadingOverview = true
        Task {
            async let count = SupabaseClient.shared.getUserCount()
            async let latency = SupabaseClient.shared.checkHealth()
            async let versions = SupabaseClient.shared.getAppVersionStats()
            async let content = SupabaseClient.shared.getContentPopularity()
            
            do {
                userCount = try await count
                systemLatency = try await latency
                versionStats = try await versions
                contentStats = try await content
            } catch {
                print("Error loading overview: \(error)")
            }
            isLoadingOverview = false
        }
    }
}

struct AdminSidebarRow: View {
    let category: AdminCategory
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: category.icon)
                .foregroundColor(isSelected ? .white : .primary)
                .frame(width: 20)
            Text(category.rawValue)
                .fontWeight(isSelected ? .medium : .regular)
                .foregroundColor(isSelected ? .white : .primary)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(isSelected ? Color.blue : Color.clear)
        .cornerRadius(6)
        .contentShape(Rectangle())
    }
}

// Re-export StatusCard and LogEntryRow if they were used in Components and not defined there.
// I defined StatusCard and LogEntryRow in AdminDashboardView originally.
// I used them in AdminDashboardComponents.swift assuming they were available.
// Since they are in the SAME MODULE, they should be available if I keep them in this file or move them.
// Wait, I am replacing the content of AdminDashboardView.swift.
// If I remove them from here, and don't put them in Components, they will be missing.
// I used `StatusCard` in `AdminOverviewView` (in Components).
// I used `LogEntryRow` in `AdminLogsView` (in Components).
// So I MUST define them. Ideally I should have put them in Components.swift or kept them here.
// I will keep them at the bottom of this file.

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
        return metadata.map { "\($0.key): \($0.value.value)" }.joined(separator: " | ")
    }
}

