# Visual review: iOS app vs design canvas (SPEC §4.1–4.15)

Date: 5 October 2026. Device: iPhone 18 Pro simulator (402 × 874 pt, iOS 26), free user, signed out, light mode.
Reference: `design/DailyClassical2.html` frames (390 × 844), rendered with headless Chrome at 2× and compared side by side
with simulator screenshots. Vertical positions were measured from row-ink profiles (glyph tops), so "Δ" values below are
in points on the design frame.

Notes that apply to every screen:

- **Device size.** The phone is 12 pt wider and 30 pt taller than the design frame, and the status bar / safe area is
  taller (62 vs ~54). Text therefore wraps differently in some places, and bottom-anchored blocks sit 30 pt lower in
  absolute terms. Positions are compared relative to the nearest anchor (top of content or bottom of screen).
- **Content.** The review started on Tchaikovsky's Sixth and the day rolled over during the session, so later screens
  show Mozart's Symphony No. 40. Text, painting, crop and caption differences that come from content data are not
  listed as deltas.
- **System chrome.** The iOS 26 tab bar (4 items with Search as a tab in the bar instead of a separate circle), the
  navigation back button (plain chevron circle instead of the "‹ Library" pill), and floating Liquid Glass sheets (inset
  from the screen edges, instead of edge-to-edge) are system behaviour that SPEC §5 says to accept. They are not
  repeated per screen.

## Cross-cutting fixes

| Area | Delta found | Fix |
|---|---|---|
| Line height | `lineHeight(_:size:)` helper applied the multiple wrongly; line pitch was off on every multi-line text | `View.lineHeight(_:)` now maps to iOS 26 `.lineHeight(.multiple(factor:))`, which matches CSS (Today title pitch 32.0 vs 32.4, reading 27.3 vs 27.2). The `size:` argument was removed from all call sites and from `RichTextView` (`DesignSystem/Typography.swift`, `RichTextView.swift`). |
| Literata vertical position | With line heights looser than Literata's natural 1.3 (hooks 1.45, reading 1.6), SwiftUI puts all the extra leading below the line, while CSS splits it. Literata text sat 1–3 pt high. | New `lineHeight(_:literata:)` shifts the drawing by half the extra leading (scaled with Dynamic Type). Used for reading text, hooks, titles and sheet titles. Tighter titles (1.1–1.25) need no shift and get none. SF text is not shifted (testing showed it was already correct). |
| Hairlines | Section hairlines hugged the text width when the content was narrower than the column | Container frames set to full width before `.hairlineTop()` (Piece sections, Composer "In DailyClassical", Favourites footer). |
| 44 pt text links | `TextLinkButtonStyle` / `InlineLinkButton` keep a 44 pt hit target, which added about 13 pt above and below the text and broke the 12/16 pt rhythm | Negative vertical padding at the call sites where the rhythm matters (paywall Restore, onboarding links, sign-in prompt "Not now"). The hit target is still 44 pt. |
| Bottom fade | Spec'd 150 pt fades were missing on lists | `BottomFade(solidFrom:)` added to Library (solid at 60 %) and Library › Glossary (70 %). |

## Per screen

### 1. Today (§4.1)
- Found: title/hook/meta pitch off (line-height bug); composer link 4 pt low (local padding hack).
- Fixed: line height; the composer link's −4 pt vertical padding moved into `ComposerLink` and the Today-only hack removed.
- Now: caption, composer, title, hook and meta within 1.5 pt.
- Remaining: none apart from content (painting crop and caption text come from data).

### 2. Piece page, top (§4.2)
- Found: composer link +4 pt and title +8 pt low; the expand and glossary-book nav icons were drawn in accent (they picked up the global tint).
- Fixed: `ComposerLink` padding (as above); nav icons set to `glassInk`.
- Now: within 1.5 pt (title 30/1.15 lines 34.6 pt apart, as designed).
- Remaining: the system back button and nav row sit about 5 pt lower (system).

