# Verification: Brahms – Symphony No. 2 in D major, Op. 73

Piece id `brahms-symphony-2`. Checked on 2026-10-24 (batch October 2026b, group F).
Files: `content/drafts/en/brahms-symphony-2.md`, `content/drafts/tr/brahms-symphony-2.md`.
Shared-file additions: `content/research/brahms-symphony-2.shared.md`.

**How the checks were done.** Spotify ids found from Spotify track/album pages linked from web search and from the "more by" lists on Spotify track pages; tracks, ms durations and `isPlayable` from the embed page (`https://open.spotify.com/embed/album/<id>`, `__NEXT_DATA__`) fetched from this machine's Turkish network; ℗/© lines from the album page; credits and dates from the Discogs API (no token). Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Bruno Walter / Columbia Symphony Orchestra (Columbia, 1960)

Why this one: Walter's late stereo Brahms with the Columbia Symphony Orchestra is a classic, warm and unhurried reading that suits this symphony. The Spotify album has the symphony as four tracks (one per movement), all playable in Turkey. Kertész / Vienna Philharmonic (Decca) was tried first: its tracks are `COUNTRY_RESTRICTED` in Turkey (track 6Wbw0C6smbdxa2rmem1p9a, `isPlayable: false`), so it was dropped.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Bruno Walter / Columbia Symphony Orchestra | Spotify credits, tracks 1–4: "Johannes Brahms, Bruno Walter, Columbia Symphony Orchestra" | https://open.spotify.com/embed/album/0wHgDAO1eMeoZSkm00ESED | OK |
| Label / catalogue | Columbia Masterworks; M4S 615 (LP box, 1960); MS 6173 (LP, 1961) | Discogs 1601027: Columbia Masterworks MS 6173, US, released May 1961, "Previously released on M4S 615", mono ML 5573; Discogs 12589825: M4S 615 "The Orchestral Music Of Brahms", 1960-09 | https://www.discogs.com/release/1601027 ; https://www.discogs.com/release/12589825 | OK |
| Recorded | 11, 14 and 16 January 1960 | NYPL catalogue record of the Sony CD (Symphonies 2 & 3): "Jan. 11, 14 & 16, 1960 (1st work); Jan. 27 & 30, 1960 (2nd work)", read from a search-result summary, not opened directly | https://www.nypl.org/research/research-catalog/bib/b21888965 | SECONDARY |
| Venue | American Legion Hall, Hollywood | Same record (via search summary); consistent with Walter's other Columbia stereo sessions | same | SECONDARY |
| Release year / ℗ | 1960 | CBS MK 42021 notes "Ⓟ 1960 CBS Inc."; M4S 615 dated 1960-09 | https://www.discogs.com/release/4926860 | OK |
| Spotify | https://open.spotify.com/album/0wHgDAO1eMeoZSkm00ESED | "Brahms: Symphonies Nos. 2 & 3", album, 1960, 8 songs; tracks 1–4 Symphony No. 2, tracks 5–8 Symphony No. 3; all `isPlayable: true` | embed + album page | VERIFIED |
| Walter's age | 83 | Born 15 September 1876 (Wikipedia) | https://en.wikipedia.org/wiki/Bruno_Walter | OK |
| Columbia Symphony Orchestra | "assembled by Columbia Records for recording sessions, mostly from Los Angeles players" | "formed by Columbia Records for the purpose of making recordings ... contracted as needed for individual sessions ... often members of ... the Los Angeles Philharmonic" on the West Coast | https://en.wikipedia.org/wiki/Columbia_Symphony_Orchestra | OK |

