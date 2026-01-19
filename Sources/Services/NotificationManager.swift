import Foundation
import UserNotifications
import AppKit

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                NSLog("✅ Notification permission granted")
            } else if let error = error {
                NSLog("❌ Notification permission error: %@", error.localizedDescription)
            }
        }
    }
    
    func showNotification(title: String, subtitle: String? = nil, body: String, categoryIdentifier: String? = nil) {
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        content.sound = .default
        
        if let category = categoryIdentifier {
            content.categoryIdentifier = category
        }
        
        // Instant trigger
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: nil
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                NSLog("❌ Failed to show notification: %@", error.localizedDescription)
            }
        }
    }
    
    // MARK: - Delegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Show notification even if app is in foreground
        completionHandler([.banner, .sound, .list])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle notification click
        let category = response.notification.request.content.categoryIdentifier
        
        Task { @MainActor in
            if category == "STREAM_REPORT" {
                // We could navigate to Admin Dashboard here if needed
                // But for now just wake up the app
                NSApp.activate(ignoringOtherApps: true)
            }
        }
        
        completionHandler()
    }
}
