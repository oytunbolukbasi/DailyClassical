# Shared-file additions: bach-keyboard-concerto-1

For the merge (`python3 content/research/merge-drafts.py bach-keyboard-concerto-1`). Details and sources in `content/research/bach-keyboard-concerto-1.md`.

## 1. paintings.yaml

First choice: Bernardo Bellotto, *Dresden from the Right Bank of the Elbe below the Augustus Bridge*, 1748, Gemäldegalerie Alte Meister, Dresden.

Note: Bellotto is already in `paintings.yaml` (`shostakovich-string-quartet-8`, *The Ruins of the Old Kreuzkirche in Dresden*). The Dresden link here is specific (Bach's 1736 court title and Frauenkirche recital; Wollny's 1738 theory), so it is proposed as the best match; if a second Bellotto is not wanted, use alternative 1.

```yaml
bach-keyboard-concerto-1:
  # No SKD object page checked; Wikidata item instead.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Canaletto_-_Dresden_seen_from_the_Right_Bank_of_the_Elbe,_beneath_the_Augusts_Bridge_-_Google_Art_Project.jpg
  source_url: https://www.wikidata.org/wiki/Q1258467
  commons_page: https://commons.wikimedia.org/wiki/File:Canaletto_-_Dresden_seen_from_the_Right_Bank_of_the_Elbe,_beneath_the_Augusts_Bridge_-_Google_Art_Project.jpg
  width: 6175
  height: 3486
  medium: Oil on canvas
  license: Public domain (PD-Art; Google Art Project)
  credit_line: Bernardo Bellotto, Dresden from the Right Bank of the Elbe below the Augustus Bridge, 1748. Gemäldegalerie Alte Meister, Staatliche Kunstsammlungen Dresden (Gal.-Nr. 606). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

Cover crop: wide landscape; keep the Frauenkirche dome (left of centre) and the bridge in frame.

Alternatives:

1. **Jean-Siméon Chardin, *A Lady Taking Tea*, 1735.** Hunterian Art Gallery, University of Glasgow. Commons: `File:Jean-Baptiste Siméon Chardin 018.jpg` (2024 × 1584, PD-Art; smaller than we like). Pairing: the coffee-and-tea culture of the 1730s, when Bach's Collegium Musicum gave weekly concerts in Zimmermann's coffee house in Leipzig (one theory for the concertos' purpose).
2. **Johann Georg Schreiber, *Katharinenstraße in Leipzig with Zimmermann's coffee house*, engraving, c. 1720.** Commons: `File:Café Zimmermann Katherinenstraße Leipzig 1720.jpg` (2500 × 2018, PD; reproduced from Gustav Wustmann, *Leipzig durch drei Jahrhunderte*, 1891). Pairing: the actual building where the Collegium Musicum played. An engraving, not a painting; holding collection not identified.

## 2. Glossary

New term used in this piece (also proposed by group B for `pachelbel-canon`; the merge keeps the first).

| Term | Short | Definition |
| --- | --- | --- |
| Ground bass | A short bass line repeated under changing music | A short bass line repeated over and over, while the music above it changes with each repeat. |

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Ground bass | Yinelenen bas | Değişen müziğin altında yinelenen kısa bir bas çizgisi | Üstündeki müzik her seferinde değişirken durmadan yinelenen kısa bir bas çizgisi. |

## 3. Composer

None: Bach is already in `content/composers.yaml`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Bach – Keyboard Concerto No. 1 | I Allegro | – | 7:10 | – | Perahia / ASMF, Spotify `2hUeyNhs4wbUTKkGybnhxu` (track 1) | 0:00, 0:13, 0:20–1:00, 2:15, 3:00–5:30, 6:20, Last minute | Estimate from bar landmarks (7, 27, 62, 172) with total ≈ 193 bars assumed |
| Bach – Keyboard Concerto No. 1 | II Adagio | – | 6:07 | – | same (track 2) | 0:00, 0:40, 2:30, 4:30, Near the end | Estimate by proportion only; bar count unknown |
| Bach – Keyboard Concerto No. 1 | III Allegro | – | 7:18 | – | same (track 3) | 0:00, 0:20–1:05, 2:10, 5:50, 6:55, Last 20 seconds | Estimate from ≈ 278 bars (landmarks 41, 84, 224, fermata ≈ 266); cadenza length unknown |
