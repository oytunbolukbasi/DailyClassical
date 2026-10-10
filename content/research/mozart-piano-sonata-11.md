# Verification: Mozart – Piano Sonata No. 11 in A major, K. 331

Piece id: `mozart-piano-sonata-11` (form `piano-sonata`, performers `soloists` only).
Files: `content/en/pieces/mozart-piano-sonata-11.md`, `content/tr/pieces/mozart-piano-sonata-11.md`. Shared-file additions: `content/research/mozart-piano-sonata-11.shared.md`.
Checked on 2026-10-10 (batch October 2026, group B). Method as in `beethoven-piano-sonata-14.md`. Score: Craig Sapp's Humdrum encoding, https://github.com/craigsapp/mozart-piano-sonatas (`kern/sonata11-1a.krn` … `-1g.krn` for the theme and six variations, `sonata11-2.krn`, `sonata11-3.krn`).

---

## 1. Reference recording: Mitsuko Uchida (Philips, 1983)

### Spotify embed check

Album `36ZImQlSkxKd7FGSiICpEf`: *Mozart: Piano Sonatas Nos.8, 11 & 12*, 10 tracks, all credited "Wolfgang Amadeus Mozart, Mitsuko Uchida" (K. 331, K. 332, K. 397, K. 310). DG's page for *The Mozart Collection 15 / Uchida* (Philips 475 7055, 2005; same programme and order) links to this Spotify album: https://www.deutschegrammophon.com/en/catalogue/products/the-mozart-collection-15-uchida-6935

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| **1** | **Piano Sonata No.11 in A, K.331 "Alla Turca": 1. Tema (Andante grazioso) con variazioni** | **13:49** | 829733 |
| **2** | **… 2. Menuetto** | **6:37** | 397066 |
| **3** | **… 3. Alla turca (Allegretto)** | **3:31** | 211626 |

Total 23:58 → `duration_min: 24`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Mitsuko Uchida | Mitsuko Uchida | embed; https://www.discogs.com/release/6559813 | VERIFIED |
| Label / catalogue | Philips, 412 123-2 | Original CD *2 Sonatas KV 331 "Alla Turca" / KV 332 · Fantasie KV 397*, Philips 412 123-2 (1984). The Spotify album corresponds to the 2005 reissue Philips 475 7055 (*The Mozart Collection*), which adds K. 310 | https://www.discogs.com/release/6559813 ; https://musicbrainz.org/release/c24dd2bc-99d9-454c-af31-ad7d6985058f ; https://www.discogs.com/release/20841109 ; https://musicbrainz.org/release/88b709f3-d461-4170-ba3e-30d2f4db0446 | VERIFIED |
| Recorded / venue | October 1983, Henry Wood Hall, London | Back inlay of 412 123-2: "Recorded … London, 10/1983"; MusicBrainz: K. 331 tracks recorded at Henry Wood Hall, 1983-10; Discogs (475 7055): "Recorded At Henry Wood Hall, London"; producer Erik Smith | same | VERIFIED |
| release_year / year | 1984 / 1983 | 412 123-2 released 1984 (MusicBrainz: 1984-07) | same | VERIFIED |

**Durations.** The reissue's lengths on MusicBrainz match Spotify to the millisecond for I and II (829733, 397066). For III MusicBrainz lists 219626 ms for 475 7055 and 220960 ms for the 1984 CD; Spotify has 211626 ms, 8–9 s shorter. Probably trimmed silence at the end of the track; check where the music actually ends.

**Repeats (INFERRED).** At the estimated tempi, 13:49 for I and 3:31 for III only fit if Uchida takes every repeat (theme and variations each 2 × 2 halves; Alla turca every section). See §4.

**Also recommended:** none added. Maria João Pires (DG 429 739-2, recorded May 1990, Friedrich-Ebert-Halle, Hamburg; MusicBrainz 3def760a-88b3-4e24-a5e3-cc77c26f5410) is a good candidate, but its Spotify album id could not be found in time (web search capped, MusicBrainz has no Spotify link).

