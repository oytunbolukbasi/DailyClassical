import AdAttributionKit
import StoreKit

/// How far a new install got, for Apple's privacy-preserving ad attribution (SKAdNetwork and
/// AdAttributionKit): no SDK, no identifier, nothing about the person. If the install came from an
/// ad (Meta), iOS reports the ad network, the campaign and the highest step below to the network a
/// few days later, and a copy to us (backend routes/attribution.ts, the admin page's "Reklamdan
/// gelen indirmeler"). Steps only go up, and only the first days after install count.
enum AdAttribution {
    enum Step: Int {
        case opened = 0
        case onboarded = 10
        case readPiece = 20
        case trialOrMonthly = 40
        case lifetime = 50
    }

    private static let key = "adAttribution.step"

    /// From app launch: starts the attribution window (Apple asks for a call on first launch).
    static func appLaunched() { record(.opened) }

    static func record(_ step: Step) {
        let defaults = UserDefaults.standard
        // The first call (first launch) always goes through; after that only a higher step.
        if let current = defaults.object(forKey: key) as? Int, current >= step.rawValue { return }
        defaults.set(step.rawValue, forKey: key)
        let value = step.rawValue
        Task.detached(priority: .utility) {
            let coarse: (AdAttributionKit.CoarseConversionValue, SKAdNetwork.CoarseConversionValue) =
                value >= 40 ? (.high, .high) : value >= 20 ? (.medium, .medium) : (.low, .low)
            try? await Postback.updateConversionValue(value, coarseConversionValue: coarse.0, lockPostback: false)
            try? await SKAdNetwork.updatePostbackConversionValue(value, coarseValue: coarse.1, lockWindow: false)
        }
    }
}
