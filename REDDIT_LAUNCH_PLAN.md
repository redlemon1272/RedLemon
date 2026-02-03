# 🍋 RedLemon Reddit Launch Strategy

> **Target Date:** Wednesday (Tomorrow) 11:45 AM ET (except r/selfhosted)
> **Objective:** Convert `r/piracy` skeptics and `r/macapps` enthusiasts into active users.

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

> [!IMPORTANT]
> **Compliance:** You MUST message [modmail](https://www.reddit.com/message/compose?to=%2Fr%2FPiracy&subject=Self+Promotion+Post) for approval before posting. Frame it as "sharing a free, native tool for the community."

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

| Subreddit | Entry Strategy & Rules |
| :--- | :--- |
| **r/macapps** | Use **ABC Format**. Title must start with `[OS]`. Disclose you are the dev in comments. (Max 1x per 30 days). |
| **r/RealDebrid** | Post as a "Free Community Tool." Do NOT emphasize the premium features; focus on the free events/joining. |
| **r/PiracyBackup** | **GREAT TARGET.** Use the "DesktopTelly" style: Clear title with "Debrid Support," bulleted features, and Discord/GitHub links. |
| **r/selfhosted** | **WAIT UNTIL FRIDAY.** Only allowed during "Vibe Code Friday." Focus on the Caddy/Supabase infrastructure. |

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

---

## 6. Modmail Template (For r/piracy)

**Subject:** Request to share a native macOS project (RedLemon)

**Message:** 

 Hi Mods,

I’ve built a native macOS app called RedLemon that handles Real-Debrid streaming and synchronized watch parties. I wanted to share it with the community because there doesn't seem to be existing tools that allow debrid backed "drop in, drop out" watch parties.

The UI is open source and it focuses heavily on privacy (Keychain for keys, zero telemetry). There is a free tier that allows anyone to join parties and host one watch party per day. 

Would it be okay to share a launch post with the community?

https://www.reddit.com/r/redlemonapp/comments/1qv2jdp/release_redlemon_a_native_macos_watch_party/ 

the link above shows what i would ultimately post, if granted permission to do so.

Cheers!
