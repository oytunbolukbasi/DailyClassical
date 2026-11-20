# Verification: Vaughan Williams – Fantasia on a Theme by Thomas Tallis

Piece id `vaughan-williams-tallis-fantasia`. Checked on 2026-11-20 (batch 2026-11b, group F).
Files: `content/drafts/en/vaughan-williams-tallis-fantasia.md`, `content/drafts/tr/vaughan-williams-tallis-fantasia.md`.
Shared-file additions (paintings.yaml only; composer already exists): `content/research/vaughan-williams-tallis-fantasia.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched from a Turkish network (2026-11-20, User-Agent `DailyClassical/1.0`); MusicBrainz (Spotify link); MusicWeb International review of the EMI reissue (recording dates, venues, quartet members); dealer and retailer listings for the original LP; Wikipedia; Wikimedia Commons API and file wikitext. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: Barbirolli / Sinfonia of London / Allegri Quartet (EMI, 1962)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Sir John Barbirolli / Sinfonia of London; Allegri Quartet (Eli Goren, James Barton, Patrick Ireland, William Pleeth) | Spotify track 1 title "Fantasia on a theme by Thomas Tallis (Sinfonia of London) - Remastered 2022, Version 1962"; credits "Sir John Barbirolli, Hallé Orchestra, Sinfonia Of London" (the album-wide credit lists both orchestras; the title names the Sinfonia of London). MusicWeb: quartet members, "the original Allegri Quartet" in the Tallis | https://open.spotify.com/embed/album/0ZSInMx5cB6ZY0Q7fYsBhB ; https://www.musicweb-international.com/classRev/2010/Dec10/Barbirolli_6317882.htm | VERIFIED / OK |
| Recorded / venue | 17 May 1962, Temple Church, London | MusicWeb: "17 May 1962 ... Temple Church, London"; the Elgar works and *Greensleeves* 10–11 May 1962, Kingsway Hall. Presto listing: same date | MusicWeb ; https://www.prestomusic.com/classical/products/7988773--sir-john-barbirolli-conducts-english-string-music | OK |
| Label / catalogue / release | HMV ASD 521, 1963 | Rarevinyl listings ("1st UK vinyl LP ... ASD521"), search summary of the Penguin Guide via Presto: "Sir John Barbirolli's 1963 album"; MusicWeb: reissue sources "ASD 521 and parts of ASD 2292 and ASD 2635" | https://uk.rarevinyl.com/products/the-sinfonia-of-london-barbirolli-conducts-english-string-music-1st-uk-vinyl-lp-album-record-asd521-746355 ; Presto | OK (release year from dealer/retailer sources) |
| Spotify | 0ZSInMx5cB6ZY0Q7fYsBhB | MusicBrainz release "Fantasia on a Theme by Thomas Tallis / Fantasia on "Greensleeves"" (2022-07-11), url-rel to this album. Warner 2022 remaster compilation, 17 tracks, all playable; track 17 is Barbirolli's 1946 Hallé recording of the same work (not used) | https://musicbrainz.org/ (release search, url-rels) ; embed | VERIFIED |

| Track | Title | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Fantasia on a theme by Thomas Tallis (Sinfonia of London), Version 1962 | 966700 | 16:07 | true |
| | → `duration_min: 16` | | | |

Caution for the merge: the same album also contains the 1946 Hallé recording (track 17, 977106 ms = 16:17). Stop times refer to **track 1**.

Penguin Guide verdict (via Presto, search summary): "almost certainly the finest recording of English string music" (not quoted in the guide).

## 2. Also recommended: Marriner / Academy of St Martin in the Fields (Argo, 1971)

Same album as the reference recording of `vaughan-williams-lark-ascending` (fields copied from that piece; see `content/research/vaughan-williams-lark-ascending.md` for the label, catalogue, date and venue checks).

| Track | Title | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Fantasia on a Theme by Thomas Tallis | 913200 | 15:13 | true |

Spotify credits track 1: Iona Brown, Trevor Connah, Stephen Shingles, Kenneth Heath (the solo quartet), ASMF, Sir Neville Marriner. https://open.spotify.com/embed/album/49fD8z3scrgWpCnfkGtbSI — VERIFIED.

## 3. Painting: Samuel Palmer, *Coming from Evening Church*, 1830

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Samuel Palmer (1805–1881), *Coming from Evening Church*, 1830 | https://www.tate.org.uk/art/artworks/palmer-coming-from-evening-church-n03697 | OK |
| Collection / medium / size | Tate, N03697, purchased 1922; mixed media on gesso on paper (Watts catalogue: tempera, chalk, gold, ink and graphite on gesso on paper), 30.2 × 20 cm | Art UK (search result) https://artuk.org/discover/artworks/coming-from-evening-church-117712 ; Tate URL | OK |
| Image | `File:Samuel_palmer,_tornando_dalla_chiesa_di_sera,_1830.jpg`, 3000 × 4224, Sailko's gallery photo (28 Feb 2017), {{self\|cc-by-3.0}}; includes the frame | https://commons.wikimedia.org/wiki/File:Samuel_palmer,_tornando_dalla_chiesa_di_sera,_1830.jpg | OK (crop needed) |
| Rights | Palmer died 1881: PD everywhere. Faithful photo of a 2D work; project practice treats such photos as PD with a photo credit (Engert, Fahlcrantz entries) | Commons | OK |
| Not reused | Palmer not in `content/paintings.yaml`; no other shared note of this batch names him (grep, 2026-11-20) | – | OK |

**Pairing.** The picture shows the congregation leaving evensong in Shoreham, Kent, under a full moon, with the church behind (Heritage Images caption, Ronald Blythe in *The Spectator*: parishioners walking home from church). The link to the music is of mood and idea (an old, devout, rural England remembered through church music), not of place or date; the alternatives in the shared note have the direct link to Gloucester Cathedral but are weaker pictures.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Tallis's tune: one of nine for Archbishop Parker's Psalter (1567); Parker's metrical Psalm 2; Phrygian mode; Double Common Metre | https://en.wikipedia.org/wiki/Fantasia_on_a_Theme_by_Thomas_Tallis | OK |
| VW found it editing *The English Hymnal* (1906), set it there to Addison's "When rising from the bed of death" | same | OK (guide: "another hymn text") |
| Commissioned by the Three Choirs Festival, 1910; premiere 6 September 1910, Gloucester Cathedral, VW conducting the LSO; second half Elgar's *The Dream of Gerontius* conducted by Elgar | same | OK |
| Herbert Brewer (cathedral organist): "a queer, mad work by an odd fellow from Chelsea"; "generally warm welcome" from the press | same | OK |
| Fuller Maitland in *The Times*: "Throughout its course one is never quite sure whether one is listening to something very old or very new" | same | OK (paraphrased in the guide) |
| Revisions 1913 and 1919, each more concise | same | OK |
| Scoring: double string orchestra and string quartet; Orchestra II = 2 first violins, 2 seconds, 2 violas, 2 cellos, 1 double bass (9 players); antiphony between the three groups | same | OK |
| Structure: introduction with low strings plucking hints of the first two phrases and the bowed "sway" motif; opening statement from bar 15 (second violins, violas, cellos), 6/8 for the third and fourth phrases; first violins join; climax *appassionato*; first episode: orchestras divide; second episode: solo viola (*Poco più animato*), then quartet, then orchestras; third episode: sway motif, *poco a poco animando* to fortissimo (climax in 5/8), pianissimo "afterglow"; fourth episode *molto adagio*; restatement with plucked low strings, solo violin and viola over a "featherbed of sound"; coda with solo violin; ends on a G major chord | same | OK |
| Tempo heading "Largo sostenuto" | Not in the sources consulted (Wikipedia gives "ppp molto sostenuto" for the opening) | UNVERIFIED against the score |
| Metres 4/4, 3/4, 6/8 (also 5/8 at the climax) | Wikipedia | OK |
| VW aged 37 at the premiere (born 12 October 1872); *The Lark Ascending* 1914 | `content/composers.yaml`; Lark research note | OK |
| Barbirolli: Temple Church recording; the rest of ASD 521 at Kingsway Hall a week earlier; MusicWeb: the recording "gains from being recorded in the Temple Church", the distant orchestra heard clearly | MusicWeb | OK |

## 5. Re-time (all stops are ≈; derived from the structure above, typical proportions for a 15–16½ minute performance, the MusicWeb reference to 10:48 and the exact track length, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Largo sostenuto | 16:07 | 0:00, 1:20, 2:40–3:40, 4:20, 6:10, 7:30, 8:40–11:00, 11:10, 11:50, 12:40, 14:40, Last 30 seconds | The first episode ≈ 4:20 and the solo viola ≈ 6:10 (± 45 s); the restatement ≈ 12:40 (± 40 s). The climax range is anchored by the reviewer's "10:48" |
