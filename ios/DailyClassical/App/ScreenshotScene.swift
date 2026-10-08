import SwiftUI

#if DEBUG
/// App Store screenshots (docs/APP_STORE.md §8): launch arguments that put the app on one screen,
/// so every language is shot on the same frame without driving the simulator by hand.
///
///     -shotTab library              Library tab
///     -shotPiece <id>               push a piece on Today
///     -shotScroll <points>          scroll that piece's page down
///     -shotSheet glossary:<term>    a router sheet (also composer:<id>, paywall)
///     -shotArtwork YES              the piece's artwork viewer
///     -shotWallpaper YES            …and its wallpaper sheet
///
/// Debug builds only.
enum ScreenshotScene {
    private static var defaults: UserDefaults { .standard }

    static var tab: String? { defaults.string(forKey: "shotTab") }
    static var piece: String? { defaults.string(forKey: "shotPiece") }
    static var scroll: CGFloat? { defaults.object(forKey: "shotScroll") == nil ? nil : CGFloat(defaults.double(forKey: "shotScroll")) }
    static var sheet: String? { defaults.string(forKey: "shotSheet") }
    static var artwork: Bool { defaults.bool(forKey: "shotArtwork") }
    static var wallpaper: Bool { defaults.bool(forKey: "shotWallpaper") }

    /// Applied once, after the first screen has loaded.
    @MainActor static func apply(to router: AppRouter) async {
        try? await Task.sleep(for: .seconds(1.5))
        switch tab {
        case "library": router.tab = .library
        case "settings": router.tab = .settings
        default: break
        }
        if let piece { router.todayPath = NavigationPath([PieceRoute(id: piece)]) }
        guard let sheet else { return }
        try? await Task.sleep(for: .seconds(piece == nil ? 0.5 : 2.5))
        let parts = sheet.split(separator: ":", maxSplits: 1).map(String.init)
        switch (parts.first, parts.count > 1 ? parts[1] : nil) {
        case ("glossary", let id?): router.present(.glossaryTerm(id))
        case ("composer", let id?): router.present(.composer(ComposerRef(id: id, name: "", shortName: "")))
        case ("paywall", _): router.present(.paywall)
        default: break
        }
    }
}
#endif
