# Shared-file additions: mussorgsky-night-on-bald-mountain

## 1. paintings.yaml

```yaml
mussorgsky-night-on-bald-mountain:
  # Round painting (tondo) on a black square; the crop should keep the cauldron and the flying skeleton.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Clevelandart_1977.37.3.jpg
  source_url: https://clevelandart.org/art/1977.37.3
  commons_page: https://commons.wikimedia.org/wiki/File:Clevelandart_1977.37.3.jpg
  width: 3400
  height: 3383
  medium: Oil on canvas
  license: Public domain (CC0, Cleveland Museum of Art Open Access)
  credit_line: "Salvator Rosa, Scenes of Witchcraft: Evening, c. 1645–49. The Cleveland Museum of Art (1977.37.3). Image via Wikimedia Commons, public domain (CC0)."
  rights_status: public_domain
```

**Alternative 1.** Francisco de Goya, *Witches' Flight* (*Vuelo de brujas*), 1798. Museo Nacional del Prado, Madrid (P007748). Commons: File:Francisco_de_Goya_-_Vuelo_de_brujas_(1798).jpg (2068 × 2952, PD, from the Prado). Pairing: witches carrying a victim through the night sky, the sabbath the music describes. Goya's *Witches' Sabbath* is already in paintings.yaml (another piece), so this would be a second Goya witch scene.

**Alternative 2.** Arkhip Kuindzhi, *Moonlit Night on the Dnieper*, 1880. State Russian Museum, St Petersburg (Ж-4191). Commons: File:Kuindzhi_Moonlit_night_on_the_Dnieper_1880_grm_x2.jpg (2400 × 1742, PD). Pairing: night over the river at Kyiv, where the legend places Bald Mountain, painted in 1880, the year of Mussorgsky's last version of the music, and shown in St Petersburg that year. Kuindzhi already appears once (*Red Sunset*).

## 2. Glossary

No new terms. Uses existing: programme music.

## 3. Composer

