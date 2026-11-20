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

    @State private var showsList = false

    private var shown: Movement? { movements.first { $0.index == current } ?? movements.first }

    /// A capsule that opens the movement list as a sheet. Not a Menu: a menu hides its label while
    /// open and fades the label's glass back in when it closes, which showed a clipped, distorted
    /// edge for a few frames; the sheet leaves the capsule where it is.
    private var compact: some View {
        Button { showsList = true } label: {
            // As wide as the widest movement's label, so another movement changes only the text.
            ZStack {
                ForEach(movements) { m in label(m).hidden() }
                if let shown { label(shown).transaction { $0.animation = nil } }
            }
            .fixedSize(horizontal: true, vertical: false)
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
        .sheet(isPresented: $showsList) {
            MovementListSheet(movements: movements, current: current) { index in
                showsList = false
                select(index)
            }
        }
    }

    /// "III · Dies irae ⌄". Long headings ("Trauermarsch (Funeral March)") truncate.
    private func label(_ m: Movement) -> some View {
        HStack(spacing: 6) {
            Text(verbatim: m.numeral)
                .font(Typography.literata(15, .semibold, relativeTo: .subheadline))
                .fixedSize()
            Text(verbatim: "·").font(Typography.rowTitleXS).opacity(0.6).fixedSize()
            Text(verbatim: m.displayHeading)
                .font(Typography.rowTitleXS)
                .lineLimit(1)
                .frame(maxWidth: 150, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false)
            Spacer(minLength: 0)
            Icon("chevron-down", size: 12)
        }
    }
}

/// The movements of a long work (more than seven), as in the piece's Movements table: numeral,
/// heading, key and duration. The current one is marked; choosing one closes the sheet and jumps.
private struct MovementListSheet: View {
    let movements: [Movement]
    let current: Int
    let select: (Int) -> Void

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    SectionLabel("piece.section.movements")
                        .padding(.top, 28)
                    VStack(spacing: 0) {
                        ForEach(movements) { m in
                            row(m).id(m.index)
                        }
                    }
                    .card()
                }
                .gutter()
                .padding(.bottom, 32)
            }
            .onAppear { proxy.scrollTo(current, anchor: .center) }
        }
        .scrollIndicators(.hidden)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .presentationBackground(Palette.background)
    }

    private func row(_ m: Movement) -> some View {
        let isCurrent = m.index == current
        return Button { select(m.index) } label: {
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                Text(verbatim: m.numeral).font(Typography.rowTitleS).foregroundStyle(Palette.accent)
                    .frame(width: 40, alignment: .leading)
                VStack(alignment: .leading, spacing: 3) {
                    Text(verbatim: m.displayHeading).font(Typography.rowTitleXS).foregroundStyle(Palette.ink)
                    Text(verbatim: m.metaLine(includeDuration: false)).font(Typography.meta13).foregroundStyle(Palette.ink2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if isCurrent {
                    Icon("checkmark", size: 16).foregroundStyle(Palette.accent)
                } else if let d = m.durationSec {
                    Text(verbatim: Formatting.clock(d)).font(Typography.meta14).monospacedDigit().foregroundStyle(Palette.ink2)
                }
            }
            .multilineTextAlignment(.leading)
            .padding(.vertical, 13).padding(.horizontal, 16)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .overlay(alignment: .top) { if m.index != movements.first?.index { Rectangle().fill(Palette.rule).frame(height: 1) } }
        .accessibilityAddTraits(isCurrent ? .isSelected : [])
    }
}
