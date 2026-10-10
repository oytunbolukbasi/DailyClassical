# Shared-file additions: tallis-spem-in-alium

For merging into `content/paintings.yaml`, the glossary files, `content/composers.yaml`, `content/research/composers-sources.md` and `content/research/retime-needed.md`. Sources: `content/research/tallis-spem-in-alium.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
tallis-spem-in-alium:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/F0427_Louvre_Le_Tintoret_Le_Paradis_INV570_rwk.jpg
  source_url: https://collections.louvre.fr/ark:/53355/cl010064392
  commons_page: https://commons.wikimedia.org/wiki/File:F0427_Louvre_Le_Tintoret_Le_Paradis_INV570_rwk.jpg
  width: 5496
  height: 2124
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100); photograph also CC BY-SA 4.0 (Mbzt)
  credit_line: Jacopo Tintoretto, The Coronation of the Virgin, known as Paradise, c. 1579. Musée du Louvre, Paris (INV 570). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the Louvre collections record built from Wikidata Q18573257 (P9394 = 010064392); not opened. The image is very wide (≈ 2.6:1), like the Goya already in the catalogue. The photograph is tagged both PD-Art and the photographer's CC BY-SA 4.0, as with the Molitor entry; if a file with no share-alike tag is required, use alternative A.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Pieter Bruegel the Elder (c. 1525–1569) | *The Tower of Babel* | 1563 | Kunsthistorisches Museum, Vienna | https://commons.wikimedia.org/wiki/File:Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_(Vienna)_-_Google_Art_Project_-_edited.jpg (30000 × 21952, PD-Art, Google Art Project) | Painted a few years before *Spem in alium*, a vast building made of countless small parts; Babel's confusion of tongues is the opposite of Tallis's forty voices agreeing in one prayer. |
| B | Hans Holbein the Younger (1497/98–1543) | *The Ambassadors* | 1533 | National Gallery, London (NG1314) | https://commons.wikimedia.org/wiki/File:Hans_Holbein_the_Younger_-_The_Ambassadors_-_Google_Art_Project.jpg (30000 × 29560, PD-Art, Google Art Project) | Painted in London when Tallis was a young church musician, during Henry VIII's break with Rome; a lute with a broken string and a Lutheran hymn book speak of the religious discord he lived through. |

Both are very large Google Art Project files; the pipeline downscales them. The pairing notes are suggestions; check the details (B's hymn book and lute are as described by the National Gallery) before use.

## 3. Glossary rows (new terms only)

Possibly also proposed by group C (`allegri-miserere`); add once.

EN (`content/en/glossary.md`):

```
| Motet | A sacred choral piece on a Latin text | A sacred piece for choir, usually unaccompanied, on a Latin text; one of the main forms of Renaissance church music. |
| Polyphony | Several independent melodies sounding together | Music made of several independent melodic lines sung or played at once, each with its own shape, instead of one tune with accompaniment. |
```

TR (`content/tr/glossary.md`):

```
| Motet | Motet | Latince bir metin üzerine dinsel koro eseri | Çoğunlukla eşliksiz koro için, Latince bir metin üzerine yazılmış dinsel eser; Rönesans kilise müziğinin başlıca türlerinden biri. |
| Polyphony | Polifoni | Aynı anda duyulan birkaç bağımsız ezgi | Tek bir ezgi ve eşlik yerine, her biri kendi biçimine sahip birkaç bağımsız ezgi çizgisinin aynı anda söylendiği ya da çalındığı müzik. |
```

## 4. `content/composers.yaml`: new composer `tallis`

**Era: needs a decision.** The `era` enum (`backend/src/db/schema.ts`: baroque, classical, romantic, late_romantic, modern; iOS `Era`) has no `renaissance`. Tallis (c. 1505–1585) is a Renaissance composer, and "Baroque era" would be wrong in the app. Options: (1) add `renaissance` to the enum, a migration, the iOS `Era` and the two strings (a code change: ask first; group C's Allegri, 1582–1652, would use it too); (2) until then, use `baroque` as the nearest value and accept the wrong label. The entry below uses `renaissance`; **the seed will fail on it until the enum exists**, so switch to option 2 if the code change is not approved.

```yaml
- id: tallis
  match: Thomas Tallis
  sort_name: Tallis, Thomas
  born: 1505
  died: 1585
  era: renaissance
  names:
    en: { name: Thomas Tallis, short: Tallis }
    tr: { name: Thomas Tallis, short: Tallis }
  nationality: { en: English, tr: İngiliz }
  facts:
    born: { en: "c. 1505, probably Kent", tr: "y. 1505, büyük olasılıkla Kent" }
    died: { en: "November 1585, Greenwich", tr: "Kasım 1585, Greenwich" }
    symphonies: { en: "None (the form did not exist yet)", tr: "Yok (bu tür henüz ortada yoktu)" }
    best_known_for: { en: "*Spem in alium*, *Lamentations of Jeremiah*, English anthems", tr: "*Spem in alium*, *Yeremya'nın Ağıtları*, İngilizce ilahiler" }
  bio:
    en: |-
      Almost nothing is known about Tallis's early life. He was probably born in Kent around 1505, and the first record of him, from 1531, shows him as organist of the priory at Dover. He then worked at a London church and at Waltham Abbey in Essex until it was closed in 1540, when Henry VIII dissolved the monasteries, and after that sang at Canterbury Cathedral.

      From about 1543 he belonged to the Chapel Royal, the monarch's own choir, and he served four Tudor rulers in turn: Henry VIII, Edward VI, Mary I and Elizabeth I. As the official religion swung between Catholic and Protestant, he wrote Latin music for one reign and English music for the next, and seems to have stayed clear of the religious conflicts around him. He married around 1552 and lived in Greenwich.

      In 1575 Elizabeth gave Tallis and his former pupil William Byrd the sole right to print music in parts, and together they published a collection of Latin motets, *Cantiones sacrae*. Tallis died in Greenwich in November 1585, and Byrd wrote an elegy for him. No portrait made in his lifetime survives. His music, from short English anthems to the forty voices of *Spem in alium*, is still sung in churches and concert halls.
    tr: |-
      Tallis'in gençliği hakkında neredeyse hiçbir şey bilinmiyor. Büyük olasılıkla 1505 dolaylarında Kent'te doğdu; ondan söz eden ilk belge, 1531 tarihli, onu Dover'daki manastırın orgcusu olarak gösterir. Ardından Londra'da bir kilisede ve Essex'teki Waltham Manastırı'nda çalıştı; manastır, VIII. Henry'nin manastırları kapattığı 1540'ta kapanınca Canterbury Katedrali'nde şarkı söyledi.

      Yaklaşık 1543'ten itibaren hükümdarın kendi korosu olan Chapel Royal'in üyesiydi ve sırasıyla dört Tudor hükümdarına hizmet etti: VIII. Henry, VI. Edward, I. Mary ve I. Elizabeth. Resmî din Katoliklik ile Protestanlık arasında gidip gelirken o bir dönem için Latince, ardından gelen dönem için İngilizce müzik yazdı ve çevresindeki dinsel çatışmalardan uzak durmayı başarmış görünüyor. 1552 dolaylarında evlendi ve Greenwich'te yaşadı.

      1575'te Elizabeth, Tallis'e ve eski öğrencisi William Byrd'e çok sesli müzik basma tekelini verdi; ikisi birlikte Latince motetlerden oluşan *Cantiones sacrae* derlemesini yayımladı. Tallis Kasım 1585'te Greenwich'te öldü; Byrd onun için bir ağıt yazdı. Hayattayken yapılmış hiçbir portresi günümüze ulaşmadı. Kısa İngilizce ilahilerden *Spem in alium*'un kırk sesine kadar müziği bugün de kiliselerde ve konser salonlarında söyleniyor.
  portrait: null
