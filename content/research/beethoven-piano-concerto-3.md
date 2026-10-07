# Verification: Beethoven – Piano Concerto No. 3 in C minor, Op. 37

Files: `content/en/pieces/beethoven-piano-concerto-3.md`, `content/tr/pieces/beethoven-piano-concerto-3.md`.
Checked on 2026-10-07.

**How the checks were done**
- **Spotify:** every album ID was confirmed by downloading Spotify's public embed page (`https://open.spotify.com/embed/album/<id>`), which lists each track with performer credits and exact duration (ms). Album `og:title` and `music:release_date` were read from the album page (crawler user agent). **VERIFIED** = album title, soloist, conductor, orchestra and every track seen in that data.
- **Discogs:** credits and booklet notes from the public API (`https://api.discogs.com/releases/<id>`, `/masters/<id>`). The URLs below are the human-readable pages.
- **MusicBrainz:** release `78a920c3-fb6f-4717-8f86-09d004485f9b` (barcode 028946364925) used as a cross-check for recording dates and venue.
- **Spotify release date** is the digital edition's, not the original release.
- **Status key:** OK = value confirmed. UNVERIFIED = could not be confirmed from a primary source.

---

## Reference recording: Richter / Wiener Symphoniker / Sanderling (DG, 1962)

### Field check

| Field | Value in file | Source URL | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7b75e8aayuYU0sTYjnfFTl – "Mozart: Piano Concerto K. 466 / Beethoven: Piano Concerto No. 3; Rondo WoO. 6", compilation by Sviatoslav Richter, 7 tracks, Spotify date 2001-01-01 | embed page | VERIFIED |
| Which tracks | Tracks 4–6 are Op. 37 (credited "Ludwig van Beethoven, Sviatoslav Richter, Wiener Symphoniker, Kurt Sanderling"). Tracks 1–3 are Mozart K. 466 (Richter / Warsaw National Philharmonic / Wisłocki, 1959); track 7 is the Rondo WoO 6 (Richter / Sanderling) | embed page | VERIFIED |
| Soloist / conductor / orchestra | Sviatoslav Richter (piano), Kurt Sanderling, Wiener Symphoniker | embed page; https://www.discogs.com/master/358252 | OK |
| Label | Deutsche Grammophon | https://www.discogs.com/master/358252 | OK |
| Catalogue number | Original LP: SLPM 138 848 (stereo) / LPM 18 848 (mono), 1963. The Spotify album is the CD *The Originals* 463 649-2 (barcode 028946364925, released 2 Jul 2001) | https://www.discogs.com/master/358252 ; https://www.discogs.com/release/14446779 ; https://www.deutschegrammophon.com/en/catalogue/products/sviatoslav-richter-mozart-beethoven-7689 | OK |
| Recorded | September 1962 ("Recording: Vienna, Musikverein, Großer Saal, 9/1962"; CD booklet: "Wien, Musikverein, Grosser Saal, 9/1962"). No day given in any source found | https://www.discogs.com/master/358252 ; https://www.discogs.com/release/14446779 ; MusicBrainz (1962-09, Großer Musikvereinssaal) | OK (month only) |
| Venue | Musikverein, Großer Saal, Vienna | same | OK |
| Release year | 1963 (Discogs master: "(P) 1963 … First released 3/1963") | https://www.discogs.com/master/358252 | OK |
| Production | Producer Hans Weber; balance engineer Heinz Wildhagen (CD credits) | https://www.discogs.com/release/14446779 | OK (not in the yaml) |
| Cadenza (I) | Not documented. Spotify track titles name cadenzas for the Mozart concerto (Beethoven, WoO 58) but not for Op. 37; the Discogs notes and DG page say nothing. Richter very probably plays Beethoven's own cadenza (almost universal practice), but this is not confirmed, so the guide does not name the cadenza's author | – | UNVERIFIED |
| Earlier Richter/Sanderling Op. 37 | Live, Moscow, 22 March 1952, Moscow Youth Symphony Orchestra / Kurt Sanderling (used in "In this recording") | https://www.musicweb-international.com/classrev/2013/Mar13/Beethoven_Richter_94399p.htm | OK |

