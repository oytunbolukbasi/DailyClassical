import SwiftUI
import UIKit

/// Type ramp from SPEC.md §2.2 / §2.8. Literata (bundled variable font) for titles and
/// reading; the system font for UI. Every style scales with Dynamic Type through `relativeTo:`.
enum Typography {
    static let literataLineRatio: CGFloat = UIFont(name: "Literata-Regular", size: 100).map { $0.lineHeight / 100 } ?? 1.2
    static let systemLineRatio: CGFloat = UIFont.systemFont(ofSize: 100).lineHeight / 100

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
    static let meta14 = Font.system(size: 14, weight: .regular).leading(.standard)
    static let chip = Font.system(size: 14, weight: .medium)
    static let buttonS = Font.system(size: 14, weight: .semibold)
    static let meta13 = Font.footnote                                          // 13
    static let planName = Font.system(.footnote, weight: .semibold)
    static let caption = Font.caption                                          // 12
    static let sectionLabel = Font.system(.caption, weight: .semibold)         // 12/600 + tracking, uppercase
    static let stopTime = Font.system(.caption, weight: .semibold)
    static let micro = Font.system(.caption2, weight: .semibold)               // 11/600 uppercase labels
    static let microRegular = Font.caption2
    static let tabLabel = Font.system(size: 10, weight: .medium)
}

extension View {
    /// CSS line-height as a multiple of the font size (TEST).
    func lineHeight(_ multiple: CGFloat, size: CGFloat = 17) -> some View {
        lineHeight(.multiple(factor: multiple))
    }

    /// Reading prose: Literata 17/1.6, ink.
    func readingStyle(color: Color = Palette.ink) -> some View {
        font(Typography.reading).lineHeight(1.6).foregroundStyle(color)
    }
}
