# Verification: Bruckner – Symphony No. 4 in E-flat major, "Romantic", WAB 104

Piece id `bruckner-symphony-4`. Checked on 2026-10-24 (batch October 2026, second batch, group I).
Files: `content/drafts/en/bruckner-symphony-4.md`, `content/drafts/tr/bruckner-symphony-4.md`.
Shared-file additions (paintings.yaml entry, alternatives, glossary row, re-time rows): `content/research/bruckner-symphony-4.shared.md`.

**How the checks were done:** Spotify album ids found with Spotify's own web search (open.spotify.com/search, read in the built-in browser). Each id confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: track titles, credited artists, `duration` in ms, `isPlayable`, read from this machine's Turkish network) and the album page meta (`og:description`, `music:release_date`, `og:restrictions:country:allowed` incl. TR, ℗/© lines). Label data from the Discogs API (`api.discogs.com/releases/<id>`). Facts from Wikipedia (read via the MediaWiki API) and the documents named below. Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere; requests used `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Böhm / Wiener Philharmoniker (Decca, 1973)

Why this one: a classic, widely admired account (recommended by the Bruckner Society of America's John Proffitt as one of three outstanding recordings; reviewed favourably in Gramophone and BBC Music Magazine, per search results), one Spotify track per movement, all playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Karl Böhm / Wiener Philharmoniker | Spotify credits on all four tracks | https://open.spotify.com/embed/album/0vXi3WQ0ZuemZ80Gv8U9Va | OK |
| Edition | 1878–80 version, Nowak edition (yaml comment + "In this recording") | Spotify track titles: "(1878/80 Version, Ed. Nowak)". Note: Nowak's 1953 edition labelled "1878–1880" actually prints the 1886 variant of the 1880 version (Wikipedia, Versions › 1886 variant) | embed ; https://en.wikipedia.org/wiki/Symphony_No._4_(Bruckner) | OK |
| Label / catalogue | Decca, "6BB 171/2 (LP); 475 8403 (CD)" | Discogs 4085314: Decca 6BB 171/2, 2 × LP, UK, October 1974. Discogs 12012491: Decca 475 8403 (2007 CD), 68:10, "Originally released in the UK on LP in 1974 on Decca 6BB 171/2" | https://api.discogs.com/releases/4085314 ; https://api.discogs.com/releases/12012491 | OK |
| Recorded / venue | November 1973, Sofiensaal, Vienna | Discogs 4085314 notes: "Recorded November 1973 in the Sofiensaal, Vienna" | same | OK |
| Release year | 1974 | Discogs: released 1974-10; Spotify ℗ 1974 Decca Music Group Limited | Discogs ; https://open.spotify.com/album/0vXi3WQ0ZuemZ80Gv8U9Va | OK |
| Producer / engineer (not in yaml) | – | Michael Woolcock / Colin Moorfoot; liner notes Robert Simpson | Discogs 4085314 | OK |
| Spotify | https://open.spotify.com/album/0vXi3WQ0ZuemZ80Gv8U9Va | "Bruckner: Symphony No. 4 "Romantic"", album, 1974, 4 songs; © 2007 / ℗ 1974 Decca; `og:restrictions:country:allowed` includes TR | album page | VERIFIED |

The Spotify album's 68:10 total matches the 2007 CD 475 8403 exactly (Discogs tracklist 68:10), so it is most likely that remaster.

### Durations (Spotify embed, album 0vXi3WQ0ZuemZ80Gv8U9Va)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Bewegt, nicht zu schnell | 1214000 | 20:14 | true |
| 2 | II. Andante quasi allegretto | 934000 | 15:34 | true |
| 3 | III. Scherzo. Bewegt – Trio. Nicht zu schnell. Keinesfalls schleppend | 669000 | 11:09 | true |
| 4 | IV. Finale. Bewegt, doch nicht zu schnell | 1273000 | 21:13 | true |
| | Total | 4090000 | 68:10 → `duration_min: 68` | |

---

## 2. Also recommended: Abbado / Wiener Philharmoniker (DG, 1990)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Claudio Abbado, Wiener Philharmoniker | Spotify credits | OK |
| Label / catalogue | Deutsche Grammophon 431 719-2 | https://api.discogs.com/releases/13453019 ; https://api.discogs.com/releases/9001612 | OK |
| Recorded / venue | "Recording: Wien, Musikverein, Großer Saal, 10/1990" | Discogs 13453019 and 7145836 | OK |
| Release | ℗ 1991 DG | Discogs ; album page (℗ 1991) | OK |
| Edition | Nowak (Discogs credits Leopold Nowak, score editor; Spotify: "1886 Version, Ed. Nowak") | same | OK |
| Spotify | https://open.spotify.com/album/1WqJn6V2xD6ZkZgVy4gSMK, 4 tracks (19:03 / 16:18 / 10:35 / 22:45), all `isPlayable: true`, TR in allowed markets | embed + album page | VERIFIED |

---

## 3. Painting: Karl Friedrich Schinkel, *Medieval City on a River*, 1815

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Karl Friedrich Schinkel (1781–1841), Prussian architect and painter | https://en.wikipedia.org/wiki/Karl_Friedrich_Schinkel | OK |
| Title | *Mittelalterliche Stadt an einem Fluss* (*Medieval City on a River*) | Wikidata Q50119136 ; Commons | OK |
| Date | 1815 | Wikidata P571 | OK |
| Medium / size | Oil on canvas, 95 × 140.6 cm (Wikidata also gives 90 × 140) | Wikidata P186, P2048/P2049 | OK |
| Collection | Alte Nationalgalerie, Staatliche Museen zu Berlin, inv. NG 6a/91 | Wikidata P195/P217; Commons object history: "1923 mit der Sammlung des Beuth-Schinkel-Museums in die Verwaltung der Nationalgalerie übergegangen" | OK |
| Image | File:1815 Schinkel Mittelalterliche Stadt an einem Fluss anagoria.JPG, 4827 × 3168 px, gallery photo by User:anagoria (3 July 2014), {{PD-Art\|PD-old-100-expired}} | https://commons.wikimedia.org/wiki/File:1815_Schinkel_Mittelalterliche_Stadt_an_einem_Fluss_anagoria.JPG | OK |
| Rights | Artist died 1841: public domain everywhere. Faithful photo of a 2-D PD work: no new right (EU DSM art. 14; US). The SMB's own photographs are CC BY-NC-SA and are **not** used | – | OK |
| Museum page | Not found (the SMB online collection is a JavaScript app); the yaml uses the Wikidata item as `source_url` | – | UNVERIFIED (museum URL) |
| Format | Landscape ≈ 1.52:1 | thumbnail check | – |
| What it shows | A Gothic cathedral (still with scaffolding on one tower), a castle on a wooded hill at left, a city and bridge by a river, a procession of riders and coaches in the foreground, a rainbow in a clearing storm | visual check of a 960 px thumbnail | OK |
| Pairing | Bruckner's programme as reported by Theodor Helm via Bernhard Deubler: "Mediaeval city—Daybreak—Morning calls sound from the city towers—the gates open—On proud horses the knights burst out into the open…" | Symphony No. 4 Wikipedia article (Description › First movement) | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Written in 1874, revised several times to 1888; one of his most popular works | https://en.wikipedia.org/wiki/Symphony_No._4_(Bruckner) | OK |
| New "Hunt" scherzo December 1878; new finale 19 November 1879 – 5 June 1880 | same (Versions › IIA, IIB) | OK |
| Premiere of this version 20 February 1881, Vienna, Hans Richter, to great acclaim; first premiere of a Bruckner symphony not conducted by Bruckner | same (lead; Version IIB) | OK |
| Nickname "Romantic" used by the composer himself | same (lead) ; Proffitt notes ("the only symphony given a subtitle – 'Romantic' – by the composer himself") https://www.abruckner.com/down/documents/Proffitt_B4_Notes.pdf | OK |
| Letters: horn proclaims the day from the town hall; Gesangsperiode = song of the great tit "Zizipe"; II "song, prayer, serenade"; III hunt, trio a barrel-organ / dance during the midday meal in the forest (letters to Levi 8 Dec 1884 and Paul Heyse 22 Dec 1890; Tappert Oct 1878) | Wikipedia (Description › First movement; Version IIA) | OK. The guide says "dance tune played during the hunters' meal", the wording of the trio's title *Tanzweise während der Mahlzeit auf der Jagd* |
| Helm/Deubler fuller programme: medieval city, daybreak, gates open, knights ride out, forest | same | OK |
| Organ-like orchestration (blocks like organ stops) | Proffitt notes | SECONDARY |
| "Bruckner rhythm" (2 + 3), stated by the brass in I | Wikipedia ("insistent statement of the Bruckner rhythm"); Proffitt notes | OK |
| I: tremolo strings, horn call opens; three theme groups; second group (Gesangsperiode) in D-flat major; development features a brass chorale based on the horn call | Wikipedia | OK |
| I: third group in B-flat major | Proffitt notes ("The third thematic group in B-flat Major") | OK |
| I: Gesangsperiode melody in the violas with a violin bird call above | Score knowledge | SECONDARY (not checked against the score) |
| I: recapitulation with a flute line weaving around the horn call | Score knowledge | SECONDARY |
| II: C minor, begins with a cello melody; five-part form A–B–A–B–A–coda | Wikipedia | OK |
| II: second theme a viola melody over pizzicato strings | Score knowledge | SECONDARY |
| II: climax in C major near the end | Score knowledge | SECONDARY |
| III: trio in G-flat major, a dance ("Ländler") | Wikipedia (versions table: Trio G♭ major); Proffitt ("a bucolic, folk-like Ländler, or country dance") | OK |
| IV: opens with a string ostinato; horns recall the scherzo; fortissimo unison tutti; a "song period" in the strings with bird-like woodwinds; coda restates the opening theme | Proffitt notes | OK |
| IV: quiet chorale in the coda (bar 489 in the 1880 finale) | Wikipedia (Fourth movement › Third version) | OK |
| IV: in the 1886 variant (Nowak "1878/80"), third and fourth horns play the first movement's main theme in the last bars | Wikipedia (Versions › 1886 variant) | OK |
| Revised between 1874 and 1888 (Threads) | Wikipedia | OK |
| Metres: I 2/2, III 2/4 – 3/4, IV 2/2 | Score knowledge | SECONDARY |
| Metre II 4/4 | Score knowledge | UNVERIFIED (could be alla breve; check a score before publishing) |
| Recording facts (Sofiensaal, November 1973, Nowak edition, Decca 2 LPs 1974) | Discogs 4085314; Spotify titles | OK |

---

## 5. Re-time

All stop times are estimates (≈), derived from the bar positions of the 1878/80 version (I: 573 bars, IV: about 541 bars, coda chorale at bar 489 per Wikipedia), the published structure and the exact track lengths, assuming a roughly even average tempo per movement (I ≈ 2.1 s per bar; IV ≈ 2.35 s per bar, slower in the coda). The scherzo and trio times assume a typical scherzo ≈ 40 % / trio ≈ 20 % / da capo ≈ 40 % split. Nobody has listened against Böhm's tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Bewegt, nicht zu schnell | 20:14 | 0:00, 0:45, 1:45, 2:40, 4:15, 6:50, 10:30–11:15, 12:50, 18:00, Last minute | Brass chorale (≈ 10:30), recapitulation (≈ 12:50), coda (≈ 18:00) |
| II Andante quasi allegretto | 15:34 | 0:00, 1:30, 3:15, 5:15, 8:00, 10:30–12:30, Last 2 minutes | Returns of A and B (≈ 5:15, ≈ 8:00), climax window |
| III Scherzo – Trio | 11:09 | 0:00, 0:45, 1:45, 3:15, 4:40, 6:45, Last 30 seconds | Trio start (≈ 4:40) and da capo (≈ 6:45) |
| IV Finale | 21:13 | 0:00, 1:50, 3:45, 6:00, 8:00, 14:00, 18:10, Last 90 seconds | Development (≈ 8:00) and recapitulation (≈ 14:00); in this version the boundary is blurred |
