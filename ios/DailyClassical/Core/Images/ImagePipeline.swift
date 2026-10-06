import CryptoKit
import ImageIO
import SwiftUI
import UIKit

/// Which rendition of a painting or portrait to show (backend/scripts/optimize-images.ts):
/// `hero` (short side ≤ 1800 px, bundled) for full-width images, `thumb` (short ≤ 300 px, bundled)
/// for list thumbnails of 64 pt and smaller, `full` (long ≤ 4000 px, API only, disk-cached) for the
/// artwork viewer's zoom.
nonisolated enum ImageVariant: String, Sendable {
    case hero, thumb, full

    /// Longest side to decode at when the caller gives no display size.
    var defaultMaxPixel: CGFloat {
        switch self {
        case .hero: 2048
        case .thumb: 720
        case .full: 4000
        }
    }
}

/// `Resources/Artwork/manifest.json`, written by `npm run images` in backend/
/// (backend/scripts/optimize-images.ts). Keys are `paintings/<pieceId>` and `composers/<composerId>`.
nonisolated struct ArtworkManifest: Decodable, Sendable {
    struct File: Decodable, Sendable {
        let path: String
        let width: Int
        let height: Int
        let hash: String
    }

    struct Entry: Decodable, Sendable {
        /// The vetted original (Wikimedia Commons) URL the derivatives were made from.
        let source: String
        /// Average colour, "#rrggbb": the placeholder while the image loads.
        let color: String
        let hero: File
        let thumb: File
        /// Served by the API only (not in the bundle).
        let full: File?
        /// Required attribution per language ("en", "tr") for freely licensed (non-PD) images.
        let credit: [String: String]?
        let licenseUrl: String?

        func file(_ variant: ImageVariant) -> File? {
            switch variant {
            case .hero: hero
            case .thumb: thumb
            case .full: full
            }
        }
    }

    let images: [String: Entry]
}

/// The image fields a painting or portrait carries in API responses. When known they win over what
/// the bundled manifest says (content added after the app shipped is only described here).
nonisolated struct ArtworkSource: Hashable, Sendable {
    var hero: URL?
    var thumb: URL?
    var full: URL?
    var placeholderColor: String?
    var creditLine: String?

    func url(_ variant: ImageVariant) -> URL? {
        switch variant {
        case .hero: hero
        case .thumb: thumb
        case .full: full
        }
    }
}

extension Painting {
    nonisolated var artwork: ArtworkSource {
        ArtworkSource(hero: imageUrl, thumb: thumbUrl, full: fullUrl, placeholderColor: placeholderColor, creditLine: creditLine)
    }
}

extension Composer.Portrait {
    nonisolated var artwork: ArtworkSource {
        ArtworkSource(hero: imageUrl, thumb: thumbUrl, full: fullUrl, placeholderColor: placeholderColor, creditLine: creditLine)
    }
}

/// What to load for one (url, variant, display size): resolved once, used as the cache identity.
nonisolated struct ImageRequest: Hashable, Sendable {
    /// Memory-cache key (file + decode-size bucket); also identifies the request in `.task(id:)`.
    let key: String
    /// The file without the decode size: every decode of one file shares it.
    let fileKey: String
    /// Optimized copy shipped in the app bundle, used when it matches the requested version.
    let bundled: URL?
    /// Network URL for this variant (our API / CDN copy, or whatever URL the content carries).
    let remote: URL?
    /// The frame the image is drawn into, in pixels, rounded up to 256 px steps; nil = decode at
    /// `variant.defaultMaxPixel`.
    let target: CGSize?
    /// `.fill` (cover crop) or `.fit` into `target`.
    let fill: Bool
    let variant: ImageVariant
    /// Average colour (API field or manifest), if the image is known.
    let placeholderHex: String?

    /// `full` renditions are 40+ MB decoded: only the artwork viewer holds one, never the shared cache.
    var memoryCached: Bool { variant != .full }

    /// Longest side to decode a `width`×`height` px source at: what covers (or fits) `target`, never
    /// more than the source itself.
    func decodeLongSide(sourceWidth w: CGFloat, sourceHeight h: CGFloat) -> CGFloat {
        let long = max(w, h)
        guard let target, w > 0, h > 0 else { return min(long, variant.defaultMaxPixel) }
        let scale = fill ? max(target.width / w, target.height / h) : min(target.width / w, target.height / h)
        return min(long, (long * scale).rounded(.up))
    }

    /// Whether an already decoded `size` (pixels, same file) is at least as sharp as this request needs.
    func isSatisfied(by size: CGSize, isWholeSource: Bool) -> Bool {
        if isWholeSource { return true }
        guard let target, size.width > 0, size.height > 0 else { return false }
        let scale = fill ? max(target.width / size.width, target.height / size.height)
                         : min(target.width / size.width, target.height / size.height)
        return scale <= 1.01
    }
}

