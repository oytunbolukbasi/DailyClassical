# Verification: Mendelssohn – Piano Trio No. 1 in D minor, Op. 49

Files: `content/drafts/en/mendelssohn-piano-trio-1.md`, `content/drafts/tr/mendelssohn-piano-trio-1.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group C).

**Method.** Spotify album ids found from public Spotify pages (web search restricted to open.spotify.com); each album read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: credits, `duration` in ms, `isPlayable`) with the DailyClassical User-Agent from a Turkish network, plus the album page's `music:release_date` and ℗ line. History from the Henle Urtext preface (Ernst Herttrich, 2015).

**Recording choice.** The Florestan Trio (Hyperion), often preferred by reviewers, is not on Spotify. The Beaux Arts Trio's Philips recording appears on Spotify only in compilations. Perlman, Ma and Ax (Sony, 2010) is a complete, well-known recording, one track per movement, all playable.

---

## Reference recording: Perlman / Ma / Ax, Sony Classical

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/0du3s0RpF7JldNSg7HBKSK | "Mendelssohn: Piano Trios Nos. 1 & 2", 8 tracks; tracks 1–4 = Op. 49, credits "Felix Mendelssohn, Yo-Yo Ma, Itzhak Perlman, Emanuel Ax"; `music:release_date` 2010-02-02; "℗ 2010 Sony Music Entertainment" | https://open.spotify.com/embed/album/0du3s0RpF7JldNSg7HBKSK | VERIFIED |
| isPlayable | – | `true` for tracks 1–4 (and 5–8) | embed | OK |
| One track per movement | – | yes, 4 tracks | embed | OK |
| Cat. no. | 88697 52192 2 | MusicWeb International review header: "SONY CLASSICAL 88697 521922" | https://musicweb-international.com/classrev/2010/Sept10/Mendelssohn_Trios_88697521922.htm | OK |
| Recorded / venue | 28–29 March 2009, American Academy of Arts and Letters, New York | MusicWeb: "28–29 March 2009, Academy of Arts and Letters, New York City" | as above | OK |
| Release | 2010 | Spotify 2010-02-02; blog post on the release (2 February 2010) | embed; https://interchangingidioms.blogspot.com/2010/01/first-chamber-recording-by-yo-yo-ma.html | OK |
| First recording together as a trio; Mendelssohn bicentenary | "It was their first recording together as a trio"; "two hundred years after the composer's birth" | Blog post: "This is the first chamber recording these three virtuosos have recorded together"; project marked the 2009 bicentenary; Carnegie Hall performances in March 2009. Mendelssohn born 1809 | as above | OK (secondary source for "first") |

### Durations

| Track | ms | Guide |
| --- | --- | --- |
| 1 I. Molto allegro e agitato | 599 600 | 9:59 |
| 2 II. Andante con moto tranquillo | 375 200 | 6:15 |
| 3 III. Scherzo: Leggiero e vivace | 232 693 | 3:52 |
| 4 IV. Finale: Allegro assai appassionato | 536 346 | 8:56 |
| Total | 1 743 839 | 29:04 → duration_min 29 |

---

## Also recommended: Bell / Isserlis / Denk, Sony Classical

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/5YjqXNoDZnbczAgzyFCCZt | "Mendelssohn Piano Trios", 9 tracks; tracks 1–4 Op. 49 (9:45, 6:12, 3:40, 8:32), track 9 "II. Andante con moto tranquillo - Original Version" (5:55); all playable; `music:release_date` 2024-08-30; "℗ 2024 Sony Classical … under exclusive license from Joshua Bell, Inc." | embed | VERIFIED |
| Recorded / venue / cat. no. | null | Not found: HighResAudio (no booklet; release 30 August 2024); search summaries (physical release 25 October 2024) | https://www.highresaudio.com/album/view/oua5nw/joshua-bell-steven-isserlis-jeremy-denk-mendelssohn-piano-trios | UNVERIFIED (left null) |
| Reviews | – | Gramophone review "MENDELSSOHN Piano Trios Nos 1 & 2"; The Strad review | https://gramophone.co.uk/review/mendelssohn-piano-trios-nos-1-and-2 ; https://www.thestrad.com/reviews/joshua-bell-steven-isserlis-mendelssohn/18596.article | seen in search only |

---

## Painting: Felix Mendelssohn, *View from Reichels Garten over Leipzig in Winter*, 1836 (watercolour)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Felix Mendelssohn Bartholdy (1809–1847), *Blick aus dem Vorderhaus von Reichels Garten auf das winterliche Leipzig*, watercolour, 1836 | Commons file description (`{{creator: Felix Mendelssohn Bartholdy}}`, Date 1836) | https://commons.wikimedia.org/wiki/File:Blick_aus_Reichels_Garten_auf_das_winterliche_Leipzig.jpg | OK |
| Collection | Mendelssohn-Haus, Leipzig | Commons source: "Archiv Mendelssohn-Haus" (http://www.mendelssohn-stiftung.de/) | as above | OK as far as Commons goes; the physical owner of the sheet is not stated (check at merge; credit line says "Archive of the Mendelssohn-Haus") |
| Image | 2230 × 1605, JPEG, `{{PD-Art|PD-old-auto-expired|deathyear=1847}}` | Commons API | as above | OK |
| Reichels Garten and Mendelssohn | Mendelssohn's first Leipzig flat (1835), first floor of the Vorderhaus, before moving to Lurgensteins Garten in 1837 | German Wikipedia, Reichels Garten | https://de.wikipedia.org/wiki/Reichels_Garten | OK |
| Mendelssohn as watercolourist | Several of his watercolours on Commons (Category: Drawings by Felix Mendelssohn), e.g. Lucerne 1847, Amalfi 1831 | Commons | OK |
| Not already used | Mendelssohn is not an artist in `content/paintings.yaml` | grep | OK |
| Mood | A quiet winter view; it pairs by person and place (the composer's own hand; Leipzig, where he wrote much of his music and gave the premiere), not by the trio's agitation. Alternative 1 (Carus, Rosental, c. 1839) matches the mood better but Carus is already used once | – | Product owner's call |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Mendelssohn mentioned plans for piano trios from 1831 (letter of 28 August 1831), a trio "in d minor" in 1833 | Henle HN 1531 preface | https://www.henle.de/media/a8/b0/4a/1697725910/1531-1697725910-sync.pdf | OK |
| First movement dated 6 June 1839; whole manuscript 18 July 1839 (provisional) | Henle preface | as above | OK |
| Private performance with Ferdinand David on 29 August 1839, then a wholesale revision (second autograph dated 23 September 1839, lost) | Henle preface | as above | OK (guide: "in August … he rewrote the whole piece") |
| Hiller persuaded him to rework the piano part again, "more modern"; broken-chord passages "somewhat old-fashioned"; Hiller a friend of Liszt and Chopin | Henle preface (Hiller, *Briefe und Erinnerungen*, 1874); Chris Darwin's programme note quoting Robert Philip and Hiller | https://users.sussex.ac.uk/~cjd/WebProgNotes/pdfs/MendelssohnOp49.pdf | OK |
| Gewandhaus music director (since 1835); aged 30 in 1839 | Darwin note ("conducting the Gewandhaus Orchestra for four years"); born 3 February 1809 (composers.yaml) | as above | OK |
| First public performance 1 February 1840, Leipzig Gewandhaus, Ferdinand David (vn), Carl Wittmann (vc), Mendelssohn (pf) | Henle preface; Wikipedia (spells the cellist "Witmann") | as above; https://en.wikipedia.org/wiki/Piano_Trio_No._1_(Mendelssohn) | OK |
| Breitkopf & Härtel first edition April 1840 | Henle preface | as above | OK |
| Schumann: "the master trio of our time", as Beethoven's B-flat and D major trios and Schubert's E-flat had been in theirs | Henle preface (Neue Zeitschrift für Musik; Gesammelte Schriften, vol. 3, p. 272: "das Meistertrio der Gegenwart"); Wikipedia; Darwin | as above | OK (translation varies: "master trio of our age/time", "masterly trio of the present time") |
| Still the more popular of the two trios | Henle preface ("To this day, the earlier of his Trios has remained the more popular with audiences") | as above | OK |
| I: sonata form, no introduction; main theme in the cello over syncopated piano; violin joins; second theme in A major in the cello; development with violin and cello in unison over piano triplet arpeggios; coda *assai animato* (38 bars) | Wikipedia (Analysis) | as above | OK |
| I: piano hands alternating rapidly at the opening | Darwin note (with music example) | as above | OK |
| II: piano introduces an eight-bar melody, Song-without-Words texture; violin repeats with cello counterpoint; impassioned middle where the piano recalls a falling idea from the first movement; metre 4/4 (common-time sign in Darwin's example) | Wikipedia; Darwin note | as above | OK |
| III: scherzo, main theme first in the piano; lyrical central section resembling the first movement; tempo "one bar a second" | Wikipedia; Darwin note | as above | OK. Metre 6/8 and key D major from knowledge of the score (not checked against a score here) |
| IV: most revised movement, busiest piano part; cello's cantabile theme (Darwin example, common time); shift to D major shortly before the end | Wikipedia; Darwin | as above | OK |
| IV begins with the piano alone; rondo-like returns of the main theme | knowledge of the score, not checked | – | Check by ear (also the thread "starts three of the four movements alone") |
| I ends loudly in D minor; III ends very softly | knowledge of the score, not checked | – | Check by ear |
| *Songs without Words*: short piano pieces shaped like songs | general knowledge; existing guide `mendelssohn-violin-concerto` uses the same description | – | OK |

---

## Re-time

No score bar map; stops placed from assumed bar positions × the track's average tempo. Assumptions: I about 616 bars, no exposition repeat, ≈ 0.97 s per bar (second theme ≈ b. 119, development ≈ b. 225, unison passage ≈ b. 300, recapitulation ≈ b. 367, second theme ≈ b. 450, coda b. 578). II: 8-bar phrases at ≈ 5 s per bar (4/4, Andante); middle section from ≈ 37 % of the track. III: one bar per second (Darwin); trio-like lyrical passage at ≈ 40 %. IV: rondo sections placed proportionally; the cello cantabile at ≈ 35 % and its return at ≈ 80 %.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 9:59 | 0:00, 0:40, 1:10, 1:55, 3:30, 4:50, 5:50, 7:20, 9:20 | Development and recapitulation (≈ 3:30, ≈ 5:50): bar positions assumed |
| II | 6:15 | 0:00, 0:40, 2:20, 3:20, 3:50, near the end | Start of the middle section (≈ 2:20) |
| III | 3:52 | 0:00, 0:10, 1:30, 2:15, near the end | Lyrical passage (≈ 1:30) |
| IV | 8:56 | 0:00, 0:30, 1:30, 2:30, 3:10, 5:30, 7:15, 8:15 | All but the first two; the form of the finale was described from memory |
