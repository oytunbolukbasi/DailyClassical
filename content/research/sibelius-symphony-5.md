# Verification: Sibelius – Symphony No. 5 in E-flat major, Op. 82

Piece id `sibelius-symphony-5`. Checked on 2026-10-10 (batch group H).
Files: `content/en/pieces/sibelius-symphony-5.md`, `content/tr/pieces/sibelius-symphony-5.md`.
Shared-file additions (paintings.yaml, composers.yaml for the new composer `sibelius`): `content/research/sibelius-symphony-5.shared.md`.

**How the checks were done** (same method as `rachmaninoff-piano-concerto-2.md`)
- **Spotify:** each album id was confirmed by downloading the public embed page `https://open.spotify.com/embed/album/<id>` and reading its track list (title, performer credits, duration in ms). The album page's `og:description`, `music:release_date` and ℗/© lines were also read. **VERIFIED** = album title, performers and every track of the work seen in that data. Track times are given as Spotify displays them (whole seconds, truncated).
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits and notes). Human-readable URLs below.
- **Status key:** OK = confirmed from a primary source. SECONDARY = only from a retailer, review or search snippet. UNVERIFIED = not confirmed.
- No request to an outside service carried any personal data; the generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent was used.

---

## 1. Reference recording: Colin Davis / Boston Symphony Orchestra (Philips, 1975)

Chosen as a widely admired Fifth: the opening instalment of Davis's Boston Sibelius cycle (Philips), reissued in Philips's *50 Great Recordings* series and in 2026 in Decca's *Pure Analogue* LP series. Rejected for the hard limit: Karajan's 1965 Berlin DG recording (Spotify `26YkRANMNsJSHplZWF41E1`) splits the first movement into two tracks (Ia 9:31, Ib 4:40).

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Colin Davis / Boston Symphony Orchestra | Spotify credits "Boston Symphony Orchestra, Sir Colin Davis"; Discogs LP: "Conductor – Sir Colin Davis; Orchestra – Boston Symphony Orchestra" | https://open.spotify.com/embed/album/6oBoMHHi6wG9ZUpBHtkxgc ; https://www.discogs.com/release/3734301 | OK |
| Label / catalogue | Philips; "6500 959 (LP, with Symphony No. 7)" | Discogs main release of master 601830: Philips 6500 959, LP, Netherlands, 1975, *Symphonies Nos. 5 and 7* (Sym. 5 32:00, Sym. 7 21:20). Spotify album: ℗ 1975 / © 2001 Universal International Music B.V. (the 2001 CD 464 740-2, per search results) | https://www.discogs.com/master/601830 ; https://www.discogs.com/release/3734301 | OK |
| Recorded | January 1975 | Notes of the Philips box *The Complete Symphonies* 456 591-2: "Recorded: Boston … 1/1975 (Symphonies Nos. 5, 7)" | https://www.discogs.com/release/4339525 | OK |
| Venue | Symphony Hall, Boston | Audiophilia review of the 2026 Decca reissue: "All were recorded in Symphony Hall, Boston." The Discogs box notes give only "Boston" | https://www.audiophilia.com/reviews/2026/1/29/sibelius-symphonies-5-7 | SECONDARY |
| Release year / year | 1975 | Discogs LP dated 1975; Spotify `music:release_date` 1975-01-01 and ℗ 1975. The Audiophilia review says the first LP of the cycle "appeared in 1977" (probably the US issue); the guide uses 1975 | as above | OK (date conflict noted) |
| Spotify | https://open.spotify.com/album/6oBoMHHi6wG9ZUpBHtkxgc | "Sibelius: Symphonies Nos.5 & 7", album, 1975, 8 tracks. Tracks 1–3 = Symphony No. 5; tracks 4–8 = Symphony No. 7 (IV split into IVa/IVb, irrelevant here) | embed page | VERIFIED |

### Durations (source: Spotify embed, album 6oBoMHHi6wG9ZUpBHtkxgc)

