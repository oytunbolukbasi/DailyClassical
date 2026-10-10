# Verification: Debussy – La mer, L. 109

Piece id `debussy-la-mer`. Checked on 2026-10-10.
Files: `content/en/pieces/debussy-la-mer.md`, `content/tr/pieces/debussy-la-mer.md`.
Shared-file additions (paintings.yaml, composers.yaml; no new glossary terms): `content/research/debussy-la-mer.shared.md`.

**How the checks were done** (same method as `verification-6-10.md`)
- **Spotify:** album ids confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (track titles, credits, durations in ms) and the album page's `og:` metadata and `og:restrictions:country:allowed` list (market count, TR and US availability).
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits, notes). **Deezer** API for UPC/label cross-checks.
- **Status key:** OK = primary source. SECONDARY = reference work or secondary summary only. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Karajan / Berliner Philharmoniker (DG, 1964)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Herbert von Karajan / Berliner Philharmoniker | Spotify credits "Claude Debussy, Berliner Philharmoniker, Herbert von Karajan" on tracks 2–4 | https://open.spotify.com/embed/album/7nI7p3GS9ENddrxwqk4LSJ | OK |
| Album | – | "Ravel: Boléro / Debussy: La Mer", compilation, 1988, 6 tracks, 135 markets incl. TR and US. Track 1 Boléro (16:12), 2–4 La mer, 5 Daphnis Suite No. 2, 6 Prélude à l'après-midi d'un faune | embed + album page | VERIFIED |
| Identity of the CD | 427 250-2 (Galleria) | Deezer album 6585373 "Ravel: Boléro / Debussy: La Mer", DG, UPC 028942725027, same running order; Discogs 1006495 shows barcode 028942725027 = DG Galleria 427 250-2 | https://api.deezer.com/album/6585373 ; https://api.discogs.com/releases/1006495 | OK |
| Recorded / venue | March 1964, Jesus-Christus-Kirche, Berlin | Discogs 1006495 notes: "Tracks 2 to 6 Recorded in Berlin, Jesus-Christus-Kirche, March 1964. Track 1 recorded in Berlin, Jesus-Christus-Kirche, March 1966." Producer Otto Gerdes, balance engineer Günter Hermanns | https://api.discogs.com/releases/1006495 | OK |
| Original LP / release year | 138 923 SLPM, 1964 | DG 138 923 SLPM "La Mer · Prélude à l'après-midi d'un faune / Daphnis et Chloé, Suite No. 2", sleeve dated 9/64 (runout ℗ 1965) | https://api.discogs.com/releases/11228984 | OK (1964 = sleeve date) |
| Other Karajan versions (not used) | – | Karajan also recorded La mer for EMI in the 1970s (Warner album 2025, I = 9:44, much slower) and digitally for DG in the 1980s. DG's 2007 "Originals" album `6AqP5Ux1Ku9xnnIXisA42J` has the same 1964 performance (8:34 / 6:13 / 7:51) but **0 markets**; `348mNvrFZgtnDhE9mOLRSj` (2003 double) also 0 markets; `2V1f6pFnAVfwVUamk51Yh9` (1995, 165 markets) has the same La mer but 19 tracks | Spotify embed/meta ; https://api.deezer.com/album/834406302 | Noted |

### Durations (Spotify embed, album 7nI7p3GS9ENddrxwqk4LSJ)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 2 | I. De l'aube à midi sur la mer | 519173 | 8:39 |
| 3 | II. Jeux de vagues | 375327 | 6:15 |
| 4 | III. Dialogue du vent et de la mer | 474160 | 7:54 |
| | Total | 1368660 | 22:49 → `duration_min: 23` |

Deezer's copy of the same CD gives 8:35 / 6:13 / 7:51 (track gaps differ); the guide uses the Spotify times.

## 2. Also recommended: Boulez / The Cleveland Orchestra (DG, 1995)

| Field | Verified value | Source URL | Status |
| --- | --- | --- | --- |
| Album | "Debussy: Nocturnes; Première Rhapsodie; Jeux; La Mer", 1995, 8 tracks, 182 markets incl. TR and US; La mer = tracks 6–8, 8:45 / 7:05 / 7:41 | https://open.spotify.com/embed/album/6gg1Xv1PNler2SHsvFpLYI | VERIFIED |
| Label / catalogue | DG 439 896-2, ℗ 1995 | https://api.discogs.com/releases/1649360 | OK |
| Recorded / venue | "Recording: Cleveland, Masonic Auditorium, 3/1991 (Rhapsodie) & 3/1993" | same | OK |

