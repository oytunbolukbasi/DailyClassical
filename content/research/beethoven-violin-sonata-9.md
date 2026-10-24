# Verification: Beethoven – Violin Sonata No. 9 in A major, Op. 47 "Kreutzer"

Piece id: `beethoven-violin-sonata-9` (form `sonata`). Drafts: `content/drafts/en/beethoven-violin-sonata-9.md`, `content/drafts/tr/beethoven-violin-sonata-9.md`. Shared-file material: `content/research/beethoven-violin-sonata-9.shared.md`.
Checked on 2026-10-24 (batch October 2026, second batch, group D).

**How the checks were done**
- **Spotify:** public embed page `https://open.spotify.com/embed/album/<id>` read with curl (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`), `__NEXT_DATA__` JSON: track titles, credits, `duration` (ms), `isPlayable`. This machine's network is in Turkey, so `isPlayable: true` = playable in Turkey. Album pages' `og:description` / `music:release_date` also read (digital-edition dates).
- **Discogs** public API `https://api.discogs.com/releases/<id>`; **MusicBrainz** `https://musicbrainz.org/ws/2/release/<id>?inc=recordings+recording-level-rels+place-rels`.
- **Score / bar plan:** no machine-readable score was available for this sonata (no Humdrum or OpenScore encoding found; IMSLP files sit behind a disclaimer page that was not accepted). Bar positions below are approximate, from the standard (Henle/Breitkopf) layout as remembered, cross-checked only for the facts Wikipedia states (18-bar introduction; second theme in E major). They were not checked against a score scan. Treat every stop as an estimate.
- **Status key:** VERIFIED = seen in a primary or reliable secondary source. INFERRED = derived. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Itzhak Perlman, Vladimir Ashkenazy (Decca, 1973)

My choice (no product-owner favourite given): the Perlman/Ashkenazy Decca cycle, widely admired and complete on Spotify as the Nos. 9 & 10 album.

### Spotify embed check: `https://open.spotify.com/album/2lMv4BnMgLRLOOuiidkn8c`

Album name *Beethoven: Violin Sonatas Nos.9 & 10*; `og:description` "Ludwig van Beethoven · album · 1977 · 7 songs"; `music:release_date` 1977-01-01. Every track credited "Ludwig van Beethoven, Itzhak Perlman, Vladimir Ashkenazy".

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| **1** | **Violin Sonata No. 9 in A Major, Op. 47 "Kreutzer": I. Adagio sostenuto – Presto** | **11:52** | 712600 | true |
| **2** | **… II. Andante con variazioni** | **16:30** | 990866 | true |
| **3** | **… III. Finale. Presto** | **8:54** | 534000 | true |
| 4–7 | Violin Sonata No. 10 in G Major, Op. 96, I–IV | 10:37 / 6:44 / 1:55 / 8:59 | 637640 / 404400 / 115466 / 539293 | true |

Sonata total 2 237 466 ms = 37:17 → `duration_min: 37`. Status: VERIFIED.

Rejected: `031OPHlabOl1cEQSWC1ViP` (same performance coupled with No. 5, 11:48 / 16:26 / 8:51, all playable) is a fine alternative link; the Nos. 9 & 10 album was preferred because its track times match the original LP/CD masters most closely (see below).

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Perlman (violin), Ashkenazy (piano) | same | embed; https://www.discogs.com/release/8711194 | VERIFIED |
| Label / catalogue | Decca, "SXL 6632 (LP, with Sonata No. 2); 436 895-2 (CD, with Sonata No. 10)" | SXL 6632 (1974): Kreutzer + Sonata No. 2. CD 436 895-2 (Decca, GB, 1994): Nos. 9 & 10 = the Spotify album's programme. Producer Christopher Raeburn, engineer Kenneth Wilkinson | https://www.discogs.com/release/8711194 ; https://musicbrainz.org/release/5c9f5b2b-5e05-489c-80b9-9dfcffb95e16 ; https://musicbrainz.org/release/3916dfde-c291-4f46-a640-cedba4baf6b7 | VERIFIED |
| Recorded / venue | October 1973, Kingsway Hall, London | Sleeve of SXL 6632: "Recorded October 1973 in Kingsway Hall, London"; MusicBrainz: recorded at Kingsway Hall 1973-10 (Op. 47); Op. 96 1975-11 | same | VERIFIED |
| release_year / year | 1974 / 1974 | ℗© 1974 (SXL 6632). Recording year is 1973; `year` follows the Pathétique example (release year). | Discogs 8711194 | VERIFIED (recording 1973) |
| Spotify | 2lMv4BnMgLRLOOuiidkn8c | as above | embed | VERIFIED |

**Durations, CD vs Spotify.** 436 895-2 (MusicBrainz): 11:55 / 16:30 / 8:58; SXL 6632: 11:52 / 16:30 / 8:57. Spotify: 11:52 / 16:30 / 8:54. Same recording.

**Exposition repeats (INFERRED).** Movement I at 11:52 with an 18-bar Adagio of about 1:10 implies the Presto exposition is repeated (without it the Presto would run at about half note = 110, far too slow for *Presto*; with it about half note = 143). Finale: Perlman 8:54 against Oistrakh/Oborin 6:58 (below); the ~2-minute difference is about one exposition, so Perlman repeats the finale's exposition and Oistrakh does not. Both statements in the guide's "In this recording" notes rest on this inference. **Confirm by ear.**

## 2. Also recommended: David Oistrakh, Lev Oborin (Philips, 1962)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Oistrakh (violin), Oborin (piano) | same | embed of `3nOccw5YvokOK6HCBOgKQU` | VERIFIED |
| Label / catalogue | Philips / null | ℗ 1962; reissued Decca/Esoteric ESSD-90120 (2015). Original LP number not recorded | https://www.discogs.com/release/13823333 ; https://musicbrainz.org/release/59fd3c68-27f7-4be6-b926-ea0e14877a14 | VERIFIED (label); catalogue UNVERIFIED |
| Recorded / venue | "1962", Paris | Esoteric notes: "Recorded … in Paris, 1962" | Discogs 13823333 | VERIFIED (city and year only) |
| Spotify | https://open.spotify.com/album/3nOccw5YvokOK6HCBOgKQU | *Beethoven: The Violin Sonatas*, compilation, 2001, 32 tracks; Op. 47 = tracks 27–29, 11:40 / 15:23 / 6:58 (700173 / 923333 / 418506 ms), all `isPlayable: true` | embed | VERIFIED |

## 3. Facts in the guide

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written in spring 1803 for George Bridgetower (`year: 1803`) | DE Wikipedia ("entstand überwiegend im Frühjahr 1803"; Ries: written for Bridgetower): https://de.wikipedia.org/wiki/Violinsonate_Nr._9_(Beethoven) ; EN: https://en.wikipedia.org/wiki/Violin_Sonata_No._9_(Beethoven) | VERIFIED (secondary) |
| Bridgetower grew up in England, visiting Vienna | https://en.wikipedia.org/wiki/George_Bridgetower (moved to London at an early age; in Vienna 1803) | VERIFIED |
| First performance 24 May 1803, Augarten, Beethoven at the piano | DE and EN Wikipedia. Time of day disputed: Ries says 8 a.m., Rosenbaum's diary noon (DE). The guide gives no time | VERIFIED |
| Bridgetower read the slow movement from Beethoven's copy, over his shoulder | EN Wikipedia, George Bridgetower ("had to read the violin part of the second movement from Beethoven's copy, over his shoulder") | VERIFIED (secondary; anecdote from Bridgetower via Thirlwall) |
| Joking dedication on the working manuscript | DE Wikipedia: working autograph of movement I in the Beethoven-Haus with "Sonata mulattica …" | VERIFIED (secondary). The guide does not quote the wording, which uses a period racial term |
| Fell out; "silly quarrel about a girl" | DE Wikipedia (Bridgetower to J. W. Thirlwall: "they had some silly quarrel about a girl") | VERIFIED (secondary) |
| Published in Bonn in 1805, dedicated to Rodolphe Kreutzer | DE Wikipedia: first edition April 1805, Simrock (Bonn), dedication to Kreutzer | VERIFIED (secondary) |
| Kreutzer leading French violinist; never played it, found it unintelligible, according to Berlioz | DE Wikipedia (Berlioz 1844: "outrageusement inintelligible"); https://en.wikipedia.org/wiki/Rodolphe_Kreutzer | VERIFIED (secondary) |
| "in a very concertante style, almost like a concerto" | EN Wikipedia (Beethoven's title: "… in uno stile molto concertante come d'un concerto"; EN places it in the 1803 sketchbook; the wording also stands on the first edition) | VERIFIED (wording); the guide does not say where it was written |
| Finale first written for Op. 30 No. 1 | EN and DE Wikipedia | VERIFIED |
| Tolstoy's novella *The Kreutzer Sonata*, 1889; jealousy | EN Wikipedia (first published 1889) | VERIFIED |
| Janáček String Quartet No. 1 (1923) titled after Tolstoy's story | EN Wikipedia | VERIFIED |
| I: 18-bar introduction; only the first bars in A major; Presto in A minor; second theme E major; Adagio returns near the end | EN Wikipedia; DE Wikipedia ("das leise, sich in ganzen Noten erstreckende 2. Thema in E-Dur") | VERIFIED |
| I: violin opens alone with chords (double stops) | DE Wikipedia ("die Violine beginnt mit einem mehrstimmigen Solo") | VERIFIED |
| I: closing theme in E minor | Score knowledge, not checked against a scan | UNVERIFIED (descriptive) |
| II: F major theme and five variations; Var. 1 piano with trills over triplets, violin repeated notes; Var. 2 violin in fast notes (32nds); Var. 3 F minor; Var. 4 ornamental, trills; Var. 5 longest, slower, after a short Adagio | EN and DE Wikipedia | VERIFIED |
| III: piano chord opens; tarantella in 6/8; quieter 2/4 passages | DE Wikipedia ("Ein kraftvoller A-Dur-Akkord des Klaviers … Tarantella im 6/8-Takt … mehrere ruhigere Teile im 2/4-Takt"); EN Wikipedia | VERIFIED. **Sources disagree on the form**: EN "sonata form", DE "Rondo-Form". The guide's stops follow a sonata-form reading with exposition repeat (see §5) and avoid naming the form in the summary |
| Threads: main body of I in A minor | EN/DE Wikipedia (Präsent argues the main key is A minor) | VERIFIED |
| Metres 3/4 – 2/2, 2/4, 6/8 | Score knowledge (Adagio 3/4, Presto alla breve; Andante 2/4; finale 6/8 per DE) | VERIFIED for III; I–II from memory, UNVERIFIED |

Left out: the "Sonata mulattica" wording (racial term), Rita Dove's book, the Präsent key argument beyond one line.

## 4. Painting: Philip James de Loutherbourg, *An Avalanche in the Alps* (1803)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / dates | Philip James de Loutherbourg (1740–1812) | Commons licence template `deathyear=1812` | VERIFIED |
| Title / date | *An Avalanche in the Alps*, 1803 | https://www.tate.org.uk/art/artworks/de-loutherbourg-an-avalanche-in-the-alps-t00772 (HTTP 200); Wikidata Q18688361 (P571 1803) | VERIFIED |
| Collection | Tate (T00772), presented by the Friends of the Tate Gallery 1965 | Commons credit line; Wikidata P217 | VERIFIED |
| Medium / size | Oil on canvas, 109.9 × 160 cm | Wikidata Q18688361 | VERIFIED (Wikidata) |
| Image | `File:Phillip James De Loutherbourg - An Avalanche in the Alps - Google Art Project.jpg`, **2310 × 1580**, 1.27 MB; Tate photo via Google Arts & Culture | https://commons.wikimedia.org/wiki/File:Phillip_James_De_Loutherbourg_-_An_Avalanche_in_the_Alps_-_Google_Art_Project.jpg | VERIFIED |
| Rights | `Licensed-PD-Art|PD-old-100-1923`; photo of a 2-D PD work, no new right (EU DSM art. 14, US). Not NC | same | VERIFIED |

**Size caveat.** The file is 1580 px high, below 1800. The batch accepted smaller heights before (berlioz 966, tchaikovsky-symphony-6 1981), but the `beethoven-piano-sonata-23` research rejected this painting as first choice for that reason. If the merge wants ≥ 1800 px, take alternative 1 (Turner, *The Shipwreck*, 3200 × 2232).

**Pairing.** Same year (1803) and the city Bridgetower came from (London); the violent sublime of falling ice and tiny figures, matched to the fury of the first movement. No direct link between painter and sonata is claimed. A larger Commons photo (`Loutherbourg-Une avalanche de glace dans les Alpes.jpg`, 3218 × 2134) is a gallery snapshot under CC BY-SA 3.0 and was not used.

## 5. Re-time (every stop is an estimate)

No listening was possible. Model: steady tempo within each section, bar counts as stated, track lengths exact.

**I. Adagio sostenuto – Presto (11:52).** Adagio bars 1–18 ≈ 70 s (violin chords bars 1–4, piano answers from bar 5 ≈ 0:20). Presto bars 19–599 (alla breve), exposition 19–193 repeated, Adagio interjection ≈ bars 575–578 (≈ 12 s). Presto bars played ≈ 752 → ≈ 0.84 s per bar (half note ≈ 143). Assumed bar positions (from memory, unchecked): theme 2 bar 91, closing theme bar 144, development 194, hushed passage ≈ 300, recapitulation 344, Adagio 575.

**II. Andante con variazioni (16:30).** Proportional: theme, Var. 1, 2 and 4 each ≈ T; Var. 3 (minor, slower) ≈ 1.2 T; Var. 5 + coda ≈ 2 T (longest). 7.2 T = 991 s → T ≈ 2:18. Stops at 0:00, ≈ 2:20, ≈ 4:35, ≈ 6:55, ≈ 9:40, ≈ 11:30–12:30 (slow transition, given as a range), last minute.

**III. Finale. Presto (8:54).** Exposition length ≈ 2:00 inferred from the Perlman–Oistrakh difference; development ≈ 1:20; recapitulation ≈ 2:00; coda with brief slowing ≈ last 40 s.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 11:52 | 0:00, 0:20, 1:10, 2:10, 2:55, 3:35, 6:05, 7:30, 8:10, 11:20, last 30 s | 7:30 and 8:10 (bar numbers from memory); 1:10 depends on how slowly the Adagio is taken |
| II | 16:30 | 0:00, 2:20, 4:35, 6:55, 9:40, 11:30–12:30, last minute | All: proportional only; variation lengths may differ by ±30 s |
| III | 8:54 | 0:00, 0:05, 0:50, 2:00, 4:00, 5:20, last 40 s | 2:00 (exposition repeat inferred) and 4:00 / 5:20 |
