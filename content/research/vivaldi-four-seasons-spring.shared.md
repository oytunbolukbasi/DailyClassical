# Shared-file additions: vivaldi-four-seasons-spring

For merging into `content/paintings.yaml`, the glossary files, `content/composers.yaml`, `content/research/composers-sources.md` and `content/research/retime-needed.md`. Sources: `content/research/vivaldi-four-seasons-spring.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
vivaldi-four-seasons-spring:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Jean-Antoine_Watteau_-_F%C3%AAtes_Venitiennes_-_Google_Art_Project.jpg
  source_url: https://www.nationalgalleries.org/art-and-artists/5560
  commons_page: https://commons.wikimedia.org/wiki/File:Jean-Antoine_Watteau_-_F%C3%AAtes_Venitiennes_-_Google_Art_Project.jpg
  width: 3238
  height: 4001
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100; Google Art Project)
  credit_line: Jean-Antoine Watteau, Fêtes vénitiennes, c. 1718–19. Scottish National Gallery, Edinburgh (NG 439). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`source_url` is the National Galleries of Scotland object page built from Wikidata Q5861788 (P8946 = 5560); the server refused scripted requests (HTTP 403), so it was not opened. The Google Arts & Culture record is https://artsandculture.google.com/asset/UAGfGLe1x0yn-g. Portrait format (0.81:1): the dancer is at the centre and the musette player at the right edge.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Sandro Botticelli (c. 1445–1510) | *Primavera* | c. 1480 | Uffizi, Florence | https://commons.wikimedia.org/wiki/File:Sandro_Botticelli_-_La_Primavera_-_Google_Art_Project.jpg (5084 × 3377, public domain) | The most famous painting of spring: Flora scatters flowers and the Graces dance in an orange grove, as the season itself arrives in Vivaldi's first bars. |
| B | Nicolas Poussin (1594–1665) | *Spring* (*The Earthly Paradise*), from *The Four Seasons* | 1660–64 | Musée du Louvre, Paris (INV 7303) | https://commons.wikimedia.org/wiki/File:Nicolas_Poussin_-_Le_Printemps.jpg (2024 × 1503, public domain) | The first of Poussin's own *Four Seasons*, a set of four landscapes painted, like Vivaldi's concertos, as one cycle of the year. |

A has the strongest image but no link of period or place; B is a seasons cycle like Vivaldi's, at a lower resolution (2024 px wide; check the Louvre's own download before use).

## 3. Glossary rows (new terms only)

Used here and in `bach-brandenburg-concerto-5` (Ritornello, Continuo). Add once.

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Continuo | The bass line and chords that underpin Baroque music | The accompaniment that runs under almost all Baroque music: a bass line played by a cello, bassoon or double bass, with a harpsichord, organ or lute filling in the chords. |
| Drone | A long-held low note, like a bagpipe's | One or more low notes held or repeated for a long time under a melody, like the drone pipes of a bagpipe. |
| Ritornello | The returning refrain of a Baroque concerto | In a Baroque concerto, the passage the whole ensemble plays at the start and brings back, often shortened or in new keys, between the soloist's episodes. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Continuo | Continuo | Barok müziğin altındaki bas çizgisi ve akorlar | Barok müziğin neredeyse tamamının altında süren eşlik: bir viyolonselin, fagotun ya da kontrbasın çaldığı bas çizgisi ve üstünde akorları dolduran bir klavsen, org ya da lavta. |
| Drone | Dem sesi | Gaydadaki gibi uzun tutulan pes nota | Bir ezginin altında uzun süre tutulan ya da yinelenen bir ya da birkaç pes nota; gaydanın dem borularındaki gibi. |
| Ritornello | Ritornello | Barok konçertonun geri dönen nakaratı | Barok konçertoda bütün topluluğun başta çaldığı ve solistin bölümleri arasında, çoğu zaman kısaltılarak ya da başka tonlarda, yeniden getirdiği pasaj. |
```

## 4. `content/composers.yaml`: new composer `vivaldi`