### 3. Piece page, mid-scroll (§4.3)
- Found: the reading focus never turned on. `scrollPosition(id:anchor:)` reported blocks other than stops, so no stop got the active state and nothing faded.
- Fixed: new `StopTracker` (PieceScreen) that tracks each stop's frame in scroll-view space. The reading line is the centre of the area below the nav bar, and the tracker is active only inside the current movement's stop list. The movement's summary, main ideas, notice and notes fade to `ink3` (glossary terms stay accent). Passed untimed stops draw their ring at 0.4 opacity.
- Now: one active card (white, shadow, filled dot), with neighbours dimmed as in the frame. Verified across movements I–IV, and the docked switcher follows.
- Remaining: none.

### 4. Piece page, full scroll (§4.4)
- Found: the "In one line:" prefix was missing from the big-picture summary (the data holds only the sentence). The main-ideas hairline was as wide as the text, not the column.
- Fixed: new string key `piece.bigPicture.inOneLine` (EN/TR); full-width hairlines.
- Remaining: movement-table rows are 68 pt instead of 70 (Literata 15 natural line height, about 1 pt per row). The designer's "pins under the nav bar" annotation is a canvas note and is not built, which is correct. The canvas shows "Opens the recordings sheet." under the recordings card; that is a designer annotation, not UI copy.

### 5. Listening-stop variants (§4.5)
- Reviewed in the mid-scroll and full-scroll passes: single time ("≈ 4:30"), range ("≈ 1:00 to 2:30") and the untimed variant (italic label such as "Immediately after", hollow accent dot) all render as specified.
- Remaining: none. In the frame the untimed stop is last in its stack, so it has no rail below it. In the app the rail continues when another stop follows, which is correct.

### 6. Glossary sheet (§4.6)
- Now: title Literata 24/1.2 (with the new line-height treatment), definition and link within 2 pt. The height is measured from the content.
- Remaining: floating iOS 26 sheet instead of edge-to-edge (system).

### 7. Recordings sheet (§4.7)
- Now: header, reference badge, Literata performer line, label/year and capsule buttons match the type and colour specs.
- Remaining: the first row starts about 3 pt higher relative to the header (SF line-box distribution), which is within tolerance. Content differs from the canvas placeholders: the app lists the piece's real recordings and shows "Not on Spotify" when a recording has no link. The footnote is product copy; the canvas text there is a designer note. Floating medium sheet (system).

### 8. Composer sheet (§4.8)
- Now: portrait 300 pt, caption, name block (Literata 30/1.15), facts card and dates within 1 pt of the frame. Facts-card values sit about 1.5 pt high, and the bio starts about 3.5 pt higher (the card comes out about 2 pt shorter because of SF line boxes).
- Fixed: the "In DailyClassical" hairline now spans the column.
- Remaining: fact values wrap differently ("27 January / 1756, Salzburg"). iOS's standard line-break strategy avoids single-word last lines and CSS does not. The data has no non-breaking spaces; this is system typography. The sheet's top edge sits at about 62 instead of 72 (system large detent).

### 9. Library › Glossary (§4.9)
- Found: the index rail was centred vertically (spec: fixed beside the search field, top 230). Definitions were cut to one line (the canvas shows up to two lines of the short summary). The bottom fade was missing.
- Fixed: the rail is pinned at the top next to the search field. Definitions show up to 2 lines at SF 13/1.4. Bottom fade 150 pt, solid at 70 %.
- Remaining: there is no separate `short` field in the data, so the two-line clamp is applied to the full definition. The back control is the system chevron, not the "‹ Library" pill.

