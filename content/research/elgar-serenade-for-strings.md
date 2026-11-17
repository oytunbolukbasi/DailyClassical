# Verification: Elgar – Serenade for Strings in E minor, Op. 20

Piece id `elgar-serenade-for-strings`. Checked on 2026-11-17 (batch 2026-11, group J).
Files: `content/drafts/en/elgar-serenade-for-strings.md`, `content/drafts/tr/elgar-serenade-for-strings.md`.
Shared-file additions (paintings.yaml; no new glossary terms; composer exists): `content/research/elgar-serenade-for-strings.shared.md`.

**How the checks were done**
- **Spotify:** album ids confirmed from the public embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__` JSON: title, credits, `duration` in ms, `isPlayable`), fetched from a Turkish network on 2026-11-17. The reference album id was taken from the Warner Classics release page, which links it.
- **Discogs:** public API `https://api.discogs.com/releases/<id>`.
- **Status key:** OK = primary source. SECONDARY = retailer, review or search snippet only. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Barbirolli / Sinfonia of London (HMV, rec. 1962, LP 1963)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Conductor / orchestra | Sir John Barbirolli / Sinfonia of London | Spotify credits on tracks 4–6: "Edward Elgar, Sir John Barbirolli, Sinfonia Of London" (the Allegri String Quartet is credited only on the *Introduction and Allegro*, tracks 1–3) | https://open.spotify.com/embed/album/2pS2J5uHihljcuevwgEhB0 | OK |
| Label / catalogue | HMV (EMI); now Warner Classics; ASD 521 | Discogs 5234145: *Barbirolli Conducts English String Music*, His Master's Voice ASD 521, UK 1963, "℗ 1963 EMI Records Ltd."; A1 *Introduction and Allegro*, A2 Serenade, B1 Tallis Fantasia, B2 Greensleeves; orchestra Sinfonia of London, Allegri String Quartet on A1 only; liner notes Burnett James. CD: Angel/EMI CDC 7 47537 2 (1986, Discogs 8170956) | https://www.discogs.com/release/5234145 ; https://www.discogs.com/release/8170956 | OK |
| Recorded | 10–11 May 1962 | Warner/Tower "Sir John Barbirolli – The Complete Warner Recordings" track list (CD 19): "弦楽セレナード ホ短調 Op. 20 / 序奏とアレグロ Op. 47* – Recording: May 10 & 11, 1962, Stereo – Sinfonia of London" | https://cdfront.tower.jp/~/media/Files/Tol/classic/Barbirolli-BOX.pdf?la=ja-JP | OK |
| Venue | Kingsway Hall, London | Presto (via search summary): "10 & 11 May 1962, Kingsway Hall, London" (Tallis Fantasia: 17 May 1962, Temple Church). The 1986 CD credits a photograph "Recording Session Kingsway Hall London" (Godfrey MacDomnic) | Presto https://www.prestomusic.com/classical/products/8001838--english-string-music (403 to the fetcher) ; Discogs 8170956 | SECONDARY (comment in the yaml) |
| Release year / year | 1963 / 1962 | LP ℗ 1963; recorded 1962 | above | OK |
| Spotify album | https://open.spotify.com/album/2pS2J5uHihljcuevwgEhB0 | "English String Music. Elgar: Introduction and Allegro & Serenade - Vaughan Williams: Greensleeves & Tallis Fantasias", Warner Classics, 5 March 2021 (Warner page), 9 tracks; linked from the Warner Classics release page | https://www.warnerclassics.com/release/english-string-music-barbirolli | VERIFIED |
| Sinfonia of London (In this recording) | founded 1955 to record film music; *Vertigo* soundtrack 1958 | Wikipedia: "founded in 1955 by Gordon Walker specifically for the recording of film music … the 1958 soundtrack for the Alfred Hitchcock thriller Vertigo"; the 1963 Barbirolli Elgar/Vaughan Williams LP among its best-known recordings; Warner: "exceptionally not recorded with the Hallé but with the Sinfonia of London" | https://en.wikipedia.org/wiki/Sinfonia_of_London ; Warner page | OK |

### Durations (Spotify embed, album 2pS2J5uHihljcuevwgEhB0, all `isPlayable: true`)

| Track | Movement | ms | Time |
| --- | --- | --- | --- |
| 4 | I. Allegro piacevole | 238600 | 3:59 |
| 5 | II. Larghetto | 359306 | 5:59 |
| 6 | III. Allegretto – Come prima | 197933 | 3:18 |
| | Total | 795839 | 13:16 → `duration_min: 13` |

