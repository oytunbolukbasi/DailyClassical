# Verification: Beethoven – Egmont Overture, Op. 84

Files: `content/drafts/en/beethoven-egmont-overture.md`, `content/drafts/tr/beethoven-egmont-overture.md`. Checked 2026-11-20 (batch BATCH-2026-11b, group C).

**Method.** Spotify album ids found from public Spotify track pages (`music:album` meta, via web search restricted to open.spotify.com); each album read from `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`: titles, credits, `duration` in ms, `isPlayable`) with the DailyClassical User-Agent from a Turkish network, plus the album page's `music:release_date` and ℗ line. Recording dates from MusicBrainz (release `c1522fb7-abef-4764-a451-3027a830d411`).

**Recording choice.** Szell's Vienna Philharmonic recording of the complete incidental music (Decca 1969) was the first idea, but on Spotify its overture track (in the Decca/Philips box `21nzzlQnW07VtbAmNmLkcJ`, track 5, 11:29) is credited with the narrator Klausjürgen Wussow and appears to run on into spoken text, so stop times would be unreliable. Szell's Cleveland studio recording (1966) is on Spotify as a clean six-track album and is taken as reference; the Vienna overture alone (8:24, without narrator) is listed as also recommended.

---

## Reference recording: Szell / The Cleveland Orchestra, Columbia (Sony)

| Field | Value in the guide | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2KF4AmlYnJHTjCtkDkvkzu | "Szell Conducts Beethoven Overtures (Remastered)", 6 tracks; track 1 "Egmont Overture, Op. 84 - 2018 Remastered Version", credits "Ludwig van Beethoven, George Szell, The Cleveland Orchestra"; `music:release_date` 2018-07-27; "℗ 2018 Sony Music Entertainment" | https://open.spotify.com/embed/album/2KF4AmlYnJHTjCtkDkvkzu | VERIFIED |
| isPlayable | – | `true` (all six tracks) | embed | OK |
| One track | – | yes (track 1) | embed | OK |
| Recorded / venue | 8 October 1966, Severance Hall, Cleveland | MusicBrainz release "Szell Conducts Beethoven Overtures" (Sony Classical, 2018, barcode 886446939063): track 1 "recorded at Severance Hall, 1966-10-08". Search summary of Sony Essential Classics notes and Idagio also give October 1966, Severance Hall. Classite lists the mono LP ML 6366 with a 29 October 1966 session date (MusicBrainz gives 29 October for Coriolan and King Stephen on the same LP) | https://musicbrainz.org/release/c1522fb7-abef-4764-a451-3027a830d411 ; https://classite.com/disk/columbia-ms-6966-q169 (403 to fetch; title and date from search snippet) | OK (one discrepancy noted; 8 October kept) |
| Label / cat. no. | Columbia MS 6966 (LP) | Classite: Columbia MS 6966 (stereo) and ML 6366 (mono), "Szell: Beethoven: Overtures (Leonore 2, Egmont, Coriolan, King Stephen)", 1967 | search snippets of the two Classite pages | OK (secondary) |
| Release year | 1967 | Classite (MS 6966, 1967) | as above | OK (secondary) |
| Szell recorded all nine symphonies with Cleveland | 1957–67 | Gramophone, Rob Cowan on Szell's Cleveland Beethoven symphonies (search summary: symphonies and overtures recorded 1957–1967) | https://gramophone.co.uk/articles/rob-cowan-on-george-szell-s-cleveland-orchestra-beethoven-symphonies | OK |
| Szell and precision | "made the Cleveland Orchestra famous for its precision" | Wikipedia, George Szell: "a level of precision and ensemble playing normally found only in the best string quartets" | https://en.wikipedia.org/wiki/George_Szell | OK |

### Duration

| Track | ms | Guide |
| --- | --- | --- |
| 1 Egmont Overture | 515 000 | 8:35 (duration_min 9) |

---

## Also recommended: Szell / Wiener Philharmoniker, Decca