### 10. Paywall (§4.10)
- Found: shown as a large sheet, so the painting started below a sheet grabber gap instead of under the status bar. The title had no 1.15 line height. Restore had about 13 pt of extra space above and below. The CTA block was not pinned to the bottom (it ended about 40 pt above the spec'd 40 pt bottom padding).
- Fixed: presented as a full-screen cover (`RootView`, via a split `sheet` / `fullScreenCover` binding on `router.sheet`). Title Literata 28/1.15. Restore spacing. The minimum content height includes the top safe area, so the bottom block pins to the screen bottom (Terms 41.5 pt from the bottom, as designed). Close button aligned with the nav row.
- Now: caption, title, subtitle, benefits, CTA, Restore and Terms/Privacy within 2.5 pt.
- Remaining: the canvas's third benefit "Open benefit line (to confirm)" is a placeholder and is not shipped, so the plan cards sit 20 pt higher. Prices show "—" in the simulator because StoreKit products don't load without a StoreKit configuration. The caption says "Hamburger Kunsthalle" where the canvas says "Kunsthalle Hamburg" (content string).

### 11. Library, locked (§4.11)
- Found: the bottom fade was missing.
- Fixed: 150 pt fade, solid at 60 %.
- Now: header, segmented control, chips and rows within 1 pt. Locked rows show the lock, with full painting and title.
- Remaining: row order and paintings follow the published library, not the canvas's sample list.

### 12. Search (§4.12)
- Free user (the review account): the Search tab presents the paywall, and behind it a locked empty state.
- Fixed: the empty state title has a 1.2 line height and the no-icon (search-empty) variant uses a 10 pt gap. Results padding is now 22 pt below the search row (was 12).
- Not reviewed: the premium results state. It needs a premium account, and the local API on :3100 that handles sign-in is down. The native `.searchable` field sits at the bottom of the search tab (iOS 26 default), which SPEC §4.12 flags for design review.

### 13. Settings (§4.13)
- Found: separators were inset from the card's leading edge. Spacing between groups was looser than designed.
- Fixed: separators start at the card edge. Header insets tightened.
- Remaining (system inset-grouped list): header→card is 10.7 pt (design 7). The gap between groups is about 27 pt (design 24.5). Title→first header is about 30 pt (design 19.5). `listSectionSpacing` and negative padding have no effect on these. The trailing separator inset belongs to the system accessory. System chevrons are lighter than the design's `ink3` chevron. A 1.1 line height on the large title clips its descenders inside a List row, so it was left at the natural height. The guest Account row shows "Sign in", as SPEC §7 specifies.

### 14. Artwork viewer (§4.14)
- Found: "· Public domain" was always appended, whatever the rights. The close button sat on the image with no separation.
- Fixed: the rights text is shown only when `rightsStatus == "public_domain"` (localized via `L10n`). The close button gets a subtle shadow over the image and is aligned with the nav row (top 4 below the safe area).
- Now: caption block (artist, italic title and year, details) within 1 pt relative to the bottom. The image is uncropped and vertically centred.
- Remaining: none.

### 15. Onboarding 1 and 2 of 2 (§4.15–4.16)
- Step 1 found: the sign-in link sat 12 pt too far below Continue (the 44 pt link frame), and the bottom padding was too big.
- Step 1 fixed: link spacing (Continue → link 18.3 pt, design 19) and bottom inset (link 45.7 pt from the screen bottom, design 44).
- Step 2 found: the text block was 13 pt low (the padding assumed a 47 pt status bar). An implicit ScrollView stack added 12 pt above the wheel card. "Not now" sat 13 pt too low. The wheel had a ":" separator and wide columns that are not in the design.
- Step 2 fixed: the scroll view runs under the status bar with 140 pt top padding, so the block sits at 142.3 (design 143.5) on any device. The stack is explicit, so the card is 40 pt below the body (335.3 vs 335.5). "Not now" spacing fixed. The separator is removed and the columns narrowed (58 pt each).
- Now: the bottom block is bottom-anchored as designed (button 76 pt from the bottom, design 76.5).
- Remaining: the system wheel draws one pill per column instead of one full-width band, and the minutes column doesn't wrap (00 has nothing above it). SPEC §3.21 accepts the system wheel as "close enough". The step 1 sheet floats (system).

## Also checked (outside 1–15)
- Sign-in prompt (§4.17 frame 2): the sheet sat at medium height with about 100 pt of empty space. It now measures its content (onGeometryChange) and the "Not now" rhythm is fixed, so it matches the frame within a few points.
- Create account (§4.17 frame 3): the header, form card, hint, CTA and legal line line up within 1–5 pt. The bottom link follows the system large-detent height.

## Not done / follow-ups
- Premium Search results and signed-in states (Account row with email, Favourites) need a premium or signed-in session. The sign-in API was down during this review.
- Dark mode and Reduce Transparency variants were not part of this pass.
