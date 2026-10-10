# Verification: Brahms – Clarinet Quintet in B minor, Op. 115

Piece id: `brahms-clarinet-quintet` (form `chamber`). Performers: `soloists` (clarinet) + the quartet as `orchestra`, no conductor (guide §3, chamber works).
Files: `content/en/pieces/brahms-clarinet-quintet.md`, `content/tr/pieces/brahms-clarinet-quintet.md`. Shared-file additions: `content/research/brahms-clarinet-quintet.shared.md`.
Checked on 2026-10-10 (batch BATCH-2026-10, group E).

**How the checks were done** (same method as `beethoven-piano-sonata-8.md`)
- **Spotify:** embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, durations in ms) and the album page meta tags.
- **Discogs:** public API `https://api.discogs.com/releases/<id>`.
- **Listening guide with timings:** Kelly Dean Hansen's guide to Op. 115 is keyed to **this same recording** (Leister / Amadeus Quartet, cited as DG 419 875-2, the 1987 CD box that reissues it), with bar numbers: http://www.kellydeanhansen.com/opus115.html. Stop times come from his timings; descriptions are our own.
- **Status key:** VERIFIED / INFERRED / UNVERIFIED as in the other notes.
- **Privacy:** generic `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)` on every request; no personal data sent.

---

## 1. Reference recording: Karl Leister, Amadeus Quartet (DG, 1967)

### Spotify embed check

`https://open.spotify.com/album/3mmIHrQZyvjAyngGlYBohA`. Album name: *Mozart: Clarinet Quintet K.581 / Brahms: Clarinet Quintet In B Minor, Op. 115*; `og:description` "Gervase De Peyer · compilation · 1993 · 8 songs"; `music:release_date` 1993-01-01.

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| 1–4 | Mozart, Clarinet Quintet K. 581 (Gervase de Peyer, Amadeus Quartet) | 9:20 / 7:07 / 7:06 / 9:24 | – |
| **5** | **Clarinet Quintet in B Minor, Op. 115: I. Allegro** – Karl Leister, Amadeus Quartet | **12:27** | 747000 |
| **6** | **… II. Adagio** | **11:06** | 666000 |
| **7** | **… III. Andantino - Presto non assai, ma con sentimento** | **4:36** | 276000 |
| **8** | **… IV. Con moto** | **8:22** | 502000 |

Total 36:31 → `duration_min: 37`. One track per movement; 4 movements. Status: VERIFIED.

### Field check

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Clarinet / quartet | Karl Leister / Amadeus Quartet | Same. Quartet: Norbert Brainin, Siegmund Nissel, Peter Schidlof, Martin Lovett | https://www.discogs.com/release/11082861 | VERIFIED |
| Label / catalogue | DG, "139 354 (LP); 437 646-2 (CD, with Mozart's Clarinet Quintet)" | LP 139 354 (Germany; producer Manfred Richter, engineer Hans-Peter Schweigmann): https://www.discogs.com/release/2201005 , https://www.discogs.com/release/9922777 (dated 1968). CD 437 646-2 *Klarinettenquintette*: Mozart K. 581 with de Peyer (tracks 1–4), Brahms Op. 115 with Leister (5–8), same order as Spotify: https://www.discogs.com/release/5840532 (year not given; Spotify says 1993) | as given | VERIFIED (that the Spotify album is 437 646-2 is INFERRED from programme, order and 1993 date) |
| Recorded / venue | March 1967, Ufa-Studio, Berlin | DG 419 875-2 (Quintets & Sextets box) notes: "(P)1967 3.5 to 3.8 (Mar 1967) … Recordings: Berlin, Ufa-Studio" | https://www.discogs.com/release/2038079 | VERIFIED |
| release_year / year | 1967 | ℗ 1967 (419 875-2 notes). Discogs dates the German LP 139 354 to 1968; a promo copy to 1967 (search snippet only) | same | VERIFIED (℗ year); LP issue 1967/68 |
| Spotify | 3mmIHrQZyvjAyngGlYBohA | as above | embed | VERIFIED |

**Exposition repeat.** Hansen marks the repeat at 2:57 [m. 5]: the four opening bars are not part of the repeat. Leister/Amadeus take it (Spotify I = 12:27).

