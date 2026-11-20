# Verification: Borodin – Prince Igor: Polovtsian Dances

Piece id `borodin-polovtsian-dances`. Checked on 2026-11-20 (batch 2026-11b, group D).
Files: `content/drafts/en/borodin-polovtsian-dances.md`, `content/drafts/tr/borodin-polovtsian-dances.md`.
Shared-file additions (paintings.yaml, re-time rows; no new glossary terms): `content/research/borodin-polovtsian-dances.shared.md`.

**How the checks were done.** As in `content/research/tchaikovsky-1812-overture.md`: Spotify album ids (Spotify web search in the built-in browser; the Beecham album is already the catalogue's Scheherazade reference); embed `__NEXT_DATA__` from a Turkish network; ℗/© from the album page; Discogs API; Wikipedia (MediaWiki API); Commons and Wikidata. Status key: OK / SECONDARY / UNVERIFIED. No personal data sent.

---

## 1. Reference recording: Beecham / Royal Philharmonic Orchestra / Beecham Choral Society (EMI, 1956)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Album | "Rimsky-Korsakov: Scheherazade - Borodin: Polovstian Dances from Prince Igor" (sic), 11 tracks, all `isPlayable: true`; release date 1999-02-01; ℗/© "A Warner Classics release, 1999 Parlophone Records Limited". Tracks 5–11 = the Polovtsian Dances in seven parts | https://open.spotify.com/embed/album/12gqWnkhIOszwytW6jKcMY | OK |
| Credits | Tracks 5, 7–11: Royal Philharmonic Orchestra, Sir Thomas Beecham, Beecham Choral Society; track 6 (Wild Dance of the Men): orchestra and conductor only | embed | OK |
| CD | EMI Classics 7243 5 66983 2 1 (5 66983 2), 1999; "Tracks 5 to 11 recorded: 10.XI.1956, No.1 Studio, Abbey Road, London / ℗ 1974"; Polovtsian Dances 12:15; producer Lawrance Collingwood (tracks 1–4 Victor Olof), balance engineer Christopher Parker | https://api.discogs.com/releases/5977792 | OK |
| First issue | Not traced; `release_year: 1974` follows the ℗ line, with a yaml comment | – | UNVERIFIED |
| Language of the chorus | Not checked (Beecham's English choir may sing in English or Russian); the guide quotes the words only in translation, without saying which language is sung | – | UNVERIFIED |
| Why this one | A classic, widely reissued recording (EMI "Great Recordings of the Century"); the album divides the dances into exactly seven tracks (the brief's limit), all playable | – | – |

### Durations (Spotify embed)

| Mvt | Track | Title on Spotify | ms | Time |
| --- | --- | --- | --- | --- |
| I | 5 | Pt. 1, Introduction - Gliding Dance of the Maidens | 154773 | 2:35 |
| II | 6 | Pt. 2, Wild Dance of the Men | 76066 | 1:16 |
| III | 7 | Pt. 3, General Dance | 137600 | 2:18 |
| IV | 8 | Pt. 4, Dance of the Boys | 89093 | 1:29 |
| V | 9 | Pt. 5, Gliding Dance of The Maidens | 93266 | 1:33 |
| VI | 10 | Pt. 6, Dance of The Boys | 93466 | 1:33 |
| VII | 11 | Pt. 7, General Dance | 91373 | 1:31 |
| | | Total | 735637 | 12:16 → `duration_min: 12` |

## 2. Also recommended: Shaw / Atlanta Symphony Orchestra (Telarc, 1978)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Album | Spotify `2B98DCpQulWq5m8Vt9iGki`, 8 tracks, all playable; track 8 "Prince Igor: Polovetsian Dances" 11:46 (one track); credits Robert Shaw, Atlanta Symphony Orchestra | https://open.spotify.com/embed/album/2B98DCpQulWq5m8Vt9iGki | OK |
| Recording | Symphony Hall, Atlanta Memorial Arts Center, 19 and 20 June 1978; LP DG-10039, CD-80039 (already verified for the catalogue's Firebird guide) | `content/research/stravinsky-firebird-suite.md`; https://api.discogs.com/releases/27327129 | OK |
| Chorus | Discogs credits list no chorus; the yaml names none | same | Noted |

## 3. Painting: Viktor Vasnetsov, *After Prince Igor's Battle with the Polovtsy*, 1880

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Object | Oil on canvas, 205 × 390 cm, State Tretyakov Gallery, Moscow; Russian title «После побоища Игоря Святославича с половцами» | https://www.wikidata.org/wiki/Q11819873 | OK |
| Image | File:1880_Vasnetsov_Nach_der_Schlacht_von_Igor_anagoria.JPG, 3308 × 1776, gallery photo by User:anagoria, {{PD-Art|PD-old-auto-expired|deathyear=1926}} | https://commons.wikimedia.org/wiki/File:1880_Vasnetsov_Nach_der_Schlacht_von_Igor_anagoria.JPG | OK (check the crop before merging; Wikidata's own image `Igorsvyat.jpg` is 2478 × 1300) |
| Rights | Vasnetsov died 1926: public domain by age | – | OK |
| Artist already in catalogue | Vasnetsov's *Ivan Tsarevich on the Grey Wolf* is the Firebird painting; this is a different work and the clearest match for the opera's subject (the brief allows it in that case) | `content/paintings.yaml` | Noted |
| Pairing | Same source: *The Lay of Igor's Campaign*; 1880, the years Borodin was composing the opera | Wikipedia (Prince Igor); Wikidata | OK |

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Libretto adapted by Borodin from *The Lay of Igor's Host/Campaign* (Igor Svyatoslavich's campaign against the Polovtsy/Cumans, 1185) | https://en.wikipedia.org/wiki/Prince_Igor | OK |
| Stasov suggested the subject and sent a scenario on 30 April 1869 | same | OK |
| Borodin's primary occupation was chemistry; worked on the opera off and on for almost 18 years; died suddenly 1887; completed and orchestrated by Rimsky-Korsakov and Glazunov | same | OK |
| Premiere 4 November (23 October O.S.) 1890, Mariinsky Theatre, St Petersburg | same | OK (guide: "first staged in St Petersburg in 1890") |
| Act 2 (Act 1 in some versions); Konchak treats Igor as an honoured guest, summons the slaves to entertain them; the Polovtsy sing of Konchak's glory | https://en.wikipedia.org/wiki/Polovtsian_Dances ; Prince Igor (synopsis) | OK |
| 1879 concert; Rimsky-Korsakov rehearsing the chorus; orchestrated in one evening by Borodin, Lyadov and Rimsky-Korsakov, in pencil, pages coated with liquid gelatine and hung like washing | Prince Igor (Rimsky-Korsakov's memoir quoted) | OK ("in a single night": memoir "sat at work until late at night") |
| Sections, tempos, keys and metres of No. 17 (Introduction Andantino A major; Gliding Dance Andantino F-sharp minor; Wild Dance Allegro vivo F major; General Dance Allegro 3/4 D major; Dance of the Boys Presto 6/8 D minor; Gliding Dance reprise Moderato alla breve A major, soon combined with the boys' dance; Boys reprise Presto D minor; General Dance Allegro con spirito 4/4 A major, themes c′ + a″) | Polovtsian Dances (Analysis) | OK |
| Oboe and English horn solos in the Gliding Dance; clarinet solo in the Wild Dance | same | OK |
| Chorus words: "Fly away on the wings of the wind" (Улетай на крыльях ветра); praise of the Khan | Prince Igor (numbers list); standard libretto | OK / SECONDARY (praise wording paraphrased) |
| *Kismet* (1953): "Stranger in Paradise" adapted from the Gliding Dance of the Maidens | Polovtsian Dances (In popular culture) | OK |

## 5. Re-time (every stop is an estimate)

Reference: Beecham / RPO, Spotify `12gqWnkhIOszwytW6jKcMY`, tracks 5–11. Not heard. Placed from the section order (Wikipedia's analysis), the Spotify part titles and the track lengths.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Introduction – Gliding Dance (track 5) | 2:35 | 0:00, 0:30, 0:55, 1:20, Last 30 seconds | Oboe entry ≈ 0:30 and the chorus ≈ 1:20 (± 20 s) |
| II Wild Dance of the Men (track 6) | 1:16 | 0:00, 0:20, Last 15 seconds | Full orchestra ≈ 0:20 |
| III General Dance (track 7) | 2:18 | 0:00, 0:10, 1:10, Last 20 seconds | The repeat ≈ 1:10 |
| IV Dance of the Boys (track 8) | 1:29 | 0:00, 0:45, Last 10 seconds | Men's second dance ≈ 0:45 |
| V Gliding Dance (track 9) | 1:33 | 0:00, 0:40, Last 20 seconds | Boys' figures under the melody ≈ 0:40 |
| VI Dance of the Boys (track 10) | 1:33 | 0:00, 0:40, Last 10 seconds | Chorus entry ≈ 0:40 |
| VII General Dance (track 11) | 1:31 | 0:00, 0:20, Last 20 seconds | Return of the men's tune ≈ 0:20 |
