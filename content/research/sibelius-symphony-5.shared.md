# Shared-file additions: sibelius-symphony-5

For merging into `content/paintings.yaml`, `content/composers.yaml` and `content/research/composers-sources.md`. Sources: `content/research/sibelius-symphony-5.md` §3 and §6 below. This is the first Sibelius piece in group H, so the new composer `sibelius` is defined here (`sibelius-violin-concerto` uses the same entry).

## 1. `content/paintings.yaml` (first choice)

```yaml
sibelius-symphony-5:
  # Museum image (Rijksmuseum Twenthe), very large (10572 × 7303, 15.3 MB): the pipeline downscales it.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Bruno_Liljefors_-_Knobbelzwanen_op_avondtrek_-_0211_-_Rijksmuseum_Twenthe.jpg
  source_url: https://collectie.rijksmuseumtwenthe.nl/zoeken-in-de-collectie/detail/id/436fb301-72ec-5c5c-bcd9-0fd3e9fcd11e
  commons_page: https://commons.wikimedia.org/wiki/File:Bruno_Liljefors_-_Knobbelzwanen_op_avondtrek_-_0211_-_Rijksmuseum_Twenthe.jpg
  width: 10572
  height: 7303
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; artist d. 1939)
  credit_line: Bruno Liljefors, Mute Swans in Evening Flight (Knobbelzwanen op avondtrek), 1925. Rijksmuseum Twenthe, Enschede (inv. 0211). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the museum page named on Commons; it answered our fetch with HTTP 403, so it was not read. Title, date, size and inventory number are from Wikidata Q43084881.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Bruno Liljefors (1860–1939) | *Sträckande svanar* (Swans in Flight) | 1915 | Private collection (sold at Stockholms Auktionsverk); oil on canvas, 58 × 96 cm | https://commons.wikimedia.org/wiki/File:Bruno_Liljefors_-_Streching_swans_1915.jpg (2500 × 1502, PD-Art-two-auto) | Three swans taking off over autumn reeds, painted in 1915, the year Sibelius saw his sixteen swans. Smaller auction image; no museum page |
| B | Bruno Liljefors (1860–1939) | *Svanar* (Swans) | 1906 | Thielska Galleriet, Stockholm, TG 267 (oil on canvas, 113 × 212 cm) | https://commons.wikimedia.org/wiki/File:Bruno_Liljefors_-_Swans_1906_TG_267.jpg (10000 × 5065, PD-Art, museum source) | Two swans pushing through choppy, glittering water; a museum work by the same painter, if the flying swans of 1925 clash. Wide format |

## 3. Glossary rows

None new for this piece (it uses tremolo, development, scherzo, coda, variation and pizzicato, all already defined).

## 4. `content/composers.yaml`: new composer `sibelius`

Insert in date order (born 1865: after `mahler`, before `rachmaninoff`). Bio paragraphs use typographic apostrophes like the existing entries. `hero`/`thumb`/`full`/`placeholder_color` are written later by `npm run images -- --only sibelius`.

```yaml
- id: sibelius
  match: Jean Sibelius
  sort_name: Sibelius, Jean
  born: 1865
  died: 1957
  era: late_romantic
  names:
    en: { name: Jean Sibelius, short: Sibelius }
    tr: { name: Jean Sibelius, short: Sibelius }
  nationality: { en: Finnish, tr: Fin }
  facts:
    born: { en: "8 December 1865, Hämeenlinna", tr: "8 Aralık 1865, Hämeenlinna" }
    died: { en: "20 September 1957, Järvenpää", tr: "20 Eylül 1957, Järvenpää" }
    symphonies: { en: "Seven", tr: "Yedi" }
    best_known_for: { en: "*Finlandia*, the Violin Concerto, seven symphonies", tr: "*Finlandia*, Keman Konçertosu, yedi senfonisi" }
  bio:
    en: |-
      Sibelius was born in 1865 in Hämeenlinna, a small town in Finland, then a grand duchy of the Russian Empire. His father, a doctor, died when he was two, and he grew up in a Swedish-speaking household of women. He took up the violin as a boy and longed to become a great soloist, until he had to admit that he had started too late. After studying in Helsinki, Berlin and Vienna, he made his name in 1892 with *Kullervo*, a choral symphony based on the *Kalevala*, Finland’s national epic. That same year he married Aino Järnefelt.

      His music soon became bound up with Finland’s resistance to Russian rule: the last of a set of patriotic tableaux he wrote in 1899 became *Finlandia*. A state grant from 1898 let him concentrate on composing, and in 1904 the family moved to Ainola, a house by Lake Tuusula north of Helsinki, which remained his home. There he wrote the Violin Concerto, most of his seven symphonies and tone poems such as *Tapiola* (1926), music in which large shapes grow slowly out of very small ideas.

      After *Tapiola* and his music for *The Tempest* he published almost nothing more. This long retirement became known as the “silence of Järvenpää”. He worked for years on an Eighth Symphony, but it never appeared, and in the 1940s he burned many of his manuscripts. He died at Ainola on 20 September 1957, aged 91; at that moment his Fifth Symphony was being broadcast on the radio from Helsinki.
    tr: |-
      Sibelius 1865’te, o sırada Rus İmparatorluğu’na bağlı bir grandük olan Finlandiya’nın küçük bir kasabası Hämeenlinna’da doğdu. Doktor olan babası o iki yaşındayken öldü; İsveççe konuşulan, kadınlardan oluşan bir evde büyüdü. Çocukken kemana başladı ve büyük bir solist olmayı çok istedi, ta ki bu eğitime çok geç başladığını kabul etmek zorunda kalana dek. Helsinki, Berlin ve Viyana’da öğrenim gördükten sonra 1892’de, Finlandiya’nın ulusal destanı *Kalevala*’ya dayanan koro senfonisi *Kullervo* ile adını duyurdu. Aynı yıl Aino Järnefelt’le evlendi.

      Müziği kısa sürede Finlandiya’nın Rus yönetimine direnişiyle özdeşleşti: 1899’da yazdığı bir dizi yurtsever tablonun sonuncusu *Finlandia* oldu. 1898’de bağlanan bir devlet ödeneği bestelemeye yoğunlaşmasını sağladı; 1904’te aile, Helsinki’nin kuzeyinde Tuusula Gölü kıyısındaki Ainola adlı eve taşındı ve burası onun evi olarak kaldı. Keman Konçertosu’nu, yedi senfonisinin çoğunu ve *Tapiola* (1926) gibi senfonik şiirleri burada yazdı; bu müzikte büyük biçimler çok küçük fikirlerden yavaş yavaş filizlenir.

      *Tapiola*’dan ve *Fırtına* için yazdığı müzikten sonra neredeyse hiçbir şey yayımlamadı. Bu uzun çekilme “Järvenpää sessizliği” olarak anıldı. Yıllarca bir Sekizinci Senfoni üzerinde çalıştı ama eser hiç ortaya çıkmadı; 1940’larda pek çok elyazmasını yaktı. 20 Eylül 1957’de, 91 yaşında Ainola’da öldü; o sırada radyoda Helsinki’den Beşinci Senfonisi yayınlanıyordu.
  portrait:
    artist: { en: Daniel Nyblin, tr: Daniel Nyblin }
    title: { en: Jean Sibelius, tr: Jean Sibelius }
    year: "1913"
    collection: null
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Jean_Sibelius,_1913.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Jean_Sibelius,_1913.jpg
    width: 1872
    height: 2496
    license: Public domain (photographer d. 1923, PD-old-auto-expired; published in the US in 1913)
    focal_y: 0.2
