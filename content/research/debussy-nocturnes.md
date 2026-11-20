# Verification: Debussy – Nocturnes, L. 98

Files: `content/drafts/en/debussy-nocturnes.md`, `content/drafts/tr/debussy-nocturnes.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group E). Shared-file additions (paintings.yaml, glossary: *vocalise*, re-time rows; Debussy already in `composers.yaml`): `content/research/debussy-nocturnes.shared.md`.

**How the checks were done.** Spotify search in the built-in browser; embed `__NEXT_DATA__` from a Turkish network (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`); Discogs API; Wikipedia via the MediaWiki API; Wikidata; Commons API; Glasgow Whistler catalogue raisonné. No personal data sent.

**Recording choice.** Monteux/LSO (album 6A8FwTpvzYMNFBzqsTUV5I) was rejected: the album has only *Nuages* and *Fêtes*. Giulini/Philharmonia (324uNw0ysnDycsyNzvOqoH) is playable and complete; Abbado/Boston was preferred as the more widely recommended account. The catalogue number follows the revised Lesure catalogue used in the app for *La mer* (L. 109) and the *Prélude* (L. 86): *Nocturnes* = L. 98 (old L. 91).

---

## Reference recording: Abbado / Boston Symphony Orchestra, DG 1970

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/1CuXLsISfvwbhpwUtiSnKK | "Debussy: Nocturnes / Ravel: Daphnis et Chloé Suite No.2; Pavane / Scriabin: Le Poème de l'extase" (DG 2012 compilation); tracks 1–3 = *Nocturnes* (Nuages, Fêtes, Sirènes), credits Boston Symphony Orchestra, Claudio Abbado; Sirènes also New England Conservatory Chorus, Lorna Cooke DeVaron. "℗ 2012 Deutsche Grammophon" | https://open.spotify.com/embed/album/1CuXLsISfvwbhpwUtiSnKK | VERIFIED |
| isPlayable | – | `true` for tracks 1–3 (and the rest) | embed | OK |
| Label / cat. no. | DG; 2530 038 (LP); 415 370-2 (CD) | Discogs 9471740 (2530 038, Germany 1970: *Trois Nocturnes* / *Daphnis* / *Pavane*, chorus master Lorna Cooke deVaron, producer Karl Faust, engineer Günter Hermanns); Discogs 11382070 (415 370-2, 1986, with the Scriabin added, as on Spotify) | https://api.discogs.com/releases/9471740 ; https://api.discogs.com/releases/11382070 | OK |
| Recorded / venue | February 1970, Symphony Hall, Boston | Discogs 27893139 (DG Original Source reissue 2023): "Symphony Hall, Boston – Recorded At"; search summary of reissue listings: "Symphony Hall, Boston, USA, February 1970"; a catalogue database gives 1970-02-02 | https://api.discogs.com/releases/27893139 ; https://elusivedisc.com/claudio-abbado-debussy-trois-nocturnes-ravel-daphnis-et-chloe-pavane-original-source-series-180g-lp/ | OK (month from reissue listings) |

### Durations (embed, ms)

| Track | Title | ms | Guide |
| --- | --- | --- | --- |
| 1 | Nuages | 473 293 | 7:53 |
| 2 | Fêtes | 365 960 | 6:05 |
| 3 | Sirènes | 641 720 | 10:41 |

Sum 1 480 973 ms = 24:41 → `duration_min: 25`.

---

## Also recommended: Haitink / Concertgebouw, Philips

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/3oxruRUKL8ao9hkozCYDtA | "Debussy: Trois Nocturnes; Jeux" (Decca 2012 compilation), tracks 1–3 *Nocturnes* (7:05, 6:15, 10:24), Royal Concertgebouw Orchestra, Haitink; Sirènes with Collegium Musicum Amstelodamense; all playable | embed | VERIFIED |
| Label / cat. no. | Philips 9500 674 (LP); 400 023-2 (CD) | Discogs 4218576 (9500 674, 1980; sleeve note © 1979 Max Harrison); Discogs 8580720 (400 023-2, 1983) | https://api.discogs.com/releases/4218576 ; https://api.discogs.com/releases/8580720 | OK |
| Recorded / venue | null / null; `year: 1979` | Session date and venue not found; 1979 inferred from the sleeve-note copyright | – | UNVERIFIED (yaml comment) |

---

