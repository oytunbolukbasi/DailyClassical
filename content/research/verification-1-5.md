# Verification: pieces 1–5 (recordings, Spotify, paintings, durations)

Source checked: `project-knowledge/dailyclassical-launch-content.md` (not edited).
Checked on 2026-10-04.

**How the checks were done**
- **Spotify:** each album ID was confirmed by downloading Spotify's public embed page (`https://open.spotify.com/embed/album/<id>`). That page lists every track with its performer credits and exact duration. The album page's `og:title` and `music:release_date` were also read. **VERIFIED** means the album title, the conductor and orchestra, and every track were seen in that data.
- **Discogs:** credits and booklet notes come from the public Discogs API (`https://api.discogs.com/releases/<id>`). The URLs below are the human-readable release pages.
- **Spotify `release_date`:** this is the date of the digital edition. It is not the original release date.
- **Status key:** OK = file value is correct. CORRECTED = file value is wrong or incomplete, and the right value is given. UNVERIFIED = could not be confirmed from a primary source.

---

## 1. Mozart – Symphony No. 40 in G minor, K. 550

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ref. conductor / orchestra | Sir Charles Mackerras / Scottish Chamber Orchestra | Same | https://www.discogs.com/release/5369953 | OK |
| Ref. label | Linn Records | Linn Records, CKD 308 (2-SACD hybrid, *Symphonies 38–41*) | https://www.discogs.com/release/5369953 | OK |
| Ref. year | 2008 | Recorded 3–9 Aug 2007, City Halls, Glasgow; released 2008 (℗/© 2008 Linn) | https://www.discogs.com/release/5369953 ; https://www.prestomusic.com/classical/products/7961986--mozart-symphonies-nos-38-41 | OK (year = release year) |
| Ref. Spotify | null | https://open.spotify.com/album/0MNU78TPr4GbVdgRBsBL6L ("Mozart Symphonies 38-41", Scottish Chamber Orchestra, 2008, 16 tracks) | embed page | VERIFIED |
| Alt. Harnoncourt / Concentus Musicus Wien | Sony Classical, 2014 | Sony Classical 88843026352, *The Last Symphonies* (Nos. 39–41). Recorded 12–14 Oct 2013, Musikverein, Vienna; released 18/21 Jul 2014 | http://www.musicweb-international.com/classrev/2014/Oct14/Mozart_sys_88843026352.htm ; https://www.prestomusic.com/classical/products/8042796--mozart-the-last-symphonies | OK (note: classiquenews.com dates the sessions to Dec 2012; MusicWeb's header gives Oct 2013) |
| Alt. Spotify | null | https://open.spotify.com/album/2rq5Iu6Ox0TCICD2N685Y6 ("Mozart: Symphonies Nos. 39, 40 & 41", Harnoncourt / Concentus Musicus Wien, 2014-07-21) | embed page | VERIFIED |
| Painting artist / title | Claude-Joseph Vernet, *A Shipwreck in Stormy Seas* | Same. The museum adds "originally titled 'Tempête'" | https://www.nationalgallery.org.uk/paintings/claude-joseph-vernet-a-shipwreck-in-stormy-seas | OK |
| Painting year | 1773 | 1773 (NG). Commons file name says "c 1773" | same | OK |
| Painting collection | National Gallery, London | National Gallery, London, NG6601, oil on canvas, 114.5 × 163.5 cm. On display (Room 35 at time of check). Pair with *A Landscape at Sunset* ('Calme') | same | OK |
| Public domain / image | – | Artist died 1789, so the work is PD. The NG sells hi-res images through nationalgalleryimages.co.uk; no open-access download was found. Commons hi-res (6000×4188, PD-Art): https://commons.wikimedia.org/wiki/File:Claude-Joseph_Vernet_-_A_Shipwreck_in_Stormy_Seas_(Temp%C3%AAte)_-_c_1773_-_National_Gallery_UK.jpg | commons | OK |

Also on Spotify: a second edition of the same Mackerras recording, https://open.spotify.com/album/1EsOER6UdNfA5Lliol1o73 ("Mozart: Symphonies Nos. 38-41"). Its tracks are credited Mozart / SCO / Mackerras. Use the first link (0MNU…), whose titles follow Linn's own wording.

