import SwiftUI

struct VerifiedStreamsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var streams: [SupabaseClient.VerifiedStream] = []
    @State private var titles: [String: String] = [:]
    @State private var isLoading = false
    @State private var errorMessage: String?

    @State private var searchText = ""
    @State private var streamToDelete: SupabaseClient.VerifiedStream?
    @State private var showDeleteConfirmation = false
    
    var filteredStreams: [SupabaseClient.VerifiedStream] {
        if searchText.isEmpty {
            return streams
        } else {
            return streams.filter { stream in
                let title = titles[stream.imdbId]?.lowercased() ?? ""
                return stream.imdbId.localizedCaseInsensitiveContains(searchText) ||
                       title.localizedCaseInsensitiveContains(searchText) ||
                       stream.quality.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Verified Streams")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
                .keyboardShortcut(.escape, modifiers: [])
            }
            .padding()
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search by ID, Title or Quality", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)

            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else if filteredStreams.isEmpty {
                Text(searchText.isEmpty ? "No verified streams found." : "No matches found.")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(filteredStreams, id: \.streamHash) { stream in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(titles[stream.imdbId] ?? stream.imdbId)
                                    .font(.system(.headline, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                if titles[stream.imdbId] == nil {
                                    Text(stream.imdbId)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text(stream.quality)
                                    .font(.caption)
                                    .padding(4)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(4)
                            }
                            
                            Text("Hash: \(stream.streamHash)")
                                .font(.system(.caption, design: .monospaced))
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(.green)
                                Text("\(stream.voteCount) votes")
                                
                                Spacer()
                                
                                if let date = stream.lastVerifiedAt {
                                    Text(date.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .font(.caption)
                        }
                        
                        Divider()
                        
                        // Delete / Unlock Button
                        Button(action: {
                            streamToDelete = stream
                            showDeleteConfirmation = true
                        }) {
                            Image(systemName: "lock.open.fill")
                                .font(.title2)
                                .foregroundColor(.red)
                                .padding(8)
                        }
                        .buttonStyle(.borderless)
                        .help("Unlock/Delete this verified stream")
                    }
                    .padding(.vertical, 4)
                    .task {
                        if titles[stream.imdbId] == nil {
                            await fetchTitle(for: stream.imdbId)
                        }
                    }
                }
            }
        }
        .task {
            await loadStreams()
        }
        .alert("Unlock Stream?", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Unlock / Delete", role: .destructive) {
                if let stream = streamToDelete {
                    Task {
                        await deleteStream(stream)
                    }
                }
            }
        } message: {
            if let stream = streamToDelete {
                let title = titles[stream.imdbId] ?? stream.imdbId
                Text("Are you sure you want to remove the verified status for '\(title)'? The system will revert to searching fresh sources.")
            } else {
                Text("Are you sure you want to delete this verified stream?")
            }
        }
    }

    private func loadStreams() async {
        isLoading = true
        errorMessage = nil
        do {
            streams = try await SupabaseClient.shared.getAllVerifiedStreams()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    private func deleteStream(_ stream: SupabaseClient.VerifiedStream) async {
        do {
            try await SupabaseClient.shared.deleteVerifiedStream(streamHash: stream.streamHash)
            await loadStreams() // Reload list
        } catch {
            errorMessage = "Failed to delete: \(error.localizedDescription)"
        }
    }
    
    private func fetchTitle(for imdbId: String) async {
        // Simple Cinemeta lookup
        guard let url = URL(string: "https://v3-cinemeta.strem.io/meta/movie/\(imdbId).json") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MinimalCinemetaResponse.self, from: data)
            if let title = response.meta.name {
                await MainActor.run {
                    titles[imdbId] = title
                }
            }
        } catch {
            print("Failed to fetch title for \(imdbId): \(error)")
        }
    }
}

// Minimal decodables for title fetching
struct MinimalCinemetaResponse: Codable {
    let meta: MinimalCinemetaMeta
}

struct MinimalCinemetaMeta: Codable {
    let name: String?
}
