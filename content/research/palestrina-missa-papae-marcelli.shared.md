# Shared-file additions: palestrina-missa-papae-marcelli

## 1. paintings.yaml

```yaml
palestrina-missa-papae-marcelli:
  # Commons licence: {{PD-art-100-expired}} (Raphael d. 1520). Portrait format, 4570 × 7333 (source uffizi.it).
  # Cover crop: keep the angel choir at the top and Cecilia's face. Painting on panel transferred to canvas in Paris
  # (Wikipedia); Wikidata gives 220 × 136 cm.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Raffaello_(1483-1520)_-_Pala_di_Santa_Cecilia_-_577_-_Pinacoteca_Nazionale_di_Bologna.jpg
  source_url: https://pinacotecabologna.cultura.gov.it/opere-darte/estasi-di-santa-cecilia-fra-i-santi-paolo-giovanni-evangelista-agostino-e-maria-maddalena-361
  commons_page: https://commons.wikimedia.org/wiki/File:Raffaello_(1483-1520)_-_Pala_di_Santa_Cecilia_-_577_-_Pinacoteca_Nazionale_di_Bologna.jpg
  width: 4570
  height: 7333
  medium: Oil on canvas (transferred from panel)
  license: Public domain (PD-Art)
  credit_line: Raphael, The Ecstasy of Saint Cecilia, c. 1516–17. Pinacoteca Nazionale, Bologna (inv. 577). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Pairing note (in the drafts): Cecilia, patron saint of church music, lets her little organ slip and listens to a choir of angels singing above her, voices alone, as in Palestrina's Mass, while broken instruments lie at her feet.

**Alternative 1.** Giovanni Paolo Panini, *Interior of Saint Peter's, Rome*, c. 1754. National Gallery of Art, Washington (1968.13.2, Ailsa Mellon Bruce Fund). Commons: `File:Giovanni_Paolo_Panini,_Interior_of_Saint_Peter's,_Rome,_c._1754,_NGA_50884.jpg` (4000 × 3138, CC0, NGA Open Access). Pairing: the basilica where Palestrina led the Cappella Giulia (1551–55 and 1571–94) and where he is buried beneath the floor; painted two centuries later, so the note should say "the church he served", not "as he knew it".

**Alternative 2.** Anonymous, *The Council of Trent in session*, 16th–17th century. Museo del Castello del Buonconsiglio, Trento. Commons: `File:Concilio_Trento_Museo_Buonconsiglio.jpg` (4056 × 3340; the photo is tagged CC BY-SA 3.0 by its photographer, but as a faithful photo of a PD painting it carries no new right under EU DSM art. 14; check the frame edges and the museum attribution before use). Pairing: the council around which the legend of the Mass grew. Weaker image; use only if both of the above clash.

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Mass | The main Catholic service, and music for its fixed texts | The central service of the Catholic Church. In music, a setting of its five fixed sung texts: Kyrie, Gloria, Credo, Sanctus with Benedictus, and Agnus Dei. |
| Homophony | All voices moving together in the same rhythm | Music in which all the voices move together in the same rhythm, as a chain of chords, so that words sung by a choir come through clearly. The opposite of polyphony. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Mass | Missa | Katolik ayini ve değişmeyen metinlerinin müziği | Katolik Kilisesi'nin başlıca ayini. Müzikte, ayinin değişmeyen beş metninin bestesi: Kyrie, Gloria, Credo, Benedictus'la birlikte Sanctus ve Agnus Dei. |
| Homophony | Homofoni | Bütün seslerin aynı ritimle birlikte ilerlemesi | Bütün seslerin aynı ritimle, bir akorlar zinciri gibi birlikte ilerlediği müzik; böylece bir koronun söylediği sözler açıkça duyulur. Polifoninin karşıtı. |

## 3. Composer

