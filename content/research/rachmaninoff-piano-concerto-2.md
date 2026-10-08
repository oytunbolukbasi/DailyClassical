# Verification: Rachmaninoff – Piano Concerto No. 2 in C minor, Op. 18

Piece id `rachmaninoff-piano-concerto-2`. Checked on 2026-10-07.
Files: `content/en/pieces/rachmaninoff-piano-concerto-2.md`, `content/tr/pieces/rachmaninoff-piano-concerto-2.md`.
Shared-file additions (paintings.yaml, glossaries, composers.yaml): `content/research/rachmaninoff-piano-concerto-2.shared.md`.

**How the checks were done** (same method as `verification-1-5.md`)
- **Spotify:** each album id was confirmed by downloading the public embed page `https://open.spotify.com/embed/album/<id>` and reading its track list (title, performer credits, duration in ms). The album page's `og:title` / `og:description` were also read. **VERIFIED** = album title, soloist, conductor, orchestra and every concerto track seen in that data.
- **Discogs:** public API `https://api.discogs.com/releases/<id>` (credits and booklet notes). Human-readable URLs below.
- **Status key:** OK = confirmed from a primary source. SECONDARY = only from a retailer, review or search snippet. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Richter / Wisłocki / Warsaw Philharmonic (DG, 1959)

### Field check

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Sviatoslav Richter / Stanisław Wisłocki / Warsaw Philharmonic Orchestra | Spotify track credits: "Sviatoslav Richter, Warsaw National Philharmonic Orchestra, Stanisław Wisłocki". DG product page: "Warsaw Philharmonic Orchestra". Original LP (Discogs 1019260): "Orkiestra Symfoniczna Filharmonii Narodowej". We use DG's English name, as in the guide example | https://open.spotify.com/embed/album/44eOy7bLDpoOZx5A9a1GEJ ; https://www.deutschegrammophon.com/en/catalogue/products/rachmaninov-tchaikovsky-piano-concertos-richter-4901 ; https://www.discogs.com/release/1019260 | OK |
| Label | Deutsche Grammophon | DG; co-production with Polskie Nagrania, Warsaw ("Aufnahme mit Polskie Nagrania, Warschau" on the 1959 sleeve) | https://www.discogs.com/release/6484253 | OK |
| Catalogue number | 138 076 SLPM (LP); 447 420-2 (CD, The Originals) | Original stereo LP: 138 076 SLPM, released Nov 1959 (sleeve dated 9/59), coupled with 6 Préludes. The Spotify album is the CD *The Originals* 447 420-2 (Rachmaninov 2 + Tchaikovsky 1), DG release date 20 Feb 1995 | https://www.discogs.com/release/6484253 ; https://www.discogs.com/release/12247485 ; DG page above | OK |
| Recorded | 26–28 April 1959 | Booklet of 447 420-2: "Recording/Aufnahme/Enregistrement: Warsaw, Philharmonie, 26.-28.4.1959" | https://www.discogs.com/release/23858300 ; https://www.discogs.com/release/12247485 | OK (some retailers say "April/May 1959"; the booklet is preferred) |
| Venue | Philharmonic Hall, Warsaw | Booklet: "Warsaw, Philharmonie" (the Filharmonia Narodowa hall) | same | OK |
| Release year / year | 1959 | LP released November 1959 (Discogs 6484253); ℗ 1959 Polydor International on the CD | same | OK |
| Producers / engineers (not in yaml) | – | Producers Hans Weber, Otto Ernst Wohlert; balance engineers Heinz Wildhagen, Günter Hermanns; executive producer Elsa Schiller | https://www.discogs.com/release/12247485 | OK |
| Award (not in guide) | – | Discogs release notes: Grand Prix International du Disque 1960. User-contributed note, not used in the guide | https://www.discogs.com/release/12247485 | SECONDARY |
| Spotify | https://open.spotify.com/album/44eOy7bLDpoOZx5A9a1GEJ | "Rachmaninov: Piano Concerto No.2 / Tchaikovsky: Piano Concerto No.1", Sviatoslav Richter, album, 1995, 6 tracks. Tracks 1–3 = Rachmaninov 2 (Richter / Warsaw / Wisłocki); tracks 4–6 = Tchaikovsky 1 (Richter / Wiener Symphoniker / Karajan, rec. 24–26 Sept 1962) | embed page | VERIFIED |

