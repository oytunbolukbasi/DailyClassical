import Foundation
import SwiftUI

/// Turns the API's lightweight markup into an AttributedString:
///   [[term-id|surface]]  → a link to `dailyclassical-glossary://term-id`
///   *emphasis*           → italic
/// Views style the link run (dotted underline in the accent colour) and intercept
/// the URL with `.environment(\.openURL, …)` to present the glossary sheet.
nonisolated enum RichText {
    static let glossaryScheme = "dailyclassical-glossary"

    static func glossaryID(from url: URL) -> String? {
        url.scheme == glossaryScheme ? url.host() : nil
    }

    static func attributed(_ source: String) -> AttributedString {
        var result = AttributedString()
        var rest = Substring(source)

        while !rest.isEmpty {
            let nextLink = rest.range(of: "[[")
            let nextEm = rest.firstIndex(of: "*")
            let linkFirst = nextLink.map { link in nextEm.map { link.lowerBound <= $0 } ?? true } ?? false

            if linkFirst, let open = nextLink, let close = rest[open.upperBound...].range(of: "]]") {
                result += AttributedString(rest[..<open.lowerBound])
                let inner = rest[open.upperBound..<close.lowerBound]
                let parts = inner.split(separator: "|", maxSplits: 1)
                let id = String(parts[0])
                var term = AttributedString(String(parts.count > 1 ? parts[1] : parts[0]))
                term.link = URL(string: "\(glossaryScheme)://\(id)")
                term.glossaryTerm = id
                result += term
                rest = rest[close.upperBound...]
            } else if let em = nextEm, let end = rest[rest.index(after: em)...].firstIndex(of: "*") {
                result += AttributedString(rest[..<em])
                var italic = AttributedString(rest[rest.index(after: em)..<end])
                italic.inlinePresentationIntent = .emphasized
                result += italic
                rest = rest[rest.index(after: end)...]
            } else {
                result += AttributedString(rest)
                break
            }
        }
        return result
    }

    /// Plain text for VoiceOver summaries, search and sharing.
    static func plain(_ source: String) -> String {
        String(attributed(source).characters)
    }
}

nonisolated enum GlossaryTermAttribute: CodableAttributedStringKey {
    typealias Value = String
    static let name = "dailyclassical.glossaryTerm"
}

nonisolated extension AttributeScopes {
    struct DailyClassicalAttributes: AttributeScope {
        let glossaryTerm: GlossaryTermAttribute
        let foundation: FoundationAttributes
        let swiftUI: SwiftUIAttributes
    }
    var dailyClassical: DailyClassicalAttributes.Type { DailyClassicalAttributes.self }
}

nonisolated extension AttributeDynamicLookup {
    subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.DailyClassicalAttributes, T>) -> T {
        self[T.self]
    }
}
