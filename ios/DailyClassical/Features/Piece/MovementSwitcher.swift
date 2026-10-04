import SwiftUI

/// Floating glass control with one roman numeral per movement (2–5). Reflects the
/// movement under the reading position; tapping jumps to that movement.
struct MovementSwitcher: View {
    let movements: [Movement]
    let current: Int
    var segmentWidth: CGFloat = 44
    let select: (Int) -> Void

    var body: some View {
        GlassSegmented(
            segments: movements.map {
                .init(value: $0.index, label: Text(verbatim: $0.numeral),
                      accessibilityLabel: Text("piece.switcher.accessibilityLabel \($0.numeral)"))
            },
            selection: Binding(get: { current }, set: select),
            height: 44,
            segmentWidth: segmentWidth,
            font: Typography.rowTitleXS,
            selectedFont: Typography.literata(15, .semibold, relativeTo: .subheadline)
        )
    }
}