Other tracks on the album (not used): 1–3 *Introduction and Allegro* (3:14 / 3:38 / 7:09), 7 Tallis Fantasia 16:18, 8 Greensleeves 4:39, 9 *Elegy* (Hallé) 4:03. All `isPlayable: true`.

"Barbirolli's tempos are broad … many performances take about three and a half": Davis/Philharmonia 3:25 (below); Beecham/RPO 1954 plays the whole Serenade as one track (13:30), so not comparable. Kept deliberately vague ("many performances"); Wikipedia gives 12–13 minutes for the whole work.

## 2. Also recommended: Philharmonia Orchestra / Sir Andrew Davis (Onyx, 2007)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Sir Andrew Davis / Philharmonia Orchestra | Spotify credits "Edward Elgar, James Ehnes, Andrew Davis, Philharmonia Orchestra" on all six tracks (Ehnes plays only in the concerto) | https://open.spotify.com/embed/album/1tsCrkL0ZVnE24MWv7KjOP | OK |
| Label / catalogue | Onyx, ONYX 4025 | Discogs 8729966: "Violin Concerto • Serenade For Strings", Onyx ONYX 4025, 2007, "Ⓟ & © 2007 Philharmonia Orchestra"; producer Misha Donat, engineer Mike Hatch | https://www.discogs.com/release/8729966 | OK |
| Recorded / venue | 17 and 20 May 2007, Queen Elizabeth Hall, London | MusicWeb International review header: "rec. live Queen Elizabeth Hall, London 17, 20 May 2007" (one header for the whole disc) | https://musicweb-international.com/classrev/2007/Dec07/Elgar_Ehnes_onyx4025.htm | SECONDARY |
| Spotify | 1tsCrkL0ZVnE24MWv7KjOP | "Elgar: Violin Concerto etc", 6 tracks; Serenade = tracks 4–6: 3:25 (205480) / 5:42 (341906) / 3:08 (188093), all `isPlayable: true`. Found via the MusicBrainz release's Spotify link | embed page | VERIFIED |

Not used: Beecham / RPO (Spotify 5oaJyVNWbUnEdAAN4OKqtH): the Serenade is a single 13:30 track.

---

## 3. Painting: Arthur Hughes, *The Long Engagement*, 1859

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | Arthur Hughes (1832–1915) | https://commons.wikimedia.org/wiki/File:LongEngagementAHughes.jpg | OK |
| Title / date | *The Long Engagement*, 1859 (Wikipedia: painted 1854–59, first titled *Orlando*; Victorian Web: 1853–55, reworked c. 1858–59). Museum: "The Long Engagement, 1859" | https://en.wikipedia.org/wiki/The_Long_Engagement ; museum page below | OK (1859 as the museum) |
| Medium / size | Oil on canvas, 105.4 × 52.1 cm | Commons {{Artwork}} | OK |
| Collection | Birmingham Museum and Art Gallery, 1902P13; bequeathed by Dr Griffiths, 1902 | https://dams.birminghammuseums.org.uk/asset-bank/action/viewAsset?id=3119 ; Wikipedia | OK |
| Subject | A curate and his fiancée in a wood; her name, Amy, carved in the tree is being overgrown by ivy; the title refers to the convention that a poorly paid curate could not marry until he had a better position | Wikipedia | OK |
| Rights | Artist died 1915: PD everywhere. Birmingham Museums Trust: "Creative Commons 0 - Public Domain. Optional attribution: Photo by Birmingham Museums Trust, licensed under CC0". Commons: {{PD-Art\|PD-old-auto-1923\|deathyear=1915}} | museum page ; Commons | OK |
| Image | Commons file 3400 × 6944 (Google Art Project, 7.4 MB); the museum's own TIFF is the same size (67.6 MB) | Commons ; museum page | OK. Tall portrait format: check the hero crop (the couple fill the middle third) |

