# Verification: Beethoven – Symphony No. 6 in F major, Op. 68, "Pastoral"

Piece id `beethoven-symphony-6`. Checked on 2026-10-10 (batch October 2026, group A).
Files: `content/en/pieces/beethoven-symphony-6.md`, `content/tr/pieces/beethoven-symphony-6.md`.
Shared-file additions: `content/research/beethoven-symphony-6.shared.md`.

**How the checks were done:** as in `beethoven-symphony-3.md` (Spotify embed page, Discogs API, label pages). Status key: OK / SECONDARY / UNVERIFIED / INFERRED.

---

## 1. Reference recording: Böhm / Wiener Philharmoniker (DG, 1971)

Chosen as a widely admired, complete recording on Spotify with **five separate tracks** (one per movement), as the batch brief requires; the last three movements run together in the music but are split into tracks 3, 4 and 5 on the album.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/1eMMy3QJ3ezrR6hkp6jP7n | "Beethoven: Symphony No.6 "Pastoral" / Schubert: Symphony No.5", 9 tracks. Tracks 1–5 = Op. 68 (German movement titles), credited "Ludwig van Beethoven, Wiener Philharmoniker, Karl Böhm"; tracks 6–9 = Schubert D 485. Link taken from DG's product page | https://open.spotify.com/embed/album/1eMMy3QJ3ezrR6hkp6jP7n ; https://www.deutschegrammophon.com/en/catalogue/products/beethoven-schubert-symphonies-boehm-5733 | VERIFIED |
| Conductor / orchestra | Karl Böhm / Wiener Philharmoniker | Same | same | OK |
| Label / catalogue | Deutsche Grammophon; 2530 142 (LP); 447 433-2 (CD, The Originals) | LP 2530 142 (master 234779, 1971). The Spotify album is the Originals CD 447 433-2 (UPC 028944743326, DG release 14 July 1995) | https://www.discogs.com/master/234779 ; https://www.discogs.com/release/26238827 | OK |
| Recorded / venue | May 1971; Musikverein (Großer Saal), Vienna | CD booklet: "Wien, Musikverein, Grosser Saal, 5/1971 (Tracks 1 to 5)" | https://www.discogs.com/release/26238827 ; https://www.discogs.com/release/29385610 | OK (month only) |
| Release year | 1971 | ℗ 1971 (Op. 68); LP master 1971 | same | OK |
| Production (not in yaml) | – | Recording producers Werner Mayer, Wolfgang Lohse; balance engineer Günter Hermanns | https://www.discogs.com/release/23022791 | OK |
| Exposition repeat (I) | stop "≈ 2:40 The exposition is repeated" | Track I is 12:20 for 512 bars. With the repeat (650 bars played) ≈ 53 bars a minute; without, ≈ 41, which would be far slower than any normal tempo. The repeat is therefore almost certainly taken | timings | INFERRED (confirm by ear) |
| "Karajan … about eleven and a half" (In this recording) | Karajan 1977, track II = 11:21 | https://open.spotify.com/embed/album/1bEsyf6HFUyRjzHXzrubBo | VERIFIED |

### Durations (source: Spotify embed, album 1eMMy3QJ3ezrR6hkp6jP7n)

| Track | Movement | ms | Time in file (nearest second) |
| --- | --- | --- | --- |
| 1 | 1. Erwachen heiterer Empfindungen bei der Ankunft auf dem Lande | 740 000 | 12:20 |
| 2 | 2. Szene am Bach | 835 250 | 13:55 |
| 3 | 3. Lustiges Zusammensein der Landleute | 349 426 | 5:49 |
| 4 | 4. Gewitter, Sturm | 220 750 | 3:41 |
| 5 | 5. Hirtengesang. Frohe und dankbare Gefühle nach dem Sturm | 584 250 | 9:44 |
| | Total | 2 729 676 | 45:30 → `duration_min: 45` |

Discogs gives 45:37 for the symphony on CD 447 433-2 (a different master or rounding); the guide uses the Spotify times.

---

