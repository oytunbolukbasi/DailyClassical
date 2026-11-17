# Verification: Shostakovich – Symphony No. 7 in C major, "Leningrad"

Piece id `shostakovich-symphony-7`. Checked on 2026-11-17 (batch November 2026, group K).
Files: `content/drafts/en/shostakovich-symphony-7.md`, `content/drafts/tr/shostakovich-symphony-7.md`.
Shared-file additions (paintings.yaml entry, alternatives, re-time rows): `content/research/shostakovich-symphony-7.shared.md`.

**How the checks were done**
- **Spotify:** the reference album was fixed by the product owner. It and the also-recommended album were read from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` in ms, `isPlayable`), fetched with curl from this machine's Turkish network, plus the album page (`og:description`, `music:release_date`, ℗/© lines, `og:restrictions:country:allowed`). The Bernstein album id was found with Spotify's own web search (open.spotify.com/search, browser pane).
- **Discogs:** public API (`/database/search`, `/releases/<id>`); human-readable URLs below.
- **Other sources:** English, German and Japanese Wikipedia (plain-text API), Boosey & Hawkes work page (publisher's data and Gerard McBurney's note), classical-music.com, HistoryNet, the "Seventeen Moments in Soviet History" source text "This is Radio Leningrad", Wikidata, Wikimedia Commons.
- Status key: OK = primary or authoritative source; SECONDARY = Wikipedia, a database or a search summary only; UNVERIFIED = not confirmed.
- No personal data was sent anywhere; API requests used `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Vasily Petrenko / Royal Liverpool Philharmonic Orchestra (Naxos, 2013)

Fixed by the product owner.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Vasily Petrenko / Royal Liverpool Philharmonic Orchestra | Embed credits on tracks 1–4: "Dmitri Shostakovich, Royal Liverpool Philharmonic Orchestra, Vasily Petrenko" | https://open.spotify.com/embed/album/5C1sWm4XThvQleTYMHn8NP | OK |
| Label / catalogue | Naxos 8.573057 | Discogs 4800146: "Symphony No. 7 'Leningrad'", Naxos 8.573057, CD 2013; "℗ & © 2013 Naxos Rights US, Inc."; playing time 79:15; producer/editor Andrew Walton, engineer Mike Clements, liner notes Richard Whitehouse | https://www.discogs.com/release/4800146 | OK |
| Recorded | 1–3 June 2012 | Discogs notes: "Recorded from 1st to 3rd June, 2012" | Discogs 4800146 | OK |
| Venue | Liverpool Philharmonic Hall | Discogs companies: "Recorded At – Liverpool Philharmonic Hall" | Discogs 4800146 | OK |
| Release year | 2013 | Discogs (2013); Spotify `music:release_date` 2013-04-29; "℗ 2013 Naxos" | Discogs; album page | OK |
| Naxos's own page | – | naxos.com catalogue page returns 403 to curl; not read | https://www.naxos.com/CatalogueDetail/?id=8.573057 | not read |
| Later issue | – | The Complete Symphonies, Naxos 8.501111 (2015, box) | https://www.discogs.com/release/10458564 | OK |
| Spotify | https://open.spotify.com/album/5C1sWm4XThvQleTYMHn8NP | "Shostakovich: Symphony No. 7 in C Major, Op. 60 "Leningrad"", album, 2013, 4 songs. The album page carries no `og:restrictions` tags (no country list); every track is `isPlayable: true` from Turkey | embed + album page | VERIFIED |

### Durations and playability (embed, album 5C1sWm4XThvQleTYMHn8NP)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegretto | 1709800 | 28:29 | true |
| 2 | II. Moderato (Poco allegretto) | 771933 | 12:51 | true |
| 3 | III. Adagio | 1118106 | 18:38 | true |
| 4 | IV. Allegro non troppo | 1141480 | 19:01 | true |
| | Total | 4741319 | 79:01 → `duration_min: 79` | |

---

## 2. Also recommended: Leonard Bernstein / Chicago Symphony Orchestra (DG, 1989)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Leonard Bernstein, Chicago Symphony Orchestra | Embed credits, album 0Y2Ra2xK6ir4rSqGgob1Gl | OK |
| Label / catalogue | Deutsche Grammophon 427 632-2 (with Symphony No. 1) | Discogs 1818574 (released 1989-09-08) | https://www.discogs.com/release/1818574 | OK |
| Recorded / venue | June 1988, live, Orchestra Hall, Chicago | Discogs notes: "Live recording, Chicago, Orchestral Hall, 6/1988"; MusicWeb review of the reissue says the same | Discogs; https://musicweb-international.com/classrev/2008/Sept08/Shostakovich_7_Bernstein_4777587.htm | OK |
| Spotify | Tracks 5–8 (No. 7): 31:43 / 14:50 / 19:25 / 18:51, all `isPlayable: true`; "℗ 1989 Deutsche Grammophon GmbH, Berlin"; TR in `og:restrictions:country:allowed` | https://open.spotify.com/album/0Y2Ra2xK6ir4rSqGgob1Gl | VERIFIED |

