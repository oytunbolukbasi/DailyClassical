# Verification: Haydn – Cello Concerto No. 1 in C major, Hob. VIIb:1

Files: `content/drafts/en/haydn-cello-concerto-1.md`, `content/drafts/tr/haydn-cello-concerto-1.md`.
Checked on 2026-10-24. Batch October 2026 (second batch), group B. Composer `haydn` already in `composers.yaml`.

**How the checks were done:** as in `pachelbel-canon.md` (Spotify embed `__NEXT_DATA__` from a Turkish network; MusicBrainz; Wikipedia/Commons/Wikidata APIs; generic `DailyClassical/1.0` User-Agent; IMSLP unreachable behind a bot check; web-search budget exhausted part-way).

---

## Reference recording: Mstislav Rostropovich / Academy of St Martin in the Fields (EMI, rec. 1975)

Why this one: a classic recording by the cellist most associated with the concerto's revival in the West, with cadenzas by Britten; one track per movement, playable in Turkey.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7CGSB0LAToUr8S7in0BCpF | "Haydn: Cello Concertos Nos 1 & 2", 6 tracks; C major = tracks 1–3, titled "(Cadenza by Britten)" for I and II; credit "Joseph Haydn, Mstislav Rostropovich, Academy of St. Martin in the Fields"; "album · 1976", "℗ 1976 Parlophone Records Limited. Remastered (p) 2017" | https://open.spotify.com/embed/album/7CGSB0LAToUr8S7in0BCpF | OK |
| Playable in Turkey | – | all 6 tracks `isPlayable: true` | embed JSON | OK |
| Original issue | HMV ASD 3255 | Europadisc listing of the 2017 vinyl reissue: "originally issued on HMV ASD 3255" (search excerpt) | https://www.europadisc.co.uk/classical/240219/Haydn_-_Cello_Concertos_1_&_2_(Vinyl_LP).htm | OK (secondary) |
| Recorded / venue | 15–16 November 1975, Abbey Road Studio 1 | MusicBrainz, EMI Classics 5 67263 2 (2000 reissue): Abbey Road Studios: Studio 1, 1975-11-15 to 1975-11-16; Europadisc gives the same dates | https://musicbrainz.org/release/8ad9d8f0-ac45-45d1-ac96-615da83282fa | OK. A DVD review (audaud) places a filmed version on 17–19 November at Henry Wood Hall: a different (video) production |
| Conductor | Rostropovich directs | Europadisc: Rostropovich as soloist and conductor; Spotify credits no separate conductor (a 2018 compilation adds Iona Brown, the Academy's leader) | Europadisc (search excerpt); Spotify album 2gBuXqebMhPk2G2UJ1Kqk2 | OK (secondary) |
| Cadenzas | Benjamin Britten | Spotify track titles; prostudiomasters album notes ("Britten wrote the cadenzas for the C major") | embed; https://www.prostudiomasters.com/album/page/35621 | OK |
| Britten wrote his Cello Symphony for Rostropovich | Dedicated to Rostropovich, premiered by him in Moscow, 12 March 1964 | https://en.wikipedia.org/wiki/Cello_Symphony_(Britten) | OK |

### Durations (Spotify embed, album 7CGSB0LAToUr8S7in0BCpF)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Moderato | 1 | 592 906 | 9:53 |
| II Adagio | 2 | 511 946 | 8:32 |
| III Allegro molto | 3 | 386 360 | 6:26 |
| Total | | 1 491 212 | 25 min (24:51) |

## Also recommended: Jacqueline du Pré / English Chamber Orchestra / Daniel Barenboim (EMI, rec. 1967)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2nwMwMWIdHwxKr3LFZXdpH — "Haydn: Cello Concertos - Boccherini: Cello Concerto", 9 tracks; C major = tracks 1–3 (9:32 / 9:43 / 6:51), all `isPlayable: true`; "album · 1998", "℗ This compilation (P) 1998 EMI Records Ltd." | embed + album page | OK |
| Catalogue | EMI Classics 5 66896 2 (1998), same programme and timings | https://musicbrainz.org/release/605de0e4-dfc5-4259-b70c-bbd01453ddfb | OK |
| Recorded | 17 April 1967, Abbey Road Studio 1 (C major concerto with ECO/Barenboim; the D major is with Barbirolli/LSO, 13 December 1967) | same | OK |

---

## Painting: Johann Zoffany, *The Gore Family with George, third Earl Cowper*, c. 1775

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Johann Zoffany (1733–1810), c. 1775 | Commons; https://www.wikidata.org/wiki/Q23758199 | OK |
| Collection | Yale Center for British Art, Paul Mellon Collection, B1977.14.87 | Wikidata P217; Google Art Project metadata on Commons | OK |
| Source URL | https://collections.britishart.yale.edu/vufind/Record/1669246 (Wikidata P4738 formatter) | YCBA site answered with a bot check; not opened | **check the URL** at merge |
| Subject | A family group around a keyboard: a young woman plays, an older man in blue plays the cello, a man in green (George, 3rd Earl Cowper) stands behind; YCBA facets: father, daughters, music, wedding | thumbnail checked; Google Art Project facets on the Commons page | OK. The pairing note says only "the father at the cello and his daughter at the keyboard" |
| Medium | Oil on canvas | not confirmed (YCBA not opened) | **check** |
| Image | 5821 × 4588, Google Art Project | https://commons.wikimedia.org/wiki/File:Johan_Joseph_Zoffany_-_The_Gore_Family_with_George,_3rd_Earl_Cowper_-_Google_Art_Project.jpg | OK |
| Rights | Commons: Public domain (PD-Art, Google Art Project); painter died 1810 | Commons extmetadata | OK |
| Not already used | Zoffany not in `content/paintings.yaml` | – | OK |

Why it fits: a cello at the centre of 18th-century music-making, a decade after the concerto; the cellist here is an amateur, Haydn's was a court professional, and the note keeps them apart.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Composed c. 1761–65 for Joseph Franz Weigl, longtime friend, principal cellist of Prince Nikolaus Esterházy's orchestra | https://en.wikipedia.org/wiki/Cello_Concerto_No._1_(Haydn) | OK ("early 1760s") |
| Beginning of the theme in Haydn's draft catalogue of 1765 | same | OK |
| Presumed lost until 1961; Oldřich Pulkert found a copy in the Prague National Museum | same | OK |
| Some doubts about authenticity; most experts accept it | same | OK |
| 20th-century premiere 19 May 1962: Miloš Sádlo, Czechoslovak Radio Symphony Orchestra, Charles Mackerras | same | OK |
| Orchestra: strings, two oboes, two horns; slow movement without winds; reflects the ritornello form of the Baroque concerto | same | OK |
| Staple of the repertoire; recorded by Rostropovich, du Pré, Yo-Yo Ma and many others | same (list of recordings) | OK |
| I: solo enters with the opening theme in full chords on all four strings; rapid repeated notes, very high range, quick contrasts of register; one dominant theme broken into motives; cadenza near the end | same | OK |
| II: cello enters on a long note while the strings relaunch the theme, imitates it two bars later; several sustained-note entries; cadenza near the end | same | OK |
| III: extended orchestral introduction; cello enters on a long note; rapid alternation of low and high like two instruments; last sustained entry on a very high G | same | OK |
| All three movements in sonata form | same | OK (development / recapitulation stops) |
| Metres (4/4, 2/4, 4/4) | score knowledge; IMSLP unreachable | **check** |

---

## Re-time

No stop was timed by ear and no bar numbers could be checked (IMSLP unreachable). Rostropovich's tempos are broad (I and II are among the longest on record), so the stops are proportional estimates within a sonata-form plan: opening ritornello ≈ 12 % of each movement, development starting a little before the middle, recapitulation at about 60 %, cadenza in the last 15 % (Britten's cadenzas assumed ≈ 45–60 s).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Moderato | 9:53 (592 906 ms) | 0:00, 1:10, 2:30, 4:15, 6:00, near the end (cadenza), last 20 s | 1:10 (end of the ritornello) and 6:00 |
| II Adagio | 8:32 (511 946 ms) | 0:00, 1:00, 2:30, 4:00, 5:30, near the end (cadenza), last 30 s | 1:00 and 5:30 (the long-note entries) |
| III Allegro molto | 6:26 (386 360 ms) | 0:00, 0:45, 1:45, 3:00, 4:15, near the end (high G), last 15 s | 0:45 (end of the orchestral introduction) |

## Open items

1. Re-time against a score or by ear; the solo entries (I ≈ 1:10, II ≈ 1:00, III ≈ 0:45) matter most.
2. YCBA URL and medium for the Zoffany.
