# Verification: Mozart – Piano Concerto No. 23 in A major, K. 488

Files checked: `content/en/pieces/mozart-piano-concerto-23.md`, `content/tr/pieces/mozart-piano-concerto-23.md`.
Checked on 2026-10-07.

**How the checks were done** (same method as `verification-1-5.md`)
- **Spotify:** each album ID was confirmed from Spotify's public embed page (`https://open.spotify.com/embed/album/<id>`), which lists every track with performer credits and exact duration in ms. The album page's `og:title`, `music:release_date` and ℗ line were also read. **VERIFIED** = album title, performers and every track seen in that data.
- **Discogs:** credits and booklet notes from the public Discogs API (`https://api.discogs.com/releases/<id>`); the URLs below are the human-readable pages.
- **Spotify `release_date`** is the digital edition's date, not the original release.
- **Status key:** OK = value confirmed. UNVERIFIED = could not be confirmed from a primary source.

---

## Reference recording: Barenboim / Berliner Philharmoniker (product owner's choice)

### Field check

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2sCnq47RrjWno99LheCwS5 | "Mozart: Klavierkonzerte Nos. 20, 21, 22 & 23", 12 tracks; every track credited "Wolfgang Amadeus Mozart, Daniel Barenboim, Berliner Philharmoniker". K. 488 = tracks 10–12. Spotify date 2024-02-15; ℗/© "A Warner Classics/Teldec release, ℗ 2024 Warner Music UK Limited" | https://open.spotify.com/embed/album/2sCnq47RrjWno99LheCwS5 ; https://open.spotify.com/album/2sCnq47RrjWno99LheCwS5 | VERIFIED |
| Soloist / director | Daniel Barenboim, piano; conductor Daniel Barenboim | Discogs credit "Conductor, Piano – Daniel Barenboim" (he directs from the keyboard) | https://www.discogs.com/release/14937339 ; https://www.discogs.com/release/12906004 | OK |
| Orchestra | Berliner Philharmoniker | Same | same | OK |
| Label | Teldec | Teldec Classics International GmbH; now Warner Classics/Teldec | https://www.discogs.com/release/14937339 | OK |
| Catalogue number | 9031-72024-2 | First issue of K. 488 in this recording: *Piano Concertos Nos. 20–27*, 4 CDs, Teldec 9031-72024-2 (1990; K. 488 on CD 2, tracks 4–6). Single CD with No. 22: Teldec 9031-75711-2 (Discogs dates it 1992). Nos. 20–23 two-CD reissues: 0630-18956-2 (Ultima, 1997), "85738 17892 2" as printed on Discogs (2000) | https://www.discogs.com/release/14937339 ; https://www.discogs.com/release/13655074 ; https://www.discogs.com/release/9328700 ; https://www.discogs.com/release/10053197 | OK |
| Recorded | January 1989 | "January 1989 (K482, K488, K537)" (Warner box booklet); "January 1989 (Nos. 22 & 23), Berlin" (Warner Japan WPCS-10821/2); Teldec Video LD: "January 1989 (K 482 & K 488)" | https://www.discogs.com/release/12906004 ; https://www.discogs.com/release/16652334 ; https://www.discogs.com/release/15603747 | OK |
| Venue | Siemensvilla, Berlin | "Siemensvilla, Berlin" (Warner box 2564 61919-2 recording details); "Recorded At Siemens Villa, Berlin" on 9031-72024-2 | https://www.discogs.com/release/12906004 ; https://www.discogs.com/release/14937339 | OK |
| Release year | 1990 | Box 9031-72024-2 is 1990; the Warner box lists the CD with K. 482/K. 488 as "℗ 1990 Teldec Classics". The Ultima reissue prints "℗ 1992" for its two CDs (mixed contents) | https://www.discogs.com/release/12906004 ; https://www.discogs.com/release/9328700 | OK (1990) |
| Producer / engineer | – | Recording producer Ulrich Kraus; engineer Wolfgang Meyscheider; executive producer Wolfgang Mohr | https://www.discogs.com/release/14937339 | for reference |
| Cadenza (I) | Mozart's own (written into the autograph score) | Not confirmed by ear. The Spotify/Teldec track titles do not name the cadenza. Barenboim is not known to use another cadenza for K. 488, and Mozart's is the standard choice, but **listen to confirm** | – | UNVERIFIED |

The concerto was also filmed in the same Siemensvilla sessions (Teldec Video 9031-73665-6, laserdisc "Volume Four"); its timings (11:35 / 7:23 / 8:11) are close to the audio but it is a separate product.

### Durations (source: Spotify embed, album 2sCnq47RrjWno99LheCwS5)

