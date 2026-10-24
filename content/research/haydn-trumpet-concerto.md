# Verification: Haydn – Trumpet Concerto in E-flat major, Hob. VIIe:1

Files: `content/drafts/en/haydn-trumpet-concerto.md`, `content/drafts/tr/haydn-trumpet-concerto.md`.
Checked on 2026-10-24. Batch October 2026 (second batch), group B. Composer `haydn` already in `composers.yaml`.

**How the checks were done:** as in `pachelbel-canon.md` (Spotify embed `__NEXT_DATA__` from a Turkish network; MusicBrainz; Wikipedia/Commons/Wikidata APIs; generic `DailyClassical/1.0` User-Agent; IMSLP unreachable behind a bot check; web-search budget exhausted part-way).

---

## Reference recording: Håkan Hardenberger / Academy of St Martin in the Fields / Sir Neville Marriner (Philips, rec. 1986)

Why this one: the disc that made Hardenberger's name (the Academy's own page and Gramophone's Ivan March, as quoted on it, call it the finest collection of trumpet concertos), one track per movement, playable in Turkey.

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2Nle45HVeKJufYteziTJ8X | "Haydn, Hummel, Hertel & Stamitz Trumpet Concertos", 12 tracks; Haydn = tracks 10–12, credit "Joseph Haydn, Håkan Hardenberger, Academy of St. Martin in the Fields, Sir Neville Marriner"; "Håkan Hardenberger · album · 1987", "℗ 1987 Universal International Music B.V.", "© 2012 Decca Music Group Limited" | https://open.spotify.com/embed/album/2Nle45HVeKJufYteziTJ8X | OK |
| Playable in Turkey | – | all 12 tracks `isPlayable: true` | embed JSON | OK |
| Duplicate edition | – | https://open.spotify.com/album/6uLoGBjuEZ6SL6NfJApHEU (same title, © 1987, Haydn 6:19 / 3:49 / 4:28, all playable): an older master with different track lengths. The guide's times are tied to **2Nle45HVeKJufYteziTJ8X** | embed | note |
| Label / cat. no. | Philips 420 203-2 | MusicBrainz "Trumpet Concertos", Philips Digital Classics 420 203-2, 1987; Haydn track lengths 372 000 / 229 493 / 266 506 ms | https://musicbrainz.org/release/243426c4-5f09-4008-a274-5011f6a9d75b | OK |
| Recorded | October 1986 | MusicBrainz: Haydn I "recorded at St. John's Cathedral, 1986-10". CiNii record of a Japanese reissue (PHCP-21038 / 464 589-2): 9–12 October 1986, "London, St John's Church" for the Marriner works | MusicBrainz as above; https://cir.nii.ac.jp/crid/1130000793923135488 (search excerpt) | OK for the month; **venue uncertain** (church name differs; the guide follows CiNii, with a yaml comment) |
| Hardenberger aged 24 | born 27 October 1961 | https://en.wikipedia.org/wiki/H%C3%A5kan_Hardenberger | OK (24 on 9–12 October 1986) |

### Durations (Spotify embed, album 2Nle45HVeKJufYteziTJ8X)

| Mvt | Track | ms | Guide |
| --- | --- | --- | --- |
| I Allegro | 10 | 370 000 | 6:10 |
| II Andante | 11 | 227 493 | 3:47 |
| III Finale: Allegro | 12 | 266 506 | 4:27 |
| Total | | 863 999 | 14 min (14:24) |

## Also recommended: Wynton Marsalis / National Philharmonic Orchestra / Raymond Leppard (CBS, rec. 1982)

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/27MceTtP8V5SYgDIVfUExa — "Haydn, L. Mozart & Hummel: Trumpet Concertos", 8 tracks; Haydn = tracks 1–3 (6:19 / 3:15 / 4:23), all `isPlayable: true`; "album · 1983", "℗ 1983 Sony Music Entertainment Inc." | embed + album page | OK |
| Catalogue / recorded | CBS Records Masterworks MK 37846 (1983); Haydn recorded 15–17 December 1982, Abbey Road Studios, Studio 1 | https://musicbrainz.org/release/f1136f18-bb86-4974-864f-e7814b76f6d8 | OK |

---

