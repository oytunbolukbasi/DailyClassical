# Verification: Mendelssohn – The Hebrides (Fingal's Cave), Op. 26

Files: `content/drafts/en/mendelssohn-hebrides-overture.md`, `content/drafts/tr/mendelssohn-hebrides-overture.md`. Checked 2026-11-17 (batch BATCH-2026-11, group D).

**Method.** Spotify albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from a Turkish network; album page `music:release_date` and ℗ line read too.

**Recording choice.** Peter Maag's 1960 LSO/Decca recording was the first choice, but no Spotify album id could be found for it (Deezer has it as *The Peter Maag Edition – Volume 9*, UPC 028948426577, Deezer album 208344732; the song.link lookup returned nothing). Abbado/LSO (DG) was taken instead. Group E's `mendelssohn-symphony-3` may well use Maag.

---

## Reference recording: Abbado / London Symphony Orchestra, DG

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/641f61jKbTKyIPudb6NyeM | "Mendelssohn: Overtures", track 7 "The Hebrides (Fingal's Cave), Op.26, MWV P 7", one track, 622 506 ms, credits "Felix Mendelssohn, London Symphony Orchestra, Claudio Abbado"; Spotify date 1985-01-01, "℗ 1985 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/641f61jKbTKyIPudb6NyeM | VERIFIED |
| Linked by label | – | DG product page "MENDELSSOHN Overtures / Abbado" (Ouvertüren: Sommernachtstraum, Melusine, Hebriden, Ruy Blas, Meeresstille, Trompeten-Ouvertüre; CD release 20 January 1988; UPC 00028942310421 = 423 104-2) links this album | https://www.deutschegrammophon.com/en/catalogue/products/mendelssohn-overtures-abbado-1095 | OK |
| isPlayable | – | `true` | embed | OK |
| One track | – | yes | embed | OK |
| Cat. no. | 423 104-2 | DG page UPC; Gramophone 423 104-1GH/-4GH; MusicWeb DG 423 104-2 | https://www.gramophone.co.uk/review/mendelssohn-overtures-1 ; https://musicwebinternational.com/?p=67717 | OK |
| Recorded / venue | February 1985, Walthamstow Assembly Hall | MusicFactsDB: Hebrides, Abbado/LSO, February 1985, Walthamstow Assembly Hall, first released September 1985, 10:24, engineers Klaus Hiemann and Hans-Rudolf Müller. MusicWeb: overtures recorded 1984–86, "four different London locations" | https://musicfactsdb.com/Recording/Index/2268909 | OK (single source; yaml comment says so) |
| Release year | 1985 | Spotify ℗ 1985; MusicFactsDB first release September 1985 | as above | OK |
| Abbado and the LSO | principal conductor in the mid-1980s; complete Mendelssohn symphonies and overtures for DG | Abbado was principal conductor of the LSO 1979–1987 (Wikipedia, Claudio Abbado); DG "5 Symphonies / 7 Overtures" set https://www.deutschegrammophon.com/en/catalogue/products/mendelssohn-5-symphonies-abbado-5316 | OK |

### Duration

| Track | ms | Guide |
| --- | --- | --- |
| 7 The Hebrides | 622 506 | 10:23 (duration_min 10) |

---

## Also recommended: Haitink / London Philharmonic Orchestra

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4ntFDiYBOXpZR8agXlbLDG | "Mendelssohn: Symphonies Nos.3 & 4; Hebrides Overture", track 1 "The Hebrides Overture, Op. 26 'Fingal's Cave'", 607 400 ms, credits LPO, Bernard Haitink; playable; "℗ This Compilation ℗ 2000 Universal International Music B.V." | embed; DG/Decca page (13 September 2000, Decca, UPC 00028946818725) https://www.deutschegrammophon.com/en/catalogue/products/mendelssohn-symphonies-nos-3-4-2450 | VERIFIED |
| Recorded / venue | null | Presto lists other Haitink/LPO Mendelssohn sessions at Walthamstow Assembly Hall, 30 November 1978; the Hebrides session was not found. `year: 1979` is an approximation for the Philips sessions (1978–79) | search summary | UNVERIFIED (flag: replace `year` if the booklet date turns up) |

---

