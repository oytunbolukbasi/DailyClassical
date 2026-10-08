import Foundation

/// Builds for review on our own devices: Debug, and development-signed Release installs (Xcode,
/// devicectl), which carry an embedded provisioning profile. App Store and TestFlight builds don't,
/// so the test-only Settings rows never reach readers.
enum TestBuild {
    static let isActive: Bool = {
        #if DEBUG
        true
        #else
        Bundle.main.url(forResource: "embedded", withExtension: "mobileprovision") != nil
        #endif
    }()
}
