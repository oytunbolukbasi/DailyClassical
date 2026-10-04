# Verification: pieces 6–10 (Brahms 4, Tchaikovsky 6, Dvořák 9, Mahler 5, Shostakovich 5)

Source checked: `project-knowledge/dailyclassical-launch-content.md` (not edited).
Checked on 2026-10-04.

## Method and confidence

- **Spotify "VERIFIED"** means the album page was fetched directly. Three checks were made: the oEmbed title (`https://open.spotify.com/oembed?url=…`), the embed page's track list (track titles, credited artists, per-track durations in ms), and the album page's `og:` / `music:release_date` metadata. The album page's `og:restrictions:country:allowed` list was also read, and **TR availability** is noted. Some albums list 0 allowed countries. Those are delisted or geo-blocked duplicates and are not recommended.
- **Spotify "CANDIDATE"** means the page exists and its contents were confirmed, but the label or performance identity is uncertain.
- Durations come from the Spotify embed data (rounded to the nearest second). They were cross-checked against the Apple Music / iTunes lookup API (`itunes.apple.com/lookup?id=…`) where possible. Small 1–5 s differences between editions are normal and come from track gaps or remastering.
- Discographic credits come from the Discogs API (`api.discogs.com/releases/<id>`; the web pages return 403), label sites, Deezer API (`api.deezer.com/album/<id>`, gives label), and the Apple ℗ lines.
- Painting data comes from museum object pages where reachable, plus the Wikimedia Commons API (licence templates and file sizes).

---

## 6. Brahms – Symphony No. 4 in E minor, Op. 98

### Recordings and painting

| Field | File value | Verified value | Source URL | Status |
|---|---|---|---|---|
| Ref: conductor / orchestra | Carlos Kleiber / Wiener Philharmoniker | Same | https://www.discogs.com/release/3507687 | OK |
| Ref: label | Deutsche Grammophon | Deutsche Grammophon (LP 2532 003; CD 400 037-2; "Originals" 457 706-2) | https://api.discogs.com/releases/3507687 ; https://api.discogs.com/releases/4252168 | OK |
| Ref: year | 1981 | **Release 1981** (℗ 1981). **Recorded 12–15 March 1980**, Grosser Saal, Musikverein, Vienna. Digital recording. | https://api.discogs.com/releases/7673946 (notes) ; https://api.discogs.com/releases/4252168 | OK (year = release; recording 1980) |
| Ref: Spotify | null | https://open.spotify.com/album/0m6drSxGp5CSwgIn4J8upn ("Brahms: Symphony No. 4", WPh/Kleiber, 1981, 4 tracks, 183 markets incl. TR). Another ID, `63FJVKO8FsANQoYzjtO5xT`, is the same album but has 0 markets, so don't use it. | oEmbed + embed fetched | VERIFIED |
| Alt: Chailly / Gewandhausorchester | Decca, 2013 | Decca "Brahms: The Symphonies", 3 CD **478 5344**. Released 7 Oct 2013 (Deezer). Discogs EU pressing dated 2013-11-11. **No. 4 recorded 9–10 May 2013**, Gewandhaus zu Leipzig. Includes the alternative opening of No. 4. | https://api.discogs.com/releases/6183454 ; https://api.deezer.com/album/6951594 | OK |
| Alt: Spotify | null | https://open.spotify.com/album/0D8FPBeT77NdsjiwuSd103 (166 markets incl. TR). A second edition, https://open.spotify.com/album/23OHNMF9FpIqDppmvoUpuy, plays only in US/CA/MX/JP/CR. | oEmbed + embed fetched | VERIFIED |
| Painting: artist | Arnold Böcklin | Arnold Böcklin (1827–1901) | https://search.smb.museum/object/obj-967648 | OK |
| Painting: title | Isle of the Dead (third version) | Museum title **"Die Toteninsel"** (third of five versions). English: "The Isle of the Dead". | same | OK |
| Painting: year | 1883 | 1883. Oil on wood, 80 × 150 cm, inv. **NG 2/80** | same | OK |
| Painting: collection | Alte Nationalgalerie, Berlin | Alte Nationalgalerie, Staatliche Museen zu Berlin | same | OK |
| Public domain | – | Yes. Artist died 1901. The SMB image carries the **Public Domain Mark 1.0**. | same | OK |
| Open-access image | – | Commons: https://commons.wikimedia.org/wiki/File:Arnold_B%C3%B6cklin_-_Die_Toteninsel_III_(Alte_Nationalgalerie,_Berlin).jpg (4933 × 2628, Google Arts & Culture source, PD-Art). Direct: https://upload.wikimedia.org/wikipedia/commons/6/65/Arnold_B%C3%B6cklin_-_Die_Toteninsel_III_%28Alte_Nationalgalerie%2C_Berlin%29.jpg | Commons API | OK |

