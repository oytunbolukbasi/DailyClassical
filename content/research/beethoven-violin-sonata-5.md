# Verification: Beethoven – Violin Sonata No. 5 in F major, Op. 24, "Spring"

Piece id `beethoven-violin-sonata-5`. Checked on 2026-11-20 (batch 2026-11b, group B).
Files: `content/drafts/en/beethoven-violin-sonata-5.md`, `content/drafts/tr/beethoven-violin-sonata-5.md`.
Shared-file additions (paintings.yaml only; no new glossary terms): `content/research/beethoven-violin-sonata-5.shared.md`.

**How the checks were done:** Spotify embed `__NEXT_DATA__` fetched with curl from a Turkish network (2026-11-20); the Deutsche Grammophon product page (links the Spotify album; its embedded track metadata gives recording date and place); the Oistrakh album as verified for `beethoven-violin-sonata-9`; Wikipedia; programme notes by Parlance Chamber Concerts, Nigel Simeone (Music in the Round), the Hollywood Bowl and Apple Music Classical; Wikimedia Commons. No machine-readable score was available (Mutopia has Op. 30 No. 2 and Op. 47, not Op. 24).

## 1. Reference recording: Gidon Kremer, Martha Argerich (DG, 1987)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Album | `3PgF9XCUloSMkDKLqbGiun` | *Beethoven: Violin Sonatas Nos. 4 & 5 "Spring"*, 7 tracks, all `isPlayable: true`; Op. 24 = tracks 4–7; credits "Gidon Kremer, Martha Argerich" | https://open.spotify.com/embed/album/3PgF9XCUloSMkDKLqbGiun | VERIFIED |
| Label / catalogue | DG 419 787-2 (with Sonata No. 4) | DG product page "Violinsonaten op. 23 + 24", UPC 00028941978721 (= 419 787-2), release 4 November 1987; the page links this Spotify album | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-violinsonaten-op-2324-kremer-8151 | VERIFIED |
| Recorded / venue | March 1987, Jesus-Christus-Kirche, Berlin | DG track metadata: recordingDate 1987-03-13 (same day on all 7 tracks, so possibly a session placeholder: the guide says only "March 1987"), recordingLocation "Jesus-Christus-Kirche", Germany, studio; firstReleaseYear 1987 | same | VERIFIED |
| Complete cycle with DG | In this recording | DG product pages: Op. 23/24 (1987), Op. 30 (1994), "Die 10 Violinsonaten" box (1995) | DG catalogue (search results) | OK |
| Exposition repeat in I | In this recording | Inferred: 9:38 here, 10:13 Oistrakh; ≈ 246 bars without repeat would need a very slow tempo to fill 9:38 | – | INFERRED |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 4 | 1. Allegro | 578250 | 9:38 | true |
| 5 | 2. Adagio molto espressivo | 360500 | 6:00 | true |
| 6 | 3. Scherzo (Allegro molto) | 79173 | 1:19 | true |
| 7 | 4. Rondo (Allegro ma non troppo) | 392750 | 6:32 | true |
| | Total | 1410673 | 23:30 → `duration_min: 24` | |

## 2. Also recommended: David Oistrakh, Lev Oborin (Philips, 1962)

Same album and verification as in `content/research/beethoven-violin-sonata-9.md` (§2): *Beethoven: The Violin Sonatas*, `3nOccw5YvokOK6HCBOgKQU`; Philips, recorded in Paris, 1962 (Esoteric reissue notes); original LP number not recorded. Re-fetched 2026-11-20: Op. 24 = tracks 13–16, 10:12 / 6:03 / 1:18 / 6:57 (612560 / 363893 / 78160 / 417866 ms), all `isPlayable: true`. Status: VERIFIED.

## 3. Painting: Sandro Botticelli, *Primavera*, c. 1480

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Sandro Botticelli (c. 1445–1510), *Primavera*; Commons gives "between 1480 and 1485"; dates in the literature range from the late 1470s to the early 1480s. Guide: "c. 1480" | https://en.wikipedia.org/wiki/Primavera_(Botticelli) | OK |
| Collection | Gallerie degli Uffizi, Florence; tempera on panel | same | OK |
| Image | `File:Sandro_Botticelli_-_La_Primavera_-_Google_Art_Project.jpg`, 5084 × 3377, {{PD-Art\|PD-old-100-expired}} | https://commons.wikimedia.org/wiki/File:Sandro_Botticelli_-_La_Primavera_-_Google_Art_Project.jpg | OK |
| Rights | Public domain by age; faithful photo, no new right (EU DSM art. 14). Caveat: Italy's Cultural Heritage Code (arts. 107–108) claims fees for commercial reproductions of works in state museums; this is not copyright, and the catalogue already uses an Italian state-museum work (Raphael, *St Cecilia*, Bologna), but the product owner may prefer a non-Italian alternative (both alternatives in the shared note are in Paris or New York) | – | OK, with caveat |
| Not reused | No Botticelli in `content/paintings.yaml` | – | OK |

