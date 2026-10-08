import Foundation
import StoreKitTest
import Testing
@testable import DailyClassical

/// Runs EntitlementStore's StoreKit 2 path against the local StoreKit configuration (the prices
/// and the monthly plan's free trial the paywall shows before RevenueCat is connected).
@MainActor
struct StoreTests {
    @Test func pricesAndMonthlyTrialLoad() async throws {
        let url = try #require(Bundle.main.url(forResource: "DailyClassical", withExtension: "storekit"))
        let session = try SKTestSession(contentsOf: url)
        session.resetToDefaultState()
        session.disableDialogs = true
        session.clearTransactions()

        let store = EntitlementStore()
        await store.load()
        #expect(store.isAvailable(.lifetime))
        #expect(store.isAvailable(.monthly))
        #expect(store.prices[.lifetime]?.contains("699") == true)
        #expect(store.prices[.monthly]?.contains("129") == true)
        #expect(store.trialDays == 3)
    }
}
