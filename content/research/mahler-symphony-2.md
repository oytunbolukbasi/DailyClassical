# Verification: Mahler – Symphony No. 2 in C minor, "Resurrection"

Piece id `mahler-symphony-2`. Checked on 2026-10-10 (batch October 2026, group D).
Files: `content/en/pieces/mahler-symphony-2.md`, `content/tr/pieces/mahler-symphony-2.md`.
Shared-file additions (paintings.yaml entry, alternatives, glossary rows): `content/research/mahler-symphony-2.shared.md`.

**How the checks were done** (same method as `verification-6-10.md`)
- **Spotify:** album ids found with Spotify's own web search (open.spotify.com/search, read in a browser). Each id was then confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (track titles, credited artists, duration in ms) and the album page meta (`og:description`, `music:release_date`, `og:restrictions:country:allowed`). The ℗/© line was read from the rendered album page. **VERIFIED** = conductor, orchestra, soloists and every movement track seen in that data.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits, notes). Human-readable URLs are given.
- **Status key:** OK = confirmed from a primary source. SECONDARY = from Wikipedia or a reissue note only. UNVERIFIED = not confirmed.
- No personal data was sent to any service; API requests used `DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Klemperer / Philharmonia (EMI, 1963)

Why this one: Klemperer's EMI recording is one of the most admired versions (an EMI "Great Recordings of the Century" title), and on this Spotify edition the finale is **one single track**, as the batch rules require. Other well-known Klemperer editions on Spotify split the finale into seven tracks (`1gedF4n7mp8K3FTIlCFhdX`, `5wQkRryEZq0q2HyNXCL3rv`) and cannot be used. Abbado's DG Vienna recording (`5V3hWQxbgkDD9w5lQRVVsB`) and Bernstein's DG New York recording (`2SVkyvRyCXIZ8WsGe8j0xc`) are split into 25 tracks; Rattle (`1zkXU8aVgVz8orspHdBzru`) into 11.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Otto Klemperer / Philharmonia Orchestra | Spotify credits on every track: "Otto Klemperer, Philharmonia Orchestra" | https://open.spotify.com/embed/album/1oXL9ONCxCGF7ctG6gnjrI | OK |
| Soloists | Elisabeth Schwarzkopf (soprano), Hilde Rössel-Majdan (mezzo-soprano) | Spotify: IV credits "Hilde Rössel Majdan"; V credits "Elisabeth Schwarzkopf, Hilde Rössel Majdan, Philharmonia Chorus". Discogs: "Soprano Vocals – Elisabeth Schwarzkopf", "Mezzo-soprano Vocals – Hilde Rössel-Majdan" | https://www.discogs.com/release/1361210 | OK |
| Chorus | Philharmonia Chorus (chorus master Wilhelm Pitz) | Discogs: "Chorus – Philharmonia Chorus", "Chorus Master – Wilhelm Pitz" | same | OK |
| Label | EMI (now Warner Classics) | Spotify ℗ line: "A Warner Classics release, ℗ 1963, 1989 Parlophone Records Limited" | album page | OK |
| Catalogue number | SAX 2473–4 (LP); CDM 7 69662 2 (CD) | Original UK stereo LP: Columbia SAX 2473/4, 1963 (mono 33CX 1829/30). US: Angel SB-3634. The Spotify album (℗ 1963, 1989) is the 1989 remaster, Angel/EMI CDM 7 69662 2 | https://www.discogs.com/release/4715101 ; https://www.discogs.com/release/4913244 ; https://www.discogs.com/release/530293 | OK |
| Recorded | 22–24 November 1961 and 15, 24 March 1962 | EMI CD notes: "Recorded: 22-24.XI.1961 & 15, 24.III.1962, Kingsway Hall, London" | https://www.discogs.com/release/1361210 ; https://www.discogs.com/release/10331150 | OK |
| Venue | Kingsway Hall, London | same | same | OK |
| Release year / year | 1963 | Columbia SAX 2473/4 dated 1963; Angel SB-3634 April 1963; ℗ 1963 | Discogs 4715101, 3980690 | OK |
| Producer (not in yaml) | – | Walter Legge | Discogs 1361210 | OK |
| Spotify | https://open.spotify.com/album/1oXL9ONCxCGF7ctG6gnjrI | "Mahler: Symphony No. 2 "Resurrection"", album, 1963, 5 songs; 185 markets including TR | embed + album page | VERIFIED |

### Durations (Spotify embed, album 1oXL9ONCxCGF7ctG6gnjrI)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Allegro maestoso | 1142533 | 19:03 |
| 2 | II. Andante moderato | 630106 | 10:30 |
| 3 | III. In ruhig fließender Bewegung | 700133 | 11:40 |
| 4 | IV. Urlicht | 241466 | 4:01 |
| 5 | V. Im Tempo des Scherzos | 2046693 | 34:07 |
| | Total | 4760931 | 79:21 → `duration_min: 79` |

Cross-check: the Deezer edition of the same master (album 303873, Warner, UPC 5099926683553) has 19:02 / 10:30 / 11:40 / 4:01 / 34:06. Discogs gives 79:21 for the 1989 CD. https://api.deezer.com/album/303873

---

## 2. Also recommended: Abbado / Lucerne Festival Orchestra (DG, 2004)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Claudio Abbado, Lucerne Festival Orchestra; Eteri Gvazava (soprano), Anna Larsson (contralto), Orfeón Donostiarra | Spotify credits (tracks 7–8) | OK |
| Label / catalogue | Deutsche Grammophon 00289 477 5082 (Debussy *La Mer* + Mahler 2) | https://www.discogs.com/release/8344579 | OK |
| Recorded | "Live Recordings from the Lucerne Festival, Summer 2003" (August 2003 is the festival month; the exact dates were not seen) | same | Year/season OK; month SECONDARY |
| Spotify | https://open.spotify.com/album/09pPcrcSHVNPXHDMh6sSaP, ℗ 2004 DG, 183 markets incl. TR. Tracks 1–3 = *La Mer*; tracks 4–8 = Mahler 2: 20:45 / 9:23 / 11:22 / 5:04 / 34:41 (finale one track) | embed + album page | VERIFIED |

Also checked and usable as a further alternative: Jansons / Bavarian Radio SO, BR-Klassik 2018 (`3fltUy37vIYguFB4OL6Vsa`, 5 tracks, finale 33:23).

---

## 3. Painting: Matthias Grünewald, *The Resurrection* (Isenheim Altarpiece), c. 1512–1516

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Matthias Grünewald (c. 1470/80–1528) | Wikidata Q9391480 (creator Q154338) | OK |
| Title | *The Resurrection* (German *Die Auferstehung*), right wing of the second view of the Isenheim Altarpiece | https://www.wikidata.org/wiki/Q9391480 ; Commons file description (Yorck file): "Isenheimer Altar … zweite Schauseite, rechter Flügel: Auferstehung" | OK |
| Date | 1512–1516 (Wikidata inception 1515) | Wikidata; Commons | OK |
| Medium / size | Oil on limewood panel, 269 × 141 cm | Wikidata P186, P2048/P2049 | SECONDARY |
| Collection | Musée Unterlinden, Colmar | Wikidata P195 | OK |
| Museum object page | Not found on the museum's site; general site https://www.musee-unterlinden.com/ | – | UNVERIFIED (no object page) |
| Rights | Artist died 1528: public domain everywhere | – | OK |
| First-choice image | File:Matthias_Grünewald_-_Resurrection.jpg, 2845 × 4701 px. Photograph of the panel by Gleb Simonov, taken 14 December 2023 (after the 2018–2022 restoration), uploaded as "own work" with {{PD-old-70}}. A faithful photograph of a 2D public-domain work attracts no new copyright in the EU (DSM Directive art. 14) or the US (Bridgeman v. Corel) | https://commons.wikimedia.org/wiki/File:Matthias_Gr%C3%BCnewald_-_Resurrection.jpg | OK; note the file has no explicit PD-Art tag |
| Fallback image | File:Mathis_Gothart_Grünewald_044_cropped.jpg, 2024 × 3344 px, Yorck Project scan, {{PD-Art}}. Darker, pre-restoration colours. (The uncropped 044 file has a white patch at top left; do not use it) | https://commons.wikimedia.org/wiki/File:Mathis_Gothart_Gr%C3%BCnewald_044_cropped.jpg | OK |
| Orientation | Tall portrait format (≈ 0.6:1). Plan the hero crop around the risen figure in the upper half | visual check | – |
| Pairing fact | The 1963 US LP of this recording (Angel SB-3634) credits "Painting [Detail From The Isenheim Retable] – Matthias Grünewald" for its cover | https://www.discogs.com/release/3980690 | OK (which panel is not stated) |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Written between 1888 and 1894; first movement completed 1888 as the symphonic poem *Totenfeier* | https://en.wikipedia.org/wiki/Symphony_No._2_(Mahler) | OK |
| First complete performance 13 December 1895, Berlin, Mahler conducting (first three movements 4 March 1895) | same | OK |
| Bülow's death in 1894; at the funeral Mahler heard a setting of Klopstock's "Die Auferstehung"; "It struck me like lightning" (letter to Anton Seidl) | same | OK |
| Mahler used the first verses of Klopstock and wrote the rest himself, from "O glaube" | same (Text section note) | OK |
| Soprano and alto soloists, chorus, organ, bells, offstage orchestra (Fernorchester) | same ("Instrumentation", finale description) | OK |
| Five-minute pause requested after the first movement; rarely observed | same | OK |
| Programme: funeral (I), happy memories (II), meaningless activity (III), wish for release (IV), hope for renewal (V); later withdrawn | same (Origin) | OK. The guide's "In one line" paraphrases it |
| I: marked "Mit durchaus ernstem und feierlichem Ausdruck"; second theme first in E major; Dies irae in the development; recapitulation | same | OK |
| II: Ländler in A-flat major, "Sehr gemächlich. Nie eilen" | same | OK |
| II: the third statement of the dance is played pizzicato | Score knowledge (well known: the "pizzicato" reprise) | SECONDARY, confirm by ear |
| III: opens with two timpani strokes; based on "Des Antonius von Padua Fischpredigt"; climax called "cry of despair" by Mahler | same | OK |
| IV: "Urlicht", Wunderhorn song for alto, D-flat major, "Sehr feierlich, aber schlicht"; opens with the words "O Röschen rot!"; angel episode | same; text of the song | OK |
| V: begins with the "cry of despair"; offstage horns; Dies irae and resurrection theme; drum rolls start the march of the dead; offstage band; "Great Summons"; flute bird-calls; chorus enters quietly; organ and bells at the end | same | OK |
| Klemperer in 1905 was given charge of the off-stage orchestra at a Berlin performance of the Second (Oskar Fried conducting), met Mahler, and was later appointed in Prague (1907) on Mahler's recommendation | https://en.wikipedia.org/wiki/Otto_Klemperer | OK |

Not used, on purpose: the "voice of one crying in the wilderness" label for the horn call (from Mahler's programme notes, not checked first-hand), and claims that the choir must remain seated.

---

## 5. Re-time needed

All stop times are estimates (≈). They were derived from the track lengths, the published structure, and the section lengths of the 11-track Klemperer edition of the same performance (`1gedF4n7mp8K3FTIlCFhdX`), whose finale is cut at 0:00 / 6:58 / 9:56 / 14:59 / 21:24 / 27:03 / 30:08 (cumulative). Nobody has listened against the reference tracks yet. Add these rows to `content/research/retime-needed.md`.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Allegro maestoso | 19:03 | 0:00, 1:00, 1:40, 3:00, 5:30, 8:30, 11:00, 12:30, Last minute | Dies irae (≈ 8:30), climax (≈ 11:00), recapitulation (≈ 12:30) |
| II Andante moderato | 10:30 | 0:00, 2:00, 3:30, 5:00, 7:00, Last minute | Second episode (≈ 5:00) and the pizzicato reprise (≈ 7:00) |
| III Scherzo | 11:40 | 0:00, 1:00, 3:30, 5:30, 8:30, Last minute | Trio (≈ 3:30) and the "cry of despair" (≈ 8:30) |
| IV Urlicht | 4:01 | 0:00, 0:20, 2:00, 3:00, Last seconds | Faster middle (≈ 2:00) |
| V Finale | 34:07 | 0:00, 1:30, 3:30, 9:30, 15:00, 18:30, 21:30, 27:00, 30:00, 32:00 | Drum rolls (≈ 9:30), offstage band (≈ 15:00), Great Summons (≈ 18:30), organ entry (≈ 32:00). Choir entry should fall near 21:24 and the alto's "O glaube" near 27:03 if the split edition's cuts match the score |
