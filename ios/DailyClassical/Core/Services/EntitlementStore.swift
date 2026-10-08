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

    /// Localized price per plan ("₺600,00"); empty until products load.
    private(set) var prices: [Plan: String] = [:]
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
        UserDefaults.standard.object(forKey: "debugPremium") as? Bool ?? true
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

    init() {
        if let key = Self.revenueCatKey {
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
        Task { await load() }
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
        } else {
            if let list = try? await Product.products(for: Array(Self.productIDs.values)) {
                for product in list {
                    guard let plan = Self.plan(for: product.id) else { continue }
                    storeKitProducts[plan] = product
                    prices[plan] = product.displayPrice
                }
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

    private static func plan(for productID: String) -> Plan? {
        productIDs.first { $0.value == productID }?.key
    }
}
