import SwiftUI
import UIKit

/// Type ramp from SPEC.md §2.2 / §2.8. Literata (bundled variable font) for titles and
/// reading; the system font for UI. Every style scales with Dynamic Type through `relativeTo:`.
enum Typography {
    static func literata(_ size: CGFloat, _ weight: Font.Weight = .regular, relativeTo style: Font.TextStyle = .body) -> Font {
        .custom("Literata", size: size, relativeTo: style).weight(weight)
    }

    // Literata
    static let display = literata(34, .medium, relativeTo: .largeTitle)       // tab-root large titles
    static let titleXL = literata(30, .medium, relativeTo: .largeTitle)       // piece title, sheets' large titles
    static let titleL = literata(28, .medium, relativeTo: .title)             // paywall, sign-in prompt
    static let titleToday = literata(27, .medium, relativeTo: .title)
    static let titleM = literata(24, .medium, relativeTo: .title2)            // movement heading, sheet titles
    static let titleS = literata(20, .medium, relativeTo: .title3)            // search-empty title
    static let dateNumeral = literata(24, .medium, relativeTo: .title2)
    static let price = literata(22, .medium, relativeTo: .title2)
    static let hookL = literata(19, relativeTo: .title3).italic()
    static let hookM = literata(17, relativeTo: .body).italic()
    static let reading = literata(17, relativeTo: .body)
    static let readingItalic = literata(17, relativeTo: .body).italic()
    static let readingMedium = literata(17, .medium, relativeTo: .body)       // stop "hear", theme names
    static let rowTitle = literata(17, .medium, relativeTo: .body)
    static let rowTitleS = literata(16, .medium, relativeTo: .callout)
    static let rowTitleXS = literata(15, .medium, relativeTo: .subheadline)
    static let noTimeLabel = literata(12, .medium, relativeTo: .caption).italic()

    // System
    static let button = Font.system(.body, weight: .semibold)                 // 17/600
    static let body17 = Font.body
    static let composerLink = Font.system(.body, weight: .medium)
    static let composerLinkToday = Font.system(.subheadline, weight: .medium)
    static let body15 = Font.subheadline                                       // 15
    static let navPill = Font.system(.subheadline, weight: .medium)
    static let meta14 = system(14, relativeTo: .subheadline).leading(.standard) // piece meta line, durations
    static let chip = system(14, .medium, relativeTo: .subheadline)            // chips, segments, toast
    static let buttonS = system(14, .semibold, relativeTo: .subheadline)
    static let meta13 = Font.footnote                                          // 13
    static let planName = Font.system(.footnote, weight: .semibold)
    static let caption = Font.caption                                          // 12
    static let sectionLabel = Font.system(.caption, weight: .semibold)         // 12/600 + tracking, uppercase
    static let stopTime = Font.system(.caption, weight: .semibold)
    static let micro = Font.system(.caption2, weight: .semibold)               // 11/600 uppercase labels
    static let microRegular = Font.caption2
    static let tabLabel = system(10, .medium, relativeTo: .caption2)

    /// SF at a design size between two text styles (14 pt, 10 pt): exactly `size` at the default
    /// text size, scaling with Dynamic Type like `style` (`size / style's default size`).
    static func system(_ size: CGFloat, _ weight: Font.Weight = .regular, relativeTo style: Font.TextStyle) -> Font {
        Font.system(style, weight: weight).scaled(by: size / defaultSize(of: style))
    }

    /// Point sizes of the text styles at the default (Large) content size.
    private static func defaultSize(of style: Font.TextStyle) -> CGFloat {
        switch style {
        case .largeTitle: 34
        case .title: 28
        case .title2: 22
        case .title3: 20
        case .headline, .body: 17
        case .callout: 16
        case .subheadline: 15
        case .footnote: 13
        case .caption: 12
        case .caption2: 11
        default: 17
        }
    }
}

extension View {
    /// CSS line-height as a multiple of the font size (17/1.6 → 27.2 pt lines), via the iOS 26
    /// text line-height API. Unlike `lineSpacing`, it can also be *tighter* than the font's own
    /// leading (Literata's natural line height is ≈1.3; titles at 1.15–1.25 need that), and it
    /// splits the difference above and below each line as CSS does. The factor applies to the
    /// Dynamic Type-scaled size, so it scales with the text.
    func lineHeight(_ multiple: CGFloat) -> some View {
        lineHeight(.multiple(factor: multiple))
    }

    /// The same for Literata at design size `size`. For this font SwiftUI keeps the first
    /// line's glyphs at the natural ascent and puts the whole line-height difference below,
    /// where CSS splits it above and below; measured against the canvas, loose Literata text
    /// (hooks 1.45, reading 1.6) sat 1–3 pt too high. Shifting the drawing by half the extra
    /// leading fixes that without changing the layout. Scales with Dynamic Type.
    func lineHeight(_ multiple: CGFloat, literata size: CGFloat) -> some View {
        modifier(LiterataLineHeight(multiple: multiple, size: size))
    }

    /// Reading prose: Literata 17/1.6, ink.
    func readingStyle(color: Color = Palette.ink) -> some View {
        font(Typography.reading).lineHeight(1.6, literata: 17).foregroundStyle(color)
    }
}

private struct LiterataLineHeight: ViewModifier {
    /// Literata's natural line height as a multiple of its size (CSS "normal").
    static let natural: CGFloat = 1.3
    let multiple: CGFloat
    @ScaledMetric private var shift: CGFloat

    init(multiple: CGFloat, size: CGFloat) {
        self.multiple = multiple
        // Only looser-than-natural lines need it: tighter titles (1.1–1.25) already land on the canvas.
        _shift = ScaledMetric(wrappedValue: max(0, multiple - Self.natural) * size / 2, relativeTo: .body)
    }

    func body(content: Content) -> some View {
        content.lineHeight(.multiple(factor: multiple)).offset(y: shift)
    }
}

