# Verification: Palestrina – Missa Papae Marcelli

Piece id `palestrina-missa-papae-marcelli`. Checked on 2026-11-17 (batch November 2026, group B).
Files: `content/drafts/en/palestrina-missa-papae-marcelli.md`, `content/drafts/tr/palestrina-missa-papae-marcelli.md`.
Shared-file additions (paintings.yaml, glossary, composers.yaml entry for `palestrina`, retime row): `content/research/palestrina-missa-papae-marcelli.shared.md`.

**How the checks were done.** Spotify: the public embed page `https://open.spotify.com/embed/album/<id>` was downloaded from this machine (network in Turkey) and its `__NEXT_DATA__` JSON read: track titles, credits, `duration` (ms), `isPlayable`. Discogs API (`api.discogs.com/releases/<id>`) and MusicBrainz web service for label, catalogue number, dates and venue. Wikipedia via the MediaWiki API (extracts and wikitext). Requests used only the generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent. Status key: OK = confirmed from the source named; SECONDARY = aggregator or crowd-sourced only; UNVERIFIED = not confirmed.

---

## 1. Choosing the recording

| Album | Performers | Mass tracks | Verdict |
| --- | --- | --- | --- |
| `11EFoolEeb3cHbpugUS6dm` | The Tallis Scholars / Peter Phillips (1980, Gimell) | 26 tracks (Kyrie split 1a–1c, Gloria 2a–2g, Credo 3a–3i, Sanctus 4a–4e, Agnus 5a–5b), all playable | Rejected: splits movements into several tracks. Used only for section proportions (see §5) |
| `0lSeYO6mLZIngXj5NPS3Hl` | The Sixteen / Harry Christophers (1989) | 6 tracks (4–9), all playable | **Chosen** |
| `6tu14dYvtoshR8cOlT2JOZ` | Oxford Camerata / Jeremy Summerly (Naxos) | 5 tracks (1–5), all playable | `also_recommended` |

The Sixteen's album is already the reference recording of the published `allegri-miserere` (track 3), so the two Roman pieces share one album. Their mass is in six tracks, one per section, which fits the six-movement limit exactly.

## 2. Reference recording: The Sixteen / Harry Christophers (Collins 1990, Coro reissue)

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/0lSeYO6mLZIngXj5NPS3Hl | "Allegri: Miserere - Palestrina: Missa Papae Marcelli", 9 tracks; tracks 4–9 "Missa Papae Marcelli: Kyrie / Gloria / Credo / Sanctus and Benedictus / Agnus Dei I / Agnus Dei II", credited "Giovanni Pierluigi da Palestrina, The Sixteen, Harry Christophers"; all `isPlayable: true` (2026-11-17) | https://open.spotify.com/embed/album/0lSeYO6mLZIngXj5NPS3Hl | VERIFIED |
| Chorus / conductor | The Sixteen / Harry Christophers | Discogs 28588450 ("Conductor – Harry Christophers", "Ensemble [Vocal] – The Sixteen"); Spotify credits | https://api.discogs.com/releases/28588450 | OK |
| Label / cat. no. | Coro, COR16014 (first issued as Collins Classics 50092) | Discogs 28588450 notes "Reissue of Collins 50092", © / ℗ The Sixteen Ltd 2003; Discogs 3606647 (Collins Classics 50092, 1990). Same as in `research/allegri-miserere.md` | https://api.discogs.com/releases/28588450 ; https://api.discogs.com/releases/3606647 | OK |
| Recorded / venue | November 1989; St Jude-on-the-Hill, London | Discogs notes: "Recorded at St. Jude's Church, London in November, 1989"; Allegri note: company "Church Of St. Jude-on-the-Hill, Hampstead"; MusicBrainz e765ef8f-b347-4fbc-ba01-7dff5a714686 | as above | OK |
| Release year | 1990 | Collins 50092 (1990); Spotify date 1990-07-01 | as above | OK |
| Singers (not in yaml) | – | Discogs lists 18 singers: sopranos Carys Lane, Nicola Jenkin, Nicola-Jane Kemp, Patricia Forbes, Ruth Dean, Sally Dunkley; altos Andrew Giles, Christopher Royall, Nigel Short, Robert Jones; tenors David Roy, Mark Padmore, Peter Burrows, Philip Daggett; basses Charles Gibbs, Christopher Purves, Francis Steele, Timothy Jones. Producer Mark Brown, engineer Antony Howell | Discogs 28588450 | for reference |
| "On the same album as their Allegri *Miserere*" | – | Track 3 of the same album | embed | OK |
| "Without instruments" | – | No instrumentalists credited on the release; the mass is a cappella | Discogs 28588450 | OK |

### Durations (Spotify embed, album 0lSeYO6mLZIngXj5NPS3Hl, read 2026-11-17 from Turkey)

