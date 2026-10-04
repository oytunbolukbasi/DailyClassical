import SwiftUI

/// The centrepiece (SPEC §3.6): a timeline rail plus a solid card with time, what you
/// hear (prominent) and what is happening (secondary). Reading focus fades passed and
/// upcoming stops around the one nearest the centre of the screen.
struct ListeningStopRow: View {
    enum Focus { case none, current, passed, upcoming }

    let stop: ListeningStop
    var focus: Focus = .none
    var isLast = false

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            rail
            card
        }
        .accessibilityElement(children: .combine)
        .accessibilityValue(focus == .current ? Text("piece.stop.current.accessibilityValue") : Text(verbatim: ""))
    }

    private var isTimed: Bool { stop.startSec != nil }

    private var rail: some View {
        VStack(spacing: 6) {
            dot
            if !isLast { Rectangle().fill(Palette.rule).frame(width: 1).frame(maxHeight: .infinity) }
        }
        .frame(width: 14)
        .padding(.top, 22)
    }

    @ViewBuilder private var dot: some View {
        let hollow = !isTimed || focus == .upcoming
        ZStack {
            if focus == .current {
                Circle().fill(Palette.accent.opacity(0.18)).frame(width: 16, height: 16)
            }
            if hollow {
                Circle().strokeBorder(focus == .upcoming ? Palette.ink3 : Palette.accent, lineWidth: 1.5).frame(width: 8, height: 8)
            } else {
                Circle().fill(Palette.accent).opacity(focus == .passed ? 0.4 : 1).frame(width: 8, height: 8)
            }
        }
        .frame(width: 14, height: 8)
    }

    private var faded: Bool { focus == .passed || focus == .upcoming }

    private var card: some View {
        VStack(alignment: .leading, spacing: 6) {
            timeLabel
            RichTextView(source: stop.hear, font: Typography.readingMedium, lineHeight: 1.4,
                         color: faded ? Palette.ink3 : Palette.ink, termColor: faded ? Palette.ink3 : Palette.accent)
            RichTextView(source: stop.happening, font: Typography.body15, lineHeight: 1.45, size: 15,
                         color: faded ? Palette.ink3 : Palette.ink2, termColor: faded ? Palette.ink3 : Palette.accent)
                .opacity(faded ? 0.75 : 1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, Spacing.cardPaddingV)
        .padding(.horizontal, Spacing.cardPaddingH)
        .card()
        .shadow(color: .black.opacity(focus == .current ? 0.06 : 0), radius: 10, y: 6)
    }

    @ViewBuilder private var timeLabel: some View {
        if let start = stop.startSec {
            Group {
                if let end = stop.endSec {
                    Text("piece.stop.time.range \(Formatting.clock(start)) \(Formatting.clock(end))")
                } else {
                    Text("piece.stop.time.single \(Formatting.clock(start))")
                }
            }
            .font(Typography.stopTime)
            .tracking(0.48)
            .foregroundStyle(faded ? Palette.ink3 : Palette.accent)
            if let label = stop.label {
                Text(verbatim: label).font(Typography.noTimeLabel).foregroundStyle(Palette.ink2)
            }
        } else {
            Text(verbatim: stop.label ?? "").font(Typography.noTimeLabel).foregroundStyle(faded ? Palette.ink3 : Palette.ink2)
        }
    }
}