### Durations (source: Spotify embed, album 44eOy7bLDpoOZx5A9a1GEJ)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 1 | I. Moderato | 673000 | 11:13 |
| 2 | II. Adagio sostenuto | 714000 | 11:54 |
| 3 | III. Allegro scherzando | 699000 | 11:39 |
| | Total | 2086000 | 34:46 → `duration_min: 35` |

HighResAudio's listing of the same album gives 11:10 / 11:55 / 11:42 (a different master or rounding); the guide uses the Spotify times. https://www.highresaudio.com/album/view/resun8/sviatoslav-richter-rachmaninov-piano-concerto-no-2-tchaikovsky-piano-concerto-no-1

---

## 2. Also recommended

### 2a. Zimerman / Ozawa / Boston Symphony Orchestra (DG)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Krystian Zimerman / Seiji Ozawa / Boston Symphony Orchestra | Same (Spotify credits and DG) | https://open.spotify.com/embed/album/1KVlcpGfBaYoRTYKz8X5qY ; https://www.deutschegrammophon.com/de/katalog/produkte/rachmaninov-piano-concertos-1-2-zimermanozawa-7571 | OK |
| Label / catalogue | Deutsche Grammophon, 459 643-2 | DG, 459 643-2 (UPC 0028945964324). Apple Music footer: "℗ 2003 Deutsche Grammophon GmbH, Berlin" | DG page above ; https://music.apple.com/us/album/1440723250 | OK |
| Release year | 2003 | ℗ 2003 (Apple Music, Spotify "2003"). DG's German catalogue page gives 2 Jan 2004 as its release date; a 2016 reissue page exists too | same | OK (℗ year used) |
| Recorded | "2000" | Reviews summarised by search: Concerto No. 1 recorded 1997, No. 2 in 2000. A search snippet gave "4 December 2000, Symphony Hall"; an archive.org upload description says "recorded December 2000"; another snippet said November 2000 | https://www.classicstoday.com/review/review-10097 ; https://gramophone.co.uk/review/rachmaninov-piano-concertos-nos-1-and-2-0 (both blocked to the fetcher) | Year SECONDARY; month UNVERIFIED, so only the year is in the file |
| Venue | Symphony Hall, Boston | Search snippet only; booklet not seen | – | UNVERIFIED (check the booklet or Presto https://www.prestomusic.com/classical/products/7924303--rachmaninov-piano-concertos-nos-1-2) |
| Spotify | https://open.spotify.com/album/1KVlcpGfBaYoRTYKz8X5qY | "Rachmaninov: Piano Concertos Nos. 1 & 2", album, 2003, 6 tracks; tracks 4–6 = Concerto No. 2: 11:46 / 12:15 / 11:34 | embed page | VERIFIED |

A second Spotify edition of the same recording exists with identical durations: https://open.spotify.com/album/68r68WrB1UfNFbsn9WeR5x (older track-title style). Use the first.

### 2b. Ashkenazy / Previn / London Symphony Orchestra (Decca)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Vladimir Ashkenazy / André Previn / London Symphony Orchestra | Same | https://www.discogs.com/release/3798912 ; Spotify embed | OK |
| Label / catalogue | Decca, SXL 6554 (LP, with Concerto No. 1) | Decca SXL 6554, *Piano Concertos Nos. 1 and 2*, UK 1972 (℗ 1972). Producers Ray Minshull (No. 1) and Christopher Raeburn (No. 2), engineer Kenneth Wilkinson. Also issued in the box SXLF 6565-7 | https://www.discogs.com/release/3798912 | OK |
| Recorded | October 1970 | Sleeve: "No.2, recorded October 1970". A search snippet gives sessions on 23 Oct 1970 and 30 Mar 1971 | same | OK (month from sleeve) |
| Venue | Kingsway Hall, London | Search snippets only; not on the Discogs page | – | UNVERIFIED |
| Spotify | https://open.spotify.com/album/3LTVA25MzhU8ZR4evxxGMR | "Rachmaninov: Piano Concertos Nos. 1-4", compilation, 1972, 12 tracks; Concerto No. 2 = 11:06 / 11:53 / 11:34, credited Ashkenazy / LSO / Previn | embed page | VERIFIED (Decca's own compilation, not a standalone album; no standalone Concerto 2 album id was found) |

Not used: Rachmaninoff's own 1929 recording (Stokowski / Philadelphia, RCA). On Spotify it appears only in third-party reissues (e.g. 3lBtQKO6qNcANSdgIh1DsB, label "Alexandre Bak"), so no official album could be linked.

---

## 3. Painting: Isaac Levitan, *Lake* ("Lake. Russia"), 1899–1900

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Isaac Levitan (1860–1900) | https://rusmuseumvrm.ru/data/collections/painting/19_20/zh_4262/index.php?lang=en | OK |
| Title | Museum: "Lake" (Озеро). Traditional full title "Озеро. Русь" ("Lake. Russia" / "Lake. Rus'"), used on the Commons file and in Wikidata (Q4332076, en label "Lake. Russia"). The guide uses "Lake. Russia" (TR "Göl. Rusya") | museum page ; https://www.wikidata.org/wiki/Q4332076 | OK |
| Date | 1899–1900 | museum page | OK |
| Medium / size | Oil on canvas, 149 × 208 cm | museum page | OK |
| Collection | State Russian Museum, St Petersburg, inv. Ж-4262; acquired 1901 from Levitan's posthumous exhibition | museum page | OK |
| "Last large canvas" (pairing note) | Museum: "This final work represents the culmination of Levitan's extended study of Russian landscapes"; left unfinished at his death (Aug 1900) | museum page | OK |
| Rights | Artist died 1900: public domain everywhere. Commons tag {{PD-Art\|PD-old-auto-expired\|deathyear=1900}} | https://commons.wikimedia.org/wiki/File:Levitan_ozero28.JPG | OK |
| Image | 2000 × 1403 px JPEG (650 KB). Source given on Commons: a LiveJournal scan (lj.rossia.org), not a museum file. Clean, no frame, no halftone visible at 100 % | same | OK, modest resolution |
| Alternatives | Gallery photo 4032 × 3024, CC BY-SA 4.0, frame and wall visible: File:The_Lake_by_Isaac_Levitan_in_the_State_Russian_Museum_IMG_4838.jpg. The Russian Museum offers no open-access download that we found | https://commons.wikimedia.org/wiki/File:The_Lake_by_Isaac_Levitan_in_the_State_Russian_Museum_IMG_4838.jpg | Not used |

**Why this painting.** Painted in the same months (1899–1900) that Rachmaninoff was treated by Dahl and began the concerto, it is a broad, bright Russian landscape, the opposite of the dark C minor opening and close to the C major of the finale. Levitan also painted the Tchaikovsky 6 pairing (*Above Eternal Peace*); this is a different painting, not a reuse.

Candidates considered and rejected: Mikhail Vrubel, *Lilacs* (1900, Tretyakov), a strong link (lilacs, Rachmaninoff's song *Lilacs*, Op. 21 No. 5) but the only Commons file (File:Vrubel_Siren.jpg, 2229 × 2025) is a halftone book scan; Levitan, *Evening Bells* (1892, Tretyakov, File:1892_Levitan_Abendglocken_anagoria.JPG, 2944 × 2264, PD), a good "bells" link but further from the concerto's years.

---

## 4. Facts in "The big picture" and the movement texts

| Claim | Source URL | Status |
| --- | --- | --- |
| First Symphony premiered March 1897 (28 March N.S.), conducted by Glazunov; César Cui's hostile review; three years of depression and near silence | https://en.wikipedia.org/wiki/Sergei_Rachmaninoff | OK |
| Rachmaninoff was 23 at that premiere (born 1 April 1873) | same | OK |
| Treatment with Nikolai Dahl, January–April 1900, near-daily sessions including hypnotherapy | https://en.wikipedia.org/wiki/Piano_Concerto_No._2_(Rachmaninoff) | OK |
| Composed June 1900 – April 1901; movements II and III first, partly in Italy; I completed in April 1901 | same | OK |
| Dedicated to Dahl | same ; https://www.theford.com/musicdb/pieces/4944/piano-concerto-no-2 | OK |
| Movements II–III first played 15 Dec 1900 [O.S. 2 Dec], Moscow (Nobility Hall), Rachmaninoff soloist, Siloti conducting | Wikipedia (concerto) | OK |
| Complete premiere 9 Nov 1901 [O.S. 27 Oct], Moscow Philharmonic Society, Rachmaninoff soloist, Siloti conducting | same | OK |
| Siloti was Rachmaninoff's cousin | https://en.wikipedia.org/wiki/Alexander_Siloti | OK (standard; not re-fetched in this session) |
| *Brief Encounter* (1945) uses the concerto; "Full Moon and Empty Arms" from III Theme 2; "All by Myself" from II | Wikipedia (concerto) | OK |
| Opening: eight bars of bell-like piano chords | https://www.theford.com/musicdb/pieces/4944/piano-concerto-no-2 ; https://thelistenersclub.com/2024/08/21/rachmaninovs-second-piano-concerto-a-musical-affirmation/ | OK |
| I: Theme 1 in strings and clarinet (violins, violas, first clarinet) with piano arpeggios; Theme 2 in E-flat major, first stated by the solo piano | Wikipedia (concerto) | OK |
| I: no cadenza | Ford/Hollywood Bowl note: "the notable absence of a cadenza for the soloist" | OK |
| I: recapitulation as a march, *Maestoso (alla marcia)*, piano chords against the orchestra's Theme 1 | Ford note ("the piano thunders rhythmic chords over the main theme"); Listeners' Club; marking from the score | OK |
| I: after the march, a quiet horn solo with Theme 2 | Search summary of analyses ("concludes with an eerie horn solo"); that the horn plays Theme 2 is from the score and should be confirmed by ear | PARTLY VERIFIED |
| Metres: I 2/2, II 4/4, III 2/2 | https://enc.piano.or.jp/en/musics/338 (via search summary) | SECONDARY |
| II: opens with muted string chords moving from C minor to E major; flute then clarinet introduce the theme over piano arpeggios; piano cadenza near the climax; ends in E major | Wikipedia (concerto) ; Listeners' Club | OK |
| II: middle section voices bassoon, horn, viola | Listeners' Club | OK |
| III: E major → C minor → C major; Theme 2 in B-flat major on oboe and violas; brief fugue/fugato in the development; Theme 2 as the C major climax | Wikipedia (concerto) ; Listeners' Club | OK |
| *The Bells* (1913), choral symphony | https://en.wikipedia.org/wiki/The_Bells_(Rachmaninoff) | OK (standard; not re-fetched) |
| Richter's US debut 15 Oct 1960 (Chicago), so the April 1959 recording is "a year and a half before his first concerts in the United States" | https://en.wikipedia.org/wiki/Sviatoslav_Richter | OK |

Not used, on purpose: the exact words Dahl is said to have repeated to Rachmaninoff ("You will start to write your concerto…"). They come from Rachmaninoff's own later recollections (Riesemann, 1934) and are often embellished.

---

## 5. Re-time needed (all stops are ≈, derived from track lengths and the published structure; nobody has listened against the Richter tracks yet)

Reference: Richter / Wisłocki, Spotify `44eOy7bLDpoOZx5A9a1GEJ`. Add these rows to `content/research/retime-needed.md` when the shared files are merged.

| Mvt | Track length | Stops to re-time by ear | Least certain |
| --- | --- | --- | --- |
| I Moderato | 11:13 | 0:00, 0:40, 1:40–2:20, 2:20, 3:00–4:30, 4:30, Mid-development, 6:45–7:30, 8:30, Near the end | Start of the development (≈ 4:30), the march (≈ 6:45–7:30) and the horn solo (≈ 8:30). Confirm that the horn really carries Theme 2 |
| II Adagio sostenuto | 11:54 | 0:00, 0:30, 0:50, 1:30, 2:45, 4:30–6:30, 7:00–8:00, 8:30, Last minute | Piano takes the theme (≈ 2:45), the Più animato section, the climax and cadenza (≈ 7:00–8:00) |
| III Allegro scherzando | 11:39 | 0:00, 0:30, 0:50, 2:00, 2:45, 4:00–6:00, 7:00–8:00, 9:30, 10:15–10:45, Last 40 seconds | Fugato position inside ≈ 4:00–6:00, return of Theme 2 (≈ 7:00–8:00), the Maestoso climax (≈ 10:15–10:45) |

---

## 6. Composer: Sergei Rachmaninoff (new entry, id `rachmaninoff`)

| Fact | Source URL | Status |
| --- | --- | --- |
| Born 1 April 1873 [O.S. 20 March], Semyonovo estate, Novgorod Governorate (he himself later named Oneg; sources disagree, so the sheet says only "Novgorod Governorate") | https://en.wikipedia.org/wiki/Sergei_Rachmaninoff | OK |
| Father's debts: the last estate (Oneg) auctioned in 1882; family moved to St Petersburg; studied at the St Petersburg Conservatory from 1883 | same | OK |
| Moved in with Nikolai Zverev in Moscow in autumn 1885 (aged 12) and stayed almost four years | same | OK |
| Graduated Moscow Conservatory 1892 with the Great Gold Medal; *Aleko* (graduation opera) praised by Tchaikovsky; Prelude in C-sharp minor (1892) | same | OK |
| Married Natalia Satina, his cousin, 1902 | same | OK |
| Conductor at the Bolshoi Theatre 1904–1906; Dresden 1906–1909; Second Symphony | same | OK |
| First US tour 1909–10; Third Concerto written for it | same | OK |
| Left Russia 22 Dec 1917, never returned; arrived New York 12 Nov 1918; career as a concert pianist | same | OK |
| Villa Senar on Lake Lucerne (summers 1932–39); *Rhapsody on a Theme of Paganini* 1934; *Symphonic Dances* 1940 (last work) | same | OK |
| Died 28 March 1943, Beverly Hills (melanoma), four days before his 70th birthday | same | OK |
| Three symphonies, four piano concertos | same | OK |

**Portrait.** Bain News Service photograph, Library of Congress, George Grantham Bain Collection (id `ggbain.30160`), restored and cropped on Commons, a Commons Featured Picture.

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| File | File:Sergei_Rachmaninoff_LOC_30160_cropped.jpg, 2480 × 3062 px | https://commons.wikimedia.org/wiki/File:Sergei_Rachmaninoff_LOC_30160_cropped.jpg | OK |
| Licence | {{PD-Bain}} + {{PD-old}}; LOC: no known restrictions on publication | same ; http://hdl.loc.gov/loc.pnp/ggbain.30160 | OK |
| Date | Not recorded by LOC or Commons. The sheet says "c. 1920": an estimate from the Bain (New York) source and his apparent age, after he settled in the US in Nov 1918 | – | ESTIMATED, flag if a date label is not acceptable |
| focal_y | 0.15 (face at about 20 % from the top of the cropped file) | visual check of the thumbnail | OK |

Rejected: File:Sergei_Rachmaninoff_LOC_33968.jpg (2500 × 3824, PD-Bain) is dated "1900" on Commons, which is clearly wrong (it shows him in middle age on a ship's deck); not used because of the bad date.



## 7. Painting replaced (2026-10-08)

Levitan's *Lake. Russia* was replaced, with the product owner's approval, because its only open
image is a 2000 × 1403 scan and Levitan already pairs with Tchaikovsky 6.

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Arkhyp Kuindzhi (Arkhip Ivanovich Kuindzhi), Ukrainian, born Mariupol 1841, died St Petersburg 1910 | Met collection API, object 436833 | VERIFIED |
| Title | *Red Sunset* (the Met added "on the Dnepr" on acquisition; it now uses "Red Sunset") | same; https://en.wikipedia.org/wiki/Red_Sunset_on_the_Dnipro | VERIFIED |
| Date | 1905–8 | Met | VERIFIED |
| Medium, size | Oil on canvas, 134.6 × 188 cm | Met | VERIFIED |
| Collection | The Metropolitan Museum of Art, New York, Rogers Fund, 1974, accession 1974.100 | Met | VERIFIED |
| Image | Met Open Access DT2557, 3811 × 2764, CC0 (isPublicDomain: true); same file on Commons: File:Red_Sunset_on_the_Dnieper_MET_DT2557.jpg | https://www.metmuseum.org/art/collection/search/436833 | VERIFIED |
| Pairing | No historical link to the concerto is claimed; painted a few years later, chosen for the mood (red light breaking over a dark river) | – | – |
