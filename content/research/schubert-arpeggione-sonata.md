# Verification: Schubert – Sonata in A minor for Arpeggione and Piano, D. 821

Files: `content/drafts/en/schubert-arpeggione-sonata.md`, `content/drafts/tr/schubert-arpeggione-sonata.md`. Checked 2026-11-17 (batch BATCH-2026-11, group D).

**Method.** Spotify albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from a Turkish network; album page `music:release_date` and ℗ line read too.

---

## Reference recording: Rostropovich / Britten, Decca 1968

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/6neCSxdb3EaVeJRlDmY23M | "Schubert: Arpeggione Sonata / Schumann: 5 Stücke in Volkston / Debussy: Cello Sonata", 11 tracks; D. 821 = tracks 1–3, credited "Franz Schubert, Mstislav Rostropovich, Benjamin Britten"; Spotify date 1999-01-01, "℗ 1999 Decca Music Group Limited" (Decca Legends edition) | https://open.spotify.com/embed/album/6neCSxdb3EaVeJRlDmY23M | VERIFIED |
| Linked by label | – | DG/Decca product page "SCHUBERT Arpeggione Sonata" (release 1 July 1999, Decca) links this album | https://www.deutschegrammophon.com/en/catalogue/products/schubert-arpeggione-sonata-9383 | OK |
| Other edition | – | 4Avkxl2gvwmK6YAMuIAoZJ ("Schubert/Schumann/Debussy: Works for Cello & Piano", ℗ 1996), track 1 = 814 000 ms (2 s shorter), II and III identical; also playable | https://www.deutschegrammophon.com/en/catalogue/products/rostropovich-debussy-schubert-schumann-4239 | for reference |
| isPlayable | – | `true` for all tracks | embed | OK |
| Label / cat. no. | Decca SXL 6426 (LP); 460 974-2 (CD) | Classite: "Rostropovich/Britten: Schubert: Arpeggione Sonata, Bridge: Sonata (r. July 1968)", Decca SXL 6426; classical-music.com review: "Decca Legends … 460 974-2 ADD" | https://classite.com/disk/decca-sxl-6426-q6238 ; https://classical-music.com/reviews/chamber/schubert-schumann-debussy | OK |
| Recorded / venue | July 1968, The Maltings, Snape | "Recorded at 'The Maltings', Concert Hall, Snape, on July 22–27, 1968 (Schubert)" (reissue notes quoted in search results); Classite 27 July 1968. One collector page says 1969; not followed | search results; https://www.audiophilia.com/reviews/2025/4/18/schubert-arpeggione-sonata-etc-rostropovich | OK |
| Release year | 1970 | SXL 6426 released October 1970 (elvinyl listing; Audiophilia) | https://www.elvinyl.com/vinyl-records/499599-sonata-for-arpeggione-and-piano-sonata-for-cello-and-piano | OK |
| Exposition repeat in I | taken (guide says so) | Inferred from length (13:36 vs about 11–12 min for Maisky/Argerich, 11:57) | – | Check by ear |

