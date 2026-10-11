# Shared-file additions: smetana-vltava

For merging into `content/paintings.yaml`, the glossary files, `content/composers.yaml`, `content/research/composers-sources.md` and `content/research/retime-needed.md`. Sources: `content/research/smetana-vltava.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
smetana-vltava:
  # Switched at merge: Schikaneder is in a private collection, known only from an auction record; was alternative A (museum-held, the river itself).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Zdenka_Braunerov%C3%A1_-_Z%C3%A1toka_Vltavy_v_Roztok%C3%A1ch_(1885).jpg
  source_url: https://www.webumenia.sk/en/dielo/SVK:TMP.683
  commons_page: https://commons.wikimedia.org/wiki/File:Zdenka_Braunerov%C3%A1_-_Z%C3%A1toka_Vltavy_v_Roztok%C3%A1ch_(1885).jpg
  width: 7296
  height: 4323
  medium: Oil on panel
  license: Public domain (PD-Art; artist d. 1934; Public Domain Mark via Web umenia)
  credit_line: Zdenka Braunerová, Backwater of the Vltava at Roztoky, 1885. National Gallery Prague (O 5276). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

The painting is in a private collection and known from a Dorotheum auction record (the source of the Commons file: "Prag, Dampfer auf der Moldau vor der Palacky-Brücke, um 1910/20, signiert (ligiert) JSchikaneder, Öl auf Leinwand, 84 x 106 cm"). The Dorotheum page refused scripted requests (HTTP 403). The English title is our translation of that description. If a museum-held work is required, use alternative A.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Zdenka Braunerová (1858–1934) | *Backwater of the Vltava at Roztoky* (*Zátoka Vltavy v Roztokách*) | 1885 | National Gallery Prague (O 5276) | https://commons.wikimedia.org/wiki/File:Zdenka_Braunerov%C3%A1_-_Z%C3%A1toka_Vltavy_v_Roztok%C3%A1ch_(1885).jpg (7296 × 4323, PD-Art; image Public Domain Mark via Web umenia) | A quiet bend of the Vltava just north of Prague, painted three years after *Má vlast* was first played complete. |
| B | Adolf Kosárek (1830–1859) | *Lonely Landscape (Peasants' Wedding)* | 1858 | National Gallery Prague (O 9268) | https://commons.wikimedia.org/wiki/File:Adolf_Kos%C3%A1rek_-_Lonely_Landscape_(Peasants%C2%B4_Wedding)_-_Google_Art_Project.jpg (4627 × 3027, PD-Art, Google Art Project) | A wedding procession of carts and riders crosses a wide Bohemian landscape, like the village wedding the river passes in Smetana's music. |

A: oil on panel, 28 × 47 cm, a small, muted picture (Web umenia SVK:TMP.683, https://www.webumenia.sk/dielo/SVK:TMP.683, public domain, credit "Zdenka Braunerová – Zátoka Vltavy v Roztokách, 1885, Národní galerie v Praze"). B: oil on canvas, 43.5 × 65 cm (Wikidata Q28797540).

## 3. Glossary rows (new terms only)

Possibly also proposed by other groups (Liszt, group G; tone poems in group J); add once.

EN (`content/en/glossary.md`):

```
| Symphonic poem | A one-movement orchestral piece that tells a story | A single-movement orchestral work that describes a story, a place or a scene. The form was pioneered by Liszt. |
```

TR (`content/tr/glossary.md`):

```
| Symphonic poem | Senfonik şiir | Bir öykü anlatan tek bölümlük orkestra eseri | Bir öyküyü, bir yeri ya da bir sahneyi betimleyen tek bölümlük orkestra eseri. Bu türün öncüsü Liszt'tir. |
```

Also used: the existing **Programme music**, **Pizzicato** and **Rondo**.

## 4. `content/composers.yaml`: new composer `smetana`

```yaml
- id: smetana
  match: Bedřich Smetana
  sort_name: Smetana, Bedřich
  born: 1824
  died: 1884
  era: romantic
  names:
    en: { name: Bedřich Smetana, short: Smetana }
    tr: { name: Bedřich Smetana, short: Smetana }
  nationality: { en: Czech, tr: Çek }
  facts:
    born: { en: "2 March 1824, Litomyšl", tr: "2 Mart 1824, Litomyšl" }
    died: { en: "12 May 1884, Prague", tr: "12 Mayıs 1884, Prag" }
    symphonies: { en: "One, the *Triumphal Symphony* (1853)", tr: "Bir, *Triumf Senfonisi* (1853)" }
    best_known_for: { en: "*Má vlast*, *The Bartered Bride*", tr: "*Má vlast* (Vatanım), *Satılmış Gelin*" }
  bio:
    en: |-
      Smetana was born in 1824 in Litomyšl, in Bohemia, then part of the Habsburg Empire, the son of a prosperous brewer. Like most educated Czechs of his day he grew up speaking German, and he learned to write good Czech only as an adult. He played in public at six, studied music in Prague, and in 1848 briefly joined the uprising there. Liszt, to whom he wrote for help that year, became a friend and supporter.

      Unable to make a living in Prague, he spent five years in Gothenburg, in Sweden, as a teacher and choirmaster, and returned in the early 1860s, when Czech culture was beginning to flourish. His comic opera *The Bartered Bride* (1866) became a great success, and he was made principal conductor of Prague's Provisional Theatre, the first home of Czech opera, although rivals attacked his music as too close to Wagner.

      In 1874 he went completely deaf and had to leave the theatre. In the years that followed he wrote some of his finest music, including *Má vlast*, a cycle of six orchestral pictures of his homeland, and the string quartet *From My Life*, in which a long, high note portrays the onset of his deafness. His health then broke down, and he died in a Prague asylum in 1884. In his own country he is regarded as the father of Czech music.
    tr: |-
      Smetana 1824'te, o sırada Habsburg İmparatorluğu'na bağlı olan Bohemya'da, Litomyšl'de, varlıklı bir bira üreticisinin oğlu olarak doğdu. Döneminin eğitimli Çeklerinin çoğu gibi Almanca konuşarak büyüdü; düzgün Çekçe yazmayı ancak yetişkinliğinde öğrendi. Altı yaşında halk önünde çaldı, Prag'da müzik eğitimi aldı ve 1848'de oradaki ayaklanmaya kısa bir süre katıldı. Aynı yıl yardım istemek için mektup yazdığı Liszt, onun dostu ve destekçisi oldu.

      Prag'da geçimini sağlayamayınca İsveç'te, Göteborg'da öğretmen ve koro şefi olarak beş yıl geçirdi; 1860'ların başında, Çek kültürünün filizlenmeye başladığı bir dönemde geri döndü. Komik operası *Satılmış Gelin* (1866) büyük başarı kazandı ve Çek operasının ilk yuvası olan Prag Geçici Tiyatrosu'nun baş şefliğine getirildi; ama rakipleri müziğini Wagner'e fazla yakın bulup ona saldırdı.

      1874'te tamamen sağır oldu ve tiyatrodan ayrılmak zorunda kaldı. Sonraki yıllarda en güzel eserlerinden bazılarını yazdı: vatanını anlatan altı orkestra tablosundan oluşan *Má vlast* döngüsü ve uzun, tiz bir notanın sağırlığının başlangıcını anlattığı *Hayatımdan* adlı yaylı dörtlüsü. Ardından sağlığı çöktü ve 1884'te Prag'da bir akıl hastanesinde öldü. Kendi ülkesinde Çek müziğinin babası sayılır.
  portrait:
    artist: { en: "Unknown photographer (copy by Bain News Service)", tr: "Bilinmeyen fotoğrafçı (Bain News Service kopyası)" }
    title: { en: Bedřich Smetana, tr: Bedřich Smetana }
    # The Bain copy negative is captioned "1900" (unverified); the photograph itself predates Smetana's death in 1884.
    year: "before 1884"
    collection: { en: "Library of Congress, Washington, D.C.", tr: "Kongre Kütüphanesi, Washington" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Smetana_LCCN2014716851_(cropped).jpg
    source_url: https://commons.wikimedia.org/wiki/File:Smetana_LCCN2014716851_(cropped).jpg
    width: 3173
    height: 4123
    license: Public domain (PD-Bain, PD-old-70; Library of Congress, no known restrictions)
    focal_y: 0.2
```

## 5. `content/research/composers-sources.md` (new section)

```
## Smetana (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Bed%C5%99ich_Smetana · https://www.britannica.com/biography/Bedrich-Smetana · https://www.wikidata.org/wiki/Q48173
- Born 2 March 1824, Litomyšl; died 12 May 1884, Kateřinky asylum, Prague; buried Vyšehrad Cemetery. German-speaking upbringing; first public performance October 1830; Proksch; 1848 uprising; Liszt's help (1848) and Weimar visit (1857); Gothenburg 1856–c. 1861; *The Bartered Bride* 1866; principal conductor of the Provisional Theatre from 1866; "Wagnerism" attacks (Pivoda); deaf by the end of 1874; *Má vlast* 1874–79; String Quartet No. 1 *From My Life* (deafness as a long high harmonic E).
- Symphonies: one, the *Triumphal Symphony* (1853).
- Portrait: Bain News Service copy of a 19th-century photograph, Library of Congress (LCCN 2014716851, ggbain.36702), cropped on Commons.
  https://commons.wikimedia.org/wiki/File:Smetana_LCCN2014716851_(cropped).jpg — 3173 × 4123, Public domain (PD-Bain). Bain's date "1900" refers to the copy; the card says "before 1884".
```

## 6. `content/research/retime-needed.md` rows

```
| Smetana – Vltava | I Vltava | – | 12:00 | – | Kubelík / Boston SO, Spotify `2wnHlBJhXW9dQn5I2s8KxM` (track 2) | 0:00, 1:00, 2:50, 3:55, 5:20, 7:55, 8:50, 9:50, 10:35, Near the end | Estimated from the proportions of a typical performance, not heard. The LP gives 11:49, the Spotify track 12:00: find the extra ≈ 11 s |
```
