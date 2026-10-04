# DailyClassical: implementation audit against SPEC.md

Date: 2026-10-04. Read-only audit of `ios/DailyClassical/` and `ios/strings/*.json` against `design/SPEC.md` (§3, §4.1–4.26, §7) and `design/strings-en.md`.

**Scope notes**
- `Features/Composer/ComposerSheet.swift` was skipped because it is being rewritten. §4.8 is therefore not audited. One Core data gap that the rewrite depends on is noted in P2-29.
- These accepted deviations are not reported: system TabView puts Search inside the tab capsule (iOS 27); the primary glass button uses frosted `.regular` glass with a page-colour tint; Settings groups use the system radius.
- Line references are `file:line` relative to `ios/DailyClassical/`.

**Counts:** P0 = 0 · P1 = 7 · P2 = 36

No screen is missing or broken. Every §4 screen and state except the skipped Composer sheet exists and is wired up. The P1 items are visible deviations in the Piece page (the centrepiece), the Library chips, the Glossary sheet, the offline state and Turkish casing. Two of them (P1-4, P1-7) need a quick on-device check before you fix them.

---

## P0: broken or missing screen

None found.

---

## P1: visible deviation

### P1-1 · Movement switcher draws glass on glass in the nav bar (§3.8, §2.6 "never stack glass on glass")
- `Features/Piece/PieceScreen.swift:90-92` puts `MovementSwitcher` in `ToolbarItem(placement: .principal)`. On iOS 26+, toolbar items already get the shared glass background. `GlassSegmented` adds its own `.glassEffect(.regular, in: .capsule)` (`DesignSystem/Components/Glass.swift:88`), so the switcher sits as a glass capsule inside a glass capsule.
- **Fix:** add `.sharedBackgroundVisibility(.hidden)` to that `ToolbarItem` (PieceScreen.swift:90). The custom capsule stays the only glass layer, keeps its 44 pt height and padding 4, and the same view still works inline at the Movement I header.

### P1-2 · Library filter chips can merge into one glass blob (Liquid Glass: each function in its own container)
- `Features/Library/LibraryScreen.swift:70` wraps Composer, Era and Glossary in `GlassEffectContainer(spacing: 8)`, with the HStack gap also 8 (line 71). The container's `spacing` is the distance at which shapes start to blend. At 8/8 the three separate controls (two menus and a navigation link) morph together while scrolling or pressing. Spec §3.16 draws three separate capsules with an 8 pt gap.
- **Fix:** remove the `GlassEffectContainer`, keeping each `GlassChip`'s own `.glassEffect`. If you want the shared sampling, use `GlassEffectContainer(spacing: 0)` so the shapes never blend at an 8 pt gap.

### P1-3 · The switcher docks at mid-screen, not when the Movement I header passes under the nav bar (§3.8, §4.3)
- `PieceScreen.swift:51-53`: `inMovements` turns true when `centerBlock` (the block at the **vertical centre**, line 66) reaches `.movementHeader(1)`. When it does:
  - the inline switcher at the header fades out while it is still in the middle of the screen (line 247, `.opacity(inMovements ? 0 : 1)`);
  - the nav-bar switcher and glossary button appear, and heart and expand disappear;
  - the floating "Open in Spotify" disappears (line 144).
  
  Spec: "Before the first movement section the control sits inline. Once the user scrolls past that header, it docks into the centre of the top bar."
- **Fix:** drive docking from the header's geometry, not from the centre block. Add `.onGeometryChange(for: CGFloat.self) { $0.frame(in: .scrollView).minY }` on the Movement I header (`movementHeader`, line 240). Set `docked = minY < navBarBottom`, where `navBarBottom` = safe-area top + 44 + 11. Use `docked` in place of `inMovements` for the toolbar (line 89), the inline opacity (line 247) and `floatingSpotify` (line 144). Keep `centerBlock` only for `currentMovement` and reading focus.

