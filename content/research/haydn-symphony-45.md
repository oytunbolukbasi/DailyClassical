# Verification: Haydn – Symphony No. 45 in F-sharp minor, Hob. I:45, "Farewell"

Piece id: `haydn-symphony-45` (form `symphony`). Composer `haydn` already in `content/composers.yaml`.
Files: `content/drafts/en/haydn-symphony-45.md`, `content/drafts/tr/haydn-symphony-45.md`; shared-file additions in `content/research/haydn-symphony-45.shared.md`.
Checked on 2026-11-17 (November 2026 batch, group C). Method: Spotify embed `__NEXT_DATA__` fetched with curl from a Turkish network; album page meta tags (release date, ℗ line); Discogs API; MusicBrainz web service; English Wikipedia (wikitext); Wikimedia Commons API. Generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent.

**Status key:** VERIFIED = confirmed in the source named. INFERRED = from the score as described in secondary sources or from timings, not confirmed. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Antal Doráti / Philharmonia Hungarica (Decca, 1970)

Why this one: part of Doráti's complete Decca cycle of the Haydn symphonies, long the standard reference; one Spotify track per movement, the finale (Presto – Adagio) as **one** track. Rejected: Pinnock / The English Concert (DG `694vIW92umk4KmcJl4U0n6`, finale split into "IV a. Presto" 2:47 and "IV b. Adagio" 4:25), Antonini / Il Giardino Armonico (Alpha `1DCE8XzsKUiSDZ7HkTuxvp`, finale split 2:51 + 4:25) and Goodman / Hanover Band (Hyperion `063Pzqy0ybIqkLrzRNkLhT`, split 2:48 + 5:13): all break the one-track-per-movement rule.

### Spotify embed check (album `3eu3putbIawJBFE4HNS4WP`)

*Haydn: Symphonies Nos.45,47 & 48*, 12 tracks, credited "Joseph Haydn, Philharmonia Hungarica, Antal Doráti". Album page meta: release date 1972-01-01; "℗ 1972 Decca Music Group Limited", "© 2001 Decca Music Group Limited".

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Symphony in F sharp minor, H.I No.45 -"Farewell": 1. Allegro assai | 4:47 | 286500 | true |
| 2 | … 2. Adagio | 8:00 | 480000 | true |
| 3 | … 3. Menuet (Allegretto) | 4:35 | 275266 | true |
| 4 | … 4. Finale (Presto - Adagio) | 8:50 | 530000 | true |
| 5–12 | Symphonies Nos. 47 and 48 | | | true |

Total No. 45: 1571.8 s = 26:12 → `duration_min: 26`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Antal Doráti; Philharmonia Hungarica | Spotify credits; Discogs 9453663 (Decca 467 449-2): "Conductor – Antal Dorati; Orchestra – Philharmonia Hungarica" | https://www.discogs.com/release/9453663 | VERIFIED |
| CD = the Spotify album | 467 449-2 | MusicBrainz release 3518c292 (Decca 467 449-2DEQ): same 12 tracks in the same order, lengths within 1 s of Spotify (285533 / 481893 / 275320 / 536693 ms; the finale differs by 6.7 s, probably silence at the end) | https://musicbrainz.org/release/3518c292-8255-48c8-b084-87b3f72c25ca | VERIFIED |
| Original release | HDNC 13-18 (LP box, Symphonies 36–48), 1972 | Discogs 4824000: Decca HDNC 13-18, 1972, "Recorded at St. Boniface Kirche, Marl"; producer James Mallinson, engineer Colin Moorfoot; notes by H. C. Robbins Landon | https://www.discogs.com/release/4824000 | VERIFIED |
| Recorded / venue | 11–28 November 1970, St. Bonifatius Kirche, Marl | Discogs 6743163 (Decca 478 1221, *The Complete Symphonies*, 2009), booklet notes: "Symphonies Nos. 43 to 45, and 82 to 86 recorded at St. Bonifatius Kirche, Marl, 11-28 November 1970" | https://www.discogs.com/release/6743163 | VERIFIED |
| In this recording: first widely issued complete Haydn cycle, 1969–1972; orchestra founded 1956 near Vienna by Hungarian refugees | Wikipedia *Philharmonia Hungarica*: founded in Baden bei Wien by Hungarian musicians who fled after 1956; Doráti's Decca cycle "widely reported as the first", although Märzendorfer's earlier set had a very limited release (hence "first widely issued"). Dates 1969–1972: Discogs 6743163 (first sessions June–July 1969, Bielefeld) and the last volumes released 1972 | https://en.wikipedia.org/wiki/Philharmonia_Hungarica | VERIFIED (cautious wording) |