/// Painting and portrait loading: bundled file → memory (NSCache) → disk (Caches/images) → network.
/// Decoding happens off the main thread, at the size the view actually draws (ImageIO downsampling),
/// so a view only ever receives display-ready bitmaps no bigger than it needs.
nonisolated final class ImagePipeline: @unchecked Sendable {
    static let shared = ImagePipeline()

    /// Decode sizes are rounded up to this step, so nearby frames share one cache entry.
    static let sizeStep: CGFloat = 256

    private let manifest: ArtworkManifest
    private let bySource: [String: String]
    private let artworkRoot: URL?
    private let memory = NSCache<NSString, Decoded>()
    private let lock = NSLock()
    private var inFlight: [String: Task<UIImage?, Never>] = [:]
    /// fileKey → memory-cache keys of its decodes (entries may since have been evicted).
    private var decodes: [String: Set<String>] = [:]
    /// API image fields by hero URL (`register`), preferred over the manifest.
    private var sources: [String: ArtworkSource] = [:]
    private let session: URLSession
    private let diskDirectory: URL
    private let decodeQueue = DispatchQueue(label: "co.dailyclassical.ImagePipeline.decode", qos: .userInitiated)

    /// A decoded bitmap and whether it is the whole source (nothing sharper exists in that file).
    private nonisolated final class Decoded {
        let image: UIImage
        let isWholeSource: Bool
        init(_ image: UIImage, isWholeSource: Bool) { self.image = image; self.isWholeSource = isWholeSource }
        var pixelSize: CGSize { CGSize(width: image.size.width * image.scale, height: image.size.height * image.scale) }
    }

    init(bundle: Bundle = .main) {
        artworkRoot = bundle.resourceURL?.appending(path: "Artwork", directoryHint: .isDirectory)
        manifest = artworkRoot
            .flatMap { try? Data(contentsOf: $0.appending(path: "manifest.json")) }
            .flatMap { try? JSONDecoder().decode(ArtworkManifest.self, from: $0) }
            ?? ArtworkManifest(images: [:])
        bySource = Dictionary(manifest.images.map { ($0.value.source, $0.key) }, uniquingKeysWith: { a, _ in a })
        memory.totalCostLimit = 160 * 1024 * 1024
        let config = URLSessionConfiguration.default
        config.urlCache = nil  // the disk cache below holds the bytes
        config.timeoutIntervalForRequest = 30
        session = URLSession(configuration: config)
        diskDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appending(path: "images", directoryHint: .isDirectory)
        try? FileManager.default.createDirectory(at: diskDirectory, withIntermediateDirectories: true)
    }

    // MARK: API image fields

    /// Remembers the API's image fields (thumbUrl, fullUrl, placeholderColor, creditLine) for each
    /// painting/portrait, keyed by its hero URL, so views that only pass `imageUrl` still get them.
    func register(_ artworks: [ArtworkSource?]) {
        lock.withLock {
            for case let a? in artworks {
                if let hero = a.hero { sources[hero.absoluteString] = a }
            }
        }
    }

    private func source(for url: URL) -> ArtworkSource? {
        lock.withLock { sources[url.absoluteString] }
    }

    // MARK: Resolving

    /// Our image URLs look like `…/images/<kind>/<id>-<variant>.heic?v=<hash>` (`.jpg` before HEIC).
    nonisolated(unsafe) private static let ownPath = /\/(paintings|composers)\/([^\/]+)-(hero|thumb|full)\.(heic|jpg)$/

    /// - Parameters:
    ///   - url: the image's hero URL (`imageUrl` from the API), or any URL the content carries.
    ///   - size: the frame it is drawn into, in points (nil: decode at `variant.defaultMaxPixel`).
    ///   - scale: the screen's `displayScale`.
    ///   - contentMode: `.fill` (cover crop) or `.fit`.
    ///   - artwork: the model's image fields, when the caller has them (else those `register`ed).
    func request(for url: URL?, variant: ImageVariant, size: CGSize? = nil, scale: CGFloat = 1,
                 contentMode: ContentMode = .fill, artwork: ArtworkSource? = nil) -> ImageRequest? {
        guard let url else { return nil }
        let model = artwork ?? source(for: url)
        let match = url.path(percentEncoded: false).firstMatch(of: Self.ownPath)

        var entryKey: String?
        if let match {
            entryKey = "\(match.1)/\(match.2)"
        } else {
            var bare = URLComponents(url: url, resolvingAgainstBaseURL: false)
            bare?.query = nil
            entryKey = bare?.url.flatMap { bySource[$0.absoluteString] }
        }
        let entry = entryKey.flatMap { manifest.images[$0] }
        let file = entry?.file(variant)

        var remote: URL? = model?.url(variant)
        var version = remote.flatMap(Self.version(of:))
        if remote == nil {
            if let match, var parts = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                // Our own copy: the manifest's current file, or else the sibling file next to the given one.
                let prefix = String(parts.path.dropLast("/\(match.1)/\(match.2)-\(match.3).\(match.4)".count))
                let urlVersion = Self.version(of: url)
                let current = urlVersion == nil || match.4 == "jpg" || urlVersion == entry?.file(ImageVariant(rawValue: String(match.3)) ?? .hero)?.hash
                if let file, current {
                    parts.path = "\(prefix)/\(file.path)"
                    parts.queryItems = [URLQueryItem(name: "v", value: file.hash)]
                    version = file.hash
                } else {
                    parts.path = "\(prefix)/\(match.1)/\(match.2)-\(variant.rawValue).heic"
                    version = urlVersion
                }
                remote = parts.url
            } else {
                remote = url  // e.g. a Commons original: one file for every variant
            }
        }

        var bundled: URL?
        if let entry, let file, variant != .full, let artworkRoot {
            // A newer server copy (different ?v=) wins over the bundled one; Commons/no-version URLs use the bundle.
            let current = version == nil || version == file.hash || version == entry.hero.hash
                || remote?.pathExtension == "jpg"  // pre-HEIC URLs (old cached responses): the bundle is newer
            if current { bundled = artworkRoot.appending(path: file.path) }
        }

        let identity = remote?.absoluteString ?? bundled?.path() ?? url.absoluteString
        let fileKey = "\(variant.rawValue)|\(identity)"
        var target: CGSize?
        if let size, size.width > 0, size.height > 0 {
            let step = Self.sizeStep
            target = CGSize(width: (size.width * scale / step).rounded(.up) * step,
                            height: (size.height * scale / step).rounded(.up) * step)
        }
        let fill = contentMode == .fill
        let sizeKey = target.map { "\(Int($0.width))x\(Int($0.height))\(fill ? "c" : "f")" } ?? "default"
        return ImageRequest(key: "\(fileKey)|\(sizeKey)", fileKey: fileKey, bundled: bundled, remote: remote,
                            target: target, fill: fill, variant: variant,
                            placeholderHex: model?.placeholderColor ?? entry?.color)
    }

    private static func version(of url: URL) -> String? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first { $0.name == "v" }?.value
    }

    /// The average colour (API field, else manifest) for a painting/portrait URL, if known.
    func placeholderColor(for url: URL?) -> Color? {
        request(for: url, variant: .thumb)?.placeholderHex.flatMap(Self.color(hex:))
    }

    /// "#rrggbb" (sRGB).
    private static func color(hex: String) -> Color? {
        let digits = hex.hasPrefix("#") ? hex.dropFirst() : Substring(hex)
        guard digits.count == 6, let value = UInt32(digits, radix: 16) else { return nil }
        return Color(.sRGB, red: Double((value >> 16) & 0xFF) / 255, green: Double((value >> 8) & 0xFF) / 255,
                     blue: Double(value & 0xFF) / 255, opacity: 1)
    }

    /// The attribution a freely licensed image requires: the API's `creditLine` (already in the content
    /// language) when registered, else the manifest `credit` (from the yaml `credit_line`) in `language`
    /// with English fallback; nil for public-domain images.
    func credit(for url: URL?, language: String) -> String? {
        guard let url else { return nil }
        if let model = source(for: url) { return model.creditLine }
        guard let entry = entry(for: url) else { return nil }
        return entry.credit?[language] ?? entry.credit?["en"]
    }

    private func entry(for url: URL) -> ArtworkManifest.Entry? {
        if let match = url.path(percentEncoded: false).firstMatch(of: Self.ownPath) {
            return manifest.images["\(match.1)/\(match.2)"]
        }
        var bare = URLComponents(url: url, resolvingAgainstBaseURL: false)
        bare?.query = nil
        return bare?.url.flatMap { bySource[$0.absoluteString] }.flatMap { manifest.images[$0] }
    }

    // MARK: Loading

    /// Synchronous memory-cache hit, for drawing a cached image in the very first frame: this exact
    /// decode, or any decode of the same file that is at least as sharp as the request needs.
    func cachedImage(for request: ImageRequest) -> UIImage? {
        if let hit = memory.object(forKey: request.key as NSString) { return hit.image }
        return otherDecodes(of: request).first { request.isSatisfied(by: $0.pixelSize, isWholeSource: $0.isWholeSource) }?.image
    }

    /// Any decode of the same file (possibly softer than needed): a stand-in while the right size decodes.
    func interimImage(for request: ImageRequest) -> UIImage? {
        otherDecodes(of: request).max { $0.pixelSize.width < $1.pixelSize.width }?.image
    }

    private func otherDecodes(of request: ImageRequest) -> [Decoded] {
        lock.withLock {
            guard let keys = decodes[request.fileKey] else { return [] }
            var found: [Decoded] = []
            for key in keys {
                if let d = memory.object(forKey: key as NSString) { found.append(d) } else { decodes[request.fileKey]?.remove(key) }
            }
            return found
        }
    }

    func image(for request: ImageRequest) async -> UIImage? {
        if let hit = cachedImage(for: request) { return hit }
        let task: Task<UIImage?, Never> = lock.withLock {
            if let running = inFlight[request.key] { return running }
            let task = Task.detached(priority: .userInitiated) { [self] in await load(request) }
            inFlight[request.key] = task
            return task
        }
        let image = await task.value
        lock.withLock { inFlight[request.key] = nil }
        return image
    }

    /// Warms memory (and disk) for images about to appear, e.g. today's hero at launch, decoded for a
    /// frame of `size` points (nil: the variant's default size).
    func prefetch(_ urls: [URL?], variant: ImageVariant = .hero, size: CGSize? = nil, scale: CGFloat = 1,
                  contentMode: ContentMode = .fill) {
        let requests = urls.compactMap { request(for: $0, variant: variant, size: size, scale: scale, contentMode: contentMode) }
        for request in requests where cachedImage(for: request) == nil {
            Task.detached(priority: .utility) { [self] in _ = await image(for: request) }
        }
    }

    private func load(_ request: ImageRequest) async -> UIImage? {
        if let bundled = request.bundled,
           let image = await decodeSerially(request, { CGImageSourceCreateWithURL(bundled as CFURL, nil) }) {
            return image
        }
        guard let remote = request.remote else { return nil }
        if remote.isFileURL {
            return await decodeSerially(request) { CGImageSourceCreateWithURL(remote as CFURL, nil) }
        }
        let file = diskFile(for: remote)
        if FileManager.default.fileExists(atPath: file.path()),
           let image = await decodeSerially(request, { CGImageSourceCreateWithURL(file as CFURL, nil) }) {
            return image
        }
        guard let (data, response) = try? await session.data(from: remote),
              (response as? HTTPURLResponse).map({ (200..<300).contains($0.statusCode) }) ?? true,
              let image = await decodeSerially(request, { CGImageSourceCreateWithData(data as CFData, nil) })
        else { return nil }
        try? data.write(to: file, options: .atomic)
        return image
    }

    /// One decode at a time, off the cooperative thread pool: HEIC goes through VideoToolbox's HEVC
    /// decoder, which stalls (the simulator's software decoder deadlocks) when a list fires many
    /// decodes at once. Queued requests that an earlier decode already satisfies (e.g. the launch
    /// prefetch vs Today's first layout pass) are answered from memory instead of decoding again.
    private func decodeSerially(_ request: ImageRequest, _ source: @escaping @Sendable () -> CGImageSource?) async -> UIImage? {
        await withCheckedContinuation { continuation in
            decodeQueue.async { [self] in
                if request.memoryCached, let hit = cachedImage(for: request) {
                    continuation.resume(returning: hit)
                    return
                }
                let decoded = Self.decode(source(), for: request)
                if let decoded, request.memoryCached {
                    let size = decoded.pixelSize
                    memory.setObject(decoded, forKey: request.key as NSString, cost: Int(size.width * size.height * 4))
                    lock.withLock { decodes[request.fileKey, default: []].insert(request.key) }
                }
                continuation.resume(returning: decoded?.image)
            }
        }
    }

    private func diskFile(for url: URL) -> URL {
        let digest = SHA256.hash(data: Data(url.absoluteString.utf8)).map { String(format: "%02x", $0) }.joined()
        return diskDirectory.appending(path: digest.prefix(32) + ".img")
    }

    /// Decodes at `request.decodeLongSide` (kCGImageSourceThumbnailMaxPixelSize): an ImageIO downsample
    /// when that is smaller than the file, else a full decode + `preparingForDisplay()`. Never inflates
    /// more pixels than the frame shows (nor a 24 MP original).
    private static func decode(_ source: CGImageSource?, for request: ImageRequest) -> Decoded? {
        guard let source, CGImageSourceGetCount(source) > 0 else { return nil }
        let props = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any]
        var width = props?[kCGImagePropertyPixelWidth] as? CGFloat ?? 0
        var height = props?[kCGImagePropertyPixelHeight] as? CGFloat ?? 0
        let orientation = props?[kCGImagePropertyOrientation] as? UInt32 ?? 1
        if (5...8).contains(orientation) { swap(&width, &height) }  // 90° EXIF rotations
        let long = request.decodeLongSide(sourceWidth: width, sourceHeight: height)
        if long >= max(width, height), orientation == 1, let cg = CGImageSourceCreateImageAtIndex(source, 0, nil) {
            let image = UIImage(cgImage: cg)
            return Decoded(image.preparingForDisplay() ?? image, isWholeSource: true)
        }
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: long,
        ]
        return CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary)
            .map { Decoded(UIImage(cgImage: $0), isWholeSource: long >= max(width, height)) }
    }
}

