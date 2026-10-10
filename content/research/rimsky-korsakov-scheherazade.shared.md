# Shared-file additions: rimsky-korsakov-scheherazade

For the merge into `content/paintings.yaml`, the glossary files and `content/composers.yaml`.
Sources and checks: `content/research/rimsky-korsakov-scheherazade.md`. Checked 2026-10-10.

## 1. `content/paintings.yaml` (first choice)

```yaml
rimsky-korsakov-scheherazade:
  # Landscape ≈ 1.49:1. Google Art Project scan of the State Russian Museum painting (inv. Ж-2202).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Hovhannes_Aivazovsky_-_The_Ninth_Wave_-_Google_Art_Project.jpg
  source_url: https://artsandculture.google.com/asset/jgHuL-7yxgrOSw
  commons_page: https://commons.wikimedia.org/wiki/File:Hovhannes_Aivazovsky_-_The_Ninth_Wave_-_Google_Art_Project.jpg
  width: 5090
  height: 3420
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100; artist d. 1900)
  credit_line: Ivan Aivazovsky, The Ninth Wave, 1850. State Russian Museum, St Petersburg (Ж-2202). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Ivan Aivazovsky | The Storm at Cape Aya | 1899 | Per Commons: Wikidata Q56695887 (a Russian museum; confirm the name before use) | https://commons.wikimedia.org/wiki/File:%D0%98%D0%B2%D0%B0%D0%BD_%D0%9A._%D0%90%D0%B9%D0%B2%D0%B0%D0%B7%D0%BE%D0%B2%D1%81%D0%BA%D0%B8%D0%B9_-_%D0%91%D1%83%D1%80%D1%8F_(1899).jpg (4000 × 5706, portrait format, PD-Art, Google Arts & Culture) | A ship driven towards a cliff in a storm, the wreck of the finale. |
| B | Edmund Dulac | Scheherazade (illustration for *Stories from the Arabian Nights*) | 1907 | Book illustration (Hodder & Stoughton, 1907) | https://commons.wikimedia.org/wiki/File:Scheherazade.jpg (599 × 1275 only; a better scan would be needed) | The storyteller herself, from the most famous English edition of the tales of her generation. Dulac died 1953: PD in the EU/Turkey since 2024; published 1907, so PD in the US. |

Option B is the weaker fallback because of the image size.

## 2. Glossary: new term

EN (`content/en/glossary.md`):

```markdown
| Leitmotif | A recurring theme tied to a character or idea | A short theme linked to a character, object or idea, which returns whenever it appears or is meant. Wagner made the technique famous. |
```

TR (`content/tr/glossary.md`):

```markdown
| Leitmotif | Leitmotif | Bir karaktere ya da fikre bağlı, dönüp gelen tema | Bir karakter, nesne ya da fikirle ilişkilendirilen ve o her göründüğünde ya da anıldığında geri dönen kısa bir tema. Bu tekniği Wagner ünlü yaptı. |
```

Other terms used (already in the glossary): unison, pizzicato, muted, cadenza.

## 3. `content/composers.yaml`: new composer `rimsky-korsakov`

```yaml
- id: rimsky-korsakov
  match: Nikolai Rimsky-Korsakov
  sort_name: Rimsky-Korsakov, Nikolai
  born: 1844
  died: 1908
  era: late_romantic
  names:
    en: { name: Nikolai Rimsky-Korsakov, short: Rimsky-Korsakov }
    tr: { name: Nikolay Rimski-Korsakov, short: Rimski-Korsakov }
  nationality: { en: Russian, tr: Rus }
  facts:
    born: { en: "18 March 1844, Tikhvin", tr: "18 Mart 1844, Tihvin" }
    died: { en: "21 June 1908, Lyubensk, near Luga", tr: "21 Haziran 1908, Lyubensk, Luga yakınları" }
    symphonies: { en: "Three", tr: "Üç" }
    best_known_for: { en: "*Scheherazade*, *Capriccio espagnol*, operas", tr: "*Şehrazat*, *İspanyol Kapriçyosu*, operaları" }
  bio:
    en: |-
      Rimsky-Korsakov was born in 1844 in Tikhvin, east of St Petersburg, into a noble family. As a boy he loved the sea long before he had seen it, from books and from his older brother's stories of the navy, and he trained as a naval officer himself. At eighteen he sailed on the clipper *Almaz* on a voyage that lasted two years and eight months, and he wrote the slow movement of his First Symphony during a stop in England. Back on shore he joined the circle of composers around Mily Balakirev, later known as The Five, who wanted a music that sounded Russian rather than German.

      In 1871, aged 27 and still a naval officer, he became professor of composition and orchestration at the St Petersburg Conservatory. He admitted that he knew little theory and had to teach himself as he went, becoming, as he put it, the conservatory's best pupil. He taught there for 35 years. His pupils included Glazunov, Prokofiev and Respighi, and he taught Stravinsky privately. He also prepared his friends' unfinished or unpolished works for performance, among them Mussorgsky's operas and Borodin's *Prince Igor*.

      His own music is famous for its brilliant orchestral colour: *Capriccio espagnol*, the *Russian Easter Festival Overture* and *Scheherazade*, the last two written in the summer of 1888, and fifteen operas drawn from Russian fairy tales and legends. In 1905 he defended students who were protesting during the revolution, was dismissed from the conservatory, and for a time the police banned his music, which caused an outcry in Russia and abroad. He died in 1908 at his country estate near Luga, south of St Petersburg.
    tr: |-
      Rimski-Korsakov 1844’te St. Petersburg’un doğusundaki Tihvin’de, soylu bir ailede doğdu. Çocukken denizi görmeden önce sevdi; kitaplardan ve ağabeyinin donanma öykülerinden tanıdı. Kendisi de deniz subayı olarak yetişti. On sekiz yaşında *Almaz* adlı klipere bindi ve iki yıl sekiz ay süren bir yolculuğa çıktı; Birinci Senfonisi’nin yavaş bölümünü yolculuğun İngiltere durağında yazdı. Karaya döndüğünde, Alman değil Rus gibi duyulan bir müzik isteyen ve sonradan “Beşler” diye anılacak olan Mili Balakirev çevresindeki bestecilere katıldı.

      1871’de, 27 yaşında ve hâlâ deniz subayıyken, St. Petersburg Konservatuvarı’nda kompozisyon ve orkestrasyon profesörü oldu. Kuramdan pek az şey bildiğini, öğretirken kendini de eğitmek zorunda kaldığını ve kendi deyişiyle konservatuvarın en iyi öğrencisi olduğunu itiraf etti. Orada 35 yıl ders verdi. Öğrencileri arasında Glazunov, Prokofyev ve Respighi vardı; Stravinski’ye de özel ders verdi. Dostlarının yarım kalmış ya da cilalanmamış eserlerini, aralarında Musorgski’nin operaları ve Borodin’in *Knyaz İgor*’u da olmak üzere, seslendirmeye hazırladı.

      Kendi müziği parlak orkestra renkleriyle ünlüdür: *İspanyol Kapriçyosu*, ikisi de 1888 yazında yazılan *Rus Paskalya Uvertürü* ve *Şehrazat*, bir de Rus masallarından ve efsanelerinden beslenen on beş opera. 1905’te devrim sırasında eylem yapan öğrencileri savundu, konservatuvardan uzaklaştırıldı ve müziği bir süre polis tarafından yasaklandı; bu yasak Rusya’da ve yurt dışında büyük tepki topladı. 1908’de St. Petersburg’un güneyinde, Luga yakınlarındaki çiftliğinde öldü.
  portrait:
    artist: { en: Valentin Serov, tr: Valentin Serov }
    title: { en: Portrait of Nikolai Rimsky-Korsakov, tr: Nikolay Rimski-Korsakov’un Portresi }
    year: "1898"
    collection: { en: "State Tretyakov Gallery, Moscow", tr: "Devlet Tretyakov Galerisi, Moskova" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Walentin_Alexandrowitsch_Serow_004.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Walentin_Alexandrowitsch_Serow_004.jpg
    width: 3840
    height: 3159
    license: Public domain (PD-Art, PD-old-100; painter d. 1911)
    focal_y: 0.2
```

### Composer sources (for `content/research/composers-sources.md`)

```markdown
## Nikolai Rimsky-Korsakov (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Nikolai_Rimsky-Korsakov · https://www.britannica.com/biography/Nikolay-Rimsky-Korsakov · https://www.wikidata.org/wiki/Q93227
- Dates are New Style: born 18 March 1844 (6 March O.S.), Tikhvin; died 21 June 1908 (Wikidata also lists 20 June), Lyubensk estate near Luga (now Plyussky District, Pskov Oblast). Love of the sea from reading and his brother's exploits; cruise on the clipper Almaz from late 1862, two years and eight months, three movements of the First Symphony completed and orchestrated before sailing, slow movement composed during a stop in England (the bio says only the latter). The Five. Professor at the St Petersburg Conservatory from 1871, aged 27, while in active naval service; "possibly its very best pupil"; 35-year tenure; pupils Glazunov, Lyadov, Prokofiev, Respighi; Stravinsky privately. Edited works of The Five (Mussorgsky; Borodin's Prince Igor). Fifteen operas. Scheherazade and the Russian Easter Festival Overture, summer 1888. 1905: supported student protesters, dismissed; police ban on his work after a student performance of Kashchey the Immortal. Three symphonies.
- Portrait: Valentin Serov (1865–1911), *Portrait of the composer N. A. Rimsky-Korsakov*, 1898, oil on canvas, 94 × 111 cm, State Tretyakov Gallery, commissioned by Pavel Tretyakov for his portrait gallery.
  https://commons.wikimedia.org/wiki/File:Walentin_Alexandrowitsch_Serow_004.jpg — 3840 × 3159 (landscape), {{PD-old-100}} + {{PD-Art-YorckProject}}. PD everywhere (painter d. 1911; published long before 1931).
- focal_y 0.2: the head sits in the upper right quarter of a landscape canvas; check the 300 pt crop keeps it in frame (horizontal crop may need attention).
```
