# Verification: Beethoven – Piano Sonata No. 17 in D minor, Op. 31 No. 2, "Tempest"

Piece id: `beethoven-piano-sonata-17` (form `piano-sonata`; `soloists` only).
Files: `content/drafts/en/beethoven-piano-sonata-17.md`, `content/drafts/tr/beethoven-piano-sonata-17.md`. Shared-file additions: `content/research/beethoven-piano-sonata-17.shared.md`.
Checked on 2026-11-17 (batch November 2026, group A). Score: Craig Sapp's Humdrum encoding, https://github.com/craigsapp/beethoven-piano-sonatas (`kern/sonata17-1.krn` … `-3.krn`: bar numbers, tempo changes, repeat structure, dynamics). Its numbering counts first/second endings separately (232 bars in I against 228 in editions). Status key: VERIFIED / SECONDARY / INFERRED.

---

## 1. Reference recording: Maurizio Pollini (DG, rec. June 1988)

My choice: a widely admired recording, one track per movement, already named as an alternative in `research/beethoven-piano-sonata-21.md` §2.

### Spotify embed check

Album `5sZTnaIepkONvTzlmrb755`: *Beethoven: Piano Sonatas Nos.17 "The Tempest", 21 "Waldstein", 25 & 26 "Les Adieux"*, 12 tracks credited "Ludwig van Beethoven, Maurizio Pollini". Embed fetched 2026-11-17 from a Turkish network: https://open.spotify.com/embed/album/5sZTnaIepkONvTzlmrb755

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| **1** | **Piano Sonata No. 17 in D Minor, Op. 31 No. 2 "Tempest": I. Largo – Allegro** | **8:38** | 518799 | **true** |
| **2** | **… II. Adagio** | **7:51** | 471640 | **true** |
| **3** | **… III. Allegretto** | **6:04** | 364306 | **true** |
| 4–12 | Sonatas Nos. 21, 25, 26 | | | true |

Total 1 354 745 ms = 22:35 → `duration_min: 23`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Pianist | Maurizio Pollini | Same | embed | VERIFIED |
| Label / catalogue | DG, 427 642-2 (CD, with Sonatas Nos. 21, 25 & 26) | MusicBrainz release *Sonaten Opp. 31/2 "Der Sturm", 53 "Waldstein", 79, 81a "Les Adieux"*, DG 427 642-2, 1989-05-02; same 12-track order as the Spotify album | https://musicbrainz.org/release/c334e2bd-1def-4b26-a749-1f58073d5018 | VERIFIED (that Spotify mirrors this CD is INFERRED from title, order and coupling; MusicBrainz has no Spotify link for it) |
| Recorded / venue | June 1988, Herkulessaal, Munich | MusicBrainz: every track "recorded at Herkulessaal, 1988-06" | same (API, `inc=recording-level-rels+place-rels`) | VERIFIED (secondary) |
| release_year / year | 1989 | Release date 1989-05-02 | same | VERIFIED |

MusicBrainz CD lengths: 8:44 / 7:54 / 6:16 (523760 / 473800 / 375706 ms); Spotify 5–11 s shorter per track (probably trailing silence).

**Also recommended:** none added (not verified in time).

---

## 2. Facts

