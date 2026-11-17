# Verification: Debussy – String Quartet in G minor

Piece id `debussy-string-quartet`. Checked on 2026-11-17 (batch November 2026, group I).
Files: `content/drafts/en/debussy-string-quartet.md`, `content/drafts/tr/debussy-string-quartet.md`.
Shared-file additions (paintings.yaml entry, alternatives, re-time rows; no new glossary terms; Debussy already in `composers.yaml`): `content/research/debussy-string-quartet.shared.md`.

**How the checks were done:** Spotify search in the built-in browser; embed `__NEXT_DATA__` with curl from a Turkish network; album page meta and ℗/© lines; Discogs API; Gramophone awards page (via search); Wikipedia EN/FR via the MediaWiki API (FR wikitext for tempo, key and metre of each movement); Commons, Wikidata, NGA. Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Quatuor Ébène (Virgin Classics, 2008)

Why this one: Gramophone Recording of the Year and Chamber award 2009; four tracks, all playable in Turkey. The same album is the `also_recommended` of `ravel-string-quartet` (whose reference is Quartetto Italiano, Philips 1965; that Philips Debussy is not on Spotify as far as the search showed, and the Quartetto Italiano Debussy albums found are the earlier EMI recording: `23BQEqxFmtqw8lVmWqUNAe`, `63gfNWa7BLyR8MgcE6kBZi`). Also checked and playable: Juilliard, Guarneri, Cleveland, LaSalle, Emerson, Hagen, Talich, Lindsay, Jerusalem, Kodály, Carmina, Budapest.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ensemble | Quatuor Ébène (as `orchestra`, no conductor) | Embed tracks 1–4 credits "Claude Debussy, Quatuor Ébène"; Discogs: Pierre Colombet, Gabriel Le Magadure (violins), Mathieu Herzog (viola), Raphaël Merlin (cello) | https://open.spotify.com/embed/album/2ZzP0NJ3dB7SNYT7zhO5pn ; https://api.discogs.com/releases/3730645 | OK |
| Label / catalogue | Virgin Classics 519045 2 | Discogs 3730645 | same | OK |
| Recorded / venue | 4–9 February 2008, Ferme de Villefavard, Limousin | Discogs notes "Recording: Ferme de Villefavard en Limousin (France), 4.-9. 02. 2008" | same | OK |
| Release | 2008 | Spotify release date 2008-10-03; ℗/© 2008 Parlophone (Warner Classics/Erato release) | album page | OK |
| Award | Gramophone Recording of the Year 2009 (and Chamber award) | Gramophone awards page "Chamber (Recording of the Year)" 2009; Gramophone news "Quatuor Ebène win Recording of the Year" | https://gramophone.co.uk/awards/gramophone-classical-music-awards-2009/chamber-recording-of-the-year | OK |
| Spotify | https://open.spotify.com/album/2ZzP0NJ3dB7SNYT7zhO5pn | "Debussy, Fauré & Ravel: String Quartets", 11 tracks | album page | OK |

### Durations and playability (embed)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Animé et très décidé | 385373 | 6:25 | true |
| 2 | II. Assez vif et bien rythmé | 241506 | 4:01 | true |
| 3 | III. Andantino. Doucement expressif | 498746 | 8:18 | true |
| 4 | IV. Très modéré – Très mouvementé et avec passion | 446826 | 7:26 | true |
| | Total | 1572451 | 26:12 → `duration_min: 26` (Discogs: 26:10) | |

---

## 2. Also recommended: Alban Berg Quartett (EMI, 1984)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Spotify | `0cLLpBWSJa6rOldPr5E0Qb` "Ravel & Debussy: String Quartets & Stravinsky: 3 Pieces, Concertino & Double Canon", ℗ compilation 2001 EMI; Debussy 6:09 / 3:46 / 6:31 / 7:00, all isPlayable true | embed + album page | OK |
| Catalogue / release | EMI CDC 7 47347 2, 1986; reissued EMI Classics Masters 9 65939 2 (2010) | MusicWeb review 2010; ECU library catalogue | https://www.musicweb-international.com/classrev/2010/June10/berg_qt_9659392.htm ; https://lib.ecu.edu/catalog-preview/catalog/5229532 | SECONDARY |
| Recorded / venue | April 1984 (Debussy), Evangelische Kirche, Seon, Switzerland | ECU catalogue ("Recorded Apr., 1984 (Debussy)"), MusicWeb | same | SECONDARY |

---

