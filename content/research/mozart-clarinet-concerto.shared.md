# Shared-file additions: mozart-clarinet-concerto

For the batch merger. Group C. Nothing here has been written to the shared files.

## 1. `content/paintings.yaml` (first choice)

```yaml
mozart-clarinet-concerto:
  # Landscape (3200 × 2258). A lower-resolution Google Art Project scan of the same painting also exists:
  # File:Joseph_Wright_of_Derby_-_Italian_Landscape_with_Mountains_and_a_River_-_Google_Art_Project.jpg (2401 × 1694).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Joseph_Wright_of_Derby_-_Italian_Landscape_with_Mountains_and_a_River_-_BF.1985.1_-_Museum_of_Fine_Arts.jpg
  source_url: https://www.mfah.org/art/detail/19379
  commons_page: https://commons.wikimedia.org/wiki/File:Joseph_Wright_of_Derby_-_Italian_Landscape_with_Mountains_and_a_River_-_BF.1985.1_-_Museum_of_Fine_Arts.jpg
  width: 3200
  height: 2258
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-1923)
  credit_line: Joseph Wright of Derby, Italian Landscape with Mountains and a River, c. 1790. Museum of Fine Arts, Houston, Sarah Campbell Blaffer Foundation (BF.1985.1). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Piece-file values: artist Joseph Wright of Derby; title *Italian Landscape with Mountains and a River* (TR *Dağlar ve Irmakla İtalyan Manzarası*); year c. 1790; collection Museum of Fine Arts, Houston (Sarah Campbell Blaffer Foundation) (TR Houston Güzel Sanatlar Müzesi (Sarah Campbell Blaffer Vakfı)).

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Pierre-Henri de Valenciennes | *Landscape of Ancient Greece* | 1786 | Detroit Institute of Arts (75.65) | File:Pierre Henri de Valenciennes - Landscape of Ancient Greece - 75.65 - Detroit Institute of Arts.jpg (2000 × 1310, PD) | An ideal Arcadian landscape of the same years: clear light, calm water, a serenity that matches the Adagio. Lower resolution than the first choice |
| B | Hubert Robert | *The Landing Place* | 1787–88 | Art Institute of Chicago (1900.384) | File:Hubert Robert - The Landing Place - 1900.384 - Art Institute of Chicago.jpg (1953 × 2250, PD-Art / CC0) | Under a vast colonnade some figures set off in a pleasure boat while others linger at the water's edge: a gentle leave-taking from the same years. Hubert Robert is the first choice for `mozart-symphony-41`; use him for one piece only |

## 3. Glossary: new rows

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Basset clarinet | A clarinet extended downwards, with extra low notes | A clarinet with a longer body that reaches four semitones lower than the ordinary instrument. Mozart wrote his Clarinet Concerto for it. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Basset clarinet | Basset klarnet | Aşağı doğru uzatılmış, ek pes notaları olan klarnet | Gövdesi daha uzun, sıradan klarnetten dört yarım ses daha pese inebilen bir klarnet. Mozart Klarnet Konçertosu'nu bu çalgı için yazdı. |
```

Other terms used here already exist: sonata form, double exposition, tutti, development, recapitulation, cadenza, coda, rondo.

## 4. `content/research/retime-needed.md` rows

```
| Mozart – Clarinet Concerto | I Allegro | – | 13:26 | – | King / ECO / Tate (Hyperion), Spotify `3UemBU0csyQmjZNyiU7c8R` (track 1) | 0:00, 2:05, 2:45, 3:45, 5:00, 5:45, 9:25, Near the end | Estimated from an assumed bar plan, not heard. Least certain: Theme 2 (≈ 3:45) and the recapitulation (≈ 9:25). Confirm there is no cadenza |
| Mozart – Clarinet Concerto | II Adagio | – | 7:52 | – | same (track 2) | 0:00, 0:40, 2:35, 4:40, 4:50, Near the end | Estimated; check whether King adds a lead-in at the pause (≈ 4:40) |
| Mozart – Clarinet Concerto | III Rondo: Allegro | – | 9:27 | – | same (track 3) | 0:00, 0:15, 1:30, 3:00, 3:45, 5:15, 6:00, Near the end | Section lengths assumed roughly equal (A–B–A–C–A–B–A); re-time all |
```
