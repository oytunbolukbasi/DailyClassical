# Shared-file additions: beethoven-string-quartet-15

To merge into the shared files. Sources and checks: `content/research/beethoven-string-quartet-15.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
beethoven-string-quartet-15:
  # Google Art Project file of the Frick Collection's version (1826). Constable painted several versions:
  # V&A (1823), the Met (ca. 1825; CC0 but only 1955 × 1541), the Frick (1826). Wikidata Q19896698.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/John_Constable_-_Salisbury_Cathedral_from_the_Bishop%27s_Garden_-_Google_Art_Project.jpg
  source_url: http://collections.frick.org/view/objects/asitem/items$0040:79
  commons_page: https://commons.wikimedia.org/wiki/File:John_Constable_-_Salisbury_Cathedral_from_the_Bishop%27s_Garden_-_Google_Art_Project.jpg
  width: 5568
  height: 4397
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100-expired)
  credit_line: John Constable, Salisbury Cathedral from the Bishop's Garden, 1826. The Frick Collection, New York (1908.1.23). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

The `source_url` is the Frick object link recorded in Wikidata (P973); it was not opened during this check. Replace it with the Frick's current object page if it has moved.

## 2. Alternatives (in case of a clash)

| | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Caspar David Friedrich | Woman at a Window | 1822 | Alte Nationalgalerie, Berlin (A I 918) | `File:Caspar_David_Friedrich_-_Frau_am_Fenster_-_Google_Art_Project.jpg` (3072 × 4345, PD-Art; portrait format). Do not use the SMB's own CC BY-NC-SA photos | A woman stands in a bare, shaded room and looks out at light and masts beyond the window: the quiet of a sickroom and the world waiting outside, as in Beethoven's song of a man recovering. |
| B | John Constable | Salisbury Cathedral from the Bishop's Grounds | ca. 1825 | The Metropolitan Museum of Art, New York (50.145.8) | `File:Salisbury_Cathedral_from_the_Bishop's_Grounds_MET_DP164837.jpg` (CC0, **only 1955 × 1541**) | The same cathedral in the same clearing light, painted in the very year of the quartet. |

## 3. Glossary rows (new)

EN (`content/en/glossary.md`):

| Term | Short | Definition |
| --- | --- | --- |
| Lydian mode | An old church scale: like a major scale with a raised fourth | One of the old church modes. It sounds like a major scale with its fourth note raised a half step (F to F with B natural), which gives a bright, floating sound. |

TR (`content/tr/glossary.md`):

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Lydian mode | Lidya modu | Dördüncü notası yükseltilmiş majör gibi eski bir kilise dizisi | Eski kilise dizilerinden biri. Dördüncü notası yarım ses yükseltilmiş bir majör dizi gibi duyulur (Si bekarlı Fa'dan Fa'ya); bu da ona parlak, havada asılı bir renk verir. |

Used as `[[Lydian mode]]` (EN) and `[[Lydian mode|Lidya modu]]nda` (TR) in movement III. Checked with `parseContent` + `validateContent`: no problems.

## 4. Rows for `content/research/retime-needed.md`

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Beethoven – String Quartet No. 15 | I–V (all stops) | – | 8:52 / 8:31 / 17:10 / 2:03 / 6:02 | – | Takács Quartet / Decca 2004, Spotify `6tFl4rPDztyza1TSAOZP8i` (tracks 12–16) | I: 0:00, 0:30, 0:40, 1:50, 3:15, 4:30, 6:30, 7:30 · II: 0:00, 0:55, 4:15, 6:10, Near the end · III: 0:00, 4:05, 5:40, 9:45, 11:15, Near the end · IV: 0:00, 1:20, 1:50 · V: 0:00, 0:47, 1:20, 2:00, 2:40, 4:25, 4:40, Near the end | Derived from the Humdrum score and track lengths, not by ear. Least certain: I 3:15 / 6:30, the III section boundaries, V 0:47–2:40. Also confirm by ear: cello high in the V Presto, violin recitative over tremolo in IV |
