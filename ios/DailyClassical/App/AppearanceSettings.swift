import Observation
import SwiftUI

@Observable
final class AppearanceSettings {
    enum Theme: String, CaseIterable, Identifiable {
        case system, light, dark
        var id: String { rawValue }
        var colorScheme: ColorScheme? {
            switch self {
            case .system: nil
            case .light: .light
            case .dark: .dark
            }
        }
    }

    var theme: Theme {
        didSet { UserDefaults.standard.set(theme.rawValue, forKey: "theme") }
    }

    init() {
        theme = UserDefaults.standard.string(forKey: "theme").flatMap(Theme.init(rawValue:)) ?? .system
    }
}
