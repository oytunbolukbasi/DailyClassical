import SwiftUI

/// Settings › Text size. Reading text follows Dynamic Type; this page explains where to
/// change it and shows a live sample at the current size.
struct TextSizeScreen: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 10) {
                    SectionLabel("settings.textSize.sample.label")
                    Text("settings.textSize.sample")
                        .readingStyle()
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.vertical, 12)
                .settingsRow()
            } footer: {
                SettingsFooter("settings.textSize.footer")
            }

            Section {
                SettingsValueRow("settings.textSize.current", value: Text(dynamicTypeSize.isAccessibilitySize ? "settings.textSize.current.accessibility" : "settings.textSize.followsSystem"))
                    .settingsRow()
            }
        }
        .settingsList()
        .navigationTitle(Text("settings.textSize"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { TextSizeScreen() }
}
