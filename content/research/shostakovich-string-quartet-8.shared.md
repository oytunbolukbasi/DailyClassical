# Shared-file additions: shostakovich-string-quartet-8

For the merge into `content/paintings.yaml` and the glossary files. The composer (`shostakovich`) already exists in `content/composers.yaml`; nothing to add there.
Sources and checks: `content/research/shostakovich-string-quartet-8.md`. Checked 2026-10-10.

## 1. `content/paintings.yaml` (first choice)

```yaml
shostakovich-string-quartet-8:
  # Landscape ≈ 1.27:1. Kunsthaus Zürich version of the subject (Google Art Project scan); a second version
  # is in Dresden's Gemäldegalerie Alte Meister, but its only large Commons file is a CC BY 4.0 gallery photo.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Bernardo_Bellotto,_il_Canaletto_-_Le_rovine_del_vecchio_Kreuzkirche,_Dresda.jpg
  source_url: https://artsandculture.google.com/asset/MwGFEGKLmmoojQ
  commons_page: https://commons.wikimedia.org/wiki/File:Bernardo_Bellotto,_il_Canaletto_-_Le_rovine_del_vecchio_Kreuzkirche,_Dresda.jpg
  width: 3173
  height: 2500
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100-expired; artist d. 1780)
  credit_line: Bernardo Bellotto, The Ruins of the Old Kreuzkirche in Dresden, 1765. Kunsthaus Zürich. Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`medium` is assumed (Bellotto's vedute are oils on canvas; the Commons page leaves medium empty). Confirm on the Kunsthaus page before publishing.

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Vasily Vereshchagin | The Apotheosis of War | 1871 | State Tretyakov Gallery, Moscow (inv. 183) | https://commons.wikimedia.org/wiki/File:Vasily_Vereshchagin_-_%D0%90%D0%BF%D0%BE%D1%84%D0%B5%D0%BE%D0%B7_%D0%B2%D0%BE%D0%B9%D0%BD%D1%8B_-_Google_Art_Project.jpg (4000 × 2511, PD-Art, Google Art Project) | A pyramid of skulls in a dead landscape, which Vereshchagin dedicated to all great conquerors; a Russian image for a quartet dedicated to the victims of war. |
| B | Bernardo Bellotto | Dresden from the Right Bank of the Elbe below the Augustus Bridge | c. 1750 | National Gallery of Ireland, Dublin | https://commons.wikimedia.org/wiki/File:Bernardo_Bellotto,_il_Canaletto_-_Dresden_vom_rechten_Elbufer_unterhalb_der_Augustusbr%C3%BCcke_(National_Gallery_of_Ireland).jpg (3000 × 1812, PD) | Dresden whole, before the bombardments of 1760 and 1945. |

Vereshchagin died 1904: PD everywhere. Its subject is grim (skulls); the Bellotto ruin is the gentler, more specific link.

## 2. Glossary: new term

EN (`content/en/glossary.md`):

```markdown
| DSCH | Shostakovich's musical signature: D, E-flat, C, B | Shostakovich's initials turned into notes. In German spelling, D. Sch. becomes D, Es (E-flat), C, H (B natural); he signed many works with this four-note motif. |
```

TR (`content/tr/glossary.md`):

```markdown
| DSCH | DSCH | Şostakoviç'in müzikal imzası: Re, Mi bemol, Do, Si | Şostakoviç'in notalara çevrilmiş baş harfleri. Almanca yazılışta D. Sch., D, Es (Mi bemol), C, H (Si) notalarına dönüşür; besteci pek çok eserini bu dört notalık motifle imzaladı. |
```

Other terms used (already in the glossary): fugato, pedal note, unison.