---

## 3. Painting: Fyodor Alekseyev, *View of the Peter and Paul Fortress and the Palace Embankment*, 1799

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Fyodor Yakovlevich Alekseyev (Russian, 1753/55–1824), born and died in St Petersburg | Commons file (Google Art Project data: 1753–1824, died 11 October 1824) | OK |
| Title / date | View of the Peter and Paul Fortress and Palace Embankment, 1799 | Wikidata Q18685583; Google Art Project data on the Commons page | OK |
| Medium / size | Oil on canvas, 71.5 × 109 cm | Wikidata Q18685583; GAP data "w1090 x h715 mm" | OK |
| Collection | State Russian Museum, St Petersburg, inv. Ж-5048 (since 1906) | Wikidata Q18685583; museum page | OK |
| Museum page | https://rusmuseumvrm.ru/data/collections/painting/17_19/zh-5048/ | HTTP 200 on 2026-11-17 | OK |
| Image | File:Fyodor Alexeyev - View of the Peter and Paul Fortress and Palace Embankment - Google Art Project.jpg, 4601 × 2946 px | https://commons.wikimedia.org/wiki/File:Fyodor_Alexeyev_-_View_of_the_Peter_and_Paul_Fortress_and_Palace_Embankment_-_Google_Art_Project.jpg | OK |
| Rights | Commons: public domain (Google Art Project template, PD-Art); artist died 1824. Not NC | same | OK |
| Pairing | The symphony is dedicated to the city of Leningrad; Shostakovich was born in St Petersburg (25 September 1906, `content/composers.yaml`); the painting shows the Neva, the Peter and Paul Fortress and the Palace Embankment in 1799, 142 years before the siege | Japanese Wikipedia; Orchestre Métropolitain note (dedication "To the City of Leningrad", search summary) | OK |
| Reuse check | Not in `content/paintings.yaml`; Alekseyev not used yet | – | OK |
| Overlap | Chosen to avoid an obvious war painting that the agent writing `shostakovich-symphony-10` (and this group's `shostakovich-symphony-8`, Vereshchagin) might also pick | – | Note |

Spelling: Commons/Google use "Alexeyev"; the guide uses the equally common transliteration "Alekseyev". Either can be used; keep the same in EN and TR.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| German invasion 22 June 1941; first three movements written in Leningrad in the summer and early autumn of 1941; finale finished after the evacuation to Kuybyshev | Boosey & Hawkes note (G. McBurney): https://www.boosey.com/cr/music/Dmitri-Shostakovich-Symphony-No-7-in-C-major-Leningrad/7103 ; https://en.wikipedia.org/wiki/Symphony_No._7_(Shostakovich) ; HistoryNet https://www.historynet.com/shostakovich-symphony-leningrad/ | OK |
| Second movement begun 2 September (German bombardment), Adagio finished 29 September; evacuated to Moscow 1 October, to Kuybyshev 22 October | en.wikipedia | SECONDARY (guide says only "In October he was evacuated") |
| Radio address in September 1941, after finishing two movements: "life in our city is proceeding normally" | en.wikipedia (quotes the speech); ja.wikipedia gives 17 September 1941; "This is Radio Leningrad" source text (speech content, no date) https://seventeenmoments.web.illinois.edu/1943-2/900-days/900-days-texts/this-is-radio-leningrad/ | OK (guide gives the month only) |
| Finished in Kuybyshev in December 1941 | en.wikipedia ("completed in … December 1941"); ja.wikipedia gives 17 December in one place and a party on 27 December "just after completion" in another; the exact day is not used | OK (month only used) |
| Kuybyshev premiere 5 March 1942, Bolshoi Theatre Orchestra, Samuil Samosud | en.wikipedia ; ja.wikipedia (Palace of Culture). Boosey's work page gives "15/03/1942", an outlier, probably a typo | OK |
| Microfilm via Tehran (and Cairo) to the West; Toscanini, NBC Symphony, broadcast 19 July 1942 | en.wikipedia ; ja.wikipedia | SECONDARY |
| Symbol of resistance in the Allied world; 62 US performances in 1942–43; Time cover | en.wikipedia | SECONDARY (only "symbol of resistance" used) |
| Leningrad performance 9 August 1942, Karl Eliasberg, Leningrad Radio Orchestra | en.wikipedia ; ja.wikipedia ; HistoryNet ; Boosey (date and Eliasberg; Boosey says "surviving members of the Leningrad Philharmonic", but the Philharmonic had been evacuated to Novosibirsk, see ja.wikipedia; Radio Orchestra used) | OK |
| Orchestra down to about fifteen players; musicians found in the city and transferred from army and navy bands; extra rations | "This is Radio Leningrad" ("about fifteen musicians", "transferred from army and navy orchestras", extra porridge ration); en.wikipedia ("Only 15 members were still available", "additional rations"); HistoryNet says 14 survivors | OK ("about fifteen") |
| Broadcast by radio and loudspeakers, including towards the German lines | en.wikipedia ; HistoryNet (Radio Leningrad broadcast) | SECONDARY for loudspeakers |
| Soviet artillery shelled German positions beforehand to keep them quiet (operation "Squall") | en.wikipedia (Govorov, "Squall"); ja.wikipedia; HistoryNet ("German plans to disrupt … foiled by a Leningrad counter-barrage") | OK |
| Astoria Hotel banquet date: told as a story | en.wikipedia ("Whether this date was chosen intentionally, it was the day Hitler had chosen previously to celebrate the fall of Leningrad with a lavish banquet at the Astoria Hotel"); not in HistoryNet; widely repeated, no primary evidence found | Told as a legend |
| Not used: "three musicians died during rehearsals", "one-hour ovation" (blog only) | fugueforthought.de | left out on purpose |
| Officially about the war against fascism; friends (Lebedinsky, Mikheyeva) later said the march theme existed before the invasion; *Testimony* (Volkov, 1979), authenticity disputed, has the "Leningrad that Stalin destroyed and Hitler merely finished off" | en.wikipedia (sections "Music about terror", "Invasion theme", "Re-evaluation") ; ja.wikipedia | SECONDARY, worded as claims |
| Movement titles "War", "Reminiscence", "Home Expanses", "Victory", given and withdrawn | en.wikipedia ; ja.wikipedia | SECONDARY |
| I: broad unison string theme answered by woodwinds; second theme calm; piccolo and solo violin at the end of the exposition; 22-bar ostinato march; Ravel's *Boléro* comparison anticipated; brass and a new (inverted) theme at the climax; after the climax theme 1 cried out; bassoon solo; soft recapitulation of theme 1; coda with muted trumpet and percussion | en.wikipedia ; ja.wikipedia ; fugueforthought.de (first statement strings, then flute) | SECONDARY |
| Theme heard twelve times | ja.wikipedia ("12回繰り返される"); en.wikipedia ("At the end of the twelfth statement") | SECONDARY |
| Second half of the march theme quotes Danilo's song "Da geh' ich zu Maxim" from Lehár's *The Merry Widow* | en.wikipedia ; ja.wikipedia (both as an attribution commonly made) | SECONDARY ("echoes" used) |
| "I did not compose so-called battle music … I wanted to convey the context of grim events"; the requiem, not the march, is the "central place" | en.wikipedia (quotes) | SECONDARY |
| II: Shostakovich's "very lyrical scherzo"; quiet string theme, high oboe, shrill woodwind middle section (E-flat clarinet), brass, ostinato, return of the opening | en.wikipedia ; ja.wikipedia (composer's description: happy events of the past wrapped in mild sadness and melancholy, like a mist) | SECONDARY |
| III: woodwind and horn chorale, declamatory violin theme, faster middle section over a low-string ostinato, return of the opening, goes straight into the finale | en.wikipedia ; ja.wikipedia ("切れ目なく続く") | SECONDARY |
| III: flute solo over plucked strings | Not in the sources read; from general knowledge of the score (long flute solo in the first part of the Adagio) | UNVERIFIED in detail (check by ear) |
| IV: quiet opening without a break; low strings start a march-like tune; three-note figures with slap pizzicato in cellos and basses; slower accented section (sarabande-like); final crescendo; first-movement theme 1 returns at the climax in C major | en.wikipedia ; ja.wikipedia (sarabande, theme 1 at the peak) | SECONDARY |
| IV: "Morse code V" | ja.wikipedia ("…とされ", "is said to"); told as what "some writers hear" | SECONDARY, worded as a claim |
| Vasily Petrenko born in Leningrad, 7 July 1976 | https://en.wikipedia.org/wiki/Vasily_Petrenko | SECONDARY |
| Petrenko's complete Shostakovich cycle for Naxos | Discogs 10458564 (8.501111, The Complete Symphonies) | OK |

