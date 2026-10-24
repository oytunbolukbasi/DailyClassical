# Verification: Mozart – Ave verum corpus, K. 618

Piece id: `mozart-ave-verum-corpus` (form `choral`).
Files: `content/drafts/en/mozart-ave-verum-corpus.md`, `content/drafts/tr/mozart-ave-verum-corpus.md`. Shared-file additions: `content/research/mozart-ave-verum-corpus.shared.md`.
Checked on 2026-10-24 (batch October 2026 second batch, group C). The drafts were written by an earlier agent; this note checks them. Method: Spotify embed `__NEXT_DATA__` from a Turkish network, MusicBrainz and Discogs APIs, English Wikipedia (wikitext), Mutopia Project LilyPond source for the vocal lines, Wikimedia Commons API.

---

## 1. Reference recording: William Christie, Les Arts Florissants (Erato, 1994)

### Spotify embed check

Album `5xAa0OmX3aCk7u5FhW8MS0`: *Mozart: Requiem & Ave verum corpus*, 15 tracks, `https://open.spotify.com/embed/album/5xAa0OmX3aCk7u5FhW8MS0`.

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 1–14 | Requiem in D minor, K. 626 (Panzarella, Stutzmann, Prégardien, Berg) | | | true |
| **15** | **Mozart: Ave verum corpus, K. 618** | **3:40** | 220000 | true |

Credits on track 15: "Wolfgang Amadeus Mozart, William Christie, Les Arts Florissants". 220 s → `duration_min: 4`. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / chorus / orchestra | William Christie, Les Arts Florissants (choir and orchestra) | MusicBrainz recording 60babf58: conductor Christie, performing orchestra and vocal Les Arts Florissants, concertmaster Monica Huggett | https://musicbrainz.org/recording/60babf58-3f98-4409-8396-5a0f70312ee9 | VERIFIED |
| Label / catalogue number | Erato, 0630-10697-2 | MusicBrainz release bbbcb630 (Erato 0630-10697-2, FR, 1995, barcode 706301069721) links this Spotify album; Discogs 2555201 | https://musicbrainz.org/release/bbbcb630-e074-450a-99af-815eef90b514 ; https://www.discogs.com/release/2555201 | VERIFIED |
| Recorded / venue | 22–24 November 1994, Salle Berthier, Paris | Discogs 2555201 notes: "Recorded 22-24/11/94, Salle Berthier, Paris." MusicBrainz names the place "Ateliers Berthier"; the guide follows the release notes | same | VERIFIED |
| release_year / year | 1995 / 1994 | ℗ Erato 1995 (Discogs) | same | VERIFIED |
| In this recording: track 15, after the 14 tracks of the Requiem; period instruments | | Spotify embed; Les Arts Florissants is a period-instrument ensemble (Monica Huggett concertmaster) | – | VERIFIED |

## 2. Also recommended: Sir Neville Marriner, Academy of St Martin in the Fields and Chorus (Philips, 1993)

| Field | Value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Spotify | `34iAvz6Nz7JafhjVGUBUnM` | *Mozart: Great Mass in C minor; Ave Verum Corpus*, 13 tracks; K. 618 = track 13, 3:33 (213000), `isPlayable: true` | embed page | VERIFIED |
| Recorded / venue | March 1993, St John's, Smith Square, London | MusicBrainz recording 57fbe373: 1993-03, recorded at St John's, Smith Square | https://musicbrainz.org/release/7c549eba-c1a7-4a83-bfeb-17a7ef5548fa | VERIFIED (secondary) |
| Catalogue number | **filled in:** "438 999-2" (draft had null) | The Spotify album's barcode 00028943899925 (MusicBrainz release 7c549eba) = Philips 438 999-2; Discogs 10690466: Philips Digital Classics 438 999-2, Germany, 1994, track 13 "Ave Verum Corpus, K.618" | https://www.discogs.com/release/10690466 | VERIFIED |
| release_year | **filled in:** 1994 (draft had null) | Discogs 10690466 (1994); MusicBrainz release group first release 1994 | same | VERIFIED |

---

