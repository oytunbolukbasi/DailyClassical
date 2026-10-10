# Shared-file additions: mendelssohn-violin-concerto

For the batch merger. Group F. Nothing here has been written to the shared files.

## 1. `content/paintings.yaml` (first choice)

```yaml
mendelssohn-violin-concerto:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Adolph_Menzel_-_Das_Balkonzimmer_-_Google_Art_Project.jpg
  source_url: https://www.wikidata.org/wiki/Q18683021
  commons_page: https://commons.wikimedia.org/wiki/File:Adolph_Menzel_-_Das_Balkonzimmer_-_Google_Art_Project.jpg
  width: 2908
  height: 3524
  medium: Oil on cardboard
  license: Public domain (PD-Art, PD-old-100-expired; artist d. 1905)
  credit_line: Adolph Menzel, The Balcony Room (Das Balkonzimmer), 1845. Alte Nationalgalerie, Staatliche Museen zu Berlin (A I 744). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

Portrait format (2908 × 3524): check the hero crop. **Same artist as `bach-brandenburg-concerto-5`** (group I: Menzel, *The Flute Concert of Frederick the Great*). Kept because it is the closest match (Berlin, 1845, the premiere year); if one Menzel per catalogue is preferred, use alternative B (Schwind). `source_url` is Wikidata; swap in the SMB online-collection page if preferred. Piece-file values: artist Adolph Menzel; title *The Balcony Room* (TR *Balkonlu Oda*); year 1845; collection Alte Nationalgalerie, Berlin.

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Adolph Menzel | *The Palace Garden of Prince Albrecht* (*Palaisgarten des Prinzen Albrecht*) | 1846 | Alte Nationalgalerie, Berlin | File:Berlin, Alte Nationalgalerie, Adolph Menzel, Palaisgarten des Prinzen Albrecht.JPG (3383 × 2811, gallery photo tagged PD; check for frame) | A sunny Berlin garden a year after the premiere; the same fresh, open light |
| B | Moritz von Schwind | *The Morning Hour* (*Die Morgenstunde*) | c. 1860 | Sammlung Schack, Munich (inv. 11559) | File:Moritz von Schwind - Die Morgenstunde - Sammlung Schack - 11559.jpg (5618 × 4646, PD-Art) | A young woman opens a window to the morning: the brightness of the finale. Not used elsewhere in the batch |

## 3. Glossary: new rows

EN:

```
| Double stop | Two notes played at once on a string instrument | Playing two strings at the same time on a violin, viola or cello, so one player can sound a melody and a second line, or a chord. |
```

TR:

```
| Double stop | Çift ses | Yaylı bir çalgıda aynı anda çalınan iki nota | Keman, viyola ya da viyolonselde iki teli aynı anda çalmak; böylece tek bir çalgıcı bir melodiyle birlikte ikinci bir çizgiyi ya da bir akoru duyurabilir. |
```

Also used here: `attacca` (new; rows in `schumann-piano-concerto.shared.md`, add once). Existing: cadenza, sonata form, development, recapitulation, coda, tremolo. Other violin-concerto groups (G, H) may propose "double stop" too; merge into one row.

## 4. New composer: `mendelssohn` (full `content/composers.yaml` entry)

```yaml
- id: mendelssohn
  match: Felix Mendelssohn
  sort_name: Mendelssohn, Felix
  born: 1809
  died: 1847
  era: romantic
  names:
    en: { name: Felix Mendelssohn, short: Mendelssohn }
    tr: { name: Felix Mendelssohn, short: Mendelssohn }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "3 February 1809, Hamburg", tr: "3 Şubat 1809, Hamburg" }
    died: { en: "4 November 1847, Leipzig", tr: "4 Kasım 1847, Leipzig" }
    symphonies: { en: "Five numbered, plus 13 early string symphonies", tr: "Beş numaralı, ayrıca 13 erken dönem yaylı senfonisi" }
    best_known_for: { en: "Violin Concerto, *A Midsummer Night's Dream*, *Songs without Words*", tr: "Keman Konçertosu, *Bir Yaz Gecesi Rüyası*, *Sözsüz Şarkılar*" }
  bio:
    en: |-
      Mendelssohn was born in Hamburg in 1809 into a wealthy, cultured family; his grandfather was the Jewish philosopher Moses Mendelssohn. The family moved to Berlin when he was two, the children were baptised as Protestants, and his parents later added the surname Bartholdy. Felix and his older sister Fanny, herself a gifted composer, grew up surrounded by music. At 16 he wrote his String Octet, and at 17 the overture to *A Midsummer Night's Dream*.

      In 1829, aged 20, he conducted Bach's *St Matthew Passion* in Berlin, a performance that helped bring Bach's music back into concert life. He travelled widely, to Italy and many times to Britain, and the journeys gave him the *Italian* Symphony, the *Scottish* Symphony and the *Hebrides* overture, inspired by Fingal's Cave. In 1835 he became director of the Gewandhaus Orchestra in Leipzig, and in 1843 he founded the Leipzig Conservatory.

      He worked at a furious pace as composer, conductor, pianist and organiser. His oratorio *Elijah* was first performed in Birmingham in 1846. In May 1847 his sister Fanny died suddenly, and less than six months later, on 4 November, he died in Leipzig after a series of strokes, aged 38. Later in the century his polished, light-filled music fell out of fashion, partly through antisemitism, but works such as the Violin Concerto never left the concert hall.
    tr: |-
      Mendelssohn 1809’da Hamburg’da varlıklı ve kültürlü bir ailede doğdu; dedesi Yahudi filozof Moses Mendelssohn’du. Aile o iki yaşındayken Berlin’e taşındı; çocuklar Protestan olarak vaftiz edildi, anne babası da sonradan soyadlarına Bartholdy’yi ekledi. Felix ve kendisi de yetenekli bir besteci olan ablası Fanny müziğin içinde büyüdü. On altı yaşında Yaylı Sekizli’sini, on yedi yaşında *Bir Yaz Gecesi Rüyası* uvertürünü yazdı.

      1829’da, yirmi yaşındayken Bach’ın *Matta Pasyonu*’nu Berlin’de yönetti; bu konser Bach’ın müziğinin konser hayatına geri dönmesine yardım etti. Çok gezdi: İtalya’ya ve defalarca Britanya’ya gitti. Bu yolculuklardan *İtalyan* ve *İskoç* senfonileri ile Fingal Mağarası’ndan esinlenen *Hebridler* uvertürü doğdu. 1835’te Leipzig’deki Gewandhaus Orkestrası’nın başına geçti, 1843’te Leipzig Konservatuvarı’nı kurdu.

      Besteci, şef, piyanist ve organizatör olarak soluk soluğa çalıştı. *İlyas* (*Elijah*) oratoryosu ilk kez 1846’da Birmingham’da seslendirildi. Mayıs 1847’de ablası Fanny ansızın öldü; altı ay bile geçmeden, 4 Kasım’da, kendisi de art arda geçirdiği felçlerin ardından 38 yaşında Leipzig’de öldü. Yüzyılın sonlarına doğru cilalı, ışık dolu müziği kısmen antisemitizm yüzünden gözden düştü; ama Keman Konçertosu gibi eserler konser salonlarından hiç eksik olmadı.
  portrait:
    artist: Theodor Hildebrandt
    title: { en: Felix Mendelssohn Bartholdy, tr: Felix Mendelssohn Bartholdy }
    year: "c. 1834"
    collection: { en: "Staatsbibliothek zu Berlin", tr: "Staatsbibliothek zu Berlin" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Theodor_Hildebrandt_-_Felix_Mendelssohn_Bartholdy.tif
    source_url: https://commons.wikimedia.org/wiki/File:Theodor_Hildebrandt_-_Felix_Mendelssohn_Bartholdy.tif
    width: 8161
    height: 9478
    license: Public domain (Public Domain Mark, Staatsbibliothek zu Berlin; artist d. 1874)
    focal_y: 0.3
```

Image notes: the master is a **TIFF with the gilt frame and a black backdrop**. Convert to JPEG and crop to the canvas before `npm run images -- --only mendelssohn` (the face sits about 40 % from the top of the framed file, about 30 % of the cropped canvas, hence focal_y 0.3).

### Composer sources (for `content/research/composers-sources.md`)

## Felix Mendelssohn (added 2026-10, batch group F)
- Facts: https://en.wikipedia.org/wiki/Felix_Mendelssohn (born 3 Feb 1809 Hamburg; grandfather Moses Mendelssohn; Berlin 1811; baptism 1816, parents 1822 and the name Bartholdy; Fanny; Octet 1825, *Midsummer Night's Dream* overture 1826; 13 string symphonies 1821–23, five numbered symphonies; *St Matthew Passion* 1829; ten visits to Britain, *Italian*, *Scottish*, *Hebrides*; Gewandhaus 1835; Leipzig Conservatory 1843; *Elijah* Birmingham 26 Aug 1846; Fanny died 14 May 1847; died 4 Nov 1847 Leipzig, aged 38, strokes; later decline partly through antisemitism).
- `match` is "Felix Mendelssohn" (the common English form); `sort_name` "Mendelssohn, Felix". The portrait title keeps "Mendelssohn Bartholdy", the name on the painting's record.
- Portrait: Theodor Hildebrandt (1804–1874), *Felix Mendelssohn Bartholdy*, oil on canvas, c. 1834, 59.5 × 49.5 cm, Staatsbibliothek zu Berlin – Preußischer Kulturbesitz, Musikabteilung (MA BA 136).
  https://commons.wikimedia.org/wiki/File:Theodor_Hildebrandt_-_Felix_Mendelssohn_Bartholdy.tif — 8161 × 9478, {{PDMark-owner}} (SBB: digitised public-domain originals stay public domain, Public Domain Mark 1.0). Source: https://resolver.staatsbibliothek-berlin.de/SBB00034FD100000000
  Rejected: British Museum lithograph after Eduard Magnus (File:Felix_Mendelssohn_Bartholdy_(BM_1862,0524.183).jpg) because the BM releases it under CC BY-NC-SA; Magnus's own 1846 painting exists on Commons only at 1399 × 1803 or smaller.
