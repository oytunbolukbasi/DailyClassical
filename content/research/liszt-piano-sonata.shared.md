# Shared-file additions: liszt-piano-sonata (batch G)

Everything here belongs in a shared file; merge by hand. Sources for the painting are in
`content/research/liszt-piano-sonata.md` §3; composer sources are at the end of this file.

## 1. `content/paintings.yaml`

```yaml
liszt-piano-sonata:
  # The Met's own Open Access photograph (CC0), mirrored on Commons at the same size.
  # The photo shows a thin dark border around the canvas: crop it in the master before `npm run images`.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Christ_Asleep_during_the_Tempest_MET_DP-14343-001.jpg
  source_url: https://www.metmuseum.org/art/collection/search/436176
  commons_page: https://commons.wikimedia.org/wiki/File:Christ_Asleep_during_the_Tempest_MET_DP-14343-001.jpg
  width: 4000
  height: 3296
  medium: Oil on canvas
  license: Public domain (CC0, The Met Open Access)
  credit_line: Eugène Delacroix, Christ Asleep during the Tempest, ca. 1853. The Metropolitan Museum of Art, New York, H. O. Havemeyer Collection, Bequest of Mrs. H. O. Havemeyer, 1929 (29.100.131). Image via The Met Open Access, public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Eugène Delacroix | *Christ on the Sea of Galilee* (another version of the same subject) | 1854 | Walters Art Museum, Baltimore (37.186) | File:Eugène_Delacroix_-_Christ_on_the_Sea_of_Galilee_-_Google_Art_Project_(27796212).jpg (5081 × 4135, PD-Art; Walters images are CC0) | The same storm-and-stillness idea, painted a year after the sonata was finished. |
| B | John Martin | *The Great Day of His Wrath* | 1851–3 | Tate, London (N05613) | File:John_Martin_-_The_Great_Day_of_His_Wrath_-_Google_Art_Project.jpg (3136 × 2023, PD-Art) | An apocalyptic Romantic vision painted in exactly the years of the sonata; for its storms rather than its quiet end. |

## 2. Glossary (new term)

`content/en/glossary.md`:

```
| Thematic transformation | One theme reshaped to take on a new character | Changing a theme's speed, rhythm, harmony or mood so that the same notes come back with a different character: a fierce idea, for example, reborn as a love song. |
```

`content/tr/glossary.md`:

```
| Thematic transformation | Tematik dönüşüm | Yeni bir karaktere bürünen aynı tema | Bir temanın hızını, ritmini, armonisini ya da havasını değiştirerek aynı notaların başka bir karakterle geri dönmesi; örneğin sert bir fikrin bir aşk şarkısı olarak yeniden doğması. |
```

Used in: `liszt-piano-sonata` (EN `[[thematic transformation]]`, TR `[[thematic transformation|tematik dönüşüm]]`).

## 3. `content/composers.yaml` (new composer `liszt`)

```yaml
- id: liszt
  match: Franz Liszt
  sort_name: Liszt, Franz
  born: 1811
  died: 1886
  era: romantic
  names:
    en: { name: Franz Liszt, short: Liszt }
    tr: { name: Franz Liszt, short: Liszt }
  nationality: { en: Hungarian, tr: Macar }
  facts:
    born: { en: "22 October 1811, Raiding (Doborján), Hungary", tr: "22 Ekim 1811, Raiding (Doborján), Macaristan" }
    died: { en: "31 July 1886, Bayreuth", tr: "31 Temmuz 1886, Bayreuth" }
    symphonies: { en: "Two: *A Faust Symphony* and the *Dante Symphony*", tr: "İki: *Faust Senfonisi* ve *Dante Senfonisi*" }
    best_known_for: { en: "Piano Sonata in B minor, *Hungarian Rhapsodies*, symphonic poems", tr: "Si minör Piyano Sonatı, *Macar Rapsodileri*, senfonik şiirleri" }
  bio:
    en: |-
      Liszt was born in 1811 in Raiding (Doborján in Hungarian), a village in the Kingdom of Hungary, where his father worked as a steward for Prince Esterházy. He was a child prodigy. In Vienna he studied piano with Carl Czerny and composition with Antonio Salieri, and in 1823 the family settled in Paris. In 1832 he heard the violinist Niccolò Paganini, and set out to do for the piano what Paganini had done for the violin.

      He became the most celebrated pianist in Europe. He toured all over the continent, gave the solo piano recital its modern form, and caused such excitement that the poet Heinrich Heine coined the word "Lisztomania". His daughter Cosima, from his relationship with the Countess Marie d'Agoult, later married Richard Wagner. In 1848 he settled in Weimar as court music director, with Princess Carolyne zu Sayn-Wittgenstein. There he conducted new music by Wagner and Berlioz, including the premiere of *Lohengrin* in 1850, and wrote his own most ambitious works: the symphonic poems, the *Faust Symphony* and the Piano Sonata in B minor.

      In the 1860s he moved to Rome and in 1865 took minor orders in the Catholic Church, becoming "Abbé Liszt". From 1872 he divided his year between Rome, Weimar and Budapest, where he helped to found the music academy that now bears his name. He taught hundreds of pianists and never charged for lessons. His late piano pieces are sparse and strange, and look ahead to the music of the 20th century. He died in Bayreuth in 1886.
    tr: |-
      Liszt 1811'de, Macaristan Krallığı'na bağlı Raiding (Macarca Doborján) köyünde doğdu; babası orada Esterházy prensinin kâhyasıydı. Harika bir çocuktu. Viyana'da Carl Czerny'den piyano, Antonio Salieri'den kompozisyon dersi aldı; aile 1823'te Paris'e yerleşti. 1832'de kemancı Niccolò Paganini'yi dinledi ve Paganini'nin keman için yaptığını piyano için yapmaya karar verdi.

      Avrupa'nın en ünlü piyanisti oldu. Bütün kıtayı dolaşan turneler yaptı, solo piyano resitaline bugünkü biçimini verdi ve öyle bir heyecan yarattı ki şair Heinrich Heine bunun için "Lisztomani" sözcüğünü uydurdu. Kontes Marie d'Agoult ile ilişkisinden doğan kızı Cosima, sonradan Richard Wagner'le evlendi. 1848'de Prenses Carolyne zu Sayn-Wittgenstein ile birlikte saray müzik direktörü olarak Weimar'a yerleşti. Orada Wagner'in ve Berlioz'un yeni eserlerini yönetti, 1850'de *Lohengrin*'in ilk temsili de bunlardan biriydi; kendi en iddialı eserlerini de orada yazdı: senfonik şiirler, *Faust Senfonisi* ve Si minör Piyano Sonatı.

      1860'larda Roma'ya taşındı ve 1865'te Katolik Kilisesi'nde alt rütbeden ruhban oldu; artık "Abbé Liszt" diye anılıyordu. 1872'den sonra yılını Roma, Weimar ve Budapeşte arasında bölüştürdü; Budapeşte'de bugün onun adını taşıyan müzik akademisinin kuruluşuna yardım etti. Yüzlerce piyanist yetiştirdi ve derslerinden hiç ücret almadı. Geç dönem piyano eserleri yalın ve tuhaftır; 20. yüzyılın müziğini önceden sezer. 1886'da Bayreuth'ta öldü.
  portrait:
    artist: Henri Lehmann
    title: { en: Portrait of Franz Liszt, tr: Franz Liszt'in Portresi }
    year: "1839"
    collection: { en: "Musée Carnavalet, Paris", tr: "Carnavalet Müzesi, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Liszt_(Lehmann_portrait).jpg
    source_url: https://commons.wikimedia.org/wiki/File:Liszt_(Lehmann_portrait).jpg
    width: 4760
    height: 6256
    license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1882)
    focal_y: 0.15
```

### Sources for the `liszt` entry (append to `content/research/composers-sources.md`)

```markdown
## Franz Liszt (added 2026-10-10, batch G)
- Facts: https://en.wikipedia.org/wiki/Franz_Liszt · https://www.wikidata.org/wiki/Q41309 (P569 1811-10-22, P570 1886-07-31, P19 Raiding Q660821, P20 Bayreuth Q3923)
- Born in Doborján (now Raiding, Austria), then in the Kingdom of Hungary; father a land steward for Prince Nikolaus II Esterházy. Studied with Czerny (piano) and Salieri (composition) in Vienna; settled in Paris 1823. Heard Paganini in 1832 and resolved to match his virtuosity. Gave the solo recital its modern form. Heine coined "Lisztomania" (1844). Daughter Cosima (with Marie d'Agoult) married Wagner. Weimar court Kapellmeister from 1848 (resigned 1858, left 1859); Princess Carolyne zu Sayn-Wittgenstein; premiered *Lohengrin* 1850; thirteen symphonic poems, the first twelve 1848–58. Minor orders 1865 ("Abbé Liszt"). From 1872 divided time between Rome, Weimar and Budapest; helped establish the Budapest academy that bears his name. "Liszt did not charge for lessons"; pupil estimates run to over 400. Late works experimental, anticipating 20th-century developments.
- "Toured widely": Wikipedia lead ("He toured widely").
- Symphonies: *A Faust Symphony* and the *Dante Symphony* (Wikipedia, list of works; the Dante Symphony was not in the fetched excerpt — standard).
- Nationality "Hungarian": Liszt called himself Hungarian; Wikipedia's lead: "a Hungarian composer".
- Portrait: Henri Lehmann (1814–1882), *Portrait of Franz Liszt*, 1839, oil on canvas, Musée Carnavalet, Paris (Commons category "Franz Liszt (Henri Lehmann - Musée Carnavalet)", "Images from Paris Musées").
  https://commons.wikimedia.org/wiki/File:Liszt_(Lehmann_portrait).jpg — 4760 × 6256, {{PD-Art|PD-old-auto-expired|deathyear=1882}}. focal_y 0.15 (face at about 20 % from the top; checked on a thumbnail). A square crop exists as File:Liszt_(Lehmann_portrait)_(cropped).jpg (3860 × 3862).
  Considered: Bain News Service photograph (LOC, 4229 × 5885, PD) — undated late photograph; Friedrich von Amerling, 1838 (Christie's scan, 3200 × 3965). The Lehmann is the best-documented, highest-resolution painted portrait.
```
