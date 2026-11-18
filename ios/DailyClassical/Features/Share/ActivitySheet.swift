import LinkPresentation
import UIKit

/// The iOS share sheet (design B3-iOS-share-sheet). It gets two items: the rendered image, and
/// one string with the share text and the link. Apps that take only one of them take what they can.
enum ActivitySheet {
    /// Presents over whatever is on screen (the preview sheet); `completion(true)` once shared.
    static func present(image: UIImage, text: String, title: String, url: URL, completion: @escaping (Bool) -> Void) {
        guard let presenter = topViewController() else { return completion(false) }
        let controller = UIActivityViewController(
            activityItems: [ShareImageItem(image: image, title: title, url: url), ShareTextItem(text: text, subject: title)],
            applicationActivities: nil)
        controller.completionWithItemsHandler = { _, completed, _, _ in completion(completed) }
        if let popover = controller.popoverPresentationController {  // iPad and the iPhone Duo's inner display
            popover.sourceView = presenter.view
            popover.sourceRect = CGRect(x: presenter.view.bounds.midX, y: presenter.view.bounds.maxY - 60, width: 1, height: 1)
        }
        presenter.present(controller, animated: true)
    }

    private static func topViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        let scene = scenes.first { $0.activationState == .foregroundActive } ?? scenes.first
        var top = scene?.keyWindow?.rootViewController
        while let next = top?.presentedViewController, !next.isBeingDismissed { top = next }
        return top
    }
}

/// The image, with the header the share sheet shows above the apps: the card as the thumbnail and
/// "Tchaikovsky, Symphony No. 6 in B minor, “Pathétique”" as the title.
final class ShareImageItem: NSObject, UIActivityItemSource {
    let image: UIImage
    let title: String
    let url: URL

    init(image: UIImage, title: String, url: URL) {
        self.image = image
        self.title = title
        self.url = url
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any { image }

    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? { image }

    func activityViewController(_ activityViewController: UIActivityViewController,
                                subjectForActivityType activityType: UIActivity.ActivityType?) -> String { title }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = title
        metadata.originalURL = url  // the subtitle shows its host, dailyclassical.co
        let provider = NSItemProvider(object: image)
        metadata.imageProvider = provider
        metadata.iconProvider = provider
        return metadata
    }
}

/// The share text and link, as one string (design B3-Share-text).
final class ShareTextItem: NSObject, UIActivityItemSource {
    let text: String
    let subject: String

    init(text: String, subject: String) {
        self.text = text
        self.subject = subject
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any { text }

    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? { text }

    func activityViewController(_ activityViewController: UIActivityViewController,
                                subjectForActivityType activityType: UIActivity.ActivityType?) -> String { subject }
}
