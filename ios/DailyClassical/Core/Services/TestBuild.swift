import Foundation

/// Builds for review on our own devices: Debug, and development-signed Release installs (Xcode,
/// devicectl), which carry an embedded provisioning profile. App Store builds don't, so the
/// test-only Settings rows never reach readers. TestFlight builds show them only after the
/// version row in Settings › About is tapped seven times (`unlockKey`), so App Review never meets
/// them by accident.
nonisolated enum TestBuild {
    static let unlockKey = "testMenuUnlocked"

    static var isActive: Bool {
        #if DEBUG
        true
        #else
        Bundle.main.url(forResource: "embedded", withExtension: "mobileprovision") != nil
            || (isTestFlight && UserDefaults.standard.bool(forKey: unlockKey))
        #endif
    }

    /// TestFlight (and App Review) installs carry a sandbox receipt; App Store installs don't.
    static var isTestFlight: Bool {
        Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
    }
}
