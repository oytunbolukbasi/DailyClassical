# Verification: Tchaikovsky – Piano Concerto No. 2 in G major, Op. 44

Piece id `tchaikovsky-piano-concerto-2`. Checked on 2026-11-28 (batch 2026-11c, group A).
Files: `content/drafts/en/tchaikovsky-piano-concerto-2.md`, `content/drafts/tr/tchaikovsky-piano-concerto-2.md`.
Shared-file additions (paintings.yaml, one new glossary term "Piano trio", re-time rows; composer `tchaikovsky` exists): `content/research/tchaikovsky-piano-concerto-2.shared.md`.

**How the checks were done.** Spotify embed `__NEXT_DATA__` read with Python from a Turkish network; album page meta and ℗/© lines; Spotify search in the built-in browser; Discogs API; the Naxos inlay/booklet PDF (hosted by eClassical); MusicWeb International review; Tchaikovsky Research (MediaWiki API); Wikipedia EN/RU; programme notes (Boston Symphony Orchestra, Harlow Robinson; LA Phil / Hollywood Bowl, Orrin Howard); Commons API, Artizon Museum. Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)` where an API asked for one.

---

## 1. Reference recording: Nebolsin / Stern / New Zealand Symphony Orchestra (Naxos, 2014)

Product owner's fixed choice; tracks 1–3 (tracks 4–5 are the Concert Fantasia, Op. 56).

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist / conductor / orchestra | Eldar Nebolsin / Michael Stern / New Zealand Symphony Orchestra | Spotify credits; Discogs 26318360; inlay | https://open.spotify.com/embed/album/5jlLc4H4Bd67Z5EpCd3HRP ; https://api.discogs.com/releases/26318360 | VERIFIED |
| Violin and cello soloists | Vesa-Matti Leppänen (violin), Andrew Joyce (cello) | Credited by Spotify on track 2 only ("Vesa-Matti Leppänen, Andrew Joyce"); not in the Naxos inlay (MusicWeb: "the excellent violin and cello soloists in the concerto are not acknowledged in the details"). Leppänen is the NZSO's concertmaster (NZSO profile); Joyce is an NZSO cellist (RNZ listings; his rank in the section not confirmed, so the guide says "the cellist") | embed; https://www.nzso.co.nz/about-us/players/vesa-matti-leppaenen ; https://musicweb-international.com/classrev/2017/Jan/Tchaikovsky_PC2_8573462.htm | OK (roles from Spotify) |
| Label / catalogue | Naxos 8.573462 | Inlay; Discogs; album page "© 2016 Naxos / ℗ 2016 Naxos" | https://eclassical.textalk.se/shop/17115/art71/4989771-dfbf7c-8.573462r.pdf | VERIFIED |
| Recorded / venue | 10–12 November 2014; Michael Fowler Centre, Wellington | Inlay: "Recorded at the Michael Fowler Centre, Wellington, New Zealand, from 10th to 12th November, 2014". Producer and editor Wayne Laird, engineer Paul McGlashan, notes Keith Anderson | inlay | VERIFIED |
| Release | 2016 | Album page `music:release_date` 2016-09-09 | https://open.spotify.com/album/5jlLc4H4Bd67Z5EpCd3HRP | VERIFIED |
| Version | Tchaikovsky's original, uncut | Inlay: "played here in the composer's original version"; MusicWeb header "(Original Version)"; another MusicWeb review: "the original version … with all the disfiguring cuts fully restored". Track lengths confirm: Siloti's edition shortens the Andante by about eight minutes (LA Phil note), and here it runs 14:37 | inlay; MusicWeb (Jan 2017 and Apr 2017 reviews) | VERIFIED. Not established: whether Nebolsin takes the three small cuts Tchaikovsky himself made in 1888 (I bars 319–342; II bars 247–287 and 310–326/327, per Tchaikovsky Research). The guide says only "original version, without Siloti's cuts" |

### Durations and playability (Spotify embed, read from Turkey, 2026-11-28)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro brillante | 1240040 | 20:40 | true |
| 2 | II. Andante non troppo | 877346 | 14:37 | true |
| 3 | III. Allegro con fuoco | 449186 | 7:29 | true |
| | Total (1–3) | 2566572 | 42:47 → `duration_min: 43` | |

(Inlay timings 20:38 / 14:41 / 7:27; the table uses the Spotify tracks.)

---

## 2. Also recommended: Pletnev / Fedoseyev / Philharmonia Orchestra (Virgin Classics, 1990)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Mikhail Pletnev; Alexei Bruni (violin), Alexander Rudin (cello); Vladimir Fedoseyev; Philharmonia Orchestra | Spotify credits (pianist, conductor, orchestra); Discogs 3706978 credits "Alexander Rudin – Cello 2-2", "Alexei Bruni – Violin 2-2" (the Andante of Concerto No. 2 in the 1998 set) | https://open.spotify.com/embed/album/7eK8b9MFIEUfzRa5Tao91g ; https://api.discogs.com/releases/3706978 | VERIFIED |
| Catalogue / recorded / venue | Virgin Classics VC 7 91202-2; March 1990; Walthamstow Assembly Hall | Discogs 14177349 ("Piano Concertos Nos. 2 & 3", VC 7 91202-2, 1991): "Recorded march 1990"; Discogs 3706978: "Concertos recorded at Walthamstow Assembly Hall, London"; producer Andrew Keener, engineer Mike Hatch | https://api.discogs.com/releases/14177349 | VERIFIED |
| Spotify | 1998 set (℗ 1998 Parlophone, a Warner Classics/Erato release); Concerto No. 2 = tracks 6–8: 19:49 / 14:26 / 7:15, all `isPlayable: true` (1189533 / 866906 / 435466 ms). Lengths match the uncut version | embed | | VERIFIED |

Peter Donohoe's EMI recording with Barshai (the classic uncut version) and Stephen Hough's Hyperion set were not found by Spotify search in this check. Garrick Ohlsson / Sydney SO / Ashkenazy (album `3tRMLdcKdxa0RKIzpJl3j5`, 2013, "original version") is playable but splits movements I and II into several tracks, so it was used only to locate section breaks.

---

## 3. Painting: Gustave Caillebotte, *Young Man Playing the Piano*, 1876

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Gustave Caillebotte (1848–1894); not yet used in `content/paintings.yaml` | Commons Creator | OK |
| Title / date | *Jeune homme au piano* / *Young Man Playing the Piano*, 1876 (Artizon; Christie's; one site says 1877). TR "Piyano Çalan Genç Adam" | https://artizon.museum/en/collection/art/24964 | OK |
| Collection | Artizon Museum (formerly Bridgestone Museum of Art), Ishibashi Foundation, Tokyo; oil on canvas, 81.3 × 116.8 cm; Berhaut no. 36 | Artizon; Commons | OK |
| Subject | The painter's younger brother Martial Caillebotte (1853–1910), pianist and composer, at the family home on rue de Miromesnil, Paris | Artizon | OK |
| Rights | Artist d. 1894: PD by age. Commons {{PD-Art-two-auto\|1894}} | https://commons.wikimedia.org/wiki/File:G._Caillebotte_-_Jeune_homme_au_piano.jpg | VERIFIED |
| Image | 2162 × 1446, a scan from print (slightly saturated, soft; checked on a 1280 px thumbnail; no frame). Above the catalogue's smallest image (1920 px) | Commons API | OK (quality modest) |
| Pairing | Real links: Paris in the late 1870s, where Tchaikovsky wrote the finale (November 1879, Tchaikovsky Research); a grand piano played alone, as so often in this concerto; the sitter a pianist-composer | | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed October–December 1879 at Kamenka and Paris; began the finale in Paris on 17/29 November 1879; orchestrated at Kamenka, finished 28 April/10 May 1880 | Tchaikovsky Research https://en.tchaikovsky-research.net/pages/Piano_Concerto_No._2 | VERIFIED |
| Kamenka = his sister's estate, in Ukraine | Wikipedia ("while staying with his sister in Kamenka"); BSO note ("Kamenka, Ukraine") https://www.bso.org/works/piano-concerto-no-2-3 | OK |
| No trombones or tuba | Wikipedia; Tchaikovsky Research instrumentation | VERIFIED |
| Dedicated to Nikolai Rubinstein, who had harshly criticised the First Concerto and then championed it; died March 1881 without playing it | Wikipedia; Tchaikovsky Research (dedication) | VERIFIED |
| Premiere New York, 12 November 1881 (31 October O.S.), Madeline Schiller, Theodore Thomas, Philharmonic Society | Tchaikovsky Research; Wikipedia | VERIFIED |
| First Russian performance Moscow, May 1882 (21 May/2 June per Tchaikovsky Research; Russian Wikipedia gives 18/30 May), Sergei Taneyev, Anton Rubinstein | Tchaikovsky Research; ru.wikipedia | OK (the guide says only "the first Russian performance") |
| Taneyev, his former pupil, criticised the length of the first two movements and the prominence of violin and cello | BSO note (Harlow Robinson) | OK |
| Tchaikovsky disappointed by its lack of success; "this unfortunate second concerto, which, however, I like far more than the first" (letter to Siloti) | Tchaikovsky Research (letters 4989/4994 of July–August 1891 cited) | VERIFIED ("late in life") |
| Siloti's proposals rejected in large part; Siloti's edition published 1897 by Jurgenson after the composer's death with cuts and transpositions he had not approved; standard for many years; heavy cuts in the Andante, removing most of the violin and cello solos | Tchaikovsky Research; Wikipedia; Hollywood Bowl / LA Phil note https://www.hollywoodbowl.com/musicdb/pieces/2743/piano-concerto-no-2 ("Siloti's cuts … fell mainly on the slow movement"); BSO | VERIFIED |
| Original version published 1955 in the Complete Collected Works (ed. Goldenweiser) | Tchaikovsky Research | VERIFIED |
| Tchaikovsky told Hermann Laroche he could not tolerate the sound of piano and orchestra together; segregation of piano and orchestra, especially in I | Wikipedia | OK |
| I: martial main theme in the orchestra, taken up at once by the piano; moves stepwise from G; second theme in E-flat major introduced by woodwinds over string tremolo (LA Phil: "clarinet and horn"); episodic, with short cadenzas; the main cadenza, roughly six minutes, is the second part of the development and the climax; then both themes restated | BSO; LA Phil | OK |
| Tchaikovsky's own letter: "The repeat of the main section after the recapitulation is absolutely essential in sonata form" | Tchaikovsky Research | OK (background) |
| II: D major; violin and cello solos make it almost a triple concerto; a heartfelt melody, chamber-style variations, a piano cadenza in the middle | BSO; Wikipedia ("in effect a concerto for piano trio and orchestra briefly") | OK |
| II: the solo violin has the main melody first, then the cello, then the piano enters | Tchaikovsky's reference to "the big violin solo in the second movement" (Siloti letter, Tchaikovsky Research); order of entries from knowledge of the score | UNVERIFIED (order and timing) |
| II: a *stringendo* (speeding up) at about half-way | Track title of the Ohlsson/Ashkenazy album ("II. Stringendo", from 8:14 of 16:20) | SECONDARY |
| III: dotted 2/4 rhythm, "Schumannesque"; three carnival-like themes in a modified rondo with little development; piano and orchestra more integrated; the only movement without a cadenza | BSO | OK |
| III: a "quasi-exotic tune"; "treble sparkle of the piano"; coda recalls the First Concerto, "blazing piano/orchestra flourishes" | LA Phil; Wikipedia ("a notable link between the coda of this concerto and the coda of his First") | OK |
| Balanchine's *Ballet Imperial* (1941) used Siloti's version | BSO | OK |
| Keys: I G major, II D major, III G major; bar counts 668 / 332 / 560 | Tchaikovsky Research | VERIFIED |
| Metres: I 4/4, II 3/4, III 2/4 | III 2/4 from BSO ("dotted 2/4 rhythm"). I and II inferred: 668 bars in 20:40 (≈ 1.86 s a bar) fits 4/4 at about 130 crotchets a minute; 332 bars in 14:37 (≈ 2.64 s a bar) fits 3/4 at about 68. Not checked in a score | III OK; I, II UNVERIFIED |
| Hook quotation "far more than the first" | Tchaikovsky Research | VERIFIED |

---

## 5. Re-time (every stop is ≈)

Reference: Nebolsin / Stern / NZSO, Spotify `5jlLc4H4Bd67Z5EpCd3HRP`, tracks 1–3 (original version). Method: order of events from the BSO and LA Phil notes; bar counts (668 / 332 / 560) × the track's average tempo; and section breaks borrowed proportionally from Garrick Ohlsson's uncut recording (Sydney SO / Ashkenazy), whose album splits I into "Allegro brillante" 9:34 + "Tempo giusto" 5:12 + "L'istesso tempo" 8:07 (breaks at 42 % and 65 %, read as the start and end of the great cadenza, whose 5:12 fits the BSO's "roughly six minutes") and II into "Andante non troppo" 8:14 + "Stringendo" 8:06 (break at 50 %). Scaled to Nebolsin: 0.42 × 20:40 ≈ 8:40; 0.65 × 20:40 ≈ 13:25; 0.50 × 14:37 ≈ 7:20. Cadenza lengths differ between pianists, so these breaks are the least certain stops.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro brillante | 20:40 | 0:00, 0:30, 1:30, 3:15, 4:00, 6:00, 6:30–8:40, 8:40–13:30, 13:30, 16:30, Last minute | Start and end of the great cadenza (± 1 min); second theme (≈ 3:15) and its return (≈ 16:30) |
| II Andante non troppo | 14:37 | 0:00, 2:00, 3:30, 5:00–7:00, 7:15, 8:30, 10:00, Last 2 minutes | Cello and piano entries (≈ 2:00, ≈ 3:30) and the piano cadenza (≈ 8:30), ± 1 min |
| III Allegro con fuoco | 7:29 | 0:00, 0:45, 1:30, 2:15, 3:00–5:00, 5:30, 6:30, Last 20 seconds | All inner stops (± 30 s): no bar positions for the three themes |
