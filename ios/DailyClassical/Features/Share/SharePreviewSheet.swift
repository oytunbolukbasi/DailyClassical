import SwiftUI

/// Our own step before the system share sheet (design B3-Share-preview): the card as it will be
/// sent, a Story 9:16 | Post 4:5 choice (Post by default) and "Share", which renders the image and
/// opens the iOS share sheet with the image, a short text and the link.
struct SharePreviewSheet: View {
    let piece: Piece
    let subject: ShareSubject
    @Environment(\.dismiss) private var dismiss
    @State private var format: ShareFormat = .post
    @State private var painting: UIImage?
    @State private var paintingState = PaintingState.loading
    @State private var isSharing = false
    @State private var height: CGFloat = 600

    private enum PaintingState { case loading, loaded, failed }

    /// Height of the card preview (281 × 351 for a post, as on the canvas).
    private static let previewHeight: CGFloat = 351

    private var card: ShareCard { ShareCard(piece: piece, subject: subject) }

    var body: some View {
        VStack(spacing: 0) {
            Text(subject == .piece ? "share.preview.title.piece" : "share.preview.title.moment")
                .font(Typography.titleM).lineHeight(1.25, literata: 24).foregroundStyle(Palette.ink)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 40)  // clear of the close button
                .accessibilityAddTraits(.isHeader)
            ShareCardPreview(card: card, format: format, image: painting, hidesPainting: paintingState == .failed,
                             height: Self.previewHeight)
                .clipShape(.rect(cornerRadius: 10, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).strokeBorder(Palette.rule, lineWidth: 0.5))
                .shadow(color: Color(red: 0x1E / 255, green: 0x1B / 255, blue: 0x17 / 255).opacity(0.16), radius: 15, y: 12)
                .padding(.top, 18)
                .accessibilityElement()
                .accessibilityLabel(Text("share.preview.image.accessibilityLabel"))
                .animation(.easeOut(duration: 0.2), value: format)
            ShareFormatPicker(selection: $format).padding(.top, 20)
            Button(action: share) {
                HStack(spacing: 9) {
                    Icon("share", size: 20)
                    Text("share.preview.share")
                }
            }
            .buttonStyle(.dcPrimary)
            .disabled(paintingState == .loading || isSharing)
            .padding(.top, 20)
        }
        .padding(.horizontal, 24)
        .padding(.top, 30)
        .padding(.bottom, 16)
        .overlay(alignment: .topTrailing) { closeButton.padding(.top, 9).padding(.trailing, 9) }
        .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { height = $0 }
        .presentationDetents([.height(height)])
        .presentationDragIndicator(.visible)
        .presentationBackground(Palette.background)
        .task {
            #if DEBUG
            if let debugFormat = ShareDebug.format { format = debugFormat }
            #endif
            painting = await ShareCardRenderer.painting(for: card)
            paintingState = painting != nil || card.imageURL == nil ? .loaded : .failed
        }
    }

    /// 30 pt circle (`.closec` on the canvas) inside a 44 pt target.
    private var closeButton: some View {
        Button { dismiss() } label: {
            Icon("close", size: 18)
                .foregroundStyle(Palette.ink)
                .frame(width: 30, height: 30)
                .background(Palette.ink.opacity(0.08), in: .circle)
                .frame(width: 44, height: 44)
                .contentShape(.circle)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("common.close.accessibilityLabel"))
    }

    private func share() {
        let card = self.card
        guard let image = ShareCardRenderer.image(card: card, format: format, painting: painting,
                                                  hidesPainting: paintingState == .failed) else { return }
        isSharing = true
        ActivitySheet.present(image: image, text: piece.shareText(subject), title: piece.shareHeaderTitle,
                              url: piece.shareURL(subject)) { completed in
            isSharing = false
            if completed { dismiss() }
        }
    }
}

/// Story 9:16 | Post 4:5: a solid capsule on the sheet's paper (`.seg` with the ink 8 % fill).
struct ShareFormatPicker: View {
    @Binding var selection: ShareFormat

    var body: some View {
        HStack(spacing: 0) {
            segment(.story, Text("share.preview.format.story"))
            segment(.post, Text("share.preview.format.post"))
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(4)
        .background(Palette.ink.opacity(0.08), in: .capsule)
    }

    private func segment(_ value: ShareFormat, _ label: Text) -> some View {
        let isSelected = selection == value
        return Button { selection = value } label: {
            label
                .font(isSelected ? Typography.chip.weight(.semibold) : Typography.chip)
                .foregroundStyle(isSelected ? Palette.background : Palette.ink)
                .padding(.horizontal, 15)
                .padding(.vertical, 4)
                .frame(minHeight: 32)
                .frame(maxHeight: .infinity)
                .background { if isSelected { Capsule().fill(Palette.ink) } }
                .contentShape(.capsule)
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}
