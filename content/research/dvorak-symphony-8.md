# Verification: Dvořák – Symphony No. 8 in G major

Piece id `dvorak-symphony-8`. Checked on 2026-10-24 (batch October 2026, second batch, group H).
Files: `content/drafts/en/dvorak-symphony-8.md`, `content/drafts/tr/dvorak-symphony-8.md`.
Shared-file additions (paintings.yaml entry, alternatives, re-time rows): `content/research/dvorak-symphony-8.shared.md`.

**How the checks were done**
- **Spotify:** album ids found with Spotify's own web search (open.spotify.com/search, read in the browser pane). Each album was then read from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: track titles, credited artists, `duration` in ms, `isPlayable`), fetched with curl from this machine's Turkish network. Album page meta (`og:description`, `music:release_date`, `og:restrictions:country:allowed`) and the rendered ℗/© lines were also read.
- **Discogs:** public API `https://api.discogs.com/database/search` and `/releases/<id>`; human-readable URLs given below.
- **Other sources:** English and German Wikipedia (plain-text API), the Antonín Dvořák website of the Akademie klasické hudby (antonin-dvorak.cz), Japanese Wikipedia for the metres, Wikimedia Commons and Wikidata for the painting.
- Status key: OK = confirmed from a primary or authoritative source; SECONDARY = from Wikipedia, a library catalogue or a reissue note only; UNVERIFIED = not confirmed.
- No personal data was sent anywhere; requests used `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Kubelík / Berliner Philharmoniker (DG, 1966)

Why this one: Kubelík's Berlin recording from his complete Dvořák cycle is widely admired (Gramophone calls it "marvellously communicative, vibrant"), the album has one track per movement, and every track is playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Rafael Kubelík / Berliner Philharmoniker | Embed credits on tracks 1–4: "Antonín Dvořák, Berlin Philharmonic, Rafael Kubelík" | https://open.spotify.com/embed/album/3ZFAZ6hnng0lLB0e8YIbL4 | OK |
| Label | Deutsche Grammophon | Album page: "© 1995 Deutsche Grammophon GmbH, Berlin / ℗ 1995 Deutsche Grammophon GmbH, Berlin" | https://open.spotify.com/album/3ZFAZ6hnng0lLB0e8YIbL4 | OK |
| LP | SLPM 139 181 | Discogs release 5602270: "Symphonie Nr. 8 (4)", Deutsche Grammophon 139 181 SLPM, Germany, released 1966-09; recording supervisor Hans Weber, engineer Günter Hermanns, notes Karl Schumann | https://www.discogs.com/release/5602270 | OK |
| CD | 447 412-2 (The Originals, with No. 9) | Library catalogue record (ECU) for the 1995 DG reissue, publisher number 447 412-2; the Spotify album (1995, 8 tracks, Nos. 8 and 9) matches it | https://lib.ecu.edu/catalog-preview/catalog/1387177 | SECONDARY |
| Recorded / venue | June 1966, Jesus-Christus-Kirche, Berlin | Same ECU record: No. 8 recorded June 1966, No. 9 June 1972, Jesus-Christus-Kirche, Berlin; an Austrian library record (Polydor 423 125-2) gives June 1966, Jesus-Christus-Kirche | same ; https://www.mediathek.at/ (record found via search) | SECONDARY |
| Release year / year | 1966 | Discogs 5602270 released 1966-09 | Discogs | OK |
| Spotify | https://open.spotify.com/album/3ZFAZ6hnng0lLB0e8YIbL4 | "Dvorák: Symphony Nos. 8 & 9 "From the New World"", album, 1995, 8 songs; TR in `og:restrictions:country:allowed` | embed + album page | VERIFIED |

### Durations and playability (embed, album 3ZFAZ6hnng0lLB0e8YIbL4)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro con brio | 600440 | 10:00 | true |
| 2 | II. Adagio | 619000 | 10:19 | true |
| 3 | III. Allegretto grazioso – Molto vivace | 399000 | 6:39 | true |
| 4 | IV. Allegro ma non troppo | 528000 | 8:48 | true |
| | Total | 2146440 | 35:46 → `duration_min: 36` | |

Tracks 5–8 are Symphony No. 9 (also playable). Discogs side length for the LP: 35:28, consistent.

---

## 2. Also recommended: Szell / The Cleveland Orchestra (EMI, 1970)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | George Szell, The Cleveland Orchestra | Embed credits, album 2HI1NMlbbcgDmC4Phr8EQW | OK |
| Label / LP | EMI; Angel S-36043 (US, 1970); UK HMV ASD 2653 notes "Dr. Szell's last recordings", ℗ 1970 | https://www.discogs.com/release/4491192 ; https://www.discogs.com/release/9991578 | OK |
| Recorded / venue | April 1970, Severance Hall | Discogs 30811965 (EMI Japan SACD): "Recorded: April 1970", "Recorded At – Severance Hall" | https://www.discogs.com/release/30811965 | OK |
| Spotify | ℗ "A Warner Classics release, ℗ 1970 Parlophone Records Limited. Remastered 2018"; 6 tracks: 10:50 / 10:38 / 6:42 / 9:34 + two Slavonic Dances; all `isPlayable: true`; TR allowed | https://open.spotify.com/album/2HI1NMlbbcgDmC4Phr8EQW | VERIFIED |

Also checked and playable: Sir Colin Davis / LSO Live (`6IJ8RUE8M41y5NigsXblU5`, 10:04 / 11:20 / 6:59 / 10:48; track titles wrongly say "G Minor"); Kubelík / Bavarian RSO live (`3tW4vWJFTFwOdBMkoxWczL`, tracks 5–8).

---

## 3. Painting: Antonín Chittussi, *The Chrudimka Valley* (*Údolí Chrudimky*), 1887

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Antonín Chittussi (Czech, 1847–1891) | Commons Creator template; licence tag deathyear=1891 | OK |
| Title / date | *Údolí Chrudimky* / *The Chrudimka Valley*, 1887 | Commons file page; Wikidata Q117213566 | OK |
| Medium / size | Oil on panel, 50 × 39.5 cm | Wikidata P186 (oil paint, panel); Commons dimensions | SECONDARY |
| Collection | National Gallery Prague (Veletržní palác), inv. O 10266 | Wikidata P217/P195; Commons categories | OK |
| Museum page | https://sbirky.ngprague.cz/dielo/CZE:NG.O_10266 (URL pattern as in the existing `dvorak-cello-concerto` entry; the site did not answer from this machine) | – | UNVERIFIED (link) |
| Image | File:1887 Chittussi Chrudimka-Tal Nationalgalerie Prag anagoria.jpg, **12000 × 9480** px, gallery photo by anagoria | https://commons.wikimedia.org/wiki/File:1887_Chittussi_Chrudimka-Tal_Nationalgalerie_Prag_anagoria.jpg | OK |
| Rights | `{{PD-Art|PD-old-auto-expired|deathyear=1891}}`: painting public domain everywhere; faithful photo of a 2D PD work, no new right (EU DSM art. 14, US) | same | OK |
| Pairing | A summer valley in eastern Bohemia (meadow, haystack, woods), 1887; Dvořák wrote the symphony two years later in the Bohemian countryside at Vysoká, and it is full of pastoral images | antonin-dvorak.cz (below) | OK |

Note: a smaller NG Prague scan of the same painting also exists on Commons (File:Antonín Chittussi - The Chrudimka Valley - O 10266 - National Gallery Prague.jpg, via Wikidata P18). The anagoria photo is very large; the pipeline downscales it (as for Slavíček's *Birch Mood*).

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Composed 26 August – 8 November 1889, mainly at his summer residence in Vysoká | https://www.antonin-dvorak.cz/en/work/symphony-no-8/ ; https://en.wikipedia.org/wiki/Symphony_No._8_(Dvořák) | OK |
| Vysoká "the environment in which Dvořák was most at ease" | antonin-dvorak.cz | OK |
| Vysoká u Příbramě lies south-west of Prague | Geography (Příbram district, Central Bohemia) | OK |
| Written on his election to the Bohemian Academy; dedication "in thanks for my election" | en.wikipedia (dedication text) ; de.wikipedia | OK |
| Aim: "different from the other symphonies, with individual thoughts worked out in a new way" | en.wikipedia (quote); de.wikipedia (German quote) | OK |
| Seventh (1885) stormy and dark by contrast | en.wikipedia ("a stormy romantic work"); antonin-dvorak.cz ("the sombre Symphony No. 7") | OK |
| Premiere 2 February 1890, Prague (Rudolfinum), Dvořák conducting; London premiere 24 April 1890 | antonin-dvorak.cz ; en.wikipedia | OK |
| Letter: applause grew after each movement, "almost unbearable" | antonin-dvorak.cz (letter to V. J. Novotný) | OK |
| Published by Novello in London after failing to agree a fee with Simrock; hence "English" | antonin-dvorak.cz ("failed to agree over the amount"); en.wikipedia | OK |
| Not stated: the first-edition year (Wikipedia says 1890, antonin-dvorak.cz says 1892) | – | left out on purpose |
| I: opening G minor theme in cellos, clarinets, bassoons, horn(s); 17 bars; passes through E-flat and A-flat before reaching G major | en.wikipedia ; antonin-dvorak.cz ("seventeen-bar period") | OK |
| I: theme returns at the start of exposition, development and recapitulation; before the recapitulation in the trumpet | antonin-dvorak.cz ; de.wikipedia ("vor der Reprise in der Trompete") | OK |
| I: flute "bird call" theme in G major | en.wikipedia | OK |
| I: second group in B minor turning to B major | Standard analyses; not stated in the sources above | SECONDARY |
| I: development "works up quite a storm" | en.wikipedia (Laki) | OK |
| I: in the recapitulation the bird-call theme is on the cor anglais, two octaves lower; the cor anglais plays only this short phrase | en.wikipedia (two passages) | OK |
| I: short, energetic coda | en.wikipedia | OK |
| II: free rondo of contrasting moods; C minor opening, birdlike flute figures, clarinet replies; strong string interjection; C major theme for flute and oboe over descending violin scales; solo violin; bold tutti; storm | en.wikipedia ; de.wikipedia ; antonin-dvorak.cz (A–B–A'–C–B'–A') | OK |
| II: summer day / thunderstorm reading | en.wikipedia ("Similar to Beethoven's Pastoral …") ; guide says Dvořák left no programme | OK (presented as one reading) |
| III: waltz in G minor, 3/8; trio G major in flutes and oboes, repeated in oboe and bassoon; coda in 2/4 | en.wikipedia ; de.wikipedia | OK |
| III: trio tune from the comic opera *The Stubborn Lovers* (Toník's aria), written fifteen years earlier (1874) | antonin-dvorak.cz ; ja.wikipedia (opera Op. 17, B. 46, also the coda material) | OK |
| IV: trumpet fanfare; theme in the cellos; variations; flute virtuoso variation; horn trills; central minor variation "reminiscent of a village band"; slow lyrical return; chromatic coda with brass and timpani | en.wikipedia (Laki) ; de.wikipedia | OK |
| IV: central variation in C minor | Standard analyses | SECONDARY |
| Kubelík's remark "in Bohemia the trumpets never call to battle – they always call to the dance" | en.wikipedia (rehearsal quote, given as reported speech in the guide) | SECONDARY |
| Kubelík born in Bohemia; complete Dvořák cycle with the Berlin Philharmonic for DG | General (Kubelík born 1914 in Býchory, Bohemia); DG cycle known from the reissues | SECONDARY |
| Keys and metres: I 4/4 G major; II 2/4 C minor; III 3/8 → 2/4 G minor; IV 2/4 G major | ja.wikipedia (交響曲第8番) ; de.wikipedia (II 2/4) | OK |

---

## 5. Re-time

Every stop is an estimate (≈), derived from the section structure in the sources above, typical proportions of the movements, and the exact Kubelík track lengths. No bar-accurate score was available (the IMSLP download sits behind a bot check, which was not bypassed). Nobody has listened against the Kubelík tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro con brio | 10:00 | 0:00, 0:30, 1:00, 1:50, 3:10, 4:30–5:20, 5:25, 5:50, Last 45 seconds | Start of the development (≈ 3:10) and the trumpets' statement before the recapitulation (≈ 5:25) |
| II Adagio | 10:19 | 0:00, 0:40, 1:50, 2:50, 3:40, 4:20, 5:20, 7:00, Last minute | The solo violin (≈ 3:40) and the storm (≈ 7:00) |
| III Allegretto grazioso – Molto vivace | 6:39 | 0:00, 1:00, 2:05, 2:50, 4:00, Last 45 seconds | Trio entry (≈ 2:05) and return of the waltz (≈ 4:00) |
| IV Allegro ma non troppo | 8:48 | 0:00, 0:25, 1:40, 2:05, 2:45, 4:55, 6:10, 7:50, Last 30 seconds | Return of the fanfare (≈ 4:55) and the slow variation (≈ 6:10) |