### Corrected yaml

```yaml
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  catalogue: "2532 003 (LP); 400 037-2 (CD); 457 706-2 (The Originals)"
  recorded: 1980-03-12/15, Grosser Saal, Musikverein, Vienna
  year: 1981            # release year (recorded 1980)
  spotify_url: https://open.spotify.com/album/0m6drSxGp5CSwgIn4J8upn
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Gewandhausorchester Leipzig
    label: Decca
    catalogue: "478 5344"
    recorded: 2013-05-09/10 (No. 4), Gewandhaus, Leipzig
    year: 2013
    spotify_url: https://open.spotify.com/album/0D8FPBeT77NdsjiwuSd103
painting:
  artist: Arnold Böcklin
  title: Isle of the Dead (third version)   # museum: "Die Toteninsel", NG 2/80
  year: 1883
  collection: Alte Nationalgalerie, Staatliche Museen zu Berlin
  museum_url: https://search.smb.museum/object/obj-967648
  image_url: https://commons.wikimedia.org/wiki/File:Arnold_B%C3%B6cklin_-_Die_Toteninsel_III_(Alte_Nationalgalerie,_Berlin).jpg
  rights: Public domain (Public Domain Mark 1.0 at SMB)
```

### Durations (reference: Kleiber, Spotify 0m6drSxGp5CSwgIn4J8upn; Apple Music 1618345305 identical)

| Mvt | File | Spotify | Apple | Diff vs file |
|---|---|---|---|---|
| I | ≈ 12:45 | 12:50 | 12:50 | +5 s |
| II | ≈ 11:20 | 11:24 | 11:24 | +4 s |
| III | ≈ 6:00 | 6:07 | 6:07 | +7 s |
| IV | ≈ 9:10 | 9:11 | 9:11 | +1 s |

All within tolerance. You could use the exact values. The listening stops are plausible for this timing.

---

## 7. Tchaikovsky – Symphony No. 6 in B minor, "Pathétique", Op. 74

### Recordings and painting

| Field | File value | Verified value | Source URL | Status |
|---|---|---|---|---|
| Ref: conductor / orchestra | Teodor Currentzis / musicAeterna | Same | https://api.discogs.com/releases/11217745 | OK |
| Ref: label | Sony Classical | Sony Classical, **88985404352** (℗ 2017, "Teodor Currentzis under exclusive license to Sony Music Entertainment") | Discogs API ; iTunes lookup 1289858974 | OK |
| Ref: year | 2017 | **Released 27 Oct 2017**. **Recorded 9–15 Feb 2015**, Funkhaus Nalepastraße, Berlin | Discogs notes ; Spotify `music:release_date` 2017-10-27 | OK (year = release; recorded 2015) |
| Ref: Spotify | null | https://open.spotify.com/album/4K1qDDbKEYVGF4jQIZyyJI (185 markets incl. TR) | oEmbed + embed + track meta | VERIFIED |
| Alt: Mravinsky / Leningrad PO | DG, 1960 | DG stereo, **recorded Nov 1960, Musikverein, Vienna** (No. 6). First issued as **DG 138 659 (1961)**. CD sets 477 5911, 419 745-2. | https://api.discogs.com/releases/2589614 | OK (1960 = recording year; release 1961) |
| Alt: Spotify | null | **The official DG album was not found on Spotify.** Apple Music has it (album 1452205579). Spotify only has third-party reissues of what looks like the same 1960 performance: Red Sky Records 2014, https://open.spotify.com/album/5V30EYcckS6ETfNRCOtZEn (184 markets incl. TR), and Musical Concepts 2019, https://open.spotify.com/album/6a2snuqVBLcTh7iXEl3lYh (185 markets). Their No. 6 timings run about 1.5% faster than DG's (17:20–17:25 vs DG 17:40). That suggests a different transfer speed, so the performance identity is **not confirmed**. Two other IDs were checked and rejected. `70h9s5iT8156qofk3xK1fW` has 0 markets. `1h5YKmhPGrRiB2WaO7TOaK` is the 1956 mono DG set (Sanderling No. 4) and has 0 markets. | oEmbed + embed; Deezer label lookup | UNVERIFIED (official); CANDIDATE (third-party) |
| Painting: artist | Isaac Levitan | Isaac Levitan (1860–1900) | https://my.tretyakov.ru/app/masterpiece/9903 | OK |
| Painting: title | Above the Eternal Peace | Museum title **«Над вечным покоем»**. The usual English is "Above Eternal Peace" (Wikipedia uses "Over Eternal Peace"). | same ; https://en.wikipedia.org/wiki/Over_Eternal_Peace | OK (drop "the" for the common form) |
| Painting: year | 1894 | 1894. Oil on canvas, 150 × 206 cm, inv. 1486 | Tretyakov page ; Wikipedia | OK |
| Painting: collection | State Tretyakov Gallery, Moscow | Same | same | OK |
| Pairing note | "Painted a year after the symphony" | Dated 1894. Wikipedia says work began in summer 1893 (Tver governorate). The Tretyakov text puts the main work in summer 1894 at Lake Udomlya. "A year after" is defensible. | same | OK (minor nuance) |
| Public domain | – | Yes. Artist died 1900. | Commons PD-old-100 | OK |
| Open-access image | – | The Tretyakov has no stated open licence. Commons: https://commons.wikimedia.org/wiki/File:Isaac_Levitan_-_Au-dessus_du_repos_%C3%A9ternel.jpg (2707 × 1981, PD-Art) or https://commons.wikimedia.org/wiki/File:Levitan_nad_vech_pok28.jpg (2000 × 1434). Direct: https://upload.wikimedia.org/wikipedia/commons/2/27/Isaac_Levitan_-_Au-dessus_du_repos_%C3%A9ternel.jpg | Commons API | OK |

