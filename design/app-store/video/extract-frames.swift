// Writes frames of a simulator recording as JPEGs for reel.html:
//   swift extract-frames.swift <in.mp4> <out dir> <start seconds> <count> [fps=30] [width=720]
import AVFoundation
import AppKit

let a = CommandLine.arguments
let asset = AVURLAsset(url: URL(fileURLWithPath: a[1]))
let out = URL(fileURLWithPath: a[2])
let start = Double(a[3])!, count = Int(a[4])!
let fps = a.count > 5 ? Double(a[5])! : 30, width = a.count > 6 ? Double(a[6])! : 720
try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
let gen = AVAssetImageGenerator(asset: asset)
gen.appliesPreferredTrackTransform = true
gen.maximumSize = CGSize(width: width, height: width * 4)
gen.requestedTimeToleranceBefore = .zero
gen.requestedTimeToleranceAfter = .zero
let end = CMTimeGetSeconds(asset.duration) - 0.05
for i in 0..<count {
    let t = min(start + Double(i) / fps, end)
    guard let im = try? gen.copyCGImage(at: CMTime(seconds: t, preferredTimescale: 600), actualTime: nil) else { continue }
    let rep = NSBitmapImageRep(cgImage: im)
    let data = rep.representation(using: .jpeg, properties: [.compressionFactor: 0.88])!
    try! data.write(to: out.appendingPathComponent(String(format: "%04d.jpg", i)))
}
print("frames", count)
