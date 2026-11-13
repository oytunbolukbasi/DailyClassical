import FacebookCore
import UIKit

/// Ad measurement for Meta install campaigns, through the Meta SDK (FacebookCore) in its limited mode:
/// the app never asks for tracking permission (ATT), so there is no advertising identifier and Meta
/// sees aggregated, privacy-preserving data only (Aggregated Event Measurement + SKAdNetwork).
///
/// The SDK manages Apple's SKAdNetwork / AdAttributionKit conversion values itself, from the schema set
/// in Meta Events Manager (coarse values: low = opened or onboarded, medium = read a piece, high = trial
/// or purchase). The app must not set conversion values of its own any more, or the two would fight.
/// Apple still sends us a copy of each winning postback (backend routes/attribution.ts; admin page
/// "Reklamdan gelen indirmeler" counts by the coarse value).
enum AdAttribution {
    enum Step { case onboarded, readPiece }

    /// From the app delegate at launch: starts the SDK (it logs the install and app activations,
    /// FacebookAutoLogAppEventsEnabled in Info.plist).
    @MainActor static func start(_ application: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: options)
    }

    static func record(_ step: Step) {
        switch step {
        case .onboarded:
            AppEvents.shared.logEvent(.completedTutorial)
        case .readPiece:
            // Once per install is enough for optimisation; repeats add noise, not signal.
            let key = "adAttribution.readPieceLogged"
            guard !UserDefaults.standard.bool(forKey: key) else { return }
            UserDefaults.standard.set(true, forKey: key)
            AppEvents.shared.logEvent(.viewedContent, parameters: [.contentType: "piece"])
        }
    }

    /// After a successful purchase. A monthly plan with a free trial counts as a started trial (no
    /// money yet); a paid month or the lifetime plan as a purchase with its price.
    static func purchased(isTrial: Bool, price: Decimal?, currency: String?) {
        if isTrial {
            AppEvents.shared.logEvent(.startTrial)
        } else if let price, let currency {
            AppEvents.shared.logPurchase(amount: NSDecimalNumber(decimal: price).doubleValue, currency: currency)
        }
    }
}

/// Lets the SDK see the launch (it needs the application object, which SwiftUI's App doesn't hand out).
final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        AdAttribution.start(application, options: launchOptions)
        return true
    }
}
