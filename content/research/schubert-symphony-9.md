# Verification: Schubert – Symphony No. 9 in C major, D. 944, "The Great"

Piece id: `schubert-symphony-9` (form `symphony`). Performers: `conductor` + `orchestra`.
Files: `content/en/pieces/schubert-symphony-9.md`, `content/tr/pieces/schubert-symphony-9.md`. Shared-file additions: `content/research/schubert-symphony-9.shared.md`.
Checked on 2026-10-10 (batch BATCH-2026-10, group E).

**How the checks were done** (same method as `beethoven-piano-sonata-8.md`)
- **Spotify:** embed page `https://open.spotify.com/embed/album/<id>` and album-page meta tags.
- **Discogs:** public API `https://api.discogs.com/releases/<id>`.
- **Facts:** Wikipedia, *Symphony No. 9 (Schubert)* (https://en.wikipedia.org/wiki/Symphony_No._9_(Schubert), citing Newbould, *Schubert and the Symphony*, 1992); Peter Gutmann, *Classical Notes* (http://www.classicalnotes.net/classics5/great.html); Tom Service, *The Guardian* symphony guide, 17 June 2014 (https://www.theguardian.com/music/tomserviceblog/2014/jun/17/symphony-guide-schubert-ninth-the-great-tom-service).
- **Stop times:** no timed guide for this recording was available. Times are estimates from the bar structure and the track lengths (see §3). All marked ≈.
- **Privacy:** generic `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`; no personal data sent.

---

## 1. Reference recording: Günter Wand, Berliner Philharmoniker (RCA, live 1995)

The same album as the catalogue's `schubert-symphony-8` reference (Wand/BPh *Symphonies Nos. 8 & 9*), so the two Schubert symphonies share one recording and one Spotify link. Field checks for the album are in `verification-1-5.md` §4; repeated here for the Ninth.

### Spotify embed check

`https://open.spotify.com/album/1zEbPxFC7m0Wj8ePFMkP8W`, *Schubert: Symphonies 8 and 9*; `og:description` "Franz Schubert · album · 1994 · 6 songs"; `music:release_date` 1994-12-05 (distributor metadata).

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| 1–2 | Symphony No. 8 (I, II) | 15:26 / 12:45 | – |
| **3** | **Symphony No. 9 in C Major, D. 944, "The Great": I. Andante. Allegro ma non troppo - Live** – Wand, Berliner Philharmoniker | **13:52** | 832333 |
| **4** | **… II. Andante con moto - Live** | **15:33** | 932800 |
| **5** | **… III. Scherzo. Allegro vivace - Live** | **10:40** | 639906 |
| **6** | **… IV. Finale. Allegro vivace - Live** | **12:11** | 731133 |

Total 52:16 → `duration_min: 52`. One track per movement. Status: VERIFIED.

### Field check

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Günter Wand / Berliner Philharmoniker | Same | https://www.discogs.com/release/11319053 | VERIFIED |
| Label / catalogue | RCA Red Seal, 09026 68314 2 | RCA Victor Red Seal / BMG Classics 09026 68314 2, CD, Europe 1995; barcode 0 90266 83142 5 | same | VERIFIED |
| Recorded | 28–29 March 1995 (live) | Notes: "Recorded Live March 28/29, 1995 Philharmonie Berlin" (one date line for the whole disc). Apple/Spotify metadata disagree (Dec 1994), as for the Eighth | same; `verification-1-5.md` §4 | VERIFIED (booklet), with the same caveat as `schubert-symphony-8` |
| Venue | Philharmonie, Berlin | "Recorded At – Berliner Philharmonie" | same | VERIFIED |
| release_year / year | 1995 | © + ℗ 1995 BMG Music | same | VERIFIED |

**Repeats (INFERRED).** I 13:52 and IV 12:11 are far too short for exposition repeats (with all repeats the symphony "lasts around one hour", Wikipedia). III 10:40 is consistent with the scherzo's repeats taken. The guide says "judging by its length".

**Live tracks.** The tracks are marked "Live". Whether any applause remains at the end of track 6 was not checked: confirm when re-timing.

### Also recommended: Josef Krips, London Symphony Orchestra (Decca, 1958)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Josef Krips / London Symphony Orchestra | Same | https://www.discogs.com/release/2855578 | VERIFIED |
| Label / catalogue | Decca, "SXL 2045 (LP); 452 892-2 (CD, with Symphony No. 8)" | SXL 2045, UK, November 1958 (first UK stereo issue; producer Ray Minshull, engineer Kenneth Wilkinson). CD 452 892-2 (London, 1997): "Tracks 1-4 recorded May 1958 at Kingsway Hall, London and originally released on SXL 2045"; tracks 5–6 = Symphony No. 8, Wiener Philharmoniker, March 1969 | https://www.discogs.com/release/2855578 ; https://www.discogs.com/release/8967211 | VERIFIED |
| Recorded / venue | 21–23 May 1958, Kingsway Hall, London | SXL 2045 notes: "Recorded 21 - 23 May 1958 in Kingsway Hall, London" | https://www.discogs.com/release/2855578 | VERIFIED |
| Spotify | https://open.spotify.com/album/2nFVSsVHVJtGAnw37l8hwC | *Schubert: Symphony No.8 "Unfinished"; Symphony No.9 "Great"*, compilation 1997, 6 tracks; No. 9 = tracks 1–4 (LSO, Krips) **14:02 / 13:48 / 9:53 / 12:01**; No. 8 = tracks 5–6 (Wiener Philharmoniker) | embed | VERIFIED (= 452 892-2 by programme, order and year: INFERRED) |

---

## 2. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Worked on in summer 1825 while travelling in Upper Austria and the Alps; fully scored by 1826; long wrongly dated 1828 | Wikipedia: "sketches for the 'Great' were largely composed in the summer of 1825 … By the spring or summer of 1826, it was completely scored"; "For a long time, the symphony was believed to be a work of Schubert's last year, 1828"; identified with the "Gmunden-Gastein symphony" (D 849). Gutmann: Schubert "spent most of May through October 1825" away from Vienna (he writes "in Gastein"; the old name "Gmunden-Gastein" names two stops of that journey, so the guide says only "Upper Austria and the Alps"); paper and ink show it begun summer 1825 and completed within a year | Wikipedia; Gutmann | VERIFIED |
| Sent to the Gesellschaft der Musikfreunde in October 1826; amateur orchestra ran through it in 1827 and set it aside as too long and difficult; never properly performed in his lifetime | Wikipedia: "in October, Schubert … sent it to the Gesellschaft der Musikfreunde with a dedication … in the latter half of 1827, gave the work an unofficial perfunctory run-through … set aside as too long and difficult for the amateur orchestra of the conservatory". A hypothesis of a 12 March 1829 performance is noted there as slender (and after his death) | Wikipedia | VERIFIED. Our first draft said "Schubert never heard it"; changed because whether he attended the 1827 run-through is unknown |
| 1838: Schumann shown the manuscript in Vienna by Ferdinand Schubert; Mendelssohn conducted the first full performance, Leipzig, 21 March 1839; Schumann's "heavenly length" | Wikipedia (Gewandhaus; Neue Zeitschrift für Musik). Gutmann says Schumann "visited Ferdinand in 1839"; Wikipedia's 1838 is consistent with a March 1839 premiere and is used | Wikipedia; Gutmann; Service | VERIFIED (sources differ on the year of the visit; 1838 used) |
| "Great" first distinguished it from Symphony No. 6 in C; also numbered 7 or 8 | Wikipedia, intro and Numbering | Wikipedia | VERIFIED |
| With all repeats about an hour | Wikipedia: "a typical performance … lasts around one hour when all repeats … are taken" | Wikipedia | VERIFIED |
| I: introduction begins with two horns alone; theme 2 in E minor not G major; trombone melody; introduction theme restated in the coda (b. 570) | Wikipedia, Form: "the second theme begins in E minor rather than G major, while a prominent trombone solo occurs in A♭ major. The opening theme of the introduction is restated in the coda (b. 570)"; "opening theme is used in a modified form as secondary subject matter". The guide says the trombone phrase "recalls" the horn tune (cautious) | Wikipedia | VERIFIED (horns-alone opening: score, well known; Gutmann describes the horns at the start) |
| I: trombones used melodically, unlike their usual role | Wikipedia, Instrumentation ("Schubert fully integrates the trombones … at times melodically"); Gutmann ("especially the trombones, which play a prominent role") | as above | VERIFIED |
| II: march in A minor and lyrical F major theme, each twice (A–B–A–B) | Wikipedia ("P1 S1 P2 S2 … march-like first theme … A minor … second theme in F major") | Wikipedia | VERIFIED |
| II: horn passage; Schumann's "from another sphere … everything else listens" | Schumann quoted by Gutmann: horns "calling as though from a distance, that seems to come to us from another sphere [and] everything else listens as though some heavenly messenger were hovering around the orchestra" | Gutmann | VERIFIED (paraphrased in the guide) |
| II: cataclysmic climax, then silence and recovery | Gutmann: "a wrenching, cataclysmic climax that prompts 'a return from the abyss' (Roy)". The silence is the general pause in the score after the climax | Gutmann | VERIFIED (length of the silence not stated) |
| II: theme 2 returns in A major | INFERRED from the sonata-without-development layout (second theme returns in the tonic major) | – | INFERRED |
| III: scherzo with Ländler-like second idea; trio in A major with a broad wind melody | Score (Breitkopf); well known. Not seen in a source opened here | – | INFERRED (check by ear) |
| IV: four repeated notes of the second theme grow to "Judgment Day" climax | Gutmann (citing another commentator): "the four repeated notes of the second subject begin as a 'jaunty melody' and wind up being 'thundered out as though Judgment Day were at hand'" | Gutmann | VERIFIED |
| IV: "Ode to Joy" quotation, pianissimo in the clarinets, at the start of the development (midpoint) | Wikipedia: "Midway through this final movement Schubert pays tribute to Beethoven by quoting from the finale of his Ninth Symphony". Service: "Schubert slips this tune, pianissimo, in the clarinets and woodwind" at "the middle point of his finale" | Wikipedia; Service | VERIFIED |
| IV: recapitulation begins in E-flat major | Wikipedia: "The recapitulation is unusual in that it begins in E♭ major" | Wikipedia | VERIFIED |
| IV: London 1844 violinists laughed at the second subject; orchestra refused | Wikipedia: "When Mendelssohn took the symphony to … London in 1844, orchestras flatly refused to play it; in London, the violinists are reputed to have collapsed in laughter when rehearsing the second subject of the finale". Told as "the story goes" | Wikipedia | VERIFIED as anecdote |
| Threads: Schubert worked on it soon after Beethoven's Ninth (1824) | Service: "Schubert wrote his own ninth symphony in 1825, a year after Beethoven's had its premiere" | Service | VERIFIED |

---

## 3. How the approximate stop times were derived

No listening was possible and no timed guide to this recording was found. Times come from bar positions and the track lengths, assuming steady tempi inside each section.

- **I (13:52):** introduction bars 1–77 (assumed ≈ 3:05 at Wand's flowing Andante); Allegro from b. 78; theme 2 b. 134; trombone passage b. 199; development ≈ b. 254; recapitulation ≈ b. 356; coda *Più moto* b. 570 (Wikipedia); 685 bars. Allegro ≈ 1.1 s a bar, coda ≈ 0.9 s. The bar numbers for development and recapitulation are from memory of the score, not checked against an edition: **least certain**.
- **II (15:33):** about 380 bars of 2/4 at ≈ 2.45 s a bar; theme 2 ≈ b. 90; horn transition ≈ b. 145–160; climax and general pause ≈ b. 240–250; theme 2 return ≈ b. 270; coda ≈ b. 330. Bar numbers approximate.
- **III (10:40):** scherzo with both repeats ≈ 4:45, trio ≈ 3:30, *da capo* without repeats ≈ 2:25.
- **IV (12:11):** 1154 bars at ≈ 0.63 s a bar, exposition not repeated; theme 2 ≈ b. 165; development ≈ b. 385; recapitulation ≈ b. 600; coda in the last ≈ 3 minutes.

---

## 4. Painting: Ferdinand Georg Waldmüller, *View of the Dachstein with the Hallstätter See from the Hütteneckalm near Ischl*, 1838

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Ferdinand Georg Waldmüller (Austrian, 1793–1865) | Commons | VERIFIED |
| Title / date | *Ansicht des Dachsteins mit dem Hallstättersee von der Hütteneckalpe bei Ischl*, 1838 | https://commons.wikimedia.org/wiki/File:Waldm%C3%BCller_-_Ansicht_des_Dachsteins_mit_dem_Hallst%C3%A4ttersee_von_der_H%C3%BCtteneckalpe_bei_Ischl.jpeg | VERIFIED (Commons Artwork template) |
| Collection | Wien Museum, Vienna (Institution template; catalogue raisonné Feuchtmüller no. 570) | same | VERIFIED via Commons; museum object page not opened |
| Medium / size | Oil on wood, 45.5 × 57.5 cm | same | VERIFIED via Commons |
| Public domain | Artist died 1865 → PD everywhere; Commons `PD-old-100` | same | VERIFIED |
| Image | **4716 × 3654**, public domain; source given as "repro from artbook" (a book scan, colour may differ from the original). Wien Museum Online Sammlung publishes many PD works under CC0: check for a museum file before the image run | Commons API | VERIFIED. Not NC |

**Pairing.** Seen in the image: a high Alpine pasture with wooden huts and a group of country women, looking across the Hallstätter See to the sunlit glacier and peaks of the Dachstein. The Salzkammergut (Gmunden, Ischl, Hallstatt) is the Upper Austrian lake country where Schubert spent the summer of 1825 while working on the symphony; Waldmüller was a Viennese contemporary (born 1793, four years before Schubert). The painting is 1838, a decade after Schubert's death; the pairing note claims only place and scale, not a direct link.

Alternatives (in `.shared.md`): Waldmüller, *The Dachstein from the Sophien-Doppelblick near Ischl* (1835, Belvedere); Thomas Ender, *View of the Residence of Archduke Johann in Gastein* (c. 1829–32, J. Paul Getty Museum; Gastein is one of the two places in the symphony's old name, "Gmunden-Gastein").

---

## 5. Glossary

Existing terms reused: sonata form, unison, development, recapitulation, coda, scherzo, trio, Ländler. No new terms.

---

## 6. Re-time needed

Every stop is an estimate (§3). Re-time all against Spotify album `1zEbPxFC7m0Wj8ePFMkP8W`, tracks 3–6 (Wand / BPh, live 1995).

| Mvt | Track | Stops to re-time | Notes |
| --- | --- | --- | --- |
| I Andante – Allegro ma non troppo | 3 (13:52) | 0:00, 0:40, 2:30–3:05, 3:05, 4:10, 5:20, 6:20, 8:15, 12:05, Near the end | Least certain: start of the Allegro (length of Wand's introduction), development and recapitulation |
| II Andante con moto | 4 (15:33) | 0:00, 3:40, 5:50, 6:30, 9:30–10:30, 10:30, 11:10, Last 2 minutes | Bar positions approximate; the climax and silence must be placed exactly |
| III Scherzo. Allegro vivace | 5 (10:40) | 0:00, 0:30, 4:45, 8:15 | Trio and *da capo* depend on which repeats Wand takes |
| IV Finale. Allegro vivace | 6 (12:11) | 0:00, 1:45, 4:05, 6:20, Last 3 minutes, Near the end | Check for applause at the end of the live track |
