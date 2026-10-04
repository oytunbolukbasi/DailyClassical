import SwiftUI

/// Settings › Painting and recording sources: the painting credit and reference recording
/// of every published piece, in the current content language.
struct SourcesScreen: View {
    @Environment(ContentStore.self) private var content
    @State private var recordings: [String: Recording] = [:]

    var body: some View {
        List {
            switch content.library {
            case .loaded(let pieces):
                ForEach(pieces) { piece in
                    Section {
                        if let painting = piece.painting {
                            creditLine(Text("sources.painting \(paintingCredit(painting))"))
                        }
                        if let recording = recordings[piece.id] {
                            creditLine(Text("sources.recording \(recordingCredit(recording))"))
                        }
                    } header: {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(verbatim: piece.composer.name)
                                .font(Typography.meta13)
                                .foregroundStyle(Palette.ink2)
                            Text(verbatim: piece.title)
                                .font(Typography.rowTitleXS)
                                .foregroundStyle(Palette.ink)
                        }
                        .textCase(nil)
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isHeader)
                    }
                }
                Section {} footer: { SettingsFooter("sources.footer") }
            case .failed:
                Section {
                    Text("state.error.generic").foregroundStyle(Palette.ink2).settingsRow()
                    Button("state.retry") { Task { await content.retry() } }.settingsRow()
                }
            case .idle, .loading:
                Section {
                    ProgressView().frame(maxWidth: .infinity).listRowBackground(Color.clear)
                        .accessibilityLabel(Text("state.loading.accessibilityLabel"))
                }
            }
        }
        .settingsList()
        .navigationTitle(Text("settings.about.sources"))
        .navigationBarTitleDisplayMode(.inline)
        .task(id: "\(content.language)-\(content.library.value?.count ?? 0)") { await loadRecordings() }
    }

    private func creditLine(_ text: Text) -> some View {
        text
            .font(Typography.meta13)
            .lineHeight(1.45, size: 13)
            .foregroundStyle(Palette.ink2)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.vertical, 6)
            .settingsRow()
    }

    /// "Isaac Levitan, *Above the Eternal Peace*, 1894. State Tretyakov Gallery, Moscow."
    private func paintingCredit(_ p: Painting) -> AttributedString {
        var title = AttributedString(p.title)
        title.inlinePresentationIntent = .emphasized
        return AttributedString("\(p.artist), ") + title + AttributedString(", \(p.yearLabel). \(p.collection).")
    }

    /// "Teodor Currentzis, musicAeterna (Sony Classical, 2017)."
    private func recordingCredit(_ r: Recording) -> String {
        let year = r.releaseYear.map(String.init) ?? r.recordedYear
        let meta = [r.label, year].compactMap { $0 }.joined(separator: ", ")
        return meta.isEmpty ? "\(r.conductor), \(r.orchestra)." : "\(r.conductor), \(r.orchestra) (\(meta))."
    }

    /// Summaries carry the painting; the reference recording comes from each piece's detail.
    private func loadRecordings() async {
        guard let pieces = content.library.value else { return }
        for piece in pieces where recordings[piece.id] == nil {
            guard !Task.isCancelled else { return }
            if let recording = try? await content.piece(id: piece.id).referenceRecording {
                recordings[piece.id] = recording
            }
        }
    }
}

#Preview {
    let content = ContentStore(source: .bundled)
    NavigationStack { SourcesScreen() }
        .environment(content)
        .task { await content.reload(language: "en") }
}
