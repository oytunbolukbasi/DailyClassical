# Verification: Bach – Cello Suite No. 1 in G major, BWV 1007

Piece id `bach-cello-suite-1`. Checked on 2026-10-24 (batch October 2026b, group A).
Files: `content/drafts/en/bach-cello-suite-1.md`, `content/drafts/tr/bach-cello-suite-1.md`.
Shared-file additions (paintings.yaml, glossaries, retime rows): `content/research/bach-cello-suite-1.shared.md`.

**How the checks were done** (as in `vivaldi-four-seasons-spring.md`): Spotify album ids found from public Spotify track pages (`music:album` meta); each album confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: title, credits, `duration` in ms, `isPlayable`, read from a Turkish network) and the album page's release date and ℗/© lines. Discogs public API (`/releases/<id>`, `/database/search`), Wikipedia API extracts, Wikidata, Wikimedia Commons API, museum object pages. All requests used only the generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent. Status key: OK = primary or solid source; SECONDARY = aggregator or single secondary source; UNVERIFIED = not confirmed. The web-search budget ran out during this batch; nothing below rests on a search snippet alone.

---

## 1. Reference recording: Pierre Fournier (Archiv Produktion, rec. 1960, rel. 1961)

Why this one: one of the classic complete sets, on Deutsche Grammophon's Archiv label since 1961 and reissued in "The Originals" (1996) and again in 2007 and 2017 (Discogs). The Spotify album has one track per movement (the two minuets share one track), so the suite fits the 6-movement limit.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/79Rf5HqOCOiNdNhHySN5MZ | "Bach: 6 Cello Suites BWV 1007, 1008, 1009, 1010, 1011 & 1012", Spotify date 1961-01-01, "© 1996 Deutsche Grammophon GmbH, Berlin / ℗ This Compilation ℗ 1961 Deutsche Grammophon GmbH, Berlin". Every track credited "Johann Sebastian Bach, Pierre Fournier". Suite No. 1 = tracks 1–6 | https://open.spotify.com/embed/album/79Rf5HqOCOiNdNhHySN5MZ | VERIFIED |
| Track 5 title | – | Spotify title is wrong: "Suite for Cello Solo No. 1 in G Major, BWV 1007: V. Menuet I - VI. Bourrée II". BWV 1007 has two minuets and no bourrée; the duration (3:28) fits Menuet I, Menuet II and Menuet I da capo. The guide tells the listener (V, "In this recording") | embed | Note |
| Soloist | Pierre Fournier, cello | Discogs CD 449 711-2: "Cello – Pierre Fournier" | https://www.discogs.com/release/7868326 | OK |
| Label / cat. no. | Archiv Produktion, "449 711-2 (CD)" | CD 449 711-2 (1996, "The Originals"), notes "Originally released as Archiv Produktion SAPM 198356/58, 1961". Discogs also lists the stereo single LPs SAPM 198 187 (Nos. 3–4, 1960) and 198 188 (Nos. 5–6, 1961); the box was reissued as 2710 005. The yaml comment records both LP numbers; the guide quotes only the CD number | https://www.discogs.com/release/7868326 ; https://www.discogs.com/release/16272751 ; https://www.discogs.com/release/14439019 | OK (CD); LP numbering inconsistent between sources |
| Recorded | December 1960 | CD notes: "Recorded in Beethovensaal, Hannover, Germany in December 1960." Other secondary sources (bach-cantatas.com Fournier page, via search result) say December 1960 and 1961 | https://www.discogs.com/release/7868326 | OK (from the CD booklet as transcribed on Discogs); the 1961 session claim not checked |
| Venue | Beethovensaal, Hanover | as above. Spelling "Hanover" as in the existing Kempff entry of `beethoven-piano-sonata-8` | same | OK |
| Release year / year | 1961 | ℗ 1961 (Spotify, CD) | as above | OK |
| Credits (not in yaml) | – | Producer Karl-Heinz Schneider; recording engineer Heinz Wildhagen; executive producer Hans Hickmann | Discogs 7868326 | for reference |

