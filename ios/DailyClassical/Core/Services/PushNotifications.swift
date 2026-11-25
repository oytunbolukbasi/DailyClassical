import Observation
import UIKit
import UserNotifications

/// Push notifications from our own server (backend: routes/push.ts, /admin/messages). No third
/// party: the APNs token goes to POST /v1/push/devices with the app language, Premium, version
/// and install id (and the account when signed in, through the session token).
///
/// Permission is never asked here: the reminder flow asks once (ReminderScheduler), and a test
/// device invite asks when it is opened. With permission the app registers for remote
/// notifications at every activation; the token is sent again only when something changes, or
/// once a day.
@MainActor
final class PushNotifications {
    static let shared = PushNotifications()

    private let defaults = UserDefaults.standard
    private var token: String?
    private var language = "en"
    private var premium = false

    /// Where this build's tokens are valid: Xcode (development-signed) builds get sandbox tokens;
    /// Ad Hoc, TestFlight and App Store builds production ones. Read from the provisioning
    /// profile's aps-environment; App Store builds have no profile.
    nonisolated static let environment: String = {
        #if targetEnvironment(simulator)
        return "sandbox"
        #else
        guard let url = Bundle.main.url(forResource: "embedded", withExtension: "mobileprovision"),
              let data = try? Data(contentsOf: url),
              let text = String(data: data, encoding: .isoLatin1),
              let start = text.range(of: "<?xml"), let end = text.range(of: "</plist>"),
              let plist = try? PropertyListSerialization.propertyList(from: Data(text[start.lowerBound..<end.upperBound].utf8), format: nil) as? [String: Any],
              let entitlements = plist["Entitlements"] as? [String: Any]
        else { return "production" }
        return entitlements["aps-environment"] as? String == "development" ? "sandbox" : "production"
        #endif
    }()

    /// On every activation and when the language or Premium changes.
    func update(language: String, premium: Bool) async {
        self.language = language
        self.premium = premium
        guard await isAuthorized() else { return }
        UIApplication.shared.registerForRemoteNotifications()
        if let token { await upload(token) }
    }

    /// The reminder flow (or a test invite) just got permission.
    func permissionGranted() {
        UIApplication.shared.registerForRemoteNotifications()
    }

    /// From the app delegate.
    func didRegister(deviceToken: Data) {
        let hex = deviceToken.map { String(format: "%02x", $0) }.joined()
        token = hex
        Task { await upload(hex) }
    }

    private func isAuthorized() async -> Bool {
        switch await UNUserNotificationCenter.current().notificationSettings().authorizationStatus {
        case .authorized, .provisional, .ephemeral: true
        default: false
        }
    }

    private func upload(_ token: String) async {
        let account = defaults.string(forKey: "accountUserID") ?? "-"
        let day = APIClient.day()
        let signature = [token, language, premium ? "1" : "0", AppVersion.current, account, Self.environment, day].joined(separator: "|")
        guard defaults.string(forKey: "push.lastUpload") != signature else { return }
        let body: [String: Any] = [
            "token": token,
            "environment": Self.environment,
            "installId": Analytics.shared.installId,
            "locale": language,
            "premium": premium,
            "appVersion": AppVersion.current,
        ]
        if await Self.post("v1/push/devices", body, signedIn: true) == 204 {
            defaults.set(signature, forKey: "push.lastUpload")
        }
    }

    // MARK: Taps

    /// A push was tapped: count it and open its link.
    func opened(userInfo: [AnyHashable: Any]) {
        if let cid = userInfo["cid"] as? String {
            Task { _ = await Self.post("v1/push/opened", ["campaignId": cid]) }
        }
        if let link = userInfo["link"] as? String, let url = URL(string: link) {
            DeepLinks.shared.open(url)
        }
    }

    // MARK: Test devices

    /// dailyclassical://test-device/<invite>: asks for notification permission if it was never
    /// asked, waits briefly for the push token, then verifies this install as a test device.
    func verifyTestDevice(invite: String) async -> Bool {
        let center = UNUserNotificationCenter.current()
        if await center.notificationSettings().authorizationStatus == .notDetermined {
            _ = try? await center.requestAuthorization(options: [.alert, .sound])
        }
        if await isAuthorized() {
            UIApplication.shared.registerForRemoteNotifications()
            for _ in 0..<32 where token == nil { try? await Task.sleep(for: .milliseconds(250)) }
            if let token {
                defaults.removeObject(forKey: "push.lastUpload")
                await upload(token)
            }
        }
        var body: [String: Any] = [
            "invite": invite,
            "installId": Analytics.shared.installId,
            "device": Self.deviceModel,
            "appVersion": AppVersion.current,
        ]
        if let token { body["pushToken"] = token }
        return await Self.post("v1/push/test-device", body) == 200
    }

    private static var deviceModel: String {
        var info = utsname()
        uname(&info)
        return withUnsafeBytes(of: &info.machine) { String(decoding: $0.prefix(while: { $0 != 0 }), as: UTF8.self) }
    }

    // MARK: Requests

    /// POSTs JSON; returns the status, or nil offline. `signedIn` adds the session token, so the
    /// device is linked to the account.
    static func post(_ path: String, _ body: [String: Any], signedIn: Bool = false) async -> Int? {
        var request = URLRequest(url: APIClient.shared.baseURL.appending(path: path))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if signedIn, let session = Keychain.get("token") { request.setValue("Bearer \(session)", forHTTPHeaderField: "Authorization") }
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.timeoutInterval = 15
        guard let (_, response) = try? await URLSession.shared.data(for: request) else { return nil }
        return (response as? HTTPURLResponse)?.statusCode
    }
}

/// Links from pushes and in-app messages, handed to RootView, which opens them like the widget's
/// dailyclassical:// links. A tap that launches the app arrives before any view exists, so the
/// link waits here until RootView reads it.
@MainActor @Observable
final class DeepLinks {
    static let shared = DeepLinks()
    var pending: URL?
    func open(_ url: URL) { pending = url }
}
