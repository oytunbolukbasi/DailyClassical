import SwiftUI

/// Spacing and radii from SPEC.md §2.3–2.4.
enum Spacing {
    static let pageGutter: CGFloat = 24
    static let barInset: CGFloat = 16
    static let stack: CGFloat = 14
    static let sectionGapM: CGFloat = 32
    static let sectionGapL: CGFloat = 40
    static let cardPaddingV: CGFloat = 16
    static let cardPaddingH: CGFloat = 18
    /// Clearance under the last block so the floating primary button never covers text.
    static let floatingButtonClearance: CGFloat = 150
}

enum Radius {
    static let sheet: CGFloat = 38
    static let groupedList: CGFloat = 22
    static let card: CGFloat = 16
    static let thumbM: CGFloat = 8
    static let thumbS: CGFloat = 6
}

extension View {
    /// Solid content card: `surface` fill, radius 16, 0.5 pt `rule` ring. Never glass.
    func card(radius: CGFloat = Radius.card) -> some View {
        background(Palette.surface, in: .rect(cornerRadius: radius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: radius, style: .continuous).strokeBorder(Palette.rule, lineWidth: 0.5))
    }

    /// 1 pt top hairline used between sections and list rows.
    func hairlineTop(_ width: CGFloat = 1) -> some View {
        overlay(alignment: .top) { Rectangle().fill(Palette.rule).frame(height: width) }
    }
}
