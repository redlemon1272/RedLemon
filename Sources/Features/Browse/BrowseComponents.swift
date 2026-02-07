import SwiftUI
import AppKit

// MARK: - Performance: In-Memory Image Cache
// Provides synchronous access to images without async overhead
class PosterImageCache {
    static let shared = NSCache<NSString, NSImage>()

    static func get(_ key: String) -> NSImage? {
        return shared.object(forKey: key as NSString)
    }

    static func set(_ key: String, image: NSImage) {
        shared.setObject(image, forKey: key as NSString)
    }
}

// MARK: - Components for BrowseView

// Watch Mode Selection Sheet
struct WatchModeSelectionView: View {
    let historyItem: WatchHistoryItem
    let appState: AppState
    @Environment(\.dismiss) var dismiss
    @State private var isCreatingRoom = false

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text("Continue Watching")
                        .font(.title.weight(.bold))

                    Text(historyItem.mediaItem.name)
                        .font(.title3)
                        .foregroundColor(.secondary)

                    // Progress info
                    HStack(spacing: 12) {
                        Text("\(historyItem.progressPercent)% watched")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        if let season = historyItem.season, let episode = historyItem.episode {
                            Text("•")
                                .foregroundColor(.secondary)
                            Text("S\(season) E\(episode)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.top, 32)

                Spacer()

                // Watch mode buttons
                VStack(spacing: 16) {
                    // Solo options
                    VStack(spacing: 12) {
                        Text("Solo Options")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        HStack(spacing: 12) {
                            // Continue button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .solo, shouldResume: true)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "play.fill")
                                    Text("Continue")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)

                            // Start from beginning button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .solo, shouldResume: false)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "play.circle.fill")
                                    Text("Start from Beginning")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    // Watch Party options
                    VStack(spacing: 12) {
                        Text("Watch Party Options")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        HStack(spacing: 12) {
                            // Resume button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .watchParty, shouldResume: true)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "person.2.fill")
                                    Text("Continue from \(formatTime(historyItem.timestamp))")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)

                            // Start from beginning button
                            Button(action: {
                                Task {
                                    await resumePlayback(mode: .watchParty, shouldResume: false)
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: "person.2.fill")
                                    Text("Start from Beginning")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    // Go to Detail Page button
                    Button(action: {
                        goToDetailPage()
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Go to Detail Page")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 32)

                Spacer()

                // Cancel button
                Button("Cancel") {
                    dismiss()
                }
                .padding(.bottom, 24)
            }
            .frame(width: 450, height: 550)
            .disabled(isCreatingRoom)

            // Loading overlay
            if isCreatingRoom {
                ZStack {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 16) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))

                        Text("Creating room...")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding(32)
                    .background(Color(white: 0.2))
                    .cornerRadius(16)
                }
            }
        }
    }

    private func resumePlayback(mode: WatchMode, shouldResume: Bool = true) async {
        if mode == .watchParty {
            await MainActor.run {
                isCreatingRoom = true
            }
        }

        await MainActor.run {
            appState.player.selectedMediaItem = historyItem.mediaItem
            if shouldResume {
                appState.player.resumeFromTimestamp = historyItem.timestamp
            } else {
                appState.player.resumeFromTimestamp = nil
            }

            if let season = historyItem.season, let episode = historyItem.episode {
                appState.selectedSeason = season
                appState.selectedEpisode = episode
            }
        }

        let quality = VideoQuality(rawValue: historyItem.quality ?? "1080p") ?? .fullHD

        if mode == .watchParty {
            await MainActor.run {
                appState.player.currentWatchMode = .watchParty
                isCreatingRoom = false
            }

            // CRITICAL: Dismiss sheet BEFORE changing root view to prevent SwiftUI hang/freeze
            dismiss()

            // Small delay to allow sheet dismissal to begin/process before unmounting parent
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s

            await MainActor.run {
                appState.currentView = .qualitySelection
            }
        } else {
            dismiss()
            await appState.player.playMedia(
                historyItem.mediaItem,
                quality: quality,
                watchMode: .solo
            )
        }
    }

    private func goToDetailPage() {
        Task { @MainActor in
            appState.player.selectedMediaItem = historyItem.mediaItem
            if let season = historyItem.season, let episode = historyItem.episode {
                appState.selectedSeason = season
                appState.selectedEpisode = episode
            }

            // CRITICAL: Dismiss sheet BEFORE changing root view
            dismiss()

            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s

            appState.currentView = .mediaDetail
        }
    }

    private func formatTime(_ seconds: Double) -> String {
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) % 3600 / 60
        let secs = Int(seconds) % 60
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, secs)
        } else {
            return String(format: "%d:%02d", minutes, secs)
        }
    }
}

/// Card for recently watched items with progress bar
struct RecentlyWatchedCard: View {
    let historyItem: WatchHistoryItem
    @State private var cachedImage: NSImage?
    @State private var imageLoadTask: Task<Void, Never>?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image with progress overlay
            ZStack(alignment: .bottom) {
                if let image = cachedImage {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 220)
                        .overlay(
                            ProgressView()
                                .scaleEffect(0.8)
                        )
                }

