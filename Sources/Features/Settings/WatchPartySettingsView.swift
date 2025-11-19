import SwiftUI

/// Settings view for Watch Party transport configuration
struct WatchPartySettingsView: View {
    @StateObject private var watchPartyManager = WatchPartyManager()
    @State private var useWebSocket: Bool = false
    @State private var webSocketURL: String = "wss://151.243.109.217.nip.io/ws"
    @State private var customURL: String = ""
    @State private var useCustomURL: Bool = false
    @State private var showingConnectionTest = false
    @State private var connectionTestResult: String = ""
    @State private var isTestingConnection = false

    var body: some View {
        NavigationView {
            Form {
                configurationSection
                transportConfigurationSection
                connectionTestSection
                statusSection
                resetSection
            }
            .navigationTitle("Watch Party")
#if os(iOS)
            .navigationBarTitleDisplayMode(.large)
#endif
            .onAppear {
                loadSettings()
            }
            .onDisappear {
                saveSettings()
            }
            .alert("Connection Test", isPresented: $showingConnectionTest) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(connectionTestResult)
            }
        }
    }

    // MARK: - Sections

    @ViewBuilder
    private var configurationSection: some View {
        Section(header: Text("Configuration")) {
            Text("Watch Party Transport Settings")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }

    @ViewBuilder
    private var transportConfigurationSection: some View {
        Section(header: Text("Transport Configuration"), footer: Text(transportDescription)) {
            Toggle("Use WebSocket Transport", isOn: $useWebSocket)
                .onChange(of: useWebSocket) { _ in
                    updateTransport()
                }

            if useWebSocket {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Transport Type")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Picker("Transport", selection: $useCustomURL) {
                        Text("Production Server").tag(false)
                        Text("Custom URL").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                if useCustomURL {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Custom WebSocket URL")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        TextField("ws://localhost:8080", text: $customURL)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
#if os(iOS)
                            .autocapitalization(.none)
                            .keyboardType(.URL)
#endif
                    }
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Production Server URL")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(webSocketURL)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(4)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var connectionTestSection: some View {
        if useWebSocket {
            Section(header: Text("Connection Test")) {
                Button(action: testConnection) {
                    HStack {
                        if isTestingConnection {
                            ProgressView()
                                .scaleEffect(0.8)
                            Text("Testing...")
                        } else {
                            Image(systemName: "network")
                            Text("Test Connection")
                        }
                    }
                }
                .disabled(isTestingConnection)

                if !connectionTestResult.isEmpty {
                    Text(connectionTestResult)
                        .font(.caption)
                        .foregroundColor(connectionTestResult.contains("✅") ? .green : .red)
                        .padding(.top, 4)
                }
            }
        }
    }

    @ViewBuilder
    private var statusSection: some View {
        Section(header: Text("Status")) {
            HStack {
                Text("Current Status")
                Spacer()
                Text(statusText)
                    .foregroundColor(statusColor)
                    .font(.caption)
            }

            HStack {
                Text("Transport Type")
                Spacer()
                Text(currentTransportType)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }

            if watchPartyManager.isConnected {
                HStack {
                    Text("Participants")
                    Spacer()
                    Text("\(watchPartyManager.participants.count)")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
        }
    }

    @ViewBuilder
    private var resetSection: some View {
        Section(header: Text("Reset"), footer: Text("This will reset all transport settings to their default values.")) {
            Button("Reset to Defaults") {
                resetToDefaults()
            }
            .foregroundColor(.red)
        }
    }

    // MARK: - Computed Properties

    private var transportDescription: String {
        if !useWebSocket {
            return "Local Loopback: For development and testing without a server. All synchronization happens locally."
        } else if useCustomURL {
            return "Custom WebSocket: Connect to a custom WebSocket server for testing or development."
        } else {
            return "Production WebSocket: Connect to the production watch party server for real-time synchronization with other users."
        }
    }

    private var statusText: String {
        switch watchPartyManager.connectionState {
        case .disconnected:
            return "Disconnected"
        case .connecting:
            return "Connecting..."
        case .connected:
            return "Connected"
        case .failed:
            return "Connection Failed"
        }
    }

    private var statusColor: Color {
        switch watchPartyManager.connectionState {
        case .disconnected:
            return .secondary
        case .connecting:
            return .orange
        case .connected:
            return .green
        case .failed:
            return .red
        }
    }

    private var currentTransportType: String {
        switch watchPartyManager.currentTransport {
        case .localLoopback:
            return "Local Loopback"
        case .webSocket(_):
            return "WebSocket"
        }
    }

    // MARK: - Methods

    private func loadSettings() {
        watchPartyManager.loadTransportSettings()

        switch watchPartyManager.currentTransport {
        case .localLoopback:
            useWebSocket = false
        case .webSocket(let url):
            useWebSocket = true
            if url == webSocketURL {
                useCustomURL = false
            } else {
                useCustomURL = true
                customURL = url
            }
        }
    }

    private func saveSettings() {
        updateTransport()
        watchPartyManager.saveTransportSettings()
    }

    private func updateTransport() {
        let transportType: WatchPartyManager.TransportType

        if useWebSocket {
            let url = useCustomURL ? customURL : webSocketURL
            transportType = .webSocket(url: url)
        } else {
            transportType = .localLoopback
        }

        watchPartyManager.setTransport(transportType)
    }

    private func resetToDefaults() {
        useWebSocket = false
        useCustomURL = false
        customURL = ""
        connectionTestResult = ""
        updateTransport()
        watchPartyManager.saveTransportSettings()
    }

    private func testConnection() {
        guard useWebSocket else { return }

        isTestingConnection = true
        connectionTestResult = ""

        let testURL = useCustomURL ? customURL : webSocketURL

        Task {
            do {
                // Create a temporary WebSocket transport for testing
                let testTransport = WebSocketTransport(endpoint: testURL)

                // Try to connect with a test token
                try await testTransport.connect(token: "test-token", roomId: "test-room", role: .guest)

                // If we get here, connection was successful
                await MainActor.run {
                    self.connectionTestResult = "✅ Connection successful to \(testURL)"
                    self.isTestingConnection = false
                    self.showingConnectionTest = true
                }

                // Clean up
                testTransport.disconnect()

            } catch {
                await MainActor.run {
                    self.connectionTestResult = "❌ Connection failed: \(error.localizedDescription)"
                    self.isTestingConnection = false
                    self.showingConnectionTest = true
                }
            }
        }
    }
}

// MARK: - Preview

struct WatchPartySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WatchPartySettingsView()
    }
}
