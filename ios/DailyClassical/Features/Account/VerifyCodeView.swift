import SwiftUI

/// Sign-up step 2: six digit boxes over one hidden field, so iOS can AutoFill the code
/// from Mail ("From Mail" suggestion) and paste works. Submits by itself at six digits.
struct VerifyCodeView: View {
    let email: String
    let verify: (String) async -> LocalizedStringKey?
    let resend: () async -> Void
    let changeEmail: () -> Void

    static let length = 6
    static let cooldown: TimeInterval = 30

    @State private var code = ""
    @State private var error: LocalizedStringKey?
    @State private var busy = false
    @State private var cooldownEnd = Date.now.addingTimeInterval(VerifyCodeView.cooldown)
    @FocusState private var focused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            ZStack {
                TextField("", text: $code)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .focused($focused)
                    .opacity(0.02)  // invisible but focusable, so AutoFill and paste still work
                    .onChange(of: code) { _, new in
                        let digits = String(new.filter(\.isNumber).prefix(Self.length))
                        if digits != new { code = digits }
                        error = nil
                        if digits.count == Self.length { Task { await submit() } }
                    }
                    .accessibilityLabel(Text("auth.verify.field.accessibilityLabel"))
                boxes
                    .contentShape(.rect)
                    .onTapGesture { focused = true }
                    .accessibilityHidden(true)
            }

            if let error {
                FormMessage(text: Text(error), isError: true)
            }

            VStack(spacing: 14) {
                Button { Task { await submit() } } label: {
                    ZStack {
                        Text("auth.verify.cta").opacity(busy ? 0 : 1)
                        if busy { ProgressView().tint(Palette.onTint) }
                    }
                }
                .buttonStyle(.dcPrimary)
                .disabled(busy || code.count < Self.length)

                TimelineView(.periodic(from: .now, by: 1)) { context in
                    let remaining = max(0, Int(cooldownEnd.timeIntervalSince(context.date).rounded(.up)))
                    Button {
                        Task {
                            await resend()
                            cooldownEnd = .now.addingTimeInterval(Self.cooldown)
                            code = ""
                            focused = true
                        }
                    } label: {
                        if remaining > 0 {
                            Text("auth.verify.resendIn \(remaining)").monospacedDigit()
                        } else {
                            Text("auth.verify.resend")
                        }
                    }
                    .buttonStyle(.dcTextLink)
                    .disabled(remaining > 0)
                    .opacity(remaining > 0 ? 0.55 : 1)
                }
            }

            Text("auth.verify.hint")
                .font(Typography.meta13).lineHeight(1.5)
                .foregroundStyle(Palette.ink3)

            Spacer(minLength: 0)
            Button("auth.verify.changeEmail", action: changeEmail)
                .buttonStyle(.dcTextLink)
                .frame(maxWidth: .infinity)
        }
        .onAppear { focused = true }
    }

    private var boxes: some View {
        HStack(spacing: 8) {
            ForEach(0..<Self.length, id: \.self) { i in
                let chars = Array(code)
                let isActive = focused && i == min(chars.count, Self.length - 1)
                Text(i < chars.count ? String(chars[i]) : "")
                    .font(Typography.literata(28, .medium, relativeTo: .title2))
                    .monospacedDigit()
                    .foregroundStyle(Palette.ink)
                    .frame(maxWidth: .infinity, minHeight: 58)
                    .background(Palette.surface, in: .rect(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .strokeBorder(error != nil ? Palette.danger : (isActive ? Palette.accent : Palette.rule),
                                          lineWidth: isActive || error != nil ? 1.5 : 0.5)
                    )
            }
        }
    }

    private func submit() async {
        guard code.count == Self.length, !busy else { return }
        busy = true
        defer { busy = false }
        if let message = await verify(code) {
            error = message
            code = ""
        }
    }
}
