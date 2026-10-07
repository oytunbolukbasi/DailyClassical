# Verification: Beethoven – Piano Sonata No. 8 in C minor, Op. 13 "Pathétique"

Piece id: `beethoven-piano-sonata-8` (form `piano-sonata`). First solo piece in the catalogue: performers are `soloists` only, no `conductor` / `orchestra`.
Files: `content/en/pieces/beethoven-piano-sonata-8.md`, `content/tr/pieces/beethoven-piano-sonata-8.md`. Shared-file additions (paintings.yaml entry, glossary rows): `content/research/beethoven-piano-sonata-8.shared.md`.
Checked on 2026-10-07.

**How the checks were done** (same method as `verification-1-5.md`)
- **Spotify:** album ids confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__` JSON: album name, every track title, performer credit, duration in ms). The album page's `og:title`, `og:description` and `music:release_date` were also read. Spotify's release date is the digital edition's, not the original release.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits and sleeve notes). Human-readable URLs below.
- **MusicBrainz:** `https://musicbrainz.org/ws/2/release/<id>?inc=recordings+recording-level-rels+place-rels+url-rels` (per-track "recorded at" place and date).
- **Score:** bar numbers come from Craig Sapp's Humdrum encoding of the sonata, https://github.com/craigsapp/beethoven-piano-sonatas (`kern/sonata08-1.krn`, `-2.krn`, `-3.krn`). Its bar numbering counts the first-movement first and second endings as separate bars, so from the development on it runs 2 higher than editions that number them 133a/133b.
- **Status key:** VERIFIED = seen in a primary source. INFERRED = derived, not seen directly. UNVERIFIED = could not be confirmed.

---

## 1. Reference recording: Daniel Barenboim (DG, 1983)

The product owner's link `https://open.spotify.com/album/4TCTWpN6Gwq2dA37rkwMX1` (tracking parameters stripped).

### Spotify embed check

Album name on Spotify: *Beethoven: Piano Sonatas Nos.8 "Moonlight", 14 "Appassionata" & 23 "Pathétique"*. **Spotify's album title scrambles the numbers and nicknames** (No. 8 is the "Pathétique", No. 14 the "Moonlight", No. 23 the "Appassionata"); the track titles are correct. `og:description`: "Ludwig van Beethoven · album · 1987 · 9 songs"; `music:release_date` 1987-01-01. Every track is credited "Ludwig van Beethoven, Daniel Barenboim".

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| 1–3 | Sonata No. 14 "Moonlight" I–III | 6:40 / 2:12 / 7:42 | 400200 / 132678 / 462533 |
| **4** | **Piano Sonata No. 8 in C Minor, Op. 13 "Pathétique": I. Grave - Allegro di molto e con brio** | **9:35** | 575000 |
| **5** | **… II. Adagio cantabile** | **5:23** | 323106 |
| **6** | **… III. Rondo. Allegro** | **4:50** | 290893 |
| 7–9 | Sonata No. 23 "Appassionata" I–III | 10:40 / 7:39 / 8:13 | 640906 / 459104 / 493960 |

Sonata total 19:48 → `duration_min: 20`. Status: VERIFIED.

### Which Barenboim recording?

Barenboim has recorded the sonata several times (Westminster 1958, EMI 1960s, DG 1980s, live Berlin 2005, and others). The Spotify album is the DG compilation **419 602-2** (1987): same title order (14, 8, 23), 9 tracks, 1987 date.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Daniel Barenboim | Daniel Barenboim | Spotify embed (above); https://www.discogs.com/release/12248671 | VERIFIED |
| Label / catalogue | Deutsche Grammophon, 419 602-2 (CD, with Sonatas Nos. 14 & 23) | DG 419 602-2 (CD, West Germany, 1987), barcode 0 28941 96022 1. Producer Steven Paul, recording supervisor Werner Mayer, balance engineer Klaus Scheibe | https://www.discogs.com/release/12248671 ; https://musicbrainz.org/release/7ad1f350-2854-3bba-9cd2-bd3701598cd6 | VERIFIED |
| Recorded | December 1983 | Sleeve: "Recorded: Paris, Mutualité, 5/1981 (Op. 57); 12/1983 (Opp. 13 & 27)". MusicBrainz: recorded at Maison de la Mutualité, 1983-12 | same two | VERIFIED |
| Venue | Maison de la Mutualité, Paris | Discogs company credit "Recorded At Salle de la Mutualité, Paris"; booklet "Paris, Mutualité"; MusicBrainz place "Maison de la Mutualité" (same building) | same two | VERIFIED |
| release_year / year | 1984 | Sleeve: "℗ 1984 Polydor International GmbH … All selections previously released". MusicBrainz: first release of this recording 1984, in the DG box *The Piano Sonatas Nos. 1–15* | https://musicbrainz.org/recording/6430813a-03e4-489b-8efc-9fd99939c6c1 | VERIFIED (original box catalogue number not recorded) |
| Spotify | 4TCTWpN6Gwq2dA37rkwMX1 | as above | embed page | VERIFIED |

