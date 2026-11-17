# Verification: Rossini – Guillaume Tell (William Tell): Overture

Files: `content/drafts/en/rossini-william-tell-overture.md`, `content/drafts/tr/rossini-william-tell-overture.md`. Checked 2026-11-17 (batch BATCH-2026-11, group D). New composer: Rossini (entry in `rossini-william-tell-overture.shared.md`).

**Method.** Spotify albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from a Turkish network; album page `music:release_date` and ℗ line read too.

---

## Reference recording: Karajan / Berliner Philharmoniker, DG 1971

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7l3RoBOqR3g7mBZDbSDpGE | "Rossini / Suppé: Overtures", 7 tracks; track 4 "William Tell: Overture", one track, 719 626 ms, credits "Gioachino Rossini, Berlin Philharmonic, Herbert von Karajan"; Spotify date 1985-01-01, "℗ 1985 Deutsche Grammophon GmbH, Berlin" (CD compilation) | https://open.spotify.com/embed/album/7l3RoBOqR3g7mBZDbSDpGE | VERIFIED |
| Linked by label | – | DG product page "ROSSINI, SUPPÉ Overtures / Karajan" links this album | https://www.deutschegrammophon.com/en/catalogue/products/rossini-suppe-overtures-karajan-8700 | OK |
| isPlayable | – | `true` (all 7 tracks) | embed | OK |
| One track | – | The overture is a single track (brief requirement) | embed | OK |
| Label / cat. no. | DG 2530 144 | LP "Overtures", DG 2530 144, 1971, side listing La gazza ladra, La scala di seta, Semiramide, Il barbiere di Siviglia, L'italiana in Algeri, Guillaume Tell | https://uk.rarevinyl.com/products/gioacchino-rossini-overtures-uk-vinyl-lp-album-record-2530144-675366 ; elvinyl listing (search) | OK |
| Recorded | January 1971 | AllMusic performance page (via search summary): Karajan, DG, recorded January 1971, Berlin | https://www.allmusic.com/performance/guillaume-tell-william-tell-opera-mq0000667160 (403 to fetch) | OK (secondary) |
| Venue | null | Not confirmed (DG's usual Berlin venue then was the Jesus-Christus-Kirche, Dahlem, but no source seen) | – | UNVERIFIED, left null |
| Earlier Philharmonia programme | "much the same programme in London with the Philharmonia" | karajan.org: earlier Philharmonia album "William Tell and the Famous Five"; "The same programme was repeated in 1971 with the Berlin Philharmonic" | https://karajan.org/?p=3169 | OK |

### Duration

| Track | ms | Guide |
| --- | --- | --- |
| 4 William Tell: Overture | 719 626 | 12:00 (duration_min 12) |

---

## Also recommended: Abbado / Chamber Orchestra of Europe, DG

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/1VoloxX2O89TviA8gkpUGI | "Rossini: Overtures", 7 tracks, track 4 "William Tell: Overture" 657 160 ms, credits Chamber Orchestra of Europe, Claudio Abbado; all playable; "℗ 1991 Deutsche Grammophon GmbH, Berlin" | embed; DG page https://www.deutschegrammophon.com/en/catalogue/products/rossini-overtures-abbado-7715 | VERIFIED |
| Cat. no. / dates | 431 653-2; recorded 1989; released 1991 | Presto: sessions April 1989 (Teatro Comunale, Ferrara) and December 1989 (Jesus-Christus-Kirche, Berlin); AllMusic release 14 June 1991; Gramophone 431 653 | https://prestomusic.com/classical/products/7941456--rossini-overtures (search summary) | OK; venue for Tell unknown → null |

---

## Painting: François Diday, *Orage sur le Léman* (*Storm on Lake Geneva*), 1839

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | François Diday (1802–1877), *Orage sur le Léman*, 1839, oil on canvas, 116 × 156 cm | Commons file description | OK |
| Collection | Musée des beaux-arts, La Chaux-de-Fonds, inv. no. 273 | Commons ("Collection du Musée des beaux-arts de La Chaux-de-Fonds") | OK |
| Image | `File:François Diday, Orage sur le Léman, 1839.tif`, 2945 × 2171, TIFF supplied by the museum; licence `PD-Art|PD-old-auto-expired|deathyear=1877` | https://commons.wikimedia.org/wiki/File:Fran%C3%A7ois_Diday,_Orage_sur_le_L%C3%A9man,_1839.tif | OK (note: TIFF; the image pipeline may need a JPEG conversion of the master) |
| Rights | Artist died 1877; museum reproduction of a PD painting | – | OK |
| Not already used | No Diday in `content/paintings.yaml` | – | OK |
| Content check | Viewed at 960 px: storm clouds over the lake, two boats with boatmen in breaking waves, a wind-bent tree on the left, light breaking through over the mountains on the right | – | OK |

Why it fits: Swiss lake, storm, and boatmen; the overture's storm passes and calm returns, and in the opera (end of Act 3 and Act 4) Gesler forces Tell, "an expert boatman", to pilot the boat across Lake Lucerne in the storm (Wikipedia synopsis). Painted ten years after the opera, by a Genevan painter.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| *Guillaume Tell* premiered by the Paris Opéra, Salle Le Peletier, 3 August 1829; Rossini's last opera; lived nearly 40 more years | https://en.wikipedia.org/wiki/William_Tell_(opera) ; https://en.wikipedia.org/wiki/Gioachino_Rossini | OK |
| Rossini 37 at the premiere (born 29 February 1792) | Wikipedia; Wikidata Q9726 | OK |
| "At the height of his fame" | Wikipedia lead: retired "at the height of his popularity" | OK |
| French libretto by Jouy and Bis after Schiller's *Wilhelm Tell* (1804); Swiss legend, Austrian rule | Wikipedia (opera) | OK |
| About four hours of music; often cut | Wikipedia (opera): "roughly four hours of music … When performed, the opera is often cut" | OK |
| Four connected parts: Prelude (dawn), Storm, Ranz des vaches, Finale ("March of the Swiss Soldiers"); no pause between them | https://en.wikipedia.org/wiki/William_Tell_Overture | OK |
| Berlioz "a symphony in four parts", usually disliked Rossini | Wikipedia (overture) | OK (attributed in Wikipedia; primary source not checked) |
| Dawn: five solo cellos and double basses, begins in E minor with one cello, two quiet timpani rolls, ends on a very high sustained note in the first cello | Wikipedia (overture) | OK |
| Storm: violins and violas first, three-note woodwind interjections (piccolo, flute, oboes, then clarinets, bassoons), then horns, trumpets, trombones, bass drum; ends with flute alone | Wikipedia (overture) | OK |
| Ranz des vaches in G major, cor anglais alternating with flute, triangle | Wikipedia (overture) | OK |
| Finale in E major, galop heralded by trumpets | Wikipedia (overture) | OK. Guide says "trumpets and horns" for the fanfare; check by ear |
| Lone Ranger (radio, TV, film); cartoons, adverts | Wikipedia (overture) | OK |
| Liszt piano transcription 1838 (S. 552) | Wikipedia (overture) | OK |
| After *Tell*: sacred music, songs, piano pieces, no more operas | Wikipedia (Rossini): Stabat Mater, Soirées musicales, Péchés de vieillesse, Petite messe solennelle | OK |
| "Programme music before the word was common" | Term associated with Liszt in the 1850s (glossary definition) | OK (interpretive) |

**Glossary.** New terms: Ranz des vaches, Galop (see shared note).

---

## Re-time

No bar map. Section lengths from Wikipedia's typical durations (prelude ≈ 3 min, storm ≈ 3 min, ranz des vaches "a little more than two minutes", finale ≈ 3 min) scaled to Karajan's 12:00.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 12:00 | 0:00, 1:50, 2:50, 3:05, 3:45, 5:00, 5:40, 8:30, 8:45, near the end | Section boundaries ≈ 3:05 (storm) and ≈ 8:30 (fanfare); timpani rolls ≈ 1:50 |
