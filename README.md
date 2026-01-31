# RedLemon

> **One Click. Play. Together.**
>
> A native macOS streaming app with real-time watch parties, 24/7 live events, and one-click playback.

<img src="https://github.com/redlemon1272/RedLemon/raw/main/Resources/AppIcon.png" width="128" alt="RedLemon">

RedLemon is a next-generation streaming client built for macOS. It aggregates content into a beautiful, unified interface with a focus on **social watching**.

### 💬 Join the Community
Join our official subreddit for feature requests, support, and community watch parties: **[r/redlemonapp](https://www.reddit.com/r/redlemonapp/)**

## 🛡️ Hybrid Open Source Model

**Current Version:** v1.0.180 (build 180)

RedLemon is built on a **Hybrid Open Source** model. We believe in transparency without compromising the operational integrity of our service.

### What is Open Source? (85%+)
You can inspect the vast majority of the codebase in this repository, including:
*   **The Full UI**: Verify that there are no hidden buttons, overlays, or dark patterns.
*   **Networking Layer**: `SupabaseClient.swift` and `LocalAPIClient.swift` show exactly where your data goes (and doesn't go).
*   **Telemetry (None)**: You can verify that we do not include Google Analytics, Facebook Pixel, or any third-party trackers.
*   **Credential Handling**: `KeychainManager.swift` proves your API keys are stored securely in the macOS Keychain, never in plaintext.

### What is Closed Source? (<15%)
To prevent abuse of our aggregation infrastructure and protect our proprietary algorithms, the following components are **stubbed** in this repo but present in the official binary:
*   **Stream Resolution Engine**: The logic that selects and ranks compatible streams.
*   **Sync Algorithms**: The drift-correction math for watch parties.
*   **Payment/Security Logic**: Security-critical wallet and authentication handling.

## 📥 Installation

**[Download the latest release here](https://github.com/redlemon1272/RedLemon/releases/latest)**

### Command-Line Installer (Recommended)
You can install RedLemon via a single command. This method is recommended as it automatically handles the macOS gatekeeper permissions for you:
```bash
curl -sL https://raw.githubusercontent.com/redlemon1272/RedLemon/main/scripts/install.sh | bash
```

> **Why use the terminal command?**
> The installer downloads the binary, moves it to your `/Applications` folder, and removes the "Quarantine" flag. If you install manually via DMG, you will need to manually authorize the app in **System Settings > Privacy & Security**.

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

The open-source components of RedLemon are released under the **MIT License**.
See [LICENSE](LICENSE) for details.

---
*Disclaimer: RedLemon is a media aggregation tool. Users are responsible for their own content consumption and must comply with local laws.*