## Painting: Jean-Siméon Chardin, *The Instruments of Military Music* (*Les instruments de la musique militaire*), 1767

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Jean-Siméon Chardin (1699–1779), 1767 | https://www.wikidata.org/wiki/Q21023868 | OK |
| Collection | Musée du Louvre, Paris, RF 2010-13 | Wikidata P217; Louvre cartel http://cartelfr.louvre.fr/cartelfr/visite?srv=car_not_frame&idNotice=32227&langue=fr (from Wikidata) | OK; Louvre page not opened |
| Subject | Still life: a natural (valveless) trumpet with banner and tassels lying on a kettledrum, with a drum, a fife/oboe, music paper | thumbnail checked | OK |
| Image | Commons https://commons.wikimedia.org/wiki/File:Chardin,_gli_strumenti_della_musica_militare,_1767.JPG — 2577 × 2100, gallery photo by Sailko **including the gilt frame** | Commons API | **see rights** |
| Rights | Artwork {{PD-Art|PD-old-auto-expired|deathyear=1779}}; photo licence {{self|cc-by-3.0}} (the photographer's licence, because the 3D frame is in the picture) | Commons wikitext | **Flag**: crop to the painted oval/canvas only. A faithful reproduction of the 2D painting alone creates no new right (EU DSM art. 14; US), the same reasoning as the Belvedere photo used for `haydn-string-quartet-op-76-3`. After cropping the usable image is about 2100 × 1700, smaller than ideal for the hero |
| Other copies | File:Chardin_attributs_musique_militaire.jpg (820 × 625) and File:Attributs_musique_militaire_chardin_louvre.jpg (753 × 586): too small | Commons category "Instruments de la Musique Militaire (RF 2010-13)" | – |
| Not already used | Chardin not in `content/paintings.yaml` | – | OK |

Why it fits: it shows the instrument the concerto left behind, the valveless trumpet of fanfares and military music, three decades earlier. If the crop or resolution is not acceptable, use one of the alternatives in the shared note.

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Composed 1796 for Anton Weidinger; Haydn aged 64 | https://en.wikipedia.org/wiki/Trumpet_Concerto_(Haydn) | OK |
| Weidinger (1766–1852), Viennese trumpeter; from 1799 member of the Imperial and Royal Court Trumpeter Corps ("later joined the imperial court trumpeters") | https://en.wikipedia.org/wiki/Anton_Weidinger | OK |
| Keyed trumpet: tone holes covered by keys, full chromatic scale; Weidinger experimented with it from 1792 | same; https://en.wikipedia.org/wiki/Keyed_trumpet | OK |
| Natural trumpet: only the harmonic series, notes clustered high, so melodies written high (e.g. Bach's Brandenburg Concerto No. 2); Haydn writes melodies in the middle and lower register | Trumpet Concerto article | OK |
| First performance by Weidinger, 28 March 1800, old Burgtheater, Vienna | Anton Weidinger article; Trumpet Concerto article (28 March 1800) | OK |
| Keyed trumpet's tone criticised; superseded by valved instruments (in use only until the 1830s–40s) | Trumpet Concerto article ("very poor sound quality"); Keyed trumpet article | OK ("within a few decades") |
| "Possibly Haydn's most popular concerto" | Trumpet Concerto article (quotation there) | OK, attributed as "has been called" |
| Scoring includes horns, trumpets, timpani | Trumpet Concerto article (two flutes, two oboes, two bassoons, two horns, two trumpets, timpani, strings) | OK |
| Hummel's concerto also written for Weidinger | Anton Weidinger article | OK |
| Haydn back in Vienna after London (1795) | London symphonies article (second visit ended 1795) | OK |
| Andante in A-flat, 6/8; middle section moves to a distant key | Movement keys: standard; remote modulation from score knowledge (IMSLP unreachable) | **check** (the guide does not name the key) |
| Finale opens quietly in the violins | score knowledge | **check by ear** (high confidence) |

---

## Re-time

No stop was timed by ear and no bar numbers could be checked (IMSLP unreachable). Assumptions from memory of the score: I ≈ 172 bars of 4/4 with the orchestral exposition ending at bar 36 (trumpet's first full entry at bar 37), development from ≈ bar 94, recapitulation ≈ bar 126, cadenza ≈ bar 166; with a cadenza of ≈ 40 s the pulse is ≈ 1.93 s per bar → entry 1:10, development ≈ 3:00, recapitulation ≈ 4:00. II: ≈ 8-bar string introduction (≈ 25 s). III: quiet string statement ≈ 12 s, trumpet entry after the opening tutti ≈ 0:45; later sections proportional.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro | 6:10 (370 000 ms) | 0:00, 1:10, 1:50, 3:00, 4:00, near the end (cadenza), last 30 s | 3:00 and 4:00 (bar numbers from memory) |
| II Andante | 3:47 (227 493 ms) | 0:00, 0:25, 1:30, 2:20, last 30 s | 1:30 (the modulation) |
| III Finale: Allegro | 4:27 (266 506 ms) | 0:00, 0:12, 0:45, 1:30, 2:30, 3:15, last 30 s | 2:30 (minor-key episode) and 3:15 |

## Open items

1. Re-time against a score or by ear, especially I 3:00/4:00 and III 2:30.
2. Painting: crop the Chardin photo to the canvas and confirm the resolution is acceptable, or pick an alternative.
3. Venue of the Hardenberger sessions (St John's Church vs "St John's Cathedral"); possibly St John's, Smith Square, but no source says so.
