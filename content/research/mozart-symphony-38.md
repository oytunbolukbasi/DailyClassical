# Verification: Mozart – Symphony No. 38 in D major, K. 504, "Prague"

Piece id: `mozart-symphony-38` (form `symphony`). Composer `mozart` already in `content/composers.yaml`.
Files: `content/drafts/en/mozart-symphony-38.md`, `content/drafts/tr/mozart-symphony-38.md`; shared-file additions in `content/research/mozart-symphony-38.shared.md`.
Checked on 2026-11-17 (November 2026 batch, group C). Method: Spotify embed `__NEXT_DATA__` with curl from a Turkish network; Spotify album page meta; Discogs API; MusicBrainz; English and German Wikipedia (wikitext; the German article gives bar numbers for all three movements); The Classic Review on the Mackerras set; Wikimedia Commons API. Generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent.

**Status key:** VERIFIED = confirmed in the source named. INFERRED = not confirmed. UNVERIFIED = not found.

---

## 1. Reference recording: Sir Charles Mackerras / Scottish Chamber Orchestra (Linn, 2007)

Why this one: the same widely praised set already used for `mozart-symphony-40` (same Spotify album) and `mozart-symphony-41`; all repeats observed.

### Spotify embed check (album `1EsOER6UdNfA5Lliol1o73`)

