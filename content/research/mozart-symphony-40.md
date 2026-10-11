# Verification: Mozart – Symphony No. 40 in G minor, K. 550

Files: `content/en/pieces/mozart-symphony-40.md`, `content/tr/pieces/mozart-symphony-40.md`.
The original verification (recording, painting, facts) is in `verification-1-5.md` §1 (checked 2026-10-04). This file only records the October 2026 recording change.

---

## Recording change (Oct 2026)

**Why.** Checked on 2026-10-11 from a Turkish IP with the Spotify embed page (`__NEXT_DATA__`, `isPlayable` per track): on the Mackerras / SCO album `0MNU78TPr4GbVdgRBsBL6L` (Linn, 2008 edition) track 11, the finale of No. 40 (566 813 ms), is `COUNTRY_RESTRICTED` (so are tracks 1 and 3, Symphony No. 38). Tracks 8–10 (No. 40 I–III) and 12–15 (No. 41) are playable. `mozart-symphony-41` keeps that album (all its tracks are playable) and was **not** changed.

**Choice.** Two fully playable options were found:

| Album | Performance | No. 40 tracks | Decision |
| --- | --- | --- | --- |
| `1EsOER6UdNfA5Lliol1o73` | Mackerras / SCO (same recording as before), "Mozart: Symphonies Nos. 38-41", © / ℗ 2018 Linn Records | 8–11, all playable | **chosen** |
| `2rq5Iu6Ox0TCICD2N685Y6` | Harnoncourt / Concentus Musicus Wien (Sony, 2014), the existing `also_recommended` | 5–8, all playable (447 013 / 728 293 / 259 066 / 636 986 ms) | kept as `also_recommended` |