**"In this recording" facts.** Snape Maltings concert hall opened in June 1967 for the Aldeburgh Festival (Britten's festival); Britten wrote the Cello Sonata (1961), three Cello Suites and the Cello Symphony for Rostropovich (Wikipedia, Benjamin Britten; Snape Maltings). Guide: "opened the year before", "Cello Sonata and three suites". The slow tempos: compare track lengths with Maisky/Argerich (I 11:57 / II 4:36 / III 9:24).

### Durations (embed, album 6neCSxdb3EaVeJRlDmY23M)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Allegro moderato | 1 | 816 000 | 13:36 |
| II Adagio | 2 | 276 000 | 4:36 |
| III Allegretto | 3 | 632 000 | 10:32 |
| Total | | 1 724 000 | 29 min (28:44) |

---

## Also recommended: Maisky / Argerich, Philips

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4KJCXSh0NxDWq0hIkBGIuM | "Schumann: Fantasiestücke / Schubert: Arpeggione Sonata etc.", D. 821 = tracks 1–3 (717 426 / 275 506 / 564 493 ms), credits Argerich, Maisky; `isPlayable: true`; "℗ 1985 Universal International Music B.V." | embed; DG/Decca product page (release 24 May 1985) https://www.deutschegrammophon.com/en/catalogue/products/schubert-schumann-maisky-argerich-2261 | VERIFIED |
| Cat. no. | 412 230-2 | Gramophone listing "412 230" | https://gramophone.co.uk/review/works-for-cello-and-piano-2 (search snippet) | OK |
| Recorded / venue | null | Not found | – | UNVERIFIED (left null) |

---

## Painting: Erasmus Engert, *Viennese Domestic Garden* (*Wiener Hausgarten*), c. 1828–30

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Erasmus (Ritter von) Engert (1796–1871), *Wiener Hausgarten*, c. 1828–30 | Commons; Web Gallery of Art (WGA07524) | OK |
| Collection | Alte Nationalgalerie, Staatliche Museen zu Berlin | Commons description ("Paintings in the Alte Nationalgalerie"); WGA | OK (inventory number not recorded; check SMB online) |
| Image used | `File:Erasmus ritter von engert, giardino interno viennese, 1828-30 ca.jpg`, 2502 × 2886 (portrait), gallery photo by Sailko, photo licence CC BY 3.0 | https://commons.wikimedia.org/wiki/File:Erasmus_ritter_von_engert,_giardino_interno_viennese,_1828-30_ca.jpg | OK; check frame edges |
| Alternative scan | `File:Erasmus Engert - Viennese Domestic Garden - WGA07524.jpg`, 900 × 1091, PD | Commons | too small |
| Rights | Artist died 1871; faithful photo of a 2D PD work, no new right (EU DSM art. 14, US). Not the SMB's own NC photo | – | OK |
| Not already used | No Engert in `content/paintings.yaml` | – | OK |

Why it fits: Vienna in Schubert's last years (four to six years after the sonata), a private, quiet Biedermeier space; the sonata belongs to that domestic music-making, not to the concert hall. A modest link (place and period, mood), so two alternatives are given in the shared note.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Written in Vienna, November 1824 | Henle preface HN 612 (W.-D. Seiffert, 1995): https://www.henle.de/media/05/56/25/1690886061/0612-1690886061-sync.pdf ; Wikipedia, Arpeggione Sonata | OK |
| About a month after returning from his second stay at Zseliz (with the Esterházy family) | Wikipedia, Arpeggione Sonata; Zseliz = Želiezovce, Slovakia | OK |
| Arpeggione / "guitar-violoncello" built in Vienna by Johann Georg Staufer (Stauffer); six strings, fretted, tuned like a guitar (E–A–d–g–b–e′), held between the knees, bowed | Henle preface; Wikipedia, Arpeggione (invented around 1823, Stauffer and Teufelsdorfer) | OK. Guide: "a year or so earlier" |
| Written for Vincenz Schuster, virtuoso on the instrument | Henle ("a virtuoso named Vinzenz Schuster, for whom he wrote"); Wikipedia ("probably commissioned") | OK |
| Published only in 1871 (J. P. Gotthard, Vienna), instrument forgotten by then | Henle; Wikipedia | OK |
| Played today on cello, viola, other instruments; passages moved by an octave | Henle (octave transpositions in the cello and viola parts); Wikipedia ("4 versus 6 strings") | OK |
| Schubert ill; letter to Kupelwieser, 31 March 1824, "the most unhappy and wretched creature in the world" | Cambridge *Life of Schubert* (translation as quoted); Britannica ("ill, penniless"); Morgan Library autograph record https://www.themorgan.org/music-manuscripts-and-printed-music/138490 | OK (translations vary) |
| Movements: Allegro moderato (A minor, 4/4), Adagio (E major, 3/4), Allegretto (A major, 2/4); Adagio leads directly into the finale | Standard; IMSLP score pages https://imslp.org/wiki/Arpeggione_Sonata,_D.821_(Schubert,_Franz) | OK (metres and attacca from general knowledge of the score; check) |
| I: piano introduces the theme alone; second theme in C major; virtuoso arpeggios | General knowledge of the score; not checked bar by bar | Check |
| III: rondo; minor-key episode; pizzicato in the solo part | General knowledge; pizzicato not checked against the score | Check by ear |
| Schubert wrote more than 600 songs | Wikipedia, Franz Schubert | OK |

---

## Re-time

No bar map was available; stops placed by section proportions and the slow overall tempo. I assumes the exposition repeat (≈ 3:50–7:45). III's episodes are placed by typical rondo proportions.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 13:36 | 0:00, 0:20, 1:50, 2:50, 3:50, 7:45, 9:30, 12:50 | Whether the repeat is taken; development and recapitulation (≈ 7:45, ≈ 9:30) |
| II | 4:36 | 0:00, 0:20, 1:50, 3:10, last minute | Middle (≈ 1:50) |
| III | 10:32 | 0:00, 1:30, 3:00, 4:30, 7:00, 9:30, near the end | Episode starts (≈ 1:30, ≈ 4:30) |
