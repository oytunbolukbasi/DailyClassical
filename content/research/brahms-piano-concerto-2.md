# Verification: Brahms – Piano Concerto No. 2 in B-flat major, Op. 83

Piece id `brahms-piano-concerto-2`. Checked on 2026-10-24 (batch October 2026b, group F).
Files: `content/drafts/en/brahms-piano-concerto-2.md`, `content/drafts/tr/brahms-piano-concerto-2.md`.
Shared-file additions: `content/research/brahms-piano-concerto-2.shared.md`.

**How the checks were done.** As in `brahms-symphony-2.md` (Spotify embed `__NEXT_DATA__` from a Turkish network for tracks, ms durations and `isPlayable`; album page for ©/℗; Discogs API for credits and dates). Status key: OK / SECONDARY / UNVERIFIED. No personal data was sent anywhere.

---

## 1. Reference recording: Emil Gilels / Eugen Jochum / Berliner Philharmoniker (DG, 1972)

Why this one: the Gilels / Jochum set of both concertos is one of the most admired Brahms concerto recordings (DG calls it "unsurpassed"; Wikipedia lists it among notable recordings). Four tracks, one per movement.

Album choice: three Spotify editions exist. `1HCS4Vr9ov8Gnb3eFUZ92O` ("Two Piano Concertos", 1973) has most tracks `isPlayable: false` in Turkey, so it is out. `58JzrSl3w7rVN0OqMxCdKc` (1996 CD, "© 1996 Deutsche Grammophon GmbH, Berlin") and `4cVEYosgHYCHMxYWX94uz4` (2024 remaster, "© 2024") are both fully playable; the 1996 edition is used (track lengths differ from the remaster by up to 7 s: 18:22/9:31/14:04/9:47 against 18:18/9:31/14:04/9:47).

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Emil Gilels / Eugen Jochum / Berliner Philharmoniker | Spotify credits ("Berlin Philharmonic"); cello solo in III credited to Ottomar Borwitzky on track 6 | https://open.spotify.com/embed/album/58JzrSl3w7rVN0OqMxCdKc | OK |
| Label / catalogue | DG 2707 064 (2 LP); 447 446-2 (CD) | Discogs 6427864: DG 2707 064, LP box, 1972; Discogs 1070358: CD 447 446-2, 1996, "Recordings: Berlin, Jesus-Christus-Kirche, 6/1972 (opp. 15 & 83)", ℗ 1972/1976 | https://www.discogs.com/release/6427864 ; https://www.discogs.com/release/1070358 | OK |
| Recorded / venue | June 1972, Jesus-Christus-Kirche, Berlin | same (also Discogs 11909267, 479 4877) | https://www.discogs.com/release/11909267 | OK |
| Producer (not in yaml) | – | Günther Breest; balance engineer Klaus Scheibe | Discogs 10080992 | OK |
| Release year | 1972 | ℗ 1972; LP 1972 | same | OK |
| Spotify | https://open.spotify.com/album/58JzrSl3w7rVN0OqMxCdKc | "Brahms: The Piano Concertos; Fantasias Op.116", 1996, 14 tracks; Concerto No. 2 = tracks 4–7, all `isPlayable: true` | embed + album page | VERIFIED |

### Durations (Spotify embed, album 58JzrSl3w7rVN0OqMxCdKc)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 4 | I. Allegro non troppo | 1102000 | 18:22 | true |
| 5 | II. Allegro appassionato | 571000 | 9:31 | true |
| 6 | III. Andante – Più adagio | 844000 | 14:04 | true |
| 7 | IV. Allegretto grazioso – Un poco più presto | 587000 | 9:47 | true |
| | Total (concerto) | 3104000 | 51:44 → `duration_min: 52` | |

---

## 2. Also recommended: Pollini / Abbado / Berliner Philharmoniker (DG, live 1995)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Performers | Maurizio Pollini, Berliner Philharmoniker, Claudio Abbado | Spotify credits | OK |
| Recorded / venue | "Live at Philharmonie, Berlin, 1995" in every track title | https://open.spotify.com/embed/album/3XaQW3fx3hZspeaI3aTu8N | SECONDARY (album metadata only) |
| Label / release | Deutsche Grammophon, "© 1997 Deutsche Grammophon GmbH, Berlin"; catalogue number not checked (`null`) | album page | OK / UNVERIFIED (cat. no.) |
| Spotify | 4 tracks: 17:45 / 8:55 / 12:33 / 9:24, all `isPlayable: true` | embed | VERIFIED |

---