### P1-4 · Verify that reading focus really tracks the centre of the viewport (§3.6). Check this first.
- `PieceScreen.swift:66` relies on `.scrollPosition(id: $centerBlock, anchor: .center)` reporting the block nearest the viewport centre. On several iOS versions this binding reports the top-most visible view, and `anchor` only applies to programmatic scrolling. If that happens here, the "current" stop is the one at the top edge and the rest of the focus fade is half a screen off. This breaks the centrepiece interaction.
- **Check:** scroll Movement I slowly on a device. The ringed dot should sit on the stop crossing the vertical middle.
- **Fix if wrong:** give each `.stop` block an `onGeometryChange(for: CGFloat.self) { $0.frame(in: .scrollView(axis: .vertical)).midY }` that writes into a `[PieceBlock: CGFloat]` preference. In `onScrollGeometryChange`, pick the block whose midY is nearest `visibleRect.midY` (below the nav bar). Keep the 200 ms ease-out (line 82).

### P1-5 · Glossary term not highlighted while its sheet is open (§3.7, §4.6)
- Spec: the tapped term gets an `accent @ 14 %` background, radius 4, while the Glossary sheet is open. Nothing implements it. `DesignSystem/Components/RichTextView.swift:22-28` only sets the colour and the dotted underline.
- **Fix:**
  - Add `var activeTermID: String?` to `RichTextView`. In `styled`, for runs where `run.glossaryTerm == activeTermID`, set `text[run.range].backgroundColor = Palette.accent.opacity(0.14)`. (Text cannot round the corners; the square background is acceptable. Use a TextRenderer later if the 4 pt radius matters.)
  - In `PieceContent`, derive `activeTermID` from `router.sheet` (`if case .glossaryTerm(let id) = router.sheet`) and pass it to every `RichTextView` and to `LeadInParagraph` (PieceScreen.swift:167, 193, 196, 268, 297, 310, 325, 323; ListeningStopRow.swift:53-56).

### P1-6 · Offline date label uses US order and skips its string key (§4.26 "SATURDAY, 4 OCTOBER", date format "EEEE, d MMMM")
- `Features/Today/TodayScreen.swift:129` uses `Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).locale(locale))`. With `Locale("en")` this renders "SATURDAY, OCTOBER 4". The key `state.offline.date %@` exists in `strings/common.json` but is never used.
- **Fix:** build the date with a `DateFormatter` whose `locale` is the env locale and `dateFormat = "EEEE, d MMMM"` (TR gives "Cumartesi, 4 Ekim", which is correct). Render it as `SectionLabel("state.offline.date \(dateString)", color: Palette.accent)`.

### P1-7 · Verify Turkish upper-casing of section labels and the date chip
- `.textCase(.uppercase)` is used for every section label (`DesignSystem/Components/Content.swift:22`), the date chip (`TodayScreen.swift:102`), Settings headers (`Features/Settings/SettingsComponents.swift:68`), the badge (`Features/Recordings/RecordingsSheet.swift:31`) and the eyebrow (`Features/Onboarding/Onboarding.swift:113`). Turkish needs locale-aware casing: "Ana fikirler" → "ANA FİKİRLER" and "Cumartesi" → "CUMARTESİ". If SwiftUI applies a locale-independent uppercase, every label in TR shows "FIKIRLER" or "CUMARTESI", which is wrong Turkish.
- **Check:** set the app language to Türkçe and look at "Ana fikirler", "Dikkat edilecekler" and the date chip.
- **Fix if wrong:** have `SectionLabel` (and the other call sites) resolve the string and call `uppercased(with: locale)` instead of `.textCase`. For keys, use `String(localized: LocalizedStringResource(key, locale: locale))`.

---

## P2: polish

