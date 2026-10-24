# Verification: Saint-Saëns – Symphony No. 3 in C minor, "Organ", Op. 78

Piece id `saint-saens-symphony-3`. Checked on 2026-10-24 (batch October 2026b, group F).
Files: `content/drafts/en/saint-saens-symphony-3.md`, `content/drafts/tr/saint-saens-symphony-3.md`.
Shared-file additions (painting, glossary, **new composer `saint-saens`**): `content/research/saint-saens-symphony-3.shared.md`.

**How the checks were done.** As in `brahms-symphony-2.md` (Spotify embed `__NEXT_DATA__` from a Turkish network; album page; Discogs API). Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 0. Four tracks for a two-movement symphony

Saint-Saëns wrote the symphony in two movements, each in two parts, and said in his programme note for the premiere that it "contains, in principle, the four traditional movements" (Wikipedia, quoting Fallon 1973). Wikipedia adds that "many recordings divide it in this manner". The reference album lists the four parts as tracks "I. Adagio – Allegro moderato", "II. Poco adagio", "III. Allegro moderato", "IV. Maestoso – Allegro", so each track is one of the composer's four sections, not a cut inside one. The guide follows the album (four "movements"), and its big picture explains the two-part design. If the merge requires strictly the printed two movements, no common recording on Spotify gives them as two tracks (Karajan's DG album, for example, labels them 1a/1b/2a/2b), so this needs a decision rather than another album.

---

## 1. Reference recording: Charles Munch / Boston Symphony Orchestra / Berj Zamkochian (RCA, 1959)