```

**Portrait: `null`.** No contemporaneous portrait of Tallis survives (Wikipedia). The only image on Commons, File:Thomas_Tallis_001.jpg (1964 × 2533; Niccolò Haym's engraving after Gerard van der Gucht, about 150 years after his death, reproduced in *The Musical Times*, 1913), is an imaginary likeness. It could be used with a caption such as "Imaginary portrait, 18th-century engraving", but the cover crop would present a face that is not his, so the sheet leaves the portrait out.

## 5. `content/research/composers-sources.md` (new section)

```
## Tallis (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Thomas_Tallis · https://www.britannica.com/biography/Thomas-Tallis · https://www.wikidata.org/wiki/Q207789
- Born c. 1505 (estimates 1500–1520), probably Kent. Died in Greenwich on 20 or 23 November 1585 (Wikipedia lead and Wikidata: 23 November); the card says "November 1585".
- Dover Priory 1531; St Mary-at-Hill 1536–38; Waltham Abbey to March 1540; Canterbury 1540–42; Chapel Royal from c. 1543; served Henry VIII, Edward VI, Mary I, Elizabeth I. Married Joan c. 1552; Greenwich. 1575 printing monopoly with Byrd; *Cantiones sacrae* 1575. Byrd's elegy *Ye Sacred Muses*.
- Portrait: none. "No contemporaneous portrait of Tallis survives; the one painted by Gerard Vandergucht dates from 150 years after the composer's death" (Wikipedia). `portrait: null`.
- Era: the enum has no `renaissance` value; see `content/research/tallis-spem-in-alium.shared.md` §4.
```

## 6. `content/research/retime-needed.md` rows

```
| Tallis – Spem in alium | I Spem in alium | – | 9:57 | – | The Tallis Scholars / Phillips, Spotify `7BdRzzRBSBvoin2yIveUmn` (track 1) | 0:00, 0:40, 1:50, 2:50, 3:10, 4:20, 5:00–7:15, 7:20, 8:25, Near the end | From bar positions (138 bars, ≈ 4.3 s per bar) and the 1985 album's track split (4:58, 7:23, 8:23), which may be offset by a few seconds. Confirm the closing section is sung twice |
```