---

## 2. Facts in "The big picture" and the movement texts

Main source: G. Henle Verlag, preface to HN 1300 (revised edition 2021, Wolf-Dieter Seiffert), English text: https://www.henle.de/media/a0/fe/38/1697725845/1300-1697725845-sync.pdf

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Probably written in the early 1780s, most likely in Vienna; long dated 1783; latest research suggests a little earlier (`year: 1783`) | Henle: NMA editors (Plath/Rehm), using Alan Tyson's watermark studies, date K. 330–332 "most probably composed in the year 1783 (in Vienna or Salzburg)"; Seiffert, from a newly found Viennese copy datable to "no later than the early 1780s", believes it was composed earlier than 1783 and not in Salzburg | VERIFIED |
| Published in Vienna, August 1784, with K. 330 and K. 332 | Henle: first printed August 1784 by Artaria, Vienna, with K. 330 and K. 332 (Mozart's letter of 12 June 1784; Artaria's advertisement of 25 August) | VERIFIED |
| No movement in sonata form: variations, minuet, rondo; all in A | Structure of the score; Wikipedia (homotonal, all movements in A): https://en.wikipedia.org/wiki/Piano_Sonata_No._11_(Mozart) | VERIFIED |
| Finale imitates Janissary bands; "Turkish" music fashionable in Mozart's early Vienna years; *Die Entführung* (1782) with two Janissary choruses | Henle preface ("The exotic aura exuded by 'Turkish music' made it extraordinarily popular…"; "Its two 'janissary' choruses are easy to imagine as the models for the Rondo 'Alla Turca'") | VERIFIED |
| Janissaries = the Ottoman sultan's soldiers; their bands with drums, cymbals and shrill pipes | General history; Rijksmuseum description of SK-A-4076 ("the Janissaries, the elite fighting force") | VERIFIED (general) |
| Only the last page of the manuscript was known; 2014 Budapest find by Balázs Mikusi; Zoltán Kocsis played it there in September 2014 | Wikipedia (Mikusi, National Széchényi Library, four pages; Kocsis, 26 September 2014); Henle (the 2014 Budapest find, 1st movement from Variation III to the Trio) | VERIFIED |
| Theme in a siciliano rhythm, two halves each repeated | Wikipedia ("built on a siciliana theme of an 8-bar section and a 10-bar section, each repeated"); Humdrum (18 bars, 6/8, repeats) | VERIFIED |
| Var. III in A minor; Var. IV with the left hand crossing; Var. V Adagio; Var. VI Allegro in 4/4 with a short coda | Humdrum (`sonata11-1d.krn` minor key, `-1e.krn` "L.H." marking, `-1f.krn` "Variation V: Adagio", `-1g.krn` "Variation VI: Allegro", `*M4/4`, section C after bar 20) | VERIFIED (score); Var. III key from the standard text |
| Var. I with leaning notes; Var. II with quick groups of three in the left hand | From memory of the score; not confirmed in a source | INFERRED – check by ear |
| Menuetto: trio in D major with hand-crossing | Humdrum `sonata11-2.krn` (key signature F# C# from bar 50; "L.H." at bar 53) | VERIFIED |
| Alla turca: A minor section, A major refrain in octaves over arpeggiated chords imitating Janissary instruments, F-sharp minor episode, coda | Wikipedia (A–B–C–B–A–B–coda; keys); Humdrum (key changes bars 25, 65, 89; coda from bar 98) | VERIFIED |
| Early sources mark the finale *Allegrino*; "Alla turca" apparently added for the first edition | Henle preface ("Its famous 'Alla Turca' heading was apparently not added to the unusual tempo marking 'Allegrino' (which appears in the copy and first edition) until printing of the first edition, either by Mozart or his publisher") | VERIFIED |
| Janissary-stop pianos built only in the 19th century; claim that Mozart wanted one is untenable | Henle preface (German text: "Tasteninstrumente mit derartigen Spezialeffekten wurden erst im 19. Jahrhundert gebaut und verwendet") | VERIFIED |

---

## 3. Painting: Jean Baptiste Vanmour, *Cornelis Calkoen on his Way to his Audience with Sultan Ahmed III* (ca. 1727–30)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Jean Baptiste Vanmour (1671–1737), *Cornelis Calkoen on his Way to his Audience with Sultan Ahmed III*, c. 1727 – c. 1730 (the audience took place on 14 September 1727) | https://www.rijksmuseum.nl/en/collection/SK-A-4076 | VERIFIED |
| Collection | Rijksmuseum, Amsterdam, SK-A-4076 | same | VERIFIED |
| Medium / size | Oil on canvas, 91.5 × 125 cm | same | VERIFIED |
| Description used in the pairing | "Audiences were always held on the day that the Janissaries, the elite fighting force, received their pay. Just as Calkoen enters, the soldiers lunge noisily at the dishes of rice." The scene is the second courtyard of the Topkapı Palace | same | VERIFIED |
| Public domain / image | Artist died 1737. Rijksmuseum image on Commons, CC0: `File:Cornelis Calkoen op weg naar de audiëntie bij sultan Ahmed III, SK-A-4076.jpg`, **5914 × 4256** | https://commons.wikimedia.org/wiki/File:Cornelis_Calkoen_op_weg_naar_de_audi%C3%ABntie_bij_sultan_Ahmed_III,_SK-A-4076.jpg | VERIFIED. Not NC |
| Not already used | Vanmour not in `content/paintings.yaml` (checked 2026-10-10) | – | VERIFIED |

**Pairing.** The finale imitates the music of the Janissaries' military bands (Henle); the painting shows the Janissaries themselves, in Istanbul, about fifty years earlier. It is the real thing that Vienna's "Turkish" fashion imitated. It may also please Turkish users. The guide does not claim that Mozart knew the painting.

---

## 4. Glossary

Existing terms reused: sonata form, minuet, rondo, variation, siciliano, trio, coda. No new terms. Parser check: no problems; 7 / 5 / 7 stops.

---

## 5. Re-time needed

Derived from the Humdrum structure and the Spotify lengths, assuming all repeats and a steady tempo inside each section:

- I: theme and Vars. I–IV, 36 played bars of 6/8 each at ≈ 3.2 s a bar (≈ 1:56 each); Var. V (Adagio) ≈ 4.45 s a bar (≈ 2:40); Var. VI (4/4 plus coda) ≈ 1:29.
- II: minuet A (18 bars) and B (30 bars) repeated, trio C (16) and D (36) repeated, minuet da capo without repeats: ≈ 248 bars at ≈ 1.6 s.
- III: 2/4, sections A 1–8, B 9–24, C 25–32 (refrain), D 33–40 and E 41–56 (F-sharp minor / running notes), F 57–64 (refrain), G 65–72 and H 73–88 (A minor), I 89–97 (refrain, first/second ending), coda 98–128; every section repeated; ≈ 225 played bars at ≈ 0.94 s.

| Mvt | Track (album `36ZImQlSkxKd7FGSiICpEf`) | Stops to re-time | Least certain |
| --- | --- | --- | --- |
| I Andante grazioso | 1 (13:49) | 0:00, 1:56, 3:52, 5:48, 7:44, 9:40, 12:20 | 9:40 and 12:20 (depend on how slow Uchida's Adagio is) |
| II Menuetto | 2 (6:37) | 0:00, 0:58, 2:34, 3:25, 5:21 | Assumes all repeats in the trio |
| III Alla turca | 3 (3:31) | 0:00, 0:45, 1:00, 1:45, 2:00, 2:45, 3:02 | Track is 8–9 s shorter than on CD; check the end |
