import Foundation
import UserNotifications

/// One quiet notification a day at the user's chosen time.
enum ReminderScheduler {
    private static let id = "daily-piece"

    static var savedTime: DateComponents? {
        let d = UserDefaults.standard
        guard d.object(forKey: "reminderHour") != nil else { return nil }
        return DateComponents(hour: d.integer(forKey: "reminderHour"), minute: d.integer(forKey: "reminderMinute"))
    }

    /// Asks for permission if needed, then schedules. Returns false if the user declined.
    @discardableResult
    static func schedule(at time: DateComponents, title: String, body: String) async -> Bool {
        let center = UNUserNotificationCenter.current()
        guard (try? await center.requestAuthorization(options: [.alert, .sound])) == true else { return false }
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: time.hour, minute: time.minute), repeats: true)
        center.removePendingNotificationRequests(withIdentifiers: [id])
        try? await center.add(UNNotificationRequest(identifier: id, content: content, trigger: trigger))
        UserDefaults.standard.set(time.hour, forKey: "reminderHour")
        UserDefaults.standard.set(time.minute, forKey: "reminderMinute")
        return true
    }

    static func cancel() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        UserDefaults.standard.removeObject(forKey: "reminderHour")
        UserDefaults.standard.removeObject(forKey: "reminderMinute")
    }
}
