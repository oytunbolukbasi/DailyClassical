# Verification: Fauré – Requiem in D minor, Op. 48

Files: `content/drafts/en/faure-requiem.md`, `content/drafts/tr/faure-requiem.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group E). Shared-file additions (paintings.yaml, glossary, composers.yaml entry for `faure`, re-time row): `content/research/faure-requiem.shared.md`.

**How the checks were done.** Spotify search in the built-in browser; embed `__NEXT_DATA__` read with a script from a Turkish network (User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`); album page `music:release_date` and ℗/© lines; Discogs API; Wikipedia EN via the MediaWiki API; Wikidata; Wikimedia Commons API; the Clark Art Institute's catalogue PDF. Status key OK / SECONDARY / UNVERIFIED. No personal data sent.

---

## Reference recording: Corboz / Berne, Erato 1972

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/5W3TSZNBV06EuCuoaEykzf | "Fauré: Requiem", 7 tracks, all the Requiem; Spotify date 1972-01-01; "℗ 1972 Erato Classics S.A.", "© 2000 Warner Music Japan Inc." | https://open.spotify.com/embed/album/5W3TSZNBV06EuCuoaEykzf ; https://open.spotify.com/album/5W3TSZNBV06EuCuoaEykzf | VERIFIED |
| isPlayable | – | `true` for all 7 tracks | embed | OK |
| Credits | Michel Corboz; Maîtrise Saint-Pierre-aux-Liens de Bulle; Berner Symphonie-Orchester; Alain Clément (treble, Pie Jesu); Philippe Huttenlocher (baritone, Offertoire, Libera me); Philippe Corboz (organ) | Embed track credits name exactly these, by track (Clément on IV only, Huttenlocher on II and VI). Discogs LP credits: Alain Clément "Soprano", Huttenlocher baritone, Philippe Corboz organ, choir prepared by André Corboz, recorded by Peter Willemoës, liner notes Jean-Michel Nectoux | embed; https://api.discogs.com/releases/4232868 | OK |
| Role "treble" | treble | Discogs says "Soprano"; Alain Clément was a boy (the guide says so). "treble" = boy soprano | Discogs; Corboz recordings are widely described as with a boy soprano (search summary: IDAGIO/Raygum listings) | SECONDARY |
| Label / cat. no. | Erato; STU 70735 (LP); 0630-16061-2 (CD) | Discogs 4232868: Erato STU 70735, France 1972, "℗ Editions Costallat 1972"; Discogs 7959934: Erato 0630-16061-2 (1996), "℗ … 1972 (1-7)" | https://api.discogs.com/releases/4232868 ; https://api.discogs.com/releases/7959934 | OK |
| Recorded / venue | "1972" / null | Only the year is known (℗ 1972). No session date or venue found in Discogs or by web search | – | UNVERIFIED (yaml comment says so) |
| Version | 1900 (full orchestra) | Wikipedia "Requiem (Fauré)", Selected recordings: until Rutter's 1893 edition was recorded in 1984, all recordings but one (Bourmauck, 1938) used the 1900 orchestration. The 1972 Corboz therefore uses the 1900 score; scoring audible on the album (horns, trombones, full strings) is consistent | https://en.wikipedia.org/wiki/Requiem_(Faur%C3%A9) | OK (by inference from a published statement) |

### Durations (embed, ms)

| Track | Title | ms | Guide |
| --- | --- | --- | --- |
| 1 | I. Introït et Kyrie | 468 000 | 7:48 |
| 2 | II. Offertoire | 483 706 | 8:03 |
| 3 | III. Sanctus | 237 493 | 3:57 |
| 4 | IV. Pie Jesu | 198 733 | 3:18 |
| 5 | V. Agnus Dei | 373 533 | 6:13 |
| 6 | VI. Libera me | 377 066 | 6:17 |
| 7 | VII. In Paradisum | 264 506 | 4:24 |

