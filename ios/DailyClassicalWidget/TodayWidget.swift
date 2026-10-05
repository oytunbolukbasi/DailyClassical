import SwiftUI
import WidgetKit

struct TodayEntry: TimelineEntry {
    let date: Date
    let piece: WidgetPiece?
    /// Bundled artwork file; decoded by the view at render time (see WidgetData.painting).
    let imageURL: URL?
    let inOneLine: String?
    let language: String
}

struct TodayProvider: TimelineProvider {
    func placeholder(in context: Context) -> TodayEntry { entry(for: .now, family: context.family) }

    func getSnapshot(in context: Context, completion: @escaping (TodayEntry) -> Void) {
        completion(entry(for: .now, family: context.family))
    }

    /// Today now, then one entry per midnight for the next three days (the schedule is local
    /// data, and the app also asks WidgetKit to reload whenever it opens).
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayEntry>) -> Void) {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: .now)
        var entries = [entry(for: .now, family: context.family)]
        for offset in 1...3 {
            if let day = calendar.date(byAdding: .day, value: offset, to: start) {
                entries.append(entry(for: day, family: context.family))
            }
        }
        completion(Timeline(entries: entries, policy: .atEnd))
    }

    private func entry(for date: Date, family: WidgetFamily) -> TodayEntry {
        let piece = WidgetData.piece(on: date)
        return TodayEntry(
            date: date,
            piece: piece,
            imageURL: piece.flatMap { WidgetData.paintingURL(for: $0.id, large: family == .systemLarge) },
            inOneLine: family == .systemLarge ? piece.flatMap { WidgetData.inOneLine(for: $0.id) } : nil,
            language: WidgetData.languageCode
        )
    }
}

struct TodayWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "TodayWidget", provider: TodayProvider()) { entry in
            TodayWidgetView(entry: entry)
                .environment(\.locale, Locale(identifier: entry.language))
                .containerBackground(Palette.background, for: .widget)
                .widgetURL(entry.piece.map { URL(string: "dailyclassical://piece/\($0.id)")! })
        }
        .configurationDisplayName(Text("widget.name"))
        .description(Text("widget.description"))
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .contentMarginsDisabled()  // the painting runs edge to edge
    }
}

@main
struct DailyClassicalWidgets: WidgetBundle {
    var body: some Widget { TodayWidget() }
}