### Piece page
- **P2-1 · Heart icon size.** `PieceScreen.swift:102`: `Icon(…, size: 24)`. Spec §3.2 says 26. **Fix:** `size: 26`.
- **P2-2 · Reading focus only fades stops.** §3.6 and §4.3 ask for the summary paragraph above the stops (and other reading blocks in the movement) to fade to `ink3` while glossary terms stay accent. `PieceScreen.swift:183-187` returns `.none` for every non-stop block. **Fix:** compute focus for `.summary(m)`, `.mainIdeas(m)` and `.notice(m)` relative to the current stop block. Pass `color: Palette.ink3` (terms stay `Palette.accent`) to their `RichTextView`s when they are passed or upcoming.
- **P2-3 · Untimed stop dot when passed.** `ListeningStopRow.swift:34-43`: a passed untimed stop keeps a full-opacity accent ring while its text fades. **Fix:** apply `.opacity(focus == .passed ? 0.4 : 1)` to the hollow ring too.
- **P2-4 · "Things to notice" spacing.** The item gap is 12, from the shared VStack at `PieceScreen.swift:292`. Spec §4.4 row 11 says 10 v between items and 12 after the label. **Fix:** wrap the items in their own `VStack(spacing: 10)`.
- **P2-5 · Movement III/IV dividers.** `PieceScreen.swift:256-258` gives every movement after I a hairline plus 44 top. Spec draws a hairline plus 44 only for Movement II, and 36 with no hairline for III and IV. That layout came from template slots, so accepting the uniform hairline is reasonable. Otherwise use `m.index == 2 ? 44 : 36` and add the hairline only on 2.
- **P2-6 · Sources line built from fragments.** `PieceScreen.swift:364-366` concatenates `Text("piece.sources.painting")` + `": artist, "` + … + `"piece.sources.publicDomain"`. Translators cannot reorder it, and `Text + Text` is deprecated on iOS 26. **Fix:** add `piece.sources.painting %@` ("Painting: %@ Public domain." / "Tablo: %@ Kamu malı.") and pass the italic AttributedString caption, as `SourcesScreen.paintingCredit` already does (`Features/Settings/SourcesScreen.swift:65`).
- **P2-7 · Floating "Open in Spotify" hides from Movement I onward** (`PieceScreen.swift:144`). This matches the mid-scroll frame, but §4.4 row 17 keeps 150 pt of clearance "for the floating button" at the end of the page. Decide whether the button comes back after the last movement (threads, recordings, sources). If not, the 150 pt bottom padding (line 374) can drop to about 44.
- **P2-8 · Skeleton bar radius.** `Content.swift:122` uses `Capsule()`. Spec §3.24 uses radius = h/2 only up to 8 (26 pt bars get radius 8, not 13). **Fix:** `RoundedRectangle(cornerRadius: min(height / 2, 8), style: .continuous)`.

### Glossary
- **P2-9 · Glossary-term hit target and hint.** §3.7 wants a 44 pt hit area (10 pt invisible vertical padding) and the hint "Opens definition". Links inside `Text` (`RichTextView.swift:14-20`) get neither. **Fix:** at minimum add `.accessibilityHint(Text("common.glossaryTerm.accessibilityHint"))` when the source contains a term. For the hit area, a TextKit or `TextRenderer` wrapper is needed (already flagged as custom work in §5).
- **P2-10 · Term links have no handler outside `PieceContent`.** `.onGlossaryTap` is applied at `PieceScreen.swift:73`. The `.sheet` modifiers on lines 74-75 sit outside it, and the router sheets in `App/RootView.swift:26` have no handler at all. Term links inside `GlossaryTermSheet`, `PieceGlossarySheet` and the Composer bio therefore fall through to the system and do nothing. This is latent: current fixtures have no `[[…]]` in definitions or bios. **Fix:**
  - attach `.onGlossaryTap { router.present(.glossaryTerm($0)) }` inside `AppSheetView` (RootView.swift:39);
  - move `PieceContent`'s `.onGlossaryTap` after its `.sheet`s;
  - for a term tapped inside a router sheet, swap `router.sheet` to the new term instead of stacking a second sheet.