**Durations, CD vs Spotify.** The 419 602-2 CD lengths (MusicBrainz) are 9:29 / 5:20 / 4:46; Spotify's are 9:35 / 5:23 / 4:50. The Moonlight and Appassionata tracks differ by the same few seconds, so this is the same recording with different track gaps. The guide's Movements table uses the Spotify times (guide rule §3.4). Where the extra 3–6 seconds sit (start or end of the track) is not known: one more reason to re-time the stops.

---

## 2. Also recommended

### Emil Gilels (DG, 1980)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Emil Gilels | Emil Gilels | https://www.discogs.com/release/4450906 | VERIFIED |
| Label / catalogue | DG, 2532 008 (LP); 400 036-2 (CD) | LP 2532 008 (1981, ℗ 1981 Polydor; digital recording). CD 400 036-2 (1983), "Previously released as 2532 008". Couplings: Op. 13, Op. 27 No. 1, Op. 27 No. 2. Producer Hanno Rinke, recording supervisor Werner Mayer, engineer Klaus Scheibe | https://www.discogs.com/release/3441146 ; https://www.discogs.com/release/4450906 | VERIFIED |
| Recorded / venue | September 1980, Jesus-Christus-Kirche, Berlin | MusicBrainz: recorded at Jesus-Christus-Kirche, 1980-09 (Op. 27 tracks dated 1980-09-09). A catalogue page (classite.com) gives 17 Sept 1980 | https://musicbrainz.org/release/750e7f5a-ab71-442a-a341-6add6970399c ; https://classite.com/disk/dgg-2532008-q82217/unique/58152 | VERIFIED (month); exact day UNVERIFIED |
| release_year / year | 1981 | ℗ 1981; LP 1981 | Discogs 3441146 | VERIFIED |
| Spotify | https://open.spotify.com/album/73KOojES6U1jObQdYuNORQ | Embed: *Beethoven: Piano Sonatas Nos.8 "Pathétique", 13 & 14 "Moonlight"*, 10 tracks, all credited "Ludwig van Beethoven, Emil Gilels"; Op. 13 = tracks 1–3, **9:05 / 5:48 / 5:04**. `music:release_date` 1981-01-01. Same album linked from MusicBrainz release 864c948b-0332-4bb4-a545-c79a62389def; Apple Music 1452515037 (℗ 1981 DG) matches | embed page | VERIFIED |

### Wilhelm Kempff (DG, 1965)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Wilhelm Kempff | Wilhelm Kempff (his stereo cycle; not the 1950s mono one) | https://www.discogs.com/release/3204738 | VERIFIED |
| Label / catalogue | DG, 139 300 (LP); 415 834-2 (CD) | Op. 13 "originally released on Deutsche Grammophon 139 300, 1965" (Discogs notes on 447 404-2). Spotify album = CD 415 834-2 (Op. 13, 27/2, 28, 78) | https://www.discogs.com/release/3204738 ; https://www.discogs.com/release/4912093 | VERIFIED |
| Recorded / venue | January 1965, Beethovensaal, Hanover | "Recordings: Hanover, Beethovensaal, 1/1965 (Nos. 8 & 14)" | https://www.discogs.com/release/3204738 | VERIFIED |
| release_year / year | 1965 | ℗ 1965 | same | VERIFIED |
| Spotify | https://open.spotify.com/album/7z9kHQBUKHO4UQ5ol9D4Ia | Embed: *Beethoven: Piano Sonatas Nos.8 "Pathétique", 14 "Moonlight", 15 "Pastorale" & 24*, 12 tracks credited "Ludwig van Beethoven, Wilhelm Kempff"; Op. 13 = tracks 1–3, **7:18 / 4:58 / 4:32**. Linked from MusicBrainz release 936f07f9-25aa-4dbc-9d6b-422adc8f76f5 (DG 415 834-2) | embed page | VERIFIED |