### Corrected yaml

```yaml
reference_recording:
  conductor: Sir Charles Mackerras
  orchestra: Scottish Chamber Orchestra
  label: Linn Records
  catalogue_number: CKD 308
  recorded: 2007-08-03/09, City Halls, Glasgow
  year: 2008
  spotify_url: https://open.spotify.com/album/0MNU78TPr4GbVdgRBsBL6L
also_recommended:
  - conductor: Nikolaus Harnoncourt
    orchestra: Concentus Musicus Wien
    label: Sony Classical
    catalogue_number: "88843026352"
    recorded: 2013-10-12/14, Musikverein, Vienna
    year: 2014
    spotify_url: https://open.spotify.com/album/2rq5Iu6Ox0TCICD2N685Y6
painting:
  artist: Claude-Joseph Vernet
  title: A Shipwreck in Stormy Seas
  year: 1773
  collection: National Gallery, London (NG6601)
  museum_url: https://www.nationalgallery.org.uk/paintings/claude-joseph-vernet-a-shipwreck-in-stormy-seas
  image_url: https://commons.wikimedia.org/wiki/File:Claude-Joseph_Vernet_-_A_Shipwreck_in_Stormy_Seas_(Temp%C3%AAte)_-_c_1773_-_National_Gallery_UK.jpg
```

### Durations: Mackerras / SCO (source: Spotify album 0MNU78TPr4GbVdgRBsBL6L)

| Mvt | File | Actual | Diff | Status |
| --- | --- | --- | --- | --- |
| I Molto allegro | ≈ 7:30 | 7:07 | −0:23 | CORRECTED → 7:07 |
| II Andante | ≈ 13:00 | 13:25 | +0:25 | CORRECTED → 13:25 |
| III Menuetto | ≈ 4:00 | 4:03 | +0:03 | OK |
| IV Allegro assai | ≈ 9:30 | 9:27 | −0:03 | OK |
| Total | 34 min | 34:02 | | OK |

For comparison, Harnoncourt (Spotify 2rq5…) runs 7:27 / 12:08 / 4:19 / 10:37. Re-check the late listening stops in I and II against the Mackerras track times.

---

