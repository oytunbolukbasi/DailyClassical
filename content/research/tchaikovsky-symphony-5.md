# Verification: Tchaikovsky – Symphony No. 5 in E minor, Op. 64

Piece id `tchaikovsky-symphony-5`. Checked on 2026-10-24 (batch 2026-10b, group G).
Files: `content/drafts/en/tchaikovsky-symphony-5.md`, `content/drafts/tr/tchaikovsky-symphony-5.md`.
Shared-file additions (paintings.yaml, glossary "Waltz"; composer `tchaikovsky` already exists): `content/research/tchaikovsky-symphony-5.shared.md`.

Status key as in `content/research/tchaikovsky-symphony-4.md`. The web-search budget ran out during the research; later checks used direct reads of the primary pages listed.

---

## 1. Reference recording: Mravinsky / Leningrad Philharmonic (DG, 1960)

Same Spotify album as `tchaikovsky-symphony-4` (tracks 5–8).

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Evgeny Mravinsky / Leningrad Philharmonic Orchestra | Spotify credits on tracks 5–8 | https://open.spotify.com/embed/album/6SZWTAgkL2iz9pvgVyt1Ej | VERIFIED |
| Label / catalogue | DG; SLPM 138 658 (LP); 419 745-2 (CD) | Discogs: SLPM 138 658, *Symphonie Nr. 5*, DG (1961 pressings, e.g. releases 13340446, 15469174). MusicWeb: "First issued on LP as DGG SLPM138657 (4); 138658 (5); 138659 (6)"; 419 745-2 boxed set | https://api.discogs.com/database/search?catno=SLPM%20138658 ; https://www.musicweb-international.com/classrev/2014/Feb14/Tchaikovsky_sys456_PASC396.htm | OK |
| Recorded | November 1960 | DG track metadata: 10 November 1960; MusicWeb: 9–10 November 1960 | https://www.deutschegrammophon.com/en/catalogue/products/tchaikovsky-symph-nos-456-mravinsky-2584 ; MusicWeb | OK (month) |
| Venue | Musikverein, Vienna | DG: "Grosser Saal, Musikverein, Wien" | DG page | VERIFIED |
| Release year / year | 1961 / 1960 | DG `firstReleaseYear` 1961; Discogs 1961 | same | OK |
| Spotify | https://open.spotify.com/album/6SZWTAgkL2iz9pvgVyt1Ej | DG page links this id | embed ; DG page | VERIFIED |

### Durations and playability (Spotify embed, read from Turkey)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | I. Andante – Allegro con anima | 873000 | 14:33 | true |
| 6 | II. Andante cantabile, con alcuna licenza – Moderato con anima | 713000 | 11:53 | true |
| 7 | III. Valse (Allegro moderato) | 331000 | 5:31 | true |
| 8 | IV. Finale (Andante maestoso – Allegro vivace) | 663000 | 11:03 | true |
| | Total | 2580000 | 43:00 → `duration_min: 43` | |

---

