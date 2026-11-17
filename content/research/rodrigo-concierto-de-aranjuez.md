# Verification: Rodrigo – Concierto de Aranjuez

Piece id `rodrigo-concierto-de-aranjuez`. Checked on 2026-11-17 (batch 2026-11, group J).
Files: `content/drafts/en/rodrigo-concierto-de-aranjuez.md`, `content/drafts/tr/rodrigo-concierto-de-aranjuez.md`.
Shared-file additions (paintings.yaml, glossary "Rasgueado", new composer Rodrigo with `portrait: null`): `content/research/rodrigo-concierto-de-aranjuez.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched with curl from a Turkish network (2026-11-17); Discogs API; the label product pages (DG, Decca), whose embedded track metadata gives recording dates and venues and which link the Spotify albums; Wikimedia Commons API and file wikitext; Wikidata; the museum's object page. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: Yepes / García Navarro / Philharmonia Orchestra (DG, 1979)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Narciso Yepes / Luis Antonio García Navarro / Philharmonia Orchestra | Spotify credits on tracks 1–3: "Joaquín Rodrigo, Narciso Yepes, Philharmonia Orchestra, Luis Antonio García Navarro" (DG credits him as "García Navarro") | https://open.spotify.com/embed/album/3q15IyNTqYwESGJMbsYP93 | VERIFIED |
| Label / catalogue | DG 2531 208 (LP); 415 349-2 (CD) | Discogs 4210826: DG 2531 208, 1980 (LP, coupled with *Concierto madrigal*); Discogs 12960106: DG 415 349-2, 1985 (CD, with *Fantasía*; "Concierto de Aranjuez recorded in 1979"). DG product page: UPC 00028941534927 (= 415 349-2), release 1 Nov 1985 | https://www.discogs.com/release/4210826 ; https://www.discogs.com/release/12960106 ; https://www.deutschegrammophon.com/en/catalogue/products/rodrigo-concierto-de-aranjuez-yepes-4219 | OK |
| Recorded / venue | April 1979, Watford Town Hall | DG page track metadata: recordingDate 1979-04-12, recordingLocation "Watford Town Hall, London", firstReleaseYear 1980; producer Dr. Rudolf Werner, balance engineer Heinz Wildhagen | DG page | OK (DG writes "London"; Watford is in Hertfordshire, so the yaml says only "Watford Town Hall") |
| Release | 1980 | DG firstReleaseYear 1980; Discogs LP 1980; Fundación Victoria y Joaquín Rodrigo discography: "DG 2531 208 (1980)" | DG page ; https://webantigua.joaquin-rodrigo.com/index.php/en/inicio/165-concierto-de-aranjuez | OK |
| Spotify | 3q15IyNTqYwESGJMbsYP93 | Linked from the DG product page ("Listen now") | DG page ; embed | VERIFIED |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | 1. Allegro con spirito | 368933 | 6:08 | true |
| 2 | 2. Adagio | 675493 | 11:15 | true |
| 3 | 3. Allegro gentile | 315466 | 5:15 | true |
| | Total | 1359892 | 22:39 (22:40 rounded) → `duration_min: 23` | |

Tracks 4–7 are *Fantasía para un gentilhombre* (English Chamber Orchestra, García Navarro; DG metadata: 25 June 1977, Henry Wood Hall), all playable.

## 2. Also recommended: Pepe Romero / Marriner / Academy of St Martin in the Fields (Philips, 1978)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Pepe Romero / Neville Marriner / ASMF | Spotify credits tracks 1–3 (track 2 also credits Barry Davis, cor anglais) | https://open.spotify.com/embed/album/5j85NGNIBoMTCMTu3HbMGG | VERIFIED |
| Recorded / venue | August 1978, Henry Wood Hall, London | Decca product page track metadata: Concierto de Aranjuez 1978-08, "Henry Wood Hall, London", firstReleaseYear 1979 (Fantasía 1975-06 Wembley Town Hall; Concierto madrigal 1974 Brent Town Hall) | https://www.deccaclassics.com/en/catalogue/products/rodrigo-concierto-de-aranjuez-pepe-romero-3688 | OK |
| Label / catalogue | Philips 9500 563 (LP); 432 828-2 (CD) | Discogs 2367046 etc.: Philips 9500 563, 1979 LP; Discogs 32438721: 432 828-2 CD (1991); Decca page SKU 00028943282826 (= 432 828-2) | https://www.discogs.com/release/2367046 ; https://www.discogs.com/release/32438721 | OK |
| Spotify | 5j85NGNIBoMTCMTu3HbMGG | Linked from the Decca page. Tracks 1–3: 6:12 / 12:07 / 5:22, all `isPlayable: true` | embed | VERIFIED |

Not used: Romero / Marriner's digital remake (Philips 438 016-2, recorded 23 July 1992, Watford Town Hall; cor anglais Christine Pendrill), Spotify `65ecvIY1UwrqhUkcgEhUmT`, tracks 1–3 5:58 / 11:30 / 5:07, all playable: a valid alternative if the analogue sound of 1978 is not wanted.

## 3. Painting: Santiago Rusiñol, *Faune vell* (*The Old Faun*), 1911

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Santiago Rusiñol (Barcelona 1861 – Aranjuez 1931), *Faune vell (Old Faun)*, series *Parterres d'Aranjuez*, 1911 | https://www.museoreinasofia.es/en/collection/artwork/faune-vell-old-faun | OK |
| Collection / medium / size | Museo Nacional Centro de Arte Reina Sofía, Madrid, AS12047; oil on canvas, 118 × 146 cm; entered 1995 | same ; Wikidata Q27667826 | OK |
| Image | `File:1907_Rusinol_Garten_von_Aranjuez_anagoria.JPG`, 4752 × 3516, gallery photo by User:anagoria cropped to the canvas; {{PD-Art\|PD-old-auto-expired\|deathyear=1931}}. The "1907" in the file name is wrong; the file page, Wikidata and the museum all give 1911 | https://commons.wikimedia.org/wiki/File:1907_Rusinol_Garten_von_Aranjuez_anagoria.JPG | OK |
| Rights | Rusiñol died 13 June 1931: EU 70 years p.m.a. expired 2002; Spain (80 years for authors who died before 1987) expired 2012; US: painted and exhibited before 1931. A faithful photo of a 2D work creates no new right (EU DSM art. 14) | Commons; Wikipedia | OK |
| Not reused | Not in `content/paintings.yaml`; no other batch shared note uses Rusiñol (grep) | – | OK |

**Pairing.** Rusiñol painted the gardens of Aranjuez repeatedly from 1907 and died in Aranjuez during one of his painting stays (13 June 1931) (es.wikipedia: "Durante una de sus habituales estancias en Aranjuez para la realización de pinturas de paisajes, falleció el 13 de junio de 1931"; en.wikipedia). The painting shows a clipped box-hedge parterre with a statue (the faun) and fountains, the kind of garden Rodrigo said the concerto evokes. Rodrigo is buried in Aranjuez.

Checked and rejected: the other Commons Rusiñol views of Aranjuez (MNBA Buenos Aires *Jardín de Aranjuez*, 2000 × 1615, see alternatives; Reina Sofía *Glorieta II*, 1907, only 1280 × 994; *El jardín del Príncipe de Aranjuez*, private collection, Christie's photo; *The garden at Aranjuez* 1919, "repro from artbook", collection unknown); John Singer Sargent, *Aranjuez* (Brooklyn Museum), only 768 px on Commons.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Aranjuez: royal estate from 1560 (Philip II), on the Tagus, in the south of the Community of Madrid; palace and gardens the spring residence; UNESCO cultural landscape 2001 | https://en.wikipedia.org/wiki/Aranjuez ; https://en.wikipedia.org/wiki/Concierto_de_Aranjuez | OK (no distance given in the guide) |
| Rodrigo's description: "the fragrance of magnolias, the singing of birds, and the gushing of fountains"; I "animated by a rhythmic spirit and vigour without either of the two themes ... interrupting its relentless pace"; II "a dialogue between guitar and solo instruments (cor anglais, bassoon, oboe, horn, etc.)"; III "recalls a courtly dance in which the combination of double and triple time maintains a taut tempo right to the closing bar" | https://en.wikipedia.org/wiki/Concierto_de_Aranjuez | OK |
| Rodrigo blind from age three (diphtheria); a pianist; did not play the guitar | same ; https://en.wikipedia.org/wiki/Joaqu%C3%ADn_Rodrigo | OK |
| Composed in Paris, early 1939, at the end of the Civil War; dedicated to Regino Sainz de la Maza; written at his suggestion (LA Phil note) | Wikipedia ; https://www.hollywoodbowl.com/musicdb/pieces/269/concierto-de-aranjuez | OK |
| Premiere 9 November 1940, Palau de la Música Catalana, Barcelona; Sainz de la Maza, Orquesta Filarmónica de Barcelona, César Mendoza Lasalle | Wikipedia | OK |
| Scoring: 2 fl (2nd = piccolo), 2 ob (2nd = cor anglais), 2 cl, 2 bn, 2 hn, 2 tpt, strings (no trombones, no percussion) | Wikipedia ; Hollywood Bowl note | OK |
| Inspiration of the Adagio: silence for years; popular Guernica belief; Victoria Kamhi's autobiography: honeymoon and the miscarriage of their first pregnancy | Wikipedia (concerto and composer articles) ; https://readingsymphony.org/program-notes-concierto-de-aranjuez-for-guitar-and-orchestra/ | OK (told as her account) |
| Victoria Kamhi, Turkish pianist born in Istanbul, married Rodrigo 1933 | https://en.wikipedia.org/wiki/Victoria_Kamhi | OK (birth year 1905 on en.wikipedia, other sources say 1902: not used) |
| Miles Davis / Gil Evans, *Sketches of Spain* (1960) | Wikipedia | OK |
| Keys D major / B minor / D major; I in 6/8 with hemiola, guitar strumming alone at the start; theme 1 oboe and violins; theme 2 guitar, D major to E-flat | Wikipedia (Structure) | OK |
| I: orchestra supports the opening with soft sustained Ds; the orchestra repeats the guitar's exposition | Hollywood Bowl note | OK |
| I ends as quietly as it began | Reading Symphony note | OK |
| II: cor anglais melody, guitar accompanies; guitar ornaments it and they share the second half; off-tonic guitar trill as first tension; guitar's unaccompanied statement of the whole theme, then a large cadenza; orchestra plays the tune in full voice (*molto appassionato*, strings with woodwind); brief coda brightened to the major, guitar arpeggio, strings close | Wikipedia ; Hollywood Bowl ; Reading Symphony ; https://www.bhso.org.uk/work/rodrigo-concierto-de-aranjuez/ | OK |
| II metre 4/4 | Wikipedia's music example (LilyPond, Adagio, crotchet = 44); no score consulted | UNVERIFIED against a printed score |
| III: alternating 2/4 and 3/4; phrases of one 3/4 bar + three 2/4 bars (nine beats); metre more irregular later; guitar starts the theme in B major, orchestra restates in D major; theme passed and varied; ends suddenly and softly ("softly and dryly") | Wikipedia ; Reading Symphony ; Hollywood Bowl | OK (one programme note says 6/8 and 3/4; Wikipedia and Rodrigo's "double and triple time" support 2/4 and 3/4) |
| Yepes: Madrid debut 16 December 1947 with this concerto, Argenta, Orquesta Nacional; "largely responsible for the growing popularity"; two early recordings with Argenta | https://en.wikipedia.org/wiki/Narciso_Yepes | OK |

Not used: the claim that the Adagio melody is a traditional Holy Week (saeta) tune (one programme note only); Hollywood Bowl's statement that the sixth string is tuned to D (not confirmed elsewhere).

## 5. Re-time (all stops are ≈; derived from the programme notes, the movement structure and the exact track lengths, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro con spirito | 6:08 | 0:00, 0:25, 0:45, 1:20–2:00, 2:00–3:40, 3:40, Last 30 seconds | The orchestral entry (≈ 0:25: 40-bar guitar introduction at about 100 dotted crotchets a minute) and the return of the opening (≈ 3:40, ± 30 s) |
| II Adagio | 11:15 | 0:00, 1:00, 2:15–3:30, 3:30–5:00, 5:00–8:30, 8:30–9:30, Last minute | Start of the guitar's solo statement and cadenza (≈ 5:00, ± 1 min) and the orchestral climax (≈ 8:30, ± 45 s); Yepes takes the movement slowly (11:15 against about 10:30–11:00 in many recordings) |
| III Allegro gentile | 5:15 | 0:00, 0:10, 0:20–1:30, 1:30–2:30, 2:30, 3:00–4:30, Last 15 seconds | The contrasting episode and the return of the theme (≈ 1:30, 2:30) |