## Painting: James McNeill Whistler, *Nocturne in Blue and Silver*, c. 1871–72

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | James McNeill Whistler (1834–1903), *Nocturne in Blue and Silver* (former titles include *Nocturne in Blue and Silver No. 1* and *… Cremorne Lights*), 1871/1872 | Glasgow catalogue raisonné YMSM 113: https://whistlerpaintings.gla.ac.uk/catalogue/display/?mid=y113 ; Harvard record (search summary): https://harvardartmuseums.org/collections/object/299838 | OK |
| Collection | Harvard Art Museums / Fogg Museum, Bequest of Grenville L. Winthrop, 1943.176; oil on canvas, 44.4 × 60.3 cm | Glasgow catalogue; Wikidata Q106874854 | OK (Commons file names for gallery photos say "oil on panel"; the catalogue raisonné says canvas) |
| Image | `File:James Abbott McNeill Whistler - Nocturne in Blue and Silver - 1943.176 - Fogg Museum.jpg`, 5636 × 4094, Google Art Project, public domain | https://commons.wikimedia.org/wiki/File:James_Abbott_McNeill_Whistler_-_Nocturne_in_Blue_and_Silver_-_1943.176_-_Fogg_Museum.jpg | OK |
| Rights | Painter d. 1903; faithful reproduction; not NC | – | OK |
| Reuse check | This painting is not in `content/paintings.yaml`. Whistler is (*Nocturne in Black and Gold: The Falling Rocket*, for `gershwin-rhapsody-in-blue`). Brief allows another work by the same artist when it is clearly the best match: Debussy named the work after Whistler's nocturnes (Wikipedia, "Whistler and Debussy") | – | OK (flag at merge) |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Title from Whistler's "nocturne" paintings, not the musical nocturne; Whistler borrowed the word from music | Wikipedia "Nocturnes (Debussy)" (Whistler and Debussy) | OK |
| Debussy's programme note: title in a "decorative" sense, "impressions and the special effects of light" | Wikipedia (Music), quoting the note printed for the 1901 performance | OK |
| Begun c. 1892 as *Trois Scènes au crépuscule* after Régnier; 1894 planned for Ysaÿe with orchestra; "what a study in grey would be in painting" (letter to Ysaÿe, September 1894) | Wikipedia (Composition) | OK |
| By 1897 for full orchestra; manuscript dated 15 December 1899; dedicated to Georges Hartmann; told Hartmann it was harder than a five-act opera | Wikipedia | OK |
| Seven years' work | Wikipedia ("as long as seven years") | OK |
| Premieres: *Nuages* and *Fêtes* 9 December 1900, Lamoureux Orchestra, Camille Chevillard; complete 27 October 1901; *Sirènes* delayed for lack of a female choir | Wikipedia | OK |
| Revised almost until his death; definitive version published 1930 (Jobert) | Wikipedia | OK |
| *Nuages*: Pont de la Concorde, stormy day, clouds and a boat's horn; recalled by the chords and the cor anglais theme | Wikipedia, quoting Vallas (Debussy speaking to Paul Poujaud). The guide says "came to him … crossing the Pont de la Concorde" and "Debussy himself" (the stories come from Debussy via Poujaud and Vallas, and from Debussy's programme note) | OK |
| *Fêtes*: festival in the Bois de Boulogne, drum and bugle corps marching through the crowds; procession episode; "vibrating, dancing rhythm … sudden flashes of light" | Wikipedia (Vallas; Debussy's note) | OK |
| *Sirènes*: the sea, countless rhythms, moonlit waves, the sirens' song "as they laugh and pass on"; women's choir singing without words | Wikipedia (Debussy's note; "wordless singing of the women's chorus") | OK |
| Tempo markings: *Modéré*; *Animé et très rythmé*; *Modérément animé*; *En animant*, *Plus lent* in *Sirènes* | Wikipedia (each movement) | OK |
| *Nuages*: clarinets and bassoons in parallel chords; cor anglais motif; flute and harp in the middle on a pentatonic tune; timpani roll at the end | Wikipedia (cor anglais theme); the rest from the familiar score layout, not checked bar by bar here | Check by ear |
| *Fêtes*: procession over harps, timpani and pizzicato basses; three muted trumpets; climax with trombones | Familiar score layout (the "three muted trumpets" fanfare is the standard description) | Check by ear |
| Abbado: Symphony Hall, February 1970; women of the New England Conservatory Chorus prepared by Lorna Cooke deVaron | Discogs (above) | OK |

---

## Re-time

No bar map. Estimates from the order of sections and assumed bar positions at the average tempo of each track: *Nuages* ≈ 102 bars at ≈ 4.6 s/bar (middle section *Un peu animé* assumed ≈ bar 62, return of the opening ≈ bar 78). *Fêtes*: procession assumed to begin a little before the midpoint, as in most performances of about six minutes. *Sirènes*: the *En animant* climb and climax placed in the middle third, the *Plus lent* in the last fifth. All bar positions are assumptions.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 7:53 | 0:00, 0:20, 1:30, 3:00, 4:45, 5:50, near the end | The middle section (≈ 4:45) and the return (≈ 5:50) |
| II | 6:05 | 0:00, 0:20, 1:20, 2:30, 2:45, 3:30, 4:10, last minute | Start of the procession (≈ 2:30) |
| III | 10:41 | 0:00, 0:15, 2:30, 4:30, 6:00, 7:00, 9:00, last minute | Everything after ≈ 2:30; the climax (≈ 6:00) is the least certain |