**Pairing.** The link is the nickname only: the music is warm and relaxed, and "Spring" was attached to it after Beethoven's death (Wikipedia). The guide's pairing note says so. Flora scattering flowers and the orange grove are the standard description of the painting.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Completed 1801, first published 1801; "Spring" nickname given after Beethoven's death; dedicated to Count Moritz von Fries, also dedicatee of Op. 23, Op. 29 and the Seventh Symphony | https://en.wikipedia.org/wiki/Violin_Sonata_No._5_(Beethoven) | OK |
| Intended as companion to No. 4, published separately with different opus numbers, reason unknown | Wikipedia ("The reason for the separation is unknown"). Parlance gives a printer's-error story (differently sized violin parts): not used | OK (cautious wording) |
| Fries a banker; Beethoven a regular guest | Music in the Round note (Nigel Simeone) https://musicintheround.co.uk/?p=3869 | OK |
| First of his violin sonatas in four movements | Simeone | OK |
| 1801: Beethoven first wrote to friends about his failing hearing (letters to Wegeler and Amenda, June–July 1801) | https://en.wikipedia.org/wiki/Ludwig_van_Beethoven | OK |
| Title of the time "sonata for piano and violin" | Beethoven-Haus work entry ("Sonata for piano and violin") https://www.beethoven.de/en/work/view/ag9iZWV0aG92ZW4tdml1cjNyEQsSBHdvcmsYgICAnMbgkQkM | OK |
| I: violin opens with a long melody, then the piano takes it; themes and accompaniment swapped throughout; second theme with "dramatic stress" | Apple Music Classical note; Parlance https://www.parlancechamberconcerts.org/individual-program-notes/ ; Hollywood Bowl https://www.hollywoodbowl.com/musicdb/pieces/4603/violin-sonata-no-5-in-f-major-op-24-spring | OK. Second theme in C major: standard (dominant key), not from a cited note |
| II: unhurried theme returning varied with florid ornaments; oscillations near the close heard as birdsong | Parlance; Simeone ("a deeply felt song without words") | OK. Piano first and the minor-key middle section: from knowledge of the score, UNVERIFIED |
| III: very brief; violin at rhythmic odds with the piano; trio of busy scales; short return; Schumann's "Soldier's March" (*Album for the Young*) | Parlance; Simeone ("one of Beethoven's shortest sonata movements") | OK. "A beat behind": the standard description of this joke; Parlance says "at rhythmic odds" |
| IV: lyrical refrain alternating with episodes; refrain returns in a remote key and "elegantly rights itself"; galloping variation near the end; "most gentle and unhurried" | Parlance; Simeone | OK. Piano first, minor second episode and 2/2 metre: from knowledge of the score, UNVERIFIED |

## 5. Re-time (all stops are ≈; not heard)

Method: I ≈ 246 bars (exposition 1–86 repeated, development 87–123, recapitulation 124, coda ≈ 200) at ≈ 1.74 s a bar; II, III and IV placed by typical proportions of their forms over the exact track lengths. Bar numbers from memory of the score, not checked bar by bar.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro | 9:38 | 0:00, 0:18, 1:00, 2:30, 5:00, 6:05, 8:15 | Second theme ≈ 1:00 and coda ≈ 8:15 (± 20 s) |
| II Adagio molto espressivo | 6:00 | 0:00, 0:45, 1:50, 3:00, Last minute | Middle section ≈ 1:50 and return ≈ 3:00 (± 30 s) |
| III Scherzo: Allegro molto | 1:19 | 0:00, 0:35, 0:58, Last 10 seconds | Trio ≈ 0:35 (± 5 s) |
| IV Rondo: Allegro ma non troppo | 6:32 | 0:00, 0:35, 1:25, 2:00, 3:20, 4:50, Last 20 seconds | Remote-key return ≈ 3:20 and galloping variation ≈ 4:50 (± 30 s) |
