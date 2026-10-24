# Shared-file material: pachelbel-canon

Batch October 2026 (second batch), group B. Details and sources in `pachelbel-canon.md`.

## 1. paintings.yaml

```yaml
pachelbel-canon:
  # Portrait format (3141 × 4000): check the hero crop. SMB photograph, marked public domain on Commons
  # ({{PD-Art|PD-old-auto-expired}}, CC-PD-Mark); no NC licence on the Commons file.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Gerard_ter_Borch_(der_J%C3%BCngere)_(1617_-_1681)_-_The_Concert_-_791G_-_Gem%C3%A4ldegalerie.jpg
  source_url: https://id.smb.museum/object/869262/das-konzert
  commons_page: https://commons.wikimedia.org/wiki/File:Gerard_ter_Borch_(der_J%C3%BCngere)_(1617_-_1681)_-_The_Concert_-_791G_-_Gem%C3%A4ldegalerie.jpg
  width: 3141
  height: 4000
  medium: Oil on panel
  license: Public domain (PD-Art)
  credit_line: Gerard ter Borch, The Concert, c. 1675. Gemäldegalerie, Staatliche Museen zu Berlin (791G). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

**Alternatives**

1. Johannes Vermeer, *Lady at the Virginal with a Gentleman ("The Music Lesson")*, c. 1662–65. Royal Collection, London. Commons: `File:Johannes Vermeer - Lady at the Virginal with a Gentleman, 'The Music Lesson' - Google Art Project.jpg` (4356 × 5014, PD-Art, Google Art Project). Pairing: a keyboard and a bass viol lying on the floor, the continuo pair again, in a Dutch room a decade before Pachelbel's career began.
2. Pieter de Hooch, *A Musical Party in a Courtyard*, 1677. National Gallery, London. Commons: `File:Pieter de Hooch - A Musical Party in a Courtyard.jpg` (4995 × 6000, PD, National Gallery). Pairing: friends making music together at home in 1677, the kind of private chamber music for which Pachelbel's few surviving chamber works were written.

## 2. Glossary

EN

| Term | Short | Definition |
| --- | --- | --- |
| Ground bass | A short bass line repeated throughout a piece | A short melody in the bass that is repeated over and over, unchanged, while the music above it keeps changing. Pachelbel's Canon is built on one. |
| Gigue | A fast, leaping Baroque dance, often in 6/8 or 12/8 | A lively Baroque dance that grew out of the English jig, in a quick, skipping rhythm, often with the parts imitating one another. It usually ends a suite. |

TR

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Ground bass | Yinelenen bas | Eser boyunca tekrarlanan kısa bir bas çizgisi | Bas partisinde, üstündeki müzik sürekli değişirken hiç değişmeden tekrar tekrar çalınan kısa bir ezgi. Pachelbel'in Kanon'u böyle bir bas üzerine kuruludur. |
| Gigue | Gigue | Çoğu zaman 6/8 ya da 12/8'lik, hızlı, sıçrayan bir Barok dansı | İngiliz jig dansından doğmuş, hızlı ve sekerek ilerleyen ritimli canlı bir Barok dansı; partiler çoğu zaman birbirini taklit eder. Genellikle süitin son parçasıdır. |

## 3. Composer

```yaml
- id: pachelbel
  match: Johann Pachelbel
  sort_name: Pachelbel, Johann
  born: 1653
  died: 1706
  era: baroque
  names:
    en: { name: Johann Pachelbel, short: Pachelbel }
    tr: { name: Johann Pachelbel, short: Pachelbel }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "Baptised 1 September 1653 (Old Style), Nuremberg", tr: "1 Eylül 1653'te vaftiz edildi (eski takvim), Nürnberg" }
    died: { en: "Early March 1706, Nuremberg (buried 9 March)", tr: "Mart 1706 başı, Nürnberg (9 Mart'ta gömüldü)" }
    symphonies: { en: "None (the form came after his time)", tr: "Yok (bu tür ondan sonra doğdu)" }
    best_known_for: { en: "*Canon in D*, organ chorales and fugues, *Hexachordum Apollinis*", tr: "*Re majör Kanon*, org koralleri ve fügleri, *Hexachordum Apollinis*" }
  bio:
    en: |-
      Pachelbel was born in Nuremberg in 1653, the son of a wine merchant. After brief studies at the University of Altdorf and at a grammar school in Regensburg, he was working by 1673 as deputy organist of St Stephen's Cathedral in Vienna. He spent five years there, and although he was a Lutheran, the Italian and south German music of the Catholic south shaped his style for good.

      In 1677 he became court organist at Eisenach, where he grew close to the Bach family, and in 1678 he moved to Erfurt as organist of the Predigerkirche. In twelve years there he became one of the leading organ composers in Germany. He taught Johann Christoph Bach, Johann Sebastian's eldest brother, and was godfather to one of the Bach daughters. His first wife and their son died of plague in 1683. After short posts in Stuttgart and Gotha, Nuremberg invited him home in 1695 as organist of St Sebaldus, without the usual audition.

      He died in Nuremberg in March 1706, aged 52. In his lifetime he was famous above all for his organ music, more than two hundred pieces, many of them chorale preludes and fugues, and for *Hexachordum Apollinis* (1699), a set of keyboard variations dedicated to Buxtehude. He also wrote about a hundred vocal works; only a little of his chamber music survives. Today he is known mainly for his [[canon]] in D, a piece that was rediscovered only in the 20th century.
    tr: |-
      Pachelbel 1653'te Nürnberg'de, bir şarap tüccarının oğlu olarak doğdu. Altdorf Üniversitesi'nde ve Regensburg'da bir lisede kısa süre okuduktan sonra, 1673'te Viyana'daki Aziz Stefan Katedrali'nde yardımcı orgcu olarak çalışıyordu. Orada beş yıl kaldı; Lutheryen olmasına karşın Katolik güneyin İtalyan ve güney Alman müziği üslubunu kalıcı olarak biçimlendirdi.

      1677'de Eisenach'ta saray orgcusu oldu ve Bach ailesiyle yakınlaştı; 1678'de Predigerkirche'nin orgcusu olarak Erfurt'a geçti. Oradaki on iki yılında Almanya'nın önde gelen org bestecilerinden biri oldu. Johann Sebastian'ın ağabeyi Johann Christoph Bach'a ders verdi ve Bach kızlarından birinin vaftiz babası oldu. İlk karısı ve oğulları 1683'te vebadan öldü. Stuttgart'ta ve Gotha'da kısa süreli görevlerin ardından, Nürnberg 1695'te onu her zamanki sınava sokmadan St. Sebaldus Kilisesi'nin orgcusu olarak memleketine çağırdı.

      Mart 1706'da, 52 yaşında Nürnberg'de öldü. Hayattayken her şeyden önce, çoğu koral prelüdü ve füg olan iki yüzü aşkın org eseriyle ve Buxtehude'ye ithaf ettiği klavye varyasyonları dizisi *Hexachordum Apollinis* (1699) ile ünlüydü. Yüz kadar vokal eser de yazdı; oda müziğinden ise pek azı günümüze ulaştı. Bugün daha çok, ancak 20. yüzyılda yeniden keşfedilen Re majör [[canon|kanon]]uyla tanınıyor.
  portrait: null
