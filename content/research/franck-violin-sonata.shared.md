# Shared-file additions: franck-violin-sonata

For merging into `content/paintings.yaml`, the glossary files, `content/composers.yaml`, `content/research/composers-sources.md` and `content/research/retime-needed.md`. Sources: `content/research/franck-violin-sonata.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
franck-violin-sonata:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Khnopff,_Listening_to_Schumann.jpg
  source_url: http://balat.kikirpa.be/object/20037227
  commons_page: https://commons.wikimedia.org/wiki/File:Khnopff,_Listening_to_Schumann.jpg
  width: 3782
  height: 3288
  medium: Oil on canvas
  license: Public domain (PD-old; photographic reproduction of a 2D work)
  credit_line: Fernand Khnopff, Listening to Schumann, 1883. Royal Museums of Fine Arts of Belgium, Brussels (inv. 6366). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the BALaT record of the Royal Institute for Cultural Heritage (KIK-IRPA), from Wikidata Q60051775 (P3293); the museum's own object page was not found. The Commons file is a visitor's photograph (via Flickr); the frame edge shows slightly at the top, so crop a few pixels.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Henri Fantin-Latour (1836–1904) | *Around the Piano* (*Autour du piano*) | 1885 | Musée d'Orsay, Paris | https://commons.wikimedia.org/wiki/File:Henri_fantin-latour,_attorno_al_piano,_1885.JPG (2776 × 2088, tagged public domain; a gallery photograph, check the tag) | Painted in Paris a year before the sonata, it gathers a circle of Wagner-loving musicians round a piano, among them Vincent d'Indy, Franck's pupil, who later told the story of the sonata's first performance. |
| B | Pierre-Auguste Renoir (1841–1919) | *Dance at Bougival* | 1883 | Museum of Fine Arts, Boston (37.375) | https://commons.wikimedia.org/wiki/File:Dance-At-Bougival.jpg (2301 × 4366, PD-Art) | A young couple dancing, wrapped up in each other: a picture of the love the sonata was written to celebrate, as a wedding present. |

For A, the sitters (Chabrier at the piano, d'Indy among the listeners) are as given on Wikipedia's *Around the Piano* article and Wikidata Q2873059; check before writing the note into the guide.

## 3. Glossary rows (new terms only)

EN (`content/en/glossary.md`):

```
| Cyclic form | Themes that come back across a work's movements | A way of building a work in several movements so that themes from one movement return, often transformed, in the others. |
```

TR (`content/tr/glossary.md`):

```
| Cyclic form | Döngüsel form | Temaların bölümler boyunca geri döndüğü yapı | Birkaç bölümlük bir eserin, bir bölümdeki temaların öteki bölümlerde, çoğu zaman dönüşerek, yeniden ortaya çıkacağı biçimde kurulması. |
```

Also used: the existing **Canon**, **Recitative**, **Development**, **Recapitulation** and **Rondo**.

## 4. `content/composers.yaml`: new composer `franck`

```yaml
- id: franck
  match: César Franck
  sort_name: Franck, César
  born: 1822
  died: 1890
  era: romantic
  names:
    en: { name: César Franck, short: Franck }
    tr: { name: César Franck, short: Franck }
  nationality: { en: French, tr: Fransız }
  facts:
    born: { en: "10 December 1822, Liège", tr: "10 Aralık 1822, Liège" }
    died: { en: "8 November 1890, Paris", tr: "8 Kasım 1890, Paris" }
    symphonies: { en: "One, in D minor", tr: "Bir, Re minör" }
    best_known_for: { en: "Violin Sonata, Symphony in D minor, organ music", tr: "Keman Sonatı, Re minör Senfoni, org eserleri" }
  bio:
    en: |-
      Franck was born in Liège, in today's Belgium, in 1822. His father, a bank clerk, wanted him to become a touring piano prodigy like Liszt, arranged his first concerts at the age of eleven and in 1835 took him to Paris to study. The virtuoso career never came. Franck broke with his father to marry one of his piano pupils, Félicité Saillot, in February 1848, in the middle of a revolution: the wedding party had to climb over the barricades to reach the church.

      For the rest of his life he earned his living as a church organist and teacher. From 1859 he was organist of the church of Sainte-Clotilde in Paris, famous for his improvisations, and from 1872 professor of organ at the Paris Conservatoire, for which he took French nationality. A devoted circle of pupils, among them Vincent d'Indy, Ernest Chausson and Henri Duparc, gathered around the man they called "Père Franck".

      Almost all the music he is remembered for came in his last dozen years: the Piano Quintet, the Violin Sonata, the Symphony in D minor and the organ *Chorals*, finished a few weeks before his death. Many of these works use [[cyclic form]], with themes that return from one movement to the next. Success came late: his String Quartet, first played in April 1890, was his first unqualified public triumph. He died in Paris that November.
    tr: |-
      Franck 1822'de bugünkü Belçika'da, Liège'de doğdu. Banka memuru olan babası onun Liszt gibi turneye çıkan bir harika çocuk piyanist olmasını istedi; on bir yaşında ilk konserlerini düzenledi ve 1835'te eğitim için onu Paris'e götürdü. Virtüözlük kariyeri hiç gelmedi. Franck, piyano öğrencilerinden Félicité Saillot ile evlenmek için babasıyla yollarını ayırdı; düğün Şubat 1848'de, bir devrimin ortasında yapıldı ve düğün alayı kiliseye ulaşmak için barikatların üstünden geçmek zorunda kaldı.

      Hayatının geri kalanında geçimini kilise orgculuğu ve öğretmenlikle sağladı. 1859'dan itibaren Paris'teki Sainte-Clotilde kilisesinin orgcusuydu ve doğaçlamalarıyla ünlüydü; 1872'den itibaren Paris Konservatuvarı'nda org profesörü oldu ve bu görev için Fransız vatandaşlığına geçti. Aralarında Vincent d'Indy, Ernest Chausson ve Henri Duparc'ın da bulunduğu, ona bağlı bir öğrenci çevresi "Père Franck" ("Franck Baba") dedikleri hocalarının etrafında toplandı.

      Bugün hatırlanan müziğinin neredeyse tamamı hayatının son on iki yılında doğdu: Piyanolu Beşli, Keman Sonatı, Re minör Senfoni ve ölümünden birkaç hafta önce bitirdiği org *Koralleri*. Bu eserlerin çoğu, temaların bir bölümden ötekine geri döndüğü [[cyclic form|döngüsel form]]u kullanır. Başarı geç geldi: Nisan 1890'da ilk kez çalınan Yaylı Dörtlüsü, onun ilk tartışmasız halk başarısı oldu. O yılın kasımında Paris'te öldü.
  portrait:
    artist: Fernand Desmoulin
    title: { en: Portrait of César Franck, tr: César Franck'ın Portresi }
    # Undated etching; Desmoulin died in 1914. See the research note.
    year: "before 1914"
    collection: { en: "Musée Carnavalet, Paris", tr: "Musée Carnavalet, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Portrait_de_C%C3%A9sar_Franck._G.12664_(1_of_2).jpg
    source_url: https://commons.wikimedia.org/wiki/File:Portrait_de_C%C3%A9sar_Franck._G.12664_(1_of_2).jpg
    width: 5114
    height: 6413
    license: Public domain (artist d. 1914; Paris Musées image CC0)
    focal_y: 0.3
```

Nationality: born in Liège (then the United Kingdom of the Netherlands), naturalised French; the sheet says French and the bio names Liège and Belgium. First concerts: Wikipedia says 1834 (he was 11).

## 5. `content/research/composers-sources.md` (new section)

```
## Franck (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/C%C3%A9sar_Franck · https://www.britannica.com/biography/Cesar-Franck · https://www.wikidata.org/wiki/Q50187
- Born 10 December 1822, Liège; died 8 November 1890, Paris. First concerts 1834; Paris 1835 (Reicha). Married Félicité Saillot 22 February 1848 (barricades, per d'Indy). Sainte-Clotilde from 1859; Conservatoire professor 1872 (took French nationality). Pupils d'Indy, Chausson, Duparc, Vierne. Late works: Piano Quintet 1879, Prelude, Chorale and Fugue 1884, Symphonic Variations 1885, Violin Sonata 1886, Symphony in D minor 1886–88, String Quartet (premiered April 1890, first unqualified success), *Trois Chorals* (August–September 1890). Cab accident July 1890; died of pleurisy; the link to the accident is uncertain (not claimed).
- Portrait: Fernand Desmoulin (1853–1914), *Portrait de César Franck*, etching and drypoint, undated, Musée Carnavalet G.12664 (Paris Musées, CC0).
  https://commons.wikimedia.org/wiki/File:Portrait_de_C%C3%A9sar_Franck._G.12664_(1_of_2).jpg — 5114 × 6413. Year label "before 1914" (engraver's death). Rejected: Pierre Petit photograph (472 × 604, too small); Rongier's organ-loft painting (face too small for the crop).
```

## 6. `content/research/retime-needed.md` rows

```
| Franck – Violin Sonata | I Allegretto ben moderato | – | 5:58 | – | Perlman / Ashkenazy, Spotify `5HaEcNyN82ue3NHkqIBVQu` (track 1) | 0:00, 0:12, 1:25, 2:20, 3:40, Near the end | Estimated from the structure, not heard |
| Franck – Violin Sonata | II Allegro | – | 7:58 | – | same (track 2) | 0:00, 0:10, 1:30, 2:30, 3:45, 4:45, 6:45, Near the end | Least certain: the Quasi lento (≈ 3:45) and the recapitulation |
| Franck – Violin Sonata | III Recitativo-Fantasia | – | 7:18 | – | same (track 3) | 0:00, 0:20, 1:30, 2:40, 4:30, 6:00, Near the end | Estimated |
| Franck – Violin Sonata | IV Allegretto poco mosso | – | 6:38 | – | same (track 4) | 0:00, 0:45, 1:15, 2:00, 2:45, 3:40, 4:30, Near the end | Estimated. Also confirm the piano leads the canon, and the metres of II–IV in the Movements table |
```
