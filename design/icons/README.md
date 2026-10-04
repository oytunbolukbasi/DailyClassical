# DailyClassical icon set

Extracted from the full design export `design/DailyClassical2.html`. The set covers every inline SVG used on a screen, plus the designer's icon sheet in section 06 "Tokens, components, icon set". There are 23 files: 22 shapes, with the heart in an outline and a filled form.

Designer's rule (section 06, verbatim): *"Icon set · 24 pt, 1.75 stroke, round caps, currentColor"*. *"Line icons, no fills. On clear glass a filled glyph would read as a dark blot against the painting, so every icon is a single-weight outline; the selected tab gets a 12% ink capsule behind it rather than a filled variant. Icons are always glass-ink; umber is never used on an icon except the saved heart, the one filled glyph in the set (a state, not a symbol)."*

All files use `stroke="currentColor"`, so they take the foreground colour of their container (`glassInk`, `accent`, `ink3`…). In practice, `accent` also appears on content icons that are not on glass: paywall checks, the empty-state heart and the mail icon. The brief asks for custom icons, not SF Symbols.

**Xcode:** import as SVG into the asset catalog with "Preserve Vector Data" on and Render As: **Template Image**. Use `Image("tab-today").foregroundStyle(...)`, and size with `@ScaledMetric` so icons follow Dynamic Type. Stroke widths are baked into the 24-unit viewBox, so they scale with the rendered size. The design sometimes asks for a different stroke at a given size; those cases are noted below. Export a variant if pixel-exact strokes matter.

| File | Sheet name | viewBox | Stroke | Cap / join | Rendered size(s) | Where it is used |
|---|---|---|---|---|---|---|
| `tab-today.svg` | today | 24 | 1.75 | round / round | 24 | Tab bar, Today |
| `tab-library.svg` | library | 24 | 1.75 | round / round | 24 | Tab bar, Library |
| `tab-settings.svg` | settings | 24 | 1.75 | round / round | 24 | Tab bar, Settings |
| `search.svg` | search | 24 | 1.75 | round / round | 24 (search tab circle); 18 @ 60 % opacity (search fields) | Search tab button; Search, Library › Glossary and Search-empty fields |
| `glossary-book.svg` | glossary | 24 | 1.75 | round / round | 22 (44 pt glass button, mid-scroll Piece bar); 14 (Library "Glossary" chip) | Glossary |
| `lock.svg` | lock | 24 | 1.75 | round / round | 18 (Library rows), 16 (Search rows), stroke `ink3` | Locked premium item (replaces the chevron) |
| `expand.svg` | artwork | 24 | 1.75 | round / round | 22 in a 44 pt glass button | Opens the artwork viewer (Piece top bar) |
| `open-external.svg` | open | 24 | 1.75 | round / round | — | **Sheet only**, not placed on any screen. Likely for "Open in Spotify" / external links |
| `chevron-back.svg` | back | 24 | 1.75 | round / round | 22 (44 pt back button); 20 (back pills "‹ Library", "‹ Settings") | Navigation back |
| `chevron-forward.svg` | chevron | 24 | 1.75 | round / round | 20, `ink3` | Recommended-recordings card (Piece page) |
| `chevron-forward-small.svg` | — | 8×14 | 2 | round / round | 8×12 @ 70 % in `accent` (composer link); 8×14 in `ink3` (Settings, Account, Glossary and open Library rows) | Composer link, disclosure indicator |
| `chevron-down.svg` | — | 24 | 2.2 | round / round | 12 | "Composer ⌄" / "Era ⌄" filter chips |
| `close.svg` | close | 24 | 2.2 at 16 pt (sheet close in a 34 pt circle); 2 at 18 pt (paywall and artwork viewer, 44 pt glass); 1.75 in the sheet | round / none in screens (file keeps no join) | 16, 18 | Close a sheet, paywall or viewer. The file uses 2.2, the screen stroke at 16 pt |
| `checkmark.svg` | check | 24 | 2 (1.75 in the sheet) | round / round | 18, stroke `accent` | Paywall benefit list |
| `reminder.svg` | reminder | 24 | 1.75 | round / round | — | **Sheet only.** Daily reminder (bell); suggested for Settings › Daily reminder or onboarding |
| `share.svg` | share | 24 | 1.75 | round / round | — | **Sheet only.** No share action is placed on any screen |
| `offline.svg` | offline | 24 | 1.75 (1.5 at 32 pt on screen) | round / round | 32, `ink3` | Today · offline state, centred on the striped image area |
| `info.svg` | info | 24 | 1.75 | round / round | — | **Sheet only.** Suggested for About and credits |
| `heart.svg` | heart | 24 | 1.75 | round / round | 26 in a 44 pt glass button; 36 `accent` in the Favourites empty states | Favourite (not saved); empty-state illustration |
| `heart-fill.svg` | heart · saved | 24 | fill, no stroke | — | 26 in `accent` (Piece nav after saving; trailing control in Favourite rows) | Favourite (saved). The only filled glyph |
| `eye.svg` | reveal | 24 | 1.75 | round / round | 20, `ink3` | Show password (Sign in, Create account) |
| `mail.svg` | mail | 24 | 1.75 (1.5 at 32 pt on screen) | round / round | 32, `accent` | "Check your email" sheet |
| `arrow-right.svg` | — | 24 | 1.75 | round / round | 24 | **Canvas annotation only**: the step arrows between the section-07 frames. Not app UI |

## Not in the design (do not invent)

- **Spotify mark**: no SVG exists. Every "Open in Spotify" button is text only. The designer notes say: "The Spotify mark is a placeholder until the official asset is dropped in" and "The official Spotify mark goes in once the asset is dropped in." Use the official asset and follow the [Spotify Design Guidelines](https://developer.spotify.com/documentation/design).
- **Eye-slash** (password visible) is not drawn; only "reveal" exists.
- **Play / pause / waveform**: absent by design. The "Play" pill in the section-06 glass demo is a sample label, not an app control.
