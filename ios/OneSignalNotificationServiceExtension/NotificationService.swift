import OneSignalExtension
import UserNotifications

/// OneSignal's notification service extension: downloads a push's image (rich notifications) and
/// confirms delivery. The daily reminder is a local notification and never passes through here.
final class NotificationService: UNNotificationServiceExtension {
    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var receivedRequest: UNNotificationRequest?
    private var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        receivedRequest = request
        self.contentHandler = contentHandler
        bestAttemptContent = request.content.mutableCopy() as? UNMutableNotificationContent
        if let bestAttemptContent {
            OneSignalExtension.didReceiveNotificationExtensionRequest(request, with: bestAttemptContent,
                                                                      withContentHandler: contentHandler)
        } else {
            contentHandler(request.content)
        }
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler, let receivedRequest, let bestAttemptContent {
            OneSignalExtension.serviceExtensionTimeWillExpireRequest(receivedRequest, with: bestAttemptContent)
            contentHandler(bestAttemptContent)
        }
    }
}
