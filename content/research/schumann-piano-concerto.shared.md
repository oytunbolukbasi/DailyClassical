# Shared-file additions: schumann-piano-concerto

For the batch merger. Group F. Nothing here has been written to the shared files.

## 1. `content/paintings.yaml` (first choice)

```yaml
schumann-piano-concerto:
  # Portrait format (4026 × 5467); check the hero crop keeps the woman and the city skyline.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Carl_Gustav_Carus_-_Barge_Trip_on_the_Elbe_near_Dresden_(Morning_on_the_Elbe)_-_Google_Art_Project.jpg
  source_url: https://www.wikidata.org/wiki/Q28839402
  commons_page: https://commons.wikimedia.org/wiki/File:Carl_Gustav_Carus_-_Barge_Trip_on_the_Elbe_near_Dresden_(Morning_on_the_Elbe)_-_Google_Art_Project.jpg
  width: 4026
  height: 5467
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1869)
  credit_line: Carl Gustav Carus, Barge Trip on the Elbe near Dresden (Die Kahnfahrt auf der Elbe bei Dresden), c. 1827. Museum Kunstpalast, Düsseldorf (M 130). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`source_url` is Wikidata; swap in the Kunstpalast online-collection page if found. Piece-file values: artist Carl Gustav Carus; title *Barge Trip on the Elbe near Dresden* (TR *Dresden Yakınlarında Elbe'de Kayık Gezisi*); year c. 1827; collection Museum Kunstpalast, Düsseldorf.

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Ludwig Richter | *Bridal Procession in a Spring Landscape* (*Der Brautzug im Frühling*) | 1847 | Galerie Neue Meister, Dresden (Gal.-Nr. 2230), oil on canvas, 93 × 150 cm | File:Dresden, Albertinum, Ludwig Richter, der Brautzug im Frühling.JPG (4180 × 2639, **CC BY 4.0**, photo Dguendel; PD fallback File:Adrian Ludwig Richter 005.jpg, 1927 × 1184) | A bride and groom walk out of a spring wood into the light, painted in Dresden two years after Schumann finished his concerto there for Clara. **Similar subject to the Grieg pairing** (group G: Gude/Tidemand, *Bridal Procession on the Hardangerfjord*) |
| B | Johan Christian Dahl | *View of Dresden by Moonlight* | 1839 | Nasjonalmuseet, Oslo | File:Johan Christian Dahl - View of Dresden by Moonlight - Google Art Project (NwHK-NsdInFfMQ).jpg (7162 × 3786, PD-Art) | Dresden, where Schumann completed the concerto, by night: a dreamy view for the Eusebius side of the music. Dahl is already used once (group B, Beethoven 23) |

## 3. Glossary: new rows

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Attacca | Go straight on into the next movement, without a pause | Italian for "attack": the next movement begins at once, with no break, so the two are heard as one continuous piece. |
| Hemiola | Two bars of three beats regrouped into three pairs | A rhythmic shift in which two bars of three beats are accented as if they were three groups of two, so they sound like one long bar of three slow beats. The beat seems to stumble or stretch. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Attacca | Attacca | Ara vermeden bir sonraki bölüme geçmek | İtalyanca "saldır": sonraki bölüm hiç ara vermeden hemen başlar, böylece iki bölüm kesintisiz tek bir müzik gibi duyulur. |
| Hemiola | Hemiola | Üç vuruşlu iki ölçünün üç ikiliye bölünmesi | Üç vuruşlu iki ölçünün, sanki üç tane ikili grupmuş gibi vurgulanması; böylece iki ölçü, üç yavaş vuruşlu tek bir uzun ölçü gibi duyulur. Vuruş sanki tökezler ya da uzar. |
```

`attacca` is also used in `mendelssohn-violin-concerto` (same rows; add once). Other terms used here already exist: sonata form, exposition, development, recapitulation, cadenza, coda, tutti.

## 4. New composer: `schumann` (full `content/composers.yaml` entry)