```

## 5. `content/research/composers-sources.md`: section to append

```markdown
## Jean Sibelius (added 2026-10-10, batch group H)

- Facts: https://en.wikipedia.org/wiki/Jean_Sibelius · https://www.wikidata.org/wiki/Q45682 (P569 8 Dec 1865, P570 20 Sep 1957, P19 Hämeenlinna, P20 Järvenpää)
- Father (doctor) died of typhoid July 1868; brought up "in a decidedly female environment"; Swedish-speaking family.
- Wanted to be a violin virtuoso; quote "My tragedy was that I wanted to be a celebrated violinist at any price … I had begun my training … too late" (paraphrased in the bio).
- Studied Helsinki Music Institute 1885–89, Berlin 1889–90, Vienna 1890–91. *Kullervo* 1892; married Aino Järnefelt 1892.
- *Finlandia*: the last tableau ("Finland Awakens") of the *Press Celebration Music*, 4 Nov 1899, written in support of a newspaper suspended for criticising Russian rule.
- State grant 1898 (ten years, later for life). Ainola near Lake Tuusula, about 45 km north of Helsinki; moved in 24 Sep 1904; lived there (with a Helsinki home 1939–41) until his death.
- Last major works: *The Tempest* (1926) and *Tapiola* (1926); "silence of Järvenpää"; work on an Eighth Symphony (promised to Koussevitzky 1931–32); Aino's account of burning manuscripts at Ainola in the 1940s.
- Died 20 Sep 1957 at Ainola (brain haemorrhage), aged 91; the Fifth Symphony (Malcolm Sargent) was being broadcast from Helsinki at the time.
- "Large shapes grow slowly out of very small ideas": general description, supported by the Symphony No. 5 article (themes built from small cells, rotational form) https://en.wikipedia.org/wiki/Symphony_No._5_(Sibelius)
- Portrait: Daniel Nyblin (1856–1923), photograph, published 1913 in *What We Hear in Music* (Anne S. Faulkner, Victor Talking Machine Co., USA).
  https://commons.wikimedia.org/wiki/File:Jean_Sibelius,_1913.jpg — 1872 × 2496 px. Commons: {{PD-Art|PD-old-auto-expired|deathyear=1923}}, permission {{PD-Finland-50}}.
  Rights check: EU/Finland — the photographer died in 1923, so even as a photographic *work* it is out of copyright (life + 70 ended 1993), and as a simple photographic image it is far beyond Finland's 50-year term. US — published in a US book in 1913, before 1931, so public domain in the US regardless of the URAA. Safe in both.
  focal_y 0.2: head and shoulders, face in the upper third of the frame (checked on an 800 px thumbnail).
- Rejected: File:Jean_Sibelius_circa_1898-1900_(3x4_cropped).jpg (Nyblin, c. 1898–1900, Finnish Heritage Agency, 1535 × 2060, PD) is the Wikipedia infobox image and also safe, but lower resolution and shows a much younger man than the composer of the works in the catalogue; keep it as the fallback. Paintings by Gallen-Kallela and Järnefelt exist, but Gallen-Kallela already provides Mahler's portrait.
```
