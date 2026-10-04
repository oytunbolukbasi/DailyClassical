import SwiftUI

/// "Keep the pieces you love" (flow 07 frame 2): medium glass sheet shown when a guest taps
/// the heart, or the guest Account row in Settings.
struct SignInPromptSheet: View {
    @Environment(AppRouter.self) private var router
    @Environment(\.dismiss) private var dismiss
    /// Set when handing over to the auth sheet so the pending favourite survives.
    @State private var handingOver = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("favourites.prompt.title")
                        .font(Typography.titleL)
                        .tracking(-0.28)
                        .lineHeight(1.15, size: 28)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("favourites.prompt.body")
                        .font(Typography.body15)
                        .lineHeight(1.5, size: 15)
                        .foregroundStyle(Palette.ink2)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 30)

                VStack(spacing: 12) {
                    Button { handOver(.createAccount) } label: { Text("favourites.prompt.createAccount") }
                        .buttonStyle(.dcPrimary)
                    Button { handOver(.signIn) } label: { Text("favourites.prompt.signIn") }
                        .buttonStyle(.dcSecondary)
                    Button("favourites.prompt.notNow") { dismiss() }
                        .buttonStyle(.dcTextLink)
                }
                .padding(.top, 6)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 12)
        }
        .scrollBounceBehavior(.basedOnSize)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .onDisappear {
            // Dismissed without signing in: forget the heart tap.
            if !handingOver { router.pendingFavourite = nil }
        }
    }

    private func handOver(_ flow: AppRouter.AuthFlow) {
        handingOver = true
        router.present(.auth(flow))
    }
}

#Preview {
    Color.gray.sheet(isPresented: .constant(true)) { SignInPromptSheet() }
        .environment(AppRouter())
}
