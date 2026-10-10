# Verification: Beethoven – Piano Sonata No. 23 in F minor, Op. 57 "Appassionata"

Piece id: `beethoven-piano-sonata-23` (form `piano-sonata`, performers `soloists` only).
Files: `content/en/pieces/beethoven-piano-sonata-23.md`, `content/tr/pieces/beethoven-piano-sonata-23.md`. Shared-file additions: `content/research/beethoven-piano-sonata-23.shared.md`.
Checked on 2026-10-10 (batch October 2026, group B). Method as in `beethoven-piano-sonata-14.md` (Spotify embed, Discogs and MusicBrainz APIs, Craig Sapp's Humdrum score `kern/sonata23-1/2/3.krn`).

---

## 1. Reference recording: Emil Gilels (DG, 1973)

### Spotify embed check

Album `3O9HUGtcDizohPdj12wmVh`: *Beethoven: Piano Sonatas Nos.21"Waldstein", 26 "Les Adieux" & 23 "Appassionata"*, 10 tracks, all credited "Ludwig van Beethoven, Emil Gilels". The same Spotify link is given on DG's own product page for the CD (*Piano Sonatas Nos. 21, 23, 26 / Gilels*, release date 15 April 1986, UPC 00028941916228): https://www.deutschegrammophon.com/en/catalogue/products/beethoven-piano-sonatas-nos-21-23-26-gilels-3266

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| **8** | **Piano Sonata No.23 In F Minor, Op.57 -"Appassionata": 1. Allegro assai** | **11:09** | 669250 |
| **9** | **… 2. Andante con moto** | **6:27** | 387500 |
| **10** | **… 3. Allegro ma non troppo** | **7:53** | 473000 |

Total 25:29 → `duration_min: 25`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Emil Gilels | Emil Gilels | embed; https://www.discogs.com/release/6322484 | VERIFIED |
| Label / catalogue | DG, 419 162-2 (CD, with Sonatas Nos. 21 & 26) | DG 419 162-2, CD, 1986-04-15; producer Günther Breest; engineer Klaus Scheibe (tracks 5–10) | https://www.discogs.com/release/6322484 ; https://musicbrainz.org/release/ba5a6979-28eb-4924-afb4-316ed93a4d4f | VERIFIED |
| Recorded / venue | June 1973, Evangelisches Johannesstift, Berlin-Spandau | Discogs notes: "Recordings: … Berlin-Spandau, Johannesstift, 6/1973 (Op. 57)". MusicBrainz: recorded at Johannesstift, 1973-06 | same two | VERIFIED |
| release_year | 1974 | "℗ … 1974 (Op. 57)". The original LP number was not found (web search capped); the CD number is given instead | https://www.discogs.com/release/6322484 | VERIFIED (year); original LP UNVERIFIED |
| year | 1973 | recording year | – | VERIFIED |

**CD vs Spotify.** CD lengths (MusicBrainz): 11:07 / 6:29 / 7:53; Spotify 11:09 / 6:27 / 7:53. Same recording, different track gaps.

### Repeats (INFERRED from durations and the score)

- I: no repeat marked (Humdrum: 262 bars, no repeat barlines). Beethoven left out the exposition repeat.
- III: the repeat covers the development and recapitulation (Humdrum expansion `[A,B,B1,B,B2,…]`, section B from bar 118 to bar 308, then the Presto with its own internal repeats from bar 316). Played with the repeat ≈ 500 bars before the Presto; at ≈ 0.85 s a bar plus ≈ 50 s of Presto this gives Gilels's 7:53. Without it ≈ 5:30 (Wikipedia: "7 to 8 minutes with repeats, 5.5 to 6 without"). The guide says Gilels takes the repeat: **INFERRED – confirm by ear** (the music of ≈ 1:39 should come back at ≈ 4:20).

---

## 2. Also recommended: Daniel Barenboim (DG, 1981)

Spotify `4TCTWpN6Gwq2dA37rkwMX1`, tracks 7–9: 10:40 (640906) / 7:39 (459104) / 8:13 (493960), credited "Ludwig van Beethoven, Daniel Barenboim". CD 419 602-2; sleeve: "Recorded: Paris, Mutualité, 5/1981 (Op. 57)" (Discogs 12248671, as already verified in `research/beethoven-piano-sonata-8.md` §1). First release: MusicBrainz recording a94c69af-6722-406e-a944-c067c57aee40 is first released in 1984 in *Die Klaviersonaten / The Piano Sonatas* → `release_year: 1984`. Status: VERIFIED.

---

## 3. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written mostly in 1804 and 1805 (`year: 1805`) | Wikipedia: "composed during 1804 and 1805, and perhaps 1806". https://en.wikipedia.org/wiki/Piano_Sonata_No._23_(Beethoven) | VERIFIED (secondary) |
| Years of the *Eroica* and *Fidelio* | Eroica 1803–04 (premiered 1805), Fidelio first performed November 1805: general knowledge; not separately cited | Widely documented; low risk |
| Published Vienna, February 1807; dedicated to Count Franz von Brunsvik, a cellist and friend | Wikipedia (Feb 1807; "cellist and friend Count Franz Brunswick"); first edition by the Bureau des Arts et d'Industrie, Vienna, per a dealer's description of a first-edition copy: https://www.schubertiademusic.com/products/15671-beethoven-ludwig-van-1770-1827-livme-sonate-composee-pour-pianoforte-et-dediee-a-monsieur-le-comte-francois-de-brunsvik-par-louis-van-beethoven-op-57-appassionata | VERIFIED (secondary) |
| Name added by the publisher of a four-hand arrangement in 1838 | Wikipedia. The publisher's name (often given as Cranz, Hamburg) was not confirmed, so the guide does not name it | VERIFIED (secondary) |
| First movement keeps returning to the lowest F of Beethoven's piano; coda sweeps nearly the whole keyboard | Wikipedia ("frequently uses the lowest F1, the lowest note available to Beethoven then"; coda arpeggios "across most of the early 19th-century piano's range") | VERIFIED (secondary) |
| I: theme in octaves, dotted down-and-up arpeggio, repeated a semitone higher | Wikipedia (main theme in octaves, repeated on G-flat) | VERIFIED |
| I: knocking figure short-short-short-long, the Fifth Symphony's rhythm | Score: bass D-flat–D-flat–D-flat–C, bars 10–12 (Humdrum). The rhythmic identity with the Fifth's opening is audible and widely remarked; the guide states only the shared rhythm, not a compositional link | VERIFIED (rhythm) |
| I: theme 2 in A-flat major over repeated bass notes, related to theme 1; exposition ends in A-flat minor; development opens in E major; recapitulation over a repeated low C | Score (Humdrum key changes bars 72, 91; "dolce e legato" bar 36; standard analysis). Keys and bar positions from the encoding, labels standard | INFERRED (check by ear) |
| I: coda with *più allegro*; ends *ppp* | Humdrum: tempo change after bar 238, final bars; Wikipedia (long coda) | VERIFIED |
| II: variations on a theme in D-flat; var. 1 off-beat left hand, var. 2 sixteenths, var. 3 thirty-seconds with hands exchanging; theme returns; soft then loud diminished-seventh chord leads without a break into the finale | Wikipedia (counts the return as a fourth variation; the guide calls it "the theme comes back"); Humdrum fermatas bars 101–102 | VERIFIED |
| III: hammered opening chord; repeat of development + recapitulation instead of exposition; Presto coda with a new theme; ends in F minor | Wikipedia ("diminished 7th chord … repeated 12 times"; "the combined development and recapitulation is marked for repetition"; Presto coda: a new theme, then the main theme faster); Humdrum | VERIFIED |
| III: second group in C minor | Standard analysis of the finale; not confirmed in a cited source | INFERRED |
| "Ends in tragedy" (Threads: "the finale ends in the minor") | Wikipedia, citing Tovey (one of a handful of Beethoven sonata-form works that end in tragedy). The guide only states that it ends in the minor | VERIFIED |

Not used: the manuscript-in-the-rain anecdote, Lenin's remark, the "La Pasionata" note on the autograph cover (found only in Wikipedia; not confirmed), and the claim that Beethoven thought it his most tempestuous sonata.

---

## 4. Painting: Johan Christian Dahl, *An Eruption of Vesuvius* (1824)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Johan Christian Dahl (Norwegian, Bergen 1788–1857 Dresden), *An Eruption of Vesuvius*, 1824 | Met API object 438159: https://collectionapi.metmuseum.org/public/collection/v1/objects/438159 ; https://www.metmuseum.org/art/collection/search/438159 | VERIFIED |
| Collection | The Metropolitan Museum of Art, New York, 2019.167.1. Gift of Christen Sveaas, in celebration of the Museum's 150th Anniversary, 2019; gallery 807 | same | VERIFIED |
| Medium / size | Oil on canvas, 94 × 139.1 cm | same | VERIFIED |
| Public domain | Artist died 1857; Met `isPublicDomain: true` (CC0) | same | VERIFIED |
| Image | Met primary image `DP155336.jpg`, 3907 × 2629. Same size on Commons: `File:Johan Christian Dahl - An Eruption of Vesuvius - 2019.167.1 - Metropolitan Museum of Art.jpg` | https://commons.wikimedia.org/wiki/File:Johan_Christian_Dahl_-_An_Eruption_of_Vesuvius_-_2019.167.1_-_Metropolitan_Museum_of_Art.jpg | VERIFIED. Not NC |
| Not already used | Dahl is not in `content/paintings.yaml` (checked 2026-10-10) | – | VERIFIED |

**Pairing.** A mood pairing, not a historical one: twenty years after the sonata, a Romantic painter's night eruption over a calm bay. The pairing note says only that the painting and the sonata share the pattern of stillness broken by explosions. Considered and kept as alternatives: Loutherbourg's *An Avalanche in the Alps* (1803, exactly the sonata's years) and Wright of Derby's *Vesuvius in Eruption*, both rejected as first choice because their largest public-domain files are under 1800 px high.

---

## 5. Glossary

Existing terms reused: sonata form, coda, unison, motif, exposition, development, recapitulation, pedal note, variation. No new terms. Parser check (with the group's one new row): no problems; 11 / 6 / 8 stops.

---

## 6. Re-time needed

Derived from the Humdrum bar structure and the Spotify track lengths, assuming a steady tempo inside each section (I ≈ 2.6 s a bar, faster *più allegro*; II ≈ 2.7 s a bar of 2/4 with all repeats; III ≈ 0.85 s a bar with the second-half repeat, Presto ≈ 0.65 s). Every stop is marked ≈.

| Mvt | Track (album `3O9HUGtcDizohPdj12wmVh`) | Stops to re-time | Basis / least certain |
| --- | --- | --- | --- |
| I Allegro assai | 8 (11:09) | 0:00, 0:25, 0:40, 1:25, 2:10, 2:45, 4:00, 5:50, 8:45, 10:15, Near the end | Bars 1, 10, 17, 35, 51, 66, ≈ 110, 136, 204, 239. Least certain: 4:00 (development climax) and 5:50 (recapitulation) |
| II Andante con moto | 9 (6:27) | 0:00, 1:25, 2:50, 4:15, 5:40, 6:10 | Theme and three variations of ≈ 32 played bars each; assumes Gilels takes all repeats |
| III Allegro ma non troppo – Presto | 10 (7:53) | 0:00, 0:16, 1:00, 1:39, 3:00, 4:20, 7:04, Near the end | Bars 1, 20, ≈ 64, 118, ≈ 212, repeat, Presto 316. **Confirm the second-half repeat first** |
