//
//  CacheManager.swift
//  RedLemon
//
//  Simplified caching system with fixed conservative limits
//

import Foundation

actor CacheManager {
    static let shared = CacheManager()

    private init() {}

    // MARK: - Cache Storage

    private var catalogCache: [String: CachedItem<[MediaItem]>] = [:]
    private var metadataCache: [String: CachedItem<MediaMetadata>] = [:]
    private var imageCache: [String: CachedItem<Data>] = [:]

    // MARK: - Cache Configuration (Fixed Conservative Values)

    private let catalogExpiration: TimeInterval = 3600 // 1 hour
    private let metadataExpiration: TimeInterval = 86400 // 24 hours
    private let imageExpiration: TimeInterval = 86400 // 24 hours

    private let maxCatalogItems = 100
    private let maxMetadataItems = 200
    private let maxImageItems = 1000

    /// Initialize cache with fixed conservative limits
    nonisolated func initializeLimits() {
        Task.detached { @MainActor in
            await CacheManager.shared.setupMemoryPressureMonitoring()
            print("🖥️ CacheManager initialized with fixed conservative limits")
            print("   Image cache limit: \(CacheManager.shared.maxImageItems) items")
        }
    }

    /// Simple cache eviction
    private func evictIfNeeded<T>(cache: inout [String: CachedItem<T>], maxItems: Int) {
        guard cache.count >= maxItems else { return }

        // Find least recently used item
        let sortedByAccess = cache.sorted { $0.value.lastAccessed < $1.value.lastAccessed }

        // Remove oldest 30% when limit reached
        let removeCount = max(1, maxItems / 3)
        for i in 0..<min(removeCount, sortedByAccess.count) {
            cache.removeValue(forKey: sortedByAccess[i].key)
        }
    }

    // MARK: - Cached Item Wrapper

    private struct CachedItem<T> {
        let value: T
        let timestamp: Date
        var accessCount: Int
        var lastAccessed: Date

        init(value: T) {
            self.value = value
            self.timestamp = Date()
            self.accessCount = 1
            self.lastAccessed = Date()
        }

        mutating func accessed() {
            accessCount += 1
            lastAccessed = Date()
        }

        func isExpired(expiration: TimeInterval) -> Bool {
            return Date().timeIntervalSince(timestamp) > expiration
        }
    }

    // MARK: - Catalog Caching

    func getCatalog(key: String) -> [MediaItem]? {
        guard var cached = catalogCache[key], !cached.isExpired(expiration: catalogExpiration) else {
            catalogCache.removeValue(forKey: key)
            return nil
        }

        cached.accessed()
        catalogCache[key] = cached
        print("✅ Cache HIT: Catalog[\(key)]")
        return cached.value
    }

    func setCatalog(key: String, value: [MediaItem]) {
        evictIfNeeded(cache: &catalogCache, maxItems: maxCatalogItems)
        catalogCache[key] = CachedItem(value: value)
        print("💾 Cache SET: Catalog[\(key)] (\(value.count) items)")
    }

    /// Clear a specific catalog from cache
    func clearCatalog(key: String) {
        catalogCache.removeValue(forKey: key)
        print("🗑️ Cleared catalog cache for key: \(key)")
    }

    // MARK: - Metadata Caching

    func getMetadata(key: String) -> MediaMetadata? {
        guard var cached = metadataCache[key], !cached.isExpired(expiration: metadataExpiration) else {
            metadataCache.removeValue(forKey: key)
            return nil
        }

        cached.accessed()
        metadataCache[key] = cached
        print("✅ Cache HIT: Metadata[\(key)]")
        return cached.value
    }

    func setMetadata(key: String, value: MediaMetadata) {
        evictIfNeeded(cache: &metadataCache, maxItems: maxMetadataItems)
        metadataCache[key] = CachedItem(value: value)
        print("💾 Cache SET: Metadata[\(key)]")
    }

    // MARK: - Image Data Caching

    func getImageData(key: String) -> Data? {
        guard var cached = imageCache[key], !cached.isExpired(expiration: imageExpiration) else {
            imageCache.removeValue(forKey: key)
            return nil
        }

        cached.accessed()
        imageCache[key] = cached
        return cached.value
    }

    /// Synchronous image data retrieval for hardware-safe image loading
    func getImageDataSync(key: String) -> Data? {
        guard var cached = imageCache[key], !cached.isExpired(expiration: imageExpiration) else {
            imageCache.removeValue(forKey: key)
            return nil
        }

        cached.accessed()
        imageCache[key] = cached
        print("🖼️ [CACHE] Found cached image for key: \(key)")
        return cached.value
    }

    func setImageData(key: String, value: Data) {
        evictIfNeeded(cache: &imageCache, maxItems: maxImageItems)
        imageCache[key] = CachedItem(value: value)
        print("🖼️ [CACHE] Cached image data for key: \(key) (\(value.count) bytes)")
    }

    // MARK: - Cache Management

    func clearAll() {
        catalogCache.removeAll()
        metadataCache.removeAll()
        imageCache.removeAll()
        print("🗑️ Cache cleared")
    }

    func clearExpired() {
        // Remove expired catalog items
        catalogCache = catalogCache.filter { !$0.value.isExpired(expiration: catalogExpiration) }

        // Remove expired metadata items
        metadataCache = metadataCache.filter { !$0.value.isExpired(expiration: metadataExpiration) }

        // Remove expired image items
        imageCache = imageCache.filter { !$0.value.isExpired(expiration: imageExpiration) }

        print("🗑️ Expired cache items cleared")
    }

    func getCacheStats() -> CacheStats {
        return CacheStats(
            catalogCount: catalogCache.count,
            metadataCount: metadataCache.count,
            imageCount: imageCache.count
        )
    }

    struct CacheStats {
        let catalogCount: Int
        let metadataCount: Int
        let imageCount: Int
    }

    // MARK: - Memory Pressure Monitoring

    /// Setup memory pressure monitoring for automatic cache cleanup (Hardware-safe version)
    func setupMemoryPressureMonitoring() {
        // Use a simpler approach to avoid CPU-specific instruction issues
        Task.detached { [weak self] in
            await self?.periodicMemoryCheck()
        }
        print("🔍 Memory pressure monitoring enabled (safe mode)")
    }

    /// Periodic memory check instead of pressure monitoring (more CPU-compatible)
    private func periodicMemoryCheck() async {
        // Run every 60 seconds
        while true {
            do {
                try await Task.sleep(nanoseconds: 60_000_000_000) // 60 seconds
            } catch {
                // Sleep was cancelled, continue loop
                continue
            }

            // Simple cache size check - avoid complex memory pressure APIs
            let stats = getCacheStats()
            let totalItems = stats.catalogCount + stats.metadataCount + stats.imageCount

            // If we have too many items, perform cleanup
            if totalItems > 80 { // Conservative limit
                await performSafeCleanup()
            }
        }
    }

    /// Safe memory cleanup that works across CPU architectures
    private func performSafeCleanup() async {
        print("⚠️ Performing safe memory cleanup")

        // Clear image cache first (largest memory consumer)
        let imageCount = imageCache.count
        imageCache.removeAll(keepingCapacity: false)

        // Clear expired items from other caches
        clearExpired()

        // Log cleanup results
        let stats = getCacheStats()
        print("🧹 Safe memory cleanup complete:")
        print("   Catalogs: \(stats.catalogCount)")
        print("   Metadata: \(stats.metadataCount)")
        print("   Images: \(stats.imageCount) (cleared \(imageCount) items)")
    }

    /// Force aggressive cleanup for low memory situations (CPU-safe version)
    func performAggressiveCleanup() async {
        print("🚨 Performing aggressive memory cleanup (safe mode)")

        // Clear caches in a specific order to avoid memory pressure
        imageCache.removeAll(keepingCapacity: false)
        do {
            try await Task.sleep(nanoseconds: 100_000_000) // 0.1 second delay
        } catch {
            // Sleep was cancelled, continue
        }

        catalogCache.removeAll(keepingCapacity: false)
        do {
            try await Task.sleep(nanoseconds: 100_000_000) // 0.1 second delay
        } catch {
            // Sleep was cancelled, continue
        }

        metadataCache.removeAll(keepingCapacity: false)

        // Log cleanup
        print("🗑️ All caches cleared due to memory pressure")
    }
}
