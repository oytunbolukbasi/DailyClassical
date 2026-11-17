# Verification: Beethoven – String Quartet No. 16 in F major, Op. 135

Piece id: `beethoven-string-quartet-16` (form `string-quartet`; ensemble as `orchestra: Takács Quartet`, no conductor).
Files: `content/drafts/en/beethoven-string-quartet-16.md`, `content/drafts/tr/beethoven-string-quartet-16.md`. Shared-file additions: `content/research/beethoven-string-quartet-16.shared.md`.
Checked on 2026-11-17 (batch November 2026, group A). Score: Craig Sapp's Humdrum encoding, https://github.com/craigsapp/beethoven-string-quartets (`kern/quartet16-1.krn` … `-4.krn`: bar numbers, metres, key signatures, repeat structure). Status key: VERIFIED / SECONDARY / INFERRED.

---

## 1. Reference recording: Takács Quartet (Decca, rec. 2004)

### Spotify embed check

Album `6tFl4rPDztyza1TSAOZP8i` (same album as Opp. 131 and 132), embed fetched 2026-11-17 from a Turkish network: https://open.spotify.com/embed/album/6tFl4rPDztyza1TSAOZP8i

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 17 | String Quartet No.16 in F, Op.135: 1. Allegretto | 6:13 | 373186 | true |
| 18 | … 2. Vivace | 3:16 | 196893 | true |
| 19 | … 3. Lento assai, cantante e tranquillo | 7:49 | 469853 | true |
| 20 | … 4. Der schwer gefaßte Entschluß (Grave - Allegro - Grave ma non troppo tratto - Allegro) | 7:19 | 439093 | true |

Total 1 479 025 ms = 24:39 → `duration_min: 25`. Four tracks, one per movement. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ensemble | Takács Quartet | Takács Quartet | embed; MusicBrainz release acfef64b-2110-472d-859e-6fbca96e9051 | VERIFIED |
| Label / catalogue | Decca, 470 849-2 (3 CDs, The Late String Quartets) | As for Op. 132 (`research/beethoven-string-quartet-15.md`): DG/Decca page, UPC 0028947084921 | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-the-late-string-quartets-takacs-quartet-9401 | VERIFIED (catalogue inferred from UPC) |
| Recorded / venue | July 2004, St George's, Bristol | MusicBrainz, every Op. 135 track: "recorded at Saint George's, Bristol, 2004-07" | https://musicbrainz.org/release/acfef64b-2110-472d-859e-6fbca96e9051 | VERIFIED |
| release_year / year | 2004 | Release 2 November 2004 | DG page | VERIFIED |

MusicBrainz CD lengths: 6:15 / 3:19 / 7:52 / 7:19 (374653 / 198960 / 472013 / 439093 ms); Spotify is 1–3 s shorter in I–III (probably trailing silence).

**Also recommended:** none added (not verified in time; same as Opp. 131 and 132).

---

