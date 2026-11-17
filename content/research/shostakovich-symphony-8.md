# Verification: Shostakovich – Symphony No. 8 in C minor

Piece id `shostakovich-symphony-8`. Checked on 2026-11-17 (batch November 2026, group K).
Files: `content/drafts/en/shostakovich-symphony-8.md`, `content/drafts/tr/shostakovich-symphony-8.md`.
Shared-file additions (paintings.yaml entry, alternatives, glossary rows, re-time rows): `content/research/shostakovich-symphony-8.shared.md`.

**How the checks were done**
- **Spotify:** the reference album was fixed by the product owner. It and the also-recommended album were read from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` in ms, `isPlayable`), fetched with curl from this machine's Turkish network, plus the album page (`og:description`, `music:release_date`, ℗/© lines, `og:restrictions:country:allowed`). The Nelsons album id was found with Spotify's own web search (open.spotify.com/search, browser pane).
- **Discogs:** public API (`/database/search`, `/releases/<id>`); human-readable URLs below.
- **Other sources:** Berliner Philharmoniker Recordings product page; Digital Concert Hall programme page; Boston Symphony Orchestra programme note; Boosey & Hawkes work page (publisher's data and Gerard McBurney's note); English, German, Japanese and Russian Wikipedia (plain-text API); Wikidata; Wikimedia Commons.
- Status key: OK = primary or authoritative source; SECONDARY = Wikipedia, a database or a search summary only; UNVERIFIED = not confirmed.
- No personal data was sent anywhere; API requests used `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Kirill Petrenko / Berliner Philharmoniker (Berliner Philharmoniker Recordings, 2023)