- **P2-11 · List rows show the full definition instead of the short summary.** `Features/Glossary/GlossaryListScreen.swift:180` and `Features/Search/SearchScreen.swift:309` truncate `definition`. Spec §4.9 uses the one-line `short`. `GlossaryTerm` (`Core/Models/Piece.swift:89-93`) has no `short`. **Fix:** add `short` to the API, the model and the fixtures, and use it in both rows. Keep `definition` for the sheet.
- **P2-12 · Glossary list loading/offline checks the wrong store.** `GlossaryListScreen.swift:19-20, 90-91` shows a skeleton whenever `content.glossary.isEmpty`, and switches to offline only when `content.library` failed. If the glossary call fails while the library succeeds, the skeleton stays forever. **Fix:** give `ContentStore` a `Loadable` glossary state (ContentStore.swift:36-38) and switch on it.
- **P2-13 · "See all terms in Library ›" replaces the Library stack.** `App/AppRouter.swift:50` sets `libraryPath = NavigationPath([GlossaryListRoute()])`. When the piece was opened from Library, the user loses it and cannot go back. **Fix:** if `tab == .library`, `libraryPath.append(GlossaryListRoute())`; otherwise keep the reset.
- **P2-14 · "See all" link tap target.** `Features/Glossary/GlossaryTermSheet.swift:18-25` is a bare 13 pt text button. **Fix:** add `.frame(minHeight: 44, alignment: .leading).contentShape(.rect)` and reduce the top padding so the layout does not move.
- **P2-15 · No bottom fade** on Library › Glossary or Library (spec §4.9 and §4.11: 150 pt, transparent → bg at 70 %/60 %). The system tab bar's scroll-edge effect is an acceptable substitute. If you want the exact look, add `BottomFade()` as an overlay with `.allowsHitTesting(false)`.

### Recordings sheet
- **P2-16 · Subtitle style.** "Listening-stop times follow the first recording." renders as SF 15/1.5 because `SheetHeader`'s subtitle font is fixed (`DesignSystem/Components/Content.swift:183`; used at `RecordingsSheet.swift:13`). Spec §4.7 says SF 13/1.45 `ink2`. **Fix:** add a `subtitleFont`/`subtitleLineHeight` parameter to `SheetHeader` and pass `Typography.meta13` and 1.45 from `RecordingsSheet`. Auth sheets keep 15/1.5.

### Today
- **P2-17 · Date chip at absolute top 58.** `TodayScreen.swift:44` pads 58 pt inside a view that ignores the top safe area. Spec §0 says to treat 58 as `safeAreaInsets.top + 11`. On Dynamic Island devices (safe top 59–62) the chip ends up right against the status bar. **Fix:** read the safe-area top (for example `GeometryReader`/`onGeometryChange` on the root before `.ignoresSafeArea`) and pad by `top + 11`.
- **P2-18 · Date chip shows the device date, not the piece's publish date.** `DateChip(date: .now)` (TodayScreen.swift:44). `ContentSource.api.today` drops `TodayResponse.date` (`Core/Networking/ContentSource.swift:14`). Spec §6.1: `publishDate` drives the chip. **Fix:** keep `date` in `ContentStore.today` and pass it to `DateChip`.
- **P2-19 · Any failure shows "You're offline".** `TodayScreen.swift:15` maps every `.failed` (decoding, 5xx) to the offline block. **Fix:** show the offline block for `.offline` only, and `state.error.generic` with the same Try again for other errors.
- **P2-20 · Offline block details.**
  - "Try again" uses `SmallCapsuleButtonStyle` with 16 pt padding (`DesignSystem/Components/Buttons.swift:29`). Spec §3.25 says 18. **Fix:** add a `horizontalPadding` parameter and pass 18 here (TodayScreen.swift:133).
  - The title has no 1.2 line height.
  - The block is not scrollable at accessibility text sizes (TodayScreen.swift:124-139). Wrap it in a `ScrollView`.

### Library and favourites
- **P2-21 · Account › Email row has no chevron or destination.** `Features/Account/AccountScreen.swift:20-23` shows it as an informational row. Spec §4.21 draws `Email · {email} ›`. Its destination is undrawn, and `account.changeEmail.title` is a reserved key. Acceptable until the API supports changing the email; track it.
- **P2-22 · Tab bar visibility on pushed Settings details is inconsistent.** Account and Change password hide it (`AccountScreen.swift:61, 155`). Reminder, Theme, Language, Text size, About and Sources keep it. Pick one rule (§7.15). Hiding it on every pushed Settings detail matches the Account frame.

