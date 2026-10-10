# Verification: Schumann – Piano Concerto in A minor, Op. 54

Piece id `schumann-piano-concerto`. Checked on 2026-10-10 (batch 2026-10, group F).
Files: `content/en/pieces/schumann-piano-concerto.md`, `content/tr/pieces/schumann-piano-concerto.md`.
Shared-file additions (paintings.yaml, two new glossary terms, new composer `schumann`): `content/research/schumann-piano-concerto.shared.md`.

**How the checks were done:** as in `schubert-piano-quintet-trout.md` (Spotify embed `__NEXT_DATA__`, album page ℗ lines, Discogs API). Status key: OK / SECONDARY / UNVERIFIED. The web-search budget ran out during the batch; unchased details are marked.

---

## 1. Reference recording: Lupu / Previn / London Symphony Orchestra (Decca, 1973)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Radu Lupu / André Previn / London Symphony Orchestra | Spotify credits "Radu Lupu, London Symphony Orchestra, André Previn"; Discogs SXL 6624 credits | https://open.spotify.com/embed/album/6nEpG19dgOSn6mB4ye4czG ; https://www.discogs.com/release/5717512 | OK |
| Label / catalogue | Decca; SXL 6624 (LP); 466 383-2 (CD, Decca Legends) | SXL 6624, UK 1973, ℗ 1973 The Decca Record Co. (master 483198, main release 5717512). CD 466 383-2 (Legends, © 2000), remastered 96/24 | https://www.discogs.com/release/5717512 ; https://www.discogs.com/release/4569266 | OK |
| Recorded | June 1973 | LP back cover: "Schumann Concerto Recorded in June 1973" (Grieg January 1973). CD 466 383-2: "Kingsway Hall, London, in January 1973 (Grieg) & June 1973 (Schumann)". A 2006 XRCD reissue (search summary) gives 26 May 1973 for the Schumann | same | OK (sleeve); the XRCD date is noted in a yaml comment |
| Venue | Kingsway Hall, London | CD 466 383-2 notes | https://www.discogs.com/release/4569266 | OK |
| Producer / engineer (not in yaml) | – | Christopher Raeburn (Schumann), Kenneth Wilkinson | https://www.discogs.com/release/5717512 | OK |
| Spotify | 6nEpG19dgOSn6mB4ye4czG | "Grieg / Schumann: Piano Concertos", Radu Lupu, album, 1973, 6 tracks; ℗ 1973 Decca Music Group, © 2000. Tracks 1–3 Schumann, 4–6 Grieg | embed + album page | VERIFIED |

### Durations (Spotify embed)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Allegro affettuoso | 877000 | 14:37 |
| 2 | II. Intermezzo. Andantino grazioso – | 323266 | 5:23 |
| 3 | III. Allegro vivace | 617400 | 10:17 |
| | Total | 1817666 | 30:18 → `duration_min: 30` |

Track 2's title ends in a dash: the attacca transition into the finale is at the end of track 2, which the guide reflects (stops ≈ 4:30 and ≈ 5:00 of II). Confirm where Decca put the track break.

## 2. Also recommended: Zimerman / Karajan / Berliner Philharmoniker (DG)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Krystian Zimerman / Herbert von Karajan / Berliner Philharmoniker | Spotify credits | OK |
| Label / year | Deutsche Grammophon; ℗ 1982 Deutsche Grammophon GmbH, Berlin | album page | OK |
| Catalogue / recorded / venue | null in the file. Not checked (search budget) | – | UNVERIFIED |
| Spotify | 1uOl9hgML9eVDhzWBypnfY: "Schumann / Grieg: Piano Concertos", 1982, 6 tracks; Schumann 15:32 / 5:25 / 10:39 | embed | VERIFIED |

Also seen: Lipatti / Karajan / Philharmonia (1948) on several Spotify reissues; not chosen (mono, many unofficial editions).

