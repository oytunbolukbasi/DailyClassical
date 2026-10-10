# Verification: Schubert – Piano Sonata No. 21 in B-flat major, D. 960

Piece id: `schubert-piano-sonata-21` (form `piano-sonata`). Performers: `soloists` only.
Files: `content/en/pieces/schubert-piano-sonata-21.md`, `content/tr/pieces/schubert-piano-sonata-21.md`. Shared-file additions: `content/research/schubert-piano-sonata-21.shared.md`.
Checked on 2026-10-10 (batch BATCH-2026-10, group E).

**How the checks were done** (same method as `beethoven-piano-sonata-8.md`)
- **Spotify:** embed page `https://open.spotify.com/embed/album/<id>` and album-page meta tags.
- **Discogs:** public API `https://api.discogs.com/releases/<id>`. **MusicBrainz:** `https://musicbrainz.org/ws/2/url?resource=<spotify url>&inc=release-rels` and `…/release/<id>?inc=recordings+recording-level-rels+place-rels+url-rels`.
- **Facts:** Wikipedia, *Schubert's last sonatas* (https://en.wikipedia.org/wiki/Schubert%27s_last_sonatas; sources include Brendel, Fisk, Schiff), which has a section on D. 960 with bar references.
- **Stop times:** no timed guide for this recording was available. Estimates from bar structure and track lengths (§3). All marked ≈.
- **Privacy:** generic `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`; no personal data sent.

---

## 1. Reference recording: Mitsuko Uchida (Philips, 1997)

### Spotify embed check

`https://open.spotify.com/album/4X32yxTPmTbd7i03gfiSZN`, *Schubert: Piano Sonata D. 960; 3 Klavierstücke D. 946*; `og:description` "Franz Schubert · album · 1998 · 7 songs"; `music:release_date` 1998-01-01.

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| **1** | **Piano Sonata No. 21 in B-Flat Major, D. 960: I. Molto moderato** – Mitsuko Uchida | **22:02** | 1322426 |
| **2** | **… II. Andante sostenuto** | **10:46** | 646000 |
| **3** | **… III. Scherzo. Allegro vivace con delicatezza** | **3:59** | 239000 |
| **4** | **… IV. Allegro ma non troppo – Presto** | **8:02** | 482000 |
| 5–7 | 3 Klavierstücke D. 946 | 9:43 / 10:35 / 5:55 | – |

Total 44:49 → `duration_min: 45`. One track per movement. Status: VERIFIED.

### Field check

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Mitsuko Uchida | Mitsuko Uchida (Steinway 1962) | https://www.discogs.com/release/2575644 | VERIFIED |
| Label / catalogue | Philips, 456 572-2 (CD, with 3 Klavierstücke D. 946) | Philips 289 456 572-2 (US issue of 456 572-2), barcode 0 28945 65722 6; producer Erik Smith, balance engineer Onno Scholtze. MusicBrainz release 602d621f-73e7-47e2-a5a8-55d7512a179f links this Spotify album (barcode 00028945657226, now under Decca) | https://www.discogs.com/release/2575644 ; https://musicbrainz.org/release/602d621f-73e7-47e2-a5a8-55d7512a179f | VERIFIED |
| Recorded / venue | May 1997, Musikverein, Vienna | "Recorded • Aufnahme • Enregistrement: Musikverein, Wien, 5/1997"; MusicBrainz: recorded at Wiener Musikverein 1997-05 | same | VERIFIED |
| release_year / year | 1998 | ℗ 1998 Philips Classics | Discogs 2575644 | VERIFIED |

**Durations, CD vs Spotify.** Discogs/MusicBrainz CD timings are 21:53 (Discogs) or 22:02 (MusicBrainz) / 10:40–10:46 / 3:56–3:59 / 8:01–8:02: same recording.

**Exposition repeat (INFERRED).** At 22:02, movement I must include the exposition repeat with the first-time bars (Brendel, no repeat: 14:52). Uchida's taking of the repeat is widely noted in reviews but was not seen in a source opened here; the guide's "In this recording" note rests on the duration. **Confirm by ear** (≈ 5:20–5:45).

### Also recommended: Alfred Brendel (Philips, 1988)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Label / catalogue | Philips 422 062-2 (CD, with the Wanderer Fantasy) | Philips / Philips Digital Classics 422 062-2, Europe 1989, ℗ 1989; producers Erik Smith, Eve Edwards | https://www.discogs.com/release/8663293 | VERIFIED |
| Recorded / venue | July 1988, Neumarkt in der Oberpfalz, Germany | "Recorded … Neumarkt/Oberpfalz, Germany, 7/1988" (a search snippet names the hall as the Historischer Reitstadel; not used) | same | VERIFIED |
| Spotify | https://open.spotify.com/album/366uEcXyywPPtRxNxzd8Cg | *Schubert: Piano Sonata in flat, D.960/ "Wanderer" Fantasie, D.760* (sic), 1989, 8 tracks; D. 960 = tracks 1–4 **14:52 / 9:19 / 3:48 / 8:28**, credited Brendel | embed | VERIFIED |
| Repeat | omitted | Wikipedia: Brendel "prefers to omit the repeats"; 14:52 confirms | Wikipedia | VERIFIED |

