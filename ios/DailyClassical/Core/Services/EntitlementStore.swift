import Foundation
import Observation
import RevenueCat
import StoreKit

/// Premium: one non-consumable (lifetime) and one auto-renewing monthly subscription. Premium
/// unlocks the full library and Search; Today is always free.
///
/// Two backends behind one surface:
/// - **RevenueCat** when the build carries a public SDK key (`REVENUECAT_API_KEY`, see project.yml):
///   products come from the current offering, Premium is the `premium` entitlement, and the signed-in
///   account is identified to RevenueCat so purchases show up against it in the dashboard.
/// - **StoreKit 2** otherwise (no key yet, or local testing with DailyClassical.storekit).
@Observable
final class EntitlementStore {
    enum Plan: String, CaseIterable { case lifetime, monthly }

    static let productIDs: [Plan: String] = [
        .lifetime: "co.dailyclassical.premium.lifetime",
        .monthly: "co.dailyclassical.premium.monthly",
    ]
    /// The RevenueCat entitlement both products unlock.
    static let entitlementID = "premium"

    /// Localized price per plan ("₺699,99"); empty until products load.
    private(set) var prices: [Plan: String] = [:]
    /// Days of the monthly plan's free trial, when this Apple ID can still take it (App Store
    /// introductory offer, 3 days); nil otherwise.
    private(set) var trialDays: Int?
    private(set) var activePlan: Plan?
    /// Complimentary Premium on the signed-in account (set from SessionStore).
    var accountPremium = false
    var isPremium: Bool { activePlan != nil || accountPremium || Self.debugUnlock }

    /// Debug builds unlock Premium so content can be reviewed on a device without an account
    /// or a server. Turn off to test the free experience:
    ///   xcrun simctl spawn booted defaults write co.dailyclassical.app debugPremium -bool NO
    /// Release builds never take this path.
    static var debugUnlock: Bool {
        #if DEBUG
        // bool(forKey:) also reads the "NO" string a `-debugPremium NO` launch argument sets.
        UserDefaults.standard.object(forKey: "debugPremium") == nil || UserDefaults.standard.bool(forKey: "debugPremium")
        #else
        false
        #endif
    }

    /// RevenueCat's public key from Info.plist; nil when this build has none.
    static var revenueCatKey: String? {
        let key = (Bundle.main.object(forInfoDictionaryKey: "REVENUECAT_API_KEY") as? String)?
            .trimmingCharacters(in: .whitespaces) ?? ""
        return key.isEmpty || key.hasPrefix("$(") ? nil : key
    }

    private let usesRevenueCat: Bool
    @ObservationIgnored private var storeKitProducts: [Plan: Product] = [:]
    @ObservationIgnored private var packages: [Plan: Package] = [:]
    @ObservationIgnored private var updates: Task<Void, Never>?

    /// `revenueCatKey: nil` forces the StoreKit 2 path (tests against the local configuration).
    init(revenueCatKey: String? = EntitlementStore.revenueCatKey) {
        if let key = revenueCatKey {
            #if DEBUG
            Purchases.logLevel = .info
            #endif
            Purchases.configure(withAPIKey: key)
            usesRevenueCat = true
            updates = Task { [weak self] in
                for await info in Purchases.shared.customerInfoStream { self?.apply(info) }
            }
        } else {
            usesRevenueCat = false
            updates = Task { [weak self] in
                for await result in Transaction.updates {
                    if case .verified(let transaction) = result { await transaction.finish() }
                    await self?.refresh()
                }
            }
        }
        Task {
            await load()
            applyDebugTrial()
        }
    }

    /// Test builds can fake an eligible free trial, so the welcome flow's trial card and the
    /// paywall's trial copy can be reviewed before App Store products exist: Settings › Test, or
    /// the `-debugTrialDays 3` launch argument (simulator builds have no StoreKit configuration).
    static var previewTrialDays: Int {
        TestBuild.isActive ? UserDefaults.standard.integer(forKey: "debugTrialDays") : 0
    }

    private func applyDebugTrial() {
        let days = Self.previewTrialDays
        guard days > 0 else { return }
        trialDays = days
        if prices[.monthly] == nil { prices[.monthly] = "₺129,99" }
        if prices[.lifetime] == nil { prices[.lifetime] = "₺699,99" }
    }

    /// Re-reads the products after the test preview is switched on or off.
    func reloadPreviewTrial() async {
        trialDays = nil
        prices[.monthly] = nil
        await load()
        applyDebugTrial()
    }

    // MARK: Products

