# Verification: Bach – Orchestral Suite No. 3 in D major, BWV 1068

Files: `content/drafts/en/bach-orchestral-suite-3.md`, `content/drafts/tr/bach-orchestral-suite-3.md`.
Checked on 2026-10-24. Batch October 2026 (second batch), group B. Composer `bach` already in `composers.yaml`.

**How the checks were done:** as in `pachelbel-canon.md` (Spotify embed `__NEXT_DATA__` from a Turkish network; MusicBrainz; Wikipedia/Commons/Wikidata APIs; generic `DailyClassical/1.0` User-Agent; IMSLP not reachable because of a bot check; web-search budget exhausted part-way, later checks by direct fetch only).

---

## Reference recording: The English Concert / Trevor Pinnock (Archiv Produktion, rec. 1978)

Why this one: Pinnock's first Archiv set of the suites is a classic period-instrument recording; the Spotify album has one track per movement (Gavotte I–II together) and is playable in Turkey.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4w707soWgWia8y0tHr9OE0 | "Bach: Orchestral Suites (Overtures) BWV 1067 & 1068 / Triple Concerto", 15 tracks; Suite No. 3 = tracks 8–12, credit "Johann Sebastian Bach, The English Concert, Trevor Pinnock"; album page "compilation · 1988", "℗ This Compilation ℗ 1988 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/4w707soWgWia8y0tHr9OE0 | OK |
| Playable in Turkey | – | tracks 8–12 `isPlayable: true` (all 15 true) | embed JSON | OK |
| Label / cat. no. | Archiv Produktion 427 112-2 | MusicBrainz "Orchestral Suites, BWV 1067 & 1068 / Triple Concerto, BWV 1044", Archiv Produktion 427 112-2, 1988-12-01; same track order and lengths (Suite 3: 365 440 / 289 826 / 198 800 / 71 840 / 179 093 ms) | https://musicbrainz.org/release/c9628154-8f98-41e4-a505-c08f13ade95d | OK |
| Recorded / venue | June 1978, Henry Wood Hall, London | MusicBrainz recording relations (Suites 2 and 3): Henry Wood Hall, 1978-06. Österreichische Mediathek record for the same performance (in the 423 492-2 box): "1978.06, London, Henry Wood Hall", production year 1979 | MusicBrainz as above; https://www.mediathek.at/atom/0698E37D-29B-0006B-00000BA8-069844E4/pool/bibl | OK |
| release_year / year | 1979 | Mediathek: production year 1979, copyright 1980. First LP number not traced | Mediathek | OK (secondary); LP catalogue number not given |
| Repeats in the Ouverture | "repeats only the slow opening section" | Gramophone review of Pinnock's later remake: "in the earlier one Pinnock observed only the repeat of the opening dotted section of each Ouverture proper" | https://gramophone.co.uk/review/bach-orchestral-suites-etc-0 (seen as a search excerpt) | OK |

### Durations (Spotify embed, album 4w707soWgWia8y0tHr9OE0)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Ouverture | 8 | 364 426 | 6:04 |
| II Air | 9 | 287 373 | 4:47 |
| III Gavotte I–II | 10 | 198 800 | 3:19 |
| IV Bourrée | 11 | 71 826 | 1:12 |
| V Gigue | 12 | 171 666 | 2:52 |
| Total | | 1 094 091 | 18 min (18:14) |

The same performance is also on the 100-track compilation https://open.spotify.com/album/1wf4620H7YI6unRWu9Nx9o (tracks 34–38, all playable); the 15-track album is used because it is a real disc.

## Also recommended: La Petite Bande / Sigiswald Kuijken (Accent, 2013)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7eiJgSbUxUjGUzXXxNFFHC — "Bach: The Orchestral Suites", 24 tracks; Suite No. 3 = tracks 8–12 (6:00 / 4:20 / 4:24 / 1:08 / 3:05), all `isPlayable: true`; "© 2013 Accent" | embed + album page | OK |
| Catalogue | Accent ACC 24279, released 2013-09-02 | https://musicbrainz.org/release/72d01dac-5e35-49e6-a40c-509d13203502 | OK |
| Recording date / venue | not found | – | left out of the yaml |

Rejected: Karl Richter / Münchener Bach-Orchester (Archiv 1960–61) — the remastered albums 4CxoeyfC7LKrScDlhlPGLH and 4VakHvIpdqTDw2WuMAVZX3 have `isPlayable: false` in Turkey; a 2019 Urania reissue (1NEAULCfSLiZtUtEnhIX9N) is playable but is a third-party label release.

---

## Painting: Nicolas Lancret, *La Camargo Dancing*, c. 1730

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Nicolas Lancret (1690–1743), *La Camargo Dancing*, c. 1730 | Commons file page (NGA data) | OK |
| Collection | National Gallery of Art, Washington, Andrew W. Mellon Collection, 1937.1.89 | https://purl.org/nga/collection/artobject/96 | OK |
| Medium / size | Oil on canvas, 76.2 × 106.7 cm | Commons {{Artwork}} (NGA data) | OK |
| Image | 4000 × 2857, landscape | https://commons.wikimedia.org/wiki/File:Nicolas_Lancret,_La_Camargo_Dancing,_c._1730,_NGA_96.jpg | OK |
| Rights | NGA Open Access, CC0; uploaded to Commons by the NGA project | Commons licence template {{CC0}} | OK |
| Subject | Marie Anne de Camargo (1710–1770), star dancer of the Paris Opéra (debut there 5 May 1726) | https://en.wikipedia.org/wiki/Marie_Camargo | OK |
| Not already used | Lancret not in `content/paintings.yaml` (Watteau is) | – | OK |