**First-movement repeat.** Walter's first movement lasts 15:10. Abbado's Berlin recording (Kelly Dean Hansen's guide) lasts 21:02 *with* the exposition repeat (first pass 0:00–5:20), i.e. about 15:42 without it; with the repeat Walter would have to be about a third faster than Abbado, which is implausible. So the guide states that the exposition is not repeated. This is inferred from the timing, not from the booklet; confirm by ear (the development, ≈ 4:55, should begin right after the A-major lullaby, with no return to the opening).

### Durations (Spotify embed, album 0wHgDAO1eMeoZSkm00ESED)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro non troppo | 910133 | 15:10 | true |
| 2 | II. Adagio non troppo | 637426 | 10:37 | true |
| 3 | III. Allegretto grazioso (Quasi andantino) | 333466 | 5:33 | true |
| 4 | IV. Allegro con spirito | 578200 | 9:38 | true |
| | Total (symphony) | 2459225 | 40:59 → `duration_min: 41` | |

---

## 2. Also recommended: Karajan / Berliner Philharmoniker (DG, 1987)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Herbert von Karajan, Berliner Philharmoniker | Spotify credits | OK |
| Label / catalogue | Deutsche Grammophon, LP 423 142-1 (with *Haydn Variations*), "(P) 1987 Polydor International GmbH" | https://www.discogs.com/release/6913090 (master 877819) | OK |
| Recorded / venue | Not given in the Discogs entry; left `null` (the companion Brahms 1 LP says "Berlin, Philharmonie, 1/1987", which suggests the same cycle but is not evidence for No. 2) | https://www.discogs.com/release/3856089 | UNVERIFIED |
| Spotify | https://open.spotify.com/album/2ulWkzT7rhKHm0yKXQdo6t, "© 1987 Deutsche Grammophon GmbH, Berlin", 14 tracks; Symphony tracks 15:45 / 9:46 / 5:21 / 9:20, all `isPlayable: true` | embed + album page | VERIFIED |

Other playable albums seen (not used): Bernstein / Vienna Philharmonic live (5f9bAbA2pFvxYeEd6WnItn, I = 20:48 with repeat), Rattle / Berlin (7BEXzvALMQougfexeXhQMv), Ozawa / Boston (2VvGrCvuGfNbGk5QOEvMed).

---

## 3. Painting: Markus Pernhart, *View of the Wörthersee with Maria Loretto and Freyenthurn Castle*, 1850

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Markus (Marko) Pernhart (1824–1871), Carinthian landscape painter | Commons creator template on the file page | OK |
| Title | *A view of Lake Wörthersee with Maria Loretto and Freyenthurn Castle* (Commons title, from the Dorotheum lot) | https://commons.wikimedia.org/wiki/File:Marko_Pernhart_-_A_view_of_Lake_W%C3%B6rthersee_with_Maria_Loretto_and_Freyenthurn_Castle.jpg | OK |
| Date / medium / size | 1850; oil on canvas; 53 × 65.5 cm | same | OK |
| Collection | Private collection, Austria ({{private collection|location=Austria}}); image from a Dorotheum sale, lot id 1091998 | same; Dorotheum page returns 403 to scripts, not opened | SECONDARY |
| Rights | Artist died 1871: public domain. Commons: {{PD-art|PD-old-100-1923}}. A faithful photo of a 2D PD work creates no new right (EU DSM art. 14; US *Bridgeman*) | same | OK |
| Image | 4833 × 3869 px, landscape (≈ 1.25:1); thumbnail checked: wide view over the lake to the Karawanks, two figures on a rock in the foreground | Commons API | OK |
| Pairing | Brahms wrote the symphony at Pörtschach on the Wörthersee in summer 1877; Maria Loretto and Freyenthurn are at the eastern (Klagenfurt) end of the same lake. The painting is 27 years earlier; no link between Pernhart and Brahms is claimed | Wikipedia (symphony) | OK |

The only weak point is the collection ("private collection") and a source page that is an auction lot. If a museum-held picture is preferred, alternative A or B in the shared note.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed summer 1877 at Pörtschach am Wörthersee, Carinthia; brief compared with the 21 years of the First | https://en.wikipedia.org/wiki/Symphony_No._2_(Brahms) | OK |
| "Took a few months" | Same (written in one summer; premiere December 1877) | OK (cautious paraphrase) |
| Premiere 30 December 1877, Vienna Philharmonic, Hans Richter; postponed from 9 December because the players were learning *Das Rheingold* (Frisch 1996, p. 68) | same | OK |
| Pastoral mood, comparison with Beethoven's Sixth | same | OK |
| Letter to his publisher, 22 November 1877: "so melancholy ... the score must come out in mourning" ("perhaps mischievously") | same | OK |
| Only one of the four symphonies with a tuba; trombones and tuba darken the opening | http://kellydeanhansen.com/opus73.html (introduction; m. 32) | OK |
| Letter to Vinzenz Lachner: "a severely melancholic person" ... "those timpani and trombones" (Avins & Eisinger, *Johannes Brahms: Life and Letters*, 1997) | Wikipedia footnote, same article | OK |
| Theme 2 at bar 82 in F-sharp minor, violas and cellos; resemblance to the *Wiegenlied* Op. 49 ("Brahms's Lullaby") | Wikipedia; Hansen m. 82 | OK |
| The development's fugal passage and the trombones' blast of the opening motive at the climax (mm. 204–246) | Hansen; Wikipedia | OK |
| Recapitulation (m. 302): oboes have the theme, violas the transition melody, "the first time the two themes have been heard together" | Hansen | OK |
| Coda with horn solo (m. 455); *in tempo, sempre tranquillo* (m. 497) | Hansen; Wikipedia | OK |
| II: cello theme with bassoon counter-melody; horn fugato m. 17; Theme 2 m. 33 in 12/8 *L'istesso tempo, ma grazioso*; closing theme m. 45; stormy B minor outburst m. 87 in place of Theme 2; coda m. 97 | Hansen; Wikipedia | OK |
| III: oboe melody over pizzicato cellos; *Presto ma non assai* 2/4 and later 3/8, both variants of the main tune; shortest movement in the four symphonies | Hansen; Wikipedia | OK |
| IV: *sotto voce* start with the opening turn; outburst m. 23; Theme 2 *largamente* m. 78; *tranquillo* m. 206; trombones and tuba first enter at the re-transition m. 234; recapitulation m. 244; coda m. 353; blaze of brass at the end | Hansen; Wikipedia | OK |
| "Brahms's most exuberant finale" | MacDonald (1990), quoted in Wikipedia: "the most athletic and ebulliently festive movement Brahms ever wrote" | OK (paraphrase) |
| Metres: I 3/4, II 4/4 (with 12/8), III 3/4 (with 2/4 and 3/8), IV cut time | Hansen; Wikipedia | OK |

---

## 5. Re-time

Every stop is an estimate (≈). Method: Kelly Dean Hansen's listening guide gives bar numbers with timings for Abbado / Berlin (DG 435 683-2): I 21:02 with repeat (≈ 15:42 without), II 10:03, III 5:25, IV 9:43. Each stop was taken at its bar, converted to Abbado's time (first movement: minus the 5:20 first pass of the exposition, since Walter omits the repeat), then scaled by the ratio of track lengths: I × 0.966, II × 1.056, III × 1.025, IV × 0.991. Walter is flexible in tempo, so expect errors of 10–20 s, more in the slow movement.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro non troppo | 15:10 | 0:00 (m. 1), 0:55 (m. 32), 1:20 (m. 44), 2:15 (m. 82), 3:20 (m. 118), 4:15 (m. 156), 4:55 (development), 5:35–6:40 (mm. 204–246), 8:20 (m. 302), 9:40 (m. 350), 12:40–13:10 (mm. 455–469), Last minute (m. 497) | Whether the exposition repeat is really omitted (if not, every stop from 4:55 shifts by ≈ 4:50); recapitulation ≈ 8:20 |
| II Adagio non troppo | 10:37 | 0:00, 1:15 (m. 13), 1:40 (m. 17), 3:00 (m. 33), 4:10 (m. 45), 5:10–6:00 (mm. 55–62), 6:35 (m. 68), 8:15 (m. 87), 9:25 (m. 97) | Theme 2 (≈ 3:00) and the outburst (≈ 8:15): Walter's slow-movement tempo is the least predictable |
| III Allegretto grazioso | 5:33 | 0:00, 1:10 (m. 33), 2:05 (m. 107), 2:50 (m. 126), 3:35 (m. 194), Last 30 seconds | Second *Presto* (≈ 2:50) |
| IV Allegro con spirito | 9:38 | 0:00, 0:28 (m. 23), 1:30 (m. 78), 2:20 (m. 114), 3:10 (m. 155), 4:20 (m. 206), 5:15 (m. 234), 5:35 (m. 244), 6:20 (m. 281), 7:55 (m. 353), 9:10 (m. 417) | Tranquillo (≈ 4:20) and coda (≈ 7:55) |
