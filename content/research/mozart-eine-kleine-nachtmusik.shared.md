# Shared-file additions: mozart-eine-kleine-nachtmusik

Group C, October 2026 second batch. Details and sources in `content/research/mozart-eine-kleine-nachtmusik.md`.

## 1. paintings.yaml

First choice: Jean-Antoine Watteau, *Mezzetin* (Met). Watteau is already in `paintings.yaml` once (*Fêtes vénitiennes*, `vivaldi-four-seasons-spring`); kept because it is the classic painted serenade. If that reuse is not wanted, take alternative A.

```yaml
mozart-eine-kleine-nachtmusik:
  # Portrait ≈ 0.78:1 (canvas 55.2 × 43.2 cm). Commons file is the Met's collection image (larger than the Met's current open-access JPEG, 1520 × 1932).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Jean-Antoine_Watteau_-_Mezzetin.JPG
  source_url: https://www.metmuseum.org/art/collection/search/437926
  commons_page: https://commons.wikimedia.org/wiki/File:Jean-Antoine_Watteau_-_Mezzetin.JPG
  width: 2261
  height: 2904
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100-1923; artist d. 1721)
  credit_line: Jean-Antoine Watteau, Mezzetin, ca. 1718–20. The Metropolitan Museum of Art, New York, Munsey Fund, 1934 (34.138). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Alternatives:

- **A. Bernardo Bellotto, *Vienna Viewed from the Belvedere Palace*, 1758–61.** Kunsthistorisches Museum, Vienna (GG 1669). Commons `File:Bernardo Bellotto, called Canaletto - Vienna Viewed from the Belvedere Palace - Google Art Project.jpg` (7403 × 4663, PD-Art). Pairing: the city where the serenade was written, a generation earlier. (Also the alternative offered for `mozart-piano-concerto-20`; Bellotto is already in `paintings.yaml` once, `shostakovich-string-quartet-8`.)
- **B. Francesco Guardi, *Venetian Gala Concert*, 1782.** Alte Pinakothek, Munich. Commons `File:Francesco-Guardi Venezianisches-Galakonzert-8574 833139 BSTGS.jpg` (3000 × 2207; the museum's file is tagged CC BY-SA 4.0, a faithful reproduction of a PD work, so no new right under EU DSM art. 14) or `File:Francesco Guardi 052.jpg` (2024 × 1507, PD-Art, Yorck; too small for the 1800 px hero). Pairing: an ensemble of string players at an evening entertainment in the 1780s.

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Mannheim rocket | A fast figure shooting up the notes of a chord | A quick, bold melody that rises through the notes of a chord, named after the orchestra of Mannheim, which made it a trademark in the 18th century. |
| Romance | A gentle, song-like piece or slow movement | A tender, song-like piece; in the late 18th century often the title of a slow movement in a simple, lyrical style. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Mannheim rocket | Mannheim roketi | Bir akorun notalarından hızla yükselen figür | Bir akorun notalarından yukarı fırlayan hızlı, cesur bir ezgi; adını, 18. yüzyılda onu kendi imzası hâline getiren Mannheim orkestrasından alır. |
| Romance | Romans | Yumuşak, şarkı gibi bir parça ya da yavaş bölüm | Şefkatli, şarkı gibi bir parça; 18. yüzyılın sonlarında çoğu zaman sade, lirik üslupta bir yavaş bölümün başlığı. |

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Mozart – Serenade No. 13, "Eine kleine Nachtmusik" | I Allegro | – | 5:35 | – | Karajan / BPh 1981, Spotify `6CdIDKRlOFGvor0KrpCsdw` (track 1) | 0:00, 0:17, 0:33, 0:47, 1:00, 1:36, 3:12, 3:47, 4:30, Last 15 seconds | New piece, never timed by ear. From the Mutopia score (137 bars, exposition repeat only, ≈ 1.75 s a bar). Least certain: 4:30 |
| Mozart – Serenade No. 13, "Eine kleine Nachtmusik" | II Romance | – | 5:28 | – | same (track 2) | 0:00, 0:54, 1:47, 2:47, 3:14, 4:11, 5:01 | Assumes every repeat is taken (98 bars played, ≈ crotchet 72) |
| Mozart – Serenade No. 13, "Eine kleine Nachtmusik" | III Menuetto | – | 2:28 | – | same (track 3) | 0:00, 0:27, 0:54, 2:01 | Assumes the da capo without repeats |
| Mozart – Serenade No. 13, "Eine kleine Nachtmusik" | IV Rondo | – | 3:17 | – | same (track 4) | 0:00, 0:20, 0:48, 1:17, 1:44, 2:07, Last 20 seconds | ≈ 1.2 s a bar, no second-half repeat. Least certain: 1:44, 2:07 |
