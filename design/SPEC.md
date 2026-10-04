# DailyClassical — iOS implementation spec (from Claude Design canvas)

Source: **`design/DailyClassical2.html`**, the complete "Bundled Page" export. The canvas markup and its data script were extracted from that file's `__bundler/template` block. It supersedes `design/DailyClassical.dc.html`, which is cut off at 256 KiB. Title: "DailyClassical · Round 1 · iOS 26 / Liquid Glass — All screens, one direction", updated through Round 3 (email sign-in, favourites, two-step onboarding). The canvas wins wherever it differs from `project-knowledge/DailyClassical – Design Brief.md`.

All measurements are in **pt** on a **390 × 844 pt** frame (iPhone 14/15/16 class). "Top" values are measured from the top of the screen, including the status bar. The design places floating bars at **top 58** (status bar ≈ 47 pt + ~11), so treat 58 as `safeAreaInsets.top + 11` on other devices. "Bottom 22" means 22 pt above the physical bottom edge, inside the home-indicator area. The system tab bar handles this itself.

> **Completeness.** The design is fully covered: sections 01–07, 05 States and 06 Tokens/components/icon set, plus the data script for every list. The old truncated export and what it was missing are recorded in [§0](#0-source-files-and-completeness).

---

## Contents
0. [Source files and completeness](#0-source-files-and-completeness)
1. [Designer's global notes (verbatim)](#1-designers-global-notes-verbatim)
2. [Design tokens](#2-design-tokens)
3. [Components inventory](#3-components-inventory)
4. [Screens](#4-screens)
5. [Native SwiftUI mapping vs custom drawing](#5-native-swiftui-mapping-vs-custom-drawing)
6. [Data the UI needs (drives API/data model)](#6-data-the-ui-needs)
7. [Inconsistencies and open questions](#7-inconsistencies-and-open-questions)

---

## 0. Source files and completeness

| File | Status |
|---|---|
| `design/DailyClassical2.html` (≈ 2 MB) | **Authoritative.** A self-unpacking bundle. The canvas is the JSON string in `<script type="__bundler/template">` (416 KB of HTML). Fonts and the device frame are inlined as base64 in `__bundler/manifest`. Bundling only changes serialisation: `viewBox` becomes `sc-camel-view-box` and `onError` becomes `sc-camel-on-error`. After normalising those, sections 01–07 up to "Sign in light" are **byte-identical in content** to the truncated file. The only extra text is one intro note: "**Offline copy.** Fonts and the device frame are embedded; the paintings stay as links to Wikimedia Commons and need a connection (striped placeholders appear otherwise)." |
| `design/DailyClassical.dc.html` (262 144 bytes) | Truncated mid-attribute inside "Sign in dark". Superseded. |
| `design/ios-frame.jsx` | Not in `design/`. It is embedded in the bundle and is only device chrome (status bar, home indicator, keyboard). |
| `design/support.js` | Canvas runtime. Ignored. |

**Content that exists only in the full file**, now specified in this document:
- Section 07, remainder: **Sign in dark**, **Reset password** (L/D), **Check your email** (L/D), **Settings › Account** (L/D), **Delete account · system alert** (L/D), **Library › Favourites · signed in** (L/D), **· guest** (L/D), **· signed in, empty** (L/D). See §4.19–§4.25.
- **Section 05 "States"**: Today loading, Search empty, Today offline (nothing cached), Library row locked vs open, all L/D. See §4.26.
- **Section 06 "Tokens, components, icon set"**: the designer's own token sheet, quoted verbatim in §2.8, plus 8 icons that are not used on any screen (open, reminder, share, offline, info, mail…).
- **Data script** (`<script type="text/x-dc" data-dc-script>`): `w: 390, h: 844`; `hideImg` (image error hides the `<img>`, revealing the stripe); `movements` (4), `stops` (Movement I stops 1–10), `favourites` (3), `glossary` (13), `library` (10). Its only Tweak prop is `textSize: 'default' | 'large'` (section "Reading"), which sets `body[data-ts]`. Values are quoted in the relevant screens below.

All light/dark pairs, including the new ones, use identical markup; only the CSS variables differ (checked by diff).

---

## 1. Designer's global notes (verbatim)

Canvas intro:

- **"Assumptions.** 390×844 pt frames. Serif: Literata (titles, reading text). Sans: the system font (SF) for labels, tables, buttons. Accent: umber [#6B4A2B] in light, warmed to [#D4AE84] in dark so body-text contrast stays above 4.5:1. Paintings are real public-domain works from Wikimedia Commons."
- **"Glass.** Only bars and controls are glass: tab bar, nav pills, movement switcher, primary button, sheets. Everything the user reads sits on solid paper or ink. All glass is neutral and clear; the primary button is distinguished by size, position and a specular highlight, not by tint. Umber is reserved for text: labels, links, glossary terms, the active icon. The blur here stands in for the system material."
- **"Pairs.** Every screen is shown light and dark side by side. The text-size tweak enlarges reading text on all of them at once (Dynamic Type check)."
- **"Open.** Movements II–IV are shown as template slots (copy not yet written). Recordings 2 and 3 are placeholders. The artwork viewer is always black, so it appears once. The Spotify mark is a placeholder until the official asset is dropped in."
- Round note: "Round 3: email sign-in, favourites, and a two-step onboarding that opens on a live piece. Section 07."

Section captions:

- **01 Today**: "Painting runs under the status bar. The date lives in its own glass chip at the top, apart from the piece; the clear-glass primary floats on the painting’s lower edge."
- **02 Piece page**: "Top in light and dark, a mid-scroll frame with the floating switcher, and the full scroll unrolled with all eleven Movement I stops."
- **03**: "Listening stop variants · Glossary · Recordings · Composer sheet · Library glossary · Paywall" (no caption).
- **04**: "Library (free user) · Search · Settings · Artwork viewer · Onboarding" with the note "Library now has an All / Favourites switch; Settings has an Account row."
- **04 Onboarding · two steps**: "Opens on today’s piece, already loaded; one card explains the idea, one asks for a reminder time. Nothing else before the app."
- **07 Favourites and account**: "Email + password only. The heart is the only thing that asks you to sign in; everything else stays open. The Account page under Settings holds sign-out and delete."
- **05 States**: "Loading · empty · offline · locked. Shown as the content area only."
- **06**: "Tokens, components, icon set" (no caption; its notes are quoted in §2.8).
- Canvas footer: "Try next: “dark versions of Library, Settings and the paywall side by side” · “a second Today layout with the button under the title” · “write Movement II–IV content into the template”." These are designer suggestions only; none of them is designed.

Note on the canvas itself: page background `#E9E5DE`, section numbers and frame labels belong to the canvas, not the app.

---

## 2. Design tokens

### 2.1 Colour

Every light/dark pair in the file uses identical markup; only these variables change. Suggested Swift names refer to an asset-catalog colour set with Any/Dark appearances, plus a "High Contrast" appearance where noted.

| CSS var | Swift token | Light | Dark | Reduce Transparency + Increase Contrast (light, from the Today RT frame) | Use |
|---|---|---|---|---|---|
| `--bg` | `Color.dcBackground` | `#F5F2EC` (paper) | `#111010` (ink) | `#F5F2EC` | Screen background; large-detent sheet background; text colour on selected segment |
| `--surface` | `Color.dcSurface` | `#FFFFFF` | `#1C1A18` | `#FFFFFF` | Cards, grouped lists, plan cards, form card; RT primary button fill |
| `--ink` | `Color.dcInk` | `#1E1B17` | `#F0EBE3` | same | Primary text |
| `--ink2` | `Color.dcInk2` | `#5E5852` | `#B3ABA1` | same | Secondary text, section labels, meta lines |
| `--ink3` | `Color.dcInk3` | `#8A837B` | `#7D766E` | same | Tertiary text: captions, footnotes, disclosure chevrons, lock icon, faded stops |
| `--rule` | `Color.dcRule` | `rgba(30,27,23,0.12)` | `rgba(240,235,227,0.12)` | same | Hairlines, card outlines (0.5 pt ring), separators |
| `--accent` | `Color.dcAccent` | `#6B4A2B` (umber) | `#D4AE84` (warm sand) | same | Links, composer link, glossary terms, stop times, section numerals, active timeline dot, search match highlight, selected plan ring |
| `--tint` | `Color.dcTint` | `#6B4A2B` | `#D4AE84` | same | Fill of solid primary buttons (paywall, onboarding, auth, "Open in Spotify" on the reference recording row) |
| `--tint-ink` | `Color.dcOnTint` | `#FFFFFF` | `#1E1B17` | same | Text on `tint`; "Best value" badge text |
| `--glass` | `Color.dcGlassFill` (fallback only) | `rgba(255,255,255,0.55)` | `rgba(58,54,50,0.50)` | **`#F5F2EC` (opaque)** | Fill of neutral glass chips/bars. Native: `.glassEffect()` |
| `--glass-ink` | `Color.dcGlassInk` | `#1E1B17` | `#F0EBE3` | `#1E1B17` | Foreground on glass; selected segment fill |
| `--glass-edge` | `Color.dcGlassEdge` | `rgba(255,255,255,0.70)` | `rgba(255,255,255,0.18)` | **`rgba(30,27,23,0.18)`** | 0.5 pt inner stroke of glass (1 pt under RT) |
| `--glass-shadow` | `Shadow.dcGlass` | `0 1 3 rgba(0,0,0,.08)` + `0 6 18 rgba(0,0,0,.08)` | `0 2 6 rgba(0,0,0,.35)` + `0 8 24 rgba(0,0,0,.30)` | `0 2 8 rgba(0,0,0,.12)` (bars) | Glass elevation |
| `--glassfx` | material | `blur(18px) saturate(1.6)` | same | `none` | Stand-in for the system glass material |
| `--skel` | `Color.dcSkeleton` | `rgba(30,27,23,0.08)` | `rgba(240,235,227,0.08)` | n/a | Skeleton blocks in loading states (§4.26) |
| `--danger` | `Color.dcDanger` | `#B3261E` | `#F28B82` | n/a | Destructive text: the "Delete account" row and the alert's "Delete" button (§4.21–4.22) |
| `--stripe` | `Color.dcImagePlaceholder` (pattern) | `repeating-linear-gradient(135deg, #DDD7CE 0 6px, #E8E3DB 6px 12px)` | `… #262320 0 6px, #1C1A18 6px 12px` | n/a | Placeholder behind images while loading or on failure; also the "template slot" boxes. Draw as 135° diagonal stripes, 6 pt bands, or use a flat `#E3DED6` / `#211E1B` |

**Derived colours** (CSS `color-mix(in oklab, …)`). Implement as opacity:

| Expression | Swift | Use |
|---|---|---|
| `glass-ink 12%` (14 % under RT) | `dcGlassInk.opacity(0.12)` | Selected tab capsule in the tab bar |
| `glass 70% + glass-ink 14%` | `dcGlassInk.opacity(0.14)` over glass | Pressed state of a glass icon button (the heart while being tapped) |
| `ink 8%` | `dcInk.opacity(0.08)` | Sheet close-button circle; secondary buttons ("Sign in" in the prompt, recording rows 2–3) |
| `ink 6%` | `dcInk.opacity(0.06)` | Time-picker selection band |
| `accent 18%` | `dcAccent.opacity(0.18)` | 4 pt halo ring around the current listening-stop dot |
| `accent 14%` | `dcAccent.opacity(0.14)` | Highlight behind a glossary term while its sheet is open |
| `surface 88%` | `dcSurface.opacity(0.88)` + material | Small/medium glass sheets (fallback). Native sheets are already glass |

**Fixed colours (not themed)**

| Value | Use |
|---|---|
| `#000000` | Artwork viewer background (always black) |
| `#F0EBE3` / `#B3ABA1` | Artwork viewer caption (primary / secondary): the dark ink values, used in both themes |
| `rgba(58,54,50,0.5)` + edge `rgba(255,255,255,0.18)` | Dark glass close button over imagery (artwork viewer, composer sheet). Use dark glass in both themes |
| `rgba(255,255,255,0.7)` | Grabber when drawn over a photo (composer sheet) |
| `rgba(0,0,0,0.18)` | Scrim behind every sheet in the mock (native sheets supply their own dimming) |

**Designer's RT rule (section 06, verbatim):** "Reduce Transparency. Both become solid surface with a 1 pt outline; the primary keeps its shadow." The light Today RT frame fills the glass with `bg` (#F5F2EC). The rule says `surface`; prefer the rule (#FFFFFF light / #1C1A18 dark). **Dark RT/IC** is not drawn. The canvas's own CSS fallback (`body[data-rt="1"]`) sets `--glass: var(--surface)`, `--glass-edge: var(--rule)`, no blur. Dark RT values are therefore: glass `#1C1A18`, edge `rgba(240,235,227,0.12)`. *Suggestion:* raise the edge to ≈ 0.24 for Increase Contrast, to match the light frame, which nearly doubles its rule alpha (0.12 → 0.18) and uses a 1 pt stroke.

### 2.2 Typography

Two families:
- **Literata** (Google Fonts, variable, optical size 7–72). Weights used: 400, 500, 600 (600 only on the selected movement numeral), and italic 400. Bundle `Literata[opsz,wght].ttf` and `Literata-Italic[opsz,wght].ttf`. A 500 italic is also used (no-time stop label). Bundle the italic variable font, or synthesize the weight.
- **SF Pro** (system): `-apple-system`. Use `.system(size:weight:)`. The canvas also uses `ui-monospace` in a few designer-only placeholders (not shipping UI).

**Dynamic Type:** reading text uses CSS vars `--rs`/`--rl`: default **17 pt / 1.6**, "large" tweak **20 pt / 1.55**. Use `Font.custom("Literata", size: 17, relativeTo: .body)` and scale line spacing. Every other size should also be `relativeTo:` its nearest text style.

Line spacing: CSS line-height × size − size = extra leading. E.g. 17/1.6 → line height 27.2 → SwiftUI `.lineSpacing(10.2)`. On iOS 26, `.lineHeight(.multiple(1.6))` also works if available.

Letter-spacing: CSS `em` × size → `.tracking(pt)`. E.g. 0.1em at 12 pt → `.tracking(1.2)`.

| Swift token | Family | Size | Weight | Line height | Tracking | Style / case | Used for |
|---|---|---|---|---|---|---|---|
| `display` | Literata | 34 | 500 | 1.1 | −0.01em (−0.34) | | Large titles on tab roots: "Library", "Settings", "Glossary" |
| `titleXL` | Literata | 30 | 500 | 1.15 | −0.01em (−0.3) | | Piece title (Piece page), composer name (Composer sheet), onboarding headlines, auth sheet titles |
| `titleL` | Literata | 28 | 500 | 1.15 | −0.01em | | Paywall "More of this.", sign-in prompt "Keep the pieces you love" |
| `titleToday` | Literata | 27 | 500 | 1.2 | −0.01em | | Piece title on Today |
| `dateNumeral` | Literata | 24 | 500 | 1.0 | −0.02em (−0.48) | | Day number in the date chip |
| `titleM` | Literata | 24 | 500 | 1.25 (1.2 in sheets) | 0 | | Movement tempo heading; sheet titles "Sonata form", "Recordings" |
| `price` | Literata | 22 | 500 | normal | 0 | | Plan price |
| `hookL` | Literata | 19 | 400 | 1.45 | 0 | *italic*, ink | Hook on the Piece page |
| `hookM` | Literata | 17 | 400 | 1.45 | 0 | *italic*, ink2 | Hook on Today |
| `reading` | Literata | **17 (`--rs`)** | 400 | **1.6 (`--rl`)** | 0 | | All reading prose: big picture, summaries, threads, things to notice, glossary definitions, composer bio |
| `readingItalic` | Literata | `--rs` | 400 | `--rl` | 0 | italic, ink2 | "In one line: …" map of movements |
| `stopHear` | Literata | `--rs` | 500 | 1.4 | 0 | | Listening-stop "What you hear" |
| `themeName` / `rowTitleReading` | Literata | `--rs` | 500 | normal (1.3 in recordings rows) | 0 | | Main-idea theme names, recording performer lines |
| `rowTitle` | Literata | 17 | 500 | 1.3 | 0 | | Glossary list term |
| `rowTitleS` | Literata | 16 | 500 | 1.3 | 0 | | Library row title; movement numeral in the table (accent) |
| `rowTitleXS` | Literata | 15 | 500 | normal | 0 | | Search results, the "In DailyClassical" row, movement tempo in the table, glossary letter (accent), movement switcher numerals (600 when selected) |
| `artCaptionSerif` | Literata | 17 | 500 / italic 400 | normal | 0 | | Artwork viewer artist / title |
| `noTimeLabel` | Literata | 12 | 500 | normal | 0 | *italic*, ink2 | Stop without a time ("Mid-development") |
| `button` | SF | 17 | 600 | normal | −0.2 | | Primary buttons (glass and solid) |
| `body17` | SF | 17 | 400 | normal | −0.2 (Settings) / 0 | | Settings rows, search field text, form values, "Cancel" |
| `composerLink` | SF | 17 | 500 | normal | −0.2 | accent | Composer link (Piece page) |
| `composerLinkToday` | SF | 15 | 500 | normal | 0 | accent | Composer link (Today) |
| `body15` | SF | 15 | 400 | 1.5 (1.45 in stops, 1.4 in benefits) | 0 | | Secondary paragraphs, "What is happening", main-idea descriptions, sheet subtitles, form labels, auth links, benefits |
| `navPill` | SF | 15 | 500 | normal | 0 | | "‹ Library" back pill |
| `meta14` | SF | 14 | 400 | normal | 0 | ink2 | Piece header meta "1893 · About 46 minutes"; table durations; "Restore purchases" on the paywall |
| `chip` | SF | 14 | 500 | normal | 0 | | Filter chips, segmented control, toast |
| `buttonS` | SF | 14 | 600 | normal | 0 | | Small capsule "Open in Spotify" in the recordings sheet |
| `meta13` | SF | 13 | 400 | normal (1.45 for notes) | 0 | ink2 | Meta/sub-lines, "Times are approximate…", Settings section headers (uppercase, +0.02em), "See all terms in Library ›" |
| `planName` | SF | 13 | 600 | normal | 0 | | Plan card name |
| `caption` | SF | 12 | 400 | 1.4 (1.45–1.5 for notes) | 0 | ink3 | Painting caption, footnotes, legal, plan detail, Sources |
| `sectionLabel` | SF | 12 | 600 | normal | **+0.1em (1.2)** | UPPERCASE, ink2 | "The big picture", "Movements", "Listening stops", "Main ideas"… |
| `stopTime` | SF | 12 | 600 | normal | +0.04em (0.48) | accent | Listening-stop time "≈ 4:30" |
| `dateChipLabel` | SF | 11 | 600 (2nd line 500 @ 70 %) | 1.1 | +0.04em | UPPERCASE | "SATURDAY / OCTOBER 2026" |
| `eyebrow` | SF | 11 | 600 | normal | +0.14em (1.54) | UPPERCASE, accent | "LAST THING" (onboarding 2) |
| `badgeLabel` | SF | 11 | 600 | normal | +0.08em | UPPERCASE, accent | "REFERENCE RECORDING" |
| `factLabel` | SF | 11 | 400 | normal | +0.06em | UPPERCASE, ink3 | Composer fact labels |
| `recordingsNote` | SF | 11 | 400 | 1.5 | 0 | ink3 | Spotify note at the bottom of the recordings sheet |
| `tabLabel` | SF | 10 | 500 (600 selected) | normal | 0 | | Tab bar labels |
| `planBadge` | SF | 10 | 600 | normal | +0.06em | UPPERCASE, on tint | "BEST VALUE" |
| `indexRail` | SF | 10 | 600 | normal | 0 | accent | A–Z rail in Glossary |
| `pickerNumber` | SF | 23 | 400 (500 selected) | normal | 0 | tabular nums | Onboarding time wheel |

Tabular figures (`.monospacedDigit()`) are used for movement durations and the time picker.

### 2.3 Spacing

The scale observed (pt): **1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 13, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 40, 44, 48, 56**.

| Swift token | Value | Typical use |
|---|---|---|
| `Spacing.pageGutter` | **24** | Left/right page margin for all reading content |
| `Spacing.barInset` | **16** | Left/right inset of floating bars, nav buttons, search row, Settings groups |
| `Spacing.barTop` | **58** | Top of floating glass buttons/chips (= safe top + 11) |
| `Spacing.largeTitleTop` | **66** | Top padding before large titles (Library, Settings, Search field) |
| `Spacing.sectionGapL` | 40–44 | Gap before major sections (Movements I header 40, Movement II 44, Threads 44, Recordings 40, Sources 40) |
| `Spacing.sectionGapM` | 28–34 | Big-picture divider 28, Main ideas 30, Listening stops 34, Things to notice 34, Movements table 32 |
| `Spacing.stack` | 14 | Default vertical stack gap (stops list, glossary rows block, sheets) |
| `Spacing.cardPadding` | 16 v × 18 h | Listening-stop cards, recordings card, composer facts card |
| `Spacing.rowPaddingV` | 12–13 | List rows (Library 12, Glossary/Movements 13) |
| `Spacing.tabBarBottom` | 22 | Floating tab bar / primary button distance from the bottom edge |

### 2.4 Corner radii

| Token | Value | Use |
|---|---|---|
| `Radius.pill` | 999 (capsule) | All glass controls, buttons, chips, segmented control, toast, search field |
| `Radius.sheet` | **38** (top corners) | All sheets |
| `Radius.groupedList` | **22** | Settings groups, onboarding time-picker card |
| `Radius.card` | **16** | Listening-stop cards, movement table, recordings card, plan cards, composer facts, auth form card, template-slot boxes |
| `Radius.pickerBand` | 10 | Time-picker selection band |
| `Radius.thumbM` | 8 | Library thumbnails (64 pt) |
| `Radius.thumbS` | 6 | Search / composer-sheet thumbnails (40 / 44 pt) |
| `Radius.termHighlight` | 4 | Active glossary term background |
| `Radius.grabber` | 2.5 | 36×5 grabber |

Use `.continuous` corner style for all of them.

### 2.5 Shadows and strokes

| Token | Recipe | Use |
|---|---|---|
| `Stroke.cardRing` | 0.5 pt `rule`, drawn as an outer ring (`box-shadow: 0 0 0 .5px`) | All solid cards and grouped lists. SwiftUI: `.overlay(RoundedRectangle(...).strokeBorder(dcRule, lineWidth: 0.5))` |
| `Shadow.stopCurrent` | ring 0.5 `rule` + `0 6 20 rgba(0,0,0,0.06)` | The "current" listening-stop card only |
| `Shadow.glass` | see `--glass-shadow` above | Glass chips, bars, nav buttons (fallback) |
| `Shadow.primaryGlass` | inset `0 1 0 rgba(255,255,255,.6)` (top specular line), inset 0.5 pt `rgba(255,255,255,.4)` ring, `0 1 3 rgba(0,0,0,.08)`, `0 8 20 rgba(0,0,0,.10)` | Glass primary button |
| `Shadow.sheet` | inset `0 .5 0 glass-edge` (top hairline) + `0 −8 30 rgba(0,0,0,.18)` | Sheets (mock). Native sheets provide their own |
| `Shadow.rtControl` | 1 pt `glass-edge` inner stroke + `0 2 8 rgba(0,0,0,.12)` | Glass controls under Reduce Transparency |
| `Shadow.rtPrimary` | 1 pt `rgba(0,0,0,.25)` ring + `0 2 8 rgba(0,0,0,.12)` | Primary button under RT |
| `Stroke.selectedPlan` | 2 pt `accent` ring | Selected plan card |
| `Stroke.hairline` | 1 pt `rule` (section dividers, list row tops); **0.5 pt** `rule` inside Settings/form cards | Separators |

### 2.6 Glass recipes and which surfaces are glass

**Rule (designer):** only bars and controls are glass. Everything read is solid. Never stack glass on glass. Glass is neutral; there is no tinted glass.

| Recipe | Spec (mock) | Native |
|---|---|---|
| **G1 Neutral glass** (chips, nav buttons, segmented control, tab bar, search button, toast, search fields, movement switcher) | fill `--glass`; backdrop `blur(18) saturate(1.6)`; inner 0.5 pt stroke `--glass-edge`; shadow `--glass-shadow`; foreground `--glass-ink` | `.glassEffect(.regular, in: .capsule)` (or `.circle`); group adjacent glass in a `GlassEffectContainer` |
| **G2 Primary clear glass** ("Start listening", "Open in Spotify") | fill vertical gradient `rgba(255,255,255,.42)` → `.26` at 55 % → `.30` at 100 %; backdrop `blur(20) saturate(1.6)`; `Shadow.primaryGlass`; **specular highlight**: a capsule inset 18 pt left/right, 2 pt from the top, 10 pt tall, gradient `rgba(255,255,255,.4)` → 0; text `glass-ink` 17/600, −0.2. **The same white gradient is used in dark mode** (text becomes `#F0EBE3`) | `.buttonStyle(.glass)` with `.controlSize(.extraLarge)`, or `.glassEffect(.clear.interactive(), in: .capsule)`. The system specular replaces the hand-drawn highlight. The design says it is distinguished "by size, position and a specular highlight, not by tint", so do **not** use `.glassProminent` with a tint. |
| **G3 Sheet glass** (small/medium detents: glossary, recordings, onboarding 1, sign-in prompt) | fill `surface @ 88 %` + blur; top radius 38; top hairline `glass-edge` 0.5 pt | Native `.sheet` with `.presentationDetents`. Glass background comes for free on iOS 26 for partial-height detents |
| **G4 Dark-over-image glass** (close buttons on the artwork viewer and composer portrait) | fill `rgba(58,54,50,.5)`, blur, edge `rgba(255,255,255,.18)`, icon `#F0EBE3`; artwork viewer adds `0 2 6 rgba(0,0,0,.35)` | `.glassEffect(.regular, in: .circle)` + `.environment(\.colorScheme, .dark)` |
| **RT fallback** | glass → opaque: light fill `#F5F2EC`, 1 pt edge `rgba(30,27,23,.18)`, shadow `0 2 8 rgba(0,0,0,.12)`; primary → solid `surface` capsule, **50 high, 24 h-padding**, 1 pt `rgba(0,0,0,.25)` ring; selected-tab fill 14 %; inactive tab opacity 0.8 (instead of 0.7) | System glass handles this automatically. Only custom-drawn fallbacks need `@Environment(\.accessibilityReduceTransparency)` |

| Surface | Glass or solid |
|---|---|
| Tab bar (3 tabs) + separate search button | Glass G1 |
| Date chip (Today) | Glass G1 |
| Nav buttons: back, heart, expand, glossary; "‹ Library" pill | Glass G1 |
| Movement switcher | Glass G1 |
| Library segmented control, filter chips, search fields | Glass G1 |
| Toast "Saved to Favourites" | Glass G1 |
| Start listening / Open in Spotify (floating) | Glass G2 |
| Glossary, recordings, onboarding-1 and sign-in-prompt sheets | Glass G3 |
| Composer sheet, Create account sheet, Sign in sheet (large detent) | **Solid `--bg`** (radius 38, top hairline) |
| Paywall | **Solid** full-screen sheet; only its close button is glass |
| Listening-stop cards, movement table, recordings card, plan cards, Settings groups, form cards, picker card | **Solid `--surface`**, "never glass" |
| Paintings | Content, edge to edge, running under bars |
| Solid tint buttons (Continue, Create account, Sign in, Remind me, small Open in Spotify) | Solid `--tint`, not glass |

### 2.7 Motion

- Listening-stop reading-focus transition: **200 ms ease-out**. It is **off under Reduce Motion**; all stops then render full ink. See §3.6.
- Nothing else is specified. The brief asks for "soft transitions between movements, a gentle sheet". Use system sheet/navigation animations.
- The movement switcher "pins under the nav bar once the movements begin". See §4.5.

### 2.8 Designer's token sheet (section 06, verbatim)

Swatches: **Light**: "bg F5F2EC · surface FFF · ink 1E1B17 · ink2 5E5852 · accent 6B4A2B". **Dark**: "bg 111010 · surface 1C1A18 · ink F0EBE3 · ink2 B3ABA1 · accent D4AE84".

Type ramp, with the designer's mapping to iOS text styles. Use these for `relativeTo:`:

| Sample | Note (verbatim) | Swift `relativeTo:` |
|---|---|---|
| Title | "Literata 30/1.15 medium · piece title (Large Title)" | `.largeTitle` |
| Movement | "Literata 24/1.25 medium (Title 2)" | `.title2` |
| Hook | "Literata 19 italic (Title 3)" | `.title3` |
| Reading | "Literata 17/1.6 · Body, Dynamic Type; measure 60–70 ch at 24 pt margins" | `.body` |
| Hear | "Literata 17/1.4 medium · listening-stop headline" | `.body` |
| Secondary | "SF 15/1.45 · “what is happening”, descriptions (Subheadline)" | `.subheadline` |
| Label | "SF 12 semibold, +10% tracking, caps · section labels, time stamps (Caption 1)" | `.caption` |
| Composer › | "SF 17 medium, accent, chevron · tappable, opens the composer sheet" | `.body` |
| Button | "SF 17 semibold · floating primary 54 pt pill, 32 pt side padding, 40 pt above the home indicator with a page-colour fade behind it; in-sheet buttons 52 pt" | `.body` |
| Date chip | "Date chip · Literata 24 numeral + SF 11 caps, in a neutral glass pill; Today only" | `.title2` / `.caption2` |

**Spacing and shape:** "Page margin 24 · section gap 34–44 · card padding 16/18 · list row ≥ 50 · card radius 16 · grouped list radius 22 · sheet radius 38 · all controls are pills (999) · min hit target 44, including glossary terms via 10 pt invisible vertical padding."

**Glass recipe:**
- "**Primary (clear).** Fill white 42→26→30%, blur 20, saturate 1.6; inner rim .5 pt white 40%, top highlight 1 pt white 60% plus a 10 pt specular band at 40%; shadow 1/3 at 8% and 8/20 at 10%. Label is glass-ink (near-black on light, cream on dark). Elevation is what says “primary”: the button is the only control that casts a visible shadow."
- "**Neutral (bars, pills, chips).** Fill white 55% light / warm grey 50% dark, blur 18, saturate 1.6, .5 pt edge, same shadow family at lower strength. No specular band."
- "**Reduce Transparency.** Both become solid surface with a 1 pt outline; the primary keeps its shadow."

**Glass vs. solid** (verbatim):

| Liquid Glass | Solid |
|---|---|
| Tab bar + search circle | Reading text on page background |
| Nav pills (back, artwork, glossary) | Listening-stop cards (surface) |
| Movement switcher | Movement table, grouped lists |
| Primary button (clear glass, specular highlight) | Plan cards, thumbnails, paywall and sheet buttons (solid umber) |
| Filter chips, search field | Paintings (content, run under glass) |
| Sheets: glossary, recordings, paywall, sign-in prompt | Auth forms, favourites list, toasts’ text |
| Heart and artwork pills in the piece nav (separate, 44 pt), toast | Everything with Reduce Transparency on |

Note: the sheet lists the **paywall** as a glass sheet, but the Paywall frame draws a solid `bg` page with only a glass close button. Present it as a system sheet; the glass applies to its edges and chrome, while the content stays solid.

**Buttons swatch** (on a painting, then on paper): "Primary · clear glass" (50 h, 24 padding in the swatch); "Primary · Reduce Transparency" (surface, 1 pt `rgba(0,0,0,.25)` ring + `0 2 8 rgba(0,0,0,.12)`); "Primary · solid, on paper (paywall, sheets)" (tint); "Neutral glass" (44 h, padding 0 20, SF 15/500); "Secondary · solid, on content" (40 h, padding 0 16, `ink @ 8 %`, SF 14/600); "Text link · accent" (SF 15); running text with a dotted-underline glossary term.

**Icon set header:** "Icon set · 24 pt, 1.75 stroke, round caps, currentColor". Note (verbatim): "Line icons, no fills. On clear glass a filled glyph would read as a dark blot against the painting, so every icon is a single-weight outline; the selected tab gets a 12% ink capsule behind it rather than a filled variant. Icons are always glass-ink; umber is never used on an icon except the saved heart, the one filled glyph in the set (a state, not a symbol)." The icon names in the sheet are today, library, settings, search, glossary, lock, artwork, open, back, chevron, close, check, reminder, share, offline, info, heart, heart · saved, reveal, mail. All 20 are exported to `design/icons/`; see its README.

**"Icons and the primary on glass · light and dark painting"** demo: over a light painting (Bierstadt) and a dark one (Friedrich, *Monk by the Sea*), 44 pt glass buttons (saved heart in accent, artwork, back, search, glossary, lock) and a 44-tall clear-glass pill labelled "Play" (demo only; there is no play button in the app). Dark-painting glass uses the shadow `0 2 6 rgba(0,0,0,.35)`.

---

## 3. Components inventory

Colours refer to §2.1 tokens, so every component works in both themes automatically, unless a fixed colour is stated.

### 3.1 Floating tab bar + separate search button (`DCTabBar`)
- Container row: bottom **22**, centred, gap **10**, horizontal padding 16.
- **Tab capsule** (G1): height **62**, padding **5**, three items each **88 wide** (total 274 × 62). Item: icon 24 (stroke 1.75) above a label, gap 3, centred. The label is SF 10, 500, or 600 when selected.
  - Selected item: capsule fill `glassInk @ 12 %` (14 % RT), full opacity.
  - Unselected: opacity **0.7** (0.8 RT).
  - Tabs: **Today** (`tab-today`), **Library** (`tab-library`), **Settings** (`tab-settings`).
- **Search button** (G1): **62 × 62** circle, `search` icon 24. No label.
- Total width 346 → 22 pt side margins on 390.
- Present on Today, Library, Library › Glossary, Settings. Hidden on the Piece page, sheets and Search (keyboard up).
- Native: `TabView { Tab("Today", image: "tab-today") {…}; Tab("Library", …); Tab("Settings", …); Tab(role: .search) {…} }`. iOS 26 draws exactly this: a glass capsule with a separate search circle. Use the default `.tabBarMinimizeBehavior`, or `.onScrollDown` if desired (not specified).
- For free users, Search opens the paywall (brief: "Search tab or field: visible to free users, opens the paywall on tap"). The design labels Search "premium".

### 3.2 Glass icon button (`DCGlassIconButton`)
- **44 × 44** circle, G1. Icons: `chevron-back` 22, `heart` 26, `expand` 22, `glossary-book` 22, `close` 18 (stroke 2).
- Pressed (shown on the heart in 07 frames 1–2): fill gains `glassInk @ 14 %`.
- Favourited: `heart-fill` 26, colour **accent**.
- Native: `Button { } label: { Image(...) }.buttonStyle(.glass).buttonBorderShape(.circle)`, or `ToolbarItem` in a transparent NavigationStack toolbar.

### 3.3 Date chip (`DCDateChip`), Today only
- G1 capsule, height **44**, padding 0 18 0 16 (left 16, right 18), gap 10, centred horizontally at top **58**.
- Left: day number Literata 24/1.0, 500, −0.02em ("4").
- Right: two stacked lines, gap 1, SF 11/1.1 uppercase +0.04em: weekday 600 ("SATURDAY"); month + year 500 at opacity 0.7 ("OCTOBER 2026").
- Not interactive in the design.

### 3.4 Primary glass button (`DCPrimaryGlassButton`)
- G2 recipe. Two sizes appear:
  - **Large**: height **54**, h-padding **32**. Used by Today "Start listening" and by "Open in Spotify" in the section-07 (Round 3) Piece frames.
  - **Regular**: height **50**, h-padding **24**. Used by "Open in Spotify" in the Round-1/2 Piece top frames.
  - **Resolved by the section-06 token sheet:** "floating primary 54 pt pill, 32 pt side padding, 40 pt above the home indicator with a page-colour fade behind it". So the floating button sits at **bottom 40** with the 150 pt fade (`transparent → bg` at 60 %). Use Large everywhere.
- Label SF 17/600, −0.2, `glassInk`. Hugs its content (not full width).
- RT: solid `surface` capsule, 50 high, 24 padding, ring 1 pt `rgba(0,0,0,.25)` + `0 2 8 rgba(0,0,0,.12)`, text `ink`.

### 3.5 Solid buttons
| Variant | Spec | Used |
|---|---|---|
| `DCButton.primary` | full width, height **52**, capsule, fill `tint`, text `onTint` SF 17/600 −0.2 | Paywall CTA, onboarding Continue / Remind me, Create account, Sign in, sign-in prompt "Create an account" |
| `DCButton.secondary` | full width, height 52, capsule, fill `ink @ 8 %`, text `ink` SF 17/600 | Sign-in prompt "Sign in" |
| `DCButton.text` | SF 15 (14 on paywall/onboarding-1 line) accent, centred, no container | "Not now", "Forgot password?", "Restore purchases" |
| `DCButton.smallCapsule` | height **40**, padding 0 16, capsule, SF 14/600; **prominent**: fill `tint` / text `onTint`; **plain**: fill `ink @ 8 %` / text `ink` | Recordings sheet "Open in Spotify" (row 1 prominent, rows 2–3 plain) |
| Inline link | text in `accent`, inside a sentence in `ink2` | "Already have an account? **Sign in**", "New here? **Create an account**", legal links |

Native: `.buttonStyle(.borderedProminent).tint(.dcTint).controlSize(.large).buttonBorderShape(.capsule)` with a custom label height of 52. Or a custom `ButtonStyle`, because 52 pt is not a system height.

### 3.6 Listening stop (`ListeningStopRow`), the centrepiece
Layout: an HStack, gap **14**.
- **Rail** (width 14, flex none, padding-top **22**): a dot **8 × 8**, then a 1 pt vertical line in `rule`, filling the remaining height, 6 pt below the dot. **The last stop has no line.**
- **Card** (solid `surface`, radius 16, padding 16 v / 18 h, VStack gap **6**, `Stroke.cardRing`):
  1. Time label: SF 12/600, +0.04em, accent. Formats: `≈ 4:30` (single), `≈ 9:30 to 10:30` (range). **No time**: Literata *italic* 500 12, `ink2`, free text such as "Mid-development".
  2. "What you hear": Literata 500 `--rs`/1.4, `ink`. Can contain glossary terms.
  3. "What is happening": SF 15/1.45, `ink2`. Can contain glossary terms and `<em>` (e.g. *pppppp*).
- Stack of stops: gap **14**.

Designer annotation (verbatim): *"Time: SF 12 semibold, accent. Hear: Literata 17/1.4 medium. Happening: SF 15/1.45 secondary. Hollow dot = no time. Card is a solid surface; never glass."*
*"Reading focus: while scrolling, the stop nearest the vertical centre is “current” (ink, accent time, ringed dot); passed stops fade to ink3 with a 40% accent dot, upcoming stops fade to ink3 with a hollow grey dot. Transition 200 ms ease-out; off under Reduce Motion (everything full ink)."*

| State | Dot | Time | Hear | Happening | Card shadow |
|---|---|---|---|---|---|
| **Default** (no focus; Reduce Motion; static list) | solid `accent` | `accent` | `ink` | `ink2` | ring only |
| **Default, no time** | hollow: 1.5 pt inner stroke `accent` | italic `ink2` | `ink` | `ink2` | ring only |
| **Current** | solid `accent` + **4 pt halo** `accent @ 18 %` | `accent` | `ink` | `ink2` | ring + `0 6 20 rgba(0,0,0,.06)` |
| **Passed** | solid `accent` @ **opacity 0.4** | `ink3` | `ink3` | `ink3` @ opacity 0.75 | ring only |
| **Upcoming** | hollow: 1.5 pt inner stroke `ink3` | `ink3` | `ink3` | `ink3` @ opacity 0.75 | ring only |

In the mid-scroll frame, the movement summary paragraph above the list (a "passed" block) is also rendered in `ink3`, and its glossary term stays `accent`. Apply the focus fade to every reading block in the movement, not only the stops. *Interpretation; confirm.*

Implementation: `ScrollView` + `.onScrollGeometryChange` or `.scrollPosition(id:anchor: .center)` / `onGeometryChange` per row to find the row nearest the viewport centre (below the nav bar). Animate with `.animation(.easeOut(duration: 0.2))`, and disable it when `accessibilityReduceMotion` is on.

### 3.7 Glossary term (inline)
- Text in `accent`, **dotted underline** in `accent`, thickness **1.5 pt**, offset **4 pt** (3 pt when inside 15 pt SF text).
- Tap target: the design adds 10 pt vertical padding with −10 pt margin, which gives a ≥ 44 pt hit area without moving the layout.
- Active (its sheet is open): background `accent @ 14 %`, radius 4.
- Native: SwiftUI `Text` has no dotted underline. Options: (a) `AttributedString` with `.underlineStyle = .patternDot` + `.underlineColor` and a custom `link` attribute handled by `OpenURLAction` (`dc-term://sonata-form`), rendered via `Text(attributed)`. This supports pattern-dot underlines and links on iOS 17+, though offset and thickness cannot be set. (b) A custom `TextRenderer` / `UITextView` wrapper for exact offset and thickness. Content markup: `[[term]]` (launch content) → a link run.
- Accessibility: distinguishable by more than colour (the underline). Expose as a link with hint "Opens definition".

### 3.8 Movement switcher (`MovementSwitcher`)
- G1 capsule, height **44**, padding **4**. Segments are Literata 15/500 roman numerals, each a full-height capsule.
  - In the nav bar (mid-scroll): segments **44 wide** (I–IV → 184 × 44).
  - Inline at the "Movement I" header (full scroll): segments **40 wide** (168 × 44), right-aligned, the header label left.
- Selected: fill `glassInk` (solid), text `bg` colour, weight 600. Unselected: opacity 0.75.
- Annotation: "↑ pins under the nav bar once the movements begin". Before the first movement section the control sits inline. Once the user scrolls past that header, it docks into the centre of the top bar (top 58, between back and glossary buttons). It reflects the movement under the reading position, and tapping one jumps to that movement.
- Movement count varies from 2 to 5 (brief). Width = count × 44 + 8.
- Native: a custom view in `ToolbarItem(placement: .principal)` (iOS 26 renders toolbar items on glass), or an `.safeAreaInset(edge: .top)` overlay. Selection with `Picker(.segmented)` cannot be styled this way, so build it custom.

### 3.9 Section label (`SectionLabel`)
SF 12/600, uppercase, +0.1em, `ink2`. Followed by content at a gap of 12–14 pt.

### 3.10 Painting caption (`PaintingCaption`)
- SF 12/1.4, `ink3`. Format: `Artist, *Title*, Year. Collection.`
- On **Today** and the **Composer sheet**, the caption is prefixed by a **14 × 1 pt** dash in `ink3`, gap 8, aligned 8 pt from the top (`— Isaac Levitan, …`). On the Piece page and Paywall there is no dash.

### 3.11 Composer link (`ComposerLink`)
Composer name in `accent` + `chevron-forward-small` (8 × 12, stroke 2, opacity 0.7), gap 6. Piece page: SF 17/500 −0.2. Today: SF 15/500. Tap target padded 4 pt vertically. Opens the **Composer sheet**.

### 3.12 List rows

| Row | Spec |
|---|---|
| **Library row** | HStack gap 14, padding 12 v, top hairline 1 pt `rule`. Thumb **64 × 64**, radius 8, image `cover`, `stripe` placeholder. Text VStack gap 3: `{composer} · {year}` SF 13 `ink2`; title Literata 500 16/1.3 (wraps). Trailing: **`chevron-forward-small` 8 × 14 `ink3` when open, `lock` 18 `ink3` when locked.** The State-sheet annotation says "the lock replaces the chevron". The Library frame omits the chevron on open rows; follow the annotation. Today's piece shows `{composer} · {year} · Today`. Locked rows are **not dimmed**. |
| **Favourite row** | Same as the Library row, plus a third line `Saved {date}` (SF 12 `ink3`; e.g. "Saved today", "Saved 28 September"). The trailing control is a filled heart: `heart-fill` 26 in `accent`, inside a 44 × 44 hit box with margins −10 / −12 / −10 / 0, so it overhangs the row edge. Tapping it un-favourites the piece. Swipe left to remove (`.swipeActions`). |
| **Search result (piece)** | HStack gap 12, padding 10 v, top hairline. Thumb **40 × 40** r6. Title Literata 500 15 with the matched substring in `accent` (no background); sub `{surname} · {year}` SF 13 `ink2`. Trailing `lock` 16 `ink3` if locked. |
| **Search result (glossary)** | padding 10 v, top hairline. Term Literata 500 15; definition SF 13/1.4 `ink2`, single line, truncated with "…". |
| **Glossary list row** | The letter column shows the letter **only on the first term of each letter**; it is empty for the rest (data: `letter: ''`). Grid columns **28 / 1fr / auto**, gap 2 v × 10 h, align centre, padding 13 v, top hairline. Letter Literata 500 15 `accent` (top-aligned, +2 pt). Term Literata 500 17/1.3; short definition SF 13/1.4 `ink2`. Chevron 8 × 14 `ink3`. |
| **Movement table row** | Inside a `surface` r16 card with `cardRing`. Grid **28 / 1fr / auto**, gap 4 × 12, baseline-aligned, padding 13 v × 16 h, top hairline (suppress on the first row). Numeral Literata 500 16 `accent`; tempo Literata 500 15 + `{key} · {metre}` SF 13 `ink2` (gap 3); duration SF 14 tabular `ink2`. Whole row tappable → jump to that movement. |
| **Settings row** | min-height **50**, padding 0 16, gap 12, SF 17 −0.2. Title flex; value `ink2`; chevron 8 × 14 `ink3`. Inside a `surface` card with radius **22** and `cardRing`; separators 0.5 pt `rule`, **full width** (no leading inset). Action row (Restore purchases): `accent` text, no chevron. Section header: SF 13 `ink2` uppercase +0.02em, padding 0 16, 7 pt above the card; 22 pt between groups. |
| **Form row** | min-height **52**, padding 0 16, gap 12. Label: fixed **84 wide**, SF 15 `ink2`. Field: SF 17 `ink`; the password uses +0.12em tracking for the bullets. Caret 2 × 20 `accent`. Trailing `eye` 20 `ink3` on password rows. Card: `surface` r16 `cardRing`; separators 0.5 pt `rule`. |
| **Recording row** | HStack space-between, gap 12, padding 16 v, top hairline. Left VStack gap 3: optional badge "REFERENCE RECORDING" (SF 11/600 +0.08em `accent`); performers Literata 500 `--rs`/1.3; `{label} · {year}` SF 13 `ink2`. Placeholder rows render both lines in `ink3`. Right: `DCButton.smallCapsule`. |
| **Recommended-recordings card** (Piece page) | `surface` r16 `cardRing`, padding 16 × 18, HStack space-between gap 12. Title Literata 500 `--rs`; sub `{label}, {year} · Reference recording` SF 13 `ink2`; `chevron-forward` 20 `ink3`. Tap → Recordings sheet. |
| **Composer "In DailyClassical" row** | HStack gap 12, padding 8 v. Thumb 44 r6; title Literata 500 15; sub SF 13 `ink2` ("Today"). |

### 3.13 Plan card (`PlanCard`)
- Two equal-width cards side by side, gap **10**. Card: padding 14 top / 14 h / 12 bottom, radius 16, `surface`, VStack gap 4.
- Unselected: 0.5 pt `rule` ring. **Selected: 2 pt `accent` ring.**
- Badge (Lifetime only): capsule at top **−10**, left **12**, padding 3 × 8, fill `accent`, text `onTint` SF 10/600 uppercase +0.06em ("BEST VALUE").
- Content: name SF 13/600 (margin-top 4); price Literata 500 22; detail SF 12 `ink2`.
- Lifetime is preselected. Prices are variable-length strings from StoreKit.

### 3.14 Benefit line
HStack gap 10, top-aligned. `checkmark` 18 (stroke 2) in `accent` (2 pt top offset), text SF 15/1.4 `ink`. The placeholder line is drawn in `ink3` with a monospace 12 pt label. Do not ship it.

### 3.15 Segmented control (Library All / Favourites)
G1 capsule, height **40**, padding 4, hugs content (left-aligned). Segment: padding 0 16, SF 14/500. Selected: fill `glassInk`, text `bg`, 600. Unselected: opacity 0.75. A `gap:6` is present in the Favourites segment, presumably for an icon (none drawn).
Native: `Picker(.segmented)` does not match exactly; build a custom `GlassEffectContainer` with two buttons, or accept the system segmented control.

### 3.16 Filter chip
G1 capsule, height **36**, padding 0 14, gap 6, SF 14/500. Trailing `chevron-down` 12 (stroke 2.2) for menus ("Composer", "Era"). Leading `glossary-book` 14 for "Glossary" (navigates to Library › Glossary). Row gap 8.
Native: `Menu` with a glass button style for Composer/Era; `NavigationLink` for Glossary.

### 3.17 Search field
G1 capsule, height **44**, padding 0 16, gap 10. `search` icon 18 at opacity 0.6; text SF 17. Placeholder is the text at opacity 0.5. Caret `accent` (2 × 20).
Native: `.searchable` in the Search tab gives the system glass field and Cancel. The Library › Glossary field can be `.searchable(placement: .navigationBarDrawer)` or a custom `TextField` with glass.

### 3.18 Sheet chrome
- Top corners radius **38**. Grabber **36 × 5**, `ink3` at opacity 0.5, 10 pt from the top, centred (white @ 0.7 over a photo).
- Close button: **34 × 34** circle, fill `ink @ 8 %`, `close` 16 (stroke 2.2) in `ink2`, top-right, aligned with the title's first line.
- Content padding: 24 horizontal. The bottom padding is 48 for small/medium sheets and 44 for onboarding/auth sheets.
- Detents in the design: **small** (glossary, content height ≈ 265 pt), **medium** (recordings, sign-in prompt, onboarding 1), **large** (composer, create account, sign in: top at **72**, solid `bg`).
- Native: `.sheet` + `.presentationDetents([.height(h)])` (or a custom `.fraction`) for glossary; `[.medium]` for recordings/prompt; `[.large]` for composer/auth. Glossary caption: "small detent, the page stays put", so use `.presentationBackgroundInteraction(.enabled(upThrough: .height(h)))` and do not scroll the page. Use `.presentationCornerRadius(38)` only if the system default differs. On iOS 26 the system radius already follows the device corner. Grabber: `.presentationDragIndicator(.visible)`.

### 3.19 Toast (`DCToast`)
- G1 capsule, height **40**, padding 0 18, SF 14/500 `glassInk`, centred horizontally at top **116**, below the nav buttons. No icon.
- Copy: "Saved to Favourites". Duration and animation are not specified. Suggest about 2 s, fade + slight drop, and announce via `AccessibilityNotification.Announcement`.

### 3.20 Page dots
7 × 7 circles, gap 6, `ink`; active opacity 1, inactive 0.25. Centred above the onboarding CTA, 16 pt gap.

### 3.21 Time wheel (onboarding 2)
- Card: margin 40 top / 24 h, `surface`, radius **22**, `cardRing`, height **200**. Two columns centred, gap 24.
- Selection band: inset 16 left/right, 44 tall, vertically centred, radius 10, fill `ink @ 6 %`.
- Numbers SF 23 regular, tabular, column gap 8. Visible rows: ±2 around the selection, opacity 0.25 / 0.5 / **1.0 (weight 500)** / 0.5 / 0.25.
- Hours 00–23 (24-hour format shown: 06 07 **08** 09 10); minutes in **5-minute steps** (50 55 **00** 05 10).
- Native: `DatePicker(selection:, displayedComponents: .hourAndMinute).datePickerStyle(.wheel)` follows the locale's 12/24 h. SwiftUI has no minute interval. For 5-minute steps either wrap `UIDatePicker` (`minuteInterval = 5`) or use two `Picker`s with `.pickerStyle(.wheel)`. The system wheel draws its own band, which is close enough.

### 3.22 Image placeholder
Any image area shows `--stripe` (135° diagonal stripes, 6 pt bands) while loading or on failure (`onError → hideImg` reveals the stripe).

### 3.23 Empty state block (`DCEmptyState`)
- Centred in the content area (mock: absolute inset 200 top / 48 h / 200 bottom), VStack gap **12**, centred text.
- Icon: `heart` outline **36**, stroke 1.75, `accent`, 6 pt extra space below. *(This contradicts the "icons are always glass-ink" rule; the empty-state icon is not on glass.)*
- Title: Literata 500 **24/1.2**, `ink`.
- Body: SF 15/1.5 `ink2`.
- Optional action (margin-top 14): solid tint capsule, **44 high**, padding 0 22, SF **15/600**.
- Search-empty variant: no icon; title Literata 500 **20**; gap 10; horizontal padding 48; vertically centred in the remaining space.
- Native: `ContentUnavailableView { Label/Text } description: { } actions: { }`, with custom fonts. Or build it custom to get Literata.

### 3.24 Skeleton (`DCSkeleton`)
Flat blocks filled with `skel` (`ink @ 8 %`). Bar heights 12 / 14 / 26 / 26 / 16 with radius = height/2 (6, 7, 8, 8, 8) and widths 120 pt / 200 pt / 100 % / 70 % / 85 %. Gap 14; the last bar gets an extra +6 top. The image area is a 300 pt `skel` block. No shimmer is specified. Native: `.redacted(reason: .placeholder)` on the real layout gives a similar effect; an exact skeleton is easy to build.

### 3.25 Offline block
Image area **300** tall filled with `stripe`, with a centred `offline` (cloud-off) icon **32**, **stroke 1.5**, `ink3`. Below it, padding 30 × 24, gap 12: date label (`sectionLabel` style but **`accent`**, e.g. "SATURDAY, 4 OCTOBER"); title Literata 500 24/1.2 "You’re offline"; body SF 15/1.5 `ink2`; a "Try again" **secondary small capsule** (40 h, padding 0 18, `ink @ 8 %`, SF 14/600), left-aligned, +6 top.

### 3.26 System alert
The design draws a standard iOS alert, the "Delete account · system alert" frame: 270 wide, radius 14, `surface @ 90 %` + blur 30 / saturate 1.8, shadow `0 10 40 rgba(0,0,0,.25)`, scrim `rgba(0,0,0,.3)`. Title SF 17/600; message SF 13/1.4 `ink`; two 44 pt buttons side by side split by 0.5 pt `rule`: "Cancel" (17 regular, `accent`) and "Delete" (17/600, `danger`). **Native:** `.alert("Delete account?", isPresented:) { Button("Cancel", role: .cancel); Button("Delete", role: .destructive) } message: { … }`. Do not custom-draw it. Set `.tint(.dcAccent)` so Cancel picks up the accent.

### 3.27 Grouped-list footer note
SF 13/1.45 `ink3`, padding 0 16, placed 7 pt below a grouped card (Account page). Native: `Section { } footer: { Text(…) }`.

---

## 4. Screens

Each subsection follows the `data-screen-label` order. "L/D" means the screen was drawn in light and dark with identical layout.

### 4.1 Today (`Today light`, `Today dark`, `Today reduce transparency`)
**Purpose:** present today's piece and invite the user in. Caption: *"Painting runs under the status bar. The date lives in its own glass chip at the top, apart from the piece; the clear-glass primary floats on the painting’s lower edge."*

Layout, top to bottom (absolute in the mock):
1. **Painting**: full width, **0 → 420** (height 420), `cover`, under the status bar. Placeholder `stripe`. No text on the painting except the glass chip and button.
2. **Date chip** (§3.3): centred, top **58**, height 44.
3. **Primary glass button** "Start listening" (§3.4 Large): centred, top **396**, height 54. Its vertical centre (423) sits on the painting's lower edge (420). Under RT: top 398, height 50, solid.
4. **Text block**: starts at **420**, padding-top **44** (first line ≈ 464), horizontal 24, VStack gap **8**:
   - Painting caption with dash (§3.10), plus 6 pt extra bottom margin: "— Isaac Levitan, *Above the Eternal Peace*, 1894. State Tretyakov Gallery, Moscow."
   - Composer link (§3.11, SF 15/500): "Pyotr Ilyich Tchaikovsky ›"
   - Title Literata 27/1.2 500 −0.01em: "Symphony No. 6 in B minor, Op. 74, “Pathétique”" (wraps to 2–3 lines)
   - Hook Literata italic 17/1.45 `ink2`: "A symphony that ends not in triumph but in silence."
   - Meta SF 13 `ink2`, +2 top: "1893 · About 46 minutes · 4 movements"
5. **Tab bar** (§3.1) at bottom 22, Today selected.

Interactions: "Start listening" → Piece page. Composer link → Composer sheet. Tapping the painting presumably → Artwork viewer (not annotated). Never show a paywall here (brief).
States: only the loaded state is drawn. RT variant: chip and tab bar become opaque `#F5F2EC` with a 1 pt edge (the chip keeps a 0.5 pt inset edge with the RT edge colour), and the primary becomes a solid white capsule.
Native: no navigation bar. Use `ScrollView` + `.ignoresSafeArea(edges: .top)` for the painting, the chip as an `.overlay(alignment: .top)` with `.glassEffect()`, and the button as an overlay. The content is short, so the screen may scroll on small devices.

### 4.2 Piece page, top (`Piece top light`, `Piece top dark`)
**Purpose:** the listening guide header.
1. **Painting** 0 → **300**, full width, under the status bar.
2. **Nav row** at top **58**, inset 16, space-between: left **back** (44 glass, chevron 22); right group (gap 10): **heart** (44 glass, 26 icon) and **expand** (44 glass, 22 icon → Artwork viewer).
3. **Caption** padding 14 top / 24 h (no dash): "Isaac Levitan, *Above the Eternal Peace*, 1894. State Tretyakov Gallery, Moscow."
4. **Header block**: padding-top **26**, horizontal 24, VStack gap **10**:
   - Composer link SF 17/500 −0.2 accent + chevron.
   - Title Literata **30/1.15** 500 −0.01em.
   - Meta SF 14 `ink2`: "1893 · About 46 minutes"
   - Hook Literata italic **19/1.45** `ink`, margin-top 6 (16 total): "A symphony that ends not in triumph but in silence."
5. **The big picture**: margin-top **28**, horizontal 24, padding-top **22**, top hairline 1 pt `rule`. Label "The big picture" (§3.9), 12 below; first fact in `reading`: "Written between February and August 1893 and dedicated to his nephew, Vladimir Davydov."
6. **Floating "Open in Spotify"** (§3.4): centred, bottom 22, height 50, padding 24 in this frame. **Round-3 frames (07) use bottom 40, height 54, padding 32, plus a 150 pt bottom fade** (`transparent → bg` at 60 %) behind it. Use the Round-3 version.

No tab bar on the Piece page. Opening "Open in Spotify" presumably goes to the reference recording (or the Recordings sheet). The full-scroll annotation says the *Recommended recordings card* "Opens the recordings sheet". The floating button's target is not annotated.

### 4.3 Piece page, mid-scroll (`Piece mid-scroll`, L/D)
Caption: *"Mid-scroll · reading focus: the stop nearest the centre is full ink; passed and upcoming stops fade"*.
- Content scrolled under a **top fade**: 0 → 120 pt, gradient `bg` solid until 55 % → transparent. (On iOS 26 use `.scrollEdgeEffectStyle(.soft, for: .top)`, which is the native equivalent.)
- **Nav row** at top 58, inset 16, `align-items: center`: left **back** (44); centre **movement switcher** (§3.8, 44-pt segments, "I" selected); right **glossary** button (44, `glossary-book` 22). The heart and expand buttons are **replaced** in this state. The glossary button's destination is not annotated; presumably Library › Glossary, or a list of the terms in this piece.
- Visible content (24 gutter, gap 14): the summary paragraph (passed → `ink3`) with the `sonata form` term; the "Listening stops" label (+14 top); note SF 13/1.45 `ink2` (−6 top): "Times are approximate and follow the reference recording: Currentzis, musicAeterna (Sony Classical, 2017)."; then stops: ≈ 0:00 (**passed**), ≈ 2:00 (**current**), ≈ 4:30 (**upcoming**), ≈ 6:30 (**upcoming**).
- No floating Spotify button and no tab bar in this frame.

### 4.4 Piece page, full scroll (`Piece page full scroll`, L/D)
Caption: *"Full scroll · unrolled (bars omitted)"*. 390 wide, natural height. Order and spacing (horizontal margin 24 for everything below the painting):

| # | Block | Spacing / style | Copy |
|---|---|---|---|
| 1 | Painting | 300 tall | — |
| 2 | Caption | padding-top 14 | as 4.2 |
| 3 | Header | padding-top 26, gap 10 | as 4.2 |
| 4 | **The big picture** | margin-top 28, padding-top 22, top hairline; VStack gap **14** | Label; 4 facts in `reading`: "Written between February and August 1893 and dedicated to his nephew, Vladimir Davydov." / "First performed on 28 October 1893 in St Petersburg, conducted by Tchaikovsky. He died nine days later." / "The Russian title means “passionate” or “full of feeling”, not “pathetic”." / "Tchaikovsky reverses the usual order: the thrilling march comes third, and the slow movement comes last."; then the map in `readingItalic` `ink2` with +4 top: "In one line: struggle and longing (I), a graceful dance with a limp (II), a false victory (III), acceptance and fading (IV)." |
| 5 | **Movements** | margin-top 32, gap 12 | Label "Movements"; table card (§3.12) with 4 rows, in the form numeral / tempo / `key · metre` / duration: **I** Adagio – Allegro non troppo · B minor · 4/4 · 19:44; **II** Allegro con grazia · D major · 5/4 · 7:44; **III** Allegro molto vivace · G major · 12/8 and 4/4 · 8:36; **IV** Finale: Adagio lamentoso · B minor · 3/4 · 10:21; footnote SF 12/1.45 `ink3`: "Durations are from the reference recording: Teodor Currentzis, musicAeterna (Sony Classical, 2017). Tap a row to jump to that movement." |
| 6 | **Movement I header** | margin-top **40**, row space-between, centre-aligned | Left label "Movement I"; right inline movement switcher (40-pt segments, I selected). Annotation (margin-top 10, SF 11 `ink3`): "↑ pins under the nav bar once the movements begin" |
| 7 | Tempo title | margin-top 18, gap 6 | Literata 24/1.25 500 "Adagio – Allegro non troppo"; SF 13 `ink2` "B minor · 4/4 · 19:44" |
| 8 | Summary | margin-top 18, `reading` | "The heart of the symphony. A restless theme born in darkness meets the most famous, warmest melody Tchaikovsky ever wrote. The movement is in [sonata form]: the themes are introduced, thrown into conflict, and brought back." |
| 9 | **Main ideas** | margin-top 30, gap 12 | Label; theme items (VStack gap 4): name Literata 500 `--rs`; description SF 15/1.5 `ink2`. Items after the first get padding-top 8 + top hairline. "Theme 1, unrest" / "A short, climbing, questioning [motif]. First on a lone bassoon in slow motion, then fast and nervous in the violas." · "Theme 2, longing" / "A broad melody that drifts downward on muted strings. The first moment of light." |
| 10 | **Listening stops** | margin-top 34, gap 14 | Label; note (−6 top); 11 stops (§3.6) in the default state. Stops 1–10 come from the data script: (1) "≈ 0:00" / "A single bassoon over dark, hollow double basses" / "The introduction. The seed of Theme 1, in slow motion"; (2) "≈ 2:00" / "Violas play the same idea, fast and anxious; strings and woodwinds trade phrases" / "The main section begins with Theme 1. Tension climbs step by step"; (3) "≈ 4:30" / "Everything calms; a wide, singing melody on muted strings" / "Theme 2. The signature tune of the symphony"; (4) "≈ 6:30" / "Flute and bassoon in conversation over a pulsing string accompaniment" / "The middle of Theme 2, a little more animated"; (5) "≈ 8:00" / "The famous melody returns in the full orchestra" / "Theme 2 at its fullest"; (6) "≈ 9:30 to 10:30" / "A solo clarinet lets the melody fade to almost nothing" / "Tchaikovsky writes pppppp here, the quietest marking in the score" (render *pppppp* italic, as in the variants frame); (7) "≈ 10:30" / "A sudden, violent crash; then fast, chasing string passages" / "The development. Theme 1 is torn apart"; (8) **no time** "Mid-development" / "A slow, hymn-like phrase in trombones and trumpets" / "A quotation from the Russian Orthodox funeral service" (the script renders it through the same template with a solid dot; use the no-time variant: italic label, hollow dot); (9) "≈ 12:30 to 14:30" / "Theme 1 returns inside the storm; trombones descend step by step over rolling timpani" / "The return and the climax fused together. The most tragic moment"; (10) "≈ 15:00" / "The famous melody comes back, brighter" / "Theme 2, now in B major: the same tune, but like peace that has been earned". Stop 11 is literal: "≈ 18:00" / "Strings pluck a slowly falling scale ([pizzicato]); above it, a calm brass [chorale]" / "The [coda]. The storm has passed; the ending is peaceful, but it points downward". The last stop has no rail line. |
| 11 | **Things to notice** | margin-top 34, gap 12 | Grid 24 / 1fr, gap 10 v × 8 h, `reading`; numerals in `accent`. 1 "The bassoon idea in the introduction and the viola theme of the Allegro are the same notes; only the speed changes." 2 "Theme 2 comes three times. Compare how the orchestration changes each time." 3 "The falling plucked scale at the end is the first hint of the finale’s “falling line”." |
| 12 | **Movement II** | margin-top **44**, padding-top **28**, top hairline, gap 6 | Label "Movement II"; "Allegro con grazia"; "D major · 5/4 · 7:44"; template slot (margin-top 12, padding 18, radius 16, `stripe`, mono 11/1.5 `ink2`, designer-only): "Same template as Movement I: summary · main ideas · listening stops · things to notice · optional “In this recording”. Copy to follow." |
| 13 | Movement III | margin-top 36 (no hairline), gap 6 | "Allegro molto vivace"; "G major · 12/8 and 4/4 · 8:36"; slot "Template slot · copy to follow." |
| 14 | Movement IV | margin-top 36 | "Finale: Adagio lamentoso"; "B minor · 3/4 · 10:21"; slot |
| 15 | **Threads** | margin-top 44, padding-top 28, top hairline, gap 14 | Label "Threads that tie the piece together"; paragraphs in `reading` with a bold (500) lead-in: "**The falling line.** Almost every important melody in the symphony moves downward." / "**The pulse.** A repeated single note like a heartbeat in the second movement returns in the double basses at the very end, slows, and stops." / "**Darkness to darkness.** The symphony begins and ends in the lowest instruments." |
| 16 | **Recommended recordings** | margin-top 40, gap 12 | Label; card (§3.12): "Teodor Currentzis, musicAeterna" / "Sony Classical, 2017 · Reference recording" ›; annotation SF 12 `ink3`: "Opens the recordings sheet." |
| 17 | **Sources and credits** | margin-top 40, padding 24 top / **150 bottom** (clears the floating button), top hairline, gap 8, SF 12/1.5 `ink3` | Label (+4 bottom); "Painting: Isaac Levitan, *Above the Eternal Peace*, 1894. State Tretyakov Gallery, Moscow. Public domain." / "Recording data: Spotify. Durations from Sony Classical, 2017." |

Interactions: glossary terms → Glossary sheet. Movement rows and switcher → scroll to the movement. Composer → Composer sheet. Recordings card → Recordings sheet. Heart → favourite (sign-in gate, §4.18). Expand → Artwork viewer. Keep the screen awake while reading (`UIApplication.shared.isIdleTimerDisabled = true` while the Piece page is visible; brief: "The screen must not dim or lock").

### 4.5 Listening-stop variants (unlabelled frame, L/D)
Caption: *"Listening stop · single time, range, no time"*. A 390-wide card stack (padding 24, gap 14) shows three stops in the **default** state:
1. "≈ 4:30" / "Everything calms; a wide, singing melody on muted strings" / "Theme 2. The signature tune of the symphony"
2. "≈ 9:30 to 10:30" / "A solo clarinet lets the melody fade to almost nothing" / "Tchaikovsky writes *pppppp* here, the quietest marking in the score"
3. (no time, hollow accent dot, no rail line) "*Mid-development*" / "A slow, hymn-like phrase in trombones and trumpets" / "A quotation from the Russian Orthodox funeral service"

The annotation is quoted verbatim in §3.6.

### 4.6 Glossary sheet (`Glossary sheet`, L/D)
Caption: *"Glossary sheet · small detent, the page stays put"*.
- Background: the Piece page at the mid-scroll position, with the tapped term **highlighted** (`accent @ 14 %` background, radius 4). Scrim `rgba(0,0,0,.18)`.
- Sheet (G3), bottom-anchored, radius 38 top, padding 10 top / 24 h / 48 bottom, VStack gap **14**:
  - Grabber.
  - Title row (margin-top 6): term Literata 24/1.2 500 "Sonata form"; close 34 (§3.18).
  - Definition `reading`: "A three-stage structure: themes are introduced (exposition), worked and set against each other (development), and brought back (recapitulation)."
  - Link SF 13 `accent`, +4 top: "See all terms in Library ›" → Library › Glossary.
- Height ≈ 265 pt (content). Use `.presentationDetents([.height(…)])` measured from content, with `.presentationBackgroundInteraction(.enabled)`.

### 4.7 Recordings sheet (`Recordings sheet`, L/D)
Caption: *"Recordings sheet · medium detent"*.
- Background: Piece page top (painting + composer + title), with the scrim.
- Sheet (G3), padding 10 / 24 / 48, gap **16**:
  - Grabber.
  - Header (margin-top 6): VStack gap 4: "Recordings" (Literata 24/1.2) and "Listening-stop times follow the first recording." (SF 13/1.45 `ink2`); close 34.
  - Rows (§3.12 Recording row), each with a top hairline:
    1. "REFERENCE RECORDING" / "Teodor Currentzis, musicAeterna" / "Sony Classical · 2017" — **prominent** "Open in Spotify".
    2. Placeholder `ink3`: "Conductor, Orchestra" / "Label · Year" — plain "Open in Spotify".
    3. Same as 2.
  - Note SF 11/1.5 `ink3`: "No album artwork is shown, so no Spotify artwork rules apply. The official Spotify mark goes in once the asset is dropped in."
- "Open in Spotify" deep-links to the album (`spotify:album:…` via `openURL`, falling back to https).

### 4.8 Composer sheet (`Composer sheet light`, `Composer sheet dark`)
Caption: *"Composer sheet · large detent, scrolls; opens from the composer name"*.
- Background: Piece top with the scrim. The sheet's top sits at **72**, radius 38, **solid `bg`**, and its content scrolls.
- Overlaid on the sheet (do not scroll): grabber 36 × 5 **white @ 0.7** at top 10; close button **34**, top 18, right 16, G4 dark glass, icon 16 (stroke 2.2) `#F0EBE3`.
- Content:
  1. Portrait **300 tall**, full sheet width, `cover`, focal point **50 % / 18 %** (keep the face in frame).
  2. Caption with dash, padding 8 top / 24 h: "— Nikolai Kuznetsov, *Portrait of Tchaikovsky*, 1893. State Tretyakov Gallery, Moscow."
  3. Name block, padding 22 top, gap 6: "Pyotr Ilyich Tchaikovsky" (Literata 30/1.15); "1840 – 1893 · Russian · Romantic era" (SF 15 `ink2`).
  4. **Facts card**, margin 22 top: 2-column grid, gap 12 v × 20 h, padding 16 × 18, `surface` r16 `cardRing`, SF 13/1.4. Each cell: label (SF 11 uppercase +0.06em `ink3`, 3 pt below) and value. Born: "7 May 1840, Votkinsk"; Died: "6 November 1893, St Petersburg"; Symphonies: "Six, plus *Manfred*"; Best known for: "Ballets, Piano Concerto No. 1".
  5. **Bio**, padding 24 top, gap 14, `reading`, three paragraphs (supports italics for work titles).
  6. **In DailyClassical**: margin 28 top, padding-top 20, top hairline, gap 10. Label; piece row (§3.12): thumb + "Symphony No. 6, “Pathétique”" + "Today"; note SF 13/1.45 `ink3`: "More of his pieces will appear here as they are published."
- Native: `.sheet` + `.presentationDetents([.large])`, `.presentationBackground(Color.dcBackground)`, `ScrollView` with `.ignoresSafeArea(edges: .top)` for the portrait.

### 4.9 Library › Glossary (`Library glossary light`, `Library glossary dark`)
Caption: *"Library › Glossary · all terms, A–Z"*.
1. **Back pill** at top 58, left 16: G1 capsule, height 44, padding 0 16 0 10, gap 8; `chevron-back` 20 + "Library" (SF 15/500). Native: the standard `NavigationStack` back button (iOS 26 draws it as a glass pill showing the previous title).
2. Header, padding-top **116**, horizontal 24, gap 14: "Glossary" (`display` 34); intro SF 15/1.5 `ink2`: "Every term that appears in a piece, explained for listeners. Tap one to read it in full."; **search field** (§3.17) with placeholder "Search terms".
3. **List**, padding 10 top / 24 h / 140 bottom: glossary rows (§3.12), sorted A–Z. Data script (13 rows; letter shown only on the first of each letter): **A** Adagio: "Slow. A tempo marking, and often the name of a slow movement" · Allegro: "Fast and lively" · **C** Chorale: "A hymn-like passage in even, block chords" · Coda: "The closing section that rounds off a movement" · **D** Development: "The middle of sonata form, where themes are worked and set against each other" · **E** Exposition: "The opening of sonata form, where the themes are introduced" · **K** Key: "The home note and scale a piece is built around" · **M** Motif: "A short musical idea that keeps returning" · Movement: "A self-contained section of a larger work" · **P** Pizzicato: "Plucking the strings instead of using the bow" · **R** Recapitulation: "The return of the opening themes near the end of sonata form" · **S** Sonata form: "A three-stage structure: exposition, development, recapitulation" · **T** Tempo: "The speed of the music". (These `short` lines are list summaries; the sheet shows the longer `definition`.)
4. **Index rail**: absolute right **6**, top **230**, VStack gap 3, SF 10/600 `accent`, centred: A C D E K M P R S T. These are only the letters that have terms. Native: `ScrollViewReader` plus a custom rail, or `List` + `.listSectionIndexVisibility(.visible)` with `.sectionIndexLabel(...)` (iOS 26).
5. Bottom fade 150 pt (`transparent → bg` at 70 %). Tab bar, **Library** selected.
- Tap row → glossary detail. The design does not draw a separate detail; reuse the Glossary sheet ("Tap one to read it in full").

### 4.10 Paywall (`Paywall`, L/D)
Caption: *"Paywall · sheet"*. Full height (present as `.fullScreenCover` or a `.large` sheet). Layout is a VStack; the CTA block is pinned to the bottom (`margin-top:auto`).
1. **Painting** **280 tall**, full width, `cover`, focal point 50 % / 30 %: Caspar David Friedrich, *Wanderer above the Sea of Fog*. **Close** 44 G1 at top 58, right 16, `close` 18 (stroke 2).
2. Caption (no dash), padding 10 top / 24 h: "Caspar David Friedrich, *Wanderer above the Sea of Fog*, c. 1818. Kunsthalle Hamburg."
3. Heading, padding 22 top, gap 8: "More of this." (Literata 28/1.15); "Every symphony we have written about, whenever you want it." (SF 15/1.5 `ink2`).
4. Benefits, padding 18 top, gap 10 (§3.14): "The full library of past pieces" · "Search pieces, composers and terms" · placeholder "Open benefit line (to confirm)".
5. Plans, padding 22 top, gap 10 (§3.13): **Lifetime** (selected, "BEST VALUE") "₺600" "One payment, forever" · **Monthly** "₺150" "Per month, cancel any time".
6. Bottom block, padding 0 24 **40**, centred VStack gap **16**: primary button full width 52 "Continue · ₺600" (price follows the selection); "Restore purchases" (SF 14 `accent`); "Terms" and "Privacy" (SF 12 `ink3`, gap 14).
- StoreKit 2: one auto-renewable subscription (monthly) and one non-consumable (lifetime). Native `SubscriptionStoreView` does not match this layout, so build it custom with `Product.purchase()`.

### 4.11 Library, locked (`Library locked`, L/D)
Caption: *"Library · locked items visible, lock mark small"*.
1. Header, padding-top **66**, horizontal 24, gap 14: "Library" (`display`); segmented control (§3.15) "All pieces" (selected) | "Favourites"; filter chips row (§3.16): "Composer ⌄", "Era ⌄", "📖 Glossary" (book icon).
2. List, margin-top 18, padding 0 24 140: Library rows (§3.12). Data script (10 rows, newest first; `{composer} · {year}`; all locked except today's): Tchaikovsky · 1893 · Today, "Symphony No. 6 in B minor, “Pathétique”" (open; Levitan) · Dvořák · 1893, "Symphony No. 9 in E minor, “From the New World”" (Bierstadt, *Among the Sierra Nevada*) · Mahler · 1902, "Symphony No. 5" (Klimt, *Beech Grove I*) · Brahms · 1885, "Symphony No. 4 in E minor" (Millet, *The Angelus*) · Berlioz · 1830, "Symphonie fantastique" (Fuseli, *The Nightmare*) · Beethoven · 1824, "Symphony No. 9 in D minor, “Choral”" (Turner, *The Fighting Temeraire*) · Schubert · 1822, "Symphony No. 8 in B minor, “Unfinished”" (Friedrich, *The Monk by the Sea*) · Beethoven · 1808, "Symphony No. 5 in C minor" (Friedrich, *Wanderer above the Sea of Fog*) · Mozart · 1788, "Symphony No. 40 in G minor" (Watteau, *Embarkation for Cythera*) · Shostakovich · 1937, "Symphony No. 5 in D minor" (Munch, *The Scream*). Library search rows use the composer surname only.
3. Bottom fade 150 pt, then the tab bar with Library selected.
- Brief: free users see past pieces with a lock, and tapping one opens the paywall. Today's piece and Favourites stay open.
- The Favourites segment is specified in §4.23–4.25. **Not drawn:** the Composer/Era filter menus. The State-sheet annotation for locked rows (verbatim): "Locked rows keep full painting and title; the lock replaces the chevron. Tap opens the paywall sheet. No dimming: showing what is inside sells better than hiding it."

### 4.12 Search (`Search`, L/D)
Caption: *"Search (premium) · results grouped"*. Keyboard visible (the frame enables the device keyboard). No tab bar.
1. Search row, padding **66** top / 16 h, gap 10: field (§3.17, flex) showing "B minor" with an accent caret; "Cancel" SF 17 `accent`.
2. Results, padding 22 top / 24 h, groups separated by **22**:
   - **PIECES** (group label `sectionLabel`, 8 pt below): "Symphony No. 6 in **B minor**, “Pathétique”" / "Tchaikovsky · 1893"; "Symphony No. 8 in **B minor**, “Unfinished”" / "Schubert · 1822" with a lock 16 (Caspar David Friedrich, *The Monk by the Sea*, as the thumbnail).
   - **GLOSSARY**: "Key" / "The home note and scale a piece is built around…"
- The match is highlighted in `accent`. Free user: opening Search → paywall. A locked result → paywall.
- The empty/no-results state is in §4.26. **Not drawn:** recent searches, the Composers group (both in the brief), the idle state.
- Native: `Tab(role: .search) { NavigationStack { SearchView().searchable(text:) } }`. iOS 26 places the field at the bottom by default when it lives in the search tab. The design draws it at the top with "Cancel" (keyboard up). Either accept the system behaviour, or force the top with `.searchToolbarBehavior` / `searchable(placement: .navigationBarDrawer(displayMode: .always))`. Flag for design review.

### 4.13 Settings (`Settings`, L/D)
Caption: *"Settings · system grouped list"*.
1. "Settings" (`display`), padding 66 top / 24 h.
2. Groups, padding 20 top / 16 h, gap 22 (§3.12 Settings row):
   - **ACCOUNT**: `{email}` › (sample shows the user's email; opens Settings › Account, §4.21). The guest state of this row is not drawn: show "Sign in" (see §7).
   - **READING**: Daily reminder · "08:00" › | Theme · "System" › | Text size · "Follows system" › | Language · "English" ›
   - **PREMIUM**: DailyClassical Premium · "Free" › | **Restore purchases** (accent, action)
   - **ABOUT**: About and credits › | Painting and recording sources ›
3. Tab bar, Settings selected.
- Native: `List` with `.listStyle(.insetGrouped)`, a custom row background `dcSurface`, `.scrollContentBackground(.hidden)` + `dcBackground`, and the section corner radius from the system (26 on iOS 26; the design uses 22). The large title is custom Literata, so hide the nav title or use `.toolbar { ToolbarItem(placement: .largeTitle) }`. Theme options: System / Light / Dark (brief). Text size "Follows system" means Dynamic Type; an in-app override is optional.

### 4.14 Artwork viewer (`Artwork viewer`)
Caption: *"Artwork viewer · uncropped, pinch to zoom"*. Always black, both themes.
- Background `#000`. Image **uncropped**, full width, vertically centred (aspect fit). Pinch to zoom, pan, double-tap to zoom.
- Close button 44 at top 58, right 16, G4 dark glass, `close` 18 (stroke 2).
- Caption, bottom: padding 0 24 **56**, VStack gap 6: "Isaac Levitan" (Literata 500 17 `#F0EBE3`); "*Above the Eternal Peace, 1894*" (Literata italic 17 `#B3ABA1`); "Oil on canvas · State Tretyakov Gallery, Moscow · Public domain" (SF 13/1.45 `#B3ABA1`).
- Native: `.fullScreenCover`, `.preferredColorScheme(.dark)`, `.statusBarHidden()` optional. Zoom via `ScrollView` + `MagnifyGesture` or a `UIScrollView` wrapper. Consider hiding the chrome on tap (not specified).

### 4.15 Onboarding 1 of 2 (`Onboarding 1 of 2 · over the live Today screen light/dark`)
Section caption: *"Opens on today’s piece, already loaded; one card explains the idea, one asks for a reminder time. Nothing else before the app."*
- Background: the **live Today screen** (painting, date chip, Start listening button, caption, composer, title, hook). The meta line and the tab bar are not drawn because the sheet covers them. Scrim 0.18.
- Sheet (G3, medium-ish, non-dismissable), padding 0 24 **44**, gap 18:
  - Grabber.
  - Text (margin-top **34**, gap 12): "One symphony a day, with a guide you read while it plays." (Literata 30/1.15); "Press play in Spotify, come back, and follow along. Today’s piece is already waiting behind this card." (SF 15/1.5 `ink2`).
  - Controls (margin-top 8, gap 16): page dots (1st active); **Continue** (primary 52); "Already have an account? **Sign in**" (SF 14 `ink2` / `accent`).
- Native: present over `TodayView` with `.sheet` + `.interactiveDismissDisabled()` + `.presentationDetents([.height(…)])` (≈ 400 pt from content) + `.presentationBackgroundInteraction(.disabled)`.

### 4.16 Onboarding 2 of 2 (`Onboarding 2 of 2 · reminder light/dark`)
Full screen on `bg` (no painting, no tab bar).
1. Text block, padding **140** top / **32** h, gap 14: eyebrow "LAST THING" (§2.2 `eyebrow`); "When should today’s piece arrive?" (Literata 30/1.15); "One quiet notification a day. Change it any time in Settings." (SF 15/1.5 `ink2`).
2. **Time wheel card** (§3.21), margin-top 40, horizontal 24: 08:00 selected.
3. Bottom block, padding 0 24 **44**, gap 16: page dots (2nd active); **"Remind me at 08:00"** (primary, label follows the selection); "Not now" (SF 15 `accent`).
- On "Remind me": request notification authorisation (`UNUserNotificationCenter.requestAuthorization`), then schedule a daily `UNCalendarNotificationTrigger`. "Not now" skips both. Both continue to the app.

### 4.17 Flow 07: Favourites and account (light only, except Sign in)
Caption (verbatim): *"Email + password only. The heart is the only thing that asks you to sign in; everything else stays open. The Account page under Settings holds sign-out and delete."* The frames are connected by arrows: 1 → 2 → 3 → 4.

All four frames sit on the **Piece page top** (Round-3 version): painting 300, nav row, caption, header, big picture, a 150 pt bottom fade, and the **Open in Spotify** Large glass button at **bottom 40** (54 tall, 32 padding).

**1 · Guest taps the heart** (`1 · Guest taps the heart light`): the heart button shows its **pressed** state (fill `glassInk @ 14 %` mixed into the glass). The heart is still outline.

**2 · Sign-in prompt, medium detent** (`2 · Sign-in prompt, medium detent light`): scrim; G3 sheet, padding 0 24 44, gap 18:
- Grabber; text (margin-top 30, gap 10): "Keep the pieces you love" (Literata 28/1.15); "Favourites live in your Library and follow you to any device. All it takes is an email address." (SF 15/1.5 `ink2`).
- Buttons (margin-top 6, gap 12): **Create an account** (primary); **Sign in** (secondary, `ink @ 8 %`); "Not now" (SF 15 `accent`).
- The heart behind it is still in the pressed state.

**3 · Create an account** (`3 · Create an account light`): scrim; **large** sheet, top 72, solid `bg`, padding 0 24 44, VStack gap **22**, with the bottom link pinned (`margin-top:auto`):
- Grabber; header (margin-top 22): "Create an account" (Literata 30/1.15) + "One email, one password. No newsletter." (SF 15/1.5 `ink2`); close 34.
- Form card (§3.12 Form row): Email = `{email}`; Password = "••••••••••" with caret + eye.
- Hint (−8 top, so 14 pt below the card): "At least 8 characters." (SF 13/1.5 `ink3`).
- Actions (gap 14): **Create account** (primary); legal SF 12/1.5 `ink3`, centred: "By continuing you agree to the **Terms** and **Privacy Policy**." (links `accent`).
- Bottom: "Already have an account? **Sign in**" (SF 15 `ink2` / `accent`).
- Fields: email (`.textContentType(.emailAddress)`, `.keyboardType(.emailAddress)`, no autocapitalisation); new password (`.textContentType(.newPassword)` for the strong-password suggestion), minimum length 8. The eye toggles `SecureField` ↔ `TextField`.

**4 · Saved; heart fills, toast confirms** (`4 · Saved; heart fills, toast confirms light`): the sheet is dismissed. The heart is **filled `accent`** (`heart-fill`). **Toast** "Saved to Favourites" (§3.19) at top 116, centred.

**Sign in** (`Sign in light`, `Sign in dark`; identical markup): same structure as Create account:
- Header "Sign in" / "Welcome back."; close.
- Form: Email `{email}`; Password "••••••••" + caret + eye. No hint line.
- Actions (margin-top 2, gap 14): **Sign in** (primary); "Forgot password?" (SF 15 `accent`).
- Bottom: "New here? **Create an account**".
- Fields: `.textContentType(.username)` / `.password` for AutoFill. "Forgot password?" → Reset password (§4.19).

**Account page**: see §4.21 and §4.22.

### 4.18 Toast
See §3.19 and frame 4 above. It is the only toast in the design.

### 4.19 Reset password (`Reset password light`, `Reset password dark`)
Reached from "Forgot password?" on Sign in. It sits on the same Round-3 Piece-top background with the scrim. **Large** sheet, top 72, solid `bg`, radius 38, padding 0 24 44, gap 22 (same chrome as Sign in).
- Grabber; header (margin-top 22): "Reset password" (Literata 30/1.15) + "We will email you a link to choose a new one." (SF 15/1.5 `ink2`); close 34.
- Form card with **one** row: Email = `{email}` with the caret (focused). Label column 84.
- Actions (margin-top 2, gap 14): **Send reset link** (primary 52); "Back to sign in" (SF 15 `accent`, centred). No bottom link.
- Native: replace the sheet content inside the same `.sheet` (NavigationStack push or content swap), and prefill the email from Sign in.

### 4.20 Check your email (`Check your email light`, `Check your email dark`)
After "Send reset link". Same large sheet.
- Header (margin-top 22): "Check your email" only (no subtitle); close 34.
- Centre block, VStack centred, gap 16, padding 30 top / 10 bottom, text centred:
  - `mail` icon **32**, **stroke 1.5**, `accent`.
  - `reading` (Literata `--rs`/`--rl`): "A reset link is on its way to **{email}**. It expires in 30 minutes." The email is weight 500.
  - SF 13/1.5 `ink3`: "Nothing there? Check spam, or send it again."
- Actions (margin-top 6, gap 14): **Open Mail** (primary 52; open the Mail app with `UIApplication.shared.open(URL(string: "message://")!)`); "Send again" (SF 15 `accent`; add a cooldown, not specified).
- Note: the link expiry (30 minutes) is a backend constraint shown in the copy.

### 4.21 Settings › Account (`Settings › Account light`, `Settings › Account dark`)
Pushed from the Settings Account row. **No tab bar is drawn** (pushed detail; with a system `TabView` the bar stays unless hidden. Either is acceptable, so flag it).
1. **Back pill** at top 58, left 16: G1, 44 h, padding 0 16 0 10, gap 8, `chevron-back` 20 + "Settings" (SF 15/500). This is the native back button.
2. Header, padding **116** top / 24 h, gap **6**: "Account" (`display` Literata 34/1.1 500); `{email}` (SF 15 `ink2`).
3. Groups, padding 24 top / 16 h, gap **22**, SF 17 −0.2 (Settings row style, §3.12):
   - Group 1: **Email** · value `{email}` (`ink2`) ›; **Change password** ›. Separator 0.5 pt. The destinations are not drawn.
   - Group 2: **Sign out** (row text `accent`, no chevron). Footer (§3.27): "You can sign back in any time. Favourites stay with your account."
   - Group 3: **Delete account** (row text **`danger`**, no chevron). Footer: "Removes your account and favourites permanently. Premium purchases are tied to your Apple ID and are unaffected."
- No section headers in this list.
- Sign out: no confirmation is drawn; sign out immediately and pop to Settings (suggestion).

### 4.22 Delete account · system alert (`Delete account · system alert light/dark`)
Shown over Settings › Account (scrim `rgba(0,0,0,.3)`). The alert follows §3.26:
- Title "Delete account?"; message "Your account and favourites will be removed permanently. This cannot be undone."; buttons **Cancel** (accent) | **Delete** (danger, semibold).
- On Delete, call the API to delete the account, sign out locally, and pop to Settings. The App Store requires in-app account deletion.

### 4.23 Library › Favourites · signed in (`Library › Favourites · signed in light/dark`)
- Header as in §4.11, but the segmented control has **Favourites** selected and **there is no filter-chip row**.
- List (margin-top 18, padding 0 24 140): Favourite rows (§3.12). Data script (3, most recently saved first): Tchaikovsky · 1893, "Symphony No. 6 in B minor, “Pathétique”", "Saved today" · Schubert · 1822, "Symphony No. 8 in B minor, “Unfinished”", "Saved 28 September" · Beethoven · 1808, "Symphony No. 5 in C minor", "Saved 12 September".
- Footer note after the list (padding-top 18, SF 13/1.5 `ink3`): "Swipe left to remove. Favourites are free; locked pieces stay locked until Premium."
- No lock icons on favourite rows; the heart takes the trailing slot. A locked favourite still opens the paywall on tap.
- Bottom fade 150 pt; tab bar with Library selected.

### 4.24 Library › Favourites · guest (`Library › Favourites · guest light/dark`)
- Header as in §4.23 (Favourites selected, no chips).
- Empty state (§3.23) with action: heart 36 accent; "Nothing saved yet"; "Tap the heart on any piece to keep it here. Sign in and your favourites follow you to every device."; button **"Sign in or create account"** (tint, 44 h). The button opens the sign-in prompt / Create account flow (§4.17).
- Tab bar, Library selected.
- Guests cannot save (the heart triggers sign-in), so the guest list is always empty.

### 4.25 Library › Favourites · signed in, empty (`… · signed in, empty light/dark`)
Same as §4.24 without the button. Body: "Tap the heart on any piece to keep it here."

### 4.26 States (section 05)
Caption: *"Loading · empty · offline · locked. Shown as the content area only."* Each is a 390 × 520 content crop (no bars), L/D.

**Today · loading**: a 300 pt `skel` block (the painting), then padding 30 × 24, gap 14, skeleton bars (§3.24): 120 × 12 (caption), 200 × 14 (composer), 100 % × 26 and 70 % × 26 (two title lines), 85 % × 16 (+6 top, hook). Apply the same treatment to Piece and Library loading (not drawn separately).

**Search · empty**: search row (padding 24 top / 16 h; in the real screen 66 top) with the query "Sibelius" and "Cancel"; centred empty block (§3.23 search variant): title "Nothing for “Sibelius” yet" (Literata 500 20); body "We add one piece a day. Try a composer from the library, or a term like “coda”." (SF 15/1.5 `ink2`, padding 0 48).

**Today · offline, nothing cached**: offline block (§3.25): striped image area with the cloud-off icon; "SATURDAY, 4 OCTOBER" (accent label; date format "EEEE, d MMMM"); "You’re offline"; "Today’s piece will appear as soon as you reconnect. Pieces you have opened before stay readable offline."; "Try again". This implies an **offline cache of every opened piece**: persist the full Piece JSON plus images (SwiftData or file cache).

**Library row · locked vs. open**: open row "Tchaikovsky · 1893 · Today" / "Symphony No. 6 in B minor, “Pathétique”" with a chevron; locked row "Beethoven · 1808" / "Symphony No. 5 in C minor" with a lock 18. The annotation is quoted in §4.11.

---

## 5. Native SwiftUI mapping vs custom drawing

| Element | Native (iOS 26+) | Custom work |
|---|---|---|
| Tab bar + separate search circle | `TabView` with `Tab(…)` ×3 + `Tab(role: .search)`, which draws the glass capsule + circle | Custom icons as template images. The selected capsule tint comes from the system. Design: `glassInk @ 12 %` |
| Glass chips/buttons | `.glassEffect(.regular, in: .capsule/.circle)`, `.buttonStyle(.glass)`, `GlassEffectContainer` for groups (the nav row's heart + expand) | none |
| Primary clear glass button | `.buttonStyle(.glass)` / `.glassEffect(.clear.interactive())`, `.controlSize(.extraLarge)` | Height 54 / padding 32 via a label frame. Do not hand-draw the specular unless the system look is rejected |
| Reduce Transparency / Increase Contrast | Automatic for system glass | Only for custom fallbacks: read `accessibilityReduceTransparency` and `colorSchemeContrast` |
| Top bars on the Piece page | `NavigationStack` + `.toolbar` with `ToolbarItem(placement: .topBarLeading/.topBarTrailing/.principal)` and `.toolbarBackground(.hidden)`. iOS 26 renders items on glass. `.scrollEdgeEffectStyle(.soft, for: .top)` replaces the 120 pt fade | Toolbar content changes once the movements begin (heart/expand → switcher + glossary). Drive it from scroll position |
| Painting under the status bar | `.ignoresSafeArea(edges: .top)`; `.backgroundExtensionEffect()` optional | Focal-point cropping (`alignment` + `.clipped()`) |
| Movement switcher | — | **Custom** glass segmented capsule; pin/dock behaviour |
| Listening-stop timeline | — | **Custom** rail (dot + line) and reading-focus state machine (`onScrollGeometryChange` / `scrollPosition(anchor: .center)`) |
| Glossary terms in prose | `AttributedString` with link + `.underlineStyle(.patternDot)` | **Custom** for exact 1.5 pt / 4 pt offset (TextKit wrapper), active highlight |
| Sheets with detents | `.sheet` + `.presentationDetents([.height(h)], [.medium], [.large])`, `.presentationDragIndicator(.visible)`, `.presentationBackgroundInteraction`, `.presentationBackground(dcBackground)` for the solid large sheets | Height measurement for the content-sized glossary/onboarding sheets |
| Settings | `List(.insetGrouped)` + `NavigationLink` + `Picker` for Theme/Language | Literata large title; row background colour |
| Search | `.searchable` in the search tab; `.searchSuggestions` for recents | Grouped result rows with highlighted match (`AttributedString` ranges) |
| Library filters | `Menu` with a glass button style | Segmented All/Favourites (custom glass) |
| Glossary A–Z | `List` + `.sectionIndexLabel` (iOS 26) / custom rail | Rail styling (accent, 10 pt) |
| Paywall | StoreKit 2 `Product` + custom view | Plan cards, badge |
| Time picker | `DatePicker(.wheel, .hourAndMinute)`; `UIDatePicker.minuteInterval = 5` via a representable | Card + band if not using the system wheel |
| Artwork viewer | `.fullScreenCover`, `ScrollView` + `MagnifyGesture` (or a `UIScrollView` representable for real zooming) | Caption overlay |
| Toast | — | **Custom** glass capsule overlay + announcement |
| Forms | `TextField`/`SecureField` with `textContentType` | The fixed-label grouped form card |
| Keep awake | `isIdleTimerDisabled` | — |
| Delete-account confirmation | `.alert` with `.cancel` / `.destructive` roles | none |
| Favourites removal | `List` + `.swipeActions(edge: .trailing) { Button(role: .destructive) }`, or a plain `ScrollView` with a custom swipe | Filled-heart trailing button |
| Empty states | `ContentUnavailableView` | Literata title, accent icon, tint action |
| Loading | `.redacted(reason: .placeholder)` | Exact skeleton bars, if wanted |
| Open Mail | `openURL(URL(string: "message://")!)` | — |
| Account page | `List(.insetGrouped)` with `Section(footer:)`; `.foregroundStyle(.dcDanger)` on the Delete row | Literata large title + email subtitle |

---

## 6. Data the UI needs

Fields marked * are required for layout. Types are suggestions for the API (Postgres on Neon; Railway backend). The content source (`dailyclassical-launch-content.md`) already uses a matching YAML shape (`id, composer, title, catalogue, key, year, duration_min, movement_count, hook, reference_recording{conductor, orchestra, label, year, spotify_url}, also_recommended[], painting{artist,title,year,collection,pairing_note}`) and `[[term]]` glossary markup.

### 6.1 Entities

**Piece**
| Field | Type | Shown where |
|---|---|---|
| id* | slug (`tchaikovsky-symphony-6`) | navigation, favourites |
| publishDate* | date | Today date chip (`4 / Saturday / October 2026`); "Today" sub-label on the composer sheet |
| composerId* | → Composer | link, sheet |
| composerName*, composerSurname* | string | "Pyotr Ilyich Tchaikovsky"; "Tchaikovsky" in search sub-lines and stop notes |
| title* | string (may contain a nickname in curly quotes) | Today, Piece, Library, Search |
| shortTitle | string | "Symphony No. 6, “Pathétique”" (composer sheet row) |
| catalogue, key | string | part of the title today ("Op. 74", "B minor"); keep separate for search ("B minor" matched) |
| year* | int | meta lines |
| durationMinutes* | int | "About 46 minutes" |
| movementCount* | int | "4 movements", switcher |
| hook* | string | Today, Piece |
| era | enum/string | Library "Era" filter |
| painting* | → Painting | hero, captions, viewer, thumbnails |
| bigPicture* | [richText] (3–5) | facts |
| movementMap | richText | "In one line: …" |
| movements* | [Movement] | table + sections |
| threads* | [{lead: string, body: richText}] | Threads |
| recordings* | [Recording] (1–3, first = reference) | Recordings card/sheet, stop note, durations footnote |
| sources | {paintingCredit, recordingSource: "Spotify", durationsFrom} | Sources and credits |
| isLocked (per user) | bool, computed: premium or today's piece | lock marks, paywall routing |
| isFavourite (per user) | bool | heart state |

**Movement**
| Field | Type | Notes |
|---|---|---|
| number* | int → roman numeral | "I" |
| tempo* | string | "Adagio – Allegro non troppo" |
| key* | string | "B minor" |
| metre* | string | "4/4", "12/8 and 4/4" |
| duration* | string mm:ss (or seconds) | "19:44"; from the reference recording |
| summary | richText (glossary links) | |
| mainIdeas | [{name, description: richText}] (2–3) | |
| listeningStops | [ListeningStop] | |
| thingsToNotice | [richText] (2–3) | |
| inThisRecording | richText? | optional section |
| isTemplateOnly | bool | content not yet written (dev placeholder) |

**ListeningStop**
| Field | Type | Notes |
|---|---|---|
| order* | int | |
| timeKind* | enum `single` / `range` / `none` | drives the dot style and label |
| start, end | seconds? | for `single` (start) and `range` (start, end); rendered "≈ m:ss" / "≈ m:ss to m:ss" |
| label | string? | for `none`: "Mid-development", "Near the end" |
| hear* | richText | "What you hear" |
| happening* | richText | "What is happening" (supports italics and glossary links) |

**RichText**: plain text with inline runs: `term(glossaryId)`, `emphasis`, `strong`. Source markup is `[[term]]` and `*em*`. Deliver as Markdown or as a span array, e.g. `{"text":"…","spans":[{"type":"term","id":"sonata-form","range":[…]}]}`.

**GlossaryTerm**
| Field | Type | Shown |
|---|---|---|
| id* | slug | |
| term* | string | sheet title, list, search |
| short* | string (1 line) | list sub-line, search result |
| definition* | richText (1–2 sentences) | sheet body |
| letter | derived | list grouping, A–Z rail |

**Composer**
| Field | Type | Shown |
|---|---|---|
| id*, name*, surname* | string | |
| birthYear*, deathYear* | int | "1840 – 1893" |
| nationality*, era* | string | "Russian · Romantic era" |
| facts* | [{label, value: richText}] (4 shown: Born, Died, Symphonies, Best known for) | facts grid |
| bio* | [richText] (≈3 paragraphs) | |
| portrait* | → Painting (with focalPoint) | sheet hero + caption |
| pieces | [Piece summary] | "In DailyClassical" |

**Painting**
| Field | Type | Shown |
|---|---|---|
| imageURL* (+ sizes: 200 / 600 / 900 / full) | url | thumbs 40/44/64, hero, viewer |
| width, height | int | aspect ratio for the viewer and placeholders (portrait/landscape/square) |
| focalPoint | {x, y} 0–1 | cropping (composer portrait 0.5/0.18; paywall 0.5/0.3) |
| artist*, title*, year* (string: "c. 1818") | string | captions |
| collection* | string | "State Tretyakov Gallery, Moscow" |
| medium | string | "Oil on canvas" (viewer) |
| rights* | string | "Public domain" |
| pairingNote | string | (not shown in the design) |

**Recording**
| Field | Type | Shown |
|---|---|---|
| conductor*, ensemble* | string | "Teodor Currentzis, musicAeterna" |
| label*, year* | string, int | "Sony Classical · 2017" |
| isReference* | bool | badge, stop-time note |
| spotifyURL / spotifyURI | url? | Open in Spotify |

**User / account**
| Field | Type | Shown |
|---|---|---|
| email | string? (nil = guest) | Settings › Account row; sign-in forms |
| favourites | [pieceId] | heart, Library › Favourites |
| entitlement | enum `free` / `monthly` / `lifetime` | Settings "Free"; locks |
| reminderTime | time? (local, 5-minute steps) | Settings "08:00", onboarding |
| theme | enum system/light/dark | Settings |
| language | enum (en at launch) | Settings |
| hasCompletedOnboarding | bool (local) | |

**Products (StoreKit, not API)**: `lifetime` (non-consumable) and `monthly` (auto-renewable). Use `displayName` and `displayPrice` for the plan cards and the CTA.

### 6.2 Per-screen needs
| Screen | Data |
|---|---|
| Today | piece(today): publishDate, painting{image, artist, title, year, collection}, composerName, title, hook, year, durationMinutes, movementCount |
| Piece page | full Piece + movements + stops + glossary ids + recordings + sources; user.isFavourite |
| Glossary sheet | GlossaryTerm{term, definition} |
| Recordings sheet | recordings[] (reference first), spotify URLs |
| Composer sheet | Composer + portrait + pieces[] (with "Today" flag) |
| Library | pieces[] (excluding future): thumbnail, composerSurname/composerName, year, title, isLocked; filters: composers[], eras[]; favourites[] |
| Library › Glossary | glossary[] sorted, letters present |
| Search | query → {pieces[] with match ranges, composers[], glossary[]}; recent queries (local) |
| Paywall | StoreKit products; the paywall painting (configurable) |
| Settings | user.email, reminderTime, theme, textSize (system), language, entitlement |
| Artwork viewer | painting{full image, size, artist, title, year, medium, collection, rights} |
| Onboarding | today's piece (preloaded behind the card); reminderTime default 08:00 |
| Auth | POST sign-up {email, password ≥ 8}; POST sign-in; POST password-reset {email} (sends an emailed link that **expires in 30 minutes**; the copy depends on it); change email; change password; sign-out; DELETE account (removes the account and favourites; the IAP entitlement stays with the Apple ID) |
| Settings › Account | user.email |
| Offline | locally cached Pieces previously opened (full content + images); `publishDate` of today for the offline header |
| Favourites | PUT/DELETE favourite (auth required); GET list → [{pieceId, composerSurname, year, title, thumbnail, **savedAt** (rendered "Saved today" / "Saved 28 September"), isLocked}] sorted by savedAt desc |

---

## 7. Inconsistencies and open questions

1. **Two "Open in Spotify" button specs.** Piece top (sections 02, 03) uses bottom 22 / height 50 / padding 24 / no fade. Section 07 uses bottom 40 / height 54 / padding 32 + a 150 pt fade. **Resolved:** the section-06 token sheet specifies 54 / 32 / 40 + fade.
2. **Today meta** includes "· 4 movements"; the Piece header meta does not.
3. **Nav row changes in mid-scroll** (heart + expand → glossary book + centred switcher). The transition rule and the book button's destination are not annotated.
4. **Search field position**: drawn at the top with Cancel. iOS 26's search tab defaults the field to the bottom. Decide whether to accept the system placement.
5. **Brief vs canvas tabs**: the brief says three tabs; the canvas adds the separate search circle. The canvas wins: `Tab(role: .search)`.
6. **States**: section 05 draws Today loading, Today offline, Search empty and Library locked/open, and section 07 draws the Favourites empty states. **Still not drawn:** Piece-page loading/offline, Library loading/offline, glossary/search loading, network/auth error messages (wrong password, email already used, invalid email), and the Composer/Era filter menus. Their copy is in `strings-en.md` under "Proposed".
7. **Search groups**: the brief lists Pieces, Composers and Glossary plus recent searches. The canvas shows only Pieces and Glossary.
8. **Composer sheet note** uses "his"; consider gender-neutral copy for other composers and for localisation.
9. **Light RT background colour**: the light RT frame uses `#F5F2EC` (bg) for glass, while the CSS fallback and the section-06 rule ("Both become solid surface with a 1 pt outline") use `surface`. Prefer `surface`. Dark RT is not drawn.
10. **Sample email** in the Settings and auth frames is real-looking user data. Treat it as `{email}` and do not ship it as a fixture.
11. **Movement table first-row hairline**: every row has a top border inside the card, including the first. That looks unintended; suppress it on the first row.
12. **Large-detent sheet top = 72 pt** (composer, auth) on an 844 frame. The system `.large` detent leaves ≈ 10 pt plus the status bar on iOS 26, which is close. Accept the system value.
13. **Icon colour rule vs usage**: section 06 says "Icons are always glass-ink; umber is never used on an icon except the saved heart". But the paywall checkmarks, the empty-state heart and the Check-your-email mail icon are drawn in `accent`. Read the rule as applying to icons **on glass**; content icons may be accent.
14. **Open Library rows**: the State sheet shows a chevron on open rows; the main Library frame shows none. Follow the State sheet: the chevron on open rows, the lock replaces it on locked rows.
15. **Account page tab bar**: Settings › Account is drawn without the tab bar. Decide whether to hide it on pushed Settings details (`.toolbarVisibility(.hidden, for: .tabBar)`).
16. **Guest Settings › Account row**: not drawn. Suggest "Sign in" in `accent`, opening the sign-in prompt.
17. **Listening stop 8 ("Mid-development")** is rendered by the full-scroll template with a solid dot and the time style. The variants frame defines the no-time style (italic Literata label, hollow dot). Use the variants frame.
18. **Paywall listed as a glass sheet** in the token sheet but drawn as a solid page; see §2.8.
