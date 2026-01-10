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
    @State private var zileanCount: Int = 0
    @State private var systemLatency: Double = 0
    @State private var isLoadingOverview = false
    
    // Provider Health state moved to component
    
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
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Admin Dashboard")
                                .font(.system(size: 34, weight: .bold)) // Large Title equivalent
                            
                            // MARK: - Provider Health
                            ProviderHealthView()
                            
                            AdminOverviewView(
                                userCount: userCount,
                                zileanCount: zileanCount,
                                systemLatency: systemLatency,
                                versionStats: versionStats,
                                contentStats: contentStats,
                                onRefresh: loadOverviewData
                            )
                            .onAppear(perform: loadOverviewData)
                        }
                        .padding()
                    }
                    .task {
                        // Check health on load handled by component
                    }
                case .users:
                    AdminUsersView()
                case .payments:
                    AdminPaymentsView()
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
            async let zCount = SupabaseClient.shared.getZileanTorrentCount()
            async let latency = SupabaseClient.shared.checkHealth()
            async let versions = SupabaseClient.shared.getAppVersionStats()
            async let content = SupabaseClient.shared.getContentPopularity()
            
            do {
                userCount = try await count
                zileanCount = try await zCount
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
                .font(.system(size: 13, weight: isSelected ? .medium : .regular))
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
                .font(.system(size: 24, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .padding(4)
    }
}



