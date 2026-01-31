# 🍋 RedLemon Reddit Launch Strategy

> **Target Date:** Wednesday, 11:45 AM Eastern Time
> **Objective:** Convert `r/piracy` skeptics into active users and seed the `r/redlemonapp` community.

---

## 1. The Pre-Flight: `r/redlemonapp` (Social Proof)
Before posting on the big subs, the home subreddit must look "alive." 

### Post #1: The Welcome & FAQ (Sticky)
*   **Title:** Welcome to RedLemon 🍋 | Native macOS Watch Party App (Getting Started & FAQ)
*   **Content:** 
    *   Intro: 100% Native SwiftUI, high-performance sync, Real-Debrid focused.
    *   Install: Highlight the `curl` command.
    *   Security: Deep link to the GitHub for transparency and Keychain mention.
    *   Monetization: ELI5 the 1-host-per-day free tier vs $4 premium.
*   **Visuals:** Use the "Real" screenshots (copyrighted posters allowed here).

### Post #2: Join the Beta Gallery
*   **Title:** Show us your setups! 📸
*   **Content:** Encourage the first few users to post screenshots of their watch parties or lobbies.

---

## 2. The Main Event: `r/piracy`
This is the highest-risk, highest-reward post.

### The Pitch
*   **Title:** [Project] RedLemon: A Native macOS Streaming App for Real-Debrid with Built-in Watch Parties (100% Native, UI Open Source)
*   **Body Structure:**
    1.  **The "Why":** "I was tired of web-wrappers and high CPU usage on my Mac. I built this to be fast, native, and social."
    2.  **The Tech:** Mention Swift, MPV, and macOS Keychain (Trust building).
    3.  **The Feature:** Focus on the "Lobby" system. Instant jump-in/jump-out sync.
    4.  **The Code:** Link to the GitHub repo. Explicitly mention the "Hybrid Open Source" model (UI public, sync logic stubs).
    5.  **The Install:** `curl -sL https://raw.githubusercontent.com/redlemon1272/RedLemon/main/scripts/install.sh | bash`

### The "Skeptic" Defense (Comment Strategy)
*   **Question:** "Why not just use Stremio?" 
    *   **Answer:** "Stremio is great! RedLemon is for users who want a native macOS experience, 0.3s sync latency, and a built-in lobby system without configuring plugins."
*   **Question:** "Is this a virus?"
    *   **Answer:** "Repo is right here. You can audit the networking layer. We use Keychain for token storage, which even the OS recommends."
*   **Question:** "Why is parts of it closed source?"
    *   **Answer:** "To prevent botting/abuse of the aggregation infrastructure. The UI and the security-critical bits are open for everyone to see."

---

## 3. The Satellite Subs (Niche Cross-Posting)
Wait 2-4 hours after the `r/piracy` post to cross-post to:

| Subreddit | Angle |
| :--- | :--- |
| `r/macapps` | Focus on the **Native SwiftUI** design and Apple Silicon performance. |
| `r/RealDebrid` | Focus on how it handles **metadata and library sync** natively. |
| `r/selfhosted` | Focus on the **Caddy/Supabase** side (keep it developer-focused). |

---

## 4. Operational Checklists (OPSEC)
1.  **Screenshots:** Do NOT use the "Piracy Adjacent" screenshots on GitHub. Use them ONLY on Reddit/Subreddit.
2.  **Server Monitor:** Keep `AdminServerView` open. Watch the "Active Viewers" and "Connections" count.
3.  **The "Kill Switch":** If a major bug is found, use the `EventsConfig` to push a global "Maintenance Mode" alert via Supabase.

---

## 5. Metadata for Future AI Assistants
*   **The Subreddit:** [r/redlemonapp](https://www.reddit.com/r/redlemonapp/)
*   **The GitHub:** [redlemon1272/RedLemon](https://github.com/redlemon1272/RedLemon)
*   **Voice/Tone:** Technical, honest, direct, and slightly premium. We aren't "begging" for users; we are providing a high-end tool.
