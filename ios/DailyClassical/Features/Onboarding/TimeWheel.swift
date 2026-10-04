import SwiftUI

/// Reminder helpers shared by onboarding step 2 and Settings › Daily reminder.
enum DailyReminder {
    static let defaultHour = 8
    static let minuteStep = 5

    /// 24-hour "08:00", as drawn in the design for both languages.
    static func label(hour: Int, minute: Int) -> String {
        String(format: "%02d:%02d", hour, minute)
    }

    static func snap(_ minute: Int) -> Int { (minute / minuteStep) * minuteStep }

    /// Schedules the daily notification with text in the app's language.
    /// Returns false if notifications are not allowed.
    @discardableResult
    static func schedule(hour: Int, minute: Int, languageCode: String) async -> Bool {
        await ReminderScheduler.schedule(
            at: DateComponents(hour: hour, minute: minute),
            title: L10n.string("reminder.notification.title", code: languageCode),
            body: L10n.string("reminder.notification.body", code: languageCode)
        )
    }
}

/// Hour and minute wheels (SPEC §3.21): 00–23 and 5-minute steps, SF 23 tabular figures.
/// The system wheel draws its own selection band.
struct TimeWheel: View {
    @Binding var hour: Int
    @Binding var minute: Int

    private static let minutes = Array(stride(from: 0, to: 60, by: DailyReminder.minuteStep))

    var body: some View {
        // Two columns, no separator (SPEC §3.21); the system wheels draw their own bands.
        HStack(spacing: 0) {
            Picker(selection: $hour) {
                ForEach(0..<24, id: \.self) { h in
                    Text(verbatim: String(format: "%02d", h)).tag(h)
                }
            } label: {
                Text("reminder.picker.hour")
            }
            .frame(width: 58)
            .clipped()

            Picker(selection: $minute) {
                ForEach(Self.minutes, id: \.self) { m in
                    Text(verbatim: String(format: "%02d", m)).tag(m)
                }
            } label: {
                Text("reminder.picker.minute")
            }
            .frame(width: 58)
            .clipped()
        }
        .pickerStyle(.wheel)
        .font(.system(size: 23).monospacedDigit())
        .foregroundStyle(Palette.ink)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .onAppear { minute = DailyReminder.snap(minute) }
    }
}

#Preview {
    @Previewable @State var hour = 8
    @Previewable @State var minute = 0
    TimeWheel(hour: $hour, minute: $minute)
        .card(radius: Radius.groupedList)
        .padding(24)
        .background(Palette.background)
}
