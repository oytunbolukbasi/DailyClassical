# Verification: Smetana – String Quartet No. 1 in E minor, "From My Life"

Piece id `smetana-string-quartet-1`. Checked on 2026-11-17 (batch November 2026, group H).
Files: `content/drafts/en/smetana-string-quartet-1.md`, `content/drafts/tr/smetana-string-quartet-1.md`.
Shared-file additions: `content/research/smetana-string-quartet-1.shared.md`.

**How the checks were done**
- **Spotify:** album ids from Spotify's own web search (browser pane); each album read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`) with curl from this machine's Turkish network; album page read for ℗/©, release date and `og:restrictions:country:allowed`.
- **Discogs** public API; Supraphon's own pages (via search summary); the National Museum's Smetana catalogue (bedrichsmetana.nm.cz); IMSLP work page (API wikitext); English, Czech, Spanish and Japanese Wikipedia; programme notes (University of Sussex, Music in the Round, Interlude); Wikimedia Commons for the painting.
- Status key as in the other notes. No personal data sent; `User-Agent: DailyClassical/1.0 (+https://dailyclassical.co)`.

---

## 1. Reference recording: Pavel Haas Quartet (Supraphon, 2015)

Why this one: a Czech quartet's award-winning recording (Gramophone Award 2015, chamber; BBC Music Magazine Award 2016), one track per movement, all playable in Turkey.

| Field | Value in guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ensemble | Pavel Haas Quartet (Veronika Jarůšková, Marek Zwiebel, Pavel Nikl, Peter Jarůšek) | Embed credits: "Bedřich Smetana, Pavel Haas Quartet"; players from Discogs | https://open.spotify.com/embed/album/0dDcIutzbFgzAy5u58H9o8 ; https://www.discogs.com/release/7620458 | OK |
| Label / catalogue | Supraphon SU 4172-2 | Discogs 7620458 (CD, 2015-04); producer Matouš Vičinský, engineer Karel Soukeník, notes Marta Ottlová | https://www.discogs.com/release/7620458 | OK |
| Recorded / venue | November–December 2014, Domovina Studio, Prague | Discogs: "Recorded Nov & Dec 2014"; MusicWeb review header: "rec. Domovina Studio, Prague, 29-30 November and 6-7 December 2014" | https://www.musicweb-international.com/classrev/2015/Jul/Smetana_Quartets_SU41722.htm | OK (venue SECONDARY) |
| Release | 17 April 2015 | Spotify `music:release_date` 2015-04-17; Supraphon news page | https://www.supraphon.com/about-us/114-the-pavel-haas-quartet-recorded-smetanas-string-quartets | OK |
| Award | Gramophone Award 2015, chamber | Supraphon: https://supraphon.com/articles/10-gramophone-awards-2015 ; https://supraphon.com/about-us/134-gramophone-award-for-the-pavel-haas-quartet-s-sixth-album | label pages (via search summary) | SECONDARY |
| Spotify | https://open.spotify.com/album/0dDcIutzbFgzAy5u58H9o8 | "Smetana: String Quartets No. 1 & No. 2", 2015, 8 songs, "℗ Supraphon A.s."; TR allowed | embed + album page | VERIFIED |

### Durations and playability (embed, album 0dDcIutzbFgzAy5u58H9o8)

| Track | Movement | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 1 | I. Allegro vivo appassionato | 463546 | 7:44 | true |
| 2 | II. Allegro moderato a la polka | 343413 | 5:43 | true |
| 3 | III. Largo sostenuto | 545280 | 9:05 | true |
| 4 | IV. Vivace | 370120 | 6:10 | true |
| | Total | 1722359 | 28:42 → `duration_min: 29` | |

Tracks 5–8 (Quartet No. 2) also playable.

---

