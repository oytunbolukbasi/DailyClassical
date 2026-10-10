# Verification: Brahms – Violin Concerto in D major, Op. 77

Piece id: `brahms-violin-concerto` (form `violin-concerto`). Performers: `soloists` (violin) + `conductor` + `orchestra`.
Files: `content/en/pieces/brahms-violin-concerto.md`, `content/tr/pieces/brahms-violin-concerto.md`. Shared-file additions (paintings.yaml entry, alternatives, glossary rows): `content/research/brahms-violin-concerto.shared.md`.
Checked on 2026-10-10 (batch BATCH-2026-10, group E).

**How the checks were done** (same method as `beethoven-piano-sonata-8.md`)
- **Spotify:** album ids confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__` JSON: album name, track titles, performer credits, durations in ms). The album page's `og:description` and `music:release_date` were also read. Spotify's release date is the digital edition's.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits, sleeve notes). Human-readable URLs below.
- **Listening guide with timings:** Kelly Dean Hansen's detailed guide to Op. 77 is keyed to **this same recording** (Mutter / Karajan, DG CD "415 569-2" as he cites it), with bar numbers: http://www.kellydeanhansen.com/opus77.html (linked from the Wikipedia article). Stop times in the guide come from his timings, checked against the Spotify track lengths (his movement ends: I 22:00, II 9:41, III 8:28; Spotify 22:02, 9:42, 8:35). Our descriptions are our own.
- **Status key:** VERIFIED = seen in a primary source. INFERRED = derived, not seen directly. UNVERIFIED = could not be confirmed.
- **Privacy:** all requests used the generic `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`; no personal data in any URL or header.

---

## 1. Reference recording: Anne-Sophie Mutter, Berliner Philharmoniker, Herbert von Karajan (DG, 1981)

### Spotify embed check

`https://open.spotify.com/album/03xKUXxuRY5KuLs1gITc09`. Album name: *Brahms: Violin Concerto; Double Concerto*. `og:description` "Johannes Brahms · album · 1993 · 6 songs"; `music:release_date` 1993-01-01 (= the 1993 *Karajan Gold* CD 439 007-2, same coupling and order).

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| **1** | **Violin Concerto in D Major, Op. 77: I. Allegro non troppo (Cadenza: Joachim)** – Mutter, Berliner Philharmoniker, Karajan | **22:02** | 1322000 |
| **2** | **… II. Adagio** | **9:42** | 582000 |
| **3** | **… III. Allegro giocoso, ma non troppo vivace** | **8:35** | 515000 |
| 4–6 | Double Concerto Op. 102 (Mutter, Meneses) | 18:04 / 7:30 / 9:11 | – |

Total 40:19 → `duration_min: 40`. Discogs gives the same total (40:19) for Op. 77 on 477 8415. Status: VERIFIED. One track per movement; 3 movements (limit 6).

