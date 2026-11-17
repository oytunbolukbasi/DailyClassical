# Verification: Mozart – Piano Concerto No. 24 in C minor, K. 491

Piece id: `mozart-piano-concerto-24` (form `piano-concerto`). Composer `mozart` already in `content/composers.yaml`.
Files: `content/drafts/en/mozart-piano-concerto-24.md`, `content/drafts/tr/mozart-piano-concerto-24.md`; shared-file additions in `content/research/mozart-piano-concerto-24.shared.md`.
Checked on 2026-11-17 (November 2026 batch, group C). Method: Spotify embed `__NEXT_DATA__` with curl from a Turkish network; Spotify album page meta; Discogs API; English Wikipedia (wikitext, a featured article); Henle and Bärenreiter edition prefaces (PDF previews) for a few bar numbers; Wikimedia Commons API. Generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent. No score of the full concerto was fetched, so the stops are rougher than for the quintet (see §5).

**Status key:** VERIFIED = confirmed in the source named. INFERRED = not confirmed. UNVERIFIED = not found.

Note: the Haskil/Markevitch album used for `mozart-piano-concerto-20` (`0jkfLnBTAS5jOMf8QCHitf`) also contains K. 491 (tracks 4–6). A different recording is the reference here so the piece has its own; Haskil is the also-recommended.

---

## 1. Reference recording: Clifford Curzon / London Symphony Orchestra / István Kertész (Decca, 1967)

### Spotify embed check (album `1BrTUemQeJj8K5JJFeGQPZ`)

*Mozart: Piano Concertos Nos. 23 & 24*, 6 tracks, all credited "Wolfgang Amadeus Mozart, Sir Clifford Curzon, London Symphony Orchestra, István Kertész". Album page meta: release date 1968-11-01; "℗ 1968 Decca Music Group Limited", "© 2018 Decca Music Group Limited". (Found from track `7HDDjS3CWtEPwk8otzU1Us`, whose page links the album.)

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1–3 | Concerto No. 23, K. 488 | 11:18 / 7:02 / 8:14 | | true |
| 4 | Piano Concerto No. 24 in C Minor, K. 491: I. Allegro | 13:09 | 789160 | true |
| 5 | … II. Larghetto | 7:41 | 460986 | true |
| 6 | … III. Allegretto | 8:52 | 532066 | true |

Total K. 491: 1782.2 s = 29:42 → `duration_min: 30`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Clifford Curzon; István Kertész; London Symphony Orchestra | Spotify credits; Discogs 23281841: "Soloist, Piano – Clifford Curzon; Conductor – István Kertész; Orchestra – London Symphony Orchestra" | https://www.discogs.com/release/23281841 | VERIFIED |
| Label / cat. no. | Decca, SXL 6354 (LP, with No. 23) | Discogs 23281841 and 4344909 (SXL 6354, 1968; K. 488 and K. 491) | same; https://www.discogs.com/release/4344909 | VERIFIED |
| Recorded / venue | 6, 7, 9 and 11 October 1967, Kingsway Hall, London | Discogs 23281841 notes "Recorded 6,7,9&11 October 1967 at Kingsway Hall"; producer Ray Minshull, engineer Kenneth Wilkinson (uncredited on the sleeve) | same | VERIFIED |
| release_year | 1968 | Discogs 1968; Spotify ℗ 1968 | – | VERIFIED |
| Cadenza (I) | not named in the guide | Not stated on Spotify or Discogs | – | UNVERIFIED (the guide does not say whose cadenza Curzon plays) |

The 2001 Decca 2-CD set `5awaKfyuvVYryVIgsNsmdk` has the same performance (13:16 / 7:44 / 8:54, different mastering); not used. A Spotify page credits a 1954 Curzon/LSO K. 491 to Josef Krips: a different, older recording.

