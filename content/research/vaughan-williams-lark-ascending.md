# Verification: Vaughan Williams – The Lark Ascending

Piece id `vaughan-williams-lark-ascending`. Checked on 2026-10-24 (batch October 2026b, group J).
Files: `content/drafts/en/vaughan-williams-lark-ascending.md`, `content/drafts/tr/vaughan-williams-lark-ascending.md`.
Shared-file additions (paintings.yaml, glossary "Sul tasto", composers.yaml entry `vaughan-williams`): `content/research/vaughan-williams-lark-ascending.shared.md`.

**How the checks were done:** as in `research/ravel-string-quartet.md` (Spotify embed `__NEXT_DATA__` from a Turkish network + album page `og:` tags; Discogs API; Deezer API; Wikipedia; Commons API). Score: IMSLP #21575, orchestral score (Oxford University Press, 1925), 24 pages, read in full for section markers. Status key: OK / SECONDARY / UNVERIFIED.

---

## 1. Reference recording: Iona Brown, Academy of St Martin in the Fields, Neville Marriner (Argo, 1972)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Iona Brown; Neville Marriner; Academy of St Martin in the Fields | Spotify credits "Ralph Vaughan Williams, Iona Brown, Academy of St. Martin in the Fields, Sir Neville Marriner" (track 3); Discogs: "Directed by Sir Neville Marriner" | https://open.spotify.com/embed/album/49fD8z3scrgWpCnfkGtbSI ; https://api.discogs.com/releases/1225642 | OK |
| Album | – | "Vaughan Williams: Tallis Fantasia; Fantasia on Greensleeves; The Lark Ascending etc.", album, ℗ 1972 / © 1985 Decca Music Group, 4 tracks; 176 markets incl. TR and US. Same running order as the 1986 CD 414 595-2 | embed + album page; https://api.discogs.com/releases/2884488 | OK |
| Playable in Turkey | – | `isPlayable: true` on all 4 tracks | embed | OK |
| Label / catalogue | Argo ZRG 696 (LP); 414 595-2 (CD) | Discogs 1225642: Argo ZRG 696, UK 1972, "Ⓟ 1972 Argo Records Co."; Discogs 2884488: Argo 414 595-2 (1986). Deezer 6481310: UPC 028941459527 (= 414 595-2) | Discogs; https://api.deezer.com/album/6481310 | OK |
| Recorded | "1971" | Discogs 1225642 notes: "Recorded 12–14th May 1971 at Kingsway Hall (Information is not on release, but taken from the internet)". CD 414 595-2 notes: "Recorded at Kingsway Hall, London, 1972" | same | SECONDARY; conflict, file gives year 1971 with a comment |
| Venue | Kingsway Hall, London | both Discogs entries | same | SECONDARY (not printed on the LP) |
| Cover | – | "Cover picture: The Cornfield … reproduced by kind permission of the Trustees of the National Gallery"; credit "John Constable – Painting [Front Cover]" on LP and CD | Discogs 1225642, 2884488 | OK |
| Producer / engineer | – | Michael Bremner / Stanley Goodall | Discogs | OK (not in the file) |

### Duration (Spotify embed, album 49fD8z3scrgWpCnfkGtbSI)

| Track | Work | ms | Time |
| --- | --- | --- | --- |
| 3 | The Lark Ascending | 964293 | 16:04 → `duration_min: 16` |

(Track 1 Tallis Fantasia 15:13, 2 Greensleeves 4:15, 4 Dives and Lazarus 13:00.) Discogs CD 414 595-2 gives 16:04.

## 2. Also recommended: Hugh Bean, New Philharmonia Orchestra, Adrian Boult (HMV, 1967)

| Field | Verified value | Source URL | Status |
| --- | --- | --- | --- |
| Album | "Vaughan Williams: Serenade to Music, The Lark Ascending, Fantasia on Greensleeves, English Folk Song Suite, In the Fen Country & …", ℗ 1987 / © 1991 Parlophone (Warner Classics), 8 tracks; track 8 The Lark Ascending 14:42 (882333 ms), credits "Sir Adrian Boult, Hugh Bean, New Philharmonia Orchestra"; all tracks `isPlayable: true`; 185 markets incl. TR and US | https://open.spotify.com/embed/album/1zofOqcOpThYW3fj5pVDNW | OK |
| Original LP | HMV ASD 2329 (with Symphony No. 6) | search result summary of a vinyl listing; Wikipedia: "a 1967 EMI recording by Hugh Bean and the New Philharmonia Orchestra, conducted by Boult", the top recommendation of Gramophone's 2015 comparative review and of Rob Cowan's *Classical 1000* | https://en.wikipedia.org/wiki/The_Lark_Ascending_(Vaughan_Williams) | SECONDARY (catalogue number) / OK (year, standing) |
| Recorded | 1 March 1967, No. 1 Studio, Abbey Road (Presto listing, via search summary; not opened directly) | https://www.prestoclassical.co.uk/classical/products/8005724--the-lark-ascending-collection | SECONDARY |