                // Progress bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 4)

                        Rectangle()
                            .fill(Color.accentColor)
                            .frame(width: geometry.size.width * historyItem.progress, height: 4)
                    }
                }
                .frame(height: 4)
                .cornerRadius(2)
            }

            // Title
            Text(historyItem.mediaItem.name)
                .font(.subheadline.weight(.medium))
                .lineLimit(2)

            // Progress percentage
            Text("\(historyItem.progressPercent)% watched")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
        .onAppear {
            loadImage()
        }
        .onDisappear {
            imageLoadTask?.cancel()
        }
    }

    private func loadImage() {
        guard let posterURL = historyItem.mediaItem.posterURL else { return }
        let cacheKey = posterURL.absoluteString

        if let fastCached = PosterImageCache.get(cacheKey) {
            self.cachedImage = fastCached
            return
        }

        imageLoadTask?.cancel()
        imageLoadTask = Task {
            if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
                if !Task.isCancelled, let img = NSImage(data: cachedData) {
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run { self.cachedImage = img }
                }
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: posterURL)
                if !Task.isCancelled, let img = NSImage(data: data) {
                    await CacheManager.shared.setImageData(key: cacheKey, value: data)
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run { self.cachedImage = img }
                }
            } catch {}
        }
    }
}

/// Standard Media Card
struct MediaCard: View {
    let item: MediaItem
    @EnvironmentObject var appState: AppState
    @State private var cachedImage: NSImage?
    @State private var imageLoadTask: Task<Void, Never>?

    var progress: Double? {
        appState.watchHistoryProgress[item.id]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image
            ZStack {
                if let image = cachedImage {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 220)
                        .overlay(
                            ProgressView()
                                .scaleEffect(0.8)
                        )
                }

                // Progress bar overlay
                if let progress = progress, progress > 0 {
                    VStack {
                        Spacer()
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.black.opacity(0.6))
                                .frame(height: 6)

                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(width: 150 * progress, height: 6)
                        }
                        .cornerRadius(3)
                        .padding([.horizontal, .bottom], 4)
                    }
                }

                // Rating badge
                if let rating = item.imdbRating {
                    VStack {
                        HStack {
                            Spacer()
                            Text("⭐️ \(rating)")
                                .font(.caption)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .cornerRadius(6)
                                .padding(8)
                        }
                        Spacer()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                // Title
                Text(item.name)
                    .font(.subheadline.weight(.medium))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Year
                if let year = item.year {
                    Text(year)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }


        }
        .frame(width: 150)
        .onAppear {
            loadImage()
        }
        .onDisappear {
            imageLoadTask?.cancel()
        }
    }

    private func loadImage() {
        guard let posterURL = item.posterURL else { return }
        let cacheKey = posterURL.absoluteString

        if let fastCached = PosterImageCache.get(cacheKey) {
            self.cachedImage = fastCached
            return
        }

        imageLoadTask?.cancel()
        imageLoadTask = Task {
            if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
                if !Task.isCancelled, let img = NSImage(data: cachedData) {
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run { self.cachedImage = img }
                }
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: posterURL)
                if !Task.isCancelled, let img = NSImage(data: data) {
                    await CacheManager.shared.setImageData(key: cacheKey, value: data)
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run { self.cachedImage = img }
                }
            } catch {}
        }
    }
}

/// Optimized MediaCard with memory management and NSCache fast-path
struct OptimizedMediaCard: View {
    let item: MediaItem
    @EnvironmentObject var appState: AppState
    @State private var cachedImage: NSImage?
    @State private var imageLoadTask: Task<Void, Never>?

