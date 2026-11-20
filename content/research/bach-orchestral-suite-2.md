# Verification: Bach – Orchestral Suite No. 2 in B minor, BWV 1067

Piece id `bach-orchestral-suite-2`. Checked on 2026-11-20 (batch 2026-11b, group A). Composer `bach` already in `composers.yaml`.
Files: `content/drafts/en/bach-orchestral-suite-2.md`, `content/drafts/tr/bach-orchestral-suite-2.md`. Shared-file additions: `content/research/bach-orchestral-suite-2.shared.md`.

**How the checks were done.** As in `bach-keyboard-concerto-5.md`: Spotify embed `__NEXT_DATA__` from a Turkish network, Spotify album page, MusicBrainz API, Wikipedia API (current and 2015 revision of "Orchestral suites (Bach)"), Commons/Wikidata APIs, Met collection API, web search. No score could be downloaded (IMSLP gate), so stops are proportional estimates. Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Stephen Preston, The English Concert / Trevor Pinnock (Archiv Produktion, rec. June 1978)

Why this one: Pinnock's first Archiv set of the suites, a classic period-instrument recording; the catalogue's Suite No. 3 uses the same album. Seven tracks, one per movement (Bourrée I–II and Polonaise–Double each one track), all playable in Turkey.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4w707soWgWia8y0tHr9OE0 | "Bach: Orchestral Suites (Overtures) BWV 1067 & 1068 / Triple Concerto", 15 tracks; Suite No. 2 = tracks 1–7, credited "Johann Sebastian Bach, The English Concert, Trevor Pinnock"; album page 1988-01-01, "℗ This Compilation ℗ 1988 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/4w707soWgWia8y0tHr9OE0 | OK |
| Label / CD | Archiv Produktion 427 112-2 | MusicBrainz "Orchestral Suites, BWV 1067 & 1068 / Triple Concerto, BWV 1044", Archiv Produktion 427 112-2, 1988-12-01, same track order | https://musicbrainz.org/release/c9628154-8f98-41e4-a505-c08f13ade95d | OK |
| LP | 2533 410 | bach-cantatas.com (Stephen Preston discography, entry O-1b): "Archiv Produktion 2533410 (LP)" | https://bach-cantatas.com/NVP/Preston-Ste.htm | SECONDARY (one source; yaml comment) |
| Recorded / venue | 24–26 June 1978, Henry Wood Hall, London | bach-cantatas.com: "June 24-26, 1978", Henry Wood Hall, London; MusicBrainz recording relations: "recorded at Henry Wood Hall", 1978-06 | as above | OK |
| Flute | Stephen Preston | MusicBrainz relations: "Stephen Preston – transverse flute (1978-06)"; bach-cantatas.com: "Stephen Preston (flute)". MusicBrainz also lists "Lisa Beznosiuk – flute" without a date (she plays in Pinnock's later recordings); the dated credit and bach-cantatas.com agree on Preston | as above | OK |
| Other players (MusicBrainz) | not in the guide | Simon Standage, Monica Huggett (violins), Trevor Jones (viola), Anthony Pleeth (cello), Richard Webb (double bass/violone), Pinnock (harpsichord) | MusicBrainz | – |
| release_year / year | 1979 | Österreichische Mediathek record for the same sessions (cited in `bach-orchestral-suite-3.md`): production year 1979 | https://www.mediathek.at/atom/0698E37D-29B-0006B-00000BA8-069844E4/pool/bibl | SECONDARY |
| Repeats in the Ouverture | "repeat only the slow opening section" | Gramophone, on Pinnock's later remake: "in the earlier one Pinnock observed only the repeat of the opening dotted section of each Ouverture proper" | https://gramophone.co.uk/review/bach-orchestral-suites-etc-0 (search excerpt, as in the Suite 3 note) | OK |

### Durations and playability (embed, album 4w707soWgWia8y0tHr9OE0, read 2026-11-20 from Turkey)

| Mvt | Track | ms | isPlayable | Guide |
| --- | --- | --- | --- | --- |
| I Ouverture | 1 | 369 333 | true | 6:09 |
| II Rondeau | 2 | 118 226 | true | 1:58 |
| III Sarabande | 3 | 173 773 | true | 2:54 |
| IV Bourrée I–II | 4 | 116 826 | true | 1:57 |
| V Polonaise I–II (Polonaise – Double) | 5 | 220 640 | true | 3:41 |
| VI Menuet | 6 | 90 426 | true | 1:30 |
| VII Badinerie | 7 | 92 666 | true | 1:33 |
| Total | | 1 181 890 | | 20 min (19:42) |

(MusicBrainz gives 100 426 ms for the Badinerie on the CD, probably with the gap before Suite No. 3; the other six tracks match within 1.7 s.) Spotify calls track 5 "Polonaise I-II"; MusicBrainz "Polonaise - Double"; the guide uses Bach's "Double".

---

## 2. Also recommended: La Petite Bande / Sigiswald Kuijken (Accent, 2013)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/7eiJgSbUxUjGUzXXxNFFHC — "Bach: The Orchestral Suites", 24 tracks; Suite No. 2 = tracks 13–19: 359 880 / 106 093 / 180 120 / 129 919 / 223 266 / 70 546 / 102 186 ms, all `isPlayable: true`; "℗ 2013 Accent" | embed + album page | OK |
| Catalogue | Accent ACC 24279 (2013) | MusicBrainz release 72d01dac-5e35-49e6-a40c-509d13203502 (as verified in `bach-orchestral-suite-3.md`) | OK |
| Recording date / venue / flautist | not found | – | left out of the yaml |

---

## 3. Painting: Jean-Baptiste Pater, *Concert Champêtre*, ca. 1734

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Jean-Baptiste Joseph Pater (1695–1736), *Concert Champêtre*, "ca. 1734" | Met collection API, object 437256 | OK |
| Collection | The Metropolitan Museum of Art, New York, 37.27, "Purchase, Joseph Pulitzer Bequest, 1937" | https://www.metmuseum.org/art/collection/search/437256 (API: https://collectionapi.metmuseum.org/public/collection/v1/objects/437256) | OK |
| Medium / size | Oil on canvas, 52.1 × 67.9 cm | Met API | OK |
| Image | File:Concert Champêtre MET DP317730.jpg, 3917 × 3054 | https://commons.wikimedia.org/wiki/File:Concert_Champ%C3%AAtre_MET_DP317730.jpg | OK |
| Rights | Met Open Access, CC0 (`isPublicDomain: true`) | Met API; Commons {{CC0}} | OK |
| What it shows (visual check of the file) | Elegant company under trees; behind the seated lady a young man in red plays an end-blown pipe (recorder or flageolet, held downwards, not a transverse flute); at right a seated woman plays a hurdy-gurdy | Commons image, crop checked | OK. The pairing note says "a pipe", not "a flute" |
| Not already used | No Pater in `content/paintings.yaml` (Watteau and Lancret are) | – | OK |
| Pairing | Same decade as the suite (1734 / 1738–39); French fête-galante taste; music outdoors with a wind instrument. No claim of a link between Pater and Bach | – | OK |

---

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Four suites, called *ouvertures* by Bach, not conceived as a set | Wikipedia "Orchestral suites (Bach)" https://en.wikipedia.org/wiki/Orchestral_suites_(Bach) | OK |
| Source: partially autograph parts, Leipzig 1738–39; Bach wrote the flute and viola parts | same | OK |
| The latest of the four | Breitkopf preface (search excerpt: "the one in B minor (BWV 1067) is unanimously regarded by Bach scholars as the latest"), https://issuu.com/breitkopf/docs/eb_8717_issuu ; IMSLP work info "1738–39" | OK |
| Bach resumed directing the Collegium Musicum in October 1739; the suite may have been played there | John Mangum, LA Phil note https://www.hollywoodbowl.com/musicdb/pieces/2542/orchestral-suite-no-2-in-b-minor-bwv-1067 ; Wikipedia keyboard concertos (director "again from October 1739") | OK ("may well") |
| Weekly concerts at Zimmermann's coffee house | Wikipedia keyboard concertos (History) | OK |
| Only suite with a solo instrument; flute plays almost all the time; "solo concerto" character | Instrumentation (Wikipedia); Netherlands Bach Society ("a brilliant solo part that gives the flautist almost no rest", "extravagant Italian solo concerto") https://bachvereniging.nl/en/bwv/bwv-1067 | OK |
| Scoring: transverse flute, violins I/II, viola, continuo | Wikipedia | OK |
| Rifkin: earlier version in A minor for solo violin; copying errors from a model a whole tone lower; "T" of "Traversiere" made from a "V" | Wikipedia ("Earlier version in A minor"), after Rifkin, "The B-Minor Flute Suite Deconstructed", *Bach Perspectives* 6 (2007) | OK |
| Others (Gonzalo X. Ruiz) argue for oboe; Zohn: flute possible too | same | OK ("The question is open") |
| Polonaise based on the Polish folk song "Wezmę ja kontusz" | Wikipedia | OK (song title not used in the guide) |
| Elector of Saxony also King of Poland; Bach's court title 1736 | Wikipedia "Johann Sebastian Bach" (1736: court composer to Augustus III, Elector of Saxony and King of Poland) https://en.wikipedia.org/wiki/Johann_Sebastian_Bach | OK |
| Badinerie = "jesting"; spelled "Battinerie" in the autograph part; showpiece for flautists | Wikipedia (2015 revision 692548698, citing Jeanne Swack, "Badinerie", *Oxford Composer Companions: J.S. Bach*, 1999, p. 58; current revision for "jesting" and "showpiece") | OK |
| Metres: Ouverture C – ₵ – 3/4 (closing section marked *Lentement*); Rondeau ₵; Sarabande 3/4; Bourrée ₵; Polonaise/Double 3/4; Menuet 3/4; Badinerie 2/4; all in B minor | Wikipedia 2015 revision (movement list with metrical signs) https://en.wikipedia.org/w/index.php?oldid=692548698 | OK |
| Sarabande: canon at the twelfth between flute + first violins and the bass | same; von Bülow's arrangement labels it "Canon à la 5te" (search excerpt) | OK |
| Rondeau: gavotte rhythm, phrases start mid-bar; refrain form A B A C A | bach.org education page https://bach.org/education/bwv-1067 | OK |
| Bourrée I–II then Bourrée I again; Polonaise, Double, Polonaise da capo without repeats | bach.org | OK |
| Double: melody in the continuo, ornate flute line above; sparest scoring | bach.org | OK |
| Menuet: binary, simple texture | bach.org | OK |
| Bourrée II features the flute in a running line | general description; not confirmed in a source | UNVERIFIED (listed as least certain below) |
| Overture: slow – fast (fugal) – slow; flute concertante passages in the fast section | bach.org; LA Phil note ("Its concertante passages shape the overture's harmonic course") | OK |

---

## 5. Re-time (every stop is ≈; not heard)

Method: no bar counts available; positions from the dance forms (binary with repeats, da capo returns, rondeau refrain) and the track lengths. Polonaise track split 2 : 2 : 1 (Polonaise with repeats, Double with repeats, Polonaise da capo without repeats). Ouverture: slow section with its repeat ≈ 2:20, final *Lentement* ≈ the last 55 s, by analogy with Pinnock's Suite No. 3 on the same album (slow section ≈ 1:25 each time).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Ouverture | 6:09 | 0:00, 1:10, 2:20, 2:50–4:50, 5:15 | The start of the fast section (± 20 s) and of the *Lentement* (± 20 s) |
| II Rondeau | 1:58 | 0:00, 0:30, 0:50, 1:05, Last 20 seconds | The middle refrain at 0:50 (± 10 s) |
| III Sarabande | 2:54 | 0:00, 0:30, 1:00, 2:00 | Lengths of the two halves assumed (second half twice the first) |
| IV Bourrée I–II | 1:57 | 0:00, 0:45, 1:30 | Bourrée II at 0:45 (± 10 s); the flute's running line in Bourrée II |
| V Polonaise – Double | 3:41 | 0:00, 1:30, 2:55 | Both joins ± 15 s |
| VI Menuet | 1:30 | 0:00, 0:15, 0:30, 1:00, Last 10 seconds | Half lengths assumed (8 + 16 bars) |
| VII Badinerie | 1:33 | 0:00, 0:18, 0:37, 1:05 | Half lengths assumed (about 2 : 3) |
