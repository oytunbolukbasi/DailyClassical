import SwiftUI

/// 44 pt circular neutral-glass button (back, heart, expand, glossary, close over imagery).
struct GlassIconButton: View {
    let icon: String
    var iconSize: CGFloat = 22
    var tint: Color = Palette.glassInk
    let label: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Icon(icon, size: iconSize)
                .foregroundStyle(tint)
                .frame(width: 44, height: 44)
                .contentShape(.circle)
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive(), in: .circle)
        .accessibilityLabel(Text(label))
    }
}

/// The single primary action on a screen: clear glass, 54 pt pill, 32 pt side padding.
/// Elevation (not tint) says "primary"; the system supplies the specular highlight and the
/// Reduce Transparency fallback.
struct PrimaryGlassButton: View {
    let title: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Typography.button)
                .tracking(-0.2)
                .foregroundStyle(Palette.glassInk)
                .padding(.horizontal, 32)
                .frame(minHeight: 54)
                .contentShape(.capsule)
        }
        .buttonStyle(.plain)
        // Frosted glass with a neutral page-colour fill: the label must stay legible over any
        // painting (dark skies included). Neutral, never the accent: elevation says "primary".
        .glassEffect(.regular.tint(Palette.primaryGlassTint).interactive(), in: .capsule)
        .shadow(color: .black.opacity(0.08), radius: 1.5, y: 1)
        .shadow(color: .black.opacity(0.10), radius: 10, y: 8)
    }
}

/// Neutral-glass capsule with segments (Library All/Favourites, movement switcher).
struct GlassSegmented<Value: Hashable>: View {
    struct Segment: Identifiable {
        let value: Value
        let label: Text
        let accessibilityLabel: Text?
        var id: Value { value }
    }

    let segments: [Segment]
    @Binding var selection: Value
    var height: CGFloat = 40
    var segmentWidth: CGFloat? = nil
    var font: Font = Typography.chip
    var selectedFont: Font = Typography.chip.weight(.semibold)

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments) { segment in
                let isSelected = segment.value == selection
                Button { selection = segment.value } label: {
                    segment.label
                        .font(isSelected ? selectedFont : font)
                        .foregroundStyle(isSelected ? Palette.background : Palette.glassInk)
                        .padding(.horizontal, segmentWidth == nil ? 16 : 0)
                        .frame(width: segmentWidth)
                        .frame(maxHeight: .infinity)
                        .background { if isSelected { Capsule().fill(Palette.glassInk) } }
                        .opacity(isSelected ? 1 : 0.75)
                        .contentShape(.capsule)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(segment.accessibilityLabel ?? segment.label)
                .accessibilityAddTraits(isSelected ? .isSelected : [])
            }
        }
        .padding(4)
        .frame(height: height)
        .glassEffect(.regular, in: .capsule)
    }
}

/// 36 pt glass chip used for Library filters.
struct GlassChip: View {
    let title: Text
    var leadingIcon: String? = nil
    var showsDisclosure = false

    var body: some View {
        HStack(spacing: 6) {
            if let leadingIcon { Icon(leadingIcon, size: 14) }
            title.font(Typography.chip)
            if showsDisclosure { Icon("chevron-down", size: 12) }
        }
        .foregroundStyle(Palette.glassInk)
        .padding(.horizontal, 14)
        .frame(height: 36)
        .glassEffect(.regular.interactive(), in: .capsule)
    }
}

/// Transient confirmation ("Saved to Favourites"): glass capsule under the nav row.
struct Toast: View {
    let message: LocalizedStringKey

    var body: some View {
        Text(message)
            .font(Typography.chip)
            .foregroundStyle(Palette.glassInk)
            .padding(.horizontal, 18)
            .frame(height: 40)
            .glassEffect(.regular, in: .capsule)
    }
}

extension View {
    /// Shows `message` as a toast for ~2 s and announces it to VoiceOver.
    func toast(_ message: Binding<LocalizedStringResource?>) -> some View {
        modifier(ToastModifier(message: message))
    }
}

private struct ToastModifier: ViewModifier {
    @Binding var message: LocalizedStringResource?
    @Environment(\.locale) private var locale

    func body(content: Content) -> some View {
        content.overlay(alignment: .top) {
            if let message {
                Toast(message: LocalizedStringKey(message.key))
                    .padding(.top, 58)
                    .transition(.opacity.combined(with: .offset(y: -8)))
                    .task(id: message.key) {
                        var resource = message
                        resource.locale = locale
                        AccessibilityNotification.Announcement(String(localized: resource)).post()
                        try? await Task.sleep(for: .seconds(2))
                        withAnimation(.easeOut(duration: 0.2)) { self.message = nil }
                    }
            }
        }
        .animation(.easeOut(duration: 0.2), value: message?.key)
    }
}