| Mvt | Spotify track | ms | isPlayable | Guide |
| --- | --- | --- | --- | --- |
| I Kyrie | 4 | 236 666 | true | 3:57 |
| II Gloria | 5 | 350 360 | true | 5:50 |
| III Credo | 6 | 513 400 | true | 8:33 |
| IV Sanctus and Benedictus | 7 | 368 466 | true | 6:08 |
| V Agnus Dei I | 8 | 196 773 | true | 3:17 |
| VI Agnus Dei II | 9 | 215 533 | true | 3:36 |
| Total | | 1 881 198 | | 31 min (31:21) |

## 3. Also recommended: Oxford Camerata / Jeremy Summerly (Naxos)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/6tu14dYvtoshR8cOlT2JOZ — "Palestrina: Missa Papae Marcelli", 10 tracks; tracks 1–5 Kyrie 4:30, Gloria 5:36, Credo 8:27, Sanctus 8:49, Agnus Dei 7:47 (270 080 / 336 400 / 506 600 / 528 773 / 466 693 ms), credited "Giovanni Pierluigi da Palestrina, Oxford Camerata, Jeremy Summerly"; all `isPlayable: true`. Spotify link also listed on MusicBrainz release d666ad2e-46bc-4cb3-a967-3e9342aab0e0 | embed page | VERIFIED |
| Label / cat. no. | Naxos 8.550573 | MusicBrainz 9d55376f-6485-4003-8ae8-844cc83c7959 (Naxos 8.550573, URL rel to naxos.com catalogue) | https://musicbrainz.org/release/9d55376f-6485-4003-8ae8-844cc83c7959 | OK |
| Recorded / venue | September 1991, Dorchester Abbey | MusicBrainz recording relationships: "recorded at Dorchester Abbey", 1991-09-24, for every track of the release; Discogs search lists "Dorchester Abbey" among the release's companies | same | SECONDARY (crowd-sourced; Naxos page refused a scripted fetch, HTTP 403) |
| Release year | 1992 | Discogs search result for the Naxos release: year 1992, Europe (MusicBrainz has a 1994 US issue) | https://api.discogs.com/database/search?q=Palestrina+Oxford+Camerata+8.550573 | SECONDARY |

## 4. Painting: Raphael, *The Ecstasy of Saint Cecilia*, c. 1516–17

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Raphael (1483–1520), *The Ecstasy of Saint Cecilia* (Saint Cecilia Altarpiece; *Estasi di santa Cecilia*) | https://en.wikipedia.org/wiki/The_Ecstasy_of_St._Cecilia_(Raphael) ; Wikidata Q1103801 | OK |
| Date | "around 1516–1517" (Wikipedia); commissioned 1513/1514 per Vasari, more likely c. 1516 per most art historians; the Commons file says 1514. Guide: "c. 1516–17" | Wikipedia | OK |
| Collection | Pinacoteca Nazionale, Bologna (inv. 577 in the file name); painted for the Cecilia chapel in San Giovanni in Monte, Bologna; taken to Paris 1798, returned 1815 | Wikipedia; Commons file name | OK |
| What it shows (visual check of the Commons image) | Cecilia in the centre holds a portative organ tilted downwards and looks up to a small choir of angels singing from books in an opening of the clouds; around her Saints Paul, John the Evangelist, Augustine and Mary Magdalene; broken and scattered instruments (viol, tambourine, cymbals, flutes, triangle) at her feet | Commons image; Wikipedia ("listening to a choir of angels"; Shelley: instruments "broken and unstrung") | OK |
| "Patron saint of church music" | Wikipedia: "the patron saint of musicians and Church music" | Wikipedia | OK |
| Image | File:Raffaello (1483-1520) - Pala di Santa Cecilia - 577 - Pinacoteca Nazionale di Bologna.jpg, 4570 × 7333 px, 10.1 MB (source uffizi.it) | https://commons.wikimedia.org/wiki/File:Raffaello_(1483-1520)_-_Pala_di_Santa_Cecilia_-_577_-_Pinacoteca_Nazionale_di_Bologna.jpg | OK |
| Licence | `{{PD-art-100-expired}}`; artist died 1520. Faithful reproduction of a 2D PD work, no new right (EU DSM art. 14, US) | Commons | OK |
| Not NC | No NC terms | – | OK |
| Not already used | Raphael is not in `content/paintings.yaml` or any published piece's painting block (checked 2026-11-17); no draft of this batch uses it so far | – | OK |
| Condition note | Wikipedia: transferred to canvas in Paris, "damaged by repainting over the years". The image is clean and sharp | Wikipedia | for reference |

