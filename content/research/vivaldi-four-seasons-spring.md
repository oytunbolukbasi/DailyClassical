# Verification: Vivaldi – The Four Seasons: Spring, Concerto in E major, Op. 8 No. 1, RV 269

Piece id `vivaldi-four-seasons-spring`. Checked on 2026-10-10.
Files: `content/en/pieces/vivaldi-four-seasons-spring.md`, `content/tr/pieces/vivaldi-four-seasons-spring.md`.
Shared-file additions (paintings.yaml, glossaries, composers.yaml, retime rows): `content/research/vivaldi-four-seasons-spring.shared.md`.

**How the checks were done** (same method as `verification-1-5.md`)
- **Spotify:** each album id was confirmed by downloading the public embed page `https://open.spotify.com/embed/album/<id>` and reading its track list (title, performer credits, duration in ms); the album page's `og:title`, `og:description`, `music:release_date` and ℗/© lines were also read. **VERIFIED** = album title, performers and every track of the work seen in that data.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` and `/masters/<id>/versions` (credits, notes). Human-readable URLs below. Requests used only the generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent.
- **Status key:** OK = confirmed from a primary source. SECONDARY = only from a catalogue aggregator (MusicBrainz), a library record or a search snippet. UNVERIFIED = not confirmed.
- The web-search budget for this batch ran out partway through; facts below were checked against pages fetched directly (Wikipedia API extracts, Wikidata, Commons, Discogs API). Nothing in the guide rests on a search snippet alone except where marked SECONDARY.

---

## 1. Reference recording: Simon Standage / The English Concert / Trevor Pinnock (Archiv, 1982)

Why this one: the classic period-instrument recording, in the Archiv catalogue continuously since 1982, cited by Wikipedia among the landmark period-instrument versions (with Hogwood and Biondi). Spotify has the original album (12 tracks, one per movement).

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/5tgFFNHTrkzpihDgYvpXEL | "Vivaldi: Le quattro stagioni", album, 12 tracks, Spotify date 1982-09-15, "© 1982 Deutsche Grammophon GmbH, Berlin / ℗ 1983 Deutsche Grammophon GmbH, Berlin". Every track credited "Antonio Vivaldi, Simon Standage, The English Concert, Trevor Pinnock". Spring = tracks 1–3 | https://open.spotify.com/embed/album/5tgFFNHTrkzpihDgYvpXEL | VERIFIED |
| Soloist | Simon Standage, violin | Discogs: "Violin [1] – Simon Standage"; Spotify track credits | https://www.discogs.com/release/2563577 | OK |
| Director | Trevor Pinnock | Discogs: "Harpsichord, Directed By – Trevor Pinnock" | same | OK |
| Orchestra | The English Concert | same | same | OK |
| Label / cat. no. | Archiv Produktion, 2534 003 (LP); 400 045-2 (CD) | LP 2534 003, Germany 1982 (Discogs 2563577); CD 400 045-2, 1983 (Discogs 4956726, notes "Previously released as 2534 003", 1729887). Discogs master 287610 lists a 1981 test pressing of 2534 003 | https://www.discogs.com/release/2563577 ; https://www.discogs.com/release/4956726 ; https://www.discogs.com/release/1729887 ; https://www.discogs.com/master/287610 | OK |
| Recorded | October 1981 | A library catalogue record (College of the Holy Cross, b1350543) and Presto Music listings give Henry Wood Hall, London, 20–23 October 1981 (Presto lists 20 Oct and 23 Oct for different tracks). Both pages refused a direct fetch (HTTP 403); the dates come from search-result text only. The Discogs pages for 2534 003 / 400 045-2 give no session details | https://library.holycross.edu/Record/b1350543/Details ; https://www.prestomusic.com/classical/products/7931297--vivaldi-the-four-seasons | SECONDARY: confirm from the 400 045-2 booklet |
| Venue | Henry Wood Hall, London | as above | as above | SECONDARY |
| Release year / year | 1982 | LP released 1982 (Discogs); Spotify © 1982 | Discogs 2563577 | OK |
| Credits (not in yaml) | – | Producer Dr. Andreas Holschneider; recording supervisor Dr. Gerd Ploebsch; engineer Hans-Peter Schweigmann; continuo includes Nigel North (theorbo), Robert Woolley (organ), Anthony Pleeth and Richard Webb (cellos), Keith Marjoram (violone). The guide does not claim which continuo instruments play in *Spring* | Discogs 2563577 | for reference |
| Period instruments | "period instruments" | Discogs 1729887 notes: "On period instruments" | https://www.discogs.com/release/1729887 | OK |

