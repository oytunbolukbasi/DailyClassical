import SwiftUI

/// Prose with tappable glossary terms: accent text plus a dotted accent underline, so
/// terms are distinguishable by more than colour. Taps arrive as `dailyclassical-glossary://id`
/// URLs; a screen handles them with `.onGlossaryTap { id in … }`.
struct RichTextView: View {
    let source: String
    var font: Font = Typography.reading
    var lineHeight: CGFloat = 1.6
    /// Design size when `font` is Literata (the reading styles); nil for SF fonts.
    var literataSize: CGFloat? = 17
    var color: Color = Palette.ink
    var termColor: Color = Palette.accent
    @Environment(\.activeGlossaryTerm) private var activeTerm

    var body: some View {
        Text(styled)
            .font(font)
            .modifier(RichLineHeight(multiple: lineHeight, literataSize: literataSize))
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: true)
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
