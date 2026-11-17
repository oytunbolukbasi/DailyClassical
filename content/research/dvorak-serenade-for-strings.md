# Verification: Dvořák – Serenade for Strings in E major

Piece id `dvorak-serenade-for-strings`. Checked on 2026-11-17 (batch November 2026, group H).
Files: `content/drafts/en/dvorak-serenade-for-strings.md`, `content/drafts/tr/dvorak-serenade-for-strings.md`.
Shared-file additions: `content/research/dvorak-serenade-for-strings.shared.md`.

**How the checks were done**
- **Spotify:** album ids from Spotify's own web search (browser pane), then the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` ms, `isPlayable`) fetched with curl from this machine's Turkish network; album page read for `og:description`, `music:release_date`, ℗/© lines and `og:restrictions:country:allowed`.
- **Discogs** public API; **IMSLP** work page (MediaWiki API, wikitext only: movement list with bar counts and first performance; the score PDFs sit behind IMSLP's bot check, which was not bypassed); antonin-dvorak.cz; English and Japanese Wikipedia; Wikidata and Wikimedia Commons for the painting.
- Status key as in the other notes (OK / SECONDARY / UNVERIFIED).
- No personal data sent; `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Marriner / Academy of St Martin in the Fields (Argo, 1970)

Why this one: Marriner's Argo recording is the classic modern-instrument chamber-orchestra version, one track per movement, all playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Sir Neville Marriner / Academy of St Martin in the Fields | Embed credits tracks 1–5: "Antonín Dvořák, Academy of St. Martin in the Fields, Sir Neville Marriner" | https://open.spotify.com/embed/album/6tmJfuzKADjHbMG3zxGSCK | OK |
| Label / LP | Argo ZRG 670, with Grieg's Holberg Suite | Discogs 5931443: "Serenade For Strings / Holberg Suite", Argo ZRG 670, UK, 1970; directed by Sir Neville Marriner; sleeve notes Anthony Payne | https://www.discogs.com/release/5931443 | OK |
| Recorded / venue | May 1970, Kingsway Hall, London | Discogs 10830446 (Argo 478 6891, CD 8 of "The Argo Years", 2014): "First Release: 1970 (tracks 1 to 10) … Recording date: May 1970 (tracks 1 to 10) … Recording Location: Kingsway Hall, London" | https://www.discogs.com/release/10830446 | OK |
| Release year / year | 1970 | Discogs 5931443 | Discogs | OK |
| Spotify | https://open.spotify.com/album/6tmJfuzKADjHbMG3zxGSCK | "Dvořák, Grieg & Tchaikovsky: String Serenades", album, 1970, 14 songs; "℗ 1970 Decca Music Group Limited", "© 2002 Decca Music Group Limited"; TR allowed | embed + album page | VERIFIED |

### Durations and playability (embed, album 6tmJfuzKADjHbMG3zxGSCK)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Moderato | 281000 | 4:41 | true |
| 2 | II. Tempo di valse | 380000 | 6:20 | true |
| 3 | III. Scherzo. Vivace | 336000 | 5:36 | true |
| 4 | IV. Larghetto | 319000 | 5:19 | true |
| 5 | V. Finale. Allegro vivace | 366000 | 6:06 | true |
| | Total | 1682000 | 28:02 → `duration_min: 28` | |

Tracks 6–14 (Tchaikovsky's Serenade, Grieg's Holberg Suite) also playable. Note: Marriner's later Philips recording (1982, `3M5stqUYTg7cVkRQFtBQb9`, 4:10 / 6:17 / 5:23 / 5:29 / 6:06) is a different performance; do not confuse them.

---

## 2. Also recommended: Kubelík / Symphonieorchester des Bayerischen Rundfunks (Orfeo)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Rafael Kubelík, Bavarian Radio Symphony Orchestra | Embed credits, album 6wRa5i26j5o9Nxj8R7k28p | OK |
| Label / catalogue | Orfeo C 596 031 B (2003, with Symphony No. 9) | Discogs 16196091: "Herkulessaal der Münchner Residenz 25. Mai 1977 (op. 22)"; ℗ © 2003 Orfeo | https://www.discogs.com/release/16196091 | OK |
| Spotify | 2016 Orfeo album, 9 tracks: 4:28 / 6:51 / 5:23 / 5:18 / 5:56 + Symphony No. 9 (live); all `isPlayable: true`; "℗ 2016 Orfeo"; TR allowed | https://open.spotify.com/album/6wRa5i26j5o9Nxj8R7k28p | VERIFIED |

Also checked and playable: Mackerras / English Chamber Orchestra (`1A4aCUng2LMY9iW314aENC`), Orpheus Chamber Orchestra (`4MDJMoGA15Rx31jMLmhd7T`).

---

## 3. Painting: Pierre-Auguste Renoir, *Lovers* (*Milenci* / *Les Amoureux*), 1875

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Pierre-Auguste Renoir (1841–1919) | Commons; Wikidata Q20724910 | OK |
| Title / date | Lovers (Milenci, Les Amoureux), 1875 | Wikidata Q20724910 | OK |
| Medium / size | Oil on canvas, 176 × 130 cm | Wikidata P186, P2048/P2049 | SECONDARY |
| Collection | National Gallery Prague, O 3201 | Wikidata P195/P217 | OK |
| Museum page | https://sbirky.ngprague.cz/dielo/CZE:NG.O_3201 (URL pattern as for other NG Prague entries; not opened) | – | UNVERIFIED (link) |
| Image | File:1875 Renoir Liebende Nationalgalerie Prag anagoria.jpg, **8864 × 12000** px, gallery photo by anagoria. A thin strip of the frame shows along the bottom edge: crop at merge. Alternative file: File:Auguste Renoir - Lovers - Google Art Project.jpg (2420 × 3254, no frame) | https://commons.wikimedia.org/wiki/File:1875_Renoir_Liebende_Nationalgalerie_Prag_anagoria.jpg | OK |
| Rights | Commons: public domain (artist died 1919); faithful photo of a 2D PD work, no new right (EU DSM art. 14, US) | same | OK |
| Pairing | Same year as the Serenade (1875); a couple in a spring garden, for a serenade written two years after Dvořák's marriage; in Prague | – | OK |
| Reuse check | Not in `content/paintings.yaml`. Renoir is there once (*Two Young Girls at the Piano*); kept because of the same year, the subject and the Prague collection. Portrait format suits the hero | – | Note |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 3–14 May 1875, about twelve days / "within a fortnight" | https://www.antonin-dvorak.cz/en/work/serenade-for-strings/ ; https://en.wikipedia.org/wiki/Serenade_for_Strings_(Dvořák) ("said to have written … in just 12 days") | OK |
| Aged thirty-three; married two years earlier (1873) | ja.wikipedia (33歳, married 1873) ; Dvořák born 8 September 1841 | SECONDARY |
| State scholarship won for the first time; auspicious time, first successes | antonin-dvorak.cz ; ja.wikipedia (Austrian state stipend, jury incl. Brahms and Hanslick, two months before) | OK |
| Premiere 10 December 1876, Prague, Žofín Palace, Adolf Čech; immediately programmed again | antonin-dvorak.cz ; IMSLP work page ("1876-12-10 in Prague, Zofin, Filharmonia orchestra, Adolf Cech"); en.wikipedia says combined orchestras of the Czech and German theatres | OK |
| Janáček conducted it in Brno, 22 April 1877 | antonin-dvorak.cz ; en.wikipedia | OK |
| August 1877, Lipník nad Bečvou: first documented instance of Dvořák as conductor | antonin-dvorak.cz | OK |
| Five movements; all but the finale in rough ABA form; finale modified sonata form | en.wikipedia ; ja.wikipedia | OK |
| First-movement theme quoted before the finale's coda | antonin-dvorak.cz ; en.wikipedia ; ja.wikipedia | OK |
| I: violas' quaver pulse; second violins and cellos have the theme; first violins soar above; G major dotted dance from bar 31; return bar 54; 85 bars | en.wikipedia ; ja.wikipedia ; IMSLP (85 bars) | OK |
| II: waltz in C-sharp minor; second section in E; A major second theme; ff C-sharp minor close of part A; trio D-flat major; ends on C-sharp major (Picardy) | en.wikipedia ; ja.wikipedia | OK |
| III: F major, 2/4, canon technique, lyrical A major section, coda combining scherzo and trio | ja.wikipedia ; en.wikipedia ; IMSLP (323 bars) | OK |
| IV: A major, tranquil, ABA; 101 bars | en.wikipedia ; IMSLP | OK |
| V: 2/4; descending canon-like opening, dotted first theme; second theme at bar 32 over viola quavers; third theme bar 87; Larghetto recalled; recapitulation; first-movement theme; Presto coda; three E major chords; 392 bars | en.wikipedia ; ja.wikipedia ; IMSLP | OK |
| Metres I 4/4 | Inferred from the bar count (85 bars in ≈ 4:40 = ♩ ≈ 72 in 4/4) and standard editions | SECONDARY |
| Metre IV 2/4 | Not found in any source reachable without the IMSLP score; inferred (101 bars in ≈ 5:20). Could be 3/4: **check the score** | UNVERIFIED |
| The second movement's heading: "Tempo di valse" in the published score and on the album; antonin-dvorak.cz lists it as "Menuetto. Allegro con moto" (autograph heading) | antonin-dvorak.cz ; IMSLP ("Tempo di Valse, Trio. Allegro con moto") | Note: guide uses the published heading |
| Recording paired with Grieg's Holberg Suite on the first LP | Discogs 5931443 | OK |

---

## 5. Re-time

Every stop is an estimate (≈), placed from the bar counts on IMSLP (85 / 281 with da capo / 323 / 101 / 392), the bar numbers given on Wikipedia, the section structure and the exact Marriner 1970 track lengths, assuming a steady tempo. Nobody has listened against these tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Moderato | 4:41 | 0:00, 0:45, 1:40, 2:55, Last 20 seconds | The soaring first violins (≈ 0:45) |
| II Tempo di valse | 6:20 | 0:00, 0:30, 1:15, 1:55, 2:15, 4:05, Last 15 seconds | Trio entry (≈ 2:15) and da capo (≈ 4:05): the split of 281 bars between waltz and trio is assumed |
| III Scherzo: Vivace | 5:36 | 0:00, 0:50, 1:45, 3:30, 4:50, Last 15 seconds | Middle section (≈ 1:45) and return (≈ 3:30) |
| IV Larghetto | 5:19 | 0:00, 1:00, 2:05, 3:40, Last minute | Middle section boundaries |
| V Finale: Allegro vivace | 6:06 | 0:00, 0:30, 1:20, 2:05, 2:30, 5:05, Last 30 seconds | Larghetto memory (≈ 2:05), recapitulation (≈ 2:30), first-movement quotation (≈ 5:05) |