## 3. Painting: Claude Monet, *Rouen Cathedral, West Façade, Sunlight*, 1894

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Claude Monet (1840–1926) | Commons deathyear=1926 | OK |
| Object | Oil on canvas, 100.1 × 65.8 cm, signed and dated "Claude Monet '94"; National Gallery of Art, Washington, Chester Dale Collection, 1963.10.179 (Wildenstein 1324) | https://commons.wikimedia.org/wiki/File:Claude_Monet,_Rouen_Cathedral,_West_Fa%C3%A7ade,_Sunlight,_1894,_NGA_46654.jpg ; https://www.nga.gov/collection/art-object-page.46654.html | OK |
| Image | NGA open-access file, **6030 × 9204** px (portrait) | Commons | OK |
| Rights | `{{CC0}}` (NGA open access) + `{{PD-Art|PD-old-auto-expired|deathyear=1926}}` | same | OK |
| Series | More than thirty paintings of the façade, made in Rouen in 1892 and 1893, reworked in the studio in 1894; twenty shown at Durand-Ruel's in Paris in 1895 | https://en.wikipedia.org/wiki/Rouen_Cathedral_(Monet_series) | OK |
| Pairing | Same years as the quartet (1892–93); one subject in changing light ≈ one theme in four movements (cyclic form) | as above | OK (idea pairing) |
| Reuse note | Monet is already in `paintings.yaml` (*Impression, Sunrise*). Chosen because the series idea matches the quartet's cyclic design better than the alternatives found; if the merge prefers a new artist, take alternative 1 | | FLAG |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 1892–1893, completed 1893, Debussy aged 31; only string quartet | https://en.wikipedia.org/wiki/String_Quartet_(Debussy) ; https://fr.wikipedia.org/wiki/Quatuor_à_cordes_de_Debussy | OK |
| Same period as the *Prélude à l'après-midi d'un faune* | fr.wikipedia ("dans une période où Debussy finissait d'écrire le Prélude…") | OK |
| Only work with an opus number (Op. 10) | fr.wikipedia ("sa seule partition avec un numéro d'opus") | OK |
| Meant for Chausson; Chausson's reservations; Debussy began a second quartet, abandoned after the break with Chausson | en/fr.wikipedia | OK |
| Premiere 29 December 1893, Ysaÿe Quartet (Ysaÿe, Crickboom, Van Hout, Jacob), Société nationale de musique, Salle Pleyel; mixed reactions | fr.wikipedia; en.wikipedia | OK |
| Belgian critic Maurice Kufferath (Guide Musical, 4 March 1894): "Une hallucination plutôt qu'un rêve" (after the Brussels premiere) | fr.wikipedia | OK (guide says "one Belgian critic") |
| Cyclic form: one theme in G Phrygian returns in all four movements; "fusion de la forme cyclique et de la forme variation" | fr.wikipedia | OK |
| Franck association (Gavoty: the Andante's "Franckist" effusion) | fr.wikipedia | OK (guide: "associated with César Franck and his circle") |
| Tempo, key and metre: I Animé et très décidé, G minor, 4/4; II Assez vif et bien rythmé, G major, 6/8 (with 15/8 section); III Andantino, doucement expressif, D-flat major, 6/8; IV Très modéré, D-flat major, 4/4, then Très mouvementé et avec passion, G minor, 2/2 | fr.wikipedia wikitext (Structure) | OK |
| Scherzo: plucked strings, viola with the theme as ostinato; bowed middle section | Score (standard description); fr.wikipedia (Chennevière: "le Scherzo où s'égrènent les pizzicati") | SECONDARY |
| Falla: the second movement could pass for one of the most beautiful Andalusian dances ever written (Revue musicale, 1920) | fr.wikipedia | OK (paraphrased) |
| Andantino with mutes; middle section begins with the viola | Score (standard description) | SECONDARY |
| Finale: slow introduction, fast main section, theme returns transformed, Très animé close | fr.wikipedia (tempo headings); Spotify/Cleveland/Emerson track titles "Très modéré – Très mouvementé – Très animé" | OK / SECONDARY (details) |
| Ravel modelled his quartet on Debussy's (about ten years later, 1902–03) | en.wikipedia; `ravel-string-quartet` guide | OK |
| Ébène recording facts | §1 | OK |

---

## 5. Re-time

All stops are estimates (≈) from the form of each movement (tempo markings and metronome marks in fr.wikipedia) and the Ébène track lengths. Ébène's Andantino (8:18) is on the slow side and its finale (7:26) a little broad compared with most versions (about 7:00–7:10).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Animé et très décidé | 6:25 | 0:00, 0:45, 1:20, 2:15, 3:40, 4:20, Last 40 seconds | Recapitulation (≈ 4:20) |
| II Assez vif et bien rythmé | 4:01 | 0:00, 0:35, 1:20, 2:30, Last 15 seconds | Middle section (≈ 1:20) |
| III Andantino, doucement expressif | 8:18 | 0:00, 1:15, 2:45, 4:30, 6:00, Last minute | Viola's middle section (≈ 2:45) and return (≈ 6:00) |
| IV Très modéré – Très mouvementé | 7:26 | 0:00, 1:00, 1:45, 3:30, 5:30, 6:30, Last 15 seconds | Start of the fast section (≈ 1:45) and the Très animé (≈ 6:30) |
