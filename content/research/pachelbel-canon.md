# Verification: Pachelbel – Canon and Gigue in D major, P. 37

Files: `content/drafts/en/pachelbel-canon.md`, `content/drafts/tr/pachelbel-canon.md`.
Checked on 2026-10-24. Batch October 2026 (second batch), group B. New composer: `pachelbel` (entry in `pachelbel-canon.shared.md`).

**How the checks were done**
- **Spotify:** public embed page `https://open.spotify.com/embed/album/<id>` fetched from this machine (network in Turkey), `__NEXT_DATA__` JSON: track titles, credits, `duration` (ms), `isPlayable`. Album page `og:description` and `℗` lines for year and label.
- **MusicBrainz** web service (release records with recording-level "recorded at" relations and release annotations). Generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent only; no names or emails sent anywhere.
- **Wikipedia** (API extracts) and **Wikimedia Commons / Wikidata** APIs for facts and the painting.
- IMSLP scores could not be opened (the site now answers with a JavaScript bot check, which was not bypassed). Bar numbers below are from the published analysis quoted on Wikipedia.
- The web-search budget ran out part-way through the batch; later checks used direct fetches of the sources above only.

---

## Reference recording: The English Concert / Trevor Pinnock (Archiv Produktion, 1985)

Why this one: Pinnock's period-instrument Canon and Gigue is a long-standing benchmark, it keeps the Gigue (two separate tracks), and the album is playable in Turkey.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/25rpEX3DjxXklkfCb2MO0a | "Pachelbel: Canon & Gigue / Handel: The Arrival of the Queen of Sheba", 17 tracks; tracks 1–2 = Canon, Gigue; credit "Johann Pachelbel, The English Concert, Trevor Pinnock"; album page "The English Concert · album · 1985", "℗ 1985 Deutsche Grammophon GmbH, Hamburg" | https://open.spotify.com/embed/album/25rpEX3DjxXklkfCb2MO0a ; https://open.spotify.com/album/25rpEX3DjxXklkfCb2MO0a | OK |
| Playable in Turkey | – | tracks 1–2 `isPlayable: true` (all 17 tracks true) | embed JSON | OK |
| Label / cat. no. | Archiv Produktion 415 518-2 | MusicBrainz release "Canon & Gigue", Archiv Produktion 415 518-2, 1985-10-01; same 17-track programme | https://musicbrainz.org/release/95560bf5-391a-49cc-ab5c-e1054b78aa1f | OK |
| Recorded / venue | January 1985, EMI Studio, Abbey Road, London | MusicBrainz annotation (from the booklet): "Recorded: London, Henry Wood Hall, March 1983–May 1985; Pachelbel: London, EMI Studio, Abbey Road, January 1985"; recording relations for tracks 1–2: Abbey Road Studios, 1985-01 | same | OK |
| Release | 1985 | MusicBrainz 1985-10-01; DG catalogue page gives 1 October 1985 | same; https://www.deutschegrammophon.com/en/catalogue/products/the-english-concert-pachelbel-canon-gigue-1656 | OK |
| Performers | soloist Trevor Pinnock (harpsichord), The English Concert | Spotify credits ensemble + Pinnock. Annotation: "Directed from harpsichord" | same | OK. The violinists for the Pachelbel are not itemised per work in the annotation, so they are not named |

### Durations (Spotify embed, album 25rpEX3DjxXklkfCb2MO0a)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Canon | 1 | 271 760 | 4:32 |
| II Gigue | 2 | 80 440 | 1:20 |
| Total | | 352 200 | 6 min (5:52) |

