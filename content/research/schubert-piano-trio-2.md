# Verification: Schubert – Piano Trio No. 2 in E-flat major, D. 929 (Op. 100)

Files: `content/drafts/en/schubert-piano-trio-2.md`, `content/drafts/tr/schubert-piano-trio-2.md`. Checked 2026-11-17 (batch BATCH-2026-11, group D).

**Method.** Spotify albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` ms, `isPlayable`) with curl from a Turkish network, plus the album page's `music:release_date` and ℗ line. Durations rounded to the nearest second.

---

## Reference recording: Beaux Arts Trio (Pressler, Cohen, Greenhouse), Philips 1984

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4m8CWc8ZLyyYwAOzNlHtzk | "Schubert: The Piano Trios (2 CDs)", 10 tracks, credits "Franz Schubert, Beaux Arts Trio"; D. 929 = tracks 6–9; Spotify date 1986-01-01, "℗ 1986 Universal International Music B.V." | https://open.spotify.com/embed/album/4m8CWc8ZLyyYwAOzNlHtzk | VERIFIED |
| Linked by label | – | Decca Classics product page "SCHUBERT Complete Piano Trios Beaux Arts Trio" links this album | https://www.deccaclassics.com/en/catalogue/products/schubert-complete-piano-trios-beaux-arts-trio-840 | OK |
| isPlayable | – | `true` for all tracks | embed | OK |
| Line-up | (yaml comment) Pressler, Cohen, Greenhouse | 1984 set: Menahem Pressler, Isidore Cohen, Bernard Greenhouse (Presto listing via search; the 1966 set had Daniel Guilet) | https://www.prestomusic.com/classical/products/7944099--schubert-the-piano-trios (403 to fetch; search summary) ; Wikipedia discography | OK |
| Label / cat. no. | Philips 412 620-2 | Gramophone: "412 620-2PH2" (two discs, both trios, Notturno, Sonatensatz); MusicWeb: "the 1984 Beaux Arts Trio set on Philips 412 620-2" | https://www.gramophone.co.uk/review/schubert-music-for-piano-trio-0 (search snippet); https://musicweb-international.com/classrev/2011/May11/Schubert_trios_NI6137.htm | OK |
| Recorded | 1984 | Presto: 8 June 1984, La Chaux-de-Fonds; another database: May 1984, Théâtre et Salle de musique, La Chaux-de-Fonds. Guide gives the year only | search summaries; AllMusic "Schubert: The Piano Trios [1984]" https://www.allmusic.com/album/schubert-the-piano-trios-1984--mw0001362217 | OK (year); month disputed |
| Venue | Salle de Musique, La Chaux-de-Fonds | as above | as above | OK (secondary) |
| Release year | 1986 | Spotify ℗ 1986 | embed/album page | OK (check against the original CD if a booklet turns up) |
| Finale version | published (cut) | Classical-music.com (N. Rast) praises the Beaux Arts account "without the additional music"; the track length fits: 748 bars (published) at ≈ 1.15 s per 6/8 bar = 860 s; the uncut finale with its repeat would need ≈ 1 000 bars | https://www.classical-music.com/reviews/chamber/schubert-281 | OK (inferred; confirm by ear: no Andante-theme counterpoint passage in the development) |
| Exposition repeat in I | taken | Inferred from the length (12:41 vs ≈ 9–10 min without repeat in similar tempos) | – | Check by ear |

### Durations (embed, album 4m8CWc8ZLyyYwAOzNlHtzk)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Allegro | 6 | 760 986 | 12:41 |
| II Andante con moto | 7 | 581 840 | 9:42 |
| III Scherzo (Allegro moderato – Trio) | 8 | 404 160 | 6:44 |
| IV Allegro moderato | 9 | 859 666 | 14:20 |
| Total | | 2 606 652 | 43 min (43:27) |

Spotify titles III "Scherzo"; Schubert's heading is *Scherzando* (Schiff, Henle HN 3225; Bärenreiter preface quotes Schubert calling it "the minuet"). The guide uses "Scherzando. Allegro moderato".

---

## Also recommended: Braley / R. Capuçon / G. Capuçon

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2jaiPyCpDiOR4lDOgT7b1L | "Schubert: Piano Trios Nos. 1 & 2 – Sonatensatz, D. 28 – Notturno, D. 897"; D. 929 = tracks 6–9 (910 626 / 523 440 / 371 360 / 771 533 ms), credits Renaud Capuçon, Gautier Capuçon, Frank Braley; all `isPlayable: true`; "℗ A Warner Classics/Erato release, ℗ 2007 Parlophone Records Limited" | embed; Warner page https://www.warnerclassics.com/release/schubert-piano-trios (links this album) | VERIFIED |
| Label / cat. no. | Virgin Classics, 365 476 2 | Originally Virgin Classics (NYPL record; Gramophone review); classical-music.com gives "365 4762"; barcode 0094636547657 | https://www.nypl.org/research/research-catalog/bib/b21887370 ; https://gramophone.co.uk/review/schubert-trios-for-piano-violin-and-violoncello | OK |
| Recorded / venue | 10–12 September 2006, MC2 Maison de la Culture, Grenoble | Presto: 10–12 September 2006, MC2 Grenoble; NYPL says September 2007, impossible for an album released 2 April 2007 (AllMusic) | search summaries | OK (2006) |

---

## Painting: Carl Johan Fahlcrantz, *A Town at Sunset*, 1833

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Carl Johan Fahlcrantz (1774–1861), *By ved solnedgang* / *A Town at Sunset*, 1833 | Commons (Wikidata Q55421722); Nasjonalmuseet NG.M.03491 | OK |
| Collection | Nasjonalmuseet for kunst, arkitektur og design, Oslo, NG.M.03491; oil on canvas | Commons categories; NG file name | OK |
| Image used | `File:Carl johan fahlcrantz, una cittadina al tramonto, 1833 (cropped).jpg`, 3443 × 2533, gallery photo by Sailko (Francesco Bini), photo licence CC BY-SA 4.0, artwork `PD-old-auto-expired` (deathyear 1861); frame cropped out | https://commons.wikimedia.org/wiki/File:Carl_johan_fahlcrantz,_una_cittadina_al_tramonto,_1833_(cropped).jpg | OK |
| Rights | Faithful photo of a 2D PD painting: no new right (EU DSM art. 14, US); same treatment as the Belvedere CC BY-SA photos already in `paintings.yaml` | – | OK |
| Museum's own scan | `File:Carl Johan Fahlcrantz - A Town at Sunset - NG.M.03491 - National Museum of Art, Architecture and Design.jpg` is only 964 × 714 | Commons | not used |
| Not already used | No Fahlcrantz in `content/paintings.yaml` | – | OK |

Why it fits: the slow movement's tune comes from the Swedish song *Se solen sjunker* ("See, the sun is sinking"); a Swedish painter's sunset, with a path and a bridge, from the same years (six years later). Mood: evening, farewell.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Title page "November 1827, Op. 100", one year before his death | András Schiff, preface to Henle facsimile HN 3225 (2013): https://www.henle.de/media/6a/95/1f/1697725905/3225-1697725905-sync.pdf | OK |
| Second of two trios (B-flat D. 898, E-flat D. 929); E-flat "highly dramatic … almost symphonic dimensions" | Schiff; Henle HN 3225 introduction | OK |
| Winterreise composed 1827 | Common knowledge (Part I February, Part II October 1827); Wikipedia *Winterreise* | OK |
| Andante based on *Se solen sjunker*, sung by tenor Isak Albert Berg at the Fröhlich sisters' house | Wikipedia, Piano Trio No. 2 (Schubert); Sussex programme note (C. Dixon) https://users.sussex.ac.uk/~cjd/WebProgNotes/pdfs/SchubertPianoTrioOp100.pdf ; Henle HN 3225 cites Willfort, "Das Urbild des Andante …" | OK |
| Cello takes the song's falling octave ("Farewell") at bar 13; octave fall also ends the movement | Sussex note | OK |
| Official premiere 26 March 1828, Schubert's only "Privatkonzert", Beethoven's death anniversary, hall of the Musikverein; Bocklet, Böhm, Linke; success | Henle HN 3225 introduction ("im ersten und einzigen ‚Privatkonzert' … am 26. März 1828 nach Beethovens Vorbild an dessen Sterbetag im Saal des Wiener Musikvereins"; "Carl Maria von Bocklet am Klavier, Joseph Michael Böhm an der Violine und Joseph Linke am Violoncello") | OK. Sussex and Wikipedia name Schuppanzigh as violinist; Henle (newer research) says Böhm. Guide follows Henle |
| Earlier private performances: Spaun's engagement party, 28 January 1828 | Wikipedia; Henle says it is still unclear which of the two trios was played there; the 26 December 1827 Schuppanzigh concert was the B-flat trio | Not in guide (disputed) |
| Press eclipsed by Paganini's appearance three days later | Henle HN 3225 ("Nicolò Paganini, dessen Auftritt drei Tage später alle anderen kulturellen Ereignisse in den Schatten stellte") | OK. Paganini's first Vienna concert was 29 March 1828 |
| Cuts in the finale (bars 358–407 and 463–513, plus the exposition repeat), marked by Schubert for Probst; "The cuts marked in the last piece are to be most strictly observed" | Bärenreiter preface (NSA) https://www.barenreiter.co.uk/prefaces/9790006472765_Innenansicht.pdf ; Schiff; Sussex ("748-bar form … no requested repeat of the first 230 bars and a further 90-odd bars cut") | OK |
| Published by Probst, Leipzig; announced in Vienna 11 December 1828; Schubert probably never saw a copy; died 19 November 1828 | Bärenreiter preface | OK |
| Dedication: "to no one, except those who find pleasure in it" (letter of 1 August 1828) | Henle HN 3225 introduction: „Dedicirt wird dieses Werk Niemanden außer jenen, die Gefallen daran finden." | OK |
| Theme 2 of I moves from E-flat minor to B minor; third theme in B-flat major | Search summary of a review (classical source quoted: "E-flat minor is almost miraculously transformed into B minor … the third takes up in the more conventional key of B-flat major"); Wikipedia (three themes) | OK (secondary) |
| Development of I built mainly on the last theme of the exposition; tripping crotchet-and-four-quavers figure; soft echo at the end | Wikipedia; Sussex ("a wistful off-stage echo of crotchet and four quavers") | OK |
| III begins as a canon, piano leading strings by a bar, then slides up a semitone to E major for a second canon | Sussex | OK |
| Schubert's tempo instructions: minuet moderate, always piano, trio forceful | Schubert to Probst, 10 May 1828, quoted in Bärenreiter preface | OK |
| IV: sonata-rondo; second theme shifts 6/8 → 2/2, rapid repeated quavers like a cimbalom; Andante theme returns twice | Sussex; Wikipedia ("in two interludes"); Henle (Swedish theme at bars 279 ff. and, in the uncut version, 477 ff.) | OK |
| One of the cut passages combines the Andante theme contrapuntally with finale material | Schiff ("The latter passage ingeniously combines the slow movement's main theme with two elements of the last movement"); Wikipedia | OK |
| *Barry Lyndon* (1975) | Wikipedia | OK |
| Beethoven as Schubert's "great idol" | Henle HN 3225 ("seines großen Idols Beethoven") | OK |

**Uncertain.** The second appearance of the Andante theme in the published finale (guide ≈ 12:50) is placed in the coda by inference from Sussex ("a further recurrence adds the cimbalon-style accompaniment") and Schiff (bar 819 "a rare glimpse of heaven"); its exact bar was not checked against a score.

---

## Re-time

No bar maps were available for I–III; positions come from section proportions. IV uses the published 748 bars (Sussex) at ≈ 1.15 s per bar: development at bar 231 (≈ 4:25), Andante theme at bar 279 (≈ 5:20, unaffected by the cuts, which start at 358), recapitulation after the development, which ends at original bar 538 → published ≈ 437 (≈ 8:25). Theme 2 at bar ≈ 75 is assumed.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 12:41 | 0:00, 0:30, 1:15, 2:10, 3:10, 6:20, 8:50, 11:50 | Whether the exposition repeat is taken (3:10 and everything after depends on it) |
| II | 9:42 | 0:00, 0:05, 1:50, 2:30, 4:30, 6:15, 8:40 | Climax (≈ 4:30) and the major-key episode (≈ 2:30) |
| III | 6:44 | 0:00, 0:40, 2:50, 4:45, near the end | Start of the trio (≈ 2:50; depends on repeats) |
| IV | 14:20 | 0:00, 1:25, 4:25, 5:20, 8:25, 12:50, near the end | Theme 2 (≈ 1:25) and the last return of the song (≈ 12:50) |
