import SwiftUI

/// The coda block at the end of the piece page, between Threads and Recommended recordings
/// (design B1-Coda): a live preview of the share card, one line and a solid "Share this piece".
struct ShareCoda: View {
    let piece: Piece
    let onShare: () -> Void
    @Environment(\.dynamicTypeSize) private var typeSize

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionLabel("share.coda.label")
            // At accessibility text sizes the line and button need the full width.
            let layout = typeSize.isAccessibilitySize
                ? AnyLayout(VStackLayout(alignment: .leading, spacing: 18))
                : AnyLayout(HStackLayout(alignment: .center, spacing: 18))
            layout {
                Button(action: onShare) {
                    ShareCardThumbnail(card: ShareCard(piece: piece, subject: .piece), height: 165)
                        .clipShape(.rect(cornerRadius: Radius.thumbS, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: Radius.thumbS, style: .continuous).strokeBorder(Palette.rule, lineWidth: 0.5))
                        .shadow(color: Color(red: 0x1E / 255, green: 0x1B / 255, blue: 0x17 / 255).opacity(0.14), radius: 10, y: 8)
                        .contentShape(.rect)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(Text("share.coda.preview.accessibilityLabel"))
                VStack(alignment: .leading, spacing: 16) {
                    Text("share.coda.line")
                        .font(Typography.hookL).lineHeight(1.45, literata: 19).foregroundStyle(Palette.ink)
                        .fixedSize(horizontal: false, vertical: true)
                    Button(action: onShare) {
                        HStack(spacing: 9) {
                            Icon("share", size: 20)
                            Text("share.coda.button")
                        }
                    }
                    .buttonStyle(CodaButtonStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.top, 28)
        .frame(maxWidth: .infinity, alignment: .leading)  // hairline spans the column
        .hairlineTop()
        .padding(.top, 44)
        .gutter()
    }
}

/// The solid umber 52 pt button, sized to its label (16 pt sides) instead of the full width.
private struct CodaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.button)
            .tracking(-0.2)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .foregroundStyle(Palette.onTint)
            .padding(.horizontal, 16)
            .frame(minHeight: 52)
            .background(Palette.tint, in: .capsule)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .contentShape(.capsule)
    }
}