```

### Pachelbel (composers-sources.md)

## Johann Pachelbel (added 2026-10-24)
- Facts: https://en.wikipedia.org/wiki/Johann_Pachelbel · https://www.wikidata.org/wiki/Q76485
- Baptised 1 September 1653 (O.S.; 11 September N.S.), Nuremberg; died early March 1706, buried 9 March (Mattheson gives 3 or 7 March; Wikipedia argues 6 or 7 March is likelier), St Rochus cemetery, Nuremberg. Father a wine dealer. University of Altdorf from 29 June 1669 (left within a year); Gymnasium Poeticum, Regensburg, 1670. Deputy organist at St Stephen's, Vienna, by 1673, five years there; a Lutheran influenced by Catholic south German and Italian music. Eisenach court organist 1677 (friend of Johann Ambrosius Bach); Erfurt, Predigerkirche, June 1678 – August 1690; taught Johann Christoph Bach (1671–1721); godfather to Johanna Juditha Bach. First wife Barbara Gabler and their son died of plague, October 1683. Stuttgart 1690–92, Gotha 1692–95; St Sebaldus, Nuremberg, from 1695, appointed without the usual examination. More than 200 organ pieces; about 100 vocal works; little chamber music survives; *Hexachordum Apollinis* (1699) dedicated to Buxtehude. Canon first published 1919.
- Portrait: none. The Commons category "Johann Pachelbel" holds no portrait (only his grave, plaques, signature and title pages), so `portrait: null`.
- Wikidata Q76485: born 1653-09-01 (Julian), died 1706-03-03 / 1706-03-06 (two values), no image (P18) — consistent with the card's "early March 1706" and `portrait: null`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Pachelbel – Canon and Gigue in D major | I | – | – | – | Spotify 25rpEX3DjxXklkfCb2MO0a, track 1 (4:32) | ≈ 0:00, ≈ 0:09–0:30, ≈ 0:47, ≈ 1:25, ≈ 2:59, ≈ 3:36, ≈ 3:55, last 15 s | New piece, never timed by ear: every stop an estimate from bar positions (57 bars ≈ 4.7 s each). Details in `research/pachelbel-canon.md` |
| Pachelbel – Canon and Gigue in D major | II | – | – | – | Spotify 25rpEX3DjxXklkfCb2MO0a, track 2 (1:20) | ≈ 0:00, ≈ 0:20, ≈ 0:40, ≈ 1:00 | Estimate; assumes both halves repeated |