---

## 2. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Last three sonatas written in September 1828 (sketched from spring); D. 960 finished 26 September; two days later he played from them at an evening gathering in Vienna | Wikipedia, Historical background: "the final versions were written in September. … The final sonata was completed on September 26, and two days later, Schubert played from the sonata trilogy at an evening gathering in Vienna" | Wikipedia | VERIFIED |
| Died 19 November 1828, aged 31 | Wikipedia ("by November 19, Schubert was dead"); born 31 January 1797 (composers.yaml) | Wikipedia; composers.yaml | VERIFIED |
| No publisher in his lifetime (Probst not interested); Diabelli published c. ten years later (1838–39), dedicated to Schumann because Hummel, Schubert's intended dedicatee, had died | Wikipedia: "Probst was not interested"; "Diabelli … would only publish them about ten years later, in 1838 or 1839. Schubert had intended the sonatas to be dedicated to Johann Nepomuk Hummel … a leading pianist … by the time the sonatas were published in 1839, Hummel was dead, and Diabelli … decided to dedicate them instead to … Robert Schumann" | Wikipedia | VERIFIED |
| Hook: finished eight weeks before he died | 26 September → 19 November = 54 days ≈ 8 weeks | arithmetic | VERIFIED |
| I: G-flat trill; turn to G-flat major; three-key exposition (B-flat, F-sharp minor, F major) | Wikipedia, D. 960 I: "The first theme introduces a G♭ trill that anticipates … a shift to G♭ major … an enharmonic shift to F♯ minor at the start of the second theme … the third tonal area arrives in the traditional dominant key (F major)" | Wikipedia | VERIFIED |
| I: first-time bars appear only with the repeat; Schiff "amputation of a limb"; Brendel omits | Wikipedia, Performance practice: "in the B♭ sonata, these added bars contain strikingly novel material, which does not appear anywhere else in the piece"; Schiff quote; Brendel "prefers to omit the repeats" | Wikipedia | VERIFIED |
| I: the first-time bars are loud, with the trill | Score (first ending: *fortissimo* trill in the bass). Not stated in a source opened here | – | INFERRED (check by ear) |
| I: development has a new theme; near-quotation of "Der Wanderer" (from bar 151, D-flat; bars 159–160) | Wikipedia: "starting at bar 151 in D♭, Schubert quotes the opening motif of the piano part of his own lied … 'Der Wanderer' (D. 489)"; "the new theme first presented in this section, undergoes a transformation (in bars 159–160) to become an almost literal quotation of the song's piano introduction" | Wikipedia | VERIFIED |
| I: climax in D minor with the first theme; recapitulation; fragmentary coda | Wikipedia: "dramatic climax in D minor, in which the first theme is presented, fluctuating between D minor and the home key … The coda once again recalls the first theme, although only fragmentarily" | Wikipedia | VERIFIED |
| I: the trill alone, quietly, before the recapitulation | Score; not in a source opened here | – | INFERRED |
| II: C-sharp minor, "the most tonally remote inner movement"; rocking rhythm, texture "swimming in pedal"; A major chorale-like middle; return with C major then E major shift; coda in the tonic major haunted by minor | Wikipedia, D. 960 II | Wikipedia | VERIFIED |
| II: the left hand crosses over the right in the rocking figure | Score; not in a source opened here | – | INFERRED (well known; check) |
| III: "con delicatezza"; middle part with a new theme in D-flat major; trio in B-flat minor | Wikipedia, D. 960 III | Wikipedia | VERIFIED |
| III: trio's off-beat accents | Score; not in a source opened here | – | INFERRED |
| IV: bare octave on G resolving to C minor; Brendel links it to the G-flat trill; second theme in F major over semiquavers; F minor *fortissimo* dotted theme turning *pianissimo* in the major; development climax, chromatic descent with long diminuendo; fragmented coda; Presto | Wikipedia, D. 960 IV ("Alfred Brendel asserts that this theme … functions as a resolution of the troubling G♭ trill") | Wikipedia | VERIFIED |
| Big picture: piano writing like a singer, sustain pedal | Interpretive; Wikipedia's "texture swimming in pedal" (II) and "characteristically Schubertian stepwise melody" (IV) | Wikipedia | Descriptive |

