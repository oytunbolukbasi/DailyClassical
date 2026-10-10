# Shared-file additions: schubert-string-quartet-14

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/schubert-string-quartet-14.md` §4–5.

## 1. `content/paintings.yaml` (first choice)

```yaml
schubert-string-quartet-14:
  # Yorck Project / Google Art Project file. The Belvedere's own photo is on Commons at 3508 × 2968:
  # File:Egon_Schiele_-_Tod_und_Mädchen_-_3171_-_Österreichische_Galerie_Belvedere.jpg (PD-Art; photo also CC BY-SA 4.0).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Egon_Schiele_-_Der_Tod_und_das_M%C3%A4dchen.jpg
  source_url: https://digital.belvedere.at/objects/1968/tod-und-madchen
  commons_page: https://commons.wikimedia.org/wiki/File:Egon_Schiele_-_Der_Tod_und_das_M%C3%A4dchen.jpg
  width: 5880
  height: 4947
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-1923; artist d. 1918)
  credit_line: Egon Schiele, Death and the Maiden (Tod und Mädchen), 1915. Belvedere, Vienna (Inv. 3171). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Hans Baldung Grien (c. 1484–1545) | *Death and the Maiden* (*Der Tod und das Mädchen*) | 1517 | Kunstmuseum Basel (Inv. 18) | https://commons.wikimedia.org/wiki/File:Gw11_0001031_20170619_001_Baldung_Der_Tod_und_das_Maedchen.jpg (2810 × 6013, public domain; very tall, ≈ 1:2.1) | The old image behind Claudius's poem and Schubert's song: Death seizes a weeping girl by the hair and points to the ground; the inscription reads "Hie must du yn" (here you must go in). |
| B | Marianne Stokes (1855–1927) | *Death and the Maiden* | c. 1908 | Musée d'Orsay, Paris (RF 1978 36) | https://commons.wikimedia.org/wiki/File:La_Jeune_Fille_et_la_Mort-Marianne_Stokes-IMG_8224.JPG (4788 × 3285; gallery photo CC BY-SA 2.0 fr / CeCILL, credit the photographer "Rama") | A dark, winged Death with a lantern comes to the bedside of a young girl who sits up, clutching a red cover: the night visit of Claudius's poem. |

Both descriptions were checked against the images. Alternative A shows a nude figure: consider the app's audience before choosing it. The Commons photo includes the arched gilt frame: crop needed.

## 3. Glossary rows (new terms only)

**Lied** is also used in `schubert-piano-sonata-21`; **Tarantella** only here. Add once.

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Lied | A German art song for voice and piano | A German art song, usually a poem set for one voice with piano. Schubert wrote more than six hundred. |
| Tarantella | A whirling Italian dance in fast 6/8 time | A fast, whirling folk dance from southern Italy in 6/8 time. Legend linked it to the bite of the tarantula spider. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Lied | Lied | Ses ve piyano için Alman sanat şarkısı | Genellikle bir şiirin tek ses ve piyano için bestelendiği Alman sanat şarkısı. Schubert altı yüzden fazla lied yazdı. |
| Tarantella | Tarantella | 6/8'lik, hızlı ve fırıl fırıl dönen bir İtalyan dansı | Güney İtalya'dan, 6/8'lik hızlı, fırıl fırıl dönen bir halk dansı. Efsaneye göre tarantula örümceğinin ısırığıyla ilişkilendirilirdi. |
```

Sources: "more than six hundred" songs — Schubert's composers.yaml bio / Wikipedia *Franz Schubert* ("more than 600 secular vocal works (mainly lieder)"); tarantella and the tarantula legend — Wikipedia *String Quartet No. 14 (Schubert)*, IV ("a breakneck Italian dance in 6/8 time, that, according to tradition, was a treatment for madness and convulsions brought on by the bite of a tarantula spider").

## 4. Composers

None (Schubert is already in `content/composers.yaml`).