/// An image from `ImagePipeline`: drawn in the first frame when it is already in memory, otherwise
/// faded in over `placeholder` once decoded. Pass the frame `size` (points) and `scale` so it is
/// decoded at the size it is drawn; when the size changes, the previous decode stays up (no flash)
/// until the new one is ready.
struct CachedImage<Content: View, Placeholder: View>: View {
    private let request: ImageRequest?
    private let content: (UIImage) -> Content
    private let placeholder: () -> Placeholder
    @State private var loaded: (key: String, fileKey: String, image: UIImage)?

    init(url: URL?, variant: ImageVariant = .hero, size: CGSize? = nil, scale: CGFloat = 1,
         contentMode: ContentMode = .fill, artwork: ArtworkSource? = nil,
         @ViewBuilder content: @escaping (UIImage) -> Content,
         @ViewBuilder placeholder: @escaping () -> Placeholder) {
        let request = ImagePipeline.shared.request(for: url, variant: variant, size: size, scale: scale,
                                                   contentMode: contentMode, artwork: artwork)
        self.request = request
        self.content = content
        self.placeholder = placeholder
        _loaded = State(initialValue: request.flatMap { r in
            if let hit = ImagePipeline.shared.cachedImage(for: r) { return (r.key, r.fileKey, hit) }
            return ImagePipeline.shared.interimImage(for: r).map { ("", r.fileKey, $0) }
        })
    }

    var body: some View {
        ZStack {
            if let loaded, loaded.fileKey == request?.fileKey {
                content(loaded.image).transition(.opacity)
            } else {
                placeholder()
            }
        }
        .task(id: request?.key) {
            guard let request, loaded?.key != request.key else { return }
            if let image = await ImagePipeline.shared.image(for: request), !Task.isCancelled {
                if loaded?.fileKey == request.fileKey {
                    loaded = (request.key, request.fileKey, image)  // a sharper/other size of what is shown: swap in place
                } else {
                    withAnimation(.easeOut(duration: 0.25)) { loaded = (request.key, request.fileKey, image) }
                }
            }
        }
    }
}