The brief's first preference was the existing `also_recommended` (Harnoncourt). It was not promoted because (1) the brief also asks for a widely admired recording, and Harnoncourt's 2014 set divides critics (MusicWeb International, http://www.musicweb-international.com/classrev/2014/Oct14/Mozart_sys_88843026352.htm, finds it mannered: "He seems to be getting stranger with age"); (2) his finale starts the development "with a series of pauses, long and longer" (same review), which contradicts the guide's stop text ("a jagged, stumbling passage … lasts only a few seconds"); (3) Linn's other edition is the same Mackerras performance, so the published guide's text stays true and it still matches `mozart-symphony-41`. If the product owner prefers Harnoncourt, the stops need re-placing for 7:27 / 12:08 / 4:19 / 10:37 and the IV development text needs rewriting.

**New reference: Spotify https://open.spotify.com/album/1EsOER6UdNfA5Lliol1o73**, "Mozart: Symphonies Nos. 38-41", 15 tracks, **all 15 playable** in Turkey (2026-10-11). Tracks credited "Wolfgang Amadeus Mozart, Scottish Chamber Orchestra, Sir Charles Mackerras". Album page: date 2008-07-01, "© 2018 Linn Records, ℗ 2018 Linn Records" (a later digital delivery; the recording is CKD 308).

| Track | Title (Spotify) | ms (new) | ms (old album 0MNU…) | Guide |
| --- | --- | --- | --- | --- |
| 8 | Symphony No. 40 in G Minor, K. 550: I. Molto allegro | 425 958 | 427 053 | I = 7:06 (was 7:07) |
| 9 | … II. Andante | 805 249 | 805 226 | II = 13:25 |
| 10 | … III. Menuetto (Allegretto) | 243 416 | 243 400 | III = 4:03 |
| 11 | … IV. Finale (Allegro assai) | 555 916 | 566 813 (blocked) | IV = 9:16 (was 9:27) |
| | Total | 2 030 539 | | 33:51 → `duration_min: 34` (unchanged) |

Same performance: identical credits and label, II and III match to within 0.03 s, and every No. 41 track matches the old album to within 11 s (I 699 374 vs 688 480 ms is the largest difference; the rest are within 0.03 s). The 11 s difference in the No. 40 finale is probably silence at the start or end of the track (not checked by ear).

| Field | Value in the guide | Source | Status |
| --- | --- | --- | --- |
| Conductor / orchestra | Sir Charles Mackerras / Scottish Chamber Orchestra | Spotify credits; Discogs https://api.discogs.com/releases/5369953 | OK |
| Label / catalogue | Linn Records, CKD 308 | Discogs 5369953 (2-SACD, 2008) | OK |
| Recorded / venue | 3–9 August 2007, City Halls, Glasgow | Discogs 5369953: "Recorded at City Hall, Glasgow, UK from 3-9 August 2007"; company "City Halls, Glasgow" | OK |
| Release year | 2008 | ℗ / © 2008 Linn (CD); Spotify date 2008-07-01 | OK |

**Harnoncourt `recorded` field corrected** (also_recommended): Discogs https://api.discogs.com/releases/11296393 (Sony 88843026352) quotes the booklet: "Recording: December 1+2, 2002 (K.550), October 12-14, 2013 (K.543 & 551), Goldener Saal, Musikverein, Vienna". The year 2002 is almost certainly a misprint for 2012: classiquenews.com (cited in `verification-1-5.md`) dates the K. 550 sessions to December 2012. MusicWeb's header gives 12–14 October 2013 for the whole set. The guide now says "December 2012" with a yaml comment; the day is left out.

**Stops re-placed (all ≈, none heard).** The old stops were drafted before the track lengths were measured (see `retime-needed.md`). They are now placed from bar positions (German Wikipedia, https://de.wikipedia.org/wiki/40._Sinfonie_(Mozart)) and the new track lengths, assuming a steady tempo and the repeats below.

- I: 299 bars; exposition 1–100 repeated; development 101–165; recapitulation 165/166; coda 286. Exposition repeat only (none other is marked) = 399 bars played → 1.068 s per bar (half note ≈ 112). Theme 2 bar 44. Theme 2 in the recapitulation estimated at bar ≈ 228 (the transition is longer than in the exposition: not given by the source).
- II: 123 bars, 6/8; exposition ends bar 52; development 53–73; recapitulation bar 74. Both halves repeated (13:25 is far too long for one repeat) = 246 bars → 3.27 s per bar. Flutter figure (motif 6) from bar 16.
- III: minuet + trio 84 bars (42 + 42); repeats in minuet and trio, da capo without repeats = 210 bars → 1.16 s per bar. Section lengths inside the minuet (14 + 28) and trio (18 + 24) are assumed.
- IV: 308 bars; exposition 1–124 repeated; theme 2 bar 71; development 125–207 (ends with a long general pause); recapitulation 208. Both repeats (with the exposition repeat only, the tempo would be implausibly slow) = 616 bars → 0.90 s per bar (half note ≈ 133). Fugato-like entries placed at bar ≈ 139.

| Mvt | Stop | Old | New | Basis |
| --- | --- | --- | --- | --- |
| I | Theme 1 | 0:00 | 0:00 | |
| I | Theme 2 | 0:45 | 0:45 | bar 44 |
| I | Exposition repeat | 1:50 | 1:45 | bar 1, second time (100 bars played) |
| I | Development | 3:40 | 3:35 | bar 101 (200 played) |
| I | Recapitulation | 5:00 | 4:40 | bar 165 (264 played) |
| I | Theme 2 in G minor | 6:00 | 5:50 | bar ≈ 228 (≈ 327 played) |
| I | Coda | Near the end | Near the end | bar 286 ≈ 6:50 |
| II | Opening | 0:00 | 0:00 | |
| II | Flutters | 0:40 | 0:50 | bar 16 |
| II | Development | Middle | Middle | bar 53 ≈ 5:40 |
| II | Recapitulation | 8:00 | 6:50 | bar 74, first time (125 played); it comes again after the repeat at ≈ 10:40 |
| III | Minuet | 0:00 | 0:00 | |
| III | Canon | 0:40 | 0:40 | second half, bars 15–34 |
| III | Trio | 1:50 | 1:35 | 84 bars played |
| III | Minuet da capo | 3:00 | 3:15 | 168 bars played |
| IV | Theme 1 | 0:00 | 0:00 | |
| IV | Theme 2 | 1:00 | 1:05 | bar 71 |
| IV | Development | 3:50 | 3:45 | bar 125 (248 played) |
| IV | Fugato | 4:10 | 4:00 | bar ≈ 139 |
| IV | Recapitulation | 5:20 | 5:00 | bar 208 (331 played); the second half is then repeated (development again ≈ 6:30) |
| IV | Theme 2 in the minor, close | Near the end | Near the end | |

Text changes (EN and TR): `spotify_url` (with a yaml comment), Movements durations I and IV, the Harnoncourt `recorded` field, stop times. No other text changed.

Sources: Spotify embed pages for `0MNU78TPr4GbVdgRBsBL6L`, `1EsOER6UdNfA5Lliol1o73`, `2rq5Iu6Ox0TCICD2N685Y6` (2026-10-11, from Turkey); album pages for the © lines; Discogs and Wikipedia URLs above.
