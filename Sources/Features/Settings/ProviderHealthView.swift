
import SwiftUI

import AppKit

struct ProviderHealthView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Provider Connectivity")
                    .font(.headline)

                Spacer()

                if appState.isCheckingProviders {
                    ZStack {
                        ProgressView()
                            .controlSize(.small)
                    }
                    .frame(width: 16, height: 16)
                } else {
                    Button(action: {
                        appState.checkProviderHealth()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                    .buttonStyle(.plain)
                    .help("Refresh Status")
                }
            }

            if appState.providerHealth.isEmpty {
                if appState.isCheckingProviders {
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
                    ForEach(Array(appState.providerHealth.keys.sorted()), id: \.self) { provider in
                        HStack {
                            Text(provider.capitalized)
                                .font(.system(.body, design: .monospaced))

                            Spacer()

                            let status = appState.providerHealth[provider] ?? "Unknown"
                            Text(status)
                                .font(.system(size: 11, weight: .bold)) // macOS 12 compatibility
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(colorForStatus(status).opacity(0.2))
                                .foregroundColor(colorForStatus(status))
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
    }

    private func colorForStatus(_ status: String) -> Color {
        switch status {
        case "Online": return .green
        case "Degraded": return .orange
        case "Missing", "Missing API Key", "Missing Token": return .secondary
        case "Invalid API Key", "Invalid Token": return .red
        case "Offline": return .red
        default: return .secondary
        }
    }

}