## 2. Beethoven – Symphony No. 5 in C minor, Op. 67

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ref. conductor / orchestra | Carlos Kleiber / Wiener Philharmoniker | Same. Kleiber made only one studio Fifth (DG), so there is no ambiguity | https://en.wikipedia.org/wiki/Carlos_Kleiber_discography | OK |
| Ref. label | Deutsche Grammophon | DG. Original LP 2530 516 (1975). Current CD: *Symphonies Nos. 5 & 7*, DG Originals 447 400-2 | https://www.discogs.com/release/22146184 ; https://www.prestomusic.com/classical/products/7924176--beethoven-symphonies-nos-5-7 | OK |
| Ref. year | 1975 | Recorded 29–30 Mar & 4 Apr 1974, Großer Musikvereinssaal, Vienna; released 1975 (℗ 1975). Producer Werner Mayer; engineer Hans-Peter Schweigmann | https://www.discogs.com/release/2544200 (booklet: "Musikvereinsaal, 3 & 4/1974") ; https://slippedisc.com/2024/07/50-years-after-kleibers-beethoven-fifth-the-sound-engineer-speaks/ | OK (year = release year; recorded 1974) |
| Ref. Spotify | null | https://open.spotify.com/album/2aNAica8UZ1gPub5p1UYUe ("Beethoven: Symphonies Nos.5 & 7", WPh / Kleiber, Spotify date 1995-01-01) | embed page | VERIFIED |
| Alt. Currentzis / musicAeterna | Sony Classical, 2020 | Sony Classical 19075884972. Recorded 2018, Großer Saal, Konzerthaus, Vienna; digital release 3 Apr 2020 | https://www.prestomusic.com/classical/products/8733350--beethoven-symphony-no-5 ; https://musicaeterna.org/discover/record/beethoven-symphony-5/ | OK |
| Alt. Spotify | null | https://open.spotify.com/album/2zwzrmpYKqc1aVC0shtPmW ("Beethoven: Symphony No. 5 in C Minor, Op. 67", Currentzis / musicAeterna, 2020-04-03) | embed page | VERIFIED |
| Painting artist / title | J. M. W. Turner, "Snow Storm: Hannibal and his Army Crossing the Alps" | Joseph Mallord William Turner, *Snow Storm: Hannibal and his Army Crossing the Alps* | https://www.tate.org.uk/art/artworks/turner-snow-storm-hannibal-and-his-army-crossing-the-alps-n00490 | OK |
| Painting year | 1812 | "exhibited 1812" (Tate's own dating) | same | OK (better: "exhibited 1812") |
| Painting collection | Tate Britain, London | Tate (N00490), Turner Bequest 1856. Tate's page shows it on display at Tate Britain | same | OK |
| Public domain / image | – | PD (Turner died 1851). Tate's own image downloads are licensed separately and were not checked: UNVERIFIED. Commons candidates (PD): https://commons.wikimedia.org/wiki/File:Joseph_Mallord_William_Turner_081.jpg (1536 px, Yorck Project scan) ; gallery photo 5168×2912 by Steven Zucker: https://commons.wikimedia.org/wiki/File:Turner,_Snow_Storm,_50507693753_ed88546d01_o.jpg (frame and lighting may be visible) | commons | Partly UNVERIFIED (no clean hi-res scan found) |

Also on Spotify: the Kleiber Fifth (identical durations) in *Originals Beethoven Box*, https://open.spotify.com/album/1kiYP14ax8HLDP9lkwdPwb. Prefer the standalone album above.

### Corrected yaml

```yaml
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  catalogue_number: 2530 516 (LP); 447 400-2 (CD, with Symphony No. 7)
  recorded: 1974-03-29/30 & 1974-04-04, Musikverein, Vienna
  year: 1975
  spotify_url: https://open.spotify.com/album/2aNAica8UZ1gPub5p1UYUe
also_recommended:
  - conductor: Teodor Currentzis
    orchestra: musicAeterna
    label: Sony Classical
    catalogue_number: "19075884972"
    recorded: 2018, Konzerthaus, Vienna
    year: 2020
    spotify_url: https://open.spotify.com/album/2zwzrmpYKqc1aVC0shtPmW
painting:
  artist: J. M. W. Turner
  title: "Snow Storm: Hannibal and his Army Crossing the Alps"
  year: exhibited 1812
  collection: Tate, London (N00490), on display at Tate Britain
  museum_url: https://www.tate.org.uk/art/artworks/turner-snow-storm-hannibal-and-his-army-crossing-the-alps-n00490
  image_url: https://commons.wikimedia.org/wiki/File:Joseph_Mallord_William_Turner_081.jpg
```

### Durations: Kleiber / WPh (source: Spotify album 2aNAica8UZ1gPub5p1UYUe)

| Mvt | File | Actual | Diff | Status |
| --- | --- | --- | --- | --- |
| I Allegro con brio | ≈ 7:20 | 7:22 | +0:02 | OK |
| II Andante con moto | ≈ 10:00 | 10:00 | 0 | OK |
| III Allegro | ≈ 5:10 | 5:09 | −0:01 | OK |
| IV Allegro | ≈ 10:50 | 10:51 | +0:01 | OK |
| Total | 33 min | 33:22 | | OK |

For comparison, Currentzis runs 6:42 / 8:40 / 4:41 / 10:35, so listening stops will not transfer to it.

---

## 3. Beethoven – Symphony No. 9 in D minor, Op. 125 "Choral"

### Which Karajan recording?
Karajan made several commercial Ninths:
- Vienna Philharmonic, EMI, 1947
- Philharmonia, EMI, 1955
- **Berlin Philharmonic, DG: recorded Oct 1962, released 1963**
- Berlin Philharmonic, DG, 1976–77 (Tomowa-Sintow, Baltsa, Schreier, van Dam)
- Berlin Philharmonic, DG digital, 1983

"DG, 1963" points to the first DG cycle. The file's durations match it, and the 1977 recording (Spotify 745OTb1REdERaAzBPzYCXy) is a different one. **Recommendation: keep the 1962 recording.** The listening-stop timings fit it.

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ref. conductor / orchestra | Herbert von Karajan / Berliner Philharmoniker | Same | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphony-no-9-1962-karajan-771 | OK |
| Ref. soloists / chorus | (missing) | Gundula Janowitz (sop), Hilde Rössel-Majdan (alto), Waldemar Kmentt (ten), Walter Berry (bass); Wiener Singverein (chorus master Reinhold Schmid) | https://www.discogs.com/release/12850497 ; https://classical.music.apple.com/us/album/1575697279 | CORRECTED (added) |
| Ref. label | Deutsche Grammophon | DG. Originally part of the 1963 nine-symphony box; standalone CD DG Originals 447 401-2 (with *Coriolan*), released 1995. Producer Elsa Schiller, recording supervisor Otto Gerdes, engineer Günter Hermanns | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphony-no-9-karajan-1962-4125 ; https://www.discogs.com/release/12850497 | OK (original LP catalogue number UNVERIFIED) |
| Ref. year | 1963 | Recorded October 1962, Jesus-Christus-Kirche, Berlin-Dahlem; released 1963 (℗ 1963) | https://en.wikipedia.org/wiki/Karajan:_Beethoven_Symphonies_(1963) ; Discogs 12850497 | OK (year = release year; recorded 1962) |
| Ref. Spotify | null | https://open.spotify.com/album/1xrUldRtz5tcUQ6KrIOS2e ("Beethoven: Symphony No. 9", Karajan / BPh; finale credits Janowitz, Rössel-Majdan, Kmentt, Berry, Wiener Singverein; release date 1963-01-01) | embed page | VERIFIED (see metadata note below) |
| Alt. Fricsay / Berliner Philharmoniker | DG, 1958 | DG. Recorded Dec 1957, Jan & Apr 1958, Jesus-Christus-Kirche, Berlin; LP released 1958. Soloists Irmgard Seefried, Maureen Forrester, Ernst Haefliger, Dietrich Fischer-Dieskau; Chor der St. Hedwigs-Kathedrale Berlin (chorus master Karl Forster). CD DG 463 626-2 (with *Egmont* Overture). Producer Otto Gerdes | https://www.discogs.com/release/6344839 ; https://www.deutschegrammophon.com/en/catalogue/products/beethoven-symphony-no-9-fricsay-2159 ; https://www.prostudiomasters.com/album/page/5526 | OK (soloists/chorus added) |
| Alt. Spotify | null | https://open.spotify.com/album/6ZNetkvZd0EsHIqYxCRMQA ("Beethoven: Egmont Overture; Symphony No.9", BPh / Fricsay, Seefried, Forrester, Haefliger, Fischer-Dieskau, St. Hedwig; 1958) | embed page | VERIFIED |
| Painting artist / title | Philipp Otto Runge, *Morning (The Small Morning)* | Philipp Otto Runge. Museum title: **Der Morgen (erste Fassung)**, commonly called *Der kleine Morgen* (*The Small Morning*). The museum record (HK-1016) could not be opened because of a bot check; the title comes from the record's URL and the Kunsthalle's own texts | https://online-sammlung.hamburger-kunsthalle.de/de/objekt/HK-1016/der-morgen-erste-fassung | OK (exact museum wording partly UNVERIFIED) |
| Painting year | 1808 | 1808 | same ; https://de.wikipedia.org/wiki/Der_Morgen_(Gem%C3%A4lde) | OK |
| Painting collection | Hamburger Kunsthalle, Hamburg | Hamburger Kunsthalle, inv. HK-1016, oil on canvas, 109 × 85.5 cm. Do not confuse with *Der große Morgen* (HK-1022, 1809–10, fragmentary) | same | OK |
| Public domain / image | – | PD (Runge died 1810). The Kunsthalle's download licence could not be checked: UNVERIFIED. Commons PD gallery photo 3485×4405: https://commons.wikimedia.org/wiki/File:1808_Runge_Der_Morgen_anagoria.JPG. Alternative 3650×4633 is **CC BY 4.0** and needs attribution: https://commons.wikimedia.org/wiki/File:Hamburg,_Kunsthalle,_Philipp_Otto_Runge,_der_Morgen.jpg | commons | Partly UNVERIFIED |

**Metadata note (Karajan, Spotify 1xrU…):** in Spotify's data, the titles of tracks 3 and 4 appear swapped:
- Track 3 is labelled "IVa. Presto" but runs 16:30, so it is really the Adagio.
- Track 4 is labelled "III. Adagio" but runs 6:26, so it is really IVa.

Check the order in the app before linking to individual tracks. The same 1962 Ninth also appears, with correct titles, in *Originals Beethoven Box*: https://open.spotify.com/album/1kiYP14ax8HLDP9lkwdPwb.

**Source error (DG page):** DG product page 4125 lists "Christa Rössel-Majdan" and "Gottlob Frick". Discogs and Apple both give Hilde Rössel-Majdan and Walter Berry. Do not copy the DG page.

### Corrected yaml

```yaml
reference_recording:
  conductor: Herbert von Karajan
  orchestra: Berliner Philharmoniker
  chorus: Wiener Singverein (chorus master Reinhold Schmid)
  soloists:
    - Gundula Janowitz (soprano)
    - Hilde Rössel-Majdan (contralto)
    - Waldemar Kmentt (tenor)
    - Walter Berry (bass)
  label: Deutsche Grammophon
  catalogue_number: 447 401-2 (Originals CD)
  recorded: 1962-10, Jesus-Christus-Kirche, Berlin
  year: 1963
  spotify_url: https://open.spotify.com/album/1xrUldRtz5tcUQ6KrIOS2e
also_recommended:
  - conductor: Ferenc Fricsay
    orchestra: Berliner Philharmoniker
    chorus: Chor der St. Hedwigs-Kathedrale Berlin (chorus master Karl Forster)
    soloists:
      - Irmgard Seefried (soprano)
      - Maureen Forrester (contralto)
      - Ernst Haefliger (tenor)
      - Dietrich Fischer-Dieskau (baritone)
    label: Deutsche Grammophon
    catalogue_number: 463 626-2 (CD)
    recorded: 1957-12, 1958-01 & 1958-04, Jesus-Christus-Kirche, Berlin
    year: 1958
    spotify_url: https://open.spotify.com/album/6ZNetkvZd0EsHIqYxCRMQA
painting:
  artist: Philipp Otto Runge
  title: Der Morgen (erste Fassung) / "The Small Morning" (Der kleine Morgen)
  year: 1808
  collection: Hamburger Kunsthalle, Hamburg (HK-1016)
  museum_url: https://online-sammlung.hamburger-kunsthalle.de/de/objekt/HK-1016/der-morgen-erste-fassung
  image_url: https://commons.wikimedia.org/wiki/File:1808_Runge_Der_Morgen_anagoria.JPG
```

### Durations: Karajan 1962 (sources: Spotify 1xrUldRtz5tcUQ6KrIOS2e; Apple Music Classical album 1575697279)

| Mvt | File | Spotify | Apple | Status |
| --- | --- | --- | --- | --- |
| I | ≈ 15:30 | 15:29 | 15:30 | OK |
| II | ≈ 11:00 | 11:04 | 11:01 | OK |
| III | ≈ 16:30 | 16:30 | 16:26 | OK |
| IV (IVa + IVb) | ≈ 24:00 | 6:26 + 17:35 = 24:01 | 6:23 + 17:42 = 24:05 | OK |
| Total | 67 min | ≈ 67:04 | ≈ 67:02 | OK |

The finale is split into two tracks: IVa runs through the instrumental opening, and IVb starts at "O Freunde". Finale listening-stop times need to be either totals for the whole movement or offsets within each track. For comparison, Fricsay runs 16:41 / 10:31 / 18:00 / 6:13 + 17:00.

---

## 4. Schubert – Symphony No. 8 in B minor, D. 759 "Unfinished"

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ref. conductor / orchestra | Günter Wand / Berliner Philharmoniker | Same | https://www.discogs.com/release/11319053 | OK |
| Ref. label | RCA Red Seal | RCA Victor Red Seal / BMG Classics 09026 68314 2 (*Symphonies Nos. 8 & 9*). Japan: BVCC-8120~21 | https://www.discogs.com/release/11319053 ; https://www.discogs.com/release/32267316 | OK |
| Ref. year | 1995 | Booklet: "Recorded Live March 28/29, 1995, Philharmonie Berlin"; ℗/© 1995. Engineer Christian Feldgen, supervisor Gerald Götze | same | OK. Apple says "recorded December 2, 1994" and Spotify gives release date 1994-12-05; both disagree with the booklet, so treat them as distributor metadata |
| Ref. Spotify | null | https://open.spotify.com/album/1zEbPxFC7m0Wj8ePFMkP8W ("Schubert: Symphonies 8 and 9", Wand / Berliner Philharmoniker) | embed page | VERIFIED |
| Alt. Kleiber / Wiener Philharmoniker | DG, 1979 | DG LP 2531 124 (1979); CD 415 601-2 (1984). Recorded 11–15 Sep 1978, Großer Saal, Musikverein, Vienna. Coupled with Symphony No. 3 | https://en.wikipedia.org/wiki/Carlos_Kleiber_discography ; https://www.discogs.com/release/10460966 | OK (year = release year; recorded 1978) |
| Alt. Spotify | null | https://open.spotify.com/album/2RF2WYWqoaiZzLewXG6Fe6 ("Schubert: Symphonies Nos.3 & 8 'Unfinished'", WPh / Kleiber, Spotify date 1997) | embed page | VERIFIED |
| Painting artist / title | Caspar David Friedrich, *The Abbey in the Oakwood* | Museum title: **Abtei im Eichwald** (English: *The Abbey in the Oakwood*) | https://smb.museum-digital.de/object/144605 ; https://id.smb.museum/object/968249 | OK |
| Painting year | 1809–1810 | 1809–1810 | same | OK |
| Painting collection | Alte Nationalgalerie, Berlin | Alte Nationalgalerie, Staatliche Museen zu Berlin, inv. NG 8/85, oil on canvas, 110.4 × 171 cm. Hung as a pair with *Der Mönch am Meer* | same | OK |
| Public domain / image | – | Work is PD (artist died 1840). **The museum's own photo is CC BY-NC-SA** (photo Andres Kilger), so it is not suitable for commercial use. Commons PD-Art: https://commons.wikimedia.org/wiki/File:Caspar_David_Friedrich_-_Abtei_im_Eichwald_-_Google_Art_Project.jpg (4000×2563). A CC0 5138×3499 file also exists: https://commons.wikimedia.org/wiki/File:Abtei_im_Eichwald-_(Caspar_David_Friedrich)-WUS03167.jpg | commons | OK (flag the SMB licence) |

Not to be confused with Wand's other Unfinished recordings on Spotify: Munich Philharmonic (album 7nzyh0pqN6GAzLRqqU5m71) and Cologne Radio Symphony.

### Corrected yaml

```yaml
reference_recording:
  conductor: Günter Wand
  orchestra: Berliner Philharmoniker
  label: RCA Victor Red Seal (BMG Classics)
  catalogue_number: 09026 68314 2
  recorded: 1995-03-28/29 (live), Philharmonie, Berlin
  year: 1995
  spotify_url: https://open.spotify.com/album/1zEbPxFC7m0Wj8ePFMkP8W
also_recommended:
  - conductor: Carlos Kleiber
    orchestra: Wiener Philharmoniker
    label: Deutsche Grammophon
    catalogue_number: 2531 124 (LP); 415 601-2 (CD)
    recorded: 1978-09-11/15, Musikverein, Vienna
    year: 1979
    spotify_url: https://open.spotify.com/album/2RF2WYWqoaiZzLewXG6Fe6
painting:
  artist: Caspar David Friedrich
  title: The Abbey in the Oakwood (Abtei im Eichwald)
  year: 1809–1810
  collection: Alte Nationalgalerie, Staatliche Museen zu Berlin (NG 8/85)
  museum_url: https://id.smb.museum/object/968249
  image_url: https://commons.wikimedia.org/wiki/File:Caspar_David_Friedrich_-_Abtei_im_Eichwald_-_Google_Art_Project.jpg
```

### Durations: Wand / BPh (sources: Spotify 1zEbPxFC7m0Wj8ePFMkP8W; Apple Music album 403107954)

| Mvt | File | Spotify | Apple | Status |
| --- | --- | --- | --- | --- |
| I Allegro moderato | ≈ 15:00 | 15:26 | 15:25 | CORRECTED → 15:26 |
| II Andante con moto | ≈ 12:00 | 12:45 | 12:44 | CORRECTED → 12:45 |
| Total | 27 min | 28:11 | 28:09 | CORRECTED → `duration_min: 28` |

Re-check listening stops in II especially, since the file is 45 s short there. For comparison, Kleiber runs 14:06 / 10:42.

---

## 5. Berlioz – Symphonie fantastique, Op. 14

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ref. conductor / orchestra | Sir Colin Davis / Royal Concertgebouw Orchestra | Same (credited at the time as Concertgebouw Orchestra, Amsterdam). Davis also recorded the work with the LSO (1963, 2000) and the VPO (1990), so specify the Concertgebouw version | https://www.discogs.com/release/14080976 | OK |
| Ref. label | Philips | Philips LP 6500 774 (1974). CD 464 692-2 (2001, 96/24 remaster); now distributed by Decca | https://www.discogs.com/release/10065415 ; https://www.discogs.com/release/14080976 ; https://www.prestomusic.com/classical/products/7927487--berlioz-symphonie-fantastique-op-14 | OK |
| Ref. year | 1974 | Recorded January 1974, Concertgebouw, Amsterdam; ℗ 1974. One web source gives 10 Jan 1974: UNVERIFIED | https://www.discogs.com/release/14080976 | OK |
| Ref. Spotify | null | https://open.spotify.com/album/28YsKbzTM2Sa8A7hcoT2D0 ("Berlioz: Symphonie Fantastique", Royal Concertgebouw Orchestra / Sir Colin Davis, coupled with Haydn Symphony No. 94; Spotify date 2012) | embed page | VERIFIED |
| Alt. Gardiner / Orchestre Révolutionnaire et Romantique | Philips, 1993 | Philips 434 402-2. Recorded September 1991, Ancien Conservatoire (Salle du Conservatoire), Paris, the hall of the 1830 premiere; ℗ 1993 | https://www.discogs.com/release/10715076 ; https://www.discogs.com/release/4810948 | OK (year = release year; recorded 1991) |
| Alt. Spotify | null | https://open.spotify.com/album/0NbwU9876DOibCxRopIVlu ("Berlioz: Symphonie fantastique", ORR / Gardiner, 1993) | embed page | VERIFIED |
| Painting artist / title | Francisco Goya, *Witches' Sabbath (The Great He-Goat)* | Museum's English title: **Witches' Sabbath, or the Great He-Goat** (Spanish: *El Aquelarre, o Gran cabrón*). One of the Black Paintings | https://www.museodelprado.es/en/the-collection/art-work/witches-sabbath-or-the-great-he-goat/09559184-cfeb-48fe-8acc-89b070b64d92 | CORRECTED (minor wording) |
| Painting year | 1820–1823 | 1820–1823 | same (from search snippet; the page itself returns 403 to automated fetches) | OK |
| Painting collection | Museo del Prado, Madrid | Museo Nacional del Prado, P000761. Oil on mural, transferred to canvas, 140.5 × 435.7 cm, Room 067. Do not confuse with the smaller *Witches' Sabbath* of 1797–98 (Museo Lázaro Galdiano) | same | OK |
| Public domain / image | – | PD (artist died 1828). The Prado has no formal open-access licence that was checked: UNVERIFIED. Commons PD: https://commons.wikimedia.org/wiki/File:Francisco_de_Goya_y_Lucientes_-_Witches%27_Sabbath_(The_Great_He-Goat).jpg (3051×966) ; larger Yorck scan 5120×1600: https://commons.wikimedia.org/wiki/File:Witches%27_Sabbath_by_Goya.jpg. Very wide (≈3.1:1), so plan the crop | commons | OK |

### Corrected yaml

```yaml
reference_recording:
  conductor: Sir Colin Davis
  orchestra: Royal Concertgebouw Orchestra
  label: Philips
  catalogue_number: 6500 774 (LP); 464 692-2 (CD)
  recorded: 1974-01, Concertgebouw, Amsterdam
  year: 1974
  spotify_url: https://open.spotify.com/album/28YsKbzTM2Sa8A7hcoT2D0
also_recommended:
  - conductor: John Eliot Gardiner
    orchestra: Orchestre Révolutionnaire et Romantique
    label: Philips
    catalogue_number: 434 402-2
    recorded: 1991-09, Ancien Conservatoire, Paris
    year: 1993
    spotify_url: https://open.spotify.com/album/0NbwU9876DOibCxRopIVlu
painting:
  artist: Francisco de Goya
  title: Witches' Sabbath, or the Great He-Goat
  year: 1820–1823
  collection: Museo Nacional del Prado, Madrid (P000761)
  museum_url: https://www.museodelprado.es/en/the-collection/art-work/witches-sabbath-or-the-great-he-goat/09559184-cfeb-48fe-8acc-89b070b64d92
  image_url: https://commons.wikimedia.org/wiki/File:Francisco_de_Goya_y_Lucientes_-_Witches%27_Sabbath_(The_Great_He-Goat).jpg
```

### Durations: Davis / RCO (source: Spotify 28YsKbzTM2Sa8A7hcoT2D0; Discogs 464 692-2 total 55:14)

| Mvt | File | Actual | Diff | Status |
| --- | --- | --- | --- | --- |
| I Rêveries – Passions | ≈ 15:00 | 15:16 | +0:16 | OK (could tighten to 15:15) |
| II Un bal | ≈ 6:15 | 6:12 | −0:03 | OK |
| III Scène aux champs | ≈ 17:00 | 17:05 | +0:05 | OK |
| IV Marche au supplice | ≈ 6:50 | 6:47 | −0:03 | OK |
| V Songe d'une nuit du sabbat | ≈ 10:00 | 9:52 | −0:08 | OK |
| Total | 55 min | 55:12 | | OK |

For comparison, Gardiner runs 13:59 / 6:06 / 16:41 / 6:42 / 9:53.

---

## Summary of open items
1. **Mozart 40:** I is 7:07, not 7:30. II is 13:25, not 13:00.
2. **Schubert 8:** I is 15:26, not 15:00. II is 12:45, not 12:00. Total becomes 28 min.
3. **Beethoven 9:** add soloists and chorus. In the Karajan Spotify album, tracks 3 and 4 have swapped titles.
4. **Painting titles:**
   - Prado: "Witches' Sabbath, or the Great He-Goat".
   - Hamburger Kunsthalle: "Der Morgen (erste Fassung)", commonly called "Der kleine Morgen". The record page could not be opened, so this wording is partly unconfirmed.
   - Tate dates the Turner "exhibited 1812".
5. **Image licences:**
   - Friedrich: the SMB museum photo is CC BY-NC-SA. Use the Commons PD or CC0 files.
   - Runge: the large Commons file is CC BY 4.0 and needs attribution. A PD photo also exists.
   - Turner: no clean open-access hi-res scan was confirmed.
6. **Unverified:**
   - Original 1963 LP catalogue number for the Karajan Ninth.
   - The exact day (10 Jan) of the Davis 1974 session.
   - Download licences at the Tate, Hamburger Kunsthalle, Prado and National Gallery.
   - Harnoncourt session date: Oct 2013 (MusicWeb) vs Dec 2012 (classiquenews).
   - Wand session date: booklet says Mar 1995; Apple/Spotify metadata say Dec 1994.
