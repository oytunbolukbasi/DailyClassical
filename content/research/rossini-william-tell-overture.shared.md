# Shared-file additions: rossini-william-tell-overture

## 1. paintings.yaml

```yaml
rossini-william-tell-overture:
  # Commons licence: PD-Art|PD-old-auto-expired (Diday died 1877). Museum-supplied TIFF, 2945 × 2171 (landscape);
  # convert the master to JPEG if the image pipeline does not read TIFF. Oil on canvas, 116 × 156 cm, inv. 273.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Fran%C3%A7ois_Diday,_Orage_sur_le_L%C3%A9man,_1839.tif
  source_url: https://commons.wikimedia.org/wiki/File:Fran%C3%A7ois_Diday,_Orage_sur_le_L%C3%A9man,_1839.tif
  commons_page: https://commons.wikimedia.org/wiki/File:Fran%C3%A7ois_Diday,_Orage_sur_le_L%C3%A9man,_1839.tif
  width: 2945
  height: 2171
  medium: Oil on canvas
  license: Public domain (PD-Art)
  credit_line: François Diday, Storm on Lake Geneva (Orage sur le Léman), 1839. Musée des beaux-arts, La Chaux-de-Fonds (inv. 273). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the Commons page: the museum's own online record was not found. Replace at merge if the MBA La Chaux-de-Fonds has one.

Pairing note (in the drafts): boatmen fight the waves of a Swiss lake as the storm breaks and light returns on the right; in Rossini's opera Tell is an expert boatman, forced to steer across Lake Lucerne in a storm.

**Alternative 1.** Caspar Wolf, *Thunderstorm at the Grindelwald Glacier* (*Gewitter am Grindelwaldgletscher*), c. 1774–75. Aargauer Kunsthaus, Aarau. Commons: `File:Caspar Wolf - Gewitter am Grindelwaldgletscher - um 1774-75 - Aarau.jpg` (1676 × 1091, public domain; on the small side). Pairing: an Alpine storm by the first great painter of the Swiss mountains.

**Alternative 2.** Henry Fuseli (Johann Heinrich Füssli), *The Oath on the Rütli* (*Die drei Eidgenossen beim Schwur auf dem Rütli*), 1779–81. Kunsthaus Zürich (1989/0015, on loan from Zürich city hall per the Commons title). Commons: `File:Henry Fuseli - Die drei Eidgenossen beim Schwur auf dem Rütli - 1989-0015 - Kunsthaus Zürich.jpg` (797 × 1200, public domain; too small, look for a larger scan). Pairing: the three Swiss confederates swearing to free their land, the oath that ends Act 2 of the opera. Fuseli is already in `paintings.yaml` (*The Nightmare*).

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Ranz des vaches | A Swiss herdsman's call to the cattle | A traditional melody that Swiss herdsmen sang or played on the alphorn to call their cows. Composers used it as a sign of the Alps and of pastoral calm, as Rossini did in the *William Tell* overture. |
| Galop | A fast, lively dance in two beats | A quick round dance in 2/4 time, popular in 19th-century ballrooms, with a galloping, hopping step. Composers often used its rhythm for exciting finales. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Ranz des vaches | Ranz des vaches | İsviçreli çobanların inekleri çağırma ezgisi | İsviçreli çobanların ineklerini çağırmak için söylediği ya da alp borusuyla çaldığı geleneksel ezgi. Besteciler onu Alplerin ve kır sükûnetinin simgesi olarak kullandı; Rossini de *Wilhelm Tell* uvertüründe böyle yaptı. |
| Galop | Galop | İki vuruşlu, hızlı, canlı bir dans | 19. yüzyıl balo salonlarında sevilen, 2/4'lük, dörtnala koşar gibi sekmeli adımlarla dönülen hızlı bir dans. Besteciler onun ritmini sık sık heyecanlı finallerde kullandı. |

## 3. Composer

```yaml
- id: rossini
  match: Gioachino Rossini
  sort_name: Rossini, Gioachino
  born: 1792
  died: 1868
  era: romantic
  names:
    en: { name: Gioachino Rossini, short: Rossini }
    tr: { name: Gioachino Rossini, short: Rossini }
  nationality: { en: Italian, tr: İtalyan }
  facts:
    born: { en: "29 February 1792, Pesaro", tr: "29 Şubat 1792, Pesaro" }
    died: { en: "13 November 1868, Passy (Paris)", tr: "13 Kasım 1868, Passy (Paris)" }
    symphonies: { en: "None (39 operas)", tr: "Yok (39 opera)" }
    best_known_for: { en: "*The Barber of Seville*, *William Tell*, overtures", tr: "*Sevil Berberi*, *Wilhelm Tell*, uvertürler" }
  bio:
    en: |-
      Rossini was born in Pesaro, on the Adriatic coast of Italy, in 1792, the son of two musicians: his father played the trumpet and the horn, his mother was a singer. He grew up partly in Lugo, where a priest's library introduced him to the music of Haydn and Mozart, then little known in Italy, and he went on to study at the music school in Bologna. His first opera was staged in Venice in 1810, when he was eighteen.

      Between 1810 and 1823 he wrote 34 operas for Italian theatres, working so fast that he often reused his own music, overtures included. The comedies *L'italiana in Algeri*, *The Barber of Seville* (Rome, 1816; a failure on its first night, then a triumph) and *La Cenerentola* made his name across Europe, and serious operas such as *Tancredi* and *Semiramide* were just as admired. In 1822 he visited Vienna, where his operas caused a craze, and met Beethoven. Two years later he moved to Paris, and there, in 1829, he wrote *Guillaume Tell*, his last opera.

      He then stopped writing operas, at thirty-seven, for reasons that have never been fully explained: ill health, wealth, and a change in taste towards grand spectacle may all have played a part. He went on composing in private: a *Stabat Mater*, songs, and more than 150 small pieces he called "sins of old age", many written for the Saturday salons he held at his villa in Passy, where Liszt and Verdi were among the guests. His last large work was the *Petite messe solennelle*. He died at Passy in 1868; in 1887 his remains were moved to Santa Croce in Florence.
    tr: |-
      Rossini 1792'de İtalya'nın Adriyatik kıyısındaki Pesaro'da, iki müzisyenin oğlu olarak doğdu: babası trompet ve korno çalıyor, annesi şarkı söylüyordu. Çocukluğunun bir kısmı Lugo'da geçti; orada bir rahibin kitaplığı sayesinde, o yıllarda İtalya'da pek tanınmayan Haydn ile Mozart'ın müziğini tanıdı, ardından Bologna'daki müzik okulunda okudu. İlk operası 1810'da, on sekiz yaşındayken Venedik'te sahnelendi.

      1810 ile 1823 arasında İtalyan tiyatroları için 34 opera yazdı; o kadar hızlı çalışıyordu ki uvertürler de dahil kendi müziğini sık sık yeniden kullandı. *Cezayir'deki İtalyan Kızı*, *Sevil Berberi* (Roma, 1816; ilk gecesinde başarısız oldu, sonra zafer kazandı) ve *Külkedisi* gibi komedileri adını bütün Avrupa'ya duyurdu; *Tancredi* ve *Semiramide* gibi ciddi operaları da aynı hayranlığı topladı. 1822'de operalarının çılgınlık yarattığı Viyana'yı ziyaret etti ve Beethoven'la tanıştı. İki yıl sonra Paris'e yerleşti ve orada, 1829'da, son operası *Guillaume Tell*'i yazdı.

      Ardından otuz yedi yaşında opera yazmayı bıraktı; nedeni hiçbir zaman tam açıklanamadı: sağlık sorunları, kazandığı servet ve zevklerin büyük gösterilere doğru değişmesi rol oynamış olabilir. Kendi köşesinde beste yapmayı sürdürdü: bir *Stabat Mater*, şarkılar ve "yaşlılık günahları" dediği 150'den fazla küçük parça. Bunların çoğunu, Liszt ile Verdi'nin de konukları arasında olduğu, Passy'deki villasında düzenlediği cumartesi salonları için yazdı. Son büyük eseri *Petite messe solennelle*'dir. 1868'de Passy'de öldü; 1887'de naaşı Floransa'daki Santa Croce Bazilikası'na taşındı.
  portrait:
    artist: Hortense Haudebourt-Lescot
    title: { en: Portrait of Gioachino Rossini, tr: Gioachino Rossini'nin Portresi }
    year: "1828"
    collection: { en: "Rocca Estense, Lugo (Comune di Lugo)", tr: "Rocca Estense, Lugo (Lugo Belediyesi)" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Gioachino_Rossini,_1828,_by_Hortense_Haudebourt-Lescot.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Gioachino_Rossini,_1828,_by_Hortense_Haudebourt-Lescot.jpg
    width: 1628
    height: 2048
    license: Public domain (PD-Art, PD-old-auto-expired; painter died 1845)
    focal_y: 0.25
```

### composers-sources: Rossini

- Facts: https://en.wikipedia.org/wiki/Gioachino_Rossini · https://www.wikidata.org/wiki/Q9726 (P569 1792-02-29, P570 1868-11-13; P19 Pesaro; P20 Passy / Paris) · https://www.britannica.com/biography/Gioachino-Rossini
- Parents (trumpeter father, singer mother), Lugo from 1802 (the priest Giuseppe Malerbe's library with works by Haydn and Mozart, "both little known in Italy at the time"), Bologna music school; first opera *La cambiale di matrimonio*, Teatro San Moisè, Venice, November 1810, aged 18: Wikipedia. Wikipedia also says the father studied horn with him ("He studied the horn with his father"); the bio says "trumpet and horn".
- 34 operas for Italian stages 1810–1823; formulaic overtures and self-borrowing; *L'italiana in Algeri* (May 1813), *Il barbiere di Siviglia* (Teatro Argentina, Rome, 1816; "unsuccessful opening night"), *La Cenerentola*, *Tancredi*, *Semiramide*: Wikipedia.
- Vienna 1822: San Carlo company season, Schindler's "idolatrous orgy"; Rossini met Beethoven: Wikipedia.
- Paris from 1824; *Guillaume Tell* 1829 his last opera; withdrawal "never been fully explained … ill-health, the wealth … and the rise of spectacular grand opera": Wikipedia.
- *Stabat Mater* (1831–41), *Péchés de vieillesse* (more than 150 pieces), Saturday salons from December 1858 at Passy and in the Chaussée-d'Antin flat, guests including Liszt and Verdi; *Petite messe solennelle* (1863, first performed 1864): Wikipedia.
- Died at Passy, 13 November 1868, after an operation for colorectal cancer; buried Père Lachaise; remains moved to Santa Croce, Florence, in 1887: Wikipedia.
- "Symphonies: None": Rossini wrote no symphonies in the concert sense (a few early student *sinfonie* exist); the card shows the opera count instead (39, Wikipedia lead).
- Portrait: Hortense Haudebourt-Lescot (1784–1845), *Portrait of Gioachino Rossini*, 1828 (Salon of 1827 category on Commons), oil, gift of Rossini to the Comune di Lugo, Rocca Estense, Saletta Rossini (Commons description, Wikidata Q107496570). File 1628 × 2048, `PD-Art|PD-old-auto-expired|deathyear=1845`. Painted the year before *Guillaume Tell*. Alternative: Étienne Carjat's photograph of 1865 (Wikidata P18), `File:Composer Rossini G 1865 by Carjat.jpg`, 1507 × 1895, public domain (Harvard Art Museums).

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Rossini – William Tell: Overture | I (single movement) | – | 12:00 | – | Karajan / BPh 1971, Spotify `7l3RoBOqR3g7mBZDbSDpGE` (track 4) | 0:00, 1:50, 2:50, 3:05, 3:45, 5:00, 5:40, 8:30, 8:45, Near the end | Section proportions only (no bar map). Least certain: storm start ≈ 3:05 and fanfare ≈ 8:30 |
