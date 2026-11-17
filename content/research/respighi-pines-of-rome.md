# Verification: Respighi – Pines of Rome (Pini di Roma), P. 141

Piece id `respighi-pines-of-rome`. Checked on 2026-11-17 (batch 2026-11, group J).
Files: `content/drafts/en/respighi-pines-of-rome.md`, `content/drafts/tr/respighi-pines-of-rome.md`.
Shared-file additions (paintings.yaml, new composer `respighi`; no new glossary terms): `content/research/respighi-pines-of-rome.shared.md`.

**How the checks were done**
- **Spotify:** embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: credits, `duration` ms, `isPlayable`), fetched from a Turkish network on 2026-11-17. The reference album id is the one linked from DG's own product page.
- **DG metadata:** the DG product pages embed per-track JSON with `recordingDateYear/Month/Day` and the venue.
- **Discogs:** public API.
- **Status key:** OK = primary source. SECONDARY = retailer, review or search snippet. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Karajan / Berliner Philharmoniker (DG, 1977–78)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Herbert von Karajan / Berliner Philharmoniker | Spotify credits on tracks 5–8: "Ottorino Respighi, Berlin Philharmonic, Herbert von Karajan" | https://open.spotify.com/embed/album/5RXVBRRT8aYNWjcUquKfmg | OK |
| Label / catalogue | DG; 2531 055 (LP); 449 724-2 (CD, The Originals) | Discogs 2493059: DG 2531 055, *Fontane di Roma • Pini di Roma*, 1978, ℗ 1978 Polydor International; producers Hans Hirsch, Magdalene Padberg; recording supervisors Cord Garben (Fontane), Michel Glotz (Pini); Tonmeister Günter Hermanns. Discogs 1847978: DG 449 724-2 (1996): "Fontane Di Roma and Pini Di Roma originally released as Deutsche Grammophon 2531 055 (1978)" | https://www.discogs.com/release/2493059 ; https://www.discogs.com/release/1847978 | OK |
| Recorded | December 1977 – February 1978 | 449 724-2 booklet (Discogs notes): "Berlin, Philharmonie, 12/1977 & 1, 2 1978 (Fontane Di Roma and Pini Di Roma)". DG page metadata gives a single date, 26 Feb 1978, for all eight tracks (probably the last session) | Discogs 1847978 ; https://www.deutschegrammophon.com/en/catalogue/products/karajan-respighi-boccherini-albinoni-10445 | OK |
| Venue | Philharmonie, Berlin | Booklet and DG metadata ("Philharmonie, Berlin") | same | OK |
| Release year / year | 1978 / 1978 | LP ℗ 1978 | Discogs 2493059 | OK |
| Spotify | 5RXVBRRT8aYNWjcUquKfmg | "Respighi: The Fountains of Rome; The Pines of Rome; Ancient Airs and Dances - Suite III / Boccherini: Quintettino / Albinoni: Adagio in G Minor", 18 tracks; linked from the DG product page | embed ; DG page | VERIFIED |

### Durations (Spotify embed, album 5RXVBRRT8aYNWjcUquKfmg)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | I. The Pines of Villa Borghese | 176426 | 2:56 | true |
| 6 | II. The Pines near a Catacomb | 414200 | 6:54 | true |
| 7 | III. The Pines of the Janiculum | 401500 | 6:42 | true |
| 8 | IV. The Pines of the Appian Way | 316750 | 5:17 | true |
| | Total | 1308876 | 21:49 → `duration_min: 22` | |

Note: track 16 of the album (Boccherini, *Passacalle*) has `isPlayable: false` in Turkey. It is not part of this work and does not matter for the guide. 449 724-2 gives 21:56 for the *Pines*.

