# Verification: Bach – Keyboard Concerto No. 1 in D minor, BWV 1052

Piece id `bach-keyboard-concerto-1`. Checked on 2026-10-24 (batch October 2026b, group A).
Files: `content/drafts/en/bach-keyboard-concerto-1.md`, `content/drafts/tr/bach-keyboard-concerto-1.md`.
Shared-file additions: `content/research/bach-keyboard-concerto-1.shared.md`.

**How the checks were done**: as in `bach-cello-suite-1.md`. Status key: OK / SECONDARY / UNVERIFIED.

**Form.** The reference recording is on the piano, so `form: piano-concerto` (brief: "piano-concerto if the reference is on piano").

---

## 1. Reference recording: Murray Perahia / Academy of St Martin in the Fields (Sony Classical, rec. 2000, rel. 2001)

Why this one: the best-known piano recording of the concerto in recent decades, Perahia playing and directing; listed among selected recordings in Wikipedia's article on the keyboard concertos and positively reviewed by Gramophone (review "Bach Keyboard Concertos Nos. 1, 2 and 4", seen only as a search-result title, not opened). One track per movement.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2hUeyNhs4wbUTKkGybnhxu | "Bach: Keyboard Concertos, Vol. 1", 9 tracks, Spotify date 2001-03-02, "℗ 2001 SONY BMG MUSIC ENTERTAINMENT"; tracks credited "Johann Sebastian Bach, Murray Perahia, Academy of St. Martin in the Fields". BWV 1052 = tracks 1–3 | https://open.spotify.com/embed/album/2hUeyNhs4wbUTKkGybnhxu | VERIFIED |
| Soloist / director | Murray Perahia, piano and conductor | Discogs SK 89245: "Piano, Conductor – Murray Perahia"; "Orchestra – The Academy Of St. Martin-in-the-Fields"; leader Kenneth Sillito | https://www.discogs.com/release/1026160 | OK |
| Orchestra name | "Academy of St. Martin in the Fields" | as credited on Spotify (the guide's prose uses "Academy of St Martin in the Fields") | embed | OK |
| Label / cat. no. | Sony Classical, "SK 89245" | Discogs 1026160 (US) and 8551462 (Europe), 2001 | as above | OK |
| Recorded / venue | "May 2000", "Air Studios (Lyndhurst Hall), London" | Notes: "Recorded May 14-16, 2000 at Air Studios, Lyndhurst Hall, London." | Discogs 1026160 | OK |
| Piano | "a modern Steinway" | Notes: "Piano: Steinway & Sons No. 539525" | Discogs 1026160 | OK |
| Theorbo | "a theorbo … is listed among the players" | Credits: "Theorbo, Archlute – David Miller" | Discogs 1026160 | OK (which concertos it plays in is not stated) |
| Release year / year | 2001 | Discogs; Spotify ℗ 2001 | as above | OK |

### Durations and playability (Spotify embed, album 2hUeyNhs4wbUTKkGybnhxu, read 2026-10-24 from Turkey)

| Mvt | Spotify track | ms | isPlayable | Guide |
| --- | --- | --- | --- | --- |
| I Allegro | 1 | 430 466 | true | 7:10 |
| II Adagio | 2 | 367 293 | true | 6:07 |
| III Allegro | 3 | 437 973 | true | 7:18 |
| Total | | 1 235 732 | | 21 min (20:36) |

---

## 2. Also recommended: Glenn Gould / Leonard Bernstein / Columbia Symphony Orchestra (1957)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/4ymB9gEzF5iaJ65EbyEvxk — "Beethoven: Piano Concerto No. 2 … – Bach: Keyboard Concerto No. 1 in D Minor, BWV 1052 (Gould Remastered)", Spotify date 1957-01-01, "℗ 1957 Sony Music Entertainment // Digital Remastering (P) 2015"; BWV 1052 = tracks 4–6: 517 202 / 435 446 / 498 004 ms, all `isPlayable: true` | embed page | VERIFIED |
| Label / cat. no. | Columbia Masterworks ML 5211 (mono LP), released 14 October 1957 | https://www.discogs.com/release/2867515 | OK |
| Recorded | "1957" (no session date or venue in the Discogs data; left out of the yaml) | – | year only |

(An older transfer, `5g0vXctxqlVtz8RfwZ5P3C`, has the same performance; the 2015 remaster is used.)

---

## 3. Painting: Bernardo Bellotto, *Dresden from the Right Bank of the Elbe below the Augustus Bridge*, 1748

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title | Bernardo Bellotto (1722–1780), called Canaletto; *Dresden vom rechten Elbufer unterhalb der Augustusbrücke* | Wikidata Q1258467 | OK |
| Date | 1748 | Wikidata; Commons (Google Art Project) | OK |
| Collection | Gemäldegalerie Alte Meister, Staatliche Kunstsammlungen Dresden, Gal.-Nr. 606 | Wikidata P195/P217; Commons | OK (SKD object page not opened; Wikidata used as `source_url`) |
| Medium / size | Oil on canvas, 133 × 237 cm | Wikidata | OK |
| Image | File:Canaletto - Dresden seen from the Right Bank of the Elbe, beneath the Augusts Bridge - Google Art Project.jpg, 6175 × 3486 px, 3.1 MB | https://commons.wikimedia.org/wiki/File:Canaletto_-_Dresden_seen_from_the_Right_Bank_of_the_Elbe,_beneath_the_Augusts_Bridge_-_Google_Art_Project.jpg | OK |
| Public domain | Google Art Project file, PD-Art (artist died 1780); not the SKD's own photo | Commons | OK |
| What it shows (visual check) | The Augustus Bridge across the Elbe; the dome of the Frauenkirche behind it, left of centre; on the right the Catholic court church (Hofkirche) with its tower still in scaffolding | Commons image | OK |
| Artist already used | Bellotto's *The Ruins of the Old Kreuzkirche in Dresden* (1765) pairs with `shostakovich-string-quartet-8`. The brief allows another work by an artist already used "only if it is clearly the best match": here the Dresden link is specific (Bach's court title, the Frauenkirche recital, the 1738 visit theory). Flagged for the product owner; alternatives in the shared note | `content/paintings.yaml` | **Flag** |

