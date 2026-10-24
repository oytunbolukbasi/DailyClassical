import Foundation

/// Anonymous usage counts for the admin page (POST /v1/events, backend routes/events.ts): days the
/// app was opened, piece pages opened, "Open in Spotify" taps. The install id is a random UUID made
/// here on first launch; it is never tied to the account, the device or an advertising id, and no
/// other data is sent. Test builds (Xcode, TestFlight) are flagged so the counts leave them out.
/// Events wait in UserDefaults until a send succeeds, so offline use is counted later.
@MainActor
final class Analytics {
    static let shared = Analytics()

    private struct Event: Codable, Equatable {
        let type: String
        let day: String
        let pieceId: String?
    }

    private let defaults = UserDefaults.standard
    private let queueKey = "analytics.queue"
    private var queue: [Event]
    private var sending = false
    private var flushTask: Task<Void, Never>?

    private init() {
        queue = (defaults.data(forKey: queueKey)).flatMap { try? JSONDecoder().decode([Event].self, from: $0) } ?? []
    }

    private var installId: String {
        if let id = defaults.string(forKey: "analytics.installId") { return id }
        let id = UUID().uuidString.lowercased()
        defaults.set(id, forKey: "analytics.installId")
        return id
    }

    /// The listener's own calendar date, so "a day" is their day.
    private static func today() -> String {
        Date.now.formatted(Date.ISO8601FormatStyle(timeZone: .current).year().month().day())
    }

    /// The app came to the foreground: counts the day once, and sends anything still waiting.
    func appBecameActive() {
        let day = Self.today()
        if defaults.string(forKey: "analytics.lastActiveDay") != day {
            defaults.set(day, forKey: "analytics.lastActiveDay")
            record(Event(type: "active", day: day, pieceId: nil))
        } else {
            scheduleFlush(after: .seconds(1))
        }
    }

    func pieceOpened(_ pieceId: String) { record(Event(type: "piece_open", day: Self.today(), pieceId: pieceId)) }
    func spotifyTapped(_ pieceId: String) { record(Event(type: "spotify_tap", day: Self.today(), pieceId: pieceId)) }

    private func record(_ event: Event) {
        queue.append(event)
        if queue.count > 300 { queue.removeFirst(queue.count - 300) }
        save()
        scheduleFlush(after: .seconds(5))
    }

    private func save() {
        defaults.set(try? JSONEncoder().encode(queue), forKey: queueKey)
    }

    /// Batches a few seconds of events into one request.
    private func scheduleFlush(after delay: Duration) {
        flushTask?.cancel()
        flushTask = Task {
            try? await Task.sleep(for: delay)
            guard !Task.isCancelled else { return }
            await flush()
        }
    }

    private func flush() async {
        guard !sending, !queue.isEmpty else { return }
        sending = true
        defer { sending = false }
        let batch = Array(queue.prefix(100))
        let body: [String: Any] = [
            "installId": installId,
            "appVersion": AppVersion.current,
            "locale": Locale.current.language.languageCode?.identifier ?? "en",
            "test": TestBuild.isActive,
            "events": batch.map { e -> [String: String] in
                var d = ["type": e.type, "day": e.day]
                if let p = e.pieceId { d["pieceId"] = p }
                return d
            },
        ]
        var request = URLRequest(url: APIClient.shared.baseURL.appending(path: "v1/events"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.timeoutInterval = 15
        guard let (_, response) = try? await URLSession.shared.data(for: request),
              let status = (response as? HTTPURLResponse)?.statusCode else { return }  // offline: keep for later
        // Sent, or rejected as malformed (would fail forever): either way drop the batch.
        if (200..<300).contains(status) || status == 400 {
            queue.removeFirst(min(batch.count, queue.count))
            save()
            if !queue.isEmpty { scheduleFlush(after: .seconds(1)) }
        }
    }
}
