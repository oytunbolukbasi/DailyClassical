# Verification: Salieri – Requiem in C minor (1804)

Piece id `salieri-requiem`. Checked on 2026-11-28 (batch 2026-11c, group D).
Files: `content/drafts/en/salieri-requiem.md`, `content/drafts/tr/salieri-requiem.md`.
Shared-file additions (paintings.yaml, glossary "Cor anglais" and "Responsory", new composer `salieri`): `content/research/salieri-requiem.shared.md`.

**How the checks were done:** Spotify embed pages (`__NEXT_DATA__`) fetched with curl from a Turkish network on 2026-11-28; Discogs API (release 14255242 and 28832188) and MusicBrainz; label page (PentaTone), Qobuz; reviews (MusicWeb International ×2, HRAudio.net); the Wiener Hofmusikkapelle's programme page on the work; Early Music Review on the A-R Editions score (ed. Jane Schatkin Hettrick, 2017); IMSLP work page (catalogue data only: the score PDF sits behind IMSLP's bot check, so it was **not** read); a 2018 concert programme note (North London Chorus, Paul Filmer); Wikipedia; Wikimedia Commons API, Wikidata, SKD online collection. Status key: OK = matches a reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed. Nothing was heard; no score was read.

## 1. Choice of recording

The brief left the recording open (complete, well regarded, every track playable in Turkey, ideally ≤ 10 tracks for the work). Candidates found on Spotify (2026-11-28):

| Album | Performers | Tracks for the Requiem | Playable | Verdict |
| --- | --- | --- | --- | --- |
| `13EeqaoO3WXDtv14fZadHo` *Salieri: Requiem* (PentaTone PTC 5186 359, 2010) | Lawrence Foster, Coro & Orquestra Gulbenkian | 7 (tracks 1–7), 39:04 | all `true` | **chosen**: 7 tracks, complete, the most widely reviewed recording (MusicWeb, HRAudio 4–4.5★ ×2, Gramophone review exists, AllMusic/TiVo note on Qobuz) |
| `61gePoVQDNkUuT09jQ46mw` *Mozart & Salieri: Requiem* (Château de Versailles Spectacles CVS078, 2022) | Hervé Niquet, Le Concert Spirituel | 18 (tracks 1–18), 30:12 | all `true` | too many tracks for the work; used as `also_recommended` and for proportions (see §6) |
| `5abGnS9I6JTkrYDMOe1Mn6` *The Best of Salieri (Remastered)* | uncredited on Spotify (probably the Milan Vlček Music release listed by requiemsurvey.org; not confirmed) | 10 | all `true` | performers unknown, so not usable as a reference; used only for proportions (§6) |

The fallback (`salieri-la-folia-variations`) was **not** needed.