Why it fits: Bach received the title of Saxon court composer in 1736 and gave a recital on the new Silbermann organ of the Frauenkirche, whose dome dominates this view, on 1 December 1736. Peter Wollny's theory ties the concerto manuscript to a visit to Dresden in 1738. The pairing note gives this as "one theory".

---

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Autograph of the harpsichord concertos BWV 1052–1058 made c. 1738; BWV 1052 the first | https://en.wikipedia.org/wiki/Harpsichord_Concerto_in_D_minor,_BWV_1052 (Historical context) | OK |
| Earliest surviving source: parts copied in 1734 by C. P. E. Bach (orchestral parts; keyboard part added later; BWV 1052a) | same | OK |
| All three movements used in cantatas with obbligato organ: I–II in BWV 146 (1726), III in BWV 188 (1728) | same | OK |
| Long believed to come from a lost violin concerto (Rust, Spitta; violinistic figuration); in 2016 Wolff and Butler independently argued for an organ concerto from Bach's first Leipzig years | same | OK; the guide says "the question is open" |
| Why the set was compiled: Collegium Musicum (weekly concerts at Café Zimmermann, Bach director 1729–37 and 1739–c. 1741) per Butt; or a Dresden visit in 1738 per Wollny | https://en.wikipedia.org/wiki/Keyboard_concertos_by_Johann_Sebastian_Bach | OK |
| Revival: Sara Levy in Berlin; Fanny Mendelssohn played it in 1824 (Sing-Akademie, Berlin); Felix Mendelssohn in 1835 at the Gewandhaus, Leipzig | BWV 1052 article (Reception) | OK |
| I and III in A–B–A′ form; I: A bars 1–62, B 62–171, A′ 172–end; III: A 1–84, B 84–224, A′ 224–end | BWV 1052 article (Musical structure, citing Jones 2013 and Rampe 2013) | OK |
| Opening ritornelli in unison, "in the manner of Vivaldi"; Jones: "huge elemental power" | same | OK (Jones's phrase not quoted in the guide) |
| Abrupt shifts between D minor and A minor in the openings (I: first 27 bars; III: first 41 bars), "a more ancient modal type of music" | same | OK |
| B section of I starts with repeated-note bariolage figures (violin technique on open strings) | same | OK |
| Ritornello statements in major keys in I: "a sudden, unexpected shaft of light" (Jones) | same | OK (paraphrased, not quoted) |
| End of I: the last ritornello interrupted by a solo episode before the true closing ritornello; final cadenza-like episode | same | OK |
| II: Adagio in G minor, 3/4, on a ground bass stated in unison by everyone, four long solo episodes | same | OK |
| III: after five bars of ritornello at A′, a 37-bar solo episode ending on a fermata for an improvised cadenza, then a 12-bar closing ritornello | same | OK |
| III's solo material resembles the opening of Brandenburg No. 3 | same (not used in the guide's text; noted for the Library) | – |
| Metres: I 4/4 (C), III 3/4 | Score images on the BWV 1052 article (File:BWV1052-1-start.jpeg, File:BWV1052-3-start.jpeg), checked visually | OK |
| III begins with first violins and keyboard; the other strings enter in bar 2 | File:BWV1052-3-start.jpeg (visual check) | OK |
| Perahia directs from the keyboard | Discogs credits "Piano, Conductor" | OK |

---

## 5. Re-time (every stop is ≈; from bar positions and track lengths; not heard)

Reference: Perahia, Spotify `2hUeyNhs4wbUTKkGybnhxu`. I: total bar count **assumed ≈ 193** (not confirmed), ≈ 2.23 s per bar; landmarks bar 7 (first solo), 27 (end of the D/A minor alternation), 62 (B section), 172 (A′). II: bar count not known; stops placed by proportion. III: ≈ 278 bars (84 + 140 + 54, from the article's structure), ≈ 1.58 s per bar; landmarks bars 41, 84, 224, ≈ 266 (fermata), last 12 bars.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro | 7:10 | 0:00, 0:13, 0:20–1:00, 2:15, 3:00–5:30, 6:20, Last minute | Total bar count assumed; 3:00–5:30 is a deliberately wide range for the major-key ritornelli |
| II Adagio | 6:07 | 0:00, 0:40, 2:30, 4:30, Near the end | No bar count: all positions proportional |
| III Allegro | 7:18 | 0:00, 0:20–1:05, 2:10, 5:50, 6:55, Last 20 seconds | 6:55 (fermata) depends on whether Perahia plays a cadenza and how long |