Why it fits: the same years (c. 1730) and the French theatrical dance that the suite's gavottes, bourrée and gigue stylise. The pairing note claims no link between Bach and Camargo.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Four suites, called *ouvertures* by Bach; not conceived as a set | https://en.wikipedia.org/wiki/Orchestral_suites_(Bach) | OK |
| Oldest source of No. 3: partly autograph set of parts c. 1730; Bach wrote first violin and continuo, C. P. E. Bach trumpets/oboes/timpani, J. L. Krebs second violin and viola | same | OK |
| Scoring: three trumpets, timpani, two oboes, strings, continuo; Air for strings and continuo only, the only movement where the others are silent | same; https://en.wikipedia.org/wiki/Air_on_the_G_String | OK |
| Bach directed the Collegium Musicum from 1729 (to 1741, with a break 1737–39); founded by Telemann (1702); free concerts at Zimmermann's coffee house, including works for orchestra | https://en.wikipedia.org/wiki/Zimmermannsches_Kaffeehaus | OK; "may well have been heard there" is hedged (no document ties BWV 1068 to a specific concert) |
| French overture: slow dotted section, fast fugal section, often a brief return of the slow music; from Lully's ballet overtures of the 1650s | https://en.wikipedia.org/wiki/French_overture | OK |
| Gavotte: French dance, popular at the court of Louis XIV, starts with a half-bar upbeat; bourrée: quicker, quarter-bar upbeat; gigue: lively, from the English jig, usually ends a suite | https://en.wikipedia.org/wiki/Gavotte ; https://en.wikipedia.org/wiki/Bourr%C3%A9e ; https://en.wikipedia.org/wiki/Gigue | OK |
| Wilhelmj 1871 arrangement in C major, melody on the G string; name "Air on the G String" | Air on the G String | OK |
| "A Whiter Shade of Pale" (1967) used a bar or two of the Air as its starting point, according to Gary Brooker | same | OK |
| Air: two halves of 6 and 12 bars, both repeated; walking bass with octave leaps | Score knowledge (IMSLP unreachable); bass description matches the Wikipedia article ("pronounced rhythmic drive in the bass") | **check by ear** that Pinnock takes both repeats (the 4:47 length fits: 36 bars at ≈ 8 s) |
| Solo-violin passages in the Ouverture's fast section | Apple Music Classical work note (search excerpt) | OK (secondary) |
| `year: 1730` | "c. 1730" source dating; composition date itself uncertain | OK as an approximation |

---

## Re-time

No stop was timed by ear. Bar plan from the score as remembered (IMSLP unreachable), so all section boundaries are approximate:
- **I Ouverture** (6:04): Grave ≈ 23 bars, repeated (Gramophone); Vivace ≈ 85 bars; closing slow bars ≈ 6. At an assumed Grave crotchet ≈ 66 (≈ 84 s per playing) and Vivace bar ≈ 1.9 s: repeat at ≈ 1:25, Vivace at ≈ 2:50, closing slow music at ≈ 5:35.
- **II Air** (4:47): 6 + 12 bars, both halves repeated = 36 bars → ≈ 8.0 s per bar: 0:00 / 0:48 / 1:36 / 3:12.
- **III Gavotte I–II** (3:19): assumed GI with repeats ≈ 56 bars, GII with repeats ≈ 48, GI da capo without repeats ≈ 28 → ≈ 1.5 s per bar: GII ≈ 1:20, da capo ≈ 2:35. If Pinnock repeats in the da capo, GII would be ≈ 1:10 and the return ≈ 2:10.
- **IV Bourrée** (1:12): two halves, both repeated; second half assumed 1.5–2 × the first → ≈ 0:18–0:24, given as ≈ 0:20.
- **V Gigue** (2:52): two halves, both repeated, second half assumed ≈ 1.5 × the first → 0:34 / 1:08 / 2:00.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Ouverture | 6:04 (364 426 ms) | 0:00, 1:25, 2:50, 3:30–4:45, 5:35 | 1:25 and 2:50 (Grave tempo assumed) |
| II Air | 4:47 (287 373 ms) | 0:00, 0:48, 1:36, 3:12, last 20 s | Reliable if both repeats are taken |
| III Gavotte I–II | 3:19 (198 800 ms) | 0:00, 1:20, 2:35 | 2:35 (depends on repeats in the da capo) |
| IV Bourrée | 1:12 (71 826 ms) | 0:00, 0:20, last 10 s | 0:20 |
| V Gigue | 2:52 (171 666 ms) | 0:00, 0:34, 1:08, 2:00, last 15 s | 0:34 and 2:00 (proportion of the halves assumed) |

## Open items

1. Confirm the Gavotte da capo repeats and the halves of the Bourrée and Gigue by ear or from a score.
2. Original LP catalogue number of the 1978/79 release not traced (the guide cites the 1988 CD that is on Spotify).
