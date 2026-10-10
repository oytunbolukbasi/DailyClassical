# Verification: Smetana – Vltava (The Moldau), from Má vlast, JB 1:112/2

Piece id `smetana-vltava`. Checked on 2026-10-10.
Files: `content/en/pieces/smetana-vltava.md`, `content/tr/pieces/smetana-vltava.md`.
Shared-file additions: `content/research/smetana-vltava.shared.md`.

**How the checks were done**: as in `vivaldi-four-seasons-spring.md` §0. Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Rafael Kubelík / Boston Symphony Orchestra (DG, 1971)

Why this one: Kubelík's studio *Má vlast* with Boston is one of the most admired recordings of the cycle and has stayed in DG's catalogue since 1971 (LP 2707 054, CD 429 183-2 "Galleria" and later reissues). Spotify has the complete cycle as one album, one track per poem.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2wnHlBJhXW9dQn5I2s8KxM | "Smetana: Má Vlast", album, 6 tracks, Spotify date 1989-01-01, "© / ℗ 1989 Deutsche Grammophon GmbH, Berlin"; every track credited "Bedřich Smetana, Boston Symphony Orchestra, Rafael Kubelík". *Vltava* = track 2, "Má vlast, JB 1:112: II. Vltava "The Moldau"" | https://open.spotify.com/embed/album/2wnHlBJhXW9dQn5I2s8KxM | VERIFIED |
| Conductor / orchestra | Rafael Kubelík / Boston Symphony Orchestra | Discogs credits | https://www.discogs.com/release/27646680 | OK |
| Label / cat. no. | Deutsche Grammophon, 2707 054 (LP); 429 183-2 (CD) | LP 2707 054 (UK 1971, Discogs 3345790; box 2720 032, Germany 1971); CD 429 183-2 (1989, Discogs 27646680). The Spotify ℗ 1989 matches the CD edition | https://www.discogs.com/master/429054 ; https://www.discogs.com/release/27646680 | OK |
| Recorded / venue | March 1971, Symphony Hall, Boston | CD 429 183-2 notes: "Recording: Boston, Symphony Hall, 3/1971. ℗ 1971 Polydor International GmbH, Hamburg" | https://www.discogs.com/release/27646680 | OK |
| Release year / year | 1971 | ℗ 1971; LP 1971 | same | OK |
| Credits (not in yaml) | – | Recording producer Hans Weber; balance engineer Heinz Wildhagen | same | for reference |
| Durations | – | LP (Discogs 2925723) lists *Vltava* 11:49; the Spotify track is 12:00 (720 293 ms). The extra ≈ 11 s is probably silence at a track edge | https://www.discogs.com/release/2925723 | Check where the silence sits; if at the start, all stops shift |

### Duration (source: Spotify embed, album 2wnHlBJhXW9dQn5I2s8KxM)

| Mvt | Spotify track | ms | Guide |
| --- | --- | --- | --- |
| I Vltava | 2 | 720 293 | 12:00 (12 min) |

---

