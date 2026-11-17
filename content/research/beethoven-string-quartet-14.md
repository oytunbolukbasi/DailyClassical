# Verification: Beethoven – String Quartet No. 14 in C-sharp minor, Op. 131

Piece id: `beethoven-string-quartet-14` (form `string-quartet`; the ensemble is given as `orchestra: Takács Quartet`, no conductor, per §6.3).
Files: `content/drafts/en/beethoven-string-quartet-14.md`, `content/drafts/tr/beethoven-string-quartet-14.md`. Shared-file additions: `content/research/beethoven-string-quartet-14.shared.md`.
Checked on 2026-11-17 (batch November 2026, group A). Score: Craig Sapp's Humdrum encoding, https://github.com/craigsapp/beethoven-string-quartets (`kern/quartet14-1.krn` … `-7.krn`), read for bar numbers, key signatures, metres and dynamics. Status key: VERIFIED / SECONDARY / INFERRED.

**Seven movements.** This piece is the brief's one exception to the six-movement limit (`movement_count: 7`, seven tracks, one per movement).

---

## 1. Reference recording: Takács Quartet (Decca, rec. 2003, rel. 2004)

### Spotify embed check

Album `6tFl4rPDztyza1TSAOZP8i` (same album as `beethoven-string-quartet-15`): Spotify title *Beethoven: String Quartets Vol.3 (3 CDs)*, 31 tracks, all credited "Ludwig van Beethoven, Takács Quartet". Embed fetched 2026-11-17 from a Turkish network: https://open.spotify.com/embed/album/6tFl4rPDztyza1TSAOZP8i

| # | Track (Spotify) | Duration | ms | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | String Quartet No.14 in C sharp minor, Op.131: 1. Adagio ma non troppo e molto espressivo | 7:58 | 478946 | true |
| 6 | … 2. Allegro molto vivace | 2:56 | 176933 | true |
| 7 | … 3. Allegro moderato | 0:42 | 42400 | true |
| 8 | … 4. Andante ma non troppo e molto cantabile - Più mosso - Andante moderato e lusinghiero - Adagio - Allegretto - Adagio, ma non troppo e semplice - Allegretto | 13:27 | 807080 | true |
| 9 | … 5. Presto | 5:02 | 302266 | true |
| 10 | … 6. Adagio quasi un poco andante | 2:17 | 137453 | true |
| 11 | … 7. Allegro | 6:30 | 390080 | true |

Total 2 335 158 ms = 38:55 → `duration_min: 39`. Seven tracks, one per movement; the variations (IV) are one track. Status: VERIFIED.

| Field | Value in the guide | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Ensemble | Takács Quartet | Takács Quartet (Edward Dusinberre, Károly Schranz, Geraldine Walther, András Fejér; not in the guide) | embed; MusicBrainz release acfef64b-2110-472d-859e-6fbca96e9051 | VERIFIED |
| Label / catalogue | Decca, 470 849-2 (3 CDs, The Late String Quartets) | As in `research/beethoven-string-quartet-15.md`: DG/Decca page, UPC 0028947084921 ↔ 470 849-2; US issue B0003875-02 (MusicBrainz) | https://www.deutschegrammophon.com/en/catalogue/products/beethoven-the-late-string-quartets-takacs-quartet-9401 ; https://musicbrainz.org/release/acfef64b-2110-472d-859e-6fbca96e9051 | VERIFIED (catalogue inferred from UPC, as for Op. 132) |
| Recorded / venue | November 2003, St George's, Bristol | MusicBrainz, every Op. 131 track: "recorded at Saint George's, Bristol, 2003-11" (queried via the MusicBrainz API, `inc=recording-level-rels+place-rels`) | same | VERIFIED |
| release_year / year | 2004 | Release 2 November 2004 | DG page | VERIFIED. `year: 2004` follows the release, as in the Op. 132 file |

MusicBrainz CD lengths are identical to the Spotify ms values for all seven Op. 131 tracks.

**Also recommended:** none added (no second album was verified; one web search for Alban Berg / Quartetto Italiano / Busch on Spotify returned no album link). Same situation as Op. 132.

---

## 2. Facts

