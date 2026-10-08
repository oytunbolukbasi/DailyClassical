import SwiftUI

/// "Keep the pieces you love" (flow 07 frame 2): content-height glass sheet shown when a guest taps
/// the heart, or the guest Account row in Settings.
struct SignInPromptSheet: View {
    @Environment(AppRouter.self) private var router
    @Environment(SessionStore.self) private var session
    @Environment(\.dismiss) private var dismiss
    @State private var appleError: LocalizedStringKey?
    /// Set when handing over to the auth sheet so the pending favourite survives.
    @State private var handingOver = false
    /// The sheet hugs its content, as drawn (≈330 pt), rather than sitting at half height.
    @State private var contentHeight: CGFloat = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("favourites.prompt.title")
                        .font(Typography.titleL)
                        .tracking(-0.28)
                        .lineHeight(1.15, literata: 28)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("favourites.prompt.body")
                        .font(Typography.body15)
                        .lineHeight(1.5)
                        .foregroundStyle(Palette.ink2)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 30)

                VStack(spacing: 12) {
                    // One tap: signs up or in and saves the heart that brought the guest here.
                    AppleSignInButton(onSignedIn: finishWithApple) { appleError = $0 }
                    if let appleError { FormMessage(text: Text(appleError), isError: true) }
                    Button { handOver(.createAccount) } label: { Text("favourites.prompt.createAccount") }
                        .buttonStyle(.dcPrimary)
                    Button { handOver(.signIn) } label: { Text("favourites.prompt.signIn") }
                        .buttonStyle(.dcSecondary)
                    Button("favourites.prompt.notNow") { dismiss() }
                        .buttonStyle(.dcTextLink)
                        .padding(.vertical, -13)  // keep the 44 pt hit target out of the 12 pt rhythm
                }
                .padding(.top, 6)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 4)  // + the sheet's bottom inset ≈ the drawn 44 pt
            .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { contentHeight = $0 }
        }
        .scrollBounceBehavior(.basedOnSize)
        .presentationDetents([contentHeight > 0 ? .height(contentHeight) : .medium])
        .presentationDragIndicator(.visible)
        .onDisappear {
            // Dismissed without signing in: forget the heart tap.
            if !handingOver { router.pendingFavourite = nil }
        }
    }

    private func finishWithApple() async {
        if let pending = router.pendingFavourite {
            router.pendingFavourite = nil
            await session.setFavourite(pending, true)
            router.toast = "favourites.toast.saved"
        }
        dismiss()
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
