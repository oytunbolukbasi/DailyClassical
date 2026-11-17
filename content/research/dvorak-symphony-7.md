# Verification: Dvořák – Symphony No. 7 in D minor

Piece id `dvorak-symphony-7`. Checked on 2026-11-17 (batch November 2026, group H).
Files: `content/drafts/en/dvorak-symphony-7.md`, `content/drafts/tr/dvorak-symphony-7.md`.
Shared-file additions (paintings.yaml entry, alternatives, re-time rows): `content/research/dvorak-symphony-7.shared.md`.

**How the checks were done**
- **Spotify:** album ids found with Spotify's own web search (open.spotify.com/search, read in the browser pane). Each album was then read from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: track titles, credits, `duration` in ms, `isPlayable`), fetched with curl from this machine's Turkish network. The album page was read for `og:description`, `music:release_date`, `og:restrictions:country:allowed` and the ℗ line.
- **Discogs:** public API (`/database/search`, `/releases/<id>`); human-readable URLs below.
- **Other sources:** the Antonín Dvořák website of the Akademie klasické hudby (antonin-dvorak.cz), English, German and Japanese Wikipedia (plain-text API), the Art Institute of Chicago API, Wikimedia Commons.
- Status key: OK = primary or authoritative source; SECONDARY = Wikipedia, a database or a search summary only; UNVERIFIED = not confirmed.
- No personal data was sent anywhere; requests used `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Szell / The Cleveland Orchestra (Epic, 1960)

Why this one: Szell's Cleveland recording is one of the classic accounts of the symphony, the album has one track per movement, and every track is playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | George Szell / The Cleveland Orchestra | Embed credits on tracks 1–4: "Antonín Dvořák, George Szell, The Cleveland Orchestra" | https://open.spotify.com/embed/album/1YvOecSRk79eZrbqw7A5WH | OK |
| Label / LP | Epic, BC 1111 (stereo), mono LC 3748 | Discogs 3941887: "Symphony No. 2 In D Minor, Op. 70", Epic Stereorama / Epic BC 1111, released 1960-12-26; notes: "Released in monaural with catalog # LC-3748. Symphony No. 2 in D minor is now known as Symphony No. 7." Liner notes Otakar Šourek | https://www.discogs.com/release/3941887 | OK |
| Later issues | – | Columbia D3S 814 (3-LP, 1970), Odyssey Y 35931 (1980, "previously released on D3S 814 and BSC 133"; engineers Arthur Kendy, Ray Moore) | https://www.discogs.com/release/5000230 ; https://www.discogs.com/release/6575638 | OK |
| Recorded / venue | March 1960, Severance Hall, Cleveland | Classite discography (via search summary): 18–19 March 1960, Severance Hall, studio recording; page itself returns 403 to curl | https://classite.com/composition/Antonin-Dvorak_Symphony-no-7-c72798/performance/487 | SECONDARY (month and venue only used) |
| Release year / year | 1960 | Discogs 3941887 (1960-12-26) | Discogs | OK |
| Spotify | https://open.spotify.com/album/1YvOecSRk79eZrbqw7A5WH | "Dvorák: Symphony No. 7 & Carnival Overture - Smetana: The Moldau, Bartered Bride and More", album, George Szell, 10 songs; "℗ 1958, 1960, 1963 Sony Music Entertainment Inc."; TR in `og:restrictions:country:allowed` | embed + album page | VERIFIED |

### Durations and playability (embed, album 1YvOecSRk79eZrbqw7A5WH)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro maestoso | 615826 | 10:16 | true |
| 2 | II. Poco adagio | 568373 | 9:28 | true |
| 3 | III. Scherzo: Vivace – Poco meno mosso | 455426 | 7:35 | true |
| 4 | IV. Finale: Allegro | 503373 | 8:23 | true |
| | Total | 2142998 | 35:43 → `duration_min: 36` | |

Tracks 5–10 (Carnival Overture, Smetana) are also playable. The same performance is on a 2018 Sony single album (`5OCoCRMHAjyzJETIE63ML7`, 10:17 / 9:27 / 7:35 / 8:24, ℗ 2018 Sony Music Entertainment, all playable); the 1958 compilation was kept because it is the one Spotify search returns first.

---

## 2. Also recommended: Sir Colin Davis / London Symphony Orchestra (LSO Live, 2003)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Performers | Sir Colin Davis, London Symphony Orchestra | Embed credits, album 04QIOqVPSBfi38NUui6AA4 | OK |
| Label / catalogue | LSO Live LSO0014 | Discogs 9942593 (released 2003-03; "Recorded live at a concert 21 Mar 2001"; "Ⓟ & Ⓒ 2003 London Symphony Orchestra") | https://www.discogs.com/release/9942593 | OK |
| Venue | Barbican, London | LSO Live's home hall; not stated in the Discogs notes | – | SECONDARY |
| Spotify | 4 tracks: 11:11 / 11:23 / 7:42 / 10:00, all `isPlayable: true`; "℗ 2003 London Symphony Orchestra Ltd"; TR allowed | https://open.spotify.com/album/04QIOqVPSBfi38NUui6AA4 | VERIFIED |

Also checked and playable: Dudamel / Los Angeles Philharmonic (`6b7rzLJNjDot2WLtTyFQwt`, Nos. 7–9).

---

## 3. Painting: Claude Monet, *Arrival of the Normandy Train, Gare Saint-Lazare*, 1877

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Claude Monet (French, 1840–1926) | AIC API, artwork 16571 | OK |
| Title / date | Arrival of the Normandy Train, Gare Saint-Lazare, 1877 | AIC API | OK |
| Medium / size | Oil on canvas, 60.3 × 80.2 cm | AIC API | OK |
| Collection | The Art Institute of Chicago, Mr. and Mrs. Martin A. Ryerson Collection, 1933.1158 | AIC API (`is_public_domain: true`) | OK |
| Museum page | https://www.artic.edu/artworks/16571 | – | OK |
| Image | File:Claude Monet - Arrival of the Normandy Train, Gare Saint-Lazare - Google Art Project.jpg, 5890 × 4418 px | https://commons.wikimedia.org/wiki/File:Claude_Monet_-_Arrival_of_the_Normandy_Train,_Gare_Saint-Lazare_-_Google_Art_Project.jpg | OK |
| Rights | Commons: Public domain (PD-Art); artist died 1926; AIC marks the work public domain and releases its data CC0 | same | OK |
| Pairing | Dvořák's note under the main theme in the score: it came to him on the arrival at the station of the festive train from Pest in 1884 | antonin-dvorak.cz | OK |
| Reuse check | Not in `content/paintings.yaml`. Monet is already there once (*Impression, Sunrise*, for another piece); kept because the train link is direct and unusual | – | Note |

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Commission and honorary membership from the Philharmonic Society of London, June 1884 | https://www.antonin-dvorak.cz/en/work/symphony-no-7/ | OK |
| The same society had commissioned Beethoven's Ninth | antonin-dvorak.cz ("the famous institution for which Beethoven had written his Symphony No. 9") | OK |
| Written 13 December 1884 – 17 March 1885 | antonin-dvorak.cz ; https://en.wikipedia.org/wiki/Symphony_No._7_(Dvořák) | OK |
| Had heard and admired Brahms's Third Symphony | en.wikipedia ; de.wikipedia ; ja.wikipedia | SECONDARY |
| Aimed at a work on the scale of Beethoven or Brahms; "must be capable of stirring the world" | antonin-dvorak.cz (quote and "It would seem that … on the scale of Beethoven or Brahms"); en.wikipedia gives the letter as "God grant that this Czech music will move the world" | OK |
| Note in the score under the main theme: came to him "upon the arrival at the station of the ceremonial train from Pest in 1884"; visit of several hundred Hungarians and Hungarian Czechs to the National Theatre, political in character | antonin-dvorak.cz ; en.wikipedia (daily walk to Prague railway station) | OK |
| Link between that mood and the music debated ("no convincing evidence for any of these theories") | antonin-dvorak.cz | OK |
| Darkest of his works, no Slav folk-inspired melodies | antonin-dvorak.cz | OK |
| Premiere 22 April 1885, St James's Hall, London, Dvořák conducting | antonin-dvorak.cz ; en.wikipedia | OK |
| Published by Simrock as No. 2; fee dispute (3,000 vs 6,000 marks); Czech title and first name | antonin-dvorak.cz ; en.wikipedia | OK |
| Not used: the "From the sad years" footnote and the mother's death (antonin-dvorak.cz calls the mother explanation improbable: she died two years earlier) | – | left out on purpose |
| I: D pedal, timpani like distant thunder, theme in violas and cellos; theme within a fourth, rising and ending on a diminished seventh chord; "calm before the storm" | ja.wikipedia ; antonin-dvorak.cz | OK |
| I: second theme in B-flat major, flutes and clarinets; string closing theme; no exposition repeat | ja.wikipedia | OK |
| I: development begins with woodwinds passing theme 1; recapitulation at a climax; long dramatic coda; ends quietly with the horn playing theme 1 | ja.wikipedia ; antonin-dvorak.cz ; de.wikipedia ("endet … im pianissimo") | OK |
| II: clarinet, oboe, bassoon chorale-like introduction; main theme flute and oboe; violins and cellos second melody; horn pastoral theme in the middle, climax; cellos bring back the main theme; oboe recalls the introduction, woodwinds fade | ja.wikipedia ; de.wikipedia | OK |
| II: shortened by 40 bars after the premiere; "not a single superfluous note" | antonin-dvorak.cz (letter to Simrock) ; en.wikipedia | OK |
| III: D minor, 6/4, furiant rhythm, theme in bassoons and cellos with a counter-melody; trio G major, slower, canon-like; long coda | ja.wikipedia ; antonin-dvorak.cz ("contrasting counter-melody", "wild, dark vortex") | OK |
| III: hemiola (two against three) | Standard description of the 6/4 furiant rhythm | SECONDARY |
| IV: 2/2, D minor; theme 1 in clarinets and horns with a rising octave; theme 2 in A major in the cellos, folk-like; violin closing theme used in the development; coda "Molto maestoso" in D major | ja.wikipedia ; antonin-dvorak.cz ("ascending octave leap") | OK |
| Keys and metres: I 6/8 D minor; II 4/4 F major; III 6/4 D minor; IV 2/2 D minor → D major | ja.wikipedia ; IMSLP work page (metronome marks: I ♩.=66, II ♩=56, III 𝅗𝅥.=80, IV 𝅗𝅥=100, consistent with these metres; first published as "Symphony No.2") https://imslp.org/wiki/Symphony_No.7,_Op.70_(Dvo%C5%99%C3%A1k,_Anton%C3%ADn) | OK |
| Szell born in Budapest | General biographical fact (en.wikipedia "George Szell") | SECONDARY |
| First LP titled "Symphony No. 2", with a note that it is now No. 7 | Discogs 3941887 (title and notes) | OK |

---

## 5. Re-time

Every stop is an estimate (≈), placed from the section structure in the sources above (ja.wikipedia, antonin-dvorak.cz), typical proportions of the movements and the exact Szell track lengths. No bar-accurate score was used. Nobody has listened against the Szell tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro maestoso | 10:16 | 0:00, 0:45, 1:50, 2:50, 3:40, 5:50, 7:20, Last minute | Start of the development (≈ 3:40) and the recapitulation climax (≈ 5:50) |
| II Poco adagio | 9:28 | 0:00, 0:45, 1:40, 3:00, 4:00, 5:15, 7:00, Last minute | Horn theme (≈ 3:00) and return of the main theme in the cellos (≈ 5:15) |
| III Scherzo: Vivace – Poco meno mosso | 7:35 | 0:00, 1:00, 2:30, 4:45, 6:15, Last 20 seconds | Trio entry (≈ 2:30) and return of the scherzo (≈ 4:45) |
| IV Finale: Allegro | 8:23 | 0:00, 0:40, 1:40, 2:40, 3:20, 5:00, 7:20, Last 40 seconds | Theme 2 (≈ 1:40), recapitulation (≈ 5:00) |
