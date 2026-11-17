# Verification: Saint-Saëns – Danse macabre

Piece id `saint-saens-danse-macabre`. Checked on 2026-11-17 (batch November 2026, group I).
Files: `content/drafts/en/saint-saens-danse-macabre.md`, `content/drafts/tr/saint-saens-danse-macabre.md`.
Shared-file additions (paintings.yaml entry, alternatives, re-time row; no new glossary terms, composer already in `composers.yaml`): `content/research/saint-saens-danse-macabre.shared.md`.

**How the checks were done:** Spotify search in the built-in browser; embed `__NEXT_DATA__` read with curl from a Turkish network (track titles, credits, `duration` ms, `isPlayable`); album page meta and ℗/© lines; Discogs API (release pages only); Warner Classics release page; Wikipedia EN/FR via the MediaWiki API; Commons, Wikidata and Estonian Wikipedia for the painting. Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Dutoit / Philharmonia Orchestra (Decca, 1980)

Why this one: Dutoit's Decca album of the four symphonic poems is a long-standing recommendation for this repertoire (Gramophone review "Saint-Saëns Symphonic Poems"); the work is a single track, playable in Turkey. Considered and playable too: Mitropoulos / New York Philharmonic, John Corigliano (Sony, ℗ 1951/1956, `3U2tCdgj2mzgFE72RYmnvR`, 7:25, mono); Ormandy / Philadelphia (Sony, `1oPhXu7xxOHkR6GahZs2To`, 7:10); Maazel / Pittsburgh (`630bDq6H76CNisywAhBhH2`, 6:23).

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Charles Dutoit / Philharmonia Orchestra | Embed track 1: "Danse macabre, Op. 40", credits "Camille Saint-Saëns, Philharmonia Orchestra, Charles Dutoit" | https://open.spotify.com/embed/album/7fiMXZiz7AAMuFWwUjki55 | OK |
| Label / catalogue | Decca SXL 6975 (LP) | 45worlds: Decca SXL 6975, Nov 1981 (Phaéton, Le rouet d'Omphale, Danse macabre / La jeunesse d'Hercule, Marche héroïque); Discogs 6408969 (London CS 7204, Canada, same programme, ℗ 1981 Decca; producer Andrew Cornall, engineer John Dunkerley, recorded at Kingsway Hall) | https://mail.45worlds.com/classical/music/sxl6975 ; https://api.discogs.com/releases/6408969 | OK |
| Recorded | "1980" | Discogs 26458271 (Decca CD 414 460-2, Carnaval + Phaéton/Rouet/Danse macabre): "Kingsway Hall, London, March and June* 1980"; the asterisk's tracks are not shown, so only the year is used | https://api.discogs.com/releases/26458271 | SECONDARY |
| Venue | Kingsway Hall, London | Discogs 6408969 and 26458271 | same | OK |
| Release year | 1981 | SXL 6975 Nov 1981; Spotify ℗ 1981 Decca Music Group Limited, release date 1981-01-01 | album page | OK |
| Spotify | https://open.spotify.com/album/7fiMXZiz7AAMuFWwUjki55 | "Saint-Saëns: Danse Macabre; Phaéton; Havanaise etc.", album, 1981, 7 songs; © 1991 Decca (CD reissue with Kyung Wha Chung's Havanaise and Introduction et Rondo capriccioso) | album page | OK |

The same Dutoit performance is also track 17 of `6i0HvFnPJrXbbEk3JhNxRQ` (Carnaval album), timed 7:08 there (different track edges or remastering); stop times follow `7fiM…`.

### Duration and playability (embed, album 7fiMXZiz7AAMuFWwUjki55)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Danse macabre, Op. 40 | 415826 | 6:55 | true |
| | Total | 415826 | 6:55 → `duration_min: 7` | |

---

## 2. Also recommended: Dervaux / Orchestre de Paris, Luben Yordanoff (EMI, 1971)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Pierre Dervaux, Orchestre de Paris, Luben Yordanoff (violin) | Embed track 1 credits "Camille Saint-Saëns, Pierre Dervaux, Luben Yordanoff, Orchestre de Paris"; Warner Classics release page | https://open.spotify.com/embed/album/0GalN8sugLaTgbnV1lbrob ; https://www.warnerclassics.com/fr/release/saint-saens-dervaux | OK |
| Recorded / venue | October 1971, Salle Wagram, Paris | Search-result listing (Warner Saint-Saëns Edition booklet data): "Recorded: 10, 18–19.X.1971, Salle Wagram, Paris"; Warner page: recorded in 1971 | Warner page; https://horizonsmusic.co.uk/products/jean-martinon-andre-previn-renaud-capucon-bertrand-chamayou-jean-philippe-collard-francois-rene-duchable-daniel-roth-camille-saint-saens-edition | SECONDARY |
| Label / release | EMI (Pathé Marconi), first released 1972; reissued by Warner Classics 15 October 2021 | Spotify ℗ "A Warner Classics/Erato release, ℗ 1972, 2006 Warner Music France"; original catalogue number not found, so `catalogue_number: null` | album page | OK / catalogue UNVERIFIED |
| Spotify | `0GalN8sugLaTgbnV1lbrob`, track 1, 411586 ms = 6:51, isPlayable true | embed | OK |

---