### Corrected yaml

```yaml
reference_recording:
  conductor: Teodor Currentzis
  orchestra: musicAeterna
  label: Sony Classical
  catalogue: "88985404352"
  recorded: 2015-02-09/15, Funkhaus Nalepastraße, Berlin
  year: 2017            # release (27 Oct 2017)
  spotify_url: https://open.spotify.com/album/4K1qDDbKEYVGF4jQIZyyJI
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: Deutsche Grammophon
    catalogue: "138 659 (orig. LP); 477 5911 (2CD Nos. 4–6)"
    recorded: 1960-11, Grosser Saal, Musikverein, Vienna
    year: 1960            # recording year (first release 1961)
    spotify_url: null     # official DG album not found on Spotify; third-party candidates in notes
painting:
  artist: Isaac Levitan
  title: Above Eternal Peace   # «Над вечным покоем»
  year: 1894
  collection: State Tretyakov Gallery, Moscow
  museum_url: https://my.tretyakov.ru/app/masterpiece/9903
  image_url: https://commons.wikimedia.org/wiki/File:Isaac_Levitan_-_Au-dessus_du_repos_%C3%A9ternel.jpg
  rights: Public domain (artist d. 1900)
```

### Durations (reference: Currentzis, Spotify 4K1qDDbKEYVGF4jQIZyyJI; Apple 1289858974 identical)

| Mvt | File | Spotify / Apple | Diff |
|---|---|---|---|
| I | 19:44 | **19:42** | −2 s |
| II | 7:44 | **7:43** | −1 s |
| III | 8:36 | 8:36 | 0 |
| IV | 10:21 | 10:21 | 0 |

The file gives these as exact values (no ≈). Correct I to 19:42 and II to 7:43.

---

## 8. Dvořák – Symphony No. 9 in E minor, "From the New World", Op. 95

### Recordings and painting