| Mvt | Spotify track | ms | Guide (Movements table) | CD timings (Discogs 9031-72024-2 / 2564 61919-2 / WPCS-10821/2) |
| --- | --- | --- | --- | --- |
| I Allegro | 10 | 702 173 | 11:42 | 11:27 / 11:27 / 11:31 |
| II Adagio (Spotify title: "Andante") | 11 | 441 173 | 7:21 | 7:22 / 7:21 / 7:22 |
| III Allegro assai | 12 | 494 080 | 8:14 | 8:12 / 8:11 / 8:11 |
| Total | | 1 637 426 | 27 min (27:17) | 27:05 |

**Two anomalies to check by ear**
1. Spotify's track 10 (I) is 11–15 s longer than every CD edition, while all other tracks on the album differ from the CDs by 0–4 s. This is probably extra silence at the start or the end of the track. If the silence is at the start, every stop in I shifts by up to +15 s.
2. Spotify titles the slow movement "II. Andante". Mozart's autograph, the NMA and all the Teldec CD issues say **Adagio** (András Schiff, Henle facsimile preface: "The tempo mark Adagio makes it a true slow movement"). The guide uses Adagio and says so in a note.

---

## Also recommended: Pollini / Böhm / Wiener Philharmoniker

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/6YeZPEQv2UuPexDhgPsPe2 | "Mozart: Piano Concertos Nos. 23 & 19", 6 tracks, credits "Wolfgang Amadeus Mozart, Maurizio Pollini, Wiener Philharmoniker, Karl Böhm"; K. 488 = tracks 1–3 (11:17 "1. Allegro – Cadenza: Mozart" / 7:17 / 8:11). Spotify date 1976-01-01, "℗ 1976 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/6YeZPEQv2UuPexDhgPsPe2 | VERIFIED |
| Label / cat. no. | Deutsche Grammophon, 2530 716 | DG LP 2530 716, ℗ 1976 Polydor International; producer Werner Mayer, engineer Günter Hermanns | https://www.discogs.com/release/4148909 | OK |
| Recorded / venue | April 1976, Großer Saal, Musikverein, Vienna | "Recording: Vienna, Musikverein, Großer Saal, 4/1976 … First released 1976: LP 2530 716" | https://www.discogs.com/release/13846152 | OK |
| Cadenza | – | Mozart's own (named in the Spotify track title) | embed page | OK |

Also on Spotify: a 2011 DG reissue of the same recording, https://open.spotify.com/album/5ewpPdleHCcf1OfZIBEsbd ("Mozart: Piano Concertos Nos.19, K.459 & 23, K.488", 11:16 / 7:17 / 8:03). Both Spotify links appear on DG's own product pages: https://www.deutschegrammophon.com/en/catalogue/products/mozart-klavierkonzerte-no-19-23-pollini-1550 and https://www.deutschegrammophon.com/en/catalogue/products/mozart-piano-concertos-19-23-pollini-5478. Use the first (original 1976 coupling).

---

## Painting: Thomas Gainsborough, *Mr and Mrs William Hallett ('The Morning Walk')*, 1785

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Thomas Gainsborough (1727–1788), *Mr and Mrs William Hallett ('The Morning Walk')* | https://www.nationalgallery.org.uk/paintings/thomas-gainsborough-mr-and-mrs-william-hallett-the-morning-walk | OK |
| Date | 1785 ("Date made 1785") | same | OK |
| Collection | National Gallery, London, NG6209; bought with a contribution from The Art Fund (Sir Robert Witt Fund), 1954; Room 34 at time of check | same | OK |
| Medium / size | Oil on canvas, 236.2 × 179.1 cm | same | OK |
| Pairing fact | NG provenance: "Commissioned by William Hallett (who paid Gainsborough £126 on 4 March 1786)". Mozart entered K. 488 in his catalogue on 2 March 1786 (Henle preface, below) | same | OK |
| Pairing fact | NG: painted "shortly before their marriage on 30 July 1785"; the style "draws on … Watteau and Van Dyck, and has a delicate poetic quality largely achieved through Gainsborough's light, feathery brushwork" | same | OK |
| Public domain | Artist died 1788. Commons tag `{{PD-Art|PD-old-100-1923}}` | https://commons.wikimedia.org/wiki/File:Thomas_Gainsborough_-_Mr_and_Mrs_William_Hallett_(%27The_Morning_Walk%27)_-_WGA8418.jpg | OK |
| Image | Commons file from the Web Gallery of Art (WGA 8418), 3235 × 4226 px, JPEG 2.38 MB; Special:FilePath resolves (HTTP 200, image/jpeg). Portrait format (≈ 0.77:1): plan the crop | same | OK |
| Not NC | Licence is PD-Art, no NC terms. A CC BY 3.0 gallery photo also exists (File:Thomas gainsborough, mr e mrs william hallett (la passeggiata mattutina), 1785, 01.jpg, 3096 × 3912), not used | Commons API | OK |
| Not already used | Not in `content/paintings.yaml` (checked 2026-10-07) | – | OK |

