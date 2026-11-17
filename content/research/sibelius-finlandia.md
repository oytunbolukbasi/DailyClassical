# Verification: Sibelius – Finlandia, Op. 26

Piece id `sibelius-finlandia`. Checked on 2026-11-17 (batch November 2026, group H).
Files: `content/drafts/en/sibelius-finlandia.md`, `content/drafts/tr/sibelius-finlandia.md`.
Shared-file additions: `content/research/sibelius-finlandia.shared.md`.

**How the checks were done**
- **Spotify:** album ids from Spotify's own web search (browser pane); albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from this machine's Turkish network; album page for ℗/©, release date and `og:restrictions:country:allowed`.
- **Discogs** public API; Classite and Gramophone (via search summary) for the session date; **IMSLP** work page (API wikitext: key, premiere, first editions); English and Japanese Wikipedia; Wikimedia Commons and Wikidata for the paintings. sibelius.fi did not return usable pages to curl or WebFetch (redirects).
- Status key as in the other notes. No personal data sent; `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Karajan / Berliner Philharmoniker (DG, 1984)

Why this one: Karajan's digital Berlin recording is one of the best-known *Finlandia* recordings; one track, playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Herbert von Karajan / Berliner Philharmoniker | Embed credits track 1: "Jean Sibelius, Berlin Philharmonic, Herbert von Karajan" | https://open.spotify.com/embed/album/4EHR0kyDonVmJw4FeHUsWi | OK |
| Label / catalogue | Deutsche Grammophon 413 755-2 | Discogs 17277589 (CD, 1984): "Digital Recording", ℗ 1984 Polydor International; engineer Günter Hermanns; LP 413 755-1 (Discogs 1795278): producer Günther Breest, recording supervisor Michel Glotz; Finlandia 9:22–9:23 | https://www.discogs.com/release/17277589 ; https://www.discogs.com/release/1795278 | OK |
| Recorded / venue | February 1984, Philharmonie, Berlin | Classite (via search summary): Finlandia, Swan of Tuonela, Valse triste recorded 24 February 1984, Philharmonie, Berlin; Gramophone reviewed the disc in October 1984 | https://classite.com/disk/dgg-413755-q81277 ; https://gramophone.co.uk/review/sibelius-orchestral-works-42 | SECONDARY |
| Release year | 1984 | Discogs ; Spotify `music:release_date` 1984-01-01 | – | OK |
| Spotify | https://open.spotify.com/album/4EHR0kyDonVmJw4FeHUsWi | "Sibelius: Finlandia; Valse triste; Tapiola; The Swan of Tuonela", 1984, 4 songs, "℗ 1984 Deutsche Grammophon GmbH, Berlin"; TR allowed | embed + album page | VERIFIED |

### Duration and playability (embed, album 4EHR0kyDonVmJw4FeHUsWi)

| Track | Work | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Finlandia, Op. 26 | 565893 | 9:26 | true |
| | Total | 565893 | 9:26 → `duration_min: 9` | |

One track, as required for a single-movement work. Karajan's earlier DG recording (1964) is on `29Vt4Kwx9hYk0hKHPigsmb` (track 1, "Recorded 1964", 9:27, playable).

---

## 2. Also recommended: Neeme Järvi / Gothenburg Symphony Orchestra (DG)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Neeme Järvi, Gothenburg Symphony Orchestra | Embed credits, album 0nKRgooVdLKKd3NG2iPyWw (track 12) | OK |
| Label / catalogue | DG 447 760-2 (1996-03) | Discogs 4274539: "Recordings: Göteborg, Konserthuset, 9/1992 (Finlandia) …"; ℗ 1996 | https://www.discogs.com/release/4274539 | OK |
| Spotify | Track 12, 9:11, `isPlayable: true`; ℗ 1996 DG; TR allowed | https://open.spotify.com/album/0nKRgooVdLKKd3NG2iPyWw | VERIFIED |

---

## 3. Painting: Pekka Halonen, *Washing on the Ice* (*Pyykillä* / *Vid vaken*), 1900

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Pekka Halonen (Finnish, 1865–1933) | Commons Creator template | OK |
| Title / date | Washing on the Ice (sv. *Vid vaken*), 1900 | Commons (Google Cultural Institute data) | OK |
| Medium / size | Oil on canvas, 125 × 180 cm | same | OK |
| Collection | Ateneum Art Museum, Finnish National Gallery, Antell Collections, A II 782:11 (added 22.2.1902) | same; FNG record link given there: http://kokoelmat.fng.fi/wandora/w?si=A+II+782%3A11 | OK |
| Image | File:Pekka Halonen - Washing on the Ice - Google Art Project.jpg, 4001 × 2837 px | https://commons.wikimedia.org/wiki/File:Pekka_Halonen_-_Washing_on_the_Ice_-_Google_Art_Project.jpg | OK |
| Rights | Commons: public domain (artist died 1933, more than 70 years); faithful reproduction of a 2D work | same | OK |
| Pairing | Painted 1900, the year of *Finlandia*'s first performance; Halonen was one of the national-romantic artists, settled on Lake Tuusula (from 1895, villa Halosenniemi 1901–02), the artists' community where Sibelius built his home Ainola in 1904 | https://en.wikipedia.org/wiki/Pekka_Halonen ; Ainola: general | SECONDARY |
| Reuse check | Not in `content/paintings.yaml`; Halonen not used before | – | OK |

**Why not the most obvious match.** Edvard Isto's *The Attack* (*Hyökkäys*, 1899, National Museum of Finland, H30058): the Russian double eagle tearing the law book from the Finnish Maiden, painted against the same February Manifesto that led to the Press Celebrations. It is the closest match in subject and year, but the only faithful scan on Commons is 1136 × 1584 px (the museum's press image); the other copies are an angled snapshot with frame and a CC BY-SA photo. Listed as alternative 1: use it if a larger public-domain scan turns up.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Finland a grand duchy of the Russian Empire; February Manifesto 1899; growing censorship | https://en.wikipedia.org/wiki/Finlandia ("covert protest against increasing censorship from the Russian Empire") ; ja.wikipedia (2月宣言) | OK |
| Press Celebrations, Helsinki, November 1899; tableaux of Finnish history from the time of the Kalevala; last tableau "Finland Awakes"; music by Sibelius | en.wikipedia (list of tableaux) ; ja.wikipedia | OK |
| Reworked as a separate piece; premiere 2 July 1900, Helsinki, Helsinki Philharmonic Society, Robert Kajanus | en.wikipedia ; IMSLP | OK |
| Title *Finlandia* suggested by Axel Carpelan (November 1900), first used for the orchestral version in February 1901 | ja.wikipedia | SECONDARY |
| Played under other titles, e.g. "Impromptu", under Russian rule | en.wikipedia (quoting Finland's tourism website) | SECONDARY: told as "is said to" / "reportedly" |
| Hymn is Sibelius's own, not a folk tune | en.wikipedia | SECONDARY (ja.wikipedia notes a 2003 thesis proposing the opening was borrowed from Emil Genetz's 1881 song *Herää Suomi!*; not mentioned in the guide) |
| Words by Veikko Antero Koskenniemi, 1941; second patriotic song after the national anthem | en.wikipedia ; ja.wikipedia | OK |
| Sung as a church hymn, e.g. "Be Still, My Soul" | en.wikipedia | OK |
| Key: F minor, ends in A-flat major | IMSLP ("f (ends in A-flat)") ; ja.wikipedia (A-flat major main section) | OK |
| Structure: Andante sostenuto (heavy brass, plaintive woodwinds, strings and timpani) – Allegro moderato (brass rhythm over timpani tremolo, cymbals) – Allegro (A-flat major) – hymn – Allegro – triumphant close | ja.wikipedia ; en.wikipedia | OK |
| Hymn first in the woodwinds, then in the strings | Standard description | SECONDARY |
| Typical performance 7½–9 minutes | en.wikipedia | OK |
| Karajan recorded it for DG with the Berlin Philharmonic in 1964 and again in 1984 | Spotify track title "Finlandia, Op. 26 - Recorded 1964" (album 29Vt4Kwx9hYk0hKHPigsmb, DG) ; Discogs 17277589 | OK |

---

## 5. Re-time

Every stop is an estimate (≈), placed from the section plan (ja.wikipedia: introduction A Andante sostenuto, introduction B Allegro moderato, A Allegro, B hymn, A) scaled to Karajan's broad 9:26 (about 18% slower than a typical eight-minute performance, with the slow introduction taking more of the extra time). No bar counts used. Nobody has listened against the track.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Andante sostenuto – Allegro moderato – Allegro | 9:26 | 0:00, 1:10, 2:05, 3:00, 4:05, 5:25, 6:15, 7:10, Last minute | Start of the Allegro moderato (≈ 3:00) and the hymn (≈ 5:25): find the hymn first |