## 2. Also recommended: Smetana Quartet (Denon/Supraphon, 1976)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Ensemble | Smetana Quartet (Jiří Novák, Lubomír Kostecký, Milan Škampa, Antonín Kohout) | Discogs 8700927 | OK |
| Label / catalogue | Denon OX-7049-ND (LP, Japan, 1976-08), co-production Denon/Nippon Columbia/Supraphon, early PCM digital | https://www.discogs.com/release/8700927 | OK |
| Recorded / venue | 12–16 February 1976, Supraphon Studio, Prague | Discogs 8700927 notes | OK |
| Spotify | 4 + 4 tracks; No. 1: 7:44 / 5:36 / 8:34 / 6:10, all `isPlayable: true`; "℗ 1976 Nippon Columbia Co., Ltd./DENON"; TR allowed (titles in Japanese) | https://open.spotify.com/album/6kzrueeqtqC4Euu41JOU6F | VERIFIED |

Also checked and playable: Takács Quartet (Hyperion 2015, `2trcSVk42iQakw3dV3edVs`), Emerson String Quartet (DG 1986, `5bWvYZ5ExWB4svFGSIChzW`), Panocha Quartet (`2YzaKJdQyyd0HZ8aIyLRiF`).

---

## 3. Painting: Antonín Hudeček, *Moonscape* (*Měsíčná krajina*), 1899

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Antonín Hudeček (Czech, 1872–1941) | Commons Creator template | OK |
| Title / date | Měsíčná krajina / Moonscape (Mondlandschaft), 1899 | Commons file description | SECONDARY |
| Dimensions | 59.4 × 43.5 cm per Commons (the photo is square, 12000 × 12000: the dimensions on Commons may be inaccurate) | Commons | UNVERIFIED |
| Collection | National Gallery Prague (Veletržní palác); inventory number not given on Commons, no Wikidata item found | Commons categories | OK (collection), inventory UNVERIFIED |
| Image | File:1899 Hudeček Mondlandschaft Nationalgalerie Prag anagoria.jpg, **12000 × 12000** px, gallery photo by anagoria, no frame visible in the preview | https://commons.wikimedia.org/wiki/File:1899_Hude%C4%8Dek_Mondlandschaft_Nationalgalerie_Prag_anagoria.jpg | OK |
| Rights | `{{PD-Art|PD-old-auto-expired|deathyear=1941}}`: public domain (artist died 1941, more than 70 years); faithful photo of a 2D work | same | OK |
| Pairing | Mood: stillness and silence in a Bohemian landscape, for a quartet written after Smetana became deaf and looking back over his life. The painting is later (1899) and has no direct link to Smetana | – | Note |
| Reuse check | Not in `content/paintings.yaml`; Hudeček not used before | – | OK |

Considered and rejected: Hudeček's better-known *Evening Silence* (*Večerní ticho*, 1900, NG Prague O 8411; title fits even better) is on Commons only at 800 × 532 px; the NG Prague collection site did not answer from this machine. Worth a look if a larger scan can be found. Josef Mánes, *Josefina* (1855): a nude.

