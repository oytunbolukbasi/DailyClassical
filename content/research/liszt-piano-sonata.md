# Verification: Liszt – Piano Sonata in B minor, S. 178

Piece id `liszt-piano-sonata`. Checked on 2026-10-10 (batch G, October 2026).
Files: `content/en/pieces/liszt-piano-sonata.md`, `content/tr/pieces/liszt-piano-sonata.md`.
Shared-file additions (paintings.yaml, glossaries, composers.yaml entry for `liszt`): `content/research/liszt-piano-sonata.shared.md`.

**How the checks were done** (same method as `rachmaninoff-piano-concerto-2.md`)
- **Spotify:** album ids taken from the label's own product page (DG / Decca catalogue pages link their Spotify album), then confirmed by downloading the public embed page `https://open.spotify.com/embed/album/<id>` and reading its track list (title, performer credits, duration in ms). **VERIFIED** = album title, performers and every track of this work seen in that data. Durations are rounded to the nearest second.
- **Label data:** the DG / Decca catalogue pages embed per-track recording metadata (recording date, location, first release year); quoted as "label metadata".
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits and sleeve / booklet notes). Human-readable URLs below.
- **Status key:** OK = confirmed from a primary source. SECONDARY = only from a retailer, review, programme note or search snippet. UNVERIFIED = not confirmed.
- No web search engine was used for the last part of this batch (shared search budget ran out); everything below was read directly from the URLs given.

---

## 1. Reference recording: Krystian Zimerman (DG, 1990)

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist | Krystian Zimerman | Spotify credits "Franz Liszt, Krystian Zimerman"; Discogs "Piano – Krystian Zimerman" | https://open.spotify.com/embed/album/6XN6HweLAIZaY2bMKjWdHx ; https://www.discogs.com/release/23803268 | OK |
| Label / catalogue | Deutsche Grammophon, 431 780-2 | DG 431 780-2 (UPC 00028943178020), DG release date 1 Aug 1991. The Spotify album is this CD (same programme: Sonata, *Nuages gris*, *La notte*, *La lugubre gondola II*, *Funérailles*) | https://www.deutschegrammophon.com/de/katalog/produkte/liszt-klaviersonate-h-moll-zimerman-5225 ; Discogs 23803268, 2974574 | OK |
| Recorded | February–March 1990 | Booklet (Discogs notes): "Recordings: Kopenhagen, Tivoli, Konzertsaal, 2 & 3/1990 (Sonate), 3/1991". DG label metadata gives 3 March 1990 for the sonata (one session date). NYPL catalogue: "Recorded 1990 February-March and 1991 March Konzertsaal, Tivoli, Kopenhagen" | Discogs 23803268 ; DG page above | OK |
| Venue | Tivoli Concert Hall, Copenhagen | "Kopenhagen, Tivoli, Konzertsaal" (Tivoli Koncertsal) | same | OK |
| Release year / year | 1991 / 1990 | ℗ 1991 Deutsche Grammophon; recorded 1990 | same | OK |
| Producer / engineer (not in yaml) | – | Helmut Burk (recording producer and balance engineer); executive producer Hanno Rinke | Discogs 23803268 | OK |
| Spotify | https://open.spotify.com/album/6XN6HweLAIZaY2bMKjWdHx | "Liszt: Piano Sonata in B minor; Nuages gris; La notte; La lugubre gondola II; Funérailles", 5 tracks; track 1 = Piano Sonata in B minor, S.178, one track | embed page; DG page links this id | VERIFIED |

Reputation: Gramophone (1991) review and Europadisc reissue note ("generally regarded as benchmark recordings"), both seen only as search snippets: https://gramophone.co.uk/review/liszt-piano-works-25 , https://europadisc.co.uk/classical/97677/Krystian_Zimerman_Liszt_Recordings.htm (SECONDARY).

### Duration (source: Spotify embed, album 6XN6HweLAIZaY2bMKjWdHx)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | Piano Sonata in B minor, S. 178 (one track) | 1829000 | 30:29 |
| | Total | 1829000 | 30:29 → `duration_min: 30` |

The CD (Discogs 23803268) lists the sonata as 30:37, 8 s longer than Spotify, and gives **index points inside track 1: 1.1 at 0'00, 1.2 at 12'18, 1.3 at 19'39**. Comparing with Brendel's three-track split (11:50 / 6:53 / 10:29, "Lento assai – Allegro energico" / "Andante sostenuto" / "Allegro energico – Andante sostenuto – Lento assai") these are the start of the Andante sostenuto and the start of the fugato. The guide puts them at ≈ 12:15 and ≈ 19:35 because the Spotify file is 8 s shorter (where the 8 s are missing is unknown: probably silence at the start or end).

`movement_count: 1`: the reference album has the sonata as a single track, as the batch brief allows.

---

## 2. Also recommended: Alfred Brendel (Philips, 1991)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist | Alfred Brendel | Spotify credits | https://open.spotify.com/embed/album/7jeek9pK4cjPgp6W5Psg7x | OK |
| Label / catalogue | Philips; 434 078-2 (CD); 475 8247 (CD reissue) | Original CD Philips 434 078-2 (℗ 1992); reissue 475 8247 (2007, UPC 00028947582472, the Spotify edition per the Decca page) | https://www.discogs.com/release/13155992 ; https://www.discogs.com/release/8563797 ; https://www.deccaclassics.com/en/catalogue/products/liszt-piano-sonata-in-b-minor-brendel-3687 | OK |
| Recorded | October 1991 | Reissue notes: "Recorded October 1991"; label metadata 10/1991 | Discogs 8563797 ; Decca page | OK |
| Venue | Historischer Reitstadel, Neumarkt | Discogs company credit "Recorded At – Historischer Reitstadel, Neumarkt" | Discogs 8563797 | OK |
| Release year | 1992 | ℗ 1992; label metadata first release 1992 | same | OK |
| Spotify | https://open.spotify.com/album/7jeek9pK4cjPgp6W5Psg7x | "Liszt: Sonata in B minor etc"; track 1 *Funérailles* (11:12); sonata split into tracks 2–4: 11:50 / 6:53 / 10:29 | embed page | VERIFIED (note: three tracks, so it could not be the reference; fine as a recommendation) |

