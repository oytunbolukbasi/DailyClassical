import SwiftUI

/// Solid buttons on paper (SPEC §3.5). Never glass.
struct DCButtonStyle: ButtonStyle {
    enum Kind { case primary, secondary }
    var kind: Kind = .primary
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.button)
            .tracking(-0.2)
            .foregroundStyle(kind == .primary ? Palette.onTint : Palette.ink)
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(kind == .primary ? AnyShapeStyle(Palette.tint) : AnyShapeStyle(Palette.ink.opacity(0.08)), in: .capsule)
            .opacity(configuration.isPressed ? 0.8 : (isEnabled ? 1 : 0.5))
            .contentShape(.capsule)
    }
}

/// 40 pt capsule ("Open in Spotify" in the recordings sheet, "Try again").
struct SmallCapsuleButtonStyle: ButtonStyle {
    var prominent = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.buttonS)
            .foregroundStyle(prominent ? Palette.onTint : Palette.ink)
            .padding(.horizontal, 16)
            .frame(minHeight: 40)
            .background(prominent ? AnyShapeStyle(Palette.tint) : AnyShapeStyle(Palette.ink.opacity(0.08)), in: .capsule)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .contentShape(.capsule)
    }
}

/// Accent text action ("Not now", "Forgot password?", "Restore purchases").
struct TextLinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.body15)
            .foregroundStyle(Palette.accent)
            .frame(minHeight: 44)
            .contentShape(.rect)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

extension ButtonStyle where Self == DCButtonStyle {
    static var dcPrimary: DCButtonStyle { DCButtonStyle(kind: .primary) }
    static var dcSecondary: DCButtonStyle { DCButtonStyle(kind: .secondary) }
}

extension ButtonStyle where Self == TextLinkButtonStyle {
    static var dcTextLink: TextLinkButtonStyle { TextLinkButtonStyle() }
}
