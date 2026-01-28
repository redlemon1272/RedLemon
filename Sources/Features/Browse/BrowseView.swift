import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        BrowseViewContainer(appState: appState)
    }
}

private struct BrowseViewContainer: View {
    @StateObject var viewModel: BrowseViewModel

    init(appState: AppState) {
        _viewModel = StateObject(wrappedValue: BrowseViewModel(appState: appState))
    }

    var body: some View {
        BrowseViewContent(viewModel: viewModel)
    }
}

struct BrowseViewContent: View {
    @ObservedObject var viewModel: BrowseViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            if viewModel.isStabilizing {
                Color.clear
            } else {
                VStack(spacing: 0) {
                    // Tab selector
                    Picker("Media Type", selection: $viewModel.selectedTab) {
                        ForEach(MediaType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: viewModel.selectedTab) { newValue in
                        // Using a task to ensure it runs correctly and avoids issues with ObservedObject bindings
                        Task { @MainActor in
                            viewModel.handleTabChange(to: newValue)
                        }
                    }

                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if let error = viewModel.errorMessage {
                        VStack(spacing: 20) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size: 48))
                                .foregroundColor(.orange)
                            Text("Error Loading Content")
                                .font(.title2)
                            Text(error)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            Button("Retry") {
                                Task {
                                    await viewModel.loadContent()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    } else {
                        ScrollViewReader { proxy in
                            ScrollView(.vertical, showsIndicators: true) {
                                VStack(alignment: .leading, spacing: 24) {
                                    // Continue Watching section
                                    continueWatchingSection
                                        .id("continue-watching")

                                    // Popular section
                                    StreamingServiceRow(
                                        title: viewModel.selectedTab == .movies ? "Popular Movies" : "Popular TV Shows",
                                        items: viewModel.selectedTab == .movies ? appState.popularMovies : appState.popularShows,
                                        isLoading: viewModel.isPopularLoading,
                                        scrollOffset: nil, // PERF: Don't track scroll during scrolling
                                        onTap: { item in viewModel.selectMedia(item, fromRow: "popular") }
                                    )
                                    .id("popular")

                                    // Trending section (Hero)
                                    LazyStreamingServiceRow(
                                        title: viewModel.selectedTab == .movies ? "Trending Movies" : "Trending TV Shows",
                                        catalogKey: "trending",
                                        items: appState.browseCatalogs[viewModel.getStorageKey("trending")] ?? [],
                                        isLoading: appState.browseIsLoadingCatalogs.contains(viewModel.getStorageKey("trending")),
                                        scrollOffset: nil,
                                        onTap: { item in viewModel.selectMedia(item, fromRow: "trending") },
                                        onAppear: { await viewModel.loadCatalogIfNeeded(key: "trending", isTrending: true) }
                                    )
                                    .id("trending")

                                    Divider()
                                        .padding(.horizontal)

                                    // NEW: "Blazing Fast" Service Browse Grid
                                    VStack(alignment: .leading, spacing: 16) {
                                        HStack {
                                            Text("Browse Services")
                                                .font(.title2.weight(.bold))

                                            Spacer()

                                            Picker("", selection: $viewModel.selectedService) {
                                                ForEach(viewModel.getStreamingServiceKeys(), id: \.self) { key in
                                                    Text(viewModel.getServiceDisplayName(key)).tag(key)
                                                }
                                            }
                                            .pickerStyle(.menu)
                                            .onChange(of: viewModel.selectedService) { newValue in
                                                viewModel.handleServiceChange(to: newValue)
                                            }
                                        }
                                        .padding(.horizontal)

                                        if viewModel.isServiceLoading && (appState.browseCatalogs[viewModel.getStorageKey(viewModel.selectedService)] ?? []).isEmpty {
                                            HStack {
                                                Spacer()
                                                ProgressView()
                                                    .padding()
                                                Spacer()
                                            }
                                            .frame(height: 400)
                                        } else {
                                            let items = appState.browseCatalogs[viewModel.getStorageKey(viewModel.selectedService)] ?? []

                                            if items.isEmpty {
                                                VStack(spacing: 12) {
                                                    Image(systemName: "film")
                                                        .font(.system(size: 48))
                                                        .foregroundColor(.secondary)
                                                    Text("Loading service content...")
                                                        .foregroundColor(.secondary)
                                                }
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 400)
                                            } else {
                                                // Grid layout matching Discover page's speed
                                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                                                    ForEach(items) { item in
                                                        Button(action: {
                                                            viewModel.selectMedia(item, fromRow: viewModel.selectedService)
                                                        }) {
                                                            OptimizedMediaCard(item: item)
                                                        }
                                                        .buttonStyle(.scalableMedia)
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                        }
                                    }
                                    .id("service-grid")
                                }
                                .padding(.bottom)
                            }
                            .onAppear {
                                restoreScrollPosition(using: proxy)
                            }
                            .onChange(of: appState.popularMovies) { _ in restoreScrollPosition(using: proxy) }
                            .onChange(of: appState.popularShows) { _ in restoreScrollPosition(using: proxy) }
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.selectedTab == .movies ? "Browse Movies" : "Browse TV Shows")
        .sheet(item: $viewModel.selectedHistoryItem) { historyItem in
            WatchModeSelectionView(historyItem: historyItem, appState: appState)
        }
        .task {
            // Wait for server to be ready before loading content
            while !appState.isServerReady {
                try? await Task.sleep(nanoseconds: 100_000_000) //100ms
            }

            // Load all content (Hero + Grid)
            await viewModel.loadContent()

            viewModel.loadRecentlyWatched()
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisappear()
        }
        .alert("Notice", isPresented: $viewModel.showMessageAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.alertMessage)
        }
    }

    @ViewBuilder
    private var continueWatchingSection: some View {
        let history = viewModel.filteredHistoryItems
        if !history.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text("Continue Watching")
                    .font(.title2.weight(.bold))
                    .padding(.horizontal)

                VersionAwareHorizontalScrollView {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(history) { historyItem in
                            Button(action: {
                                guard !viewModel.isNavigating else { return }
                                viewModel.isNavigating = true
                                Task { @MainActor in
                                    viewModel.showWatchModeSelection(for: historyItem)
                                    viewModel.isNavigating = false
                                }
                            }) {
                                RecentlyWatchedCard(historyItem: historyItem)
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(.scalableMedia)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 300)
            }
            .padding(.top)
        }
    }

    private func restoreScrollPosition(using proxy: ScrollViewProxy) {
        guard let scrollTo = appState.browseScrollPosition else { return }

        // Ensure main content is loaded
        let isContentReady = viewModel.selectedTab == .movies ? !appState.popularMovies.isEmpty : !appState.popularShows.isEmpty
        guard isContentReady else { return }

        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 50_000_000)
            if appState.browseScrollPosition == scrollTo {
                proxy.scrollTo(scrollTo, anchor: .top) // OK: Content-Aware guard at L202
                appState.browseScrollPosition = nil
            }
        }
    }
}
