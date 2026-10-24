# Verification: Schubert – Symphony No. 5 in B-flat major, D. 485

Piece id: `schubert-symphony-5` (form `symphony`). Drafts: `content/drafts/en/schubert-symphony-5.md`, `content/drafts/tr/schubert-symphony-5.md`. Shared-file material: `content/research/schubert-symphony-5.shared.md`.
Checked on 2026-10-24 (batch October 2026, second batch, group D). Method and status key as in `beethoven-violin-sonata-9.md`.

**Bar plan.** From the detailed analysis in DE Wikipedia, https://de.wikipedia.org/wiki/5._Sinfonie_(Schubert) (bar numbers per section, total bars, repeats; it cites the Bärenreiter Urtext study score among its literature). Not checked against a score scan.

---

## 1. Reference recording: Sir Thomas Beecham, Royal Philharmonic Orchestra (EMI, 1958–59)

My choice: a classic recording, regularly listed among the best Schubert recordings (Gramophone "50 greatest Schubert recordings" and Classic FM lists appeared in search results; not opened).

### Spotify embed check: `https://open.spotify.com/album/0D9ewgYo9BOcXY4g0nLS9I`

Album *Schubert: Symphonies Nos. 3, 5 & 6*; `og:description` "Franz Schubert · album · 2015 · 12 songs"; `music:release_date` 2015-08-06 (Warner remaster). Tracks credited "Franz Schubert, Sir Thomas Beecham, Royal Philharmonic Orchestra".

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1–4 | Symphony No. 3 | 7:34 / 5:07 / 5:19 / 5:21 | | true |
| **5** | **Symphony No. 5 in B-Flat Major, D. 485 "Symphony without Trumpets and Drums": I. Allegro** | **5:47** | 347036 | true |
| **6** | **… II. Andante con moto** | **8:50** | 530442 | true |
| **7** | **… III. Menuetto. Allegro molto - Trio** | **5:15** | 315663 | true |
| **8** | **… IV. Allegro vivace** | **5:50** | 350119 | true |
| 9–12 | Symphony No. 6 | 7:39 / 6:46 / 4:38 / 10:06 | | true |

Total 1 543 260 ms = 25:43 → `duration_min: 26`. VERIFIED.

Rejected: the older Beecham album `2H8HTlFUuJU2eymuJZjhay` has one Symphony No. 6 track with `isPlayable: false` (No. 5's tracks are playable there too, but the newer album is fully playable).

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Beecham, Royal Philharmonic Orchestra | same | embed; https://musicweb-international.com/classrev/dec99/beecham.htm | VERIFIED |
| Label / catalogue | EMI, "CDM 5 66984 2 (CD, with Symphonies Nos. 3 & 6)" | EMI Great Recordings of the Century CDM 5 66984 2 | MusicWeb (above); https://www.classical-music.com/reviews/orchestral/schubert-253 | VERIFIED. Original LP number not found |
| Recorded / venue | "May 1958 – May 1959", Salle Wagram, Paris, and Abbey Road Studios, London | Library record of the 1989 EMI CD: "2nd work recorded in Salle Wagram, May 14 & 16, 1958 and Studio No. 1, Dec. 18, 1958 & May 7, 1959" (works listed 3, 5, 6, so the 2nd work is No. 5) | https://search.library.wisc.edu/catalog/9910660984702121 | VERIFIED (mapping of "2nd work" to No. 5 inferred from the order) |
| release_year | 1960 | classical-music.com header: "ADD Reissue (1956, 1960)" (No. 6 1956; Nos. 3 & 5 1960, by inference) | classical-music.com | INFERRED |
| year | 1959 | last session May 1959 | library record | VERIFIED |

**Repeats (INFERRED).**
- I: 299 bars, exposition 1–117 (DE). 5:47 without the repeat = 1.16 s a bar (half note ≈ 103); with it 416 bars would need half note ≈ 144, far quicker than any recording checked. Karajan (7:09) is consistent with taking it. So Beecham omits it; the guide says so ("almost a minute and a half shorter").
- II: assumed Beecham plays the theme's written repeat of its second part (DE: "Beide Teile werden obligat wiederholt"); if not, stops after 1:18 move ≈ 50 s earlier.
- III: minuet and trio repeats taken, da capo without repeats (DE: "Menuetto da capo … ohne die Wiederholungen"). Without the repeats 5:15 would imply an implausibly slow minuet.
- IV: 394 bars; exposition 1–152 with internal repeats of the main theme section (77 bars played for 47 written). Beecham's 5:50 fits **no** exposition repeat at ≈ quarter 143 (Zinman's 8:13 with the repeat implies a similar tempo, ≈ quarter 148). Internal repeats of the main theme assumed taken. Not stated in the guide. **Confirm by ear.**

