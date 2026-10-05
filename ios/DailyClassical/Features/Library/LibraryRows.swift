import SwiftUI

/// Square painting thumbnail over the stripe placeholder (64 pt Library, 40 pt Search).
struct PieceThumbnail: View {
    let url: URL?
    var size: CGFloat = 64
    var radius: CGFloat = Radius.thumbM

    var body: some View {
        PaintingImage(url: url, variant: .thumb)
            .frame(width: size, height: size)
            .clipShape(.rect(cornerRadius: radius, style: .continuous))
            .accessibilityHidden(true)
    }
}

/// "Tchaikovsky · 1893" or "Tchaikovsky · 1893 · Today".
struct PieceMetaLine: View {
    let piece: PieceSummary
    var isToday = false

    var body: some View {
        Group {
            if isToday {
                Text("library.row.metaToday \(piece.composer.shortName) \(piece.yearText)")
            } else {
                Text("library.row.meta \(piece.composer.shortName) \(piece.yearText)")
            }
        }
        .font(Typography.meta13)
        .foregroundStyle(Palette.ink2)
    }
}

/// SPEC §3.12 Library row: 64 pt thumb, meta, Literata title, chevron (open) or lock (locked).
/// Locked rows are never dimmed: the painting and title sell what is inside.
struct LibraryRow: View {
    let piece: PieceSummary
    let isToday: Bool
    let isLocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                PieceThumbnail(url: piece.painting?.imageUrl)
                VStack(alignment: .leading, spacing: 3) {
                    PieceMetaLine(piece: piece, isToday: isToday)
                    Text(verbatim: piece.title)
                        .font(Typography.rowTitleS)
                        .lineHeight(1.3)
                        .foregroundStyle(Palette.ink)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if isLocked {
                    Icon("lock", size: 18).foregroundStyle(Palette.ink3)
                } else {
                    Image("chevron-forward-small").renderingMode(.template).resizable().scaledToFit()
                        .frame(width: 8, height: 14)
                        .foregroundStyle(Palette.ink3)
                        .accessibilityHidden(true)
                }
            }
            .padding(.vertical, 12)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityValue(isLocked ? Text("common.locked.accessibilityLabel") : Text(verbatim: ""))
        .accessibilityHint(isLocked ? Text("library.row.locked.accessibilityHint") : Text(verbatim: ""))
    }
}

/// SPEC §3.12 Favourite row: Library row + "Saved …" line, trailing filled heart that un-favourites.
struct FavouriteRow: View {
    let piece: PieceSummary
    let isToday: Bool
    let savedAt: Date
    let action: () -> Void
    let unfavourite: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            Button(action: action) {
                HStack(spacing: 14) {
                    PieceThumbnail(url: piece.painting?.imageUrl)
                    VStack(alignment: .leading, spacing: 3) {
                        PieceMetaLine(piece: piece, isToday: isToday)
                        Text(verbatim: piece.title)
                            .font(Typography.rowTitleS)
                            .lineHeight(1.3)
                            .foregroundStyle(Palette.ink)
                            .fixedSize(horizontal: false, vertical: true)
                        SavedDateLabel(date: savedAt)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 12)
                .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .accessibilityElement(children: .combine)

            Button(action: unfavourite) {
                Icon("heart-fill", size: 26)
                    .foregroundStyle(Palette.accent)
                    .frame(width: 44, height: 44)
                    .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .padding(.vertical, -10)
            .padding(.trailing, -12)
            .accessibilityLabel(Text("piece.nav.unfavourite.accessibilityLabel"))
        }
        .hairlineTop()
    }
}

/// "Saved today" / "Saved 28 September" (year added when it is not the current year).
struct SavedDateLabel: View {
    let date: Date
    @Environment(\.locale) private var locale

    var body: some View {
        Group {
            if Calendar.current.isDateInToday(date) {
                Text("favourites.row.savedToday")
            } else {
                Text("favourites.row.saved \(formatted)")
            }
        }
        .font(Typography.caption)
        .foregroundStyle(Palette.ink3)
    }

    private var formatted: String {
        let formatter = DateFormatter()
        formatter.locale = locale
        let sameYear = Calendar.current.isDate(date, equalTo: .now, toGranularity: .year)
        formatter.dateFormat = sameYear ? "d MMMM" : "d MMMM yyyy"
        return formatter.string(from: date)
    }
}

/// Loading placeholder shaped like Library rows (SPEC §3.24, applied to Library per §4.26).
struct LibrarySkeletonRow: View {
    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: Radius.thumbM, style: .continuous)
                .fill(Palette.skeleton)
                .frame(width: 64, height: 64)
            VStack(alignment: .leading, spacing: 8) {
                SkeletonBar(width: 120, height: 12)
                SkeletonBar(height: 16)
                SkeletonBar(width: 140, height: 16)
            }
        }
        .padding(.vertical, 12)
        .hairlineTop()
    }
}

/// Library could not load and nothing is cached.
struct LibraryOfflineView: View {
    let retry: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Icon("offline", size: 32).foregroundStyle(Palette.ink3).padding(.bottom, 4)
            Text("state.offline.title")
                .font(Typography.titleM)
                .lineHeight(1.2, literata: 24)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
            Text("library.offline.body")
                .font(Typography.body15)
                .lineHeight(1.5)
                .foregroundStyle(Palette.ink2)
                .fixedSize(horizontal: false, vertical: true)
            Button("state.retry", action: retry)
                .buttonStyle(SmallCapsuleButtonStyle())
                .padding(.top, 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 30)
    }
}
