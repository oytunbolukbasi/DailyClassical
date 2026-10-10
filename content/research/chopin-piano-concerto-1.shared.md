# Shared-file additions: chopin-piano-concerto-1

For the batch merger. Group F. Nothing here has been written to the shared files.

## 1. `content/paintings.yaml` (first choice)

```yaml
chopin-piano-concerto-1:
  # Own photo on Commons; a thin strip of the gilt frame shows on all four sides. Crop the master to the
  # canvas before `npm run images` (as for rachmaninoff-piano-concerto-2) and record the crop here.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Kasprzycki_View_of_Morysinek_near_Wilanow.jpg
  source_url: https://commons.wikimedia.org/wiki/File:Wincenty_Kasprzycki_-_View_of_Morysinek_in_Wilan%C3%B3w_-_MP_299_-_National_Museum_in_Warsaw.jpg
  commons_page: https://commons.wikimedia.org/wiki/File:Kasprzycki_View_of_Morysinek_near_Wilanow.jpg
  width: 4620
  height: 3264
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1849)
  credit_line: Wincenty Kasprzycki, View of Morysinek (Widok Morysinka), 1834. National Museum in Warsaw. Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` points to the museum's own scan on Commons (file name gives inv. MP 299, not confirmed); replace with the cyfrowe.mnw.art.pl record if found. Medium "oil on canvas" is assumed from the photo, not read from a museum record: check. Piece-file values: artist Wincenty Kasprzycki; title *View of Morysinek* (TR *Morysinek Manzarası*); year 1834; collection National Museum in Warsaw (TR *Varşova Ulusal Müzesi*).

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Wincenty Kasprzycki | *Fine Arts Exhibition in Warsaw in 1828* | 1828 | National Museum in Warsaw (MP 298; Wikidata Q9380394), oil on canvas, 94.5 × 111 cm | File:Wincenty Kasprzycki - Fine arts exhibition in Warsaw in 1828 - Google Art Project.jpg (3354 × 2925, PD-Art) | Warsaw society of Chopin's student years, gathered at the university for an exhibition two years before the concerto. Safest documentation; less lyrical |
| B | Johan Christian Dahl | *Larvik by Moonlight* | 1839 | Nasjonalmuseet, Oslo (NG.M.00034), oil on canvas, 99 × 156 cm | File:Johan Christian Dahl - Larvik by Moonlight - Google Art Project.jpg (10071 × 6421, PD-Art) | A harbour under the moon: Chopin's "reverie in the moonlight" for the Romance. No Polish link |

## 3. Glossary: new rows

EN:

```
| Krakowiak | A lively Polish dance from Kraków, with off-beat kicks | A fast Polish folk dance from the Kraków region, in two beats, with syncopated accents that kick against the beat. |
| Nocturne | A dreamy "night piece", usually for piano | A "night piece": a slow, dreamy piece with a singing melody over a flowing accompaniment, a form Chopin made famous. |
```

TR:

```
| Krakowiak | Krakowiak | Krakov'dan, vuruş dışı vurgulu canlı bir Polonya dansı | Krakov yöresinden, iki vuruşlu, hızlı bir Polonya halk dansı; senkoplu vurguları vuruşa karşı tekme atar gibidir. |
| Nocturne | Noktürn | Çoğunlukla piyano için düşsel bir "gece parçası" | Bir "gece parçası": akan bir eşliğin üzerinde şarkı gibi bir melodisi olan yavaş, düşsel bir eser; Chopin'in ünlü kıldığı bir tür. |
```

`nocturne` is also used in `chopin-piano-sonata-2` (add once). Existing terms used: sonata form, exposition, tutti, development, recapitulation, coda, muted, rondo, unison, syncopation.

## 4. New composer: `chopin` (full `content/composers.yaml` entry)

