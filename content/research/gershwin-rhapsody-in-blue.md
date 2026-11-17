# Verification: Gershwin – Rhapsody in Blue

Piece id `gershwin-rhapsody-in-blue`. Checked on 2026-11-17 (batch 2026-11, group J).
Files: `content/drafts/en/gershwin-rhapsody-in-blue.md`, `content/drafts/tr/gershwin-rhapsody-in-blue.md`.
Shared-file additions (paintings.yaml, glossary "Blue note" and "Rhapsody", new composer `gershwin`): `content/research/gershwin-rhapsody-in-blue.shared.md`.

**How the checks were done**
- **Spotify:** embed page `https://open.spotify.com/embed/album/<id>` (`__NEXT_DATA__`), fetched from a Turkish network on 2026-11-17. Reference album id found via MusicBrainz release links; the also-recommended id is linked from DG's product page.
- **Discogs:** public API. **DG metadata:** per-track JSON on the DG product page.
- **Status key:** OK = primary source. SECONDARY = review or search snippet. UNVERIFIED = not confirmed.

---

## 1. Reference recording: Bernstein (piano and conductor) / Columbia Symphony Orchestra (Columbia, 1959)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Soloist / conductor / orchestra | Leonard Bernstein (piano, conductor) / Columbia Symphony Orchestra | Spotify track 1 credits "George Gershwin, Columbia Symphony Orchestra, Leonard Bernstein"; Discogs SMK 63086: orchestra Columbia SO on track 1; NPR: Bernstein "conducts from the piano" | https://open.spotify.com/embed/album/7y2gHGuQhJmesRiNO8d8fK ; https://www.discogs.com/release/4125141 ; https://www.npr.org/2011/07/18/105855746/rhapsody-in-blue-gershwin-at-his-greatest | OK |
| Label / catalogue | Columbia Masterworks MS 6091; SMK 63086 | Discogs 2802629: Columbia Masterworks MS 6091, US 1959, A *Rhapsody in Blue*, B *An American in Paris*; producer (uncredited) Howard H. Scott (side A). Discogs 4125141: Sony Classical SMK 63086 (Bernstein Century, 1997) | https://www.discogs.com/release/2802629 ; Discogs 4125141 | OK |
| Recorded / venue | 23 June 1959, St. George Hotel, Brooklyn | SMK 63086 booklet (Discogs notes): "Track 1 recorded at St. George Hotel, Brooklyn, New York City, on June 23, 1959" | Discogs 4125141 | OK |
| Release year | 1959 | MS 6091, 1959 | Discogs 2802629 | OK |
| Spotify | 7y2gHGuQhJmesRiNO8d8fK | "Gershwin: Rhapsody in Blue & An American in Paris", 2 tracks; track 1 *Rhapsody in Blue* 16:27 (987266 ms), `isPlayable: true` | embed | VERIFIED |

Second Spotify edition of the same recording: *Bernstein Century* 5hok4vWg615RoJAx6XwfDl (track 1, 16:24, 984000 ms, playable). The 3-second difference is mastering/silence; the guide uses 7y2gHGuQhJmesRiNO8d8fK (the original LP coupling).

