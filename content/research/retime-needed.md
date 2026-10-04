# Listening stops to re-time

The movement tables in `content/en/launch-content.md` and `content/tr/launch-content.tr.md` now show the measured track durations of each reference recording's Spotify album (from `verification-1-5.md` and `verification-6-10.md`, checked 2026-10-04). The listening-stop times were **not** changed.

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
