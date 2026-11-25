import UniformTypeIdentifiers
import UserNotifications

/// Adds the image of a push from /admin/messages (payload key `image`, an https URL; the server
/// sets mutable-content). Without an image, or if the download fails or is slow, the push shows
/// as it came.
final class NotificationService: UNNotificationServiceExtension, @unchecked Sendable {
    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var content: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        let content = (request.content.mutableCopy() as? UNMutableNotificationContent) ?? UNMutableNotificationContent()
        self.contentHandler = contentHandler
        self.content = content
        guard let string = content.userInfo["image"] as? String, let url = URL(string: string), url.scheme == "https" else {
            finish()
            return
        }
        let task = URLSession.shared.downloadTask(with: url) { [self] file, response, _ in
            if let file, let attachment = Self.attachment(from: file, response: response, url: url) {
                content.attachments = [attachment]
            }
            finish()
        }
        task.resume()
    }

    override func serviceExtensionTimeWillExpire() {
        finish()
    }

    private func finish() {
        guard let contentHandler, let content else { return }
        self.contentHandler = nil
        contentHandler(content)
    }

    /// The downloaded file under a name with the right extension, which the attachment needs.
    private static func attachment(from file: URL, response: URLResponse?, url: URL) -> UNNotificationAttachment? {
        let type = response?.mimeType.flatMap { UTType(mimeType: $0) } ?? UTType(filenameExtension: url.pathExtension)
        guard let type, type.conforms(to: .image), let ext = type.preferredFilenameExtension else { return nil }
        let dir = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString, directoryHint: .isDirectory)
        let dest = dir.appending(path: "image.\(ext)")
        do {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            try FileManager.default.moveItem(at: file, to: dest)
            return try UNNotificationAttachment(identifier: "image", url: dest)
        } catch {
            return nil
        }
    }
}