## 2. Also recommended: Karajan / Berliner Philharmoniker (DG, 1977 cycle)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | https://open.spotify.com/album/1bEsyf6HFUyRjzHXzrubBo | "Beethoven: Symphony No.6; Overtures", 8 tracks; tracks 1–5 = Op. 68 (9:02 / 11:21 / 5:38 / 3:30 / 8:32), BPO / Karajan. Link from the label's page | embed page ; https://www.deccaclassics.com/en/catalogue/products/beethoven-symphonie-6-ouvert-karajan-7828 | VERIFIED |
| Catalogue | 415 833-2 (CD, with overtures) | Galleria CD 415 833-2 (1987), UPC 028941583321; "℗ 1970 (Ouvertüren) / 1977" | https://www.discogs.com/release/10938265 | OK |
| Recorded | "1975–77" | The symphony's own session date was not found; Discogs master for the cycle's Eroica LP: "Recorded 1975–1977, Berlin, Philharmonie". The ℗ 1977 places it in the 1975–77 cycle | https://www.discogs.com/master/164209 | OK as a range; exact date UNVERIFIED |
| Venue | Philharmonie, Berlin | As above | same | OK (cycle) |

The alternative is from the same Karajan cycle as the Eroica reference. A contrasting choice (e.g. Bruno Walter / Columbia SO, 1958) was considered but its Spotify album id could not be confirmed before the batch's web-search budget ran out.

---

## 3. Painting: Joseph Anton Koch, *Heroic Landscape with Rainbow*, 1824

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Joseph Anton Koch, "Austrian, Obergibeln bei Elbigenalp 1768–1839 Rome" | Met collection API | OK |
| Title / date | *Heroic Landscape with Rainbow*, 1824 | https://collectionapi.metmuseum.org/public/collection/v1/objects/439844 | OK |
| Medium, size | Oil on canvas, 108.6 × 95.9 cm | same | OK |
| Collection | The Metropolitan Museum of Art, New York, 2008.420 (Purchase, Anne Cox Chambers Gift, … 2008); gallery 806 | same | OK |
| Other versions | Koch painted the subject several times: Wikidata has a Neue Pinakothek version (Q30067568, dated 1812). Not claimed in the guide beyond "Austrian contemporary of Beethoven" | https://www.wikidata.org/wiki/Q30067568 | OK |
| What is in the picture | Checked visually: a herdsman playing a pipe, two women pointing up, goats, a river in a valley, a classical town, storm clouds parting and a full rainbow. This is what the pairing note describes | image | OK |
| Rights / image | Met Open Access, `isPublicDomain: true` (CC0). Commons mirror File:Heroic_Landscape_with_Rainbow_MET_DP224123.jpg, 3425 × 3851, `{{Cc-zero}}`. A larger 6174 × 6917 file in the same category is an **infrared reflectogram** (KochIRRnocap): do not use | https://commons.wikimedia.org/wiki/File:Heroic_Landscape_with_Rainbow_MET_DP224123.jpg | OK |
| Format | Portrait, ≈ 0.89:1; the photo shows a thin black border: crop | – | Note |
| Not reused | Koch has no painting in `content/paintings.yaml` | – | OK |

**Why this painting.** The finale's title is "Shepherd's song: cheerful and thankful feelings after the storm". Koch's picture shows exactly that moment: the storm clouds parting, a rainbow (which listeners often hear in the flute's rising scale at the end of the storm), and a herdsman playing his pipe to his flock. Koch (1768–1839) was Beethoven's near-contemporary and Austrian. No historical link between the two men is claimed.

