# Verification: Erkin – Violin Concerto

Piece id `erkin-violin-concerto`. Checked on 2026-11-20 (batch 2026-11b, group G). First Turkish composer in the catalogue: dates and premiere checked against Turkish and international sources; where they disagree it is said below.
Files: `content/drafts/en/erkin-violin-concerto.md`, `content/drafts/tr/erkin-violin-concerto.md`.
Shared-file additions (paintings.yaml, glossary "Makam" and "Taksim", composer `erkin`): `content/research/erkin-violin-concerto.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` from a Turkish network (2026-11-20); the Naxos booklet PDF (notes by Aydın Büke); MusicWeb International and other reviews; Metin Munzur's formal analysis (2013, with bar tables for all three movements); Turkish press and academic sources for the premiere. Status: OK = matches a primary or two independent sources; NOTE = sources disagree, cautious wording used.

## 1. Reference recording (product owner's choice): Buswell / Kuchar / Istanbul State SO (Naxos, 2014)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | James Buswell / Theodore Kuchar / Istanbul State Symphony Orchestra | Spotify credits on tracks 2–4; booklet | https://open.spotify.com/embed/album/3hutoSfFnioz549Sy7cNbn ; https://cdn.naxosmusiclibrary.com/sharedfiles/booklets/NAC/booklet-8.572831.pdf | OK |
| Label / catalogue | Naxos 8.572831 | Booklet back cover: "8.572831", "℗ & © 2016 Naxos Rights US, Inc."; MusicWeb reviews | booklet ; https://www.musicweb-international.com/classrev/2016/Aug/Erkin_sy2_8572831.htm | OK |
| Recorded / venue | 29–30 November 2014, Fulya Cultural Centre, Istanbul | Booklet: "Recorded at Fulya Cultural Centre, Istanbul, Turkey, on 29th and 30th November, 2014"; producer/engineer Jaroslav Stráňavský; sponsored by DenizBank | booklet | OK |
| Release | 2016 | Booklet ℗ 2016; retailers give 27 May / 10 June 2016 | booklet ; https://www.qobuz.com/gb-en/album/erkin-symphony-no-2-violin-concerto-kocekce-james-buswell-theodore-kuchar/0747313283170 | OK |
| Spotify | 3hutoSfFnioz549Sy7cNbn | "Erkin: Symphony No. 2, Violin Concerto & Dance Rhapsody "Köçekçe"" (7 tracks) | embed | OK (fixed by the brief) |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 2 | I. Allegro giusto | 893093 | 14:53 | true |
| 3 | II. Adagio | 556906 | 9:17 | true |
| 4 | III. Allegro con fuoco | 400013 | 6:40 | true |
| | Total | 1850012 | 30:50 → `duration_min: 31` | |

The booklet prints 14:59 / 9:18 / 6:33 (total 30:50); the guide uses the Spotify track times. Other tracks: 1 *Köçekçe* 9:27; 5–7 Symphony No. 2, 9:58 / 8:30 / 9:11; all playable.

## 2. Also recommended: Tuncay Yılmaz / Naci Özgüç / İstanbul Devlet Senfoni Orkestrası (Sony Classical, 2020)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Spotify | `5aJqy9mVBxNX6Uin4t8Su1`, "Keman Konçertosu", 3 tracks: 15:26 / 10:16 / 7:12, all `isPlayable: true`; credits Ulvi Cemal Erkin, Tuncay Yılmaz, İstanbul Devlet Senfoni Orkestrası, Naci Özgüç | https://open.spotify.com/embed/album/5aJqy9mVBxNX6Uin4t8Su1 | OK |
| Label / date | Sony Classical, [2020], digital file; publisher numbers TR1232000601–603 (ISRC), 886449008087 (UPC) | University of Pennsylvania catalogue (Naxos Music Library record), https://find.library.upenn.edu/catalog/9979354251803681 | OK |
| Recorded / venue | Not stated anywhere found; left `null` | – | UNVERIFIED |

