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
            .lineHeight(1.45)
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
        r.citation(fullNames: true) + "."
    }

    /// Summaries carry the painting; the reference recording comes from each piece's detail.
    /// Loads a few pieces at a time (ContentStore caches each one) and shows every credit as soon
    /// as its piece arrives. Leaving the screen cancels the rest.
    private func loadRecordings() async {
        guard let pieces = content.library.value else { return }
        var pending = pieces.map(\.id).filter { recordings[$0] == nil }.makeIterator()
        let content = content
        await withTaskGroup(of: (String, Recording?).self) { group in
            func startNext() {
                guard let id = pending.next() else { return }
                group.addTask { (id, try? await content.piece(id: id).referenceRecording) }
            }
            for _ in 0..<Self.concurrentLoads { startNext() }
            for await (id, recording) in group {
                if let recording { recordings[id] = recording }
                if !Task.isCancelled { startNext() }
            }
        }
    }

    private static let concurrentLoads = 4
}

#Preview {
    let content = ContentStore(source: .bundled)
    NavigationStack { SourcesScreen() }
        .environment(content)
        .task { await content.reload(language: "en") }
}
