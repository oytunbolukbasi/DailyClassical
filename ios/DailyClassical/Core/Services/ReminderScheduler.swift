import Foundation
import UIKit
import UniformTypeIdentifiers
import UserNotifications

/// The daily reminder at the user's chosen time. Instead of one repeating notification with the
/// same words every day, one notification per day is scheduled ahead: the first `namedDays` name
/// that day's piece ("Beethoven: Symphony No. 9") with its hook as the body and the painting as an
/// image attachment (thumbnail when collapsed, the painting when expanded). Later days, and any
/// day the plan is unknown, get the generic text. The plan is rebuilt when the app becomes active
/// (at most hourly), when the language changes and when the time changes, so it follows
/// content/schedule.yaml as weeks are appended. iOS keeps at most 64 pending requests.
enum ReminderScheduler {
    private static let prefix = "daily-piece"
    /// Days scheduled ahead (a user who doesn't open the app still gets a month of reminders).
    static let daysAhead = 30
    /// Days that name their piece. Kept within the part of the schedule that is appended ahead
    /// of time, so a reminder never names a piece that later changes.
    static let namedDays = 14

    private static let plannedKey = "reminderPlannedAt"
    private static let plannedLanguageKey = "reminderPlannedLanguage"

    /// Whether the reader has Premium, for the birthday gift sentence (set by the app; a change
    /// replans).
    static var premium: Bool {
        get { UserDefaults.standard.bool(forKey: "reminderPremium") }
        set { UserDefaults.standard.set(newValue, forKey: "reminderPremium") }
    }

    static var savedTime: DateComponents? {
        let d = UserDefaults.standard
        guard d.object(forKey: "reminderHour") != nil else { return nil }
        return DateComponents(hour: d.integer(forKey: "reminderHour"), minute: d.integer(forKey: "reminderMinute"))
    }

    /// Asks for permission if needed, saves the time and schedules. Returns false if the user declined.
    @discardableResult
    static func schedule(at time: DateComponents, language: String) async -> Bool {
        let center = UNUserNotificationCenter.current()
        guard (try? await center.requestAuthorization(options: [.alert, .sound])) == true else { return false }
        PushNotifications.shared.permissionGranted()
        UserDefaults.standard.set(time.hour, forKey: "reminderHour")
        UserDefaults.standard.set(time.minute, forKey: "reminderMinute")
        await plan(language: language)
        return true
    }

    static func cancel() {
        Task { await removePending() }
        UserDefaults.standard.removeObject(forKey: "reminderHour")
        UserDefaults.standard.removeObject(forKey: "reminderMinute")
        UserDefaults.standard.removeObject(forKey: plannedKey)
    }

    /// Rebuilds the plan if a reminder is set and the last plan is older than an hour or in
    /// another language. Called when the app becomes active and when the language changes.
    static func refresh(language: String, force: Bool = false) async {
        guard savedTime != nil else { return }
        // Launch asks three times at once (content load, becoming active, Premium resolved); the
        // plan under way already covers the first two.
        if !force, planning != nil { return }
        let d = UserDefaults.standard
        if !force, d.string(forKey: plannedLanguageKey) == language,
           let last = d.object(forKey: plannedKey) as? Date, Date.now.timeIntervalSince(last) < 3600 { return }
        let status = await UNUserNotificationCenter.current().notificationSettings().authorizationStatus
        guard status == .authorized || status == .provisional else { return }
        await plan(language: language)
    }

    // MARK: Planning

    /// The plan being built, if any. Plans run one after another: at launch two or three ran at
    /// once, each removing the others' requests and downloading the same paintings.
    private static var planning: Task<Void, Never>?

    private static func plan(language: String) async {
        let previous = planning
        let task = Task {
            await previous?.value
            // A plan downloads up to 14 paintings. Opened for a moment and closed again, the app was
            // suspended mid-plan: the download in flight failed and that day was planned without its
            // painting. Ask iOS for the time to finish.
            let background = UIApplication.shared.beginBackgroundTask(withName: "reminder-plan")
            await buildPlan(language: language)
            if background != .invalid { UIApplication.shared.endBackgroundTask(background) }
        }
        planning = task
        await task.value
        if planning == task { planning = nil }
    }

