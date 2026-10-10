# Verification: Mozart – Symphony No. 41 in C major, K. 551, "Jupiter"

Files checked: `content/en/pieces/mozart-symphony-41.md`, `content/tr/pieces/mozart-symphony-41.md`.
Checked on 2026-10-10. Batch October 2026, group C.

**How the checks were done** (same method as `verification-1-5.md` and `mozart-piano-concerto-23.md`)
- **Spotify:** album confirmed from the public embed page (`https://open.spotify.com/embed/album/<id>`), which lists every track with credits and exact duration in ms.
- **Discogs:** public API (`https://api.discogs.com/releases/<id>`); MusicBrainz web service where noted. Requests used the generic `DailyClassical/1.0 (+https://dailyclassical.co)` User-Agent only.
- **Status key:** OK = confirmed from a primary or reliable secondary source. UNVERIFIED = not confirmed.
- The web-search budget for this session ran out part-way through; later checks used direct fetches of known pages and APIs only.

---

## Reference recording: Mackerras / Scottish Chamber Orchestra (Linn)

Same album as the reference recording of `mozart-symphony-40` (already verified in `verification-1-5.md` §1).

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/0MNU78TPr4GbVdgRBsBL6L | "Mozart Symphonies 38-41", Scottish Chamber Orchestra, 15 tracks. K. 551 = tracks 12–15 | https://open.spotify.com/embed/album/0MNU78TPr4GbVdgRBsBL6L | VERIFIED |
| Conductor / orchestra | Sir Charles Mackerras / Scottish Chamber Orchestra | Discogs: "Conductor, Liner Notes – Sir Charles Mackerras"; Orchestra – Scottish Chamber Orchestra | https://www.discogs.com/release/5369953 | OK |
| Label / cat. no. | Linn Records, CKD 308 | Linn Records CKD 308 (2-SACD hybrid) | same | OK |
| Recorded / venue | 3–9 August 2007, City Halls, Glasgow | "Recorded at City Hall, Glasgow, UK from 3-9 August 2007" (Discogs notes; Linn and `verification-1-5.md` give City Halls) | same | OK |
| Release | 2008 | "© 2008 Linn Records ℗ 2008 Linn Records" | same | OK |
| Credits for reference | – | Producer James Mallinson; engineer Philip Hobbs; liner notes Neal Zaslaw | same | for reference |

### Durations (source: Spotify embed, album 0MNU78TPr4GbVdgRBsBL6L)

| Mvt | Spotify track | ms | Guide |
| --- | --- | --- | --- |
| I Allegro vivace | 12 | 688 480 | 11:28 |
| II Andante cantabile | 13 | 627 146 | 10:27 |
| III Menuetto: Allegretto | 14 | 303 320 | 5:03 |
| IV Molto allegro | 15 | 690 266 | 11:30 |
| Total | | 2 309 212 | 38 min (38:29) |

### Repeats (affects every stop)

