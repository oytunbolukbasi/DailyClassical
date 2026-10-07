import SwiftUI

/// GET /v1/config. Content never needs an app update; these only cover a server change that
/// needs a newer build (required) or a release worth mentioning once (recommended).
nonisolated struct AppConfig: Decodable, Sendable {
    let minSupportedVersion: String?
    let latestVersion: String?
    let appStoreUrl: URL?
}

nonisolated enum AppVersion {
    static var current: String { Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0" }

    /// "1.2" < "1.10" < "1.10.1": numeric, component by component; missing components count as 0.
    static func isOlder(_ a: String, than b: String) -> Bool {
        let x = a.split(separator: ".").map { Int($0) ?? 0 }, y = b.split(separator: ".").map { Int($0) ?? 0 }
        for i in 0..<max(x.count, y.count) {
            let l = i < x.count ? x[i] : 0, r = i < y.count ? y[i] : 0
            if l != r { return l < r }
        }
        return false
    }
}

extension View {
    /// Reads /v1/config at launch: a required update covers the app; a recommended one is offered
    /// once per version. Silent when offline or when this build reads bundled content (debug).
    func updateCheck() -> some View { modifier(UpdateCheck()) }
}

private struct UpdateCheck: ViewModifier {
    @AppStorage("updateOfferedForVersion") private var offeredFor = ""
    @Environment(\.openURL) private var openURL
    @State private var config: AppConfig?
    @State private var showRecommended = false

    private var required: Bool {
        guard let min = config?.minSupportedVersion else { return false }
        return AppVersion.isOlder(AppVersion.current, than: min)
    }

    func body(content: Content) -> some View {
        content
            .task {
                guard ContentSource.isAPI, let c = try? await APIClient.shared.config() else { return }
                config = c
                if !required, let latest = c.latestVersion, latest != offeredFor,
                   AppVersion.isOlder(AppVersion.current, than: latest) {
                    offeredFor = latest
                    showRecommended = true
                }
            }
            .alert(Text("update.available.title"), isPresented: $showRecommended) {
                Button("update.available.later", role: .cancel) {}
                Button("update.action") { openStore() }
            } message: {
                Text("update.available.body")
            }
            .fullScreenCover(isPresented: .constant(required)) {
                EmptyStateView(title: Text("update.required.title"), message: Text("update.required.body")) {
                    Button("update.action") { openStore() }.buttonStyle(SmallCapsuleButtonStyle())
                }
                .padding(.horizontal, 32)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Palette.background)
                .interactiveDismissDisabled()
            }
    }

    private func openStore() {
        if let url = config?.appStoreUrl { openURL(url) }
    }
}