### Search
- **P2-23 · Nav title and spacing.** `SearchScreen.swift:18-19` shows an inline "Search" title the design does not have, and results start 12 pt below the field (line 77) instead of 22. **Fix:** remove the inline title (or use `.toolbar(removing: .title)`) and set `.padding(.top, 22)`.
- **P2-24 · System-provided labels follow the device language, not the in-app language.** The search tab's label and VoiceOver name (`App/RootView.swift:22`) and the searchable "Cancel" come from the system. With the app set to TR on an EN phone, they stay English. **Fix:** give the tab an explicit label (`Tab("tab.search", image: "search", value: .search, role: .search)`) and accept the system Cancel, or document it.

### Artwork viewer
- **P2-25 · Zoom behaviour.** `Features/Artwork/ArtworkViewer.swift:25-28` double-tap zooms to the centre rather than the tapped point, and the pan (lines 63-70) is not clamped, so the image can be dragged off-screen. **Fix:** clamp `offset` to `(scale - 1) * size / 2` per axis, or use a `UIScrollView` representable as §5 suggests.
- **P2-26 · Caption and close button details.**
  - The rights text is always "Public domain" (`ArtworkViewer.swift:45`). Show it only when `painting.rightsStatus == "public_domain"`, as the Piece page does.
  - The G4 close button lacks the `0 2 6 rgba(0,0,0,.35)` shadow. Add `.shadow(color: .black.opacity(0.35), radius: 3, y: 2)`.

### Design system, accessibility and performance
- **P2-27 · Fixed-size system fonts ignore Dynamic Type.** These sizes do not scale:
  - `Typography.meta14`, `chip`, `buttonS` and `tabLabel` (`DesignSystem/Typography.swift:40-42, 50`);
  - the plan badge (`Features/Paywall/PaywallScreen.swift:228`);
  - the index rail (`GlossaryListScreen.swift:216`).
  
  They cover the Piece header meta, durations, segmented control, chips, toast and small capsules. Spec §2.2 says every size should be `relativeTo:` a text style. **Fix:** scale them with `UIFontMetrics(forTextStyle: .subheadline).scaledValue(for: 14)` (wrapped in a helper), or `@ScaledMetric` at the call site.
- **P2-28 · `EmptyStateView` details** (`Content.swift:136-146`). The title has no line height (spec 24/1.2), and the search-empty variant should use gap 10 instead of 12. **Fix:** add `.lineHeight(1.2, size: 24)` on the title and a `spacing` parameter (10 for the search variant).
- **P2-29 · Data the UI needs but the models lack.** These block exact §4.8/§4.9 output:
  - `Composer` (`Core/Models/Piece.swift:95-102`) has no `nationality`, `era`, `facts`, `portrait` or `pieces`;
  - `Painting` has no `focalPoint`, so the paywall crop is hand-coded at `PaywallScreen.swift:152`;
  - `GlossaryTerm` has no `short`.
  
  This is relevant to the Composer rewrite.
