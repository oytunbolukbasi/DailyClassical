# Verification: Sibelius – Symphony No. 7 in C major, Op. 105

Piece id `sibelius-symphony-7`. Checked on 2026-11-20 (batch 2026-11b, group G).
Files: `content/drafts/en/sibelius-symphony-7.md`, `content/drafts/tr/sibelius-symphony-7.md`.
Shared-file additions (paintings.yaml only): `content/research/sibelius-symphony-7.shared.md`.

**How the checks were done:** Spotify embed page `__NEXT_DATA__` from a Turkish network (2026-11-20); the Spotify track page's `music:album` meta tag to find the album; Discogs API (7319777, 26263610); the BIS-CD-864 booklet scan (notes by Andrew Barnett, 1997), https://eclassical.textalk.se/shop/art49/BIS-CD-864_booklet_scan.pdf-c28dce.pdf

**One track only.** Many Spotify albums split the Seventh into 3–5 tracks (Karajan/BPO, Barbirolli, Berglund/Helsinki, Colin Davis/Boston were checked and rejected for that reason). Vänskä/Lahti (BIS) and Berglund/COE keep it as one track.

## 1. Reference recording: Vänskä / Lahti Symphony Orchestra (BIS, 1997)

| Field | File value | Verified value | Source URL | Status |
| --- | --- | --- | --- | --- |
| Performers | Osmo Vänskä / Lahti Symphony Orchestra | Spotify credits; Discogs (leader Sakari Tepponen) | https://open.spotify.com/embed/album/5DLRIJkX4G0soM7YTKFX5t ; https://www.discogs.com/release/7319777 | OK |
| Label / catalogue | BIS-CD-864 | Discogs 7319777 ("© & ℗ 1997, Grammofon AB BIS"); Spotify track page release date 1997-11-30 | Discogs | OK |
| Recorded | August 1997 | AllMusic performance page gives 4–6 August 1997 (read from a search summary, https://www.allmusic.com/performance/symphony-no-7-in-c-major-op-105-mq0000317628); the booklet scan's recording-data page was not in the extracted text | – | NOTE (secondary) |
| Venue | Church of the Cross, Lahti | Booklet: the Church of the Cross (Alvar Aalto, 1978) "is also the venue for all the orchestra's recordings" | booklet | OK (inferred from the general statement) |
| Spotify | 5DLRIJkX4G0soM7YTKFX5t | "Sibelius: Symphonies Nos. 6 and 7 / Tapiola" (6 tracks); found via the `music:album` tag on track 7Kk2Qh483P2joXCQFXaPMf | embed | OK |

| Track | Work | ms | Time | isPlayable |
| --- | --- | --- | --- | --- |
| 5 | Symphony No. 7 in C major, Op. 105 | 1383120 | 23:03 | true |

`duration_min: 23`. Discogs lists 22:44 for the CD track; Spotify's 23:03 is used. Other tracks: Symphony No. 6 (8:37 / 6:31 / 3:24 / 8:43), *Tapiola* 17:56, all playable.

## 2. Also recommended: Berglund / Chamber Orchestra of Europe (Finlandia, 1997)

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Spotify | `4aEbfVNWhPI4PiVuCCGUvL` "Sibelius : Symphonies 1-7" (23 tracks); track 23 = Symphony No. 7, 22:04, one track, playable | https://open.spotify.com/embed/album/4aEbfVNWhPI4PiVuCCGUvL | OK |
| Label / catalogue | Finlandia Records 0630-17278-2 (Symphonies 5 & 7, 1997), Seventh 22:04; box 3984-23389-2 (1998) | https://www.discogs.com/release/26263610 ; https://www.discogs.com/release/18614428 | OK |
| Recorded / venue | Not given in the Discogs data; `null` | – | UNVERIFIED |

## 3. Painting: Albert Edelfelt, *Kaukola Ridge at Sunset*, 1889–90

| Field | Value | Source URL | Status |
| --- | --- | --- | --- |
| Artist / date / size | Albert Edelfelt (1854–1905), 1889/1890, oil on canvas, 83 × 116.5 cm (as given: width 83, height 116.5) | Commons (Google Art Project data from the Finnish National Gallery) | OK |
| Collection | Finnish National Gallery (GAP rights holder fng.fi); Ateneum Art Museum | Commons | OK (inventory number not recorded) |
| Rights | Died 1905; {{PD-Art\|PD-old-100-1923\|deathyear=1905}}; 4001 × 5613 | https://commons.wikimedia.org/wiki/File:Albert_Edelfelt_-_Kaukola_Ridge_at_Sunset_-_Google_Art_Project.jpg | OK |
| Not reused | No Edelfelt in `content/paintings.yaml` (Finnish paintings there: Gallen-Kallela, Järnefelt, Halonen) | – | OK |

**Pairing.** A Finnish lake landscape in Karelia (Kaukola) seen from a ridge, painted by the leading Finnish painter of the generation before Sibelius. The link is one of place and mood: Finnish nature in a single, continuous view under a golden light; the symphony is a single continuous span ending in C major. No claim that Sibelius knew this painting.

## 4. Facts in the guide

| Claim | Source | Status |
| --- | --- | --- |
| First mention in the diary, 18 December 1917 ("I have the Sixth and Seventh Symphonies in my head"), before the Fifth reached its final form | BIS booklet (Barnett) | OK |
| Letter to Axel Carpelan, 20 May 1918: "joy of life and vitality, with appassionato sections, in three movements, the last of them a 'Hellenic rondo'" | BIS booklet | OK |
| Four movements planned in the early 1920s; most material from the planned Adagio in C major; decision for one movement around 1923 | BIS booklet | OK |
| Finished 2 March 1924, often working at night; premiere 24 March 1924, Stockholm Concert Hall, Stockholm Konsertförening orchestra, Sibelius conducting | BIS booklet | OK |
| Title *Fantasia sinfonica* at the premiere; "Symphonie No. 7 (in einem Satze)" by 1925 when engraving was complete | BIS booklet | OK |
| Opening rising scale (*Adagio*); flute theme (bar 8) and the falling/rising motif from the earliest sketches; chorale-like string passage, "as if before the face of God"; trombone theme in C major; first change of pulse "more than eight minutes into the work", gradual quickening to *Vivacissimo*; second trombone appearance in "stormy C minor"; dance-like *Allegro molto moderato*, accelerando to *Presto*; third trombone appearance in C major; coda with reminiscences of the opening; ends on a C major chord | BIS booklet | OK |
| Opening timpani stroke; swirling strings in the *Vivacissimo*; strings rising to the final note | General knowledge of the score, not in the booklet text | NOTE |
| Last symphony; an Eighth worked on and destroyed; *Tapiola* (1926) his last substantial orchestral work; he died in 1957 | BIS booklet; composer sheet (`composers.yaml`, sibelius) | OK |
| Vänskä/Lahti: first recordings of the original versions of the Violin Concerto (BIS-CD-500, 1991) and the Fifth Symphony (BIS-CD-800, 1996) | BIS booklet (orchestra biography) | OK |

## 5. Re-time (all stops are ≈; derived from the booklet's description and the track length, not heard)

| Mvt | Track length | Stops (≈) | Least certain |
| --- | --- | --- | --- |
| I (one movement) | 23:03 | 0:00, 0:40, 2:30–4:30, 4:30, 5:30, 8:30, 10:00, 11:00, 13:30, 16:00, 17:30–19:30, 20:00, Last minute | First trombone theme (± 45 s); second trombone theme and the dance (± 1 min); third trombone (± 1 min) |
