# Shared-file additions: mahler-symphony-3

For the batch editor to merge. Nothing here has been written to the shared files.
Sources and checks: `content/research/mahler-symphony-3.md` §3.

## 1. `content/paintings.yaml` entry (first choice)

```yaml
mahler-symphony-3:
  # The Getty's own Open Access image (CC0), served by its IIIF image service. Full size is 14389 × 7505;
  # the URL below asks for a 7194 px wide copy (7194 × 3752), which is plenty for the pipeline.
  # Full size: https://media.getty.edu/iiif/image/e9fcad31-3ce6-45c2-91db-611ecdf14aea/full/max/0/default.jpg
  # Commons mirror (3000 × 1565 only): File:Spring_in_the_Alps_by_Giovanni_Segantini.jpg. Wide format (≈ 1.9:1).
  image_url: https://media.getty.edu/iiif/image/e9fcad31-3ce6-45c2-91db-611ecdf14aea/full/7194,/0/default.jpg
  source_url: https://www.getty.edu/art/collection/object/109PHC
  commons_page: https://commons.wikimedia.org/wiki/File:Spring_in_the_Alps_by_Giovanni_Segantini.jpg
  width: 7194
  height: 3752
  medium: Oil on canvas
  license: Public domain (CC0, Getty Open Content)
  credit_line: Giovanni Segantini, Spring in the Alps, 1897. The J. Paul Getty Museum, Los Angeles (2019.3). Image via the Getty's Open Content Program, public domain.
  rights_status: public_domain
```

## 2. Alternative paintings (in case of a clash)

| | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Gustav Klimt (1862–1918) | *Attersee* | 1900 | Leopold Museum, Vienna | File:Gustav_Klimt_-_Attersee_-_Google_Art_Project.jpg (5689 × 5701, {{PD-Art-two-auto\|1918}}) | The lake where Mahler wrote the symphony, painted a few years later by Vienna's leading painter: nothing but water and light. Caveat: Klimt already pairs with Mahler 5, so use only if the same-artist rule is waived. |
| B | Akseli Gallen-Kallela (1865–1931) | *Lake Keitele* | 1905 | National Gallery, London (NG6574) | File:Akseli_Gallen-Kallela_-_Lake_Keitele,_1905.JPG (5422 × 4226, {{PD-Art\|PD-old-auto-1923\|deathyear=1931}}) | A still summer lake by the painter who made Mahler's portrait two years later; the calm of the long finale. |

## 3. New glossary rows

`Posthorn` is new (EN `[[posthorn]]`, TR `[[posthorn|posta borusuna]]`). `Offstage` is also used here; its rows are in `mahler-symphony-2.shared.md` (add once).

EN (`content/en/glossary.md`):

```
| Posthorn | A small valveless horn once blown on mail coaches | A small brass horn without valves, once blown by coachmen to announce the mail coach. It plays only a few notes, which gives it a simple, nostalgic sound. |
```

TR (`content/tr/glossary.md`):

```
| Posthorn | Posta borusu | Posta arabalarında çalınan küçük, pistonsuz boru | Pistonsuz, küçük bir bakır boru; eskiden arabacılar posta arabasının gelişini duyurmak için çalardı. Yalnızca birkaç nota çalabildiği için sade, nostaljik bir sesi vardır. |
```

Other glossary terms used in this piece already exist: Unison, Development, Recapitulation, Minuet, Scherzo, Glissando, Chorale.

## 4. New composers

None (Mahler exists).

## 5. `retime-needed.md` rows

See `content/research/mahler-symphony-3.md` §5 (all stops ≈).