```yaml
- id: palestrina
  match: Giovanni Pierluigi da Palestrina
  sort_name: Palestrina, Giovanni Pierluigi da
  born: 1525
  died: 1594
  era: renaissance
  names:
    en: { name: Giovanni Pierluigi da Palestrina, short: Palestrina }
    tr: { name: Giovanni Pierluigi da Palestrina, short: Palestrina }
  nationality: { en: Italian, tr: İtalyan }
  facts:
    born: { en: "c. 1525, Palestrina, near Rome", tr: "y. 1525, Palestrina, Roma yakınları" }
    died: { en: "2 February 1594, Rome", tr: "2 Şubat 1594, Roma" }
    symphonies: { en: "None (the form did not exist yet)", tr: "Yok (bu tür henüz ortada yoktu)" }
    best_known_for: { en: "*Missa Papae Marcelli*, more than 100 masses, motets", tr: "*Missa Papae Marcelli*, yüzü aşkın missa, motetler" }
  bio:
    en: |-
      Palestrina took his name from his birthplace, a small town in the hills east of Rome, where he was born around 1525. As a boy he sang in the choir of the basilica of Santa Maria Maggiore in Rome, and from 1544 he was organist of the cathedral of his home town. When its bishop became Pope Julius III, he brought Palestrina to Rome in 1551 as choirmaster of the Cappella Giulia at St Peter's. His first book of masses, dedicated to the pope in 1554, was the first such book by a composer born in Italy; until then the leading church composers in Italy came from the Low Countries, France or Spain.

      In 1555 a new pope ruled that the papal singers must be clergy, and Palestrina, who was married with children, had to leave the papal choir. He went on to lead the music at St John Lateran and then at Santa Maria Maggiore, and in 1571 he returned to St Peter's, where he stayed for the rest of his life. The 1570s brought heavy losses: outbreaks of plague killed his brother, two of his sons and his wife. He then married a wealthy widow, which gave him the security to compose and publish freely.

      He died in Rome in February 1594 and was buried in St Peter's, in a coffin whose lead plate called him "Prince of Music". He left more than a hundred masses and some three hundred [[motet]]s. His calm, carefully controlled way of weaving voices together became the model for teaching [[counterpoint]] for centuries, above all through Johann Joseph Fux's textbook of 1725, and Bach copied and performed his masses. A legend that he saved church music at the Council of Trent kept his name famous, although historians have found no evidence for it.
    tr: |-
      Palestrina adını, Roma'nın doğusundaki tepelerde küçük bir kasaba olan doğum yerinden aldı; orada 1525 dolaylarında doğdu. Çocukken Roma'daki Santa Maria Maggiore bazilikasının korosunda şarkı söyledi, 1544'ten itibaren de memleketindeki katedralin orgcusu oldu. Bu katedralin piskoposu Papa III. Julius olunca, 1551'de Palestrina'yı Roma'ya, Aziz Petrus'taki Cappella Giulia'nın koro şefliğine getirdi. 1554'te papaya ithaf ettiği ilk missa kitabı, İtalya'da doğmuş bir bestecinin bu türdeki ilk kitabıydı; o güne dek İtalya'nın önde gelen kilise bestecileri Alçak Ülkeler'den, Fransa'dan ya da İspanya'dan gelirdi.

      1555'te yeni papa, papalık şarkıcılarının din adamı olması gerektiğine hükmetti; evli ve çocuk sahibi olan Palestrina papalık korosundan ayrılmak zorunda kaldı. Ardından önce San Giovanni in Laterano'nun, sonra Santa Maria Maggiore'nin müziğini yönetti ve 1571'de Aziz Petrus'a döndü; hayatının sonuna dek orada kaldı. 1570'ler ağır kayıplar getirdi: veba salgınları kardeşini, iki oğlunu ve karısını aldı. Sonra varlıklı bir dulla evlendi; bu evlilik ona özgürce beste yapıp eserlerini basacak güvenceyi sağladı.

      Şubat 1594'te Roma'da öldü ve Aziz Petrus'a gömüldü; tabutunun kurşun levhasında ona "Müziğin Prensi" deniyordu. Yüzü aşkın missa ve üç yüz kadar [[motet|motet]] bıraktı. Sesleri sakin ve titizlikle denetlenen bir biçimde birbirine örme yolu, başta Johann Joseph Fux'un 1725 tarihli ders kitabı aracılığıyla, yüzyıllar boyunca [[counterpoint|kontrpuan]] öğretiminin modeli oldu; Bach da onun missalarını kopyalayıp seslendirdi. Trento Konsili'nde kilise müziğini kurtardığına dair efsane adını ünlü tuttu; oysa tarihçiler bunu destekleyen bir kanıt bulamadı.
  portrait:
    # No portrait from life is certain; this is the traditional likeness, in a later reproduction (see sources).
    artist: { en: "After Heinrich E. von Winter", tr: "Heinrich E. von Winter'den" }
    title: { en: Giovanni Pierluigi da Palestrina, tr: Giovanni Pierluigi da Palestrina }
    year: "c. 1880–1928, after an early 19th-century lithograph"
    collection: { en: "Bibliothèque nationale de France, Paris", tr: "Fransa Ulusal Kütüphanesi, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Giovanni_Pierluigi_da_Palestrina_-_d'apr%C3%A8s_H._E._von_Wintter_-_btv1b84233685.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Giovanni_Pierluigi_da_Palestrina_-_d'apr%C3%A8s_H._E._von_Wintter_-_btv1b84233685.jpg
    width: 3616
    height: 4800
    license: Public domain (PD-France; PD-old-auto-expired, model's artist d. 1825)
    focal_y: 0.3
```

