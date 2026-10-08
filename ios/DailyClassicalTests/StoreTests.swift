import Foundation
import StoreKitTest
import Testing
@testable import DailyClassical

/// Runs EntitlementStore's StoreKit 2 path against the local StoreKit configuration (the prices
/// and the monthly plan's free trial), independent of the RevenueCat key the app ships with.
@MainActor
struct StoreTests {
    @Test func pricesAndMonthlyTrialLoad() async throws {
        let url = try #require(Bundle.main.url(forResource: "DailyClassical", withExtension: "storekit"))
        let session = try SKTestSession(contentsOf: url)
        session.resetToDefaultState()
        // The simulator's own storefront (often USA) would convert the lira prices to its own.
        session.storefront = "TUR"
        session.disableDialogs = true
        session.clearTransactions()

        let store = EntitlementStore(revenueCatKey: nil)
        await store.load()
        #expect(store.isAvailable(.lifetime))
        #expect(store.isAvailable(.monthly))
        #expect(store.prices[.lifetime]?.contains("699") == true)
        #expect(store.prices[.monthly]?.contains("129") == true)
        #expect(store.trialDays == 3)
    }
}
