# Verification: Brahms – Piano Concerto No. 1 in D minor, Op. 15

Piece id `brahms-piano-concerto-1`. Checked on 2026-11-17 (batch November 2026, group F).
Files: `content/drafts/en/brahms-piano-concerto-1.md`, `content/drafts/tr/brahms-piano-concerto-1.md`.
Shared-file additions: `content/research/brahms-piano-concerto-1.shared.md`.

**How the checks were done.** As in `brahms-symphony-3.md`: Spotify album ids from web search of open.spotify.com; tracks, ms durations and `isPlayable` from the embed page `__NEXT_DATA__` fetched with curl from this machine's Turkish network; ©/℗ from the album page; dates from Discogs and review/discography sites. Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Clifford Curzon / George Szell / London Symphony Orchestra (Decca, 1962)

Why this one: one of the most celebrated recordings of the concerto (a Decca "Legends" reissue; reviews of the reissues call it a classic). Three tracks, one per movement, all playable in Turkey.

Album choice: three Spotify albums carry this recording. `6brgSGvfTw48Eg5E0MtA7z` (Decca, "℗ 1962 Decca Music Group Limited", "© 1999", with Franck and Litolff) is used. `1FV2tYpmh0yjPs5qmuoW28` (Decca compilation 2009, with No. 2 under Knappertsbusch; 22:17 / 16:04 / 11:57, playable) is an equivalent fallback. `4wGx74StgjiMHMFKzUF43v` ("© Mangora Classical", 2016) is a third-party reissue and was not used.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Clifford Curzon / George Szell / London Symphony Orchestra | Spotify credits tracks 1–3: "Johannes Brahms, Sir Clifford Curzon, London Symphony Orchestra, George Szell" | https://open.spotify.com/embed/album/6brgSGvfTw48Eg5E0MtA7z | OK |
| Label / catalogue | Decca SXL 6023 (LP) | classite.com disc pages "Decca SXL 6023" and "Decca LXT 6023 (r.1962)"; rarevinyl listings of SXL 6023 (search-result summaries; classite page itself returned 403) | https://classite.com/disk/decca-sxl-6023-q299169 | SECONDARY |
| Recorded | 1962 (sessions 30 May – 1 June 1962 per secondary sources) | search summaries of the Shopify/high-def-tape-transfer notes and classite: "Kingsway Hall, London, 30 May-1 June 1962"; ontherecord.co: Culshaw and Wilkinson "engineered this recording for Decca in 1962" | https://ontherecord.co/2023/09/04/brahms-piano-concerto-no-1-curzon/ | SECONDARY (guide gives the year only) |
| Venue | Kingsway Hall, London | same | same | SECONDARY |
| Producer (in guide text) | John Culshaw | ontherecord.co (producer John Culshaw, engineer Kenneth Wilkinson) | same | SECONDARY |
| Release year | 1962 | album page ℗ 1962 | album page | OK |
| Spotify | https://open.spotify.com/album/6brgSGvfTw48Eg5E0MtA7z | "Brahms: Piano Concerto No.1 / Franck: Variations Symphoniques / Litolff: Scherzo", 5 tracks; concerto = tracks 1–3, all `isPlayable: true` | embed | VERIFIED |

### Durations (Spotify embed, album 6brgSGvfTw48Eg5E0MtA7z)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Maestoso – Poco più moderato | 1336000 | 22:16 | true |
| 2 | II. Adagio | 966000 | 16:06 | true |
| 3 | III. Rondo (Allegro non troppo) | 716000 | 11:56 | true |
| | Total (concerto) | 3018000 | 50:18 → `duration_min: 50` | |

---

## 2. Also recommended: Emil Gilels / Eugen Jochum / Berliner Philharmoniker (DG, 1972)

Same album and sources as the reference recording of `brahms-piano-concerto-2` (see `content/research/brahms-piano-concerto-2.md`: Discogs 6427864, 1070358, "Recordings: Berlin, Jesus-Christus-Kirche, 6/1972 (opp. 15 & 83)"). Re-checked today: `58JzrSl3w7rVN0OqMxCdKc` tracks 1–3 = 24:15 / 14:49 / 12:38, all `isPlayable: true`.

---

