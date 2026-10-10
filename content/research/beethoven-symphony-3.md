# Verification: Beethoven – Symphony No. 3 in E-flat major, Op. 55, "Eroica"

Piece id `beethoven-symphony-3`. Checked on 2026-10-10 (batch October 2026, group A).
Files: `content/en/pieces/beethoven-symphony-3.md`, `content/tr/pieces/beethoven-symphony-3.md`.
Shared-file additions (paintings.yaml, glossaries): `content/research/beethoven-symphony-3.shared.md`.

**How the checks were done** (same method as `rachmaninoff-piano-concerto-2.md`)
- **Spotify:** album confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (track titles, credits, duration in ms) and the album page's `og:` tags.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` and `/database/search?catno=…` (no token), with the project's generic User-Agent. Human-readable URLs below.
- **MusicBrainz:** `https://musicbrainz.org/ws/2/release/<mbid>?inc=recordings+recording-level-rels` for recording dates and venue.
- **Status key:** OK = confirmed from a primary source. SECONDARY = only from a retailer, review or search snippet. UNVERIFIED = not confirmed. INFERRED = deduced from timings, to be confirmed by ear.

---

## 1. Reference recording: Karajan / Berliner Philharmoniker (DG, 1977) – product owner's choice

The product owner fixed the album: `https://open.spotify.com/album/4AAP5zYQJTEFQiQacOFq2s`. It had to be identified.

### Identification