## 3. Painting: Carl Gustav Carus, *Barge Trip on the Elbe near Dresden* (*Die Kahnfahrt auf der Elbe bei Dresden*, also *Morning on the Elbe*), c. 1827

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Carl Gustav Carus (1789–1869), physician and painter in Dresden, friend of Caspar David Friedrich | Commons Creator; https://en.wikipedia.org/wiki/Carl_Gustav_Carus (standard; not re-fetched) | OK |
| Date | 1827 (Wikidata inception). The guide says "c. 1827" to stay cautious | https://www.wikidata.org/wiki/Q28839402 | OK |
| Size / medium | 29 × 22 cm, oil on canvas | Wikidata Q28839402 | OK |
| Collection | Museum Kunstpalast, Düsseldorf, inv. M 130 | Wikidata Q28839402; Commons category "Google Art Project works in Museum Kunstpalast" | OK |
| Image | File:Carl Gustav Carus - Barge Trip on the Elbe near Dresden (Morning on the Elbe) - Google Art Project.jpg, 4026 × 5467 (portrait), {{PD-Art\|PD-old-auto-expired\|deathyear=1869}}. Checked at 500 px: no frame | https://commons.wikimedia.org/wiki/File:Carl_Gustav_Carus_-_Barge_Trip_on_the_Elbe_near_Dresden_(Morning_on_the_Elbe)_-_Google_Art_Project.jpg | OK |
| Pairing | Dresden, where Schumann lived from Dec 1844 and finished the concerto in 1845; Düsseldorf, where he was music director from 1850 and where the painting now is. The painting is about 18 years older than the concerto. The woman is not Clara; the note does not say she is | Schumann article (dates) | OK |

**Why not Richter.** The first draft used Ludwig Richter's *Bridal Procession in a Spring Landscape* (1847, Dresden). Group G's `grieg-piano-concerto` (also an A minor piano concerto, often paired with this one on records) uses Gude and Tidemand's *Bridal Procession on the Hardangerfjord*; two bridal processions for the two concertos would look repetitive, so Richter moved to the alternatives. Richter details kept for the merger: Galerie Neue Meister, Dresden, Gal.-Nr. 2230, 93 × 150 cm, oil on canvas (Wikidata Q902489); best image File:Dresden, Albertinum, Ludwig Richter, der Brautzug im Frühling.JPG (4180 × 2639, CC BY 4.0, photo Dguendel), PD fallback File:Adrian Ludwig Richter 005.jpg (1927 × 1184).

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Married Clara Wieck 12 Sept 1840 after about four years of legal action against her father | https://en.wikipedia.org/wiki/Robert_Schumann | OK |
| *Phantasie* in A minor for piano and orchestra written 17–20 May 1841; Clara soloist at the Gewandhaus, Leipzig, 13 Aug 1841; could not sell it | https://en.wikipedia.org/wiki/Piano_Concerto_(Schumann) | OK. Some writers call the August 1841 performance a rehearsal; the guide says only that Clara "played it" there |
| Intermezzo and finale added in 1845, urged by Clara; family in Dresden from Dec 1844 | concerto article; Schumann article | OK |
| Premiere of the complete work 4 Dec 1845, Dresden, Clara soloist, Ferdinand Hiller (dedicatee) conducting | concerto article | OK (Hiller not named in the guide) |
| Leipzig, 1 Jan 1846, conducted by Mendelssohn | concerto article | OK |
| Florestan and Eusebius as Schumann's two alter egos | Schumann article | OK |
| Opening: strings and timpani strike, then a descending attack from the piano; dreamlike theme first on the oboe with winds, later the soloist; varied in minor, major and A-flat major | concerto article | OK |
| Second group = main theme in C major (monothematic exposition) | standard analysis; score | SECONDARY (confirm by ear: clarinet with piano) |
| *Andante espressivo* interlude in A-flat major, piano and clarinet | concerto article mentions A-flat passages; the clarinet dialogue is from the score | PARTLY VERIFIED |
| Long solo cadenza ("of monumental size and virtuosity"); coda in 2/4, a march, four tutti chords | concerto article | OK. Authorship of the cadenza not claimed in the guide |
| II: Intermezzo, F major, ABA, attacca into the finale; winds recall the first-movement theme in the transition | concerto article (attacca); the recall by clarinet and bassoon is from the score | PARTLY VERIFIED |
| III: A major; nominal 3/4 alternating with 6/4 and 3/2 (the "beat trick"); sonata-rondo; opens with a run up the strings while the piano states the theme | concerto article | OK. "Hemiola" is the standard term for the 3/2 passage |
| Coda with a new oboe tune | score / standard analyses | SECONDARY |
| Grieg heard Clara Schumann play the concerto in Leipzig in 1858; his concerto closer to Schumann's style than any other composer's | https://en.wikipedia.org/wiki/Piano_Concerto_(Grieg) | OK |
| Grieg concerto on the album recorded January 1973 with the same orchestra | Discogs 5717512 back cover | OK |