```yaml
- id: mussorgsky
  match: Modest Mussorgsky
  sort_name: Mussorgsky, Modest
  born: 1839
  died: 1881
  era: romantic
  names:
    en: { name: Modest Mussorgsky, short: Mussorgsky }
    tr: { name: Modest Musorgski, short: Musorgski }
  nationality: { en: Russian, tr: Rus }
  facts:
    born: { en: "21 March 1839, Karevo, Pskov Governorate", tr: "21 Mart 1839, Karevo, Pskov Guberniyası" }
    died: { en: "28 March 1881, St Petersburg", tr: "28 Mart 1881, St. Petersburg" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Boris Godunov*, *Pictures at an Exhibition*, *Night on Bald Mountain*", tr: "*Boris Godunov*, *Bir Sergiden Tablolar*, *Kel Dağda Bir Gece*" }
  bio:
    en: |-
      Mussorgsky was born in 1839 at Karevo, a country estate in the Pskov region of western Russia, into a wealthy family of landowning nobles. His mother gave him his first piano lessons when he was six. At ten he was sent to school in St Petersburg, and at thirteen he entered the Cadet School of the Guards, the usual path for a boy of his class. In 1856 he became an officer in the Preobrazhensky Regiment. That winter he met the composer Alexander Dargomyzhsky, and soon afterwards Mily Balakirev, who taught him musical form. In 1858 he resigned his commission to devote himself to music.

      The emancipation of the serfs in 1861 cost his family half its estate, and for most of his life Mussorgsky earned his living as a low-ranking civil servant, composing in the time left over. He belonged to the circle around Balakirev later known as The Five, who wanted a music that sounded Russian. He wanted his vocal music to follow the natural rhythms of Russian speech, and his opera *Boris Godunov* did exactly that. The Mariinsky Theatre rejected its first version in 1871; a revised version reached the stage in February 1874. In the same year he wrote *Pictures at an Exhibition* for piano, in memory of his friend Viktor Hartmann, an architect and painter.

      Heavy drinking, which had begun to trouble him in the 1860s, damaged his health and his work. He left the operas *Khovanshchina* and *The Fair at Sorochyntsi* unfinished. In March 1881, days before his death, Ilya Repin painted his portrait in a St Petersburg military hospital. He died a week after his 42nd birthday. His friend Nikolai Rimsky-Korsakov completed and edited much of his music, smoothing its rough harmonies, and it was mostly in those versions that the world first came to know him. Ravel's orchestration of *Pictures at an Exhibition* (1922) made the suite famous in the concert hall.
    tr: |-
      Musorgski 1839'da Rusya'nın batısındaki Pskov bölgesinde, Karevo adlı bir çiftlikte, varlıklı ve toprak sahibi soylu bir ailede doğdu. İlk piyano derslerini altı yaşında annesinden aldı. On yaşında St. Petersburg'da okula gönderildi, on üç yaşında da sınıfından bir çocuk için olağan yol olan Muhafız Harbiye Okulu'na girdi. 1856'da Preobrajenski Alayı'nda subay oldu. O kış besteci Aleksandr Dargomıjski ile, kısa süre sonra da ona müzikal biçimi öğreten Mili Balakirev ile tanıştı. 1858'de kendini müziğe adamak için ordudan ayrıldı.

      1861'de serfliğin kaldırılması ailesine mülkünün yarısına mal oldu; Musorgski hayatının büyük kısmında geçimini alt kademede bir devlet memuru olarak sağladı, beste yapmaya ise geriye kalan zamanda vakit buldu. Rus gibi duyulan bir müzik isteyen ve sonradan "Beşler" diye anılacak olan Balakirev çevresine katıldı. Sesli müziğinin Rusça konuşmanın doğal ritimlerini izlemesini istiyordu ve *Boris Godunov* operası tam da bunu yaptı. Mariinski Tiyatrosu operanın ilk biçimini 1871'de geri çevirdi; düzeltilmiş biçim Şubat 1874'te sahneye çıktı. Aynı yıl, mimar ve ressam dostu Viktor Hartmann'ın anısına piyano için *Bir Sergiden Tablolar*'ı yazdı.

      1860'larda başlayan ağır içki alışkanlığı sağlığını ve çalışmasını yıprattı. *Hovanşçina* ve *Soroçintsi Panayırı* operalarını yarım bıraktı. Mart 1881'de, ölümünden birkaç gün önce, İlya Repin onun portresini St. Petersburg'daki bir askeri hastanede yaptı. 42. doğum gününden bir hafta sonra öldü. Dostu Nikolay Rimski-Korsakov müziğinin büyük bölümünü tamamladı ve düzenledi, pürüzlü armonilerini yumuşattı; dünya onu önce çoğunlukla bu biçimlerle tanıdı. Ravel'in 1922 tarihli orkestrasyonu *Bir Sergiden Tablolar*'ı konser salonlarında ünlü yaptı.
  portrait:
    artist: { en: Ilya Repin, tr: İlya Repin }
    title: { en: Portrait of the Composer Modest Mussorgsky, tr: Besteci Modest Musorgski'nin Portresi }
    year: "1881"
    collection: { en: "State Tretyakov Gallery, Moscow", tr: "Devlet Tretyakov Galerisi, Moskova" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Ilya_Repin_-_%D0%9F%D0%BE%D1%80%D1%82%D1%80%D0%B5%D1%82_%D0%BA%D0%BE%D0%BC%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B0_%D0%9C.%D0%9F.%D0%9C%D1%83%D1%81%D0%BE%D1%80%D0%B3%D1%81%D0%BA%D0%BE%D0%B3%D0%BE_-_Google_Art_Project.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Ilya_Repin_-_%D0%9F%D0%BE%D1%80%D1%82%D1%80%D0%B5%D1%82_%D0%BA%D0%BE%D0%BC%D0%BF%D0%BE%D0%B7%D0%B8%D1%82%D0%BE%D1%80%D0%B0_%D0%9C.%D0%9F.%D0%9C%D1%83%D1%81%D0%BE%D1%80%D0%B3%D1%81%D0%BA%D0%BE%D0%B3%D0%BE_-_Google_Art_Project.jpg
    width: 3205
    height: 4000
    license: Public domain (PD-Art, PD-old-100; painter d. 1930)
    focal_y: 0.3
```