## 3. Painting: Andreas Achenbach, *Storm at the Coast* (*Uvær på kysten*), 1855

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Andreas Achenbach (1815–1910), Düsseldorf landscape and marine painter | Commons licence template (deathyear=1910) | OK |
| Date / medium | 1855; oil on wood | Nasjonalmuseet object page | OK |
| Collection | Nasjonalmuseet, Oslo, NG.M.00228 (bequest of H. Krog, 1863) | https://www.nasjonalmuseet.no/en/collection/object/NG.M.00228 | OK |
| Image | File:Andreas Achenbach - Storm at the Coast - NG.M.00228 - National Museum of Art, Architecture and Design.jpg, 4000 × 3465 px | Commons API | OK |
| Rights | Artist died 1910: public domain. Commons: {{Licensed-PD-Art|PD-old-auto-expired|cc-by-4.0|deathyear=1910}}; the museum photo (Børre Høstland) is also CC BY 4.0, but as a faithful reproduction of a PD painting it attracts no new right (EU DSM art. 14, US). Same situation as the Kittelsen and Gude/Tidemand entries already in `paintings.yaml`. Not NC | Commons | OK |
| Not already used | No Achenbach in `content/paintings.yaml` | grep | OK |
| Pairing | Brahms lived in Düsseldorf from 1854, helping Clara Schumann's household while Robert was in the asylum near Bonn (en Wikipedia, Brahms); the concerto took shape there in 1854–58. Achenbach lived and worked in Düsseldorf. No link between Achenbach and Brahms is claimed | https://en.wikipedia.org/wiki/Johannes_Brahms | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Begun 1854 as a sonata for two pianos; then a symphony (by July 1854); a piano concerto 1855–56; finished 1858 | https://en.wikipedia.org/wiki/Piano_Concerto_No._1_(Brahms) | OK |
| Joachim's advice on orchestration (more than twenty letters) | en Wikipedia (Avins) | OK |
| Schumann committed to an asylum 1854, died 1856 | en Wikipedia (concerto; Brahms) | OK |
| Premiere 22 January 1859, Hanover, Brahms soloist, received coldly; Leipzig five days later, hissed | en Wikipedia | OK |
| First movement over 20 minutes; no cadenza in the first movement; symphonic conception | en Wikipedia; http://kellydeanhansen.com/opus15.html | OK |
| I: timpani and bass pedal on D, angular theme with trills; Theme 2a in B-flat minor (strings, then oboe); fanfare in D major closing the orchestral exposition; piano enters with new material, not Theme 1; Theme 2b in F major for piano alone (*Poco più moderato*); strings take Theme 2b; development begins with fortissimo piano octaves; recapitulation with new harmonisation; Theme 2b in D major; coda with Theme 2a in D minor; tragic D minor ending | Hansen | OK |
| II: muted violins and violas, bassoon counterpoint; *Benedictus qui venit in nomine Domini* written under the opening; Schumann addressed as "Mynheer Domini"; Brahms described the movement as a portrait of Clara; middle section in B minor with clarinets in thirds; short meditative cadenza; orchestra closes, piano silent | Hansen | SECONDARY (single source for the inscription and the portrait remark; widely repeated) |
| III: rondo modelled on Beethoven's Third Concerto; piano alone first; themes share a rising shape; second theme in F major for piano alone; third theme in the strings (B-flat major); string fugato; two cadenzas; *Meno mosso* pastoral, bagpipe-like episode; coda in D major | Hansen; en Wikipedia ("coda is in the parallel major, D major") | OK |
| Curzon / Szell, Kingsway Hall, 1962, producer Culshaw | see §1 | SECONDARY |

Not used: the details of the later performances (Karlsruhe 1865, Vienna 1871, Bülow).

---

## 5. Re-time

All stops are estimates (≈). Method: Kelly Dean Hansen's guide gives bar numbers with timings for Brendel / Abbado / Berlin (Philips 420 071-2). His last timings (I m. 478 at 22:17, II m. 101 at 13:10, III m. 532 at 11:58) put the Brendel movement lengths at about 22:35, 14:00 and 12:08. Each stop's Brendel time was scaled by Curzon's track length: I × 0.986, II × 1.15, III × 0.983, rounded to 5 s. Curzon's Adagio is much slower than Brendel's, and the ratio rests on an estimated Brendel length, so II is the least reliable movement.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Maestoso | 22:16 | 0:00, 1:45 (m. 46), 2:30 (m. 64), 3:15 (m. 82), 3:35 (m. 91), 4:20 (m. 110), 6:15 (m. 157), 7:55 (m. 184), 10:40 (m. 226), 13:35–13:45 (mm. 306–310), 16:40 (m. 381), 20:50 (m. 444), Last 45 seconds | Theme 2b in D major (≈ 16:40) and coda (≈ 20:50) |
| II Adagio | 16:06 | 0:00, 1:55 (m. 14), 3:50 (m. 27–29), 6:15 (m. 45), 8:00 (m. 58), 10:15–10:45 (mm. 74–80), 13:05 (m. 95 cadenza), Last 2 minutes | All of them: the × 1.15 ratio rests on an estimated Brendel length; check the piano entry (≈ 1:55) first |
| III Rondo | 11:56 | 0:00, 0:11 (m. 9), 1:25 (m. 66), 3:00 (m. 144), 3:50 (m. 181), 5:10 (m. 238), 6:20 (m. 293–297), 8:10 (m. 376), 9:15 (m. 410), 9:55 (m. 442), 11:10 (m. 499), Last 30 seconds | *Meno mosso* (≈ 9:55) and the second cadenza (≈ 11:10) |
