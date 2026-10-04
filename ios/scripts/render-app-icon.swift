import AppKit
import CoreText

// Renders design/AppIcon-1024.svg: "d", Literata 500, size 800, centred at x=512, baseline y=780.
let args = CommandLine.arguments
let fontURL = URL(fileURLWithPath: args[1]), out = URL(fileURLWithPath: args[2])
let bg = args[3], fg = args[4]
func color(_ hex: String) -> CGColor {
    let v = UInt32(hex.dropFirst(), radix: 16)!
    return CGColor(srgbRed: CGFloat(v >> 16 & 0xFF) / 255, green: CGFloat(v >> 8 & 0xFF) / 255, blue: CGFloat(v & 0xFF) / 255, alpha: 1)
}
let desc = CTFontManagerCreateFontDescriptorsFromURL(fontURL as CFURL) as! [CTFontDescriptor]
let font = CTFontCreateWithFontDescriptor(desc[0], 800, nil)
let size = 1024
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8, bytesPerRow: 0,
                    space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
ctx.setFillColor(color(bg)); ctx.fill(CGRect(x: 0, y: 0, width: size, height: size))
let line = CTLineCreateWithAttributedString(NSAttributedString(string: "d", attributes: [
    NSAttributedString.Key(kCTFontAttributeName as String): font,
    NSAttributedString.Key(kCTForegroundColorAttributeName as String): color(fg)]))
let width = CTLineGetTypographicBounds(line, nil, nil, nil)
ctx.textPosition = CGPoint(x: 512 - width / 2, y: CGFloat(size) - 780) // CG origin is bottom-left
CTLineDraw(line, ctx)
let rep = NSBitmapImageRep(cgImage: ctx.makeImage()!)
try! rep.representation(using: .png, properties: [:])!.write(to: out)
print("wrote \(out.lastPathComponent) (\(desc.count) face, advance \(Int(width)))")
