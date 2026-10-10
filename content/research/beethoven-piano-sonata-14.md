# Verification: Beethoven – Piano Sonata No. 14 in C-sharp minor, Op. 27 No. 2 "Moonlight"

Piece id: `beethoven-piano-sonata-14` (form `piano-sonata`, performers `soloists` only).
Files: `content/en/pieces/beethoven-piano-sonata-14.md`, `content/tr/pieces/beethoven-piano-sonata-14.md`. Shared-file additions: `content/research/beethoven-piano-sonata-14.shared.md`.
Checked on 2026-10-10 (batch October 2026, group B).

**How the checks were done** (same method as `beethoven-piano-sonata-8.md`)
- **Spotify:** public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__` JSON: album name, track titles, performer credit, duration in ms). Durations below are the ms values truncated to whole seconds, as in the existing guides.
- **Discogs:** public API `https://api.discogs.com/releases/<id>`; human-readable URLs below. **MusicBrainz:** `https://musicbrainz.org/ws/2/...` with the project's generic User-Agent.
- **Score:** Craig Sapp's Humdrum encoding, https://github.com/craigsapp/beethoven-piano-sonatas (`kern/sonata14-1.krn`, `-2.krn`, `-3.krn`), for bar counts, repeats, fermatas and key changes.
- **Status key:** VERIFIED = seen in a primary source. INFERRED = derived, not seen directly. UNVERIFIED = could not be confirmed.
- Web search was capped during this batch; facts rely on the sources below (Wikipedia, Henle preface for Op. 13 already in the repo, score encodings, label data).

---

## 1. Reference recording: Wilhelm Kempff (DG, 1965)

### Spotify embed check

Album `7z9kHQBUKHO4UQ5ol9D4Ia`: *Beethoven: Piano Sonatas Nos.8 "Pathétique", 14 "Moonlight", 15 "Pastorale" & 24*, 12 tracks, all credited "Ludwig van Beethoven, Wilhelm Kempff". The same album is already the `also_recommended` Kempff in `beethoven-piano-sonata-8` (its research note links it to MusicBrainz release 936f07f9-25aa-4dbc-9d6b-422adc8f76f5, DG CD 415 834-2).

| # | Track (Spotify) | Duration | ms |
| --- | --- | --- | --- |
| **4** | **Piano Sonata No.14 In C Sharp Minor, Op.27 No.2 -"Moonlight": 1. Adagio sostenuto** | **6:09** | 369666 |
| **5** | **… 2. Allegretto** | **2:19** | 139493 |
| **6** | **… 3. Presto agitato** | **5:30** | 330333 |

Total 13:59 → `duration_min: 14`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Wilhelm Kempff | Kempff, stereo DG cycle | embed page; https://www.discogs.com/release/3204738 | VERIFIED |
| Label / catalogue | DG, 139 300 (LP); 415 834-2 (CD) | Discogs 447 404-2 notes: "Nos. 8 & 14 (Opp. 13 & 27) originally released on Deutsche Grammophon 139 300, 1965". MusicBrainz release caa9ac97-7bb5-4e1c-987f-1af30d2d86a9 (Kempff, *Klaviersonaten*, 1965, cat. 139300). Spotify album = CD 415 834-2 (see sonata-8 note) | https://www.discogs.com/release/3204738 ; https://musicbrainz.org/release/caa9ac97-7bb5-4e1c-987f-1af30d2d86a9 | VERIFIED |
| Recorded / venue | January 1965, Beethovensaal, Hanover | "Recordings: Hanover, Beethovensaal, 1/1965 (Nos. 8 & 14)"; Discogs company credit "Recorded At Beethovensaal, Hannover"; producer Wolfgang Lohse, balance engineer Klaus Scheibe (tracks 1–6 of 447 404-2) | https://www.discogs.com/release/3204738 | VERIFIED |
| release_year / year | 1965 | ℗ 1965 Polydor International | same | VERIFIED |

### Repeats (INFERRED from durations and the score)

- III Presto agitato: 200 bars of 4/4, exposition (bars 2–65) marked to be repeated (Humdrum expansion `[I,A,A1,A,B]`). At ≈ 1.6 s a bar Kempff's 5:30 fits **no repeat** (≈ 200 bars); with the repeat (≈ 265 bars) it would run ≈ 7:00. Gilels (7:07) and Barenboim (7:42) fit the repeat. The guide says Kempff does not take it and the others do: **INFERRED – confirm by ear** (if Kempff's opening waves return at ≈ 1:44 in C-sharp minor, he repeats and every later stop in III moves by ≈ +1:45, and both "In this recording" notes and the ≈ 1:44 stop text must change).
- II Allegretto: 60 bars; Humdrum expansion `[A,B,B,C,C,D,D,A,B]` (first part not repeated, "La prima parte senza repetizione"; da capo without repeats). 140 bars played at ≈ 1 s a bar = 2:19, so Kempff appears to take all repeats. INFERRED.

