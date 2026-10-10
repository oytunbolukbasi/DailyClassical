# Shared-file additions: beethoven-symphony-3

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/beethoven-symphony-3.md` §1 and §3.

## 1. `content/paintings.yaml` (first choice)

```yaml
beethoven-symphony-3:
  # Gallery photo of the canvas (Commons user Sammyday, 2010). Thin strips of the frame show at the edges: crop
  # slightly. Portrait format (≈ 0.83:1): plan the hero crop around the head. The Louvre calls it an "esquisse",
  # a study for the portrait painted in Milan in 1796 (finished version at Versailles).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Antoine-Jean_Gros_-_Bonaparte_au_pont_d%27Arcole(1796).jpg
  source_url: https://collections.louvre.fr/ark:/53355/cl010063557
  commons_page: https://commons.wikimedia.org/wiki/File:Antoine-Jean_Gros_-_Bonaparte_au_pont_d%27Arcole(1796).jpg
  width: 3200
  height: 3861
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100-1923)
  credit_line: Antoine-Jean Gros, Bonaparte at the Pont d'Arcole (study), c. 1796. Musée du Louvre, Paris (RF 361). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Jacques-Louis David (1748–1825) | *Napoleon Crossing the Alps* (Vienna version; *Napoleon am Großen St. Bernhard*) | 1801 | Belvedere, Vienna (ÖG 2089; formerly Kunsthistorisches Museum GG 2342) | https://commons.wikimedia.org/wiki/File:Napoleon_at_the_Great_St._Bernard_-_Jacques-Louis_David_-_Google_Cultural_Institute.jpg (4897 × 5850, PD-Art, Google Art Project) | Bonaparte as First Consul, the hero Beethoven admired while he was planning the symphony, in the version of David's portrait that hangs in Vienna. |
| B | Antoine-Jean Gros (1771–1835) | *Bonaparte Visiting the Plague Victims of Jaffa* | 1804 | Musée du Louvre, Paris (INV 5064) | https://commons.wikimedia.org/wiki/File:Bonaparte_Visiting_the_Plague_Victims_of_Jaffa_by_Antoine-Jean_Gros,_INV_5064_(11_2012-06-29).jpg (4608 × 3456, **CC BY-SA 3.0** gallery photo: attribution needed) | Painted in 1804, the year Beethoven finished the symphony and struck out Napoleon's name: Bonaparte still shown as a hero, months before he crowned himself. |

Alternative A reuses an artist already in `paintings.yaml` (David, *The Death of Socrates*), and David is also the first choice for `beethoven-piano-concerto-5`; use it only if both the Gros and the Emperor painting change. Alternative B's image licence needs attribution; the Commons page's own description was not checked beyond the licence and size.

## 3. Glossary rows (new terms only)

Used here: **Hemiola** (I, ≈ 2:30). Already proposed by group F in `content/research/schumann-piano-concerto.shared.md`; the rows below are copied verbatim from it. Add once.

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Hemiola | Two bars of three beats regrouped into three pairs | A rhythmic shift in which two bars of three beats are accented as if they were three groups of two, so they sound like one long bar of three slow beats. The beat seems to stumble or stretch. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Hemiola | Hemiola | Üç vuruşlu iki ölçünün üç ikiliye bölünmesi | Üç vuruşlu iki ölçünün, sanki üç tane ikili grupmuş gibi vurgulanması; böylece iki ölçü, üç yavaş vuruşlu tek bir uzun ölçü gibi duyulur. Vuruş sanki tökezler ya da uzar. |
```

All other terms in this guide already exist: sonata form, exposition, development, recapitulation, coda, fugato, fugue, scherzo, trio, unison, variation, pizzicato.

## 4. Composers

None (Beethoven is already in `content/composers.yaml`).

## 5. Re-time rows

For `content/research/retime-needed.md`: see `beethoven-symphony-3.md` §5 (all stops are estimates; Karajan 1977, Spotify `4AAP5zYQJTEFQiQacOFq2s`).
