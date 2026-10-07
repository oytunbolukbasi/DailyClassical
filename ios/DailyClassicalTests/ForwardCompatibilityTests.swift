import Foundation
import Testing
@testable import DailyClassical

/// Content ships without app updates: a build must keep working when the server adds forms,
/// eras, roles or whole new shapes after it was released.
struct ForwardCompatibilityTests {
    private func summary(id: String, form: String? = nil, era: String = "romantic") -> String {
        let formField = form.map { #","form":"\#($0)""# } ?? ""
        return #"{"id":"\#(id)","contentLocale":"en","composer":{"id":"c","name":"C","shortName":"C"},"title":"T","catalogue":null,"keyLabel":null,"year":1800,"era":"\#(era)"\#(formField),"durationMin":20,"movementCount":3,"hook":"H","painting":null}"#
    }

    @Test func unknownFormAndEraFallBackToOther() throws {
        let s = try JSONDecoder().decode(PieceSummary.self, from: Data(summary(id: "a", form: "opera", era: "renaissance").utf8))
        #expect(s.kind == .other)
        #expect(s.era == .other)
    }

    @Test func missingFormReadsAsSymphony() throws {
        let s = try JSONDecoder().decode(PieceSummary.self, from: Data(summary(id: "a").utf8))
        #expect(s.kind == .symphony)
    }

    @Test func knownFormDecodes() throws {
        let s = try JSONDecoder().decode(PieceSummary.self, from: Data(summary(id: "a", form: "piano-sonata").utf8))
        #expect(s.kind == .pianoSonata)
    }

    @Test func lossyListSkipsElementsItCannotRead() throws {
        let broken = #"{"id":"broken"}"#
        let json = "[\(summary(id: "a")),\(broken),\(summary(id: "b", form: "string-quartet"))]"
        let list = try JSONDecoder().decode(LossyList<PieceSummary>.self, from: Data(json.utf8))
        #expect(list.elements.map(\.id) == ["a", "b"])
    }

    @Test func soloRecordingNamesOnlyThePlayer() throws {
        let json = #"{"id":"r","role":"reference","conductor":null,"orchestra":null,"soloists":[{"name":"Daniel Barenboim","role":"piano"}],"chorus":null,"label":"Deutsche Grammophon","recordedYear":"1983","releaseYear":1984,"spotifyUrl":null}"#
        let r = try JSONDecoder().decode(Recording.self, from: Data(json.utf8))
        #expect(r.performers == "Daniel Barenboim")
        #expect(r.citation() == "Barenboim (Deutsche Grammophon, 1984)")
    }

    @Test func concertoRecordingLeadsWithTheSoloist() throws {
        let json = #"{"id":"r","role":"remastered","conductor":"Stanisław Wisłocki","orchestra":"Warsaw Philharmonic Orchestra","soloists":[{"name":"Sviatoslav Richter","role":"piano"}],"chorus":null,"label":null,"recordedYear":null,"releaseYear":1959,"spotifyUrl":null}"#
        let r = try JSONDecoder().decode(Recording.self, from: Data(json.utf8))
        #expect(r.role == .alternative)  // unknown role
        #expect(r.performers == "Sviatoslav Richter, Stanisław Wisłocki, Warsaw Philharmonic Orchestra")
    }

    @Test func glossaryTermWithoutShortFallsBackToTheDefinition() throws {
        let old = #"{"id":"coda","term":"Coda","definition":"A closing section added to the end of a *movement*."}"#
        let t = try JSONDecoder().decode(GlossaryTerm.self, from: Data(old.utf8))
        #expect(t.short == nil)
        #expect(t.summary == "A closing section added to the end of a movement.")

        let current = #"{"id":"coda","term":"Coda","short":"The closing section that rounds off a movement","definition":"A closing section."}"#
        #expect(try JSONDecoder().decode(GlossaryTerm.self, from: Data(current.utf8)).summary == "The closing section that rounds off a movement")
    }

    @Test func bundledGlossaryHasAShortForEveryTerm() throws {
        for language in ["en", "tr"] {
            let terms = try Fixtures.load([GlossaryTerm].self, "glossary", language)
            #expect(!terms.isEmpty)
            #expect(terms.allSatisfy { $0.short?.isEmpty == false })
        }
    }
}

struct AppVersionTests {
    @Test func comparesNumerically() {
        #expect(AppVersion.isOlder("1.2", than: "1.10"))
        #expect(AppVersion.isOlder("1.10", than: "1.10.1"))
        #expect(!AppVersion.isOlder("1.10.0", than: "1.10"))
        #expect(!AppVersion.isOlder("2.0", than: "1.9.9"))
    }
}