---

## 5. Re-time

Every stop is an estimate (≈), placed from the section structure in the sources above, typical proportions of the movements in other recordings (first movement about 26–27 minutes, invasion episode about ten to eleven minutes) scaled to the exact Petrenko track lengths. No score with bar numbers was available (the score is still in copyright). Nobody has listened against the Petrenko tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegretto | 28:29 | 0:00, 2:30, 5:00, 6:45, 8:00–11:30, 12:00, 15:30, 17:30, 20:00, 24:00, Last 2 minutes | Start of the snare drum (≈ 6:45) and the bassoon requiem (≈ 20:00) |
| II Moderato (poco allegretto) | 12:51 | 0:00, 1:20, 4:30, 5:45, 8:30, 9:30, Last minute | Entry of the shrill clarinet (≈ 4:30) and return of the opening (≈ 8:30) |
| III Adagio | 18:38 | 0:00, 1:45, 3:30, 5:00, 8:45, 11:00, 13:00, Last minute | Flute solo (≈ 5:00) and start of the fast middle section (≈ 8:45) |
| IV Allegro non troppo | 19:01 | 0:00, 1:00, 2:30, 5:30, 9:00, 12:30, 17:00, Last bars | Sarabande section (≈ 9:00) and the return of theme 1 (≈ 17:00) |
