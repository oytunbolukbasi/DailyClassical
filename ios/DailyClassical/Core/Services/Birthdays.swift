import Foundation

/// Composer birthdays (1.3; design: design/birthdays-sharing A1–A7). On a composer's birthday the
/// app says so on Today, the composer sheet, Library, the widget and the reminder, and every piece
/// by that composer is open to free users for the day (the birthday gift).
///
/// Same rule as the server (backend/src/lib/birthday.ts): composers.yaml `birthday` is "MM-DD";
/// 29 February is celebrated on 28 February outside leap years. Two composers can share a day
/// (Brahms and Tchaikovsky, 7 May): the composer of today's piece comes first, otherwise the elder.
nonisolated enum Birthdays {
    /// Settings › Test: pretend today is these composers' birthday (comma-separated ids), or nil.
    static let simulateKey = "debugBirthdayComposer"
    /// The last day a free reader opened a gift piece ("YYYY-MM-DD|composerId"), for the next day's
    /// Library line; and the day that line was dismissed.
    static let giftOpenedKey = "birthdayGiftOpened"
    static let giftLineDismissedKey = "birthdayGiftLineDismissed"

    static var simulatedComposerID: String? {
        get { UserDefaults.standard.string(forKey: simulateKey) }
        set { UserDefaults.standard.set(newValue, forKey: simulateKey) }
    }

    static func monthDay(_ birthday: String, year: Int) -> String {
        guard birthday == "02-29" else { return birthday }
        let leap = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
        return leap ? birthday : "02-28"
    }

    /// Composers celebrated on `date`, in display order. A simulated birthday (test builds) replaces
    /// the real ones on today's date.
    static func celebrated(on date: Date, in composers: some Collection<Composer>, todayComposerID: String? = nil,
                           simulated: String? = Birthdays.simulatedComposerID) -> [Composer] {
        let calendar = Calendar.current
        let list: [Composer]
        if let simulated, !simulated.isEmpty, calendar.isDateInToday(date) {
            let ids = Set(simulated.split(separator: ",").map(String.init))
            list = composers.filter { ids.contains($0.id) }
        } else {
            let c = calendar.dateComponents([.year, .month, .day], from: date)
            guard let year = c.year, let month = c.month, let day = c.day else { return [] }
            let md = String(format: "%02d-%02d", month, day)
            list = composers.filter { $0.birthday.map { monthDay($0, year: year) == md } ?? false }
        }
        return list.sorted { a, b in
            if a.id == todayComposerID { return true }
            if b.id == todayComposerID { return false }
            return (a.birthYear ?? 0) < (b.birthYear ?? 0)
        }
    }

    /// Years since the composer's birth year on `date` ("271" on 27 January 2027).
    static func years(_ composer: Composer, on date: Date = .now) -> Int? {
        guard let born = composer.birthYear else { return nil }
        return Calendar.current.component(.year, from: date) - born
    }
}
