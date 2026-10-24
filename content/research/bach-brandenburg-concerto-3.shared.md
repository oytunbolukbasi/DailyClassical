# Shared-file additions: bach-brandenburg-concerto-3

For the merge (`python3 content/research/merge-drafts.py bach-brandenburg-concerto-3`). Details and sources in `content/research/bach-brandenburg-concerto-3.md`.

## 1. paintings.yaml

First choice: Pietro Longhi, *The Little Concert* (Il concertino), 1741, Gallerie dell'Accademia, Venice.

```yaml
bach-brandenburg-concerto-3:
  # No museum object page found for the Gallerie dell'Accademia; Wikidata item instead.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Accademia_-_Il_concertino_-_Pietro_Longhi.jpg
  source_url: https://www.wikidata.org/wiki/Q124251986
  commons_page: https://commons.wikimedia.org/wiki/File:Accademia_-_Il_concertino_-_Pietro_Longhi.jpg
  width: 4655
  height: 5609
  medium: Oil on canvas
  license: Public domain (painting); photograph by Didier Descouens, CC BY-SA 4.0
  credit_line: Pietro Longhi, The Little Concert (Il concertino), 1741. Gallerie dell'Accademia, Venice. Image via Wikimedia Commons, public domain (photo Didier Descouens, CC BY-SA 4.0).
  rights_status: public_domain
```

Cover crop: portrait format; the three players stand right of centre, between the card players (left) and the chandelier (top right). The file is 20 MB.

Alternatives:

1. **Philippe Mercier, *The Music Party* (Frederick, Prince of Wales, and his sisters), 1733.** National Portrait Gallery, London (NPG 1556). Commons: `File:Frederick, Prince of Wales, and his sisters by Philip Mercier.jpg` (2400 × 1858, PD-Art; the Commons page carries the NPG's copyright-claim notice, which does not apply to a PD 2D work in the EU but is worth knowing). Pairing: the prince plays the cello with his sisters at harpsichord and mandora; a courtly chamber group of the 1730s.
2. **Nicolas Lancret, *Dance before a Fountain*, by 1724.** Collection not checked for this note (Google Art Project file; probably the J. Paul Getty Museum). Commons: `File:Nicolas Lancret (French - Dance before a Fountain - Google Art Project.jpg` (8941 × 6690, PD-Art). Pairing: an open-air fête of the early 1720s, the years of the Brandenburg dedication, (scene not checked visually); a looser link (period and courtly entertainment) than the first choice.

## 2. Glossary

No new terms (`ritornello`, `continuo`, `cadenza` exist).

## 3. Composer

None: Bach is already in `content/composers.yaml`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Bach – Brandenburg Concerto No. 3 | I Allegro | – | 5:45 | – | Pinnock / The English Concert, Spotify `6MlgAP60OpI30CTTxyi8Q0` (track 8) | 0:00, 0:20, 1:50, 3:15, 3:45, Last 25 seconds | Estimate from 136 bars at ≈ 2.54 s per bar; interior landmarks not re-counted |
| Bach – Brandenburg Concerto No. 3 | II Adagio | – | 0:33 | – | same (track 9: Pinnock inserts an Adagio from BWV 1019a) | 0:00, Last 5 seconds | Content of the insert not heard: check instruments and that it ends on an open chord |
| Bach – Brandenburg Concerto No. 3 | III Allegro | – | 4:45 | – | same (track 10) | 0:00, 0:35, 1:11, 2:00, 2:58, Near the end | Estimate; 12 + 36 bars, both repeated, assumed |