Note: the guide's Bean/Boult link is also historical: Boult conducted the first performance of the orchestral version in 1921.

## 3. Painting: John Constable, *The Cornfield*, 1826

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Object | Oil on canvas, 143 × 122 cm, The National Gallery, London, NG130 | https://www.wikidata.org/wiki/Q2272625 ; https://www.nationalgallery.org.uk/paintings/john-constable-the-cornfield | OK |
| Image | File:John_Constable_-_The_Cornfield.jpg, 2024 × 2364 (Yorck Project scan) | https://commons.wikimedia.org/wiki/File:John_Constable_-_The_Cornfield.jpg | OK (moderate resolution). A 3542 × 4112 gallery photo exists (File:John_Constable_-_The_Cornfield_-_1826.jpg) but is tagged CC BY 2.0 on Commons; not used |
| Rights | Constable died 1837: PD everywhere. Tags PD-old-100, PD-Art-YorckProject | same | OK |
| Reuse rule | Constable is already in paintings.yaml (*Salisbury Cathedral from the Bishop's Garden*). This is a different painting, chosen because it was the cover of the reference recording's first LP (Discogs) and shows the English summer countryside the critics heard in the music | Discogs 1225642 | Judgement: clearly the best match |

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Meredith's poem *The Lark Ascending*, 1881 (Fortnightly Review, May 1881), 122 lines, about the skylark's song | https://en.wikipedia.org/wiki/The_Lark_Ascending (the poem article) | OK |
| Vaughan Williams wrote twelve lines of the poem at the head of the score | https://en.wikipedia.org/wiki/The_Lark_Ascending_(Vaughan_Williams) | OK |
| Original for violin and piano, completed 1914; written for and dedicated to Marie Hall | same; RVW article ("In the same year [1914] he wrote The Lark Ascending in its original form for violin and piano") | OK. Wikipedia also notes "it is not known when and where Vaughan Williams composed the piece": the popular story of composing it while watching troopships at Margate is not used |
| Volunteered in August 1914, approaching 42; RAMC stretcher bearer in France and Greece; 1917 commissioned in the Royal Artillery (Royal Garrison Artillery) | https://en.wikipedia.org/wiki/Ralph_Vaughan_Williams | OK |
| Premiere (violin and piano) 15 December 1920, Shirehampton Public Hall, Marie Hall and Geoffrey Mendham | Lark article | OK |
| Orchestral premiere 14 June 1921, Queen's Hall, Marie Hall, British Symphony Orchestra, Adrian Boult | same | OK |
| *The Times*: "the music is that of the clean countryside, not of the sophisticated concert-room" (quoted in part) | same | OK |
| Subtitle "A Romance", a term he used for contemplative slow music | same | OK |
| No actual folk-song borrowing (Borg-Wheeler) | same | OK |
| Orchestra: two flutes, one oboe, two clarinets, two bassoons, two horns, triangle, strings; triangle the only percussion | same | OK |
| Critics hear solo = sky/bird, orchestra = landscape/ground (Conway; Mark) | same | OK |
| Opening: two-bar introduction (woodwind and muted strings, 6/8), unaccompanied cadenza *pianissimo*, *sur la touche*, *senza misura*; then 2/4 melody; second shorter cadenza; *Allegretto tranquillo (quasi andante)* flute melody; *Allegro tranquillo* with violin trills and off-beat triangle, key G → F, oboe *scherzando*; flute melody returns played by the soloist; reprise; closing cadenza up to D *in altissimo*, then down a minor third to B | same; IMSLP score (sections A–Y, *Largamente* at D and W, *Tempo del principio* at T) | OK |
| Modes: Dorian/Aeolian with pentatonic writing (Mark) | same | OK (guide says "built from a five-note pentatonic scale") |
| Possible underlying sadness (Davis) | same | OK ("Some listeners hear…") |
| Iona Brown is one of the four soloists in the Tallis Fantasia on the same album | Spotify credits track 1 "Iona Brown, Trevor Connah, Stephen Shingles, Kenneth Heath"; Discogs | OK |

## 5. Re-time (every stop is an estimate)

Method: the 24-page OUP score was read for section letters. The unmeasured cadenzas were timed from typical proportions: opening cadenza ≈ 1:50 (pages 1–3), closing cadenza ≈ 1:30. The measured music between them (pages 4–23, letters A–Y) spans ≈ 12:20 in a 16:04 track, ≈ 37 s per score page.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I The Lark Ascending | 16:04 | 0:00, 0:10–2:00, 2:00 (a Tempo, before A), 3:50 (D *Largamente*), 4:55 (second cadenza, p. 9), 5:30 (G *Allegretto tranquillo*), 7:20 (*Allegro tranquillo*, p. 13), 11:10 (R *Allegretto molto tranquillo*), 11:50–13:30 (T *Tempo del principio* to W *Largamente*), Last 90 seconds | The opening cadenza's length (± 25 s) shifts every later stop; 7:20 and 11:10 (± 40 s) |
