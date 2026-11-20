# Verification: Ravel – Le tombeau de Couperin (orchestral suite), M. 68a

Files: `content/drafts/en/ravel-le-tombeau-de-couperin.md`, `content/drafts/tr/ravel-le-tombeau-de-couperin.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group E). Shared-file additions (paintings.yaml, glossary: *forlane*, re-time rows; Ravel already in `composers.yaml`): `content/research/ravel-le-tombeau-de-couperin.shared.md`.

**How the checks were done.** Spotify search in the built-in browser; embed `__NEXT_DATA__` from a Turkish network (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`); Discogs API; Wikipedia via the MediaWiki API (article and its movement table wikitext); Commons API. No personal data sent.

---

## Reference recording: Cluytens / Société des Concerts du Conservatoire, EMI

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7EY1fnoxCPf06YyX7b0QrD | "Ravel: Le tombeau de Couperin, Menuet antique, Alborada del Gracioso, Une barque sur l'océan & Pavane pour une infante défunte"; tracks 1–4 = *Le tombeau de Couperin* (orchestral version) in the order Prélude, Forlane, Menuet, Rigaudon (Spotify keeps the piano-suite numbers I, III, V, IV in the titles); credits Cluytens, Orchestre de la Société des Concerts du Conservatoire, and Robert Casier on the Prélude; "℗ 1963 Parlophone/Warner Music France … Remastered (p) 2017" | https://open.spotify.com/embed/album/7EY1fnoxCPf06YyX7b0QrD | VERIFIED |
| isPlayable | – | `true` (all 8 tracks) | embed | OK |
| Label / cat. no. | EMI (Columbia); SAX 2476-9 | Discogs 5971993: Columbia SAX 2476-9 "Complete Orchestral Works", UK, April 1963; French issue Discogs 12715130 (Pathé Marconi SAXF 953/954, booklet printed 15 February 1963) | https://api.discogs.com/releases/5971993 ; https://api.discogs.com/releases/12715130 | OK |
| Recorded / venue | "1962" / Salle Wagram, Paris | Search summaries of two discographies: sessions at Salle Wagram, *Tombeau* and *Pavane* 26–27 September 1962 (D. Kern Holoman's Société des Concerts discography, page not machine-readable); a Columbia pressing listing dates the *Tombeau* take 3 October 1963, which conflicts with the French LP's February 1963 booklet. Guide gives only "1962" | https://sites.google.com/view/dkholoman/books/société-des-concerts/discography/1961/1961-04-19-ravel ; https://classite.com/disk/emi-sax-2479-q305590/pressing/15836 | SECONDARY (yaml comment) |
| Robert Casier | oboe soloist | Credited by Spotify on the Prélude track; also on IDAGIO (search summary). His role as the orchestra's principal oboe is inferred from the credit | embed | SECONDARY |

### Durations (embed, ms)

| Track | Title | ms | Guide |
| --- | --- | --- | --- |
| 1 | Prélude | 186 213 | 3:06 |
| 2 | Forlane | 328 306 | 5:28 |
| 3 | Menuet | 294 973 | 4:54 |
| 4 | Rigaudon | 197 706 | 3:17 |

Sum 1 007 198 ms = 16:47 → `duration_min: 17`.

---

## Also recommended: Karajan / Orchestre de Paris, EMI

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/0an9Tqz3JBjGG04MvM1l3x | "Ravel: La Valse, Rapsodie espagnole, Alborada del gracioso & Le Tombeau de Couperin (Remastered)", tracks 7–10 = *Tombeau* (3:34, 6:24, 5:10, 3:40), Karajan, Orchestre de Paris, all playable; "℗ 2026 Parlophone" (remaster) | embed | VERIFIED |
| Label / cat. no. / year | EMI ASD 2766; 1972 | Discogs 8425632 (HMV ASD 2766, UK 1972); Discogs 5776125 (Pathé Marconi 2 C 069-02214, France 1972, with *Tombeau*) | https://api.discogs.com/releases/8425632 ; https://api.discogs.com/releases/5776125 | OK |
| Recorded / venue | null | Not found; `year: 1972` = LP year | – | UNVERIFIED (yaml comment) |

---

## Painting: Gabriel Deluc, *Le Chevrier* (*The Goatherd*), 1908

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Gabriel Deluc (Saint-Jean-de-Luz, 1 October 1883 – Souain-Perthes-lès-Hurlus, 15 September 1916), Basque painter; Ravel dedicated the Forlane to him | Wikipedia "Gabriel Deluc"; Wikipedia "Le Tombeau de Couperin" (dedications table: "First Lieutenant Gabriel Deluc (a Basque painter from Saint-Jean-de-Luz)") | OK |
| Work | *Le Chevrier*, 1908, oil on canvas, a large decorative canvas Deluc gave to his home town | Wikipedia "Gabriel Deluc" ("In 1908 he donated a large decorative canvas to his hometown, The Shepherd of Goats (Le Chevrier)"); Commons file description: "Huile sur toile", gallery "Mairie de Saint-Jean-de-Luz", 1908 | OK |
| Collection | Town hall (Mairie), Saint-Jean-de-Luz | Commons file description | SECONDARY (no museum record online) |
| What it shows | A goatherd and his goats on a grassy cliff above a moonlit bay, with ruins on the right; Commons category "Saint-Jean-de-Luz in art". The guide says only "on the coast at Saint-Jean-de-Luz" | Commons file and categories | OK |
| Ciboure across the harbour | Ravel was born in Ciboure (composers.yaml); Ciboure faces Saint-Jean-de-Luz across the mouth of the Nivelle | composers.yaml; general geography | OK |
| Image | `File:Gabriel Deluc - Le Chevrier.jpeg`, 3327 × 1456, photo by Commons user Koulstremvonplotto (19 December 2015) | https://commons.wikimedia.org/wiki/File:Gabriel_Deluc_-_Le_Chevrier.jpeg | see Rights |
| Rights | Painter died 1916: the painting is public domain by age. The photo is tagged by its uploader as CC BY-SA 4.0 (own work). It is a frontal photo of a two-dimensional painting, so under the brief's rule (EU DSM art. 14, transposed in France in 2021; US *Bridgeman v. Corel*) it creates no new right and can be used as public domain. It is a gallery photo, not a museum scan: a thin strip of frame shows at the top and bottom edges and needs a slight crop | – | FLAG for the product owner: if a CC-tagged gallery photo is not acceptable, use alternative 1 or 2 |
| Not already used | Neither the painting nor Deluc appears in `content/paintings.yaml` | – | OK |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| *Tombeau* = a piece written as a memorial, popular from the 17th century | Wikipedia "Le Tombeau de Couperin" (Overview) | OK |
| François Couperin "the Great" (1668–1733); Ravel's homage to the French Baroque keyboard suite in general rather than to Couperin himself | Wikipedia (Overview) | OK |
| Couperin harpsichordist to Louis XIV | Wikipedia "François Couperin" (ordinaire de la musique de la chambre du roi pour le clavecin, 1717) | OK |
| Piano suite 1914–17, six movements, each in memory of friends killed in the war | Wikipedia | OK |
| Ravel an army lorry driver | `content/composers.yaml` (ravel bio, with its sources) | OK |
| "The dead are sad enough, in their eternal silence", in answer to criticism | Wikipedia (Reception) | OK |
| Ravel transcribed a forlane from Couperin's fourth *Concert royal* as preparation | Wikipedia (Overview) | OK |
| 1919 orchestration of four movements (Prélude, Forlane, Menuet, Rigaudon); premiere February 1920, Pasdeloup Orchestra, Rhené-Baton; oboe takes the melody in the Prélude, the Menuet and the C minor section of the Rigaudon over "guitar-like pizzicati"; scoring 2 fl (picc), 2 ob (ca), 2 cl, 2 bn, 2 hn, tpt, harp, strings | Wikipedia (Orchestrations) | OK |
| Order of the orchestral suite with the Rigaudon last (piano: Prélude, Fugue, Forlane, Rigaudon, Menuet, Toccata) | Wikipedia (movement table; orchestration list) and the album's track order | OK |
| Dedications: Prélude – Lt Jacques Charlot (transcriber of *Ma mère l'Oye* for solo piano); Forlane – Lt Gabriel Deluc; Menuet – Jean Dreyfus (Ravel recuperated at his home after demobilisation); Rigaudon – Pierre and Pascal Gaudin, brothers and childhood friends, killed by the same shell in November 1914 | Wikipedia (movement table) | OK |
| Tempos, keys, metres: Vif, E minor, 12/16; Allegretto, E minor, 6/8; Allegro moderato, G major, 3/4; Assez vif, C major, 2/4 | Wikipedia (movement table) | OK |
| Prélude as perpetuum mobile, a test for oboists; Forlane refrain and episodes; Menuet's musette with a drone and a climax; Rigaudon's middle in C minor | General descriptions of the score (the Menuet's middle section is headed *Musette* in the score); not checked bar by bar | Check by ear |

---

## Re-time

No bar map. Stops placed from the sections' order and assumed proportions of each track: Prélude (single idea; return of the opening placed a little past halfway); Forlane as a rondo with four refrains and three episodes at roughly equal spacing; Menuet with the musette starting at about a third of the track and its climax about halfway; Rigaudon with the middle section from about a third to about three quarters of the track. All positions are assumptions.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 3:06 | 0:00, 0:20, 0:50, 1:45, near the end | Return of the opening (≈ 1:45) |
| II | 5:28 | 0:00, 1:05, 1:45, 2:30, 3:25, 4:10, 4:45 | All refrain/episode boundaries |
| III | 4:54 | 0:00, 0:45, 1:40, 2:30, 3:00, near the end | Start of the musette (≈ 1:40) and its climax (≈ 2:30) |
| IV | 3:17 | 0:00, 0:45, 1:05, 1:50, 2:25, last 10 s | Start of the middle section (≈ 1:05) and the return (≈ 2:25) |