### Field check

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Anne-Sophie Mutter / Herbert von Karajan / Berliner Philharmoniker | Same | Spotify embed; https://www.discogs.com/release/22893452 | VERIFIED |
| Label / catalogue | DG, "400 064-2 (CD); 439 007-2 (CD, with the Double Concerto)" | 400 064-2: CD, ℗ 1982, "Eine Aufnahme aus der Berliner Philharmonie" (https://www.discogs.com/release/18729010). 439 007-2: *Karajan Gold* CD, 15 Feb 1993, Op. 77 + Op. 102 (https://www.discogs.com/release/22893452). The original LP is reported as 2532 032 (1982) in a search snippet of a Discogs/dealer listing, not opened: left out | as given | VERIFIED (LP number UNVERIFIED, not used) |
| Recorded / venue | September 1981, Philharmonie, Berlin | 439 007-2 notes: "Recording: Berlin, Philharmonie, 9/1981 (Op. 77)". Japanese LP 28MG 0262: "Date of Recording: 9/1981. Venue: Philharmonie, Berlin" | https://www.discogs.com/release/22893452 ; https://www.discogs.com/release/12314660 | VERIFIED |
| release_year / year | 1982 | ℗ 1982 (Op. 77) on every issue | same | VERIFIED |
| Producers | – | Michel Glotz (producer), Günther Breest (executive), Günter Hermanns (balance engineer) | https://www.discogs.com/release/2549156 | VERIFIED (not shown in the guide) |
| Cadenza | Joachim | Spotify track title "(Cadenza: Joachim)"; Hansen's guide | embed; Hansen | VERIFIED |

### Also recommended: Jascha Heifetz, Chicago Symphony Orchestra, Fritz Reiner (RCA, 1955)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | https://open.spotify.com/album/40zWVQUz4m3mINRYVYEhBl | *Brahms: Violin Concerto in D Major, Op. 77 - Tchaikovsky: Violin Concerto in D Major, Op. 35 (Heifetz Remastered)*, 6 tracks; Op. 77 = tracks 1–3, **18:54 / 8:16 / 7:26**, credited Heifetz, Reiner, Chicago Symphony Orchestra. `music:release_date` 1957-01-01 (metadata) | embed page | VERIFIED |
| Label / catalogue | RCA Victor Red Seal, LM-1903 (mono LP); LSC-1903 (stereo LP) | LSC-1903 (US, May 1959): "first US stereo version, but was originally released 3 years earlier in mono as LM-1903" | https://www.discogs.com/release/5789625 | VERIFIED |
| Recorded / venue | 21–22 February 1955, Orchestra Hall, Chicago | RCA Gold Seal reissue sleeve: "February 21+22, 1955 Orchestra Hall, Chicago". The LSC-1903 entry gives 21 February only | https://www.discogs.com/release/3764669 ; https://www.discogs.com/release/5789625 | VERIFIED (second day per one source) |
| release_year / year | 1955 | Mono LM-1903 1955 per the LSC-1903 notes ("3 years earlier") | same | VERIFIED |

Heifetz is much faster (34:36 against Mutter's 40:19): the reference stops will not fit it.

---

## 2. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written in summer 1878 at Pörtschach, a lake (Wörthersee) in southern Austria | Wikipedia, *Pörtschach am Wörthersee*: Brahms "worked on his Second Symphony and his Violin Concerto here"; spent the summers of 1877–1879 there. Year 1878: Wikipedia, *Violin Concerto (Brahms)* and *Johannes Brahms* ("Violin Concerto Op. 77 (1878)") | https://en.wikipedia.org/wiki/P%C3%B6rtschach_am_W%C3%B6rthersee ; https://en.wikipedia.org/wiki/Violin_Concerto_(Brahms) | VERIFIED |
| For his friend Joseph Joachim, leading violinist; Joachim advised on the solo part | Wikipedia (concerto): "dedicated to and premiered by his friend"; Brahms "asked Joachim's advice on the writing of the solo violin part … not all his advice was heeded". *Joseph Joachim*: "one of the most distinguished violinists of the 19th century" | https://en.wikipedia.org/wiki/Joseph_Joachim | VERIFIED |
| Premiere Leipzig, 1 January 1879, Joachim soloist, Brahms conducting | Wikipedia (concerto), Premiere: "Gewandhaus, Leipzig, on 1 January 1879, by Joachim … Brahms conducted the premiere" | as above | VERIFIED |
| Planned in four movements; middle two dropped; "feeble Adagio" | Wikipedia (concerto), Structure: "Originally, the work was planned in four movements … replaced with what Brahms called a 'feeble Adagio'" (source: Steinberg, *The Concerto*, 1998). Hansen agrees | as above | VERIFIED (translation of Brahms's phrase varies; "feeble" is Steinberg's) |
| "Against the violin" joke attributed both to Bülow and to Hellmesberger | Wikipedia (concerto): "attributed equally to conductor Hans von Bülow and to Joseph Hellmesberger Sr." | as above | VERIFIED (told as an attribution, not as fact) |
| Sarasate refused, oboe has "the only tune in the adagio" | Wikipedia (concerto), quoting Sarasate. Told in the guide as "the story goes" | as above | VERIFIED as anecdote |
| Brahms wrote no cadenza; almost every violinist plays Joachim's | Hansen: Brahms "composed no solo cadenza for the first movement"; Wikipedia: "The most familiar cadenza … is by Joachim". "Almost every" is our paraphrase of "most familiar" | Hansen; Wikipedia | VERIFIED (wording slightly stronger than the sources; acceptable) |
| Finale's Hungarian flavour, a nod to Joachim, who was Hungarian | Hansen: "an unmistakable gypsy flavor, a nod to Joachim's Hungarian roots"; Wikipedia *Joseph Joachim*: "a Hungarian violinist" | Hansen; https://en.wikipedia.org/wiki/Joseph_Joachim | VERIFIED |
| I: theme in low strings, bassoons, horns; oboe answers | Hansen 0:00 [m. 1] | Hansen | VERIFIED |
| I: violin enters m. 90 over a drum roll, in the minor, improvisatory | Hansen 2:35 [m. 90] | Hansen | VERIFIED |
| I: violin's own Theme 3 (m. 206) | Hansen 6:41 [m. 206] | Hansen | VERIFIED |
| I: development, C minor, *tranquillo* passage with winds | Hansen 10:12 [m. 312] | Hansen | VERIFIED |
| I: recapitulation m. 381, full orchestra with trumpets | Hansen 12:27 [m. 381] | Hansen | VERIFIED |
| I: cadenza 17:13–20:00 (81 bars, trills); coda m. 527, theme high on the violin; *animato* close with sharp chords | Hansen 17:13 [C1] … 19:13 [C68] "long series of trills", 20:01 [m. 527], 21:28 [m. 559] | Hansen | VERIFIED |
| II: wind-only opening, oboe melody; violin enters m. 32; middle section F-sharp minor; return m. 78 | Hansen, 2nd movement 0:00, 1:05, 2:26 [m. 32], 3:30 [m. 46], 3:59 [m. 52], 6:17 [m. 78], 7:15 [m. 91] | Hansen | VERIFIED |
| III: rondo theme in double stops; first episode A major (m. 57); 3/4 episode (m. 120); first episode returns early in G major (m. 150); rondo theme returns m. 203; cadenza-like passage m. 222; *Poco più presto* m. 267; ends quietly then three loud chords | Hansen, 3rd movement | Hansen | VERIFIED |
| In this recording: Mutter was eighteen; Karajan had supported her since her teens | Wikipedia *Anne-Sophie Mutter*: born 29 June 1963; "supported early in her career by Herbert von Karajan, made her orchestral debut with the Berlin Philharmonic in 1977". Recorded 9/1981 → 18 | https://en.wikipedia.org/wiki/Anne-Sophie_Mutter | VERIFIED |

Not used: the claim that discarded middle-movement material went into the Second Piano Concerto (Wikipedia, "Some of the discarded material was reworked"; plausible but not needed). The Mutter/Karajan finale in the film *There Will Be Blood* (Wikipedia; true but off-topic).

---

## 3. Painting: Pál Szinyei Merse, *Picnic in May* (*Majális*), 1873

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Pál Szinyei Merse (Hungarian, 1845–1920) | Commons file page | VERIFIED |
| Title / date | *Majális* (*Picnic in May*), 1873 | Google Arts & Culture record on Commons (`earliest_date = 1873`) | VERIFIED |
| Collection | Hungarian National Gallery, Budapest (inventory 1547 per Google Arts & Culture and Wikidata Q28797209) | https://commons.wikimedia.org/wiki/File:Szinyei_Merse,_P%C3%A1l_-_Picnic_in_May_-_Google_Art_Project.jpg ; museum page https://en.mng.hu/artworks/picnic-in-may/ (HTTP 451 to scripted requests, not opened) | VERIFIED (via GAP/Wikidata) |
| Medium / size | Oil on canvas, 127 × 162.5 cm | same | VERIFIED |
| Public domain | Artist died 1920 → PD everywhere. Commons licence `PD-Art-two-auto|1920` | same | VERIFIED |
| Image | Google Art Project file **16975 × 13387** (85.9 MB), public domain. Not NC | Commons API imageinfo | VERIFIED. Very large: the image pipeline will downscale |

**Pairing.** A group of young people picnicking on a sunlit hillside, painted in Hungary five years before the concerto. The link is the summer open-air mood of the concerto (written in a summer resort) and the Hungarian colour of the finale, which honours the Hungarian Joachim. No direct Brahms connection is claimed. Not previously used in `content/paintings.yaml`; the artist is new to the catalogue.

Alternatives (in `.shared.md`): Markus Pernhart, a Wörthersee view (the lake of Pörtschach itself; date and holding unknown, "repro from artbook"), and Adolph Menzel, *Afternoon in the Tuileries Gardens* (1867, National Gallery, London).

---

## 4. Glossary

Existing terms reused: cadenza, sonata form, double exposition, tutti, development, recapitulation, coda, rondo.
New terms (rows in the `.shared.md`): **Trill**, **Double stop**. (Other groups may propose the same two; merge once.)

---

## 5. Re-time needed

Stops come from Hansen's timings of the same recording on CD, not from our own listening of the Spotify tracks. The Spotify tracks are 1–7 s longer than his movement ends (I +2 s, II +1 s, III +7 s), so offsets of a few seconds are expected. Re-time every stop by ear against Spotify album `03xKUXxuRY5KuLs1gITc09`, tracks 1–3.

| Mvt | Track | Stops to re-time | Notes |
| --- | --- | --- | --- |
| I Allegro non troppo | 1 (22:02) | 0:00, 0:31, 2:13, 2:35, 4:19, 6:41, 8:56, 10:12, 12:27, 17:13–20:00, 20:01, Near the end | Cadenza boundaries most important |
| II Adagio | 2 (9:42) | 0:00, 2:26, 3:30, 3:59–5:28, 6:17, 7:15, Near the end | – |
| III Allegro giocoso … – Poco più presto | 3 (8:35) | 0:00, 0:38, 1:19, 2:11, 2:53, 3:56, 5:10, 5:38, 6:58, Near the end | Spotify track 7 s longer than Hansen's: check whether the extra time is at the start |