## 2. Also recommended: Ozawa / Boston Symphony Orchestra (DG, 1977)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Seiji Ozawa / Boston Symphony Orchestra | Spotify credits | https://open.spotify.com/embed/album/1iaJJqJNZpqIcPBuk2zDuo | OK |
| Label / catalogue | DG; 2530 890 (LP, with Feste romane); 415 846-2 (CD) | Discogs 3396308 (2530 890, Germany 1979); Discogs 3282374 (415 846-2, 1987, "℗ 1979 Polydor International"; recording supervisor Rainer Brock, engineer Klaus Hiemann) | https://www.discogs.com/release/3396308 ; https://www.discogs.com/release/3282374 | OK |
| Recorded / venue | October 1977, Symphony Hall, Boston | DG product page metadata: *Pini* tracks 17 October 1977, "Symphony Hall, Boston", studio | https://www.deutschegrammophon.com/en/catalogue/products/respighi-pini-di-roma-ozawa-4495 | OK |
| Spotify | 1iaJJqJNZpqIcPBuk2zDuo | "Respighi: Pini di Roma; Feste romane; Fontane di Roma", 12 tracks; *Pini* = tracks 1–4: 2:40 / 7:01 / 7:07 / 4:58, all `isPlayable: true` (id from the MusicBrainz release) | embed | VERIFIED |

Also checked, not used: Maazel / Pittsburgh SO (Sony, 01tG5Vc9FraeMgzTN2k7SV; 2:43 / 7:10 / 7:25 / 4:46, all playable); Doráti / Minneapolis (Mercury mono, 0ERzTBbDuKqIc8YNAphiU0). Reiner / Chicago (RCA, 1959) was not found as a verifiable Spotify album id in this session.

---

## 3. Painting: Hendrik Voogd, *Italian Landscape with Umbrella Pines*, 1807

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Hendrik Voogd (1768–1839), Dutch, worked in Rome from 1788; the museum calls him "the 'Dutch Claude'" | https://www.rijksmuseum.nl/en/collection/SK-A-4688 | OK |
| Title / date | *Italian Landscape with Umbrella Pines* (*Italiaans landschap met parasoldennen*), signed and dated lower right "H. Voogd fecit Roma 1807" | Rijksmuseum record via Commons; museum page | OK |
| Subject | Rijksmuseum: umbrella pines in the garden of the Villa Borghese in Rome, with the Villa Giulia and Monte Mario in the background; "Voogd painted the gardens of the Villa Borghese in Rome in the late afternoon". Small figures (children and adults) play in the foreground | same ; thumbnail checked | OK |
| Medium / size | Oil on canvas, 101.5 × 138.5 cm; purchased 1976 | Commons (Rijksmuseum data) | OK |
| Rights | Artist died 1839. Rijksmuseum image CC0 ("Publiek domein") | https://commons.wikimedia.org/wiki/File:Italiaans_landschap_met_parasoldennen,_SK-A-4688.jpg | OK |
| Image | 7058 × 5104 JPEG (6.2 MB), Rijksmuseum's own photograph | same | OK |