## 3. Painting: Bernt Notke, *Danse Macabre* (Tallinn fragment), late 15th century

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Bernt Notke (c. 1435/40–1509), Lübeck | Commons licence tag deathyear=1509 | OK |
| Title / date | *Danse Macabre* (*Surmatants*, *Revaler Totentanz*), late 15th century (Wikidata gives 1475 and 1499); probably installed c. 1493–95 | Wikidata Q21806426; https://en.wikipedia.org/wiki/Danse_Macabre_(Notke) | OK |
| Medium / size | Oil on canvas, 160 × 750 cm; surviving opening fragment of a work once about 30 m long | https://et.wikipedia.org/wiki/Surmatants_(Tallinn) ; Wikidata | OK |
| Collection | Art Museum of Estonia, Niguliste Museum (St Nicholas' Church), Tallinn; inv. EKM j 18761 M 5174 | Wikidata P195/P217/P276 | OK |
| Figures | Preacher in a pulpit; a skeleton sitting by the pulpit plays the bagpipes; a Death carrying a coffin leads the pope; then emperor, empress, cardinal, king, each led by a Death | et.wikipedia (description section) | OK |
| Image | File:Bernt Notke Danse Macabre.jpg, **4370 × 1006** px | https://commons.wikimedia.org/wiki/File:Bernt_Notke_Danse_Macabre.jpg | OK |
| Rights | `{{PD-Art|PD-old-auto-expired|deathyear=1509}}`; faithful reproduction of a PD painting (EU DSM art. 14, US) | same | OK |
| Note | Very wide (4.3 : 1). The hero crop will show only part of the frieze; the centre (pope/emperor) is a good crop. If a 3:2-ish image is preferred, use alternative 1 | | FLAG |
| Pairing | Cazalis's poem is titled "Égalité, Fraternité": in Death's dance all ranks are equal, which is exactly the subject of the medieval Danse Macabre; a skeleton musician plays for the dance | fr.wikipedia (poem title); sources above | OK |

Not reused: `content/paintings.yaml` has no Notke; Böcklin's *Self-Portrait with Death Playing the Fiddle* is already used (another piece), so it was not considered.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Song for voice and piano, 1872, on Cazalis's poem; published 1873 | https://en.wikipedia.org/wiki/Danse_macabre_(Saint-Sa%C3%ABns) ; https://fr.wikipedia.org/wiki/Danse_macabre_(Saint-Sa%C3%ABns) | OK |
| Poem titled "Égalité, Fraternité" (Cazalis, pen name Jean Lahor; in *L'Illusion*) | fr.wikipedia | OK |
| Poem content: Death strikes a tomb with his heel at midnight, plays a dance tune on the violin, skeletons dance in shrouds, scatter when the cock crows; lord and peasant alike | fr.wikipedia (poem printed in the article; score preface); paraphrased only | OK |
| 1874 orchestral symphonic poem, voice replaced by solo violin; Op. 40, G minor | en.wikipedia | OK |
| Premiere 24 January 1875, Paris, conducted by Édouard Colonne | fr.wikipedia (programme of the premiere; soloist C. Lelong) | OK |
| Reception: en.wikipedia says it was badly received; fr.wikipedia says it was not booed at Colonne's premiere (encored) but was at Pasdeloup's in October 1875. Sources disagree, so the guide says nothing about the reception | both | NOTE |
| Xylophone a rarity in the symphony orchestra then; imitates bones | fr.wikipedia ("inutilisé à l'époque dans un orchestre symphonique"); en.wikipedia; guide words it cautiously ("still a rarity") | OK |
| Theme reused in "Fossils", *The Carnival of the Animals* | en/fr.wikipedia | OK |
| Harp plays D twelve times (midnight) over soft string chords | en.wikipedia | OK |
| Plucked cellos = Death striking with his heel | fr.wikipedia ("les pizzicati des violoncelles représentent la Mort qui frappe du talon") | OK |
| Solo violin E string tuned to E-flat; A–E-flat tritone, "diabolus in musica" | en/fr.wikipedia | OK |
| First theme flute, second theme descending scale on solo violin over soft string chords | en.wikipedia | OK |
| Fugato on the second theme, then Dies irae in the woodwinds in a major key at the midpoint | en.wikipedia; fr.wikipedia mentions the trumpet and cymbals too; guide says "woodwinds" | OK |
| Themes superimposed; climax full orchestra; abrupt break; oboe = cock crow; skeletons return | en/fr.wikipedia | OK |
| Tempo marking "Mouvement modéré de valse", 3/4 | Score (IMSLP title page; standard) | SECONDARY |
| Instrumentation incl. xylophone, harp, solo violin | en.wikipedia | OK |
| In this recording: Dutoit, Philharmonia, Kingsway Hall, 1980; track 1 followed by Phaéton and Le rouet d'Omphale | §1 | OK |

---

## 5. Re-time

All stops are estimates (≈) from the score's order of events (above), the one published timing found (a listening guide to an Orchestre de Paris performance, not checked to be the Dervaux track: first theme 0:32, second theme 0:50, https://awesomeorchestra.org/update/danse-macabre-halloween-in-march) and the Dutoit track length (6:55). The Dies irae is placed at the midpoint, as en.wikipedia describes it.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Mouvement modéré de valse | 6:55 | 0:00, 0:15, 0:30, 0:50, 1:30, 2:30–3:05, 3:05, 3:30, 4:30–5:40, 5:45, Last minute | Xylophone entry (≈ 1:30), fugato and Dies irae (≈ 2:30–3:05), cock crow (≈ 5:45) |
