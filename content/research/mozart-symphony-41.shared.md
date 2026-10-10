# Shared-file additions: mozart-symphony-41

For the batch merger. Group C. Nothing here has been written to the shared files.

## 1. `content/paintings.yaml` (first choice)

```yaml
mozart-symphony-41:
  # Portrait format (1952 × 2250, ≈ 0.87:1): plan the hero crop. AIC's own IIIF master is 13750 × 15846
  # (image_id 3b8084b4-5fb4-700a-bc0a-16e6fa4698b8); the IIIF server refused scripted downloads during research,
  # so fetch it by hand for a sharper master if wanted. AIC marks the work public domain, data CC0.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Hubert_Robert_-_The_Obelisk_-_1900.383_-_Art_Institute_of_Chicago.jpg
  source_url: https://www.artic.edu/artworks/57049
  commons_page: https://commons.wikimedia.org/wiki/File:Hubert_Robert_-_The_Obelisk_-_1900.383_-_Art_Institute_of_Chicago.jpg
  width: 1952
  height: 2250
  medium: Oil on canvas
  license: Public domain (PD-Art; Art Institute of Chicago open access, CC0)
  credit_line: Hubert Robert, The Obelisk, 1787. Art Institute of Chicago, Gift of Clarence Buckingham (1900.383). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Piece-file values: artist Hubert Robert; title *The Obelisk* (TR *Dikilitaş*); year 1787; collection Art Institute of Chicago (TR Chicago Sanat Enstitüsü).

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Jean-Auguste-Dominique Ingres | *Jupiter and Thetis* | 1811 | Musée Granet, Aix-en-Provence | File:Jean Auguste Dominique Ingres - Jupiter et Thétis.jpg (2540 × 3232, PD-old-100; gallery photo released by the photographer) | The god the symphony was later named after, enthroned and immovable: a Neoclassical image of the grandeur the nickname suggests. Ingres is also the first choice for `allegri-miserere`; use him for one piece only |
| B | Hubert Robert | *The Fountains* | 1787–88 | Art Institute of Chicago (1900.385) | File:Hubert Robert - The Fountains - 1900.385 - Art Institute of Chicago.jpg (1957 × 2250, PD-Art / CC0) | A pendant of the first choice: the same years, the same monumental Classical architecture, here with water and light. Use only if *The Obelisk* is rejected for a reason that does not apply to its pendant |

## 3. Glossary: new rows

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Counterpoint | Two or more independent melodies combined at once | The art of combining two or more independent melodies so that they sound together as one texture, each keeping its own shape. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Counterpoint | Kontrpuan | Aynı anda yürüyen iki ya da daha çok bağımsız ezgi | İki ya da daha fazla bağımsız ezgiyi, her biri kendi biçimini koruyarak birlikte tek bir doku oluşturacak şekilde aynı anda yürütme sanatı. |
```

Other terms used here already exist: sonata form, exposition, development, recapitulation, coda, muted, syncopation, minuet, trio, fugato.

## 4. `content/research/retime-needed.md` rows

```
| Mozart – Symphony No. 41 | I Allegro vivace | – | 11:28 | – | Mackerras / SCO, Spotify `0MNU78TPr4GbVdgRBsBL6L` (track 12) | 0:00, 1:25, 2:05, 2:40, 3:10, 6:20, 7:25, 8:10, Near the end | Derived from bar positions (313 bars, exposition repeated), not heard |
| Mozart – Symphony No. 41 | II Andante cantabile | – | 10:27 | – | same (track 13) | 0:00, 0:55, 1:25, 2:15, 4:35, 5:15, 7:30, Near the end | Assumes Mackerras repeats both halves; if he repeats only the first, 4:35, 5:15 and 7:30 are wrong (drop 7:30) |
| Mozart – Symphony No. 41 | III Menuetto: Allegretto | – | 5:03 | – | same (track 14) | 0:00, Second half of the minuet, 2:35, Second half of the trio, 3:45 | Trio and da capo estimated from bar counts |
| Mozart – Symphony No. 41 | IV Molto allegro | – | 11:30 | – | same (track 15) | 0:00, 0:30, 1:05, 2:20, 4:40, 5:40, 7:35, 10:30, 10:45, Near the end | Both repeats taken (duration arithmetic). Least certain: the exposition fugato (≈ 0:30) |
```
