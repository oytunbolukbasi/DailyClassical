import CoreImage
import Foundation
import ImageIO
import UniformTypeIdentifiers

// Colour transfer: match per-channel mean and spread of `target` to `reference` (Reinhard-style
// in linear RGB), so a sharp gallery photo takes on the reference reproduction's colour balance.
let args = CommandLine.arguments
let ref = CIImage(contentsOf: URL(fileURLWithPath: args[1]))!
let tgt = CIImage(contentsOf: URL(fileURLWithPath: args[2]))!
let out = URL(fileURLWithPath: args[3])
let ctx = CIContext(options: [.workingColorSpace: CGColorSpace(name: CGColorSpace.linearSRGB)!])

func stats(_ img: CIImage) -> (mean: [Double], std: [Double]) {
    func avg(_ i: CIImage) -> [Double] {
        let f = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: i, kCIInputExtentKey: CIVector(cgRect: img.extent)])!
        var px = [Float](repeating: 0, count: 4)
        ctx.render(f.outputImage!, toBitmap: &px, rowBytes: 16, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBAf, colorSpace: CGColorSpace(name: CGColorSpace.linearSRGB)!)
        return px.prefix(3).map(Double.init)
    }
    let m = avg(img)
    let sq = CIFilter(name: "CIMultiplyCompositing", parameters: [kCIInputImageKey: img, kCIInputBackgroundImageKey: img])!.outputImage!
    let m2 = avg(sq)
    return (m, zip(m, m2).map { sqrt(max($1 - $0 * $0, 1e-6)) })
}
let r = stats(ref), t = stats(tgt)
let gain = (0..<3).map { r.std[$0] / t.std[$0] }
let bias = (0..<3).map { r.mean[$0] - gain[$0] * t.mean[$0] }
print("ref mean", r.mean.map { String(format: "%.3f", $0) }, "tgt mean", t.mean.map { String(format: "%.3f", $0) })
print("gain", gain.map { String(format: "%.3f", $0) }, "bias", bias.map { String(format: "%.3f", $0) })
let matrix = CIFilter(name: "CIColorMatrix", parameters: [
    kCIInputImageKey: tgt,
    "inputRVector": CIVector(x: gain[0], y: 0, z: 0, w: 0),
    "inputGVector": CIVector(x: 0, y: gain[1], z: 0, w: 0),
    "inputBVector": CIVector(x: 0, y: 0, z: gain[2], w: 0),
    "inputBiasVector": CIVector(x: bias[0], y: bias[1], z: bias[2], w: 0),
])!.outputImage!.cropped(to: tgt.extent)
try ctx.writeJPEGRepresentation(of: matrix, to: out, colorSpace: CGColorSpace(name: CGColorSpace.sRGB)!,
                                options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 0.95])
print("wrote", out.lastPathComponent)