| Claim (guide wording) | Source | Status |
| --- | --- | --- |
| Written end of 1825 – summer (July) 1826 | de.wikipedia "14. Streichquartett (Beethoven)", Entstehung ("von Ende 1825 bis Juli 1826"): https://de.wikipedia.org/wiki/14._Streichquartett_(Beethoven) ; en.wikipedia (completed 1826): https://en.wikipedia.org/wiki/String_Quartet_No._14_(Beethoven) | SECONDARY |
| Aged fifty-five and deaf | Born Dec 1770; Beethoven turned 55 in Dec 1825; composers.yaml | VERIFIED |
| Last of three quartets written in the order Op. 132, Op. 130, Op. 131 | en.wikipedia ("written in the order Opp. 132, 130 …, 131") | SECONDARY |
| Holz: Beethoven later called it his greatest quartet | de.wikipedia, Wirkung, quoting Holz: "Später erklärte er doch für sein größtes, das cis-Moll-Quartett"; en.wikipedia ("Beethoven's favourite of the late quartets") | SECONDARY |
| Seven movements played without a break; Holz asked about tuning; Beethoven allowed only a short pause after the Presto (V) | en.wikipedia ("seven movements played without break"); de.wikipedia (Holz's questions "Muß es ohne aufzuhören durchgespielt werden? … Wann sollen wir stimmen?" and his 1857 recollection: "nur eine kurze Pause nach dem Presto E Dur … zugestanden") | SECONDARY |
| Note on the Schott copy: "put together from pilferings of this and that"; when Schott asked, Beethoven said it was brand new | de.wikipedia: "N. b. Zusammengestohlen aus verschiedenem diesem und jenem"; letter of 19 August 1826: "… Es ist Unterdessen Funkel nagelneu" | SECONDARY. Translation is ours ("zusammengestohlen" = literally "stolen together") |
| Dedicated to Baron Joseph von Stutterheim, who took nephew Karl into the army after his suicide attempt | en.wikipedia; de.wikipedia (suicide attempt 30 July 1826; Stutterheim looked after Karl in the army) | SECONDARY |
| Beethoven never heard it played; printed after his death in 1827 | de.wikipedia (parts June 1827, score February 1828, Schott; first performance 5 June 1828, Halberstadt); en.wikipedia ("Beethoven died before the work's publication … and before its first performance") | SECONDARY. "Printed … in 1827" = the parts; the score followed in 1828 |
| Holz recalled that in November 1828, days before his death, Schubert asked to hear it | en.wikipedia (Holz's recollection, citing Deutsch, *Schubert: Memoirs by His Friends*); de.wikipedia (played for Schubert on 14 November 1828, five days before his death) | SECONDARY. The famous "After this, what is left for us to write?" is not used: it is a "said to have" quote |
| Wagner: the most melancholy music | en.wikipedia ("reveals the most melancholy sentiment expressed in music"); de.wikipedia ("wohl das Schwermütigste, was je in Tönen ausgesagt worden ist") | SECONDARY |
| I is a fugue; four-note shape shared with the other late quartets | en.wikipedia ("second tetrachord of the harmonic minor scale, the unifying motif of Beethoven's last string quartets"); de.wikipedia | SECONDARY |
| I: entries first violin (upbeat), second violin bar 4, viola bar 8, cello bar 12 | Humdrum `quartet14-1.krn` (first notes per spine) | VERIFIED (score) |
| I: first *f* at bar 54 after a long *p* stretch; far-off key from bar 45 (six flats) | Humdrum (dynamics, key signatures) | VERIFIED (score) |
| I: cello states the subject in whole notes (augmentation) from bar 99 | Humdrum cello spine: B#–C#–A in whole notes, bars 100–102 | VERIFIED (score) |
| I ends on bare C-sharp octaves; II begins on D, a half step higher | Humdrum (last bar: C#s only); II in D major (`*D:`) | VERIFIED (score) |
| II: D major, 6/8, folk-like tune, one main theme | en.wikipedia ("a delicate dance in compound duple meter in D major … folk-like theme"); de.wikipedia (Goldschmidt: "only a single theme") | SECONDARY |
| II: sudden *f* outbursts in a *pp/p* texture | Humdrum dynamics (pp at bar 1, f at 18, ff at 182/188, pp at 197) | VERIFIED (score) |
| III: 11 bars; two tutti chords; free recitative-like passage; Adagio from bar 6; ends on E as the dominant of A | de.wikipedia; en.wikipedia ("in the spirit of recitativo obbligato"); Humdrum (MM change bar 6) | SECONDARY / score. Who plays the free passage: de.wikipedia names the viola leading into the Adagio; the guide says "first violin alone" for the recitative after the chords. INFERRED – check by ear |
| III: Beethoven gave it a number of its own | de.wikipedia (movement divisions marked in the Schott copy) | SECONDARY |
| IV: theme + six variations + coda; tempo marks; theme shared between the violins | en.wikipedia (list of tempo marks; "theme in A major shared between the first and second violins"); de.wikipedia (each variation described) | SECONDARY |
| IV var. 1: dotted rhythms, motif first in the lower three parts | de.wikipedia ("Doppelpunktierungen … zuerst in den drei Unterstimmen") | SECONDARY |
| IV var. 2 (Più mosso): 4/4, march-like | de.wikipedia ("im Stil eines 'Alla marcia'"); Humdrum 4/4 at bar 65 | SECONDARY / score |
| IV var. 3: "two instruments imitate each other, one a beat behind" (canon) | Not confirmed in a source opened; from memory of the score (canonic duets) | INFERRED – check by ear |
| IV var. 4: Adagio 6/8, dense counterpoint | de.wikipedia; Humdrum 6/8 at bar 130 | SECONDARY / score |
| IV var. 5: "tune reduced to its outline" | Not confirmed in a source opened | INFERRED – check by ear |
| IV var. 6: 9/4, Adagio ma non troppo e semplice, sotto voce, hymn-like, cello's trembling sixteenth-note figure | de.wikipedia | SECONDARY |
| IV coda: each instrument plays a short solo with flowing triplets; a seventh variation is hinted at; last bars repeat the end of the theme | de.wikipedia | SECONDARY |
| V: E major, scherzo in duple time; cello motto followed by a general pause; nursery-rhyme-like; trio twice; *sul ponticello* near the end, all four players | en.wikipedia; de.wikipedia (Konold, Kerman "most child-like scherzo"); Holz confirmed *sul ponticello* was playable | SECONDARY. Trio key A major from Humdrum key signatures (bars 113, 279) |
| VI: G-sharp minor, 28 bars, viola begins; its first three notes invert the fugue subject's | de.wikipedia; en.wikipedia | SECONDARY |
| VII: C-sharp minor, sonata form, the only sonata-form movement of the seven | de.wikipedia ("der einzige Sonatensatz des Quartetts"); en.wikipedia | SECONDARY |
| VII: shape of the fugue subject returns | en.wikipedia ("the finale directly quotes the first movement's fugue theme"); the guide places it at bar 21ff, where the Humdrum score shows a long-note line in the first violin over the viola's galloping repeated G-sharp | SECONDARY; placement INFERRED from the score |
| VII: lyrical second theme | en.wikipedia ("soaring, lyrical second theme") | SECONDARY |
| VII: second theme in D major in the recapitulation | Humdrum key signature of two sharps at bar 211 | INFERRED (two sharps could also be B minor); check by ear |
| VII: ends in C-sharp major with loud chords | en.wikipedia (Picardy third); Humdrum last bars (C# major chords, *ff* at 386) | VERIFIED |

Not used: "After this, what is left for us to write?" (Schubert, unsourced quote); Kol Nidre link in VI (Breslaur, speculative); film references.

---

## 3. Painting: Rembrandt, *Self-Portrait with Two Circles* (c. 1665–69)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Rembrandt van Rijn (1606–1669), *Self-Portrait with Two Circles*, c. 1665–69 (Commons: c. 1665–1668; RKD and English Heritage: 1665–1669) | Commons file description; Wikidata Q2872725; https://www.english-heritage.org.uk/visit/places/kenwood/history-stories-kenwood/rembrandt-self-portrait/ | VERIFIED (secondary) |
| Collection | Kenwood House, London (English Heritage), Iveagh Bequest; accession 88028836 | Commons; https://artuk.org/discover/artworks/self-portrait-with-two-circles-191815 | VERIFIED (secondary) |
| Medium / size | Oil on canvas; Commons gives 143.5 × 125.2 cm (not cross-checked with Art UK) | Commons | Size not used in the guide |
| Rights | Artist died 1669. `{{PD-Art|PD-old-100-expired}}` | https://commons.wikimedia.org/wiki/File:Rembrandt_van_Rijn_-_Zelfportret_met_twee_cirkels_(Kenwood_House).jpg | VERIFIED. Not NC |
| Image | Google Art Project file, **7449 × 9008** | same (Commons API imageinfo) | VERIFIED |
| Not already used | Rembrandt not in `content/paintings.yaml` (checked 2026-11-17) | – | VERIFIED |

**Pairing.** No historical link between Rembrandt and Beethoven; the link is the idea of a late style. The painting is one of Rembrandt's last self-portraits, painted broadly (the hands are barely indicated), and the meaning of the two circles behind him has never been settled (English Heritage). Op. 131 is a late, very personal work whose form (seven movements, or four main ones with links) is still debated (de.wikipedia, "Zur Musik"). The pairing note claims only this. Portrait format (≈ 0.83:1): plan the hero crop around the face.

---

## 4. Glossary

Existing terms reused: fugue, recitative, variation, coda, scherzo, trio, sonata form, development, recapitulation. **New term: Sul ponticello** (rows in the `.shared.md`). "Augmentation" is explained in the text and not linked.

---

## 5. Re-time

No stop was heard. Each was derived from Humdrum bar positions × the track's average seconds per bar (with tempo changes weighted where the score changes speed).

- I (track 5, 478.9 s; 121 bars of 2/2 plus an upbeat): ≈ 3.95 s a bar. Entries bars 4/8/12 → 0:16/0:32/0:47; *f* bar 54 → 3:33; augmentation bar 99 → 6:31.
- II (track 6, 176.9 s; 198 bars of 6/8): ≈ 0.89 s a bar. *f* bar 18 → 0:16; return ≈ bar 74 → 1:06; *ff* bars 180–188 → 2:40–2:47.
- III (track 7, 42.4 s): bars 1–5 Allegro moderato ≈ 2 s a bar, Adagio from bar 6 → ≈ 0:10.
- IV (track 8, 807.1 s): sections from the Humdrum metre/tempo changes: theme 1–32, var. 1 33–64, var. 2 65–97 (4/4), var. 3 98–129, var. 4 130–161 (6/8), var. 5 162–187 (2/4, bars 178–185 repeated), var. 6 188–231 (9/4), coda 232–278. Two models (a direct guess, and plausible tempos scaled to 807 s) were averaged: var. 1 1:20–1:40, var. 2 2:40–3:15, var. 3 3:46–4:20, var. 4 5:33–5:50, var. 5 7:59–8:10, var. 6 8:44–9:00, coda 11:45–12:03.
- V (track 9, 302.3 s; 500 bars of 2/2 with a repeat of bars 20–67): with the repeat ≈ 0.55 s a bar (546 bars played). Trio bar 113 → 1:28; scherzo bar 171 → 2:00; trio bar 279 → 3:00; scherzo bar 337 → 3:32; *sul ponticello* ≈ bar 473 → 4:47. Without the repeat every stop before 4:45 moves ≈ 20 s earlier.
- VI (track 10, 137.5 s; 28 bars of 3/4): ≈ 4.9 s a bar; others join ≈ bar 3 → 0:15.
- VII (track 11, 390.1 s; 388 bars of 2/2): ≈ 1.0 s a bar. Bar 21 → 0:20; theme 2 ≈ bar 56 → 0:55; development ≈ bar 78 → 1:20; recapitulation bar 160 → 2:40; theme 2 (D major) ≈ bar 214 → 3:35; coda ≈ bar 262 → 4:25.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Adagio ma non troppo e molto espressivo | 7:58 (track 5) | 0:00, 0:15–0:50, 3:35, 6:30, Near the end | 6:30 (augmentation; the slow tempo may drift) |
| II Allegro molto vivace | 2:56 (track 6) | 0:00, 0:16, 1:05, 2:40 | 1:05 (where the tune "returns" is a judgement) |
| III Allegro moderato – Adagio | 0:42 (track 7) | 0:00, 0:10, Last seconds | 0:10; also check who plays the free passage (violin or viola) |
| IV Andante ma non troppo e molto cantabile | 13:27 (track 8) | 0:00, 1:30, 2:55, 4:05, 5:40, 8:05, 8:50, 11:55, Near the end | All variation boundaries (two models differ by up to 35 s); check var. 3 canon and var. 5 description by ear |
| V Presto | 5:02 (track 9) | 0:00, 1:25, 2:00, 3:00, 3:30, 4:45, Last seconds | 1:25–3:30 (depends on whether the Takács take the repeat) |
| VI Adagio quasi un poco andante | 2:17 (track 10) | 0:00, 0:15, Near the end | 0:15 |
| VII Allegro | 6:30 (track 11) | 0:00, 0:20, 0:55, 1:20, 2:40, 3:35, 4:25, Last seconds | 3:35 (second theme in D major is inferred from the key signature) |
