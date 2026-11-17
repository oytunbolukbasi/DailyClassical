# Verification: Brahms – Symphony No. 3 in F major, Op. 90

Piece id `brahms-symphony-3`. Checked on 2026-11-17 (batch November 2026, group F).
Files: `content/drafts/en/brahms-symphony-3.md`, `content/drafts/tr/brahms-symphony-3.md`.
Shared-file additions: `content/research/brahms-symphony-3.shared.md`.

**How the checks were done.** Spotify album ids from Spotify track pages found by web search (album id read from the track page's album link); tracks, ms durations and `isPlayable` from the embed page (`https://open.spotify.com/embed/album/<id>`, `__NEXT_DATA__`) fetched with curl from this machine's Turkish network; ©/℗ lines from the album page; credits and dates from the Discogs API (no token) and review sites. Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Otto Klemperer / Philharmonia Orchestra (Columbia/EMI, 1957)

Why this one: BBC Music Magazine's (classical-music.com) guide names Klemperer's 1957 Kingsway Hall recording as its top choice for the Third, praising its swift tempos and the observed exposition repeat. The Warner remaster album has the symphony as four tracks, one per movement, all playable in Turkey.

Other albums checked: Walter / Columbia SO (`0wHgDAO1eMeoZSkm00ESED`, tracks 5–8, all playable, but Spotify credits tracks 5–8 to "Columbia Symphony Orchestra, New York Philharmonic", which is ambiguous; it is already the reference album of `brahms-symphony-2`); Karajan / BPh 1977–78 (`7uxwOj88hFIg3R1PFJHzye`, playable); Böhm / VPO (`6WJ3PPb9p82cWyXIfCZ6SI`, all tracks `isPlayable: false`); Klemperer 2004 EMI set `0wtWydMXiKHgmzy55tLjIQ` (same recording, 22 tracks; tracks 19–22 = 13:04 / 8:17 / 6:12 / 9:14, all playable; kept as a fallback). The 2022/2023 Warner remaster below is shorter and has only this recording plus No. 1 and the overture.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Otto Klemperer / Philharmonia Orchestra | Spotify credits tracks 5–8: "Johannes Brahms, Otto Klemperer, Philharmonia Orchestra" | https://open.spotify.com/embed/album/1W21kPx7uF3ZbiYmHdqyoa | OK |
| Label / catalogue | Columbia (EMI); Warner Classics remaster; 33CX 1536 (mono LP); SAX 2351 (stereo LP) | Discogs master 504743: versions include Columbia 33CX 1536 (UK, 1958), Angel 35545 (US, 1958), SAX 2351 (UK stereo, 1960/61); album page "℗ A Warner Classics release, ℗ 2023 Parlophone Records Limited" | https://api.discogs.com/masters/504743 ; https://api.discogs.com/masters/504743/versions | OK |
| Recorded | March 1957 | Discogs master notes: "Recorded March 26-29, 1957 at Kingsway Hall" (sessions may include the coupled overture); MusicWeb review of the EMI CD set: "rec. 26-27.3.1957 … Recorded in the Kingsway Hall, London" | https://www.musicweb-international.com/classrev/2004/Mar04/Brahms_Klemperer.htm | OK (day range differs; guide gives month only) |
| Venue | Kingsway Hall, London | same two sources | same | OK |
| Release year | 1958 | earliest Discogs versions 1958 (33CX 1536; Angel 35545) | Discogs versions | OK |
| Spotify | https://open.spotify.com/album/1W21kPx7uF3ZbiYmHdqyoa | "Brahms: Symphonies Nos. 1 & 3 & Academic Festival Overture (Remastered)", 9 tracks; Symphony No. 3 = tracks 5–8, all `isPlayable: true` | embed + album page | VERIFIED |
| Exposition repeat | "He takes the repeat of the exposition" | classical-music.com says Klemperer observes it; consistent with the timing (13:03 against Abbado's 13:44 *with* the repeat in Hansen's guide; without the repeat Klemperer would be implausibly slow) | https://www.classical-music.com/features/recordings/brahms-symphony-no-3-guide-and-best-recordings/ | OK |

### Durations (Spotify embed, album 1W21kPx7uF3ZbiYmHdqyoa)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | I. Allegro con brio | 783480 | 13:03 | true |
| 6 | II. Andante | 495800 | 8:15 | true |
| 7 | III. Poco allegretto | 371640 | 6:11 | true |
| 8 | IV. Allegro | 560800 | 9:20 | true |
| | Total (symphony) | 2211720 | 36:52 → `duration_min: 37` | |

---

## 2. Also recommended: Claudio Abbado / Berliner Philharmoniker (DG, 1989)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Berliner Philharmoniker, Claudio Abbado | Spotify credits ("Berlin Philharmonic") | OK |
| Label / catalogue | Deutsche Grammophon 429 765-2 | Discogs releases 5129743 / 9564418 (search-result summary); classical-music.com ("DG 429 7652") | SECONDARY |
| Recorded / venue | September 1989, Philharmonie, Berlin | Discogs notes "Berlin, Philharmonie, 9/1989" (via search summary) | SECONDARY |
| Release | "© 1990 / ℗ 1990 Deutsche Grammophon GmbH, Berlin" | album page | OK |
| Spotify | https://open.spotify.com/album/33Co65irSPLxxcrQ0DLuwu; tracks 3–6 = 13:44 / 8:28 / 6:31 / 9:02, all `isPlayable: true` | embed | VERIFIED |

This is the recording timed in Kelly Dean Hansen's listening guide (he cites DG 435 683-2, the complete set; the movement lengths match his timings), which is why it was used to place the stops.

---

## 3. Painting: Barend Cornelis Koekkoek, *Sunset on the Rhine*, 1853

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Barend Cornelis Koekkoek (Dutch, Middelburg 1803 – Cleve 1862) | Met collection API, object 436827 | OK |
| Date / medium / size | 1853; oil on canvas; 81.9 × 107.6 cm | Met API | OK |
| Collection | The Metropolitan Museum of Art, New York, 87.15.45, Catharine Lorillard Wolfe Collection, Bequest of Catharine Lorillard Wolfe, 1887 | https://www.metmuseum.org/art/collection/search/436827 | OK |
| Image | File:Sunset on the Rhine MET DP143198.jpg, 3810 × 2911 px, landscape | Commons API | OK |
| Rights | Artist died 1862: public domain. Met Open Access, `isPublicDomain: true`; Commons licence CC0. Not NC | Met API; Commons | OK |
| Not already used | No Koekkoek in `content/paintings.yaml` | grep | OK |
| Pairing | Brahms first visited the Schumanns in Düsseldorf on the Rhine in autumn 1853 (en Wikipedia: "Brahms visited Düsseldorf in October 1853"); the F-A-E Sonata for Joachim was written there in October 1853. Wikipedia on the symphony: the stay in Wiesbaden on the Rhine "may also have brought back memories of his early days in Düsseldorf". Koekkoek lived at Kleve (Cleve) on the Lower Rhine. No link between Koekkoek and Brahms is claimed | https://en.wikipedia.org/wiki/Johannes_Brahms ; https://en.wikipedia.org/wiki/F-A-E_Sonata ; https://en.wikipedia.org/wiki/Symphony_No._3_(Brahms) | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Written summer 1883 in Wiesbaden, six years after the Second (nearly six years) | https://en.wikipedia.org/wiki/Symphony_No._3_(Brahms) ; https://de.wikipedia.org/wiki/3._Sinfonie_(Brahms) | OK |
| Brahms was 50 | born 7 May 1833 (en Wikipedia, Brahms); Hansen: "When he began the Third, he was 50 years old" | OK |
| Premiere 2 December 1883, Vienna Philharmonic, Hans Richter | en and de Wikipedia | OK |
| Motto F–A♭–F, "frei aber froh", answer to Joachim's F–A–E "frei aber einsam"; Brahms said nothing on the subject | en Wikipedia ("broadly assumed"; "Brahms himself said nothing on the subject"); Hansen ("supposedly refers") | OK (told as a reading) |
| Motto uses A-flat (minor), theme the A-natural (major); finale firmly in F minor, F major only at the end | http://kellydeanhansen.com/opus90.html | OK |
| Shortest of the four symphonies | en Wikipedia; Hansen | OK |
| All four movements end quietly, unusual | Hansen; classical-music.com ("unprecedented") | OK |
| Richter called it Brahms's "Eroica" | en Wikipedia (Reception) | OK |
| Hanslick: "artistically the most nearly perfect" | en Wikipedia (quotation, compared with the First and Second) | OK |
| I: 6/4 with 9/4 passages; Theme 2 clarinet in A major over plucked low strings, bassoon counterpoint; closing theme A minor; development starts with Theme 2 in C-sharp minor in low strings and bassoons; horn motto in E-flat (m. 101); *Un poco sostenuto* low strings (m. 112); recapitulation with the motto stretched to four chords (m. 120); coda with trumpets, trombones, timpani (m. 183); quiet end | Hansen; de Wikipedia (form outline) | OK |
| Groupings against the 6/4 (3/2 feel) described as a kind of hemiola | Hansen ("6/4 often wants to be 3/2", "implied 3/2") | OK |
| II: clarinets and bassoons alone, low-string echoes; chorale-like Theme 2 in unison clarinet and bassoon (m. 41); upbeat-downbeat link passage; passionate new melody in violins (m. 108); clarinet over a C pedal at the end | Hansen | OK |
| II's Theme 2 returns in the finale (trombones, m. 19ff.; climax m. 149ff.) | Hansen; de Wikipedia ("Thema von Satz 2 (dort ab Takt 40) ist verwandt mit Thema von Satz 4") | OK |
| III: cellos then violins; major-key contrasting phrase; flute/oboe/horn; trio in A-flat with off-beat wind chords and syncopated cellos; string-only B major passage; reprise led by solo horn, then oboe, then violins and cellos over three octaves | Hansen | OK |
| III is moderate, lyrical, not a fast scherzo | en Wikipedia | OK |
| IV: unison strings and bassoons *sotto voce*; trombones' E-flat and the chorale; Theme 2 in C major for cellos and horns; closing theme C minor; chorale climax after a general pause; Theme 2 in F major; *Un poco sostenuto* coda with violas in B minor, turn to F major (m. 267); motto and first-movement theme return at the end | Hansen; en Wikipedia (finale "ends with reference to the motto … then fades away to a quiet ending") | OK |
| Klemperer, Kingsway Hall, March 1957, with the repeat | see §1 | OK |

Not used: the duel story at the premiere (en Wikipedia; Kalbeck via de Wikipedia, too anecdotal), the *Tannhäuser* allusion, the Schumann "Rhenish" quotation in Theme 1 (mentioned by Hansen and Wikipedia, but the guide already carries enough), Dvořák's letter, pop-song borrowings (Sinatra's "Take My Love" is based on "a motif from the 3rd Symphony", movement not stated).

