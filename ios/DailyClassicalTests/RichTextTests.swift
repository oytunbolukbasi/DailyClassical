import Foundation
import Testing
@testable import DailyClassical

struct RichTextTests {
    @Test func glossaryLinkKeepsSurfaceText() {
        let s = RichText.attributed("The movement is in [[sonata-form|sonata form]].")
        #expect(String(s.characters) == "The movement is in sonata form.")
        let link = s.runs.compactMap(\.link).first
        #expect(link.flatMap(RichText.glossaryID) == "sonata-form")
    }

    @Test func turkishSuffixOutsideMark() {
        let s = RichText.plain("[[variation|varyasyon]]lar")
        #expect(s == "varyasyonlar")
    }

    @Test func emphasis() {
        let s = RichText.attributed("writes *pppppp* here")
        #expect(String(s.characters) == "writes pppppp here")
        #expect(s.runs.contains { $0.inlinePresentationIntent == .emphasized })
    }

    @Test func stopKinds() throws {
        let json = #"{"startSec":570,"endSec":630,"approximate":true,"label":null,"hear":"a","happening":"b"}"#
        let stop = try JSONDecoder().decode(ListeningStop.self, from: Data(json.utf8))
        #expect(stop.kind == .range)
    }
}