## 2. Also recommended: Clara Haskil / Orchestre des Concerts Lamoureux / Igor Markevitch (Philips, 1960)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `0jkfLnBTAS5jOMf8QCHitf` | *Mozart: Piano Concertos Nos.20 & 24*; K. 491 = tracks 4–6: 13:12 (791760) / 7:15 (435040) / 9:01 (541133), all `isPlayable: true`, credited Clara Haskil, Lamoureux Orchestra, Igor Markevitch | https://open.spotify.com/embed/album/0jkfLnBTAS5jOMf8QCHitf | VERIFIED |
| Label / cat. no. / release / venue | Philips 835 075 AY (LP, with No. 20), 1961; CD 464 718-2; Maison de la Chimie, Paris | See `content/research/mozart-piano-concerto-20.md` §1 (Discogs 4154594, 11926615; MusicBrainz) | – | VERIFIED there for the coupling |
| Recorded | November 1960 | The K. 466 sessions are dated 14–18 November 1960 in MusicBrainz; the K. 491 recording date was not checked separately, hence only the month | – | INFERRED (same sessions) |

---

## 3. Facts in the guide

All from en.wikipedia *Piano Concerto No. 24 (Mozart)* (featured article; its sources in brackets) unless stated: https://en.wikipedia.org/wiki/Piano_Concerto_No._24_(Mozart)

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Finished 24 March 1786, three weeks after No. 23 | Wikipedia | VERIFIED |
| Premiere early April 1786 at the Burgtheater, Mozart as soloist (3 or 7 April) | Wikipedia (Irving 2003) | VERIFIED ("early April") |
| Finished shortly before *Figaro*; K. 491 and K. 492 adjacent; opera almost all in major keys | Wikipedia (Kerman 1994) | VERIFIED |
| One of only two minor-key piano concertos, the other No. 20 in D minor | Wikipedia | VERIFIED |
| Largest orchestra of any Mozart concerto: flute, 2 oboes, 2 clarinets, 2 bassoons, 2 horns, 2 trumpets, timpani, strings; winds push the strings aside (Levin) | Wikipedia (Hutchings 1948; Levin) | VERIFIED |
| Solo part not written out in full; only outer notes of runs in places; Mozart improvised | Wikipedia (Mishkin 1975); Henle preface (bars 261–262 and 467–470 of I left as sketches) https://www.henle.de/media/d5/bb/40/1714637491/0787.pdf | VERIFIED |
| Manuscript at the Royal College of Music, London | Wikipedia (Donaldson gift, 1894) | VERIFIED |
| Beethoven admired it; reportedly told a colleague "we shall never be able to do anything like that"; Brahms wrote a cadenza | Wikipedia (Kinderman 1996; Wen 1990) | VERIFIED (told as a report) |
| I: 3/4; longer than any earlier Mozart concerto first movement; double exposition sonata form; orchestral exposition 99 bars; theme in unison, *piano*, uses all 12 notes in 13 bars | Wikipedia | VERIFIED |
| I: piano enters with an 18-bar solo, not the main theme; orchestra then states the theme and the piano takes it up from its 7th bar | Wikipedia | VERIFIED |
| I: cadential trill about 100 bars into the solo exposition, then a new woodwind theme; real end about 60 bars later | Wikipedia (Rosen 1976) | VERIFIED |
| I: development opens with the piano's entry theme in E-flat, a question repeated four times; stormy exchange (Girdlestone, Tovey) | Wikipedia | VERIFIED |
| I: no cadenza by Mozart survives; coda with the soloist playing on to the final *pianissimo* chords | Wikipedia (Girdlestone 1948) | VERIFIED |
| I: Mozart usually let the orchestra end a first movement alone | Wikipedia ("The conventional Mozartian coda concludes with an orchestral tutti and no written-out part for the soloist") | VERIFIED |
| II: E-flat major, cut time; trumpets and timpani silent; piano plays the four-bar theme alone, orchestra repeats; ABACA with sections in C minor and A-flat major | Wikipedia (Stock 1997; Tischler 1966) | VERIFIED |
| II: first sketch much more complex; simplified | Wikipedia | VERIFIED |
| II: episodes led by the winds | Levin's general remark (winds in all three movements); not stated for these episodes specifically | INFERRED – check by ear |
| III: theme and eight variations in C minor; first violins state the theme over strings and winds; piano enters in Var. I over austere strings; Vars. II–VI "double" variations; Var. IV A-flat major ("cheerful", Tovey), Var. V C minor, Var. VI C major ("graceful"); Var. VII half length, ends on a dominant chord announcing a cadenza; Var. VIII in 6/8, piano alone for 19 bars; neapolitan chords; coda "proclaims … the triumph of the minor mode" | Wikipedia (Girdlestone, Hutchings, Tovey, King) | VERIFIED |
| III: Var. III "louder and more forceful" | Not in the sources fetched | INFERRED – check by ear |
| No. 20 ends in D major | `content/en/pieces/mozart-piano-concerto-20.md` (finale ends in D major), Wikipedia K. 466 | VERIFIED |

