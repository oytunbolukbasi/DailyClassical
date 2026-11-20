# Verification: Mendelssohn – A Midsummer Night's Dream, concert overture, Op. 21

Files: `content/drafts/en/mendelssohn-midsummer-nights-dream-overture.md`, `content/drafts/tr/mendelssohn-midsummer-nights-dream-overture.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group C).

**Method.** Spotify album ids found from public Spotify track pages (`music:album` meta, web search restricted to open.spotify.com); albums read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: credits, `duration` in ms, `isPlayable`) with the DailyClassical User-Agent from a Turkish network, plus the album page's `music:release_date` and ℗ line.

**Recording choice.** Peter Maag's 1957 LSO recording (Decca) is the classic account of the overture and incidental music and was not yet used in the catalogue (the `mendelssohn-hebrides-overture` research had looked for Maag's Hebrides without finding it on Spotify). The overture is one track on two Spotify albums: Decca Legends "Mendelssohn: Symphony No.3; A Midsummer Night's Dream" (`66Hw8kNdwLAVe2939JL6q0`, track 5, 12:03) and Eloquence "The Peter Maag Edition – Volume 10" (`5Tr3xF7SNPwtA6cqBzbHpi`, track 1, 11:55). The Decca album is taken (label's own issue, linked from the Decca Classics product page); the 8-second difference is probably mastering (silence or start point).

---

## Reference recording: Maag / London Symphony Orchestra, Decca

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/66Hw8kNdwLAVe2939JL6q0 | "Mendelssohn: Symphony No.3; A Midsummer Night's Dream", 12 tracks; track 5 "Overture "A Midsummer Night's Dream", Op.21", credits Felix Mendelssohn, London Symphony Orchestra, Peter Maag; `music:release_date` 2000-01-01; "℗ 2000 Decca Music Group Limited" | https://open.spotify.com/embed/album/66Hw8kNdwLAVe2939JL6q0 | VERIFIED |
| isPlayable | – | `true` (all 12 tracks) | embed | OK |
| One track | – | yes | embed | OK |
| Label page | – | Decca Classics "MENDELSSOHN A Midsummer Night's Dream Maag": release 22 May 2000, UPC 00028946699027 (= 466 990-2), streaming links | https://www.deccaclassics.com/en/catalogue/products/mendelssohn-a-midsummer-nights-dream-maag-863 | OK |
| Cat. no. | 466 990-2 (Decca Legends) | MusicWeb International review header "DECCA Legends 466 990-2" | https://www.musicweb-international.com/classrev/2000/sept00/Mendelssohn-Maag.htm | OK |
| Recorded / venue | 27–28 February 1957, Kingsway Hall, London | MusicWeb: overture and incidental music recorded February 1957, Kingsway Hall; search summary of the Eloquence/Speakers Corner notes: 27–28 February 1957, Kingsway Hall, producer James Walker, engineer Cyril Windebank | as above; https://snvinyl.co.uk/Mendelssohn-A-Midsummer-Nights-Dream-London-Symphony-Orchestra-by-Peter-Maag-180g-LP (search snippet) | OK |
| Original LP | SXL 2060 (comment only) | Speakers Corner reissue "Decca SXL 2060"; Rare Vinyl: SDD 159 reissue of the stereo LP "formerly released as SXL 2060", says 1959 | search snippets | Release year of SXL 2060 not confirmed (1958/1959); yaml uses the CD (2000) as release |
| Reviews | "Reviewers of its CD reissue still praise the orchestra's sparkle, though the 1957 sound is a little limited" | Classics Today: LSO's "sparkle and polish", 1957 sound "dynamically limited", Artistic 10 / Sound 7; MusicWeb: "slight thinness in the strings" | https://www.classicstoday.com/review/review-4701 ; MusicWeb as above | OK |

### Duration

| Track | ms | Guide |
| --- | --- | --- |
| 5 Overture | 723 000 | 12:03 (duration_min 12) |

---

## Also recommended: Abbado / London Symphony Orchestra, DG

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/641f61jKbTKyIPudb6NyeM | "Mendelssohn: Overtures", track 2 "Overture "A Midsummer Night's Dream", Op.21, MWV P 3", 718 750 ms (11:58), playable, LSO / Abbado | embed | VERIFIED |
| Cat. no., year | 423 104-2; ℗ 1985 | as verified in `research/mendelssohn-hebrides-overture.md` (DG product page, Gramophone, MusicWeb) | that note | OK |
| Recorded / venue | null | MusicWeb: overtures recorded 1984–86 at four London locations; date for this overture not found | that note | left null |

---

## Painting: Joseph Noel Paton, *The Quarrel of Oberon and Titania*, 1849

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / dates | Sir Joseph Noel Paton (1821–1901), public domain | Commons (PD-old-100-expired) | OK |
| Title / date / collection | *The Quarrel of Oberon and Titania*, 1849, oil on canvas, 99 × 152 cm, Scottish National Gallery, Edinburgh, NG 293; bought 1850 by the Royal Association for Promoting the Fine Arts in Scotland, transferred 1897 | NGS object page; Wikipedia | https://www.nationalgalleries.org/collection/artists-a-z/p/artist/sir-joseph-noel-paton/object/the-quarrel-of-oberon-and-titania-ng-293 ; https://en.wikipedia.org/wiki/The_Quarrel_of_Oberon_and_Titania | OK |
| Subject | Act II scene 1, at nightfall, in the wood outside Athens; surrounded by fairies (Lewis Carroll counted 165) | Wikipedia | as above | OK |
| Image | `File:Sir Joseph Noel Paton - The Quarrel of Oberon and Titania - Google Art Project.jpg`, 4001 × 2600, PD-Art | Commons API | https://commons.wikimedia.org/wiki/File:Sir_Joseph_Noel_Paton_-_The_Quarrel_of_Oberon_and_Titania_-_Google_Art_Project.jpg | OK |
| Content note | Many small nude fairy figures and some "couples in a state of undress" under a statue of Pan (Wikipedia description) | Wikipedia | – | Flag for the product owner (the app has shown nudes before, e.g. Corot's nymphs) |
| Not already used | Paton not in `content/paintings.yaml` | grep | OK |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Read in 1826 in the Schlegel translation with help from Tieck; finished 6 August 1826 at 17 years and 6 months | Wikipedia, A Midsummer Night's Dream (Mendelssohn) | https://en.wikipedia.org/wiki/A_Midsummer_Night%27s_Dream_(Mendelssohn) | OK (guide: Felix read the play at home in Berlin; "at home" = the family house, Leipziger Straße 3, where he wrote it) |
| Concert overture, not associated with a staging | Wikipedia | as above | OK |
| Premiere Stettin, 20 February 1827, conducted by Carl Loewe | Wikipedia | as above | OK |
| Incidental music Op. 61 commissioned by Frederick William IV; produced at Potsdam 14 October 1843; overture became its first number; includes the Wedding March | Wikipedia | as above | OK |
| Grove: "the greatest marvel of early maturity that the world has ever seen in music" | Wikipedia | as above | OK (quote) |
| Opening four wind chords; fairies in E minor; court music; lovers' theme; Bottom's braying in the strings; craftsmen and hunting calls; development dominated by fairies; recapitulation starts with the four chords; fairies have the last word; ends with the four chords | Wikipedia | as above | OK |
| Scoring includes ophicleide | Wikipedia (Scoring) | as above | OK |
| Ophicleide often replaced by tuba today | Wikipedia, Ophicleide ("superseded … in orchestras by early forms of the modern tuba") | https://en.wikipedia.org/wiki/Ophicleide | OK |
| Theme borrowed from Weber's *Oberon* (Act II finale), perhaps a tribute | Wikipedia ("likely meant to be a tribute to the recently deceased Weber") | as above | OK (guide: "perhaps as a tribute") |
| *Oberon* first staged in London April 1826; Weber died June 1826 | Wikipedia, Oberon (Weber): premiere Covent Garden 12 April 1826; Carl Maria von Weber died 5 June 1826 in London | https://en.wikipedia.org/wiki/Oberon_(Weber) | OK |
| Later music reuses the bray (Bergamask) and the four chords (end of the play) | Wikipedia (Incidental music section) | as above | OK |
| Coda: the court theme returns slow and soft "like a blessing" | knowledge of the score (the forte theme recalled quietly near the end); not checked against a score | – | Check by ear |
| Violins divided in the fairy music | knowledge of the score (divisi violins) | – | OK (common description) |

---

## Re-time

No score bar map; approximate bar positions from memory (686 bars, *Allegro di molto* in 2/2), Maag's 12:03 at ≈ 1.05 s per bar plus ≈ 15 s for each set of held chords. Assumed bars: fairy music b. 8, tutti b. 62, lovers' theme b. 130, workmen/bray ≈ b. 198, development ≈ b. 250, recapitulation (chords) ≈ b. 394, lovers' theme ≈ b. 520, coda ≈ b. 620, final chords ≈ b. 680.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 12:03 | 0:00, 0:15, 1:10, 2:20, 3:30, 4:30, 7:00, 9:15, 11:00, last 30 seconds | The recapitulation (≈ 7:00) and the slow court theme in the coda (≈ 11:00); the four chords at both ends are easy to fix by ear |