---

## 2. Also recommended

| Recording | Spotify | Tracks (Op. 27/2) | Other fields | Status |
| --- | --- | --- | --- | --- |
| Emil Gilels, DG, Sept 1980, Jesus-Christus-Kirche Berlin, LP 2532 008 / CD 400 036-2, ℗ 1981 | https://open.spotify.com/album/73KOojES6U1jObQdYuNORQ (*Beethoven: Piano Sonatas Nos.8 "Pathétique", 13 & 14 "Moonlight"*, 10 tracks, credited "Ludwig van Beethoven, Emil Gilels") | tracks 8–10: 6:09 (369500) / 2:30 (150466) / 7:07 (427500) | All fields as already verified in `research/beethoven-piano-sonata-8.md` §2 (Discogs 3441146, 4450906; MusicBrainz 750e7f5a-…) | VERIFIED |
| Daniel Barenboim, DG, Dec 1983, Maison de la Mutualité Paris, CD 419 602-2, ℗ 1984 | https://open.spotify.com/album/4TCTWpN6Gwq2dA37rkwMX1 (Spotify title scrambles the nicknames; track titles correct) | tracks 1–3: 6:40 (400200) / 2:12 (132678) / 7:42 (462533) | As verified in `research/beethoven-piano-sonata-8.md` §1 (sleeve: "12/1983 (Opp. 13 & 27)") | VERIFIED |

---

## 3. Facts in "The big picture" and the movement texts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written 1801, at thirty; published Vienna 1802 | Wikipedia: composed 1801; published 1802 by Giovanni Cappi, Vienna (title page dated 2 August 1802). Born Dec 1770 → 30 in 1801. https://en.wikipedia.org/wiki/Piano_Sonata_No._14_(Beethoven) | VERIFIED (secondary) |
| Dedicated to his young pupil Countess Giulietta Guicciardi | Wikipedia (dedication to Countess Julie "Giulietta" Guicciardi; she was his pupil) | VERIFIED (secondary). The love story is left out on purpose |
| Title *Sonata quasi una fantasia*; same heading for Op. 27 No. 1 | Wikipedia (first-edition heading; companion Op. 27 No. 1) | VERIFIED |
| Opens slow, weight in the finale | Wikipedia: "the weightiest movement" is the finale; Beethoven places the most important movement last | VERIFIED |
| Rellstab compared the first movement to moonlight "in the 1820s"; name used by publishers by the late 1830s | Wikipedia, citing Sarah Waltz (2007): Rellstab's comparison is in his story *Theodor* (1824); the "Lake Lucerne" detail is Wilhelm von Lenz's later (1852) embellishment; "by the late 1830s" German and English publications used the name. **The guide deliberately avoids "Lake Lucerne"** and says "moonlight on water" | VERIFIED (secondary) |
| "Senza sordino" = without dampers, i.e. sustain pedal held | Wikipedia quotes the heading "Si deve suonare tutto questo pezzo delicatissimamente e senza sordino"; score encoding has "sempre pp e senza sordini" at bar 1–2 | VERIFIED |
| Never louder than *p* | Wikipedia: "marked pianissimo and never gets louder than piano" | VERIFIED |
| Said to have told Czerny he had written better things | Wikipedia ("Surely I've written better things") – told as "is said to" | VERIFIED as an anecdote |
| I: 69 bars, alla breve (2/2) | Humdrum `sonata14-1.krn` (`*M2/2`, last bar 69) | VERIFIED |
| I: middle section over a held low note (G-sharp pedal), return of the opening, tune's rhythm in the bass in the coda | Score structure (standard analysis: dominant pedal bars ≈ 28–41, return bar 42, coda bar 60 with the dotted figure in the bass). Bar positions are from the score encoding; the harmonic labels are standard but not cited from a written analysis | INFERRED (check by ear) |
| II: minuet and trio in D-flat major; first part not repeated in the da capo | Wikipedia ("fairly conventional minuet"; "first section is not repeated"); Humdrum text "La prima parte senza repetizione" | VERIFIED |
| II: Liszt "a flower between two abysses" | Wikipedia: Liszt "is said to have" called it so – told as "the story goes" | VERIFIED as an anecdote |
| III: sonata form, 4/4, fast arpeggios and sforzandos; theme 2 in G-sharp minor | Wikipedia (form, metre); key of theme 2 from the score (G-sharp minor area, trills bars 30–36) | VERIFIED / INFERRED (key) |
| III: fermata bar 14; cadenza-like passage and Adagio bars near 187–188; final arpeggios | Humdrum fermatas bars 14, 116, 165, 167, 188 | VERIFIED (bar positions) |
| Threads: modern pianos ring longer, pedal changed more often | Wikipedia (modern pianos sustain longer; remedies: changing pedal, half-pedalling) | VERIFIED |

