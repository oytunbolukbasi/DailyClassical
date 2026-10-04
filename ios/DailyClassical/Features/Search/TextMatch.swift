import SwiftUI

/// Case- and diacritic-insensitive, locale-aware matching ("minor" finds "minör",
/// "dvorak" finds "Dvořák", Turkish "i"/"İ" fold correctly) with accent highlighting.
nonisolated enum TextMatch {
    static let options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive, .widthInsensitive]

    static func normalized(_ query: String) -> String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func matches(_ text: String, _ query: String, locale: Locale) -> Bool {
        !query.isEmpty && text.range(of: query, options: options, locale: locale) != nil
    }

    /// `text` with every occurrence of `query` coloured `color` (no background, SPEC §3.12).
    static func highlighted(_ text: String, _ query: String, locale: Locale, color: Color) -> AttributedString {
        var result = AttributedString(text)
        guard !query.isEmpty else { return result }
        var searchStart = result.startIndex
        while searchStart < result.endIndex,
              let range = result[searchStart...].range(of: query, options: options, locale: locale) {
            result[range].swiftUI.foregroundColor = color
            guard range.upperBound > searchStart else { break }
            searchStart = range.upperBound
        }
        return result
    }
}
