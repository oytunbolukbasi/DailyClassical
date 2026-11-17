# Verification: Bizet – Carmen Suite No. 1

Piece id `bizet-carmen-suite-1`. Checked on 2026-11-17 (batch November 2026, group I).
Files: `content/drafts/en/bizet-carmen-suite-1.md`, `content/drafts/tr/bizet-carmen-suite-1.md`.
Shared-file additions (paintings.yaml entry, alternatives, glossary term *entr'acte*, the new composer Bizet, re-time row): `content/research/bizet-carmen-suite-1.shared.md`.

**How the checks were done:** Spotify search in the built-in browser; embed `__NEXT_DATA__` with curl from a Turkish network; album page meta and ℗/© lines; Discogs API (release pages); Wikipedia EN/JA via the MediaWiki API; Commons, Wikidata and the Phillips Collection object page. Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Dutoit / Orchestre Symphonique de Montréal (Decca, 1986)

Why this one: Dutoit's Montreal disc of both Carmen and both L'Arlésienne suites (Decca 417 839-2) is a standard recommendation (Gramophone review "Bizet L'Arlésienne & Carmen Suites"); the suite is on 5 tracks (≤ 6), in the published order, all playable in Turkey. Rejected: Bychkov / Orchestre de Paris (`5RAc2jGlZHSTa0ADz4antD`, no Séguedille); Ormandy (`6O4ef7EDUtGvVeouYeLU4r`, only 5 numbers, no Séguedille); Karajan BPO (`2M8GLwUjff17pzQOiLljTn`, 4-number selection); Paray (`5A3dWj5tvY8ePOCghODZvO`, mixed selection from both suites); Collins (`1GqwbxAqLigPPIXFrSLLiH`, 7 tracks, mixed); Markevitch (`0Q0AzJjzelILkoRBCcAVK0`, no Séguedille).

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Charles Dutoit / Orchestre Symphonique de Montréal | Embed tracks 9–13 credits "Georges Bizet, Orchestre Symphonique de Montréal, Charles Dutoit" | https://open.spotify.com/embed/album/3MHXMoe8tGfheDCfH6lUFn | OK |
| Label / catalogue | Decca 417 839-2; 466 421-2 (reissue) | Discogs 25653790 (London 417 839-2, US, May 1988; "Recorded At Saint Eustache Church"; producer Ray Minshull, engineer Simon Eadon; Carmen suites "arranged by Fritz Hoffmann"); Discogs 5196431 (Decca 466 421-2, 1999); Spotify © 1999 / ℗ 1988 Decca, which matches the 1999 reissue | https://api.discogs.com/releases/25653790 ; https://api.discogs.com/releases/5196431 | OK |
| Recorded | "1986" | Radio Swiss Classic database: L'Arlésienne Suite No. 2 from this disc "October 1986, Montreal"; no date found for the Carmen sessions specifically | https://www.radioswissclassic.ch/en/music-database/title/71275825a0f48152ebbac2f0997ffed4fb4f | SECONDARY |
| Venue | Église Saint-Eustache, Saint-Eustache, Quebec | Discogs 25653790 "Saint Eustache Church" (the church in the town of Saint-Eustache, north-west of Montreal, used by Decca for the OSM) | same | OK |
| Release year | 1988 | Discogs 25653790 (May 1988); Spotify ℗ 1988 | album page | OK |
| Spotify | https://open.spotify.com/album/3MHXMoe8tGfheDCfH6lUFn | "Bizet: Carmen Suites 1 & 2; L'Arlésienne Suites 1 & 2", album, 1988, 19 songs | album page | OK |

### Durations and playability (embed, album 3MHXMoe8tGfheDCfH6lUFn)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 9 | I. Prélude – Aragonaise ("Carmen Suite No. 1: I. Prélude. Andante moderato (Fate Motive) – II. Aragonaise") | 220266 | 3:40 | true |
| 10 | II. Intermezzo ("III. Intermezzo (Entracte After Act II)") | 155826 | 2:35 | true |
| 11 | III. Séguedille ("IV. Séguedille (Act I)") | 119400 | 1:59 | true |
| 12 | IV. Les dragons d'Alcala ("V. … (Entracte After Act I)") | 114906 | 1:54 | true |
| 13 | V. Les toréadors ("VI. … (Act I Prelude. Allegro giocoso)") | 129800 | 2:09 | true |
| | Total | 740198 | 12:20 → `duration_min: 12` | |

Spotify numbers the suite's six numbers I–VI; the guide numbers the five tracks I–V, the first holding Prélude and Aragonaise (Discogs 25880812 lists track 9 as "Prelude - Aragonaise", 3:34). Spotify's subtitles "Entracte After Act I/II" mean the preludes to Acts II/III.

---

## 2. Also recommended: Bernstein / New York Philharmonic (Columbia, 1967)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Spotify | `3EInLe9YdgcdrlagaJ0zPa` "Bizet: Carmen Suites Nos. 1 & 2 – Grieg: Peer Gynt Suites Nos. 1 & 2", ℗ 2017 Sony (remaster); Suite No. 1 tracks 1–6 (Les Toréadors 2:33, Prélude 1:12, Aragonaise 2:25, Intermezzo 2:45, Séguedille 1:58, Les dragons d'Alcala 1:52), all isPlayable true | embed + album page | OK |
| LP | Columbia M 31800, released 1973, with Grieg's Peer Gynt | https://classite.com/disk/columbia-m-31800-q4079 | SECONDARY |
| Recorded / venue | 15–20 May 1967, Philharmonic Hall, Lincoln Center (dated in databases for Suite No. 2; Suite No. 1 assumed from the same sessions, so the yaml gives only "1967") | https://classite.com/composition/Georges-Bizet_Ernest-Guiraud_Carmen-Suite-no-2-c72585/performance/4903 ; https://musicfactsdb.com/Recording/Index/832500 | SECONDARY |
| Note | Order differs from the published suite (Les Toréadors first, then the Prélude, so it plays the opera's overture in order). One reviewer found these performances unremarkable (classical.net); kept as a contrasting, well-known version | https://www.classical.net/music/recs/reviews/s/sny63089a.php | NOTE |

---

## 3. Painting: Édouard Manet, *Spanish Ballet* (*Le Ballet espagnol*), 1862

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Édouard Manet (1832–1883) | Commons, deathyear=1883 | OK |
| Date / medium / size | 1862, oil on canvas, 60.96 × 90.49 cm | Phillips Collection object page | OK |
| Collection | The Phillips Collection, Washington, D.C., object number 1250, acquired 1928 | https://www.phillipscollection.org/collection/spanish-ballet ; Wikidata Q23940161 | OK |
| Subject | Principal dancers of the Royal Theatre of Madrid, the troupe of Mariano Camprubí, during their August–November 1862 season at the Paris Hippodrome; Manet had several pose in Alfred Stevens's studio | Phillips page | OK |
| Image | File:Edouard Manet - Spanish Ballet - Google Art Project.jpg, **4001 × 2697** px | https://commons.wikimedia.org/wiki/File:Edouard_Manet_-_Spanish_Ballet_-_Google_Art_Project.jpg | OK |
| Rights | `{{PD-Art|PD-old-100-1923|deathyear=1883}}` | same | OK |
| Pairing | Paris's taste for Spain in the 1860s–70s; Bizet never visited Spain (en.wikipedia, *Carmen*: "Bizet, who had never visited Spain"); Manet painted Spanish dancers performing in Paris | Phillips page; https://en.wikipedia.org/wiki/Carmen | OK |

No Manet is in `content/paintings.yaml`.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| *Carmen* premiered at the Opéra-Comique, Paris, 3 March 1875 | https://en.wikipedia.org/wiki/Carmen | OK |
| Setting Seville, around 1820; Carmen a Gypsy cigarette-factory worker; José, Escamillo; José stabs her outside the bullring | same (Synopsis) | OK |
| Hostile reviews, indifferent public; Bizet died after the 33rd performance, 3 June 1875, aged 36; international success within ten years | same; https://en.wikipedia.org/wiki/Georges_Bizet | OK |
| Bizet never visited Spain; used Yradier's song and Spanish rhythms | en.wikipedia *Carmen* (Music section) | OK |
| Suite compiled after Bizet's death by Ernest Guiraud for Choudens; later edition by Fritz Hoffmann (Breitkopf & Härtel) with nearly the same selection | https://ja.wikipedia.org/wiki/カルメン ("ギロー/ホフマン版組曲"); publisher listings (Kalmus/Alfred, "compiled 1880–82") found by search; Dutoit CD credits the Carmen suites to Hoffmann (Discogs) | SECONDARY (the guide words it cautiously) |
| Suite No. 1 contents and sources: Prélude (second half of Act I prelude) – Aragonaise (Act IV entr'acte); Intermezzo (Act III entr'acte); Séguedille (Act I, arranged for orchestra); Les dragons d'Alcala (Act II entr'acte); Les toréadors (first half of Act I prelude) | ja.wikipedia | OK |
| Fate motif played by clarinet, bassoon, cornet and cellos over tremolo strings; Act I prelude combines the bullfighters' entry (Act IV), the Toreador Song refrain and the fate motif | en.wikipedia *Carmen* (Music section) | OK |
| Act III: smugglers' camp in the mountains at night | en.wikipedia synopsis | OK |
| Seguidilla: Carmen, hands tied, left with José; sings of Lillas Pastia's tavern and dancing with her lover, "whoever that may be"; José frees her | en.wikipedia synopsis | OK |
| Act II prelude based on the melody José sings offstage on his entry ("Halte-là! Qui va là? Dragon d'Alcala!") | en.wikipedia (Music: "Act 2 begins with a short prelude, based on a melody that José will sing offstage"); libretto | OK |
| José imprisoned for letting Carmen escape (a month) | ja.wikipedia synopsis Act 2 | OK |
| Toreador Song in Act II at the tavern; refrain about the dark eye watching the toreador | en.wikipedia; libretto ("qu'un œil noir te regarde") | OK |
| Dragons d'Alcala: two bassoons, pizzicato strings, side drum | Score (standard description) | SECONDARY |
| Intermezzo: flute solo over harp | Score (standard description) | SECONDARY |
| Aragonaise: oboe melody, harp/pizzicato, tambourine | Score (standard description) | SECONDARY |
| Tempo markings: from Spotify (Prélude "Andante moderato", Toréadors "Allegro giocoso") and Bernstein tracks (Aragonaise "Allegro vivo", Intermezzo "Andantino quasi Allegretto", Séguedille "Allegretto", Dragons "Allegro moderato") | embeds | OK |
| Keys and metres (D minor; E-flat major; B minor; G minor; A major; 3/4, 3/8, 2/4) | Score; not checked against IMSLP (bot check) | SECONDARY |

---

## 5. Re-time

All stops are estimates (≈) from the structure of each number and the Dutoit track lengths. The Prélude/Aragonaise split inside track 9 (≈ 1:15–1:25) is the most important to check: the Prélude alone takes 1:12–1:27 in other recordings found (Bernstein 1:12, Bychkov 1:23, Bramall 1:27).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Prélude – Aragonaise | 3:40 | 0:00, 0:45, 1:15, 1:25, 1:45, 2:30, Near the end | Start of the Aragonaise (≈ 1:25) |
| II Intermezzo | 2:35 | 0:00, 0:40, 1:10, 1:50, Last 20 seconds | Clarinet entry (≈ 0:40) |
| III Séguedille | 1:59 | 0:00, 0:40, 1:20, Last 15 seconds | Return (≈ 1:20) |
| IV Les dragons d'Alcala | 1:54 | 0:00, 0:30, 1:00, Last 20 seconds | Clarinets (≈ 0:30) |
| V Les toréadors | 2:09 | 0:00, 0:30, 1:00, 1:35, Last 10 seconds | Toreador refrain (≈ 1:00) |
