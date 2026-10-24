# Verification: Mozart – Serenade No. 13 in G major, K. 525, "Eine kleine Nachtmusik"

Piece id: `mozart-eine-kleine-nachtmusik` (form `orchestral`).
Files: `content/drafts/en/mozart-eine-kleine-nachtmusik.md`, `content/drafts/tr/mozart-eine-kleine-nachtmusik.md`. Shared-file additions: `content/research/mozart-eine-kleine-nachtmusik.shared.md`.
Checked on 2026-10-24 (batch October 2026 second batch, group C). Method: Spotify embed `__NEXT_DATA__` from a Turkish network, MusicBrainz and Discogs APIs, English Wikipedia (wikitext), Mutopia Project LilyPond/MIDI score for bar structure. The web-search budget ran out during the session; everything below was read directly from the URLs given.

---

## 1. Reference recording: Herbert von Karajan / Berliner Philharmoniker (DG, 1981)

### Spotify embed check

Album `6CdIDKRlOFGvor0KrpCsdw`: *Mozart: Eine Kleine Nachtmusik*, 13 tracks, `https://open.spotify.com/embed/album/6CdIDKRlOFGvor0KrpCsdw`.

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| **1** | **Eine kleine Nachtmusik, K. 525: I. Allegro** | **5:35** | 335333 | true |
| **2** | **… II. Romance. Andante** | **5:28** | 328200 | true |
| **3** | **… III. Menuetto. Allegretto** | **2:28** | 148000 | true |
| **4** | **… IV. Rondo. Allegro** | **3:17** | 197160 | true |
| 5–7 | Serenata notturna, K. 239 (Brandis, Maas, Resa, Zepperitz, BPh, Karajan) | | | true |
| 8–13 | Divertimento in B-flat, K. 287 (orch. perf.) | | | true |

Total K. 525: 1008.7 s = 16:48 → `duration_min: 17`. Durations in the guide are the track times truncated to the second (same convention as the existing notes). Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Karajan, Berliner Philharmoniker | Spotify credits "Berlin Philharmonic, Herbert von Karajan"; MusicBrainz recording 3f167002-0ede-43bc-895a-6ed84cfe3e3b: conductor Karajan, performing orchestra Berliner Philharmoniker | https://musicbrainz.org/recording/3f167002-0ede-43bc-895a-6ed84cfe3e3b | VERIFIED |
| Spotify album = DG 431 272-2 | catalogue field | MusicBrainz release 03177dd9-89fc-47ad-87be-c1b9ef2dfb0f (DG 431 272-2, 1991) links this Spotify album; barcode 00028943127226 on release 33576e4c | https://musicbrainz.org/release/03177dd9-89fc-47ad-87be-c1b9ef2dfb0f | VERIFIED |
| First issue | 400 034-2 (with Grieg *Holberg Suite* and Prokofiev *Classical*), 1982 | MusicBrainz release f3a935a6 (DG 400 034-2, 1982-12-15, DE); Discogs 11847171 "℗ 1982" | https://musicbrainz.org/release/f3a935a6-c037-4b29-b270-1fa96b53120a ; https://www.discogs.com/release/11847171 | VERIFIED |
| Recorded / venue | January–February 1981, Philharmonie, Berlin | MusicBrainz recording relations: recorded at Berliner Philharmonie 1981-01-28 to 1981-02-24; balance Günter Hermanns; producer Günther Breest | MusicBrainz recording above | VERIFIED (secondary database) |
| Repeats | Exposition repeated in I, second half not | Inferred from the track length: 192 bars played (55 × 2 + 82) at ≈ 137 crotchets per minute fits 5:35; with both repeats the tempo would be ≈ 196, impossible | – | INFERRED |

## 2. Also recommended: Karl Böhm / Wiener Philharmoniker (DG)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `0hW6ynjNi7YlrOgBK84aeT` | *Mozart: Eine kleine Nachtmusik; Posthorn Serenade*; K. 525 = tracks 1–4: 6:13 (373760) / 5:57 (357973) / 2:24 (144800) / 4:53 (293133), all `isPlayable: true` | embed page | VERIFIED |
| Catalogue | 415 843-2 | MusicBrainz release 4a9d4275 (DG 415 843-2, 1987-03-16) links this Spotify album; Discogs 3268397 | https://www.discogs.com/release/3268397 | VERIFIED |
| Recorded / venue | October 1974, Großer Musikvereinssaal | MusicBrainz recording relations: 1974-10, Wiener Musikverein, Großer Musikvereinssaal; producer Werner Mayer | https://musicbrainz.org/release/4a9d4275-b8bc-44e5-9476-b1eef8330e27 | VERIFIED (secondary) |
| release_year | 1976 | Discogs 3268397 notes: "℗ 1971 (KV 320) / 1976 (KV 525)" | same | VERIFIED |

---