---

## 3. How the approximate stop times were derived

No listening was possible. Bar positions are from the score as remembered and from Wikipedia's bar references (151, 159–160); they were not checked against an edition, so every stop is an estimate.

- **I (22:02):** 357 bars assumed (exposition 1–117 plus first-time bars, development ≈ 118–215, recapitulation ≈ 216, coda ≈ 330), exposition played twice: ≈ 483 bar-plays at ≈ 2.74 s a bar. Trill b. 8; G-flat section ≈ b. 20; theme 2 ≈ b. 48; F major ≈ b. 80; development ≈ 11:05; b. 151 ≈ 12:35.
- **II (10:46):** ≈ 133 bars at ≈ 4.9 s a bar; middle section ≈ b. 43; return ≈ b. 90; C major ≈ b. 103; coda ≈ b. 117.
- **III (3:59):** scherzo with repeats ≈ 2:15, trio ≈ 0:40, *da capo* ≈ 1:05.
- **IV (8:02):** proportions of a rondo-sonata of ≈ 560 bars; theme 2 and theme 3 positions from the order in Wikipedia.

---

## 4. Painting: John Constable, *Hadleigh Castle, The Mouth of the Thames – Morning after a Stormy Night*, 1829

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | John Constable (English, 1776–1837) | Commons | VERIFIED |
| Title / date | *Hadleigh Castle, The Mouth of the Thames--Morning after a Stormy Night*, 1829; exhibited at the Royal Academy 1829 | Google Arts & Culture record on Commons; Wikipedia *Hadleigh Castle (painting)* | VERIFIED |
| Collection | Yale Center for British Art, New Haven, Paul Mellon Collection (YCBA record 1669233 / TMS 5001) | https://commons.wikimedia.org/wiki/File:John_Constable_-_Hadleigh_Castle,_The_Mouth_of_the_Thames--Morning_after_a_Stormy_Night_-_Google_Art_Project.jpg ; https://en.wikipedia.org/wiki/Hadleigh_Castle_(painting) | VERIFIED |
| Medium | Oil on canvas | GAP record | VERIFIED |
| Public domain | Artist died 1837 → PD. YCBA releases public-domain images openly | – | VERIFIED (PD); YCBA open-access policy not re-checked |
| Image | Google Art Project file **5988 × 4421**, public domain | Commons API | VERIFIED. Not NC |
| Full-size oil sketch | Tate, London (not the chosen work) | Wikipedia | – |

**Pairing.** Constable's wife Maria died on 23 November 1828, four days after Schubert (19 November). *Hadleigh Castle*, finished for the Royal Academy in 1829, is described by Wikipedia (*John Constable*) as one of the works in which "the turmoil and distress of his mind is clearly seen". Seen in the image: a ruined round tower on a hillside above the wide Thames estuary, with the storm clouds breaking and light on the water. The note claims a shared moment and mood, not any link between the two men.

Alternatives (in `.shared.md`): Carl Gustav Carus, *Balcony Room with a View of the Bay of Naples* (c. 1829–30, Alte Nationalgalerie); Johan Christian Dahl, *View of Dresden by Moonlight* (1838, Nasjonalmuseet, Oslo).

---

## 5. Glossary

Existing terms reused: sustain pedal, sonata form, exposition, development, recapitulation, coda, scherzo, trio, rondo.
New terms: **Trill** (row in `brahms-violin-concerto.shared.md`), **Lied** (row in `schubert-string-quartet-14.shared.md`).

---

## 6. Re-time needed

Every stop is an estimate (§3). Re-time all against Spotify album `4X32yxTPmTbd7i03gfiSZN`, tracks 1–4 (Uchida, Philips 1997).

| Mvt | Track | Stops to re-time | Notes |
| --- | --- | --- | --- |
| I Molto moderato | 1 (22:02) | 0:00, 0:20, 0:55, 2:10, 3:40, 5:20–5:45, 5:45, 11:05, 12:35, 13:40, 14:40, 15:35, 20:45 | Most sensitive: the first-time bars and repeat (≈ 5:20–5:45) and the start of the development (≈ 11:05); Uchida's tempo is flexible |
| II Andante sostenuto | 2 (10:46) | 0:00, 3:20, 6:40, 8:20, 9:30 | Bar count assumed (≈ 133) |
| III Scherzo | 3 (3:59) | 0:00, 0:40, 2:15, 2:55 | – |
| IV Allegro ma non troppo – Presto | 4 (8:02) | 0:00, 1:10, 2:10, 2:50, 3:30, 4:40, 7:00, 7:35 | Section proportions assumed |