| Field | Value | Verified value | Source | Status |
| --- | --- | --- | --- | --- |
| Spotify album | https://open.spotify.com/album/2ppifYciQRtgwqJ3jxs8BS | "Beethoven 2020 – Symphonies & Overtures" (DG compilation, `music:release_date` 2019-11-01, "℗ This Compilation ℗ 2019 Deutsche Grammophon GmbH, Berlin"), track 44 "Egmont Overture, Op. 84", Vienna Philharmonic, George Szell, 504 933 ms (8:24), playable | embed | VERIFIED |
| Recorded / venue | December 1969, Sofiensaal, Vienna | Classite (Decca SXL 6465): sessions 10–15 December 1969, Sofiensaal; track data 15 December 1969; LP 1970 | https://classite.com/disk/decca-sxl-6465-q5840 (search snippet) | OK (secondary) |
| Original release | Decca SXL 6465 (LP), 1970; CD 448 593-2 | Classite; Gramophone review of the CD reissue | https://gramophone.co.uk/review/beethoven-egmont | OK |
| Note | – | The full Egmont from this recording is in "George Szell: Decca & Philips Recordings 1951-1969" (`21nzzlQnW07VtbAmNmLkcJ`), but the overture track there carries the narrator (11:29); the compilation track is the overture alone | embeds | – |

---

## Painting: Louis Gallait, *The Last Moments of Count Egmont*, 1848

| Field | Value | Source | Status |
| --- | --- | --- | --- |
| Artist | Louis Gallait (1810–1887), Belgian history painter; died 1887, public domain | Commons licence template `PD-Art|PD-old-auto-expired|deathyear=1887` | OK |
| Title / date | *The Last Moments of Count Egmont (Count Egmont Before His Death)*, Russian *Последние минуты графа Эгмонта*, 1848 | Wikidata Q27978205 (inception 1848, collection Hermitage, inv. ГЭ-6855) and Q21715947 ("Count Egmont before his Death", 1848, Hermitage, inv. ГЭ-3835, 65 × 78 cm, oil) | https://www.wikidata.org/wiki/Q27978205 ; https://www.wikidata.org/wiki/Q21715947 | OK, but **two Wikidata items with different inventory numbers** (probably duplicates). The credit line leaves the inventory number out; check the Hermitage catalogue at merge |
| Collection | State Hermitage Museum, St Petersburg | Commons `{{institution:Hermitage}}`; both Wikidata items | https://commons.wikimedia.org/wiki/File:The_Last_Moments_of_Count_Egmont_(Count_Egmont_Before_His_Death).jpg | OK (Hermitage online catalogue not reached) |
| Image | `File:The Last Moments of Count Egmont (Count Egmont Before His Death).jpg`, 1920 × 1586, JPEG, PD-Art | Commons API (imageinfo) | as above | OK; resolution modest (same width as other files already used) |
| What it shows | Egmont, standing at a leaded window in a fur-lined coat, a book in his hand; a seated bishop in red beside him with an open book; candlelight on a table at the right | thumbnail viewed | – | The bishop is not named in the guide. In Goethe the last scene is Egmont alone in prison; the painting follows history (Bishop Martin Rithovius of Ypres attended Egmont before his execution; title of a related Gallait work on meisterdrucke: "Martin Rithone zegent het lichaam van de Graaf van Egmont"). Guide says only "a bishop" |
| Not already used | Gallait is not in `content/paintings.yaml` | grep | OK |
| Pairing | The overture's last minute follows the death and turns it into victory; the painting shows the moment before | – | – |

---

## Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| Burgtheater production of Goethe's *Egmont* planned for spring 1810; Beethoven commissioned; exact date unknown; sketches from autumn 1809 | Henle study score HN 9043, preface by Ernst Herttrich (2016) | https://www.henle.de/media/27/0f/96/1697725883/9043-1697725883-sync.pdf | OK |
| Goethe finished the play in 1787, published 1788 | Wikipedia, Egmont (Beethoven) ("the 1787 play"); Wikipedia, Egmont (play) ("completed in 1788"; first edition Göschen, Leipzig, 1788). Goethe's *Italian Journey* records finishing *Egmont* in Rome in 1787 | https://en.wikipedia.org/wiki/Egmont_(Beethoven) ; https://en.wikipedia.org/wiki/Egmont_(play) | OK (sources differ on 1787/1788; guide says finished 1787, published 1788) |
| Overture plus nine numbers | Wikipedia (section list); Henle ("all nine numbers") | as above | OK |
| Not ready for the premiere of the play on 24 May 1810; first heard at the fourth performance, 15 June 1810 | Henle preface (English text: "fourth performance"; German text: "dritten Wiederholung", i.e. the third repeat = fourth performance) | as above | OK |
| "purely out of love for the poet", no fee from the theatre | Henle preface, letter to Breitkopf & Härtel of 21 August 1810 (Briefwechsel no. 465) | as above | OK (translation as printed by Henle) |
| Overture published separately in parts, December 1810; complete parts January 1812; full score 1831 | Henle preface | as above | OK |
| Beethoven wrote to Goethe on 12 April 1811; asked the publisher to send Goethe the score | Henle preface (Briefwechsel no. 474) | as above | OK |
| Beethoven and Goethe met at Teplitz in 1812 (summer) | Wikipedia, Ludwig van Beethoven ("Advised again to visit Teplitz in 1812, he met there with Goethe"); the meeting was in July 1812 | https://en.wikipedia.org/wiki/Ludwig_van_Beethoven | OK |
| Lamoral, Count of Egmont; opposed Spanish policy; arrested on the Duke of Alba's orders; executed 5 June 1568 in Brussels (Grand Place); execution helped spark the revolt leading to Dutch independence | Wikipedia, Lamoral, Count of Egmont | https://en.wikipedia.org/wiki/Lamoral,_Count_of_Egmont | OK |
| Play ends with a "Siegessymphonie" called for by Goethe | German Wikipedia, Musik zu Goethes Trauerspiel Egmont ("die von Goethe explizit als Abschluss des Trauerspiels gefordert wird") | https://de.wikipedia.org/wiki/Musik_zu_Goethes_Trauerspiel_Egmont | OK |
| The overture's *Allegro con brio* is the victory music that also ends the play | LA Phil / Hollywood Bowl note ("Beethoven later echoed this coda at the end of the play as a 'Symphony of Victory'"); Runyan note ("based on the exultation of the 'Victory Symphony'") | https://www.hollywoodbowl.com/musicdb/pieces/321/overture-to-egmont-op-84 ; https://www.runyanprogramnotes.com/program_note/overture-egmont-op-84/ | OK (the two are closely related, not bar-for-bar identical; guide says "the victory music that also ends Goethe's play") |
| Scoring includes piccolo (2nd flute doubling), 4 horns, 2 trumpets | Hollywood Bowl note: 2 fl (2nd doubling picc), 2 ob, 2 cl, 2 bn, 4 hn, 2 tpt, timp, strings | as above | OK |
| Introduction: unison F, then sarabande rhythm; soft woodwind answers; little descending figure; accelerando into the Allegro | Runyan note; UC Davis note (search summary) | as above | OK |
| Sarabande rhythm associated with Spanish rule / Alba | Hollywood Bowl ("Spain's oppressive tread"); interlude.hk ("suggested as a reference to the Spanish Duke of Alba") | as above; https://interlude.hk/death-and-victory-beethovens-egmont-overture/ | OK (guide: "often heard as") |
| Theme 1 falling line in the cellos; second theme in A-flat major, a fast version of the sarabande, loud strings answered by soft woodwinds; short development; recapitulation | Runyan note | as above | OK |
| Sudden silence before the coda, often heard as Egmont's death; some notes say Beethoven himself said so (no source given) | Runyan note; search summaries | as above | OK (guide: "Often heard as Egmont's execution"; no claim that Beethoven said it) |
| Soft clarinets and bassoons before the coda | Runyan note | as above | OK |
| Napoleon's army occupied Vienna in 1809 | Wikipedia, Ludwig van Beethoven (French bombardment of Vienna in May 1809 and "the subsequent occupation") | as above | OK |
| Fifth Symphony completed two years earlier, from minor struggle to major triumph | Wikipedia, Egmont (Beethoven): "a style similar to the Fifth Symphony, which the composer completed two years earlier" | as above | OK |

---

## Re-time

No bar map from a score was available; the bar positions below are from memory of the score and are approximate (347 bars: introduction bb. 1–24 in 3/2, Allegro bb. 25–286 in 3/4, Allegro con brio bb. 287–347 in 4/4). Assumed timing for Szell's 8:35: introduction ≈ 1:35 (with the accelerando), Allegro ≈ 1.24 s per bar (≈ 1:35 to ≈ 7:05), *Allegro con brio* ≈ 1:30. Assumed bars: theme 1 b. 28, tutti b. 58, theme 2 b. 82, development b. 117, recapitulation b. 163, theme 2 in the recapitulation b. 224, final build b. 259, the stroke and silence b. 278, woodwind chords bb. 282–286.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I | 8:35 | 0:00, 0:20, 1:15, 1:35, 2:15, 2:45, 3:30, 4:25, 5:40, 6:25, 6:50, 6:55, 7:05, last minute | Start of the Allegro (≈ 1:35; depends on Szell's introduction tempo) and the recapitulation (≈ 4:25). The silence (≈ 6:50) and the start of the *Allegro con brio* (≈ 7:05) should be easy to fix by ear |
