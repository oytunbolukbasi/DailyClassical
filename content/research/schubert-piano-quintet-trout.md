# Verification: Schubert – Piano Quintet in A major, D. 667, "Trout"

Piece id `schubert-piano-quintet-trout`. Checked on 2026-10-10 (batch 2026-10, group F).
Files: `content/en/pieces/schubert-piano-quintet-trout.md`, `content/tr/pieces/schubert-piano-quintet-trout.md`.
Shared-file additions (paintings.yaml; no new glossary terms, no new composer): `content/research/schubert-piano-quintet-trout.shared.md`.

**How the checks were done** (same method as `rachmaninoff-piano-concerto-2.md`)
- **Spotify:** album ids confirmed by downloading `https://open.spotify.com/embed/album/<id>` and reading the track list (title, credits, duration in ms) from its `__NEXT_DATA__`; label/℗ lines and `og:` tags read from `https://open.spotify.com/album/<id>`. Album ids were found with a web search restricted to open.spotify.com and by resolving track pages to their album.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` and `/masters/<id>`.
- **Status key:** OK = primary source. SECONDARY = retailer, review, user-contributed note or search summary. UNVERIFIED = not confirmed.
- The session's web-search budget ran out before every secondary detail could be chased; those are marked.

---

## 1. Reference recording: Curzon / members of the Vienna Octet (Decca, 1957)

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Clifford Curzon (piano), Willi Boskovsky (violin), Günther Breitenbach (viola), Nikolaus Hübner (cello), Johann Krump (double bass) | Spotify credits: "Sir Clifford Curzon, Wiener Oktett". Discogs credits on the original LP and on London CS 6090 list the four string players by name ("Mitglieder des Wiener Oktetts") | https://open.spotify.com/embed/album/06Aea2N1qVuld6Mw9Xz6XS ; https://www.discogs.com/release/9454795 ; https://www.discogs.com/release/8884263 | OK |
| Label | Decca | Decca (UK); London Records in the US | same | OK |
| Catalogue number | LXT 5433 (mono LP); SXL 2110 (stereo LP); 467 417-2 (CD, Decca Legends) | LXT 5433, UK, Nov 1958 (Discogs master 236435, main release 9454795). SXL 2110 stereo (London CS 6090 notes: "Corresponding Decca SXL 2110"). The Spotify album is Decca's 2000 CD *Trout Quintet / Death and the Maiden* (℗ 2000 Decca Music Group; DG/Decca product page gives UPC 00028946741726, release 4 Sept 2000). **467 417-2 is derived from that UPC**, not read from a sleeve | https://www.discogs.com/release/9454795 ; https://www.discogs.com/release/8884263 ; https://www.deccaclassics.com/en/catalogue/products/schubert-trout-quintet-5197 | LP numbers OK; CD number DERIVED |
| Recorded | "1957" | Discogs note on London CS 6090 (user-contributed): "Recorded 29 Nov–1 Dec 1957 in Sofiensaal, Vienna". A Presto Music listing (via search summary; the page itself returned 403) says October 1957. Only the year is in the file | https://www.discogs.com/release/8884263 ; https://www.prestomusic.com/classical/products/8650129--schubert-trout-quintet-string-quartet-no-14-death-and-the-maiden | Year OK; month disputed |
| Venue | Sofiensaal, Vienna | Both sources above | same | SECONDARY (consistent) |
| Release year / year | 1958 | LXT 5433 released Nov 1958 (Discogs). Some reissues say "First published 1958" | https://www.discogs.com/release/9454795 ; https://www.discogs.com/release/3568110 | OK |
| Spotify | https://open.spotify.com/album/06Aea2N1qVuld6Mw9Xz6XS | "Schubert: Trout Quintet / String Quartet in D minor "Death and the Maiden"", compilation, 2000, 9 tracks, © / ℗ 2000 Decca Music Group Limited. Tracks 1–5 = Trout (Curzon, Wiener Oktett); 6–9 = D. 810 (Wiener Philharmonisches Streichquartett) | embed + album page | VERIFIED |

Rejected Spotify editions of the same recording: `5e2JukBH8g2CzoruP0cHDO` and `79r3LPGoHR9NmoTvVWCfBa` (2012 third-party reissues, "Clifford Curzon With Members Of The Vienna Octet", slightly different durations), `7xA5wi8caOjqOa5cOUYJhn` and `6zHuhnYs7hDeZss1QOsO3K` (mixed compilations). Decca's own 2000 album is used.

### Durations (Spotify embed, album 06Aea2N1qVuld6Mw9Xz6XS)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Allegro vivace | 548053 | 9:08 |
| 2 | II. Andante | 447253 | 7:27 |
| 3 | III. Scherzo. Presto | 251480 | 4:11 |
| 4 | IV. Theme – Andantino – Variations 1–5 – Allegretto | 452920 | 7:32 |
| 5 | V. Finale. Allegro giusto | 414613 | 6:54 |
| | Total | 2114319 | 35:14 → `duration_min: 35` |

Repeats: track I (9:08) against Brendel (13:27) and Gilels (13:41) shows Curzon omits the exposition repeat (stated in the guide). The finale (6:54, against 6:12 Brendel and 6:21 Gilels) points to no repeat of the first half in any of the three; the guide says this cautiously ("suggests"). Confirm by ear.

## 2. Also recommended: Brendel / Cleveland Quartet / James Van Demark (Philips)

| Field | File value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Performers | Alfred Brendel; Cleveland Quartet; James Van Demark (double bass) | Spotify credits "Alfred Brendel, Cleveland Quartet, James van Demark" | https://open.spotify.com/embed/album/2skRHJMVuFHQmr0HmYlxUD | OK |
| Label / year | Philips, 1978 | ℗ 1978 Universal International Music B.V. (Philips catalogue, now Decca) | album page | OK (label from catalogue history; ℗ line names the current owner) |
| Catalogue, recorded, venue | null | Not checked (search budget used up) | – | UNVERIFIED, left null |
| Spotify | 2skRHJMVuFHQmr0HmYlxUD | "Schubert: Piano Quintet "The Trout"", album, 1978, 5 tracks: 13:27 / 7:10 / 3:59 / 7:45 / 6:12 | embed | VERIFIED |

Other complete albums seen: Gilels / Amadeus Quartet / Rainer Zepperitz, DG, `3U8LJRFAuaWRCRAco9xNfS` (℗ 1997 compilation; 13:41 / 7:18 / 4:02 / 8:01 / 6:21). A good second alternative if wanted.

## 3. Painting: Carl Spitzweg, *The Angler* (*Der Angler*), c. 1875

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Carl Spitzweg (1808–1885), Munich | SKD online collection | OK |
| Title / date | *Der Angler*, "um 1875"; signed lower right with an S in a rhombus | https://skd-online-collection.skd.museum/Details/Index/324364 | OK |
| Medium / size | Oil on poplar panel, 25.5 × 19.3 cm | same | OK |
| Collection | Galerie Neue Meister, Staatliche Kunstsammlungen Dresden (shown in the Albertinum), Gal.-Nr. 2378 A; bequest of Johann Friedrich Lahmann, 1937 | same | OK |
| Image | File:Dresden, Albertinum, Carl Spitzweg, der Angler.JPG, 2870 × 4056 (portrait), own photo by Commons user Dguendel, 20 March 2019, **CC BY 4.0** (not NC). Checked at 500 px: canvas fills the frame. The SKD's own images are "rights reserved" (InC), so the Commons photo is used | https://commons.wikimedia.org/wiki/File:Dresden,_Albertinum,_Carl_Spitzweg,_der_Angler.JPG | OK |
| Pairing | An angler has just pulled a small fish out of a woodland stream (it is in the air at the left) while two young women watch: the subject of *Die Forelle*, where the poet watches an angler catch the trout. Link by idea; the painting is about 56 years later than the quintet and from Munich, not Austria | – | – |

**Why not Waldmüller.** The first draft used Waldmüller's *View of Ischl* (1838, Alte Nationalgalerie). Group E's `schubert-symphony-9` already uses another Waldmüller view near Ischl dated 1838, so it was moved to the alternatives to avoid two near-identical pairings for Schubert.

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 1819, Schubert aged 22 | https://en.wikipedia.org/wiki/Trout_Quintet | OK |
| Summer 1819 in Upper Austria with Johann Michael Vogl; Steyr | Trout Quintet article; https://en.wikipedia.org/wiki/Die_Forelle | OK (Vogl link is standard Schubert biography; the Trout article names Steyr and Paumgartner) |
| Commissioned by Sylvester Paumgartner, wealthy patron and amateur cellist from Steyr. The *Die Forelle* article spells him "Baumgartner"; the guide uses the more common "Paumgartner" | both articles | OK (spelling varies) |
| Paumgartner asked for variations on *Die Forelle*; they form movement IV and give the nickname | both articles | OK |
| *Die Forelle*, D. 550, early 1817, poem by Schubart; the angler troubles the water to catch the trout; the piano figure suggests the fish in the water | https://en.wikipedia.org/wiki/Die_Forelle | OK. "Muddies the water" is the poem's own image ("macht … das Bächlein tückisch trübe"); the article paraphrases it as the surface "troubled" |
| Scoring piano, violin, viola, cello, double bass | Trout Quintet article | OK |
| Hummel model: Albert Stadler says it was modelled on an arrangement of Hummel's Septet Op. 74 for these instruments; Hummel's Quintet Op. 87 (same scoring) may also have influenced it. Guide: "probably took the idea from music by Hummel arranged for the same five instruments" | Trout Quintet article | OK (cautious wording) |
| Five movements; published 1829, a year after his death | same | OK |
| I: tonic for ten bars, then F major at bar 11 ("first surprise"); development opens with an abrupt shift; recapitulation in the subdominant (D major), so the transition needs no modulation | same | OK |
| I: Theme 2 in E major, violin–cello duet | Score (E major = dominant, standard); duet scoring from the score, not from a fetched source | PARTLY VERIFIED |
| II: Andante, F major; two symmetrical halves; ends where it began. Keys of the three songs (F major, F-sharp minor, D major; second half A-flat major …) | Trout Quintet article (structure); keys from the score / standard analyses | Structure OK; keys of the second-half songs SECONDARY, check by ear |
| III: Scherzo Presto A major; trio in D major | standard analyses | SECONDARY |
| IV: D major, Andantino, 2/4 (score excerpt); theme for strings alone; each early variation gives the theme to a different instrument; Var. 5 begins in B-flat major; the final Allegretto recalls the song's accompaniment | Trout Quintet article | OK. Which instrument leads each variation (I piano, II viola/cello, III cello/bass, V cello) is from the score: confirm by ear |
| V: two symmetrical halves, the second an exact transposition; first-half repeat often omitted; first half ends in D major | same | OK |

## 5. Re-time needed (every stop is an estimate)

None of these were timed by ear. They come from the track lengths and the published structure. Add to `content/research/retime-needed.md`.

| Mvt | Track length | Stops to re-time | Least certain |
| --- | --- | --- | --- |
| I Allegro vivace | 9:08 | 0:00, 0:30, 1:00, 1:50, 2:45–4:15, 4:20, 5:40, Near the end | Theme 1 entry (≈ 1:00), Theme 2 (≈ 1:50), development (≈ 4:20), recapitulation (≈ 5:40). Assumes no exposition repeat |
| II Andante | 7:27 | 0:00, 1:15, 2:15, 3:40, 4:50, 5:50, Near the end | Where the second half starts (≈ 3:40); keys of songs 2 and 3 in the second half |
| III Scherzo | 4:11 | 0:00, 0:45, 1:45, 2:50, Near the end | Whether Curzon takes both scherzo repeats; trio start |
| IV Andantino | 7:32 | 0:00, 1:05, 2:00, 2:55, 3:45, 4:40, 6:00, Near the end | Every variation boundary (each ≈ 50–60 s, with repeats) |
| V Finale | 6:54 | 0:00, 0:50, 1:30, 2:30, 3:30, Near the end | Start of the second half (≈ 3:30), and whether the first half is repeated |