## 3. Facts in the guide

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Entered in Mozart's catalogue on 10 August 1787 in Vienna; he was working on the second act of *Don Giovanni* | Wikipedia (Holoman 1992 pp. 397–398; catalogue entry "Den 10-ten August") | VERIFIED (secondary) |
| Purpose unknown; not known whether performed in his lifetime; Hildesheimer suggests a commission whose first performance went unrecorded; most serenades were commissions | Wikipedia (Rexroth 2017; Hildesheimer 1991 p. 215) | VERIFIED (secondary) |
| Name from the catalogue entry "Eine kleine Nacht-Musick"; literally "a little night music"; Zaslaw/Cowdery: probably just noting "a little serenade" | Wikipedia (Zaslaw & Cowdery 1991 p. 250; Grove "Nachtmusik") | VERIFIED (secondary) |
| Entry lists five movements, a minuet and trio after the Allegro; that movement lost, no one knows who removed it (Einstein) | Wikipedia (catalogue entry quoted in full; Einstein 1962 p. 207) | VERIFIED (secondary) |
| Published around 1827 by André after Constanze sold it with a bundle of manuscripts | Wikipedia (Holoman p. 397) | VERIFIED (secondary) |
| Scoring: two violins, viola, cello, double bass; often played by string orchestra | Wikipedia (Holoman p. 397) | VERIFIED |
| I: sonata form, rising "Mannheim rocket" opening, second theme in D major, exposition repeated, short development | Wikipedia; bar structure from the Mutopia score (development bars 56–75) | VERIFIED |
| II: Romance in C major, rondo A–B–A–C–A + coda, C section in C minor, middle A shortened to its first half; sections begin mid-bar (Heartz: gavotte, double upbeat) | Wikipedia (Manze 2003; Heartz 2009 p. 185); Mutopia score | VERIFIED |
| II: in the C minor episode second violins and violas play fast repeated semiquavers under short phrases with turns in the first violins | Mutopia LilyPond parts (`02_andante/violin2.ily`, `viola.ily`, `violin1.ily`) | VERIFIED (score) |
| III: minuet G major, trio D major, *sotto voce* | Wikipedia; Mutopia trio marking "sotto voce" | VERIFIED |
| IV: called Rondo but in sonata form; recapitulation begins with only the last bars of the first theme, in the minor; development begins in E-flat | Wikipedia ("only its last two bars return, and in the parallel minor"); Mutopia score: bar 57 theme in E-flat (key signature change), bars 79–83 cadence phrase with B-flat (G minor) | VERIFIED |
| IV metre 2/2 | Mutopia edition `\time 2/2` with a half-bar upbeat. Wikipedia's list says 2/4, but its own music example (`\time 2/4 \partial 2`) only makes sense in 2/2 | VERIFIED (score); Wikipedia inconsistent |
| In this recording: tracks 1–4, then K. 239 and K. 287 | Spotify embed | VERIFIED |

Not used: the farmed-fish and hill-slope studies in Wikipedia's "Modern reception", Hogwood's and Dart's substitutes for the lost minuet.

---

## 4. Painting: Jean-Antoine Watteau, *Mezzetin* (ca. 1718–20)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Antoine Watteau (French, 1684–1721), *Mezzetin*, ca. 1718–20 | Met collection API object 437926 | VERIFIED |
| Collection | The Metropolitan Museum of Art, New York, Munsey Fund, 1934 (34.138) | https://www.metmuseum.org/art/collection/search/437926 | VERIFIED |
| Medium / size | Oil on canvas, 55.2 × 43.2 cm | Met API | VERIFIED |
| Image | Commons `File:Jean-Antoine Watteau - Mezzetin.JPG`, 2261 × 2904, `{{PD-Art|PD-old-100-1923}}`, source the Met (34.138). The Met's own open-access file DP170811 is smaller (1520 × 1932); `isPublicDomain: true` | https://commons.wikimedia.org/wiki/File:Jean-Antoine_Watteau_-_Mezzetin.JPG | VERIFIED. Not NC |
| Not already used | No *Mezzetin* in `content/paintings.yaml`. Watteau is there once (*Fêtes vénitiennes*, `vivaldi-four-seasons-spring`) | – | Artist reused: allowed only if clearly the best match (see below) |

**Pairing.** K. 525 is a serenade; Mozart's catalogue title means "a little serenade" (Zaslaw). *Mezzetin* is the best-known painted serenade: the Italian-comedy lover Mezzetin singing to his guitar in a garden. The note claims only that. The link is to the genre, not to Vienna or 1787; the two alternatives in the shared note give a place link (Bellotto) and a 1780s string ensemble (Guardi). If the reuse of Watteau is unwelcome, take alternative A.

---

## 5. Glossary

Existing terms used: sonata form, exposition, development, recapitulation, coda, rondo, minuet, trio, tutti. New: **Mannheim rocket**, **Romance** (rows in the shared note; Romance and Mannheim rocket are also used by `mozart-piano-concerto-20`).

---

## 6. Re-time

All stops are estimates from bar positions (Mutopia score, Breitkopf-based) × the track's average tempo; none was heard. Average bar lengths: I 1.745 s (192 bars played, exposition repeat only); II 3.35 s (98 bars played with all repeats, ≈ crotchet 72, matching the track length); III 1.68 s (88 bars: minuet and trio with repeats, da capo without); IV 1.20 s (≈ 164 bars, the opening 8-bar theme repeated, no second-half repeat).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro | 5:35 (track 1) | 0:00, 0:17, 0:33, 0:47, 1:00, 1:36, 3:12, 3:47, 4:30, Last 15 seconds | 4:30 (recapitulation second theme, bar ≈ 101) and whether Karajan really omits the second-half repeat (Mutopia marks one) |
| II Romance | 5:28 (track 2) | 0:00, 0:54, 1:47, 2:47, 3:14, 4:11, 5:01 | Depends on Karajan taking every repeat in A and B; if he skips any, 1:47 onwards shift earlier |
| III Menuetto | 2:28 (track 3) | 0:00, 0:27, 0:54, 2:01 | Whether the da capo is played with repeats (then the trio starts ≈ 0:46 and the da capo ≈ 1:42) |
| IV Rondo | 3:17 (track 4) | 0:00, 0:20, 0:48, 1:17, 1:44, 2:07, Last 20 seconds | 1:44 (G minor return) and 2:07 (bar ≈ 99) |
