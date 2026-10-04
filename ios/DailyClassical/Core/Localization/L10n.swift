import Foundation

/// For strings resolved outside a SwiftUI `Text` (accessibility values, share sheets,
/// notifications). SwiftUI views should use `Text("key")`, which already follows the
/// `\.locale` environment set at the root.
enum L10n {
    nonisolated static func bundle(for code: String) -> Bundle {
        Bundle.main.path(forResource: code, ofType: "lproj").flatMap(Bundle.init(path:)) ?? .main
    }

    nonisolated static func string(_ key: String.LocalizationValue, code: String) -> String {
        String(localized: key, bundle: bundle(for: code), locale: Locale(identifier: code))
    }
}
