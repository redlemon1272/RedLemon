import SwiftUI

struct VerifiedStreamsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var streams: [SupabaseClient.VerifiedStream] = []
    @State private var titles: [String: String] = [:]
    @State private var isLoading = false
    @State private var errorMessage: String?

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

            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else if streams.isEmpty {
                Text("No verified streams found.")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(streams, id: \.streamHash) { stream in
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
    
    private func fetchTitle(for imdbId: String) async {
        // Simple Cinemeta lookup
        guard let url = URL(string: "https://v3-cinemeta.strem.io/meta/movie/\(imdbId).json") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(CinemetaResponse.self, from: data)
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
struct CinemetaResponse: Codable {
    let meta: CinemetaMeta
}

struct CinemetaMeta: Codable {
    let name: String?
}
