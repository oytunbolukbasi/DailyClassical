import Foundation
import Observation
import StoreKit

/// Premium via StoreKit 2: one non-consumable (lifetime) and one auto-renewing monthly
/// subscription. Premium unlocks the full library and Search; Today is always free.
@Observable
final class EntitlementStore {
    enum Plan: String, CaseIterable { case lifetime, monthly }

    static let productIDs: [Plan: String] = [
        .lifetime: "co.dailyclassical.premium.lifetime",
        .monthly: "co.dailyclassical.premium.monthly",
    ]

    private(set) var products: [Plan: Product] = [:]
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

    @ObservationIgnored private var updates: Task<Void, Never>?

    init() {
        updates = Task { [weak self] in
            for await result in Transaction.updates {
                if case .verified(let transaction) = result { await transaction.finish() }
                await self?.refresh()
            }
        }
        Task { await load() }
    }

    func load() async {
        if let list = try? await Product.products(for: Array(Self.productIDs.values)) {
            for product in list {
                if let plan = Self.productIDs.first(where: { $0.value == product.id })?.key { products[plan] = product }
            }
        }
        await refresh()
    }

    func refresh() async {
        var plan: Plan?
        for await result in Transaction.currentEntitlements {
            guard case .verified(let t) = result, t.revocationDate == nil else { continue }
            if t.productID == Self.productIDs[.lifetime] { plan = .lifetime } else if plan == nil, t.productID == Self.productIDs[.monthly] { plan = .monthly }
        }
        activePlan = plan
    }

    /// Returns true when the purchase completed.
    func purchase(_ plan: Plan) async throws -> Bool {
        guard let product = products[plan] else { return false }
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
        try? await AppStore.sync()
        await refresh()
    }
}
