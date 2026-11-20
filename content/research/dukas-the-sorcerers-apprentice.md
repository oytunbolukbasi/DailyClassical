# Verification: Dukas – The Sorcerer's Apprentice

Piece id `dukas-the-sorcerers-apprentice`. Checked on 2026-11-20 (batch 2026-11b, group F).
Files: `content/drafts/en/dukas-the-sorcerers-apprentice.md`, `content/drafts/tr/dukas-the-sorcerers-apprentice.md`.
Shared-file additions (paintings.yaml, new composer Dukas): `content/research/dukas-the-sorcerers-apprentice.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` fetched from a Turkish network (2026-11-20, User-Agent `DailyClassical/1.0`); the Deutsche Grammophon product page, whose embedded track metadata gives recording date, venue and first release and which links the Spotify album; MusicBrainz (Spotify links); Wikipedia (EN, FR); programme notes; Wikimedia Commons API and file wikitext; the Science History Institute's digital collection. Status key: OK = matches a primary or reliable source; VERIFIED = checked directly in the embed / API; UNVERIFIED = not confirmed.

## 1. Reference recording: Levine / Berliner Philharmoniker (DG, 1986)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | James Levine / Berliner Philharmoniker | Spotify credits track 5: "Paul Dukas, Berlin Philharmonic, James Levine"; DG page: "Berliner Philharmoniker, James Levine" | https://open.spotify.com/embed/album/3bYX9JrWggqunxykNpkLwy ; https://www.deutschegrammophon.com/en/catalogue/products/dukas-zauberlehrling-saint-saens-symphoniepreston-5590 | VERIFIED |
| Recorded / venue | June 1986, Jesus-Christus-Kirche, Berlin | DG track metadata for "L'Apprenti sorcier" (ISRC DEF058603180): recordingDate 1986-06-05, recordingLocation "Jesus-Christus-Kirche, Berlin", recording producer Werner Mayer, producer Dr. Steven Paul, firstReleaseYear 1987. (The Saint-Saëns symphony on the same album: June 1986, Grosser Saal, Berlin Philharmonie; Presto gives the Philharmonie for the whole album, which is true only of the symphony) | DG page | OK |
| Label / catalogue | DG 419 617-2 | DG page SKU 00028941961723 (= 419 617-2); Decca Classics mirror page dates the release 17 July 1987 | DG page ; https://www.deccaclassics.com/en/catalogue/products/dukas-zauberlehrling-saint-sans-symphoniepreston-5590 | OK |
| Spotify | 3bYX9JrWggqunxykNpkLwy | Linked from the DG product page ("Listen"). Album "Saint-Saëns: Symphony No.3 "Organ"", 5 tracks; Dukas is track 5 | DG page ; embed | VERIFIED |

| Track | Title | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | L'Apprenti sorcier | 641750 | 10:42 | true |
| | → `duration_min: 11` | | | |

Tracks 1–4 (Saint-Saëns, Symphony No. 3, Simon Preston, organ) are all playable too.

Other Spotify issues of the same performance (not used): `0nCN1vyGp1j2JKjKiQh9rD` (track 5, 644000 ms, playable; a different digital master of the same album) and `35pfNxjk9l5NRvCV9qYhD0` (2012 compilation with Berlioz overtures; two Berlioz tracks are not playable in Turkey).

**Also recommended: none.** Searched for Martinon (EMI/Warner), Les Siècles / Roth (Actes Sud), Toscanini, Paray, Munch, Ansermet, Dutoit: no Spotify album id could be confirmed from a primary source (MusicBrainz has no Spotify links for them; label pages do not link them). Armin Jordan's Erato recording (Spotify `64ORALt8GFR9eJFbT4g9Fk`, track 1, 701653 ms = 11:42, playable) is credited on Spotify to the Orchestre Philharmonique de Radio France while the Warner page names the Suisse Romande; recording date and orchestra could not be settled, so it is not listed.

## 2. Painting: Hendrick Heerschop, *The Alchemist's Experiment Takes Fire*, 1687

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / title / date | Hendrick (Hendrik) Heerschop, Dutch painter of Haarlem, *The Alchemist's Experiment Takes Fire*, 1687 | https://digital.sciencehistory.org/works/w3763731m ; Wikidata Q109896251 | OK |
| Collection / medium / size | Science History Institute, Philadelphia, Fisher Collection; oil on canvas, 56.8 × 47.6 cm | Institute page | OK |
| Image | `File:The_Alchemist’s_Experiment_Takes_Fire_1687_CHF_fa_2000.001.276.JPG`, 6200 × 7635, uploaded with the Institute's permission; {{Licensed-PD-Art\|PD-old-100-1923\|cc-by-3.0\|attribution=Science History Institute}} | https://commons.wikimedia.org/wiki/File:The_Alchemist%E2%80%99s_Experiment_Takes_Fire_1687_CHF_fa_2000.001.276.JPG | OK |
| Rights | Painting PD by age (17th century). The Institute's own record: "Public Domain Mark 1.0 (No Copyright)". The CC BY 3.0 on Commons covers only a possible photo right, which does not arise for a faithful photo of a 2D work (EU DSM art. 14; US). Same treatment as `mahler-symphony-1` (Belvedere CC BY-SA photo) | Institute page ; Commons | OK |
| Not reused | Heerschop is not in `content/paintings.yaml`; no other shared note of this batch named it (grep, 2026-11-20) | – | OK |

