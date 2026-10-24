# Shared-file additions: brahms-piano-concerto-2

For merging into `content/paintings.yaml`, the glossaries and `project-knowledge/content_status.md`. Sources: `content/research/brahms-piano-concerto-2.md`.

## 1. paintings.yaml

First choice:

```yaml
brahms-piano-concerto-2:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Tina_Blau_-_Fr%C3%BChling_im_Prater_-_2233_-_%C3%96sterreichische_Galerie_Belvedere.jpg
  source_url: https://digital.belvedere.at/objects/8033/fruhling-im-prater
  commons_page: https://commons.wikimedia.org/wiki/File:Tina_Blau_-_Fr%C3%BChling_im_Prater_-_2233_-_%C3%96sterreichische_Galerie_Belvedere.jpg
  width: 3508
  height: 2609
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-1923); photograph also CC BY-SA 4.0 (Belvedere)
  credit_line: Tina Blau, Spring in the Prater (Frühling im Prater), 1882. Belvedere, Vienna (Inv. 2233). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

The Belvedere page is behind a bot check and was not opened; inventory number, date and medium from Wikidata Q28008216. The licence situation (PD-Art plus the museum's CC BY-SA tag) is the same as for the Belvedere images already in the catalogue.

Alternatives (in case of a clash):

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Emil Jakob Schindler (d. 1892) | *Märzstimmung – Vorfrühling im Wienerwald* (March Mood: Early Spring in the Vienna Woods) | 1884 | Belvedere, Vienna (Inv. 4013) | https://commons.wikimedia.org/wiki/File:Emil_Jakob_Schindler_-_M%C3%A4rzstimmung_%E2%80%93_Vorfr%C3%BChling_im_Wienerwald_-_4013_-_%C3%96sterreichische_Galerie_Belvedere.jpg (2619 × 3508, portrait format; PD-Art + CC BY-SA 4.0) | The Vienna Woods, where Brahms finished the concerto at Pressbaum in 1881, painted three years later. |
| B | Emil Jakob Schindler | *Mühlwehr in Plankenberg* (Mill Weir at Plankenberg) | c. 1889–91 | Belvedere, Vienna (Inv. 2440) | https://commons.wikimedia.org/wiki/File:Emil_Jakob_Schindler_-_M%C3%BChlwehr_in_Plankenberg_-_2440_-_%C3%96sterreichische_Galerie_Belvedere.jpg (3508 × 2601, PD-Art + CC BY-SA 4.0) | A quiet landscape on the edge of the Vienna Woods, where the concerto was finished; calm water like the slow movement's cello song. |

Schindler's death year (1892) is from the Commons licence tag ({{Licensed-PD-Art|PD-old-auto-1923|cc-by-sa-4.0|deathyear=1892}}); dates and inventory numbers from Commons and Wikidata Q28002103.

## 2. Glossary

No new terms. Terms used, all existing: sonata form, cadenza, double exposition, development, recapitulation, coda, scherzo, trio, rondo.

## 3. Composer

Brahms is already in `content/composers.yaml`: nothing to add.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Brahms – Piano Concerto No. 2 in B-flat major | I Allegro non troppo | – | 18:22 | – | Gilels / Jochum, Spotify `58JzrSl3w7rVN0OqMxCdKc` (track 4) | 0:00, 0:45, 1:40, 2:35, 3:30, 5:50, 7:05, 8:05, 9:05, 10:20–11:20, 12:30, 17:10, Last 30 seconds | New piece, estimates from Hansen's bar timings (Brendel / Abbado) scaled × 1.022; least certain: development range and coda ≈ 17:10 |
| Brahms – Piano Concerto No. 2 in B-flat major | II Allegro appassionato | – | 9:31 | – | same (track 5) | 0:00, 0:40, 1:50, 3:40, 4:45, 5:50, 6:25, 7:05, Last 25 seconds | Scaled × 1.012; assumes Gilels takes the repeat of the first part |
| Brahms – Piano Concerto No. 2 in B-flat major | III Andante | – | 14:04 | – | same (track 6) | 0:00, 2:05, 2:55, 4:30, 6:45, 7:25, 9:25, 12:30, Last 30 seconds | Scaled × 1.145 (Gilels much slower than Brendel); least certain: Più adagio ≈ 7:25, cello's return ≈ 9:25 |
| Brahms – Piano Concerto No. 2 in B-flat major | IV Allegretto grazioso | – | 9:47 | – | same (track 7) | 0:00, 0:20, 1:15, 1:35, 2:00, 3:20, 5:15, 6:20, 7:50, Last 30 seconds | Scaled × 1.032; least certain: coda ≈ 7:50 |
