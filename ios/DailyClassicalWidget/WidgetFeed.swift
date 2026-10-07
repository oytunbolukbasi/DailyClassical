import Foundation

/// The widget's own copy of upcoming days (GET /v1/widget), so pieces published after the app
/// shipped reach the Home Screen without an app update, and the widget rolls over at midnight
/// without the app being opened.
///
/// Order of preference for every day: the fresh feed → the feed cached in the App Group (offline,
/// or the request failed) → the fixtures bundled with this build (WidgetData). Images follow the
/// same order: the downloaded widget JPEG, then the bundled one.
struct WidgetFeed: Codable {
    struct Day: Codable {
        let day: String
        let piece: Piece
    }
    struct Piece: Codable {
        struct Composer: Codable { let name: String; let shortName: String }
        struct Painting: Codable { let artist: String; let title: String }
        let id: String
        let composer: Composer
        let title: String
        let hook: String
        let year: Int
        let durationMin: Int
        let movementCount: Int
        let painting: Painting?
        let inOneLine: String?
        let widgetImageUrl: URL?
    }

    let days: [Day]
    /// The language the feed was fetched in (set locally, absent from the API response); a cached
    /// feed in another language is ignored.
    var language: String?

    func day(_ key: String) -> Day? { days.first { $0.day == key } }
}

extension WidgetFeed {
    private static var container: URL? {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: WidgetData.appGroup)?
            .appending(path: "Widget", directoryHint: .isDirectory)
    }

    private static func feedFile(_ language: String) -> URL? { container?.appending(path: "feed-\(language).json") }

    /// Downloaded painting for `id` at the feed's version (`?v=` hash), if present.
    static func imageFile(for piece: Piece) -> URL? {
        guard let url = piece.widgetImageUrl, let dir = container else { return nil }
        let version = URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?.first { $0.name == "v" }?.value ?? "0"
        return dir.appending(path: "art/\(piece.id)-\(version).jpg")
    }

    static func cached(_ language: String) -> WidgetFeed? {
        guard let file = feedFile(language), let data = try? Data(contentsOf: file),
              let feed = try? JSONDecoder().decode(WidgetFeed.self, from: data), feed.language == language
        else { return nil }
        return feed
    }

    /// Whether this build reads content from the API. The app records its choice in the App Group
    /// (debug builds use bundled fixtures unless DC_USE_API=1), so app and widget agree.
    static var usesAPI: Bool {
        UserDefaults(suiteName: WidgetData.appGroup)?.object(forKey: "contentFromAPI") as? Bool ?? true
    }

    private static var baseURL: URL? {
        (Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String).flatMap(URL.init(string:))
    }

    /// Fetches the next `days` days and their images, stores them, and returns the feed.
    /// Nil when the API is off for this build or unreachable; callers then use `cached`.
    static func refresh(language: String, from today: Date, days: Int = 4) async -> WidgetFeed? {
        guard usesAPI, let base = baseURL, var components = URLComponents(
            url: base.appending(path: "v1/widget"), resolvingAgainstBaseURL: false
        ) else { return nil }
        components.queryItems = [
            URLQueryItem(name: "date", value: WidgetData.dayKey(today)),
            URLQueryItem(name: "days", value: String(days)),
        ]
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.setValue(language, forHTTPHeaderField: "Accept-Language")

        let session = URLSession(configuration: .ephemeral)
        guard let (data, response) = try? await session.data(for: request),
              (response as? HTTPURLResponse)?.statusCode == 200,
              var feed = try? JSONDecoder().decode(WidgetFeed.self, from: data)
        else { return nil }
        feed.language = language

        guard let dir = container else { return feed }
        try? FileManager.default.createDirectory(at: dir.appending(path: "art"), withIntermediateDirectories: true)
        for day in feed.days {
            guard let remote = day.piece.widgetImageUrl, let local = imageFile(for: day.piece),
                  !FileManager.default.fileExists(atPath: local.path) else { continue }
            if let (bytes, r) = try? await session.data(from: remote), (r as? HTTPURLResponse)?.statusCode == 200 {
                try? bytes.write(to: local, options: .atomic)
            }
        }
        if let file = feedFile(language), let encoded = try? JSONEncoder().encode(feed) {
            try? encoded.write(to: file, options: .atomic)
        }
        prune(keeping: Set(feed.days.compactMap { imageFile(for: $0.piece)?.lastPathComponent }))
        return feed
    }

    /// Drops downloaded paintings no longer in the feed, so the App Group doesn't grow.
    private static func prune(keeping names: Set<String>) {
        guard let dir = container?.appending(path: "art"),
              let files = try? FileManager.default.contentsOfDirectory(atPath: dir.path) else { return }
        for name in files where !names.contains(name) {
            try? FileManager.default.removeItem(at: dir.appending(path: name))
        }
    }
}