### Sources for composers-sources.md

## Palestrina (added 2026-11-17, batch November 2026, group B)
- Facts: https://en.wikipedia.org/wiki/Giovanni_Pierluigi_da_Palestrina · https://www.wikidata.org/wiki/Q179277 (born 1525, died 2 February 1594)
- Born between 3 February 1525 and 2 February 1526 (Wikipedia), in Palestrina, then in the Papal States; the card says "c. 1525". Died 2 February 1594, Rome, of pleurisy; buried the same day in St Peter's, lead plate "Ioannes Petrus Aloysius Praenestinus Musicæ Princeps"; the grave has not been found since.
- Chorister at Santa Maria Maggiore from 1537; organist of the cathedral of St Agapito in Palestrina 1544–51; Julius III (previously bishop of Palestrina) made him maestro di cappella of the Cappella Giulia in 1551; first book of masses 1554, dedicated to Julius III, "the first book of Masses by a native composer" (most church composers in Italy were from the Low Countries, France or Spain). 1555: Paul IV ordered that all papal choristers be clerics; married, Palestrina could not continue. St John Lateran 1555–60, Santa Maria Maggiore 1561–66, back to the Cappella Giulia 1571 until his death. Plague: brother, two sons, wife Lucrezia Gori (1572, 1575, 1580); remarried the wealthy widow Virginia Dormoli (financial independence).
- Works: 105 masses, over 300 motets (Wikipedia gives "over 250" in the lead and "more than 300" in the body; the bio says "some three hundred"), 68 offertories, at least 140 madrigals, 72 hymns, 35 magnificats.
- Influence: Fux, *Gradus ad Parnassum* (1725), species counterpoint on Palestrina's model; Bach hand-copied Palestrina's first book of masses and in 1742 adapted the Kyrie and Gloria of the *Missa sine nomine* (Wikipedia, Reputation). Legend of the "saviour of church music": Agazzari 1607, Baini 1828, Pfitzner's opera *Palestrina* (1917); no evidence (Wikipedia, Missa Papae Marcelli and Palestrina articles).
- Portrait: anonymous reproduction (Neue Musik-Zeitung "Kunstbeilage"), between 1880 and 1928, after a lithograph by Heinrich E. von Winter (1788–1825). Bibliothèque nationale de France, département de la Musique, Est.PalestrinaG.006 (ark:/12148/btv1b84233685).
  https://commons.wikimedia.org/wiki/File:Giovanni_Pierluigi_da_Palestrina_-_d'après_H._E._von_Wintter_-_btv1b84233685.jpg — 3616 × 4800, {{PD-France}} {{PD-old-auto-expired|1825}} {{PD-US-expired}}. The oval likeness sits in a wide paper margin; focal_y 0.3 keeps the face (about 35 % from the top) in the crop; cropping the master to the oval would be better.
  No portrait from his lifetime is certain: the woodcut in the 1554 book of masses (Palestrina presenting the book to Julius III) is tiny and copied from a Morales print; the oil portraits usually reproduced are of uncertain origin and exist on Commons only at low resolution (File:Giovanni_Pierluigi_da_Palestrina.jpg, 462 × 595). Alternative of the same traditional type: File:Giovanni_Pierluigi_da_Palestrina_-_d'après_R._-_btv1b8423364h.jpg (2648 × 4040, BnF, 1877 cabinet card, PD-old-assumed). If a likeness of uncertain authenticity is not wanted, set `portrait: null` as for Tallis.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Palestrina – Missa Papae Marcelli | all | – | – | – | The Sixteen / Christophers, Spotify `0lSeYO6mLZIngXj5NPS3Hl`, tracks 4–9 (3:57 / 5:50 / 8:33 / 6:08 / 3:17 / 3:36) | every stop (≈) | New piece, never timed by ear: stops placed from the text divisions of the Tallis Scholars' split album scaled to The Sixteen's track lengths. Least certain: Gloria/Credo 0:00 (chant intonation or not), Agnus Dei I–II interior stops. Details in `research/palestrina-missa-papae-marcelli.md` |