Fixed by the product owner.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Kirill Petrenko / Berliner Philharmoniker | Embed credits on tracks 1–5: "Dmitri Shostakovich, Berlin Philharmonic, Kirill Petrenko" (the guide uses the orchestra's own name, as in `beethoven-symphony-3`) | https://open.spotify.com/embed/album/7JgviswtUhPRsuN5wzytlK | OK |
| Label / catalogue | Berliner Philharmoniker Recordings, BPHR 220421 | Discogs 26525459: "Symphonies 8 • 9 • 10", Berliner Philharmoniker Recordings BPHR 220421, 2 CD + Blu-ray, released 2023-03-24; ℗/© Berlin Phil Media GmbH; producer Christoph Franke | https://www.discogs.com/release/26525459 | OK |
| Spotify edition | – | The Spotify album is the digital single-work release "Shostakovich: Symphony No. 8" (2023, 5 songs, "℗ 2023 Berlin Phil Media GmbH"); the catalogue number in the guide is the physical set's | album page | Note |
| Recorded | 13 November 2020, live, without audience | Discogs notes: "Recorded at the Philharmonie Berlin: 13 Nov 2020 (Symphony No. 8)"; Digital Concert Hall: performance broadcast "without an audience"; Berlin Phil Recordings page: "recordings, made during the Corona pandemic"; search summaries (Seen and Heard, Colin's Column): concert halls closed in November 2020, unplanned online concert announced 6 November | https://www.discogs.com/release/26525459 ; https://www.digitalconcerthall.com/en/concert/54006/programme/introduction ; https://www.berliner-philharmoniker-recordings.com/shostakovich.html | OK |
| Venue | Philharmonie, Berlin | Discogs ("Recorded At – Berliner Philharmonie"); DCH | same | OK |
| Release year | 2023 | Discogs 2023-03-24; Spotify `music:release_date` 2023-03-24 | Discogs; album page | OK |
| Spotify | https://open.spotify.com/album/7JgviswtUhPRsuN5wzytlK | "Shostakovich: Symphony No. 8", album, 2023, 5 songs; TR in `og:restrictions:country:allowed`; all tracks `isPlayable: true` | embed + album page | VERIFIED |
| Petrenko quote | "incredible psychological drama" | Berliner Philharmoniker Recordings page: "Kirill Petrenko describes Dmitri Shostakovich's Eighth Symphony as an 'incredible psychological drama'" | https://www.berliner-philharmoniker-recordings.com/shostakovich.html | OK |
| Petrenko chief conductor of the Berlin Philharmonic | – | https://en.wikipedia.org/wiki/Kirill_Petrenko | SECONDARY |

### Durations and playability (embed, album 7JgviswtUhPRsuN5wzytlK)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Adagio – Allegro non troppo | 1512012 | 25:12 | true |
| 2 | II. Allegretto | 370960 | 6:10 | true |
| 3 | III. Allegro non troppo | 360073 | 6:00 | true |
| 4 | IV. Largo | 595784 | 9:55 | true |
| 5 | V. Allegretto | 819239 | 13:39 | true |
| | Total | 3658068 | 60:58 → `duration_min: 61` | |

Discogs gives 60:58 for No. 8 on the CD, the same as the Spotify total: no applause track.

---

## 2. Also recommended: Andris Nelsons / Boston Symphony Orchestra (DG, 2016)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Andris Nelsons, Boston Symphony Orchestra | Embed credits, album 0XvgGcqNO8OOgfksc1tKXa | OK |
| Label / catalogue | Deutsche Grammophon 479 5201 ("Under Stalin's Shadow", Symphonies 5, 8, 9, Hamlet suite) | Discogs 8831932 (released 2016-05-27) | https://www.discogs.com/release/8831932 | OK |
| Recorded / venue | March 2016, live, Symphony Hall, Boston | Discogs notes: "3/2016 (Symphony No. 8) (all live)", "Recorded At – Symphony Hall, Boston" | Discogs 8831932 | OK |
| Spotify | Tracks 17–21 (No. 8): 26:44 / 6:31 / 6:37 / 10:33 / 16:11, all `isPlayable: true`; "℗ 2016 Boston Symphony Orchestra, Inc., under exclusive license to Deutsche Grammophon GmbH, Berlin"; TR allowed | https://open.spotify.com/album/0XvgGcqNO8OOgfksc1tKXa | VERIFIED |

---

## 3. Painting: Vasily Vereshchagin, *The Apotheosis of War*, 1871

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Vasily Vasilyevich Vereshchagin (Russian, 1842–1904) | Commons; https://en.wikipedia.org/wiki/The_Apotheosis_of_War | OK |
| Title / date | The Apotheosis of War, 1871 | Wikidata Q4068125 | OK |
| Medium / size | Oil on canvas, 127 × 197 cm | Wikidata Q4068125 | OK |
| Collection | State Tretyakov Gallery, Moscow, inv. 183 | Wikidata Q4068125 | OK |
| Museum page | Not found (tretyakovgallery.ru guessed URLs return 404); `source_url` is the Wikidata item | – | Note |
| Image | File:Vasily Vereshchagin - Апофеоз войны - Google Art Project.jpg, 4000 × 2511 px | https://commons.wikimedia.org/wiki/File:Vasily_Vereshchagin_-_%D0%90%D0%BF%D0%BE%D1%84%D0%B5%D0%BE%D0%B7_%D0%B2%D0%BE%D0%B9%D0%BD%D1%8B_-_Google_Art_Project.jpg | OK |
| Rights | Commons: public domain (Google Art Project, PD-Art); artist died 1904. Not NC | same | OK |
| Pairing | Pile of skulls outside the breached walls of a Central Asian city (Samarkand); dedicated on the frame "to all great conquerors, past, present and to come"; considered anti-war, kept out of his Russian exhibitions | en.wikipedia "The Apotheosis of War" | SECONDARY |
| Reuse check | Not in `content/paintings.yaml`; Vereshchagin not used yet | – | OK |
| Overlap | The agent writing `shostakovich-symphony-10` may also look at Russian war or Stalin-era subjects; this is the obvious clash to check at merge. Alternatives below | – | Note |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 2 July – 9 September 1943, most of it at the Union of Composers' retreat at Ivanovo | BSO note: https://bso.org/works/shostakovich-symphony-no-8 ; ja.wikipedia (7月2日から9月9日; places it at a Moscow "House of Creativity", which conflicts); a programme note found by search gives movement dates: I Moscow 3 August, II–IV Ivanovo 17, 22, 25 August, V Moscow 9 September | OK (BSO), ja.wikipedia place noted as a discrepancy |
| Ivanovo north-east of Moscow | General geography | OK |
| Stalingrad won that winter; Red Army pushing west; victory symphony expected | Boosey & Hawkes note (written "when the battle … had turned and the Nazis were beginning their retreat"): https://www.boosey.com/cr/music/Dmitri-Shostakovich-Symphony-No-8-in-C-minor/4738 ; de.wikipedia (Red Army on the offensive after Stalingrad) ; ja.wikipedia | OK |
| "life is beautiful" as his public summary | BSO note ("the work's concept could be expressed in two words: 'life is beautiful'") | OK |
| Glikman: "his most tragic work" | en.wikipedia ; ru.wikipedia («самой трагической работой») | SECONDARY |
| Dedicated to Mravinsky | en/de/ru.wikipedia ; BSO note ("Mravinsky (the dedicatee)") | OK |
| First performances 3 and 4 November 1943, Moscow (Conservatory), USSR State Symphony Orchestra, Mravinsky | BSO note (3 November for an invited audience, public performance the next night); Boosey: "World Premiere 04/11/1943 Moscow Conservatoire, USSR State Symphony Orchestra / Yevgeni Mravinsky". ja.wikipedia gives both 14 November and 4 November (internal inconsistency) | OK |
| Cool reception; no optimistic finale; criticised at the Composers' Plenum, March 1944 (Prokofiev and others) | en.wikipedia ; de.wikipedia ; BSO note | SECONDARY |
| After the 1948 decree (Zhdanov) effectively banned until 1956 (rehabilitated by Samosud's performance, October 1956) | en.wikipedia ; de.wikipedia ; ru.wikipedia ("с 1944-го по 1956-й годы не исполнялась"); ja.wikipedia says banned until 1960 (minority) | SECONDARY, cautious wording "in effect banned" |
| "Stalingrad" nickname in the West, never given by Shostakovich | en.wikipedia (after the American premiere, 1944); DCH (after the French critic Antoine Goléa); BSO ("Shostakovich apparently never approved this label") | OK (origin left vague on purpose: sources disagree) |
| Five movements, the last three played without a break | BSO note ("3–5 played without pause"); de.wikipedia (attacca IV, attacca V) | OK |
| I: over a third of the work; motto in low strings, violins answer; theme 1 with syncopated accompaniment; theme 2 in 5/4 over irregular accompaniment; development begins when woodwinds break in (Allegro non troppo); snare, timpani, trumpets; theme 2 in the brass over woodwind trills; march-like climax with long drum rolls; cor anglais solo (bars 302–351) over string tremolo; trumpet recalls the motto; theme 1 returns quietly in the strings | BSO note ; ja.wikipedia (detailed) ; de.wikipedia (bars 302–351 cor anglais) | SECONDARY / OK (BSO) |
| II: "a march with elements of a scherzo"; D-flat major; extreme registers, piccolo and contrabassoon | en.wikipedia (quote) ; de.wikipedia | SECONDARY |
| II: piccolo has the trio tune | de.wikipedia mentions the piccolo prominently, not the trio specifically | UNVERIFIED in detail (check by ear) |
| II: draws on music from the 1938 Jazz Suite No. 2 | Boosey (McBurney) ; ja.wikipedia | OK, not used in the guide |
| III: E minor toccata; violas begin the hammering crotchets, violins take over at bar 43, both violins in unison from bar 117, winds from bar 146; chords from the other strings; two-note e–f "lament" motif; Sanderling: "the crushing of the individual" | de.wikipedia (bars, with timings 0:41 / 1:31 / 1:54 from an unnamed example recording) ; en.wikipedia (Sanderling) ; Boosey ("moto perpetuo … caught in the wheels of an unstoppable machine") | SECONDARY |
| III: trumpet "gallop" in the middle; the biggest climax of the symphony; leads straight into IV | ja.wikipedia ("トランペットの勇壮なギャロップ", "この曲の中でも最大のクライマックス") ; de.wikipedia (attacca) | SECONDARY |
| IV: passacaglia, bass theme heard eleven times, derived from the opening; first stated in full orchestra; horn, piccolo and clarinet solos; flutes with flutter-tongue | BSO note ("repeated eleven times") ; de.wikipedia ("elfmal", soli of horn, piccolo, clarinet; flutes with Flatterzunge) ; Boosey (ground bass from the opening bars) | OK |
| V: bassoon opens; violins continue (bar 37); flute solo with pizzicato chords making 3/4 sound like 2/4 (bar 62); theme back in violins then cellos (bars 87, 95); fugato; return of the first movement's climax; quiet ending in C major, violins hold a C major chord for the last 35 bars (from bar 561) with pizzicato three-note figure; ends pianissimo; Meyer: like a question mark | de.wikipedia ; ja.wikipedia ; en.wikipedia (pizzicato material, quiet end) | SECONDARY |
| V: the three-note figure is the start of a theme that does not continue | de.wikipedia (Meyer) | SECONDARY |
| Not used: finale coda resembles the coda of the Fourth Symphony, then unperformed | Boosey (McBurney) | left out (could be added) |

---

## 5. Re-time

Every stop is an estimate (≈). Movements III and V were placed from the bar positions and example timings in German Wikipedia (an unnamed reference recording: III bar 54 at 0:41, bar 117 at 1:31, bar 146 at 1:54; V bar 37 at 1:01, bar 62 at 1:36, bar 87 at 2:08, bar 186 at 4:10, bar 561 at 13:34), scaled to the Petrenko tracks (V × ≈ 0.93). Movements I, II and IV were placed from the section structure in the BSO note and Japanese/German Wikipedia and typical proportions. Nobody has listened against the Petrenko tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Adagio – Allegro non troppo | 25:12 | 0:00, 1:00, 4:30, 9:30, 12:30, 14:30, 17:00, Last 2 minutes | Start of the development (≈ 9:30) and the cor anglais solo (≈ 17:00) |
| II Allegretto | 6:10 | 0:00, 1:30, 3:00, Last 30 seconds | Start of the piccolo trio (≈ 1:30) |
| III Allegro non troppo | 6:00 | 0:00, 0:35, 1:30, 2:40, 4:30, Last seconds | Trumpet solo (≈ 2:40) |
| IV Largo | 9:55 | 0:00, 1:00, 2:30, 4:00–7:30, Last minute | Horn solo (≈ 2:30) and the order of the piccolo and clarinet solos |
| V Allegretto | 13:39 | 0:00, 1:30, 2:00, 5:30, 8:00, 9:30, 12:30, Last 30 seconds | Fugato (≈ 5:30) and the returning climax (≈ 8:00) |
