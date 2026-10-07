import SwiftUI
import UIKit

/// Colour tokens from design/SPEC.md §2.1. Paper in light, ink in dark; umber is the
/// single accent and is reserved for text, links, glossary terms and the saved heart.
///
/// `nonisolated`: SwiftUI resolves colours on its async render thread while scrolling fast.
/// Under the project's default MainActor isolation the trait-provider closure would be
/// main-actor-bound, and Swift's runtime isolation check traps (EXC_BREAKPOINT) when the
/// render thread calls it. The closure only reads the trait collection, so it is thread-safe.
nonisolated enum Palette {
    static let background = dynamic(0xF5F2EC, 0x111010)          // --bg
    static let surface = dynamic(0xFFFFFF, 0x1C1A18)             // --surface: cards, grouped lists
    static let ink = dynamic(0x1E1B17, 0xF0EBE3)                 // --ink
    static let ink2 = dynamic(0x5E5852, 0xB3ABA1)                // --ink2: secondary text, labels
    static let ink3 = dynamic(0x8A837B, 0x7D766E)                // --ink3: captions, faded stops
    static let rule = dynamic(0x1E1B17, 0xF0EBE3, alpha: 0.12)   // --rule: hairlines, card rings
    static let accent = dynamic(0x6B4A2B, 0xD4AE84)              // --accent
    static let tint = accent                                      // --tint: solid primary buttons
    static let onTint = dynamic(0xFFFFFF, 0x1E1B17)              // --tint-ink
    static let glassInk = ink                                     // --glass-ink: foreground on glass
    static let skeleton = dynamic(0x1E1B17, 0xF0EBE3, alpha: 0.08)
    static let danger = dynamic(0xB3261E, 0xF28B82)
    static let stripeA = dynamic(0xDDD7CE, 0x262320)             // --stripe bands
    static let stripeB = dynamic(0xE8E3DB, 0x1C1A18)

    /// Fill of the primary clear-glass button (G2). Light: the page colour, frosted (legible over
    /// any painting). Dark: SPEC G2 keeps a light glass in dark mode with cream text, drawn as a
    /// warm mid-grey so the label stays legible over bright skies too.
    static let primaryGlassTint = Color(uiColor: UIColor { @Sendable traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(hex: 0x4A4642, alpha: 0.62)
            : UIColor(hex: 0xF5F2EC, alpha: 0.55)
    })

    /// Artwork viewer: always black with the dark ink values.
    static let viewerInk = Color(red: 0xF0 / 255, green: 0xEB / 255, blue: 0xE3 / 255)
    static let viewerInk2 = Color(red: 0xB3 / 255, green: 0xAB / 255, blue: 0xA1 / 255)

    private static func dynamic(_ light: UInt32, _ dark: UInt32, alpha: CGFloat = 1) -> Color {
        Color(uiColor: UIColor { @Sendable traits in
            UIColor(hex: traits.userInterfaceStyle == .dark ? dark : light, alpha: alpha)
        })
    }
}

nonisolated private extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: alpha
        )
    }
}