### Also recommended: Harold Wright, Boston Symphony Chamber Players (Philips, 1993)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Players | Harold Wright, Boston Symphony Chamber Players | Wright (clarinet), Malcolm Lowe, Laura Park (violins), Burton Fine (viola), Jules Eskin (cello) | https://www.discogs.com/release/7522434 | VERIFIED |
| Label / catalogue | Philips 442 149-2 | Philips 442 149-2, CD, Europe 1994 | same | VERIFIED |
| Recorded / venue | May 1993, Symphony Hall, Boston | "Recorded: Boston Symphony Hall, USA, 5/1993"; ℗ 1994 | same | VERIFIED |
| Spotify | https://open.spotify.com/album/5yB7rdg8kcsrqxKYQL2tos | *Mozart & Brahms: Clarinet Quintets*, "Harold Wright · album · 1994 · 8 songs"; Op. 115 = tracks 1–4, **12:46 / 11:36 / 5:06 / 9:20** | embed | VERIFIED |

---

## 2. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| In 1890 Brahms, 57, thought he could retire | Wikipedia, *Johannes Brahms*: after the Vienna premiere of the Second String Quintet Op. 111 in 1890, "the 57-year-old Brahms came to think that he might retire from composition" | https://en.wikipedia.org/wiki/Johannes_Brahms | VERIFIED |
| Heard Mühlfeld, clarinettist of the Meiningen court orchestra, in March 1891 | Wikipedia, *Clarinet Quintet (Brahms)*: "Fritz Steinbach brought Mühlfeld's playing to Brahms's attention in March 1891"; *Richard Mühlfeld*: Meiningen Court Orchestra | https://en.wikipedia.org/wiki/Clarinet_Quintet_(Brahms) ; https://en.wikipedia.org/wiki/Richard_M%C3%BChlfeld | VERIFIED |
| That summer at Bad Ischl, the Trio Op. 114 and the Quintet | Wikipedia (quintet): "That summer at Bad Ischl, he composed the Clarinet Quintet and his Clarinet Trio Op. 114". *Johannes Brahms*: summers at Ischl from 1889 | as above | VERIFIED |
| Private first performance Meiningen 24 Nov 1891 with the Joachim Quartet; public premiere Berlin 12 Dec 1891 | Wikipedia (quintet), Performances | as above | VERIFIED |
| Same line-up as Mozart's quintet; Mühlfeld played Mozart's quintet for Brahms; finale a set of variations like Mozart's | Wikipedia (quintet): "The Brahms quintet shows parallels to the Mozart Quintet, especially in form"; finale "a theme and five variations as do the final movements of Mozart's Clarinet Quintet". *Richard Mühlfeld*: Brahms listened to him play Weber's Concerto No. 1, "Mozart's Clarinet Quintet and some of Ludwig Spohr's works" | as above | VERIFIED |
| Ends where it began: finale brings back the first movement's opening | Wikipedia (quintet): "The coda brings multiple themes from the first movement"; Hansen 6:37 [m. 193] (first-movement turn gesture in 6/8) | Hansen | VERIFIED |
| I: key hovers between B minor and D major; settles some bars after the clarinet | Wikipedia (quintet): "Only several bars after the clarinet's entry is it finally made clear that the key … is B minor rather than D major". Hansen 0:11 [m. 5]: the clarinet's arpeggio "immediately pivots to the relative key of D major" | as above | VERIFIED (sources describe it differently; guide wording covers both) |
| I: opening bars left out of the repeat, only hinted at in the recapitulation, heard whole at the end | Hansen 2:57 [m. 5], 8:35 [m. 136] (merger with the first two bars), 11:30 [m. 207] ("for the first time since the beginning … even including the exposition repeat (where it was omitted)") | Hansen | VERIFIED |
| I: stops (m. 14 cello/viola; m. 36 Theme 2 D major, syncopated murmur; m. 59 closing; m. 71 development; m. 98 *quasi sostenuto*; m. 136 recap; m. 195 climax; m. 207 end) | Hansen, 1st movement | Hansen | VERIFIED |
| II: strings muted throughout | Wikipedia (quintet): "played with mutes (con sordino) throughout"; Hansen 0:00 | as above | VERIFIED |
| II: middle section in "gypsy" style Brahms favoured; the only *fortissimo* at m. 70 | Hansen 3:26 [m. 52] ("so-called gypsy style so often favored by Brahms"), 5:50 [m. 70] ("the only fortissimo marking in the movement") | Hansen | VERIFIED |
| III: Andantino D major; Presto in B minor transforms the tune; returns to the Andantino and ends in D major | Wikipedia (quintet); Hansen 0:00, 1:23 [m. 34], 4:01 [m. 171], 4:17 [m. 184] | as above | VERIFIED |
| IV: theme and five variations; var. 1 cello; var. 2 agitated syncopation; var. 3 clarinet detached arpeggios; var. 4 B major; var. 5 3/8 viola; first-movement return; sudden loud chord then fade | Hansen 0:00, 0:57 [m. 33], 1:58 [m. 65], 3:06 [m. 97], 4:21 [m. 129], 5:42 [m. 161], 6:37 [m. 193]; Wikipedia: "ends with a sudden loud B minor chord which eventually fades away" | as above | VERIFIED |
| In this recording: Leister in the Berlin Philharmonic for thirty years from 1959; Amadeus Quartet kept its founding members 1947–1987 | Wikipedia, *Karl Leister* ("In 1959, Leister joined the Berlin Philharmonic … this musical association was to last for thirty years"); *Amadeus Quartet* ("founded in 1947 and disbanded in 1987, having retained its founding members") | https://en.wikipedia.org/wiki/Karl_Leister ; https://en.wikipedia.org/wiki/Amadeus_Quartet | VERIFIED |

