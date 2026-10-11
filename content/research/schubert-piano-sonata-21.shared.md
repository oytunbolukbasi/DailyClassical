# Shared-file additions: schubert-piano-sonata-21

For merging into `content/paintings.yaml`. Sources: `content/research/schubert-piano-sonata-21.md` §4–5.

## 1. `content/paintings.yaml` (first choice)

```yaml
schubert-piano-sonata-21:
  # Switched at merge: Constable is used for beethoven-string-quartet-15; was alternative B.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Johan_Christian_Dahl_-_View_of_Dresden_by_Moonlight_-_Google_Art_Project_(NwHK-NsdInFfMQ).jpg
  source_url: https://commons.wikimedia.org/wiki/File:Johan_Christian_Dahl_-_View_of_Dresden_by_Moonlight_-_Google_Art_Project_(NwHK-NsdInFfMQ).jpg
  commons_page: https://commons.wikimedia.org/wiki/File:Johan_Christian_Dahl_-_View_of_Dresden_by_Moonlight_-_Google_Art_Project_(NwHK-NsdInFfMQ).jpg
  width: 7162
  height: 3786
  medium: Oil on canvas
  license: Public domain (PD-Art; artist d. 1857)
  credit_line: Johan Christian Dahl, View of Dresden by Moonlight, 1838. Nasjonalmuseet, Oslo. Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`source_url`: YCBA object URL built from the museum's internal id on the Google Arts & Culture record (`YCBA/lido-TMS-5001`); it answered HTTP 403 to our scripted request, so confirm it in a browser. The YCBA accession number (B1977.14.42 in some references) was not verified and is left out of the credit line.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Carl Gustav Carus (1789–1869) | *Balcony Room with a View of the Bay of Naples* (*Balkonzimmer mit Aussicht auf den Golf von Neapel*) | c. 1829–1830 | Alte Nationalgalerie, Staatliche Museen zu Berlin (FNG 59/92) | https://commons.wikimedia.org/wiki/File:Carl_Gustav_Carus_-_Balkon_in_Neapel_-_Google_Art_Project.jpg (4000 × 5409, PD-Art; portrait format) | An empty room, a guitar leaning against the wall and a bright bay beyond the open door, painted the year after Schubert's death: absence and calm, as in the sonata. |
| B | Johan Christian Dahl (1788–1857) | *View of Dresden by Moonlight* | 1838 | Nasjonalmuseet, Oslo | https://commons.wikimedia.org/wiki/File:Johan_Christian_Dahl_-_View_of_Dresden_by_Moonlight_-_Google_Art_Project_(NwHK-NsdInFfMQ).jpg (7162 × 3786, public domain) | A quiet river city under the moon, painted by a contemporary of Schubert: the sonata's calm, nocturnal glow. |

Alternative A's description was checked against the image.

## 3. Glossary rows

New terms used here: **Trill** (rows in `brahms-violin-concerto.shared.md`) and **Lied** (rows in `schubert-string-quartet-14.shared.md`). Nothing else to add.

## 4. Composers

None (Schubert is already in `content/composers.yaml`).