Why it fits: Cecilia, patron of church music, turns away from instruments to listen to voices alone; Palestrina's mass is written for unaccompanied voices, and the papal choir sang without instruments. The painting is Roman-school High Renaissance (Raphael worked in Rome), half a century before the Mass. Portrait format: the cover crop should keep the angel choir at the top and Cecilia's face.

## 5. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| A mass sets five fixed texts: Kyrie, Gloria, Credo, Sanctus/Benedictus, Agnus Dei | https://en.wikipedia.org/wiki/Missa_Papae_Marcelli ("consists, like most Renaissance masses, of a Kyrie, Gloria, Credo, Sanctus/Benedictus, and Agnus Dei") | OK |
| Palestrina was choirmaster at the great churches of Rome; more than a hundred masses (105) | https://en.wikipedia.org/wiki/Giovanni_Pierluigi_da_Palestrina (Cappella Giulia at St Peter's 1551–55 and 1571–94; St John Lateran 1555–60; Santa Maria Maggiore 1561–66; "105 masses") | OK |
| The most famous of his masses; six voices, unaccompanied | Missa Papae Marcelli article ("his best-known mass"; "primarily a six-voice mass"); German Wikipedia (six voices with doubled tenors and basses: SATTBB) | OK |
| Named after Marcellus II, pope for three weeks in 1555 | Missa Papae Marcelli article; https://en.wikipedia.org/wiki/Pope_Marcellus_II (elected 9/10 April 1555, died 1 May 1555, 22 days) | OK |
| Good Friday 1555: he called the papal singers together; Holy Week music should suit the day; words heard and understood | Carus-Verlag article (12 April 1555, diary of the papal secretary Angelo Massarelli: "that what they said could be heard and understood"): https://blog.carus-verlag.com/en/music-stories/the-missa-papae-marcelli-and-its-context/ ; German Wikipedia "Missa Papae Marcelli" (Karfreitag 1555, words as intelligible as possible) | OK |
| Nobody knows whether it was written in his memory | Carus (date unknown, between 1555 and 1567; probably 1560s, well after his death); Marcellus II article ("traditionally believed to have been composed in his memory, ca. 1562") | OK (cautious wording) |
| Probably composed around 1562; printed in Rome 1567 in the Second Book of Masses | Missa Papae Marcelli article ("most likely date of composition is 1562, when it was copied into a manuscript at … Santa Maria Maggiore"); German Wikipedia ("1567 in Palestrinas zweitem Messebuch"); Carus (last work of *Missarum liber secundus*, 1567, dedicated to Philip II). Note: Carus mentions a Sistine manuscript (CS 22) dated 1565 | OK. `year: 1567` = the printed edition (the firm date) |
| Council of Trent ended 1563; legend that it nearly banned polyphony because the words were lost; first written down 1607 (Agazzari); famous in the 19th century (Baini 1828); no evidence; the Council never banned polyphony | Missa Papae Marcelli article (history section; "none of the official proclamations from the Council mentions polyphonic music, excepting one injunction against … 'lascivious or impure'"); Palestrina article ("the Council of Trent, as an official body, never actually banned any church music"); https://en.wikipedia.org/wiki/Council_of_Trent (1545–1563) | OK |
| Gloria and Credo mostly in block chords, words together; changing groups of voices for each phrase | Missa Papae Marcelli article ("homorhythmic, declamatory style … block chords such that the text can clearly be heard"; Taruskin on the Credo: "a different selection of voices is used for each such phrase"; "the use of the full forces is reserved for specific climactic portions in the text") | OK |
| Kyrie: imitative polyphony on the main motif (rising fourth, stepwise return) | Missa Papae Marcelli article (Analysis) | OK. The guide says "a slow leap upwards, then a gentle step-by-step return" |
| Gloria/Credo intonations ("Gloria in excelsis Deo", "Credo in unum Deum") sung by the priest in chant; polyphony begins "Et in terra pax" / "Patrem omnipotentem" | Standard Renaissance practice and the layout of the score (the Tallis Scholars' track titles start at "Gloria in excelsis Deo", which only names the section) | OK as general practice. **Whether The Sixteen sing the chant intonation at the start of tracks 5 and 6 is not known**: if they do, the first seconds are chant before the choir enters |
| Credo: "Et incarnatus est" slow chords; Crucifixus for fewer voices "as is traditional" | Fewer voices for the Crucifixus is a standard convention of mass settings (search result: Taylor & Francis excerpt, "the crucifixion text … generally set for fewer voices"). The exact voicing in this Mass (often given as four upper voices) was not confirmed in a score | Wording kept general ("a smaller, lighter group"). Check IMSLP |
| Sanctus: short phrases cadencing on different chords; "tonal planning" | Missa Papae Marcelli article (Analysis: short phrases cadencing on C, then F, D, G, back to C) | OK |
| Benedictus for fewer voices | Common in mass settings; the guide says "a smaller group". Not confirmed in a score | Check IMSLP |
| Agnus Dei I repeats the opening of the Kyrie; imitative style | Missa Papae Marcelli article ("the opening of Agnus Dei I repeats that of the Kyrie") | OK |
| Agnus Dei II: seven voices, three-part canon beginning with the head motive; two sopranos | Missa Papae Marcelli article ("adds an extra voice in Agnus Dei II, making seven … a three-part canon that begins with the head-motive"); German Wikipedia (seven voices: two sopranos, two altos, one tenor, two basses) | OK |
| Agnus Dei text: I "miserere nobis", II "dona nobis pacem" | Liturgical text; Spotify track titles | OK |
| The papal choir sang without instruments | General: the Sistine Chapel choir sang a cappella (no organ in the chapel) | OK (general knowledge; kept to "as the papal choir did") |

Not used, on purpose: the claim that the Mass was sung at papal coronations until 1963 (single source, not needed); Pfitzner's opera (mentioned only in the composer sources).

## 6. Re-time (every stop is ≈; derived, not heard)

Reference: The Sixteen / Christophers, Spotify `0lSeYO6mLZIngXj5NPS3Hl`, tracks 4–9.

Method: the Tallis Scholars' 1980 album `11EFoolEeb3cHbpugUS6dm` splits each section of the Mass at the text divisions (embed durations, ms). The start of each division in that recording, divided by the Tallis section total and multiplied by The Sixteen's track length, gives the estimated start in The Sixteen's track (assumes the two choirs keep the same proportions; tempos differ, so expect errors of 10–20 s).

- Kyrie: Tallis 96.2 + 114.0 + 75.9 = 286.1 s; Sixteen 236.7 s (× 0.827). Christe 96.2 → 79.6 s (≈ 1:20); Kyrie II 210.2 → 173.9 s (≈ 2:55).
- Gloria: Tallis 46.0 / 70.2 / 48.5 / 80.6 / 38.9 / 35.2 / 61.1 = 380.5 s; Sixteen 350.4 s (× 0.921). Gratias 46.0 → 42.4 (≈ 0:40, the "Laudamus" phrases lie inside the Tallis 2a track); Domine Deus 116.2 → 107.0 (≈ 1:45); Qui tollis 164.8 → 151.7 (≈ 2:30); Quoniam 284.2 → 261.7 (≈ 4:20); Cum Sancto 319.4 → 294.1 (≈ 4:55).
- Credo: Tallis 71.9 / 47.6 / 36.7 / 73.1 / 65.2 / 90.2 / 69.4 / 48.5 / 95.0 = 597.6 s; Sixteen 513.4 s (× 0.859). Deum de Deo 71.9 → 61.8 (≈ 1:00); Et incarnatus 156.1 → 134.1 (≈ 2:15); Crucifixus 229.2 → 196.9 (≈ 3:15); Et ascendit 294.4 → 252.9 (the Tallis 3e track "Crucifixus" probably includes "Et resurrexit", so "Et resurrexit" falls just before ≈ 4:15); Et exspecto 502.5 → 431.7 (≈ 7:10).
- Sanctus: Tallis 137.1 / 70.0 / 40.2 / 169.2 / 47.5 = 464.0 s; Sixteen 368.5 s (× 0.794). Pleni 137.1 → 108.9 (≈ 1:50); Hosanna 207.1 → 164.5 (≈ 2:45); Benedictus 247.3 → 196.4 (≈ 3:15); Hosanna II 416.5 → 330.8 (≈ 5:30).
- Agnus Dei I and II: one Tallis track each, so the text divisions (≈ 1:15 / 2:20 in I; ≈ 1:10 / 2:20 in II) are placed by the proportion of the text in the score (about 40 % / 70 %), the least reliable stops of the piece.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Kyrie | 3:57 | 0:00, 1:20, 2:55, Near the end | 2:55 |
| II Gloria | 5:50 | 0:00, 0:40, 1:45, 2:30, 4:20, 4:55 | 0:00 (chant intonation or not); 0:40 |
| III Credo | 8:33 | 0:00, 1:00, 2:15, 3:15, 4:15, 7:10 | 4:15 (resurrexit/ascendit boundary) |
| IV Sanctus and Benedictus | 6:08 | 0:00, 1:50, 2:45, 3:15, 5:30 | 3:15 and 5:30 |
| V Agnus Dei I | 3:17 | 0:00, 1:15, 2:20, Near the end | 1:15, 2:20 |
| VI Agnus Dei II | 3:36 | 0:00, 1:10, 2:20, Last 30 seconds | 1:10, 2:20 |

## 7. Glossary

Existing terms used: polyphony, canon. New terms (rows in the `.shared.md`): **Mass**, **Homophony**.