```yaml
- id: schumann
  match: Robert Schumann
  sort_name: Schumann, Robert
  born: 1810
  died: 1856
  era: romantic
  names:
    en: { name: Robert Schumann, short: Schumann }
    tr: { name: Robert Schumann, short: Schumann }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "8 June 1810, Zwickau", tr: "8 Haziran 1810, Zwickau" }
    died: { en: "29 July 1856, Endenich, near Bonn", tr: "29 Temmuz 1856, Endenich, Bonn yakınları" }
    symphonies: { en: "Four", tr: "Dört" }
    best_known_for: { en: "Piano music, songs, Piano Concerto", tr: "Piyano eserleri, şarkıları, Piyano Konçertosu" }
  bio:
    en: |-
      Schumann was born in 1810 in Zwickau, in Saxony, the son of a bookseller and publisher, and he grew up loving literature as much as music. He went to university in Leipzig and Heidelberg to study law, but he soon gave it up for the piano and lessons with Friedrich Wieck, a famous teacher in Leipzig. A weakness in the fingers of his right hand, whose cause is still uncertain, ended his hopes of a career as a pianist, and by 1832 he had turned to composing.

      In 1834 he helped to found a music journal, the *Neue Zeitschrift für Musik*, and for ten years he wrote much of it himself, often signing as two imaginary characters: fiery Florestan and dreamy Eusebius. Through the 1830s he wrote mostly piano music, such as *Carnaval* and *Kinderszenen*. He fell in love with Wieck's daughter Clara, already a celebrated pianist; her father fought the match in court, and they married only in September 1840. That year he poured out songs, including the cycle *Dichterliebe*, and in 1841 he turned to symphonies.

      In 1844 the family moved to Dresden, and in 1850 to Düsseldorf, where he became the city's music director. In 1853 the twenty-year-old Brahms called on the Schumanns, and Robert hailed him in print as a genius. Soon afterwards his mental health collapsed. In February 1854 he threw himself into the Rhine, was rescued, and spent his last two years in an asylum at Endenich, near Bonn, where he died in 1856, aged 46. Clara outlived him by forty years and kept playing his music throughout her long career.
    tr: |-
      Schumann 1810’da Saksonya’daki Zwickau’da, kitapçı ve yayıncı bir babanın oğlu olarak doğdu; edebiyatı da müzik kadar severek büyüdü. Hukuk okumak için Leipzig ve Heidelberg üniversitelerine gitti, ama kısa süre sonra hukuku bırakıp piyanoya ve Leipzig’in ünlü öğretmeni Friedrich Wieck’in derslerine yöneldi. Sağ elinin parmaklarındaki, nedeni bugün de belirsiz bir güçsüzlük piyanist olma umutlarını bitirdi; 1832’ye gelindiğinde kendini besteciliğe vermişti.

      1834’te *Neue Zeitschrift für Musik* adlı bir müzik dergisinin kurucuları arasında yer aldı ve on yıl boyunca derginin büyük kısmını kendisi yazdı; yazılarını çoğu zaman uydurduğu iki karakterin adıyla imzaladı: ateşli Florestan ve hayalci Eusebius. 1830’lar boyunca çoğunlukla *Carnaval* ve *Çocukluktan Sahneler* (*Kinderszenen*) gibi piyano eserleri yazdı. Wieck’in, daha o yaşta ünlü bir piyanist olan kızı Clara’ya âşık oldu; babası bu evliliğe mahkemede karşı çıktı ve ikisi ancak Eylül 1840’ta evlenebildi. Schumann o yıl *Bir Şairin Aşkı* (*Dichterliebe*) döngüsü de dahil şarkı üstüne şarkı yazdı; 1841’de senfonilere yöneldi.

      Aile 1844’te Dresden’e, 1850’de de Schumann’ın şehrin müzik direktörü olduğu Düsseldorf’a taşındı. 1853’te yirmi yaşındaki Brahms Schumann’ları ziyaret etti; Robert onu bir yazısında dâhi diye selamladı. Kısa süre sonra ruh sağlığı çöktü. Şubat 1854’te kendini Ren Nehri’ne attı, kurtarıldı ve son iki yılını Bonn yakınlarındaki Endenich’te bir akıl hastanesinde geçirdi; 1856’da, 46 yaşında orada öldü. Clara ondan kırk yıl daha yaşadı ve uzun kariyeri boyunca onun müziğini çalmayı sürdürdü.
  portrait:
    artist: Josef Kriehuber
    title: { en: Robert Schumann, tr: Robert Schumann }
    year: "1839"
    collection: null
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Robert_Schumann_1839.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Robert_Schumann_1839.jpg
    width: 3100
    height: 3100
    license: Public domain (PD-Art, PD-old-100-1923; lithograph, artist d. 1876)
    focal_y: 0.2
```

### Composer sources (for `content/research/composers-sources.md`)

## Robert Schumann (added 2026-10, batch group F)
- Facts: https://en.wikipedia.org/wiki/Robert_Schumann (born 8 June 1810 Zwickau; father August, bookseller and publisher; Leipzig law 1828, Heidelberg 1829; Wieck pupil from 1829; finger problem, cause uncertain, composing by 1832; *Neue Zeitschrift für Musik* co-founded 1834, editor ten years; Florestan and Eusebius; married Clara 12 Sept 1840 after about four years of litigation; 1840 *Liederjahr*; four symphonies; Dresden Dec 1844–1850; Düsseldorf music director April 1850; Brahms visit 1853, "Neue Bahnen"; Rhine 27 Feb 1854; Endenich from 4 March 1854; died 29 July 1856, aged 46). Clara's death (May 1896) as in the Brahms entry above.
- "Poured out songs" is used instead of a number: Wikipedia counts 45 songs in the four 1840 cycles plus 26 in *Myrthen*; totals for the year differ between sources.
- Portrait: Josef Kriehuber (1800–1876), lithograph, 1839, Vienna (published by Pietro Mechetti; the BnF holds a full sheet, File:Robert Schumann - Kriehuber - btv1b8424855k.jpg, 5160 × 7816, dated 1840 there).
  https://commons.wikimedia.org/wiki/File:Robert_Schumann_1839.jpg — 3100 × 3100, cropped from File:Robert_Schumann_Litho.JPG, {{PD-Art|PD-old-100-1923}}. Holding collection of the cropped print not stated on Commons, hence `collection: null`. focal_y 0.2 (face in the upper quarter of the square crop). Commons quotes Schumann (1849): of his portraits, none is much good "except perhaps Kriehuber's".
  If a sharper, documented file is preferred: crop the BnF sheet (PD-France, PD-old) and set collection to Bibliothèque nationale de France, Paris.