Note: a second Spotify album, "Vivaldi: The Four Seasons; Concertos etc." (7GLKmPkmPTsD3wxiqWqQSc, 2000 compilation, 51 tracks), has the same performance with tracks 2–5 s shorter. Do not use it; the stops are tied to 5tgFFNHTrkzpihDgYvpXEL.

### Durations (source: Spotify embed, album 5tgFFNHTrkzpihDgYvpXEL)

| Mvt | Spotify track | ms | Guide |
| --- | --- | --- | --- |
| I Allegro | 1 | 198 240 | 3:18 |
| II Largo e pianissimo sempre | 2 | 162 333 | 2:42 |
| III Danza pastorale. Allegro | 3 | 220 333 | 3:40 |
| Total | | 580 906 | 10 min (9:41) |

---

## 2. Also recommended: Christopher Hirons / Academy of Ancient Music / Christopher Hogwood (L'Oiseau-Lyre)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/6OIWvZkKFC256OEO8EozhA — "Vivaldi: The Four Seasons", 12 tracks; Spring tracks 1–3 (3:27 / 2:26 / 3:54) credited "Christopher Hirons, Nigel North, Academy of Ancient Music, Christopher Hogwood". "℗ 1983 Decca Music Group Limited" | embed page | VERIFIED |
| Label / cat. no. | L'Oiseau-Lyre 410 126-2 (CD); 410 126-1 (LP) | MusicBrainz releases 345edd63-b0e4-4a2c-a746-d47cfeafb188 and 192897a1-94c6-401a-ade2-cdda057d6a76 (https://musicbrainz.org/release/345edd63-b0e4-4a2c-a746-d47cfeafb188) | SECONDARY |
| Release year | 1983 (Spotify ℗ line). MusicBrainz dates the GB LP/CD to 1984. Recording date and venue not checked, so they are left out of the yaml | – | SECONDARY |
| Why | Each of the four concertos has a different soloist; Hirons plays *Spring* | embed credits | OK |

---