**Pairing.** The Institute's description: the experiment "has erupted in a sudden fire, with glass shattering in midair and smoke billowing upward"; the alchemist sits startled in his chair, with a mortar and pestle and bellows at his feet; in the next room his wife tends a baby. The pestle links to Lucian's *Philopseudes*, where Eucrates brings a pestle to life (Wikipedia, "The Sorcerer's Apprentice"). A painting of the Goethe ballad itself was not found on Commons (only prints, book illustrations and modern sculpture).

## 3. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Goethe, "Der Zauberlehrling", 1797, a ballad of 14 stanzas; apprentice enchants a broom to carry water, cannot stop it, splits it with an axe, two brooms work twice as fast, the master returns and breaks the spell | https://en.wikipedia.org/wiki/The_Sorcerer%27s_Apprentice | OK |
| Lucian, *Philopseudes* (c. AD 150): oldest known version; Eucrates animates a pestle (Pancrates the Egyptian priest is the sorcerer) | same | OK (guide says "around AD 150", "the Greek writer Lucian": Lucian wrote in Greek) |
| Dukas, 1897; subtitle "Scherzo after a ballad by Goethe" (*Scherzo d'après une ballade de Goethe*); premiere Paris, 18 May 1897, Société Nationale de Musique, the composer conducting | https://en.wikipedia.org/wiki/The_Sorcerer%27s_Apprentice_(Dukas) ; https://fr.wikipedia.org/wiki/L%27Apprenti_sorcier_(Dukas) | OK |
| "It was customary to print the poem in the orchestral score" | en.wikipedia (Dukas piece) | OK |
| Programme music following the poem closely ("descriptively programmatic, closely following the events described in the Goethe poem") | en.wikipedia | OK |
| Bassoons = broom; trumpets/brass = the master's magic; after the split, the halves in bassoon and bass clarinet; four quick chords at the end read as the sorcerer's "disciplinary strokes" | https://www.hollywoodbowl.com/musicdb/pieces/759/the-sorcerers-apprentice | OK |
| The final four notes as a slap ("une gifle") | fr.wikipedia | OK |
| Introduction: violins, descending, diminished-seventh harmony, flute and piccolo; clarinet, oboe and flute state the broom theme over soft strings; staccato woodwind figures start the scherzo; main theme hammers the tonic; second theme in winds over pizzicato with grace notes = apprentice's eagerness; spell = dotted motif, fortissimo, muted horns and trumpets; splashing water in strings and harp; two sharp chords and a pause = the axe; coda: second theme on solo viola, regret | https://blog.bham.ac.uk/beyondthescore/2025/04/28/magic-out-of-control-dukas-the-sorcerers-apprentice/ ; search snippets of programme notes (Orchestre Métropolitain, Jacksonville SO) for the clarinet/oboe/flute statement | OK (descriptions); bar positions not checked against the score |
| Two broom episodes, each a crescendo; the second climax "enormous" | https://musicweb-international.com/programme_notes/dukas_sorcerer.htm | OK |
| Tempo markings Assez lent / Vif / Assez lent; 3/8 | Trevco (Accolade bassoon arrangement description: "includes the introduction (Assez lent) as well as the more familiar Vif, and closes with the final Assez Lent"); 8notes extract in 3/8 | OK for markings; metre of the introduction UNVERIFIED (assumed 3/8 like the Vif) |
| Key F minor | en.wikipedia category "Compositions in F minor" | OK |
| Scoring includes three bassoons and contrabassoon, bass clarinet, glockenspiel, harp; no tuba | en.wikipedia ; fr.wikipedia | OK |
| By far Dukas's most performed work; its popularity irritated him | en.wikipedia (piece and composer articles) | OK |
| *Fantasia* (1940): Mickey Mouse as the apprentice; Philadelphia Orchestra under Stokowski; *Fantasia 2000* kept only this segment and its new segments were conducted by James Levine | en.wikipedia (Dukas piece) | OK. Guide: "Thirteen years later" = 1986 → 1999 (*Fantasia 2000* premiered 17 December 1999) |
| *Scherzo* means "joke" | existing glossary entry; Birmingham blog | OK |

Not used: Hollywood Bowl's remark that Stravinsky borrowed the opening for *Fireworks* (single source); the 1930 and 1933 film versions.

## 4. Re-time (all stops are ≈; derived from programme notes, the order of the story and the exact track length, not heard)

Method: the introduction (*Assez lent*) is about 1:30–1:50 in most recordings of 10:30–11:30; the *Vif* runs from there to about 9:00; the slow epilogue and the four chords take the last 1:30. The axe falls a little past the middle; the second flood is longer and bigger than the first (MusicWeb). Positions scaled to Levine's 10:42.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Assez lent – Vif – Assez lent | 10:42 | 0:00, 0:25, 0:50, 1:10, 1:25, 1:50, 2:40–3:30, 3:30, 4:15–5:45, 5:50, 6:00–6:40, 6:40–8:50, 8:55, 9:10, Last 10 seconds | The axe (≈ 5:50) and the master's return (≈ 8:55), ± 40 s; the apprentice's tune (≈ 3:30, ± 45 s); the order of the brief woodwind flurry and the brass spell inside the introduction (≈ 0:50, 1:10) |
