# Shared-file additions: tchaikovsky-serenade-for-strings

Group G, batch 2026-10b. Verification: `content/research/tchaikovsky-serenade-for-strings.md`.

## 1. paintings.yaml

First choice: Vasily Polenov, *Moscow Courtyard*, 1878, State Tretyakov Gallery.

```yaml
tchaikovsky-serenade-for-strings:
  # Landscape ≈ 1.21:1. Tretyakov version (inv. 2670); a smaller variant is in the Russian Museum.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Moscow_Courtyard_(Polenov,_1878).jpg
  source_url: https://www.wikidata.org/wiki/Q4304117
  commons_page: https://commons.wikimedia.org/wiki/File:Moscow_Courtyard_(Polenov,_1878).jpg
  width: 4999
  height: 4122
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1927)
  credit_line: Vasily Polenov, Moscow Courtyard, 1878. State Tretyakov Gallery, Moscow (inv. 2670). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the Wikidata item: the Tretyakov's object page was not located without a search. Replace it with the museum page at the merge if found. A Google Art Project scan (4000 × 3298) also exists: https://commons.wikimedia.org/wiki/File:Moscow_Courtyard_(Polenov,_1878)_-_Google_Art_Project.jpg

Alternatives:

- **A. Vasily Polenov, *Grandmother's Garden*, 1878.** State Tretyakov Gallery. Commons: https://commons.wikimedia.org/wiki/File:Wassilij_Dimitriewitsch_Polenow_001.jpg (2048 × 1818, public domain; on the small side). Pairing: an old woman and a young one in an overgrown manor garden; an eighteenth-century house remembered, like the Serenade's bow to Mozart, and the tenderness of the Élégie.
- **B. Arkhip Kuindzhi, *Birch Grove*, 1879.** Commons: https://commons.wikimedia.org/wiki/File:0828Ha._Kuindzhi_A.I._Birch_Grove,_1879.jpg (3324 × 2092, {{PD-old-70}}). Pairing: a Russian landscape in bright, clear light from the year before; the folk-song finale. (Also offered as an alternative for `tchaikovsky-symphony-4`.)

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Sonatina | A small sonata form, often without a development | A short, simple sonata form: the themes are presented and then return, with little or no development in between. |
| Waltz | A dance in three beats, with a strong first beat | A dance in three-four time that turns on a strong first beat followed by two lighter ones. It was the great ballroom dance of the nineteenth century. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Sonatina | Sonatin | Çoğu zaman gelişmesi olmayan küçük bir sonat formu | Kısa, sade bir sonat formu: temalar sergilenir ve aralarında çok kısa bir gelişmeyle ya da hiç gelişme olmadan geri gelir. |
| Waltz | Vals | Güçlü bir ilk vuruşla dönen üç zamanlı dans | Güçlü bir ilk vuruşun ardından iki hafif vuruşla dönen üç zamanlı bir dans. On dokuzuncu yüzyılın en sevilen balo dansıydı. |

("Waltz" is also in `tchaikovsky-symphony-5.shared.md`, identical; the merge skips the second copy.) Other terms used (already present): coda, double stop, pizzicato, muted.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Tchaikovsky – Serenade for Strings | I Pezzo in forma di sonatina | – | 8:43 | – | Karajan / BPO 1966, Spotify `6CHcWzCCVNEyF2I26M23CE` (track 4) | 0:00, 1:00, 1:50, 2:50, 4:30, 5:30, 7:25, Last 20 seconds | New piece, never timed by ear. Least certain: start of the Allegro (≈ 1:50), the return (≈ 4:30) |
| Tchaikovsky – Serenade for Strings | II Waltz | – | 3:56 | – | same (track 5) | 0:00, 0:30, 0:50, 1:15, 2:05, Last 30 seconds | Least certain: middle section (≈ 1:15) |
| Tchaikovsky – Serenade for Strings | III Élégie | – | 8:43 | – | same (track 6) | 0:00, 0:55, 1:50, 2:45, 4:00, 4:30, 5:20, 6:50, Last minute | Least certain: middle section (≈ 2:45), viola return (≈ 4:30) |
| Tchaikovsky – Serenade for Strings | IV Finale (Tema russo) | – | 7:17 | – | same (track 7) | 0:00, 1:05, 2:05, 3:00–4:00, 4:05, 5:10, 6:25, Last 40 seconds | Least certain: end of the Andante (≈ 1:05), first-movement reprise (≈ 6:25) |