**Repeats (inferred, affects stops in I).** Doráti I = 4:47 against Mackerras (all repeats) 7:07: ratio 1.49. With the exposition about a third of one pass, exposition repeat only = 4 units against 6 units for both repeats (ratio 1.5), so Doráti most likely repeats the exposition only, at a tempo close to Mackerras's. In II, Doráti 8:00 against Mackerras 14:27 (1.81) and Rolla (Hungaroton, 6:58, probably no repeats): taken as **no repeats** at a broad tempo. **Both are inferences.**

## 2. Also recommended: Sir Charles Mackerras / Orchestra of St. Luke's (Telarc, 1988)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `1FPqDOkEvQWupN7OoWBtZl` | *Haydn: Symphonies Nos. 31 "Hornsignal" & 45 "Farewell"*, 8 tracks; No. 45 = tracks 5–8: 7:07 (427133) / 14:28 (867666) / 4:45 (284533) / 7:57 (476506), all `isPlayable: true`; finale one track "IV. Finale. Presto - Adagio" | https://open.spotify.com/embed/album/1FPqDOkEvQWupN7OoWBtZl | VERIFIED |
| Label / catalogue / release | Telarc CD-80156, 1989 | Discogs 2936092 | https://www.discogs.com/release/2936092 | VERIFIED |
| Recorded / venue | 8–9 November 1988, John Harms Center for the Arts, Englewood, New Jersey | Discogs 2936092 notes | same | VERIFIED |

Also checked: Doráti / London Symphony Orchestra (Mercury 1962, `7F8hEJUW36XX9KeK3YezLL`, one finale track 10:39, playable): not used.

---

## 3. Facts in the guide

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written 1772 (date on the autograph) | Wikipedia *Symphony No. 45 (Haydn)* ("dated 1772 on the autograph score") | VERIFIED |
| Haydn aged forty; music director to Prince Nikolaus Esterházy | Haydn born 31 March 1732 (`composers.yaml`); Wikipedia (Kapellmeister; patron Nikolaus I) | VERIFIED |
| Court at Eszterháza, the prince's favourite summer palace in rural Hungary; "new" palace | Wikipedia (Eszterháza "favorite summer palace … in rural Hungary"). The palace was built from the 1760s; "new" is standard but not in the article fetched | VERIFIED / "new": general knowledge, low risk |
| Story told by Haydn in old age to his biographers Dies and Griesinger | Wikipedia ("told by Haydn in old age to his biographers Albert Christoph Dies and Georg August Griesinger") | VERIFIED |
| Stay longer than expected; musicians' wives left at home in Eisenstadt | Wikipedia | VERIFIED |
| Players stop, snuff out the candle on the music stand, leave; two muted violins at the end, Haydn and concertmaster Luigi Tomasini | Wikipedia (citing Mordden 1980) | VERIFIED (secondary) |
| Prince understood; court returned to Eisenstadt the next day ("according to the story") | Wikipedia ("Esterházy seems to have understood the message: the court returned to Eisenstadt the day following the performance") | VERIFIED, told as the story |
| F-sharp minor: apparently the only known 18th-century symphony in this key | Wikipedia, citing Webster (1991: 3) | VERIFIED (cautious "seems to be") |
| Special half-step slides ordered for the horns | Wikipedia: order signed 22 October 1772 for two "Halbthönige Krummbögen" (Webster 1991: 2) | VERIFIED |
| Instrumentation (oboes, bassoon, horns, strings); four violin parts in the final Adagio | Wikipedia | VERIFIED |
| Movement tempos, keys, metres (I 3/4 F♯ minor; II 3/8 A major; III 3/4 F♯ major; IV 2/2 F♯ minor → 3/8 A major – F♯ major) | Wikipedia | VERIFIED |
| I: descending minor arpeggios in first violins, syncopated second violins, held wind chords | Wikipedia | VERIFIED |
| I: exposition moves to C-sharp minor, not the relative major | Wikipedia | VERIFIED |
| I: a new theme near the end of the development, in D major, minuet-like, never brought back | Wikipedia ("just before the recapitulation … new material is introduced"); Churgin (1998) on the Farewell's lyrical, minuet-like development theme closing the development (search snippet, https://is.muni.cz/el/phil/podzim2023/HV_628/um/Churgin-BeethovenNewDevelopmentTheme-1998.pdf); D major from a programme-note blog (https://themusicsalon.blogspot.com/2013/10/haydn-symphony-no-45-in-f-minor-farewell.html) | VERIFIED (key from a secondary source) |
| II: muted violins, "hiccuping" repeated-note motif; major/minor alternation; dissonant suspensions over the bar line, extended in the recapitulation; Webster hears longing for home | Wikipedia | VERIFIED |
| III: F-sharp major; final cadence of each section weak, on the third beat | Wikipedia | VERIFIED |
| III: trio brings horns and oboes forward | Score as remembered; not in a fetched source | INFERRED – check by ear |
| IV: Presto in sonata form; recapitulation ends in what sounds like the end, breaks off on a dominant (open) chord; Adagio in 3/8 from A major to F-sharp major | Wikipedia | VERIFIED |
| IV: order of departure (oboe 1 + horn 2 with solos, bassoon, oboe 2 + horn 1, double bass solo, cello, orchestral violins, viola; first-chair violins remain) | Wikipedia | VERIFIED |
| Sturm und Drang period | Wikipedia ("typical of Haydn's Sturm und Drang period") | VERIFIED |

