import Foundation
import ImageIO
import UIKit

/// What a widget shows for one day: from the widget's feed (WidgetFeed, content published after
/// this build) or, failing that, the fixtures bundled with the app (Resources/Fixtures/<lang>/
/// pieces.json + schedule.json), so widgets always work offline.
struct WidgetPiece: Hashable {
    let id: String
    let composerName: String
    let composerShortName: String
    let title: String
    let hook: String
    let year: Int
    let durationMin: Int
    let movementCount: Int
    let paintingArtist: String?
    let paintingTitle: String?
}

enum WidgetData {
    /// Shared with the app (LanguageSettings writes `appLanguage` there too).
    static let appGroup = "group.co.dailyclassical"

    /// The app's language choice ("system" | "en" | "tr"), resolved like AppLanguage does.
    static var languageCode: String {
        let stored = UserDefaults(suiteName: appGroup)?.string(forKey: "appLanguage") ?? "system"
        if stored == "en" || stored == "tr" { return stored }
        return Locale.preferredLanguages
            .compactMap { Locale(identifier: $0).language.languageCode?.identifier }
            .first { ["en", "tr"].contains($0) } ?? "en"
    }

    private struct Schedule: Decodable { let order: [String]; let days: [String: String] }
    private struct Summary: Decodable {
        struct Composer: Decodable { let name: String; let shortName: String }
        struct Painting: Decodable { let artist: String; let title: String }
        let id: String
        let composer: Composer
        let title: String
        let hook: String
        let year: Int
        let durationMin: Int
        let movementCount: Int
        let painting: Painting?
    }

    private static func load<T: Decodable>(_ type: T.Type, _ name: String, _ lang: String) -> T? {
        let url = Bundle.main.url(forResource: name, withExtension: "json", subdirectory: "Fixtures/\(lang)")
            ?? Bundle.main.url(forResource: name, withExtension: "json", subdirectory: "Fixtures/en")
        guard let url, let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    static func dayKey(_ date: Date) -> String {
        date.formatted(Date.ISO8601FormatStyle(timeZone: .current).year().month().day())
    }

    /// One day's widget content: the feed's entry when it has that day, else the bundled plan.
    static func day(_ date: Date, feed: WidgetFeed?, large: Bool) -> (piece: WidgetPiece, imageURL: URL?, inOneLine: String?)? {
        if let p = feed?.day(dayKey(date))?.piece {
            let piece = WidgetPiece(
                id: p.id, composerName: p.composer.name, composerShortName: p.composer.shortName,
                title: p.title, hook: p.hook, year: p.year, durationMin: p.durationMin,
                movementCount: p.movementCount, paintingArtist: p.painting?.artist, paintingTitle: p.painting?.title
            )
            let downloaded = WidgetFeed.imageFile(for: p).flatMap { FileManager.default.fileExists(atPath: $0.path) ? $0 : nil }
            return (piece, downloaded ?? paintingURL(for: p.id, large: large), large ? p.inOneLine.map(plainLine) : nil)
        }
        guard let piece = piece(on: date) else { return nil }
        return (piece, paintingURL(for: piece.id, large: large), large ? inOneLine(for: piece.id) : nil)
    }

    /// The bundled plan's piece for `date` in the current language.
    static func piece(on date: Date) -> WidgetPiece? {
        let lang = languageCode
        guard let schedule = load(Schedule.self, "schedule", lang),
              let pieces = load([Summary].self, "pieces", lang) else { return nil }
        let id = schedule.days[dayKey(date)] ?? schedule.order.first
        guard let s = pieces.first(where: { $0.id == id }) else { return nil }
        return WidgetPiece(
            id: s.id, composerName: s.composer.name, composerShortName: s.composer.shortName,
            title: s.title, hook: s.hook, year: s.year, durationMin: s.durationMin,
            movementCount: s.movementCount, paintingArtist: s.painting?.artist, paintingTitle: s.painting?.title
        )
    }

    /// The widget's own artwork (`npm run images:widget`): one JPEG per painting, long side ≤ 1100 px.
    /// JPEG decodes at reduced size, so even the large widget stays far below the extension's memory
    /// limit; the app's HEIC heroes aren't bundled into the widget at all.
    static func paintingURL(for id: String, large: Bool) -> URL? {
        Bundle.main.url(forResource: id, withExtension: "jpg", subdirectory: "Artwork")
    }

    /// Decodes straight to the widget's pixel size. Called while a view renders, never stored in
    /// timeline entries: widget extensions get ~30 MB on device, and holding a week of decoded
    /// paintings exceeded it (the system silently kills the extension and the widget stays blank;
    /// the simulator has no such limit).
    static func painting(at url: URL, maxPixel: CGFloat) -> UIImage? { downsample(url, maxPixel: maxPixel) }

    static func downsample(_ url: URL, maxPixel: CGFloat) -> UIImage? {
        guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else { return nil }
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel,
        ]
        guard let cg = CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary) else { return nil }
        return UIImage(cgImage: cg)
    }
}

extension WidgetData {
    private struct PieceDoc: Decodable {
        struct Doc: Decodable { struct BP: Decodable { let inOneLine: String? }; let bigPicture: BP }
        let document: Doc
    }

    /// "Struggle and longing (I), …" without markup, for the large widget's second sentence.
    static func inOneLine(for id: String) -> String? {
        guard let raw = load(PieceDoc.self, "piece-\(id)", languageCode)?.document.bigPicture.inOneLine else { return nil }
        return plainLine(raw)
    }

    static func plainLine(_ raw: String) -> String {
        let plain = raw.replacingOccurrences(of: #"\[\[[^|\]]+\|([^\]]+)\]\]"#, with: "$1", options: .regularExpression)
            .replacingOccurrences(of: "*", with: "")
            .replacingOccurrences(of: #"\s*\([IVX]+\)"#, with: "", options: .regularExpression)  // "(I)" markers read as noise here
            .trimmingCharacters(in: .whitespaces)
        return plain.prefix(1).uppercased(with: Locale(identifier: languageCode)) + plain.dropFirst()
    }
}

extension WidgetPiece {
    /// "Symphony No. 6 in B minor, “Pathétique”" → "Symphony No. 6, “Pathétique”";
    /// "Si minör 6. Senfoni, “Patetik”" → "6. Senfoni, “Patetik”". Small and medium sizes use it.
    var shortTitle: String {
        let en = #" in [A-G](-flat|-sharp)? (major|minor)"#
        let tr = #"^(Do|Re|Mi|Fa|Sol|La|Si)( bemol| diyez)? (majör|minör) "#
        return title
            .replacingOccurrences(of: en, with: "", options: .regularExpression)
            .replacingOccurrences(of: tr, with: "", options: .regularExpression)
    }
}