Sources: en.wikipedia https://en.wikipedia.org/wiki/Piano_Sonata_No._17_(Beethoven) ; de.wikipedia https://de.wikipedia.org/wiki/Klaviersonate_Nr._17_(Beethoven)

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written 1801–02; `year: 1802` | en.wikipedia; de.wikipedia ("1801 bis 1802") | SECONDARY |
| Aged about thirty-one | Born Dec 1770 | VERIFIED |
| Second of three sonatas published together as Op. 31 | Opus number; en.wikipedia title | VERIFIED |
| April 1802: brother Karl offered it to Breitkopf & Härtel; already promised to Nägeli in Zurich; violent quarrel | de.wikipedia, Entstehungsgeschichte ("am 22. April 1802 bot Beethovens Bruder Karl sie dem Verlag Breitkopf & Härtel an. Das führte zu einem heftigen Streit … Nägeli in Zürich versprochen") | SECONDARY |
| Heiligenstadt Testament, October 1802 | en.wikipedia, Historical context ("the famous Testament of 6 and 10 October") | SECONDARY |
| Nickname from Schindler: "read Shakespeare's Tempest" (asked about this sonata and the Appassionata); Schindler often unreliable; may have meant a different book | en.wikipedia ("Controversy over the name"; C. C. Sturm's *Reflections on the Works of God in Nature*) | SECONDARY. Quote paraphrased as "Just read Shakespeare's *Tempest*" (the wording varies between sources) |
| I: opening rolled A major chord, Largo, pp; Allegro sighs; second Largo chord; theme 1 at bar 21 (rising bass triad answered by right hand, triplets); theme 2 at bar 41 in A minor | de.wikipedia, Erster Satz; Humdrum (tempo changes bars 1/2/6/7/8; *f* bar 21; *fp* bar 41) | SECONDARY / score |
| I: development begins with three rolled Largo chords, pp | de.wikipedia ("Die Durchführung beginnt mit drei arpeggierten Akkorden, wieder Largo und pianissimo"); Humdrum Largo bars 97–102 | VERIFIED |
| I: recitatives at the start of the recapitulation | en.wikipedia ("a long recitative section at the beginning of this movement's recapitulation"); Humdrum Largo bars 147 and 157 with "con espressione e semplice" (148, 159) | VERIFIED |
| I: ends softly | Humdrum *p* / *pp* bars 221–223 to the end | VERIFIED (score) |
| I: exposition repeat in Pollini, back to the Largo | Humdrum expansion `[A,A1,A,A2,B]`, A starting at bar 1. Without it the Allegro would be ≈ 1.96 s a bar (quarter ≈ 122), too slow; with it ≈ 1.31 s a bar | INFERRED – check by ear |
| II: opens with a rolled low chord answered in the treble; from bar 17 chords over "tremolo" octaves in the deep bass (the drum-like figure); F major interlude bars 31–37; harmony frozen bars 38–41; *sf* bar 42 leads back to theme 1 | de.wikipedia, Zweiter Satz; Humdrum bass triplet-32nd figures bar 17 | SECONDARY / score |
| II: sonata form without a substantial development | en.wikipedia | SECONDARY |
| II: Tovey: think of Miranda at bars 31–38; warns against identifying the other characters | en.wikipedia quoting Tovey, *A Companion to Beethoven's Pianoforte Sonatas* | SECONDARY. Paraphrased (Tovey died 1940; no quotation used) |
| II: second theme returns in B-flat at bar 73 | Humdrum ("cantabile" bar 73, matching bar 31) | INFERRED from the score |
| III: continuous semiquaver motion | de.wikipedia ("durchlaufende Sechzehntelmotorik") | SECONDARY |
| III: development climax bars 169–173; right-hand cadenza-like passage before the recapitulation; ff falling chromatic scale bar 381 | en.wikipedia; Humdrum (left hand silent bars 200–214; *ff* bar 381) | VERIFIED |
| III: theme 2 at bar 43 | Humdrum (*f* bar 43) | INFERRED (placement) |
| III: repeat of bars 1–94 in Pollini | Humdrum expansion `[I,A,A,B]`; with the repeat ≈ 0.74 s a bar (dotted quarter ≈ 81), without ≈ 0.91 (≈ 66, slow for Pollini) | INFERRED – check by ear |
| III: "like a horse's hoofbeats or turning wheels" | Our simile. (Czerny's story that a galloping rider inspired the finale was not checked and is not told) | – |

---

## 3. Painting: John William Waterhouse, *Miranda – The Tempest*, 1916

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | John William Waterhouse (1849–1917), *Miranda – The Tempest*, 1916 | Commons file description; Wikidata Q21175317 | VERIFIED (secondary) |
| Collection | Private collection (sold at Sotheby's New York, 2009, per another Commons file's source line) | Commons `File:Miranda - The Tempest JWW.jpg` source (Sotheby's 2009 lot 56) | SECONDARY |
| Rights | Artist died 1917. `{{PD-Art|PD-old-auto-expired|deathyear=1917}}` | https://commons.wikimedia.org/wiki/File:Waterhouse_miranda_the_tempest.jpg | VERIFIED. Not NC |
| Image | **3000 × 2255**; checked visually (thumbnail): unframed, but colours look saturated (source is a fan site, johnwaterhouse.com) | Commons API imageinfo | VERIFIED; colour fidelity uncertain |
| Not already used | Waterhouse not in `content/paintings.yaml` (checked 2026-11-17) | – | VERIFIED |

**Pairing.** The nickname comes from Shakespeare's play (via Schindler); Tovey suggested Miranda for the slow movement's gentle melody (bars 31–38). The painting shows Miranda on the shore watching the ship break up in Prospero's storm. The pairing note claims only that. 1916 is late for an 1802 sonata, and the image is from a private collection, so the alternatives (both 1803 or museum-held) are offered.

---

## 4. Glossary

Existing terms reused: recitative, sonata form, recapitulation, exposition, development, coda. **No new terms.**

---

## 5. Re-time

No stop was heard. Derived from Humdrum bar positions × average seconds per bar.

- I (track 1, 518.8 s): slow bars (Largo/Adagio: 1, 6, 7, 97–102, 147–151, 156–162, plus the repeat of 1/6/7) ≈ 5 s each (≈ 120 s); fast bars with the exposition repeat ≈ 304 → ≈ 1.31 s a bar. Theme 1 bar 21 → 0:37; theme 2 bar 41 → 1:03; repeat → 2:12; development (bar 97) → 4:24; Allegro bar 103 → 4:54; recapitulation bar 143, first recitative bar 147 → 5:51; second recitative bar 157 → 6:25; Allegro bar 163 → 7:00.
- II (track 2, 471.6 s; 103 bars of 3/4): ≈ 4.57 s a bar. Drum figure bar 17 → 1:13; theme 2 bar 31 → 2:17; frozen chord bar 38 → 2:49; return bar 43 → 3:12; theme 2 bar 73 → 5:29; coda ≈ bar 89 → 6:42.
- III (track 3, 364.3 s; 399 bars of 3/8, bars 1–94 repeated → 493 played): ≈ 0.74 s a bar. Theme 2 bar 43 → 0:31; repeat → 1:09; development bar 95 → 2:19; climax bars 169–173 → 3:15; right hand alone bar 200 → 3:37; recapitulation bar 215 → 3:48; chromatic scale bar 381 → 5:51.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Largo – Allegro | 8:38 (track 1) | 0:00, 0:35, 1:05, 2:10, 4:25, 4:55, 5:50, 6:25, Near the end | 2:10 (repeat assumed); 5:50 and 6:25 depend on how long Pollini holds the recitatives |
| II Adagio | 7:51 (track 2) | 0:00, 1:15, 2:20, 2:50, 3:15, 5:35, Near the end | 5:35 |
| III Allegretto | 6:04 (track 3) | 0:00, 0:30, 1:10, 2:20, 3:15, 3:35, 5:50, Near the end | 1:10 (repeat assumed; without it every later stop moves ≈ 1:10 earlier) |