## 2. Also recommended: Karajan / Berliner Philharmoniker (DG, 1975)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Karajan / Berliner Philharmoniker | Spotify credits | https://open.spotify.com/embed/album/2NAbBIo3ZB2jmDzjpt2So7 | VERIFIED |
| Catalogue | 2530 699 (LP); 453 088-2 (CD) | Discogs master 581040: DG 2530 699, *Symphonie Nr. 5*, 1976. DG 2-CD page (UPC 00028945308821) links this album | https://api.discogs.com/masters/581040 ; https://www.deutschegrammophon.com/en/catalogue/products/tchaikovsky-symphonien-nos-456-karajan-7992 | OK |
| Recorded / venue | October 1975, Philharmonie, Berlin | DG metadata: 22 October 1975, Philharmonie, Berlin; first release 1976 (also on https://www.deutschegrammophon.com/en/catalogue/products/tchaikovsky-symphony-5-karajan-2518) | DG pages | OK (label data) |
| Tracks | 5–8: 15:53 / 14:38 / 6:38 / 12:32, all `isPlayable: true` | embed | | VERIFIED |

---

## 3. Painting: Ivan Shishkin and Konstantin Savitsky, *Morning in a Pine Forest*, 1889

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artists | Ivan Shishkin (1832–1898); the bears are by Konstantin Savitsky (1844–1905). Wikidata lists both as creators; the canvas is signed by Shishkin only ("И. Шишкинъ. 1889") | https://www.wikidata.org/wiki/Q2666439 ; Commons file page | OK |
| Title / date | *Morning in a Pine Forest* (Утро в сосновом лесу), 1889; TR "Çam Ormanında Sabah" | same | OK |
| Collection | State Tretyakov Gallery, Moscow, inv. 841; bought by Pavel Tretyakov in 1889 | Wikidata; Commons provenance; https://www.tretyakovgallery.ru/collection/utro-v-sosnovom-lesu/ (linked from the file page, not opened) | OK |
| Medium / size | Oil on canvas, 139 × 213 cm | Commons; Wikidata | OK |
| Rights | Both painters died before 1906: public domain. {{PD-Art\|PD-old-100-expired}} | https://commons.wikimedia.org/wiki/File:Shishkin,_Ivan_-_Morning_in_a_Pine_Forest.jpg | OK |
| Image | 5668 × 3840 (Hermitage-torrent scan; Commons featured picture) | same | OK |
| Pairing | Dates (1889 vs 1888) and the dark-to-light idea of the symphony's E minor → E major motto | guide | OK (interpretive) |

The `artist` field uses "Ivan Shishkin and Konstantin Savitsky", as `grieg-piano-concerto` does for Gude and Tidemand. If the app should show one name, use "Ivan Shishkin".

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed and orchestrated May–August 1888; worked at Frolovskoye; waltz in the fair copy dated "9 Aug '88. Frolovskoye"; scoring finished by 14/26 August | https://en.tchaikovsky-research.net/pages/Symphony_No._5 (Composition) | VERIFIED |
| Doubts while composing ("constantly doubted his powers") | same | VERIFIED |
| Notebook programme: "Total submission before fate, or, what is the same thing, the inscrutable designs of Providence"; letter to Grand Duke Konstantin 11/23 June 1888: "without a programme"; uncertain how much survived | same (Subject) | VERIFIED |
| Bar counts I 542, II 180, III 266, IV 565 | same (Movements) | VERIFIED |
| Motto heard in all four movements; funereal in I, triumphant march in IV; E minor → E major | https://en.wikipedia.org/wiki/Symphony_No._5_(Tchaikovsky) | OK |
| Premiere 5/17 Nov 1888, St Petersburg Philharmonic Society, composer conducting | Tchaikovsky Research (Performances). Wikipedia says "at the Mariinsky Theatre"; the guide names only the city | VERIFIED (city/date) |
| "There is something so repellent about such excess, insincerity and artificiality"; "too colourful, massive, insincere, drawn out"; after Hamburg (March 1889) "I have started to love it again" | Tchaikovsky Research (Critical Reception); Wikipedia | VERIFIED |
| Dedicated to Theodor Avé-Lallemant, director of the Hamburg Philharmonic Society | Tchaikovsky Research (Dedication) | VERIFIED |
| II: horn solo from the upbeat to bar 8, *dolce con molto espress.*; theme A2 oboe/horn; theme B clarinet; motto bars 99–103 and 158–166; ternary form; B minor → D major opening | Wikipedia (II) | OK |
| III: waltz; hemiola; trio a scherzo-like section for the violins; motto near the end; ends with six ff chords | Wikipedia (III) | OK |
| III: motto "in clarinets and bassoons"; II middle marked *Moderato con anima* (also in the Spotify track title) | track title; instruments from knowledge of the score | UNVERIFIED (instruments) |
| IV: motto in the major; motto in C major at bar 172; development ≈ 60 bars; new melody superimposed in recapitulation; motto in E minor, then a cadence in B major; coda with motto (bar 474), PT2 (504) and I's theme; trumpets and horns exchanging it at the end | Wikipedia (IV) | OK |
| IV: *Moderato assai e molto maestoso*, *Presto* markings in the coda | knowledge of the score | UNVERIFIED |
| Tchaikovsky considered the ending "overdone and excessive" | Wikipedia (Critical reaction) | SECONDARY |
| I: Theme 1 first on clarinet and bassoon; recapitulation in the low woodwinds (bassoon); quiet ending in the low register | knowledge of the score | UNVERIFIED |
| Metres I 4/4 – 6/8 (Wikipedia mentions 6/8 and 3/4 shifts in the development), II 12/8, III 3/4, IV 4/4 – 2/2 | knowledge of the score; Wikipedia for 6/8 | UNVERIFIED (II, IV) |

---

## 5. Re-time (every stop is ≈)

Reference: Mravinsky / Leningrad PO, Spotify `6SZWTAgkL2iz9pvgVyt1Ej` (tracks 5–8). Method: bar numbers from Wikipedia where given, others assumed; spread over the track at its average tempo.

I: intro (bars 1–37) assumed ≈ 1:45; then ≈ 1.52 s per 6/8 bar. PT1 bar 42, PT2 bar 116, motive X bar 154, ST bar 170, exposition ends bar 198 (Wikipedia); recapitulation assumed ≈ bar 313, recap ST ≈ bar 445, coda ≈ bar 475.
II: 180 bars, ≈ 3.96 s per bar; horn bar 8; B section assumed ≈ bar 66 (faster); motto bars 99 and 158 (Wikipedia), placed earlier than the linear time because the B section moves faster.
III: 266 bars, ≈ 1.24 s per bar; trio assumed ≈ bar 73, waltz return ≈ bar 106 (after the hemiola bars 97–105, Wikipedia), motto ≈ bar 233.
IV: intro (bars 1–57) assumed ≈ 1:55; Allegro ≈ 0.99 s per bar; motto bar 172 (Wikipedia); recapitulation assumed ≈ bar 300; coda bar 474 (Wikipedia).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Andante – Allegro con anima | 14:33 | 0:00, 1:50, 3:40, 4:40, 5:05, 5:50–8:40, 8:45, 12:00, Last 90 seconds | Recapitulation (≈ 8:45) and the return of Theme 2 (≈ 12:00): bar numbers assumed |
| II Andante cantabile | 11:53 | 0:00, 0:30, 1:30, 3:00, 4:15, 6:05, 6:40, 8:40, 10:10, Last 90 seconds | Middle section (≈ 4:15) and the two motto entries (≈ 6:05, ≈ 10:10) |
| III Valse | 5:31 | 0:00, 0:30, 1:30, 2:10, 4:50, Last 15 seconds | Trio (≈ 1:30) and motto (≈ 4:50) |
| IV Finale | 11:03 | 0:00, 1:55, 2:45, 3:50, 5:55, 8:35, 8:50, 9:50, Last 40 seconds | Length of the introduction (≈ 1:55), recapitulation (≈ 5:55), the big pause (≈ 8:35) |

---

## 6. Reference switched (Oct 2026): Petrenko / Berliner Philharmoniker (BPHR, 2019)

The product owner's favourite recording replaces Mravinsky as the reference (guide §6.3). Mravinsky moves to `also_recommended` ahead of Karajan; sections 1 and 5 above describe the old reference and are kept as history.

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Kirill Petrenko / Berliner Philharmoniker | Spotify credits "Pyotr Ilyich Tchaikovsky, Berlin Philharmonic, Kirill Petrenko" on every track | https://open.spotify.com/embed/album/0yTolmgBhMcUiA0E4fGUsu | VERIFIED |
| Label | Berliner Philharmoniker Recordings | Spotify album page: "℗ 2020 Berlin Phil Media GmbH", release date 2020-10-23 (digital single *Tchaikovsky: Symphony No. 5*). Discogs: label Berliner Philharmoniker Recordings | https://open.spotify.com/album/0yTolmgBhMcUiA0E4fGUsu ; https://api.discogs.com/releases/15974845 | VERIFIED |
| Catalogue | BPHR 200351 (box set) | The digital single has no catalogue number. The same performance is in the box *Kirill Petrenko: Beethoven / Tschaikowsky / Schmidt / Stephan* (DCH title "The beginning of a partnership"), BPHR200351, released 2020-09-25, 5 CD + 2 Blu-ray; Symphony No. 5 listed at 45:13, the same as the Spotify tracks' total (2713358 ms). LP edition BPHR 200352 (Discogs 27452751) | https://api.discogs.com/releases/15974845 ; https://www.digitalconcerthall.com/en/edition/BPHR20035 | OK |
| Recorded | 9 March 2019 | Digital Concert Hall concert 51854 ("Kirill Petrenko and Patricia Kopatchinskaja": Schoenberg Violin Concerto, Ravel, Milhaud, Tchaikovsky 5): `dateCreated` 2019-03-09T18:00:00+00:00 (19:00 Berlin time). A secondary search snippet of a review of the box also gives "Recorded on 9 March 2019 – 45'13" | https://www.digitalconcerthall.com/en/concert/51854 ; https://www.digitalconcerthall.com/en/work/51854-4 | OK |
| Venue | Philharmonie, Berlin | Box: "Recordings made between 2012 and 2019 at the Philharmonie Berlin"; DCH edition: "Recorded: 2012–2019 · Philharmonie Berlin" | Discogs 15974845 ; DCH edition page | VERIFIED |
| Release year / year | 2020 / 2019 | ℗ 2020 | Spotify ; Discogs | VERIFIED |
| "In this recording": chief conductor from August 2019 | Wikipedia: elected June 2015; "His official tenure start was confirmed for 19 August 2019." The DCH concert page says this was his "last appearance with the Berliner Philharmoniker before taking up office as their chief conductor"; a search snippet mentions a Petrenko Tchaikovsky 5 at the 2019 Baden-Baden Easter Festival, so the guide says only "a few months before", not "last concert" | https://en.wikipedia.org/wiki/Kirill_Petrenko ; DCH concert page | OK |

The BPHR product page (https://www.berliner-philharmoniker-recordings.com/kirill-petrenko-beethoven-tchaikovsky-schmidt-stephan.html) now returns "Page not found"; the Wayback Machine was rate-limited.

### Durations and playability (Spotify embed, album 0yTolmgBhMcUiA0E4fGUsu, read from this machine in Turkey, 2026-10-24)

The album is the symphony alone, 4 tracks, one per movement. All `isPlayable: true`.

| Track | Track id | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- | --- |
| 1 | 5lVFuhdXSTFgIv65V8Zvua | I. Andante – Allegro con anima | 866866 | 14:26 | true |
| 2 | 7MrRFi6swb5Jwef9esaJIF | II. Andante cantabile, con alcuna licenza | 785037 | 13:05 | true |
| 3 | 3Y0TJMyM0M6WSMV6r4Uw55 | III. Valse. Allegro moderato | 357993 | 5:57 | true |
| 4 | 0xlO2J6n1J1u0qOpHHfVOx | IV. Finale. Andante maestoso – Allegro vivace – Moderato assai e molto maestoso – Presto – Molto meno mosso | 703462 | 11:43 | true |
| | | Total | 2713358 | 45:13 → `duration_min: 45` | |

### How the stops were rescaled

No structural difference: the symphony has no written repeats, and neither performance makes cuts (the totals differ by tempo, mostly in II, where Petrenko takes 13:05 against Mravinsky's 11:53). Each ≈ stop was multiplied by new track / old track and rounded to 5 s; the label-only stops (Last 90 seconds, Last 15 seconds, Last 40 seconds) are kept. EN and TR have identical times. Still unheard against this recording, so all stay ≈.

| Mvt | Ratio | Old (Mravinsky) | New (Petrenko) |
| --- | --- | --- | --- |
| I | 866.9 / 873 = 0.993 | 0:00, 1:50, 3:40, 4:40, 5:05, 5:50–8:40, 8:45, 12:00 | 0:00, 1:50, 3:40, 4:40, 5:05, 5:50–8:35, 8:40, 11:55 |
| II | 785.0 / 713 = 1.101 | 0:00, 0:30, 1:30, 3:00, 4:15, 6:05, 6:40, 8:40, 10:10 | 0:00, 0:35, 1:40, 3:20, 4:40, 6:40, 7:20, 9:35, 11:10 |
| III | 358.0 / 331 = 1.082 | 0:00, 0:30, 1:30, 2:10, 4:50 | 0:00, 0:30, 1:35, 2:20, 5:15 |
| IV | 703.5 / 663 = 1.061 | 0:00, 1:55, 2:45, 3:50, 5:55, 8:35, 8:50, 9:50 | 0:00, 2:00, 2:55, 4:05, 6:15, 9:05, 9:20, 10:25 |

Caveats: the Mravinsky millisecond values in section 1 are suspiciously round (873000, 713000 …), so the old track lengths may themselves be rounded; the effect on the ratios is under 1 %. Petrenko's II is about 10 % slower overall, but rubato in a *con alcuna licenza* movement is uneven, so the II stops (especially the motto entries ≈ 6:40 and ≈ 11:10) are the least certain. This is a concert recording; any applause appears to be cut (the DCH video lists applause separately).
