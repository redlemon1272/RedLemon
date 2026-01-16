
// MARK: - Prestige Helpers

// Global helpers for prestige system to be used across views (Lobby, Profile, etc.)

func prestigeEmoji(rank: Int) -> String {
    switch rank {
    case 4...: return "👑✨🪐" // Tier 4
    case 3: return "👑💎"    // Tier 3
    case 2: return "👑🔥"    // Tier 2
    case 1: return "👑⚡️"    // Tier 1
    default: return ""
    }
}

func prestigeTitle(rank: Int) -> String {
    // Hidden mechanics - generic titles only
    return "Premium User"
}
