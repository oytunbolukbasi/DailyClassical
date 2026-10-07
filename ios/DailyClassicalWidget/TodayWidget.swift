import SwiftUI
import WidgetKit

struct TodayEntry: TimelineEntry {
    let date: Date
    let piece: WidgetPiece?
    /// Downloaded or bundled artwork file; decoded by the view at render time (see WidgetData.painting).
    let imageURL: URL?
    let inOneLine: String?
    let language: String
}

struct TodayProvider: TimelineProvider {
    func placeholder(in context: Context) -> TodayEntry {
        entry(for: .now, family: context.family, feed: WidgetFeed.cached(WidgetData.languageCode))
    }

    func getSnapshot(in context: Context, completion: @escaping (TodayEntry) -> Void) {
        completion(entry(for: .now, family: context.family, feed: WidgetFeed.cached(WidgetData.languageCode)))
    }

    /// Today now, then one entry per midnight for the next three days. The feed is refreshed
    /// first (content published after this build), falling back to the cached feed and then to
    /// the bundled plan. The timeline ends after the last midnight, and the app also asks
    /// WidgetKit to reload whenever it opens.
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayEntry>) -> Void) {
        let family = context.family
        // WidgetKit's completion handler isn't Sendable; it is called exactly once, from this task.
        nonisolated(unsafe) let completion = completion
        Task {
            let language = WidgetData.languageCode
            let feed = await WidgetFeed.refresh(language: language, from: .now) ?? WidgetFeed.cached(language)
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: .now)
            var entries = [entry(for: .now, family: family, feed: feed)]
            for offset in 1...3 {
                if let day = calendar.date(byAdding: .day, value: offset, to: start) {
                    entries.append(entry(for: day, family: family, feed: feed))
                }
            }
            completion(Timeline(entries: entries, policy: .atEnd))
        }
    }

    private func entry(for date: Date, family: WidgetFamily, feed: WidgetFeed?) -> TodayEntry {
        let content = WidgetData.day(date, feed: feed, large: family == .systemLarge)
        return TodayEntry(
            date: date,
            piece: content?.piece,
            imageURL: content?.imageURL,
            inOneLine: content?.inOneLine,
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