```yaml
- id: chopin
  match: Frédéric Chopin
  sort_name: Chopin, Frédéric
  born: 1810
  died: 1849
  era: romantic
  names:
    en: { name: Frédéric Chopin, short: Chopin }
    tr: { name: Frédéric Chopin, short: Chopin }
  nationality: { en: Polish, tr: Polonyalı }
  facts:
    born: { en: "1 March 1810, Żelazowa Wola, near Warsaw", tr: "1 Mart 1810, Żelazowa Wola, Varşova yakınları" }
    died: { en: "17 October 1849, Paris", tr: "17 Ekim 1849, Paris" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "Piano music: nocturnes, ballades, études, mazurkas, polonaises", tr: "Piyano eserleri: noktürnler, baladlar, etütler, mazurkalar, polonezler" }
  bio:
    en: |-
      Chopin was born in 1810 in Żelazowa Wola, a village west of Warsaw, to a French father, Nicolas, who had settled in Poland, and a Polish mother. The family moved to Warsaw when he was a baby, and Polish was spoken at home. He was giving public concerts by the age of seven, and from 1826 he studied composition with Józef Elsner at the Warsaw Conservatory. In November 1830 he left to make his name abroad. A few weeks later the November Uprising broke out at home, and he never saw Poland again.

      He reached Paris in 1831 and stayed for the rest of his life. He disliked large halls and gave only about thirty public concerts; he earned his living by teaching and played mostly in private salons. In 1836 he met the novelist George Sand. They were together from 1838 to 1847, spending a difficult winter on Mallorca and most summers at her country house at Nohant, where he wrote many of his finest works.

      Almost everything he wrote involves the piano: nocturnes, études, ballades, preludes, scherzos, and the Polish dances, mazurkas and polonaises, that kept his homeland in his music. Often ill, he gave his last Paris concert in February 1848 and toured Britain that year. He died in Paris on 17 October 1849, aged 39, and the funeral march from his Second Piano Sonata was played at his graveside.
    tr: |-
      Chopin 1810’da, Varşova’nın batısındaki Żelazowa Wola köyünde, Polonya’ya yerleşmiş Fransız bir baba, Nicolas, ile Polonyalı bir annenin çocuğu olarak doğdu. Aile o daha bebekken Varşova’ya taşındı; evde Lehçe konuşulurdu. Yedi yaşında halka açık konserler veriyordu; 1826’dan itibaren Varşova Konservatuvarı’nda Józef Elsner’le kompozisyon çalıştı. Kasım 1830’da adını yurtdışında duyurmak için yola çıktı. Birkaç hafta sonra memleketinde Kasım Ayaklanması patlak verdi ve Chopin Polonya’yı bir daha hiç görmedi.

      1831’de Paris’e vardı ve hayatının geri kalanını orada geçirdi. Büyük salonları sevmezdi; hayatı boyunca yalnızca otuz kadar halka açık konser verdi. Geçimini ders vererek sağladı, çoğunlukla da özel salonlarda çaldı. 1836’da romancı George Sand’la tanıştı. 1838’den 1847’ye kadar birlikte oldular; zorlu bir kışı Mallorca’da, yazların çoğunu da Sand’ın Nohant’taki kır evinde geçirdiler. Chopin en güzel eserlerinin birçoğunu orada yazdı.

      Yazdığı hemen her şeyde piyano var: noktürnler, etütler, baladlar, prelüdler, scherzolar ve memleketini müziğinde yaşatan Polonya dansları, mazurkalar ve polonezler. Sık sık hastalanan Chopin, son Paris konserini Şubat 1848’de verdi ve o yıl Britanya’da turneye çıktı. 17 Ekim 1849’da, 39 yaşında Paris’te öldü; mezarı başında İkinci Piyano Sonatı’nın cenaze marşı çalındı.
  portrait:
    artist: Eugène Delacroix
    title: { en: Frédéric Chopin, tr: Frédéric Chopin }
    year: "1838"
    collection: { en: "Musée du Louvre, Paris", tr: "Louvre Müzesi, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Fr%C3%A9d%C3%A9ric_Chopin_-_Eug%C3%A8ne_Delacroix_-_Mus%C3%A9e_du_Louvre_Peintures_RF_1717.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Fr%C3%A9d%C3%A9ric_Chopin_-_Eug%C3%A8ne_Delacroix_-_Mus%C3%A9e_du_Louvre_Peintures_RF_1717.jpg
    width: 4328
    height: 5400
    license: Public domain (PD-Art, PD-old-70; artist d. 1863)
    focal_y: 0.25
```

### Composer sources (for `content/research/composers-sources.md`)

## Frédéric Chopin (added 2026-10, batch group F)
- Facts: https://en.wikipedia.org/wiki/Fr%C3%A9d%C3%A9ric_Chopin (Żelazowa Wola, 46 km west of Warsaw; baptismal record gives 22 February 1810, the family used 1 March, now generally accepted: the card says 1 March; father Nicolas from Lorraine, emigrated 1787, mother Justyna Krzyżanowska, Polish spoken at home; Warsaw from October 1810; public concerts by seven; Elsner at the Warsaw Conservatory from autumn 1826; left Warsaw 2 Nov 1830, less than a month before the November Uprising, never returned; Paris 5 Oct 1831; about 30 public appearances, salons and teaching; met George Sand 1836, lovers by July 1838, ended 1847; Mallorca 8 Nov 1838–13 Feb 1839; Nohant summers 1839–1846; last Paris concert Feb 1848; Britain 1848; died 17 Oct 1849, Paris, aged 39; nearly all works feature the piano).
- Funeral march at the graveside: Reber's orchestration played at Père Lachaise on 30 October 1849 (https://en.wikipedia.org/wiki/Piano_Sonata_No._2_(Chopin)).
- Nationality: Polish (French father; he lived in France from 1831). Shown as "Polish".
- Portrait: Eugène Delacroix (1798–1863), *Frédéric Chopin*, 1838, oil on canvas, 45.5 × 38 cm, Musée du Louvre, Paris (RF 1717; Wikidata Q132325364). Originally part of a double portrait with George Sand, later cut up (the Sand half is in Copenhagen): background only, not in the bio.
  https://commons.wikimedia.org/wiki/File:Fr%C3%A9d%C3%A9ric_Chopin_-_Eug%C3%A8ne_Delacroix_-_Mus%C3%A9e_du_Louvre_Peintures_RF_1717.jpg — 4328 × 5400, photo by Commons user Shonagon (5 April 2024), {{PD-Art|PD-old-70}}. Checked at 400 px: no frame, face in the upper third (focal_y 0.25).
