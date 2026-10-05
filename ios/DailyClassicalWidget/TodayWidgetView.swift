import SwiftUI
import WidgetKit

/// Approved design: https://claude.ai/artifact/RXtNStkS5trgkiZrkRRuvj ("Widgets"). Text never
/// sits on the painting; in the accented (tinted) Home Screen mode the painting is desaturated
/// and the accent lines take the system tint.
struct TodayWidgetView: View {
    let entry: TodayEntry
    @Environment(\.widgetFamily) private var family

    var body: some View {
        if let piece = entry.piece {
            switch family {
            case .systemMedium: medium(piece)
            case .systemLarge: large(piece)
            default: small(piece)
            }
        } else {
            Text(verbatim: "DailyClassical").font(.custom("Literata", size: 17)).foregroundStyle(Palette.ink)
        }
    }

    // MARK: Sizes

    private func small(_ p: WidgetPiece) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            painting.frame(height: 96).clipped()
            VStack(alignment: .leading, spacing: 3) {
                Text(verbatim: p.composerShortName).modifier(Overline(color: Palette.accent)).widgetAccentable()
                Text(verbatim: p.shortTitle)
                    .font(.custom("Literata", size: 15).weight(.medium))
                    .foregroundStyle(Palette.ink)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)
            }
            .padding(.horizontal, 13).padding(.top, 9)
            Spacer(minLength: 0)
        }
    }

    private func medium(_ p: WidgetPiece) -> some View {
        HStack(spacing: 0) {
            painting.frame(width: 146).clipped()
            VStack(alignment: .leading, spacing: 4) {
                dateLine(short: true)
                Text(verbatim: p.composerName)
                    .font(.system(size: 12, weight: .medium)).foregroundStyle(Palette.accent)
                    .lineLimit(1).padding(.top, 2).widgetAccentable()
                Text(verbatim: p.shortTitle)
                    .font(.custom("Literata", size: 17).weight(.medium)).foregroundStyle(Palette.ink)
                    .lineLimit(2).minimumScaleFactor(0.85)
                Spacer(minLength: 2)
                Text(verbatim: p.hook)
                    .font(.custom("Literata", size: 13).italic()).foregroundStyle(Palette.ink2)
                    .lineLimit(2)
            }
            .padding(.leading, 14).padding(.trailing, 15).padding(.vertical, 14)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func large(_ p: WidgetPiece) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            painting.frame(height: 168).clipped()
            VStack(alignment: .leading, spacing: 5) {
                dateLine(short: false)
                Text(verbatim: p.composerName)
                    .font(.system(size: 13, weight: .medium)).foregroundStyle(Palette.accent)
                    .padding(.top, 1).widgetAccentable()
                Text(verbatim: p.title)
                    .font(.custom("Literata", size: 20).weight(.medium)).foregroundStyle(Palette.ink)
                    .lineLimit(2).minimumScaleFactor(0.85)
                Text(verbatim: [p.hook, entry.inOneLine].compactMap { $0 }.joined(separator: " "))
                    .font(.custom("Literata", size: 14).italic()).foregroundStyle(Palette.ink2)
                    .lineLimit(3).padding(.top, 2)
                Text("today.meta \(String(p.year)) \(p.durationMin) \(p.movementCount)")
                    .font(.system(size: 12)).foregroundStyle(Palette.ink3)
                    .padding(.top, 3)
            }
            .padding(.horizontal, 18).padding(.top, 13)
            Spacer(minLength: 0)
        }
    }

    // MARK: Parts

    @ViewBuilder private var painting: some View {
        if let image = entry.image {
            Image(uiImage: image)
                .resizable()
                .widgetAccentedRenderingMode(.desaturated)
                .aspectRatio(contentMode: .fill)
        } else {
            Palette.stripeA
        }
    }

    /// "TODAY · MON 5 OCT" (medium) / "TODAY · MONDAY 5 OCTOBER" (large), in the app's language.
    private func dateLine(short: Bool) -> some View {
        // en_GB gives the design's "Mon 5 Oct" order (en_US would print "Mon, Oct 5").
        let locale = Locale(identifier: entry.language == "tr" ? "tr_TR" : "en_GB")
        let style = short
            ? Date.FormatStyle(locale: locale).weekday(.abbreviated).day().month(.abbreviated)
            : Date.FormatStyle(locale: locale).weekday(.wide).day().month(.wide)
        return Text("widget.today \(entry.date.formatted(style))").modifier(Overline(color: Palette.ink3))
    }
}

private struct Overline: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content.font(.system(size: 10, weight: .semibold)).tracking(0.8).textCase(.uppercase)
            .foregroundStyle(color).lineLimit(1)
    }
}
