# Shared-file additions: bruch-violin-concerto-1 (batch G)

Everything here belongs in a shared file; merge by hand. Painting sources: `content/research/bruch-violin-concerto-1.md` §3.
Composer sources are at the end of this file.

## 1. `content/paintings.yaml`

```yaml
bruch-violin-concerto-1:
  # Commons file of the first version (Darmstadt). Clean image, but Commons records its source as
  # "unknown": replace with a museum photograph if the Hessisches Landesmuseum publishes one.
  # Portrait format (3069 × 4418): check the hero crop.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Feuerbach_Iphigenie1.jpg
  source_url: https://www.wikidata.org/wiki/Q41658837
  commons_page: https://commons.wikimedia.org/wiki/File:Feuerbach_Iphigenie1.jpg
  width: 3069
  height: 4418
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old)
  credit_line: Anselm Feuerbach, Iphigenie (first version), 1862. Hessisches Landesmuseum Darmstadt (inv. 488). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Anselm Feuerbach | *Iphigenie* (second version) | 1871 | Staatsgalerie Stuttgart | File:Anselm_Feuerbach_-_Iphigenie2_-_1871_-_Staatsgalerie_Stuttgart.jpg (1576 × 2463, PD-Art; lower resolution) | The same figure of longing, painted a few years after the concerto's final version. |
| B | Anselm Feuerbach | *On the Seashore (Modern Iphigenia)* (*Am Meer*) | 1875 | Collection not recorded on Commons (Google Arts & Culture item gQEBs9vzq_YvUQ): confirm before use | File:Anselm_Feuerbach_-_On_the_Seashore_(Modern_Iphigenia)_-_Google_Art_Project.jpg (2149 × 3652, {{PD-art-two-auto\|1880}}) | A later, more personal take on the same longing gaze out to sea. |

## 2. Glossary (new term)

`content/en/glossary.md`:

```
| Double stop | Two strings played at once on a string instrument | Playing two strings at the same time with the bow, so that a single string player sounds two notes together. It makes the sound fuller and rougher. |
```

`content/tr/glossary.md`:

```
| Double stop | Çift ses | Yaylı bir çalgıda iki telin aynı anda çalınması | Yayla iki teli birden çalmak; böylece tek bir yaylı çalgıcı iki notayı birlikte duyurur. Sesi daha dolgun ve daha sert kılar. |
```

Used in: `bruch-violin-concerto-1` (III). EN `[[double stop]]`, TR `[[double stop|çift ses]]` (also with suffix: `[[double stop|çift ses]]lerle`). Other groups (violin concertos) may propose the same term: keep one row.

`Attacca` is also used in this piece; its rows are in `content/research/grieg-piano-concerto.shared.md`.

## 3. `content/composers.yaml` (new composer `bruch`)

```yaml
- id: bruch
  match: Max Bruch
  sort_name: Bruch, Max
  born: 1838
  died: 1920
  era: romantic
  names:
    en: { name: Max Bruch, short: Bruch }
    tr: { name: Max Bruch, short: Bruch }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "6 January 1838, Cologne", tr: "6 Ocak 1838, Köln" }
    died: { en: "2 October 1920, Berlin", tr: "2 Ekim 1920, Berlin" }
    symphonies: { en: "Three", tr: "Üç" }
    best_known_for: { en: "Violin Concerto No. 1, *Scottish Fantasy*, *Kol Nidrei*", tr: "1. Keman Konçertosu, *İskoç Fantezisi*, *Kol Nidrei*" }
  bio:
    en: |-
      Bruch was born in Cologne in 1838. His mother, Wilhelmine, was a singer, and his father a lawyer who rose to be deputy head of the city's police. He had his early training from the composer Ferdinand Hiller, and his talent was noticed by the pianist Ignaz Moscheles. Bruch spent the first half of his career moving from post to post as a conductor and choral director: Mannheim, Koblenz, where he wrote the first version of his First Violin Concerto, Sondershausen, Berlin and Bonn.

      In his own time he was known above all for large choral works, such as *Odysseus*. Like his contemporary Brahms, he stood for the classical tradition against the "New Music" of Liszt and Wagner. From 1880 to 1883 he conducted the Liverpool Philharmonic Society, and in 1881 he married the singer Clara Tuczek. Besides the First Violin Concerto, his best-known works are the *Scottish Fantasy* for violin and orchestra and *Kol Nidrei* for cello and orchestra, based on a Jewish melody. From 1890 to 1910 he taught composition in Berlin; Ottorino Respighi was one of his pupils.

      He wrote three violin concertos and three symphonies, but the First Violin Concerto eclipsed everything else, which exasperated him. Because of *Kol Nidrei*, many assumed he was Jewish. He was a Protestant, but under the Nazis his music was restricted and largely forgotten in Germany. After the First World War he was left poor, and he died in Berlin in 1920. His gravestone reads "Music is the language of God".
    tr: |-
      Bruch 1838'de Köln'de doğdu. Annesi Wilhelmine şarkıcıydı, babası ise şehrin polis teşkilatında başkan yardımcılığına yükselmiş bir hukukçuydu. İlk eğitimini besteci Ferdinand Hiller'den aldı; yeteneğini piyanist Ignaz Moscheles fark etti. Kariyerinin ilk yarısını şef ve koro yöneticisi olarak görevden göreve geçerek geçirdi: Mannheim, 1. Keman Konçertosu'nun ilk versiyonunu yazdığı Koblenz, Sondershausen, Berlin ve Bonn.

      Kendi döneminde en çok *Odysseus* gibi büyük koro eserleriyle tanınıyordu. Çağdaşı Brahms gibi, Liszt'in ve Wagner'in "Yeni Müzik"ine karşı klasik geleneği savundu. 1880–1883 arasında Liverpool Filarmoni Derneği'nin şefliğini yaptı, 1881'de şarkıcı Clara Tuczek ile evlendi. 1. Keman Konçertosu'ndan sonra en tanınmış eserleri, keman ve orkestra için *İskoç Fantezisi* ile bir Yahudi ezgisine dayanan, viyolonsel ve orkestra için *Kol Nidrei*'dir. 1890'dan 1910'a kadar Berlin'de kompozisyon öğretti; Ottorino Respighi de öğrencilerinden biriydi.

      Üç keman konçertosu ve üç senfoni yazdı, ama 1. Keman Konçertosu öteki her şeyi gölgede bıraktı; bu da onu çileden çıkarıyordu. *Kol Nidrei* yüzünden birçok kişi onun Yahudi olduğunu sandı. Protestandı, ama Naziler döneminde müziği kısıtlandı ve Almanya'da büyük ölçüde unutuldu. Birinci Dünya Savaşı'ndan sonra yoksul düştü ve 1920'de Berlin'de öldü. Mezar taşında "Müzik Tanrı'nın dilidir" yazar.
  portrait:
    artist: { en: "Adolf Neumann, after a photograph", tr: "Adolf Neumann, bir fotoğraftan" }
    title: { en: Max Bruch, tr: Max Bruch }
    year: "1881"
    collection: { en: "Wood engraving, published in Die Gartenlaube, 1881", tr: "Ağaç baskı, Die Gartenlaube dergisinde yayımlandı, 1881" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Die_Gartenlaube_(1881)_b_557.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Die_Gartenlaube_(1881)_b_557.jpg
    width: 2147
    height: 2321
    license: Public domain (published 1881; engraver d. 1884)
    focal_y: 0.25
```

### Sources for the `bruch` entry (append to `content/research/composers-sources.md`)

```markdown
## Max Bruch (added 2026-10-10, batch G)
- Facts: https://en.wikipedia.org/wiki/Max_Bruch · https://www.wikidata.org/wiki/Q106434 (P569 1838-01-06, P570 1920-10-02, P19 Cologne Q365, P20 Friedenau Q692390 / Berlin Q64)
- Mother Wilhelmine (née Almenräder), a singer; father August Carl Friedrich Bruch, an attorney who became vice-president of the Cologne police. Early training with Ferdinand Hiller; Ignaz Moscheles recognised his talent. Posts: Mannheim 1862–64, Koblenz 1865–67, Sondershausen 1867–70, Berlin 1870–72, Bonn 1873–78 (privately), Liverpool Philharmonic Society 1880–83. Taught composition at the Berlin Hochschule für Musik 1890–1910; pupils include Ottorino Respighi. Known mainly as a choral composer (*Odysseus*, Op. 41); "Romantic classicism" camp of Brahms, against the "New Music" of Liszt and Wagner. Three violin concertos, three symphonies, *Scottish Fantasy*, *Kol Nidrei*, Op. 47. Raised Protestant, "no evidence that he was Jewish"; music restricted under the Nazis as a "possible Jew". Married the singer Clara Tuczek, 3 January 1881. Died 2 October 1920, Berlin-Friedenau. Gravestone: "Music is the language of God".
- *Scottish Fantasy* and *Kol Nidrei*: "also widely played" (Wikipedia). *Kol Nidrei* "based on a Jewish melody": the work takes its name and melody from the Kol Nidre prayer; Wikipedia ties the assumption that Bruch was Jewish to its success.
- First version of the Violin Concerto written while at Koblenz (completed 1866): https://en.wikipedia.org/wiki/Violin_Concerto_No._1_(Bruch) + the Koblenz post dates above.
- Poor after the First World War: Wikipedia (concerto article, "Fate of the score": "At the end of World War I, he was destitute").
- Portrait: wood engraving by Adolf Neumann (1825–1884) after a photograph, *Die Gartenlaube* 1881, p. 557 (caption "Max Bruch. Nach einer Photographie auf Holz gezeichnet von Adolf Neumann").
  https://commons.wikimedia.org/wiki/File:Die_Gartenlaube_(1881)_b_557.jpg — 2147 × 2321, public domain (Gartenlaube template). Clean scan of the portrait only. focal_y 0.25 (eyes at about 26 % from the top; checked on a thumbnail).
  Rejected: File:Max_bruch.jpg (764 × 1000, from a 1913 Victor booklet), File:Max_Bruch._1900.jpg (447 × 749, National Library of Israel postcard) — both too small; File:Max_Bruch-vp.png (CC BY-SA 4.0 modern drawing).
```
