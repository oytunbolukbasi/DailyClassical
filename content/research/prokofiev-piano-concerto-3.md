# Verification: Prokofiev – Piano Concerto No. 3 in C major, Op. 26

Piece id `prokofiev-piano-concerto-3`. Checked on 2026-11-17 (batch BATCH-2026-11, group G).
Files: `content/drafts/en/prokofiev-piano-concerto-3.md`, `content/drafts/tr/prokofiev-piano-concerto-3.md`.
Shared-file additions: `content/research/prokofiev-piano-concerto-3.shared.md`.

**How the checks were done:** Spotify embed `__NEXT_DATA__` (Turkish network, 2026-11-17); Discogs API; Commons API. Status key OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Argerich / Abbado / Berliner Philharmoniker (DG, 1967)

The same Spotify album is already the reference for `ravel-piano-concerto-g` (Ravel = tracks 4–6); its label, catalogue, dates and venue were verified there (`content/research/ravel-piano-concerto-g.md` §1) and are reused. The two concertos were recorded in the same sessions and first issued together on LP. Using one album for two pieces is deliberate: it is the classic recording of this concerto. If the app should not reuse an album, the alternative is Kissin / Abbado (below).

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Martha Argerich / Claudio Abbado / Berliner Philharmoniker | Spotify credits tracks 1–3: "Sergei Prokofiev, Martha Argerich, Berlin Philharmonic, Claudio Abbado"; DG's name "Berliner Philharmoniker" kept as in the Ravel piece | https://open.spotify.com/embed/album/5xQ0xhJd18EflGs49V0P5q | OK |
| Label / catalogue | DG, SLPM 139 349 (LP, with Ravel); 447 438-2 (CD) | Discogs master 339272 / release 10759842 (LP 139 349 SLPM, 1967); CD 2902888 (447 438-2, 1995): "Concertos originally released as Deutsche Grammophon 139 349 SLPM, 1967" | https://api.discogs.com/releases/10759842 ; https://api.discogs.com/releases/2902888 | OK (via the Ravel note) |
| Recorded / venue | May–June 1967, Jesus-Christus-Kirche, Berlin | CD notes: "Recordings: Berlin, Jesus-Christus-Kirche, 5 & 6/1967 (Concertos)" | same | OK |
| Release year | 1967 | LP 1967 | same | OK |
| Spotify | 5xQ0xhJd18EflGs49V0P5q | "Prokofiev: Piano Concerto No.3 / Ravel: Piano Concerto in G major", 9 tracks; Prokofiev = tracks 1–3 | embed page | VERIFIED |
| Argerich "in her mid-twenties" | "In this recording" | Born 5 June 1941; 25 or 26 in May–June 1967 | https://en.wikipedia.org/wiki/Martha_Argerich | OK |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Andante – Allegro | 543440 | 9:03 | true |
| 2 | II. Tema con variazioni | 543000 | 9:03 | true |
| 3 | III. Allegro ma non troppo | 539956 | 8:59 | true |
| | Total | 1626396 | 27:06 → `duration_min: 27` | |

## 2. Also recommended: Kissin / Abbado / Berliner Philharmoniker (DG, live 1993)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Evgeny Kissin / Claudio Abbado / Berliner Philharmoniker | Spotify credits | https://open.spotify.com/embed/album/5VAZ5BkZJUJYclUKuRttNy | OK |
| Label / catalogue | DG 439 898-2 | Discogs 8220303: *Piano Concertos Nos 1 & 3*, DG 439 898-2, ℗ 1994; notes by David Fanning | https://www.discogs.com/release/8220303 | OK |
| Recorded / venue | September 1993 (live), Philharmonie, Berlin | Discogs notes: "Recording: Berlin, Philharmonie, Grosser Saal, 9/1993"; "Live recording (Tracks 4 to 6)" (= Concerto No. 3) | same | OK |
| Spotify | 5VAZ5BkZJUJYclUKuRttNy | "Prokofiev: Piano Concertos Nos.1 & 3", 11 tracks; tracks 4–6 = Concerto No. 3 (9:26 / 8:42 / 9:28, "Live"), all `isPlayable: true` | embed page | VERIFIED |

Also seen: Isata Kanneh-Mason / Philharmonia / Ryan Bancroft (48yVOfJLXmXJgUdy1lyr89, released 2026); Gavrylyuk / Ashkenazy / Sydney SO (4T2sv9ZnEO0XDg2PwogW8W).