## 3. Painting: Hoca Ali Rıza, *Istanbul* (*İstanbul*), 1922

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Hoca Ali Rıza (1858–1930), *İstanbul*, 1922, oil on canvas, 43.5 × 61 cm, inv. 200-0010-HAR | Sakıp Sabancı Museum: https://sakipsabancimuzesi.org/en/exhibitions-and-events/exhibition/64/624 | OK |
| Date disagreement | Google Arts & Culture now gives 1918; the Commons file (GAP data at upload) 1919; TRT World 1919; the museum 1922. The museum's date is used. | https://artsandculture.google.com/asset/HgH3OV4Ze_Yw1Q ; Commons | NOTE |
| Description | Museum: Istanbul landscape with sky, sea, greenery and coffee houses; a rowing boat, a simit seller on the path, a figure on the coffee-house balcony; the exact place is unknown and it is probably one of his imagined coffee-house scenes | museum page | OK (pairing note says "a coffee house on the shore of the Bosphorus", not a named place) |
| Rights | Artist died 1930; {{PD-Art-two-auto\|1930}}; Google Art Project file supplied by the museum, 4501 × 3181 | https://commons.wikimedia.org/wiki/File:Hoca_Ali_R%C4%B1za_-_Istanbul,_Istanbul_-_Google_Art_Project.jpg | OK |
| Not reused | No Turkish painter and no Hoca Ali Rıza in `content/paintings.yaml` (166 entries, checked) | – | OK |