## 2. Also recommended: Jiří Bělohlávek / Czech Philharmonic (Decca, 2018)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/1nkSLLBE1oEzl0JqzAUP6e — "Smetana: Má Vlast", 6 tracks; track 2 "Má Vlast, JB1:112: 2. Vltava", 12:07, credited "Bedřich Smetana, Czech Philharmonic, Jiří Bělohlávek"; "© 2018 Decca Music Group Limited / ℗ 2018 Czech Philharmonic, under exclusive licence to Decca" | embed page | VERIFIED |
| Label / cat. no. | Decca 483 3187, released 5 January 2018 | MusicBrainz release 4bafd7ec-b13b-4548-86af-d58997b784f4 (https://musicbrainz.org/release/4bafd7ec-b13b-4548-86af-d58997b784f4) | SECONDARY. Recording date and venue not checked; left out |

---

## 3. Painting: Jakub Schikaneder, *Steamer on the Vltava by the Palacký Bridge, Prague*, c. 1910–20

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Jakub Schikaneder (1855–1924), Prague painter of atmospheric, melancholy scenes | https://en.wikipedia.org/wiki/Jakub_Schikaneder | OK |
| Title / date / medium | Commons description, from the Dorotheum auction record: "Prag, Dampfer auf der Moldau vor der Palacky-Brücke, um 1910/20, signiert (ligiert) JSchikaneder, Öl auf Leinwand, 84 x 106 cm". The English title in the guide is a translation of that description | https://commons.wikimedia.org/wiki/File:Jakub_Schikaneder_Prag_Palacky-Br%C3%BCcke.jpg ; Dorotheum lot 7201672: https://www.dorotheum.com/en/l/7201672/ (refused scripted requests, HTTP 403) | SECONDARY (auction-house data only) |
| Collection | Private collection (sold at Dorotheum, Vienna; present owner unknown) | as above | OK as "Private collection" |
| Public domain | Artist died 1924. Commons `{{PD-art|PD-old-auto-expired|deathyear=1924}}` | Commons | OK |
| Image | 5608 × 4408 px, 6.8 MB | Commons API | OK |
| Content | The river at dusk with a lit steamer by a stone arched bridge, figures on a snowy embankment, a statue group on a pier at the left | visual check | OK |
| Palacký Bridge statues | Josef Václav Myslbek made four pairs of statues of legendary couples for the bridge (Ctirad and Šárka, Libuše and Přemysl, Lumír and Song, Záboj and Slavoj); they were later moved to Vyšehrad | https://en.wikipedia.org/wiki/Palack%C3%BD_Bridge | OK. Šárka is the third poem of *Má vlast*; Lumír, the mythical bard, opens the first (*Vyšehrad*: "the harp of the mythical singer Lumír", Wikipedia *Má vlast*) |
| Not NC | No NC terms | – | OK |
| Not already used | Not in `content/paintings.yaml` or the brief's list | – | OK |

Why it fits: it is the Vltava itself, in Prague, the city where the poem ends, painted by a Prague artist; the bridge's statues tie it to the legends of *Má vlast* and to Vyšehrad. Caveat: a private-collection work known from an auction record. If a museum-held work is preferred, use alternative A (Braunerová, National Gallery Prague).

---

## 4. Facts in "The big picture" and the movement texts

| Claim in the guide | Source | Status |
| --- | --- | --- |
| Second of six symphonic poems in *Má vlast*, composed 1874–1879, depicting Bohemia's countryside, history and legends; complete cycle first performed 5 November 1882 | https://en.wikipedia.org/wiki/M%C3%A1_vlast | OK |
| Best known of the six, often performed separately | same | OK |
| Composed 20 November – 8 December 1874; premiered 4 April 1875 under Adolf Čech | same | OK |
| Smetana completely deaf by October 1874 (left ear on 20 October) | same (Vyšehrad section); https://en.wikipedia.org/wiki/Bed%C5%99ich_Smetana | OK |
| Smetana's own programme (two springs, cold and warm; hunt; farmer's wedding; moonlight and nymphs; castles and ruins; St John's Rapids; widening towards Prague; Vyšehrad; vanishing into the distance) | Wikipedia *Má vlast* (quotes Smetana's words) | OK |
| River tune adapted from *La Mantovana*; same ancestor as *Hatikvah*; a Czech folk song ("Kočka leze dírou") | same | OK |
| Vyšehrad motif returns at the end of *Vltava* | same | OK |
| St John's Rapids: no longer exist, submerged by a dam (Štěchovice) in the 1940s–1950s, about 20 km south of Prague | https://de.wikipedia.org/wiki/Die_Moldau ("in einem Staudamm versenkten … gut zwanzig Kilometer südlich von Prag"; "seit den 1940er und 1950er Jahren … nicht mehr existieren") | OK |
| Since 1952 the Prague Spring festival opens on 12 May, anniversary of Smetana's death, with *Má vlast* | Wikipedia *Má vlast* | OK |
| Episode colours: flutes then clarinets for the springs; horns for the hunt; polka for the wedding; moonlight; rapids | de.wikipedia (Sechzehntelketten der Flöten und Klarinetten; Waldjagd dominated by horns; Bauernhochzeit with polka rhythm; Nymphenreigen im Mondschein); Discogs LP track listing of the score headings | OK |
| Moonlight: muted strings; harp | Commonly described; the score (IMSLP) marks the violins *con sordino* in the moonlight section. Not re-opened in this session | Check against the score |
| Metre 6/8, the wedding in 2/4 | Score (IMSLP); not re-opened | Check |
| Key E minor → E major | Wikipedia ("in the key of E minor"); the major-key return before Vyšehrad is in the score | OK |
| Catalogue JB 1:112/2 | de.wikipedia ("T 111, JB 1:112/2"); Spotify "JB 1:112" | OK |
| Kubelík: left Czechoslovakia after the 1948 coup; returned in 1990 to conduct the Czech Philharmonic at the Prague Spring festival (which he had helped found in 1946); his live 1990 *Má vlast* was his fifth recording | https://en.wikipedia.org/wiki/Rafael_Kubel%C3%ADk | OK |