### Durations and playability (Spotify embed, album 79Rf5HqOCOiNdNhHySN5MZ, read 2026-10-24 from Turkey)

| Mvt | Spotify track | ms | isPlayable | Guide |
| --- | --- | --- | --- | --- |
| I Prélude | 1 | 170 000 | true | 2:50 |
| II Allemande | 2 | 258 000 | true | 4:18 |
| III Courante | 3 | 165 000 | true | 2:45 |
| IV Sarabande | 4 | 201 000 | true | 3:21 |
| V Menuet I – Menuet II | 5 | 208 000 | true | 3:28 |
| VI Gigue | 6 | 123 000 | true | 2:03 |
| Total | | 1 125 000 | | 19 min (18:45) |

Note: the embed gives whole seconds for this album (all durations end in 000).

---

## 2. Also recommended: Jean-Guihen Queyras (harmonia mundi, 2007)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7G7uMmAHmB4qhgOpDzLtF9 — "J.S. Bach: Complete Cello Suites", Spotify date 2007-10-09, "© / ℗ 2007 harmonia mundi". Suite No. 1 = tracks 1–6: 137 000 / 265 480 / 145 186 / 150 066 / 185 866 / 98 800 ms, all `isPlayable: true`; track 5 correctly titled "V. Menuets I & II" | embed page | VERIFIED |
| Label / cat. no. | harmonia mundi HMC 901970.71 (2 CD + DVD) | https://www.discogs.com/release/4891951 | OK |
| Recorded / venue | Booklet: "Enregistrement Mars 2007, Église Saint-Cyriak, Sulzburg" → yaml "March 2007", "St Cyriak, Sulzburg" | Discogs 4891951 notes | OK |

---

## 3. Painting: Giacomo Ceruti, *Portrait of a Cello Player* (Bildnis eines Cellospielers), c. 1740

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Giacomo Ceruti (1691 Piacenza – 1767/68 Milan), *Bildnis eines Cellospielers* ("Portrait of a Cello Player") | KHM object page; Wikidata Q27979567 | OK |
| Date | KHM: "um 1740". Commons/Wikidata: "between 1745 and 1750". The guide follows the museum: "c. 1740" | https://www.khm.at/kunstwerke/bildnis-eines-cellospielers-471 | OK (museum date) |
| Collection | Kunsthistorisches Museum, Vienna, Gemäldegalerie, Inv. GG 9690; acquired 1973 | KHM page; Wikidata P217 | OK |
| Medium / size | Oil on canvas ("Leinwand"), 92 × 74.3 cm | KHM page | OK |
| Image | File:Giacomo Ceruti - Portrait of a Cellist.jpg, 2539 × 3187 px, 3.96 MB (source: gallerix scan of the KHM picture). Portrait format; the face is in the upper third, the cello scroll top right | https://commons.wikimedia.org/wiki/File:Giacomo_Ceruti_-_Portrait_of_a_Cellist.jpg | OK; smaller than most of our images but above 2500 px wide |
| Public domain | `{{PD-Art|PD-old-100-expired|deathyear=1767}}`. Faithful reproduction of a 2D PD work (no new right, EU DSM art. 14 / US). Not the KHM's own download (KHM terms not checked), so no NC terms apply | Commons | OK |
| Not already used | Ceruti is not in `content/paintings.yaml` (64 entries, checked 2026-10-24) | – | OK |
| What it shows (visual check) | A man in a white wig and a lilac coat, his left hand on the neck of a cello and the bow in his right hand; the KHM text stresses the unidealised, everyday realism of Lombard portraiture | Commons image; KHM text | OK |

Why it fits: a working cellist of Bach's generation (Ceruti was six years younger than Bach), painted about 1740 with a Baroque cello, the instrument of the suites. The pairing note does not claim any link between the sitter and Bach.