## 3. Painting: Paul Gauguin, *Breton Girls Dancing, Pont-Aven*, 1888

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Paul Gauguin (1848–1903) | Commons | OK |
| Title / date / medium / size | *Breton Girls Dancing, Pont-Aven*, 1888, oil on canvas, 73 × 92.7 cm | https://commons.wikimedia.org/wiki/File:Paul_Gauguin,_Breton_Girls_Dancing,_Pont-Aven,_1888,_NGA_61369.jpg | OK |
| Collection | National Gallery of Art, Washington, Collection of Mr. and Mrs. Paul Mellon, 1983.1.19 | same (NGA data donation, source https://purl.org/nga/collection/artobject/61369) | OK |
| Rights | Artist died 1903. NGA Open Access, CC0 | same | OK |
| Image | 4000 × 3135 px JPEG, checked visually: clean, no frame. A larger Google Art Project file exists (9373 × 7349, PD): File:Paul_Gauguin_-_Breton_Girls_Dancing,_Pont-Aven_-_Google_Art_Project.jpg | same | OK |

**Why this painting.** Prokofiev put the concerto together on the Brittany coast in summer 1921; the painting is a Brittany round dance, light and rhythmic, like much of the concerto (the gavotte theme, the dancing second theme of I). The link is place and spirit; the painting is 33 years older than the concerto. No Gauguin work is in `content/paintings.yaml`.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Completed 1921 from sketches begun 1913; theme with variations (II) written 1913, sketches revisited 1916–17; worked on it fully in summer 1921 in Brittany | https://en.wikipedia.org/wiki/Piano_Concerto_No._3_(Prokofiev) | OK |
| Brittany stay at Saint-Brevin-les-Pins (not in guide, which says "the coast of Brittany") | general biographies | SECONDARY |
| Prokofiev left Russia in 1918 | https://en.wikipedia.org/wiki/Sergei_Prokofiev | OK (standard) |
| Premiere 16 December 1921, Chicago, Prokofiev soloist, Chicago SO, Frederick Stock | Wikipedia (concerto) | OK |
| Not an immediate success; established after Koussevitzky's much-praised Paris performance in 1922 | same | OK |
| Prokofiev's 1932 recording (June 1932, LSO, Piero Coppola, Abbey Road), the only recording of him playing one of his concertos | same | OK |
| Most popular of his five piano concertos | general reference (e.g. Wikipedia, programme notes) | SECONDARY (standard) |
| I: opens with a lyrical clarinet solo; strings start the Allegro; piano enters with brilliance; second theme more dissonant; octave passage; ends on open C octaves | Wikipedia (concerto) | OK |
| I: the opening Andante theme returns in the middle of the movement in the full orchestra | standard analyses (e.g. LA Phil and Kennedy Center programme notes) | SECONDARY: confirm by ear |
| I: second theme first in the oboe, then piano with castanets | castanets are in the score (Wikipedia instrumentation); placement from analyses | SECONDARY: confirm by ear |
| II: E minor, gavotte theme for orchestra, five variations: 1 piano slow, opens with a long trill; 2 fast, galloping, with piano runs; 3 syncopated; 4 dialogue; 5 Allegro; theme returns in original tempo with double-time piano; quiet ending on a low E–G chord | Wikipedia (concerto) | OK |
| II: trumpet carries the theme in Variation 2 | analyses | SECONDARY: confirm by ear |
| III: "argument" between soloist and orchestra (Prokofiev); A minor bassoons and pizzicato theme; piano interrupts; lyrical middle theme in woodwinds; sarcastic piano reply; Rachmaninoff-like restatement; soft piano over muted woodwinds; unison climax; coda with bassoon theme; ends on a C major chord | same | OK |

## 5. Re-time (all stops ≈; nobody has listened against the Argerich tracks)

Argerich's tempos are fast (27 minutes against the usual 28–30). Stops are placed from the published structure and track lengths.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Andante – Allegro | 9:03 | 0:00, 0:30, 0:45, 2:10, 3:00–3:45, 4:00, 5:15, 6:40, 7:45, Last 15 seconds | Second theme (≈ 2:10), return of the Andante theme (≈ 4:00), recapitulation (≈ 5:15) |
| II Tema con variazioni | 9:03 | 0:00, 1:20, 3:20, 4:10, 4:50–7:00, 7:00, 7:45, Last 30 seconds | Variation boundaries, especially Var. 2 (≈ 3:20) and Var. 4–5 (≈ 4:50, 7:00) |
| III Allegro, ma non troppo | 8:59 | 0:00, 0:15, 0:45–2:30, 2:30, 3:15, 4:00, 5:00, 5:45, 6:30, 7:30–8:40, Last 15 seconds | Start of the lyrical section (≈ 2:30), the unison climax (≈ 5:45), the coda (≈ 6:30) |
