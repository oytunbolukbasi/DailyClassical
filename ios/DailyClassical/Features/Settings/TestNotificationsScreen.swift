import SwiftUI
import UserNotifications
import WidgetKit

/// Settings › Test › Bildirim ve doğum günü (test builds only, not localized): send the daily
/// reminder for any piece, simulate a composer's birthday everywhere (Today, sheets, Library gift,
/// widget) and send its reminder, and show the day-after Library line. Notifications arrive in five
/// seconds, as banners even while the app is open (AppDelegate).
struct TestNotificationsScreen: View {
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(LanguageSettings.self) private var language
    @State private var query = ""
    @State private var sent: String?
    @State private var pending: Int?

    private var birthdayComposers: [Composer] {
        content.composers.values.filter { $0.birthday != nil }.sorted { ($0.birthday ?? "") < ($1.birthday ?? "") }
    }

    private var pieces: [PieceSummary] {
        let all = content.library.value ?? []
        guard !query.isEmpty else { return all }
        return all.filter { "\($0.composer.shortName) \($0.title)".localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        List {
            Section {
                if let today = content.library.value?.first(where: { $0.id == content.todayID }) {
                    button("Bugünün eseri bildirimi") { await sendPiece(today) }
                }
                button("Bildirim planını yenile") {
                    await ReminderScheduler.refresh(language: language.code, force: true)
                    pending = await UNUserNotificationCenter.current().pendingNotificationRequests().count
                }
                if let pending { row("Bekleyen bildirim: \(pending)") }
            } header: { header("Günlük bildirim") } footer: {
                footer("Bildirimler 5 saniye sonra gelir; uygulama açıkken de banner olarak görünür. Günlük hatırlatma Ayarlar › Günlük hatırlatma açıkken kurulur.")
            }

            Section {
                Picker(selection: Binding(
                    get: { content.simulatedBirthday ?? "" },
                    set: { simulate($0.isEmpty ? nil : $0) }
                )) {
                    Text(verbatim: "Kapalı").tag("")
                    ForEach(birthdayComposers) { c in
                        Text(verbatim: "\(c.shortName) · \(c.birthday ?? "")\(c.birthdayBasis.map { " (\($0))" } ?? "")").tag(c.id)
                    }
                } label: {
                    Text(verbatim: "Bugün kimin doğum günü").foregroundStyle(Palette.ink)
                }
                .tint(Palette.accent)
                if let id = content.simulatedBirthday, let c = content.composers[id] {
                    button("Doğum günü bildirimi (ücretsiz metni)") { await sendBirthday(c, premium: false) }
                    button("Doğum günü bildirimi (Premium metni)") { await sendBirthday(c, premium: true) }
                    button("Ertesi gün Kitaplık satırını göster") {
                        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now
                        UserDefaults.standard.set("\(APIClient.day(yesterday))|\(c.id)", forKey: Birthdays.giftOpenedKey)
                        UserDefaults.standard.removeObject(forKey: Birthdays.giftLineDismissedKey)
                        simulate(nil)  // the gift line shows only once the birthday is over
                        sent = "Kitaplık'ta ertesi gün satırı (ücretsiz kullanıcı görür)."
                    }
                }
            } header: { header("Doğum günü") } footer: {
                footer("Seçilen bestecinin doğum günü bugünmüş gibi davranır: Bugün satırı, doğum günü sayfası, besteci sayfası, Kitaplık'ta hediye ve widget. Hediye yalnızca ücretsiz kullanıcıda görünür; Debug build'lerde Premium açıktır (Ayarlar › Test'te değil, `debugPremium`).")
            }

            Section {
                TextField(text: $query) { Text(verbatim: "Eser ara") }
                ForEach(pieces) { piece in
                    Button { Task { await sendPiece(piece) } } label: {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(verbatim: piece.title).foregroundStyle(Palette.ink)
                            Text(verbatim: piece.composer.shortName).font(Typography.meta13).foregroundStyle(Palette.ink2)
                        }
                    }
                }
            } header: { header("Herhangi bir eserin bildirimi") } footer: {
                footer("Liste Kitaplık'taki eserler; takvimde olmayanlar için Ayarlar › Test › Tüm katalogu göster.")
            }
        }
        .navigationTitle(Text(verbatim: "Bildirim ve doğum günü"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbarVisibility(.hidden, for: .tabBar)
        .overlay(alignment: .bottom) {
            if let sent {
                Text(verbatim: sent)
                    .font(Typography.chip)
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .glassEffect(.regular, in: .capsule)
                    .padding(.bottom, 24)
                    .task(id: sent) { try? await Task.sleep(for: .seconds(3)); self.sent = nil }
            }
        }
    }

    // MARK: Actions

    private func sendPiece(_ piece: PieceSummary) async {
        let birthdays = Birthdays.celebrated(on: .now, in: content.composers.values, simulated: content.simulatedBirthday)
        let note = await ReminderScheduler.notification(piece: ReminderScheduler.upcomingPiece(piece), birthdays: birthdays,
                                                        language: language.code, premium: entitlements.isPremium)
        await ReminderScheduler.sendTest(note)
        sent = "5 sn içinde: \(piece.composer.shortName)"
    }

    private func sendBirthday(_ c: Composer, premium: Bool) async {
        let today = content.library.value?.first { $0.id == content.todayID }
        let note = await ReminderScheduler.notification(piece: today.map(ReminderScheduler.upcomingPiece), birthdays: [c],
                                                        language: language.code, premium: premium)
        await ReminderScheduler.sendTest(note)
        sent = "5 sn içinde: \(c.shortName) doğum günü"
    }

    private func simulate(_ id: String?) {
        content.simulatedBirthday = id
        let group = UserDefaults(suiteName: LanguageSettings.appGroup)
        if let id, let c = content.composers[id], let years = Birthdays.years(c) {
            group?.set("\(c.shortName)|\(years)", forKey: "debugBirthday")
        } else {
            group?.removeObject(forKey: "debugBirthday")
        }
        WidgetCenter.shared.reloadAllTimelines()
    }

    // MARK: Rows

    private func button(_ title: String, action: @escaping () async -> Void) -> some View {
        Button { Task { await action() } } label: {
            Text(verbatim: title).foregroundStyle(Palette.accent).frame(maxWidth: .infinity, alignment: .leading)
        }
        .settingsRow()
    }

    private func row(_ text: String) -> some View {
        Text(verbatim: text).foregroundStyle(Palette.ink2).settingsRow()
    }

    private func header(_ text: String) -> some View {
        Text(verbatim: text).font(Typography.meta13).tracking(0.26).textCase(.uppercase).foregroundStyle(Palette.ink2)
    }

    private func footer(_ text: String) -> some View {
        Text(verbatim: text).font(Typography.meta13).foregroundStyle(Palette.ink3)
    }
}
