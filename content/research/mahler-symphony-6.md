# Verification: Mahler – Symphony No. 6 in A minor, "Tragic"

Piece id `mahler-symphony-6`. Checked on 2026-11-28 (batch 2026-11c, group M).
Files: `content/drafts/en/mahler-symphony-6.md`, `content/drafts/tr/mahler-symphony-6.md`.
Shared-file additions (paintings.yaml, glossary "Cowbells" and "Hammer", re-time rows): `content/research/mahler-symphony-6.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched with curl from a Turkish network (2026-11-28); Discogs API; label page (DG) with embedded track metadata and Spotify link; Qobuz and HRA album pages; reviews of the Currentzis disc (MusicWeb International, Gramophone via the reviewer's own site, ClassicsToday, Classical Music, The High Arts, Presto and Guardian via search excerpts); Wikipedia (EN, DE); Wikimedia Commons API and file wikitext. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: Teodor Currentzis / musicAeterna (Sony Classical, 2018)

Fixed by the product owner.

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Teodor Currentzis / musicAeterna | Spotify credits on all 4 tracks: "Gustav Mahler, Teodor Currentzis, musicAeterna" | https://open.spotify.com/embed/album/49OcUcaGKFiKcSWB2G2ANh | VERIFIED |
| Label / catalogue | Sony Classical 19075822952 (CD); 19075822951 (LP) | Discogs 13006654: Sony Classical 19075822952, CD, 2018, 20-page booklet. Discogs 13099180: 19075822951, 2 LP, 2018 | https://www.discogs.com/release/13006654 ; https://www.discogs.com/release/13099180 | OK |
| Venue | Dom Zvukozapisi (House of Sound Recording), Moscow | Discogs 13099180 notes "Recorded at Dom Zvukozapisi", company credit "Recorded At: The State House Of Broadcasting And Sound Recording, Moscow". MusicWeb: "rec. 2016, Dom Zvukozapisi (House of Audio Recording), Moscow"; reviewer describes "the rather resonant studio acoustic" (studio, not live) | Discogs ; https://www.musicweb-international.com/classrev/2019/Jan/Mahler_sy6_19075822952.htm | OK |
| Recorded | 3–9 July 2016 | Year 2016: MusicWeb, Discogs. "Summer of 2016": HRA. "July 3–9, 2016" with the street address (Malaya Nikitskaya 24) is quoted from Qobuz credits by search-engine excerpts, and Classite lists a session date of 9 July 2016; neither page could be opened directly (Qobuz served the page without the credits block; Classite 403). Booklet not seen | MusicWeb ; https://mag.highresaudio.com/en/content/musicaaeterna-teodor-currentzis-mahler-symphony-no-6 ; https://www.qobuz.com/us-en/album/mahler-symphony-no-6/s07qkwvw6vhib ; https://classite.com/disk/sony-classical-19075822952-q325992 | OK for 2016 / July; exact days UNVERIFIED (secondary). Fallback if wanted: `recorded: "July 2016"` |
| Release | 2018 | Qobuz: "Released on 10/19/18 by Sony Classical", (P) 2018 Sony Music Entertainment; HRA release 26.10.2018; Discogs CD 2018 | Qobuz ; HRA ; Discogs | OK |
| Producer / engineer | (not in yaml) | Giovanni Prosdocimi (producer, mixing, mastering), Damien Quintard (recording) | Discogs 13099180 ; Qobuz | OK |
| Spotify | 49OcUcaGKFiKcSWB2G2ANh | Album "Mahler: Symphony No. 6", album `isPlayable: true` (`PLAYABLE`) | embed | VERIFIED |

| Track | Movement (Spotify title) | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro energico, ma non troppo | 1496640 | 24:56 | true |
| 2 | II. Scherzo | 756080 | 12:36 | true |
| 3 | III. Andante moderato | 939040 | 15:39 | true |
| 4 | IV. Finale. Sostenuto - Allegro moderato - Allegro energico | 1867186 | 31:07 | true |
| | Total | 5058946 | 84:19 → `duration_min: 84` | |

Track URIs: `5aeOEmgODv4g22l7jbYfp2`, `0h7MxWBTw4MJb2H3sqMpfG`, `2PVai8cOcNDvr8cCIbxIsz`, `0BvvciGcO8CgG3Ng4mBKDI`. Qobuz and HRA give the same four lengths (HRA 24:57 / 31:06 by rounding); MusicWeb gives the CD total as 84:20. MusicWeb's reviewer says the booklet prints the finale as 34:06, which does not match the disc (84:20 − 24:56 − 12:36 − 15:39 = 31:09); the track is 31:07.

### Interpretive facts used in "In this recording" and the stops

| Claim | Source | Status |
| --- | --- | --- |
| Scherzo second, Andante third | Spotify track order; MusicWeb ("He plays the scherzo second"); ClassicsToday ("wisely placed second"); Gramophone/Seckerson ("his decision to adhere to Mahler's original order of movements placing the scherzo second"); Guardian (via search excerpt: slow movement third) | VERIFIED |
| Two hammer blows | MusicWeb ("Neither of the two hammer blows is absolutely overwhelming"); ClassicsToday ("The two hammer blows are weak"); The High Arts ("The two hammer blows ... are followed by a manic accelerando"); Guardian via search excerpt (two rather than three) | OK (four reviews agree; not heard) |
| Hammer blows not deafening; what follows matters more: express pace after the first, "the music fairly seethes" after the second | MusicWeb; Presto (search excerpt: the aftermath "seems to interest Currentzis more") | OK |
| Exposition repeat taken | Not stated outright in any review. Inferred: the 24:56 track (without the repeat, MusicWeb's timings would leave over six minutes of development before the cowbells at 12:36); MusicWeb implies it by faulting Kondrashin for omitting the repeat | OK by inference; flag if a listener says otherwise |
| Scherzo follows "virtually attacca" | Gramophone review by Edward Seckerson, reproduced on his site: https://www.edwardseckerson.biz/reviews/gramophone-review-mahler-symphony-no-6-musicaeterna-currentzis/ | OK |
| Big slowing in quiet passages of I (cowbells 12:36–16:18, calm passage 19:31–21:27), coda from 23:41 | MusicWeb | OK |
| Andante: cowbells at 6:38, extended climax from 11:04 | MusicWeb | OK |
| Andante: glissandos observed at 10:27 and 10:54 | The High Arts review: https://thehigharts.com/?p=2910 | OK |
| Finale: Allegro at 5:15, cowbell episode 9:35–10:40, hammer blows "9:13" and 17:54, coda from 29:08 | MusicWeb. The "9:13" for the first blow is inconsistent with bar positions (see Re-time) and is not used | OK except 9:13 |

## 2. Also recommended: Claudio Abbado / Berliner Philharmoniker (DG, live 2004)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Claudio Abbado / Berliner Philharmoniker | Spotify credits "Gustav Mahler, Berlin Philharmonic, Claudio Abbado" | https://open.spotify.com/embed/album/09YtqiHNoK2z3ElagYA6Md | VERIFIED |
| Label / catalogue | DG 00289 477 5573 | Discogs 10334392: Deutsche Grammophon 00289 477 5573, 2005; DG product page UPC 0028947755737 | https://www.discogs.com/release/10334392 ; https://www.deutschegrammophon.com/en/catalogue/products/mahler-symphony-no-6-abbado-6375 | OK |
| Recorded / venue | June 2004 (live), Philharmonie, Berlin | Discogs notes "Live Recording: Berlin, Philharmonie, 6/2004"; DG track metadata recordingLocation "Philharmonie, Berlin", recordingSetting "Live", firstReleaseYear 2005. Presto (search excerpt) gives 5 June 2004 | Discogs ; DG page | OK |
| Release | 2005 | DG firstReleaseYear 2005; DG catalogue (search excerpt) release 2 May 2005 | DG page | OK |
| Spotify | 09YtqiHNoK2z3ElagYA6Md | Linked from the DG product page. Tracks: I 22:48, "2. (3.) Andante moderato" 13:57, "3. (2.) Scherzo (Wuchtig)" 12:43, Finale 29:44, all `isPlayable: true`; track 5 (applause, 0:24) `false`, not part of the work | embed | VERIFIED |

Chosen because it uses the other order (Andante second), which the Threads section points to.

## 3. Painting: Ferdinand Hodler, *The Woodcutter* (*Le Bûcheron* / *Der Holzfäller*), 1910

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Ferdinand Hodler (Bern 1853 – Geneva 1918), *Der Holzfäller (Le bûcheron)*, 1910 | Commons file (Google Art Project metadata); Wikidata Q17491213 | OK |
| Collection | Musée d'Orsay, Paris; GAP metadata: alternate_object_id RF 2005 5, museum_internal_id 134807, provenance "Bought in 2005"; oil on canvas; Orsay entry (search excerpt): 1910, oil on canvas, 130.5 × 101 cm, bought at public auction in 2005. Le Temps reported the purchase | https://www.musee-orsay.fr/fr/oeuvres/le-bucheron-134807 (403 to automated fetch; content via search excerpt) ; https://www.letemps.ch/culture/hodler-senvole-vers-orsay | OK |
| Image | `File:Fernidand_Hodler_-_The_Woodcutter_-_Google_Art_Project.jpg` (the "Fernidand" misspelling is in the file name), 3495 × 4558, {{PD-Art-two-auto\|1918}} | https://commons.wikimedia.org/wiki/File:Fernidand_Hodler_-_The_Woodcutter_-_Google_Art_Project.jpg | VERIFIED |
| Rights | Hodler died 19 May 1918: EU 70 years p.m.a. expired 1989; US: published/exhibited before 1929. Faithful photo of a 2D PD work creates no new right (EU DSM art. 14; US) | Commons | OK |
| Banknote context (not used in the guide) | The woodcutter motif comes from Hodler's commission from the Swiss National Bank; *Holzfäller* on the back of the 50-franc note from 1911 | de.wikipedia Ferdinand Hodler ("Schon 1911 wurden zwei Banknoten mit seinen Motiven *Der Mäher* und *Der Holzfäller* bedruckt"); Orsay entry via search excerpt | OK |
| Not reused | This painting is not in `content/paintings.yaml` (grep "Holzf", "Woodcutter", "bûcheron": no match). Hodler already appears twice (Lake Geneva from Chexbres, Lake Thun), so this is a third Hodler, justified as clearly the best match | – | OK |

Other versions on Commons, not used: Ohara Museum of Art (GAP, 2477 × 3255), Kunstmuseum Luzern (808 × 1000), Christie's lot photos (low resolution), NGA lithograph *Lumberman* (CC0, but a print, not the painting).

**Pairing.** Mahler's footnote for the hammer: "kurzer, mächtig, aber dumpf hallender Schlag von nicht metallischem Charakter (wie ein Axthieb)", in English "brief and mighty, but dull in resonance and with a non-metallic character (like the fall of an axe)" (en.wikipedia; German wording quoted in Oechsle's article, *Die Musikforschung*, https://mf.journals.qucosa.de/mf/article/download/982/1971/1993). Alma's report of Mahler's words: the hero "on whom fall three blows of fate, the last of which fells him, as a tree is felled" (en.wikipedia; Mahler Foundation: "fells him like a tree"). Hodler and Mahler were contemporaries (1853–1918, 1860–1911); no personal link is claimed.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed in the summers of 1903 and 1904 at Maiernigg (Wörthersee), revisions to 1906 | https://en.wikipedia.org/wiki/Symphony_No._6_(Mahler) ; Library of Congress, Moldenhauer Archives, Mahler sketches ("sketches ... around 1903, movement completed in 1904"): https://www.loc.gov/collections/moldenhauer-archives/articles-and-essays/guide-to-archives/gustav-mahler-sketches/ | OK |
| Premiere 27 May 1906, Saalbau, Essen, Mahler conducting | en.wikipedia | OK |
| Married Alma Schindler 1902; second daughter (Anna Justine) born June 1904; first daughter Maria Anna born November 1902 | en.wikipedia | OK |
| The only Mahler symphony ending in the minor | The endings of Nos. 1–5 and 7–9 (all major: D, E-flat, D, E, D, C, E-flat, D-flat) against No. 6 (A minor); en.wikipedia: the finale ends on "a simple A minor triad" | OK |
| "Tragic" not in the score; Bruno Walter: "Mahler called [the work] his Tragic Symphony"; Vienna programme 4 January 1907 "Sechste Sinfonie (Tragische)"; Munich 8 November 1906 only "Sechste Sinfonie" | en.wikipedia | OK |
| Movement order: composed and first published (Kahnt, 1906) with the Scherzo second; changed during the May 1906 Essen rehearsals to Andante second; second and third editions and the premiere with Andante second; Mahler's three performances (Essen 27 May 1906, Munich 8 November 1906, Vienna 4 January 1907) all Andante–Scherzo | en.wikipedia (section "Order of the inner movements"), quoting de La Grange | OK |
| Alma's telegram to Mengelberg, 1 October 1919: "Erst Scherzo dann Andante herzlichst Alma"; Mengelberg then switched | en.wikipedia | OK |
| 1963 critical edition (Erwin Ratz) printed Scherzo–Andante; later research argued for Andante–Scherzo again (Reinhold Kubik's essay, 2004, in the volume edited by Gilbert Kaplan; Kubik's critical edition 2010; Breitkopf edition by Riedel and Pfefferkorn, 2026, also Andante–Scherzo) | en.wikipedia | OK (guide says only "later research has argued for Andante first again"; scholars such as de La Grange and Matthews defend both orders, hence "Conductors still choose either") |
| Exposition repeat in I, which Mahler wrote in only one other sonata movement (Symphony No. 1, first movement) | en.wikipedia ("an exact repeat of the exposition, unusual in Mahler"); Mahler Foundation listening guide, I: https://www.mahlerfoundation.org/?p=24729 | OK |
| Motto: A major triad turning to A minor over a timpani rhythm, trumpets loudest in the first chord and oboes in the second; reappears in later movements; finale ends with the rhythm over a plain A minor triad | en.wikipedia | OK |
| Alma claimed the soaring melody represented her ("Alma theme"); its restatement at the end of I is the happiest point of the symphony; A major in the coda | en.wikipedia ; Mahler Foundation guide | OK |
| Chorale with pizzicato strings between the main themes; cowbell episode in I with celesta | Mahler Foundation guide ("serene chorale ... pizzicato"; "cowbells", "celesta"); Gramophone/Seckerson ("cow bells and celeste") | OK |
| *Heftig, aber markig* = "vehement, but sturdy" | MusicWeb | OK |
| Cowbells offstage in I and IV, onstage in the Andante | en.wikipedia (instrumentation) | OK |
| Mahler wanted the cowbells to sound like a grazing herd in the distance | Mahler's score note as quoted in The High Arts review ("should be played with discretion—so as to produce a realistic impression of a grazing herd of cattle, coming from a distance") | OK |
| Scherzo: *Wuchtig*; march rhythms of I in triple time; trio *Altväterisch*, rhythmically irregular (4/8 switching to 3/8 and 3/4) | en.wikipedia | OK |
| Scherzo "a distorted mirror-image of the first movement" | Seckerson (Gramophone) | OK (critic's image) |
| Xylophone in the Scherzo | Standard scoring of the work (xylophone in the percussion list); not separately sourced on a fetched page | UNVERIFIED (low risk) |
| Alma: the scherzo "represented the unrhythmical games of the two little children, tottering in zigzags over the sand"; composed summer 1903, when Maria Anna was under a year old and Anna not yet born | en.wikipedia | OK (guide says "this movement", as Alma did) |
| Andante in E-flat major; main theme introspective, touching the minor; second theme; climax with horns and clashing cowbells; quiet close | en.wikipedia | OK. Not used: Wikipedia's claim that the main theme "is actually a quote" from *Kindertotenlieder*, no. 1 (no source given there) |
| Woodwind and horn solos in the Andante | MusicWeb ("excellent woodwind and horn solos"), Seckerson ("plangent wind solos") | OK |
| Finale: extended sonata form with introduction and coda | en.wikipedia | OK |
| Hammer: "brief and mighty, but dull in resonance and with a non-metallic character (like the fall of an axe)" | en.wikipedia ; Oechsle (German wording) | OK |
| Hammer blows: earlier stages had more (Wikipedia: "The original score had five hammer blows, which Mahler subsequently reduced to three, and eventually to two"); the first printed score has three; Mahler removed the third in revision, leaving "a sudden moment of stillness"; some (Bernstein) restore it | en.wikipedia ; Mahler Foundation finale page (third blow, manuscript p. 257 bar 783; removed in the corrected print, p. 260 bar 782): https://www.mahlerfoundation.org/?p=718 | OK. The guide does not mention the "five" (secondary, unsourced on Wikipedia) and says only that a third blow fell "in the first printed score" |
| Hammer blow bar numbers 336 and 479 (third, removed, 783) | Mahler Foundation (783); 336 and 479 are the standard bar numbers in the literature, not on a fetched page | 783 OK; 336 / 479 UNVERIFIED (used only for timing) |
| Alma: "three blows of fate", "the third of which fells him like a tree"; her link to three later events (death of Maria Anna, heart diagnosis, leaving the Vienna Opera, all 1907) | en.wikipedia ; Mahler Foundation | OK (the later events are not in the guide) |
| After the place of the third blow, "the music gropes in darkness and then the trombones and horns begin to offer consolation ... fade away and the final bars erupt fff in the minor" | en.wikipedia ; Seckerson ("the final threnody of trombones") | OK |
| Finale introduction: shimmering opening with celesta and harps; motto early in the introduction; dark brass and tuba | Seckerson ("fantastical opening ... weirdly transparent"); scoring; position of the motto from the score's layout | Partly UNVERIFIED (descriptive; times ≈) |

## 5. Re-time (all stops are ≈; derived from published timings of this recording, bar positions and the exact track lengths, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro energico, ma non troppo | 24:56 | 0:00, 1:40, 1:50, 2:45, 5:40, 11:20, 12:35–16:20, 16:20, 17:30, 19:30–21:30, 23:40 | Anchors: MusicWeb 5:12 (accelerando back to tempo after the Alma theme), 12:36–16:18 (cowbells), 19:31–21:27 (calm passage), 23:41 (coda). Motto ≈ 1:40 and Alma theme ≈ 2:45 (± 30 s): from the opening tempo (≈ 2 s per 4/4 bar) and Currentzis's broad chorale; repeat ≈ 5:40 and development ≈ 11:20 (± 40 s): exposition length taken as twice ≈ 5:40; recapitulation ≈ 17:30 (± 45 s) |
| II Scherzo | 12:36 | 0:00, 0:40, 2:35, 4:20, 7:00, 8:40, Last minute | No published timings for this disc. Sections placed by proportion of the score (scherzo–trio–scherzo–trio–scherzo–coda) against the track length; trios ≈ 2:35, ≈ 7:00 and returns ≈ 4:20, ≈ 8:40 (± 45 s) |
| III Andante moderato | 15:39 | 0:00, 1:30, 3:40, 6:40, 9:00, 10:25–11:00, 11:05, Last 2 minutes | Anchors: MusicWeb 6:38 (cowbells) and 11:04 (climax); The High Arts 10:27, 10:54 (glissandos). Second idea ≈ 1:30, second and third statements of the theme ≈ 3:40, ≈ 9:00 (± 45 s) |
| IV Finale | 31:07 | 0:00, 0:40, 1:30–5:00, 5:15, 7:50, 9:10–10:40, 12:30–13:10, 17:50, 19:15, 21:40, 29:10, 29:40, Last 15 seconds | Anchors: MusicWeb 5:15 (Allegro, bar 114), 9:35–10:40 (cowbell episode), 17:54 (second hammer blow, bar 479), 29:08 (coda, bar 773). Between 5:15 and 17:54 the Allegro averages ≈ 2.0 s per bar once the slow cowbell episode is set aside, which puts bar 336 (first blow) at ≈ 13:00; MusicWeb's "9:13" for the first blow is rejected as inconsistent (probably the crash that opens the development, bar ≈ 229 at ≈ 9:10). Introduction's return (bar 520) ≈ 19:15; recapitulation (bar 576) ≈ 21:40 (± 45 s); place of the cut third blow (bar 783) ≈ 29:30, stop given as 29:10 for the upheaval before it; trombone lament ≈ 29:40. Second theme (bar ≈ 191) ≈ 7:50 (± 45 s). Motto in the introduction ≈ 0:40 (± 20 s) |
