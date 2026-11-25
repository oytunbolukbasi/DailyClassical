import Foundation
import OneSignalFramework
import UIKit

/// Push notifications and in-app messages sent from OneSignal (campaigns, the day-after-install
/// Premium note, announcements), next to the daily reminder, which stays a local notification
/// (ReminderScheduler).
///
/// Off unless Info.plist carries ONESIGNAL_APP_ID (project.yml). OneSignal never asks for
/// notification permission itself: the app asks once, in the reminder flow, and OneSignal picks up
/// that answer. In-app messages need no permission.
///
/// What OneSignal knows about a reader: our account id when signed in (`login`), the app language,
/// and these tags for targeting: `premium` (1/0), `plan` (lifetime/monthly/none), `reminder` (1/0),
/// `test` (1 in Debug and TestFlight builds, so campaigns can leave them out).
enum PushMessaging {
    private static let appID: String? = {
        let id = (Bundle.main.object(forInfoDictionaryKey: "ONESIGNAL_APP_ID") as? String)?
            .trimmingCharacters(in: .whitespaces)
        return id?.isEmpty == false ? id : nil
    }()

    static var isOn: Bool { appID != nil }

    /// From the app delegate at launch.
    @MainActor static func start(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        guard let appID else { return }
        OneSignal.initialize(appID, withLaunchOptions: launchOptions)
        OneSignal.User.addTag(key: "test", value: TestBuild.isActive ? "1" : "0")
    }

    /// The signed-in account, so a campaign can reach the same reader on every device.
    static func identify(userID: String?) {
        guard isOn else { return }
        if let userID { OneSignal.login(userID) } else { OneSignal.logout() }
    }

    static func setLanguage(_ code: String) {
        guard isOn else { return }
        OneSignal.User.setLanguage(code)
    }

    static func update(premium: Bool, plan: String?, reminderOn: Bool) {
        guard isOn else { return }
        OneSignal.User.addTags([
            "premium": premium ? "1" : "0",
            "plan": plan ?? "none",
            "reminder": reminderOn ? "1" : "0",
        ])
    }
}