Sum 2 403 037 ms = 40:03 → `duration_min: 40`. Seven movements = seven tracks (the brief's limit is 7).

---

## Also recommended: Cluytens / Paris Conservatoire, EMI 1962

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/6dQ1LTRiGeNCQK8avL1ApV | "Fauré: Requiem, Op. 48", 7 tracks (8:08, 9:10, 3:19, 3:19, 6:47, 5:20, 3:48), all playable; credits Cluytens, Chœurs Élisabeth Brasseur, Fischer-Dieskau (II, VI), Victoria de los Ángeles (IV), Henriette Puig-Roget (organ), Orchestre de la Société des Concerts du Conservatoire; "℗ … 1963, 1998 Parlophone Records Limited". (A duplicate album 2NIyKgjwAYEWCfiDXZJkOF has identical tracks.) | embed | VERIFIED |
| Recorded / venue | 14–15 February 1962, Église Saint-Roch, Paris | Discogs 1089961 (EMI "Great Recordings of the Century", 7243 5 66894 2 8, 1998): "Recording: February 14-15, 1962, L'Église Saint-Roch, Paris"; Discogs 3249849 (HMV SAN 107): "Recorded in the Church of St. Roch, Paris". Wikipedia lists it as "Saint-Roch, Paris, 1963" (release year) | https://api.discogs.com/releases/1089961 ; https://api.discogs.com/releases/3249849 | OK |
| Cat. no. / release | SAN 107 (LP); 5 66894 2 (CD); release 1963 | Discogs; Spotify ℗ 1963 | as above | OK |

---

## Painting: Pierre Puvis de Chavannes, *Death and the Maidens*, 1872

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist / title / date | Pierre Puvis de Chavannes (1824–1898), *Death and the Maidens* (*Les jeunes filles et la Mort*), signed and dated 1872 | Clark catalogue entry no. 257 (Sarah Lees, ed., *Nineteenth-Century European Paintings at the Clark*, 2012): https://media.clarkart.edu/1955.54_EuroCat.pdf ; Wikidata Q104774014 | OK |
| Collection | Clark Art Institute, Williamstown, Massachusetts, 1955.54; oil on canvas, 146.4 × 117.2 cm | same | OK |
| What it shows (for the pairing note) | Young women frolicking and picking flowers; Death with his scythe at the lower left, his hand "extended in a relaxed manner over, rather than grasping, the scythe", apparently asleep; an early title was *The Sleeping Reaper*; refused at the Salon of 1872 | Clark catalogue entry | OK |
| Image | `File:Pierre Puvis De Chavannes - Death and the Maidens - 1955.54 - Clark Art Institute.tiff`, 7405 × 10451, Commons licence "Public domain" (source: Clark Art Institute). The museum photo includes a colour target and caption strip at the bottom and a text line at the top: crop before use (see shared note) | https://commons.wikimedia.org/wiki/File:Pierre_Puvis_De_Chavannes_-_Death_and_the_Maidens_-_1955.54_-_Clark_Art_Institute.tiff | OK |
| Rights | Painter died 1898: public domain by age everywhere. Faithful photo of a 2D work: no new right (EU DSM art. 14; US *Bridgeman v. Corel*). Not NC | – | OK |
| Not already used | Neither the painting nor Puvis de Chavannes appears in `content/paintings.yaml` (checked 2026-11-20) | – | OK |
| Link to the music | French, painted in Paris in Fauré's lifetime (1872); death shown close by but asleep and unthreatening, as Fauré described his Requiem ("a lullaby of death … a happy deliverance") | Wikipedia "Requiem (Fauré)" | OK |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Composed 1887–90, revised in the 1890s, final version 1900; seven movements; soprano, baritone, choir, orchestra, organ | Wikipedia "Requiem (Fauré)" (lead, History, Structure) | OK |
| Omits the *Dies irae* except its last verse, the Pie Jesu; adds Libera me and In paradisum from the Order of Burial | Wikipedia (lead; Text) | OK |
| Fauré was choirmaster at the Madeleine (from 1877; chief organist from 1896) | Wikipedia "Gabriel Fauré" (Organist and composer; Middle years). The Requiem article calls him "organist" in 1888; the Fauré article shows he was choirmaster then. The guide says "choirmaster" | OK |
| First version, five movements, 16 January 1888, funeral of the architect Joseph Lesoufaché at the Madeleine, Fauré conducting; treble soloist Louis Aubert | Wikipedia "Requiem (Fauré)" (History) | OK |
| Women not admitted to the Madeleine choir; boys sang the upper parts; in the concert hall Fauré preferred female singers, including for the Pie Jesu | Wikipedia "Requiem (Fauré)" (History; 1893 version) | OK |
| Louis Aubert aged ten (born 19 February 1877); later studied composition with Fauré | Wikipedia "Louis Aubert" (born 1877; known for singing the Pie Jesu at the Madeleine; attended Fauré's composition classes); Wikipedia "Gabriel Fauré" lists Aubert among his pupils | OK |
| The priest: "We don't need these novelties" | Wikipedia "Gabriel Fauré" (Middle years), quoted; guide says "is said to have told" | OK |
| Offertoire added 1889–90 (Hostias 1889, expanded 1890); Libera me written 1877 as an independent piece; second version premiered 21 January 1893 | Wikipedia "Requiem (Fauré)" | OK |
| Full-orchestra version 1899–1900; premiere Trocadéro, 12 July 1900, Exposition Universelle (World's Fair), Paul Taffanel | Wikipedia "Requiem (Fauré)" | OK |
| Nobody knows how much of the 1900 orchestration is Fauré's own (autograph lost; Roger-Ducasse or someone at Hamelle suggested) | Wikipedia "Requiem (Fauré)" (Final version) | OK |
| "For pleasure, if I may call it that" | Wikipedia "Requiem (Fauré)": "My Requiem wasn't written for anything – for pleasure, if I may call it that!" | OK |
| Father died 1885, mother New Year's Eve 1887; no apparent link | Wikipedia "Requiem (Fauré)" (lead and History) | OK |
| "Lullaby of death"; "a happy deliverance" | Wikipedia "Requiem (Fauré)", Fauré interview quoted (Louis Aguettant, 1902, per standard sources) | OK |
| Sung at Fauré's funeral, Madeleine, 1924 | Wikipedia "Requiem (Fauré)" (performed at his funeral); "Gabriel Fauré" (state funeral at the Madeleine) | OK |
| Movement keys (D minor, B minor, E-flat, B-flat, F, D minor, D major) and tempo markings | Wikipedia table (Structure and scoring, wikitext). Introït marked "Largo" there (some editions print *Molto largo*) | OK |
| Introït: chords on one chord for "Requiem aeternam", climax on "et lux perpetua", tenors' melody, sopranos "Te decet hymnus", "Exaudi", Kyrie on the tenor melody SAT in unison, urgent "Christe" | Wikipedia (Introït et Kyrie) | OK |
| Offertoire: alto–tenor canon in B minor, repeated a step higher, basses enforce, "ne cadant in obscurum" broken by rests, baritone Hostias on one repeated note, "fac eas…", choir returns in four parts, Amen in B major | Wikipedia (Offertoire) | OK |
| Sanctus: three-note soprano melody answered by men, harp arpeggios, violin (sometimes solo) line, horns at Hosanna, return of harp; Fauré's "angelic" violins (letter to Ysaÿe) | Wikipedia (Sanctus; Final version) | OK |
| Pie Jesu: one line sung three times, two-note rocking on "sempiternam requiem", ends with last "requiem" | Wikipedia (Pie Jesu) | OK |
| Agnus Dei: orchestral melody, tenors after six bars, move to minor, tenors again, sopranos' long "Lux", six-part choir, reprise of the Introït, orchestra closes with the Agnus melody (D major) | Wikipedia (Agnus Dei; table: Requiem aeternam D minor, then D major Andante) | OK |
| Libera me: ostinato in the bass, baritone with wide leaps, "Tremens factus sum" in homophony, "Dies irae" fortissimo, "Requiem aeternam" piano, choir sings the opening melody in unison, soft ending; horns at "Dies illa": the 1900 scoring has four horns; timpani only in this movement | Wikipedia (Libera me; Final version scoring) | OK ("horn calls" from the score's well-known horn fanfare; check by ear) |
| In paradisum: continuous broken-chord figure (organ in the 1900 version), soprano melody, others join on "Jerusalem", second phrase, all on "requiem" | Wikipedia (In Paradisum) | OK |
| Corboz recording uses a boy treble in the Pie Jesu | Embed and Discogs credits (Alain Clément); "boy" from listing descriptions | SECONDARY |

---

## Re-time

No bar map for this recording. Stops were placed from the section order in the score (Wikipedia's table and descriptions) and from estimated bar counts at the marked tempos, then stretched to Corboz's track lengths, which are slower than the metronome marks (Offertoire about 1.2 × a tempo-based estimate). Every time is an estimate.

Method per movement: Introït molto largo/largo section ≈ bars 1–17 (≈ 1:30 at Corboz's pace), then Andante moderato. Offertoire: Adagio molto ≈ 33 bars (≈ 5 s/bar × 1.22), Hostias ≈ 27 bars, return ≈ 23 bars, Amen ≈ 7 bars. Sanctus: ≈ 79 bars at ≈ 3 s/bar. Pie Jesu: ≈ 38 bars at ≈ 5.2 s/bar. Agnus Dei: introduction 6 bars, then tenor statements, minor passage, Lux aeterna, Introït reprise (slower), coda. Libera me: half note ≈ 60 → ≈ 2 s/bar. In paradisum: short introduction, then the soprano melody.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 7:48 | 0:00, 0:45, 1:30, 2:35, 3:15, 4:15, 5:20, near the end | Start of the Kyrie (≈ 4:15) and "Christe" (≈ 5:20) |
| II | 8:03 | 0:00, 0:20, 1:15, 2:25, 3:20, 4:15, 4:55, 7:10 | Hostias entry (≈ 3:20) and choir's return (≈ 4:55); Corboz's slow tempo could push both later |
| III | 3:57 | 0:00, 0:10, 1:10, 2:10, 2:50, near the end | Hosanna (≈ 2:10) |
| IV | 3:18 | 0:00, 0:10, 0:45, 1:20, 2:20, last 20 s | Third call (≈ 2:20) |
| V | 6:13 | 0:00, 0:20, 1:25, 2:05, 2:45, 4:05, 5:15 | Lux aeterna (≈ 2:45) and the Introït reprise (≈ 4:05) |
| VI | 6:17 | 0:00, 1:50, 2:35, 3:05, 3:40, 5:15, near the end | Choir entry (≈ 1:50) and the unison statement (≈ 3:40) |
| VII | 4:24 | 0:00, 0:10, 1:35, 2:00, 3:25, last 30 s | "Jerusalem" (≈ 1:35) and "Chorus angelorum" (≈ 2:00) |
