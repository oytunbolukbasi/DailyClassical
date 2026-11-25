import ImageIO
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
    /// Attachments take JPEG, PNG and GIF; anything else iOS can decode (WebP, HEIC…) is
    /// re-encoded as JPEG first.
    private static func attachment(from file: URL, response: URLResponse?, url: URL) -> UNNotificationAttachment? {
        let type = response?.mimeType.flatMap { UTType(mimeType: $0) } ?? UTType(filenameExtension: url.pathExtension)
        guard let type, type.conforms(to: .image) else { return nil }
        let dir = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString, directoryHint: .isDirectory)
        do {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            let dest: URL
            if [UTType.jpeg, .png, .gif].contains(where: { type.conforms(to: $0) }), let ext = type.preferredFilenameExtension {
                dest = dir.appending(path: "image.\(ext)")
                try FileManager.default.moveItem(at: file, to: dest)
            } else {
                dest = dir.appending(path: "image.jpg")
                guard jpeg(from: file, to: dest) else { return nil }
            }
            return try UNNotificationAttachment(identifier: "image", url: dest)
        } catch {
            return nil
        }
    }

    /// Decodes any image ImageIO reads and writes it as JPEG, at most 2000 px on the long side.
    private static func jpeg(from source: URL, to dest: URL) -> Bool {
        guard let src = CGImageSourceCreateWithURL(source as CFURL, nil) else { return false }
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: 2000,
        ]
        guard let image = CGImageSourceCreateThumbnailAtIndex(src, 0, options as CFDictionary),
              let out = CGImageDestinationCreateWithURL(dest as CFURL, UTType.jpeg.identifier as CFString, 1, nil) else { return false }
        CGImageDestinationAddImage(out, image, [kCGImageDestinationLossyCompressionQuality: 0.85] as CFDictionary)
        return CGImageDestinationFinalize(out)
    }
}
