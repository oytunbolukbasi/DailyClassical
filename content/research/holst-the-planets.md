# Verification: Holst – The Planets

Piece id `holst-the-planets`. Checked on 2026-11-20 (batch 2026-11b, group F).
Files: `content/drafts/en/holst-the-planets.md`, `content/drafts/tr/holst-the-planets.md`.
Shared-file additions (paintings.yaml, new composer Holst): `content/research/holst-the-planets.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched from a Turkish network (2026-11-20, User-Agent `DailyClassical/1.0`); the label product page (served on deutschegrammophon.com for this Decca album), whose embedded track metadata gives recording date, venue and first release and which links the Spotify album; MusicBrainz (Spotify links); Wikipedia; programme notes and reviews; Wikimedia Commons API and file wikitext. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: Dutoit / Orchestre symphonique de Montréal (Decca, 1986)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Charles Dutoit / Orchestre symphonique de Montréal; women's chorus of the OSM | Spotify credits tracks 1–7 "Orchestre Symphonique de Montréal, Charles Dutoit"; track 7 adds "Le Choeur des Femmes de L'Orchestre de Montréal". MusicWeb: "Women of the Montreal Symphony Orchestra Chorus" | https://open.spotify.com/embed/album/0w32A1A9aeuv5jLL7q3wOq ; https://www.musicweb-international.com/classrev/2020/Nov/Holst-Planets-4761724.htm | VERIFIED (the yaml uses an English rendering; the exact choir name varies between issues) |
| Recorded / venue | June 1986, Église Saint-Eustache, Montreal | Label track metadata, all 7 tracks: recordingDate 1986-06-02 (one date given for the whole sessions), recordingLocation "L'Eglise de St. Eustache, Montreal", firstReleaseYear 1987. MusicWeb: "recorded in June 1986 at St Eustache, Montreal" | https://www.deutschegrammophon.com/en/catalogue/products/holst-the-planets-dutoit-2150 ; MusicWeb | OK |
| Label / catalogue | Decca 417 553-2 | Product page: label Decca, SKU 00028941755322 (= 417 553-2), release date 1987-01-30. Later reissue Decca 476 1724 (MusicWeb) | product page | OK |
| Award | Gramophone Award 1987, engineering | Presto Classical listing ("Gramophone Awards, 1987, Winner - Engineering") | https://www.prestomusic.com (search result for 476 1724) | OK (secondary) |
| Spotify | 0w32A1A9aeuv5jLL7q3wOq | Linked from the product page; 7 tracks, all playable | product page ; embed | VERIFIED |

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | Mars, the Bringer of War | 431133 | 7:11 | true |
| 2 | Venus, the Bringer of Peace | 576750 | 9:37 | true |
| 3 | Mercury, the Winged Messenger | 241173 | 4:01 | true |
| 4 | Jupiter, the Bringer of Jollity | 477000 | 7:57 | true |
| 5 | Saturn, the Bringer of Old Age | 592500 | 9:53 (9:52.5, rounded half up) | true |
| 6 | Uranus, the Magician | 365666 | 6:06 | true |
| 7 | Neptune, the Mystic | 480250 | 8:00 | true |
| | Total | 3164472 | 52:44 → `duration_min: 53` | |

Another Spotify issue of the same recording (MusicBrainz link): `2GPUFtgewnQaWbW3CkeNQW`, 7 tracks, all playable, slightly different durations (Venus 9:39, Jupiter 8:01, Saturn 9:54, Neptune 8:02). Not used: the label links `0w32A1A9aeuv5jLL7q3wOq`.

## 2. Also recommended: Boult / New Philharmonia Orchestra (HMV, 1966)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Sir Adrian Boult / New Philharmonia Orchestra | Spotify credits "New Philharmonia Orchestra, Sir Adrian Boult"; MusicBrainz release "The Planets", Holst; "The New Philharmonia Orchestra with Chorus, Sir Adrian Boult" (2026-07-31 digital release) | https://open.spotify.com/embed/album/0W5E7HJIeyOd9ZEGqnLGys | VERIFIED |
| Recorded / venue | 21–22 July 1966, Kingsway Hall, London | Search results quoting MusicWeb and a discography: "recorded 21-22 July 1966 in Kingsway Hall, London; Producer: Peter Andry, balance engineer: Christopher Parker" | https://www.musicweb-international.com/classrev/2014/Feb14/Boult_complete_0192702.htm ; https://en.wikipedia.org/wiki/The_Planets_discography | OK |
| Label / catalogue / release | HMV ASD 2301, 1967 | 45worlds and rarevinyl listings of ASD 2301, His Master's Voice, 1967 | https://mail.45worlds.com/vinyl/album/asd2301 | OK |
| Spotify | 0W5E7HJIeyOd9ZEGqnLGys | Tracks 1–7: 7:18 / 8:51 / 4:05 / 8:03 / 9:11 / 6:28 / 7:12, all `isPlayable: true` | embed | VERIFIED |

Boult (1889–1983) conducted the first performance in 1918; this was the fourth of his five recordings of the work (Wikipedia discography lists them; count not used in the guide).

Not used: Karajan / Berliner Philharmoniker, DG (Spotify `4v0Xyz0LVToUsSTGdsvKSK`, 7 tracks, all playable); Solti / LPO, Decca (`4cbioH7kTtJQfKYYGjKWSJ`, not checked in the embed).

## 3. Painting: Donato Creti, *Astronomical Observations: Jupiter*, 1711

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Donato Creti (Cremona 1671 – Bologna 1749), *Le osservazioni astronomiche: Giove*, 1711 | https://commons.wikimedia.org/wiki/File:Le_osservazioni_astronomiche_-_Giove.jpg ; Wikidata Q24007751 ; https://en.wikipedia.org/wiki/Donato_Creti | OK |
| Collection / size | Pinacoteca Vaticana (Musei Vaticani), MV.40437.0.0; oil on canvas, 51 × 35 cm | Commons ; https://catalogo.museivaticani.va/index.php/Detail/objects/MV.40437.0.0 | OK |
| Image | 3015 × 4440, the Vatican Museums' IIIF image retrieved with Dezoomify, cropped and white-balanced; {{PD-Art\|PD-old-auto-expired\|deathyear=1749}} | Commons | OK |
| Rights | Artist died 1749; faithful reproduction of a 2D work | Commons | OK |
| Not reused | Creti not in `content/paintings.yaml`; no other shared note of this batch names him (grep, 2026-11-20) | – | OK |

**Pairing.** Wikipedia (Donato Creti): General Luigi Ferdinando Marsili "commissioned Creti to paint eight small pictures" of astronomical observations, the Sun, the Moon, a comet and the five planets then known, as a gift to Pope Clement XI to encourage an observatory in Bologna, which opened soon after as "the first public astronomical observatory in Italy"; Creti's work was overseen for accuracy by the astronomer Eustachio Manfredi. The painting shows two figures with a long telescope under a night sky; Jupiter with its bands and three moons. Jupiter is the best-known movement of the suite.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Idea from a holiday in Spain, March–April 1913, with Balfour Gardiner and Arnold and Clifford Bax; astrology discussion; Clifford Bax introduced Holst to astrology; "pet vice"; horoscopes of friends | https://en.wikipedia.org/wiki/The_Planets ; https://en.wikipedia.org/wiki/Gustav_Holst | OK (guide says "spring of 1913" and names only Clifford Bax) |
| Composed 1914–16 (Mars mid-1914; Venus and Jupiter late 1914; Saturn and Uranus mid-1915; Neptune later 1915; Mercury early 1916); orchestration finished 1917; "a series of mood pictures"; titles partly from Alan Leo | The Planets (Wikipedia) | OK; yaml `year: 1916` = completion of composition |
| Mars finished before the war | Wikipedia ("Often linked to war, though it was finished before WWI began", in the summary of the Mars section); classical-music.com | OK (guide: "in mid-1914, before the First World War broke out") |
| Scoring: six horns, four trumpets, tenor tuba, six timpani for two players, celesta, organ, two harps; wordless women's chorus (two three-part choirs) in an adjoining room screened from the audience | Wikipedia | OK |
| First performance 29 September 1918, Queen's Hall, Boult, financed by Gardiner, about 250 invited guests; first complete public performance 15 November 1920 (LSO, Albert Coates) | Wikipedia | OK |
| Fame unwelcome; Holst "struggled for the rest of his life" against it; "grew weary" of its popularity | Gustav Holst (Wikipedia, quoting Byron Adams); https://www.classical-music.com/features/recordings/holst-planets-2 | OK |
| Mars: allegro, relentless 5/4 ostinato; opens quietly with percussion, harp and col legno strings; "quadruple-forte, dissonant climax" | Wikipedia | OK |
| Mars: tenor tuba call answered by trumpets in the middle | General knowledge of the score (a standard euphonium/tenor tuba excerpt); not in the sources consulted | UNVERIFIED (placement estimated) |
| Venus: adagio 4/4, solo horn answered by flutes and oboes; oscillating chords in flutes and harps, celesta; second theme on solo violin; andante in 3/4 with violin melody over syncopated woodwinds; central largo with oboe solo | Wikipedia | OK |
| Mercury: vivace 6/8; B-flat major and E major juxtaposed (bitonality); solo violin, harp, flute, glockenspiel prominent; shortest movement | Wikipedia | OK |
| Jupiter: allegro giocoso 2/4; second theme in 3/4; andante maestoso at half speed; tune set in 1921 as "Thaxted" for "I Vow to Thee, My Country"; the maestoso tune returns with its cadence left unresolved; final triple-forte chord | Wikipedia | OK |
| Saturn: adagio 4/4; ticking theme in flutes, bassoons and harps; trombones' solemn melody taken up by the orchestra; animato bursts; tubular bells at climaxes; triple-forte climax; andante in 3/2, dying away quietly. "Saturn was Holst's favourite movement" (Matthews) | Wikipedia ; classical-music.com | OK (guide: "said to have been") |
| Uranus: four-note brass motif; allegro 6/4 with 9/4 bars; "a clumsy dance, which gradually gets more and more out of hand"; quadruple-forte climax with organ glissando, then sudden pianissimo; alternating quick and slow sections to a quiet end | Wikipedia | OK |
| Uranus and Dukas: link drawn by programme notes and blogs; no documentary evidence that Holst knew the Dukas | classical-music.com (claims inspiration); Russell Steinberg blog; Tucson SO note (search snippet says the Dukas was "unknown to Holst") | Sources disagree; the guide says it is not documented |
| Neptune: quiet throughout, swaying irregular metre; flutes joined by piccolo and oboes; harps and celesta; brass play E minor and G-sharp minor together; offstage women's chorus; orchestra falls silent; voices end as "a door between the singers and the auditorium is gradually closed" | Wikipedia | OK |
| One of the first fade-outs | classical-music.com ("one of classical music's first true fade-outs"); Wikipedia (William Weir 2014) | OK |
| Tempo of Neptune "Andante"; metre 5/4 | Not in the sources consulted (Wikipedia: "swaying, irregular metre") | UNVERIFIED against the score |
| Pluto discovered later (1930) | general | OK |

## 5. Re-time (all stops are ≈; derived from the movement descriptions above, typical proportions and the exact track lengths, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Mars | 7:11 | 0:00, 0:20, 1:00–1:50, 2:10, 2:50, 4:00, 5:30–6:30, Last 30 seconds | The middle section ≈ 2:10 and the tenor tuba call ≈ 2:50 (± 40 s) |
| II Venus | 9:37 | 0:00, 0:50, 1:40, 3:20, 4:40, 6:20, Last minute | The Andante ≈ 3:20 and the oboe Largo ≈ 4:40 (± 45 s) |
| III Mercury | 4:01 | 0:00, 0:40, 1:20, 2:30, Near the end | The violin tune ≈ 1:20 and the tutti ≈ 2:30 (± 20 s) |
| IV Jupiter | 7:57 | 0:00, 0:30, 1:10, 2:00, 3:10, 4:30, 5:00, 6:50, Last 20 seconds | Andante maestoso ≈ 3:10 and its return ≈ 6:50 (± 20 s each) |
| V Saturn | 9:53 | 0:00, 1:30, 2:40, 4:30–6:00, 6:30, Last 2 minutes | Trombone melody ≈ 1:30, climax range (± 45 s) |
| VI Uranus | 6:06 | 0:00, 0:25, 1:20, 2:40–4:00, 4:10, Last 1:30 | March tune ≈ 1:20; organ glissando ≈ 4:10 (± 30 s) |
| VII Neptune | 8:00 | 0:00, 1:00, 2:00, 3:40, 6:00, Last minute | Choir entry ≈ 3:40 and choir alone ≈ 6:00 (± 45 s) |
