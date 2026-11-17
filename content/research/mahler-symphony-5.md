# Verification: Mahler – Symphony No. 5

Piece id `mahler-symphony-5`. Recording change checked on 2026-11-17: the product owner chose Boulez / Wiener Philharmoniker as the reference. The former reference (Bernstein / Wiener Philharmoniker, DG 1988) moved to `also_recommended`; Chailly / Concertgebouw stays there.
Files: `content/en/pieces/mahler-symphony-5.md`, `content/tr/pieces/mahler-symphony-5.md`. No research note existed for this piece before; this one covers the recordings and the re-time only.

**How the checks were done:** Spotify embed page `https://open.spotify.com/embed/album/<id>` read with curl (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`) from a Turkish network: `__NEXT_DATA__` JSON gives every track's title, credited artists, `duration` (ms) and `isPlayable`. Album page meta for release date and the ℗/© line. Discogs public API `https://api.discogs.com/releases/<id>` for credits and recording notes; DG catalogue page for the barcode. Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Boulez / Wiener Philharmoniker (DG, 1997)

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Pierre Boulez / Wiener Philharmoniker | Spotify credits on all five tracks: "Gustav Mahler, Vienna Philharmonic, Pierre Boulez". Discogs: "Conductor – Pierre Boulez", "Orchestra – Wiener Philharmoniker" | https://open.spotify.com/embed/album/2mxjaerL9JdNbLnGdCfh8Q ; https://www.discogs.com/release/13790576 | OK |
| Soloists | none listed | No trumpet or horn soloist is credited on Spotify, on Discogs or on the DG page, so the yaml has no `soloists` | same ; https://www.deutschegrammophon.com/en/catalogue/products/mahler-symphonie-no-5-boulez-wp-70 | OK |
| Label / catalogue | Deutsche Grammophon, 453 416-2 | Discogs: "Deutsche Grammophon – 453 416-2"; barcode 0 28945 34162 0. DG catalogue page lists UPC 00028945341620 (= 453 416-2) | https://www.discogs.com/release/13790576 ; https://www.discogs.com/release/12601966 ; DG page above | OK |
| Recorded / venue | March 1996, Musikverein (Großer Saal), Vienna | Discogs notes (CD booklet): "Recording: Wien, Musikverein, Grosser Sa[a]l, 3/1996". Studio recording, not live | https://www.discogs.com/release/13790576 ; https://www.discogs.com/release/27867612 | OK |
| Release year / year | 1997 | Discogs: "℗ 1997 Deutsche Grammophon GmbH, Hamburg [72'17]"; DG page date 6 January 1997; Spotify album page `music:release_date` 1997-01-01, "© 1997 / ℗ 1997 Deutsche Grammophon GmbH, Berlin" | same ; https://open.spotify.com/album/2mxjaerL9JdNbLnGdCfh8Q | OK |
| Spotify | https://open.spotify.com/album/2mxjaerL9JdNbLnGdCfh8Q | "Mahler: Symphony No. 5", album, 1997, 5 songs; one track per movement; every track `isPlayable: true` (`PLAYABLE`) from Turkey | embed + album page | VERIFIED |

The CD is indexed in three parts (27:54 / 18:12 / 26:11 on Discogs = I+II / III / IV+V); the Spotify edition has one track per movement, and the sums agree (12:52 + 15:02 = 27:54; 10:59 + 15:12 = 26:11; total 72:17).

### Durations (Spotify embed, album 2mxjaerL9JdNbLnGdCfh8Q, read 2026-11-17)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Trauermarsch | 772000 | 12:52 | true |
| 2 | II. Stürmisch bewegt, mit größter Vehemenz | 902000 | 15:02 | true |
| 3 | III. Scherzo. Kräftig, nicht zu schnell | 1092000 | 18:12 | true |
| 4 | IV. Adagietto. Sehr langsam | 659000 | 10:59 | true |
| 5 | V. Rondo-Finale. Allegro | 912000 | 15:12 | true |
| | Total | 4337000 | 72:17 → `duration_min: 72` | |

---

## 2. Also recommended

| Recording | Spotify | Tracks (embed, 2026-11-17) | isPlayable (TR) | Notes |
| --- | --- | --- | --- | --- |
| Bernstein / Wiener Philharmoniker, live Alte Oper Frankfurt, 6–8 September 1987, DG 423 608-2 (1988); horn Friedrich Pfeiffer | https://open.spotify.com/album/5ENEAfJFQNuvww1jxjcnbu | 5 tracks: 14:34, 15:00, 19:08, 11:18, 15:00 | all true | Former reference; yaml fields kept as they were verified for the original guide |
| Chailly / Royal Concertgebouw Orchestra, October 1997, Decca 458 860-2 (1998) | https://open.spotify.com/album/4HTScZKz8noAd4TU6rrqyY | 5 tracks: 12:54, 14:57, 17:59, 10:27, 15:28 | all true | Unchanged |

---

## 3. Re-time (Boulez)

All stops stay estimates (≈); nobody has listened against the Boulez tracks. Method: the stops were not scaled from the Bernstein times. Each was placed at a section boundary taken from two real performances and then adjusted for Boulez's movement lengths:
- **Abbado / Berliner Philharmoniker (DG 1993)**, an edition split into 55 tracks at the score's tempo markings (Deezer album 391529317: https://www.deezer.com/album/391529317). Its movement lengths (12:36, 14:45, 17:15, 9:01, 15:36) are close to Boulez's except the Adagietto, so its boundaries give the position of each event in a real performance. Times below are cumulative from those track lengths.
- **Bernstein / Wiener Philharmoniker (the former reference)**, event times from a listening guide written against that recording: The Classic Review, https://theclassicreview.com/?p=9937 (SECONDARY). It confirms the Abbado-based positions (for example the lament in II at 4:29, the chorale in II at 11:58, the fugue in V at 1:22) and showed that several old stops were early or late.
Boulez times = Abbado boundary × (Boulez track ÷ Abbado track), checked against the Bernstein event times, rounded to 5 s.

| Mvt | Track length | Old stops | New stops (≈) | How placed | Least certain |
| --- | --- | --- | --- | --- | --- |
| I Trauermarsch | 12:52 | 0:00, 0:30, 1:20, 5:30, 7:30, 10:30, Last minute | 0:00, 0:25, 1:10, 5:25, 7:25, 10:00, Last minute | 0:25: end of the 12-bar trumpet solo. 1:10: Abbado "Etwas gehaltener" 1:08 (the string march theme; Bernstein guide 1:19). 5:25: Abbado "Plötzlich schneller" 5:20 (Trio I; Bernstein 6:17). 7:25: just before Abbado "Tempo I" 7:32, where the march returns in the winds after the fanfare (Bernstein 8:55). 10:00: Abbado "Schwer" 9:51; the climax falls just before "Klagend" 11:12 (Bernstein's cry at 12:49), so the grieving episode is placed ≈ 1:20 before the coda | 10:00 (whether "Schwer" is the start of the second episode or a point inside it); 7:25 (exact place of the fanfare before the winds) |
| II Stürmisch bewegt | 15:02 | 0:00, 1:30, 4:30, Middle, 11:30, 12:30, Last seconds | 0:00, 1:20, 4:30, Middle, 12:05, 12:55, Last seconds | 1:20: Abbado "Bedeutend langsamer" 1:20. 4:30: Abbado "Langsam aber immer" 4:25, Bernstein cellos 4:29. 12:05: Abbado "Pesante" 11:50, Bernstein chorale 11:58 (Boulez's track is 17 s longer than Abbado's). 12:55: Bernstein climax 12:41 and its collapse; Abbado "Tempo I subito" 13:08 | 12:55 (collapse point) |
| III Scherzo | 18:12 | 0:00, 2:30, 6:00, 8:00, 11:00, Last minute | 0:00, 2:35, 4:45, 7:05, 11:20, Last minute | 2:35: Abbado "Etwas ruhiger" 2:28 (Trio I; Bernstein 2:43). 4:45: Abbado "Langsamer" 4:26 / "Etwas zurückhaltend" 5:04, the slow-down into the second trio (Bernstein 5:09), scaled ×1.055. 7:05: Abbado "Molto moderato" 6:41. 11:20: Abbado "Poco rit. a tempo I" 10:46 (development; Bernstein 10:40) | 7:05 (pizzicato episode assumed at "Molto moderato"); 4:45 (horn calls) |
| IV Adagietto | 10:59 | 0:00, 4:00, 7:30, 8:00, Last minute | 0:00, 4:20, 7:10, 7:25, Last minute | Boulez is 1.22 × Abbado (9:01) here. 4:20: Abbado "Fließender" 3:32 (middle section). 7:10: Abbado "Zurückhaltend" 5:53 (the glissando back). 7:25: return of the theme a bar or two later | 7:10 / 7:25 (glissando and return within seconds of each other) |
| V Rondo-Finale | 15:12 | 0:00, 1:00, 1:50, 3:20, Middle, 13:00, Last minute | 0:00, 0:35, 1:15, 3:15, Middle, 13:20, Last minute | 0:35: Abbado "Allegro giocoso" 0:37 (horn rondo theme). 1:15: Abbado "Sempre l'istesso tempo" 1:13, Bernstein fugue 1:22. 3:15: Abbado 3:20, Bernstein 3:30 "sped-up Adagietto theme" (Abbado's first "Grazioso" at 2:11 may already hint at it). 13:20: Bernstein chorale climax 13:51 of 15:00; Abbado "Grazioso" 12:16 and "Sehr drängend" 14:10; the chorale lies between, ≈ 13:20 in Boulez with the coda from ≈ 13:50 | 13:20 (chorale entry); 3:15 vs the earlier "Grazioso" |

Stops moved by 20 s or more: I 10:30→10:00 (30 s); II 11:30→12:05 (35 s), 12:30→12:55 (25 s); III 6:00→4:45 (75 s), 8:00→7:05 (55 s), 11:00→11:20 (20 s); IV 4:00→4:20 (20 s), 7:30→7:10 (20 s), 8:00→7:25 (35 s); V 1:00→0:35 (25 s), 1:50→1:15 (35 s), 13:00→13:20 (20 s). The reasons are in the table; in short, several old Bernstein estimates were off when checked against the Bernstein listening guide (II chorale, III horn calls, V fugue and chorale), and Boulez's Scherzo is shorter.

Add or update these rows in `project-knowledge/content_status.md` › "Zamanlanacak duraklar" at merge time.