## 3. Painting: Jean-Antoine Watteau, *Fêtes vénitiennes*, c. 1718–19

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Jean-Antoine Watteau (1684–1721), *Fêtes vénitiennes* ("Venetian Festivities") | Wikidata Q5861788 ; https://commons.wikimedia.org/wiki/File:Jean-Antoine_Watteau_-_F%C3%AAtes_Venitiennes_-_Google_Art_Project.jpg | OK |
| Date | 1718/9 (Google Art Project / NGS data on the Commons page; earliest date given 1715). Wikidata gives both 1718 and 1719. Guide: "c. 1718–19" | Commons page (GAP template) | OK |
| Collection | Scottish National Gallery, Edinburgh (National Galleries of Scotland), NG 439; Bequest of Lady Murray of Henderland 1861 | Commons GAP template; Wikidata P217; NGS ID 5560 (https://www.nationalgalleries.org/art-and-artists/5560, refused scripted requests with HTTP 403) | OK |
| Medium / size | Oil on canvas, 55.9 × 45.7 cm (GAP "w457 x h559" mm) | Commons | OK |
| The musician plays a musette | Checked visually on the Commons image: the seated man at the right holds a small bagpipe (musette) with a bag under his arm and chanter. Commonly said to be Watteau himself and the dancer his friend Nicolas Vleughels; that identification is not used in the guide | visual check | OK (visual) |
| Public domain | Artist died 1721. Commons `{{PD-Art|PD-old-100-1923|deathyear=1721}}` | Commons | OK |
| Image | Google Art Project file, 3238 × 4001 px, 2.9 MB. Portrait format: the dancing woman is at the centre, the musette player at the right edge, so the cover crop should keep the right side | Commons API | OK |
| Not NC | PD-Art; no NC terms | – | OK |
| Not already used | Watteau does not appear in `content/paintings.yaml` or in the batch brief's list (checked 2026-10-10) | – | OK |

Why it fits: painted in the same years as *The Four Seasons* (c. 1718–19 vs. c. 1718–23), it is a scene of outdoor dancing to a musette, exactly the image of the third movement's sonnet ("to the festive sound of a shepherd's bagpipe, nymphs and shepherds dance"); its title links it to Vivaldi's Venice, though it was painted in Paris.

---

## 4. Facts in "The big picture" and the movement texts

| Claim in the guide | Source | Status |
| --- | --- | --- |
| Composed c. 1718–1723, partly while Vivaldi was at the court of Mantua; published Amsterdam 1725 as the first four of the twelve concertos of Op. 8, *Il cimento dell'armonia e dell'inventione* | https://en.wikipedia.org/wiki/The_Four_Seasons_(Vivaldi) ; https://en.wikipedia.org/wiki/Il_cimento_dell%27armonia_e_dell%27inventione (publisher Michel-Charles Le Cène; dedicatee Count Wenzel von Morzin) | OK. Wikipedia notes Karl Heller's view that they could date from 1716–17; the guide says "probably … about 1718 and 1723" |
| Mantua: maestro di cappella to Prince Philip of Hesse-Darmstadt from 1717/18 for three years | https://en.wikipedia.org/wiki/Antonio_Vivaldi | OK ("music director at the court of Mantua") |
| Each concerto came with a sonnet, possibly by Vivaldi; each sonnet in three sections matching the movements | The Four Seasons (Vivaldi), Wikipedia | OK |
| Spring sonnet content: birds, streams in the breeze, storm with thunder and lightning, birds return; goatherd asleep in a flowery meadow with his faithful dog, murmuring leaves; nymphs and shepherds dance to a shepherd's bagpipe (*zampogna*) | Italian text in the Wikipedia wikitext (sonnet table), from the 1725 edition. Translations in the guide are our own | OK |
| Vivaldi wrote instructions such as "the barking dog" into the parts; the dog is in the violas | Wikipedia: "in the second movement of 'Spring', when the goatherd sleeps, his barking dog can be heard in the viola section"; instructions such as "The barking dog" | OK |
| "Asked for it loud" (viola part) | The 1725 Le Cène parts mark the viola "Il cane che grida" with *sempre molto forte e strappato* (IMSLP scan, Op. 8). Not re-opened during this check | Check against the IMSLP scan; wording kept general ("loud") |
| II: no bass part (only violins, viola, solo violin) | Standard description of the score; not confirmed against the 1725 parts in this check | Check against the IMSLP parts. If the Pinnock recording adds a continuo instrument, the stop and note still hold ("Vivaldi wrote no bass part") |
| Programme music: one of the earliest and most detailed examples | Wikipedia: "one of the earliest and most detailed examples of what would come to be called program music" | OK |
| Ritornello structure (refrain + solo episodes) of I and III | Standard Baroque concerto form; Wikipedia (Ritornello) | OK |
| Keys and metres: I E major 4/4; II C-sharp minor 3/4; III E major 12/8 | Op. 8 score (IMSLP); standard references | OK (from the score as commonly printed; not re-opened) |
| Spotify track titles: II "Largo e pianissimo sempre", III "Danza pastorale. Allegro" | embed page | OK |

Not used, on purpose: Wikipedia's claim that *Spring* borrows motifs from the opera *Il Giustino* (single source, not needed for listening); the identification of Watteau and Vleughels in the painting.

---

## 5. Re-time needed (all stops are ≈; derived from the track lengths and the published structure; nobody has listened against the Pinnock tracks yet)

Reference: Standage / Pinnock, Spotify `5tgFFNHTrkzpihDgYvpXEL`. Ready-to-paste rows for `content/research/retime-needed.md` are in the `.shared.md`.

Method: I has 82 bars in 4/4; at an even tempo 198 s ÷ 82 ≈ 2.4 s per bar. Bar positions of the sonnet sections (ritornello 1; birds ≈ 13; ritornello ≈ 27; streams ≈ 31; ritornello ≈ 40; storm ≈ 44; ritornello in C-sharp minor ≈ 56; birds ≈ 59; final ritornello ≈ 76) are from the score as remembered, not re-counted: re-check them first. II: 162 s, the solo enters after the opening bar. III: positions estimated from the proportions of a typical performance.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Allegro | 3:18 | 0:00, 0:30, 1:05, 1:13, 1:44, 2:13, 2:20, 3:02 | The storm (≈ 1:44) and the minor ritornello (≈ 2:13) |
| II Largo | 2:42 | 0:00, 0:05, 1:20, Near the end | ≈ 1:20 (the climb to a brighter key) |
| III Danza pastorale | 3:40 | 0:00, 0:30, 0:55, 1:10, 1:50, 2:30, 3:05 | All of them; especially the minor-key round (≈ 1:50) |

---

## 6. Composer: Antonio Vivaldi (new entry, id `vivaldi`)

Sources: https://en.wikipedia.org/wiki/Antonio_Vivaldi ; https://www.britannica.com/biography/Antonio-Vivaldi ; https://www.wikidata.org/wiki/Q1340 (dates and places).

| Fact (sheet or bio) | Source | Status |
| --- | --- | --- |
| Born 4 March 1678, Venice; baptised at once at home, ceremonies supplied two months later | Wikipedia | OK |
| Died night of 27/28 July 1741, Vienna; buried in a simple grave in the hospital cemetery next to the Karlskirche | Wikipedia | OK (sheet: "28 July 1741, Vienna") |
| Father Giovanni Battista, a barber turned violinist, taught him the violin | Wikipedia | OK |
| Trained for the priesthood from 15, ordained 1703 at 25; "il Prete Rosso" from his red hair; excused from saying Mass for health reasons ("tightness of the chest") | Wikipedia | OK |
| Ospedale della Pietà from September 1703 (maestro di violino); girls' orchestra and choir; maestro de' concerti 1716 | Wikipedia | OK |
| *L'estro armonico* (Op. 3), Amsterdam 1711, success across Europe | Wikipedia | OK |
| Operas: claimed 94, about 50 found | Wikipedia | OK (bio: "dozens of operas") |
| Met Charles VI in 1728; moved to Vienna; the emperor died soon after his arrival (October 1740); died in poverty | Wikipedia | OK |
| Forgotten after his death; revived in the 20th century | Wikipedia | OK |
| Bach arranged some of his concertos | Wikipedia (J. S. Bach: "Bach copied and arranged Italian masters such as Vivaldi (e.g. BWV 1065)") | OK |
| Symphonies: none in the later sense | He wrote string *sinfonie* (RV 111–169 range) and opera sinfonias, but not symphonies in the Classical sense. Sheet says "None (only short string *sinfonie*)" | OK (wording cautious) |

**Portrait.** François Morellon de La Cave, engraving, 1725 ("Effigies Antonii Vivaldi", signed "F. M. la Cave Sculpsit 1725"), made for the first edition of Op. 8, the very publication that contains *The Four Seasons*. Rijksmuseum print, CC0.

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| File | File:Portret van de Italiaanse componist Antonio Vivaldi Effigies Antonii Vivaldi (titel op object), RP-P-2016-1496-1.jpg, 1902 × 2500 px | https://commons.wikimedia.org/wiki/File:Portret_van_de_Italiaanse_componist_Antonio_Vivaldi_Effigies_Antonii_Vivaldi_(titel_op_object),_RP-P-2016-1496-1.jpg | OK |
| Holder | Rijksmuseum, Amsterdam, RP-P-2016-1496-1 | http://hdl.handle.net/10934/RM0001.COLLECT.641788 | OK |
| Licence | CC0 (Rijksmuseum); engraving of 1725, public domain by age | Commons `{{CC-zero}}` | OK |
| Engraving made for the 1725 edition of Op. 8 | Wikipedia (Vivaldi, "Death" section: engraving by La Cave, 1725, for the first edition of *Il cimento*) | OK |
| focal_y | 0.25 (face at about 30 % from the top, below a wide paper margin) | visual check | OK |

Rejected: the anonymous oil portrait in Bologna (File:Vivaldi.jpg, 1595 × 1966), the image most often used, because the identification is questioned (Commons note citing Grove) and it is only "thought to depict Vivaldi".
