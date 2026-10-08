import SafariServices
import SwiftUI

/// Our own web pages (Terms, Privacy) open in an in-app browser sheet instead of leaving for
/// Safari; every other link (Spotify, museums, mail) keeps the system behaviour.
extension View {
    func opensOwnPagesInApp() -> some View { modifier(InAppBrowser()) }
}

private struct InAppBrowser: ViewModifier {
    private struct Page: Identifiable { let url: URL; var id: URL { url } }
    @State private var page: Page?

    func body(content: Content) -> some View {
        content
            .environment(\.openURL, OpenURLAction { url in
                guard AppLinks.isOwnPage(url) else { return .systemAction }
                page = Page(url: url)
                return .handled
            })
            .sheet(item: $page) { page in
                SafariView(url: page.url).ignoresSafeArea()
            }
    }
}

private struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        controller.preferredControlTintColor = UIColor(Palette.accent)
        controller.dismissButtonStyle = .close
        return controller
    }

    func updateUIViewController(_ controller: SFSafariViewController, context: Context) {}
}
