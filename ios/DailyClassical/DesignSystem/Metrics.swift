import SwiftUI

/// Spacing and radii from project-knowledge/project_information.md §8.3.
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
    /// Widest text column (gutters excluded). Phones never reach it; on the iPhone Duo inner
    /// display a full-width line ran past 110 characters.
    static let readableWidth: CGFloat = 640
}

/// Hero paintings keep their design height on phones, and shrink with the screen where it is
/// short: iPhone SE, the iPhone Duo outer display (678 pt), the inner display held sideways.
enum HeroHeight {
    /// The design height until the screen is shorter than ~812 pt (iPhone 13 mini), then 37 %
    /// of it, so the title still shows under the painting.
    static func piece(in screenHeight: CGFloat) -> CGFloat { min(300, (screenHeight * 0.37).rounded()) }
    /// The paywall's painting: its 280 pt on the 844 pt frame, a third of shorter screens, so the
    /// plans come up sooner.
    static func paywall(in screenHeight: CGFloat) -> CGFloat { min(280, (screenHeight * 0.34).rounded()) }
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

    /// A text block padded by the page gutter and capped at `Spacing.readableWidth`, centred in
    /// wider containers (the iPhone Duo inner display); full width with the gutter on phones.
    func readableColumn() -> some View {
        padding(.horizontal, Spacing.pageGutter)
            .frame(maxWidth: Spacing.readableWidth + 2 * Spacing.pageGutter, alignment: .leading)
            .frame(maxWidth: .infinity)
    }

    /// 1 pt top hairline used between sections and list rows.
    func hairlineTop(_ width: CGFloat = 1) -> some View {
        overlay(alignment: .top) { Rectangle().fill(Palette.rule).frame(height: width) }
    }
}
