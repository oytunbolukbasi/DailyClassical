# Verification: Brahms – Academic Festival Overture, Op. 80

Files: `content/drafts/en/brahms-academic-festival-overture.md`, `content/drafts/tr/brahms-academic-festival-overture.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group E). Shared-file additions (paintings.yaml, glossary: *concert overture*, re-time row; Brahms already in `composers.yaml`): `content/research/brahms-academic-festival-overture.shared.md`.

**How the checks were done.** Spotify search in the built-in browser; embed `__NEXT_DATA__` from a Turkish network (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`); Discogs API; Wikipedia via the MediaWiki API; Wikidata; Commons API; web search for programme notes and session dates. No personal data sent.

**Recording choice.** Candidates checked in the embed (all one track, all playable): Szell/Cleveland 10:58, Bernstein/NYP 10:10, Klemperer/Philharmonia 10:07 (album 1W21kPx7uF3ZbiYmHdqyoa, already the catalogue's reference for `brahms-symphony-3`), Walter/NYP (Naxos archive transfer, 9:19), Maazel/Cleveland 10:30. Szell chosen. His track length is the same (10:57–10:58) on the Sony CD SBK 46330 and in the Szell box on Spotify, so it is the performance, not added silence.

---

## Reference recording: Szell / Cleveland Orchestra, Columbia

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/0FOgm1PJnDO5XyW8AfwRko | "Brahms: Symphony No. 4 in E Minor, Op. 98, Academic Festival Overture, Op. 80 & Tragic Overture, Op. 81"; track 5 "Academic Festival Overture, Op. 80", 658 226 ms, credits George Szell, The Cleveland Orchestra; Spotify date 1967, "℗ Originally released 1967 SONY BMG" | https://open.spotify.com/embed/album/0FOgm1PJnDO5XyW8AfwRko | VERIFIED |
| isPlayable | – | `true` (all 6 tracks) | embed | OK |
| Label / cat. no. | Columbia MS 6965 (LP); SBK 46330 (CD) | Classite: Columbia MS 6965 / ML 6365 "Brahms: Haydn Vars, Academic & Tragic Ovs", Szell, Cleveland; Discogs 5312714: Sony SBK 46330 (1991), AFO 10:57 | https://classite.com/disk/columbia-ms-6965-q168 ; https://api.discogs.com/releases/5312714 | OK |
| Recorded / venue | 28 October 1966, Severance Hall | Classite listing of Columbia ML 6365/MS 6965: Akademische Festouvertüre "1966-10-28 Severance Hall, Cleveland" (search summary) | https://classite.com/disk/columbia-ml-6365-q154 | SECONDARY |
| Release year | 1967 | Spotify ℗ 1967; NYPL catalogue: CBS Masterworks [1967] (search summary) | embed; https://www.nypl.org/research/research-catalog/bib/b16364398 | OK |

### Duration

| Track | ms | Guide |
| --- | --- | --- |
| 5 Academic Festival Overture | 658 226 | 10:58 (`duration_min: 11`) |

---

## Also recommended: Bernstein / New York Philharmonic, Columbia

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4GKQtkP9mSG2ODL8uIxEvY | Track 5 "Academic Festival Overture, Op. 80", 610 000 ms (10:10), Bernstein, NYP; playable | embed | VERIFIED |
| Recorded / venue | 7 October 1963, Manhattan Center, New York | Discogs 12684664 and 10484638 (Sony SMK 47538 / SMK 61846): "Manhattan Center, New York City, October 7, 1963" for the overture | https://api.discogs.com/releases/12684664 ; https://api.discogs.com/releases/10484638 | OK |
| Release year | null | CD gives "℗ 1963 / 66 / 78" for its three works; the overture's first LP not identified | – | UNVERIFIED (yaml comment) |

---

## Painting: Anselm Feuerbach, *Plato's Symposium* (*Das Gastmahl des Platon*), first version, 1869

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Anselm Feuerbach (12 September 1829 – 4 January 1880), *Das Gastmahl des Platon*, 1869 (first of two versions, 1869–74) | Wikidata Q12899451; Wikipedia "Anselm Feuerbach" ("Between 1869 and 1874 he painted two versions of Plato's Symposium") | OK |
| Collection | Staatliche Kunsthalle Karlsruhe, inv. 813; oil on canvas, 295 × 598 cm | Wikidata (P195, P217, dimensions); museum page https://www.kunsthalle-karlsruhe.de/kunstwerke/Anselm-Feuerbach/Das-Gastmahl-des-Plato/364DB1734E6F3CAFBF8667934AE87CB6/ | OK |
| What it shows | Plato's *Symposium*: the drunken Alcibiades and his revellers bursting in on Agathon's banquet of philosophers (the standard reading of the subject; not checked on the museum page) | Plato, *Symposium* 212c–e; painting's title | OK |
| Image | `File:Plato's Symposium - Anselm Feuerbach - Google Cultural Institute.jpg`, 6472 × 3142, Google Art Project, `{{PD-Art|PD-old-auto-expired}}`, institution Staatliche Kunsthalle Karlsruhe | https://commons.wikimedia.org/wiki/File:Plato%27s_Symposium_-_Anselm_Feuerbach_-_Google_Cultural_Institute.jpg | OK |
| Rights | Painter d. 1880; faithful reproduction; not NC | – | OK |
| Reuse check | Not in `content/paintings.yaml`. Feuerbach is (*Iphigenie*, for `bruch-violin-concerto-1`). Kept because of the double link: Feuerbach was Brahms's friend, died on 4 January 1880 (one year to the day before the overture's premiere), Brahms began *Nänie* in his memory in spring 1880, the same year as the overture; and the subject, learning and revelry at one table, is the overture's joke | Wikipedia "Anselm Feuerbach"; Wikipedia "Nänie" ("Brahms began his composition in spring 1880 as a response to the death of his friend, the painter Anselm Feuerbach") | OK (flag at merge) |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| University of Breslau honorary doctorate, 1879 | Wikipedia "Academic Festival Overture" (Breslau, honorary doctorate); 1879 from search summaries of Britannica and classical-music.com ("an honorary Ph.D. degree conferred on him there in 1879") | OK |
| Brahms first sent a simple note; Bernhard Scholz, who had nominated him, said a musical offering was expected: "Compose a fine symphony for us!" | Wikipedia (Background) | OK |
| Composed summer 1880 | Wikipedia | OK |
| "a very boisterous potpourri of student songs à la Suppé" (letter to Max Kalbeck) | Wikipedia (Structure; the guide quotes it without "à la Suppé") | OK |
| Songs: "Wir hatten gebauet ein stattliches Haus"; "Hört, ich sing das Lied der Lieder" (Landesvater); "Was kommt dort von der Höh" (Fuchslied); "Gaudeamus igitur" | Wikipedia | OK |
| Trumpets introduce "Wir hatten gebauet"; Landesvater in the strings; bassoons lead the Fuchslied | Search summary of Britannica and programme notes ("Trumpets then introduce…"; Landesvater "in the strings"; "the bassoons took the lead for 'Was kommt dort von der Höh'"); Wikipedia (bassoons, Fuchslied) | OK |
| "Wir hatten gebauet" a song of the student fraternities | Search summary: "the theme of a student group that advocated the unification" of Germany (Burschenschaft) | OK |
| Fuchslied = freshmen's song | *Fuchs* = first-year member of a student society; Wikipedia DE "Fuchs (Studentenverbindung)" / the song's title | OK |
| Four continuous sections: Allegro (C minor), Maestoso (C major), Animato (G major), Maestoso (C major) | Wikipedia (Structure, wikitext list) | OK |
| Largest orchestra (piccolo, contrabassoon, tuba, bass drum, cymbals, triangle) | Wikipedia ("one of the largest ensembles for any of his compositions") | OK |
| Pair with the *Tragic Overture*, Op. 81 | Wikipedia | OK |
| Premiere 4 January 1881, Breslau, Brahms conducting; at the university's special convocation for his degree (Wikipedia) and given by the Breslauer Orchesterverein (search summary). Guide: "as part of the university's celebration of his degree" | Wikipedia; search summary | OK |
| Mixed reaction of academics ("chagrin (or mischievous delight)") | Wikipedia (Convocation) | OK |
| Concert overture: a piece on its own | Wikipedia ("pair of contrasting concert overtures") | OK |
| Typical performance about ten minutes | Wikipedia (Reception) | OK |
| *Gaudeamus igitur*: "So let us rejoice"; sung at graduation ceremonies in many European countries | Wikipedia "Gaudeamus igitur" | OK |
| Szell recorded it alongside the Fourth Symphony (both October 1966 at Severance Hall) | MusicWeb (symphony 7 October 1966) and Classite (overture 28 October 1966), via search summaries | SECONDARY |
| Strings' rushing scales, cymbals and triangle in the *Gaudeamus* finale | Standard description of the coda; Wikipedia notes the contrapuntal treatment of *Gaudeamus* | Check by ear |

---

## Re-time

No bar map. The overture runs about 430 bars at alla breve. Estimated positions, scaled from a typical ten-minute performance to Szell's 10:58 (factor ≈ 1.06): "Wir hatten gebauet" ≈ 2:05, Landesvater ≈ 3:05, Fuchslied ≈ 4:10, development ≈ 5:45, return ≈ 7:40, *Gaudeamus igitur* ≈ 9:40. All are estimates.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 10:58 | 0:00, 0:50, 2:05, 3:05, 4:10, 4:50, 5:45, 7:40, 9:40, last 10 s | The development and return (≈ 5:45, ≈ 7:40); the *Gaudeamus* entry (≈ 9:40) depends on Szell's tempo in the last section |