| Field | File value | Verified value | Source URL | Status |
|---|---|---|---|---|
| Ref: conductor / orchestra | Rafael Kubelík / Berliner Philharmoniker | Same. This is Kubelík's 1972 Berlin DG recording. His other New Worlds are Chicago/Mercury 1951, Vienna/Decca 1956 and Bavarian RSO live. | https://api.discogs.com/releases/4906584 | OK |
| Ref: label | Deutsche Grammophon | DG. Single LP **2530 415**. CD 447 412-2 (Nos. 8 & 9), 457 928-2 (Originals) | https://api.discogs.com/masters/500549 ; Discogs 4906584, 1931619 | OK |
| Ref: year | 1973 | **Recorded June 1972**, Jesus-Christus-Kirche, Berlin-Dahlem. **℗ 1973**: first issued 1973 in the complete-symphonies box; Discogs dates the single LP 1974. | Discogs 4906584 notes | OK as release year. Use `recorded: 1972`. |
| Ref: Spotify | null | No standalone DG album playable in TR was found. Use the DG box "Dvorak: The 9 Symphonies" (1999): https://open.spotify.com/album/45AlGtE9Il2BmnisrbU1no (165 markets incl. TR; No. 9 at tracks I–IV, Berliner Philharmoniker/Kubelík). Another ID, `17v03O4R0fnewrbqhGHJuV` (1994), has 0 markets. Apple has the standalone 8 & 9 (881698846). | oEmbed + embed | VERIFIED (box set) |
| Alt: Kertész / LSO | Decca, 1966 | Decca **SXL 6291**, released **1967** (UK, ℗ 1967). Recorded at Kingsway Hall, London, in 1966. The month is disputed: Decca 475 7517 notes say "1/1966", other sources say Nov–Dec 1966. Plays the 1st-movement exposition repeat (I ≈ 12:28). | https://api.discogs.com/releases/5460715 ; https://api.discogs.com/releases/3256237 | OK (1966 = recording year) |
| Alt: Spotify | null | https://open.spotify.com/album/7fIXzx0sCyE9YvmOW8hZ7Z ("Dvorák: Symphonies Nos. 8 & 9", Decca 2006 = 475 7517, 178 markets incl. TR). Also https://open.spotify.com/album/6ECe5dUoLAX7LCyYArKemo (1991 box, 164 markets). `3edUlfuEesHcUd7BZjRpio` has 0 markets. | oEmbed + embed | VERIFIED |
| Painting: artist | Albert Bierstadt | Albert Bierstadt | https://americanart.si.edu/artwork/among-sierra-nevada-california-2059 | OK |
| Painting: title | Among the Sierra Nevada, California | Same | same | OK |
| Painting: year | 1868 | 1868. Oil on canvas, 72 × 120 1/8 in. (183 × 305 cm), acc. **1977.107.1**. Bequest of Helen Huntington Hull. Listed as **not currently on display**. | same | OK |
| Painting: collection | Smithsonian American Art Museum | Same | same | OK |
| Public domain / open access | – | PD. Smithsonian Open Access **CC0** record saam_1977.107.1 (si.edu object page; reported in search snippet, page returned 403 to the fetcher). | https://www.si.edu/object/among-sierra-nevada-california:saam_1977.107.1 | OK (CC0 not seen first-hand) |
| Open-access image | – | Commons: https://commons.wikimedia.org/wiki/File:Albert_Bierstadt_-_Among_the_Sierra_Nevada,_California_-_Google_Art_Project.jpg (3993 × 2387). Direct: https://upload.wikimedia.org/wikipedia/commons/5/5c/Albert_Bierstadt_-_Among_the_Sierra_Nevada%2C_California_-_Google_Art_Project.jpg | Commons API | OK |

### Corrected yaml

```yaml
reference_recording:
  conductor: Rafael Kubelík
  orchestra: Berliner Philharmoniker
  label: Deutsche Grammophon
  catalogue: "2530 415 (LP); 447 412-2 (CD, Nos. 8 & 9)"
  recorded: 1972-06, Jesus-Christus-Kirche, Berlin
  year: 1973            # ℗/first release (recorded 1972)
  spotify_url: https://open.spotify.com/album/45AlGtE9Il2BmnisrbU1no   # DG box "The 9 Symphonies"
also_recommended:
  - conductor: István Kertész
    orchestra: London Symphony Orchestra
    label: Decca
    catalogue: "SXL 6291 (LP); 475 7517 (CD, Nos. 8 & 9)"
    recorded: 1966, Kingsway Hall, London
    year: 1966            # recording year (released 1967)
    spotify_url: https://open.spotify.com/album/7fIXzx0sCyE9YvmOW8hZ7Z
painting:
  artist: Albert Bierstadt
  title: Among the Sierra Nevada, California
  year: 1868
  collection: Smithsonian American Art Museum, Washington, D.C.
  museum_url: https://americanart.si.edu/artwork/among-sierra-nevada-california-2059
  image_url: https://commons.wikimedia.org/wiki/File:Albert_Bierstadt_-_Among_the_Sierra_Nevada,_California_-_Google_Art_Project.jpg
  rights: Public domain; Smithsonian Open Access CC0
```

### Durations (reference: Kubelík 1972)

| Mvt | File | Spotify box 45AlG… | Apple 881698846 (standalone 8 & 9) | Diff vs file |
|---|---|---|---|---|
| I | ≈ 9:30 | 9:24 | 9:29 | −6 / −1 s |
| II | ≈ 13:00 | 13:00 | 13:04 | 0 / +4 s |
| III | ≈ 8:00 | 8:05 | 8:06 | +5 s |
| IV | ≈ 11:45 | 11:48 | 11:48 | +3 s |

All within tolerance. Kubelík does **not** take the 1st-movement repeat. Kertész does (I 12:28), so the listening stops for I would not fit Kertész.

---

## 9. Mahler – Symphony No. 5

### Recordings and painting