- **P2-30 · Image sizes and offline images.**
  - Library 64 pt and Search 40 pt thumbnails load the full-resolution Commons file (`DesignSystem/Components/Content.swift:98-114` via `Features/Library/LibraryRows.swift:46`; Tchaikovsky's is 2707 × 1981). Request sized variants (`?width=200` for thumbs, 900 for heroes; spec §6.1 sizes).
  - Images rely on `URLCache` only. §4.26 expects the images of opened pieces to stay available offline. Add a file cache next to `Core/Persistence/ResponseCache.swift`.
- **P2-31 · Page dots' accessibility value** `Text("\(current + 1) / \(count)")` (`Content.swift:168`) creates an uncatalogued key `%lld / %lld`. **Fix:** add `onboarding.page %lld %lld` ("Page %1$lld of %2$lld" / "Sayfa %1$lld / %2$lld").
- **P2-32 · Unused keys.** `state.offline.date %@` (use it, see P1-6) and `common.back.accessibilityLabel` (`strings/common.json`). Delete the second, or use it if you replace the system back button.

### Copy (EN)
- **P2-33 · Paywall caption.** `paywall.painting.caption` says "…c. 1818. Hamburger Kunsthalle." Spec §4.10 says "Kunsthalle Hamburg." Both names are correct; align with the spec or update the spec.
- **P2-34 · No plural rules.** `today.meta %@ %lld %lld` gives "1 movements" and "1 minutes" when a count is 1. strings-en.md says to use plural rules. **Fix:** teach `scripts/build-strings.py` to emit String Catalog plural `variations` (EN one/other; TR needs only other).

### Copy (TR)
All keys used in code exist in `ios/strings/*.json` with both `en` and `tr`. Placeholder counts match. Reordered strings use positional specifiers (`today.painting.accessibilityLabel`, `piece.stop.time.range`). Dynamic `era.*` keys match `Era.rawValue`. No key is missing. Issues:
- **P2-35 · Mixed register on buttons and links.** The same action alternates between the polite imperative (‑ın/‑in) and the short form:
  - `favourites.prompt.signIn`, `onboarding.signIn`, `auth.signInLink`, `auth.signIn.title`, `settings.account.signIn` say "Giriş yapın", while `auth.signIn.cta` says "Giriş yap";
  - `favourites.prompt.createAccount`, `auth.createAccountLink`, `auth.create.title` say "Hesap oluşturun", while `auth.create.cta` says "Hesap oluştur";
  - the `account.changePassword` row says "Şifreyi değiştir" but the page title it opens (`account.changePassword.title`) says "Şifreyi değiştirin";
  - `search.locked.cta` says "Premium’u görün" and `favourites.empty.guestCta` says "Giriş yapın ya da hesap oluşturun".
  
  **Fix:** use the short form for every button, link and nav title ("Giriş yap", "Hesap oluştur", "Şifreyi değiştir", "Premium’u gör", "Giriş yap ya da hesap oluştur"), as iOS does. Keep ‑ın/‑iniz in body sentences.
- **P2-36 · Awkward or unclear strings.**
  - `piece.section.threads` "Eseri birbirine bağlayan ipler" is ungrammatical: "birbirine" needs a plural object. Suggest **"Eseri bir arada tutan ipler"**.
  - `favourites.empty.title` "Henüz kaydedilen yok": suggest **"Henüz kaydettiğiniz bir eser yok"**.
  - `piece.stop.current.accessibilityValue` "Şu an": suggest **"Şu anki durak"**.
  - `glossary.intro` "…dinleyiciler için açıklandı." reads as past tense. Suggest **"…dinleyiciler için açıklanıyor."**
  - `paywall.plan.monthly.detail` "Aylık, istediğiniz zaman iptal" is clipped. Suggest **"Her ay, istediğiniz zaman iptal edin"**.
  - `auth.checkEmail.sendAgainIn %lld` "%lld sn sonra yeniden gönderebilirsiniz" is long for a text button. Suggest **"Yeniden gönder (%lld sn)"**.
  - Optional: `paywall.title` "Bundan daha fazlası." is a literal calque; consider "Daha fazlası." Optional: `paywall.painting.caption` "y. 1818" → "yak. 1818".

---

## Cross-cutting checks

| Check | Result |
|---|---|
| Separate functions merged into one glass group | **One issue:** Library chips container (P1-2). Piece toolbar is correct: heart and expand are separate `ToolbarItem`s with `ToolbarSpacer(.fixed)` (PieceScreen.swift:100-113). There is no `ToolbarItemGroup` anywhere. The Library segmented control and movement switcher are single controls, so one capsule is correct. |
| Glass on glass | **One issue:** movement switcher in the toolbar (P1-1). |
| Glass on content surfaces | **None.** Stop cards, movement table, recordings card, plan cards, form cards, Settings rows, picker card and empty-state CTAs are all solid. Glass is used only on: chip, segmented control, search field, icon buttons, toast, date chip and primary button (`Glass.swift`, `TodayScreen.swift:107`, `GlossaryListScreen.swift:273`). |
| Hardcoded English via `Text(verbatim:)` or literals | **None user-visible.** The verbatim literals are the brand name (`AboutScreen.swift:16`), punctuation (`TimeWheel.swift:47`, `PieceScreen.swift:364-365`; see P2-6), empty placeholders and data. Native language names in `Core/Localization/AppLanguage.swift:32-33` are intentional. |
| Int interpolation rendering years as "1,893" | **None.** Every year goes through `yearText` (`Core/Models/Piece.swift:105-106`) or `String(born)` (`SearchScreen.swift:275`). Int interpolations that remain (`today.meta`, `piece.meta` minutes and movements, `auth.checkEmail.sendAgainIn`) are small counts. (The skipped `ComposerSheet.swift:73` uses a verbatim `"\(piece.year)"`, which does not group digits.) |

---

## Screen-by-screen status

| § | Screen / state | Status | Items |
|---|---|---|---|
| 4.1 | Today light / dark / RT | Implemented | P2-17, P2-18, P1-7 (chip casing). RT is handled by system glass. |
| 4.2 | Piece top | Implemented | P2-1 |
| 4.3 | Piece mid-scroll | **Partially** | P1-1, P1-3, P1-4, P2-2 |
| 4.4 | Piece full scroll | Implemented | P2-4, P2-5, P2-6, P2-7 |
| 4.5 | Listening-stop variants | Implemented | P2-3 |
| 4.6 | Glossary sheet | **Partially** | P1-5, P2-9, P2-14 |
| 4.7 | Recordings sheet | Implemented | P2-16. The designer-only Spotify note is correctly replaced by real copy (`recordings.note`), and placeholder rows are not shipped. |
| 4.8 | Composer sheet | Not audited (being rewritten) | P2-29 |
| 4.9 | Library › Glossary | Implemented | P2-11, P2-12, P2-15 |
| 4.10 | Paywall | Implemented | P2-33. The placeholder benefit is correctly omitted. |
| 4.11 | Library locked | Implemented | P1-2, P2-15 |
| 4.12 | Search | Implemented (accepted system field) | P2-23, P2-24 |
| 4.13 | Settings | Implemented. The guest Account row shows "Sign in" in accent (§7.16). | P2-22 |
| 4.14 | Artwork viewer | Implemented | P2-25, P2-26 |
| 4.15 | Onboarding 1 of 2 | Implemented | — |
| 4.16 | Onboarding 2 of 2 | Implemented: system wheel, 5-minute steps, 24 h label | — |
| 4.17 | Flow 07 frames 1–4 (guest heart → prompt → create account → saved and toast) | Implemented: pending favourite saved after auth plus toast (`AuthSheet.swift:237-241`) | — |
| 4.17 | Sign in | Implemented | P2-35 (TR) |
| 4.18 | Toast | Implemented (≈2 s, announced) | — |
| 4.19 | Reset password | Implemented: email carries over | — |
| 4.20 | Check your email | Implemented, with a 30 s resend cooldown | P2-36 (TR) |
| 4.21 | Settings › Account | Implemented | P2-21 |
| 4.22 | Delete account alert | Implemented (native alert, accent tint) | — |
| 4.23 | Favourites · signed in | Implemented (swipe and heart remove, footer) | — |
| 4.24 | Favourites · guest | Implemented | — |
| 4.25 | Favourites · signed in, empty | Implemented | — |
| 4.26 | Today loading | Implemented | P2-8 |
| 4.26 | Search empty | Implemented | P2-28 |
| 4.26 | Today offline | **Partially** | P1-6, P2-19, P2-20 |
| 4.26 | Library row locked / open | Implemented (chevron when open, lock when locked, no dimming) | — |
