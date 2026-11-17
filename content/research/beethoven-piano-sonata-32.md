# Verification: Beethoven – Piano Sonata No. 32 in C minor, Op. 111

Piece id: `beethoven-piano-sonata-32` (form `piano-sonata`; `soloists` only).
Files: `content/drafts/en/beethoven-piano-sonata-32.md`, `content/drafts/tr/beethoven-piano-sonata-32.md`. Shared-file additions: `content/research/beethoven-piano-sonata-32.shared.md`.
Checked on 2026-11-17 (batch November 2026, group A). Score: Craig Sapp's Humdrum encoding, https://github.com/craigsapp/beethoven-piano-sonatas (`kern/sonata32-1.krn`, `-2.krn`: bar numbers, tempo words, metres, repeat structure, dynamics). Status key: VERIFIED / SECONDARY / INFERRED.

---

## 1. Reference recording: Wilhelm Kempff (DG, rec. January 1964)

My choice: Kempff's stereo cycle, the Op. 111 widely admired and on a short DG album with one track per movement.

### Spotify embed check

Album `3cS6w1hujyiNMpBFZfJtRO`: *Beethoven: Piano Concerto No.5; Piano Sonata Op.111*, 5 tracks. Embed fetched 2026-11-17 from a Turkish network: https://open.spotify.com/embed/album/3cS6w1hujyiNMpBFZfJtRO

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1–3 | Piano Concerto No. 5 (Kempff / Leitner) | – | – | track 1 **false**, 2–3 true (not part of this piece) |
| **4** | **Piano Sonata No.32 In C Minor, Op.111: 1. Maestoso - Allegro con brio ed appassionato** | **8:54** | 534360 | **true** |
| **5** | **… 2. Arietta (Adagio molto semplice e cantabile)** | **15:24** | 924200 | **true** |

Both Op. 111 tracks playable → allowed (the brief requires every track *of the work* to be playable). Note for the merge: the Emperor research note records that track 1 of this album is blocked in Turkey; that does not affect this piece. Total 1 458 560 ms = 24:19 → `duration_min: 24`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Wilhelm Kempff | Kempff (credited on both tracks) | embed | VERIFIED |
| Label / catalogue | DG, 419 468-2 (CD, with Piano Concerto No. 5) | DG 419 468-2, released 1987-08-03, UPC 028941946829; MusicBrainz links this Spotify album to that release | https://www.discogs.com/release/24420221 ; https://musicbrainz.org/release/3085fca1-ae91-4ea1-bbfd-3e39c23b8d8a | VERIFIED |
| Recorded / venue | January 1964, Beethovensaal, Hanover | MusicBrainz: both Op. 111 tracks "recorded at Beethovensaal, 1964-01" | MusicBrainz release above (API, `inc=recording-level-rels+place-rels`) | VERIFIED (secondary). The rest of Kempff's stereo cycle was also made in the Hanover Beethovensaal (see `beethoven-piano-sonata-21.md`) |
| release_year / year | 1964 | Discogs CD notes: "℗ 1: 1962 / 2: 1964 Polydor International" (2 = Op. 111) | Discogs 24420221 | VERIFIED (℗ year; original LP number not checked) |
| Production (not in yaml) | – | Producers Elsa Schiller, Otto Gerdes; recording supervisors Hans Weber, Otto Gerdes; engineers Heinz Wildhagen, Werner Wolf (credits for the CD as a whole) | Discogs 24420221 | – |

MusicBrainz CD lengths: 8:56 / 15:24 (536066 / 924200 ms); Spotify I is 2 s shorter.

**Also recommended:** none added. Candidate: Pollini (DG, late sonatas, 1975–77); no Spotify album id verified in time.

---

## 2. Facts

Main source: en.wikipedia, https://en.wikipedia.org/wiki/Piano_Sonata_No._32_(Beethoven)

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written 1821–22; `year: 1822` | en.wikipedia ("written between 1821 and 1822") | SECONDARY. `year` = completion |
| Aged fifty-one | Born Dec 1770 → 51 for almost all of 1822 | VERIFIED |
| Last of 32 sonatas; last of three planned together (Opp. 109–111) in summer 1820 | en.wikipedia ("conceived of the plan for his final three piano sonatas … during the summer of 1820") | SECONDARY |
| Dedicated to Archduke Rudolf | en.wikipedia | SECONDARY |
| Two movements; Schindler (unreliable) said Beethoven had no time for a third; sketches suggest he gave up the third movement himself | en.wikipedia (History: "as the second movement took form, Beethoven gave up the idea of a third movement"; Critical commentary: Schindler anecdote, "notoriously unreliable source") | SECONDARY. Told as a claim |
| Largely ignored by contemporaries; entered leading pianists' repertoire in the second half of the 19th century | en.wikipedia | SECONDARY |
| Thomas Mann, *Doctor Faustus*: Kretschmar's lecture on why there is no third movement | en.wikipedia, Legacy (ch. 8 quotation: "A return after this parting – impossible!") | SECONDARY |
| I: Maestoso full of diminished sevenths; left hand leaps down a seventh | en.wikipedia (John Lill on the downward leap) | SECONDARY |
| I: low trills in the introduction | Humdrum (bass trills in the Maestoso, bars ≈ 11–16) | INFERRED from the score encoding (not re-read note by note) |
| I: second theme in A-flat major, with *Meno allegro* / *Adagio* slowing | en.wikipedia (submediant, A-flat); Humdrum bars 52–55 (Meno allegro, Ritard, Adagio, Tempo 1o) | VERIFIED |
| I: fugal passages; development as a fugato | en.wikipedia ("notable for its passages in fugal texture"); development placement (bars 72–91) from Humdrum structure | SECONDARY; "development = fugato" INFERRED from memory of the score |
| I: ends with a Picardy third (quiet C major) | en.wikipedia | SECONDARY |
| I: exposition repeat in Kempff | Humdrum expansion `[A,B,B1,B,B2,C]` (bars 19–69 repeated). Without the repeat Kempff's Allegro would be ≈ 3.0 s a bar (quarter ≈ 79), far too slow; with it ≈ 2.1 s a bar | INFERRED – check by ear |
| II: "Arietta" = little song; theme in 9/16; L'istesso tempo; variations subdivide the beat (6/16, 12/32, then 9/16 with triplet 32nds) | en.wikipedia; Humdrum metres (9/16, 6/16 bar 36, 12/32 bar 54, 9/16 bar 73) | VERIFIED |
| II: five variations and a coda | en.wikipedia ("a set of five variations on a 16-bar theme … with a final coda") | SECONDARY. The guide names variations 1–5 and treats the trill passage and the E-flat passage as free episodes |
| II var. 3: loud, swinging, often compared to jazz/boogie-woogie (Uchida, Stravinsky, Denk; Schiff disagrees) | en.wikipedia; Humdrum *f* bars 54–72 | SECONDARY. Guide says "many listeners hear something like jazz" |
| II var. 4: *pp*, low then high (*leggiero*) | Humdrum (*pp* bar 73, *leggiero* bar 81) | VERIFIED (score) |
| II: chain of trills, E-flat passage, return to C | Humdrum (trills bars 112–118 with *f* at 115; key signature E-flat bars 125–140, C from 141) | VERIFIED (score) |
| II coda: trill held by the right hand while the melody continues | From memory of the score (the "triple trill" passage) | INFERRED – check by ear |
| Threads: after Op. 111, the Diabelli Variations and the Bagatelles, no more sonatas | en.wikipedia (History) | SECONDARY |