Guide times are rounded to the nearest second (Spotify's own display truncates: 4:31).

## Also recommended: Musica Antiqua Köln / Reinhard Goebel (Archiv Produktion, 1983)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/5bUcSadLadPTVMjKWa9s8c — 14 tracks; track 1 "Canon And Gigue In D Major, P 37", 4:41 (281 133 ms), `isPlayable: true`; "Musica Antiqua Köln · album · 1983", "℗ 1983 Deutsche Grammophon GmbH, Berlin" | embed + album page | OK |
| Catalogue | 447 285-2 (1995 CD reissue with the same programme: Pachelbel, Handel Op. 5 No. 4, Vivaldi "La Follia", Bach Suite No. 2) | https://musicbrainz.org/release/3dc86f5c-e1de-48be-a229-6a28e213e752 | OK (reissue number; original LP number not traced) |
| Recorded | April 1983; MusicBrainz place "Zentralsaal" (no city) | same | venue left null in the guide |
| Leader | Reinhard Goebel (violin, director) | Spotify credit "Musica Antiqua Köln, Reinhard Goebel" | OK |

---

## Painting: Gerard ter Borch, *The Concert*, c. 1675

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Gerard ter Borch the Younger (1617–1681), *Das Konzert* / *The Concert*, 1670s (Wikidata c. 1675) | https://www.wikidata.org/wiki/Q22662436 ; Commons file page | OK |
| Collection | Gemäldegalerie, Staatliche Museen zu Berlin, inv. 791G | Commons credit → https://id.smb.museum/object/869262/das-konzert | OK |
| Medium / size | Oil on panel, 56 × 44 cm (Wikidata P186, P2048/P2049) | Wikidata | OK (secondary) |
| Subject | A woman seen from behind playing a bowed bass instrument held between the knees (Wikidata "depicts" cello; Commons category "Viols in art"), and a second woman at a harpsichord | thumbnail checked; Wikidata P180 | OK. The guide says "a bowed bass instrument" because the sources disagree between cello and viol |
| Image | Commons file 3141 × 4000 (portrait format), SMB photograph | https://commons.wikimedia.org/wiki/File:Gerard_ter_Borch_(der_J%C3%BCngere)_(1617_-_1681)_-_The_Concert_-_791G_-_Gem%C3%A4ldegalerie.jpg | OK |
| Rights | Commons: {{PD-Art|PD-old-auto-expired|deathyear=1681}}, marked CC-PD-Mark; painter died 1681. Not an NC file (the NC concern in `paintings.yaml` is about SMB's own CC BY-NC-SA downloads; this Commons file carries no NC licence) | Commons API extmetadata + wikitext | OK. **Check** at merge that the SMB object page does not attach a separate NC licence to this photograph |
| Not already used | ter Borch is not in `content/paintings.yaml` (checked 2026-10-24) | – | OK |

Why it fits: the two instruments in the picture, a bowed bass and a harpsichord, are exactly the continuo pair that plays the Canon's repeating bass, and the picture is from the 1670s, when Pachelbel was beginning his career (Vienna 1673–77). A smaller alternative copy (Yorck Project, 1576 × 1987) is File:Gerard_ter_Borch_d._J._004.jpg.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Pachelbel 1653–1706, born Nuremberg; Vienna (by 1673, deputy organist at St Stephen's), Eisenach 1677, Erfurt 1678–90, Stuttgart 1690–92, Gotha 1692–95, Nuremberg (St Sebaldus) from 1695 | https://en.wikipedia.org/wiki/Johann_Pachelbel | OK |
| Close friend of Johann Ambrosius Bach; taught Johann Christoph Bach (1671–1721), J. S. Bach's eldest brother | same | OK |
| Scored for three violins and basso continuo, paired with a gigue; both in D major; canon at the unison in three parts over a ground bass | https://en.wikipedia.org/wiki/Pachelbel%27s_Canon | OK |
| Date and circumstances unknown (suggested 1680–1706); oldest surviving manuscript copy 1838–42 (Berlin State Library, Mus.ms. 16481/8) | same | OK ("a copy made around 1840") |
| Schulze (1985) suggested Johann Christoph Bach's wedding, 23 October 1694, which Pachelbel probably attended; Welter calls it "pure speculation" | same; Pachelbel article ("he probably attended") | OK, told as a guess |
| 28 statements of a two-bar ground bass; violins enter two bars apart | Pachelbel's Canon (analysis section) | OK |
| First published 1919 (Beckmann) | same | OK |
| Paillard 1968 recording, slower and "more Romantic", with added obbligato parts; fame through the 1970s; weddings; chord progression in many pop songs | same | OK |
| Gigue: 12/8, two sections of 10 bars, fugal imitation, no repeating bass | same | OK |
| Pinnock "period instruments" | MusicBrainz annotation lists period instruments (e.g. violins by Mariani c. 1650, Grancino 1652) | OK |
| Gigue repeats both halves in this recording | Inferred from the track length: 20 bars of 12/8 in 80 s = 4 s per bar without repeats (dotted crotchet ≈ 60, too slow for a gigue) or 2 s per bar with them (≈ 120) | Inference: **check by ear** |
| *year: 1694* in the yaml | The date is unknown; 1694 is the wedding hypothesis, used only because the field must be a number (comment in the yaml) | Editorial choice: confirm or change at merge |

---

## Re-time

No stop was timed by ear. Method: the Canon has 57 bars of 4/4 (28 two-bar statements of the ground plus a final bar). Track 1 lasts 271.8 s; allowing ~4 s for the final chord's decay, a steady pulse of ≈ 4.7 s per bar (crotchet ≈ 51). Stop = (bar − 1) × 4.7 s. Variation groups from the analysis quoted on Wikipedia: bars 3–6 crotchets, 7–10 quavers, 11–14 semiquavers, 15–18 leaping crotchets, 19–22 demisemiquaver scales, 23–26 staccato, 27–30 neighbour-note semiquavers, 31–38 repeated semiquaver patterns, 39–42 dotted rhythms, 43–46 dotted + semiquavers, 47–50 syncopation, 51–56 octave leaps. Gigue: 20 bars, both halves repeated (see above) → 2.0 s per bar, halves at 0:00 / 0:20 / 0:40 / 1:00.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Canon | 4:32 (271 760 ms) | 0:00 (bar 1), 0:09–0:30 (bars 3, 5, 7: violins enter), 0:47 (bar 11), 1:25 (bar 19), 2:59 (bar 39), 3:36 (bar 47), 3:55 (bar 51), last 15 s | 2:59–3:55: drift of a few seconds if Pinnock's tempo eases late in the piece |
| II Gigue | 1:20 (80 440 ms) | 0:00, 0:20, 0:40, 1:00 | All four depend on Pinnock taking both repeats |

## Open items

1. Confirm by ear that the Gigue's two halves are both repeated.
2. Decide whether to keep `year: 1694` (unknown date) or use another convention.
3. At merge, confirm that the SMB photo of the ter Borch carries no NC licence on the museum's own page (Commons says PD).