- The Classic Review's retrospective of this set: "Repeats are observed throughout, including the development-section repeats that most conductors skip." https://theclassicreview.com/album-reviews/classics-revisited-mackerras-mozart-late-symphonies/ (secondary; the site's reliability is unknown).
- Arithmetic agrees. Bar counts from German Wikipedia (https://de.wikipedia.org/wiki/41._Sinfonie_(Mozart)): I 313 bars (exposition 1–120 repeated; no second repeat); II 101 bars (exposition 1–44); III 87 bars incl. trio; IV 423 bars (exposition 1–157 repeated; development + recapitulation 158–355 repeated; coda 356–423).
  - IV with both repeats = 778 bars played → 0.89 s per bar (half note ≈ 135), a normal Molto allegro. With the exposition repeat only it would be 580 bars → 1.19 s per bar (half note ≈ 100), implausibly slow. So both repeats are taken.
  - II: both halves repeated = 202 bars → 3.1 s per bar (crotchet ≈ 58); exposition repeat only = 145 bars → 4.3 s per bar (crotchet ≈ 42), much slower than usual. German Wikipedia's summary does not mention a second-half repeat in II; the guide assumes Mackerras takes one (consistent with the review). **Check by ear first.**
  - I: exposition repeat only (none other is marked) = 433 bars → 1.59 s per bar (crotchet ≈ 151).

---

## Also recommended: Harnoncourt / Concentus Musicus Wien (Sony)

Already verified for `mozart-symphony-40` (`verification-1-5.md` §1): Sony Classical 88843026352, recorded 12–14 Oct 2013 (MusicWeb; classiquenews.com says Dec 2012), Musikverein, Vienna, released 2014. Spotify https://open.spotify.com/album/2rq5Iu6Ox0TCICD2N685Y6 — embed checked 2026-10-10: K. 551 = tracks 9–12 (13:00 / 9:30 / 5:14 / 11:39), credits "Wolfgang Amadeus Mozart, Nikolaus Harnoncourt, Concentus Musicus Wien". VERIFIED.

---

## Painting: Hubert Robert, *The Obelisk*, 1787

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Hubert Robert (1733–1808), *The Obelisk*, 1787 | https://www.artic.edu/artworks/57049 ; AIC API https://api.artic.edu/api/v1/artworks/57049 | OK |
| Collection | Art Institute of Chicago, 1900.383, Gift of Clarence Buckingham | same | OK |
| Medium / size | Oil on canvas, 255.6 × 223.5 cm | same | OK |
| Context | One of four architectural fantasies commissioned in 1787 by Jean-Joseph, Marquis de Laborde, for a salon at the Château de Méréville; the pendants are *The Old Temple*, *The Landing Place* and *The Fountains* (all AIC) | AIC provenance and description (API) | OK |
| Public domain | Artist died 1808. AIC: `is_public_domain: true`, data CC0. Commons: `{{PD-art-two-auto|1808}}{{Cc-zero}}` | https://commons.wikimedia.org/wiki/File:Hubert_Robert_-_The_Obelisk_-_1900.383_-_Art_Institute_of_Chicago.jpg | OK |
| Image | Commons file 1952 × 2250 px (portrait, ≈ 0.87:1). AIC's IIIF master is 13 750 × 15 846 (image_id 3b8084b4-5fb4-700a-bc0a-16e6fa4698b8, `https://www.artic.edu/iiif/2/<image_id>/full/<w>,/0/default.jpg`), but the IIIF server refused scripted requests here; download it by hand for a sharper master | Commons API; AIC API | OK (plan a crop: tall format) |
| Not NC | PD / CC0 | – | OK |
| Not already used | Not in `content/paintings.yaml`; Hubert Robert not used (checked 2026-10-10) | – | OK |

Why it fits: same years (1787, the symphony is 1788); a monumental, perfectly ordered Classical space built from the vocabulary of ancient Rome, which matches the scale and the Classical poise of Mozart's last symphony. The pairing note claims only the date and the visual character.

Rejected: Joseph Wright of Derby's *Philosopher Lecturing on the Orrery* (the idea of a clockwork universe suits the finale), because the only high-resolution Commons file (Google Art Project, 4087 × 3025) is Yale Center for British Art B1981.25.719, which appears to be a print after the painting, not the Derby Museum painting (whose Commons file is only 800 px).

---

## Big picture and movement facts

| Claim in the guide | Source | Status |
| --- | --- | --- |
| Entered in Mozart's catalogue 10 August 1788; last of three symphonies that summer (No. 39 completed 26 June, No. 40 25 July); his last symphony | https://en.wikipedia.org/wiki/Symphony_No._41_(Mozart) | OK |
| Not known whether performed in his lifetime | same ("It is not known for certain whether the symphony was performed in Mozart's lifetime"; a Leipzig 1789 programme may indicate a performance) | OK (cautious wording) |
| Nickname probably coined by Johann Peter Salomon, according to Mozart's son (Franz Xaver Wolfgang); in use in London early in the 19th century (printed arrangements 1813, 1817) | same | OK. Wikipedia also mentions J. B. Cramer as an alternative attribution; the guide says "probably" |
| Orchestra: flute, 2 oboes, 2 bassoons, 2 horns, 2 trumpets, timpani, strings; no clarinets | same | OK |
| Finale: five themes combined at the end (fugato from bar 372) | same; de.wikipedia (Fugato ab Takt 372) | OK |
| I: threefold tutti outburst answered by a lyrical response; second group with a G-major lyrical section and a C-minor stormy section; exposition closes with a quotation of the insertion aria *Un bacio di mano*, K. 541; development uses the aria theme; false recapitulation in F major; true recapitulation at bar 189 | en.wikipedia; de.wikipedia (Durchführung 121–188, Reprise 189) | OK |
| *Un bacio di mano* written "a few months earlier for a comic opera singer" | K. 541 is an arietta for bass, inserted in Anfossi's *Le gelosie fortunate*, May 1788 (general knowledge; Wikipedia calls it an "insertion aria") | OK in substance; source for the singer not fetched |
| II: muted violins; sarabande character ("stately dance in three"); only Mozart symphonic slow movement marked cantabile; turn to C minor at bar 19 with syncopations; closing idea from bar 28; development 45–59; recapitulation from 60; coda from 92 | en.wikipedia; de.wikipedia | OK |
| II: trumpets and drums silent | en.wikipedia instrumentation (horns in F in the Andante); score | OK |
| III: Ländler-like; sparse imitative woodwind passage (bars 43–51); trio presents the four-note figure of the finale, in A minor | en.wikipedia | OK |
| IV: four-note theme C–D–F–E; fugato in the exposition; second theme from bar 74 (G major); development; recapitulation 225; coda 356/360; five themes combined from 372 | de.wikipedia; en.wikipedia | OK. Bar 36 for the exposition fugato is from memory of the score: **check** |
| "Mackerras plays every repeat … including the second-half repeats in the Andante and the finale" | The Classic Review (above) + duration arithmetic | Probable; confirm by ear |

---

## Re-time

None of the stops was timed by ear. They were derived from the bar positions above and the track lengths, assuming a steady tempo and the repeats described above. Re-time every one against Spotify 0MNU78TPr4GbVdgRBsBL6L, tracks 12–15.

| Mvt | Stop in guide | Basis | Note |
| --- | --- | --- | --- |
| I | ≈ 0:00 | bar 1 | |
| I | ≈ 1:25 | bar 56 (Theme 2) | |
| I | ≈ 2:05 | bar 81 (C-minor outburst) | bar from memory |
| I | ≈ 2:40 | bar 101 (*Un bacio* tune) | |
| I | ≈ 3:10 | repeat of bar 1 | |
| I | ≈ 6:20 | bar 121 (development) | |
| I | ≈ 7:25 | bar 161 (false recapitulation in F) | bar from memory |
| I | ≈ 8:10 | bar 189 (recapitulation) | |
| I | Near the end | closing fanfares | |
| II | ≈ 0:00 | bar 1 | |
| II | ≈ 0:55 | bar 19 (C minor, syncopations) | |
| II | ≈ 1:25 | bar 28 | |
| II | ≈ 2:15 | repeat of bar 1 | |
| II | ≈ 4:35 | bar 45 (development) | depends on second-half repeat assumption |
| II | ≈ 5:15 | bar 60 (recapitulation) | |
| II | ≈ 7:30 | second-half repeat, bar 45 | **remove this stop if Mackerras does not repeat the second half** |
| II | Near the end | coda, bar 92 | |
| III | ≈ 0:00 | bar 1 | |
| III | Second half of the minuet | bars 43–51 (woodwind imitation) | no time given |
| III | ≈ 2:35 | trio | estimated: minuet with both repeats = 118 bars at ≈ 1.3 s |
| III | Second half of the trio | four-note figure | no time given |
| III | ≈ 3:45 | da capo | |
| IV | ≈ 0:00 | bar 1 | |
| IV | ≈ 0:30 | bar ≈ 36 (fugato) | |
| IV | ≈ 1:05 | bar 74 (Theme 2) | |
| IV | ≈ 2:20 | repeat of bar 1 | |
| IV | ≈ 4:40 | bar 158 (development) | |
| IV | ≈ 5:40 | bar 225 (recapitulation) | |
| IV | ≈ 7:35 | second-half repeat, bar 158 | |
| IV | ≈ 10:30 | bar 356 (coda) | |
| IV | ≈ 10:45 | bar 372 (five themes combined) | |
| IV | Near the end | closing fanfares | |

Ready-to-paste rows for `content/research/retime-needed.md` are in `mozart-symphony-41.shared.md`.

## Open items

1. Re-time all stops; first confirm the repeats in II (both halves?) and IV (both halves).
2. Confirm by ear that the false recapitulation (I, ≈ 7:25) is where the guide puts it.
3. Optional: a sharper master of the painting from AIC's IIIF server.