---

## 5. Re-time

All stops are estimates (≈). Method: Kelly Dean Hansen's guide gives bar numbers with timings for Abbado / Berlin (I 13:44 with the exposition repeat, II 8:28, III 6:31, IV 9:02; the same lengths as the Spotify album in §2). Each stop's Abbado time was scaled by the ratio of track lengths: I × 0.950, II × 0.975, III × 0.949, IV × 1.033, then rounded to 5 s. Klemperer's tempi are steadier than Abbado's, so the linear scaling is reasonable, but slow passages (the *Un poco sostenuto* in I and IV) may drift by 10–20 s.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro con brio | 13:03 | 0:00, 1:20 (m. 36), 2:35 (m. 61), 3:05 (repeat), 6:10 (m. 77), 7:05 (m. 101), 7:40 (m. 112), 8:20 (m. 120), 10:55 (m. 183), Last 45 seconds | The *sostenuto* (≈ 7:40) and recapitulation (≈ 8:20), where Klemperer may broaden more than Abbado |
| II Andante | 8:15 | 0:00, 1:15 (m. 24), 2:15 (m. 41), 3:15 (m. 57), 4:30 (m. 80), 4:50 (m. 86), 6:05 (m. 108), Last 30 seconds | Return of Theme 1 (≈ 4:50) |
| III Poco allegretto | 6:11 | 0:00, 0:28 (m. 13), 0:50 (m. 24), 1:25 (m. 41), 1:55 (m. 54), 2:25 (m. 70), 3:35 (m. 99), 4:05 (m. 111), 5:00 (m. 139), Last 40 seconds | Horn reprise (≈ 3:35) |
| IV Allegro – Un poco sostenuto | 9:20 | 0:00, 0:30 (m. 19), 0:55 (m. 30), 1:30 (m. 52), 2:05 (m. 75), 2:55 (m. 108), 4:05 (m. 149), 5:15 (m. 194), 6:45 (m. 252), 7:10 (m. 267), 8:35 (m. 301), Last 20 seconds | Coda stops (≈ 6:45 onward): Klemperer's track is 18 s longer than Abbado's, most likely in the slow coda |
