# Verification: Mozart – Oboe Concerto in C major, K. 314

Piece id `mozart-oboe-concerto`. Checked on 2026-11-28 (batch 2026-11c, group A).
Files: `content/drafts/en/mozart-oboe-concerto.md`, `content/drafts/tr/mozart-oboe-concerto.md`.
Shared-file additions (paintings.yaml, one new glossary term "Aria", re-time rows; composer `mozart` exists): `content/research/mozart-oboe-concerto.shared.md`.

**How the checks were done.** Spotify embed `__NEXT_DATA__` read with Python from a Turkish network; album page meta and ℗/© lines; Spotify search in the built-in browser for the alternative; Discogs API; the LSO Live booklet for LSO0855 (PDF hosted by the retailer eClassical); Henle preface (HN 695); Wikipedia EN/DE via the MediaWiki API; Commons API, Wikidata and the French Joconde database (POP). Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)` where an API asked for one.

---

## 1. Reference recording: Stankiewicz / Martín / London Symphony Orchestra (LSO Live, live 2019)

Product owner's fixed choice. The Spotify album is a 6-track digital EP, "Mozart: Oboe Concerto", that holds the concerto twice. The guide uses tracks 1–3.

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Olivier Stankiewicz / Jaime Martín / London Symphony Orchestra | Spotify credits "Olivier Stankiewicz, Jaime Martin, London Symphony Orchestra" on all six tracks; booklet: "Jaime Martín conductor", "Olivier Stankiewicz oboe" | https://open.spotify.com/embed/album/5LpfPM4ycGs3YQDnHz9MWe ; https://eclassical.textalk.se/shop/17115/art56/5076556-16935e-0822231185567.pdf | VERIFIED |
| Label | LSO Live | Album page: "© 2021 London Symphony Orchestra Ltd / ℗ 2021 London Symphony Orchestra Ltd" (LSO Live is the orchestra's label) | https://open.spotify.com/album/5LpfPM4ycGs3YQDnHz9MWe | OK |
| Release | EP 17 September 2021; release_year 2021 | Album page meta `music:release_date` 2021-09-17, "EP · 2021" | same | VERIFIED |
| Catalogue | "LSO0855 (album Mozart: Wind Concertos)" | The EP's own catalogue number was not found. The same performance is on the 2-disc album *Mozart: Wind Concertos*, LSO Live LSO0855 (LSO product page `lso0855-mozart`; HRA release date 19 November 2021); the album's booklet track times for K. 314 (7'20 / 6'45 / 6'15) match EP tracks 1–3 (7:19 / 6:44 / 6:14) | https://lsolive.lso.co.uk/products/lso0855-mozart (429 to a scripted read; title from search) ; booklet PDF | OK (album number, not the EP's) |
| Recorded / venue | 12–13 October 2019 (live); Jerwood Hall, LSO St Luke's, London | Booklet: "Recorded live in DSD 256fs on 12–13 October 2019 (Horn Concerto No 2, Oboe Concerto, Clarinet Concerto & Sinfonia Concertante) … in the Jerwood Hall, LSO St Luke's." Producer Andrew Cornall; Classic Sound Ltd (Jonathan Stokes, Neil Hutchinson) | booklet PDF | VERIFIED |
| Stankiewicz: LSO principal oboe | "the London Symphony Orchestra's principal oboe" | Booklet biography: "In 2015, Olivier Stankiewicz was appointed Principal Oboe of the London Symphony Orchestra" | booklet PDF | VERIFIED |
| Cadenzas | First movement a showpiece, the finale's much plainer | BBC Music Magazine (Malcolm Hayes, 22 Dec 2021): two sharply contrasted cadenzas, the first-movement one "super-virtuoso", the finale's "much simpler" | https://www.classical-music.com/reviews/concerto/mozart-wind-concertos | OK |
| Cadenza authors (tracks 1–3) | not named in the guide | Not credited on Spotify or in the booklet text read. James Joslin's works list has a 2' cadenza for K. 314 "written for Olivier Stankiewicz and the London Symphony Orchestra conducted by Jaime Martin, premiered in LSO at St. Luke's, October 2019", i.e. these concerts; it does not say which movement or whether it is on the record. The guide therefore names no author | https://www.jamesjoslinmusic.com/worklist/cadenza | UNVERIFIED (left out) |
| Tracks 4–6 | "a different cadenza in the finale, by the composer Tonia Ko" | Spotify titles: tracks 4–6 "Oboe Concerto in C Major, K. 314 (Final Cadenza by Tonia Ko)", track 6 "III. Rondo. Allegretto (Cadenza by Tonia Ko)", Tonia Ko credited as artist on track 6. Track 5 has the same length as track 2 to the millisecond and track 4 is 1 s longer than track 1, so only the finale differs. No other source on Ko's cadenza was found | embed | OK (from Spotify credits only) |

### Durations and playability (Spotify embed, read from Turkey, 2026-11-28)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro aperto | 439640 | 7:19 | true |
| 2 | II. Adagio non troppo | 404973 | 6:44 | true |
| 3 | III. Rondo. Allegretto | 374600 | 6:14 | true |
| | Total (1–3) | 1219213 | 20:19 → `duration_min: 20` | |
| 4 | I. Allegro aperto (Final Cadenza by Tonia Ko) | 440600 | 7:20 | true |
| 5 | II. Adagio non troppo (Final Cadenza by Tonia Ko) | 404973 | 6:44 | true |
| 6 | III. Rondo. Allegretto (Cadenza by Tonia Ko) | 383306 | 6:23 | true |

---

## 2. Also recommended: Macías Navarro / Abbado / Orchestra Mozart (Claves, 2013)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Lucas Macías Navarro / Claudio Abbado / Orchestra Mozart | Spotify credits on tracks 1–3 ("Lucas Macias Navarro, Claudio Abbado, Orchestra Mozart"); Discogs | https://open.spotify.com/embed/album/5Esd84UzuA8ZdKPG2lixB8 ; https://api.discogs.com/releases/14354103 | VERIFIED |
| Label / catalogue | Claves 50-1302 | Discogs 14354103: Claves 50-1302, released 2014-10-01; album page "© 2014 Claves Records", release date 2014-10-13 | same | VERIFIED |
| Recorded | 20–25 March 2013 | Discogs notes: "Recorded March 20-25, 2013" | same | OK |
| Venue | null | Not given on Discogs; not found elsewhere | | UNKNOWN |
| Tracks 1–3 | 7:12 / 7:08 / 5:35, all `isPlayable: true` (432920 / 428480 / 335586 ms) | embed | | VERIFIED |

Found by Spotify search ("Mozart oboe concerto K. 314"); one of Abbado's last recordings with his Orchestra Mozart. A widely praised alternative; the Holliger/de Waart Philips LP (6500 174, 1971) was not found as an album on Spotify in this search.

---

## 3. Painting: Anne Vallayer-Coster, *Attributes of Music* (*Instruments de musique*), 1770

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Anne Vallayer-Coster (21 December 1744 – 28 February 1818), French; not yet used in `content/paintings.yaml` | https://en.wikipedia.org/wiki/Anne_Vallayer-Coster | OK |
| Title / date | *Instruments de musique*, signed and dated "ME VALLAYER 1770"; English title on Wikidata "Attributes of Music"; TR "Müziğin Simgeleri" | https://pop.culture.gouv.fr/notice/joconde/000PE002804 ; https://www.wikidata.org/wiki/Q19005808 | OK |
| Collection | Musée du Louvre, Département des Peintures, INV 8260 (also MR 2541); oil on canvas, 88 × 116 cm | POP Joconde; Wikidata | OK |
| History | "Morceau de réception" 1770; formerly the Académie royale de peinture et de sculpture; seized 1793; Salon of 1771. Wikipedia: she submitted *The Attributes of Painting* and *The Attributes of Music* as reception pieces in 1770 and was elected unanimously | POP; Wikipedia | OK |
| What is shown | Joconde lists: mandolin, violin, "instrument à biseau" (a duct flute), bagpipe (musette), horn ("trompe"), score, candlestick | POP | OK. The pairing note says "a horn, a violin and pipes", not "flute" or "oboe" |
| Age | Wikipedia says "at the age of twenty-six"; with a birth date of 21 December 1744 she was 25 at her reception in July 1770, so the guide says only "a young artist" | Wikipedia | Note |
| Rights | Artist d. 1818: PD by age. Commons {{PD-Art\|PD-old-auto-expired\|deathyear=1818}}; gallery photo by User:Shonagon, 2021-09-16, a faithful 2D reproduction | https://commons.wikimedia.org/wiki/File:Instruments_de_musique_-_Anne_Vallayer-Coster_-_Mus%C3%A9e_du_Louvre_Peintures_INV_8260.jpg | VERIFIED |
| Image | 2853 × 2119, cropped to the canvas (checked visually on a 1280 px thumbnail: no frame, even light) | Commons API | OK |
| Pairing | Real links: instruments of the concerto's orchestra (horn, strings) and woodwinds of the period; a young artist proving herself in Paris, the city Mozart set out for in 1777–78. Year 1770, seven years before the concerto | | OK |

Why not the alternatives: Gainsborough's *Johann Christian Fischer* (an oboist, the closest subject) exists openly only at 1055 × 1650, below the catalogue's smallest image (1920 px), and Gainsborough is already used. The anonymous *Portrait of an Oboist* in Berlin is earlier (1700–1750) and anonymous. Kobell's Mannheim landscapes on Commons are only 768 px wide.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 1777 in Salzburg for Giuseppe Ferlendis, who had entered the Salzburg court orchestra; finished by 22 September 1777 at the latest, when Mozart left for Mannheim and Paris and took it with him | Henle preface (HN 695): https://www.henle.de/media/dc/31/1d/1690886062/0695-1690886062-sync.pdf ; booklet; Wikipedia ("spring or summer of 1777") https://en.wikipedia.org/wiki/Oboe_Concerto_(Mozart) | OK |
| Ferlendis from Bergamo | Wikipedia (Oboe Concerto; Giuseppe Ferlendis). A search summary notes that one source gives Brescia | Wikipedia | SECONDARY (Bergamo is the usual statement) |
| Mozart 21 | born 27 January 1756 | | OK |
| Scoring: two oboes, two horns, strings | Wikipedia EN; DE ("2 Oboen, 2 Hörner (in C und F) und Streichorchester") | OK |
| Mozart gave the concerto to Ramm in Mannheim (letter 3 December 1777); letter of 14 February 1778: "for the fifth time … making a great sensation here. It is now Ramm's cheval de bataille" | Henle preface (English translation quoted); booklet | VERIFIED |
| 1778: flute version in D major for the Dutch amateur flautist Ferdinand Dejean's commission, probably made under deadline pressure ("seems to have") | Henle ("it is probably correct to second the long-standing assumption that the D-major Flute Concerto in fact, due to deadline pressure, came into existence as an arrangement of the Oboe Concerto"); Wikipedia | OK (cautious wording kept) |
| Mozart's score lost (asked for it again in February–March 1783; "since then it has vanished without a trace") | Henle | OK |
| Known only as a flute concerto for more than a century; Paumgartner found an old set of parts in the Mozarteum archive in 1920; an eight-bar autograph sketch in C major found in 1971 confirmed the priority of the oboe | Henle; Wikipedia EN; DE (Paumgartner published his find only in 1950) | OK |
| Paumgartner "the conductor" | Bernhard Paumgartner (1887–1971), conductor and musicologist, director of the Mozarteum | https://en.wikipedia.org/wiki/Bernhard_Paumgartner | OK |
| *Aperto* "open" or "frank", a marking Mozart liked at this time | Booklet (Lindsay Kemp): "Mozart's unusual movement heading of 'aperto', literally 'frank' or 'open', is one he was fond of at this time" | OK |
| The first two movements "have the flavour of arias"; the slow movement's main melody has a "wide upward leap"; finale "perky and buoyant" | Booklet (Kemp) | OK |
| Slow movement like an opera seria aria | DE Wikipedia ("im Tone einer hochwertigen Arie der Opera-Seria-Manier") | OK |
| Finale theme reused in *Die Entführung aus dem Serail* (1782), Blonde's aria "Welche Wonne, welche Lust" | Booklet ("would later resurface in modified form in the opera Die Entführung aus dem Serail"); DE Wikipedia names the aria; Listeners' Club note https://thelistenersclub.com/2020/03/23/mozarts-oboe-concerto-francois-leleux-and-the-frankfurt-radio-symphony/ | OK |
| Movement keys and metres: I C major 4/4; II F major 3/4; III C major 2/4 | DE Wikipedia ("Allegro aperto, C-Dur, 4/4-Takt; Adagio non troppo, F-Dur, 3/4-Takt; Rondo: Allegretto, C-Dur, 2/4-Takt"). The same article later calls the rondo *alla breve*; 2/4 kept | SECONDARY |
| Double exposition; the oboe's first entry a long held high note; second theme in G major; short development through minor keys; cadenza points in all three movements; the rondo theme first in the orchestra | Knowledge of the score; not checked against a bar-numbered score (the IMSLP download was not used) | UNVERIFIED (details) |
| Finale's central episode with imitation between instruments | DE Wikipedia: the central part works a theme on an interjection motif in three-part counterpoint | OK (guide wording kept general) |

Avoided: Wikipedia's claim that Dejean refused to pay because the concerto was an arrangement (Henle presents the commission history as contradictory); the Ramm/Esterházy details of 1783; the 2019 Augsburg lead on the lost autograph (Wosnitzka).

---

## 5. Re-time (every stop is ≈)

Reference: Stankiewicz / Martín / LSO, Spotify `5LpfPM4ycGs3YQDnHz9MWe`, tracks 1–3. No bar-numbered score was read, so the stops are placed from the order of events (Henle, booklet, Wikipedia) and the usual proportions of the movements, scaled to these track lengths. The first movement's track (7:19) is long for this concerto; the review's "super-virtuoso" cadenza suggests a cadenza of about 1–1½ minutes, so the music before it was placed at an average of about 1.8 s per 4/4 bar (≈ 130 crotchets a minute), with the orchestral exposition (about 31 bars) ending near 0:55.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro aperto | 7:19 | 0:00, 0:55, 1:10, 1:40, 2:30, 2:50, 3:25, 5:40–7:00, Last 20 seconds | Start and length of the cadenza (≈ 5:40, ± 40 s); the second theme (≈ 1:40) and the recapitulation (≈ 3:25, ± 20 s) |
| II Adagio non troppo | 6:44 | 0:00, 0:30, 1:15, 2:15, 3:30, 4:15, 5:40, Last 30 seconds | The oboe's entry (≈ 0:30; later if the introduction is longer); the return (≈ 4:15) and the cadenza (≈ 5:40) |
| III Rondo: Allegretto | 6:14 | 0:00, 0:30, 1:00, 2:00, 2:30–3:30, 3:45, 4:15, 5:20, Last 30 seconds | Central episode boundaries and the later refrains (± 30 s); the cadenza (≈ 5:20) |