*Mozart: Symphonies Nos. 38-41*, 15 tracks, credited "Wolfgang Amadeus Mozart, Scottish Chamber Orchestra, Sir Charles Mackerras". Album page meta: release date 2008-07-01; "© 2018 Linn Records", "℗ 2018 Linn Records" (Linn's later digital edition of CKD 308).

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Symphony No. 38 in D Major, K. 504 "Prague": I. Adagio (Allegro) | 17:44 | 1063666 | true |
| 2 | … II. Andante | 11:18 | 678124 | true |
| 3 | … III. Finale (Presto) | 7:36 | 455791 | true |

Total: 2197.6 s = 36:38 → `duration_min: 37`. Status: VERIFIED.

**Do not use** the 2008 edition `0MNU78TPr4GbVdgRBsBL6L` (used by `mozart-symphony-41`): its No. 38 tracks 1 and 3 are `isPlayable: false` from Turkey (checked 2026-11-17).

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Sir Charles Mackerras; Scottish Chamber Orchestra | Spotify credits | embed | VERIFIED |
| Label / cat. no. / release | Linn Records, CKD 308 (2 SACDs, Symphonies 38–41), 2008 | Discogs 5369953, via `content/research/mozart-symphony-40.md` | https://www.discogs.com/release/5369953 | VERIFIED there |
| Recorded / venue | 3–9 August 2007, City Halls, Glasgow | Discogs 5369953 notes ("Recorded at City Hall, Glasgow, UK from 3-9 August 2007"), via `mozart-symphony-40.md`; The Classic Review (City Halls, August 2007) | same; https://theclassicreview.com/album-reviews/classics-revisited-mackerras-mozart-late-symphonies/ | VERIFIED |
| `year` | 2007 | recording year (the No. 40 guide uses 2008, the release year; the field is the recording year elsewhere, e.g. Haskil 1960/1961) | – | note for the merge |
| In this recording: natural horns and trumpets; repeats observed throughout; an earlier cycle with the Prague Chamber Orchestra | The Classic Review: brass "entirely period (natural horns and natural trumpets)"; "Repeats are observed throughout, including the development-section repeats that most conductors skip"; compares with the "earlier Prague" Telarc cycle with the Prague Chamber Orchestra | same | VERIFIED (secondary) |

## 2. Also recommended: Karl Böhm / Berliner Philharmoniker (DG, 1959)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `68LhgHInFJYsjJeBlbAPAE` | *Mozart: Symphonies Nos.35 "Haffner", 36 "Linzer", 38 "Prager", 39, 40, 41 "Jupiter"*; No. 38 = tracks 9–11: 10:22 (622000) / 8:34 (514000) / 6:17 (377000), all `isPlayable: true`, credited Berlin Philharmonic, Karl Böhm; page meta 1995-01-01, "℗ This Compilation ℗ 1995 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/68LhgHInFJYsjJeBlbAPAE | VERIFIED |
| Cat. no. | 447 416-2 (2 CDs, The Originals) | Discogs 2231391 / 5916789: DG 447 416-2, *Symphonien Nos. 35–41*, 1995, The Originals. That this is the Spotify album is INFERRED from the identical programme (35, 36, 38, 39, 40, 41) and year | https://www.discogs.com/release/2231391 | VERIFIED / match INFERRED |
| Recorded / venue / ℗ | October 1959, Jesus-Christus-Kirche, Berlin; ℗ 1960 | Discogs 9412368 (DG 480 7484, *Böhm – The Symphonies*, 2013) notes: "(P) 1960 (KV 318, 385, 504)"; "Recordings: Berlin, Jesus-Christus-Kirche, 10/1959 (KV 385, 318, 504)" | https://www.discogs.com/release/9412368 | VERIFIED |

Other recordings seen in search results (Solti/CSO, Marriner/ASMF, Walter/NYP) were not checked in the embed.

---

## 3. Facts in the guide

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Finished in Vienna, 6 December 1786 (Mozart's catalogue) | en.wikipedia *Symphony No. 38 (Mozart)*; de.wikipedia *38. Sinfonie (Mozart)* | VERIFIED |
| Finale begun earlier in 1786, during *Figaro* | de.wikipedia ("Die Arbeit am Schlusssatz wurde bereits im Frühjahr 1786 begonnen"); en.wikipedia (Tyson: the finale's paper matches *Figaro*'s) | VERIFIED |
| *Figaro*'s success in Prague; invitation by a group of musicians and patrons | en.wikipedia (Leopold Mozart's letter, January 1787); de.wikipedia ("Gesellschaft grosser kenner und Liebhaber", letter of 12 January 1787) | VERIFIED |
| Premiere 19 January 1787 in Prague, conducted by Mozart, at a concert the day after a *Figaro* performance; hence the name | en.wikipedia (Deutsch 1965, p. 285; infobox conductor); de.wikipedia ("einen Tag nach einer Aufführung des Figaro") | VERIFIED |
| Three movements, no minuet; very unusual for Vienna; reason unknown | en.wikipedia ("extraordinarily unusual"; "a definitive explanation … is still lacking") | VERIFIED |
| Lavish wind writing; Prague's wind players famous; or the result of his piano-concerto orchestration | en.wikipedia | VERIFIED |
| Orchestra: 2 flutes, 2 oboes, 2 bassoons, 2 horns, 2 trumpets, timpani, strings | en.wikipedia (NMA); de.wikipedia | VERIFIED |
| I: the longest slow introduction Mozart wrote; held D with drumroll; motif from bar 16 in minor keys, forte/piano; pedal on A bars 28–33; fermata on A7 | de.wikipedia ("Das Adagio ist die längste Einleitung, die Mozart je geschrieben hat") | VERIFIED |
| I: Allegro theme in lower strings over syncopated first violins, *piano*; wind fanfare; forte block bar 55; first theme in A major at bar 71 instead of the second theme; second theme bar 97 in A major, repeated in A minor with bassoon; development 143–207 opening with the fanfare motif imitated in the strings; recapitulation bar 208; both halves repeated; 302 bars | de.wikipedia | VERIFIED |
| I: "One analysis counts six separate melodies" | en.wikipedia ("six melodies are developed and recapitulated in a very contrapuntal example of sonata-allegro form") | VERIFIED |
| II: G major, 6/8, 148 bars, trumpets and drums silent; chromatic run in bar 3; staccato motif in unison strings bar 8, rising in the first violin from bar 10; five heavy forte E's bar 18 → E minor; second theme bar 35 over a pedal D, oboe/bassoon and strings in dialogue; development from about bar 59, first theme in C, D minor, E minor from bar 64 with dissonant wind entries; polyphonic passage from bar 83; recapitulation bar 94; coda 145–148 ending pianissimo in the bass | de.wikipedia | VERIFIED |
| II: second half repeated in this recording | de.wikipedia says development and recapitulation are **not** repeated in the score; the guide's stop "The second half is repeated" (≈ 7:50) rests on the timing (11:18 is too long for the exposition repeat only: 3.29 s/bar, dotted crotchet ≈ 36) and The Classic Review ("repeats observed throughout") | INFERRED – **check by ear first**; if Mackerras does not repeat, drop the ≈ 7:50 stop and rescale |
| III: D major, 2/4, 350 bars; main motif three upbeat quavers to a minim, then a syncopated falling line; forte block with timpani from bar 17; theme then in D minor by flutes and oboes; second theme bar 66; theme in A major in flute, oboe and bassoon bars 95–109; development alternating forte tutti with tremolo and the theme in the woodwinds; recapitulation bar 216; winds lead from bar 224; G minor tutti at bar 228; both halves repeated | de.wikipedia | VERIFIED |
| III: flute prominent, counterpointing the main melody in the development | en.wikipedia | VERIFIED |
| III: opening recalls the Susanna/Cherubino duettino in Act 2 of *Figaro* (Cherubino escaping from a locked room) | de.wikipedia (Scherliess 2005, Gersthofer 2007: parallels between the first theme and the start of the duettino Susanna/Cherubino, Act 2). The locked-room situation is the plot of that duettino (*Aprite, presto, aprite*) | VERIFIED (plot: general knowledge of the opera) |

---

## 4. Painting: Ferdinand Lepié, *The Old Town Square in Prague* (*Der Altstädter Ring in Prag*), 1864

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Ferdinand Lepié (1824–1883), *Der Altstädter Ring in Prag*, 1864 (signed and dated lower left) | https://digital.belvedere.at/objects/19060/der-altstadter-ring-in-prag ; Wikidata Q28015429 | VERIFIED (Commons data) |
| Collection | Belvedere, Vienna, inv. 10214 | Commons file name and source link | VERIFIED |
| Licence | Commons `{{Licensed-PD-Art|PD-old-auto-1923|cc-by-sa-4.0|deathyear=1883}}`: painting PD; Belvedere photo also CC BY-SA 4.0 (same situation as the Brand used for `haydn-string-quartet-op-76-3`; faithful photos of PD 2D works are unprotected in the EU, DSM art. 14, and the US) | https://commons.wikimedia.org/wiki/File:Ferdinand_Lepi%C3%A9_-_Der_Altst%C3%A4dter_Ring_in_Prag_-_10214_-_%C3%96sterreichische_Galerie_Belvedere.jpg | VERIFIED |
| Image | 3508 × 2579 px, landscape, clean edges (checked from a 960 px preview) | Commons API | VERIFIED |
| Not already used | No Lepié in `content/paintings.yaml` | – | VERIFIED |

Pairing: the place. The Old Town Square is a short walk from the Estates (Nostitz) Theatre, where *Figaro* played in Prague (en.wikipedia: the National Theatre, "now called the Estates Theatre"). The painting is 77 years later than the symphony; the note claims only the city. No good 1780s painting of Prague with an open, high-resolution image was found (Commons "Prague in the 1780s/1790s": small 1780 Eckarth prints, two 1792 etchings, see the alternatives).

---

## 5. Re-time

No stop was timed by ear. Bar numbers from de.wikipedia; seconds per bar = track length ÷ bars performed:

- I: Adagio 36 bars assumed to last ≈ 3:10 (5.3 s/bar, crotchet ≈ 45); Allegro 37–302 with both halves repeated (exposition 106 bars ×2, development + recapitulation 160 bars ×2 = 532 bars) in the remaining 873.7 s → 1.64 s/bar (crotchet ≈ 146).
- II: exposition taken as bars 1–58 (the development starts with the closing motif, before bar 64); both halves repeated (296 bars) → 2.29 s/bar (dotted crotchet ≈ 52). See the caveat in §3.
- III: exposition taken as bars 1–151 (end not given by the source); both halves repeated (700 bars) → 0.651 s/bar.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 17:44 | 0:00, 1:20 (b. 16), 2:25 (b. 28), 3:10 (b. 37), 3:40 (b. 55), 4:05 (b. 71), 4:50 (b. 97), 6:05 (repeat), 9:00 (b. 143), 10:45 (b. 208), 13:20 (repeat), near the end | The Adagio's length (3:10): every later stop shifts with it |
| II | 11:18 | 0:00, 0:16 (b. 8), 0:39 (b. 18), 1:18 (b. 35), 2:13 (repeat), 4:35 (b. 64), 5:20 (b. 83), 5:45 (b. 94), 7:50 (second-half repeat), last minute | Whether the second half is repeated at all (§3); the end of the exposition |
| III | 7:36 | 0:00, 0:10 (b. 17), 0:20 (≈ b. 31), 0:42 (b. 66), 1:01 (b. 95), 1:38 (repeat), 3:17 (development), 3:58 (b. 216), 5:26 (repeat), near the end | The end of the exposition (b. 151 assumed) |

## 6. Open items

1. Confirm by ear whether Mackerras repeats the second half of the Andante; then re-time all three tracks of `1EsOER6UdNfA5Lliol1o73`.
2. `year` field convention for the Mackerras set (2007 recording vs. 2008 in the No. 40 guide).