---

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| 1874: tinnitus, completely deaf by October; resigned as conductor of the Provisional Theatre after eight years | https://en.wikipedia.org/wiki/String_Quartet_No._1_(Smetana) ; Sussex programme note https://users.sussex.ac.uk/~cjd/WebProgNotes/pdfs/SmetanaFromMyLife.pdf | OK |
| Leading Czech composer of the time | General (composers.yaml bio) | SECONDARY |
| 1876 moved to Jabkenice to live with his eldest daughter | en.wikipedia ; Sussex note | OK |
| Composed in Jabkenice, autumn – 29 December 1876 | https://bedrichsmetana.nm.cz/en/work/detail/string-quartet-in-e-minor/126 ("Place of origin: Jabkenice", completed 29. 12. 1876) ; ja/es.wikipedia | OK |
| "four instruments conversing among themselves" about the things that tormented him; a private piece | es.wikipedia (Spanish translation of Smetana's words); Sussex note ("four instruments speaking among themselves in something like a friendly circle") | SECONDARY (wording) |
| Could work only about an hour at a time because of the noise in his ears | cs.wikipedia (Smetana quote) | SECONDARY |
| Letter to Josef Srb-Debrnov explaining the movements; quotations used ("the call of fate into the struggle of life", "something I could not express", warning of future misfortune, "joyful days of youth", first love "who later became my faithful wife", "struggle with an unkind fate", discovery of national elements, "little ray of hope", "little joke") | cs.wikipedia (Czech text of the letter) ; Sussex note and Music in the Round (English translations) ; es.wikipedia | OK |
| Polka: among villagers and in the salons of higher circles; passionate dancer | cs.wikipedia (letter) | OK |
| Players found it too difficult; Smetana: the gentlemen playing it think the Largo impossible to perform | ja.wikipedia ; es.wikipedia (letter quote) | SECONDARY |
| Private play-through with Dvořák on viola (1878 per en/cs/es.wikipedia; ja.wikipedia says 26 March 1879 at Srb-Debrnov's house). Guide gives no date | en/cs/es/ja.wikipedia | OK (date left out on purpose) |
| Public premiere 29 March 1879, Prague, Konvikt; Lachner, Pelikán, Krehan, Neruda | bedrichsmetana.nm.cz ; IMSLP ; en.wikipedia | OK |
| Kateřina Kolářová, first wife, died 1859 | https://interlude.hk/?p=22689 (died in Dresden, 19 April 1859) ; en.wikipedia (Largo a tribute to his first wife) | SECONDARY |
| I: sharp chord; violins alternating two notes; viola solo; after 13 bars a harsh chord of all four | cs.wikipedia ; Sussex note (viola example in 4/4) | OK |
| I: 4/4, E minor, sonata form; theme 2 in G major; recapitulation omits theme 1, starts with theme 2; ends quietly | es.wikipedia ; classicalexburns.com (ends quietly) | SECONDARY |
| II: 2/4; viola marked "quasi Tromba"; middle section: polka rhythm in viola and cello, chords in the violins; shortened return, brief reminder, forceful coda | es.wikipedia ; interlude.hk (viola "like a trumpet") | SECONDARY |
| II: F major | Standard (not in the sources above) | SECONDARY |
| III: 6/8; love song; two melodies with episodes; quiet reflective coda | es.wikipedia | SECONDARY |
| III: cello solo introduces the melody, then the first violin | audienceaccess.co programme note (via search summary: "An exquisite cello solo introduces an intensely lyrical melody played by the first violin") | SECONDARY |
| III: A-flat major | Standard | SECONDARY |
| IV: 2/4; sonata form; high sustained E (harmonic) in the first violin over tremolo in second violin and viola, after a foreign chord and a long rest; memories of the first movement; resigned close with a little hope | es.wikipedia ; cs.wikipedia ; en/ja.wikipedia | OK |
| The tinnitus was actually a high A-flat major chord | en.wikipedia ; ja.wikipedia | SECONDARY |
| Long note in the finale "grew out of" the warning at the start | cs.wikipedia (letter: "ten dlouho znějící tón ve finále povstal z tohoto počátku") ; Sussex note | OK |
| Inspired Janáček's two programmatic quartets; among the first programmatic chamber works | es.wikipedia | SECONDARY |

---

## 5. Re-time

Every stop is an estimate (≈), placed from the section structure in the sources above and the exact Pavel Haas track lengths. No bar counts were available (IMSLP scores are behind a bot check, not bypassed). Nobody has listened against these tracks.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro vivo appassionato | 7:44 | 0:00, 0:30, 1:45, 3:00, 4:45, 6:30, Last minute | Whether the exposition is repeated; development (≈ 3:00) and recapitulation (≈ 4:45) |
| II Allegro moderato à la Polka | 5:43 | 0:00, 0:40, 1:50, 3:40, 4:40, Last 30 seconds | The viola's "quasi tromba" (≈ 0:40), middle section (≈ 1:50) |
| III Largo sostenuto | 9:05 | 0:00, 0:45, 2:30, 4:00, 5:45, Last 90 seconds | Every boundary after the opening |
| IV Vivace | 6:10 | 0:00, 1:00, 2:10, 3:20, 4:25, 4:45, Last minute | The high E (≈ 4:25): find it first and move the stops around it |