### Durations (source: Spotify embed, album 7b75e8aayuYU0sTYjnfFTl)

| Mvt | Track | ms | Duration in file |
| --- | --- | --- | --- |
| I Allegro con brio | 4 | 1 042 800 | 17:22 |
| II Largo | 5 | 601 800 | 10:01 |
| III Rondo (Allegro) | 6 | 526 386 | 8:46 |
| Total | | 2 170 986 | 36:11 → `duration_min: 36` |

Discogs gives 36:03 for the whole concerto on CD 463 649-2; MusicBrainz track lengths are 17:15 / 10:01 / 8:49. The Spotify times are used (they are what the app plays).

---

## Also recommended

| Field | Value in file | Source URL | Status |
| --- | --- | --- | --- |
| Uchida – Spotify | https://open.spotify.com/album/3TId6n2z9GSufAwpXKbw9W – "Beethoven: Piano Concertos Nos. 3 & 4", Mitsuko Uchida / Royal Concertgebouw Orchestra / Kurt Sanderling, Spotify date 1996-02-02. Op. 37 = tracks 1–3: 17:33 / 10:28 / 9:13 | embed page | VERIFIED |
| Uchida – label, cat. no. | Philips 446 082-2 | https://www.discogs.com/release/8120010 | OK |
| Uchida – recorded | "Concertgebouw, Amsterdam, 11/1994" (No. 4 is the live one; No. 3 is not marked live). ℗ 1996 | https://www.discogs.com/release/8120010 | OK |
| Bezuidenhout – Spotify | https://open.spotify.com/album/2MkvfnbfQFVudozSxqJUB8 – "Beethoven: Piano Concertos Nos. 1 & 3", Kristian Bezuidenhout / Freiburger Barockorchester / Pablo Heras-Casado, Spotify date 2022-04-15. Op. 37 = tracks 1–3: 16:39 / 8:31 / 9:29 | embed page | VERIFIED |
| Bezuidenhout – label, cat. no. | harmonia mundi HMM 902412, released April 2022 | https://www.harmoniamundi.com/wp-content/uploads/pdf/piano-concertos-3-HMM902412-en.pdf | OK |
| Bezuidenhout – recorded | "Enregistrement : décembre 2017, Ensemblehaus Freiburg, Freiburg im Breisgau". Fortepiano: copy after Conrad Graf (1824) by Rodney Regier (1989). Cadenza in I: "Bezuidenhout/Beethoven" | https://www.harmoniamundi.com/wp-content/uploads/2022/12/2412_digitalbooklet.pdf | OK |

Not used: https://open.spotify.com/album/6yrmsnaFoj5wqcpVpuZRmm is Pollini / Wiener Philharmoniker / Böhm (DG), not Uchida, although a search result labelled it as the Uchida album.

---

## Painting: Martin von Molitor, *Landscape with Hammer Mill* (*Landschaft mit Hammerwerk*), c. 1800

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Martin von Molitor (1759 Vienna – 1812 Vienna) | https://sammlung.belvedere.at/objects/11978/landschaft-mit-hammerwerk | OK |
| Date | c. 1800 (Commons/Wikidata: 1800) | same; https://www.wikidata.org/wiki/Q28009587 | OK |
| Medium, size | Oil on canvas, 113 × 150 cm | Belvedere page | OK |
| Collection | Österreichische Galerie Belvedere, Vienna, inv. 9694 | Belvedere page | OK |
| Museum description | A composed "heroic landscape", not a topographical view, with an industrial hammer mill as its focal point and small, finely dressed walkers on a bridge in the foreground | Belvedere page | OK |
| Image | Commons, 3508 × 2679 px, from the Belvedere's digital collection | https://commons.wikimedia.org/wiki/File:Martin_von_Molitor_-_Landschaft_mit_Hammerwerk_-_9694_-_%C3%96sterreichische_Galerie_Belvedere.jpg | OK |
| Licence | Commons template `{{Licensed-PD-Art|PD-old-auto-1923|cc-by-sa-4.0|deathyear=1812}}`: the painting is public domain (artist died 1812); the photograph is also released CC BY-SA 4.0 for jurisdictions that protect such photos. Not NC | Commons file page (wikitext) | OK |
| Rights caveat | The Belvedere's current object page says its downloads are for "private and scientific use", commercial use by permission. That conflicts with the CC BY-SA 4.0 release recorded on Commons. Faithful photos of 2D public-domain works are not protected in the EU (DSM Directive art. 14, transposed in Austria in 2021) or the US. Low risk; the credit line names the Belvedere and the CC BY-SA option to be safe | Belvedere page; Commons | Low risk, noted |