Neither alternative will match the reference stops: Gilels is 30 s faster in I and slower in II–III; Kempff's 7:18 first movement almost certainly leaves out the exposition repeat.

---

## 3. The exposition repeat in movement I (INFERRED)

The first movement's exposition carries a repeat. Most pianists go back to the start of the Allegro (bar 11); a few (András Schiff, reportedly Rudolf Serkin and Charles Rosen) go back to the Grave introduction (MusicWeb review of Schiff, https://www.musicweb-international.com/classrev/2006/May06/Beethoven_Schiff_ECM19424763100.htm). Barenboim's choice was not found stated anywhere, so it is inferred from durations:

| Recording | Movement I | Repeat (inferred from length, except Schiff) |
| --- | --- | --- |
| Barenboim, Westminster 1958 | 7:00 | none (by length) |
| Kempff, DG 1965 | 7:18 | none (by length) |
| Gilels, DG 1980 | 9:05 | Allegro only |
| Brendel, Philips (complete cycle, 1990s) | 9:22 | Allegro only |
| Arrau, Philips | 8:57–9:45 | Allegro only |
| Schiff, ECM 2006 | 10:16 | from the Grave (per the review) |
| **Barenboim, DG 1983** | **9:35 (CD 9:29)** | **Allegro only (inferred)** |

Durations for other recordings: MusicBrainz recording search (`https://musicbrainz.org/ws/2/recording/?query=…`) and the Spotify embeds above. A no-repeat reading would run about 7–7½ minutes; repeating the Grave as well would add another 1½–2 minutes on top of ~9:30. So the guide says Barenboim repeats from the start of the fast music, at ≈ 3:45. **Confirm by ear**: if the slow chords come back at ≈ 3:45, every later stop in movement I moves by about 1:45 and the "In this recording" note must change.

---

## 4. How the approximate stop times were derived

No listening was possible. Times come from the bar structure in the Humdrum score and the track lengths, assuming a steady tempo inside each section. All are marked ≈.

**I. Grave – Allegro (track 9:35).** Grave bars 1–10, *attacca* Allegro bar 11. Theme 2 (E-flat minor, hand crossing) bar 51; theme 3 (E-flat major) bar 89; codetta with the opening theme in E-flat bar 121; first ending 132–133, second ending 134. Grave returns bars 135–138 (G minor); development Allegro from bar 139 (E minor); dominant pedal on G with left-hand octaves bars 169–186; right-hand run down the keyboard, left hand silent, bars 189–196; recapitulation bar 197; theme 2 returns in F minor bar 223; Grave bars 297–300; final Allegro 301–312. Model: Grave introduction ≈ 1:45, each later Grave passage ≈ 25–30 s, Allegro bar ≈ 0.97 s (half note ≈ 124), exposition played twice (see §3).

**II. Adagio cantabile (track 5:23).** 73 bars of 2/4 at ≈ 4.4 s a bar. Theme bars 1–8, repeated an octave higher 9–16; first episode 17–28 (F minor → E-flat major, ends *pp*); theme 29–36; second episode 37–50 (A-flat minor, *pp*, triplet-sixteenth accompaniment; *sf* bar 42 and the turn to E major bars 42–47); theme with triplet accompaniment 51–58, an octave higher 59–66; coda 67–73.

**III. Rondo. Allegro (track 4:50).** 210 bars of 2/2 plus upbeat, ≈ 1.36 s a bar. Rondo theme bars 1–17; transition 18–24; first episode (E-flat major) 25–60, with triplet runs from 33 and loud descending runs 57–60; theme 62–78; middle episode (A-flat major, half-note lines in several voices) 79–106; G pedal and runs 107–120; theme 121–133; first episode in C major 134–170; theme 171–181; coda 182–210, with the soft A-flat major passage 202–206 and the final descending run 209 to the last chord 210.

---