**Pairing.** The painting shows the exact place of the first movement (the pine wood of the Villa Borghese), with figures at play under the pines, and the umbrella pines that Respighi said spoke to his imagination. Painted in Rome 117 years before the music.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Completed summer 1924, after several years; second of three Roman tone poems (*Fountains* 1916, *Feste romane* 1928) | https://en.wikipedia.org/wiki/Pines_of_Rome | OK |
| Moved from Bologna to Rome in 1913 (professor of composition, Liceo Musicale di Santa Cecilia); the city's "marvellous fountains" and "umbrella-like pines that appear in every part of the horizon" spoke to his imagination above all | same ; https://en.wikipedia.org/wiki/Ottorino_Respighi | OK |
| *Fountains of Rome* brought him international fame (via Toscanini's 1918 Milan concerts) | both articles | OK |
| Four movements with Respighi's programme notes (Villa Borghese children: ring games, soldiers, swallows; catacomb chant "like a hymn"; Janiculum full moon and nightingale; Appian Way misty dawn, tread of steps, consul's army to the Capitol) | Wikipedia ; Tucson Symphony note (Respighi's text) https://www.tucsonsymphony.org/program-notes/respighi/pines-of-rome/ | OK |
| Played without a break | Hollywood Bowl note (John Henken): "played without a break" https://www.hollywoodbowl.com/musicdb/pieces/561/pines-of-rome | OK |
| I: no low instruments; trills, harp and keyboard glissandi, high brass; ends abruptly | Runyan note https://www.runyanprogramnotes.com/program_note/pines-rome-p-141/ | OK |
| I: Elsa recalled singing him the songs she sang while playing in the gardens as a child | Wikipedia (Pines), from Elsa's recollection | OK (told as her recollection) |
| II: Kyrie and Sanctus chants; offstage trumpet plays the Sanctus; low instruments and organ pedal; trombones and horns as priests chanting | Wikipedia (Pines) ; Runyan | OK |
| III: opened by piano (and gong); clarinet *come in sogno*; recorded nightingale specified in the score (Gramophone disc R. 6105), "considered innovative … the first such instance in music" | Wikipedia ; Runyan | OK. The guide says "one of the first uses of recorded sound in a concert work" (cautious) |
| IV: organ bottom B-flat on 8′, 16′, 32′ pedals; six buccine, usually flugelhorns, sometimes offstage; cor anglais solo | Wikipedia ; Runyan ("A sinuous solo in the English horn") | OK |
| Large orchestra with piano, celesta, organ, offstage brass, gramophone | Hollywood Bowl and Tucson instrumentation lists | OK |
| Premiere 14 December 1924, Teatro Augusteo, Rome, Molinari; success; US premiere 14 January 1926, Toscanini, New York Philharmonic; most recorded of his works | Wikipedia (Pines) | OK |
| Studied orchestration with Rimsky-Korsakov in St Petersburg (1900–01, 1902) | Wikipedia (Respighi) | OK |
| Scenes move back in time and from day to night to dawn (Rehding and Dolan) | Wikipedia (Pines) | OK |
| Karajan recording: Philharmonie, Dec 1977 – Feb 1978, with *Fountains*; Spotify track order | §1 | OK |

Not used: Fantasia 2000 (whales), Mussolini's admiration for the work (Henken), Respighi's "I-don't-know-what in the pit of his stomach" (Elsa's report).

## 5. Re-time (all stops are ≈; nobody has listened against the Karajan tracks)

Method: Respighi's programme and the section order from the notes above, laid over Karajan's track lengths. The four tracks run into each other, so the first and last seconds of each track may hold the tail or start of the neighbouring scene.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Villa Borghese | 2:56 | 0:00, 0:20, 1:00–1:50, 1:50–2:40, Last 15 seconds | The soldiers' section (≈ 1:00–1:50) |
| II Catacomb | 6:54 | 0:00, 0:30, 1:45–3:00, 3:15–4:30, 4:30–5:30, Last 80 seconds | Offstage trumpet (≈ 1:45–3:00) and the climax (≈ 4:30–5:30) |
| III Janiculum | 6:42 | 0:00, 0:15, 1:30–3:00, 3:30–4:30, 5:15, Last 40 seconds | Climax (≈ 3:30–4:30) and the nightingale's entry (≈ 5:15) |
| IV Appian Way | 5:17 | 0:00, 0:40, 1:30–2:30, 2:30–3:30, 3:30–4:40, Last 30 seconds | Cor anglais entry (≈ 0:40) and the buccine (≈ 2:30–3:30) |

---

## 6. Composer: Ottorino Respighi (new entry, id `respighi`)

See `## 3` of the shared note for the yaml and the composers-sources text. Portrait: Becker & Maass (photographer Marie Böhm, 1863–1953), Berlin, published 1927 in the front matter of the vocal score of *La campana sommersa* (Bote & Bock). EU/Turkey: life + 70 expired on 1 January 2024. US: foreign work published 1927; even with URAA restoration the term was 95 years from publication, expired 1 January 2023. Commons tag {{PD-old-70-expired}}. The attribution to Marie Böhm comes from the Commons file page (creator templates "Becker & Maaß" and "Marie Boehm"); the scan's printed credit was not seen. The death dates of the studio's founders were not checked; if the merge needs more certainty, confirm the printed credit in a copy of the 1927 vocal score.
