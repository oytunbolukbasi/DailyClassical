# Verification: Ravel – String Quartet in F major, M. 35

Piece id `ravel-string-quartet`. Checked on 2026-10-24 (batch October 2026b, group J).
Files: `content/drafts/en/ravel-string-quartet.md`, `content/drafts/tr/ravel-string-quartet.md`.
Shared-file additions (paintings.yaml; no new glossary terms; no new composer): `content/research/ravel-string-quartet.shared.md`.

**How the checks were done:** Spotify public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` in ms, `isPlayable` from a Turkish network) and the album page's `og:restrictions:country:allowed` tags; Discogs public API; Deezer API (UPC/label); Wikipedia (EN, FR); Wikimedia Commons API; IMSLP score (typeset urtext edition, file #988114, read page by page for metres, rehearsal figures and bar numbers). Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Quartetto Italiano (Philips, 1965)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Quartetto Italiano | Spotify credits "Maurice Ravel, Quartetto Italiano" on tracks 1–4 | https://open.spotify.com/embed/album/6HmzLIkB5r7UXsaWQQqMFm | OK |
| Album | – | "Ravel: String Quartet, Violin Sonata & Piano Trio", compilation, ℗/© 1996 Universal International Music B.V., 11 tracks; 183 markets incl. TR and US. Tracks 5–7 Violin Sonata (Grumiaux, Hajdu), 8–11 Piano Trio (Beaux Arts Trio) | embed + https://open.spotify.com/album/6HmzLIkB5r7UXsaWQQqMFm | OK |
| Playable in Turkey | – | `isPlayable: true` on all 11 tracks (embed fetched from a Turkish network) | embed | OK |
| CD identity | 454 134-2 | Deezer album 6448591, same title and running order, label Decca Music Group, UPC 028945413426 (= 454 134-2), release 1996-04-22 | https://api.deezer.com/album/6448591 | OK (catalogue number derived from the UPC) |
| Recorded / venue | 11–14 August 1965, Théâtre de Vevey | "11–14 August 1965, Théâtre Vevey, Switzerland, studio; producer Vittorio Negri, engineer Tony Buczynski" | https://www.heinrichvontrotta.eu/Quartetto-Italiano/Dischi/Philips-835-361-Debussy-Ravel.html | SECONDARY (private Quartetto Italiano discography) |
| Original LP / release | Philips 835 361, 1967 | LP Philips 835 361 (Debussy + Ravel), dated ℗ 1967; first CD Philips 420 894-2 (1988). A Gramophone review mentions the earlier number SAL 3643 | same; https://www.classical-music.com/reviews/chamber/debussy-ravel-2 | SECONDARY |
| Other Spotify albums (not used) | – | `2dAIIiTXnjVXjjrY2omQsR` (Warner 2021, Ravel + Stravinsky): an earlier Quartetto Italiano recording (Columbia/EMI), not the Philips one. `7C9TBnBue0PV98GiLZMlqI`: RIAS radio recordings 1951–63. `51g1wCSLxa5ciBDBhcj48H`: Budapest Quartet | embeds | Noted |

### Durations (Spotify embed, album 6HmzLIkB5r7UXsaWQQqMFm)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Allegro moderato, très doux | 515426 | 8:35 |
| 2 | II. Assez vif, très rythmé | 395000 | 6:35 |
| 3 | III. Très lent | 547000 | 9:07 |
| 4 | IV. Vif et agité | 328000 | 5:28 |
| | Total | 1785426 | 29:45 → `duration_min: 30` |

The discography gives the Philips CD timings 8:33 / 6:32 / 9:03 / 5:30 (same performance; the digital tracks include a little more silence).

## 2. Also recommended: Quatuor Ébène (Virgin Classics, 2008)

| Field | Verified value | Source URL | Status |
| --- | --- | --- | --- |
| Album | "Debussy, Fauré & Ravel: String Quartets", ℗ 2008 Parlophone/Warner Classics (Virgin/Erato), 11 tracks, Ravel = tracks 8–11 (8:50 / 6:29 / 9:47 / 4:40), all `isPlayable: true`; 185 markets incl. TR and US | https://open.spotify.com/embed/album/2ZzP0NJ3dB7SNYT7zhO5pn | OK |
| Catalogue / recorded | Virgin Classics 519045 2; "Recording: Ferme de Villefavard en Limousin (France), 4.–9. 02. 2008" | https://api.discogs.com/releases/3730645 | OK |

## 3. Painting: Henri-Edmond Cross, *The Evening Air* (*L'Air du soir*), c. 1893

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Object | Oil on canvas, 116 × 165 cm, Musée d'Orsay, Paris, RF 1976 81 (gift of Ginette Signac, 1976) | https://commons.wikimedia.org/wiki/File:Henri-Edmond_Cross_-_The_Evening_Air_-_Google_Art_Project.jpg ; https://www.wikidata.org/wiki/Q17492552 ; https://artsandculture.google.com/asset/9AFV5fBXEc99-g | OK |
| Image | Google Art Project scan, 7959 × 5610 | Commons API | OK |
| Rights | Cross died 1910: public domain everywhere. Commons tag PD-Art / PD-old-100-1923. Faithful reproduction of a 2-D PD work | same | OK |
| Date | Google Arts & Culture: "circa 1893" (Wikidata 1893). Orsay sometimes gives 1893–94 | same | OK, `c. 1893` |
| Pairing | Neo-Impressionist technique (small separate touches of pure colour) applied to a calm, classically composed idyll; the guide draws the parallel with Ravel's "return to classic standards" (Orenstein, quoted on Wikipedia). No historical link between Cross and Ravel is claimed | https://en.wikipedia.org/wiki/String_Quartet_(Ravel) | – |

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed December 1902 – April 1903 in Paris (19 boulevard Pereire); manuscript dated "décembre 1902" (end of II) and "avril 1903" (end of IV) | https://fr.wikipedia.org/wiki/Quatuor_à_cordes_de_Ravel | OK |
| Ravel was 28 when he completed it (born 7 March 1875) | https://en.wikipedia.org/wiki/String_Quartet_(Ravel) | OK |
| Dedication "à mon cher maître Gabriel Fauré"; Fauré was then his composition teacher | IMSLP score p. 1 (file #988114); FR Wikipedia | OK |
| Premiere 5 March 1904, Heymann Quartet, Société nationale de musique (FR Wikipedia adds: Schola Cantorum, 317th concert) | EN + FR Wikipedia | OK |
| Fauré "was not greatly taken with the piece" | EN Wikipedia | OK |
| Debussy wrote to Ravel on 4 March 1904, the eve of the premiere, ending "ne touchez à rien et tout ira bien" (the letter is about not making the players quieter). The guide says only that he urged Ravel to change nothing | FR Wikipedia | OK (wording kept cautious; the more famous version "in the name of the gods of music … do not touch a single note" is not used) |
| Structure modelled on Debussy's quartet of 1893; scherzo second, opening pizzicato as in Debussy | EN Wikipedia | OK |
| Lalo: "an incredible resemblance to the music of M. Debussy"; Marnold: "one of the masters of tomorrow" | EN Wikipedia | OK |
| "A standard work in the chamber music repertory" (Orenstein) | EN Wikipedia | OK |
| I: sonata form, two themes; Theme 2 played by first violin and viola two octaves apart; in the recapitulation the upper three parts are identical and only the cello is raised a minor third (D minor → F major); ends very quietly | EN Wikipedia; checked in the IMSLP score (Theme 2 at fig. 3, bar ≈ 45; return at fig. 13, bar ≈ 174) | OK |
| I metre 4/4, ♩ = 120, *très doux* | IMSLP score p. 1 | OK |
| II: 6/8 and 3/4 written together, ♩. = 92 (dotted value hard to read at scan resolution); opening all pizzicato; Aeolian; gamelan (Orenstein; heard in Paris 1889) or Spanish echoes; central slow section led by the viola; shortened reprise | EN Wikipedia; IMSLP score | OK |
| II middle section marked *Lent*, muted ("mettez la sourdine") | IMSLP score, fig. 22 | OK |
| III: many tempo changes; viola introduces the first theme, first violin repeats it; thematic links with I; consecutive fifths; begins and ends in G-flat major | EN Wikipedia; IMSLP score (4/4 with 3/4 bars, ♩ = 44, muted) | OK |
| IV: back to F major; loosely a rondo; time signatures 5/8, 5/4, 3/4; tremolandi; a reference to the first subject of the opening movement; ends vigorously | EN Wikipedia; IMSLP score | OK |
| Coupled on the original LP with Debussy's quartet | heinrichvontrotta.eu (above) | SECONDARY |

## 5. Re-time (every stop is an estimate)

Method: bar positions read from the IMSLP typeset urtext (file #988114) × the track's average tempo, corrected for marked tempo changes. Movement I: 213 bars in 8:35 → ≈ 2.3 s per bar for bars 1–200 (QI play well under the marked ♩ = 120), slower coda. II: ≈ 200 bars; fast sections ≈ 1.35 s per bar, the *Lent* (figs 22–25, bars ≈ 89–130) ≈ 4 s per bar. III: ≈ 127 bars, tempo marks ♩ = 44 / 84 / 60 / 72 scaled to 9:07. IV: ≈ 278 bars, 5/8 passages ≈ 0.75 s per bar, 5/4 passages ≈ 1.6 s per bar.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 8:35 | 0:00, 0:50 (fig. 1, b. 24), 1:20 (accel./Allegro, b. 37–43), 1:45 (fig. 3, Theme 2), 2:40 (fig. 5, b. 69), 4:30–4:50 (figs 9, b. 117–128), 5:00 (fig. 10, b. 129), 6:50 (fig. 13, b. ≈ 174), Last 45 seconds (b. 201 *un peu plus lent*) | 2:40: where the development "begins" is a judgement (fig. 4 at b. ≈ 55 is also possible); 4:30–4:50 |
| II | 6:35 | 0:00, 0:15 (fig. 15), 1:05 (fig. 19), 2:00 (fig. 22 *Lent*), 2:45–4:30, 5:00 (fig. 26 *1er Tempo*), Last 15 seconds | 2:00 and 5:00 depend on how the *Lent* is paced; ± 20 s |
| III | 9:07 | 0:00, 0:30, 1:00 (fig. 1), 3:30 (fig. 4 *Modéré*), 4:25–5:10 (fig. 6 *Pas trop lent*, *Modérément animé*), 5:10 (fig. 8 *Modéré*, ff), 5:55 (*1er Tempo*), Last 45 seconds (*Très lent*) | Everything after 3:30 (± 30 s): tempo changes are frequent |
| IV | 5:28 | 0:00, 0:35 (fig. 14), 1:45 (*a Tempo, sur la touche*, b. ≈ 88), 2:20 (fig. 17), 3:20 (fig. 21, ff *appassionato*), 4:05 (fig. 23), Last 15 seconds (fig. 28) | 1:45 (the recall of Theme 1; the exact bar where it is clearest was not confirmed) |
