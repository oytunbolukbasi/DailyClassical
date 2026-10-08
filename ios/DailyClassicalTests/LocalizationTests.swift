import Foundation
import Testing
@testable import DailyClassical

/// Strings with counts compile to plural rules (build-strings.py "plurals"): English says
/// "1 minute", Turkish keeps the noun singular after any number.
struct LocalizationTests {
    @Test func englishMetaLinesUseTheSingularForOne() {
        #expect(L10n.string("piece.meta \("1893") \(1)", code: "en") == "1893 · About 1 minute")
        #expect(L10n.string("piece.meta \("1893") \(46)", code: "en") == "1893 · About 46 minutes")
        #expect(L10n.string("today.meta \("1808") \(1) \(1)", code: "en") == "1808 · About 1 minute · 1 movement")
        #expect(L10n.string("today.meta \("1808") \(33) \(4)", code: "en") == "1808 · About 33 minutes · 4 movements")
    }

    @Test func turkishMetaLinesKeepTheNounSingular() {
        #expect(L10n.string("today.meta \("1808") \(1) \(1)", code: "tr") == "1808 · Yaklaşık 1 dakika · 1 bölüm")
        #expect(L10n.string("today.meta \("1808") \(33) \(4)", code: "tr") == "1808 · Yaklaşık 33 dakika · 4 bölüm")
    }
}