| Track | Movement (Spotify title) | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Tempo molto moderato – Largamente – Allegro moderato – Presto | 908133 | 15:08 |
| 2 | II. Andante mosso, quasi allegretto | 544093 | 9:04 |
| 3 | III. Allegro molto – Misterioso – Un pochettino largamente – Largamente assai | 481600 | 8:01 |
| | Total | 1933826 | 32:13 → `duration_min: 32` |

---

## 2. Also recommended: Karajan / Philharmonia Orchestra (Columbia/EMI, 1960)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Herbert von Karajan / Philharmonia Orchestra | Spotify credits "Herbert von Karajan, Philharmonia Orchestra" | https://open.spotify.com/embed/album/1BNb0BqqiDmiVrQ4iC9iQ1 | OK |
| Label | Columbia (EMI); now Warner Classics | Spotify: "℗ 1961 Warner Classics, Warner Music UK Ltd … Digital remastering (p) 2014". Original LP number (Columbia SAX series) not confirmed, so `catalogue_number: null` | album page | OK (label); catalogue UNVERIFIED |
| Recorded / venue | September 1960, Kingsway Hall, London | A retailer listing of the Hi-Q LP reissue: Symphony No. 5 recorded 20, 21 & 23 September 1960, Kingsway Hall (Finlandia January 1959) | https://www.diversevinyl.com/?p=86698 | SECONDARY |
| Release year | 1961 | Spotify ℗ 1961 | album page | OK |
| Spotify | https://open.spotify.com/album/1BNb0BqqiDmiVrQ4iC9iQ1 | "Sibelius: Symphony No. 5, Finlandia", 1961, 4 tracks: 13:25 / 8:11 / 9:11, then Finlandia 9:00. Three tracks for the symphony | embed page | VERIFIED |

Not used: Bernstein / New York Philharmonic (Sony, `4RYblxYkvh5GySwYvzh9TY`, 13:16 / 9:55 / 9:43; session data not checked).

---

## 3. Painting: Bruno Liljefors, *Knobbelzwanen op avondtrek* (Mute Swans in Evening Flight), 1925

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Bruno Liljefors (1860–1939), Swedish | https://commons.wikimedia.org/wiki/File:Bruno_Liljefors_-_Knobbelzwanen_op_avondtrek_-_0211_-_Rijksmuseum_Twenthe.jpg | OK |
| Title | Museum title (Dutch): "Knobbelzwanen op avondtrek". English is our translation ("Mute Swans in Evening Flight"); TR "Akşam Uçuşunda Kuğular" | Wikidata Q43084881 https://www.wikidata.org/wiki/Q43084881 | OK (translation ours) |
| Date | 1925 | Wikidata (inception 1925); Commons category "1925 landscape paintings from Sweden" | OK |
| Medium / size | Oil on canvas, 105.5 × 156.5 cm | Wikidata | OK |
| Collection | Rijksmuseum Twenthe, Enschede, inv. 0211 | Wikidata; museum page linked from Commons (the page refused our fetch with HTTP 403, so it was not read) https://collectie.rijksmuseumtwenthe.nl/zoeken-in-de-collectie/detail/id/436fb301-72ec-5c5c-bcd9-0fd3e9fcd11e | OK (museum page not opened) |
| Rights | Artist died 1939: public domain everywhere. Commons tag {{PD-Art\|PD-old-auto-expired\|deathyear=1939}} | Commons page | OK |
| Image | 10572 × 7303 px, 15.3 MB, museum source (Rijksmuseum Twenthe) | Commons API `imageinfo` | OK |
| Species note | The painting shows mute swans; the swans Sibelius saw in April 1915 are linked on Wikipedia to the whooper swan. The guide says only "swans" | https://en.wikipedia.org/wiki/Jean_Sibelius | – |

**Why this painting.** Swans flying low over a northern wetland at dusk, by a Nordic contemporary of Sibelius (both born in the 1860s), ten years after the swans of April 1915. The link is the subject and the northern light, not a documented connection between Liljefors and Sibelius.

