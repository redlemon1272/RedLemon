import SwiftUI
import AppKit
import QuartzCore

/// A wrapper that chooses the correct horizontal scroll implementation based on macOS version.
/// - macOS 15+: Uses HorizontalNSScrollView to fix nested scroll event issues.
/// - macOS 12-14: Uses standard SwiftUI ScrollView.
/// A wrapper that chooses the correct horizontal scroll implementation based on macOS version.
/// - macOS 15+: Uses HorizontalNSScrollView to fix nested scroll event issues.
/// - macOS 12-14: Uses standard SwiftUI ScrollView.
struct VersionAwareHorizontalScrollView<Content: View>: View {
    let content: Content
    let scrollOffset: Binding<CGFloat>?

    init(scrollOffset: Binding<CGFloat>? = nil, @ViewBuilder content: () -> Content) {
        self.scrollOffset = scrollOffset
        self.content = content()
    }

    var body: some View {
        // Use custom NSScrollView wrapper for ALL versions to ensure we can bind pixel offsets.
        // We handle the "scroll works" issue by using a vanilla NSScrollView on macOS 12-14
        // and the custom forwarding one on macOS 15+.
        HorizontalNSScrollView(scrollOffset: scrollOffset) {
            content
        }
    }
}

/// A custom horizontal scroll view backed by AppKit's NSScrollView.
/// Used to resolve nested scroll behavior issues on macOS 15+ where
/// SwiftUI's native ScrollView consumes vertical scroll events.
private struct HorizontalNSScrollView<Content: View>: NSViewRepresentable { // OK: Security Check #49 checked (CustomNSScrollView implements scrollWheel)
    let content: Content
    let scrollOffset: Binding<CGFloat>?

    init(scrollOffset: Binding<CGFloat>? = nil, @ViewBuilder content: () -> Content) {
        self.scrollOffset = scrollOffset
        self.content = content()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollOffset: scrollOffset)
    }

    func makeNSView(context: Context) -> NSScrollView {
        // CONDITIONAL CLASS SELELCTION:
        // macOS 15+: Use CustomNSScrollView to fix nested scroll event swallowing.
        // macOS 12-14: Use standard NSScrollView. The Custom subclass breaks scrolling on these versions.
        let scrollView: NSScrollView
        if #available(macOS 15, *) {
            scrollView = CustomNSScrollView()
        } else {
            scrollView = NSScrollView()
        }
        
        scrollView.hasVerticalScroller = false
        scrollView.hasHorizontalScroller = false // Hide scrollbars to match SwiftUI style
        scrollView.drawsBackground = false
        scrollView.backgroundColor = .clear

        // Setup content view
        let hostingView = NSHostingView(rootView: content)
        hostingView.translatesAutoresizingMaskIntoConstraints = false

        // Create a document view to hold the hosting view
        // Using a flipped view ensures coordinates start from top-left
        let documentView = FlippedView()
        documentView.translatesAutoresizingMaskIntoConstraints = false
        documentView.addSubview(hostingView)
        
        // Notify coordinator about the content view to set up observation
        context.coordinator.setupObservation(for: scrollView.contentView)
        context.coordinator.scrollView = scrollView // Keep reference for width checks

        scrollView.documentView = documentView
        
        // Initial scroll restoration
        if let initialOffset = scrollOffset?.wrappedValue, initialOffset > 0 {
            // Schedule a check to restore scroll once layout happens
            // We use a slight delay to ensure SwiftUI has calculated frames
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
                // Only scroll if content is wide enough
                if let docView = scrollView.documentView, docView.frame.width > initialOffset {
                     scrollView.contentView.bounds.origin = NSPoint(x: initialOffset, y: 0)
                }
            }
        }

        // Constrain hosting view to document view edges
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: documentView.topAnchor),
            hostingView.bottomAnchor.constraint(equalTo: documentView.bottomAnchor),
            hostingView.leadingAnchor.constraint(equalTo: documentView.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: documentView.trailingAnchor)
        ])

        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        if let documentView = nsView.documentView,
           let hostingView = documentView.subviews.first as? NSHostingView<Content> {
            hostingView.rootView = content

            // Performance: Do NOT force full layout pass here.
            // hostingView.layoutSubtreeIfNeeded() 

            // Critical: Update document view frame to match content size
            // fittingSize calculation is optimized in NSHostingView
            let size = hostingView.fittingSize
            if documentView.frame.size != size {
                documentView.setFrameSize(size)
            }
            
            // Restore scroll position if needed and different
            if let targetOffset = scrollOffset?.wrappedValue {
                let currentOffset = nsView.contentView.bounds.origin.x
                
                // Only attempt restoration if we are significantly off target
                if abs(currentOffset - targetOffset) > 1.0 {
                    // CRITICAL: Only scroll if the document is wide enough
                    if documentView.frame.width >= targetOffset {
                        nsView.contentView.bounds.origin = NSPoint(x: targetOffset, y: 0)
                    }
                }
            }
        }
        
        // Update coordinator binding reference
        context.coordinator.scrollOffset = scrollOffset
    }
    
    class Coordinator: NSObject {
        var scrollOffset: Binding<CGFloat>?
        weak var scrollView: NSScrollView?
        private var updateTask: Task<Void, Never>?
        
        init(scrollOffset: Binding<CGFloat>?) {
            self.scrollOffset = scrollOffset
        }
        
        func setupObservation(for contentView: NSClipView) {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(boundsDidChange(_:)),
                name: NSView.boundsDidChangeNotification,
                object: contentView
            )
        }
        
        @objc func boundsDidChange(_ notification: Notification) {
            guard let clipView = notification.object as? NSClipView else { return }
            let newX = clipView.bounds.origin.x
            
            // CRITICAL: Protect against overwriting the saved offset with 0 during load
            if newX == 0 {
                if let docView = scrollView?.documentView, docView.frame.width < 100 {
                    return
                }
            }
            
            // Debounce updates to prevent high-frequency state changes (60fps) triggering expensive View re-renders
            updateTask?.cancel()
            updateTask = Task { @MainActor in
                try? await Task.sleep(nanoseconds: 150_000_000) // 0.15s
                if !Task.isCancelled {
                    self.scrollOffset?.wrappedValue = newX
                }
            }
        }
    }
}

/// Custom NSScrollView subclass that handles scroll wheel events correctly for nested scenarios
private class CustomNSScrollView: NSScrollView {
    // Throttle scroll logging to prevent spam (log max once per second)
    private var lastScrollLogTime: CFTimeInterval = 0
    private let scrollLogInterval: CFTimeInterval = 1.0

    override func scrollWheel(with event: NSEvent) {
        // Determine the dominant axis of scrolling
        let isVertical = abs(event.scrollingDeltaY) > abs(event.scrollingDeltaX)

        // Diagnostic logging (throttled to prevent spam)
        let currentTime = CACurrentMediaTime()
        if currentTime - lastScrollLogTime > scrollLogInterval {
            lastScrollLogTime = currentTime
            let direction = isVertical ? "VERTICAL" : "HORIZONTAL"
            LoggingManager.shared.scrollEvent(direction, forwarded: isVertical, location: "HorizontalNSScrollView")
        }

        if isVertical {
            // Forward vertical scrolling to the next responder (likely the parent vertical NSScrollView)
            self.nextResponder?.scrollWheel(with: event)
        } else {
            // Handle horizontal scrolling normally
            super.scrollWheel(with: event)
        }
    }
}

/// A view that uses flipped coordinates (origin at top-left)
private class FlippedView: NSView {
    override var isFlipped: Bool { true }
}
