import Photos
import SwiftUI

/// Premium: the painting as a phone wallpaper. A screen-shaped window over the painting that the
/// reader drags to choose the crop, then saves to Photos at up to the screen's pixel size (from the
/// `full` rendition, never upscaled). Always dark, like the artwork viewer it opens from.
struct WallpaperSheet: View {
    let painting: Painting
    /// The `full` rendition if the viewer already has it; otherwise loaded here.
    var preloaded: UIImage?

    @Environment(\.dismiss) private var dismiss
    @State private var image: UIImage?
    /// Crop position: 0…1 along each axis the painting overflows the frame.
    @State private var focus = CGPoint(x: 0.5, y: 0.5)
    @State private var dragStart: CGPoint?
    @State private var state: SaveState = .idle

    enum SaveState: Equatable { case idle, saving, saved, denied, failed }

    /// The device screen's aspect (portrait), so the wallpaper fills the Lock Screen.
    private var screenAspect: CGFloat {
        let size = UIScreen.main.nativeBounds.size
        return min(size.width, size.height) / max(size.width, size.height)
    }

    var body: some View {
        VStack(spacing: 22) {
            Text("wallpaper.title")
                .font(Typography.literata(22, .medium))
                .foregroundStyle(Palette.viewerInk)
                .padding(.top, 28)
            Text("wallpaper.hint")
                .font(Typography.body15)
                .foregroundStyle(Palette.viewerInk2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            GeometryReader { geo in
                let frame = previewSize(in: geo.size)
                preview(size: frame)
                    .frame(width: frame.width, height: frame.height)
                    .clipShape(RoundedRectangle(cornerRadius: frame.width * 0.12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: frame.width * 0.12, style: .continuous)
                        .strokeBorder(Palette.viewerInk.opacity(0.35), lineWidth: 1))
                    .gesture(drag(frame: frame))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .accessibilityLabel(Text("wallpaper.preview.accessibilityLabel"))
            }

            VStack(spacing: 12) {
                Button { Task { await save() } } label: {
                    ZStack {
                        Text(state == .saved ? "wallpaper.saved" : "wallpaper.save").opacity(state == .saving ? 0 : 1)
                        if state == .saving { ProgressView().tint(Palette.onTint) }
                    }
                }
                .buttonStyle(.dcPrimary)
                .disabled(image == nil || state == .saving || state == .saved)

                Group {
                    switch state {
                    case .saved: Text("wallpaper.saved.hint")
                    case .denied: Text("wallpaper.error.denied")
                    case .failed: Text("wallpaper.error.failed")
                    case .idle, .saving: Text(verbatim: " ")
                    }
                }
                .font(Typography.caption)
                .foregroundStyle(Palette.viewerInk2)
                .multilineTextAlignment(.center)
                .frame(minHeight: 34, alignment: .top)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        .overlay(alignment: .topTrailing) {
            GlassIconButton(icon: "close", iconSize: 18, tint: Palette.viewerInk, label: "common.close.accessibilityLabel") { dismiss() }
                .padding(.trailing, 16).padding(.top, 4)
        }
        .environment(\.colorScheme, .dark)
        .task {
            if let preloaded { image = preloaded; return }
            if let request = ImagePipeline.shared.request(for: painting.imageUrl, variant: .full, artwork: painting.artwork) {
                image = await ImagePipeline.shared.image(for: request)
            }
        }
    }

    // MARK: Preview

    private func previewSize(in available: CGSize) -> CGSize {
        let height = min(available.height, available.width * 0.62 / screenAspect)
        return CGSize(width: height * screenAspect, height: height)
    }

    @ViewBuilder private func preview(size: CGSize) -> some View {
        if let image {
            let fill = fillSize(of: image.size, in: size)
            Image(uiImage: image)
                .resizable()
                .frame(width: fill.width, height: fill.height)
                .offset(x: (0.5 - focus.x) * (fill.width - size.width),
                        y: (0.5 - focus.y) * (fill.height - size.height))
                .frame(width: size.width, height: size.height)
        } else {
            ZStack {
                Color(white: 0.12)
                ProgressView().tint(Palette.viewerInk2)
            }
        }
    }

    /// Aspect-fill size of an image in a frame.
    private func fillSize(of imageSize: CGSize, in frame: CGSize) -> CGSize {
        let scale = max(frame.width / imageSize.width, frame.height / imageSize.height)
        return CGSize(width: imageSize.width * scale, height: imageSize.height * scale)
    }

    private func drag(frame: CGSize) -> some Gesture {
        DragGesture()
            .onChanged { value in
                guard let image else { return }
                let start = dragStart ?? focus
                if dragStart == nil { dragStart = focus }
                let fill = fillSize(of: image.size, in: frame)
                let overflowX = fill.width - frame.width, overflowY = fill.height - frame.height
                focus = CGPoint(
                    x: overflowX > 0 ? min(1, max(0, start.x - value.translation.width / overflowX)) : 0.5,
                    y: overflowY > 0 ? min(1, max(0, start.y - value.translation.height / overflowY)) : 0.5
                )
                if state == .saved { state = .idle }
            }
            .onEnded { _ in dragStart = nil }
    }

    // MARK: Save

    /// The chosen crop at up to the screen's pixel size (never upscaled).
    static func render(_ image: UIImage, focus: CGPoint, aspect: CGFloat, maxSize: CGSize) -> UIImage? {
        guard let cg = image.cgImage else { return nil }
        let w = CGFloat(cg.width), h = CGFloat(cg.height)
        let crop: CGRect = w / h > aspect
            ? { let cw = h * aspect; return CGRect(x: (w - cw) * focus.x, y: 0, width: cw, height: h) }()
            : { let ch = w / aspect; return CGRect(x: 0, y: (h - ch) * focus.y, width: w, height: ch) }()
        guard let cropped = cg.cropping(to: crop.integral) else { return nil }
        let scale = min(1, maxSize.width / CGFloat(cropped.width), maxSize.height / CGFloat(cropped.height))
        let out = CGSize(width: (CGFloat(cropped.width) * scale).rounded(), height: (CGFloat(cropped.height) * scale).rounded())
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = true
        return UIGraphicsImageRenderer(size: out, format: format).image { _ in
            UIImage(cgImage: cropped).draw(in: CGRect(origin: .zero, size: out))
        }
    }

    private func save() async {
        guard let image else { return }
        state = .saving
        let native = UIScreen.main.nativeBounds.size
        let maxSize = CGSize(width: min(native.width, native.height), height: max(native.width, native.height))
        guard let wallpaper = Self.render(image, focus: focus, aspect: screenAspect, maxSize: maxSize) else {
            state = .failed
            return
        }
        let status = await Self.requestAddAccess()
        guard status == .authorized || status == .limited else {
            state = .denied
            return
        }
        do {
            try await Self.addToPhotos(wallpaper)
            state = .saved
        } catch {
            state = .failed
        }
    }

    // Photos calls these blocks on its own queues. Nonisolated, so they aren't inferred as main
    // actor code (the app's default isolation), which traps when run off the main thread.
    nonisolated private static func requestAddAccess() async -> PHAuthorizationStatus {
        await PHPhotoLibrary.requestAuthorization(for: .addOnly)
    }

    nonisolated private static func addToPhotos(_ image: UIImage) async throws {
        try await PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }
    }
}