Not used: the Weber concerto quotation in the first movement (Wikipedia, "possibly"); the Brahms nickname for Mühlfeld ("Fräulein Klarinette"), not found in a source opened here.

---

## 3. Painting: Fernand Khnopff, *I Lock My Door upon Myself*, 1891

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Fernand Khnopff (Belgian, 1858–1921) | Commons file page | VERIFIED |
| Title / date | *I Lock My Door upon Myself*, 1891 (title from a poem by Christina Rossetti) | https://commons.wikimedia.org/wiki/File:I_lock_my_door_upon_myself_Fernand_Khnopff_1891.jpg | VERIFIED (date); Rossetti source is common knowledge, not used in the guide |
| Collection | Neue Pinakothek, Munich, inv. 7921 (Bayerische Staatsgemäldesammlungen); acquired from the artist in 1893; not on display at time of check | https://www.sammlung.pinakothek.de/en/artwork/ma4dqNqxrO | VERIFIED |
| Medium / size | Oil on canvas, 72.7 × 141 cm | same | VERIFIED |
| Museum image | The museum offers its own download under CC BY-SA 4.0 (resolution not checked) | same | VERIFIED |
| Public domain | Artist died 1921 → painting PD everywhere | – | VERIFIED |
| Image | **4202 × 2121**, a gallery photograph licensed **CC BY-SA 4.0** by its photographer (Yelkrokoyade). Faithful photographs of 2D PD works are not protected in the EU (DSM art. 14) or the US, but credit the photographer to respect the licence. A public-domain alternative exists at 3278 × 2057 *with frame* (`File:Fernand_Khnopff_-_I_lock_my_door_upon_myself_-_with_frame.jpg`), which would need cropping | Commons API | VERIFIED. Not NC |

**Pairing.** Same year as the quintet (1891). A young woman sits alone, chin on her hands, behind a dark ledge, with withered lilies and a winged bust of Hypnos, the god of sleep, above her (seen in the image): a picture of withdrawal and inward thought, matching the quintet's quiet, autumnal tone and Brahms's own turn inward in his last years. No direct link between Khnopff and Brahms is claimed.

Alternatives (in `.shared.md`): Vilhelm Hammershøi, *Interior with Young Woman Seen from the Back* (1903–04, Randers Kunstmuseum); Jean-Baptiste-Camille Corot, *Souvenir de Mortefontaine* (1864, Louvre; a Corot landscape was the cover of the original LP 139 354, per Discogs 11082861 "Painting [Cover] – Jean-Baptiste Camille Corot").

---

## 4. Glossary

Existing terms reused: sonata form, exposition, development, recapitulation, coda, syncopation, muted, tremolo, pizzicato, variation. No new terms.

---

## 5. Re-time needed

Stops come from Hansen's timings of this recording on the 419 875-2 CD. The Spotify tracks are a few seconds longer or shorter (his I ends ≈ 12:20 judging from the last cue, Spotify 12:27), so small offsets are expected. Re-time all against Spotify album `3mmIHrQZyvjAyngGlYBohA`, tracks 5–8.

| Mvt | Track | Stops to re-time | Notes |
| --- | --- | --- | --- |
| I Allegro | 5 (12:27) | 0:00, 0:11, 0:33, 1:27, 2:27, 2:57, 5:43, 6:51, 8:35, 11:00, 11:30 | – |
| II Adagio | 6 (11:06) | 0:00, 0:36, 2:11, 2:54, 3:26, 5:50, 6:57, 7:25, 10:11 | – |
| III Andantino – Presto non assai | 7 (4:36) | 0:00, 0:44, 1:23, 1:46, 4:01, Near the end | – |
| IV Con moto | 8 (8:22) | 0:00, 0:57, 1:58, 3:06, 4:21, 5:42, 6:37, Near the end | – |
