import Foundation
import Observation

/// The app ships in English and Turkish. The user can follow the system language or
/// pin one in Settings; the choice drives both UI strings (via `\.locale`) and the
/// content locale sent to the API.
nonisolated enum AppLanguage: String, CaseIterable, Identifiable, Sendable {
    case system, en, tr

    var id: String { rawValue }

    static let supported: [String] = ["en", "tr"]

    /// The concrete language code in effect ("en" or "tr").
    var resolvedCode: String {
        switch self {
        case .en, .tr: rawValue
        case .system:
            Locale.preferredLanguages
                .lazy
                .compactMap { Locale(identifier: $0).language.languageCode?.identifier }
                .first { Self.supported.contains($0) } ?? "en"
        }
    }

    var locale: Locale { Locale(identifier: resolvedCode) }

    /// Each language names itself, so a user who picked the wrong one can find their way back.
    var nativeName: String? {
        switch self {
        case .system: nil
        case .en: "English"
        case .tr: "Türkçe"
        }
    }
}

@Observable
final class LanguageSettings {
    private static let key = "appLanguage"

    var language: AppLanguage {
        didSet { UserDefaults.standard.set(language.rawValue, forKey: Self.key) }
    }

    init() {
        language = UserDefaults.standard.string(forKey: Self.key).flatMap(AppLanguage.init(rawValue:)) ?? .system
    }

    var code: String { language.resolvedCode }
    var locale: Locale { language.locale }
}