Why it fits: the same months as the concerto (paid for two days after Mozart finished it), the same galant elegance on the surface, and the darker woodland behind the couple, which matches Steinberg's description of the concerto's "melancholy that will cast fleeting shadows throughout".

---

## Big picture and movement facts

| Claim in the guide | Source | Status |
| --- | --- | --- |
| Entered in Mozart's own catalogue on 2 March 1786, during work on *Figaro* (Oct 1785 – Apr 1786) | Henle preface (E.-G. Heinemann, 2006), HN 767: https://www.henle.de/media/c8/54/d4/1690886049/0767-1690886049-sync.pdf ; Wikipedia: https://en.wikipedia.org/wiki/Piano_Concerto_No._23_(Mozart) | OK |
| Middle of three concertos that winter: K. 482 (16 Dec 1785), K. 488, K. 491 (24 Mar 1786) | Henle preface; Steinberg (BSO): https://bso.org/works/piano-concerto-no-23-in-a-k-488 | OK |
| "Probably" played by Mozart at a Lent 1786 subscription concert | Henle: "Although contemporary evidence is lacking, we may safely assume that Mozart played the A-major Concerto at one of the subscription concerts that he organized for the Lenten season in 1786." Guide says "probably" | OK (cautious wording) |
| Begun about 1784 (paper study); oboes crossed out and replaced by clarinets | Henle: "the first four bifolia belong to a paper type that Mozart used in or around that year [1784] … he crossed out the already notated oboes and replaced them with clarinets" | OK |
| Orchestra: 1 flute, 2 clarinets, 2 bassoons, 2 horns, strings; no trumpets or drums | Steinberg (BSO); Wikipedia | OK |
| Cadenza written into the score, against Mozart's habit | Henle: "Mozart integrated the cadenza directly into the musical text instead of writing it down on loose leaves, as was his usual habit"; Schiff (Henle facsimile HN 3216): "Mozart has provided us with his own original cadenza" https://www.henle.de/media/e1/2c/ce/1697725916/3216-1697725916-sync.pdf | OK |
| Adagio in F-sharp minor, Mozart's only movement in that key | Wikipedia, citing Antony Hopkins, *Talking About Concertos* (1964), p. 30. Schiff: "the relatively rare parallel key of F-sharp minor" | OK (one secondary source; guide wording "the only movement Mozart wrote in that key") |
| Schiff calls the Adagio one of the most sorrowful pieces Mozart wrote | Schiff: "This Adagio is one of the most touching, profound, and sorrowful that Mozart ever wrote" | OK (attributed) |
| Adagio is a rare marking for Mozart's concerto slow movements | Schiff: "most of Mozart's middle movements are marked Andante, Larghetto, Allegretto"; Steinberg: "An 'adagio' marking is rare, too" | OK |
| I: double exposition; piano enters alone with Theme 1 (bar 67) | Schiff: main theme "stated by the strings alone; then, in bars 9 to 12, we hear it in the winds; finally, the piano repeats it in solitude after the orchestral exposition (bars 67ff.)"; Wikipedia | OK |
| I: second chord clouded; Theme 2 begins in strings, bassoon joins after nine bars, then flute; in the solo exposition the piano starts Theme 2 and hands it to violins, bassoon and flute, adding quiet broken octaves | Steinberg (BSO) | OK |
| I: new theme withheld from the orchestral exposition, first heard in the solo exposition (1st violins, bars 143–149), and the basis of the development | Wikipedia ("the previously unheard third theme"); Ithaca College theme sheet https://musictech.ithaca.edu/IPWASite/IPWA/day27/K488Themes.pdf ; study cards https://brainscape.com/flashcards/mozart-concerto-k488-movement-1-8860110/packs/15259598 (development built on theme "1E"; recap at bar 198) | OK (bar numbers from teaching sources) |
| I: orchestra alone closes after the cadenza | Standard for Mozart concertos (SFCM lecture: "The orchestra finishes alone", https://sfcm.edu/sites/default/files/sfcm-theory/analysis_lectures/21_concerto/concerto.pdf); not checked against the K. 488 score | Check by ear |
| II: siciliano rhythm; piano begins alone; wide leaps | Wikipedia; Steinberg ("transformation of the siciliano style"); Schiff ("Its siciliano rhythm") | OK |
| II: orchestra's answer with dissonances from the bassoon imitating clarinet and violins | Steinberg | OK |
| II: brighter A-major middle section announced by flute and clarinet | Wikipedia (citing Girdlestone 1964, pp. 375–376); Schiff ("consolation in the clarinets") | OK |
| II: coda from bar 84, violins arco, low strings pizzicato; older editions had all strings pizzicato | Schiff, Henle facsimile preface | OK |
| III: sonata-rondo; piano states the theme alone (bars 1–8), orchestra repeats it (9–16) and continues to a general pause (bar 61); piano's own new theme at 62 with clarinets at 70–73; second theme in E minor in flute and bassoon (106), piano turns to C major and back; refrain at 202 turns to F-sharp minor; episode in F-sharp minor (230), winds alone answer; D-major tune in the winds with piano (262), then piano (270); return of the piano's theme in A (312) before the final refrain (441); 524 bars | I. Foulias, analysis of K. 488/III, University of Athens course notes (2019): https://eclass.uoa.gr/modules/document/file.php/MUSIC293/%CE%A6%CE%AC%CE%BA%CE%B5%CE%BB%CE%BF%CF%82%20%CE%B5%CE%BD%CE%B4%CE%B5%CE%B9%CE%BA%CF%84%CE%B9%CE%BA%CF%8E%CE%BD%20%CE%B1%CE%BD%CE%B1%CE%BB%CF%8D%CF%83%CE%B5%CF%89%CE%BD/KV%20488.pdf | OK |
| III: F-sharp minor episode interrupted by a clarinet tune in D major; opera-buffa scene changes | Wikipedia, citing Girdlestone 1964, pp. 384–386 | OK |
| Not used | Wikipedia's claim that the Adagio's middle section is reused in *Don Giovanni* (Girdlestone) and Steinberg's link to Osmin's aria in *Die Entführung* were left out: single sources, not needed for listening | – |

---

## Re-time needed

None of the stops was timed by ear. They were derived from the track durations and bar positions, assuming a steady tempo:
I: 687 s of music (the CD timing; see anomaly 1), ≈ 313 bars (assumed) + ≈ 50 s cadenza → ≈ 2.04 s per bar. II: 441 s, ≈ 99 bars (assumed) → ≈ 4.45 s per bar. III: 494 s / 524 bars → ≈ 0.94 s per bar.
Bar numbers marked * are assumed, not taken from a source; re-check those first.

| Mvt | Stop in guide | Basis | Note |
| --- | --- | --- | --- |
| I | ≈ 0:00 | bar 1 | Check for lead-in silence (anomaly 1) |
| I | ≈ 0:35 | bar 19 (first tutti) | |
| I | ≈ 1:00 | bar 31 (Theme 2) | |
| I | ≈ 2:15 | bar 67 (piano enters) | |
| I | ≈ 3:20 | bar ≈ 99* (Theme 2 in the piano, E major) | |
| I | ≈ 4:50 | bar 143 (new theme) | |
| I | Mid-development | bars ≈ 149–197 | No time given |
| I | ≈ 6:40 | bar 198 (recapitulation) | |
| I | ≈ 10:00–10:50 | cadenza after bar ≈ 297* | Range is a guess; time it exactly, and confirm the cadenza is Mozart's |
| I | Near the end | closing tutti | Confirm the piano is silent |
| II | ≈ 0:00 | bar 1 | |
| II | ≈ 0:50 | bar ≈ 12* (orchestra enters) | |
| II | ≈ 2:30 | bar ≈ 35* (A-major middle section) | |
| II | ≈ 3:50 | bar ≈ 53* (return of the opening) | |
| II | ≈ 6:05 | bar 84 (coda) | |
| III | ≈ 0:00 | bar 1 | |
| III | ≈ 0:08 | bar 9 | |
| III | ≈ 1:00 | bar 62 | |
| III | ≈ 1:40 | bar 106 | |
| III | ≈ 3:10 | bar 202 | |
| III | ≈ 3:35 | bar 230 | |
| III | ≈ 4:05 | bar 262 | |
| III | ≈ 4:55 | bar 312 | |
| III | ≈ 6:55 | bar 441 | |
| III | Near the end | bars ≈ 514–524 | |

Ready-to-paste rows for `content/research/retime-needed.md` are in `mozart-piano-concerto-23.shared.md`.

## Open items

1. Re-time every stop above against the Barenboim tracks (Spotify 2sCnq47RrjWno99LheCwS5, tracks 10–12).
2. Confirm by ear that Barenboim plays Mozart's own cadenza in I (the guide's stop says so).
3. Find where the extra 11–15 s in Spotify's track 10 sits.