## 3. Painting: Tina Blau, *Spring in the Prater* (*Frühling im Prater*), 1882

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Tina Blau (1845–1916), Viennese landscape painter | Commons; Wikidata Q28008216 | OK |
| Date / medium / size | 1882; oil on canvas; 214 × 291 cm | Wikidata Q28008216 | OK |
| Collection | Belvedere, Vienna, inv. 2233 | Wikidata; Commons file name | OK |
| Museum page | https://digital.belvedere.at/objects/8033/fruhling-im-prater (blocked by a bot check for scripts; not opened) | Commons source field | SECONDARY |
| Image | File:Tina_Blau_-_Frühling_im_Prater_-_2233_-_Österreichische_Galerie_Belvedere.jpg, 3508 × 2609 px, landscape | Commons API | OK |
| Rights | Artist died 1916: public domain. Commons: {{Licensed-PD-Art|PD-old-auto-1923|cc-by-sa-4.0}}: the Belvedere's photo carries CC BY-SA 4.0, but as a faithful reproduction of a PD painting it attracts no new right in the EU (DSM art. 14) or the US. Same situation as the Belvedere images already in `paintings.yaml` (Molitor, Schiele). Not NC | Commons | OK |
| Pairing | The concerto was finished in summer 1881 at Pressbaum near Vienna and published in 1882 (Wikipedia, Brahms); Blau painted the Prater, Vienna's great park, in 1882. No link between Blau and Brahms is claimed | Wikipedia (en, de) | OK |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Begun 1878, finished 1881 in Pressbaum near Vienna | https://en.wikipedia.org/wiki/Piano_Concerto_No._2_(Brahms) | OK |
| Finished "shortly after returning from his second Italian journey" (the guide says "a journey to Italy") | https://de.wikipedia.org/wiki/2._Klavierkonzert_(Brahms) | OK |
| 22 years after the First Concerto | en Wikipedia | OK |
| Premiere 9 November 1881, Budapest, Brahms soloist (Budapest Philharmonic, Alexander Erkel per the infobox); immediate success; toured with it | en Wikipedia; de Wikipedia | OK |
| Dedicated to Eduard Marxsen, his teacher | en Wikipedia; Brahms article ("dedicated to his teacher Marxsen") | OK |
| "a very small piano concerto with a very small and pretty scherzo" | en Wikipedia gives this to Clara Schumann; de Wikipedia quotes the German ("ein ganz ein kleines Klavierkonzert ... mit einem ganz kleinen zarten Scherzo") from a letter to Elisabeth von Herzogenberg. Sources disagree on the recipient, so the guide says "a friend" and uses en Wikipedia's translation | SECONDARY (recipient) |
| Four movements instead of three; about 50 minutes | en Wikipedia | OK |
| Trumpets and timpani only in the first two movements | en Wikipedia (Music) | OK |
| Opening horn call; early piano cadenza modelled on Beethoven's *Emperor* | en Wikipedia; Hansen m. 11 ("Brahms follows the model of Beethoven's *Emperor* Concerto") | OK |
| Theme 2 in D minor (orchestra) and F minor (piano); new transition theme only in the solo exposition (m. 118); trills m. 168 | http://kellydeanhansen.com/opus83.html | OK |
| II: scherzo in D minor with sonata features; theme 2 in A minor in unison strings; trio in D major; repeat of the first part | Hansen; en/de Wikipedia | OK |
| III: solo cello theme; later the song *Immer leiser wird mein Schlummer*, Op. 105 No. 2 (text Hermann Lingg); stormy B-flat minor; *Più adagio* in F-sharp major with two clarinets | en Wikipedia; Hansen m. 59 | OK |
| IV: rondo-like finale; Hungarian-rhythm theme in A minor (m. 65); F major episodes (mm. 81, 97); coda *Un poco più presto* with the theme in triple rhythm (m. 377 / 398) | en Wikipedia; Hansen | OK |
| Gilels recorded both concertos in Berlin in June 1972 | Discogs 1070358 | OK |
| Translation of the song title: "My slumber grows ever lighter" | Literal translation of *Immer leiser wird mein Schlummer* (en Wikipedia: "My Slumber Grows Ever More Peaceful"); both renderings exist | OK |

Not used: the claim (en Wikipedia) that the finale's theme copies bars 40–41 of Mozart's Concerto K. 595.

---

## 5. Re-time

All stops are estimates (≈). Method: Kelly Dean Hansen's guide gives bar numbers with timings for Brendel / Abbado / Berlin: I 17:58, II 9:24 (with the scherzo repeat), III 12:17, IV 9:29. Each stop's bar was converted to Brendel's time and scaled by track length: I × 1.022, II × 1.012, III × 1.145, IV × 1.032. Gilels's Andante is much slower than Brendel's (14:04 against 12:17), so its stops are the least reliable.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro non troppo | 18:22 | 0:00, 0:45 (m. 11), 1:40 (m. 29), 2:35 (m. 48), 3:30 (solo exposition), 5:50 (m. 118), 7:05 (m. 146), 8:05 (m. 168), 9:05 (development), 10:20–11:20 (mm. 213–238), 12:30 (recapitulation), 17:10 (m. 355), Last 30 seconds | Development storm range and the coda (≈ 17:10) |
| II Allegro appassionato | 9:31 | 0:00, 0:40 (m. 43), 1:50 (repeat), 3:40 (development), 4:45 (m. 188), 5:50 (m. 240), 6:25 (m. 272–280), 7:05 (recapitulation), Last 25 seconds | Whether Gilels takes the repeat (the near-identical length to Brendel's suggests yes); if not, everything after 1:50 is ≈ 1:50 earlier |
| III Andante | 14:04 | 0:00, 2:05 (m. 17), 2:55 (m. 23), 4:30 (m. 35), 6:45 (m. 55), 7:25 (m. 59), 9:25 (m. 71), 12:30 (m. 94), Last 30 seconds | *Più adagio* (≈ 7:25) and the cello's return (≈ 9:25) |
| IV Allegretto grazioso | 9:47 | 0:00, 0:20 (m. 17), 1:15 (m. 65), 1:35 (m. 81), 2:00 (m. 97), 3:20 (m. 165), 5:15 (recapitulation), 6:20 (m. 309), 7:50 (m. 377), Last 30 seconds | Coda (≈ 7:50) |
