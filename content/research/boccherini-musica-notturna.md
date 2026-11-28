# Verification: Boccherini – String Quintet in C major, Op. 30 No. 6, G. 324, "La musica notturna delle strade di Madrid"

Piece id `boccherini-musica-notturna`. Checked on 2026-11-28 (batch 2026-11c, group C). New composer `boccherini` (entry and sources in the shared note).
Files: `content/drafts/en/boccherini-musica-notturna.md`, `content/drafts/tr/boccherini-musica-notturna.md`. Shared-file additions: `content/research/boccherini-musica-notturna.shared.md`.

**How the checks were done.** Spotify embed pages read with curl from Turkey; Harmonia Mundi product page and release sheet; the album booklet (PDF hosted by eClassical); Discogs API; the 1780 Berlin score (Staatsbibliothek zu Berlin, KHM 498, IIIF images, every page read); Giuggioli 2025 and Aguilera Concepción 2021 (below); Dellaborra 2008 (Boccherini Online) for the Pleyel letter; Wikipedia/Wikidata/Commons APIs; web search. Status key: OK / SECONDARY / UNVERIFIED.

Main sources:
- Score: Staatsbibliothek zu Berlin, KHM 498, "Quintettino VI.o … fatto per Servizzio di S. A. R.le D.n Luigi di Borbone", non-autograph score of the first version (copyist identified as Francisco Font, per Giuggioli n. 5), Public Domain Mark. https://digital.staatsbibliothek-berlin.de/werkansicht?lang=de&PPN=PPN781633729 (IIIF manifest https://content.staatsbibliothek-berlin.de/dc/PPN781633729/manifest).
- Matteo Giuggioli, "The Streets of Madrid …", *Sound Stage Screen* 2025/1-2, pp. 55–76: https://riviste.unimi.it/index.php/sss/article/download/32314/27086/100268 (sources, two versions, five movements, movement-by-movement description, Ritirata tune from the 1761 *Libro de la ordenanza de los toques de pifanos y tambores*).
- Pablo Jesús Aguilera Concepción, "La música nocturna de las calles de Madrid, de Boccherini", *La Gatera de la Villa*, 26 Feb 2021: https://www.gateravilla.es/musica-nocturna-de-las-calles-de-madrid/ (directions in Berlin and Paris sources, instrument roles).
- Christian Speck, booklet note, HMC 902092 (English translation Charles Johnston): https://eclassical.textalk.se/shop/17115/art94/4785594-60c4df-3149020209226_01.pdf
- Federica Dellaborra, Boccherini Online 2008: https://boccherinionline.it/wp-content/uploads/2008/10/N1_2008_SAG1_Dellaborra.pdf (letter to Pleyel of 10 July 1797, Italian text).

---

## 1. Reference recording: Cuarteto Casals with Eckart Runge (harmonia mundi, rec. April 2010)

