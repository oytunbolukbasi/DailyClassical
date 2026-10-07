# Listening stops to re-time

The movement tables in `content/en/pieces/` and `content/tr/pieces/` now show the measured track durations of each reference recording's Spotify album (from `verification-1-5.md` and `verification-6-10.md`, checked 2026-10-04). The listening-stop times were **not** changed.

The movements below differ from the old draft duration by more than about 20 seconds. Their stops were probably timed against a different tempo and must be re-timed by ear against the reference track before launch. One extra note covers a structural issue (the Beethoven 9 finale) that is not a duration mismatch.

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Mozart – Symphony No. 40 | I Molto allegro | ≈ 7:30 | 7:07 | −0:23 | Mackerras / SCO, Spotify `0MNU78TPr4GbVdgRBsBL6L` | 0:00, 0:45, 1:50, 3:40, 5:00, 6:00, Near the end | Report: re-check the late stops (recapitulation ≈ 5:00, Theme 2 return ≈ 6:00) |
| Mozart – Symphony No. 40 | II Andante | ≈ 13:00 | 13:25 | +0:25 | same | 0:00, 0:40, Middle, 8:00 | Report: re-check the recapitulation stop (≈ 8:00) |
| Schubert – Symphony No. 8 | I Allegro moderato | ≈ 15:00 | 15:26 | +0:26 | Wand / BPh 1995, Spotify `1zEbPxFC7m0Wj8ePFMkP8W` | 0:00, 0:20, 1:15, 1:25, 2:00, 3:40, 7:20, 10:30, 14:00 | `duration_min` changed 27 → 28 |
| Schubert – Symphony No. 8 | II Andante con moto | ≈ 12:00 | 12:45 | +0:45 | same | 0:00, 1:10, 2:45, 3:00, 4:10, 6:00, Last 2 minutes | Report: re-check II especially (45 s short) |
| Shostakovich – Symphony No. 5 | III Largo | ≈ 13:00 | 15:40 | +2:40 | Bernstein / NYPO 1959, Spotify `00d6wTUJHGsrxPmbETXGWm` | 0:00, 3:00, 5:30, 9:00 (climax), 11:00 (aftermath), Last minute | The draft stops fit a ~13-minute Largo (Mravinsky 1984 is 13:13), not Bernstein 1959. Re-time all of them. `duration_min` changed 45 → 46 (track total 45:57) |
| Beethoven – Symphony No. 9 | IV Finale | ≈ 24:00 | 24:01 (6:26 + 17:35) | +0:01 | Karajan / BPh 1962, Spotify `1xrUldRtz5tcUQ6KrIOS2e` | 0:00 … 6:20, 7:20 … 20:30, Last minute | Not a duration mismatch: the finale is split across two tracks (IVa instrumental opening, 6:26; IVb from "O Freunde", 17:35). Stops are movement totals; decide whether the app shows them as totals or as offsets within each track. The ≈ 6:20 stop falls 6 s before the track boundary. Spotify also swaps the titles of tracks 3 and 4 on this album |

Below the threshold (no action expected): Berlioz I is 15:16 against ≈ 15:00 (+0:16). Every other movement is within 10 s of the draft.

## New pieces (October 2026): every stop is an estimate

Written from the score, published analyses and the exact track lengths; none were timed by ear. Re-time all of them against the reference track before publishing. Details per piece in `research/<id>.md`.

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Mozart – Piano Concerto No. 23 | I Allegro | – | 11:42 | – | Barenboim / BPh, Spotify `2sCnq47RrjWno99LheCwS5` (track 10) | 0:00, 0:35, 1:00, 2:15, 3:20, 4:50, Mid-development, 6:40, 10:00–10:50 (cadenza), Near the end | Derived from bar positions, not heard. Spotify track is 11–15 s longer than the CD (11:27): find the extra silence. Confirm the cadenza is Mozart's |
| Mozart – Piano Concerto No. 23 | II Adagio | – | 7:21 | – | same (track 11; Spotify mislabels it "Andante") | 0:00, 0:50, 2:30, 3:50, 6:05 | Derived from bar positions (bar count assumed ≈ 99) |
| Mozart – Piano Concerto No. 23 | III Allegro assai | – | 8:14 | – | same (track 12) | 0:00, 0:08, 1:00, 1:40, 3:10, 3:35, 4:05, 4:55, 6:55, Near the end | Derived from bar positions (524 bars, steady tempo assumed) |
| Beethoven – Piano Concerto No. 3 | I, II, III (all) | – | 17:22 / 10:01 / 8:46 | – | Richter / Wiener Symphoniker / Sanderling 1962, Spotify `7b75e8aayuYU0sTYjnfFTl` (tracks 4–6) | I: 0:30, 1:30, 3:20, 5:00, 6:50, 9:20, 12:40–14:50, 14:50; II: 1:20, 2:40, 4:10, 6:00, 8:15; III: 0:20, 1:00, 2:00, 2:45, 3:40, 5:20, 7:30 | New piece, never timed by ear: every stop is an estimate from track length and bar structure. See `research/beethoven-piano-concerto-3.md` |
| Beethoven – Piano Sonata No. 8 | I, II, III (all stops) | – | 9:35 / 5:23 / 4:50 | – | Barenboim / DG 1983, Spotify `4TCTWpN6Gwq2dA37rkwMX1` (tracks 4–6) | I: 0:00, 1:45, 2:25, 3:00, 3:45, 5:45, 6:15, 6:40–7:05, 7:10, 8:45, 9:10 · II: 0:00, 0:35, 1:10, 2:05, 2:40, 3:00, 3:40, 4:50 · III: 0:00, 0:33, 1:23, 1:45, 2:25, 3:00, 3:50, 4:30, 4:42 | All stops derived from the score and track lengths, not by ear (see research/beethoven-piano-sonata-8.md §4, §8). I assumes the exposition repeat goes back to the Allegro, not the Grave |
| Rachmaninoff – Piano Concerto No. 2 | I Moderato | – | 11:13 | – | Richter / Wisłocki 1959, Spotify `44eOy7bLDpoOZx5A9a1GEJ` (tracks 1–3) | 0:00, 0:40, 1:40–2:20, 2:20, 3:00–4:30, 4:30, Mid-development, 6:45–7:30, 8:30, Near the end | Least certain: Start of the development (≈ 4:30), the march (≈ 6:45–7:30) and the horn solo (≈ 8:30). Confirm that the horn really carries Theme 2 |
| Rachmaninoff – Piano Concerto No. 2 | II Adagio sostenuto | – | 11:54 | – | Richter / Wisłocki 1959, Spotify `44eOy7bLDpoOZx5A9a1GEJ` (tracks 1–3) | 0:00, 0:30, 0:50, 1:30, 2:45, 4:30–6:30, 7:00–8:00, 8:30, Last minute | Least certain: Piano takes the theme (≈ 2:45), the Più animato section, the climax and cadenza (≈ 7:00–8:00) |
| Rachmaninoff – Piano Concerto No. 2 | III Allegro scherzando | – | 11:39 | – | Richter / Wisłocki 1959, Spotify `44eOy7bLDpoOZx5A9a1GEJ` (tracks 1–3) | 0:00, 0:30, 0:50, 2:00, 2:45, 4:00–6:00, 7:00–8:00, 9:30, 10:15–10:45, Last 40 seconds | Least certain: Fugato position inside ≈ 4:00–6:00, return of Theme 2 (≈ 7:00–8:00), the Maestoso climax (≈ 10:15–10:45) |
