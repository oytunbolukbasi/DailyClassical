# Verification: Beethoven – Symphony No. 4 in B-flat major, Op. 60

Piece id `beethoven-symphony-4`. Checked on 2026-11-20 (batch 2026-11b, group B).
Files: `content/drafts/en/beethoven-symphony-4.md`, `content/drafts/tr/beethoven-symphony-4.md`.
Shared-file additions (paintings.yaml only; no new glossary terms): `content/research/beethoven-symphony-4.shared.md`.

**How the checks were done:** Spotify embed `__NEXT_DATA__` fetched with curl from a Turkish network (2026-11-20); album ids from spotistats.app and the Deutsche Grammophon product page (which links the Spotify album and carries track-level recording metadata); Wikipedia (the symphony; Carlos Kleiber discography, citing Barber 2013); a library catalogue record for the Orfeo CD; Wikimedia Commons and Wikidata. No machine-readable score was used; bar positions come from the sources cited and the standard layout of the movements.

## 1. Reference recording: Carlos Kleiber / Bavarian State Orchestra (Orfeo, live 1982)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Album | `6hGBt6PrYqzwoMmJoDIa86` | *Beethoven: Symphony No. 4 in B-Flat Major, Op. 60*, 5 tracks; tracks 1–4 (the symphony) `isPlayable: true`; track 5 "Applause (Live)", 3:04, `isPlayable: false` (not a movement, not used). Credits "Bavarian State Orchestra, Carlos Kleiber"; spotistats: release 2016-01-01 (digital reissue) | https://open.spotify.com/embed/album/6hGBt6PrYqzwoMmJoDIa86 ; https://spotistats.app/album/2425209 | VERIFIED |
| Label / catalogue | Orfeo C 100 841 A | Wikipedia discography (Barber 2013, p. 301): Orfeo C 100 841 A, released 1984; Radio Times CDs: Orfeo d'Or C100841 | https://en.wikipedia.org/wiki/Carlos_Kleiber_discography | OK |
| Recorded / venue | 3 May 1982 (live), Nationaltheater, Munich | Wikipedia discography: 3 May 1982, Bavarian State Orchestra; NYPL catalogue record: "recorded live May 3, 1982, in the Nationaltheater, Munich" (one Dagogo review says May 1983: treated as an error) | https://www.nypl.org/research/research-catalog/bib/pb1895570 | OK |
| Release | 1984 | Wikipedia discography | same | OK |
| "Nine recordings of the Fourth"; few studio recordings | In this recording | Wikipedia discography lead | same | OK |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Adagio – Allegro vivace (Live) | 572640 | 9:32 | true |
| 2 | II. Adagio (Live) | 569066 | 9:29 | true |
| 3 | III. Menuetto. Allegro vivace (Live) | 330893 | 5:30 | true |
| 4 | IV. Allegro ma non troppo (Live) | 302640 | 5:02 | true |
| | Total | 1775239 | 29:35 → `duration_min: 30` | |

Repeats (inferred): movement I lasts 9:32. Beethoven's metronome mark for the Allegro vivace is a semibreve = 80, one bar a beat; 460 Allegro bars plus the 148-bar exposition repeat at about that speed (≈ 7:40) plus a ≈ 1:50 introduction fits 9:32, while without the repeat the movement would last about 7:30. So the stops assume Kleiber repeats the exposition. Likewise the finale (5:02) fits only with its exposition repeat at Kleiber's speed.

