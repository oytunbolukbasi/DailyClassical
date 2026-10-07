import Foundation
import Testing
@testable import DailyClassical

@MainActor
struct BundledArtworkTests {
    /// The paywall painting ships in the app (content/app-images.yaml); it must never need the network.
    @Test func paywallPaintingIsBundled() throws {
        let request = try #require(ImagePipeline.shared.request(for: PaywallPainting.url, variant: .hero))
        let bundled = try #require(request.bundled)
        #expect(bundled.lastPathComponent == "friedrich-wanderer-hero.heic")
        #expect(FileManager.default.fileExists(atPath: bundled.path()))
        #expect(request.placeholderHex != nil)
    }
}
