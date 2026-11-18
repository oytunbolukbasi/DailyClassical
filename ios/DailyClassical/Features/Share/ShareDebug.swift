#if DEBUG
import SwiftUI
import UIKit

/// Launch arguments for checking sharing on the simulator, with `-shotPiece <id>` (App/ScreenshotScene):
///
///     -shotShare piece                 open the share preview for the piece
///     -shotShare moment:<m>:<i>        …for stop i (0-based) of movement m
///     -shotShareFormat story           …on Story 9:16 (default Post 4:5)
///     -shotShareExport <directory>     write the cards as PNGs: <id>-<piece|moment>-<story|post>-<lang>.png
///                                      (the moment is the -shotShare one, else the piece card's stop)
///
/// Debug builds only.
enum ShareDebug {
    private static var defaults: UserDefaults { .standard }

    static var subject: ShareSubject? { defaults.string(forKey: "shotShare").flatMap(parse) }
    static var format: ShareFormat? { defaults.string(forKey: "shotShareFormat").flatMap(ShareFormat.init(rawValue:)) }
    static var exportDirectory: String? { defaults.string(forKey: "shotShareExport") }

    private static func parse(_ value: String) -> ShareSubject? {
        let parts = value.split(separator: ":")
        if parts.first == "piece" { return .piece }
        if parts.first == "moment", parts.count == 3, let m = Int(parts[1]), let i = Int(parts[2]) { return .moment(movement: m, stop: i) }
        return nil
    }

    /// Renders the piece and moment cards in both formats and writes them to `exportDirectory`.
    static func export(piece: Piece) async {
        guard let directory = exportDirectory else { return }
        let dir = URL(filePath: directory, directoryHint: .isDirectory)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        var moment: ShareSubject? = nil
        if case .moment = subject { moment = subject }
        else if let stop = piece.shareStop { moment = .moment(movement: stop.movement, stop: stop.stop) }
        for (name, subject) in [("piece", ShareSubject.piece), ("moment", moment)] {
            guard let subject else { continue }
            let card = ShareCard(piece: piece, subject: subject)
            let painting = await ShareCardRenderer.painting(for: card)
            for format in ShareFormat.allCases {
                guard let image = ShareCardRenderer.image(card: card, format: format, painting: painting),
                      let png = image.pngData() else { continue }
                let file = dir.appending(path: "\(piece.id)-\(name)-\(format.rawValue)-\(piece.contentLocale).png")
                do { try png.write(to: file) } catch { print("share export failed: \(file.path()) \(error)") }
            }
            print("share text [\(name)]: \(piece.shareText(subject))")
        }
        print("share export done: \(dir.path())")
    }
}
#endif
