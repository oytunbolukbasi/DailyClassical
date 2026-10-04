# DailyClassical – Design Brief

Oct 4, 2026 · @Oytun

## Product

DailyClassical is an iOS app that gives classical music lovers one great work a day, with a listening guide they can follow while the music plays. Think [DailyArt](https://www.getdailyart.com), but for symphonies.

- **What the user gets each day:** one piece, a movement-by-movement guide written in plain language, a paired public-domain painting, and links to recommended recordings on Spotify.
- **Who it is for:** curious listeners, not musicians. They love the music, read English comfortably, and want to hear more in what they already enjoy. No score reading is assumed.
- **The core moment:** the user presses play in Spotify, comes back to the app, and reads along. Every design decision should serve that moment: one hand, headphones on, eyes moving between a few lines of text.
- **Language:** English first. Turkish and other languages follow later.
- **Platform:** native iOS first, built in SwiftUI for iPhone, targeting iOS 26 and later and Apple's Liquid Glass design language. Design at 390 pt width; check 375 pt and 430 pt.

## Look and feel

The app should feel like a quiet museum wall label or a well-made concert programme: editorial, calm, generous with space. The painting and the text are the product; the interface stays out of the way.

- **Tone:** warm, knowledgeable, never academic. A friend who knows the piece, not a lecturer.
- **Imagery:** the hero of every piece is a public-domain painting chosen to match the mood of the music. Show it large and uncropped where possible, with a small caption (artist, title, year, collection). Never place text or logos on top of the painting.
- **Colour:** a neutral, paper-like light theme and a deep, ink-like dark theme. Dark matters as much as light, because much listening happens in the evening. One restrained accent colour for links, glossary terms and the primary button. The painting supplies the colour; the UI should not compete with it.
- **Type:** an editorial serif for piece titles and long reading text, a clean sans for UI labels, tables and buttons. Reading text must be comfortable for 10 to 20 minutes: generous line height, a measure of roughly 60 to 70 characters, support for Dynamic Type.
- **Icons:** a custom SVG icon set drawn for this app, not SF Symbols. The icons must work on Liquid Glass: single-colour line shapes with one consistent stroke weight, legible over any painting in light and dark, able to take the system tint, and scaling with text size. No emoji anywhere.
- **Motion:** minimal. Soft transitions between movements, a gentle sheet for the glossary. Nothing that distracts while listening.
- **What to avoid:** album-cover grids, music-player chrome (waveforms, progress bars), gamification (streak flames, badges), busy cards.

### Liquid Glass

The app must look and behave like a native iOS app built on Liquid Glass. Glass is the layer of controls that floats above the content; the content itself stays on solid surfaces so long reading remains comfortable. This follows Apple's guidance that Liquid Glass belongs to navigation and controls, not to content ([summary of the guidelines](https://dev.to/diskcleankit/liquid-glass-in-swift-official-best-practices-for-ios-26-macos-tahoe-1coo)).

| Surface | Treatment |
| --- | --- |
| Tab bar, navigation bar, toolbars | System Liquid Glass, using the standard components |
| Movement switcher (I, II, III, IV) | A floating glass control that stays in place while the guide scrolls beneath it |
| Primary buttons ("Start listening", "Open in Spotify") | Glass buttons; on Today the button floats over the painting |
| Glossary sheet, recordings sheet, paywall | System sheets with their glass appearance |
| Hero painting | Content. It runs edge to edge under the glass bars so its colours show through them |
| Reading text, listening-stop cards, tables | Content. Solid, opaque surfaces; no glass |

- The glass effect earns its place where the painting scrolls under the bars and controls. Design the Today screen and the top of the piece page around that moment.
- Use the system material, not a hand-made blur. It then follows the user's system settings automatically.
- Never stack glass on glass.
- Keep tint for the single primary action on a screen; everything else is neutral glass.
- Text on glass is limited to short labels: tab names, button titles, movement numbers.

## Screens

The app uses the standard iOS tab bar with three tabs (Today, Library, Settings) and one deep reading view, the piece page. Design the piece page first; everything else supports it.

| Screen | Purpose | Key elements |
| --- | --- | --- |
| Onboarding (2 to 3 steps) | Explain the idea and ask for notification permission | One sentence per step, sample painting, daily reminder time picker |
| Today | Present today's piece and invite the user in | Full-bleed painting, date, composer, title, one-line hook, total duration, "Start listening" button |
| Piece page | The listening guide itself | See "The piece page" below |
| Glossary pop-over | Explain a tapped term without leaving the text | Bottom sheet: term, one or two sentence definition, close |
| Recordings sheet | Send the user to Spotify | List of 2 to 3 recommended recordings: conductor, orchestra, year, "Open in Spotify" |
| Library | Browse past pieces | List or grid of painting thumbnails with composer and title; filter by composer and era; locked items for free users |
| Search (premium) | Find a piece, composer or term | Search field, recent searches, results grouped by pieces, composers, glossary |
| Paywall | Sell premium | See "Paywall and premium" below |
| Settings | Housekeeping | Notification time, theme (system, light, dark), text size, language, restore purchases, about and credits |
| Artwork viewer | Let the user enjoy the painting | Full-screen image with pinch to zoom, caption and credit |

**States to design for every data screen:** loading, empty, offline, and locked (premium).

## The piece page

Every piece follows the same content structure, so the design is a template that must hold for all ten launch symphonies. The order below is the reading order.

1. **Header:** painting, composer, title, key and opus, year, total duration, one-sentence hook.
2. **The big picture:** 3 to 5 short facts (when written, first performance, what the nickname means, why it matters) and a one-line map of the movements.
3. **Movement overview:** a compact table of movements with tempo marking, key, metre and duration. Each row jumps to that movement.
4. **Movement sections** (repeated per movement, usually four, sometimes five):
   - One-sentence summary of the movement.
   - **Main ideas:** two or three themes, each with a short name and a plain description (for example "Theme 2, longing: a broad melody on muted strings").
   - **Listening stops:** the centrepiece. An ordered list where each stop has an approximate time, "What you hear" and "What is happening".
   - **Things to notice:** two or three numbered tips.
   - Optional **"In this recording"** note.
5. **Threads that tie the piece together:** 3 to 5 recurring ideas across movements.
6. **Recommended recordings:** opens the recordings sheet.
7. **Sources and credits:** painting credit, recording data source.

### Listening stops

This component decides whether the app works. It is a three-field row (time, what you hear, what is happening) that a table would squeeze on a phone, so design it as a vertical timeline of cards instead.

- The time is a small label; "What you hear" is the prominent line, because the user matches it by ear; "What is happening" is secondary text.
- Times are approximate and tied to one named recording. Show them as "≈ 4:30" and state which recording they refer to at the top of the list.
- A stop can be a range ("≈ 9:30 to 10:30") or have no time at all ("Mid-development").
- Give the user a way to keep their place: a sticky movement switcher (I, II, III, IV) and a clear current-movement indicator. There is no audio sync; the user scrolls by hand.
- The screen must not dim or lock while the user is reading along.

### Glossary terms

Technical terms in the text (sonata form, coda, pizzicato, pedal note) are tappable. Mark them subtly, for example a dotted underline in the accent colour, so the text still reads as prose. A tap opens a bottom sheet with the term and a one or two sentence definition; the reader never leaves the page. A full glossary list also lives in Library.

### Recordings and Spotify

- The recordings sheet lists 2 to 3 recordings. The first is "the reference recording" that the listening-stop times belong to.
- Each row has an "Open in Spotify" action that deep-links to the album.
- Spotify rules to respect in the design: if album artwork from Spotify is shown, it must be unmodified, accompanied by the Spotify logo, and link back to Spotify ([Spotify Design Guidelines](https://developer.spotify.com/documentation/design)). The simplest compliant design shows no album artwork at all: text rows plus the Spotify icon on the button. Album covers are never used as the hero image.

## Paywall and premium

There are two plans: monthly at ₺150 and lifetime at ₺600. Lifetime costs the same as four months, so present it as the recommended choice.

|  | Free | Premium |
| --- | --- | --- |
| Today's piece, full guide | Yes | Yes |
| Glossary pop-overs | Yes | Yes |
| Spotify links | Yes | Yes |
| Search (pieces, composers, terms) | No | Yes |
| Full library of past pieces | No | Yes |

Search as a premium benefit is decided. The split for the library is an assumption to confirm; other premium benefits are still open, so leave room in the benefit list for one or two more lines.

**Paywall screen**

- A painting at the top, not a feature illustration. The pitch is "more of this", not a list of locks.
- Three or four benefit lines, plain language.
- Two plan cards: Lifetime (₺600, one-time, marked "Best value") and Monthly (₺150 per month). Lifetime is preselected.
- One primary button, then "Restore purchases", terms and privacy links.
- Prices are shown in the user's App Store currency; design the price as a variable-length string.

**Locked states**

- Library: past pieces are visible as painting thumbnails with titles, with a small lock mark. Tapping one opens the paywall. Showing what is inside sells better than hiding it.
- Search tab or field: visible to free users, opens the paywall on tap.
- Never interrupt the Today piece with a paywall.

## Sample content: Tchaikovsky, Symphony No. 6

Use this real copy in the mockups instead of placeholder text. It shows the true length and shape of the content; the first movement is the longest section any piece will have.

**Header**

- Composer: Pyotr Ilyich Tchaikovsky
- Title: Symphony No. 6 in B minor, Op. 74, "Pathétique"
- Year: 1893 · Duration: about 46 minutes
- Hook: A symphony that ends not in triumph but in silence.
- Painting: Isaac Levitan, *Above the Eternal Peace*, 1894. State Tretyakov Gallery, Moscow.

**The big picture**

- Written between February and August 1893 and dedicated to his nephew, Vladimir Davydov.
- First performed on 28 October 1893 in St Petersburg, conducted by Tchaikovsky. He died nine days later.
- The Russian title means "passionate" or "full of feeling", not "pathetic".
- Tchaikovsky reverses the usual order: the thrilling march comes third, and the slow movement comes last.
- In one line: struggle and longing (I), a graceful dance with a limp (II), a false victory (III), acceptance and fading (IV).

**Movement overview**

|  | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Adagio – Allegro non troppo | B minor | 4/4 | 19:44 |
| II | Allegro con grazia | D major | 5/4 | 7:44 |
| III | Allegro molto vivace | G major | 12/8 and 4/4 | 8:36 |
| IV | Finale: Adagio lamentoso | B minor | 3/4 | 10:21 |

Durations are from the reference recording: Teodor Currentzis, musicAeterna (Sony Classical, 2017).

**Movement I, summary**

The heart of the symphony. A restless theme born in darkness meets the most famous, warmest melody Tchaikovsky ever wrote. The movement is in \[\[sonata form\]\]: the themes are introduced, thrown into conflict, and brought back.

**Movement I, main ideas**

- Theme 1, unrest: a short, climbing, questioning \[\[motif\]\]. First on a lone bassoon in slow motion, then fast and nervous in the violas.
- Theme 2, longing: a broad melody that drifts downward on muted strings. The first moment of light.

**Movement I, listening stops** (times are approximate)

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A single bassoon over dark, hollow double basses | The introduction. The seed of Theme 1, in slow motion |
| ≈ 2:00 | Violas play the same idea, fast and anxious; strings and woodwinds trade phrases | The main section begins with Theme 1. Tension climbs step by step |
| ≈ 4:30 | Everything calms; a wide, singing melody on muted strings | Theme 2. The signature tune of the symphony |
| ≈ 6:30 | Flute and bassoon in conversation over a pulsing string accompaniment | The middle of Theme 2, a little more animated |
| ≈ 8:00 | The famous melody returns in the full orchestra | Theme 2 at its fullest |
| ≈ 9:30 to 10:30 | A solo clarinet lets the melody fade to almost nothing | Tchaikovsky writes pppppp here, the quietest marking in the score |
| ≈ 10:30 | A sudden, violent crash; then fast, chasing string passages | The development. Theme 1 is torn apart |
| Mid-development | A slow, hymn-like phrase in trombones and trumpets | A quotation from the Russian Orthodox funeral service |
| ≈ 12:30 to 14:30 | Theme 1 returns inside the storm; trombones descend step by step over rolling timpani | The return and the climax fused together. The most tragic moment |
| ≈ 15:00 | The famous melody comes back, brighter | Theme 2, now in B major: the same tune, but like peace that has been earned |
| ≈ 18:00 | Strings pluck a slowly falling scale (\[\[pizzicato\]\]); above it, a calm brass \[\[chorale\]\] | The \[\[coda\]\]. The storm has passed; the ending is peaceful, but it points downward |

**Movement I, things to notice**

1. The bassoon idea in the introduction and the viola theme of the Allegro are the same notes; only the speed changes.
2. Theme 2 comes three times. Compare how the orchestration changes each time.
3. The falling plucked scale at the end is the first hint of the finale's "falling line".

**Threads that tie the piece together**

- The falling line: almost every important melody in the symphony moves downward.
- The pulse: a repeated single note like a heartbeat in the second movement returns in the double basses at the very end, slows, and stops.
- Darkness to darkness: the symphony begins and ends in the lowest instruments.

**Glossary entries used above**

| Term | Definition |
| --- | --- |
| Sonata form | A three-stage structure: themes are introduced (exposition), worked and set against each other (development), and brought back (recapitulation). |
| Motif | The smallest musical idea, just a few notes, from which a theme is built. |
| Pizzicato | Plucking the strings of a string instrument with the finger instead of using the bow. |
| Chorale | Slow, hymn-like writing that moves in solemn chords. |
| Coda | A closing section added to the end of a movement. |

In the copy above, double square brackets mark tappable glossary terms.

**Recordings sheet**

- Reference recording: Teodor Currentzis, musicAeterna. Sony Classical, 2017.
- Two further rows use the same layout; their content is still to be chosen.

## Launch catalogue

The app launches with ten major symphonies, each written in the same structure as the Tchaikovsky sample. The list below is a proposal, used here so the Library and Search mockups have realistic rows; the final ten may change.

| Composer | Work | Year |
| --- | --- | --- |
| Mozart | Symphony No. 40 in G minor | 1788 |
| Beethoven | Symphony No. 5 in C minor | 1808 |
| Beethoven | Symphony No. 9 in D minor, "Choral" | 1824 |
| Schubert | Symphony No. 8 in B minor, "Unfinished" | 1822 |
| Berlioz | Symphonie fantastique | 1830 |
| Brahms | Symphony No. 4 in E minor | 1885 |
| Tchaikovsky | Symphony No. 6 in B minor, "Pathétique" | 1893 |
| Dvořák | Symphony No. 9 in E minor, "From the New World" | 1893 |
| Mahler | Symphony No. 5 | 1902 |
| Shostakovich | Symphony No. 5 in D minor | 1937 |

**What this range means for the design**

- Titles vary from short ("Symphony No. 5") to long with a nickname. Headers must handle two or three lines.
- Movement counts vary: two (Schubert), four (most), five (Berlioz, Mahler). The movement switcher cannot assume four.
- Durations vary from about 25 to 70 minutes, so the number of listening stops per piece varies widely.
- Each piece gets its own public-domain painting; paintings come in portrait, landscape and square formats. The hero area must look good with all three.

## Constraints and deliverables

**Technical constraints**

- Built natively in SwiftUI for iOS 26 and later. Use standard system components (navigation stack, tab bar, toolbars, sheets with detents, scroll views) so Liquid Glass, Dynamic Type and accessibility behaviour come from the system rather than from custom code.
- Content is stored in a Neon Postgres database and delivered as structured text; the backend is deployed on Railway. Nothing in the layout may depend on hand-tuned text per piece.
- Purchases go through Apple in-app purchase: one subscription (monthly) and one non-consumable (lifetime).

**Localisation**

- English at launch. Turkish and other languages later, so allow about 30% text expansion in buttons, tabs and plan cards.
- No text baked into images.

**Accessibility**

- Dynamic Type support for all reading text.
- Contrast of at least 4.5:1 for body text in both themes.
- Tap targets of at least 44 pt, including glossary terms inside running text.
- Glossary terms must be distinguishable by more than colour alone.

* Every glass surface must stay legible with the system settings Reduce Transparency and Increase Contrast switched on. Show the Today screen in that state.

**What to deliver**

1. Two or three visual directions for the Today screen and the top of the piece page, to choose from before going further.
2. In the chosen direction: all screens in the Screens table, in light and dark.
3. The piece page as one long scroll using the Tchaikovsky sample content, including all eleven listening stops of Movement I.
4. The listening-stop component in its variants: single time, time range, no time.
5. Glossary bottom sheet, recordings sheet, paywall, and locked Library state.
6. A small component and token sheet: colours, type scale, spacing, buttons, cards, list rows, a note of which surfaces are Liquid Glass and which are solid, and the custom icon set as SVG, shown on glass over a light and a dark painting.

**Out of scope for this round**

- Audio playback inside the app or syncing the guide to the music.
- iPad, Android and widget layouts.
- User accounts and social features.