Why this one: a true string quintet (one player per part, as written) by a Spanish ensemble founded in Madrid; five stars from Michael Dervan (Irish Times) and "Refined performances that celebrate Boccherini's Spanish connection" (The Strad), both via search excerpts; the work is four tracks, all playable in Turkey. Product owner had no preference for this piece.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4zs23dPn7XEJcxu375o6xp | "Boccherini: La musica notturna delle strade di Madrid", tracks 1–4 credited "Luigi Boccherini, Eckart Runge, Cuarteto Casals" | embed; Harmonia Mundi album page embeds this album id (https://www.harmoniamundi.com/en/albums/la-musica-notturna-di-madrid-quintettino-g-324/) | OK |
| Performers | Cuarteto Casals (Abel Tomàs Realp, Vera Martínez Mehner, violins; Jonathan Brown, viola; Arnau Tomàs Realp, cello) + Eckart Runge, cello | Booklet p. 3: Arnau Tomàs "2nd violoncello (1-4)", Eckart Runge "1st violoncello (1-4)"; Discogs credits the same players | booklet; https://www.discogs.com/release/9223943 | OK |
| Label / cat. no. | harmonia mundi, HMC 902092 | HM page "HMC902092 August 2011"; Discogs Harmonia Mundi HMC 902092, ℗ 2011 | as above | OK |
| Recorded / venue | April 2010, Teldex Studio, Berlin | Booklet: "Enregistrement avril 2010, Teldex Studio Berlin"; Discogs: Recorded At Teldex Studio, Berlin | booklet; Discogs | OK |
| release_year / year | 2011 / 2010 | HM: August 2011; recording April 2010 | as above | OK |
| Quartet founded in Madrid, 1997 | "Since its formation in Madrid in 1997" | booklet biography | OK |
| Runge, cellist of the Artemis Quartet | "chelista y fundador del famoso Cuarteto Artemis" | booklet biography (Spanish) | OK |

### Durations and playability (embed, album 4zs23dPn7XEJcxu375o6xp, read 2026-11-28 from Turkey)

| Mvt | Track | Album title of the track | ms | isPlayable | Guide |
| --- | --- | --- | --- | --- | --- |
| I | 1 | I. Il campane quando suonano l'Ave Maria [booklet: – II. Il tamburo del quartier dei soldati – III. Minuetto dei ciechi] | 210 093 | true | 3:30 |
| II | 2 | IV. Il rosario: Largo assai – Allegro | 281 400 | true | 4:41 |
| III | 3 | V. "Los manolos" Modo di suono, e canto [booklet: – VI. Allegro vivo] | 139 186 | true | 2:19 |
| IV | 4 | VII. Ritirata – Maestoso | 214 066 | true | 3:34 |

Sum 844 745 ms = 14.1 min → `duration_min: 14`. Tracks 5–15 (other works) are not used.

**Which version, and where the second drum falls (UNVERIFIED, inferred).**
- Boccherini's two versions (Giuggioli): the 1780 Berlin score (Ritirata "Maestoso", four sections, no melodic variation) and a later version known from Picquot's copy of the parts Boccherini sent to Pleyel in 1797 (Paris, BnF Rés. F. 1191; Ritirata "Tempo di marcia" with eleven variations). The album's titles use the Berlin wording ("Il tamburo del quartier dei soldati", "Modo di suono, e canto", "Ritirata – Maestoso"), with "Los manolos" from the Paris source; nothing says "con variazioni". The guide therefore follows the Berlin score and says only "The stops here follow the 1780 score". The booklet quotes the Paris instruction ("the Retreat begins to be heard in the distance … scarcely audible"), so the players may shape the march's dynamics that way; the guide's Ritirata stops describe the sections by who plays the drum and give the written dynamics as "marked …".
- Track 3 is titled "V … – VI. Allegro vivo"; the booklet's own list numbers "6. The drum-roll" as section VI, so the second drum is taken to be at the end of track 3 (stop "Last 20 seconds"). Cross-check: Savall's album times the Passa calle 1:51 and the drum 0:29 (sum 2:20, close to this track's 2:19). If the drum is instead at the start of track 4, every Ritirata stop is about 20 s early. Listed in Re-time.

## 2. Also recommended: Le Concert des Nations / Jordi Savall (Alia Vox, 2005)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify | https://open.spotify.com/album/6lh4kp8VWBw7O7yd6hul1I, "Luigi Boccherini: Fandango, Sinfonie & La Musica Notturna Di Madrid"; G. 324 = tracks 11–17 (0:41, 0:36, 2:01, 4:34, 1:51, 0:29, 2:37), all `isPlayable: true` (2026-11-28) | embed (album id found from the Spotify page of track 2PKiKhfIX7OWS56cbF24Y7) | OK |
| Label / cat. no. | Alia Vox AV 9845 (hybrid SACD; AVSA 9845 in some shops) | classicalacarte.net fiche 9845; Radio Times CDs / Europadisc listing | OK |
| Recorded / venue | 31 July and 4 August 2005, Abbaye de Saint-Michel en Thiérache | classicalacarte.net fiche 9845 | OK |
| Release | 2005 (Apple Music: 18 Nov 2005; some shops 1 Feb 2006) | search excerpts | SECONDARY |
| Reception | Classics Today "Reference Recording" (search excerpt; site blocks scripted fetches); SoundStage April 2006 | search | SECONDARY |
| Note | Classica (Répertoire 79, 02/2006) says the quintets on this disc "semblent arrangés comme avec un accompagnement d'orchestre" and the booklet gives no detail: the Musica notturna may be played with more than one player per part. The yaml credits the ensemble and Savall. | classicalacarte.net | noted |

Other recordings seen on Spotify (not used): Carmina Quartet with Rolf Lislevand (album 0cjHZyij5qfzWGB4Z8WjEt; five tracks, drum and Ritirata 3:21 together), Karajan / Berlin Philharmonic (orchestral).

## 3. Painting: Francisco de Goya, *The Blind Guitarist* (*El ciego de la guitarra*), 1778

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Museum | Museo Nacional del Prado, Madrid, P000778; oil on canvas, 260 × 311 cm | Wikidata Q5824333 (P217 P000778); Commons file page; Fundación Goya en Aragón catalogue no. 36 | OK |
| Date | 1778 (delivered 27 April 1778; returned to Goya six months later to be narrowed, final delivery between July 1779 and March 1780) | Fundación Goya en Aragón: https://fundaciongoyaenaragon.es/eng/obra/el-ciego-de-la-guitarra/36 | OK |
| Subject | Tapestry cartoon, series of 13 for the antechamber of the Prince and Princess of Asturias, El Pardo; "the blind man singing couplets dominating the composition. Such a figure was common in the Madrid of the 18th century"; majos, vendors, children; location perhaps the Plazuela de la Cebada, Madrid (Vandergoten) | same | OK |
| Image | https://commons.wikimedia.org/wiki/File:Francisco_de_Goya_y_Lucientes_-_El_guitarrista_ciego.jpg, 3051 × 2546, source Museo del Prado, {{PD-Art|PD-old-auto-expired}} (Goya d. 1828) | Commons API | OK |
| Rights | Painting PD by age; faithful reproduction, no new right (EU DSM art. 14; US Bridgeman). Not NC. | – | OK |
| Reuse check | Not in `content/paintings.yaml`. Goya is already used three times (Witches' Sabbath, The Snowstorm, The Dance on the Banks of the Manzanares). Chosen anyway as clearly the best match: the blind street singers of Madrid are the subject of Boccherini's minuet (booklet: "Blind beggars had a function akin to newspapers in Madrid … singing to a guitar accompaniment"), painted in Madrid two years before the quintet. Two alternatives in the shared note: Paret's *Masked Ball* (not Goya; it belonged to Don Luis) and Goya's *Family of the Infante Don Luis*. | – | noted |

Pairing note claims: "A blind street singer with his guitar draws a crowd of majos, vendors and children in a Madrid square" (Fundación Goya; "a Madrid square" because the Plazuela de la Cebada identification is Vandergoten's), "painted two years before" (1778 vs 1780).

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Written 1780; sixth of the Op. 30 quintettini (G. 319–324), "fatto per Servizzio di S. A. R. D.n Luigi di Borbone Infante di Spagna" | Berlin score title page (catalogue record); Giuggioli (date from the title page of G. 319); IMSLP lists 1780 | OK |
| Don Luis, younger brother of Charles III; married María Teresa de Vallabriga 27 June 1776; household moved to (Las) Arenas | Treccani DBI "Boccherini, Luigi" (1969); en.wikipedia "Musica notturna" and "Luigi Boccherini"; booklet ("banished from Madrid on account of his morganatic marriage"; "eight years … at Arenas de San Pedro near Ávila") | OK. "Woman of lower rank" for the morganatic marriage; the guide does not say "banished" |
| "Small town in the mountains west of Madrid" | Arenas de San Pedro, Sierra de Gredos, province of Ávila (Wikipedia) | OK |
| Title-page note (translated by us): "Questo Quintettino rappresenta la Musica che passa di notte per le strade di Madrid, cominciando dal tocco del' Ave Maria, sin a la Ritirata: è tutto ciò che non e conforme alle regole della composizione, deve condonarsi alla Verità della cosa, che si và a rappresentare" | Staatsbibliothek catalogue transcription (manifest metadata); Giuggioli n. 21, 41 | OK |
| Programme music rare in chamber music then | booklet (stands apart from the aesthetic of autonomous instrumental music); Interlude (programme music usually orchestral) | SECONDARY, cautious wording |
| Directions quoted: "Tutti pizzicato, imitando il tocco delle campane quando suonan l'Ave Maria"; "il Primo Violino (forte più che puole) entrarà imitando il tamburo del quartier de i Soldati, quando ancor essi suonano, e recitano l'Ave Maria"; Minuetto "Con mala grazia", second half "Con asprezza"; "i Violoncelli si mettranno l'istrumento attraversato sulle ginocchia, e pizzicaranno con le ugnie di tutta la mano posta al rovescio, come chi suona una chitarra"; "Doppo una breve pausa si replica tutto il minuetto come stà"; Rosario "Largo assai: Senza rigor di battuta", "dolcissimo e con grazia", "pizzicato imitando un campanello" (vn II, later viola), "tutto sulla terza corda imitando il fagotto" (vc I); Passa calle note, "Pizzicato sempre", vc I "for. e con mala grazia", vn II "Solo, Arpeggio"; "Il Primo Violino imitando il tamburo"; Ritirata "Maestoso", vc "imitando il tamburo" | Berlin score pp. 2–26, read from the IIIF images | OK |
| First cello strikes a low note before each bell chord ("as if imitating the strike of the bell") | Giuggioli p. 63; score p. 2 (vc I part) | OK |
| The violin drum hammers one note | Aguilera (middle C); score p. 2 | OK |
| Minuet: limping ("alla zoppa") tune; no trio, no return of the first part; second cello's chords alone at the end; repeated after a short pause | Giuggioli p. 64; score pp. 3–5 | OK |
| Rosary: rosary singers in Madrid streets; prayer duet vn I low / vc I high in thirds and sixths; response all five, 3/4, forte; three Largo–Allegro pairs | Giuggioli pp. 64–65; Aguilera; score pp. 6–11 (Largo, Allegro, Largo come prima, Allegro, Largo come prima, Allegro) | OK |
| Passa calle note (translated); manolos = young men of Madrid's popular quarters (Lavapiés) | score p. 12; Giuggioli p. 65; booklet (Manolo: "dandyish, uneducated type of young man … singing and dancing in the street"; guitar) | OK |
| Passa calle structure: strummed refrain, cello song, vn II solo arpeggios; ends with vn II alone | score pp. 12–20; Giuggioli p. 65 | OK |
| Ritirata = evening retreat/curfew call; tune from the 1761 *Libro de la ordenanza de los toques de pifanos y tambores …* (Biblioteca Nacional de España M/2791, by Manuel Espinosa de los Monteros) | Giuggioli pp. 65–66 and n. 32; Aguilera | OK |
| First-version Ritirata: four sections; written dynamics f, pianissimo, alternating for./pia bar by bar, fortissimo; drum tremolo passes vc I → vc II → vn II → viola; vn I and vn II "Unis." in the last section | score pp. 21–26 | OK (read by us from the manuscript) |
| Five movements in the score; seven numbered scenes in editions/recordings | Giuggioli p. 62 (five scenes) and n. 1 ("five movements"); booklet list of seven; Wikipedia lists seven | OK |
| Letter to Pleyel, 10 July 1797: "questo pezzo è totalmente inutile, ed anche ridicolo fuori di Spagna, poiché non possono gl'uditori giammai comprendere il significato, né gli esecutori sonarlo come deve essere sonato; per il che in suo luogo vi mando una sinfonia a grande orchestra" | Dellaborra 2008 (citing the *Epistolario*); Aguilera (date); Giuggioli | OK |
| Unpublished in his lifetime | Interlude (Buja 2023: "never published in Boccherini's lifetime"; first printed as a single work in 1921); IMSLP has Vieweg's edition, ca. 1926 | SECONDARY: the guide does not give a year |
| One of his best-known works | Giuggioli p. 58 ("perhaps Boccherini's best-known work together with his Fandango"); Wikipedia | OK |
| Later version: Ritirata as theme and eleven variations; "si figura che la Ritirata cominci a farsi sentire di lontano assai, perciò dovrà suonarsi con piano, che appena si senta"; transcriptions (piano quintet G. 418, quintet with two violas G. 390, guitar quintet) | Giuggioli pp. 66–67 and nn. 34–35; Aguilera | OK |
| Berio, *Quattro versioni originali della "Ritirata notturna di Madrid"* (1975), four versions superimposed, for orchestra | Giuggioli p. 59; Wikipedia; BSO work page | OK |
| Boccherini in Spain from 1768 to his death in Madrid, 1805 | Treccani; Wikipedia | OK |
| Not used: Master and Commander, Cruising, Barcelona 1992 film/TV uses (Wikipedia, IMDb only); van Gasteren's "secret love" reading (one Dutch book); Grand Prix du Disque for the 1975 Ensayo recording (Wikipedia, uncited) | – | omitted |

Translations of Boccherini's directions in the guide are ours. "Con mala grazia" = "with bad grace" (clumsily); "con asprezza" = "harshly".

## 5. Re-time (every stop is ≈; not heard)

How derived: bar counts and section order from the Berlin score; section lengths scaled from Savall's separately tracked sections (tracks 11–17 of 6lh4kp8VWBw7O7yd6hul1I: bells 0:41, drum 0:36, minuet 2:01, rosary 4:34, passa calle 1:51, drum 0:29, Ritirata 2:37) to this album's track lengths; inside sections, bar counts × the track's average tempo. Repeats taken by the Casals are unknown.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Ave Maria – drum – Minuet | 3:30 | 0:00, 0:45, 1:20, 1:45, 2:10, 2:25, Last 15 seconds | the minuet's repeat ≈ 2:25 (± 20 s; depends on which inner repeats are played twice) |
| II Rosary | 4:41 | 0:00, 0:15, 1:20, 1:35, 2:55, 3:10, 4:25 | the free-time Largos ("senza rigor di battuta") may differ in length: ≈ 1:20 and ≈ 2:55 ± 20 s |
| III Passa calle – drum | 2:19 | 0:00, 0:15, 0:40, 0:55, 1:40, Last 20 seconds | whether the second drum is at the end of this track (assumed from the track title) and the repeat of the first song (≈ 0:40 could be ≈ 1:05) |
| IV Ritirata | 3:34 | 0:00, 0:50, 1:45, 2:40, Last 15 seconds | four sections taken as equal; if the drum opens this track, all stops ≈ 20 s later; the version (1780 vs later) is inferred from titles and length |