Why this one: the classic recording of the work (Wikipedia: "one of the most renowned recordings"; The Classic Review's "Top five": "remains the one to beat"; HiFi News "essential recordings").

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Berj Zamkochian (organ); Charles Munch; Boston Symphony Orchestra | Spotify credits ("Charles Münch"); Discogs 6893991: Munch, BSO, Zamkochian "Organ [Aeolian-Skinner organ]", Bernard Zighera and Leo Litwin (piano) | https://open.spotify.com/embed/album/6vf3d03hEL1K0e4GwZjWLd ; https://www.discogs.com/release/6893991 | OK |
| Label / catalogue | RCA Victor Red Seal, LSC-2341 (LP, Living Stereo); 09026-61500-2 (CD) | Discogs 6893991 / 2341745: LSC-2341, 1959, "Recorded At Symphony Hall, Boston", © 1959. CD number 09026-61500-2 is the RCA Living Stereo CD coupling with Debussy and Ibert; the Spotify album carries "℗ 1993 BMG Entertainment", matching that 1993 CD, but its number was not seen on a primary page | https://www.discogs.com/release/6893991 ; https://www.discogs.com/release/2341745 | OK (LP) / SECONDARY (CD no.) |
| Recorded | 5–6 April 1959 | JVC XRCD JMCXR-0002 (Discogs 11224120): "Recorded April 5 & 6, 1959" | https://www.discogs.com/release/11224120 | OK |
| Venue | Symphony Hall, Boston | Discogs 6893991, 9326897 | same | OK |
| Producer / engineer (not in yaml) | – | Richard Mohr; Lewis Layton | Discogs 6893991 | OK |
| Spotify | https://open.spotify.com/album/6vf3d03hEL1K0e4GwZjWLd | "Saint-Saëns: Symphony No. 3 / Debussy: La Mer / Ibert: Escales", Charles Münch, 1993, 10 tracks; symphony tracks 1–4, all `isPlayable: true` | embed + album page | VERIFIED |

Other Spotify editions of the same performance (not used): `15cG7f7OMUhWgl1lOSsHHe` (Mangora Classical, 2016, a different transfer: 9:54/9:36/7:34/7:48), `3S6QgkOnqdGbHeZGex4Xsu`, and the Sony compilation `3uJqdA2MXhqvLmzm2Gjgx8`.

### Durations (Spotify embed, album 6vf3d03hEL1K0e4GwZjWLd)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Adagio – Allegro moderato | 584666 | 9:45 | true |
| 2 | II. Poco adagio | 571293 | 9:31 | true |
| 3 | III. Allegro moderato | 458373 | 7:38 | true |
| 4 | IV. Maestoso – Allegro | 457866 | 7:38 | true |
| | Total | 2072198 | 34:32 → `duration_min: 35` | |

---

## 2. Also recommended: Karajan / Berliner Philharmoniker / Pierre Cochereau (DG, 1981–82)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Pierre Cochereau (organ), Berliner Philharmoniker, Herbert von Karajan | Spotify credits | OK |
| Recorded | DG product page data: recording location "Philharmonie, Berlin", recording date year 1981, month 9 (one entry with day 21) | https://www.deutschegrammophon.com/en/catalogue/products/saint-saens-orgel-symphonie-karajan-190 (page JSON) | OK |
| Organ part | Recorded separately and added to the orchestral recording (HiFi News: a "bolt-on" organ). Where it was recorded was not verified (commonly said to be Notre-Dame de Paris, where Cochereau was organist) | https://hifinews.com/content/saint-saëns-symphony-no-3-organ-essential-recordings-0 (via search summary) | SECONDARY |
| Release | "© 1982 Deutsche Grammophon GmbH, Berlin"; catalogue number not checked (`null`) | album page | OK |
| Spotify | https://open.spotify.com/album/79xI4v3s6h5EGRCmOkgcUL (linked from the DG product page), 4 tracks 10:35 / 11:50 / 7:01 / 8:29, all `isPlayable: true` | embed | VERIFIED |

---

## 3. Painting: Henry Lerolle, *The Organ Rehearsal*, 1885

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Henry Lerolle (Paris 1848–1929 Paris) | Met API `artistDisplayBio` | OK |
| Title / date | *The Organ Rehearsal* (*La Répétition à l'orgue*), 1885 (Wikidata also lists 1887) | https://collectionapi.metmuseum.org/public/collection/v1/objects/436880 ; Wikidata Q3988570 | OK |
| Medium / size | Oil on canvas, 236.9 × 362.6 cm | Met API | OK |
| Collection | The Metropolitan Museum of Art, New York, Gift of George I. Seney, 1887, 87.8.12 | Met API | OK |
| Rights | `isPublicDomain: true`, Met Open Access (CC0); artist died 1929 | Met API; Commons {{Cc-zero}} | OK |
| Image | File:The_Organ_Rehearsal_MET_DP160223.jpg, 3919 × 2622 px (landscape ≈ 1.5:1); the Met original is images.metmuseum.org/CRDImages/ep/original/DP160223.jpg | Commons | OK |
| What it shows | An organ loft with a woman singing beside the organ and listeners (Commons infrared study "singing woman"); the church is not named in the sources checked, so the guide says only "a church loft" | Commons category | OK |
| Pairing | Paris, 1885, the year before the symphony; Saint-Saëns was organist at Saint-Merri (1853–58) and La Madeleine (1858–77), "more than twenty years" | Wikipedia (Saint-Saëns) | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Commissioned by the (Royal) Philharmonic Society of London; composed mainly in the first months of 1886, finished by April | https://en.wikipedia.org/wiki/Symphony_No._3_(Saint-Saëns) ; IMSLP "1886 (April)" | OK |
| Written alongside *The Carnival of the Animals* (letter to Durand, February 1886) | same | OK |
| Premiere 19 May 1886, St James's Hall, London, conducted by Saint-Saëns; first half: he played Beethoven's Fourth Concerto (Sullivan conducting) | same; https://bso.org/works/saint-saens-symphony-no-3-organ-symphony | OK |
| Dedicated to Liszt's memory; Liszt died 31 July 1886; he had acknowledged the intended dedication in June 1886 | en Wikipedia; IMSLP ("A la mémoire de Franz Liszt"); BSO note | OK |
| Two movements, "contains, in principle, the four traditional movements"; many recordings divide it in four | en Wikipedia (Fallon 1973, p. 370) | OK |
| Organ in two of the four sections; piano two and four hands | en Wikipedia (lead; Instrumentation); de Wikipedia (organ first at bar 350, *Poco adagio*) | OK |
| Cyclic themes and Lisztian thematic transformation | en Wikipedia | OK |
| Dies irae resemblance debated (Baumann vs Fallon) | en Wikipedia | OK |
| "I gave everything to it I was able to give. What I have here accomplished, I will never achieve again." | en Wikipedia (Smith 1992, p. 126); de Wikipedia gives the same in German | OK |
| He never wrote another symphony | en Wikipedia (Holoman 2004) | OK |
| C minor to C major, compared with Beethoven's Fifth | en Wikipedia (Deruchie 2013) | OK |
| I: Adagio introduction with broken woodwind phrases; Allegro with a restless string figure that becomes the main theme; ends with pizzicato cellos and basses on G, then the organ's A-flat | BSO note (Hugh Macdonald); en Wikipedia | OK |
| II: organ alone on A-flat (bar 350), full D-flat chord and strings in unison (bar 352); second statement on clarinet, two horns and two trombones across three octaves; pizzicato basses recall the Allegro theme; reprise and serene close; *voix céleste* and 32-foot pedal from bar 439 to the end | de Wikipedia; BSO note | OK |
| III: scherzo in C minor; Presto in C major with both-hand piano scales | BSO note; en Wikipedia | OK |
| IV: organ's C major chord at *Maestoso* (bar 376); piano four hands with the strings' theme (bar 384); theme fortissimo in strings and organ (bar 392); fugal writing; brief pastoral interlude; climax; organ pedal scale down C major in bars 665–668 | de Wikipedia; en Wikipedia; BSO note | OK |
| Pianists Bernard Zighera and Leo Litwin; Symphony Hall's Aeolian-Skinner organ ("the hall's organ") | Discogs 6893991 | OK |
| Metres: I (Allegro) and III in 6/8; II and IV left as "–" (not checked in a score) | – | UNVERIFIED (II, IV) |

---

## 5. Re-time

All stops are estimates (≈). Method: no bar-by-bar timed guide was available. Part One: the *Poco adagio* starts at bar 350 (de Wikipedia), marked ♩ = 60, so its stops were placed at (bar − 350) × 4 s from the bars given by de Wikipedia and the order of events in the BSO note; bar 439 (*voix céleste*) gives ≈ 5:56. Part One's Allegro (bars ≈ 12–349 in ≈ 8:50 at about 1.6 s per bar) and the scherzo were placed by proportion and the order of events in Wikipedia and the BSO note, so they are rough. The finale was placed from bars 376/384/392 (opening seconds) and by proportion for the rest.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Adagio – Allegro moderato | 9:45 | 0:00, 0:55, 2:45, 3:45–5:00, 5:30, 7:00, Last minute | All of 2:45 (second theme), 3:45–5:00 and 5:30: placed by proportion only. Start of the Allegro (≈ 0:55) depends on Munch's introduction tempo |
| II Poco adagio | 9:31 | 0:00, 0:10, 1:05, 2:00–3:30, 4:30, 6:00, Last minute | Return of the hymn (≈ 4:30) |
| III Allegro moderato – Presto | 7:38 | 0:00, 1:45, 3:15, 4:30, 5:15–7:00, Last 30 seconds | Both *Presto* entries (≈ 1:45, ≈ 4:30) |
| IV Maestoso – Allegro | 7:38 | 0:00, 0:20, 0:45, 1:45, 3:00–3:45, 4:30, 6:00, Last 40 seconds | Fugato (≈ 1:45), pastoral interlude (≈ 3:00–3:45), climax (≈ 6:00) |
