# Shared-file additions: dvorak-string-quartet-12

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/dvorak-string-quartet-12.md` §3–4.

## 1. `content/paintings.yaml` (first choice)

```yaml
dvorak-string-quartet-12:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Theodore_Robinson_-_Canal_Scene_(1893).jpg
  source_url: https://www.terraamericanart.org/what-we-offer/our-art-collection/terra-collection-initiative-monet-and-the-artists-of-giverny-the-beginning-of-american-impressionism/
  commons_page: https://commons.wikimedia.org/wiki/File:Theodore_Robinson_-_Canal_Scene_(1893).jpg
  width: 3200
  height: 2375
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-1923; artist d. 1896)
  credit_line: Theodore Robinson, Canal Scene, 1893. Terra Foundation for American Art, Daniel J. Terra Collection (1992.131). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the Terra Foundation page given as the image source on Commons, not the object record (the Commons "references" link is a session URL that cannot be reused). Replace it with the Terra collection record for 1992.131 if one is found.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Theodore Robinson (1852–1896) | *Port Ben, Delaware and Hudson Canal* | 1893 | Pennsylvania Academy of the Fine Arts, Philadelphia, 1900.5 | https://commons.wikimedia.org/wiki/File:%27Port_Ben,_Delaware_and_Hudson_Canal%27_by_Theodore_Robinson,_1893.JPG (2220 × 1932, PD-Art; gallery photo by a Commons user, slight frame edge possible) | A big, bright summer sky over a canal village in New York State, painted in 1893, the summer of the quartet. Lower resolution |
| B | T. C. Steele (1847–1926) | *The Bloom of the Grape* | 1893 | Indianapolis Museum of Art at Newfields, 25.122 (Bequest of Delavan Smith) | https://commons.wikimedia.org/wiki/File:T.C._Steele_-_The_Bloom_of_the_Grape_-_Google_Art_Project.jpg (6412 × 4790, PD-Art-two-auto) | A Midwestern river valley painted by an Indiana artist in 1893, the year Dvořák spent the summer in the Midwest. It is an autumn scene, not summer |

## 3. Glossary rows

**New term: Pentatonic scale.**

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Pentatonic scale | A five-note scale heard in folk music worldwide | A scale of five notes instead of the usual seven, with no semitone steps between them. It gives melodies an open, folk-like sound found in music all over the world. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Pentatonic scale | Pentatonik dizi | Dünyanın her yerinde halk müziğinde duyulan beş sesli dizi | Alışılmış yedi yerine beş notadan oluşan, aralarında yarım ses adımı bulunmayan dizi. Ezgilere, dünyanın dört bir yanındaki müziklerde duyulan açık, halk ezgisi gibi bir tını verir. |
```

All other terms used are already in the glossary.

## 4. Composers

None (Dvořák is already in `content/composers.yaml`).