## 5. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written mostly in 1798 (`year: 1798`) | Henle Urtext preface (Gertsch/Perahia, 2018): sketches for the finale among String Trio op. 9 jottings of mid 1797–mid 1798; "it is assumed today that the main work … was in fact completed by mid 1798". https://www.henle.de/media/fc/b2/b2/1697725861/1348-1697725860-sync.pdf . Beethoven-Haus gives the composition period as 1797–1799: https://www.beethoven.de/en/work/view/6166636289589248 | VERIFIED (1798 = main work; completion not dated exactly) |
| Beethoven in his late twenties, known in Vienna above all as a pianist | Born December 1770 (composers.yaml); composers.yaml bio ("made his name there as a ferocious pianist") | VERIFIED |
| Published at the end of 1799 | Henle preface: issued autumn 1799 by Hoffmeister, Vienna; *Wiener Zeitung* of 18 December [1799]: "just left the press". Beethoven-Haus first-edition record (C 13/75): Hoffmeister, 1799 | VERIFIED |
| Dedicated to Prince Karl Lichnowsky, one of his chief patrons | Beethoven-Haus work page: dedication "Karl Fürst von Lichnowsky"; patronage: https://en.wikipedia.org/wiki/Karl_Alois,_Prince_Lichnowsky | VERIFIED |
| First edition titled *Grande Sonate pathétique*; the title most likely came from Beethoven | Henle preface: "the 'Pathétique' is the only one that Beethoven himself gave a distinctive name" (besides *Les Adieux*). Beethoven-Haus: "titled 'Grande Sonate pathétiqu[e]' by Beethoven himself", one of two sonatas with an original nickname. **Disagreement:** Wikipedia (citing Burkhart, *Anthology for Musical Analysis*, 2004) and a dealer's listing (schubertiademusic.com) say the publisher chose it "to Beethoven's liking". The guide uses the cautious "most likely" | VERIFIED with caveat |
| Other sonata nicknames such as "Moonlight" were added later by others | Henle preface: "all of the other sobriquets such as 'Moonlight', 'Tempest', 'Pastoral' etc. were coined at a later date" | VERIFIED |
| "Pathétique" = full of pathos, passionate and grave | Henle preface ("pronounced passionate character", key associated with pathos; quotes AmZ review "noble melancholy") ; Beethoven-Haus (C minor as "sorrowful", "raging") | VERIFIED |
| Same word later given to Tchaikovsky's Sixth Symphony | `content/en/pieces/tchaikovsky-symphony-6.md` title; well established | VERIFIED |
| The slow opening breaks back into the fast music twice; a reviewer noticed in 1800 | Score: Grave bars 135–138 and 297–300. AmZ 2 (19 Feb 1800), col. 373 f.: "at times the Grave interrupts the fiery allegro" (quoted in the Henle preface). The 1807 review of the Leipzig edition: "The Grave returns within it with a few measures twice" | VERIFIED |
| Moscheles, aged ten, copied it out in 1804 because he could not afford it; teacher warned against "eccentric" music | Moscheles' own account in his edition of Schindler's *Life of Beethoven* (Project Gutenberg 39093): found the *Sonate pathétique* in the library, pocket money insufficient, copied it; his master warned him "not to play or study any eccentric productions". https://gutenberg.org/files/39093/39093-h/39093-h.htm . Moscheles born May 1794, so ten in 1804. Teacher: Dionys Weber (https://www.jewishencyclopedia.com/articles/11039) | VERIFIED |
| I: theme 2 in E-flat minor instead of the expected major; theme 3 in E-flat major; recap theme 2 in F minor | Wikipedia, movement I; score bars 51, 89, 223 | VERIFIED |
| I: development opens with the Grave in G minor, then E minor | Wikipedia; score bars 135 (G minor), 139 (no key signature, E minor) | VERIFIED |
| II: simple rondo; theme three times, always in A-flat major; episodes in F minor (→ E-flat) and A-flat minor | Wikipedia, movement II; score | VERIFIED |
| II: theme first heard around middle C, then an octave higher | Score bars 1 (melody starts on c', kern `c`) and 9 (`cc`) | VERIFIED |
| II: brief turn to E major | Score bars 42–47 (sharps, E-major chords; *sf* bar 42, *fp* bar 44) | VERIFIED (key name from the score; enharmonic spelling as written) |
| III: rondo episodes in E-flat major, A-flat major, C major | Wikipedia, movement III | VERIFIED |
| III: soft A-flat major passage before the final run | Score bars 202–206 (*p* → *pp*, A-flat bass), 209–210 | VERIFIED (that it is a "fragment of the tune" is our description) |
| Threads: Fifth Symphony also in C minor | `content/en/pieces/beethoven-symphony-5.md` | VERIFIED |
| Threads: sustain pedal lets the low notes ring in the Adagio | General piano technique; no claim about this pianist's pedalling | Descriptive, not recording-specific |
| In this recording: Barenboim repeats from the Allegro, not the Grave | §3 | INFERRED – confirm by ear |

Not used, because the sources are weak or speculative: the Mozart K. 457 and Bach Partita No. 2 models, and the claim that the Rondo theme copies the first movement's second theme (Wikipedia, unsourced). Billy Joel's "This Night" (1983) uses the Adagio melody (https://en.wikipedia.org/wiki/This_Night_(Billy_Joel_song)); left out as not needed.

---

## 6. Painting: Jacques-Louis David, *The Death of Socrates* (1787)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Jacques-Louis David (French, Paris 1748–1825 Brussels) | https://www.metmuseum.org/art/collection/search/436105 | VERIFIED |
| Title / date | *The Death of Socrates*, 1787 | Met API object 436105 (`https://collectionapi.metmuseum.org/public/collection/v1/objects/436105`) | VERIFIED |
| Collection | The Metropolitan Museum of Art, New York, 31.45. Catharine Lorillard Wolfe Collection, Wolfe Fund, 1931. Gallery 634 at time of check | same | VERIFIED |
| Medium / size | Oil on canvas, 129.5 × 196.2 cm (51 × 77¼ in.) | same | VERIFIED |
| Public domain | Artist died 1825. Met Open Access: `isPublicDomain: true` (CC0) | same | VERIFIED |
| Image | Met primary image `https://images.metmuseum.org/CRDImages/ep/original/DP-13139-001.jpg` (1,833,927 bytes). Same file on Commons, **4000 × 2663**, CC0: https://commons.wikimedia.org/wiki/File:The_Death_of_Socrates_MET_DP-13139-001.jpg | Commons API imageinfo | VERIFIED. Not NC. Other Commons files "The Death of Socrates MET 31.45 1/2.jpg" are larger but are frame details, not the painting |

**Pairing.** Socrates, sentenced to death, reaches for the hemlock cup with one hand and points upward with the other, still talking, while his disciples give way to grief. The scene stands for suffering met with composure, the "pathetic-sublime" ideal of the 1790s that the Henle preface ties to the sonata's title (Schiller's idea of suffering opposed by moral freedom). It is the decade before the sonata and Paris rather than Vienna; there is no direct link between the painting and Beethoven, and the pairing note does not claim one. Not previously used in `content/paintings.yaml`.

Alternatives considered: Pierre-Narcisse Guérin, *The Return of Marcus Sextus* (Louvre, 1799, an exact date match) was rejected because the largest public-domain Commons file is only 1988 × 1629, too small for the 1800 px hero.

---

## 7. Glossary

Existing terms reused: sonata form, exposition, development, recapitulation, coda, pedal note, rondo.
New terms (rows in the `.shared.md` file): **Tremolo**, **Cantabile**, **Sustain pedal**. Both guides were run through `parseContent` + `validateContent` (backend/src/content/parse.ts) together with the current glossaries plus these three rows: no problems reported; 11 / 8 / 9 stops per movement.

---

## 8. Re-time needed

All stops are approximate (≈), derived as in §4 against the Barenboim tracks on Spotify album `4TCTWpN6Gwq2dA37rkwMX1` (tracks 4–6). Re-time every one by ear. If the slow chords return at ≈ 3:45 in movement I (Grave included in the repeat), shift every later stop in I by about +1:45 and rewrite the "In this recording" note.

| Mvt | Track | Stops to re-time | Notes |
| --- | --- | --- | --- |
| I Grave – Allegro di molto e con brio | 4 (9:35) | 0:00, 1:45, 2:25, 3:00, 3:45, 5:45, 6:15, 6:40–7:05, 7:10, 8:45, 9:10 | Most sensitive: 1:45 (length of Barenboim's Grave), 3:45 (repeat), 5:45 (Grave return) |
| II Adagio cantabile | 5 (5:23) | 0:00, 0:35, 1:10, 2:05, 2:40, 3:00, 3:40, 4:50 | Assumes an even tempo; the second episode may be slower |
| III Rondo. Allegro | 6 (4:50) | 0:00, 0:33, 1:23, 1:45, 2:25, 3:00, 3:50, 4:30, 4:42 | Assumes an even tempo; the coda's soft passage (4:30) is probably slower |