    var progress: Double? {
        appState.watchHistoryProgress[item.id]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Poster image with memory optimization
            ZStack {
                if let image = cachedImage {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(8)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 220)
                        .overlay(
                            ProgressView()
                                .scaleEffect(0.8)
                        )
                }

                // Progress bar overlay
                if let progress = progress, progress > 0 {
                    VStack {
                        Spacer()
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.black.opacity(0.6))
                                .frame(height: 6)

                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(width: 150 * progress, height: 6)
                        }
                        .cornerRadius(3)
                        .padding([.horizontal, .bottom], 4)
                    }
                }

                // Rating badge
                if let rating = item.imdbRating {
                    VStack {
                        HStack {
                            Spacer()
                            Text("⭐️ \(rating)")
                                .font(.caption)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .cornerRadius(6)
                                .padding(8)
                        }
                        Spacer()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                // Title
                Text(item.name)
                    .font(.subheadline.weight(.medium))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Year
                if let year = item.year {
                    Text(year)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .frame(width: 150)
        .onAppear {
            loadImage()
        }
        .onDisappear {
            // Cancel image loading when view disappears
            imageLoadTask?.cancel()
            // PERF: Don't nil out cachedImage - keep in NSCache for fast reappear
        }
    }

    private func loadImage() {
        guard let posterURL = item.posterURL else { return }
        let cacheKey = posterURL.absoluteString

        // PERF: Fast-path - check NSCache synchronously first (no async overhead)
        if let fastCached = PosterImageCache.get(cacheKey) {
            self.cachedImage = fastCached
            return
        }

        imageLoadTask?.cancel()
        imageLoadTask = Task {
            // Check disk cache
            if let cachedData = await CacheManager.shared.getImageData(key: cacheKey) {
                if !Task.isCancelled, let img = NSImage(data: cachedData) {
                    // Populate fast cache
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run {
                        self.cachedImage = img
                    }
                }
                return
            }

            // Download
            do {
                let (data, _) = try await URLSession.shared.data(from: posterURL)
                if !Task.isCancelled, let img = NSImage(data: data) {
                    // Cache to disk
                    await CacheManager.shared.setImageData(key: cacheKey, value: data)
                    // Populate fast cache
                    PosterImageCache.set(cacheKey, image: img)
                    await MainActor.run {
                        self.cachedImage = img
                    }
                }
            } catch {
                // Silently fail - placeholder shown
            }
        }
    }
}

/// Horizontal row for streaming services
struct StreamingServiceRow: View {
    let title: String
    let items: [MediaItem]
    let isLoading: Bool
    let scrollOffset: Binding<CGFloat>?
    let onTap: (MediaItem) -> Void

    init(title: String, items: [MediaItem], isLoading: Bool = false, scrollOffset: Binding<CGFloat>? = nil, onTap: @escaping (MediaItem) -> Void) {
        self.title = title
        self.items = items
        self.isLoading = isLoading
        self.scrollOffset = scrollOffset
        self.onTap = onTap
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2.weight(.bold))
                .padding(.horizontal)

            if isLoading && items.isEmpty {
                HStack(spacing: 12) {
                    ProgressView()
                        .scaleEffect(0.8)
                    Text("Loading popular content...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal)
                .frame(height: 240)
            } else if !items.isEmpty {
                VersionAwareHorizontalScrollView(scrollOffset: scrollOffset) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(items) { item in
                            Button(action: {
                                onTap(item)
                            }) {
                                MediaCard(item: item)
                            }
                            .buttonStyle(.scalableMedia)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 300)
            }
        }
    }
}

/// Lazy loading streaming service row with visibility tracking
struct LazyStreamingServiceRow: View {
    let title: String
    let catalogKey: String
    let items: [MediaItem]
    let isLoading: Bool
    let scrollOffset: Binding<CGFloat>?
    let onTap: (MediaItem) -> Void
    let onAppear: () async -> Void
    var onVisibilityChange: ((String, Bool) -> Void)? = nil  // PERF: Track visibility

    @State private var hasAppeared = false
    @State private var lastKnownItemCount = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2.weight(.bold))
                .padding(.horizontal)

            if isLoading {
                HStack {
                    ProgressView()
                        .scaleEffect(0.8)
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .frame(height: 240)
            } else if !items.isEmpty {
                VersionAwareHorizontalScrollView(scrollOffset: scrollOffset) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(items) { item in
                            Button(action: {
                                onTap(item)
                            }) {
                                OptimizedMediaCard(item: item)
                            }
                            .buttonStyle(.scalableMedia)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 300)
            }
        }
        .onAppear {
            onVisibilityChange?(catalogKey, true)
            let shouldLoad = !hasAppeared || items.isEmpty || lastKnownItemCount == 0
            if shouldLoad {
                hasAppeared = true
                Task {
                    await onAppear()
                }
            }
            lastKnownItemCount = items.count
        }
        .onDisappear {
            onVisibilityChange?(catalogKey, false)
        }
        .onChange(of: items.count) { newCount in
            if newCount == 0 && lastKnownItemCount > 0 {
                Task {
                    try? await Task.sleep(nanoseconds: 2_000_000_000)
                    await onAppear()
                }
            }
            lastKnownItemCount = newCount
        }
    }
}