## 3. Facts in the guide

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Short motet; autograph dated 17 June 1791 (Mozart's own catalogue 18 June) | en.wikipedia "Ave verum corpus (Mozart)" (NMA I/3 foreword p. XII) | VERIFIED (secondary) |
| Written in the middle of *The Magic Flute*; he died less than six months later | same (Küster 1996 p. 372; Britannica) | VERIFIED (secondary). **Hook changed** from "six months before Mozart died" to "less than six months before" (17 June → 5 December), EN and TR |
| For Anton Stoll, choirmaster of St Stephan in Baden, where Constanze was staying, pregnant with their sixth child | same (Mozart's letter to Stoll, end of May 1791; Heartz 2009 p. 264; Küster) | VERIFIED (secondary) |
| For the feast of Corpus Christi (in 1791, 23 June) | same | VERIFIED |
| Text a medieval Latin Eucharistic hymn; Mozart left out the last lines | same ("the 13th-century Latin Eucharist hymn … omitting the last three lines"); the guide's "medieval" is the cautious form of "13th-century" | VERIFIED |
| Translation of the first couplets | Standard translation of the hymn; Latin from the Mutopia text underlay | VERIFIED |
| 46 bars; four-part choir, strings and organ; one *sotto voce* marking at the start | en.wikipedia ("only forty-six bars long … SATB choir, string instruments, and organ … only a single sotto voce marking at the beginning") | VERIFIED |
| Adagio, 2/2, D major | Wikipedia music example (`\time 2/2`, `\tempo "Adagio"`, D major) | VERIFIED |
| Melody mostly by step in the sopranos, other voices in chords; harmony moves away from the home key on "cujus latus perforatum" | Mutopia LilyPond (`MozartWA/AveverumM`, vocal parts only, transposed to G): homophonic texture in the first two couplets; flats (B-flat, then C and F naturals) on "cujus latus" | VERIFIED (score) |
| On "esto nobis praegustatum" the voices enter one after another | Mutopia source: top voice enters on "Esto" one bar before the bass (`R1` in the bass part) | VERIFIED (score) |
| Christoph Wolff hears in it gestures and textures that look ahead to the Requiem | Wikipedia, quoting Wolff, *Mozart's Requiem* (1998) p. 33: "aspects of the Requiem such as declamatory gesture, textures, and integration of forward- and backward-looking stylistic elements" | VERIFIED (secondary) |
| Simple, for a small-town church choir | Wikipedia (Britannica): "simpler in structure, suited for the church choir in a small town" | VERIFIED (secondary) |

---

## 4. Painting: Juan de Juanes, *The Last Supper* (c. 1562)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Juan de Juanes (Vicente Juan Masip, d. 1579), *The Last Supper*, c. 1562 | Commons file pages (Artwork template, Wikidata Q5965197); Prado object page | VERIFIED |
| Collection | Museo Nacional del Prado, Madrid, P000846 | https://www.museodelprado.es/coleccion/obra-de-arte/la-ultima-cena/2800c04d-a3ad-41eb-a75b-fe359d7d1dde | VERIFIED |
| Medium / size | Oil on panel, 116 × 191 cm | Commons (Artwork template) | VERIFIED |
| Image | Commons `File:The Last Supper by Vicente Juan Macip.jpg`, 2952 × 1869, the Prado's own image (source `content2.museodelprado.es/imagenes/...`), `{{PD-Art|PD-old-auto-expired|deathyear=1579}}`. The other Prado file on Commons (`La Última Cena (Juan de Juanes) (restaurada).jpg`, 2952 × 2069) includes the frame ("P00846marco") | https://commons.wikimedia.org/wiki/File:The_Last_Supper_by_Vicente_Juan_Macip.jpg | VERIFIED. Not NC |
| Not already used | Not in `content/paintings.yaml` or in any other `.shared.md` | – | VERIFIED |

**Pairing.** In Juanes's picture Christ holds up the host above the chalice: the Eucharistic "true body" greeted in the motet's first words, and the subject of the feast (Corpus Christi) for which it was written. The pairing note says only that.

---

## 5. Glossary

Existing term used: motet. No new terms.

---

## 6. Re-time

All stops are estimates; none was heard. Layout from the Mutopia vocal parts (38 sung bars) placed in the 46-bar score: bars 1–2 strings and organ; 3–10 first couplet; 11–18 second; 19–30 third ("cujus latus"); ≈ 30–33 strings lead back to D major; 34–43 fourth couplet and its repeat; 44–46 short string ending. The positions of the instrumental bars are inferred from the bar total, not read from a full score. Average bar 220 s ÷ 46 = 4.78 s (≈ minim 25); Christie may slow down at the end.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Ave verum corpus | 3:40 (track 15) | 0:00, 0:10, 0:48, 1:28, 2:20, 2:50–3:20, Last 15 seconds | 2:20 (start of the string link before "Esto nobis") and the climax span 2:50–3:20 |
