# Verification: Stravinsky – The Firebird, Suite (1919)

Piece id `stravinsky-firebird-suite`. Checked on 2026-11-17 (batch November 2026, group I).
Files: `content/drafts/en/stravinsky-firebird-suite.md`, `content/drafts/tr/stravinsky-firebird-suite.md`.
Shared-file additions (paintings.yaml entry, alternatives, the new composer Stravinsky, re-time rows; no new glossary terms): `content/research/stravinsky-firebird-suite.shared.md`.

**How the checks were done:** Spotify search in the built-in browser; embed `__NEXT_DATA__` with curl from a Turkish network; album page meta and ℗/© lines; Discogs API; Wikipedia EN via the MediaWiki API; Commons and Wikidata. Status key OK / SECONDARY / UNVERIFIED. No personal data sent; User-Agent `DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Shaw / Atlanta Symphony Orchestra (Telarc, 1978)

Why this one: a famous early digital recording of the 1919 suite, reissued many times (LP DG-10039, CD-80039, SACD), and its album has the suite on **6 tracks** (the Firebird's dance and variation share track 2), all playable in Turkey. Most other albums use 7 tracks (Bernstein, Jansons, Chung, Fischer, Rahbari) and were rejected as references for the 6-track limit; Ansermet / LPO (`1DbYBbs3VKfX5eX4DPTIcx`, 5 tracks) was considered but its recording data are older and less certain; Goehr (`7tKy6dmjWeRT6umqOqJ4Sa`) and Maazel / DSO Berlin (`4GekwskYZiCV4IWX4sl4aS`, 6 tracks but no separate "Firebird and its dance") were also checked.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Robert Shaw / Atlanta Symphony Orchestra | Embed tracks 1–6 credits "Igor Stravinsky, Atlanta Symphony Orchestra, Robert Shaw" | https://open.spotify.com/embed/album/2B98DCpQulWq5m8Vt9iGki | OK |
| Label / catalogue | Telarc DG-10039 (LP); CD-80039 | LP DG-10039, 1978 (dealer listings); Discogs 27327129 = Telarc CD-80039 (1984) | https://api.discogs.com/releases/27327129 ; https://therecordcentre.com/igor-stravinsky-the-firebird-suite-1919-version-overture-and-polovetsian-dances-from-prince-igor | OK / SECONDARY (LP) |
| Recorded / venue | 19–20 June 1978, Symphony Hall, Atlanta Memorial Arts Center | Discogs 27327129 booklet: "Recorded in Symphony Hall, Atlanta Memorial Arts Center, June 19 and 20, 1978"; Soundstream digital recorder; engineer Jack Renner | same | OK |
| Release | 1978 | Spotify ℗/© 1978 Telarc International Corp.; booklet ℗ © 1978 Telarc Records | album page | OK |
| Digital | One of the first orchestral recordings made digitally | Booklet: "Original master digitally recorded by Soundstream, Inc."; "one of the first" is general knowledge about Telarc's 1978 Soundstream sessions | Discogs | SECONDARY |
| Shaw | Best known as a choral conductor; music director of the ASO (1967–1988) | https://en.wikipedia.org/wiki/Robert_Shaw_(conductor) | SECONDARY (not fetched this session) |
| Telarc in Cleveland | "Telarc Corporation, Cleveland, Ohio" | Discogs disc text | OK |
| Spotify | https://open.spotify.com/album/2B98DCpQulWq5m8Vt9iGki | "Stravinsky: The Firebird Suite (1919 Version) – Borodin: Overture & Polovetsian Dances from Prince Igor", 1978, 8 tracks | album page | OK |

### Durations and playability (embed)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Introduction | 167762 | 2:47 | true |
| 2 | II. The Firebird and Her Dance (with the Variation) | 97470 | 1:37 | true |
| 3 | III. Round Dance of the Princesses | 282358 | 4:42 | true |
| 4 | IV. Infernal Dance of King Kastchei | 277833 | 4:37 | true |
| 5 | V. Berceuse | 221046 | 3:41 | true |
| 6 | VI. Finale | 196531 | 3:16 | true |
| | Total | 1242999 | 20:43 → `duration_min: 21` | |

Track 2 is 1:37, against 0:14–0:18 + 1:09–1:27 for the two numbers elsewhere, so it holds both the Firebird's entrance and her Variation (Spotify title "The Firebird and Her Dance"). The guide's movement II is titled accordingly.

---

## 2. Also recommended: Bernstein / New York Philharmonic (Columbia, 1957)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Spotify | `4aDfOoq3dVJi4PwtdZyaMw` "Stravinsky: Firebird Suite – Tchaikovsky: Romeo and Juliet (Remastered)", ℗ 2017 Sony; suite on tracks 1–7 (3:21 / 0:14 / 1:09 / 5:14 / 3:56 / 3:50 / 3:33), all isPlayable true | embed + album page | OK (7 tracks: fine for `also_recommended`) |
| Recorded / venue | 28 January 1957, St. George Hotel (Brooklyn), New York | https://classite.com/disk/columbia-ms-6014-q6459 | SECONDARY |
| LP | Columbia MS 6014, 1958, with Romeo and Juliet | same | SECONDARY |

---

## 3. Painting: Viktor Vasnetsov, *Ivan Tsarevich on the Grey Wolf*, 1889

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Viktor Vasnetsov (1848–1926) | Commons deathyear=1926 | OK |
| Object | Oil on canvas, 249 × 187 cm, State Tretyakov Gallery, Moscow | Wikidata Q4195524 | OK |
| Image | File:Moscou, galerie Tretiakov Ivan-Tsarevitch at the Grey Wolf (Vasnetsov).jpg, **2099 × 2761** px, gallery photo by Pierre André Leclercq (2018), the whole canvas without frame (thumbnail checked; ratio matches 187 : 249) | https://commons.wikimedia.org/wiki/File:Moscou,_galerie_Tretiakov_Ivan-Tsarevitch_at_the_Grey_Wolf_(Vasnetsov).jpg | OK |
| Rights | `{{PD-Art|PD-old-auto-1923|deathyear=1926}}` | same | OK |
| Other files | Larger photos exist but are CC BY-SA (shakko 2020s, 3101 × 3054 / 4608 × 3456; Thomas T. Hammond slide scan 6600 × 10200, CC BY-SA 4.0); the PD scan File:Wiktor Michajlowitsch Wassnezow 004.jpg is 1300 × 1755 | Commons category "Ivan-Tsarevitch at the Grey Wolf (Vasnetsov)" | NOTE |
| Pairing | Ivan Tsarevich is the ballet's hero (Prince Ivan); the painting illustrates the Russian tale "Tsarevich Ivan, the Firebird and the Grey Wolf"; the ballet's scenario committee drew on Afanasyev's collection of Russian fairy tales | https://en.wikipedia.org/wiki/The_Firebird (Conception) | OK |

No Vasnetsov painting is in `content/paintings.yaml`.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Written 1909–10 for Diaghilev's Ballets Russes, 1910 Paris season; Diaghilev wanted a Russian subject; Tcherepnin withdrew, Lyadov considered, then Stravinsky commissioned | https://en.wikipedia.org/wiki/The_Firebird | OK |
| Stravinsky aged 27 at the commission (born June 1882; work began Oct/Nov 1909) | same; https://en.wikipedia.org/wiki/Igor_Stravinsky | OK |
| Premiere Paris Opéra (Palais Garnier), 25 June 1910; Fokine; Karsavina as the Firebird; immediate success; made Stravinsky famous | The Firebird article | OK |
| The Rite of Spring three years later (29 May 1913) | Stravinsky article | OK |
| Plot: Kashchei's enchanted garden with petrified enemies; Ivan catches the Firebird, frees her for a feather; thirteen princesses; khorovod; monsters; feather; Infernal Dance; lullaby; egg with Kashchei's soul; finale with solo horn, freed subjects | The Firebird article (Music and plot) | OK |
| Full ballet about 45 minutes; "wastefully large" orchestra | same | OK |
| 1919 suite composed in Morges, Switzerland, for a smaller orchestra; most popular today | same (1919 suite) | OK |
| 1919 suite numbers: Introduction; The Firebird and its Dance; Variation; Khorovod; Infernal Dance; Lullaby; Finale | same | OK |
| Opening: low strings with the Firebird/magic leit-harmony | same | OK |
| String harmonic glissandos; Stravinsky tried to surpass Rimsky-Korsakov "with ponticello, col legno, flautando, glissando, and fluttertongue effects" | same (Music) | OK |
| Richard Strauss told him he should have begun with a "sudden crash" rather than pianissimo | same (reception) | OK |
| Khorovod melody from a Russian folk song that Rimsky-Korsakov used in his Sinfonietta on Russian Themes | same | OK |
| Infernal Dance: syncopation, theme borrowed from Rimsky's *Mlada*; ends with brass glissandos; monsters fall asleep | same | OK |
| Berceuse: bassoon introduces the lullaby | same | OK |
| Finale: solo horn announces dawn; builds to a triumphant celebration and brass fanfare | same | OK |
| Infernal Dance second, lyrical theme in the strings; xylophone; harp and violas in the Berceuse; tremolo transition attacca to the Finale; 7-beat brass statement | Score / standard descriptions | SECONDARY |
| Tempo markings (Molto moderato; Allegro rapace; Moderato; Allegro feroce; Andante; Lento maestoso) and keys (Khorovod B major; Berceuse E-flat minor; Finale B major) | Score (not checked against IMSLP) | SECONDARY |
| Shaw recording facts | §1 | OK |

---

## 5. Re-time

All stops are estimates (≈) from the order of events in the score and the Shaw track lengths. Shaw's Introduction (2:47) is quicker than most (3:00–3:27), so the stops there are placed early.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Introduction | 2:47 | 0:00, 0:40, 1:20, 2:15 | Harmonic glissandos (≈ 0:40) |
| II The Firebird and its Dance – Variation | 1:37 | 0:00, 0:20, 1:10, Last 15 seconds | Start of the Variation (≈ 0:20) |
| III The Princesses' Khorovod | 4:42 | 0:00, 1:00, 2:00, 3:30, Last 30 seconds | Strings take the tune (≈ 2:00) |
| IV Infernal Dance of King Kashchei | 4:37 | 0:00, 0:30, 1:30, 2:45, 3:45, Last 15 seconds | Lyrical theme (≈ 1:30) |
| V Berceuse | 3:41 | 0:00, 1:00, 1:45, 2:30, Last 40 seconds | Oboe (≈ 1:00) |
| VI Finale | 3:16 | 0:00, 0:30, 1:15, 2:00, Last 20 seconds | Brass in uneven beats (≈ 2:00) |
