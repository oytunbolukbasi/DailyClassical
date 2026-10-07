import SwiftUI

/// Medium-detent list of recommended recordings; the first is the reference the stop
/// times follow. Text rows only, so Spotify's artwork rules don't apply (SPEC §4.7).
struct RecordingsSheet: View {
    let recordings: [Recording]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                SheetHeader(title: Text("recordings.title"), subtitle: Text("recordings.subtitle")) { dismiss() }
                VStack(spacing: 0) {
                    ForEach(recordings) { recording in row(recording) }
                }
                Text("recordings.note").font(Typography.microRegular).lineHeight(1.5).foregroundStyle(Palette.ink3)
            }
            .padding(.horizontal, 24)
            .padding(.top, 26)
            .padding(.bottom, 32)
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }

    private func row(_ r: Recording) -> some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 3) {
                if r.role == .reference {
                    Text("recordings.referenceBadge").font(Typography.micro).tracking(0.88).textCase(.uppercase).foregroundStyle(Palette.accent)
                }
                Text(verbatim: r.performers).font(Typography.readingMedium).lineHeight(1.3).foregroundStyle(Palette.ink)
                if !r.otherSoloists.isEmpty || r.chorus != nil {
                    Text(verbatim: (r.otherSoloists.map(\.name) + [r.chorus].compactMap { $0 }).joined(separator: ", "))
                        .font(Typography.meta13).foregroundStyle(Palette.ink2)
                }
                Text(verbatim: r.labelAndYear).font(Typography.meta13).foregroundStyle(Palette.ink2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            if let url = r.spotifyUrl {
                Button("recordings.openInSpotify") { openURL(url) }
                    .buttonStyle(SmallCapsuleButtonStyle(prominent: r.role == .reference))
            } else {
                Text("recordings.unavailable").font(Typography.meta13).foregroundStyle(Palette.ink3)
            }
        }
        .padding(.vertical, 16)
        .hairlineTop()
    }
}