## 2. Facts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Finished October 1826 at Gneixendorf, brother Johann's estate; went there with nephew Karl | de.wikipedia "16. Streichquartett (Beethoven)", Entstehung (travelled 28 September 1826 to Johann's estate, Schloss Wasserhof, Gneixendorf; finished there): https://de.wikipedia.org/wiki/16._Streichquartett_(Beethoven) ; en.wikipedia (written October 1826): https://en.wikipedia.org/wiki/String_Quartet_No._16_(Beethoven) ; Karl went with him: standard biography (Thayer–Forbes) | SECONDARY. de.wikipedia's sentence giving the completion day is garbled; the guide says only "October" |
| "on the Danube" | Gneixendorf lies on the plateau above Krems an der Donau | SECONDARY (geography); wording "on the Danube" is loose: it is a few km from the river |
| Last major work completed; only the new finale for Op. 130 came later; died March 1827 | en.wikipedia; de.wikipedia | SECONDARY |
| Four movements, shorter, closer to Haydn and Mozart; shortest of the late quartets | en.wikipedia ("the shortest of Beethoven's late quartets"); de.wikipedia, Wirkung (Konold: "Huldigung der beiden Vorbilder Haydn und Mozart"; Kerman: "his most successful evocation of the style of Haydn and Mozart") | SECONDARY |
| "Muss es sein?" / "Es muss sein!" written in the score; heading "Der schwer gefasste Entschluss" | en.wikipedia; de.wikipedia; Spotify track title | VERIFIED |
| Joke origin: Dempscher wanted Op. 130 played at his home, was asked to pay 50 florins (for Schuppanzigh); canon WoO 196 "Es muss sein, ja, ja, ja, heraus mit dem Beutel!" | de.wikipedia (Holz's account) | SECONDARY. Guide simplifies "pay for it" |
| Housekeeper story invented by Schindler (forged conversation-book entry c. 1840) | de.wikipedia (Schindler forged "Die Alte braucht wieder ihr Wochengeld"; Barbara Holzmann worked for Beethoven again only from 20 Dec 1826) | SECONDARY |
| Dedicated to Johann Nepomuk Wolfmayer, Viennese cloth merchant, long-standing admirer | de.wikipedia ("dem wohlhabenden Wiener Tuchhändler … einem jahrzehntelangen Verehrer"); en.wikipedia | SECONDARY |
| First public performance 23 March 1828, memorial concert | de.wikipedia ("Gedächtniskonzert zu Ehren Beethovens"); en.wikipedia (Schuppanzigh Quartet, 23 March 1828) | SECONDARY |
| I: sonata form; scraps passed between instruments ("durchbrochene Arbeit"); viola opens | de.wikipedia (main theme in the viola; Adorno's "dissociation"); Humdrum (viola upbeat, first violin flourish bar 2) | SECONDARY / score |
| I: unison steps at bar 10; triplet runs from bar 38; no exposition repeat | Humdrum (all parts in octave crotchets bars 10–14; triplet sixteenths bars 38–45; no repeat signs); de.wikipedia (repeat of the exposition "bleibt aus") | VERIFIED (score) |
| I: theme 2 in C major | Inferred (dominant of F; triplet passage over C) | INFERRED |
| II: off-beat, polyrhythmic tune; trio climbs F–G–A; lower three hold one figure for 51 bars, violin leaps up to two octaves; ends with a sudden *forte* chord after a diminuendo | de.wikipedia ("51 Takte lang", "Sprünge … bis zu zwei Oktaven", "subito-forte-Schlussakkord"); Humdrum key signatures F (bar 1), G (98), A (124), F (193) | SECONDARY / score |
| III: sketch note "Süßer Ruhegesang oder Friedensgesang" | de.wikipedia | SECONDARY |
| III: theme + four variations, theme barely changes; var. 1 violin up an octave; var. 2 minor, near standstill; var. 3 theme in cello almost unchanged, canon in first violin; var. 4 cello octave figures; coda violin very high, ends on D-flat chord like the opening | de.wikipedia, Dritter Satz | SECONDARY |
| III var. 2 in C-sharp minor and slower | Humdrum (four sharps, bars 23–31; slower MM marking); "Più lento" from memory of the score | VERIFIED (key); tempo word INFERRED |
| IV: question in the minor answered by its inversion in the major | de.wikipedia (G–E–A♭ / A–C–G, G–B♭–F); program-note summary found by search (answer = inversion of the question) | SECONDARY |
| IV: second theme light, "fairy march"; returns *pizzicato* in the coda | completebeethoven.com, day 361 ("the 'fairy march' is played pizzicato, and Es muss sein ends it"): https://completebeethoven.com/day361.html (seen as a search summary, page not opened) | SECONDARY (weak); check by ear |
| IV: Grave returns once, louder | Humdrum (3/2 Grave again bars 165–177); de.wikipedia | VERIFIED (score). "more agitated" is our wording |
| IV: exposition repeated; second-half repeat ad libitum ("al suo piacere") | Humdrum expansion `[A,B,B1,B,B2,C,C1,C,C2,D]`; de.wikipedia | VERIFIED. Takács: exposition repeat assumed, second-half repeat not (see §5) |
| Kundera, *The Unbearable Lightness of Being*, uses the phrase | en.wikipedia | SECONDARY |

---

## 3. Painting: Francisco de Goya (attributed), *The Milkmaid of Bordeaux*, c. 1825–27

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Francisco de Goya (1746–1828), *La lechera de Burdeos*, between 1825 and 1827 | Commons file description; Wikidata Q2088930 (inception 1827, circa) | VERIFIED (secondary) |
| Collection | Museo del Prado, Madrid, P002899 (donated 1946 by the Muguiro family) | Wikidata (P217 = P002899, collection Q160112); en.wikipedia https://en.wikipedia.org/wiki/The_Milkmaid_of_Bordeaux | VERIFIED (secondary; the Prado site refused the fetcher, 403) |
| Medium / size | Oil on canvas, 74 × 68 cm | Commons; Wikidata | VERIFIED (secondary) |
| Rights | Artist died 1828. `{{PD-Art|PD-old-auto-expired|deathyear=1828}}` | https://commons.wikimedia.org/wiki/File:Goya_MilkMaid.jpg | VERIFIED. Not NC |
| Image | `File:Goya_MilkMaid.jpg`, **2319 × 2584** (Web Gallery of Art source). The Yorck file (`La lechera de Burdeos, Francisco de Goya.jpg`) is smaller, 2024 × 2301 | Commons API imageinfo | VERIFIED. Moderate resolution; enough for hero (1800 px) but not a 4000 px "full" |
| Artist reuse | **Goya already has one painting** in `paintings.yaml` (*Witches' Sabbath*, used elsewhere). Argument for this one: painted in the same years as the quartet (1825–27) by an old painter who, like Beethoven, had been deaf for decades, as one of his last works, and turning, like Op. 135, to something small, light and tender after a period of dark, huge works (the Black Paintings / the late quartets) | – | Flag for the coordinator; alternatives in the `.shared.md` |
| Attribution | Widely accepted as Goya's, but some art historians have doubted it (en.wikipedia "Controversy"; Rosario Weiss proposed and generally rejected). A search summary says the Prado's label changed from "by Goya" to "attributed to Goya" (not confirmed on the Prado site, which refused the fetcher) | en.wikipedia; search summary 2026-11-17 | Hedged: `artist: Francisco de Goya (attributed)` (as for the della Croce Mozart family portrait) and the pairing note says "long held to be one of Goya's last paintings" |

**Pairing facts.** Goya was deaf after an illness in 1792–93 (general biography); he lived in exile in Bordeaux from 1824 and died there in 1828. Beethoven, deaf, finished Op. 135 in 1826. No direct link between the two men.

---

## 4. Glossary

Existing terms reused: sonata form, development, recapitulation, coda, scherzo, syncopation, trio, ostinato, variation, canon, exposition, pizzicato. **No new terms.**

---

## 5. Re-time

No stop was heard. Derived from Humdrum bar positions × average seconds per bar.

- I (track 17, 373.2 s; 193 bars of 2/4, no repeat): ≈ 1.93 s a bar. Unison bar 10 → 0:19; triplets bar 38 → 1:13; development ≈ bar 62 (rests in all parts bars 62–64) → 2:00; recapitulation ≈ bar 101 (key back to F) → 3:13; coda ≈ bar 161 (rests bars 159–163) → 5:09.
- II (track 18, 196.9 s; 274 bars of 3/4): Humdrum expansion `[A,B,B1,B,B2,C,D,D1,D,D2,E]` = ≈ 372 bars played → ≈ 0.53 s a bar. Trio material from bar 68 → 1:01; G major bar 98 → 1:17; ostinato in A major ≈ bars 143–193 → 1:41; F major again bar 193 → 2:08.
- III (track 19, 469.9 s; 54 bars of 6/8): bars 23–31 slower (Humdrum MM 30 vs 40) → effective 57 bars, ≈ 8.24 s a bar. Var. 1 ≈ bar 13 → 1:39; var. 2 bar 23 → 3:01; var. 3 bar 32 → 4:40; var. 4 ≈ bar 43 → 6:11; coda ≈ bar 50.
- IV (track 20, 439.1 s): Grave bars 1–12 ≈ 43 s; Allegro with the exposition repeated (bars 13–85, 73 bars twice), development and recapitulation once; second Grave bars 165–177 ≈ 47 s. Allegro ≈ 1.06 s a bar. Allegro 0:43; theme 2 (A major) bar 45 → 1:17; repeat → 2:00; development bar 86 → 3:15; Grave bar 165 → 4:39; Allegro bar 178 → 5:26; coda ≈ bar 249 → 6:41. If the Takács do not repeat the exposition, the Allegro would be ≈ 1.36 s a bar (too slow for this tempo), which is why the repeat is assumed.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Allegretto | 6:13 (track 17) | 0:00, 0:19, 1:13, 2:00, 3:15, 5:10, Near the end | 3:15 (recapitulation start) |
| II Vivace | 3:16 (track 18) | 0:00, 1:00, 1:40, 2:10, Last seconds | 1:00 (where the trio begins depends on repeats) |
| III Lento assai, cantante e tranquillo | 7:49 (track 19) | 0:00, 1:40, 3:00, 4:40, 6:10, Near the end | 1:40 (variation 1 start; bar 11 or 13) |
| IV Grave – Allegro | 7:19 (track 20) | 0:00, 0:43, 1:17, 2:00, 3:15, 4:40, 5:25, 6:45, Last seconds | 6:45 (pizzicato passage: confirm it exists and where); 2:00 (exposition repeat assumed) |