Alternatives (details in the .shared.md): Liljefors, *Sträckande svanar* (Swans in Flight), 1915 (the swans' year; private collection, auction image 2500 × 1502); Liljefors, *Svanar* (Swans), 1906 (Thielska Galleriet, Stockholm; swans on water).

---

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Written for his 50th birthday, 8 Dec 1915, declared a national holiday; commissioned by the Finnish government; premiere that evening, Helsinki, Sibelius conducting (hall of the Helsinki Stock Exchange) | https://en.wikipedia.org/wiki/Symphony_No._5_(Sibelius) ; https://en.wikipedia.org/wiki/Jean_Sibelius | OK |
| Not satisfied; revised 1916 (Turku, 8 Dec 1916, combining the first two movements) and 1917–1919; final version premiered 24 Nov 1919, Helsinki Philharmonic, Sibelius conducting; originally four movements | same two pages | OK |
| April 1915: saw 16 swans flying by, which inspired the finale; "One of the great experiences of my life!" | https://en.wikipedia.org/wiki/Jean_Sibelius (Wikipedia links them to the whooper swan) | OK |
| Diary: composing felt like God throwing down pieces of a mosaic (paraphrased in Threads, not quoted) | https://en.wikipedia.org/wiki/Symphony_No._5_(Sibelius) | OK |
| Only Sibelius symphony with every movement in a major key | same | OK |
| Tempo symmetry: I slow → fast, II moderate, III fast → slow | same | OK |
| I: opens with soft horn calls, the first horn playing the main material while the others hold long notes; woodwinds develop it in parallel motion; later themes in woodwinds over string tremolo and a chorale-like idea in horns and woodwinds; the first theme returns over string tremolo (second "exposition"/rotation) | same ("Double exposition" section) | OK |
| I: Largamente at bar 92; Allegro moderato (scherzo) at bar 114 entered by gradual acceleration with no break; trumpet tune with timpani in the Trio-like section; Presto/Più presto coda | same | OK |
| I: the slow bassoon lament over murmuring strings in the development | Not in the Wikipedia analysis; from the score (the bassoon solo marked *lugubre*). Confirm by ear | PARTLY VERIFIED |
| II: variations on a simple theme, pizzicato strings with flutes; tempo markings Poco a poco stretto – Tranquillo – Poco a poco stretto – Ritenuto al tempo I | same | OK |
| III: rapid string tremolando opening; swaying horn motif linked to the swans; Tovey compared it to Thor swinging his hammer; a famous melody above it in woodwinds/strings; ends with six staggered chords separated by silence, not in the original version | same | OK |
| Metres: I 12/8 → 3/4 (Wikipedia text); II 3/2 and III 2/4 → 3/2 (Wikipedia score excerpts) | same | SECONDARY (from the excerpts; check against a score) |
| Davis's Boston recordings of 5 and 7 were the first of his complete Boston cycle | Audiophilia review ("the first released"); Discogs box notes (5 and 7 recorded 1/1975, the others 1976) | OK |

---

## 5. Re-time needed (all stops are ≈, estimated from track lengths, bar positions and the published structure; nobody has listened against the Davis tracks yet)

Reference: Davis / Boston SO, Spotify `6oBoMHHi6wG9ZUpBHtkxgc` (tracks 1–3). Calibration: in Karajan's split Berlin recording the slow part of I lasts 9:31 and the scherzo 4:40; Davis's I is 15:08, so his *Allegro moderato* was placed at ≈ 9:45.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Tempo molto moderato – Allegro moderato – Presto | 15:08 | 0:00, 1:30, 3:10, 6:15–7:45, 8:00–9:00, 9:45, 11:00, Last 2 minutes | The bassoon passage (≈ 6:15–7:45), the start of the *Allegro moderato* (≈ 9:45) and the trumpet tune (≈ 11:00) |
| II Andante mosso, quasi allegretto | 9:04 | 0:00, 0:15, 1:30, 3:00–4:30, 5:00, 6:15–7:30, Near the end | Positions of the two *stretto* build-ups and the *Tranquillo* |
| III Allegro molto – Largamente assai | 8:01 | 0:00, 1:30, 3:00–4:15, 4:30, 6:00–7:00, Last 40 seconds | Entry of the swan theme (≈ 1:30) and its return in E-flat (≈ 4:30) |