## Painting: J. M. W. Turner, *Staffa, Fingal's Cave*, 1831–32

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | J. M. W. Turner (1775–1851), *Staffa, Fingal's Cave*, 1831–32, exhibited at the Royal Academy 1832 | YCBA record (tms:5018) via search; Wikidata Q23758119; Wikipedia "Staffa, Fingal's Cave" | OK |
| Collection | Yale Center for British Art, Paul Mellon Collection, B1978.43.14; oil on canvas, 90.8 × 121.3 cm; YCBA marks it Public Domain | https://collections.britishart.yale.edu/catalog/tms:5018 (Cloudflare challenge to curl; details from search snippets and Wikidata) | OK |
| Turner's visit | Turner visited Staffa in 1831 | YCBA / Yale "Turner in Scotland" https://artandmusic.yale.edu/romantic-landscapes/turner-scotland | OK |
| Image | `File:Joseph Mallord William Turner - Staffa, Fingal's Cave - Google Art Project.jpg`, 5259 × 3889, public domain | https://commons.wikimedia.org/wiki/File:Joseph_Mallord_William_Turner_-_Staffa,_Fingal%27s_Cave_-_Google_Art_Project.jpg | OK |
| Not already used | This painting is not in `content/paintings.yaml`. Turner is (two works: *Snow Storm – Hannibal*, *Sun Rising through Vapour*); the brief allows another work by an artist already used when it is clearly the best match: same island and cave, painted two years after Mendelssohn's visit, shown in London in the year of the overture's London premiere | – | OK (flag at merge) |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Walking tour of Scotland with Carl Klingemann, August 1829; arrived at Tobermory, Mull, evening of 7 August; letter "On one of the Hebrides" with the first 21 bars and orchestration indications; opening almost unchanged in the final work | Bärenreiter Urtext preface/introduction (2004), BA 9790006522835: https://www.barenreiter.co.uk/prefaces/9790006522835_Innenansicht.pdf | OK |
| Quote "how extraordinarily the Hebrides have affected me" | same (translation as printed there); Wikipedia gives "affected me" in a similar translation | OK (short quote) |
| Staffa visit on 8 August; Mendelssohn seasick; Klingemann's description of the cave as the inside of an immense organ, roaring waves | Bärenreiter (Klingemann's letter of 10 August, paraphrased in the guide) | OK |
| Opening theme conceived before seeing Fingal's Cave | Bärenreiter: "certainly the opening theme was conceived before the travellers saw Fingal's Cave" | OK |
| Mendelssohn aged twenty (born 3 February 1809) | composers.yaml / Wikipedia | OK |
| First version finished in Rome, 16 December 1830, as *Die einsame Insel* | Bärenreiter (Rome version, score inscribed "Rome, Dec. 16, 1830"); Wikipedia | OK |
| London premiere 14 May 1832 (Philharmonic Society, Thomas Attwood) | Bärenreiter; Wikipedia | OK |
| Published 1833–35 (piano duet 1833, parts 1834, score 1835); *The Hebrides* on the parts, *Fingal's Cave* on the score | Bärenreiter ("in 1834 in parts and in 1835 in full score"); Wikipedia | OK |
| Concert overture, not attached to a play or opera; "some consider it an early tone poem" | Wikipedia | OK |
| Wagner: "a landscape painter of the first order" | Wikipedia | OK (attributed) |
| Theme 1 in violas, cellos and bassoons; scoring 2 fl, 2 ob, 2 cl, 2 bn, 2 hn, 2 tpt, timp, strings | Wikipedia; Bärenreiter (orchestra list) | OK |
| Theme 2 in D major, cellos and bassoons | Standard analysis; not checked bar by bar | Check |
| Recapitulation: second theme in the clarinets; coda *Animato*; late clarinet echo of the second theme; pizzicato and fragments of the opening at the end | From general knowledge of the score; not checked against a score here | Check by ear (least certain facts in the guide) |
| *Scottish* Symphony first idea on the same 1829 trip, finished 1842 | Wikipedia (Hebrides background: "where he began work on his Symphony No. 3"); Symphony No. 3 completed 1842 | OK |
| Revisions 1830–32 | Bärenreiter (Rome version 1830, London version 1832, final revision by 20 June 1832 per Wikipedia) | OK |

---

## Re-time

No bar map. Stops placed by assumed bar positions (about 268 bars) at ≈ 2.32 s per bar for Abbado's 10:23: second theme bar ≈ 47, end of exposition ≈ 77, development ≈ 96, storm ≈ 150, recapitulation ≈ 180, second theme ≈ 200, coda ≈ 217, clarinet echo ≈ 246. All bar positions are assumptions.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 10:23 | 0:00, 0:35, 1:45, 2:55, 3:40, 5:00, 6:55, 7:40, 8:20, 9:30, near the end | Recapitulation (≈ 6:55) and coda (≈ 8:20); confirm the clarinet entries |
