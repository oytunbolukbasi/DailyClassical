# Shared-file additions: dvorak-cello-concerto

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/dvorak-cello-concerto.md` §3–4.

## 1. `content/paintings.yaml` (first choice)

```yaml
dvorak-cello-concerto:
  # Gallery photograph, very large (12000 × 8870, 46 MB): the pipeline downscales it.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/1897_Slavi%C4%8Deck_Birkenstimmung_Nationalgalerie_Prag_anagoria.jpg
  source_url: https://sbirky.ngprague.cz/dielo/CZE:NG.O_9148
  commons_page: https://commons.wikimedia.org/wiki/File:1897_Slavi%C4%8Deck_Birkenstimmung_Nationalgalerie_Prag_anagoria.jpg
  width: 12000
  height: 8870
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1910)
  credit_line: Antonín Slavíček, Birch Mood (Břízová nálada), 1897. National Gallery Prague (O 9148). Image via Wikimedia Commons (photo anagoria), public domain.
  rights_status: public_domain
```

`source_url` is the National Gallery Prague online-collection address built from the inventory number O 9148 (Wikidata Q115539003) in the gallery's usual `CZE:NG.O_<number>` form; our request to the gallery's site was refused, so the page was not opened. Check it before merging, or use the Commons page.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Antonín Chittussi (1847–1891) | *The Chrudimka Valley* (Údolí Chrudimky) | 1887 | National Gallery Prague, O 10266 | https://commons.wikimedia.org/wiki/File:1887_Chittussi_Chrudimka-Tal_Nationalgalerie_Prag_anagoria.jpg (12000 × 9480, PD-Art) | A quiet river valley in eastern Bohemia by the Czech landscape painter of Dvořák's generation; the countryside Dvořák longed for in New York |
| B | George Inness (1825–1894) | *Niagara* | 1893 | Hirshhorn Museum and Sculpture Garden, Washington, D.C. | https://commons.wikimedia.org/wiki/File:George_Inness_-_Niagara_(1893)_-_Hirshhorn_Museum.jpg (5178 × 3324, PD) | The great American falls dissolving into mist, painted while Dvořák was living in America; the grandeur of the new world against the concerto's longing for the old. (No documented link between Dvořák and this painting.) |

## 3. Glossary rows

No new terms. This piece uses **Harmonics** (new row in `content/research/sibelius-violin-concerto.shared.md`) and **Double stop** (proposed by group E in `content/research/brahms-violin-concerto.shared.md`); all other terms are already in the glossary.

## 4. Composers

None (Dvořák is already in `content/composers.yaml`).