```yaml
- id: vivaldi
  match: Antonio Vivaldi
  sort_name: Vivaldi, Antonio
  born: 1678
  died: 1741
  era: baroque
  names:
    en: { name: Antonio Vivaldi, short: Vivaldi }
    tr: { name: Antonio Vivaldi, short: Vivaldi }
  nationality: { en: Italian, tr: İtalyan }
  facts:
    born: { en: "4 March 1678, Venice", tr: "4 Mart 1678, Venedik" }
    died: { en: "28 July 1741, Vienna", tr: "28 Temmuz 1741, Viyana" }
    symphonies: { en: "None (only short string *sinfonie*)", tr: "Yok (yalnızca kısa yaylı *sinfonia*'lar)" }
    best_known_for: { en: "*The Four Seasons*, violin concertos, *Gloria*", tr: "*Dört Mevsim*, keman konçertoları, *Gloria*" }
  bio:
    en: |-
      Vivaldi was born in Venice in 1678, the son of a barber who became a professional violinist and taught him the instrument. He trained for the priesthood and was ordained in 1703, and his red hair earned him the nickname "the Red Priest". A chronic "tightness of the chest" soon excused him from saying Mass, and music became his whole career.

      In 1703 he became violin master at the Ospedale della Pietà, a Venetian home for abandoned children whose orchestra and choir of girls became famous across Europe. He wrote hundreds of concertos, many of them for the girls, and his collection *L'estro armonico* (1711) made his name abroad; Bach later arranged some of his concertos. He also wrote and staged dozens of operas, and spent three years at the court of Mantua, where he probably composed much of *The Four Seasons*.

      Tastes changed, and in Venice his music went out of fashion. He moved to Vienna, hoping for the support of the Emperor Charles VI, who had admired him, but the emperor died soon after he arrived, and Vivaldi died there in poverty in July 1741. For almost two centuries he was nearly forgotten. His music was rediscovered in the 20th century, and by 2011 about a thousand recordings of *The Four Seasons* had been made.
    tr: |-
      Vivaldi 1678'de Venedik'te doğdu. Babası, sonradan profesyonel kemancı olmuş bir berberdi ve oğluna keman çalmayı o öğretti. Antonio rahip olmak için eğitim aldı ve 1703'te papaz oldu; kızıl saçları yüzünden ona "Kızıl Rahip" dendi. Sürekli bir "göğüs darlığı" çektiği için kısa sürede ayin yönetmekten muaf tutuldu ve müzik onun bütün mesleği oldu.

      1703'te, Venedik'te terk edilmiş çocuklara bakan bir yurt olan Ospedale della Pietà'nın keman öğretmeni oldu; yurdun kızlardan oluşan orkestrası ve korosu bütün Avrupa'da ün kazandı. Çoğunu bu kızlar için olmak üzere yüzlerce konçerto yazdı; *L'estro armonico* (1711) adlı derlemesi adını yurt dışında duyurdu, Bach da sonradan onun bazı konçertolarını uyarladı. Onlarca opera yazıp sahneledi ve üç yıl Mantova sarayında çalıştı; *Dört Mevsim*'in büyük bölümünü büyük olasılıkla orada besteledi.

      Zevkler değişti ve Venedik'te müziği modası geçmiş sayılmaya başladı. Kendisine hayran olan İmparator VI. Karl'ın desteğini umarak Viyana'ya taşındı; ama imparator onun gelişinden kısa süre sonra öldü ve Vivaldi Temmuz 1741'de orada yoksulluk içinde hayata gözlerini yumdu. Yaklaşık iki yüzyıl boyunca neredeyse unutuldu. Müziği 20. yüzyılda yeniden keşfedildi; 2011'e gelindiğinde *Dört Mevsim*'in bine yakın kaydı yapılmıştı.
  portrait:
    artist: François Morellon de La Cave
    title: { en: "Portrait of Antonio Vivaldi (Effigies Antonii Vivaldi)", tr: "Antonio Vivaldi'nin Portresi (Effigies Antonii Vivaldi)" }
    year: "1725"
    collection: { en: "Rijksmuseum, Amsterdam", tr: "Rijksmuseum, Amsterdam" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Portret_van_de_Italiaanse_componist_Antonio_Vivaldi_Effigies_Antonii_Vivaldi_(titel_op_object),_RP-P-2016-1496-1.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Portret_van_de_Italiaanse_componist_Antonio_Vivaldi_Effigies_Antonii_Vivaldi_(titel_op_object),_RP-P-2016-1496-1.jpg
    width: 1902
    height: 2500
    license: Public domain (engraving of 1725; Rijksmuseum image CC0)
    focal_y: 0.25
```

Engraving, made for the first edition of Op. 8 (1725), the publication that contains *The Four Seasons*. The file includes a wide paper margin; a tighter crop would help the cover.

## 5. `content/research/composers-sources.md` (new section)

```
## Vivaldi (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Antonio_Vivaldi · https://www.britannica.com/biography/Antonio-Vivaldi · https://www.wikidata.org/wiki/Q1340
- Born 4 March 1678, Venice; died night of 27/28 July 1741, Vienna (card: 28 July). Ordained 1703; "il Prete Rosso"; excused from saying Mass ("strettezza di petto"). Ospedale della Pietà from September 1703; *L'estro armonico* Amsterdam 1711; Mantua (Philip of Hesse-Darmstadt) from 1717/18 for three years; met Charles VI 1728; Vienna; the emperor died shortly after his arrival (October 1740). About 1,000 recordings of *The Four Seasons* by 2011 (Wikipedia, *The Four Seasons*). Bach's arrangements: Wikipedia (Bach) "Bach copied and arranged Italian masters such as Vivaldi (e.g. BWV 1065)".
- "None (only short string *sinfonie*)": he wrote string and opera *sinfonie*, not symphonies in the later sense.
- Portrait: François Morellon de La Cave, *Effigies Antonii Vivaldi*, engraving, 1725 (signed "F. M. la Cave Sculpsit 1725"), frontispiece portrait for the first edition of Op. 8. Rijksmuseum RP-P-2016-1496-1.
  https://commons.wikimedia.org/wiki/File:Portret_van_de_Italiaanse_componist_Antonio_Vivaldi_Effigies_Antonii_Vivaldi_(titel_op_object),_RP-P-2016-1496-1.jpg — 1902 × 2500, CC0 (Rijksmuseum). Rejected: the anonymous Bologna oil (File:Vivaldi.jpg), identification questioned.
```

## 6. `content/research/retime-needed.md` rows

```
| Vivaldi – The Four Seasons: Spring | I Allegro | – | 3:18 | – | Standage / Pinnock, Spotify `5tgFFNHTrkzpihDgYvpXEL` (track 1) | 0:00, 0:30, 1:05, 1:13, 1:44, 2:13, 2:20, 3:02 | Derived from bar positions (82 bars, ≈ 2.4 s per bar), not heard. Least certain: the storm and the minor ritornello |
| Vivaldi – The Four Seasons: Spring | II Largo e pianissimo sempre | – | 2:42 | – | same (track 2) | 0:00, 0:05, 1:20, Near the end | Estimated |
| Vivaldi – The Four Seasons: Spring | III Danza pastorale | – | 3:40 | – | same (track 3) | 0:00, 0:30, 0:55, 1:10, 1:50, 2:30, 3:05 | Estimated from proportions; re-time all |
```
