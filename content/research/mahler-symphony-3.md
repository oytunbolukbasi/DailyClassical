# Verification: Mahler – Symphony No. 3 in D minor

Piece id `mahler-symphony-3`. Checked on 2026-10-10 (batch October 2026, group D).
**Recording change, 2026-11-17:** the product owner chose Dudamel / Berliner Philharmoniker (live, 2014) as the reference recording. It is section 1 below; the former reference, Bernstein / New York Philharmonic (Columbia, 1962), moved to `also_recommended` (section 2, its original verification kept as written); Haitink stays (section 3). All stops were re-timed for Dudamel (section 6).

Files: `content/en/pieces/mahler-symphony-3.md`, `content/tr/pieces/mahler-symphony-3.md`.
Shared-file additions (paintings.yaml entry, alternatives, glossary row): `content/research/mahler-symphony-3.shared.md`.

**How the checks were done:** as in `mahler-symphony-2.md` (Spotify web search to find ids; embed page for tracks and ms durations; album page for ℗ line, release date and markets; Discogs API for credits and dates). Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Dudamel / Berliner Philharmoniker (Berliner Philharmoniker Recordings, live 2014)

Checked 2026-11-17. Spotify embed read with curl (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`) from a Turkish network; the album has **six tracks, one per movement**.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Gustavo Dudamel / Berliner Philharmoniker | Spotify credits on all six tracks: "Gustav Mahler, Berlin Philharmonic, Gustavo Dudamel"; booklet "Gustavo Dudamel Dirigent · conductor" | https://open.spotify.com/embed/album/3XOFx2A5iGm3L99jxWPexS | OK |
| Alto soloist | Gerhild Romberger, role `contralto` | Spotify credits her on IV and V (name only, no voice type). Box booklet: "Gerhild Romberger Alt · contralto"; MusicWeb review header: "Gerhild Romberger (contralto)". The guide text therefore says "contralto" (TR "kontralto") where it used to say "mezzo-soprano" for Martha Lipton. Note: the Haitink entry (section 3) lists her as mezzo-soprano, as given for that release | booklet PDF (below); https://www.musicweb-international.com/classrev/2021/Mar/Mahler-sys-BPHR200361.htm | OK |
| Choirs | Damen des Rundfunkchors Berlin; Knaben des Staats- und Domchors Berlin | Spotify credits on V: "Damen des Rundfunkchors Berlin, Knaben des Staats- und Domchors Berlin". Booklet: chorus masters Tobias Löbner (women) and Kai-Uwe Jirka (boys) | embed ; booklet ; https://www.digitalconcerthall.com/en/concert/17015 | OK |
| Posthorn | Gábor Tarkövi | Booklet: "Posthornsolo · post-horn solo: Gábor Tarkövi" (not credited on Spotify) | booklet | OK |
| Label / catalogue | Berliner Philharmoniker Recordings, BPHR 20036 | From the box *The Symphonies of Gustav Mahler* (10 CD + 4 Blu-ray). Booklet: "BPHR 20036 · ℗ & © 2020 Berlin Phil Media GmbH". Retailers list the CD edition as BPHR 200361 | booklet ; https://www.berliner-philharmoniker-recordings.com/mahler-symphonies.html ; https://www.digitalconcerthall.com/en/edition/BPHR20036 | OK |
| Recorded / venue | 13 June 2014 (live), Philharmonie, Berlin | Booklet: "Recorded at the Philharmonie Berlin … Symphony No. 3: 13 June 2014". Digital Concert Hall: concert of June 2014 (Birtwistle, Mahler 3; same soloist and choirs). MusicWeb: "rec. 13 June 2014" | booklet ; Digital Concert Hall ; MusicWeb | OK |
| Release year / year | 2020 | ℗ & © 2020 (booklet and Spotify album page "© 2020 / ℗ 2020 Berlin Phil Media GmbH"). The box reached reviewers early 2021 (MusicWeb, March 2021). Spotify's `music:release_date` 2021-05-28 is the digital single-album edition | album page https://open.spotify.com/album/3XOFx2A5iGm3L99jxWPexS | OK |
| Spotify | https://open.spotify.com/album/3XOFx2A5iGm3L99jxWPexS | "Mahler: Symphony No. 3", album, 2021, 6 songs; every track `isPlayable: true` (`PLAYABLE`) from Turkey | embed + album page | VERIFIED |

Booklet source: the box's 128-page booklet as a PDF hosted by the retailer eClassical, https://eclassical.textalk.se/shop/17115/art19/5072519-3b10ba-4260716430003.pdf (credits p. 10, recording dates and ℗ line pp. 126–127). Its track list prints 33:34 / 09:57 / 17:48 / 09:18 / 04:18 / 24:21 (total 1:39:16); Spotify's last track is 24:23.

### Durations (Spotify embed, album 3XOFx2A5iGm3L99jxWPexS, read 2026-11-17)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Kräftig. Entschieden | 2014771 | 33:34 | true |
| 2 | II. Tempo di Menuetto. Sehr mäßig | 597567 | 9:57 | true |
| 3 | III. Comodo. Scherzando. Ohne Hast | 1068351 | 17:48 | true |
| 4 | IV. Sehr langsam. Misterioso. Durchaus ppp | 558028 | 9:18 | true |
| 5 | V. Lustig im Tempo und keck im Ausdruck | 258588 | 4:18 | true |
| 6 | VI. Langsam. Ruhevoll. Empfunden | 1463703 | 24:23 | true |
| | Total | 5961008 | 99:21 → `duration_min: 99` | |

Times are shown as Spotify displays them (whole seconds, not rounded up), which is also how the booklet prints the first five.

---

## 2. Also recommended (former reference): Bernstein / New York Philharmonic (Columbia, 1962)

Reference until 2026-11-17; the verification below is the original one. Re-checked 2026-11-17: embed still 6 tracks (33:19, 10:09, 17:58, 8:48, 4:12, 25:09 as Spotify displays them), all `isPlayable: true` from Turkey.

Why it was chosen: the album has **exactly six tracks, one per movement**, as the batch rules require. Several famous recordings are split into many tracks on Spotify and were rejected: Abbado / Vienna (DG, `2m4vL5luHiXfUbVi6l7CkL`, 24 tracks), Bernstein / New York 1987 (DG, `03IVjjnh2EontnNBxrNwyT`, 26 tracks), Tilson Thomas / LSO (`0BLllHbSpSYVtVJFJ1mKQM`, 24 tracks). Bernstein's 1961 recording, part of his Columbia Mahler cycle with the New York Philharmonic, is widely admired.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Leonard Bernstein / New York Philharmonic | Spotify credits on all six tracks | https://open.spotify.com/embed/album/4RvVQ968WriWyWv37Aa99q | OK |
| Mezzo-soprano | Martha Lipton | Spotify credits (IV, V); Discogs "Mezzo-soprano Vocals – Martha Lipton" | https://www.discogs.com/release/3508051 | OK |
| Choruses | Women's Chorus of the Schola Cantorum; Boys' Choir of the Church of the Transfiguration | Spotify credits (IV, V); Discogs (directors Hugh Ross, Stuart Gardner) | same ; https://www.discogs.com/release/12941843 | OK |
| Posthorn | John Ware | Discogs: "Horn [Posthorn Solo] – John Ware" (3508051); "Trumpet [Posthorn Solo] – John Ware" (12941843) | same | OK |
| Solo violin (not in yaml) | – | John Corigliano | Discogs 3508051 | OK |
| Label | Columbia Masterworks (now Sony Classical) | Original LP Columbia Masterworks M2S 675 (stereo), ML 5734–5 / M2L 275 (mono). Spotify album ℗ 2018 Sony Music Entertainment; track titles say "2009 Remastered Version" | https://www.discogs.com/release/3508051 ; album page | OK |
| Recorded / venue | 3 April 1961, Manhattan Center, New York | Sony box *The Complete Mahler Symphonies* (88697943332), CD 4–5 notes: "Original LP: ML 5735 / MS 6335, released March 1962. Recording: Manhattan Center, New York City, USA, April 3, 1961. Producer: John McClure" | https://www.discogs.com/release/6018496 | OK |
| Release year / year | 1962 | Same notes ("released March 1962"); Discogs 3508051 dated 1962 | same | OK |
| Spotify | https://open.spotify.com/album/4RvVQ968WriWyWv37Aa99q | "Mahler: Symphony No. 3 in D Minor", album, 2018, 6 songs; 185 markets including TR | embed + album page | VERIFIED |

Note: the box notes give two LP numbers for one release (ML 5735 / MS 6335, an internal Columbia numbering); the US stereo set is catalogued M2S 675. The guide gives "M2S 675 (LP)".

### Durations (Spotify embed, album 4RvVQ968WriWyWv37Aa99q)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Kräftig. Entschieden | 1999746 | 33:20 |
| 2 | II. Tempo di Menuetto | 609680 | 10:10 |
| 3 | III. Comodo. Scherzando. Ohne Hast | 1078933 | 17:59 |
| 4 | IV. Sehr langsam. Misterioso | 528306 | 8:48 |
| 5 | V. Lustig im Tempo und keck im Ausdruck | 252853 | 4:13 |
| 6 | VI. Langsam. Ruhevoll. Empfunden | 1509186 | 25:09 |
| | Total | 5978704 | 99:39 → `duration_min: 100` |

Discogs (3508051) side lengths 28:20 / 14:55 / 26:50 / 29:21 = 99:26, consistent.

---

## 3. Also recommended: Haitink / Bavarian Radio Symphony Orchestra (BR-Klassik, 2017)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Bernard Haitink; Symphonieorchester des Bayerischen Rundfunks; Gerhild Romberger (mezzo); Damenchor des BR; Augsburger Domsingknaben; posthorn Martin Angerer | https://www.discogs.com/release/16611495 ; Spotify credits | OK |
| Label / catalogue | BR-Klassik 900149 | Discogs | OK |
| Recorded | Live, Philharmonie im Gasteig, Munich, 15–17 June 2016 | Discogs notes | OK |
| Spotify | https://open.spotify.com/album/7aMeD7B1KCwvy1uRNwzyDD, © ℗ 2017 BR-Klassik, 6 tracks (35:49 / 10:06 / 17:53 / 9:34 / 4:26 / 23:40), 185 markets incl. TR | embed + album page | VERIFIED |

Re-checked 2026-11-17: 6 tracks, all `isPlayable: true` from Turkey.

---

## 4. Painting: Giovanni Segantini, *Spring in the Alps*, 1897

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Giovanni Segantini (Italian, 1858–1899) | Getty object page | OK |
| Title | *Spring in the Alps* (*Primavera sulle Alpi*) | https://www.getty.edu/art/collection/object/109PHC | OK |
| Date | 1897 | same | OK |
| Medium / size | Oil on canvas, 116 × 227 cm | same | OK |
| Collection | J. Paul Getty Museum, Los Angeles, accession 2019.3 | same | OK |
| Image | Getty Open Content, CC0 ("license": http://creativecommons.org/publicdomain/zero/1.0/ in the page data). IIIF image service e9fcad31-3ce6-45c2-91db-611ecdf14aea: full size **14389 × 7505** px. Full-size URL tested (HTTP 200): https://media.getty.edu/iiif/image/e9fcad31-3ce6-45c2-91db-611ecdf14aea/full/max/0/default.jpg. Commons mirror (smaller): File:Spring_in_the_Alps_by_Giovanni_Segantini.jpg, 3000 × 1565, {{PD-old-100}} | https://media.getty.edu/iiif/image/e9fcad31-3ce6-45c2-91db-611ecdf14aea/info.json | OK |
| Rights | Artist died 1899: public domain everywhere; image CC0 | – | OK |
| Pairing | Getty text: "a vivid hymn to the reawakening of nature in spring after a long, hard winter, a pantheistic work in which the landscape, the rural workers, and the animals evoke the cycle of nature". Mahler finished the symphony in 1896; the painting is dated 1897 | Getty page | OK |
| Format | Wide landscape (≈ 1.9:1) | – | – |

---

## 5. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Sketched from 1893, composed mainly 1895, final form 1896 | https://en.wikipedia.org/wiki/Symphony_No._3_(Mahler) | OK |
| Composed at Steinbach on Lake Attersee (Upper Austria), in a composing hut acquired 1893 | https://en.wikipedia.org/wiki/Gustav_Mahler ("In 1893 he acquired a retreat at Steinbach … composed his Second and Third Symphonies there"; "There is one composing hut at the Attersee") | OK |
| First complete performance 9 June 1902, Krefeld, Mahler conducting | Symphony No. 3 article (Premieres) ; Mahler article | OK |
| Longest symphony in the standard repertoire; first movement a little more than thirty minutes | Symphony No. 3 article | OK |
| The six programme titles; "Pan awakes", "Summer marches in (Bacchic procession)"; titles dropped before publication (1898) | same | OK |
| Opening: eight horns; similar in rhythm and contour to the main theme of the finale of Brahms's First | same | OK |
| Trombone solo; offstage snare drums before the horns return; tam-tam at the climax; brass fanfares and timpani at the end | same | OK |
| "Folgt eine lange Pause!" at the end of I in the manuscript copy (Morgan Library) | same | OK |
| II: graceful minuet, oboe solo, stormier episodes, ends with harp and glockenspiel | same | OK |
| III: quotes the song "Ablösung im Sommer"; offstage posthorn solo in the trio; posthorn interrupted by an Austrian military trumpet signal; reprise interrupted by the posthorn | same | OK |
| IV: alto (in the reference recording a contralto) sings Nietzsche's "Midnight Song" from *Also sprach Zarathustra*, "O Mensch! Gib acht!"; oboe glissandi as a night bird; last three movements linked | same | OK |
| V: "Es sungen drei Engel" (Wunderhorn); children's choir imitating bells, women's chorus, alto; sinister interlude with tam-tam and bells | same | OK |
| V: the alto's lines are the sinner's lament about the Ten Commandments | Text of "Es sungen drei Engel" (Wunderhorn) | OK (text) |
| VI: purely orchestral; failed climax, near silence, flute and piccolo over tremolo, hushed brass chorale (trumpets, trombones); ends with repeated D major chords with brass and timpani | same | OK |
| Keys: I D minor → F major; VI D major | same (Tonality) | OK |
| Keys of II–V (A major, C minor, D major, F major) | Standard listings; not in the Wikipedia article | SECONDARY |

Avoided on purpose: the anecdote that Mahler told Bruno Walter not to look at the mountains because he had "composed them all" (often repeated, not checked).

---

## 6. Re-time (Dudamel)

All stops stay estimates (≈); nobody has listened against the Dudamel tracks. The old stops were Abbado section times scaled to Bernstein 1961, and one of them was mapped to the wrong section (see I below). The new stops were **not** scaled from the old ones. Each was placed from the score's section boundaries as they fall in three real performances whose Spotify editions are split at the tempo markings (track lengths read from the embed pages on 2026-11-17):
- **A** = Abbado / Wiener Philharmoniker, DG, `2m4vL5luHiXfUbVi6l7CkL` (24 tracks; I 34:13, II 9:28, III 16:55, IV 10:43, VI 26:38).
- **M** = Tilson Thomas / LSO, `0BLllHbSpSYVtVJFJ1mKQM` (track titles give rehearsal figures; I 34:04, II 9:53, III 18:19, IV 10:11, VI 26:09).
- **B** = Bernstein / New York Philharmonic, DG 1987 live, `03IVjjnh2EontnNBxrNwyT` (26 tracks; I 34:45, II 10:37, III 18:33, IV 9:34, VI 28:01).

For each boundary the fraction of the movement at which it falls was averaged over the recordings that mark it and multiplied by Dudamel's track length, then rounded to 5 s. Events inside a section (with no boundary) were placed by their position within that section.

| Mvt | Track length | Old stops | New stops (≈) | How placed | Least certain |
| --- | --- | --- | --- | --- | --- |
| I Kräftig. Entschieden. | 33:34 | 0:00, 0:45, 4:00, 6:00, 7:00, 9:30, 14:00–20:00, 20:30, 23:30, Last minute | 0:00, 0:45, 3:50, 5:30, 7:00, 9:35, 14:25–20:15, 20:35, 28:30, Last minute | 0:45: end of the horn call (unchanged). 3:50: first trombone solo, inside the opening section that ends at B "Immer das gleiche Tempo" 5:41 (fraction 0.164 → 5:30). 5:30: that boundary, first signs of the march. 7:00: "Langsam. Schwer" A 7:02, M 7:09 (0.208 → 6:58). 9:35: fig. 18 "Tempo I" A 9:42, M 9:55, B 9:53 (0.286 → 9:37). 14:25–20:15: fig. 29 "A tempo" A 14:45, M 14:48, B 14:39 (0.429 → 14:24) up to just before fig. 43. 20:35: fig. 43 "Immer dasselbe Tempo (Marsch). Nicht eilen" A 20:54, M 21:10, B 21:04 (0.613 → 20:35). 28:30: the snare drums play alone for about 30 s (Wikipedia) before fig. 62 "Tempo I", where the eight horns return: A 29:18, M 29:25, B 29:51 (0.860 → 28:52) | 3:50 (no boundary marks the trombone solo); 28:30 (whether the track boundaries at fig. 62 fall on the snare drums or on the horns) |
| II Tempo di Menuetto | 9:57 | 0:00, 1:45, 3:20, 4:30, 7:00, Last seconds | 0:00, 2:00, 3:05, 4:10, 6:40, Last seconds | 2:00: B "L'istesso tempo" 2:13 (0.209 → 2:05), the change to the quicker episode. 3:05: fig. 6 "A tempo (wie im Anfang)" A 3:05, M 2:56, B 3:17 (0.311 → 3:06). 4:10: second episode, about a minute after the minuet's return, inside the section that runs to fig. 14. 6:40: fig. 14 "Ganz plötzlich gemächlich. Tempo di Menuetto" A 6:37, M 6:28, B 7:00 (0.671 → 6:41) | 4:10 (no boundary marks the second episode); 2:00 (only B marks it) |
| III Comodo. Scherzando. | 17:48 | 0:00, 2:45, 6:00, 8:30, 10:45, 13:50, Near the end, Last seconds | 0:00, 2:30, 5:25, 10:15, 10:35, 13:20, Near the end, Last seconds | 2:30: fig. 6 "Wieder sehr gemächlich, wie zu Anfang" A 2:34, M 2:22, B 2:42 (0.142 → 2:32). 5:25: fig. 14 "Sehr gemächlich" (posthorn) A 5:39, M 5:07, B 5:39 (0.306 → 5:27). 10:15 and 10:35: B starts a track "Schnell und schmetternd wie eine Fanfare" at 11:13 (0.605), where A and M start "Tempo I" (fig. 17) at 10:07 / 10:24 (0.598 / 0.568): the military trumpet signal (bar 345, Wikipedia) ends the posthorn trio and the scherzo returns right after it (average 0.590 → 10:30). The old 8:30 put the signal in the middle of the trio. 13:20: fig. 27 "Wieder sehr gemächlich, beinahe langsam" A 13:05, M 13:13, B 14:00 (0.750 → 13:21) | 2:30 (the stop describes a "second dance"; fig. 6 is a return to the opening tempo, so the new music may start a little before or after); 10:15 (signal vs return of the scherzo) |
| IV Sehr langsam. Misterioso. | 9:18 | 0:00, 0:40, 1:50, 4:30, 7:00, Last seconds | 0:00, 0:45, 1:55, 4:50, 7:25, Last seconds | Dudamel is slow here (9:18 against Bernstein 1961's 8:48; MusicWeb notes the "almost inaudible" opening), so 0:45 and 1:55 sit a little later. 4:50: "Più mosso subito" A 5:45, M 5:16, B 4:48 (0.519 → 4:50). 7:25: last line about 1:50 before the end of the track, as in the other recordings | 0:45 and 1:55 (no boundary; voice entry and first oboe glissando) |
| V Lustig im Tempo | 4:18 | 0:00, 0:15, 1:30, 2:00, 2:45, Last seconds | 0:00, 0:15, 1:30, 2:00, 2:45, Last seconds | Unchanged: the track is 5 s longer than Bernstein 1961's and none of the split editions divides this movement, so there is no better reference | 1:30 (alto entry) |
| VI Langsam. Ruhevoll. Empfunden. | 24:23 | 0:00, 4:10, 7:00, 11:00, 13:30, 15:00, 18:00, 21:30, Last 2 minutes | 0:00, 4:00, 7:05, 10:35, 13:40, 14:30, 17:25, 21:00, Last 2 minutes | 4:00: fig. 4 "Nicht mehr so breit" A 4:24, M 3:51, B 5:04 (0.164 → 4:01). 7:05: fig. 9 "Tempo I. Ruhevoll" A 7:32, M 7:16, B 8:41 (0.290 → 7:05). 10:35: fig. 14 "A tempo (Etwas bewegter)" A 11:33, M 11:08, B 12:26 (0.434 → 10:36). 14:30: fig. 21 "Tempo I" A 15:49, M 15:07, B 17:02 (0.593 → 14:28), the recovery after the near silence; the failed climax (13:40) is placed shortly before it. 17:25: fig. 25 "Langsam. Tempo I" A 19:02, M 18:16, B 20:20 (0.713 → 17:24). 21:00: brass statement of the theme, about 3:20 before the end of the track; the closing chords take the last two minutes | 13:40 (climax inside a section); 21:00 (summit inside the last section) |

Stops moved by 20 s or more: I 6:00→5:30 (30 s), 14:00–20:00→14:25–20:15 (25 s at the start), **23:30→28:30 (5 min)**; II 7:00→6:40 (20 s), 4:30→4:10 (20 s); III 6:00→5:25 (35 s), **8:30→10:15 (1:45)**, 13:50→13:20 (30 s); IV 4:30→4:50 (20 s), 7:00→7:25 (25 s); VI 11:00→10:35 (25 s), 15:00→14:30 (30 s), 18:00→17:25 (35 s), 21:30→21:00 (30 s). The two large moves correct section errors in the old times: the old I 23:30 put the snare drums and the recapitulation at the "Im alten Marschtempo (Allegro moderato)" boundary, which is still the development; the recapitulation (fig. 62) comes about 5 minutes before the end. The old III 8:30 put the trumpet signal in the middle of the posthorn trio; the split editions place it at the end of the trio.

Add or update these rows in `project-knowledge/content_status.md` › "Zamanlanacak duraklar" at merge time.
