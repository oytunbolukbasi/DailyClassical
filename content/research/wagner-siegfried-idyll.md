# Verification: Wagner – Siegfried Idyll, WWV 103

Piece id `wagner-siegfried-idyll`. Checked on 2026-11-17 (batch November 2026, group F).
Files: `content/drafts/en/wagner-siegfried-idyll.md`, `content/drafts/tr/wagner-siegfried-idyll.md`.
Shared-file additions: `content/research/wagner-siegfried-idyll.shared.md`.

**How the checks were done.** As in `brahms-symphony-3.md` (Spotify ids from web search; embed `__NEXT_DATA__` from this machine's Turkish network; ©/℗ from the album page; dates from the MusicBrainz API with a DailyClassical User-Agent, and discography sites). Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Georg Solti / Members of the Vienna Philharmonic (Decca, 1965)

Why this one: a classic Decca recording by a reduced Vienna Philharmonic ensemble, close to the chamber character of the original, made at the end of Solti's *Ring* sessions; one track, playable in Turkey. Single-movement rule: the Idyll is one track.

Album choice: `6aVM7CJlfiajQm8dWNJmDB` ("Wagner: Overtures / Siegfried Idyll", Decca, "© / ℗ 2007 Decca Music Group Limited", 5 tracks; Idyll = track 5). Same recording on `3JvSQfijvrWUNyf4Mg8j69` (Orchestral Favourites, track 7, 18:17) and `4clpzOVyYckfHXEuFZ8gXu` (1994).

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Georg Solti / Members of the Wiener Philharmoniker; leader Walter Weller | Spotify credits track 5: "Members Of The Wiener Philharmoniker, Walter Weller, Sir Georg Solti"; MusicBrainz recording 71dd2c0e-…: conductor Solti, orchestra Wiener Philharmoniker, concertmaster Walter Weller, producer John Culshaw, engineer Gordon Parry; length 1105693 ms (matches the Spotify track) | https://musicbrainz.org/recording/71dd2c0e-d5d6-4fb6-b59b-2528a1c17d9a ; https://open.spotify.com/embed/album/6aVM7CJlfiajQm8dWNJmDB | OK |
| Recorded | 1965 | MusicBrainz: 14 November 1965; classite.com (search summary): 28 October 1965. Sources disagree; guide gives the year | MusicBrainz; https://classite.com/disk/decca-set-323-q5774 | OK (year) |
| Venue | Sofiensaal, Vienna | MusicBrainz; classite | same | OK |
| Label / catalogue | Decca SET 323 (LP, 1966, with Bruckner 7) | classite.com disc page "Decca SET 323", released 1966, Idyll credited to "Vienna Philharmonic Orchestra – Chamber Orchestra" (search summary; page returned 403 to the fetcher) | same | SECONDARY |
| Release year | 1966 | same | same | SECONDARY |
| "The year Solti and the orchestra completed their *Ring*" | Decca *Ring* recorded 1958–1965, *Die Walküre* last, in 1965 | https://en.wikipedia.org/wiki/Der_Ring_des_Nibelungen_(Georg_Solti_recording) | OK |
| Spotify | https://open.spotify.com/album/6aVM7CJlfiajQm8dWNJmDB | track 5 "Siegfried Idyll", 1105613 ms = 18:25, `isPlayable: true` | embed | VERIFIED |

### Duration (Spotify embed, album 6aVM7CJlfiajQm8dWNJmDB)

| Track | Work | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | Siegfried Idyll | 1105613 | 18:25 | true |
| | Total | 1105613 | 18:25 → `duration_min: 18` | |

---

## 2. Also recommended: Rafael Kubelík / Berliner Philharmoniker (DG, 1963)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Berliner Philharmoniker, Rafael Kubelík | Spotify credits track 4 | OK |
| Recorded / venue | February 1963, Jesus-Christus-Kirche, Berlin | MusicWeb International review of DG 453 290-2 (search summary); Idagio "℗ 1963"; one database gives February 1964 | https://musicwebinternational.com/2023/04/wagner-orchestral-music-deutsche-grammophon/ | SECONDARY |
| Catalogue | `null` | not checked | – | UNVERIFIED |
| Spotify | https://open.spotify.com/album/5SFybEoA7iKGpUwJGjR5mE ("Wagner: Siegfried Idyll; Overtures & Preludes", DG compilation "℗ 2013"); track 4 = 18:54, `isPlayable: true` | embed + album page | VERIFIED |

Also checked: Barenboim / Chicago SO (`4Nh0mORnzjIWSHD1CJED3G`, track 12, 17:33, playable; Teldec ℗ 1995). Bruno Walter / Columbia SO appears on Spotify only on budget compilations, so it was not used.

---

## 3. Painting: J. M. W. Turner, *The Red Rigi*, 1842

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | J. M. W. Turner (1775–1851) | Commons | OK |
| Date / medium / size | 1842; watercolour, wash and gouache with scratching out; 30.5 × 45.8 cm | Commons Google Art Project template (NGV data) | OK |
| Collection | National Gallery of Victoria, Melbourne | http://www.ngv.vic.gov.au/col/work/27796 (object link in the Commons file) | OK |
| Image | File:J. M. W. Turner - The Red Rigi - Google Art Project.jpg, 7480 × 4992 px | Commons API | OK |
| Rights | Artist died 1851: public domain. Commons {{PD-Art|PD-old-100-1923}}; Google Art Project scan. Not NC | Commons | OK |
| Reuse of artist | Turner is already in `paintings.yaml` twice (Hannibal, Sun Rising through Vapour). The brief allows another work only if clearly the best match: this is a view of Lake Lucerne, where Tribschen stands, in glowing light, matching Wagner's "orange sunrise". Note: the Red Rigi is usually read as an evening scene; the guide does not claim it is a sunrise | brief | Flag for the merge |
| Pairing | The Wagners lived at Tribschen on Lake Lucerne; the original title mentions the "orange sunrise" | en Wikipedia | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed secretly in 1870 for Cosima after Siegfried's birth (6 June 1869); "Fidi" | https://en.wikipedia.org/wiki/Siegfried_Idyll ; https://de.wikipedia.org/wiki/Siegfried-Idyll ("heimlich") | OK |
| First performed Christmas morning, 25 December 1870, also Cosima's (33rd) birthday; musicians of the Zurich Tonhalle orchestra; on the stairs at Tribschen; Cosima woke to it | en and de Wikipedia | OK |
| Original title "Tribschen Idyll with Fidi's birdsong and the orange sunrise, as symphonic birthday greeting"; birdsong and sunrise thought to refer to personal incidents | en Wikipedia (spelling "Triebschen" there; "Tribschener Idyll" in de) | OK |
| 13 players: flute, oboe, two clarinets, bassoon, two horns, trumpet, two violins, viola, cello, double bass | en Wikipedia | OK |
| Hans Richter learned the trumpet for its 13 bars; practised on the lake (told as a story) | en Wikipedia ("reportedly") | OK (told as a story) |
| Themes also in the final scene of *Siegfried* (love duet, Brünnhilde); lullaby "Schlaf, Kindlein, schlaf" on the oboe, jotted down on New Year's Eve 1868 | en Wikipedia | OK |
| Sold to Schott in 1878 for financial reasons; string section enlarged | en Wikipedia ("expanded the orchestration to 35 players") | OK |
| Tempo marking "Ruhig bewegt", key E major | de Wikipedia (E-Dur); score heading (IMSLP page title, common knowledge) | OK / SECONDARY (tempo) |
| Trumpet plays only at the climax | en Wikipedia ("brief trumpet part, which lasts only 13 measures"); placement at the climax from general knowledge of the score | SECONDARY |
| Birdsong and horn calls in the second half | The Listeners' Club guide (Klemperer 1961): lullaby at 4:39, "Birdsongs (around 10:32) and horn calls" | https://thelistenersclub.com/2014/12/26/siegfried-idyll-wagners-musical-love-letter/ | SECONDARY |

Not used: Wagner's claim about Villa Pellet in 1864 (contradicted by his own records), Ernest Newman's link of the lullaby to Eva, Glenn Gould's transcription.

---

## 5. Re-time

All stops are estimates (≈), and this is the weakest-sourced timing of group F: no bar-by-bar timed analysis was found. The only fixed points are from The Listeners' Club guide to Klemperer's 1961 recording (oboe lullaby 4:39, birdsong and horn calls about 10:32), moved slightly later for Solti's 18:25. The other stops were placed by the order of events in the score (strings alone → winds → lullaby → livelier middle → birdsong and horns → trumpet climax → return → coda) and the overall length. Re-time all of them by ear before publishing.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Siegfried Idyll | 18:25 | 0:00, 1:30, 4:50, 7:00, 11:00, 12:00–13:00, 14:00, Last 2 minutes | All except 0:00; especially the livelier middle (≈ 7:00), the trumpet climax (≈ 12:00–13:00) and the return (≈ 14:00) |