## 3. Painting: Hokusai, *Under the Wave off Kanagawa* (The Great Wave), c. 1830–32

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Object | The Met, object 45434, accession JP1847, woodblock print, ink and color on paper, 25.7 × 37.9 cm, H. O. Havemeyer Collection, Bequest of Mrs. H. O. Havemeyer, 1929. `isPublicDomain: true`; primary image DP130155 | https://collectionapi.metmuseum.org/public/collection/v1/objects/45434 ; https://www.metmuseum.org/art/collection/search/45434 | OK |
| Commons file | File:Tsunami_by_hokusai_19th_century.jpg, 3859 × 2594, PD-Art / PD-old-auto-expired (deathyear 1849), source: Met online 45434, accession JP1847 | https://commons.wikimedia.org/wiki/File:Tsunami_by_hokusai_19th_century.jpg | OK |
| Rights | Hokusai died 1849: PD everywhere. The Met releases the image as CC0 | – | OK |
| Not a painting | It is a woodblock print. Chosen because the brief proposed it and because of the direct link to the score | – | Flag for the product owner |
| Pairing facts | Debussy kept a copy of the print in his studio and asked for the image on the cover of the 1905 score | https://en.wikipedia.org/wiki/The_Great_Wave_off_Kanagawa (Influence) ; https://en.wikipedia.org/wiki/La_mer_(Debussy) (Reception) | OK (SECONDARY: Wikipedia; widely documented) |

Other Commons copies considered: the Library of Congress impressions (File:Kanagawa_oki_nami_ura_LCCN2008660568.jpg, 8561 × 6037, PD) are larger but are later or worn impressions with paper toning; the Met JP10 impression (DP141063, 3863 × 2667, CC0) is a good fallback.

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 1903–1905; begun August 1903 while visiting his parents-in-law in Burgundy; he preferred "the seascapes available in painting and literature" to the physical sea | https://en.wikipedia.org/wiki/La_mer_(Debussy) | OK |
| Completed 5 March 1905; proofs corrected at the Grand Hotel, Eastbourne, from 23 July 1905 | same ; https://en.wikipedia.org/wiki/Claude_Debussy | OK |
| "Three symphonic sketches", deliberately avoiding "symphony" | La mer article (Trezise) | OK |
| Premiere 15 October 1905, Paris, Orchestre Lamoureux, Camille Chevillard; poor reception; Pierre Lalo (Le Temps): "I do not hear, I do not see, I do not smell the sea" | same | OK |
| Success at the second Paris performance, 19 January 1908, conducted by Debussy | same | OK |
| Motifs that grow from earlier motifs ("motifs are constantly propagated by derivation from earlier motifs", Trezise) | same | OK (paraphrased) |
| Scoring: cor anglais, muted trumpets, 2 harps, glockenspiel, tam-tam, cymbals, timpani, bass drum, 2 cornets (III only) | same (Analysis) | OK |
| I: low B pedal at the opening, muted strings, cor anglais + muted trumpet call; cellos divided into four groups (16 cellos) in the middle; brass chorale at the end which returns in III | Score (Durand 1905/1909; IMSLP) and standard analyses; not re-read in this session | SECONDARY (from the score as remembered; confirm the cello passage position by ear) |
| II functions as a scherzo | La mer article ("a lighter, faster piece which acts as a type of scherzo") | OK |
| III: the call from I returns; quiet central passage with a long woodwind melody over high strings; the chorale from I returns at the climax | standard analyses; score | SECONDARY |
| Hokusai print on the cover, Turner admiration | La mer article; Great Wave article | OK |

Not used, on purpose: the claim that the formal proportions follow the Golden Section (Howat), which Trezise treats with caution.

## 5. Re-time needed (every stop is an estimate)

Reference: Karajan 1964, Spotify `7nI7p3GS9ENddrxwqk4LSJ` (tracks 2–4). Written from the score's structure and the track lengths; nobody has listened against the tracks. Add to `content/research/retime-needed.md`.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I De l'aube à midi sur la mer | 8:39 | 0:00, 0:50, 2:00, 4:45–5:30, 6:30, Last 90 seconds | The call (≈ 0:50), the divided-cello passage (≈ 4:45–5:30) |
| II Jeux de vagues | 6:15 | 0:00, 0:45, 2:00, 3:30–4:30, Last minute | The climax window (≈ 3:30–4:30) |
| III Dialogue du vent et de la mer | 7:54 | 0:00, 0:40, 2:30–3:30, 4:30, 6:30, Last 30 seconds | The return of the call (≈ 0:40), the calm (≈ 2:30–3:30) and the chorale (≈ 6:30) |