## 2. Reference recording: Foster / Gulbenkian (PentaTone, 2010)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Album | `13EeqaoO3WXDtv14fZadHo` | *Salieri: Requiem*, 10 tracks, all `isPlayable: true`; Requiem = tracks 1–7 | https://open.spotify.com/embed/album/13EeqaoO3WXDtv14fZadHo | VERIFIED |
| Conductor / chorus / orchestra | Lawrence Foster; Coro Gulbenkian (chorus master Jorge Matta); Orquestra Gulbenkian | Spotify credits "Coro Gulbenkian, The Gulbenkian Orchestra, Lawrence Foster"; Qobuz "Orquestra Gulbenkian (Orchestra); Coro Gulbenkian (Choir)"; Discogs: chorus master Jorge Matta, leader Mihaela Costea | embed; https://www.qobuz.com/br-pt/album/salieri-requiem-in-c-minor-beethoven-meeresstille-und-gluckliche-fahrt-schubert-intende-voci-lawrence-foster-orquestra-gulbenkian-coro-gulbenkian/ve3xe46mhiqvc ; https://api.discogs.com/releases/14255242 | VERIFIED |
| Soloists | Arianna Zukerman (soprano), Simona Ivas (mezzo-soprano), Adam Zdunikowski (tenor), Luís Rodrigues (baritone) | MusicWeb header: "Arianna Zukerman (soprano), Simona Ivas (mezzo), Adam Zdunikowski (tenor), Luís Rodrigues (baritone)"; Spotify track credits name the same four (Spotify spells "Luis"); Qobuz: Rodrigues "Baritone", Zdunikowski "Tenor Solo" | https://www.musicweb-international.com/classrev/2010/Sept10/Salieri_requiem_PTC5186359.htm ; embed | VERIFIED |
| Other Spotify credits | not in the yaml | Spotify also credits **Alice Caplow-Sparks** and **António Esteireiro** on tracks 1–7. Esteireiro is a Lisbon organist (Madeira Organ Festival biography: https://festivaldeorgao.madeira.gov.pt/4ing/antonio-esteireiro-organ.html), so presumably the organ continuo; Caplow-Sparks's role is not stated anywhere I could find (perhaps the cor anglais solo). Left out of the yaml and the text | embed | UNVERIFIED (roles) |
| Label / catalogue | PentaTone, "PTC 5186 359" | Discogs: PentaTone classics, PTC 5186 359, barcode 827949035968, Hybrid SACD; label page "PTC 5186359"; ℗ 2010 Pentatone Music B.V. (Qobuz) | https://api.discogs.com/releases/14255242 ; https://www.pentatonemusic.com/product/salieri-requiem-in-c-minor-beethoven-meeresstille-und-gluckliche-fahrt-schubert-intende-voci/ | VERIFIED |
| Recorded / venue | "November 2009 (live)", Grande Auditório, Calouste Gulbenkian Foundation, Lisbon | Discogs notes: "Recorded Live at the Grande Auditório of the Calouste Gulbenkian Foundation, Lisbon, November 2009"; MusicWeb: "Live, Grande Auditório, Calouste Gulbenkian Foundation, Lisbon, November 2009"; HRAudio: November 2009, Polyhymnia team (producer Job Maarse) | as above ; https://www.hraudio.net/showmusic.php?title=6479&showall=1 | VERIFIED |
| Release | 2010 | Label page and Qobuz: 01-05-2010 (1 May 2010, MusicBrainz release e234861c… date 2010-05-01) | https://musicbrainz.org/release/e234861c-9531-48f6-852e-91adb3c98105 | VERIFIED |
| Tempo headings (Movements table) | see draft | Discogs sub-tracks: "Introitus / Kyrie -- Larghetto-Allegretto-Larghetto"; "Sequenz (Dies Irae) -- Andante Maestoso-Allegro Molto-Adagio-Andante Con Moto-Andante Maestoso-Larghetto"; "Offertorium -- Andante Maestoso Ma Con Moto-Larghetto"; "Sanctus -- Largo E Maestoso-Allegretto Non Molto"; "Benedictus -- Andante Con Moto-Allegretto Non Molto"; "Agnus Dei / Communio -- Larghetto -- Poco Allegro"; "Libera Me, Domine -- Andante" (from the CD back cover/booklet) | Discogs API | OK (not checked against a score) |
| Reviews used in the text | "Reviewers praised the chorus above all, and the four soloists as a well-matched team" | HRAudio (Graham Williams, 19 June 2010): "the very impressive Coro Gulbenkian"; soloists "who only sing as a group, are well matched"; John Broggio (10 Aug 2010): "The soloists make a well-matched team"; Qobuz/TiVo note praises the chorus's smooth sound | HRAudio; Qobuz | OK |

### Track list from the embed (Requiem tracks in bold; all `isPlayable: true`)

| Track | Title (Spotify) | ms | Time | Movement |
| --- | --- | --- | --- | --- |
| **1** | Requiem in C Minor: Introitus - Kyrie | 393960 | 6:33 | I |
| **2** | Requiem in C Minor: Sequence | 890693 | 14:50 | II |
| **3** | Requiem in C Minor: Offertory | 244146 | 4:04 | III |
| **4** | Requiem in C Minor: Sanctus | 123413 | 2:03 | IV |
| **5** | Requiem in C Minor: Benedictus | 170733 | 2:50 | V |
| **6** | Requiem in C Minor: Agnus Dei - Communio | 325640 | 5:25 | VI |
| **7** | Requiem in C Minor: Libera me, Domine | 196093 | 3:16 | VII |
| 8 | Meeresstille | 290893 | 4:50 | – |
| 9 | Meeresstille und glückliche Fahrt, Op. 112: Gluckliche Fahrt | 171293 | 2:51 | – |
| 10 | Offertory: Intende voci in B-Flat Major, D. 963 | 570053 | 9:30 | – |

Times truncated to the second, as Spotify shows them. Requiem total 2 344 678 ms = 39:05 → `duration_min: 39` (MusicWeb prints 38:58; the label page's per-track times 6:36, 14:48, 4:05, 2:03, 2:52, 5:26, 3:08 differ slightly from the digital tracks, which are what the app plays).

## 3. Also recommended: Niquet / Le Concert Spirituel (Château de Versailles Spectacles, 2022)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Album | `61gePoVQDNkUuT09jQ46mw`, 32 tracks; Salieri = tracks 1–18 (5:01, 0:56, 0:48, 1:15, 0:59, 3:05, 0:54, 0:44, 1:15, 0:53, 0:37, 1:39, 0:27, 1:13, 2:01, 2:55, 2:14, 3:06; 30:12), Mozart K. 626 = 19–32; all `isPlayable: true` | https://open.spotify.com/embed/album/61gePoVQDNkUuT09jQ46mw | VERIFIED |
| Performers | Hervé Niquet; Le Concert Spirituel (choir and orchestra); Valentina Naforniță (soprano), Ambroisine Bré (alto), Robin Tritschler (tenor), Andreas Wolf (bass) | Discogs credits; MusicWeb header | https://api.discogs.com/releases/28832188 ; https://musicwebinternational.com/2022/12/mozart-salieri-requiem-chateau-versailles/ | VERIFIED |
| Label / catalogue | Château de Versailles Spectacles, CVS078 | Discogs; MusicWeb | VERIFIED |
| Recorded / venue | "Enregistré du 20 au 23 novembre 2021 à la Chapelle Royale de Versailles"; ℗ 2021 © 2022; released 2022-11-11 | Discogs notes | VERIFIED |

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Hofkapellmeister 1788–1824, "the longest tenure of any Hofkapellmeister" | Wiener Hofmusikkapelle, programme page "Antonio Salieri" (https://www.hofmusikkapelle.gv.at/en/program/program-details/antonio-salieri-7); Wikipedia (1788 after Bonno's death; officially retired 1824) | OK |
| Composed 1804 for his own funeral | Hofmusikkapelle ("to be performed at the funeral services for his own death"); Early Music Review on the Hettrick edition ("began writing it in 1804… intended it to be performed at his own funeral"); IMSLP: "1804 (August)"; Müpa Budapest booklet says "early 1804". The month is disputed, so the guide gives only the year | OK |
| Heading "Picciolo Requiem composto da me, e per me, Ant. Salieri, piccolissima creatura" | Hofmusikkapelle (quotes the autograph header). A search-result extract from another source spelled "picciolissima"; the Hofmusikkapelle spelling is used. Translation mine ("the smallest of creatures") | OK (spelling from one source) |
| Possible motives: family deaths, Gassmann's unfinished Requiem, Eybler's Requiem (1803), the 1800 printing of Mozart's | Hofmusikkapelle ("the exact trigger is unknown"); guide words it "may all have played a part" | OK |
| "An act of personal devotion" (Threads) | Erick Arenas's review of the Hettrick edition, *Nineteenth-Century Music Review* 17/1 (2020), as summarised in a search extract: Hettrick explains the piece as an act of personal piety. Hofmusikkapelle: his church music "humble and devotional" | OK (summary only) |
| Died 7 May 1825, Vienna; first performance 22 June 1825 at his memorial Mass in the Minoritenkirche, by the court musicians under Joseph Eybler, his successor | Wikipedia (memorial service 22 June 1825, "his own Requiem… performed for the first time"); Hofmusikkapelle ("22 June 1825, at the funeral mass for the composer in the Minorite Church in Vienna… under Joseph Eybler, Salieri's successor") | OK |
| Minoritenkirche = church of the Italian community | Wikipedia, "Minoritenkirche, Vienna": given to the Italians by Joseph II, "Italienische Nationalkirche Maria Schnee" | OK |
| Eybler began to complete Mozart's Requiem | Already in `mozart-requiem` (Wikipedia, Mozart's Requiem) | OK |
| Quiet and devout; homophonic choral writing rather than counterpoint; the Dies irae set as one continuous piece; text in large movements | Hofmusikkapelle ("favors melodic, homophonic passages over counterpoint"; "the text-rich Dies Irae is set as one continuous piece"); MusicWeb (Parr): "genteel"; Filmer: seven numbers | OK |
| Soloists only as a group of four, in Recordare, Benedictus, Libera me | HRAudio (Williams): soloists "only sing as a group"; Filmer: soloists "always in simultaneous harmony, never individually against one another", first contribution the Recordare, Benedictus alternation of soloists and chorus, soloists at the centre of the Libera me; MusicWeb (Sheppard): soloists used "infrequently", their part in the Benedictus "particularly lovely". Filmer lists the three numbers as "Sequenz, Sanctus and Responsory" (the Benedictus is part of the Sanctus number in the Mass), so the guide names the Benedictus | OK |
| Scoring: strings, 2 oboes, cor anglais, 2 bassoons, trumpets, 3 trombones, timpani, organ | Hofmusikkapelle: strings, 2 ob, 2 bn, 2 tpt, 2 tbn (alto, tenor), timpani, "expanded to include an English horn and a third trombone"; Early Music Review (Hettrick edition): "two oboes, English horn, two bassoons, trumpets, trombones, timpani, strings, and organ"; a clarinet part is provided as a contemporary alternative to the cor anglais. requiemsurvey.org (Kröper) mentions clarinets: an alternative version, not used. Filmer mentions "horn" in the Recordare and Agnus Dei: not in either scoring list, so the guide says "winds"/"orchestra" | OK |
| Cor anglais solo in the introduction | HRAudio (Williams): "the orchestral introduction of the 'Introitus' with its plaintive cor anglais solo and long melodic Italianate lines"; Filmer: strings and wind, "especially the English horn", open the Introit | OK |
| Introitus: basses softly in a rocking rhythm, then the full choir; woodwind with "Te decet" and "omnis caro"; Kyrie with crescendo on "Christe eleison"; sopranos' high arching phrases | Filmer ("basses plead softly, in a gently undulating rhythm… followed after the briefest of pauses by the… entire chorus, in full voice"; "woodwind as the choir expands it further with 'te decet…' and 'omnis caro…', then moving gently into the Kyrie and on to a concluding crescendo of 'Christe eleison'"); MusicWeb (Parr): sopranos' "high arching phrases" in the Kyrie | OK (one programme note) |
| Dies irae: cries over strings and bassoon, brass and percussion join; strings alternate staccato and legato under "Teste David", "Quantus tremor", "Cuncta stricte"; "Tuba mirum" at different tempi and dynamics up to "Rex tremendae"; quiet "salva me" with women and men alternating; soft andante orchestral passage before the Recordare; Confutatis "nothing fierce… pensive, resigned"; Lacrimosa "sad majesty", "defiant majesty"; plaintive "Pie Jesu", assertive "Amen" | Filmer; MusicWeb (Sheppard): "fierce brass" in the Tuba mirum, the Lacrymosa as "an awful warning" rather than weeping; MusicWeb (Parr): Dies irae "a minor outburst", Lacrimosa the most threatening music, "impressive trumpet calls" in the Tuba mirum | OK (programme note + two reviews) |
| Offertory: andante maestoso opening, brisk change of tempo into the "Quam olim Abrahae" fugue; Hostias Larghetto | Filmer; Discogs tempo heading; Niquet track division (Domine Jesu / Quam olim / Hostias) | OK. Whether "Quam olim" returns after the Hostias is not known: not claimed |
| Sanctus: repeated largo e maestoso calls, quick allegretto fugue on Osanna, "firmly extended resolution on 'excelsis'" | Filmer; Discogs heading | OK |
| Benedictus: soloists and chorus alternate at a gentle andante, ends with an Osanna | Filmer; Discogs heading | OK. Kröper (requiemsurvey.org) thinks the Benedictus solo parts are "by a foreign hand", perhaps from 1842: a single opinion, not used |
| Agnus Dei: forceful larghetto opening, quiet repetitions; Communio: basses lead a rolling fugue on "Cum sanctis tuis", crescendo on "pius es" | Filmer; Discogs heading (Poco allegro) | OK. The Niquet track for the Communio is titled "Requiem aeternam"; the guide names both texts without claiming their order |
| Libera me: responsory sung beside the coffin after the Requiem Mass, before burial | Wikipedia, "Libera me" | OK |
| Libera me in Salieri: quiet, simple, soloists at the centre in a song-like style on "Requiem aeternam… lux perpetua"; ends "almost abruptly" on "quando coeli… et terra"; choir sings the final words with winds doubling, otherwise unaccompanied | Filmer (also calls the soloists' style Singspiel-like; not used); MusicWeb (Sheppard): "the chorus sings the final words, lines doubled by the winds and otherwise unaccompanied" | OK |
| Salieri above all an opera composer | Wikipedia (37 operas staged in his lifetime); Hofmusikkapelle ("more than 40 operas… only five masses") | OK |
| Poisoning legend: rumour began decades after 1791; disproved because the symptoms did not indicate poisoning; Pushkin's *Mozart and Salieri* (1831), Rimsky-Korsakov's opera (1898), Shaffer's *Amadeus* (1979), film 1984 | Wikipedia, "Antonio Salieri" (Pushkin dated 1831 there; it was written in 1830, published 1831); Filmer; MusicWeb (Sheppard): the rivalry in *Amadeus* and Pushkin is fiction | OK |
| Rivals for posts and commissions | Wikipedia (Mozart's letters on Salieri's "cabals"; "the only one who counts in the Emperor's eyes is Salieri", 1781); Filmer ("they often competed for appointments") | OK |
| October 1791, *The Magic Flute*: Mozart fetched Salieri in his carriage and reported a "Bravo" for every number | Mozart's letter of 14 October 1791, quoted in Wikipedia and in Filmer ("from the overture to the last choir there was not a piece that didn't elicit a 'Bravo' or a 'Bello!' from him") | OK |
| Gulbenkian album content (Beethoven Op. 112, Schubert *Intende voci* D. 963) | Embed; Discogs | VERIFIED |

Not used: the Hüttenbrenner quotation ("I feel that the end of my days is drawing near…", in Filmer) because its date is not given; Filmer's claims that Salieri was a pall-bearer at Mozart's funeral and that he forbade any performance before his death (not in the other sources); Kröper's singular "dona ei" reading (not confirmed: Filmer's libretto prints "dona eis"); the motet *Audite vocem magnam*, meant for the funeral but not sung (Early Music Review), left for a later edit.

## 5. Painting: Caspar David Friedrich, *The Cemetery Entrance* (*Der Friedhof* / *Friedhofseingang*), c. 1825

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Caspar David Friedrich (1774–1840); SKD title "Der Friedhof", also known as "Friedhofseingang"; "um 1825"; Wikidata Q16038517 "The Cemetery Entrance", inception 1825 | https://skd-online-collection.skd.museum/Details/Index/241960 ; https://www.wikidata.org/wiki/Q16038517 | OK |
| Collection / inventory / medium / size | Galerie Neue Meister (Albertinum), Staatliche Kunstsammlungen Dresden, Gal.-Nr. 2197 B; oil on canvas, 143 × 110 cm; acquired 1919 | SKD; Deutsche Digitale Bibliothek (https://www.deutsche-digitale-bibliothek.de/item/24LB2GZY7RIKGLMYDVISAWA4PC5RA5JJ) | OK |
| Content for the pairing note | SKD: Carl August Böttiger saw it in progress in 1825, ordered by a Leipzig art lover, probably as a memorial for a dead child; never finished; a fresh grave mound; the gate as a threshold between the earthly world and the realm of death, the view beyond linked with the Christian hope of resurrection; crown of thorns, lance and sponge on a staff above the gate | SKD | OK |
| Image | Commons `File:Caspar_David_Friedrich_-_The_Cemetery_-_Google_Art_Project.jpg`, 3926 × 5166, Google Art Project (asset AAEiq0o-GntQFQ), `{{PD-art-two-auto|1840}}` | https://commons.wikimedia.org/wiki/File:Caspar_David_Friedrich_-_The_Cemetery_-_Google_Art_Project.jpg | VERIFIED (API) |
| Rights | Friedrich died 1840: public domain by age. Faithful photograph of a 2D work: no new right (EU DSM art. 14; US *Bridgeman v. Corel*). The DDB record marks the SKD's own image "InC 1.0"; that is the museum's photo, not used; the Google Art Project file is PD-Art on Commons | as above | OK |
| Not reused | No entry in `content/paintings.yaml` for this painting. Friedrich already appears three times (`schubert-symphony-8`, `beethoven-piano-sonata-14`, `schubert-string-quintet`), so the brief's "clearly the best match" rule applies: it was begun in 1825, the year of Salieri's death and of the Requiem's first performance, and its subject (a graveyard gate as the threshold of death, under the instruments of the Passion, with the hope of resurrection) is the Requiem's and the Libera me's. Two alternatives by other artists are in the shared note | `content/paintings.yaml` (grep) | OK |

## 6. Re-time (all stops are ≈; estimated, not heard)

Method. No score could be read (IMSLP bot check) and nothing was heard, so bar counts were not available. Internal sections were placed by **proportion**, using two other Spotify recordings that split the movements into more tracks:

- Sequence (track 2, 890.7 s). Niquet's eight tracks (Dies irae 56.5 s, Tuba mirum 48.9, Mors stupebit 75.3, Rex tremendae 59.9, Recordare 185.8, Confutatis 54.9, Lacrimosa 44.2, Huic ergo 75.2; total 600.7 s) and the anonymous "Best of" album's four (Dies irae 97.3, Tuba mirum 182.4, Rex tremendae 95.4, Recordare–Confutatis–Lacrimosa 553.7; total 928.8 s) give almost the same shares: Tuba mirum starts at 9.4 % / 10.5 % of the movement (Foster ≈ 1:24 / 1:33 → stop ≈ 1:30), Rex tremendae at 30.1 % / 30.1 % (≈ 4:28 → ≈ 4:30), Recordare at 40.1 % / 40.4 % (≈ 5:57 / 6:00 → ≈ 6:00). Inside the last part only Niquet divides further: Confutatis ≈ 10:33, Lacrimosa ≈ 11:54, Huic ergo ≈ 12:59 (→ 10:30, 11:55, 13:00).
- Offertory (244.1 s): Niquet Domine Jesu 53.3 / Quam olim 37.1 / Hostias 99.8 s → Quam olim ≈ 1:08, Hostias ≈ 1:56.
- Sanctus (123.4 s): Niquet Sanctus 27.5 / Hosanna 73.7 s → Osanna ≈ 0:34.
- Agnus Dei – Communio (325.6 s): Niquet Agnus Dei 175.4 / Requiem aeternam (Communio) 134.8 s → Communio ≈ 3:05.
- Introitus – Kyrie, Benedictus, Libera me: no recording found that divides them, so stops are placed from the order of the text and the tempo headings, assuming the Introitus takes about 60 % of track 1 (Kyrie ≈ 3:50). These are the least certain.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Introitus and Kyrie | 6:33 | 0:00, 0:45, 1:10, 2:00, 3:50, 4:45, Last 40 seconds | Start of the Kyrie ≈ 3:50 (± 45 s) and the choir's entry ≈ 0:45 (length of the introduction unknown, ± 20 s) |
| II Sequence: Dies irae | 14:50 | 0:00, 1:30, 4:30, 6:00, 6:30–10:30, 10:30, 11:55, 13:00 | Confutatis / Lacrimosa / Huic ergo (from one recording's proportions only, ± 30 s) |
| III Offertory | 4:04 | 0:00, 1:10, 1:55 | Hostias ≈ 1:55 (± 20 s) |
| IV Sanctus | 2:03 | 0:00, 0:35, Last 15 seconds | Osanna ≈ 0:35 (± 10 s) |
| V Benedictus | 2:50 | 0:00, 0:40, Last minute | Choir's first answer ≈ 0:40 and the start of the Osanna (placed in the last minute; ± 30 s) |
| VI Agnus Dei and Communio | 5:25 | 0:00, 1:00, 3:05, 3:50, Last 20 seconds | Fugue ≈ 3:50 (± 30 s) and the soft "dona eis requiem" ≈ 1:00 |
| VII Libera me | 3:16 | 0:00, 1:30–2:30, Last 30 seconds | Soloists' "Requiem aeternam" (range kept wide on purpose) |