---

## 3. Painting: Eugène Delacroix, *Christ Asleep during the Tempest*, ca. 1853

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Eugène Delacroix (French, Charenton-Saint-Maurice 1798–1863 Paris) | https://www.metmuseum.org/art/collection/search/436176 (Met API object 436176) | OK |
| Title / date | *Christ Asleep during the Tempest*, ca. 1853 | same | OK |
| Medium / size | Oil on canvas, 50.8 × 61 cm | same | OK |
| Collection | The Metropolitan Museum of Art, New York, H. O. Havemeyer Collection, Bequest of Mrs. H. O. Havemeyer, 1929 (29.100.131) | same | OK |
| Rights | Artist died 1863; Met Open Access, `isPublicDomain: true`, CC0 | Met API; Commons file page ({{cc-zero}}) | OK |
| Image | Met primary image DP-14343-001 (3.9 MB); Commons copy File:Christ_Asleep_during_the_Tempest_MET_DP-14343-001.jpg, 4000 × 3296 | https://commons.wikimedia.org/wiki/File:Christ_Asleep_during_the_Tempest_MET_DP-14343-001.jpg | OK. The Met photo shows a thin dark border around the canvas: crop it in the master, as was done for the Kuindzhi |
| Pairing | Same year as the sonata (manuscript dated 2 Feb 1853). No link between this painting and the sonata is claimed: it is chosen for the mood (storm around a still centre) | – | – |

Not in `paintings.yaml` (Delacroix not used yet). Alternatives in the .shared.md.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Completed in Weimar; manuscript dated 2 February 1853; earlier version existed by 1849 (not used) | https://en.wikipedia.org/wiki/Piano_Sonata_in_B_minor_(Liszt) | OK |
| Liszt court Kapellmeister / music director in Weimar from 1848 | https://en.wikipedia.org/wiki/Franz_Liszt | OK |
| Toured Europe as the most famous pianist of the 1830s–40s ("Lisztomania", Heine 1844) | same | OK |
| Dedicated to Schumann in return for the *Fantasie* in C, Op. 17; the copy arrived at Schumann's house in May 1854, after he had entered the Endenich asylum | Wikipedia (sonata) | OK |
| Published 1854, Breitkopf & Härtel (not in guide) | same | OK |
| One movement, about 30 minutes, combining allegro, slow movement, scherzo and finale within an overall sonata form; recapitulation opens with a fugue in B-flat minor that "can also function as a scherzo" | same (citing Rosen) | OK |
| Themes: descending scale *Lento assai*; *Allegro energico* in octaves (alla breve); third theme *Hammerschlag* ("hammer-blow"), single-note repetitions; *Grandioso* in D major; hammer-blow transformed into *cantando espressivo*; *Andante sostenuto* in F-sharp major as centrepiece | same | OK |
| Liszt first wrote a loud ending and crossed it out (Walker: the quiet ending was an afterthought; the manuscript has a crossed-out loud ending) | same | OK |
| First public performance 27 January 1857, Berlin, Hans von Bülow | same | OK |
| Hanslick: "anyone who has heard it and finds it beautiful is beyond help" (paraphrased in guide) | same | OK |
| Brahms "reputedly fell asleep" when Liszt played it in 1853: told as "the story goes" | same | OK (legend, flagged as such) |
| Became established as a pinnacle of the repertoire by the early 20th century | same | OK |
| "Thematic transformation" as Liszt's method | https://en.wikipedia.org/wiki/Franz_Liszt ("developed thematic transformation") | OK |
| Metre "changing (mostly 2/2)": the *Allegro energico* is alla breve (Wikipedia); the other sections' metres are from memory of the score (the *Andante sostenuto* in 3/2) | Wikipedia (sonata) | PARTLY VERIFIED |
| Structural stops (Grandioso, cantando, recitativo, fugato, Stretta–Presto–Prestissimo, final Andante sostenuto and Lento assai) | standard analyses; positions inferred from the bar structure (760 bars) and the CD index points | SECONDARY for positions |

Not used, on purpose: the claim that the sonata depicts Faust (popular but unsupported by Liszt); the Rubinstein criticism (flagged "citation needed" on Wikipedia).

---

## 5. Re-time needed (every stop is ≈; nobody has listened against the Zimerman track)

Reference: Zimerman / DG 1990, Spotify `6XN6HweLAIZaY2bMKjWdHx` (track 1, 30:29). Two anchors are firm: the CD index points at 12:18 and 19:39 (minus up to 8 s on Spotify).

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I (single track) | 30:29 | 0:00, 0:35, 0:45, 1:00–3:00, 3:00, 4:30, 6:30–12:00, 12:15, 13:15, 15:30–16:30, 19:00, 19:35, 21:15, 23:00, 23:45, 25:30–27:00, 27:00, Last three minutes | Grandioso (≈ 3:00) and cantando (≈ 4:30) in the first section; everything after the fugato (≈ 21:15 to ≈ 27:00) was placed by bar proportion only. Check where the Spotify file loses the 8 s against the CD |
