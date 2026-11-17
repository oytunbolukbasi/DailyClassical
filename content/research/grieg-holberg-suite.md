# Verification: Grieg – From Holberg's Time (Holberg Suite), Op. 40

Piece id `grieg-holberg-suite`. Checked on 2026-11-17 (batch November 2026, group H).
Files: `content/drafts/en/grieg-holberg-suite.md`, `content/drafts/tr/grieg-holberg-suite.md`.
Shared-file additions: `content/research/grieg-holberg-suite.shared.md`.

**How the checks were done**
- **Spotify:** album ids from Spotify's own web search (browser pane); albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from this machine's Turkish network; album page for ℗/©, release date and `og:restrictions:country:allowed`.
- **Discogs** public API; **IMSLP** work page (API wikitext: movements, bar counts, metronome marks, dedication); English, Norwegian (bokmål), German and Japanese Wikipedia; **SMK** (Statens Museum for Kunst) open API and Wikimedia Commons for the painting.
- Status key as in the other notes. No personal data sent; `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Marriner / Academy of St Martin in the Fields (Argo, 1970)

Why this one: the classic chamber-orchestra recording, five tracks (Gavotte and Musette in one track), all playable in Turkey. Same album and LP as the reference for `dvorak-serenade-for-strings`.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Sir Neville Marriner / Academy of St Martin in the Fields | Embed credits tracks 10–14: "Edvard Grieg, Academy of St. Martin in the Fields, Sir Neville Marriner" | https://open.spotify.com/embed/album/6tmJfuzKADjHbMG3zxGSCK | OK |
| Label / LP | Argo ZRG 670, with Dvořák's Serenade | Discogs 5931443 (Argo ZRG 670, UK, 1970) | https://www.discogs.com/release/5931443 | OK |
| Recorded / venue | May 1970, Kingsway Hall, London | Discogs 10830446 (Argo 478 6891): "Recording date: May 1970 (tracks 1 to 10)" = Dvořák and Grieg; Kingsway Hall | https://www.discogs.com/release/10830446 | OK |
| Spotify | https://open.spotify.com/album/6tmJfuzKADjHbMG3zxGSCK | 1970, 14 songs, "℗ 1970 Decca Music Group Limited"; TR allowed | embed + album page | VERIFIED |

### Durations and playability (embed, album 6tmJfuzKADjHbMG3zxGSCK)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 10 | I. Praeludium. Allegro vivace | 166000 | 2:46 | true |
| 11 | II. Sarabande. Andante | 272000 | 4:32 | true |
| 12 | III. Gavotte. Allegretto (with Musette) | 209000 | 3:29 | true |
| 13 | IV. Air. Andante religioso | 367000 | 6:07 | true |
| 14 | V. Rigaudon. Allegro con brio | 225000 | 3:45 | true |
| | Total | 1239000 | 20:39 → `duration_min: 21` | |

Five tracks, within the six-track limit for suites.

---

## 2. Also recommended: Neeme Järvi / Gothenburg Symphony Orchestra (DG)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Neeme Järvi, Gothenburg Symphony Orchestra | Embed credits, album 1svqZTOGQ1yT4t3p5IRDZX (tracks 1–5) | OK |
| Label / catalogue | Deutsche Grammophon 437 520-2 (1993) | Discogs 6999521: "Recordings: Gothenburg, Konserthuset, … 3/1992 (Op. 40)"; ℗ 1993 | https://www.discogs.com/release/6999521 | OK |
| Spotify | DG compilation 2013, 18 songs; Holberg 3:00 / 3:15 / 3:32 / 5:21 / 4:01, all `isPlayable: true`; TR allowed | https://open.spotify.com/album/1svqZTOGQ1yT4t3p5IRDZX | VERIFIED |

Also checked and playable: Karajan / Berliner Philharmoniker (`3seAsETnOyscPpXkoblvMw`, tracks 9–13: 3:04 / 4:16 / 3:50 / 5:50 / 3:57; DG 1989 compilation, recording date not checked); Tognetti / Australian Chamber Orchestra (`4Mawi4aDgqts7IKkSlsOZq`).

---

## 3. Painting: Wilhelm Marstrand, *Scene from Ludvig Holberg's The Lying-in Room* (*Motiv fra Ludvig Holberg: Barselstuen*), 1845

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Wilhelm Marstrand (Danish, 1810–1873) | Commons; SMK | OK |
| Title / date | Motiv fra Ludvig Holberg: Barselstuen, 1845 | SMK API (object KMS506) | OK |
| Medium / size | Oil on canvas (olie på lærred), 80 × 106.5 cm | SMK API | OK |
| Collection | Statens Museum for Kunst, Copenhagen, KMS506 | SMK API | OK |
| Museum page | https://open.smk.dk/artwork/image/KMS506 | SMK API `frontend_url` | OK |
| Image | File:Wilhelm Marstrand - Scene from Ludwig Holberg's The Lying-in Room - KMS506 - Statens Museum for Kunst.jpg, 4596 × 3466 px (same as SMK's native image) | https://commons.wikimedia.org/wiki/File:Wilhelm_Marstrand_-_Scene_from_Ludwig_Holberg%27s_The_Lying-in_Room_-_KMS506_-_Statens_Museum_for_Kunst.jpg | OK |
| Rights | SMK: `public_domain: true`, rights = Public Domain Mark 1.0; artist died 1873 | SMK API | OK |
| Pairing | A scene from Holberg's comedy *Barselstuen* (The Lying-in Room) in eighteenth-century costume, painted 1845: a nineteenth-century artist recreating Holberg's time, as Grieg did in music | – | OK |
| Reuse check | Not in `content/paintings.yaml`; Marstrand not used before. Landscape format (4:3): check the portrait hero crop (the bed and the seated women are on the right half) | – | Note |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Holberg 1684–1754, born in Bergen; Danish-Norwegian playwright; "Molière of the North"; worked mainly in Copenhagen | https://en.wikipedia.org/wiki/Holberg_Suite ; ja.wikipedia (ホルベアの時代から) | SECONDARY |
| Grieg also born in Bergen; Bergen celebrated the bicentenary in 1884 | ja.wikipedia | SECONDARY |
| Grieg wrote a cantata for male voices and the piano suite; Grieg played the suite on 7 December 1884 | ja.wikipedia | SECONDARY |
| Piano original completed August/September 1884; string arrangement 1885 (en/ja) or September 1884 (no.wikipedia). Guide: "then arranged it", no date | en/no/ja.wikipedia | Note: sources disagree, wording cautious |
| First performance 15 March 1885, Bergen (string version per ja; en/no.wikipedia do not specify which version). Guide: "first heard in Bergen in March 1885" | en.wikipedia ; https://no.wikipedia.org/wiki/Holberg-suiten | SECONDARY |
| Subtitle "Suite i gammel stil" (Suite in the olden style); 18th-century dance forms; early neoclassicism | en.wikipedia ; IMSLP | OK |
| Grieg modelled it on the French clavecinists of Holberg's time | ja.wikipedia (Grieg's comment) | SECONDARY |
| Grieg called it a "parykkstykke" (periwig piece) | no.wikipedia ("skal spøkefullt ha omtalt") | SECONDARY (reported) |
| Dedicated to Erika Lie-Nissen (piano version) | IMSLP ; no.wikipedia | OK (not used in the guide) |
| Praeludium: piano arpeggios become repeated chords in a dactylic rhythm; bars 31–34 chords in divided violins with pizzicato scales in the violas; 72 bars | en.wikipedia ; IMSLP | OK |
| Praeludium: broad tune in the lower strings under the gallop | Standard description; not in the sources above | SECONDARY |
| Sarabande: Andante espressivo ♩=52, 32 bars, ternary; solo cello in the middle in the string version | IMSLP ; ja.wikipedia | SECONDARY |
| Gavotte & Musette: Allegretto 𝅗𝅥=80 G major; Musette "un poco più mosso" C major; bagpipe drone | IMSLP ; ja.wikipedia | OK |
| Air: Andante religioso ♩=54, G minor, 56 bars, ternary; Grieg's own dark, at times feverish harmony | IMSLP ; ja.wikipedia | OK |
| Rigaudon: Allegro con brio 𝅗𝅥=144, G major – G minor – G major; solos over pizzicato accompaniment | IMSLP ; ja.wikipedia | OK |
| Rigaudon: the soloists are a violin and a viola | Standard description of the string version | SECONDARY |
| Metres: III and V 2/2 (half-note metronome marks on IMSLP) | IMSLP | OK |
| Metres: I 4/4, II 3/4, IV 3/4 | Inferred from the metronome marks, bar counts and track lengths; not in a reachable source (IMSLP scores behind a bot check) | UNVERIFIED: check the score |

---

## 5. Re-time

Every stop is an estimate (≈), placed from IMSLP's bar counts and metronome marks, the section structure on Wikipedia and the exact Marriner track lengths. Nobody has listened against these tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Praeludium | 2:46 | 0:00, 0:35, 1:10, 1:30, Last 15 seconds | Divided violins with viola pizzicato (bars 31–34, ≈ 1:10 at 2.3 s per bar) |
| II Sarabande | 4:32 | 0:00, 1:15, 2:30, Last 30 seconds | Where the repeats fall; the cello solo (≈ 1:15) |
| III Gavotte – Musette | 3:29 | 0:00, 1:20, 2:15, Last 10 seconds | Musette entry and the da capo |
| IV Air | 6:07 | 0:00, 1:30, 3:00, 4:30, Last minute | Repeat structure assumed; climax and return |
| V Rigaudon | 3:45 | 0:00, 0:40, 1:20, 2:30, Last 10 seconds | Trio entry (≈ 1:20) and the return (≈ 2:30) |
