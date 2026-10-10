# Shared-file additions: haydn-symphony-94

For the batch merger. Group C. Nothing here has been written to the shared files. This file also carries the new composer `haydn` (used by `haydn-symphony-94` and `haydn-string-quartet-op-76-3`).

## 1. `content/paintings.yaml` (first choice)

```yaml
haydn-symphony-94:
  # A watercolour (pen, ink and watercolour on paper), not an oil. Landscape, 5785 × 4053. YCBA releases its
  # images of public-domain works under CC0.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Thomas_Rowlandson_-_Vauxhall_Gardens_-_Google_Art_Project.jpg
  source_url: https://collections.britishart.yale.edu/catalog/tms:5669
  commons_page: https://commons.wikimedia.org/wiki/File:Thomas_Rowlandson_-_Vauxhall_Gardens_-_Google_Art_Project.jpg
  width: 5785
  height: 4053
  medium: Watercolour, pen and black and grey ink, and graphite on laid paper
  license: Public domain (PD-Art; Yale Center for British Art open access, CC0)
  credit_line: Thomas Rowlandson, Vauxhall Gardens, c. 1784. Yale Center for British Art, Paul Mellon Collection (B1975.4.1844). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Piece-file values: artist Thomas Rowlandson; title *Vauxhall Gardens* (TR *Vauxhall Bahçeleri*); year c. 1784; collection Yale Center for British Art, New Haven (TR Yale İngiliz Sanatı Merkezi, New Haven).

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Canaletto | *Interior of the Rotunda at Ranelagh* | 1754 | National Gallery, London (NG1429) | File:Canaletto Ranelegh 1754.jpg (6000 × 3792, PD-Art) | London's other great pleasure-garden concert hall, with its orchestra and strolling audience: the city's appetite for public concerts that brought Haydn to London. Inventory number from memory: check on the NG page |
| B | Joseph Wright of Derby | *An Experiment on a Bird in the Air Pump* | 1768 | National Gallery, London (NG725) | search Commons for the NG file (not checked: the search budget ran out) | An English audience caught between curiosity and alarm at a sudden, startling moment. Wright is the first choice for `mozart-clarinet-concerto`; use him for one piece only |

## 3. Glossary: new rows

None. Terms used here already exist: sonata form, exposition, development, recapitulation, variation, coda, pedal note, minuet, scherzo, trio, rondo, tutti.

## 4. New composer: `haydn` (full `content/composers.yaml` entry)

Place before `mozart` (chronological by birth: Haydn 1732, Mozart 1756). Sources in §5.

```yaml
- id: haydn
  match: Joseph Haydn
  sort_name: Haydn, Joseph
  born: 1732
  died: 1809
  era: classical
  names:
    en: { name: Joseph Haydn, short: Haydn }
    tr: { name: Joseph Haydn, short: Haydn }
  nationality: { en: Austrian, tr: Avusturyalı }
  facts:
    born: { en: "31 March 1732, Rohrau", tr: "31 Mart 1732, Rohrau" }
    died: { en: "31 May 1809, Vienna", tr: "31 Mayıs 1809, Viyana" }
    symphonies: { en: "104 numbered (about 106 in all)", tr: "104 numaralı (toplam 106 kadar)" }
    best_known_for: { en: "Symphonies, string quartets, *The Creation*", tr: "Senfonileri, yaylı dörtlüleri, *Yaratılış*" }
  bio:
    en: |-
      Haydn was born in 1732 in Rohrau, a village in Lower Austria near the Hungarian border, the son of a wheelwright. At about eight he was sent to Vienna to sing in the choir of St Stephen's Cathedral. When his voice broke he was dismissed, and for years he scraped a living by teaching and playing while he taught himself to compose. For a time he worked as accompanist and valet to the Italian composer Nicola Porpora, from whom, he said, he learned the true fundamentals of composition.

      In 1761 he joined the household of the Esterházy princes, and from 1766 he directed their music for almost thirty years, much of the time at the remote palace of Eszterháza in Hungary. He had an orchestra, singers and an opera house at his disposal and could experiment as he liked. Cut off from the world, he later said, he was "forced to become original". There he wrote most of his symphonies and string quartets and made both into central forms of the Classical style. He became a close friend of Mozart, and in 1792 the young Beethoven came to Vienna to study with him.

      After Prince Nikolaus died in 1790, Haydn travelled to London with the concert manager Johann Peter Salomon, in 1791–92 and again in 1794–95. His twelve London symphonies were a triumph, and Oxford made him an honorary doctor. Back in Vienna he wrote the oratorios *The Creation* and *The Seasons*, and the hymn for the emperor whose tune is now the German national anthem. He died in Vienna in May 1809, while the city was occupied by Napoleon's army. He is often called the father of the symphony and of the string quartet: he did not invent them, but he showed what they could do.
    tr: |-
      Haydn 1732’de, Aşağı Avusturya’da, Macaristan sınırına yakın Rohrau köyünde, bir araba tekerleği ustasının oğlu olarak doğdu. Sekiz yaşlarındayken Viyana’ya, Aziz Stefan Katedrali’nin korosunda şarkı söylemeye gönderildi. Sesi değişince korodan çıkarıldı; yıllarca ders vererek ve çalgı çalarak kıt kanaat geçinirken besteciliği kendi kendine öğrendi. Bir süre İtalyan besteci Nicola Porpora’nın yanında eşlikçi ve uşak olarak çalıştı; kendi deyişiyle, besteciliğin gerçek temellerini ondan öğrendi.

      1761’de Esterházy prenslerinin hizmetine girdi ve 1766’dan itibaren yaklaşık otuz yıl boyunca onların müziğini yönetti; bu sürenin büyük bölümünü Macaristan’daki ıssız Eszterháza sarayında geçirdi. Emrinde bir orkestra, şarkıcılar ve bir opera binası vardı; istediği gibi denemeler yapabiliyordu. Sonradan söylediğine göre, dünyadan kopuk olduğu için “özgün olmaya zorlanmıştı”. Senfonilerinin ve yaylı dörtlülerinin çoğunu orada yazdı ve ikisini de Klasik üslubun temel türleri hâline getirdi. Mozart’la yakın dost oldu; 1792’de genç Beethoven onunla çalışmak için Viyana’ya geldi.

      Prens Nikolaus 1790’da ölünce Haydn, konser düzenleyicisi Johann Peter Salomon’la birlikte 1791–92’de ve yeniden 1794–95’te Londra’ya gitti. On iki Londra senfonisi büyük bir başarı kazandı; Oxford Üniversitesi ona fahri doktora verdi. Viyana’ya döndükten sonra *Yaratılış* ve *Mevsimler* oratoryolarını ve ezgisi bugün Alman milli marşı olan imparator ilahisini yazdı. Mayıs 1809’da, şehir Napolyon’un ordusunun işgali altındayken Viyana’da öldü. Çoğu zaman senfoninin ve yaylı dörtlünün babası diye anılır: bu türleri o icat etmedi, ama neler yapabileceklerini o gösterdi.
  portrait:
    artist: Thomas Hardy
    title: { en: Portrait of Joseph Haydn, tr: Joseph Haydn’ın Portresi }
    year: "1791"
    collection: { en: "Royal College of Music, London", tr: "Royal College of Music, Londra" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Thomas_Hardy_(1757-1804)_-_Joseph_Haydn_(1732%E2%80%931809)_-_PPHC000001_-_Royal_College_of_Music.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Thomas_Hardy_(1757-1804)_-_Joseph_Haydn_(1732%E2%80%931809)_-_PPHC000001_-_Royal_College_of_Music.jpg
    width: 976
    height: 1200
    license: Public domain (PD-Art, PD-old-auto-expired)
    focal_y: 0.25
```

Portrait note: painted in London in 1791, during the first visit (the same months as Symphony No. 94). The Commons file comes from Art UK (RCM object PPHC000001); its embedded metadata points to Art UK's licence terms, but Commons tags it `{{PD-Art|PD-old-auto-expired|deathyear=1804}}` as a faithful reproduction of a 2D work by an artist who died in 1804, the same basis as the other portraits in `composers.yaml`. A larger copy of the same painting with no recorded source exists: File:Joseph_Haydn.jpg (1000 × 1264, the English Wikipedia lead image). Face in the upper third (`focal_y` 0.25, checked from a preview).

## 5. Composer sources (for `content/research/composers-sources.md`)

```
## Haydn
- Facts: https://en.wikipedia.org/wiki/Joseph_Haydn · https://www.wikidata.org/wiki/Q7349 (born 31 March 1732, Rohrau; Wikidata also records 1 April, the baptism; died 31 May 1809, Vienna)
- Bio claims (Wikipedia): wheelwright father; St Stephen's choir from 1740, dismissed 1749; valet-accompanist to Porpora from 1752 ("the true fundamentals of composition"); Vice-Kapellmeister to the Esterházys 1761, Kapellmeister 1766; "forced to become original" at Eszterháza; friend of Mozart from c. 1784; teacher of Beethoven from 1792; London 1791–92 and 1794–95 with Salomon; Oxford honorary doctorate 1791; *The Creation* (1798), *The Seasons* (1801); died during the French occupation of Vienna.
- "104 numbered (about 106 in all)": Wikipedia cites James Webster's count of 106 symphonies; the Hoboken numbering runs to 104.
- Imperial hymn: https://en.wikipedia.org/wiki/Gott_erhalte_Franz_den_Kaiser (1797; tune of the *Deutschlandlied*, whose third stanza is Germany's anthem).
- Portrait: Thomas Hardy (1757–1804), *Joseph Haydn*, 1791, oil on canvas, Royal College of Music, London (PPHC000001).
  https://commons.wikimedia.org/wiki/File:Thomas_Hardy_(1757-1804)_-_Joseph_Haydn_(1732%E2%80%931809)_-_PPHC000001_-_Royal_College_of_Music.jpg — 976 × 1200, Public domain (PD-Art).
```

## 6. `content/research/retime-needed.md` rows

```
| Haydn – Symphony No. 94 | I Adagio cantabile – Vivace assai | – | 8:33 | – | Davis / Concertgebouw, Spotify `2FNZ21rGfvoYz953jd6Tda` (track 1) | 0:00, 0:55, 2:00, 3:00, 5:00, 6:10, Near the end | Estimated from an assumed bar plan; assumes the exposition repeat. Most reliable: ≈ 0:55 |
| Haydn – Symphony No. 94 | II Andante | – | 6:15 | – | same (track 2) | 0:00, 0:30, 1:05, 2:05, 3:25, 4:30, 5:40 | Theme + 4 variations + coda; the surprise chord (≈ 0:30) should be timed exactly |
| Haydn – Symphony No. 94 | III Menuet: Allegro molto | – | 4:51 | – | same (track 3) | 0:00, 2:25, 3:40 | Trio and da capo estimated |
| Haydn – Symphony No. 94 | IV Finale: Allegro di molto | – | 4:06 | – | same (track 4) | 0:00, 0:10, 1:25, Mid-development, 2:40, Near the end | Development and recapitulation estimated |
```
