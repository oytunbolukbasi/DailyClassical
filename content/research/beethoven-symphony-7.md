# Verification: Beethoven – Symphony No. 7 in A major, Op. 92

Piece id `beethoven-symphony-7`. Checked on 2026-10-10 (batch October 2026, group A).
Files: `content/en/pieces/beethoven-symphony-7.md`, `content/tr/pieces/beethoven-symphony-7.md`.
Shared-file additions: `content/research/beethoven-symphony-7.shared.md`.

**How the checks were done:** as in `beethoven-symphony-3.md`. Status key: OK / SECONDARY / UNVERIFIED / INFERRED.

---

## 1. Reference recording: Carlos Kleiber / Wiener Philharmoniker (DG, 1976)

The same Spotify album as the reference for `beethoven-symphony-5` (DG Originals 447 400-2, *Symphonies Nos. 5 & 7*). The Seventh is **tracks 5–8**; the app's stop times are measured from the start of each of those tracks.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2aNAica8UZ1gPub5p1UYUe | "Beethoven: Symphonies Nos.5 & 7", 8 tracks; tracks 5–8 = Op. 92, credited "Ludwig van Beethoven, Wiener Philharmoniker, Carlos Kleiber" | https://open.spotify.com/embed/album/2aNAica8UZ1gPub5p1UYUe | VERIFIED |
| Conductor / orchestra | Carlos Kleiber / Wiener Philharmoniker | Same | same ; https://www.discogs.com/release/1089282 | OK |
| Catalogue | 2530 706 (LP); 447 400-2 (CD, with Symphony No. 5) | LP 2530 706 (1976); CD 447 400-2 released 20 Feb 1995, "Originally released on LP: … Symphonie Nr. 7 as Deutsche Grammophon 2530 706, 1976" | https://www.discogs.com/master/781405 ; https://www.discogs.com/release/1089282 | OK |
| Recorded | 26–29 November 1975 & 16 January 1976 | LP notes: "Recording 26–29 November 1975 and 16 January 1976 at Musikvereinssaal, Vienna". CD notes: "11/1975 and 1/1976 (No.7)" | https://www.discogs.com/release/2829319 ; https://www.discogs.com/release/1089282 | OK |
| Venue | Musikverein, Vienna | Musikvereinssaal, Vienna | same | OK |
| Release year | 1976 | ℗ 1976 (No. 7) | Discogs 1089282 | OK |
| Production (not in yaml) | – | Producer Hans Hirsch; recording supervisor Hans Weber; Tonmeister Klaus Scheibe | https://www.discogs.com/release/2829319 | OK |
| Repeats (In this recording) | "He takes the repeats in the first and last movements" | I: intro 62 bars + *Vivace* 388 bars; with the exposition repeat the timing (13:36) fits a *Vivace* close to Beethoven's dotted-crotchet 104; without it the track would be about 11 minutes. IV: 465 bars at minim 72 ≈ 6:30 without the repeat, ≈ 8:15 with it; the track is 8:36 | timings | INFERRED (confirm by ear) |

### Durations (source: Spotify embed, album 2aNAica8UZ1gPub5p1UYUe)

| Track | Movement | ms | Time in file |
| --- | --- | --- | --- |
| 5 | 1. Poco sostenuto – Vivace | 816 000 | 13:36 |
| 6 | 2. Allegretto | 489 000 | 8:09 |
| 7 | 3. Presto – Assai meno presto | 495 000 | 8:15 |
| 8 | 4. Allegro con brio | 516 000 | 8:36 |
| | Total | 2 316 000 | 38:36 → `duration_min: 39` |

Side note for the coordinator: on the same album track 4 (Symphony No. 5, IV) is 650 533 ms = 10:50.5; `beethoven-symphony-5.md` shows 10:51. Not changed (not our file).

---

## 2. Also recommended: Karajan / Berliner Philharmoniker (DG, 1977 cycle)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | https://open.spotify.com/album/5lXOHIU4lA0OS37dZPppus | "Beethoven: Symphonies Nos.2 & 7", 8 tracks; tracks 5–8 = Op. 92 (11:36 / 8:02 / 7:22 / 6:28), BPO / Karajan. Link from DG's page | embed page ; https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphonien-2-7-karajan-539 | VERIFIED |
| Catalogue | 419 050-2 (CD, with Symphony No. 2) | Galleria CD 419 050-2 (Aug 1987), UPC 028941905024, "℗ 1977", ADD | https://www.discogs.com/release/1045079 | OK |
| Recorded / venue | "1975–77", Philharmonie, Berlin | Cycle range from the Discogs master of the Eroica LP ("Recorded 1975–1977, Berlin, Philharmonie"); no session date for No. 7 found | https://www.discogs.com/master/164209 | OK as a range |