Not used on purpose: the "CHiArA" (C–B–A–A) motif reading of the main theme. It is in Wikipedia but is an interpretation; it could be added as "some hear…" later.

## 5. Re-time needed (every stop is an estimate)

| Mvt | Track length | Stops to re-time | Least certain |
| --- | --- | --- | --- |
| I Allegro affettuoso | 14:37 | 0:00, 0:12, 0:40, 2:30, 3:45, 4:15–6:15, 6:20, 7:45, 11:00–12:45, 12:50, Near the end | C major restatement (≈ 2:30), the Andante espressivo (≈ 4:15–6:15), recapitulation (≈ 7:45), cadenza window |
| II Intermezzo | 5:23 | 0:00, 1:20, 3:10, 4:30, 5:00 | Cello section start (≈ 1:20); where the track break falls in the transition |
| III Allegro vivace | 10:17 | 0:00, 0:45, 1:40, 2:30, 3:15, 4:45, 6:15, 7:15, Near the end | Hemiola theme (≈ 1:40 and ≈ 6:15), recapitulation (≈ 4:45), coda (≈ 7:15) |

## 6. Composer: Robert Schumann (new entry, id `schumann`)

| Fact | Source URL | Status |
| --- | --- | --- |
| Born 8 June 1810, Zwickau, Kingdom of Saxony; father August, bookseller, publisher, author | https://en.wikipedia.org/wiki/Robert_Schumann | OK |
| Law at Leipzig (1828) and Heidelberg (1829); pupil of Friedrich Wieck from 1829 | same | OK |
| Right-hand finger problem ended a virtuoso career; cause uncertain; turned to composition by 1832 | same | OK |
| Co-founded the *Neue Zeitschrift für Musik* in 1834; sole editor from 1835, for ten years; Florestan and Eusebius | same | OK |
| Married Clara 12 Sept 1840 after a court ruling; 1840 his *Liederjahr* (*Dichterliebe* and other cycles) | same | OK |
| Four symphonies; First Symphony 1841 | same | OK |
| Dresden Dec 1844–1850; music director in Düsseldorf from April 1850 | same | OK |
| Brahms called in 1853; Schumann's article "Neue Bahnen" | same; `composers-sources.md` (Brahms) | OK |
| Threw himself into the Rhine 27 Feb 1854, rescued; Endenich sanatorium near Bonn from 4 March 1854 | same | OK |
| Died 29 July 1856 at Endenich, aged 46 | same | OK |
| Clara died 1896 (forty years later) | `composers-sources.md` (Brahms: Clara died May 1896) | OK |

**Portrait:** see the shared file. Josef Kriehuber, lithograph, 1839, Vienna. Commons note on the file page quotes Schumann (1849) saying that of his portraits only Kriehuber's was much good.