Not used: the claim that Beethoven was in love with Guicciardi (well attested but not needed), Berlioz's and Czerny's "ghost" descriptions, Chopin's *Fantaisie-Impromptu* and Shostakovich's Viola Sonata quotation.

---

## 4. Painting: Caspar David Friedrich, *Two Men Contemplating the Moon* (ca. 1825–30)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Caspar David Friedrich (German, Greifswald 1774–1840 Dresden), *Two Men Contemplating the Moon*, ca. 1825–30 | Met API object 438417: https://collectionapi.metmuseum.org/public/collection/v1/objects/438417 ; https://www.metmuseum.org/art/collection/search/438417 | VERIFIED |
| Collection | The Metropolitan Museum of Art, New York, 2000.51, Wrightsman Fund, 2000; gallery 807 at time of check | same | VERIFIED |
| Medium / size | Oil on canvas, 34.9 × 43.8 cm | same | VERIFIED |
| Public domain / licence | Artist died 1840. Met Open Access `isPublicDomain: true` (CC0) | same | VERIFIED |
| Image | Met primary image `https://images.metmuseum.org/CRDImages/ep/original/DP-31997-001-NEW.jpg`, **4000 × 3237** (read from the JPEG header), 4,542,841 bytes. Commons mirror of an older Met image: `File:Caspar David Friedrich - Zwei Männer in Betrachtung des Mondes (Metropolitan Museum of Art).jpg`, 3728 × 2976, PD | Met; https://commons.wikimedia.org/wiki/File:Caspar_David_Friedrich_-_Zwei_M%C3%A4nner_in_Betrachtung_des_Mondes_(Metropolitan_Museum_of_Art).jpg | VERIFIED. Not NC |
| Not already used | Friedrich has *The Abbey in the Oakwood* in `paintings.yaml` (Brahms 4) and the brief lists *Wanderer* and *Monk by the Sea* as used. This is a different work; the brief allows another work by the same artist "only if it is clearly the best match". It is: the one canonical Romantic image of people gazing at the moon, painted in the decade the nickname's comparison was first made | – | Check for clashes with other groups |

**Pairing.** Rellstab's comparison of the first movement to moonlight dates from the 1820s (Wikipedia, citing Waltz 2007); the Met's version of Friedrich's composition is dated ca. 1825–30. The pairing note claims only that coincidence of decade and image. There is no link between Friedrich and the sonata. Note that the Met owns a later variant; the first version (1819/20) is in Dresden (an alternative in the `.shared.md`).

---

## 5. Glossary

Existing terms reused: sustain pedal, pedal note, recapitulation, coda, minuet, trio, sonata form, exposition, development, cadenza. No new terms.

Parsed with `parseContent` + `validateContent` (backend/src/content/parse.ts) together with the current glossaries plus the group's one new row (Lydian mode): no problems; 7 / 5 / 9 stops.

---

## 6. Re-time needed

No listening was possible. Times come from the bar structure in the Humdrum score and the Spotify track lengths, assuming a steady tempo (I ≈ 5.3 s a bar; II ≈ 1 s a bar with all repeats; III ≈ 1.6 s a bar, no exposition repeat). Every stop is marked ≈.

| Mvt | Track (album `7z9kHQBUKHO4UQ5ol9D4Ia`) | Stops to re-time | Basis / least certain |
| --- | --- | --- | --- |
| I Adagio sostenuto | 4 (6:09) | 0:00, 0:21, 0:50, 2:25–3:35, 3:37, 5:12, 5:45 | Bars 1, 5, 10, 28–41, 42, 60, 66. The pedal-note passage range is a guess |
| II Allegretto | 5 (2:19) | 0:00, 0:16, 0:56, 1:44, 2:12 | Played-bar count 1, 17, 57, 105, 137; assumes all trio repeats |
| III Presto agitato | 6 (5:30) | 0:00, 0:21, 0:33, 1:08, 1:44, 2:42, 4:10, 4:58, 5:05 | Bars 1, 14, 21, 43, 66, 102, 158, 188, 189. **First check whether Kempff repeats the exposition** (see §1) |
