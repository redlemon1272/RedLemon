# RedLemon

> **One Click. Play. Together.**
>
> A native macOS streaming app with real-time watch parties, 24/7 live events, and one-click playback.
> **Powered by Real-Debrid.**

<img src="https://github.com/redlemon1272/RedLemon/raw/main/Resources/AppIcon.png" width="128" alt="RedLemon">

## 🚀 What is RedLemon?

RedLemon is a next-generation streaming client built for macOS. It aggregates content into a beautiful, unified interface with a focus on **social watching**.

*   **Live Cinema Events**: Scheduled community screenings where everyone watches synchronized in real-time. (See: `EventsView.swift`)
*   **Watch Parties**: Create public or private rooms with low-latency sync using a native MPV integration. (See: `MPVWrapper.swift`, `LobbyView.swift`)
*   **One-Click Play**: Aggregates providers into a single "Play" button. (Powered by the closed-source Stream Resolver).
*   **Native Performance**: 100% Swift/SwiftUI with Metal-accelerated video playback. Zero Electron/Webview bloat. (See: `RedLemonApp.swift`)

## 🛡️ Hybrid Open Source Model

**Current Version:** v1.0.165 (build 165)

RedLemon is built on a **Hybrid Open Source** model. We believe in transparency without compromising the operational security of our networks.

### What is Open Source? (85%+)
You can inspect the vast majority of the codebase in this repository, including:
*   **The Full UI**: Verify that there are no hidden buttons, overlays, or dark patterns.
*   **Networking Layer**: `SupabaseClient.swift` and `LocalAPIClient.swift` show exactly where your data goes (and doesn't go).
*   **Telemetry (None)**: You can verify that we do not include Google Analytics, Facebook Pixel, or any third-party trackers.
*   **Credential Handling**: `KeychainManager.swift` proves your API keys are stored in the macOS Secure Enclave, never in plaintext.

### What is Closed Source? (<15%)
To prevent abuse of our aggregation infrastructure and protect our competitive algorithms, the following components are **stubbed** in this repo but present in the official binary:
*   **Stream Resolution Engine**: The logic that aggregates and ranks providers.
*   **Sync Algorithms**: The drift-correction math for watch parties.
*   **Payment/Crypto Logic**: Security-critical wallet handling.

## 📥 Installation

**[Download the latest release here](https://github.com/redlemon1272/RedLemon/releases/latest)**

### The "Magic" Command
You can also install via terminal:
```bash
curl -sL https://raw.githubusercontent.com/redlemon1272/RedLemon/main/scripts/install.sh | bash
```

> **Pro Tip**: Using the command above automatically handles the macOS "Unsigned App" warning for you. If you install manually via DMG, you will need to click **Open Anyway** in **System Settings > Privacy & Security**.

## 🛠️ Building From Source

This repository contains the UI scaffolding. You can build it to inspect the code structure, but **playback will not work** without the proprietary plugins found in the official release.

1.  Clone the repo.
2.  Open `RedLemon.xcodeproj`.
3.  Build & Run (Cmd+R).

### Privacy & Security
*   **Privacy-Focused**: Zero advertisement tracking or behavioral analytics.
*   **Hybrid Cloud**: Watch History and Library are synced securely via Supabase for cross-device continuity.
*   **Local-First Preferences**: App settings and playback preferences are stored locally on your device.
*   **Secure Storage**: All sensitive tokens (Real-Debrid, API Keys) are stored in the macOS Keychain.

## 📄 License

RedLemon is released under the **MIT License**.
See [LICENSE](LICENSE) for details.

---
*Disclaimer: RedLemon is a media aggregation tool. Users are responsible for their own content consumption and must comply with local laws.*