| Field | File value | Verified value | Source URL | Status |
|---|---|---|---|---|
| Ref: conductor / orchestra | Leonard Bernstein / Wiener Philharmoniker | Same. Live recording. Horn obbligato in III: Friedrich Pfeiffer (Spotify credit). | https://api.discogs.com/releases/1571157 | OK |
| Ref: label | Deutsche Grammophon | DG **423 608-2** | Discogs 1571157 ; https://discophage.com/mahler-symphony-no-5-vienna-philharmonic-leonard-bernstein-september-1987-dg-423-608-2-1988-and-reissues/ | OK |
| Ref: year | 1988 | **Released 1988** (℗ 1988). **Recorded live 6–8 Sept 1987**, Alte Oper, Frankfurt am Main | same | OK (year = release; recorded 1987) |
| Ref: Spotify | null | https://open.spotify.com/album/5ENEAfJFQNuvww1jxjcnbu ("Mahler: Symphony No.5", 1988, 182 markets incl. TR). `3vnX9aG4KkB1BG6lS4SHI0` (2006) has 0 markets. | oEmbed + embed | VERIFIED |
| Alt: Chailly / RCO | Decca, 1998 | Decca **458 860-2**, ℗ 1998. **Recorded Oct 1997**, Grote Zaal, Concertgebouw, Amsterdam. Solo trumpet Peter Masseurs, obbligato horn Jakob Slagter. | https://api.discogs.com/releases/8140760 ; Spotify credits | OK |
| Alt: Spotify | null | https://open.spotify.com/album/4HTScZKz8noAd4TU6rrqyY ("Mahler 5", 1998, 184 markets incl. TR) | oEmbed + embed | VERIFIED |
| Painting: artist | Gustav Klimt | Gustav Klimt (1862–1918) | https://onlinecollection.leopoldmuseum.org/en/object/629-death-and-life/ | OK |
| Painting: title | Death and Life | "Death and Life" (German: "Tod und Leben") | same | OK |
| Painting: year | 1910–1915 | **1910/11, reworked 1912/13 and 1915/16**. Oil on canvas, 180.8 × 200.6 cm, Inv. 630 | same | CORRECTED |
| Painting: collection | Leopold Museum, Vienna | Leopold Museum, Vienna | same | OK |
| Public domain | – | Yes. Artist died 1918. | Commons PD-old-100 | OK |
| Open-access image | – | Commons: https://commons.wikimedia.org/wiki/File:Gustav_Klimt_-_Death_and_Life_-_Google_Art_Project.jpg (4059 × 3533, Google Art Project / Leopold Museum). Direct: https://upload.wikimedia.org/wikipedia/commons/1/18/Gustav_Klimt_-_Death_and_Life_-_Google_Art_Project.jpg | Commons API | OK |

### Corrected yaml

```yaml
reference_recording:
  conductor: Leonard Bernstein
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  catalogue: "423 608-2"
  recorded: 1987-09-06/08, live, Alte Oper, Frankfurt am Main
  year: 1988            # release (recorded 1987)
  spotify_url: https://open.spotify.com/album/5ENEAfJFQNuvww1jxjcnbu
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Royal Concertgebouw Orchestra
    label: Decca
    catalogue: "458 860-2"
    recorded: 1997-10, Grote Zaal, Concertgebouw, Amsterdam
    year: 1998            # release (recorded 1997)
    spotify_url: https://open.spotify.com/album/4HTScZKz8noAd4TU6rrqyY
painting:
  artist: Gustav Klimt
  title: Death and Life
  year: "1910/11, reworked 1912/13 and 1915/16"
  collection: Leopold Museum, Vienna
  museum_url: https://onlinecollection.leopoldmuseum.org/en/object/629-death-and-life/
  image_url: https://commons.wikimedia.org/wiki/File:Gustav_Klimt_-_Death_and_Life_-_Google_Art_Project.jpg
  rights: Public domain (artist d. 1918)
```

### Durations (reference: Bernstein/WPh, Spotify 5ENEAfJFQNuvww1jxjcnbu; Apple 1440781907 identical)

| Mvt | File | Spotify / Apple | Diff |
|---|---|---|---|
| I | ≈ 14:30 | 14:35 | +5 s |
| II | ≈ 15:00 | 15:01 | +1 s |
| III | ≈ 19:00 | 19:08 | +8 s |
| IV | ≈ 11:15 | 11:18 | +3 s |
| V | ≈ 15:00 | 15:00 | 0 |

All within tolerance. For contrast, Chailly runs 12:54 / 14:57 / 18:00 / 10:28 / 15:29, so the stops fit Bernstein, not Chailly.

---

## 10. Shostakovich – Symphony No. 5 in D minor, Op. 47