---

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Beethoven loved nature, walked a great deal, often left Vienna to work in the country | https://en.wikipedia.org/wiki/Symphony_No._6_(Beethoven) | OK |
| First sketches 1802; composed alongside the Fifth; completed 1808 | same | OK |
| Premiere 22 December 1808, Theater an der Wien, with the Fifth, a long (four-hour), under-rehearsed concert | same ; https://en.wikipedia.org/wiki/Symphony_No._5_(Beethoven) | OK |
| "More the expression of feeling than painting", printed in the programme of the first performance | same (quoting Ledbetter) | OK |
| Five movements; no pauses between the last three | same | OK |
| Beethoven's movement titles | Spotify track titles (German) ; same | OK. English renderings are standard translations |
| I: placid movement, motifs built by multiple repetitions of very short cells | same (Frindle quote) | OK |
| I: opening over an open-fifth drone in violas and cellos | Score, bars 1–4 | SECONDARY (score) |
| I: development repeats a one-bar figure many times ("dozens") while harmony shifts | Score (mm. 151–162 and parallel passage); same article ("multiple repetitions") | SECONDARY (score) |
| II: sonata form, B-flat major, 12/8; flowing-water figure on two muted solo cellos with the rest of the cellos and basses mostly pizzicato | https://en.wikipedia.org/wiki/Symphony_No._6_(Beethoven) | OK |
| II: bird cadenza near the end; nightingale (flute), quail (oboe), cuckoo (two clarinets), named in the score | same | OK |
| III: scherzo in 3/4, F major, depicting country folk; trio appears twice; final return faster; ends abruptly and leads without pause into IV | same | OK |
| III: the oboe tune that seems to come in late and the bassoon's few notes ("village band") | Score (oboe solo from m. 91 over the bassoon's F–C–F); the "village band" reading is traditional (Tovey) | SECONDARY |
| III: rustic dance in 2/4 | Score (*In tempo d'allegro*, 2/4) | SECONDARY (score) |
| IV: F minor, 4/4; distant thunder in cellos/basses, raindrops in violins, timpani thunder, piccolo lightning, trombones added later, storm passes; flute rising scale "represents a rainbow" (told as "often heard as") | https://en.wikipedia.org/wiki/Symphony_No._6_(Beethoven) | OK |
| IV: timpani play only in this movement; piccolo only in this movement; trombones in IV and V | Score instrumentation; Wikipedia notes V uses the full orchestra "minus piccolo and timpani" | SECONDARY (score) |
| IV: short oboe hymn before the flute scale | Score, end of IV | SECONDARY (score) |
| V: F major, 6/8, sonata-rondo; shepherds' song of thanksgiving; ecstatic climax with first violins' tremolo on high F; coda *pp sotto voce*, "suggestive of prayer"; ends with two F major chords | same | OK |
| V: clarinet then horn call over a drone | Score, bars 1–8 | SECONDARY (score) |

Not used: Knecht's *Le Portrait musical de la Nature* (1784) as a model (one scholar's suggestion); Disney's *Fantasia*.

---

## 5. Re-time needed (all stops ≈; from bar numbers and the Spotify track lengths. Nobody has listened against the Böhm tracks yet)

Reference: Böhm / VPO 1971, Spotify `1eMMy3QJ3ezrR6hkp6jP7n`.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I | 12:20 | 0:00, 0:20, 1:15, 2:40, 5:15, 7:55, 10:30, Near the end | Assumes the exposition repeat. If it is not taken, stops from 2:40 on are wrong (development ≈ 2:40, recapitulation ≈ 5:20) |
| II Scene by the brook | 13:55 | 0:00, 3:00, 5:25, 9:05, 12:50, Last 40 seconds | Theme 2 (≈ 3:00) and the development (≈ 5:25); the birds (≈ 12:50) are well placed by bar count |
| III | 5:49 | 0:00, 1:00, 1:50, 2:35, 5:10, Near the end | Whole movement: the 2/4 dance and the repeat were placed from section lengths, not bar-exact |
| IV Thunderstorm | 3:41 | 0:00, 0:20, 1:10, 1:40, 2:30, Last 30 seconds | Piccolo (≈ 1:10) and trombones (≈ 1:40) |
| V | 9:44 | 0:00, 0:15, 0:40–1:30, 2:30, 4:20, 6:15–7:00, 8:00, Last 30 seconds | The episode (≈ 2:30), the variation (≈ 4:20) and the start of the coda (≈ 8:00; Böhm likely slows here) |

---

## 6. Open items

1. Re-time by ear; confirm the first-movement repeat.
2. Score-based details (drone, oboe/bassoon "village band", instrumentation per movement) are standard but were checked against the score only from memory, not against a fetched page. A quick look at the IMSLP score would close them.
3. Consider a contrasting alternative recording (not Karajan) when web search is available again.
