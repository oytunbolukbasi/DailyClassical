import SwiftUI

/// Floating glass control for the movements. Reflects the movement under the reading position;
/// choosing one jumps to it.
///
/// Up to seven movements: one roman numeral per movement. Six movements (Mahler 3) get narrower
/// segments so the pill still fits between the nav buttons on a 390 pt phone; seven (Beethoven's
/// Op. 131) narrower still, so the pill is as wide as with six.
///
/// More than seven (Mozart's Requiem, fourteen sections): one capsule with the current movement,
/// "III · Dies irae", whose menu lists every movement. It fits the same place at any count.
struct MovementSwitcher: View {
    /// The most movements shown as segments; more get the menu capsule.
    static let maxSegments = 7

    let movements: [Movement]
    let current: Int
    var segmentWidth: CGFloat = 44
    let select: (Int) -> Void

    var body: some View {
        if movements.count > Self.maxSegments {
            compact
        } else {
            GlassSegmented(
                segments: movements.map {
                    .init(value: $0.index, label: Text(verbatim: $0.numeral),
                          accessibilityLabel: Text("piece.switcher.accessibilityLabel \($0.numeral)"))
                },
                selection: Binding(get: { current }, set: select),
                height: 44,
                segmentWidth: movements.count > 6 ? min(segmentWidth, 31) : movements.count > 5 ? min(segmentWidth, 36) : segmentWidth,
                font: Typography.rowTitleXS,
                selectedFont: Typography.literata(15, .semibold, relativeTo: .subheadline)
            )
        }
    }

    // MARK: More than seven movements

    private var shown: Movement? { movements.first { $0.index == current } ?? movements.first }

    private var compact: some View {
        Menu {
            Picker(selection: Binding(get: { current }, set: select)) {
                ForEach(movements) { m in
                    Text(verbatim: "\(m.numeral). \(m.displayHeading)").tag(m.index)
                }
            } label: { EmptyView() }
                .pickerStyle(.inline)
        } label: {
            HStack(spacing: 6) {
                if let shown {
                    Text(verbatim: shown.numeral)
                        .font(Typography.literata(15, .semibold, relativeTo: .subheadline))
                        .fixedSize()
                    Text(verbatim: "·").font(Typography.rowTitleXS).opacity(0.6).fixedSize()
                    // Long headings ("Trauermarsch (Funeral March)") truncate; short ones keep their width.
                    Text(verbatim: shown.displayHeading)
                        .font(Typography.rowTitleXS)
                        .lineLimit(1)
                        .frame(maxWidth: 180, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                }
                Icon("chevron-down", size: 12)
            }
            .foregroundStyle(Palette.glassInk)
            .padding(.horizontal, 16)
            .frame(height: 44)
            .contentShape(.capsule)
            .glassEffect(.regular.interactive(), in: .capsule)
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 6)  // clear of the nav buttons' own glass
        .accessibilityLabel(Text("piece.switcher.menu.accessibilityLabel"))
        .accessibilityValue(Text(verbatim: shown.map { "\($0.numeral), \($0.displayHeading)" } ?? ""))
    }
}