### Recordings and painting

| Field | File value | Verified value | Source URL | Status |
|---|---|---|---|---|
| Ref: conductor / orchestra | Leonard Bernstein / New York Philharmonic | Same. There are two candidates. **(a) 1959 studio recording**, made 20 Oct 1959 at Symphony Hall, Boston, after the USSR tour: Columbia Masterworks **MS 6115** (1959), now Sony Classical. **(b) 1979 live recording** from Tokyo (Bunka Kaikan), released by CBS in 1980. Recommendation: keep **(a) 1959**, as the file intends. Its I, II and IV timings match the file. The 1979 version (17:42 / 5:23 / 16:00 / 10:11) does not. | https://api.discogs.com/releases/2914765 | OK |
| Ref: label | Sony Classical (originally Columbia) | Correct. Original Columbia Masterworks MS 6115. Current digital release "Shostakovich: Symphony No. 5 (Remastered)", ℗ 2017 Sony Music Entertainment. | Discogs ; iTunes 1276358812 | OK |
| Ref: year | 1959 | Recorded and first released 1959 | same | OK |
| Ref: Spotify | null | https://open.spotify.com/album/00d6wTUJHGsrxPmbETXGWm (2017 Sony remaster of the 1959 recording, 185 markets incl. TR). Don't confuse it with https://open.spotify.com/album/3fiptp5ORRFfnoRzhjHALZ, the **1979 Tokyo** recording released 1980. Third-party 1959 transfers also exist (`3lMOHdARGVVrHJqCxj2i3T`, `1zLpA1NglYC6ut5rKT1Fxc`); avoid them. | oEmbed + embed ; Apple ℗ line | VERIFIED |
| Alt: Mravinsky / Leningrad PO | "several recordings exist; choose one available on Spotify", year null | Mravinsky's main recordings are 1938 (first recording), 1954 Melodiya studio, 1965/66 live, 1973 live Leningrad (Altus), 1978 live Vienna, and **4 Apr 1984 live, Large Hall of the Leningrad Philharmonia, Erato 2292-45752-2**. Recommendation: **the 1984 Erato live recording**, because it is on Spotify under an official major label (Warner Classics). | https://www.discogs.com/release/13043954 (search snippet: date, Erato no., timings 15:00/5:10/13:09/10:52) ; https://api.deezer.com/album/85032 (label Warner Classics International) | CORRECTED (filled) |
| Alt: Spotify | null | https://open.spotify.com/album/4n4zKOkzZSwuymCZ4XGxuk ("Shostakovich: Symphonies Nos. 5 & 6", Warner, 1992, 185 markets incl. TR). Tracks 1–4 are Mravinsky's No. 5 (15:01 / 5:14 / 13:13 / 10:54, matching the Erato 1984 timings). No. 6 on this album is Rostropovich/NSO. Performance identity is **inferred from timings**: the Spotify page carries no date. Avoid `31WSFAR61YqSlu3514lMkk` (Entertain Me Europe/"Best Buy Classical" 2012, a budget third-party issue) and `1OfcvrDg8TzoNxhKvgiaN4` (0 markets). | oEmbed + embed ; Deezer | VERIFIED page / recording identity CANDIDATE |
| Painting: artist | Kazimir Malevich | Kazimir Malevich (1879–1935) | https://rusmuseumvrm.ru/data/collections/painting/19_20/malevich_k.s._slozhnoe_predchuvstvie_tors_v_zheltoy_rubashke._okolo_1932._zh-9477/?lang=en | OK |
| Painting: title | "Complex Presentiment: Torso in a Yellow Shirt" | The Russian Museum (Virtual Russian Museum) lists **"Torso in a Yellow Shirt (Complicated Premonition)"**. Russian: «Сложное предчувствие (Торс в желтой рубашке)». "Complex Presentiment: Half-Figure in a Yellow Shirt" is a common alternative English title (Commons). | same | CORRECTED (use museum form, or keep yours as an accepted variant) |
| Painting: year | c. 1932 | Museum: **"circa 1932"**. The literature also gives 1928–32 (Malevich back-dated late works); Commons gives 1931. Oil on canvas, 99 × 79 cm, inv. **Ж-9477**. The back carries Malevich's inscription about "isolation, emptiness, and a life without escape". | same | OK |
| Painting: collection | State Russian Museum, St Petersburg | Same | same | OK |
| Open-access image | – | Commons: https://commons.wikimedia.org/wiki/File:%D0%9A%D0%B0%D0%B7%D0%B8%D0%BC%D0%B8%D1%80_%D0%9C%D0%B0%D0%BB%D0%B5%D0%B2%D0%B8%D1%87_%E2%80%94_%D0%92%D0%B0%D0%B6%D0%BA%D0%B5_%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%D1%87%D1%83%D1%82%D1%82%D1%8F.jpg (1370 × 1800 only, `{{PD-Art|PD-old-auto|deathyear=1935}}`). Direct: https://upload.wikimedia.org/wikipedia/commons/c/cd/%D0%9A%D0%B0%D0%B7%D0%B8%D0%BC%D0%B8%D1%80_%D0%9C%D0%B0%D0%BB%D0%B5%D0%B2%D0%B8%D1%87_%E2%80%94_%D0%92%D0%B0%D0%B6%D0%BA%D0%B5_%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%D1%87%D1%83%D1%82%D1%82%D1%8F.jpg. Larger gallery photos exist, e.g. "Complicated Premonition (Torso in a Yellow Shirt) FRAME by shakko.jpg" (4368 × 3220, includes frame). Those are user photos and may carry a photographer licence (check before use). The Russian Museum states no open licence. | Commons API | OK (low-res only) |

