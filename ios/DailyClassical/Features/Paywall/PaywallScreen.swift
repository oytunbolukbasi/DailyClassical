import StoreKit
import SwiftUI

/// "More of this." (SPEC §4.10): solid full-screen page; only the close button is glass.
/// Two StoreKit 2 products: lifetime (preselected, Best value) and monthly.
struct PaywallScreen: View {
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(\.dismiss) private var dismiss

    @State private var plan: EntitlementStore.Plan = .lifetime
    @State private var purchasing = false
    @State private var restoring = false
    @State private var message: LocalizedStringKey?
    @ScaledMetric(relativeTo: .subheadline) private var restoreSize: CGFloat = 14

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    PaywallPainting()
                        .frame(height: 280)

                    Text("paywall.painting.caption")
                        .font(Typography.caption)
                        .lineHeight(1.4)
                        .foregroundStyle(Palette.ink3)
                        .padding(.top, 10)
                        .padding(.horizontal, 24)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("paywall.title")
                            .font(Typography.titleL)
                            .lineHeight(1.15, literata: 28)
                            .tracking(-0.28)
                            .foregroundStyle(Palette.ink)
                            .accessibilityAddTraits(.isHeader)
                        Text("paywall.subtitle")
                            .font(Typography.body15)
                            .lineHeight(1.5)
                            .foregroundStyle(Palette.ink2)
                    }
                    .padding(.top, 22)
                    .padding(.horizontal, 24)

                    VStack(alignment: .leading, spacing: 10) {
                        BenefitLine("paywall.benefit.library")
                        BenefitLine("paywall.benefit.search")
                    }
                    .padding(.top, 18)
                    .padding(.horizontal, 24)

                    HStack(spacing: 10) {
                        PlanCard(name: "paywall.plan.lifetime.name", price: price(.lifetime), detail: "paywall.plan.lifetime.detail",
                                 isSelected: plan == .lifetime, showsBadge: true) { plan = .lifetime }
                        PlanCard(name: "paywall.plan.monthly.name", price: price(.monthly), detail: "paywall.plan.monthly.detail",
                                 isSelected: plan == .monthly, showsBadge: false) { plan = .monthly }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 22 + 10)   // + room for the badge that overhangs the card
                    .padding(.horizontal, 24)

                    Spacer(minLength: 28)

                    bottomBlock
                        .padding(.horizontal, 24)
                        .padding(.bottom, 5)  // + home-indicator inset ≈ the 40 pt bottom padding (SPEC §4.10)
                }
                .frame(minHeight: geo.size.height + geo.safeAreaInsets.top, alignment: .top)  // the scroll view runs under the status bar
            }
            .scrollBounceBehavior(.basedOnSize)
            .ignoresSafeArea(edges: .top)
        }
        .background(Palette.background)
        .overlay(alignment: .topTrailing) {
            GlassIconButton(icon: "close", iconSize: 18, label: "common.close.accessibilityLabel") { dismiss() }
                .padding(.top, 4)  // top 58 on the 844 pt frame = 4 below its status bar; lines up with nav-row buttons
                .padding(.trailing, 16)
        }
        .task { if entitlements.products.isEmpty { await entitlements.load() } }
        .onChange(of: entitlements.isPremium) { _, premium in
            if premium { dismiss() }
        }
    }

    private var bottomBlock: some View {
        VStack(spacing: 16) {
            if let message {
                FormMessage(text: Text(message), isError: false)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }

            Button {
                Task { await buy() }
            } label: {
                ZStack {
                    Text("paywall.cta \(price(plan))").opacity(purchasing ? 0 : 1)
                    if purchasing { ProgressView().tint(Palette.onTint) }
                }
            }
            .buttonStyle(.dcPrimary)
            .disabled(purchasing || restoring || entitlements.products[plan] == nil)

            Button {
                Task { await restore() }
            } label: {
                Text("paywall.restore").font(.system(size: restoreSize))
            }
            .buttonStyle(.dcTextLink)
            .padding(.vertical, -13)  // 44 pt hit target without the extra layout height
            .disabled(purchasing || restoring)

            HStack(spacing: 14) {
                Link(destination: AppLinks.terms) { Text("paywall.terms") }
                Link(destination: AppLinks.privacy) { Text("paywall.privacy") }
            }
            .font(Typography.caption)
            .foregroundStyle(Palette.ink3)
        }
    }

    /// StoreKit's localized price ("₺600"), or a dash until products load.
    private func price(_ plan: EntitlementStore.Plan) -> String {
        entitlements.products[plan]?.displayPrice ?? "—"
    }

    private func buy() async {
        message = nil
        purchasing = true
        defer { purchasing = false }
        do {
            if try await entitlements.purchase(plan) { dismiss() }
        } catch {
            message = "paywall.error.purchase"
        }
    }

    private func restore() async {
        message = nil
        restoring = true
        await entitlements.restore()
        restoring = false
        if entitlements.isPremium { dismiss() } else { message = "paywall.restore.none" }
    }
}

