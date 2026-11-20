# Verification: Falla – Nights in the Gardens of Spain

Piece id `falla-nights-in-the-gardens-of-spain`. Checked on 2026-11-20 (batch 2026-11b, group F).
Files: `content/drafts/en/falla-nights-in-the-gardens-of-spain.md`, `content/drafts/tr/falla-nights-in-the-gardens-of-spain.md`.
Shared-file additions (paintings.yaml, new composer Falla): `content/research/falla-nights-in-the-gardens-of-spain.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched from a Turkish network (2026-11-20, User-Agent `DailyClassical/1.0`); the Decca product page (served on deutschegrammophon.com), whose embedded track metadata gives recording date, venue and first release and which links the Spotify album; MusicBrainz (Spotify link for the alternative); library and discography listings; Wikipedia (EN, ES); programme notes; Wikimedia Commons API and file wikitext; the MNAC object page. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: de Larrocha / Frühbeck de Burgos / London Philharmonic (Decca, 1983)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Alicia de Larrocha (piano) / Rafael Frühbeck de Burgos / London Philharmonic Orchestra | Spotify credits tracks 1–3: "Manuel de Falla Matheu, Alicia de Larrocha, London Philharmonic Orchestra, Rafael Frühbeck de Burgos" | https://open.spotify.com/embed/album/26ucC1tefOfk4CtL9u8Hlt | VERIFIED |
| Recorded / venue | July 1983, Walthamstow Assembly Hall, London | Label track metadata (all tracks): recordingDate 1983-07-08, "Walthamstow Assembly Hall, London", firstReleaseYear 1984. Eloquence reissue 480 7844: "Walthamstow Assembly Hall, London, UK, 5, 7 & 8 July 1983" | https://www.deutschegrammophon.com/en/catalogue/products/falla-nights-in-the-gardens-de-larrocha-717 ; https://www.eloquenceclassics.com/releases-archive/falla-granados-ravel-orchestral-works/ (search summary) | OK |
| Label / catalogue | Decca 410 289-2 | Product page: label Decca, SKU 00028941028921 (= 410 289-2); Decca page release date 6 July 1984 (search summary) | product page ; https://deccaclassics.com/en/catalogue/products/falla-nights-in-the-gardens-de-larrocha-717 | OK |
| Spotify | 26ucC1tefOfk4CtL9u8Hlt | Linked from the product page; 5 tracks (Falla 1–3, Albéniz *Rapsodia española* orch. Halffter 4, Turina *Rapsodia sinfónica* 5), all playable | product page ; embed | VERIFIED |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | En el Generalife | 611288 | 10:11 | true |
| 2 | Danza lejana | 323240 | 5:23 | true |
| 3 | En los jardines de la Sierra de Córdoba | 551800 | 9:12 | true |
| | Total | 1486328 | 24:46 → `duration_min: 25` | |

Note: II runs into III without a break in the score; on Spotify they are separate tracks, so the last seconds of track 2 already lead into track 3.

## 2. Also recommended: Rubinstein / Jordá / San Francisco Symphony (RCA Victor, 1957)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Artur Rubinstein / Enrique Jordá / San Francisco Symphony Orchestra | Spotify credits "Manuel de Falla, San Francisco Symphony, Enrique Jorda" (album title names Rubinstein); RCA LM-2181 listing: Rubinstein, piano; San Francisco Symphony Orchestra; Enrique Jordá | https://open.spotify.com/embed/album/2OShuPyE8nzckdlYBFcB6X ; https://classite.com/disk/rca-lm-2181-q6855 | VERIFIED / OK |
| Recorded / venue | 25 March 1957, War Memorial Opera House, San Francisco | Session listing and catalogue note (search summary: "March 25, 1957", "War Memorial Opera House") | https://libcat.library.tamu.edu/Record/in00004554172/Description ; classite.com | OK (secondary) |
| Label / catalogue / release | RCA Victor LM-2181, 1958 | Library records: "Camden, N.J.: RCA Victor, [1958]"; later stereo coupling with Rachmaninoff's *Paganini Rhapsody*: LSC-2430 | same | OK |
| Spotify | 2OShuPyE8nzckdlYBFcB6X | MusicBrainz url-rel ("Artur Rubinstein Performs... Nights in the Gardens of Spain", 2014-06-20). Tracks 1–3: 9:15 / 4:47 / 7:35, all `isPlayable: true` | embed | VERIFIED |

## 3. Painting: Santiago Rusiñol, *Gardens of the Generalife*, 1909

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Santiago Rusiñol (Barcelona 1861 – Aranjuez 1931), *Jardí del Generalife* (*Gardens of the Generalife*), Granada, 1909 | https://www.museunacional.cat/en/colleccio/gardens-generalife/santiago-rusinol/004047-000 | OK |
| Collection / medium / size | Museu Nacional d'Art de Catalunya, 004047-000; oil on canvas, 107 × 87 cm; Plandiura Collection, acquired 1932; MNAC: "Public domain" | MNAC page ; Wikidata Q109587407 | OK |
| Image | `File:Santiago_Rusiñol_-_Gardens_of_the_Generalife_-_Google_Art_Project_(8AF4AAxKEZmchg).jpg`, 3266 × 4100, Google Cultural Institute (MNAC) | https://commons.wikimedia.org/wiki/File:Santiago_Rusi%C3%B1ol_-_Gardens_of_the_Generalife_-_Google_Art_Project_(8AF4AAxKEZmchg).jpg | OK |
| Rights | Rusiñol died 13 June 1931: EU 70 p.m.a. expired 2002; Spain (80 years) expired 2012; museum marks it PD | MNAC ; Commons | OK |
| Reuse | Rusiñol already has one painting in `paintings.yaml` (*Faune vell*, Aranjuez, for `rodrigo-concierto-de-aranjuez`). Kept as "clearly the best match": it shows the Generalife (title of movement I), was painted in Granada in 1909, the year Falla began the nocturnes, and Rusiñol's book *Jardins d'Espanya* (1903, 40 garden paintings) is argued by scholars to have shaped Falla's picture of the Alhambra gardens ("very probably", a hypothesis, not a documented source of the title: PCAH 2024 paper, https://papers.iafor.org/wp-content/uploads/papers/pcah2024/PCAH2024_81681.pdf, search summary; Henle preface mentions the book). The guide's pairing note does not claim the title came from Rusiñol | – | OK (merge: confirm a second Rusiñol is acceptable) |
| Clash check | No other shared note of this batch names this painting (grep, 2026-11-20) | – | OK |

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Begun 1909 in Paris as nocturnes for solo piano; Ricardo Viñes suggested piano and orchestra; finished 1915 after Falla's return to Spain at the outbreak of the war; dedicated to Viñes | https://en.wikipedia.org/wiki/Nights_in_the_Gardens_of_Spain ; https://es.wikipedia.org/wiki/Noches_en_los_jardines_de_Espa%C3%B1a | OK. Disagreement: Aspen and musicprogramnotes.com give 1911–15; one note says Albéniz suggested the scoring (Albéniz died in 1909). The guide follows Wikipedia (EN, ES) |
| Premiere 9 April 1916, Teatro Real, Madrid; José Cubiles; Orquesta Sinfónica de Madrid; Enrique Fernández Arbós | Wikipedia (EN, ES) ; https://www.aspenmusicfestival.com/program_notes/view/de-falla-nights-in-the-gardens-of-spain | OK |
| "Symphonic impressions for piano and orchestra"; not called a concerto; piano "an essentially decorative instrument" (Nichols); ES: piano part "elaborada, brillante y elocuente, pero raramente dominante" | Wikipedia (EN, ES) | OK |
| Debussy and Ravel influence; Falla met them in Paris | Wikipedia (piece and composer) | OK |
| Themes from Andalusian rhythms, modes, cadences and ornaments, "rarely used in their original forms"; Falla: "has no pretensions to being descriptive: it is merely expressive"; "melancholy and mystery have their part also" | Aspen note (quoting Falla's own note); Hollywood Bowl note | OK |
| Generalife: jasmine-scented gardens by the Alhambra in Granada; repeating patterns compared with Islamic geometric design; II an unidentified garden; III the Sierra de Córdoba; finale "may suggest a gypsy fiesta" | Wikipedia ; Aspen | OK |
| Generalife = summer palace and gardens of the Nasrid (Moorish) rulers | https://en.wikipedia.org/wiki/Generalife | OK (general reference, not fetched in this session) |
| I: "a remarkably crystalline, guitar-inspired series of phrases ... set for piano over hazy strings"; II "a brief, darkly playful dance" leading directly into III; III "harsh full-orchestra interruptions and expansive romances for piano and strings", "roars through its final five minutes", "fading quickly into an elegant, quiet close" | https://www.hollywoodbowl.com/musicdb/pieces/2450/nights-in-the-gardens-of-spain | OK. Hollywood Bowl also says I opens with "an all-out orchestral storm"; not used: the guide describes a hushed opening (quiet trembling strings and harp), from general knowledge of the work, UNVERIFIED against the score |
| III and *cante jondo* | https://www.musicprogramnotes.com/falla-noches-en-los-jardines-despana-nights-in-the-gardens-of-spain/ | OK |
| Scoring: no guitar; celesta, harp, etc. | Wikipedia | OK |
| Falla lived in Granada 1921–1939 | https://en.wikipedia.org/wiki/Manuel_de_Falla | OK |
| de Larrocha (1923–2009), born in Barcelona; "best known for her recordings of the music of Manuel de Falla" (among others) | https://en.wikipedia.org/wiki/Alicia_de_Larrocha | OK |
| Tempo markings | Not used in the guide (the Movements table gives titles only) | – |

## 5. Re-time (all stops are ≈; derived from the programme notes above, typical proportions and the exact track lengths, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I En el Generalife | 10:11 | 0:00, 0:50, 2:00–3:30, 4:30–6:00, 6:30, 7:30–8:40, Last minute | The piano's entry ≈ 0:50 (± 30 s); the climax 4:30–6:00 and the second surge 7:30–8:40 (± 1 min) |
| II Danza lejana | 5:23 | 0:00, 0:50, 2:00–3:30, 3:30, Last 40 seconds | The quiet passage ≈ 3:30 (± 40 s) |
| III En los jardines de la Sierra de Córdoba | 9:12 | 0:00, 0:40, 1:30, 2:30–4:00, 4:30, 6:00–7:30, 8:00, Last 30 seconds | The *rasgueado* chords ≈ 0:40 and the song ≈ 1:30 (± 30 s); the romance ≈ 4:30 and the last climax (± 45 s) |