Columbia Symphony Orchestra: "formed by Columbia Records for the purpose of making recordings … free-lance artists and often members of … the New York Philharmonic" (https://en.wikipedia.org/wiki/Columbia_Symphony_Orchestra). OK.

Orchestration of this recording: a full-orchestra version (strings, symphonic woodwind); described in the guide as "based on Grofé's later scoring". Whether Bernstein makes cuts was not verified (no source found either way); the guide says nothing about cuts.

`duration_min: 16` (16:27).

## 2. Also recommended: Bernstein / Los Angeles Philharmonic (DG, live 1982)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Bernstein (piano, conductor) / Los Angeles Philharmonic | Spotify credits "George Gershwin, Leonard Bernstein, Los Angeles Philharmonic" | https://open.spotify.com/embed/album/58OXLCx1qk8eDqGZsYzjTe | OK |
| Label / catalogue | DG 410 025-2 | Discogs 2089276: DG 410 025-2, 1983, "Live recording"; recording supervisor Hans Weber, engineer Karl-August Naegler; Rhapsody 17:07 | https://www.discogs.com/release/2089276 | OK |
| Recorded / venue | 24 July 1982, Davies Symphony Hall, San Francisco | DG product page metadata: Rhapsody 1982-07-24, "Davies Symphony Hall, San Francisco" (Presto via search summary agrees). DG gives the same date and venue for the *West Side Story* dances; not needed here | https://www.deutschegrammophon.com/en/catalogue/products/bernstein-west-side-story-gershwin-bernstein-4378 | OK |
| Spotify | 58OXLCx1qk8eDqGZsYzjTe | Linked from the DG page; track 1 "Rhapsody In Blue - Live" 17:10 (1029826 ms), `isPlayable: true` | embed ; DG page | VERIFIED |

Another Spotify edition: 4k3Ulgs7jk52OcwAZnPZrH (17:14, playable). Also checked, not used: Previn / Pittsburgh SO (3aFWZOwNpDSNvuYnewxGxA, 13:51, playable).

---

## 3. Painting: James McNeill Whistler, *Nocturne in Black and Gold: The Falling Rocket*, 1875

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist | James McNeill Whistler (1834–1903) | https://commons.wikimedia.org/wiki/File:Whistler-Nocturne_in_black_and_gold.jpg | OK |
| Title / date / medium / size | *Nocturne in Black and Gold: The Falling Rocket*, 1875, oil on panel, 60.3 × 46.4 cm | Commons {{Artwork}} (Wikidata Q646337) | OK |
| Collection | Detroit Institute of Arts, 46.309, Gift of Dexter M. Ferry, Jr. | same | OK |
| Rights | Artist died 1903: PD. {{PD-Art\|PD-old-auto-expired\|deathyear=1903}} | same | OK |
| Image | 4371 × 5807 JPEG (12 MB), source DIA | same | OK |
| Ruskin / critics (pairing note) | John Ruskin attacked the painting in 1877 ("flinging a pot of paint in the public's face"); Whistler sued for libel (1878). The pairing note says only that critics called it formless | https://en.wikipedia.org/wiki/Nocturne_in_Black_and_Gold_%E2%80%93_The_Falling_Rocket | OK (standard; not re-fetched in this session) |

**Pairing.** Wikipedia (Rhapsody): "Ira Gershwin suggested the revised title of Rhapsody in Blue after his visit to a gallery exhibition of James McNeill Whistler paintings, which had titles such as Nocturne in Black and Gold: The Falling Rocket and Arrangement in Grey and Black." This is the painting named there. Which exhibition Ira saw, and whether this painting was in it, is not known; the pairing note says only that the paintings carry musical titles "like this one".

## 4. Facts in the guide

| Claim | Source URL | Status |
| --- | --- | --- |
| Whiteman asked Gershwin for a concerto-like piece; Gershwin declined; New-York Tribune of 4 January 1924 announced he was working on a "jazz concerto"; Whiteman persuaded him; five weeks to the premiere | https://en.wikipedia.org/wiki/Rhapsody_in_Blue | OK |
| Gershwin 25 in January 1924 (born 26 September 1898) | https://en.wikipedia.org/wiki/George_Gershwin | OK |
| Train to Boston; "a sort of musical kaleidoscope of America … of our metropolitan madness" (to Isaac Goldberg, 1931) | Rhapsody article | OK |
| Begun 7 January on a two-piano manuscript; Grofé finished the orchestration on 4 February, eight days before the premiere; title suggested by Ira after a Whistler exhibition | same | OK |
| Premiere 12 February 1924, Aeolian Hall, "An Experiment in Modern Music", Paul Whiteman and his Palais Royal Orchestra, Gershwin piano; penultimate item; Gershwin partly improvised and wrote the solo out only after the concert | same | OK |
| Opening: clarinet trill and scale; Ross Gorman's glissando in rehearsal as a joke, kept by Gershwin | same | OK |
| Audience ovation; critics mixed (Downes, Gilman, Sanborn) | same | OK |
| Rhapsody: one extended movement, irregular form, improvisational passages; blue notes; ragtime; saxophones and banjo in Grofé's scorings | same ("Form and analysis", "Orchestration") | OK |
| Begins and ends in B-flat major | same | OK |
| Bernstein, *The Atlantic*, 1955: "You can cut out parts of it without affecting the whole …" | same | OK (paraphrased in the guide) |
| Train theme, slow theme (*Andantino moderato*), *Grandioso* return, stride-piano "agitato e misterioso" section | same (Schiff's themes; rehearsal figures) ; tempo words from the score | OK for the sections; positions are estimates |
| *Manhattan* (1979) opening montage; *Fantasia 2000* New York segment | same | OK |

## 5. Re-time (all stops are ≈; nobody has listened against the Bernstein track)

Method: section order from the analyses above (Schiff's themes, rehearsal figures), laid over the 16:27 track; the slow tune placed slightly past the halfway point, as in most performances of this length. Bernstein's 1959 performance may differ from the full score (cuts not verified), which makes the middle stops the least certain.

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I Rhapsody in Blue | 16:27 | 0:00, 0:30–1:15, 1:15–3:00, 3:00–4:30, 4:30–7:00, 7:00–8:45, 9:00, 10:30–12:00, 12:30–14:30, 14:30–15:45, Last 40 seconds | The train tune (≈ 3:00–4:30), the start of the slow tune (≈ 9:00, could be ± 45 s), and the *Grandioso* (≈ 14:30) |