| Step | Finding | Source URL | Status |
| --- | --- | --- | --- |
| Spotify embed | "Beethoven: Symphony No.3 "Eroica"; Overture "Leonore No.3"", 5 tracks. Tracks 1–4 = Op. 55, track 5 = *Leonore* Overture No. 3, Op. 72b; every track credited "Ludwig van Beethoven, Berliner Philharmoniker, Herbert von Karajan" | https://open.spotify.com/embed/album/4AAP5zYQJTEFQiQacOFq2s | VERIFIED |
| Spotify album page | `og:description`: "Ludwig van Beethoven · album · 1987 · 5 songs" | https://open.spotify.com/album/4AAP5zYQJTEFQiQacOFq2s | VERIFIED |
| Which Karajan cycle | The 1987 Eroica + *Leonore III* coupling is DG Galleria CD **419 049-2** (released 19 March 1987). MusicBrainz track lengths 812 826 / 991 973 / 373 066 / 707 960 ms match Spotify's 810 800 / 991 800 / 374 240 / 699 293 within 1–9 s (the finale differs by 8.7 s: probably the trailing silence) | https://musicbrainz.org/release/34231485-08a0-4f35-b1f0-f5e35527181d ; https://www.discogs.com/release/530298 | OK |
| Original release | Discogs CD notes: "Symphony No. 3 recorded and released in 1977 as Deutsche Grammophon 2531 103. Leonore III recorded in 1966." UK LP 2531 103 track times 13:26 / 16:32 / 6:08 / 12:30 | https://www.discogs.com/release/530298 ; https://www.discogs.com/release/1850650 ; https://www.discogs.com/master/164209 | OK |
| Not the 1962 or 1984 cycles | 1962 cycle = first DG cycle (Jesus-Christus-Kirche); 1982–84 = digital cycle (Karajan Gold 439 002-2 couples Eroica with *Egmont*, not *Leonore*). The *Leonore III* coupling and the matching timings point to the 1976–77 analogue cycle | https://en.wikipedia.org/wiki/Karajan:_Beethoven_Symphonies_(1963) (search summary) ; Discogs search catno 415 506-2 / 439 002-2 | OK |

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Herbert von Karajan / Berliner Philharmoniker | Same (Spotify credits, Discogs) | embed page ; https://www.discogs.com/release/530298 | OK |
| Label | Deutsche Grammophon | DG | same | OK |
| Catalogue number | 2531 103 (LP); 419 049-2 (CD, with Leonore Overture No. 3) | LP 2531 103 (1977, ℗ 1977); CD 419 049-2 (1987-03-19, barcode 028941904928, ADD) | https://www.discogs.com/master/164209 ; https://www.discogs.com/release/530298 | OK |
| Recorded | "1977" | Discogs CD notes: "recorded and released in 1977". Discogs LP master: "Recorded 1975–1977, Berlin, Philharmonie" (the whole cycle). MusicBrainz gives a range 1976-05-07 to 1977-03-08 at the Berliner Philharmonie for all four movements (a cycle range, not the Eroica's own sessions). No exact session dates found | https://www.discogs.com/master/164209 ; MusicBrainz release above | OK (year only) |
| Venue | Philharmonie, Berlin | Discogs master and MusicBrainz | same | OK |
| Release year / year | 1977 | ℗ 1977; LP 1977 | Discogs master 164209 | OK |
| Production (not in yaml) | – | Producers Hans Hirsch, Magdalene Padberg; recording supervisor Michel Glotz; Tonmeister Günter Hermanns | https://www.discogs.com/release/14983806 | OK |
| *Leonore* No. 3 (track 5, not in guide) | – | Recorded 21–22 Sept 1965, Jesus-Christus-Kirche (MusicBrainz); Discogs CD notes say 1966. Sources disagree; not used in the guide | MusicBrainz release above ; Discogs 530298 | Conflict noted |
| Exposition repeat (I) | "He does not repeat the exposition" | Track I is 13:31 for 691 bars: without the repeat ≈ 51 bars a minute, with it ≈ 63 (faster than Beethoven's metronome mark of 60). The LP timing 13:26 agrees. The repeat is therefore almost certainly omitted | timings above | INFERRED (confirm by ear: the music should go straight from the exposition's closing chords into the development at ≈ 3:00) |
| "Three cycles for DG" (In this recording) | Karajan recorded the nine with the BPO for DG in 1961–62, 1975–77 and 1982–84 | https://en.wikipedia.org/wiki/Karajan:_Beethoven_Symphonies_(1963) ("the first of three Karajan Beethoven cycles for DG", via search summary) | SECONDARY |

### Durations (source: Spotify embed, album 4AAP5zYQJTEFQiQacOFq2s)

| Track | Movement | ms | Time in file (nearest second) |
| --- | --- | --- | --- |
| 1 | I. Allegro con brio | 810 800 | 13:31 |
| 2 | II. Marcia funebre. Adagio assai | 991 800 | 16:32 |
| 3 | III. Scherzo. Allegro vivace | 374 240 | 6:14 |
| 4 | IV. Finale. Allegro molto | 699 293 | 11:39 |
| | Total | 2 876 133 | 47:56 → `duration_min: 48` |

---

## 2. Also recommended: Fricsay / Berliner Philharmoniker (DG)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | https://open.spotify.com/album/6KuZGo8GkwZH4gYXxEyjJq | "Beethoven: Symphony No.3 "Eroica"", 4 tracks, credited "Berliner Philharmoniker, Ferenc Fricsay": 15:40 / 15:28 / 6:22 / 12:38. Link taken from DG's own product page | embed page ; https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphony-no-3-fricsay-942 | VERIFIED |
| Catalogue number | SLPM 138 038 (LP) | Stereo LP SLPM 138 038, first pressings dated August 1959 (mono LPM 18 576, 1960) | https://www.discogs.com/release/31039570 ; https://www.discogs.com/release/4536438 | OK |
| Release year | 1959 | August 1959 (Discogs 31039570) | same | OK |
| Recorded / venue | October 1958, Jesus-Christus-Kirche, Berlin | Search summary of a Japanese Esoteric SACD reissue listing: "recorded at Jesus-Christus-Kirche, Berlin, in October 1958". Not on the Discogs pages read | – | SECONDARY (check a booklet before publishing; marked with a comment in the yaml) |

Why Fricsay: a classic, faster and leaner account from the same orchestra twenty years earlier, and a natural contrast with Karajan's 1977 sound. Other candidates were not pursued because the turn's web-search budget ran out (see Open items).

---

## 3. Painting: Antoine-Jean Gros, *Bonaparte at the Pont d'Arcole* (study), c. 1796

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Antoine-Jean Gros (1771–1835) | Louvre record | OK |
| Title | Louvre: "Bonaparte au pont d'Arcole, le 17 novembre 1796, esquisse". File uses "Bonaparte at the Pont d'Arcole"; TR "Arcole Köprüsü'nde Bonaparte" | https://collections.louvre.fr/ark:/53355/cl010063557 | OK |
| Date | Louvre: "vers 1796" → file `c. 1796` (TR `1796 dolayı`) | same | OK |
| What it is | Louvre object history: "Étude pour un portrait exécuté à Milan en 1796 et qui fut exposé à Paris au Salon de 1801" (the finished portrait is at Versailles, R.F. 271). Commons description adds that it was painted in a few sittings arranged by Joséphine (not used in the guide) | Louvre record ; Commons file page | OK |
| Description | Bonaparte with sabre and the flag of the 2nd battalion, 51st demi-brigade; long flowing hair; black embroidered general's coat | Louvre record | OK |
| Medium, size | Oil on canvas, 73 × 59 cm | Louvre record ; Wikidata Q19008624 | OK |
| Collection | Musée du Louvre, Paris, RF 361, Sully wing room 935. Gift Hauguet, Schubert and Milliet, 1883 | Louvre record ; Commons | OK |
| Rights | Artist died 1835: public domain everywhere. Commons tag `{{PD-Art|PD-old-100-1923}}` | https://commons.wikimedia.org/wiki/File:Antoine-Jean_Gros_-_Bonaparte_au_pont_d%27Arcole(1796).jpg | OK |
| Image | 3200 × 3861 px JPEG (3.1 MB), a photograph of the canvas by Commons user Sammyday (2010). Thin strips of the frame show at the edges: crop slightly. Portrait format (≈ 0.83:1): plan the hero crop around the head | same | OK |
| Not reused | Gros has no painting in `content/paintings.yaml`; no other group had chosen it (checked the files present on 2026-10-10) | `content/paintings.yaml` ; `content/en/pieces/*.md` | OK |

**Why this painting.** The symphony was conceived around Bonaparte as a republican hero, before he crowned himself (Ries; the scratched-out "Bonaparte" on the copy score). Gros's study shows exactly that figure: the 27-year-old general, flag in hand, in the year of his Italian victories. The pairing note says so without claiming that Beethoven knew the picture.

---

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed mainly 1803–04; completed early 1804 | https://en.wikipedia.org/wiki/Symphony_No._3_(Beethoven) | OK |
| Private rehearsals/performances at Prince Lobkowitz's Vienna palace in 1804 (account dated 9 June 1804 for extra players incl. the third horn) | same | OK |
| First public performance 7 April 1805, Theater an der Wien | same | OK |
| Intended dedication/title "Bonaparte"; Ries's account of the torn title page after Napoleon proclaimed himself emperor (14 May 1804); told as Ries's story | same (quotes Ries) | OK |
| Copy score with "Intitolata Bonaparte" scratched out, Gesellschaft der Musikfreunde, Vienna | same | OK |
| Published 1806 as *Sinfonia eroica … composta per festeggiare il sovvenire di un grande Uomo*; dedicated to Lobkowitz | same | OK |
| Length: "twice as long as the symphonies of Haydn and Mozart – the first movement is almost as long as a Classical symphony" → guide: "the first movement alone is almost as long as a whole symphony by Haydn" | same (Assessment) | OK (cautious paraphrase) |
| Mixed premiere reviews; "too difficult, too long" | same | OK |
| Finale theme from *The Creatures of Prometheus* (1801), also Contredanse WoO 14 No. 7 and Variations Op. 35 | same | OK |
| Prometheus "brought fire to humankind" | general mythology | OK |
| I: opens with two loud E-flat chords; cellos introduce Theme 1; chromatic C-sharp at bar 7 | same | OK |
| I: second group starts with a falling motif passed between oboe, clarinet, flute and violin (m. 45) | same | OK |
| I: six hemiola sforzando chords at the climax of the exposition (mm. 128–131) | same | OK |
| I: fugato (mm. 236–246), 32 bars of hammered sforzando chords (mm. 248–279), new E minor theme (m. 284) | same | OK |
| I: the "early" horn entry (mm. 394–395) and Ries's anecdote ("I believe I was in danger of getting my ears boxed") | same | OK |
| I: long coda that brings back the E minor theme | same | OK |
| II: funeral march in C minor; *Maggiore* section in C major (m. 69); fugue in F minor (m. 114); march returns in the oboe (m. 173); coda (m. 209); final statement "crumbles into short phrases interspersed with silences" (m. 238) | same | OK |
| II: bass figure imitating muffled drums | Standard description of the opening (grace-note "drum-roll" figure in the basses); not in the Wikipedia text | SECONDARY (score) |
| III: scherzo begins pianissimo, not in the tonic (theme in B-flat), first fortissimo tutti in E-flat at m. 93; trio from m. 170 for three horns, "the first time this had appeared in the symphonic tradition"; four bars changed to duple time in the da capo (mm. 381–384); coda builds from *pp* to *ff* | https://en.wikipedia.org/wiki/Symphony_No._3_(Beethoven) ; https://de.wikipedia.org/wiki/3._Sinfonie_(Beethoven) | OK |
| III: natural horns without valves in 1804 | general organology | OK |
| IV: introduction, bass theme in pizzicato, theme then 10 variations: fugue (var. 4, C minor), D major with flute solos (var. 5), G minor dance (var. 6), second fugue in E-flat (var. 8), *Poco andante* with oboe (var. 9), triumphant brass (var. 10), *Presto* coda | https://en.wikipedia.org/wiki/Symphony_No._3_(Beethoven) | OK |
| Threads: the first movement's theme traced to the Op. 35 / *Prometheus* bass (Lockwood) | same (Thematic origins) | OK ("some scholars") |

---

## 5. Re-time needed (all stops are ≈; derived from bar numbers in the published analysis, spread proportionally over the Spotify track lengths. Nobody has listened against the Karajan tracks yet)

Reference: Karajan / BPO 1977, Spotify `4AAP5zYQJTEFQiQacOFq2s`. Add these rows to `content/research/retime-needed.md` when the shared files are merged.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Allegro con brio | 13:31 | 0:00, 0:03, 0:50, 2:30, 3:00, 4:35–5:25, 5:30, 7:40, 10:50, Last minute | Assumes no exposition repeat (see §1). If Karajan does repeat it, every stop from 3:00 on moves by about 2:30. Also the horn entry (≈ 7:40) |
| II Marcia funebre | 16:32 | 0:00, 0:30, 1:05, 4:35, 7:00–7:40, 10:15–11:10, 11:30, 14:00, Last 40 seconds | The *Maggiore* (≈ 4:35) and the fugue (≈ 7:00–7:40); a uniform 4.0 s per bar was assumed |
| III Scherzo | 6:14 | 0:00, 0:50, 3:00, 4:35, 5:40, Last 15 seconds | The trio (≈ 3:00) assumes the first part of the scherzo is repeated. If it is not, the trio starts nearer 2:00 and the later stops move earlier |
| IV Finale | 11:39 | 0:00, 0:15, 0:45, 1:10, 2:20, 3:30, 4:15, 5:30, 7:00, 8:45, Last 45 seconds | The split between the Allegro molto and the *Poco andante* (≈ 7:00) and the horn climax (≈ 8:45); tempo changes make the proportional estimate weakest here |

---

## 6. Open items

1. **Re-time by ear** (above). Confirm the missing exposition repeat in I and the repeat in III.
2. **Fricsay recording date and venue** are from a search summary only.
3. The web-search budget for the batch run ran out before more alternative recordings could be compared; the alternative choice is reasonable but was not weighed against others (e.g. Gardiner/ORR, Klemperer 1959).