Note: DG also lists *Symphonien 4 + 7* (Karajan Gold 439 003-2, Spotify 1BXXuzfggap7qi7v6Ufqq8), which is the 1983 digital recording. Not used. A contrasting non-Karajan alternative (e.g. Kleiber's 1982 live Bavarian State Orchestra recording on Orfeo) could not be confirmed on Spotify before the web-search budget ran out.

---

## 3. Painting: Pieter Bruegel the Elder, *The Peasant Dance*, c. 1568

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Pieter Bruegel the Elder (c. 1525–1569) | Commons ; Wikidata Q95562 | OK |
| Title / date | *The Peasant Dance* (*Bauerntanz*), c. 1568 | Commons file page (`{{circa|1568}}`) ; Wikidata | OK |
| Medium, size | Oil on oak panel, 114 × 164 cm | Commons ; Wikidata | OK |
| Collection | Kunsthistorisches Museum, Vienna, Gemäldegalerie, GG 1059. Commons object history: in the Vienna Neue Burg by the 1610s; moved from the Schatzkammer to the gallery in 1748 (not used in the guide) | https://www.khm.at/objektdb/detail/331/ (KHM online 331, cited on Commons) | OK |
| What is in the picture | Checked visually: a bagpiper at the centre left, couples dancing and stamping, a tavern table, a church behind | image | OK |
| Rights | Artist died 1569: public domain. `{{PD-Art|PD-old-100-1923}}` | https://commons.wikimedia.org/wiki/File:Pieter_Bruegel_d._%C3%84._014.jpg | OK |
| Image | First choice for the pipeline: File:Pieter_Bruegel_d._Ä._014.jpg, 3570 × 2458 (Yorck Project scan). A far larger scan exists, File:The_Peasant_Dance_(Bruegel).jpg, 41 945 × 29 385, 233 MB (from the *Inside Bruegel* project, PD-Art): too large to download routinely, but a downscaled copy via `Special:FilePath/…?width=6000` would be sharper | Commons | OK |
| Not reused | Bruegel has no painting in `content/paintings.yaml`; no other group had chosen it (checked 2026-10-10) | – | OK |

**Why this painting.** Wagner's phrase "the apotheosis of the dance" is the best-known description of the symphony. Bruegel's villagers stamp and spin to a bagpipe, whose drone matches the long held notes under the Seventh's dances (the repeated E before the *Vivace*, the violins' held A in the trio, the ground bass of the codas). The painting has been in Vienna, where the symphony was first performed, since the early seventeenth century. The pairing is about mood and idea; no historical link is claimed.

---

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 1811–12, partly at the Bohemian spa of Teplitz ("while improving his health") | https://en.wikipedia.org/wiki/Symphony_No._7_(Beethoven) | OK ("partly" is the cautious reading) |
| Dedicated to Count Moritz von Fries | same | OK |
| Premiere 8 December 1813, Vienna (University hall), Beethoven conducting, charity concert for soldiers wounded at the Battle of Hanau; *Wellington's Victory* on the same programme | same | OK |
| Battle of Leipzig 16–19 October 1813, so the premiere came "weeks after" it | https://en.wikipedia.org/wiki/Battle_of_Leipzig (general history; not re-fetched) | OK |
| Orchestra included Spohr, Hummel, Meyerbeer, Salieri | same | OK |
| Allegretto encored at the premiere; Beethoven called the work "one of my best" | same | OK |
| Wagner: "apotheosis of the dance" | same | OK |
| I: long introduction (*Poco sostenuto*) with long ascending scales, episodes in C major and F major; transition by more than sixty repetitions of E (Wikipedia: "no fewer than sixty-one") | same | OK |
| I: *Vivace* dominated by dotted rhythm; development opens in C major; coda with a two-bar motif repeated ten times over a four-octave pedal E | same | OK |
| II: A minor; ostinato rhythm (crotchet, two quavers, two crotchets) in violas and cellos; layering with a countermelody; A major section with clarinets over violin triplets; fugato | same | OK |
| II: opens and closes on the same held woodwind chord (A minor 6/4) | Score, bars 1–2 and the last bars | SECONDARY (score) |
| III: scherzo in F major; trio in D major "based on an Austrian pilgrims' hymn"; trio played twice | same | OK (the hymn source told as "said to be") |
| III: violins hold a high A through the trio; ends with a fragment of the trio cut off by loud chords | Score | SECONDARY (score) |
| IV: sonata form; *fff* in the coda, rare in Beethoven; "Bacchic fury" (Tovey); theme related to Beethoven's Irish song arrangement WoO 154 No. 8 (not used) | same | OK |
| IV: off-beat accents; bass ostinato in the coda | Score | SECONDARY (score) |

Not used, on purpose: the claim that Weber called Beethoven "ripe for the madhouse" (Wikipedia: probably Schindler's invention).

---

## 5. Re-time needed (all stops ≈; from bar numbers, metronome marks and the Spotify track lengths. Nobody has listened against the Kleiber tracks yet)

Reference: Kleiber / VPO, Spotify `2aNAica8UZ1gPub5p1UYUe`, tracks 5–8 (times are from the start of each track).

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I | 13:36 | 0:00, 1:15, 2:25, 3:00, 3:35, 4:05, 5:45, 7:55, 9:55, 12:05, Last 30 seconds | The length of the introduction (Kleiber's *Poco sostenuto* tempo sets every later stop; ≈ 3:35 for the *Vivace* is an estimate) and the repeat (≈ 5:45) |
| II Allegretto | 8:09 | 0:00, 0:05, 0:45, 1:30, 2:10, 3:00, 4:25, 5:20, 6:35, Last minute | A uniform 1.76 s per bar was assumed; check the A major section (≈ 3:00) and the fugato (≈ 5:20) |
| III Presto | 8:15 | 0:00, 2:15, 3:00, 3:50, 5:00, 6:35, Last 30 seconds | All the section boundaries; they depend on which internal repeats Kleiber takes in the scherzo |
| IV | 8:36 | 0:00, 0:45, 1:50, 3:35, 4:55, 6:35, Last minute | Theme 2 (≈ 0:45) and the start of the coda (≈ 6:35) |

---

## 6. Open items

1. Re-time by ear; confirm the repeats in I and IV.
2. Score-based details marked SECONDARY were checked from memory of the score, not from a fetched page.
3. A non-Karajan alternative would give more contrast (the Pastoral and Seventh alternatives both come from Karajan's 1975–77 cycle, the same cycle as the Eroica reference).