---

## 4. Painting: Georges de La Tour, *The Magdalen with the Smoking Flame*, c. 1635–37

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Georges de La Tour (1593–1652), *The Magdalen with the Smoking Flame* | https://collections.lacma.org/node/238963 | VERIFIED |
| Date | LACMA collection record: c. 1635–37. Google Art Project data on Commons and a 2015 LACMA blog post give c. 1638–40; the guide follows the museum's current record | LACMA page above; Commons file page | VERIFIED, dates differ |
| Collection | Los Angeles County Museum of Art, M.77.73, Gift of The Ahmanson Foundation; oil on canvas, 117 × 91.8 cm | LACMA; Commons Google Art Project template | VERIFIED |
| Public domain | Artist died 1652. Commons `{{PD-Art|PD-old-100-1923|deathyear=1652}}`; Google Art Project record "object_rights = Public Domain"; LACMA releases public-domain images without restriction | https://commons.wikimedia.org/wiki/File:Georges_de_La_Tour_-_The_Magdalen_with_the_Smoking_Flame_-_Google_Art_Project.jpg | VERIFIED |
| Image | 4017 × 5121 px (portrait, 0.78:1), Google Art Project | Commons API | VERIFIED |
| Not already used | No La Tour in `content/paintings.yaml` (checked 2026-11-17) | – | VERIFIED |

Pairing: the link is the candles. In the finale each player snuffed out the candle on his stand before leaving, until two violins played on by the last lights (Wikipedia); La Tour's painting is a single candle burning in a dark room. The painting is a century older than the symphony and a religious subject; the pairing note claims only the candle and the mood. Alternatives in the shared note.

---

## 5. Re-time

No stop was timed by ear. Bar numbers could not be checked against a score (none fetched); stops come from section proportions in published descriptions and the exact track lengths, with the repeat inferences in §1.

Assumptions: I – one pass ≈ exposition 1/3, development 1/3 (new D major theme in its last part), recapitulation 1/3; exposition repeated; ≈ 71 s per exposition. II – no repeats; exposition ≈ 40 %, development ≈ 20 %, recapitulation ≈ 40 %. III – minuet with repeats ≈ 42 %, trio with repeats ≈ 29 %, da capo ≈ 29 %. IV – Presto (with exposition repeat) ≈ 2:45, Adagio ≈ 6:00; departures placed proportionally through the Adagio.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 4:47 | 0:00, 0:35, 1:12, 2:25, 3:00, 3:35, near the end | 3:00 and 3:35: position of the D major theme and the recapitulation; all shift if Doráti does not repeat the exposition |
| II | 8:00 | 0:00, 1:20, 2:20, 3:10, 4:50, 6:20, near the end | Whether Doráti repeats the exposition (if so, 3:10 is the repeat, and later stops move) |
| III | 4:35 | 0:00, 1:55, 3:15, near the end | Trio start; whether the da capo keeps its repeats |
| IV | 8:50 | 0:00, 2:45, 2:50, 4:00–5:30, 5:45, 6:45, last minute | Length of the Presto (2:45/2:50); the departures inside the Adagio |

## 6. Open items

1. Re-time every stop against Spotify `3eu3putbIawJBFE4HNS4WP`, tracks 1–4; first confirm the repeats in I and II.
2. Confirm by ear that the trio of III brings horns and oboes forward.
