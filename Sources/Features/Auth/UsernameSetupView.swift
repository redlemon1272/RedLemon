//
//  UsernameSetupView.swift
//  RedLemon
//
//  Simple username setup for first-time users
//

import SwiftUI

struct UsernameSetupView: View {
    @EnvironmentObject var appState: AppState
    @State private var username: String = ""
    @State private var isCreating: Bool = false
    @State private var errorMessage: String?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 30)

            // Icon
            Image(systemName: "person.circle.fill")
                .font(.system(size: 70))
                .foregroundColor(.blue)

            // Title
            Text("Welcome to RedLemon!")
                .font(.system(size: 28, weight: .bold))

            Text("Choose a unique username")
                .font(.system(size: 16))
                .foregroundColor(.secondary)

            Text("Your username is permanent and lets friends find you")
                .font(.system(size: 13))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 380)

            Spacer().frame(height: 10)

            // Username input
            VStack(alignment: .leading, spacing: 6) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 16))
                    .frame(width: 300)
                    .disabled(isCreating)
                    .autocorrectionDisabled()
                    .onSubmit {
                        createUser()
                    }

                Text("3-20 characters, lowercase letters, numbers, and underscores only")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            // Fixed-height error message area (prevents layout shift)
            VStack {
                if let error = errorMessage {
                    Text(error)
                        .font(.callout)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 20)
                }
            }
            .frame(height: 50)
            .frame(maxWidth: 380)

            // Create button
            Button(action: createUser) {
                HStack(spacing: 8) {
                    if isCreating {
                        ProgressView()
                            .scaleEffect(0.8)
                            .frame(width: 16, height: 16)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                    }
                    Text(isCreating ? "Creating..." : "Get Started")
                        .font(.body.weight(.medium))
                }
                .frame(width: 200)
                .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .disabled(username.isEmpty || isCreating)

            Spacer()
        }
        .frame(width: 500, height: 500)
        .background(Color(NSColor.windowBackgroundColor))
    }

    private func createUser() {
        guard !username.isEmpty else { return }

        // Validate username format
        let trimmed = username.trimmingCharacters(in: .whitespaces).lowercased()
        guard trimmed.count >= 3 && trimmed.count <= 20 else {
            errorMessage = "Username must be 3-20 characters"
            return
        }

        guard trimmed.range(of: "^[a-z0-9_]+$", options: .regularExpression) != nil else {
            errorMessage = "Username can only contain lowercase letters, numbers, and underscores"
            return
        }

        isCreating = true
        errorMessage = nil

        Task {
            do {
                // Check if username already exists
                if let existingUser = try? await SupabaseClient.shared.getUserByUsername(username: trimmed) {
                    await MainActor.run {
                        errorMessage = "Username already taken. Please choose a different one."
                        isCreating = false
                    }
                    return
                }

                // Create or login with existing username (now safe because we checked existence)
                let user = try await SupabaseClient.shared.createOrGetUser(username: trimmed)

                // Save to keychain
                try await KeychainManager.shared.saveUsername(trimmed)
                try await KeychainManager.shared.save(credential: user.id.uuidString, for: "user_id")

                // Add lemontom as first friend (like Tom from MySpace!)
                await addDefaultFriend(userId: user.id)

                // Update app state
                await MainActor.run {
                    appState.currentUsername = trimmed
                    appState.currentUserId = user.id
                    isCreating = false
                    dismiss()
                }
                
                // Connect to Social Service (Presence)
                await SocialService.shared.connect(userId: user.id.uuidString, username: trimmed)

                NSLog("✅ User created: \(trimmed) (ID: \(user.id))")
            } catch {
                await MainActor.run {
                    // Parse error message
                    let errorMsg = error.localizedDescription
                    if errorMsg.contains("unique") || errorMsg.contains("duplicate") {
                        errorMessage = "Username already taken. Try another one."
                    } else {
                        errorMessage = "Failed to create user. Please try again."
                    }
                    isCreating = false
                }
                NSLog("❌ Failed to create user: \(error)")
            }
        }
    }

    /// Add lemontom as the default first friend (like Tom from MySpace!)
    private func addDefaultFriend(userId: UUID) async {
        do {
            // Get lemontom's user ID
            guard let lemontomUser = try await SupabaseClient.shared.getUserByUsername(username: "lemontom") else {
                NSLog("⚠️  lemontom user not found")
                return
            }

            // Directly create friendship (both ways) - no pending request needed
            try await SupabaseClient.shared.createFriendship(userId1: userId, userId2: lemontomUser.id)

            NSLog("🎉 lemontom is now your friend! (MySpace Tom style)")
        } catch {
            // Non-critical error, just log it
            NSLog("⚠️  Could not add lemontom as friend: \(error)")
        }
    }
}