**Pairing.** Alice Roberts's family disapproved of Elgar ("an unknown musician who worked in a shop and was a Roman Catholic"; she was disinherited; Kennedy via Wikipedia), and in 1892 he still could not support his family by composing. The painting shows the same Victorian conflict between love, class and money, in a spring wood; the Serenade was Elgar's anniversary present to Alice. Not the same people or place, but the same story of the time.

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Written March 1892 as a present to Alice for their third wedding anniversary; private performance 1892 (Worcester Ladies' Orchestral Class, composer conducting); public premiere Antwerp, 21 July 1896; first British public performances 1899 (Bath, two movements, January; York, complete, 5 April; New Brighton, 16 July, Elgar conducting) | https://en.wikipedia.org/wiki/Serenade_for_Strings_(Elgar) | OK. The guide says "spring of 1892" |
| "I like 'em (the first thing I ever did)"; first of his works he professed himself happy with | same | OK |
| Publisher's refusal: "very good", "this class of music is practically unsaleable"; published 1893 | same | OK |
| Dedicated to Edward W. Whinfield (not in the guide) | same; Henle commentary (autograph Add MS 57989: "Herrn E. W. Whinfield … freundschaftlichst zugeeignet") | OK |
| "Braut … helped a great deal to make these little tunes": autograph of the piano-duet version (British Library Add. MS 57989), upper right "Braut's | May 13: 1892", and "(Braut helped a great deal to | make these little tunes.) | signed E.E." | Henle Urtext HN 3310, critical commentary (Bemerkungen), p. 19 https://www.henle.de/media/bd/07/78/1707388573/3310_(1).pdf | OK. "Braut" = German "bride"; that it means Alice is the standard reading (the page is dated in the anniversary month) |
| Alice: daughter of Major-General Sir Henry Roberts; eight years older; piano accompaniment lessons with Elgar from autumn 1886; family disapproved (lower class, Catholic, eight years younger); disinherited (Kennedy); married 8 May 1889, Brompton Oratory | https://en.wikipedia.org/wiki/Edward_Elgar ; https://en.wikipedia.org/wiki/Caroline_Alice_Elgar | OK |
| Elgar worked in his father's music shop | Edward Elgar article (father kept a music shop in Worcester; Kennedy: "worked in a shop") | OK |
| 1891: left London for lack of work, back to Malvern (house "Forli", Malvern Link), teaching and conducting local ensembles | same two articles | OK |
| *Enigma Variations* 1899 made his name | Edward Elgar article ("In 1899, at 42 …" also in composers.yaml) | OK |
| Strings only; about 12–13 minutes; three movements | Serenade article | OK |
| I: ♩. = 96, 6/8, *piacevole* = pleasantly; cradle song (Grimley) or aubade (Kennedy); opens with a viola figure that recurs throughout; main theme from bar 3; middle section an arching melody moving briefly into the minor; coda with a new theme derived from the opening; opening returns at the quiet end | Serenade article | OK |
| I: recapitulation at bar 92 (used for the stop placement only) | Henle commentary ("die Reprise (T 92 ff.)") | OK |
| II: ♪ = 80, 2/4; brief introduction; Newman: "a long and flexible melody sung by the first violins … one of the finest and most sustained that ever came from Elgar's pen"; introductory theme returns at the end as a peroration | Serenade article | OK |
| II in C major; III begins in G major and ends in E major | Henle commentary on autograph A4 (III): "Ursprünglich endete diese Fassung in G-dur … durch eine Modulation nach E-dur und eine Rückkehr zum Material des 1. Satzes ersetzt". C major for II from the score (standard; Spotify/IMSLP listings do not give movement keys) | III OK; II key from the score, not re-checked against a printed source in this session |
| III: 12/8, ♩. = 92, changing to 6/8 when the first movement's main theme returns | Serenade article; Spotify track title "Allegretto – Come prima" | OK |

Not used: the link with the lost *Three Sketches for Strings* (1888), which Wikipedia calls conjectural.

## 5. Re-time (all stops are ≈; nobody has listened against the Barbirolli tracks)

Method: proportions of the form (Wikipedia; Henle bar 92 for the return in I) laid over Barbirolli's track lengths. Barbirolli is slower than average, so the proportions were not stretched further.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegro piacevole | 3:59 | 0:00, 0:06, 0:40–1:10, 1:15–2:20, 2:35, 3:15, Last 20 seconds | The return of the opening (≈ 2:35) and the coda (≈ 3:15); bar count of the movement not checked |
| II Larghetto | 5:59 | 0:00, 0:25, 1:30, 2:30–3:30, 3:30–4:00, 4:10, 5:00, Last 30 seconds | Climax position (≈ 3:30–4:00) and the return of the melody (≈ 4:10) |
| III Allegretto – Come prima | 3:18 | 0:00, 0:40, 1:20–2:00, 2:05, Last 40 seconds | The *Come prima* return (≈ 2:05): could be 15–20 seconds either side |
