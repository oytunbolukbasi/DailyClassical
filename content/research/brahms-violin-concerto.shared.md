# Shared-file additions: brahms-violin-concerto

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/brahms-violin-concerto.md` §3–4.

## 1. `content/paintings.yaml` (first choice)

```yaml
brahms-violin-concerto:
  # Google Art Project file, very large (16975 × 13387, 85.9 MB): the pipeline downscales it.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Szinyei_Merse,_P%C3%A1l_-_Picnic_in_May_-_Google_Art_Project.jpg
  source_url: https://en.mng.hu/artworks/picnic-in-may/
  commons_page: https://commons.wikimedia.org/wiki/File:Szinyei_Merse,_P%C3%A1l_-_Picnic_in_May_-_Google_Art_Project.jpg
  width: 16975
  height: 13387
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old; artist d. 1920)
  credit_line: Pál Szinyei Merse, Picnic in May (Majális), 1873. Hungarian National Gallery, Budapest. Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`source_url` is the Hungarian National Gallery's object page as listed on Wikidata (Q28797209, P973; inventory 1547). The server refused our scripted request (HTTP 451), so it was not opened; the Google Arts & Culture record is https://artsandculture.google.com/asset/JAFZGy3-8OmOnw.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Markus Pernhart (1824–1871) | *Wörthersee gegen Südwesten mit Mittagskogel* (The Wörthersee looking south-west, with the Mittagskogel) | not given (before 1871) | not given on Commons ("repro from artbook"); check before use | https://commons.wikimedia.org/wiki/File:Markus_Pernhart_-_W%C3%B6rthersee_gegen_S%C3%BCdwesten_mit_Mittagskogel3.jpg (6996 × 5082, PD-old-100) | The lake where Brahms spent the summer of 1878 writing the concerto, painted by a Carinthian contemporary. |
| B | Adolph Menzel (1815–1905) | *Afternoon in the Tuileries Gardens* | 1867 | National Gallery, London | https://commons.wikimedia.org/wiki/File:Adolph_Menzel,_Afternoon_in_the_Tuileries_Gardens,_1867.jpg (6026 × 4226, public domain) | A crowded, sunlit afternoon in a Paris park, painted a decade before the concerto, with the same easy open-air warmth. |

Alternative A has the strongest link (the place itself) but no confirmed date or holding; B is a museum work with a looser, mood-only link.

## 3. Glossary rows (new terms only)

Used here and in other group E pieces: **Trill** (also `schubert-piano-sonata-21`), **Double stop** (also `schubert-string-quartet-14`). Add once.

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Double stop | Two notes played at once on a string instrument | Bowing two strings at the same time, so that a single violinist or cellist sounds two notes together. |
| Trill | A rapid shake between two neighbouring notes | A rapid alternation between a note and the note just above it, which makes the sound shimmer or, low on the piano, rumble. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Double stop | Çift ses | Yaylı bir çalgıda aynı anda çalınan iki nota | Yayla iki teli birden çalmak; böylece tek bir kemancı ya da çellist iki notayı birlikte seslendirir. |
| Trill | Tril | Yan yana iki nota arasında hızlı titreşim | Bir notayla hemen üstündeki nota arasında hızla gidip gelmek; ses parıldar ya da piyanonun pesinde gürler. |
```

## 4. Composers

None (Brahms is already in `content/composers.yaml`).
