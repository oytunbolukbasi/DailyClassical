# Verification: Chopin – Piano Concerto No. 1 in E minor, Op. 11

Piece id `chopin-piano-concerto-1`. Checked on 2026-10-10 (batch 2026-10, group F).
Files: `content/en/pieces/chopin-piano-concerto-1.md`, `content/tr/pieces/chopin-piano-concerto-1.md`.
Shared-file additions (paintings.yaml, two new glossary terms, new composer `chopin`): `content/research/chopin-piano-concerto-1.shared.md`.

**How the checks were done:** as in `schubert-piano-quintet-trout.md`. Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Argerich / Abbado / London Symphony Orchestra (DG, 1968)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Martha Argerich / Claudio Abbado / London Symphony Orchestra | Spotify credits; Discogs | https://open.spotify.com/embed/album/4hQ5UonmIDouhBBEdRAwgC ; https://www.discogs.com/release/7377575 | OK |
| Label / catalogue | Deutsche Grammophon; 139 383 (LP); 449 719-2 (CD, The Originals) | LP 139 383 SLPM, Germany 1968 (master 204162, main release 7377575): producer Karl Faust, recording supervisor Rainer Brock, engineer Heinz Wildhagen. CD 449 719-2 (The Originals), 1996, ℗ 1968 Polydor. (That CD's Discogs notes also say "Originally released as 2530 516", which contradicts the LP; 139 383 is used) | https://www.discogs.com/release/7377575 ; https://www.discogs.com/release/1946607 | OK |
| Recorded | February 1968 | CD 449 719-2: "Recorded: February 1968, Walthamstow Town Hall, London" | https://www.discogs.com/release/1946607 | OK |
| Venue | Walthamstow Town Hall, London | same | same | OK |
| Release year | 1968 | LP 1968; Spotify "1968", ℗ 1968 DG | same; album page | OK |
| Spotify | 4hQ5UonmIDouhBBEdRAwgC | "Chopin: Piano Concerto No.1 / Liszt: Piano Concerto No.1", Martha Argerich, album, 1968, 6 tracks; ℗ 1968, © 1996 DG. Tracks 1–3 Chopin, 4–6 Liszt | embed + album page | VERIFIED |

### Durations (Spotify embed)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Allegro maestoso | 1139000 | 18:59 |
| 2 | II. Romance. Larghetto | 598000 | 9:58 |
| 3 | III. Rondo. Vivace | 544000 | 9:04 |
| | Total | 2281000 | 38:01 → `duration_min: 38` |

HighResAudio (search summary) lists 18:54 / 10:04 / 9:08 for its edition; the guide uses the Spotify times.

"Argerich was 26": born 5 June 1941 (Wikipedia); recorded February 1968. "Won the Chopin competition in 1965": https://en.wikipedia.org/wiki/Martha_Argerich. OK.

Whether this recording plays the full orchestral introduction (some older performances cut it) was not checked; the piano entry at ≈ 3:45 assumes the full ritornello (bars 1–138). If the piano enters much earlier, the introduction is cut: re-time I accordingly.

## 2. Also recommended: Zimerman / Polish Festival Orchestra (DG, 1999)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Krystian Zimerman, Polish Festival Orchestra | Spotify credits (no conductor credited) | OK |
| Conductor | Zimerman directed from the piano (orchestra formed for this project) | general knowledge, not fetched | SECONDARY; the yaml has no conductor field and a comment |
| Label / year | DG; ℗ 1999 Deutsche Grammophon | album page | OK |
| Catalogue / recorded / venue | null; not checked (search budget) | – | UNVERIFIED |
| Spotify | 0XuGv9tnHvdEDMtOdAmpe1: "Chopin: Piano Concertos Nos.1 & 2", 1999, 6 tracks; No. 1 = 23:24 / 12:35 / 9:53 | embed | VERIFIED |

## 3. Painting: Wincenty Kasprzycki, *View of Morysinek* (*Widok Morysinka*), 1834

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Wincenty Kasprzycki (1802–1849), Warsaw painter of vedute of Warsaw, Wilanów, Natolin, Morysin | https://en.wikipedia.org/wiki/Wincenty_Kasprzycki (search summary) | OK |
| Date | 1834 (Commons file description) | https://commons.wikimedia.org/wiki/File:Kasprzycki_View_of_Morysinek_near_Wilanow.jpg | SECONDARY (a libera.art listing also gives 1834, National Museum in Warsaw) |
| Collection | National Museum in Warsaw. The museum's own scan is on Commons as File:Wincenty Kasprzycki - View of Morysinek in Wilanów - MP 299 - National Museum in Warsaw.jpg, which implies inv. **MP 299** (the adjacent MP 298 is Kasprzycki's *Fine Arts Exhibition*, confirmed on Wikidata) | Commons | Collection OK; inventory number from the file name only, UNVERIFIED |
| Image | First choice: File:Kasprzycki View of Morysinek near Wilanow.jpg, 4620 × 3264, own photo, {{PD-Art\|PD-old-auto-expired\|deathyear=1849}}. **Shows a thin strip of gilt frame on all sides: crop before `npm run images`.** The museum's scan (2500 × 1702) shows even more frame | Commons | OK |
| Pairing | Morysinek (Morysin) is a park by the Wilanów palace on the southern edge of Warsaw. Painted 1834, about four years after Chopin left (Nov 1830). The link is place and mood (the Romance), not a direct historical connection | – | – |

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| Written 1830, Chopin aged 20; composed after the premiere of the concerto later published as No. 2; numbered first because published first | https://en.wikipedia.org/wiki/Piano_Concerto_No._1_(Chopin) | OK |
| Premiere 11 October 1830, National Theatre, Warsaw, Chopin soloist (Carlo Evasio Soliva conducting), a farewell concert; *Kurier Warszawski*: about 700 people | same. The article gives 11 October in one place and 12 October in another; 11 October is the usual date and the one the guide uses | OK, flagged |
| Left Warsaw 2 November 1830, never returned; less than a month before the November Uprising (began 29 Nov 1830) | https://en.wikipedia.org/wiki/Fr%C3%A9d%C3%A9ric_Chopin | OK ("three weeks later" = 22 days) |
| Orchestra deliberately subordinate to the piano; orchestration criticised as dry (Huneker) | concerto article | OK (the guide says only that it frames and supports) |
| Letter to Tytus Woyciechowski on the Romance: "a kind of reverie in the moonlight on a beautiful spring evening" (quoted, under 15 words) | concerto article | OK |
| Finale uses krakowiak rhythms, a syncopated duple-time dance from Kraków | same | OK |
| I: three themes introduced by the orchestra; piano enters at bar 139 with Theme 1, lyrical second theme at bar 155; exposition moves to the parallel major (E major, bar 222) instead of the expected relative major; Theme 3 returns in G major in the recapitulation (bar 573); coda in E minor | same | OK |
| II: Romance – Larghetto, E major; muted strings | concerto article (key); *con sordino* strings from the score | Key OK; muted strings SECONDARY (score) |
| II: second theme moves to the dominant | concerto article | OK (the guide says "a brighter key") |
| III: Rondo – Vivace, E major; 2/4 | article (key); metre from the score | key OK; metre SECONDARY |
| Unison octave second theme in III | score / standard description | SECONDARY |
| Metres I 3/4, II 4/4 (article gives none) | score | SECONDARY |

## 5. Re-time needed (every stop is an estimate)

Stops in I were scaled from the bar numbers in the Wikipedia analysis (139, 155, 222, 573) to the track length, assuming a steady tempo and the full orchestral introduction.

| Mvt | Track length | Stops to re-time | Least certain |
| --- | --- | --- | --- |
| I Allegro maestoso | 18:59 | 0:00, 1:15, 3:45, 4:30, 6:15, 7:30–10:00, 10:15, 13:20, 15:45, Near the end | Piano entry (≈ 3:45; depends on the introduction being uncut), the tutti/development (≈ 10:15), recapitulation (≈ 13:20) |
| II Romance | 9:58 | 0:00, 0:45, 2:45, 4:30, 6:15, 8:00, Last minute | Middle section (≈ 4:30) and return (≈ 6:15) |
| III Rondo | 9:04 | 0:00, 0:25, 1:20, 2:00, 3:15, 4:15, 5:30, 6:30, 7:45, Near the end | All episode boundaries; whether the octave tune is at ≈ 2:00 |
