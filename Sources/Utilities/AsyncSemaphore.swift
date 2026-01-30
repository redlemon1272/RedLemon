import Foundation

/// A simple async-aware semaphore for limiting concurrency
/// Used to prevent overwhelming the system with too many simultaneous operations
actor AsyncSemaphore {
    private var permits: Int
    private var waiters: [CheckedContinuation<Void, Never>] = []
    
    init(limit: Int) {
        self.permits = limit
    }
    
    /// Acquire a permit, waiting if none are available
    func acquire() async {
        if permits > 0 {
            permits -= 1
        } else {
            await withCheckedContinuation { continuation in
                waiters.append(continuation)
            }
        }
    }
    
    /// Release a permit, waking a waiter if any
    func release() {
        if let waiter = waiters.first {
            waiters.removeFirst()
            waiter.resume()
        } else {
            permits += 1
        }
    }
    
    /// Execute a closure with a held permit
    func withPermit<T>(_ operation: () async throws -> T) async rethrows -> T {
        await acquire()
        defer { release() }
        return try await operation()
    }
}