## 2. Also recommended: Leonard Bernstein, Royal Concertgebouw Orchestra (DG, live 1987)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `2VoJQ1XfcpgfVVkJ1VDeXV` | *Schubert: Symphonies Nos.5 & 8 "Unfinished"*, compilation, 1989; tracks 3–6 "… Live at Concertgebouw, Amsterdam, 1987", 7:14 / 11:12 / 5:37 / 5:36, all playable; credited Royal Concertgebouw Orchestra, Leonard Bernstein | embed | VERIFIED |
| Label | Deutsche Grammophon | Inferred from the album (DG Bernstein Schubert cycle); the embed does not name the label | – | INFERRED |
| Catalogue | null | not found | – | UNVERIFIED |

## 3. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Written September 1816, finished 3 October 1816; Schubert 19 | EN Wikipedia https://en.wikipedia.org/wiki/Symphony_No._5_(Schubert); DE ("gemäß Schuberts eigenen Eintragungen … September bis zum 3. Oktober 1816") | VERIFIED |
| For Otto Hatwig's amateur orchestra; Schubert viola, brother Ferdinand violin; first performed there that autumn | DE Wikipedia | VERIFIED (secondary) |
| Diary, 13 June 1816: "O Mozart! immortal Mozart!" | EN Wikipedia | VERIFIED |
| Smallest orchestra of his symphonies: 1 flute, 2 oboes, 2 bassoons, 2 horns, strings; no clarinets, trumpets, timpani | EN Wikipedia; DE (Besetzung) | VERIFIED |
| First public performance 17 October 1841, thirteen years after his death | DE Wikipedia (conducted by Michael Leitermayer) | VERIFIED |
| Published in the 1880s in the first complete edition, edited by Brahms | EN (1885), DE (1884): sources differ by a year, so "1880s" | VERIFIED |
| Distant keys, sudden minor turns, recapitulation in the "wrong" (subdominant) key | EN Wikipedia (subdominant recapitulation); DE (harmonic analysis) | VERIFIED |
| I: no slow introduction; 4-bar wind cadence; violins' run; theme bar 5 with bass imitation; *forte* tutti bars 41–64; theme 2 F major 65–92 strings then winds; closing group 92–117, first *ff*; development 118–170 opening with the wind cadence in D-flat; recapitulation 171 in E-flat; theme 2 at 231 in B-flat; scale passage 276–292 | EN Wikipedia; DE Wikipedia | VERIFIED |
| I: wind chords return, shortened, to lead into the recapitulation | DE: "einer diminuierten Bläserkadenz (diesmal nur 2 statt 4 Takte) in Takt 171". (DE's first paragraph says the cadence is left out at the recapitulation; its detailed paragraph says it returns shortened. The guide follows the detailed one.) | VERIFIED with caveat |
| II: E-flat, 6/8, 141 bars; transition to F-flat 24–27, episode in C-flat 27–66 (via G minor 41); reprise 67; E-flat minor 84–89; G-flat episode 93–117; coda 118–141; horns, *pianissimo* | DE Wikipedia | VERIFIED |
| III: G minor minuet, 88 bars, "Gstrampfter"-like; trio G major 40 bars, strings and solo bassoon, pedal points, Ländler-like; da capo without repeats | DE Wikipedia; EN (trio begins with bassoon and strings, held lower notes) | VERIFIED |
| IV: sonata form, 394 bars; minor outburst from 47 (B-flat / F minor, tremolos, runs); theme 2 F major after a fermata at 79; closing 125–152 (*p* fauxbourdon then *f*); development 153–236 (low strings vs high winds); recapitulation 237; minor transition 283; theme 2 at 321; no effective coda (Harnoncourt quoted) | DE Wikipedia | VERIFIED |
| Mozartian clarity | EN Wikipedia ("often said to resemble Mozart") | VERIFIED |

## 4. Painting: Jakob Alt, *View of Vienna from the Spinnerin am Kreuz* (1817)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Jakob Alt (1789–1872) | Commons creator | VERIFIED |
| Title / date | *Blick auf Wien von der Spinnerin am Kreuz*, 1817 | Commons | VERIFIED (Commons only) |
| Technique | Watercolour and bodycolour | Commons `{{technique|watercolor|and=bodycolor}}` | VERIFIED (Commons only) |
| Collection | Albertina, Vienna | Commons (`Museum:Albertina`, category "Paintings by Jakob Alt in the Albertina") | **UNVERIFIED on the museum's own site** (no Wikidata item; Albertina online search not attempted further) |
| Image | `File:Jakob Alt - Blick auf Wien von der Spinnerin am Kreuz.jpeg`, **6282 × 3378**, 16.6 MB; source "repro from artbook" | https://commons.wikimedia.org/wiki/File:Jakob_Alt_-_Blick_auf_Wien_von_der_Spinnerin_am_Kreuz.jpeg | VERIFIED |
| Rights | `PD-old-100` (artist died 1872); faithful reproduction of a 2-D PD work. Not NC | same | VERIFIED |

**Pairing:** Vienna one year after the symphony, from the hills on the city's southern edge; Schubert's city and the setting of the amateur orchestra. A watercolour rather than an oil; the catalogue's "painting" field has no medium rule that excludes it. If the merge wants an oil or a better-documented image, take alternative 1 (Runge, Hamburger Kunsthalle).

## 5. Re-time (every stop is an estimate)

- **I (5:47 = 347 s).** 299 bars, no repeat → 1.16 s a bar. Bars → times: 5 → 0:05, 41 → 0:46, 65 → 1:14, 92 → 1:46, 118 → 2:16, 171 → 3:17, 231 → 4:27, 276 → 5:19.
- **II (8:50 = 530 s).** Played bars = 38 (theme section with its repeats) + 118 = 156 → 3.40 s a bar. Bar 5 → 0:14, 9 → 0:27, repeat of 9–23 from 1:18, 24 → 2:09, 41 → 3:07, 67 → 4:35, 84 → 5:33, 93 → 6:04, 118 → 7:29.
- **III (5:15 = 316 s).** Minuet 26 × 2 + 62 × 2 = 176 bars, trio 16 × 2 + 24 × 2 = 80 bars at a 15 % slower pulse, da capo 88 bars → minuet ≈ 0.89 s a bar. Repeat 0:23; second section 0:46; trio 2:36; da capo 3:58.
- **IV (5:50 = 350 s).** Played bars 77 + 105 (exposition once) + 84 + 158 = 424 → 0.825 s a bar. 47 → 1:03, 79 → 1:29, 125 → 2:07, 153 → 2:31, 237 → 3:39, 283 → 4:17, 321 → 4:49.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 5:47 | 0:00, 0:05, 0:46, 1:14, 1:46, 2:16, 3:17, 4:27, 5:19 | 4:27 and 5:19 (tempo drift over the movement) |
| II | 8:50 | 0:00, 0:14, 0:27, 2:09, 3:07, 4:35, 5:33, 6:04, 7:29, last 20 s | Everything after 0:27 if Beecham skips the theme's second-part repeat (≈ 50 s earlier) |
| III | 5:15 | 0:00, 0:23, 0:46, 2:36, 3:58 | 2:36 and 3:58 (trio tempo assumed 15 % slower) |
| IV | 5:50 | 0:00, 1:03, 1:29, 2:07, 2:31, 3:39, 4:17, 4:49, last 20 s | All after 0:00 if the main-theme repeats are skipped (≈ 25 s earlier) or the exposition is repeated (every stop from 2:31 on ≈ 2:30 later, at a faster tempo) |
