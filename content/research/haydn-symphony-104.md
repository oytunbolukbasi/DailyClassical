# Verification: Haydn – Symphony No. 104 in D major, Hob. I:104, "London"

Files: `content/drafts/en/haydn-symphony-104.md`, `content/drafts/tr/haydn-symphony-104.md`.
Checked on 2026-10-24. Batch October 2026 (second batch), group B. Composer `haydn` already in `composers.yaml`.

**How the checks were done:** as in `pachelbel-canon.md` (Spotify embed `__NEXT_DATA__` from a Turkish network; MusicBrainz; Wikipedia/Commons/Wikidata APIs; generic `DailyClassical/1.0` User-Agent; IMSLP unreachable behind a bot check; web-search budget exhausted part-way).

---

## Reference recording: London Philharmonic Orchestra / Eugen Jochum (Deutsche Grammophon, rec. 1971)

Why this one: Jochum's London-symphony cycle is a long-standing recommendation, a London orchestra plays the "London" symphony, and it differs from the Davis/Concertgebouw album already used for `haydn-symphony-94` (kept here as the alternative).

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/3b3HbFp77kdBgsf7T2roxt | "Haydn: The 12 "London" Symphonies", 60 tracks (the embed lists 59); No. 104 = tracks 21–24, credit "Joseph Haydn, London Philharmonic Orchestra, Eugen Jochum"; "Joseph Haydn · album · 2003", "℗ 2003 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/embed/album/3b3HbFp77kdBgsf7T2roxt | OK |
| Playable in Turkey | – | tracks 21–24 `isPlayable: true` (tracks 57–59, a different No. 98, are false; not used) | embed JSON | OK |
| Catalogue | 474 364-2 | MusicBrainz "The 12 London Symphonies", Deutsche Grammophon 474 364-2, 2003-04; No. 104 track lengths 539 000 / 508 000 / 311 000 / 400 560 ms (match Spotify within 1 s) | https://musicbrainz.org/release/e859d308-2fcc-384a-a59b-6a3478a9e5f8 | OK |
| Recorded / venue | October 1971, Barking Assembly Hall | MusicBrainz recording relations for all four movements: Barking Assembly Hall, 1971-10 (also on the 1992 set 437 201-2) | same; https://musicbrainz.org/release/533ab133-089e-42db-a86f-347aa8633d72 | OK (single source) |
| Cycle dates | "early 1970s" | DG reissue notice dates the cycle 1971–3 (search excerpt, classical-music.com "DG: Collectors Edition") | https://www.classical-music.com/reissues/dg-collectors-edition | OK |
| release_year | 2003 | The Spotify edition; the original LP coupling of No. 104 was not traced (MusicBrainz lists a 1978 GB LP 2535 347, Nos. 104 & 100, which is a later mid-price issue) | MusicBrainz search | Flag: replace with the first LP year if found |
| No exposition repeat in I | "does not repeat the exposition" | Derived, not documented: introduction 16 bars + Allegro bars 17–294 (exposition 17–123). With the repeat, 385 Allegro bars would have to fit into ≈ 7 min (≈ 1.1 s per bar, crotchet ≈ 215), impossible for this Allegro; without it, ≈ 1.5 s per bar (minim ≈ 80), plausible | own calculation from bar plan (study-guide bar numbers, see Re-time) | **check by ear** |

### Durations (Spotify embed, album 3b3HbFp77kdBgsf7T2roxt)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Adagio – Allegro | 21 | 538 986 | 8:59 |
| II Andante | 22 | 507 933 | 8:28 |
| III Menuetto: Allegro | 23 | 310 946 | 5:11 |
| IV Finale: Spiritoso | 24 | 401 586 | 6:42 |
| Total | | 1 759 451 | 29 min (29:19) |

## Also recommended: Royal Concertgebouw Orchestra / Sir Colin Davis (Philips, rec. 1977)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2FNZ21rGfvoYz953jd6Tda — "Haydn: Symphonies 94, 100 & 104", No. 104 = tracks 9–12 (8:31 / 8:12 / 4:28 / 6:56), all `isPlayable: true` | embed | OK (the same album is the reference for `haydn-symphony-94`) |
| Recorded | 5–11 November 1977, Concertgebouw, Amsterdam | MusicBrainz, Philips 442 611-2 (The London Symphonies Vol. 1), No. 104 recording relations | https://musicbrainz.org/release/c61aa8c6-d129-4ff0-83e3-dbe7a15611f4 | OK |
| release_year 2009 | the Spotify compilation (see `haydn-symphony-94.md`) | – | OK |

---