    func load() async {
        if usesRevenueCat {
            guard let offering = try? await Purchases.shared.offerings().current else { return }
            for package in offering.availablePackages {
                guard let plan = Self.plan(for: package.storeProduct.productIdentifier) else { continue }
                packages[plan] = package
                prices[plan] = package.storeProduct.localizedPriceString
            }
            if let product = packages[.monthly]?.storeProduct,
               let intro = product.introductoryDiscount, intro.paymentMode == .freeTrial,
               await Purchases.shared.checkTrialOrIntroDiscountEligibility(product: product) == .eligible {
                trialDays = Self.days(intro.subscriptionPeriod.value, unit: intro.subscriptionPeriod.unit)
            } else {
                trialDays = nil
            }
        } else {
            // The first request after launch can come back empty (StoreKit still starting up);
            // one short retry instead of a paywall with dashes.
            var list = (try? await Product.products(for: Array(Self.productIDs.values))) ?? []
            if list.isEmpty {
                try? await Task.sleep(for: .milliseconds(800))
                list = (try? await Product.products(for: Array(Self.productIDs.values))) ?? []
            }
            for product in list {
                guard let plan = Self.plan(for: product.id) else { continue }
                storeKitProducts[plan] = product
                prices[plan] = product.displayPrice
            }
            if let subscription = storeKitProducts[.monthly]?.subscription,
               let intro = subscription.introductoryOffer, intro.paymentMode == .freeTrial,
               await subscription.isEligibleForIntroOffer {
                trialDays = intro.period.value * Self.daysPerUnit(intro.period.unit)
            } else {
                trialDays = nil
            }
            await refresh()
        }
    }

    func isAvailable(_ plan: Plan) -> Bool { prices[plan] != nil }

    // MARK: Purchase / restore

    /// Returns true when the purchase completed.
    func purchase(_ plan: Plan) async throws -> Bool {
        if usesRevenueCat {
            guard let package = packages[plan] else { return false }
            let result = try await Purchases.shared.purchase(package: package)
            if result.userCancelled { return false }
            apply(result.customerInfo)
            if plan == .monthly { trialDays = nil }
            return isPremium
        }
        guard let product = storeKitProducts[plan] else { return false }
        switch try await product.purchase() {
        case .success(let result):
            if case .verified(let transaction) = result { await transaction.finish() }
            await refresh()
            return isPremium
        default:
            return false
        }
    }

    func restore() async {
        if usesRevenueCat {
            if let info = try? await Purchases.shared.restorePurchases() { apply(info) }
        } else {
            try? await AppStore.sync()
            await refresh()
        }
    }

    // MARK: Account

    /// Ties purchases to the signed-in DailyClassical account (nil = signed out). RevenueCat only;
    /// Premium itself still follows the Apple ID, so a purchase works signed out too.
    func identify(userID: String?) async {
        guard usesRevenueCat else { return }
        if let userID {
            guard Purchases.shared.appUserID != userID,
                  let (info, _) = try? await Purchases.shared.logIn(userID) else { return }
            apply(info)
        } else if !Purchases.shared.isAnonymous {
            if let info = try? await Purchases.shared.logOut() { apply(info) }
        }
    }

    // MARK: State

    private func refresh() async {
        if usesRevenueCat {
            if let info = try? await Purchases.shared.customerInfo() { apply(info) }
            return
        }
        var plan: Plan?
        for await result in Transaction.currentEntitlements {
            guard case .verified(let t) = result, t.revocationDate == nil else { continue }
            if t.productID == Self.productIDs[.lifetime] { plan = .lifetime } else if plan == nil, t.productID == Self.productIDs[.monthly] { plan = .monthly }
        }
        activePlan = plan
    }

    private func apply(_ info: CustomerInfo) {
        guard let entitlement = info.entitlements[Self.entitlementID], entitlement.isActive else {
            activePlan = nil
            return
        }
        activePlan = Self.plan(for: entitlement.productIdentifier) ?? .lifetime
    }

    private static func days(_ value: Int, unit: RevenueCat.SubscriptionPeriod.Unit) -> Int {
        switch unit {
        case .day: value
        case .week: value * 7
        case .month: value * 30
        case .year: value * 365
        @unknown default: value
        }
    }

    private static func daysPerUnit(_ unit: Product.SubscriptionPeriod.Unit) -> Int {
        switch unit {
        case .day: 1
        case .week: 7
        case .month: 30
        case .year: 365
        @unknown default: 1
        }
    }

    private static func plan(for productID: String) -> Plan? {
        productIDs.first { $0.value == productID }?.key
    }
}
