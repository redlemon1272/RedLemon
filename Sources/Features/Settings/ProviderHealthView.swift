
import SwiftUI

import AppKit

struct ProviderHealthView: View {
    @State private var providerHealth: [String: String] = [:]
    @State private var checkingHealth = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Provider Connectivity")
                    .font(.headline)
                
                Spacer()
                
                if checkingHealth {
                    ZStack {
                        ProgressView()
                            .controlSize(.small)
                    }
                    .frame(width: 16, height: 16) // Enforce explicit frame to prevent layout crash
                } else {
                    Button(action: {
                        Task {
                            await checkProviderHealth()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                    .buttonStyle(.plain)
                    .help("Refresh Status")
                }
            }
            
            if providerHealth.isEmpty {
                // If it's empty, and we are not checking, auto-check on appear?
                // Or show "Unknown".
                if checkingHealth {
                    Text("Checking connectivity...")
                        .foregroundColor(.secondary)
                        .font(.callout)
                } else {
                    Text("No status data available")
                        .foregroundColor(.secondary)
                        .font(.callout)
                }
            } else {
                VStack(spacing: 8) {
                    // Filter out Zilean as requested by user
                    ForEach(Array(providerHealth.keys.sorted().filter { $0 != "zilean" }), id: \.self) { provider in
                        HStack {
                            Text(provider.capitalized)
                                .font(.system(.body, design: .monospaced))
                            
                            Spacer()
                            
                            let status = providerHealth[provider] ?? "Unknown"
                            Text(status)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(status == "Online" ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                                .foregroundColor(status == "Online" ? .green : .red)
                                .cornerRadius(4)
                        }
                        .padding(8)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(6)
                    }
                }
            }
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
        .task {
            // Auto check if empty
            if providerHealth.isEmpty {
                await checkProviderHealth()
            }
        }
    }
    
    private func checkProviderHealth() async {
        checkingHealth = true
        // Allow UI to update
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        let health = await ProviderManager.shared.checkAllHealth()
        await MainActor.run {
            self.providerHealth = health
            self.checkingHealth = false
        }
    }
}
