import Foundation

// Quick test to verify season/episode fields exist in SupabaseRoom
// This will compile successfully if the migration worked

let testRoom = SupabaseRoom(
    id: "TEST",
    name: "Test Room",
    hostUserId: UUID(),
    hostUsername: "test",
    streamHash: nil,
    imdbId: nil,
    posterUrl: nil,
    backdropUrl: nil,
    playbackPosition: 0,
    isPlaying: false,
    participantsCount: 1,
    maxParticipants: 10,
    isPublic: true,
    createdAt: Date(),
    lastActivity: Date(),
    season: 5,  // ✅ This will fail to compile if migration didn't work
    episode: 10  // ✅ This will fail to compile if migration didn't work
)

print("✅ Migration verified! Season: \(testRoom.season ?? 0), Episode: \(testRoom.episode ?? 0)")