    private static func buildPlan(language: String) async {
        guard let time = savedTime, let hour = time.hour, let minute = time.minute else { return }
        let calendar = Calendar.current
        // The first reminder: today if its time is still ahead, else tomorrow.
        var start = calendar.startOfDay(for: .now)
        if let todayAt = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: start), todayAt <= .now {
            start = calendar.date(byAdding: .day, value: 1, to: start) ?? start
        }
        let pieces = await upcoming(from: start, language: language)
        let composers = await composerList(language: language)

        // Everything (paintings included) is ready before the old plan goes: the swap is quick,
        // and a failed download never replaces a reminder that had its picture.
        var requests: [(content: UNMutableNotificationContent, when: DateComponents, key: String)] = []
        var missingPicture = false
        for offset in 0..<daysAhead {
            guard let date = calendar.date(byAdding: .day, value: offset, to: start) else { continue }
            let key = APIClient.day(date)
            let piece = offset < namedDays ? pieces[key]?.piece : nil
            let birthdays = Birthdays.celebrated(on: date, in: composers, simulated: nil)
            let content = await notification(piece: piece, birthdays: birthdays, on: date, language: language, premium: premium)
            if piece != nil, content.attachments.isEmpty { missingPicture = true }
            var when = calendar.dateComponents([.year, .month, .day], from: date)
            when.hour = hour
            when.minute = minute
            requests.append((content, when, key))
        }