---

## 3. Painting: Thomas Cole, *The Voyage of Life: Old Age*, 1842

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Thomas Cole (1801–1848), *The Voyage of Life: Old Age*, 1842 (second set of the series) | Commons file description; Wikidata Q19900107 | VERIFIED (secondary) |
| Collection | National Gallery of Art, Washington, Ailsa Mellon Bruce Fund, 1971.16.4 (NGA object 52453) | Commons file description | VERIFIED (secondary) |
| Medium / size | Oil on canvas, 133.4 × 196.2 cm | Commons | VERIFIED (secondary) |
| Rights | Artist died 1848. `{{PD-Art|PD-old-auto-expired|deathyear=1848}}`; the NGA's own donated file (4000 × 2691) is CC0 | https://commons.wikimedia.org/wiki/File:Thomas_Cole_-_The_Voyage_of_Life_Old_Age,_1842_(National_Gallery_of_Art).jpg ; https://commons.wikimedia.org/wiki/File:Thomas_Cole,_The_Voyage_of_Life_-_Old_Age,_1842,_NGA_52453.jpg | VERIFIED. Not NC |
| Image | **5100 × 3431** (NGA online collection source) | Commons API imageinfo | VERIFIED |
| Not already used | Cole not in `content/paintings.yaml` (checked 2026-11-17) | – | VERIFIED |

**Pairing.** No historical link: Cole painted the series twenty years after the sonata, in America. The link is the image: the voyager, now old, has passed through rough water to a still, dark sea while light breaks through above, which matches the sonata's path from a C minor storm (I) to the slow Arietta that ends at the top of the keyboard. The pairing note claims only that. Landscape format, good for the hero.

---

## 4. Glossary

Existing terms reused: variation, sonata form, fugue, exposition, development, fugato, recapitulation, coda, trill. **No new terms.**

---

## 5. Re-time

No stop was heard. Derived from Humdrum bar positions × average seconds per bar.

- I (track 4, 534.4 s): Maestoso bars 1–16 assumed ≈ 105 s (≈ 6.5 s a bar, slow and broad). Allegro: bars 17–18, 19–69 twice (repeat), 70–71, 72–159 = 194 bars, plus ≈ 18 s for the three slowings (bars 52–55, 119–122, 127–133) → ≈ 2.12 s a bar. Theme 1 bar 17 → 1:45; theme 2 ≈ bar 50 → 2:55; repeat → 3:43; development bar 72 → 5:42; recapitulation ≈ bar 92 → 6:24; coda last ≈ 20 s. Bass trill ≈ bar 11 → ≈ 1:10–1:20.
- II (track 5, 924.2 s): played bars from the Humdrum expansion (all repeats): theme 32, var. 1 32, var. 2 34, var. 3 34, then bars 73–186 (114) once. Weighted by beats per bar (9/16 = 3, 6/16 and 12/32 = 2) → 670 beats, ≈ 1.38 s a beat (≈ 4.14 s per 9/16 bar). Var. 1 → 2:12; var. 2 → 4:25; var. 3 → 5:59; var. 4 (bar 73) → 7:33; trills (bar ≈ 112–115) → 10:10–10:27; E-flat (bar 125) → 11:08; C major (bar 141) → 12:15; coda trills ≈ bar 160 → 13:34. Real performances slow the theme and speed var. 3 (en.wikipedia), so var. 2–3 may come earlier and var. 4 later than this.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Maestoso – Allegro con brio ed appassionato | 8:54 (track 4) | 0:00, 1:20, 1:45, 2:55, 3:45, 5:40, 6:25, Near the end | 1:45 (length of Kempff's Maestoso is a guess; everything after it shifts with it); 3:45 assumes the exposition repeat |
| II Arietta. Adagio molto semplice e cantabile | 15:24 (track 5) | 0:00, 2:10, 4:25, 6:00, 7:35, 10:25, 11:10, 12:15, 13:35, Near the end | 4:25 and 6:00 (variation speeds differ in practice); 11:10 |
