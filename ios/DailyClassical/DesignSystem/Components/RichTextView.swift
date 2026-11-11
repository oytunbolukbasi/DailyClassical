import SwiftUI

/// Prose with tappable glossary terms: accent text plus a dotted accent underline, so
/// terms are distinguishable by more than colour. Taps arrive as `dailyclassical-glossary://id`
/// URLs; a screen handles them with `.onGlossaryTap { id in … }`.
///
/// A term's own glyphs are smaller than a 44 pt target, so the paragraph takes the taps itself: a
/// `TextRenderer` records where each term was laid out, and a tap opens the nearest term whose
/// frame, grown to at least 44 × 44 pt, contains it. The terms stay links for VoiceOver.
struct RichTextView: View {
    let source: String
    var font: Font = Typography.reading
    var lineHeight: CGFloat = 1.6
    /// Design size when `font` is Literata (the reading styles); nil for SF fonts.
    var literataSize: CGFloat? = 17
    var color: Color = Palette.ink
    var termColor: Color = Palette.accent
    @Environment(\.activeGlossaryTerm) private var activeTerm
    @Environment(\.openURL) private var openURL
    @State private var termFrames = TermFrames()

    var body: some View {
        let hasTerms = source.contains("[[")
        text
            .textRenderer(TermFrameRecorder(frames: termFrames))
            .highPriorityGesture(SpatialTapGesture().onEnded { tap in
                if let id = termFrames.term(near: tap.location), let url = RichText.glossaryURL(id) { openURL(url) }
            }, isEnabled: hasTerms)
            .font(font)
            .modifier(RichLineHeight(multiple: lineHeight, literataSize: literataSize))
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: true)
            // Terms are links (VoiceOver's Links rotor); say so once per paragraph that has any.
            .accessibilityHint(source.contains("[[") ? Text("common.glossaryTerm.paragraph.accessibilityHint") : Text(verbatim: ""))
    }

    /// One Text built run by run, so each term carries its id as a `TextAttribute` the renderer can see.
    private var text: Text {
        let attributed = styled
        var result = Text(verbatim: "")
        for run in attributed.runs {
            let piece = Text(AttributedString(attributed[run.range]))
            if let id = run.link.flatMap(RichText.glossaryID) {
                result = Text("\(result)\(piece.customAttribute(GlossaryTermRun(id: id)))")
            } else {
                result = Text("\(result)\(piece)")
            }
        }
        return result
    }

    private var styled: AttributedString {
        var text = RichText.attributed(source)
        for run in text.runs where run.link != nil {
            text[run.range].foregroundColor = termColor
            text[run.range].underlineStyle = Text.LineStyle(pattern: .dot, color: termColor)
            if let activeTerm, run.link.flatMap(RichText.glossaryID) == activeTerm {
                text[run.range].backgroundColor = Palette.accent.opacity(0.14)  // its sheet is open
            }
        }
        return text
    }
}

// MARK: - Term hit areas

private struct GlossaryTermRun: TextAttribute {
    let id: String
}

/// Where each term was drawn, in the Text's own coordinates. A plain class written while drawing,
/// so recording it never invalidates the view.
private final class TermFrames {
    var frames: [(id: String, rect: CGRect)] = []

    static let minimumTarget: CGFloat = 44

    func term(near point: CGPoint) -> String? {
        frames
            .filter { target($0.rect).contains(point) }
            .min { distance(point, $0.rect) < distance(point, $1.rect) }?
            .id
    }

    private func target(_ r: CGRect) -> CGRect {
        r.insetBy(dx: -max(0, (Self.minimumTarget - r.width) / 2), dy: -max(0, (Self.minimumTarget - r.height) / 2))
    }

    private func distance(_ p: CGPoint, _ r: CGRect) -> CGFloat {
        hypot(max(r.minX - p.x, 0, p.x - r.maxX), max(r.minY - p.y, 0, p.y - r.maxY))
    }
}

private struct TermFrameRecorder: TextRenderer {
    let frames: TermFrames

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        var found: [(id: String, rect: CGRect)] = []
        for line in layout {
            for run in line {
                if let term = run[GlossaryTermRun.self] { found.append((term.id, run.typographicBounds.rect)) }
                context.draw(run)
            }
        }
        frames.frames = found
    }
}

private struct RichLineHeight: ViewModifier {
    let multiple: CGFloat
    let literataSize: CGFloat?

    func body(content: Content) -> some View {
        if let literataSize {
            content.lineHeight(multiple, literata: literataSize)
        } else {
            content.lineHeight(multiple)
        }
    }
}

extension EnvironmentValues {
    /// The glossary term whose sheet is currently open, highlighted in running text.
    @Entry var activeGlossaryTerm: String? = nil
}

extension View {
    /// Intercepts glossary links inside `RichTextView`s below this view; other URLs open normally.
    func onGlossaryTap(_ handler: @escaping (String) -> Void) -> some View {
        environment(\.openURL, OpenURLAction { url in
            if let id = RichText.glossaryID(from: url) {
                handler(id)
                return .handled
            }
            return .systemAction
        })
    }
}