**Pairing.** Hoca Ali Rıza, a soldier-painter trained at the Ottoman military schools, was one of the painters who brought European-style landscape painting to Istanbul (Google Arts & Culture text; Daily Sabah, "Hoca Ali Rıza: the first Turkish impressionist", 2018). Erkin was born in Istanbul, and his concerto does in music what the painting does in paint: a European manner, a Turkish subject. The pairing note keeps to "one of the first Turkish painters to work in the European manner".

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Erkin 1906–1972, one of the Turkish Five; all five educated in Europe; aim to combine local elements with European music | Booklet (Büke); en Wikipedia | OK |
| Composed 1946–47, after the Piano Concerto, *Köçekçe* and Symphony No. 1 | Booklet: "Following his Piano Concerto, Köçekçe, and his Symphony No. 1 … his Violin Concerto, composed during 1946-47"; tr Wikipedia; MusicWeb. Munzur (2013) says "written in 1947" | OK (`year: 1947`, the completion) |
| Premiere planned at the Vienna Festival in 1947, did not take place | Booklet ("for various reasons that concert did not materialise") | OK (single source) |
| First performance 2 April 1948, opening of the Ankara opera stage (Büyük Tiyatro), Presidential (Riyaset-i Cumhur) orchestra, soloist Licco Amar | tr Wikipedia ("2 Nisan 1948", Ankara Opera Evi açılış töreni, Riyaset-i Cumhur Filarmoni Orkestrası, Licco Amar); Birsen Gürdil, 24 Saat (opening night of 2 April 1948 with President İnönü: Rey's First Symphony, Erkin's Violin Concerto and Akses's *Ballad* first performed), https://www.24saatgazetesi.com/melez-bir-yapi-ankara-opera-binasi ; Munzur 2013 ("played for the first time by Lico Amar with the accompaniment of Presidential Symphony Orchestra in the opening ceremony of the building of State Ballet and Theatre"); opera house opened 2 April 1948 (Cumhuriyet, Tolga Aydoğan; en Wikipedia "Ankara Opera House") | NOTE: the Naxos booklet and the reviews that follow it (MusicWeb, The Classical Reviewer) say **2 April 1949**. The opera house opened on 2 April 1948, so 1949 is taken as an error in the booklet. |
| Conductor at the premiere | Booklet and The Classical Reviewer: Erkin himself. Not confirmed by a Turkish source | Not used in the guide |
| Licco Amar: born Budapest 1891, led Hindemith's Amar Quartet (1922–29), left Germany after 1933, in Turkey from 1934, taught at the Ankara conservatory from 1935 for twenty years | en Wikipedia, https://en.wikipedia.org/wiki/Licco_Amar | OK |
| Three movements, Allegro giusto / Adagio / Allegro con fuoco; sonata form, then a slow movement, then a rondo | Booklet ("Sonata, Allegro and Rondo"); Munzur (I sonata allegro; II A–C–A; III symmetric rondo) | OK |
| I: Kürdi mode in the sequences of the first theme group; theme group II more Turkish in melody and rhythm | Munzur 2013, p. 124 | OK |
| III is "in fact Horon" | Munzur 2013, p. 124; Turan 2025, p. 753, citing Deniz 2016 ("Karadeniz'in coşkulu horon melodileri") | OK |
| II does not draw mainly on Turkish material; counterpoint; "recalls the music of baroque period" | Munzur 2013, p. 125 | OK |
| Taksim section in the last movement, improvisatory | Booklet ("the taksim section of the last movement gives the feeling of improvisation"); booklet back cover | OK. Its place in the movement is not given anywhere found (see Re-time) |
| Soloist's concerto; long cadenza midway in I | Booklet ("allows the soloist to display his/her musical and technical ability"); MusicWeb, Stephen Greenbank ("impressive cadenza sitting midway"); The Classical Reviewer ("extended cadenza") | OK |
| I opens with a timpani roll; earnest theme for soloist and orchestra; rising scales; expansive orchestral section; oboe–violin dialogue; quiet orchestral passage with an ardent violin line before a "weighty, decisive coda" | The Classical Reviewer, 4 Sept 2016, https://theclassicalreviewer.blogspot.com/2016/09/theodore-kuchar-and-istanbul-state.html | OK (single review; where the oboe dialogue falls is my placement, at theme 2) |
| Five-bar introduction | Munzur's table (bars 1–5) | OK |
| II: strings' steady, thoughtful theme over pizzicato basses; woodwind; violin weaves the melancholy theme | The Classical Reviewer; MusicWeb (Greenbank: "a lyrical outpouring over a persistent tread") | OK |
| III: crisp double stops against a propulsive accompaniment; the most Turkish movement; woodwind passages | MusicWeb (Greenbank; Wilkinson: "the most specifically 'Turkish' in theme, with some driving rhythms"); The Classical Reviewer | OK |
| Orchestra's roots: Istanbul City Orchestra founded 1945 by Cemal Reşit Rey; present name 1972 | Booklet | OK |
| Ayla Erduran played it in Brussels in 1958, the composer conducting | İKSV honorary award page, https://muzik.iksv.org/en/honorary-awards/ayla-erduran/ (it calls this "the première"; it was the first performance abroad at most, so the guide says only "played it in Brussels") | NOTE |
| Erkin taught in Ankara for more than forty years | Booklet ("about 42 years") | OK |
| Keys | Not stated in the booklet or in Munzur; a thesis cited at second hand (Çınar 2015) gives D minor for I. The work is modal: `key: null` and no Key column, deliberately | – |
| Metre | Not stated in the sources: no Metre column | – |

Sources consulted and not used: Altınsoy (2017), master's thesis, Dokuz Eylül University, "Ulvi Cemal Erkin keman konçertosunun müzikal analizi" (not accessible); YÖK Açık Bilim record 20.500.12812/129152 (site unreachable).

## 5. Re-time (all stops are ≈; derived from Munzur's bar tables and the track lengths, not heard)

Munzur's tables: I = 318 bars (introduction 1–5, theme group I 5–61, bridge 61–75, theme group II 75–102, closing 102–121, development to 199, recapitulation 202–298, coda 298–318); II = 134 bars (A 1–51 in four periods 1/11/23/36, C 51–84 built on sequences, A 84–134); III = 324 bars, rondo (A 1–31, B 31–69, A 69–107, C 107–195, A 195–257, B 257–298, episode 298–305, coda 305–324). The cadenza is not in his table; it was assumed to fall midway through the development and to last ≈ 1:50.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro giusto | 14:53 | 0:00, 0:15, 1:30–2:30, 2:30, 3:05, 4:10–4:55, 5:00, 6:30–8:20, 8:20, 10:00, 12:50, Last minute | The cadenza (place and length, ± 1:30) and so the recapitulation (± 1 min) |
| II Adagio | 9:17 | 0:00, 0:40, 1:30–3:30, 3:30–5:45, 5:45, Last minute | The violin's first entry (≈ 1:30) |
| III Allegro con fuoco | 6:40 | 0:00, 0:35, 1:25, 2:10–4:00, 4:00, 5:15, Near the end, Last 25 seconds | The taksim-like passage: placed at the seven-bar "episode" before the coda (bars 298–305), which would stretch if played freely; it could instead be in the central episode (≈ 2:10–4:00) |
