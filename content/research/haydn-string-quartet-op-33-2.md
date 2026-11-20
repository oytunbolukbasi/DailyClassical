# Verification: Haydn – String Quartet in E-flat major, Op. 33 No. 2, "The Joke"

Piece id `haydn-string-quartet-op-33-2`. Checked on 2026-11-20 (batch 2026-11b, group B).
Files: `content/drafts/en/haydn-string-quartet-op-33-2.md`, `content/drafts/tr/haydn-string-quartet-op-33-2.md`.
Shared-file additions (paintings.yaml only; no new glossary terms): `content/research/haydn-string-quartet-op-33-2.shared.md`.

**How the checks were done:** Spotify embed `__NEXT_DATA__` fetched with curl from a Turkish network (2026-11-20); MusicBrainz API (release → Spotify URL relations); the Chandos product page; the BIS booklet PDF (also recommended; its notes are the most detailed source on the work); Chris Darwin's programme note (University of Sussex); Brentano Quartet note; Wikipedia; the CCARH/MuseData Humdrum encoding of the score (github.com/musedata/humdrum-haydn-quartets, `kern/op33n2-01…04.krn`) for bar counts, textures and section boundaries; Wikimedia Commons. Status key as in the other notes.

## 1. Reference recording: Doric String Quartet (Chandos, 2020)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Album | `7tyBEu745PzazDC9fVdjS2` | *Haydn: String Quartets, Op. 33* (all six quartets); No. 2 = tracks 5–8, all `isPlayable: true`. MusicBrainz release 734c897c (Chandos CHAN 20129, 2020-10-02) links this Spotify album | https://open.spotify.com/embed/album/7tyBEu745PzazDC9fVdjS2 ; https://musicbrainz.org/release/734c897c-2c07-4fae-9783-41a977d1b1e7 | VERIFIED |
| Performers | Doric String Quartet | Spotify credits; Chandos: Alex Redington, Ying Xue (violins), Hélène Clément (viola), John Myerscough (cello) | https://www.chandos.net/products/catalogue/CHAN%2020129 | VERIFIED |
| Label / catalogue | Chandos CHAN 20129(2) | Chandos page (2 CDs); MusicBrainz "CHAN 20129" | same | OK |
| Recorded / venue | 11–13 December 2019, Potton Hall, Dunwich, Suffolk | Chandos page (text partly truncated in the fetch): "11–13 December 2019 (String Quartets, Op.33 Nos 1, 2 and 4) and 10–12 March 2020 (other works)", Potton Hall, Dunwich, Suffolk; producer and engineer Jonathan Cooper | same | OK (the sentence's beginning was cut off; the date–work pairing is the obvious reading) |
| Release | 2020 | Chandos: October 2020; MusicBrainz 2020-10-02 | same | OK |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | I. Allegro moderato | 523000 | 8:43 | true |
| 6 | II. Scherzo. Allegro | 210133 | 3:30 | true |
| 7 | III. Largo sostenuto | 301866 | 5:01 | true |
| 8 | IV. Finale. Presto | 194000 | 3:14 | true |
| | Total | 1228999 | 20:28 → `duration_min: 20` | |

Chandos lists the finale as 3:03 (and the Largo as 5:01); the Spotify track is 3:14, so it probably carries about 11 s of silence after the last notes. Not stated in the guide.

Repeats (inferred, not heard): movement I has 90 bars (+ upbeat); exposition bars 1–32, development 33–62, recapitulation 63–90 (Humdrum). 523 s only fits a normal Allegro moderato (crotchet ≈ 83, 2.9 s a bar) if both halves are repeated (180 bars); with the exposition repeat alone it would mean crotchet ≈ 56. Chiaroscuro's 7:02 and Brentano's 4:48 (no repeats) are consistent with this. The guide's "In this recording" says the Dorics repeat both halves.

## 2. Also recommended: Chiaroscuro Quartet (BIS, 2023)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Album | `55F1MJPRWeqL7AeW13p290`, *Haydn: String Quartets Op. 33 Nos 1-3*; No. 2 = tracks 5–8: 7:02 / 3:04 / 4:24 / 3:36 (422360 / 184573 / 264800 / 216120 ms), all `isPlayable: true`; MusicBrainz release f275770c (BIS-2588, 2023-05-05) links it | https://open.spotify.com/embed/album/55F1MJPRWeqL7AeW13p290 | VERIFIED |
| Performers | Alina Ibragimova, Pablo Hernán Benedí (violins), Emilie Hörnlund (viola), Claire Thirion (cello); gut strings | BIS booklet | VERIFIED |
| Recorded | 26–29 October 2021, Menuhin Hall, The Yehudi Menuhin School, Stoke d'Abernon, England; producer Andrew Keener, engineer Oscar Torres | BIS booklet "Recording Data": https://eclassical.textalk.se/shop/17115/art30/5099130-c0c9df-BIS-2588_booklet_small.pdf | VERIFIED |
| Release | 2023 (5 May 2023) | AllMusic; Irish Times review 5 May 2023 | OK |

## 3. Painting: Jean-Siméon Chardin, *Soap Bubbles*, probably 1733–34

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Jean Siméon Chardin (1699–1779), *Soap Bubbles*, "probably 1733/1734" | Commons file (NGA data) | OK |
| Collection | National Gallery of Art, Washington, Gift of Mrs. John W. Simpson, 1942.5.1; oil on canvas, 93 × 74.6 cm. (Other versions: Metropolitan Museum, New York; LACMA) | https://purl.org/nga/collection/artobject/994 (via the Commons file; nga.gov refused automated fetch) | OK |
| Image | `File:Jean_Siméon_Chardin,_Soap_Bubbles,_probably_1733-1734,_NGA_994.jpg`, 3239 × 4000, donated by the NGA, CC0. Larger alternative: `File:Jean_Siméon_Chardin_-_Soap_Bubbles_-_Google_Art_Project.jpg` (7366 × 9117, PD-Art, same painting) | https://commons.wikimedia.org/wiki/File:Jean_Sim%C3%A9on_Chardin,_Soap_Bubbles,_probably_1733-1734,_NGA_994.jpg | OK |
| Rights | Chardin died 1779; NGA open access CC0 | Commons | OK |
| Not reused | No Chardin in `content/paintings.yaml` | – | OK |

**Pairing.** What it shows (NGA image): a young man leans out of a window blowing a large soap bubble through a straw; a small boy peers over the stone ledge, watching it swell. The link to the quartet is an idea, not a date or place: the suspense of a moment that may end at any second, which is what the finale's silences play with. The painting is half a century older than the quartet (Chardin died in 1779, two years before Op. 33). Alternatives with a closer date are in the shared note.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Op. 33 written 1781, ten years after Op. 20 (1772) | BIS booklet; Darwin note https://users.sussex.ac.uk/~cjd/WebProgNotes/pdfs/HaydnOp33no2.pdf ; https://en.wikipedia.org/wiki/String_Quartets,_Op._33_(Haydn) | OK |
| Letters to subscribers, December 1781: "in a completely new and special way, for I haven't composed any for ten years" | BIS booklet; Darwin ("written in a new and special way"); Wikipedia ("a new and entirely special kind") | OK |
| Scherzos instead of minuets; "scherzo" = joke; "Gli Scherzi" in early editions | BIS booklet; Brentano note https://brentanoquartet.com/notes/haydn-quartet-opus-33-2 | OK |
| At least one performed on Christmas Day 1781 in the Vienna apartment of Grand Duke Paul (later Tsar Paul I); dedicated to him; "Russian" quartets. Wikipedia says the Grand Duchess Maria Feodorovna's apartment | BIS booklet ; Wikipedia ; Darwin | OK (guide follows BIS: "the apartment of the visiting Grand Duke Paul") |
| Artaria publication delayed to April 1782 | BIS booklet | OK |
| English nickname a late addition; refers to the finale's ending | Darwin ; BIS | OK |
| Bet that "the ladies will always begin talking": "allegedly" | BIS booklet ("Haydn allegedly wrote the ending in order to win a bet") | OK (told as a story) |
| Mozart's quartets dedicated to Haydn (published 1785) and Op. 33's influence: "often said" | Wikipedia ("some scholars theorize… no direct evidence"); BIS ("a prime influence"); Darwin | OK (cautious wording) |
| I: almost everything grows from the opening phrase; development begins with the first bar woven in a tight polyphonic web; four players briefly imitate an orchestra; ends with the opening notes | BIS ; Darwin ; Brentano | OK. Bar positions from Humdrum: second key area from bar 13 (A naturals, B-flat major), all four on repeated semiquavers bars 26–27, development 33, minor-key semiquaver figures 54–57, recapitulation 63 |
| II: a Schuhplattler-type peasant dance with heavy repeated chords; a two-bar chromatic phrase for the violins disrupts the 4 + 4 phrasing; trio: first violin as a village fiddler with slides, removed by 19th-century editors; Haydn marks the same finger on neighbouring notes | BIS ; Darwin | OK. Trio texture from Humdrum (bars 35–68): second violin in running quavers, viola and cello one note a bar |
| III: opens, unprecedentedly in Haydn's quartets, with a viola–cello duet; violins repeat it with cello murmurs; lyricism and vehement rhetoric alternate; first return a trio of the upper three (melody in second violin, semiquavers in first violin); second return full quartet with semiquavers in the viola | BIS ; Darwin ("for the first time in Haydn the viola introduces the hymn-like theme") | OK; Humdrum: duet bars 1–8, violins 9–16, forceful chords 17–24 and 40–43, first return 31–38 (cello silent), second return 51–58, chords 59–63, coda 64–72 |
| IV: rondo (ABACA): refrain 1–35 with repeats, episode 36–71 (A-flat → F minor), refrain 72–106, episode 107–140, refrain 141–148; Adagio (2/4) bars 149–152; fragments with growing rests 153–173; ends with half the opening phrase | Wikipedia (form, bar numbers); Humdrum | OK. Wikipedia places a grand pause before the Adagio; the Humdrum file has the fermata rest after the Adagio (end of bar 152). The guide says only "a pause; then four slow, solemn bars" |
| "bubbly tarantella finale" | BIS | OK (guide: "lilting six-time") |
| Clara Schumann laughed aloud (Joachim Quartet) | BIS ; Darwin | Not used |
| Tempo of III: Chandos and BIS "Largo e sostenuto"; Humdrum and Spotify "Largo sostenuto" | – | Guide uses "Largo e sostenuto" |

## 5. Re-time (all stops are ≈; bar positions from the Humdrum score × average seconds per bar of each track; not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro moderato, cantabile | 8:43 | 0:00, 0:35, 1:05, 1:33, 3:06, 4:05, 4:33, 5:54, Last 15 seconds | Assumes both repeats at a steady 2.9 s a bar; development and recapitulation (≈ 3:06, 4:33) ± 15 s |
| II Scherzo: Allegro | 3:30 | 0:00, 0:25, 1:24, 2:48, Last 10 seconds | Repeat scheme assumed (scherzo 1–10 and 11–34 repeated, trio 35–42 and 43–68 repeated, da capo without repeats; 170 bars at 1.24 s); the trio's start ≈ 1:24 ± 15 s |
| III Largo e sostenuto | 5:01 | 0:00, 0:34, 1:07, 2:06, 2:43, 3:30, Last 30 seconds | No repeats assumed (72 bars at 4.2 s); later stops ± 15 s |
| IV Finale: Presto | 3:14 | 0:00, 1:00, 1:30, 2:00, 2:28, 2:35, 2:45, Last 20 seconds | Assumes the refrain's two repeats (206 Presto bars at 0.84 s ≈ 2:53 plus the Adagio, matching Chandos's 3:03); the silences at the end may be stretched; the last 11 s of the track are probably silent |