---

## 4. Painting: Francisco de Goya, *The Snowstorm (Winter)* (*La nevada o El invierno*), 1786–87

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Francisco de Goya (1746–1828), *La nevada* (*El invierno*), tapestry cartoon, 1786–87 | Commons (`{{Art photo}}`, date 1786, source Museo del Prado); Fundación Goya en Aragón (1786–1787); Eclectic Light Co. (sketches shown autumn 1786, cartoons delivered 1787) https://eclecticlight.co/2021/07/21/francisco-goya-5-four-seasons/ | VERIFIED |
| Collection | Museo Nacional del Prado, Madrid, P000798; oil on canvas, 277 × 303.4 cm; cartoon for a tapestry for the Prince of Asturias' dining room at El Pardo; scene: cloaked peasants returning home through a snowstorm | Prado object page (via search snippet; scripted fetch blocked) https://www.museodelprado.es/en/the-collection/art-work/the-snowstorm-or-winter/4792e788-9131-4c68-a5a9-b0ed05063ad8 ; Commons category "La nevada o El Invierno (P000798)" | VERIFIED |
| Series | One of the Four Seasons cartoons (spring: the flower girls; summer: the threshing floor; autumn: the grape harvest; winter: the snowstorm) for the dining room at El Pardo | Eclectic Light Co.; search results (Fundación Goya en Aragón) | VERIFIED (secondary) |
| Public domain | Artist died 1828. Commons `{{PD-old-100-expired}}`; faithful photograph from the Prado | https://commons.wikimedia.org/wiki/File:18_La_nevada_o_El_Invierno.jpg | VERIFIED |
| Image | 1920 × 1772 px (near square). The smallest painting in `paintings.yaml` is 1784 px wide, so this is within the current range but at its low end | Commons API | VERIFIED |
| Goya already used | Yes, once (`Witches' Sabbath`, 1820–23). Chosen anyway as the clearly best match: same year as the concerto and a dark scene inside a bright series, as the concerto sits beside *Figaro* | – | note |

---

## 5. Re-time

No stop was timed by ear and no full score was available, so stops come from the bar landmarks in Wikipedia and the Henle preface plus assumed bar counts, at an average tempo.

- I: assumed 523 bars (orchestral exposition 1–99, piano entry 100, theme 118, first trill ≈ 200, end of solo exposition ≈ 261–265 per Henle, development ≈ 283, recapitulation ≈ 362, end of recapitulation 467–470 per Henle, cadenza fermata ≈ 485). 1.27 s/bar, cadenza ≈ 2:05. **The bar numbers 283, 362, 485 and the total of 523 are recollections, not checked against a score.**
- II: assumed ≈ 90 bars, ABACA with A ≈ 1–19, B ≈ 20–39, A ≈ 40–43, C ≈ 44–62, A ≈ 63–end; 5.1 s/bar.
- III: theme and Vars. I–VI 32 bars each, Var. VII 19 bars at ≈ 1.73 s/bar; a short cadenza (≈ 15 s); Var. VIII and coda in 6/8 ≈ 1:36.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 13:09 | 0:00, 0:17, 2:06, 2:29, 4:13, 5:35, 5:58, 7:00, 7:40, 10:15, last minute | 5:58, 7:00, 7:40 (assumed bar numbers); 10:15 depends on the cadenza's position and Curzon's tempo |
| II | 7:41 | 0:00, 0:20, 1:35, 3:20, 3:40, 5:15, last minute | Every boundary after 0:20 (bar counts assumed) |
| III | 8:52 | 0:00, 0:55, 1:50, 2:45, 3:40, 4:35, 5:30, 6:25, 7:10, last minute | The 6/8 section's length; later variations drift if Curzon changes tempo between variations |

## 6. Open items

1. Re-time against Spotify `1BrTUemQeJj8K5JJFeGQPZ`, tracks 4–6, ideally with a score (NMA) to fix the bar numbers.
2. Whose cadenza Curzon plays in I (booklet).
3. Confirm by ear that the winds lead the Larghetto's episodes and that Var. III is the forceful one.