### Sources for composers-sources.md

## Modest Mussorgsky (added 2026-11-17, batch November 2026, group G)
- Facts: https://en.wikipedia.org/wiki/Modest_Mussorgsky · https://www.wikidata.org/wiki/Q132682
- Dates are New Style: born 21 March 1839 (9 March O.S.), Karevo, Toropets uyezd, Pskov Governorate; died 28 March 1881 (16 March O.S.), St Petersburg (Nikolaevsky Military Hospital), one week after his 42nd birthday; buried at the Tikhvin Cemetery, Alexander Nevsky Monastery. Wealthy landowning noble family. Piano lessons from his mother from age six; Petrischule in St Petersburg at ten (piano with Anton Gerke); Cadet School of the Guards at 13; commissioned into the Preobrazhensky Regiment 1856; met Dargomyzhsky in winter 1856–57, then Balakirev (lessons in form); resigned his commission 1858. Emancipation of 1861 cost the family half its estate; low-grade civil servant from the 1860s (made "supernumerary" 1867; Forestry Department; Office of Government Control, dismissed 1880). The Five ("kuchka", Stasov 1867). *Boris Godunov*: first version 1868–69, rejected by the Mariinsky 1871, revised version accepted 1872, premiere February 1874. *Pictures at an Exhibition* (piano, 1874) in memory of Viktor Hartmann. Drinking: first serious bout after his mother's death (1865); delirium tremens early 1881. *Khovanshchina* (completed by Rimsky-Korsakov, premiered 1886) and *The Fair at Sorochyntsi* left unfinished. Repin's portrait painted 2–5 March 1881. Rimsky-Korsakov's editions (Boris re-orchestrated 1896, revised 1908). Ravel's orchestration of *Pictures* 1922. "Natural rhythms of Russian speech": standard description of his realist vocal style (e.g. *The Marriage*, 1868, and *Boris*), Wikipedia "Style" section and Britannica (https://www.britannica.com/biography/Modest-Mussorgsky), not re-checked word for word.
- Repin painted the portrait in the hospital: Wikipedia ("Repin … painted the famous portrait" in the Nikolaevsky Military Hospital, 2–5 March 1881); the bio says "a St Petersburg military hospital".
- Portrait: Ilya Repin (1844–1930), *Portrait of the composer M. P. Mussorgsky*, 1881, oil on canvas, State Tretyakov Gallery, Moscow (museum page https://www.tretyakovgallery.ru/en/collection/portret-kompozitora-m-p-musorgskogo/).
  https://commons.wikimedia.org/wiki/File:Ilya_Repin_-_Портрет_композитора_М.П.Мусоргского_-_Google_Art_Project.jpg — 3205 × 4000, Google Art Project, {{PD-Art|PD-old-auto-expired}}. PD everywhere (painter d. 1930; published long before 1931). Fallback: File:Modest_Músorgski,_por_Iliá_Repin.jpg (1670 × 2048, from the Tretyakov site).
- focal_y 0.3: face at about one third of the height (thumbnail checked).

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Mussorgsky – Night on Bald Mountain | I Night on Bald Mountain | – | 10:14 | – | Reiner / Chicago SO 1959, Spotify `59KBkW6AikOOlCzv2pZSwM` (track 17) | 0:00, 0:40–1:40, 1:45, 2:45–3:45, 4:00–6:30, 6:30–7:10, 7:15, 7:45, 8:45, Last 30 seconds | New piece, never timed by ear. Least certain: Chernobog section (≈ 2:45–3:45), bell (≈ 7:15), clarinet dawn melody (≈ 7:45). See `research/mussorgsky-night-on-bald-mountain.md` |
