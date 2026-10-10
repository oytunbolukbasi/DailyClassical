# Shared-file additions: wagner-tristan-prelude-and-liebestod

For the merge into `content/paintings.yaml`, the glossary files and `content/composers.yaml`.
Sources and checks: `content/research/wagner-tristan-prelude-and-liebestod.md`. Checked 2026-10-10.

## 1. `content/paintings.yaml` (first choice)

```yaml
wagner-tristan-prelude-and-liebestod:
  # Landscape ≈ 1.5:1 (canvas 160 × 240 cm). Google Art Project scan from the Museo de Bellas Artes de Bilbao.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Rogelio_de_Egusquiza_-_Tristan_and_Isolt_(Death)_-_Google_Art_Project.jpg
  source_url: https://www.museobilbao.com/catalogo-online/tristan-e-isolda-la-muerte-009
  commons_page: https://commons.wikimedia.org/wiki/File:Rogelio_de_Egusquiza_-_Tristan_and_Isolt_(Death)_-_Google_Art_Project.jpg
  width: 3763
  height: 2511
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-1923; artist d. 1915)
  credit_line: Rogelio de Egusquiza, Tristan and Isolde (Death), 1910. Museo de Bellas Artes de Bilbao (00/9). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | John William Waterhouse | Tristan and Isolde with the Potion | c. 1916 | Private collection | https://commons.wikimedia.org/wiki/File:John_william_waterhouse_tristan_and_isolde_with_the_potion.jpg (1601 × 2181, PD-Art; source Art Renewal Center) | The moment the lovers drink the potion that binds them, the start of everything the Prelude longs for. Waterhouse died 1917 (PD in the EU/Turkey); US publication history not checked. |
| B | Edmund Blair Leighton | The End of the Song | 1902 | Private collection (first version) | https://commons.wikimedia.org/wiki/File:Edmund_Blair_Leighton_-_The_End_of_the_Song_(first_version).jpg (1563 × 1385, PD; illustrated in the Art Journal, 1902) | Tristan and Isolde in their last moment together, as King Mark comes through the door. Leighton died 1922; published 1902, PD in the US. |

Both alternatives have small files; the Egusquiza is the best image and the strongest link.

## 2. Glossary: new term

EN (`content/en/glossary.md`):

```markdown
| Tristan chord | Wagner's unresolved chord that opens *Tristan und Isolde* | The first chord of Wagner's *Tristan und Isolde*. It hangs in the air instead of resolving as the ear expects, and became a symbol of musical longing and of modern harmony. |
```

TR (`content/tr/glossary.md`):

```markdown
| Tristan chord | Tristan akoru | Wagner'in *Tristan ve Isolde*'yi açan çözülmeyen akoru | Wagner'in *Tristan ve Isolde* operasının ilk akoru. Kulağın beklediği gibi çözülmek yerine havada asılı kalır; müzikal özlemin ve modern armoninin simgesi olmuştur. |
```

Other term used (already in the glossary): crescendo. "Leitmotif" is proposed in `rimsky-korsakov-scheherazade.shared.md` and is used in the Wagner bio below.

## 3. `content/composers.yaml`: new composer `wagner`

```yaml
- id: wagner
  match: Richard Wagner
  sort_name: Wagner, Richard
  born: 1813
  died: 1883
  era: romantic
  names:
    en: { name: Richard Wagner, short: Wagner }
    tr: { name: Richard Wagner, short: Wagner }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "22 May 1813, Leipzig", tr: "22 Mayıs 1813, Leipzig" }
    died: { en: "13 February 1883, Venice", tr: "13 Şubat 1883, Venedik" }
    symphonies: { en: "One, written at 19", tr: "Bir; 19 yaşında yazdığı" }
    best_known_for: { en: "*The Ring of the Nibelung*, *Tristan und Isolde*, *Parsifal*", tr: "*Nibelung Yüzüğü*, *Tristan ve Isolde*, *Parsifal*" }
  bio:
    en: |-
      Wagner was born in Leipzig in 1813 and grew up in a household that loved the theatre. Hearing Beethoven's Seventh and Ninth Symphonies as a teenager decided his future. Unlike almost every other opera composer, he wrote his own librettos. His early years were spent in small theatre posts, in Riga and in Paris, and were plagued by debts. In 1842 he moved to Dresden, where he became conductor at the Saxon court and where *The Flying Dutchman* and *Tannhäuser* were first staged.

      In 1849 he took part in a failed uprising in Dresden and fled to Switzerland with a warrant out for his arrest. He spent twelve years in exile, writing essays about a "total work of art" that would unite music, poetry and theatre, and beginning the four operas of *The Ring of the Nibelung*. He broke off to write *Tristan und Isolde* (1857–59). His fortunes changed in 1864, when the young King Ludwig II of Bavaria paid his debts and brought him to Munich, where *Tristan* was first performed in 1865. In 1870 he married Cosima, Liszt's daughter.

      Wagner built his own theatre at Bayreuth, which opened in 1876 with the first complete *Ring*; his last opera, *Parsifal*, followed there in 1882. He died in Venice in 1883. His use of the [[leitmotif]] and his restless, chromatic harmony changed music for the next century. He also wrote antisemitic essays, beginning with "Judaism in Music" (1850), and his music was later embraced by Hitler; that legacy is still argued over.
    tr: |-
      Wagner 1813’te Leipzig’de doğdu ve tiyatroyu seven bir evde büyüdü. Gençken Beethoven’ın Yedinci ve Dokuzuncu senfonilerini dinlemek geleceğini belirledi. Neredeyse bütün öteki opera bestecilerinden farklı olarak libretolarını kendisi yazdı. İlk yılları küçük tiyatro görevlerinde, Riga’da ve Paris’te, borçlarla boğuşarak geçti. 1842’de Dresden’e taşındı; orada Saksonya sarayının şefi oldu ve *Uçan Hollandalı* ile *Tannhäuser* ilk kez orada sahnelendi.

      1849’da Dresden’de bastırılan bir ayaklanmaya katıldı ve hakkında tutuklama kararı çıkınca İsviçre’ye kaçtı. On iki yıl sürgünde yaşadı; müziği, şiiri ve tiyatroyu birleştirecek bir “toplam sanat eseri” üzerine denemeler yazdı ve *Nibelung Yüzüğü*’nün dört operasına başladı. Bu işe *Tristan ve Isolde*’yi (1857–59) yazmak için ara verdi. Talihi 1864’te döndü: Bavyera’nın genç kralı II. Ludwig borçlarını ödedi ve onu Münih’e getirdi; *Tristan* 1865’te orada ilk kez sahnelendi. 1870’te Liszt’in kızı Cosima ile evlendi.

      Wagner Bayreuth’ta kendi tiyatrosunu yaptırdı; tiyatro 1876’da ilk tam *Yüzük* ile açıldı, son operası *Parsifal* de 1882’de orada sahnelendi. 1883’te Venedik’te öldü. [[leitmotif|Leitmotif]] kullanımı ve huzursuz, kromatik armonisi sonraki yüzyılın müziğini değiştirdi. Öte yandan “Müzikte Yahudilik” (1850) ile başlayan antisemitik yazılar da yazdı; müziği sonradan Hitler tarafından sahiplenildi. Bu miras bugün hâlâ tartışılıyor.
  portrait:
    artist: Pierre-Auguste Renoir
    title: { en: Richard Wagner, tr: Richard Wagner }
    year: "1882"
    collection: { en: "Musée d'Orsay, Paris", tr: "Musée d'Orsay, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Pierre-Auguste_Renoir_114.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Pierre-Auguste_Renoir_114.jpg
    width: 2024
    height: 2695
    license: Public domain (PD-Art, PD-old-100; Yorck Project)
    focal_y: 0.3
```

### Composer sources (for `content/research/composers-sources.md`)

```markdown
## Richard Wagner (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Richard_Wagner · https://www.britannica.com/biography/Richard-Wagner-German-composer · https://www.wikidata.org/wiki/Q1511
- Born 22 May 1813, Leipzig; died 13 February 1883, Venice (heart attack, Ca' Vendramin Calergi). Stepfather Ludwig Geyer's love of the theatre; heard Beethoven's 7th (January 1828) and 9th (March 1828). Wrote both libretti and music for all his stage works. Riga 1837–39, Paris 1839–42, debts. Dresden from 1842, Royal Saxon Court Conductor; *Holländer* (1843) and *Tannhäuser* (1845) premiered there. May 1849 uprising, arrest warrant, flight to Zurich; twelve years' exile. Essays "The Artwork of the Future" (1849, Gesamtkunstwerk), "Judaism in Music" (1850, first antisemitic writing). *Tristan* 1857–59; Ludwig II from 1864; *Tristan* premiere Munich 10 June 1865. Married Cosima 25 August 1870. Bayreuth Festspielhaus opened 13 August 1876 with the first complete *Ring*; *Parsifal* completed January 1882 and premiered at the second Bayreuth Festival in 1882 (the bio gives only the year). Hitler's admiration (section "Nazi appropriation"). One symphony, in C major, written at 19.
- Portrait: Pierre-Auguste Renoir (1841–1919), *Richard Wagner*, painted in Palermo on 15 January 1882; Musée d'Orsay, Paris (Commons category "Richard Wagner (Pierre-Auguste Renoir - Musée d'Orsay)").
  https://commons.wikimedia.org/wiki/File:Pierre-Auguste_Renoir_114.jpg — 2024 × 2695, {{PD-Art|PD-old-100-expired}} + {{PD-Art-YorckProject}}. PD everywhere (painter d. 1919; reproduced long before 1931).
  - A second Commons file of the same painting, File:Pierre-Auguste_Renoir_-_Richard_Wagner.jpg (2053 × 2634, book scan), is a fallback. Commons also has a CC BY 2.0 "rawpixel" image labelled as a 1900 version at the Yale University Art Gallery; not used.
  - Rejected: Franz von Lenbach portraits (the larger Commons photo is a gallery shot, File:1895_Lenbach_Richard_Wagner_anagoria.JPG, collection not stated on Commons).
- focal_y 0.3: face in the upper third (thumbnail checked).
```