---

## 5. Re-time needed (all stops are ≈; nobody has listened against the Kubelík track yet)

Reference: Kubelík / Boston SO, Spotify `2wnHlBJhXW9dQn5I2s8KxM`, track 2. Rows for `retime-needed.md` are in the `.shared.md`.

Method: section positions estimated from the proportions of a typical 12-minute performance (springs ≈ 0–1:00, river ≈ 1:00, hunt ≈ 2:50, wedding ≈ 3:55, moonlight ≈ 5:20, river ≈ 7:55, rapids ≈ 8:50, broad river ≈ 9:50, Vyšehrad ≈ 10:35). Not derived from bar counts.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Vltava | 12:00 | 0:00, 1:00, 2:50, 3:55, 5:20, 7:55, 8:50, 9:50, 10:35, Near the end | All; especially the end of the moonlight (≈ 7:55) and the rapids (≈ 8:50). Check for ≈ 11 s of extra silence |

---

## 6. Composer: Bedřich Smetana (new entry, id `smetana`)

Sources: https://en.wikipedia.org/wiki/Bed%C5%99ich_Smetana ; https://www.britannica.com/biography/Bedrich-Smetana ; https://www.wikidata.org/wiki/Q48173.

| Fact (sheet or bio) | Source | Status |
| --- | --- | --- |
| Born 2 March 1824, Litomyšl (then in the Habsburg Empire); son of a brewer; first public performance at six (October 1830) | Wikipedia | OK |
| Grew up speaking German; learned correct Czech only as an adult | Wikipedia ("his children were ignorant of correct Czech until much later"; "his command of Czech was poor" in the early 1860s; studied Czech grammar) | OK |
| Studied with Josef Proksch in Prague; took part briefly in the 1848 Prague uprising; wrote to Liszt, who helped him | Wikipedia | OK |
| Gothenburg (Sweden) from 1856 as teacher and choirmaster; returned to Prague in the early 1860s | Wikipedia | OK |
| *The Bartered Bride* (1866) at the Provisional Theatre; principal conductor there from 1866; accused of "Wagnerism" | Wikipedia | OK |
| Completely deaf by the end of 1874; resigned from the theatre | Wikipedia | OK |
| String Quartet *From My Life* (E minor) depicts his deafness with a long high E | Wikipedia | OK |
| Mental collapse early 1884; taken to the Kateřinky asylum in Prague on 23 April; died there 12 May 1884; buried at Vyšehrad Cemetery | Wikipedia | OK |
| Regarded in his homeland as the father of Czech music | Wikipedia | OK |
| Symphonies: one, the *Triumphal Symphony* (1853) | Wikipedia ("Triumphal Symphony of 1853") | OK |

**Portrait.** Bain News Service copy negative of a 19th-century photograph of Smetana, Library of Congress, George Grantham Bain Collection (ggbain.36702); cropped version on Commons.

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| File | File:Smetana LCCN2014716851 (cropped).jpg, 3173 × 4123 px (uncropped JPEG 3728 × 5059) | https://commons.wikimedia.org/wiki/File:Smetana_LCCN2014716851_(cropped).jpg | OK |
| Licence | `{{PD-Bain}}`, `{{PD-old-70-1923}}`; LOC: "No known restrictions on publication" | https://www.loc.gov/pictures/item/2014716851/ | OK |
| Date | Bain's "1900" is the copy negative (unverified data on the caption card); the photograph shows Smetana in his last decade and must date from before his death in 1884. Sheet: "before 1884" | Commons; LOC | ESTIMATED; same approach as the Rachmaninoff Bain portrait |
| Photographer | Unknown (original photograph); Bain News Service publisher of the copy | LOC | OK |
| focal_y | 0.2 (face at about 25 % from the top) | visual check | OK |