## 2. Also recommended: Karajan / Berliner Philharmoniker (DG, 1983)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Album | `1BXXuzfggap7qi7v6Ufqq8`, *Beethoven: Symphonies Nos. 4 & 7*; No. 4 = tracks 1–4: 10:19 / 9:37 / 5:57 / 5:44 (619426 / 577666 / 357333 / 344000 ms), all `isPlayable: true` | https://open.spotify.com/embed/album/1BXXuzfggap7qi7v6Ufqq8 | VERIFIED |
| Label / catalogue | DG Karajan Gold, UPC 00028943900324 (= 439 003-2), released 15 February 1993; the product page links this Spotify album | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphonien-4-7-karajan-6673 | VERIFIED |
| Recorded / venue / first release | DG track metadata for the Fourth: recordingDateYear 1983, recordingDateMonth 12, recordingLocation "Philharmonie, Berlin", studio; firstReleaseYear 1985 (Karajan's third, digital cycle) | same | VERIFIED |

## 3. Painting: François Gérard, *Portrait of Juliette Récamier*, c. 1802–05

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | François Gérard (1770–1837), *Portrait de Juliette Récamier, née Bernard (1777–1849)*; Commons (Paris Musées data): "from 1802 until 1805"; Wikidata inception 1801. Guide: "c. 1802–05" | https://commons.wikimedia.org/wiki/File:Fran%C3%A7ois_G%C3%A9rard_-_Portrait_de_Juliette_R%C3%A9camier,_n%C3%A9e_Bernard_(1777-1849)_-_mus%C3%A9e_Carnavalet.jpg ; https://www.wikidata.org/wiki/Q20087570 | OK (dates differ slightly between sources) |
| Collection | Musée Carnavalet – Histoire de Paris, inv. P1581; oil on canvas, 225 × 147 cm (Wikidata) | https://www.parismuseescollections.paris.fr/fr/musee-carnavalet/oeuvres/portrait-de-juliette-recamier-nee-bernard-1777-1849 | OK |
| Image | 3501 × 5106, Paris Musées open content, {{cc-zero}} | Commons | OK |
| Rights | Gérard died 1837; Paris Musées releases its PD images as CC0 | – | OK |
| Not reused | No Gérard and no Récamier portrait in `content/paintings.yaml` | – | OK |

**Pairing.** The link is Schumann's reported image of the Fourth as "a slender Greek maiden between two Norse giants" (Wikipedia: "Robert Schumann is said to have called…") and the date: Juliette Récamier, painted in the white high-waisted dress and Greek-inspired setting of the early 1800s, a few years before the symphony (1806). The guide keeps "is said to".

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Summer 1806 at Lichnowsky's Silesian estate; September visit to Count Franz von Oppersdorff (Oberglogau), whose orchestra played the Second Symphony; Oppersdorff offered a sum for a new symphony; dedication to Oppersdorff | https://en.wikipedia.org/wiki/Symphony_No._4_(Beethoven) | OK |
| Beethoven had been working on the Fifth; reasons for not completing it for the count unknown; one theory: the count's liking for the Haydnesque Second | same | OK |
| Private premiere March 1807, Lobkowitz's town house; public premiere April 1808, Burgtheater | same | OK |
| Schumann "slender Greek maiden between two Norse giants" (said to); Berlioz: slow movement the work of the Archangel Michael | same (Reception) | OK |
| I: Adagio introduction 38 bars, begins in B-flat minor with a low B-flat pizzicato pianissimo, held wind chord, strings in the minor; fortissimo chords lead into the Allegro; second subject "a conversation between the bassoon, the oboe, and the flute" (Tovey); development toward B major | same | OK |
| I: soft timpani roll before the recapitulation | Weber's 1809 parody ("a mysterious roll of the drum and passage of the violas", Wikipedia) and the score | OK |
| Metre I: 4/4 introduction, 2/2 Allegro (Wikipedia: "22 time") | same | OK (introduction metre from the score: UNVERIFIED here) |
| II: E-flat, 3/4, slow sonata-rondo; the rhythmic figure of the opening persists throughout; second subject (Tovey); varied return; middle episode; varied theme in the flute; recapitulation; timpani end with the rhythm | same | OK. The clarinet for the second theme and the minor-key middle episode are from the score (standard), not from Wikipedia |
| III: headed Menuetto in most scores, not in the autograph; Allegro vivace (dotted minim = 100); trio repeated after the second scherzo, scherzo three times, last time abridged (as later in the Seventh); horns "blow the whole movement away" (Tovey) | same | OK |
| III: cross-accents in twos against the 3/4 (hemiola) | Standard description of this scherzo | UNVERIFIED against a cited source (worded "a kind of hemiola") |
| IV: 2/4, Allegro ma non troppo ("ma non troppo" added in red chalk); "aufgeknöpft"; perpetuum mobile; main theme at half speed interrupted by pauses, then a fortissimo flourish | same | OK |
| IV: bassoon solo at the start of the recapitulation | Standard orchestral excerpt for bassoon | OK (well known; no single cited source) |
| Kleiber live 1982; nine recordings of the Fourth | Kleiber discography | OK |

## 5. Re-time (all stops are ≈; not heard)

Method: Beethoven's metronome marks and bar counts as the scale, corrected to each track's length. Movement I: introduction ≈ 1:45 (38 Adagio bars), then 608 performed Allegro bars at ≈ 0.77 s (exposition bars 39–186 played twice, development 187–336, recapitulation 337, coda to 498); positions from these bar numbers. II: 104 bars at ≈ 5.5 s. III: ABABA + coda at estimated proportions. IV: ≈ 0.66 s a bar with the exposition repeat. Bar numbers inside movements are from the standard layout of the score, not checked bar by bar.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Adagio – Allegro vivace | 9:32 | 0:00, 1:30, 1:45, 2:35, 3:40, 5:35, 7:05, 7:25, Last 30 seconds | Length of Kleiber's introduction (± 15 s shifts all later stops); timpani roll ≈ 7:05 |
| II Adagio | 9:29 | 0:00, 2:30, 3:45, 4:30, 5:50, 7:10, Last 20 seconds | Second theme ≈ 2:30 and the flute return ≈ 5:50 (± 30 s) |
| III Allegro vivace – Un poco meno allegro | 5:30 | 0:00, 1:05, 2:25, 3:15, Last minute | Whether repeats are taken in the returns; second trio ≈ 3:15 (± 20 s) |
| IV Allegro ma non troppo | 5:02 | 0:00, 0:25, 1:05, 2:10, 3:05, Last 20 seconds | Bassoon solo ≈ 3:05 (± 15 s) |