### Malevich rights assessment (the file's rights_flag)

- **EU:** Life + 70 (Term Directive 2006/116/EC, art. 1). Malevich died 15 May 1935, so the work is **PD since 1 Jan 2006**. Under DSM Directive art. 14, a faithful reproduction of a PD visual artwork attracts no new copyright. **Safe.**
- **Turkey:** FSEK No. 5846 art. 27: protection lasts the author's life plus 70 years after death. Works first made public after the author's death are also protected for 70 years from death. Art. 26: the period counts from 1 January of the year after death. **PD since 1 Jan 2006. Safe.** (Text read from the official consolidated law: https://www.mevzuat.gov.tr/MevzuatMetin/1.3.5846.pdf, pp. 10–11.)
- **Russia (source country):** Authors who died before 1943 are generally PD. Malevich's term had already expired under Soviet and 1993 law (life + 50 → 1985). One theoretical caveat: Russian Civil Code art. 1281 restarts the term for authors who were repressed and *posthumously rehabilitated*. Malevich was briefly detained in 1930, and I found no evidence of a formal posthumous rehabilitation. Commons treats his works as PD.
- **United States:** This is not life + 70 for published works. It depends on publication history.
  - If the painting was never "published" in the US legal sense (exhibition is not publication), it counts as an unpublished work by an author who died before 1956. It is then **PD**.
  - If it was first published abroad before 1978 without US formalities, it gets URAA restoration only if it was still protected in Russia on 1 Jan 1996. It was not (term expired 1985), so it is **PD** ("PD-1996" logic; Cornell/Hirtle chart: https://guides.library.cornell.edu/copyright/publicdomain).
  - **Residual risk:** suppose its *first authorised* publication (e.g. a reproduction in a catalogue) happened in **1978–2002**, such as the 1988–90 Leningrad/Moscow/Amsterdam/Washington Malevich retrospective catalogue. Then the US term for "created before 1978, first published 1978–2002" would run to the later of life + 70 or **31 Dec 2047**. I could not establish the painting's first publication date. It was most likely reproduced in Soviet or foreign literature long before 1978, but this is **UNVERIFIED**.
  - The Commons file has no US-specific licence tag, only PD-old-auto.
- **Verdict:** **Safe for EU and Turkey** (including the app if it is distributed from or targeted at Turkey/EU). For **US distribution**, the risk is low but not zero. If the app is offered in the US store and you want zero risk, either (a) find evidence of a pre-1978 reproduction (e.g. a 1960s–70s Soviet monograph or exhibition catalogue that illustrates Ж-9477) and record it, or (b) use the file's fallback, Repin, "Barge Haulers on the Volga" (1870–73, State Russian Museum; Repin died 1930, painting published in the 19th century), which is PD everywhere. Also, the only free Commons image is low-res (1370 × 1800).

### Corrected yaml

```yaml
reference_recording:
  conductor: Leonard Bernstein
  orchestra: New York Philharmonic
  label: Sony Classical (originally Columbia Masterworks)
  catalogue: "MS 6115 (orig. stereo LP)"
  recorded: 1959-10-20, Symphony Hall, Boston
  year: 1959
  spotify_url: https://open.spotify.com/album/00d6wTUJHGsrxPmbETXGWm   # 2017 remaster of the 1959 recording
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: Erato (now Warner Classics)
    catalogue: "2292-45752-2"
    recorded: 1984-04-04, live, Large Hall of the Leningrad Philharmonia
    year: 1984
    spotify_url: https://open.spotify.com/album/4n4zKOkzZSwuymCZ4XGxuk   # tracks 1–4; identity inferred from timings
painting:
  artist: Kazimir Malevich
  title: "Torso in a Yellow Shirt (Complicated Premonition)"   # «Сложное предчувствие (Торс в желтой рубашке)»
  year: c. 1932
  collection: State Russian Museum, St Petersburg (inv. Ж-9477)
  museum_url: https://rusmuseumvrm.ru/data/collections/painting/19_20/malevich_k.s._slozhnoe_predchuvstvie_tors_v_zheltoy_rubashke._okolo_1932._zh-9477/?lang=en
  image_url: https://commons.wikimedia.org/wiki/File:%D0%9A%D0%B0%D0%B7%D0%B8%D0%BC%D0%B8%D1%80_%D0%9C%D0%B0%D0%BB%D0%B5%D0%B2%D0%B8%D1%87_%E2%80%94_%D0%92%D0%B0%D0%B6%D0%BA%D0%B5_%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%D1%87%D1%83%D1%82%D1%82%D1%8F.jpg
  rights_flag: PD in EU and Turkey since 2006 (life+70). US very likely PD (unpublished-work or URAA/PD-1996 logic) but first-publication date unverified; residual 1978–2002 first-publication risk. Only low-res free image. Fallback - Repin, "Barge Haulers on the Volga", 1870–1873, State Russian Museum.
```

### Durations (reference: Bernstein 1959, Spotify 00d6wTUJHGsrxPmbETXGWm; Apple 1276358812 identical)

| Mvt | File | Spotify / Apple | Diff | Note |
|---|---|---|---|---|
| I | ≈ 16:10 | 16:20 | +10 s | OK |
| II | ≈ 4:55 | 4:58 | +3 s | OK |
| III | ≈ 13:00 | **15:40** | **+2:40** | **Mismatch** |
| IV | ≈ 9:00 | 8:59 | −1 s | OK |

**Action needed:** The Largo duration does not match Bernstein 1959. It matches Mravinsky 1984 (13:13) or 1954-type tempos. Change the table to ≈ 15:40. The Largo listening stops (≈ 3:00, 5:30, 9:00 climax, 11:00 aftermath) were probably timed to a ~13-minute performance. **Re-time them against the 1959 track** before launch; I could not check them by ear. Stops for I, II and IV are consistent with this recording's durations.

---

## Summary of corrections and open items

1. **Brahms 4:** All OK. Kleiber recorded March 1980, released 1981. Both Spotify URLs verified.
2. **Tchaikovsky 6:**
   - Currentzis verified (recorded 2015, released 2017). Fix durations I 19:44 → 19:42 and II 7:44 → 7:43.
   - **The Mravinsky DG 1960 official album was not found on Spotify** (only on Apple Music). Third-party reissues exist (Red Sky `5V30EYcckS6ETfNRCOtZEn`, Musical Concepts `6a2snuqVBLcTh7iXEl3lYh`), but their identity with DG's tape is unconfirmed. spotify_url is left null.
   - Levitan title: "Above Eternal Peace".
3. **Dvořák 9:**
   - Kubelík recorded June 1972 (℗ 1973). Spotify has it only in the DG box set (verified).
   - Kertész released 1967 (recorded 1966; month disputed). Spotify verified. Note his 1st-movement repeat.
4. **Mahler 5:**
   - Bernstein recorded Sept 1987 live in Frankfurt, released 1988. Chailly recorded Oct 1997, released 1998. Both Spotify URLs verified.
   - **Klimt date corrected** to 1910/11, reworked 1912/13 and 1915/16.
5. **Shostakovich 5:**
   - Bernstein 1959 confirmed (MS 6115, Boston). Spotify is the 2017 Sony remaster. Not the 1979 Tokyo album `3fiptp5ORRFfnoRzhjHALZ`.
   - **Largo duration in the file (≈13:00) is wrong for this recording (15:40). Its listening stops need re-timing.**
   - Mravinsky alt filled with the 1984 Erato live recording (Spotify page verified; recording identity inferred from timings).
   - Malevich: museum title is "Torso in a Yellow Shirt (Complicated Premonition)", c. 1932, Ж-9477.
   - Malevich rights: PD in EU and Turkey (safe). US very likely PD, but there is an unverified residual risk tied to the first-publication date. Only a low-res free image is available.

UNVERIFIED items:
- Official DG Mravinsky Tchaikovsky 6 on Spotify.
- The exact recording month of Kertész.
- The Malevich painting's first-publication date, which matters for the US.
- The Smithsonian CC0 flag. It came from a search snippet; the si.edu page returned 403.
- The Shostakovich Largo listening-stop times.