**Why this painting.** Painted in Vienna around 1800, the year Beethoven probably meant to premiere the concerto; it shows a forge glowing in a dark valley with its water-driven hammer, under a sky opening into light. The hammer's beat answers the concerto's knocking rhythm and the kettledrum idea of 1796; the dark-to-light sky answers the C minor to C major journey. Deliberately not a stormy or moonlit scene, so it does not overlap with the other Beethoven piece being prepared in parallel (Sonata No. 8, "Pathétique").

---

## Big-picture and movement facts

| Claim in the guide | Source | Status |
| --- | --- | --- |
| First idea noted in 1796, during the concert tour that took Beethoven to Berlin ("Zum Concert aus C moll pauke bej der Cadent" – "kettledrum at the cadenza") | Henle preface (H.-W. Küthen), HN 9435: https://www.henle.de/media/8c/ce/b4/1690899703/9435-1690899703-sync.pdf ; also HN 435: https://www.henle.de/media/95/19/74/1690886068/0435-1690886068-sync.pdf ; Beethoven-Haus: https://www.beethoven.de/en/work/view/5024416815644672/Concerto%20no.%203%20for%20piano%20and%20orchestra%20(C%20minor)%20op.%2037 | OK. Henle says "perhaps after a concert at the Berlin court in May or June"; the guide says only "on a concert tour that took him to Berlin" |
| Probably meant for his benefit concert of 2 April 1800, but not ready (Op. 15 played instead) | Henle prefaces ("there is reason to surmise"; supported by paper dating) | OK, worded "probably" |
| Premiere 5 April 1803, Theater an der Wien, Beethoven soloist; same concert: Second Symphony and *Christus am Ölberge* | Henle HN 9435 preface ("premiere in the Theater an der Wien on 5 April 1803"); Beethoven-Haus work page; https://en.wikipedia.org/wiki/Piano_Concerto_No._3_(Beethoven) ; https://research.allclassical.org/?p=2346 (adds the First Symphony) | OK |
| Solo part not fully written out; Seyfried's page-turning recollection ("almost nothing but empty pages … a few Egyptian hieroglyphs … he played nearly all the solo part from memory") | Wikipedia (quoting Seyfried, via Thayer); Henle preface: solo part "far from being completely notated for both hands", "Beethoven improvised much of this part"; https://www.hollywoodbowl.com/musicdb/pieces/2773/piano-concerto-no-3-in-c-minor-op-37 | OK. Told as Seyfried's later recollection |
| Beethoven's only piano concerto in a minor key | The five concertos are in C, B-flat, C minor, G, E-flat: https://en.wikipedia.org/wiki/Piano_concertos_(Beethoven) | OK |
| Link to Mozart's C minor Concerto K. 491 | Hollywood Bowl note ("particular awareness of Mozart's Piano Concerto K. 491 in the same key"); Wikipedia (first theme "reminiscent" of K. 491). The Cramer "we shall never be able to do anything like that" story (Aspen note) is not used | OK, cautious wording ("owes something to") |
| Timpani with piano after the cadenza, playing the main theme's rhythm, very soft | Aspen Music Festival note ("a pianissimo statement of the original knocking motive, at last in the timpani"): https://www.aspenmusicfestival.com/program_notes/view/beethoven-piano-concerto-no.-3-in-c-minor-op.-37 ; Budapest Philharmonic note ("after the cadenza, the pianist doesn't drop out … against the timpani playing part of the main theme"): https://www.filharmonikusok.hu/en/?p=91546 | OK |
| Orchestral exposition first, piano enters with rising scales; second theme in E-flat major; development opens with the piano's scales in D major | Wikipedia; search summaries of https://sin80.com/en/work/beethoven-piano-concerto-3-op37 ; Aspen note (second theme in E-flat) | OK (D major from the sin80 summary and score knowledge) |
| Largo in E major, "unusually remote" from C minor | Wikipedia; https://riphil.org/blog/the-story-behind-beethoven-s-piano-concerto-no-3 ("Beethoven has jumped to a remote key") | OK |
| Largo middle section: piano accompanies flute and bassoon | riphil.org note ("having the solo instrument accompany instruments of the orchestra, here the flute and bassoon") | OK |
| Largo ends with a single loud chord after a soft coda | Budapest Philharmonic note ("cut short by a single fortissimo chord") | OK |
| G-sharp / A-flat hinge between Largo and Rondo | Budapest Philharmonic note ("emphasises this pitch both at the end of the second movement and at the beginning of the third"); Aspen note; riphil.org | OK |
| Rondo: clarinet episode followed by a fugal passage; brief cadenza; Presto coda in 6/8, C major | https://www.musicprogramnotes.com/beethoven-piano-concerto-no-3-c-minor-op-37/ ; Wikipedia ("Rondo. Allegro – Presto", C major coda); Aspen ("an unexpected 6/8 transformation" in the major) | OK |
| Rondo episode keys (episode 1 in E-flat major, later in C major; clarinet episode in A-flat major); the theme drifting toward E major after the fugato | Score knowledge; Aspen note supports the "momentary" recall of the Largo's key in the finale | Keys not confirmed by a cited web source: check against the score when re-timing |
| Dedication to Prince Louis Ferdinand of Prussia; first edition Bureau des Arts et d'Industrie, Vienna, 1804 (November 1804 per Henle); Ries played it on 19 July 1804 | Beethoven-Haus work page; Henle preface | OK (not used in the guide) |
| Movement metres: I 4/4 (C), II 3/8, III 2/4 then 6/8 | Score (IMSLP: https://imslp.org/wiki/Piano_Concerto_No.3,_Op.37_(Beethoven,_Ludwig_van)) | OK |

---

## Re-time needed

None of the stops were measured against the recording. All are estimates from the track durations (17:22, 10:01, 8:46) and the movement's structure, assuming a steady tempo (first movement ≈ 1.8 s per bar, about 503 bars plus a cadenza of roughly two minutes; piano entry at bar 111, development ≈ bar 227, recapitulation ≈ bar 310, cadenza at bar 416). Every one must be checked by ear against Spotify album `7b75e8aayuYU0sTYjnfFTl`, tracks 4–6.

| Mvt | Stop in file | What to find |
| --- | --- | --- |
| I | ≈ 0:30 | First loud orchestral tutti |
| I | ≈ 1:30 | Theme 2 (E-flat major, violins and clarinets) in the orchestral exposition |
| I | ≈ 3:20 | Piano's entry (three rising scales) |
| I | ≈ 5:00 | Theme 2 in the piano |
| I | ≈ 6:50 | Start of the development (piano scales in D major) |
| I | ≈ 9:20 | Recapitulation (theme loud in full orchestra) |
| I | ≈ 12:40–14:50 | Cadenza: start (orchestra's held chord) and end |
| I | ≈ 14:50 | Coda: first soft timpani strokes |
| II | ≈ 1:20 | Orchestra's first entry after the piano solo |
| II | ≈ 2:40 | Piano's decorated return |
| II | ≈ 4:10 | Middle section: flute and bassoon over piano arpeggios |
| II | ≈ 6:00 | Return of the opening melody |
| II | ≈ 8:15 | Short cadenza |
| III | ≈ 0:20 | Orchestra takes up the rondo theme |
| III | ≈ 1:00 | Episode 1 (E-flat major) |
| III | ≈ 2:00 | Rondo theme returns |
| III | ≈ 2:45 | Clarinet episode |
| III | ≈ 3:40 | Fugato in the strings |
| III | ≈ 5:20 | Episode 1 returns in C major |
| III | ≈ 7:30 | Presto 6/8 coda |

The ≈ 0:00 stops are safe. The untimed stops ("Last minute", "Near the end", "After the fugato", "Last seconds") can be given times once the others are measured.