## Painting: Canaletto, *Westminster Bridge, with the Lord Mayor's Procession on the Thames*, 1747

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Giovanni Antonio Canal, called Canaletto (1697–1768); 1747 | Commons file page; https://www.wikidata.org/wiki/Q19660767 | OK |
| Collection | Yale Center for British Art, Paul Mellon Collection, B1976.7.94 | Commons (accession number); Wikidata P217; YCBA record id 1669225 (Wikidata P4738) | OK |
| Source URL | https://collections.britishart.yale.edu/vufind/Record/1669225 (Wikidata formatter) | the YCBA site answered with a bot check and was not opened | **check the URL** at merge |
| Medium | Oil on canvas | YCBA (not opened); standard catalogue description | **check** |
| Image | 5095 × 3831, Google Art Project | https://commons.wikimedia.org/wiki/File:Canaletto_-_Westminster_Bridge,_with_the_Lord_Mayor%27s_Procession_on_the_Thames_-_Google_Art_Project.jpg | OK |
| Rights | {{PD-Art|PD-old-100-1923|deathyear=1768}}; YCBA releases images of its public-domain works as open access | Commons wikitext | OK |
| Not already used | Canaletto not in `content/paintings.yaml` | – | OK |

Why it fits: London, its river and its civic pageantry; the city whose paying public gave Haydn his greatest success. The note says plainly that the picture is half a century earlier than the symphony.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Two London visits, 1791–92 and 1794–95, arranged by Johann Peter Salomon; twelve London symphonies; No. 104 the last, composed in London in 1795 | https://en.wikipedia.org/wiki/London_symphonies ; https://en.wikipedia.org/wiki/Symphony_No._104_(Haydn) | OK |
| Haydn's final symphony | Symphony No. 104 article | OK |
| Concert of Haydn's own music, directed by him, King's Theatre, 4 May 1795; diary: everyone pleased, 4,000 gulden, "such a thing is possible only in England" | Symphony No. 104 article; Edition HH and AllClassical give the same date | OK |
| Some sources: first performed 13 April 1795 at the King's Theatre (Viotti's Opera Concert) | Edition HH blurb repeated by retailers (search excerpt) | told as "some sources date its first performance a few weeks earlier, in the same theatre" |
| Nickname arbitrary; "Salomon" symphony in Germany | Symphony No. 104 article | OK |
| Scoring: pairs of flutes, oboes, clarinets, bassoons, horns, trumpets; timpani; strings | same | OK |
| Introduction in D minor; opening uses only D and A, so major/minor unclear | same | OK |
| Allegro monothematic: second theme = first theme in A major; development starts in B minor using the rhythm of the second half of the theme | same | OK |
| Andante, G major: main theme in strings; episode in A minor/D minor; modified repeat with bassoon; second section through G minor and B-flat; return after arriving on the dominant; more prominent winds, especially flute | same | OK |
| Minuet D major (second section visits B minor and A major); trio in B-flat with oboe and bassoon; transition back | same | OK |
| Finale: drone bass; theme "often claimed" to come from the Croatian song "Oj, Jelena"; development extended in F-sharp minor before the recapitulation | same; https://en.wikipedia.org/wiki/Haydn_and_folk_music (claim from Kuhač, linked to the discredited theory of Haydn's Croatian origins) | OK, told as disputed |
| Metres (4/4, 2/4, 3/4, 2/2) | Score knowledge; IMSLP unreachable | **check** II (2/4) and IV (alla breve) against a score |

---

## Re-time

No stop was timed by ear. Bar plan for I from a study guide (search excerpt; matches memory of the score): introduction bars 1–16; exposition 17–123 (first group 17–49, transition 50–64, second group = first theme in A major 65–98, codetta 99–123); development 124–192; recapitulation 193–276; coda 277–294. Introduction ≈ 2:00 (Wikipedia: "typically two minutes"); Allegro 278 bars in ≈ 6:55 → ≈ 1.49 s per bar, no exposition repeat.
- b. 17 → 2:00; b. 32 (first tutti) → 2:22; b. 65 → 3:11; b. 124 → 4:39; b. 193 → 6:22; b. 277 → 8:27.
- II, III and IV: no reliable bar numbers available (IMSLP unreachable); stops placed by the proportions of the form described on Wikipedia and typical section lengths. III assumes the minuet with repeats ≈ 2:40 and the da capo without repeats; IV assumes no exposition repeat (the 6:42 length at a normal Spiritoso tempo).

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Adagio – Allegro | 8:59 (538 986 ms) | 0:00, 2:00, 2:20, 3:10, 4:40, 6:20, last 30 s | 2:00 (length of Jochum's introduction) shifts everything after it |
| II Andante | 8:28 (507 933 ms) | 0:00, 1:50, 3:00, 5:00, 6:00, last minute | 1:50, 5:00, 6:00 (proportional only) |
| III Menuetto: Allegro | 5:11 (310 946 ms) | 0:00, 2:40, 3:45, last 15 s | 2:40 and 3:45 (depend on which repeats Jochum takes) |
| IV Finale: Spiritoso | 6:42 (401 586 ms) | 0:00, 0:20, 2:20, 3:40, 4:15, last 40 s | 2:20, 3:40, 4:15 (proportional; would all move later if the exposition is repeated) |

## Open items

1. Confirm by ear: no exposition repeat in I (and in IV); trio start in III.
2. Original LP issue of Jochum's No. 104 (for `release_year`).
3. YCBA object URL and medium for the Canaletto.
