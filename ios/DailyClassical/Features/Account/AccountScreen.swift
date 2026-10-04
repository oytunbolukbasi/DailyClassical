import SwiftUI

/// Settings › Account (SPEC §4.21–4.22): email, change password, sign out, delete account.
struct AccountScreen: View {
    @Environment(SessionStore.self) private var session
    @Environment(\.dismiss) private var dismiss

    @State private var confirmDelete = false
    @State private var deleting = false
    @State private var deleteError: LocalizedStringKey?

    var body: some View {
        List {
            Section {
                ListLargeTitle(title: Text("account.title"), subtitle: session.email.map { Text(verbatim: $0) })
            }
            .listLargeTitleRow()

            Section {
                // Changing the address is not supported by the API yet, so the row is informational.
                SettingsValueRow("account.email", value: session.email.map { Text(verbatim: $0) })
                    .lineLimit(1)
                    .settingsRow()
                NavigationLink { ChangePasswordScreen() } label: {
                    Text("account.changePassword").foregroundStyle(Palette.ink)
                }
                .settingsRow()
            }

            Section {
                Button {
                    session.signOut()
                    dismiss()
                } label: {
                    Text("account.signOut").foregroundStyle(Palette.accent).frame(maxWidth: .infinity, alignment: .leading)
                }
                .settingsRow()
            } footer: {
                SettingsFooter("account.signOut.footer")
            }

            Section {
                Button { confirmDelete = true } label: {
                    HStack {
                        Text("account.delete").foregroundStyle(Palette.danger)
                        Spacer()
                        if deleting { ProgressView() }
                    }
                    .contentShape(.rect)
                }
                .disabled(deleting)
                .settingsRow()
            } footer: {
                SettingsFooter("account.delete.footer")
            }
        }
        .settingsList()
        .navigationTitle(Text("account.title"))
        .toolbar(removing: .title)
        // Drawn without the tab bar (SPEC §7.15): a pushed detail.
        .toolbarVisibility(.hidden, for: .tabBar)
        .alert(Text("account.delete.alert.title"), isPresented: $confirmDelete) {
            Button("account.delete.alert.cancel", role: .cancel) {}
            Button("account.delete.alert.confirm", role: .destructive) {
                Task { await deleteAccount() }
            }
        } message: {
            Text("account.delete.alert.message")
        }
        .alert(Text("account.delete.error.title"), isPresented: Binding(get: { deleteError != nil }, set: { if !$0 { deleteError = nil } })) {
            Button("account.delete.error.ok", role: .cancel) {}
        } message: {
            if let deleteError { Text(deleteError) }
        }
        .onChange(of: session.isSignedIn) { _, signedIn in
            // Signed out elsewhere (expired token): nothing to show here any more.
            if !signedIn { dismiss() }
        }
    }

    private func deleteAccount() async {
        deleting = true
        defer { deleting = false }
        do {
            try await session.deleteAccount()
            dismiss()
        } catch APIError.offline {
            deleteError = "account.delete.error.offline"
        } catch {
            deleteError = "account.delete.error.generic"
        }
    }
}

/// Account › Change password. Uses the emailed reset link (same flow as "Forgot password?"),
/// so the user never has to type the current password on the phone.
struct ChangePasswordScreen: View {
    @Environment(SessionStore.self) private var session
    @Environment(LanguageSettings.self) private var language

    @State private var sentTo: String?
    @State private var busy = false
    @State private var error: LocalizedStringKey?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(sentTo == nil ? "account.changePassword.title" : "auth.checkEmail.title")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, literata: 30)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    if sentTo == nil, let email = session.email {
                        Text("account.changePassword.body \(Text(verbatim: email).fontWeight(.medium))")
                            .font(Typography.body15)
                            .lineHeight(1.5)
                            .foregroundStyle(Palette.ink2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }

                if let sentTo {
                    CheckEmailContent(email: sentTo) { await send(to: sentTo) }
                } else {
                    VStack(spacing: 14) {
                        Button {
                            guard let email = session.email else { return }
                            Task {
                                busy = true
                                if await send(to: email) { sentTo = email }
                                busy = false
                            }
                        } label: {
                            ZStack {
                                Text("auth.reset.cta").opacity(busy ? 0 : 1)
                                if busy { ProgressView().tint(Palette.onTint) }
                            }
                        }
                        .buttonStyle(.dcPrimary)
                        .disabled(busy || session.email == nil)

                        if let error { FormMessage(text: Text(error), isError: true) }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 44)
            .animation(.easeOut(duration: 0.2), value: sentTo)
        }
        .background(Palette.background)
        .navigationTitle(Text("account.changePassword.title"))
        .toolbar(removing: .title)
        .toolbarVisibility(.hidden, for: .tabBar)
    }

    private func send(to email: String) async -> Bool {
        do {
            try await session.requestPasswordReset(email: email, language: language.code)
            error = nil
            return true
        } catch {
            self.error = AuthValidation.message(for: error)
            return false
        }
    }
}

#Preview("Account") {
    NavigationStack { AccountScreen() }
        .environment(SessionStore())
        .environment(LanguageSettings())
}

#Preview("Change password") {
    NavigationStack { ChangePasswordScreen() }
        .environment(SessionStore())
        .environment(LanguageSettings())
}