---

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Most likely composed 1717–1723 at Köthen, when Bach was Kapellmeister; scholars generally date the suites before the violin solos (1720) | https://en.wikipedia.org/wiki/Cello_Suites_(Bach) (lead, History) | OK ("most likely"); yaml `year: 1720` is a placeholder, with a comment |
| No autograph survives; main source Anna Magdalena Bach's copy, title *Suites à Violoncello Solo senza Basso* | Cello Suites (Bach), Manuscript | OK |
| Each suite: prelude, allemande, courante, sarabande, a pair of galanteries (minuets in Nos. 1–2), gigue | Cello Suites (Bach), lead and Structure | OK |
| Menuet II of Suite 1 is one of only five movements in the six suites with no chords at all | Cello Suites (Bach), Structure ("Only five movements in the entire set … the second minuet of Suite No. 1 …") | OK |
| Little known and rarely played in public, partly because of their étude-like nature, until Casals | Cello Suites (Bach), lead | OK |
| Casals found an edition (Grützmacher's) in a Barcelona shop in 1889, aged 13 | Cello Suites (Bach), History. Casals's own accounts give 1890 in some versions; the guide gives only "as a boy of 13" | OK (age), year not stated |
| First complete recording; Suite No. 1 recorded in Paris in June 1938 | Cello Suites (Bach), History ("1 and 6 in June 1938", Paris) | OK |
| The prelude is the best-known movement of the set | Cello Suites (Bach), Suite No. 1 section | OK |
| Prélude is built on arpeggiated chords; mid-point arrival on D; long passage over a repeated D before the climax; ends on G major chord | Score (BWV 1007/1, 42 bars: half-close on D at bar 22, D pedal passage from about bar 31, climax bars 37–39, final chord bar 42). Bar numbers from the score as commonly analysed, not re-counted for this note | OK in substance; bar numbers to re-check |
| Sarabande: weight often on the second beat | General description of the dance (see the new glossary row) | OK |
| The cello's two lowest strings are C and G | Standard tuning C–G–D–A | OK |
| Fournier recorded the suites for Archiv in the Beethovensaal, Hanover, December 1960; first issued 1961; reissued many times | Discogs 7868326 (notes), master releases 2867624 (2007), 9821219 (2017 LP), 13030424/15550933 (files) | OK |

Not used, on purpose: the claim that the suites were written for the Köthen gambist/cellist Christian Ferdinand Abel or for Linike (no source checked); the *violoncello da spalla* debate; any description of Fournier's tone (not checkable).

---

## 5. Re-time (every stop is ≈; derived from bar positions and the track lengths; not heard)

Reference: Fournier, Spotify `79Rf5HqOCOiNdNhHySN5MZ`. Method: bar counts from the score (Prélude 42 bars; dances in two repeated halves), tempo assumed even within a track (track length ÷ bars played). Fournier takes the repeats in the dances (track lengths only make sense with them); repeats in the Menuet I da capo are assumed omitted.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Prélude | 2:50 | 0:00, 0:35, 1:25, 1:30–2:00, 2:00, 2:30, Last 15 seconds | 2:00 and 2:30: Fournier probably broadens before the climax (≈ 4.05 s per bar assumed) |
| II Allemande | 4:18 | 0:00, 1:05, 2:10, 3:15, Near the end | Halves assumed equal (16 + 16 bars) |
| III Courante | 2:45 | 0:00, 0:40, 1:20, 2:05, Last 10 seconds | Halves assumed nearly equal; bar counts not re-checked |
| IV Sarabande | 3:21 | 0:00, 0:50, 1:40, 2:30, Near the end | Halves of 8 + 8 bars assumed |
| V Menuet I – Menuet II | 3:28 | 0:00, 0:30, 1:20, 2:45 | Menuet II entry (≈ 1:20) and Menuet I return (≈ 2:45) depend on whether repeats are taken in the da capo |
| VI Gigue | 2:03 | 0:00, 0:20, 0:40, Near the end | Halves assumed in a 1 : 2 ratio |