/// Caspar David Friedrich, Wanderer above the Sea of Fog (public domain), cropped at 50 % / 30 %.
private struct PaywallPainting: View {
    static let url = URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg?width=1200")
    private static let aspect: CGFloat = 0.785   // width / height of the original
    private static let focusY: CGFloat = 0.3

    var body: some View {
        GeometryReader { geo in
            let imageHeight = max(geo.size.height, geo.size.width / Self.aspect)
            StripePlaceholder()
                .overlay(alignment: .top) {
                    AsyncImage(url: Self.url, transaction: Transaction(animation: .easeOut(duration: 0.25))) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .frame(width: geo.size.width, height: imageHeight)
                                .offset(y: -(imageHeight - geo.size.height) * Self.focusY)
                        }
                    }
                }
                .clipped()
        }
        .accessibilityElement()
        .accessibilityLabel(Text("paywall.painting.accessibilityLabel"))
        .accessibilityAddTraits(.isImage)
    }
}

/// Accent checkmark + SF 15/1.4 ink (SPEC §3.14).
private struct BenefitLine: View {
    let key: LocalizedStringKey
    init(_ key: LocalizedStringKey) { self.key = key }

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Icon("checkmark", size: 18).foregroundStyle(Palette.accent).padding(.top, 1)
            Text(key)
                .font(Typography.body15)
                .lineHeight(1.4)
                .foregroundStyle(Palette.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
        .accessibilityElement(children: .combine)
    }
}

/// Solid plan card (SPEC §3.13): 2 pt accent ring when selected, optional "Best value" badge.
private struct PlanCard: View {
    let name: LocalizedStringKey
    let price: String
    let detail: LocalizedStringKey
    let isSelected: Bool
    let showsBadge: Bool
    let action: () -> Void

    private var shape: RoundedRectangle { RoundedRectangle(cornerRadius: Radius.card, style: .continuous) }

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(Typography.planName)
                    .foregroundStyle(Palette.ink)
                    .padding(.top, 4)
                Text(verbatim: price)
                    .font(Typography.price)
                    .foregroundStyle(Palette.ink)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                Text(detail)
                    .font(Typography.caption)
                    .foregroundStyle(Palette.ink2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(EdgeInsets(top: 14, leading: 14, bottom: 12, trailing: 14))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Palette.surface, in: shape)
            .overlay(shape.strokeBorder(isSelected ? Palette.accent : Palette.rule, lineWidth: isSelected ? 2 : 0.5))
            .overlay(alignment: .topLeading) {
                if showsBadge {
                    Text("paywall.plan.badge.bestValue")
                        .font(.system(size: 10, weight: .semibold))
                        .tracking(0.6)
                        .textCase(.uppercase)
                        .foregroundStyle(Palette.onTint)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 8)
                        .background(Palette.accent, in: .capsule)
                        .offset(x: 12, y: -10)
                }
            }
            .contentShape(shape)
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(isSelected ? [.isButton, .isSelected] : .isButton)
    }
}

#Preview {
    Color.gray.sheet(isPresented: .constant(true)) { PaywallScreen() }
        .environment(EntitlementStore())
}
