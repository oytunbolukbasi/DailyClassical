// Image derivative tool for scripts/optimize-images.ts (macOS only: ImageIO + CoreGraphics).
//
//   image-tool <input> <out.jpg>:<short>:<long>:<quality> [<out2.jpg>:<short>:<long>:<quality> …]
//
// For each spec, scales the input so its short side is at most <short> px and its long side at most
// <long> px (never upscaling), converts to sRGB, and writes a metadata-free baseline JPEG at
// <quality> (0–1). Prints one JSON line: {"width","height","color","outputs":[{"width","height","bytes"}]}
// where width/height are the original's pixel size and color is the image's average colour (#rrggbb).
import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers

func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data("image-tool: \(message)\n".utf8))
    exit(1)
}

let args = CommandLine.arguments.dropFirst()
guard let input = args.first, args.count >= 2 else { fail("usage: image-tool <input> <out>:<short>:<long>:<quality>…") }

guard let source = CGImageSourceCreateWithURL(URL(fileURLWithPath: input) as CFURL, nil),
      let original = CGImageSourceCreateImageAtIndex(source, 0, [kCGImageSourceShouldCacheImmediately: true] as CFDictionary)
else { fail("cannot decode \(input)") }

// EXIF orientation: Commons scans are upright, but honour it anyway by letting ImageIO apply the transform.
let props = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any]
let orientation = (props?[kCGImagePropertyOrientation] as? UInt32) ?? 1
let upright: CGImage = {
    guard orientation != 1 else { return original }
    let opts: [CFString: Any] = [
        kCGImageSourceCreateThumbnailFromImageAlways: true,
        kCGImageSourceCreateThumbnailWithTransform: true,
        kCGImageSourceThumbnailMaxPixelSize: max(original.width, original.height),
    ]
    return CGImageSourceCreateThumbnailAtIndex(source, 0, opts as CFDictionary) ?? original
}()

let srgb = CGColorSpace(name: CGColorSpace.sRGB)!

func render(_ image: CGImage, width: Int, height: Int) -> CGImage {
    guard let ctx = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: srgb,
                              bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
    else { fail("cannot create context") }
    ctx.interpolationQuality = .high
    ctx.draw(image, in: CGRect(x: 0, y: 0, width: width, height: height))
    guard let out = ctx.makeImage() else { fail("cannot render") }
    return out
}

struct Output: Encodable { let width: Int; let height: Int; let bytes: Int }
struct Result: Encodable { let width: Int; let height: Int; let color: String; let outputs: [Output] }

let w = Double(upright.width), h = Double(upright.height)
var outputs: [Output] = []
var smallest: CGImage = upright

for spec in args.dropFirst() {
    let parts = spec.split(separator: ":").map(String.init)
    guard parts.count == 4, let short = Double(parts[1]), let long = Double(parts[2]), let quality = Double(parts[3])
    else { fail("bad spec \(spec)") }
    let scale = min(1, short / min(w, h), long / max(w, h))
    let tw = max(1, Int((w * scale).rounded())), th = max(1, Int((h * scale).rounded()))
    let scaled = render(upright, width: tw, height: th)
    if tw * th < smallest.width * smallest.height { smallest = scaled }

    let url = URL(fileURLWithPath: parts[0])
    guard let dest = CGImageDestinationCreateWithURL(url as CFURL, UTType.jpeg.identifier as CFString, 1, nil)
    else { fail("cannot write \(parts[0])") }
    // Only the compression option: no EXIF/IPTC/XMP/GPS is carried over from the original.
    CGImageDestinationAddImage(dest, scaled, [kCGImageDestinationLossyCompressionQuality: quality] as CFDictionary)
    guard CGImageDestinationFinalize(dest) else { fail("cannot finalize \(parts[0])") }
    let bytes = (try? FileManager.default.attributesOfItem(atPath: parts[0])[.size] as? Int) ?? 0
    outputs.append(Output(width: tw, height: th, bytes: bytes))
}

// Average colour: let CoreGraphics box-filter the smallest rendition down to one pixel.
var pixel = [UInt8](repeating: 0, count: 4)
pixel.withUnsafeMutableBytes { buf in
    let ctx = CGContext(data: buf.baseAddress, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: srgb,
                        bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
    ctx.interpolationQuality = .medium
    ctx.draw(smallest, in: CGRect(x: 0, y: 0, width: 1, height: 1))
}
let color = String(format: "#%02x%02x%02x", pixel[0], pixel[1], pixel[2])

let json = try JSONEncoder().encode(Result(width: upright.width, height: upright.height, color: color, outputs: outputs))
print(String(decoding: json, as: UTF8.self))