        await removePending()
        let center = UNUserNotificationCenter.current()
        // Each plan's identifiers are new, so a removed request's attachment (which iOS deletes
        // asynchronously) can never be confused with its replacement's.
        let run = UUID().uuidString.prefix(8)
        for r in requests {
            let trigger = UNCalendarNotificationTrigger(dateMatching: r.when, repeats: false)
            try? await center.add(UNNotificationRequest(identifier: "\(prefix)-\(r.key)-\(run)", content: r.content, trigger: trigger))
        }
        // A day still without its painting (offline, say): plan again at the next launch instead
        // of an hour later.
        UserDefaults.standard.set(missingPicture ? Date.distantPast : Date.now, forKey: plannedKey)
        UserDefaults.standard.set(language, forKey: plannedLanguageKey)
    }

    /// One day's reminder: a composer's birthday (portrait, "Mozart, 271 years"), else the day's
    /// piece by name with its hook and painting, else the generic text.
    static func notification(piece: UpcomingDay.Piece?, birthdays: [Composer], on date: Date = .now,
                             language: String, premium: Bool) async -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.sound = .default
        // The composer of the day's piece first (two composers can share a birthday).
        let ordered = birthdays.filter { $0.name == piece?.composer.name } + birthdays.filter { $0.name != piece?.composer.name }
        if let c = ordered.first, let years = Birthdays.years(c, on: date) {
            let f = { (key: String, args: [CVarArg]) in
                String(format: L10n.string(String.LocalizationValue(key), code: language), locale: Locale(identifier: language), arguments: args)
            }
            content.title = f("birthday.notification.title %@ %lld", [c.shortName, years])
            var body = c.birthdayLine.map { [$0] } ?? []
            if let piece {
                if piece.composer.name == c.name {
                    body.append(premium ? f("birthday.notification.samePremium %@", [piece.title])
                                        : f("birthday.notification.sameFree %@ %@", [piece.title, c.shortName]))
                } else {
                    body.append(premium ? f("birthday.notification.otherPremium %@ %@ %@", [c.shortName, piece.composer.shortName, piece.title])
                                        : f("birthday.notification.otherFree %@ %@ %@", [c.shortName, piece.composer.shortName, piece.title]))
                }
            } else if !premium {
                body.append(f("birthday.notification.giftOnly %@", [c.shortName]))
            }
            // Two or three composers share the day: name the others too.
            let others = ordered.dropFirst().map(\.shortName)
            if !others.isEmpty {
                body.append(f("birthday.notification.also %@", [others.formatted(.list(type: .and).locale(Locale(identifier: language)))]))
            }
            content.body = body.joined(separator: " ")
            if let attachment = portraitAttachment(c) { content.attachments = [attachment] }
        } else if let piece {
            content.title = "\(piece.composer.shortName): \(piece.title)"
            content.body = piece.hook
            if let attachment = await paintingAttachment(piece) { content.attachments = [attachment] }
        } else {
            content.title = L10n.string("reminder.notification.title", code: language)
            content.body = L10n.string("reminder.notification.body", code: language)
        }
        return content
    }

    // MARK: Test builds (Settings › Test)

    /// Delivers `content` in `seconds` (leave the app to see it as a banner).
    static func sendTest(_ content: UNMutableNotificationContent, after seconds: TimeInterval = 5) async {
        let center = UNUserNotificationCenter.current()
        _ = try? await center.requestAuthorization(options: [.alert, .sound])
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        try? await center.add(UNNotificationRequest(identifier: "test-\(UUID().uuidString)", content: content, trigger: trigger))
    }

    /// The scheduled reminders as iOS holds them, soonest first: "20.11 09:00 · ✓ · Mahler: …"
    /// (✓ = the request carries an image attachment).
    static func pendingSummary() async -> [String] {
        let requests = await UNUserNotificationCenter.current().pendingNotificationRequests()
            .filter { $0.identifier.hasPrefix(prefix) }
        let dated = requests.map { r in
            ((r.trigger as? UNCalendarNotificationTrigger)?.nextTriggerDate() ?? .distantFuture, r)
        }.sorted { $0.0 < $1.0 }
        return dated.map { date, r in
            let when = date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).hour().minute())
            return "\(when) · \(r.content.attachments.isEmpty ? "✗" : "✓") · \(r.content.title)"
        }
    }

    /// A piece as the reminder names it, from a Library summary (painting from the server or the bundle).
    static func upcomingPiece(_ p: PieceSummary) -> UpcomingDay.Piece {
        UpcomingDay.Piece(id: p.id, composer: .init(name: p.composer.name, shortName: p.composer.shortName),
                          title: p.title, hook: p.hook,
                          widgetImageUrl: APIClient.shared.baseURL.appending(path: "images/widget/\(p.id).jpg"))
    }

    /// Pending reminders, including the repeating one builds before 1.3 scheduled ("daily-piece").
    private static func removePending() async {
        let center = UNUserNotificationCenter.current()
        let ids = await center.pendingNotificationRequests().map(\.identifier).filter { $0.hasPrefix(prefix) }
        center.removePendingNotificationRequests(withIdentifiers: ids)
    }

    /// The pieces of the next `namedDays` days by "YYYY-MM-DD": from the API (or its offline
    /// cache), or the bundled plan in builds that read fixtures. Empty if neither is available,
    /// so every day gets the generic text rather than a guess.
    private static func upcoming(from start: Date, language: String) async -> [String: UpcomingDay] {
        let first = APIClient.day(start)
        var days: [UpcomingDay] = []
        if ContentSource.isAPI {
            days = (try? await APIClient.shared.upcoming(from: first, days: namedDays, language: language)) ?? []
        } else if let schedule = try? Fixtures.load(Fixtures.Schedule.self, "schedule", language),
                  let summaries = try? Fixtures.load([PieceSummary].self, "pieces", language) {
            let byID = Dictionary(summaries.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
            for (day, id) in schedule.days where day >= first {
                guard let p = byID[id] else { continue }
                days.append(UpcomingDay(day: day, piece: .init(
                    id: p.id, composer: .init(name: p.composer.name, shortName: p.composer.shortName),
                    title: p.title, hook: p.hook, widgetImageUrl: nil)))
            }
        }
        return Dictionary(days.map { ($0.day, $0) }, uniquingKeysWith: { a, _ in a })
    }

    /// All composers (birthdays): the API (or its offline cache), else the bundled list.
    private static func composerList(language: String) async -> [Composer] {
        if ContentSource.isAPI, let list = try? await APIClient.shared.composers(language: language) { return list }
        return (try? Fixtures.load([Composer].self, "composers", language)) ?? []
    }

    // MARK: Portrait attachment

    /// The composer's bundled portrait as a face-centred square JPEG (crop centre at `focalY`).
    private static func portraitAttachment(_ c: Composer) -> UNNotificationAttachment? {
        guard let url = Bundle.main.url(forResource: "\(c.id)-hero", withExtension: "heic", subdirectory: "Artwork/composers")
                ?? Bundle.main.url(forResource: "\(c.id)-thumb", withExtension: "heic", subdirectory: "Artwork/composers"),
              let image = UIImage(contentsOfFile: url.path), let cg = image.cgImage else { return nil }
        let w = CGFloat(cg.width), h = CGFloat(cg.height), side = min(w, h)
        let focal = CGFloat(c.portrait?.focalY ?? 0.3)
        // object-position semantics: the share of the overflow cropped from the top.
        let y = (h - side) * focal, x = (w - side) / 2
        guard let square = cg.cropping(to: CGRect(x: x, y: y, width: side, height: side)),
              let jpeg = UIImage(cgImage: square).jpegData(compressionQuality: 0.85) else { return nil }
        let file = FileManager.default.temporaryDirectory.appending(path: "reminder-\(UUID().uuidString).jpg")
        guard (try? jpeg.write(to: file)) != nil else { return nil }
        return try? UNNotificationAttachment(identifier: "portrait", url: file,
                                             options: [UNNotificationAttachmentOptionsTypeHintKey: UTType.jpeg.identifier])
    }

    // MARK: Painting attachment

    /// In Application Support, not Caches: iOS empties Caches when space runs low, and the next
    /// plan then had to download every painting again.
    private static var imageCache: URL {
        FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appending(path: "reminder", directoryHint: .isDirectory)
    }

    /// The painting as a JPEG attachment: the widget JPEG from the server (cached by its `?v=`), or
    /// the painting bundled with the app. iOS moves an attachment's file into its own store, so each
    /// request gets a fresh copy from the cache.
    private static func paintingAttachment(_ piece: UpcomingDay.Piece) async -> UNNotificationAttachment? {
        let fm = FileManager.default
        try? fm.createDirectory(at: imageCache, withIntermediateDirectories: true)
        var source: URL?
        if let remote = piece.widgetImageUrl {
            let version = URLComponents(url: remote, resolvingAgainstBaseURL: false)?
                .queryItems?.first { $0.name == "v" }?.value ?? "0"
            let cached = imageCache.appending(path: "\(piece.id)-\(version).jpg")
            if !fm.fileExists(atPath: cached.path),
               let (data, response) = try? await URLSession.shared.data(from: remote),
               (response as? HTTPURLResponse)?.statusCode == 200 {
                try? data.write(to: cached, options: .atomic)
            }
            if fm.fileExists(atPath: cached.path) { source = cached }
        }
        if source == nil {
            let cached = imageCache.appending(path: "\(piece.id)-bundled.jpg")
            if !fm.fileExists(atPath: cached.path),
               let heic = Bundle.main.url(forResource: "\(piece.id)-hero", withExtension: "heic", subdirectory: "Artwork/paintings")
                   ?? Bundle.main.url(forResource: "\(piece.id)-thumb", withExtension: "heic", subdirectory: "Artwork/paintings"),
               let image = UIImage(contentsOfFile: heic.path),
               let jpeg = image.jpegData(compressionQuality: 0.85) {
                try? jpeg.write(to: cached, options: .atomic)
            }
            if fm.fileExists(atPath: cached.path) { source = cached }
        }
        guard let source else { return nil }
        let copy = fm.temporaryDirectory.appending(path: "reminder-\(UUID().uuidString).jpg")
        guard (try? fm.copyItem(at: source, to: copy)) != nil else { return nil }
        return try? UNNotificationAttachment(identifier: "painting", url: copy,
                                             options: [UNNotificationAttachmentOptionsTypeHintKey: UTType.jpeg.identifier])
    }
}
