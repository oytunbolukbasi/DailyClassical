# Shared-file additions: allegri-miserere

For the batch merger. Group C. Nothing here has been written to the shared files. This file also carries the new composer `allegri`.

## 1. `content/paintings.yaml` (first choice)

```yaml
allegri-miserere:
  # NGA Open Access (CC0), landscape 4000 × 3214, clean edges.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Jean-Auguste-Dominique_Ingres,_Pope_Pius_VII_in_the_Sistine_Chapel,_1814,_NGA_41606.jpg
  source_url: https://www.nga.gov/collection/art-object-page.41606.html
  commons_page: https://commons.wikimedia.org/wiki/File:Jean-Auguste-Dominique_Ingres,_Pope_Pius_VII_in_the_Sistine_Chapel,_1814,_NGA_41606.jpg
  width: 4000
  height: 3214
  medium: Oil on canvas
  license: Public domain (CC0, National Gallery of Art Open Access)
  credit_line: Jean-Auguste-Dominique Ingres, Pope Pius VII in the Sistine Chapel, 1814. National Gallery of Art, Washington, Samuel H. Kress Collection (1952.2.23). Image via National Gallery of Art Open Access, CC0.
  rights_status: public_domain
```

Piece-file values: artist Jean-Auguste-Dominique Ingres; title *Pope Pius VII in the Sistine Chapel* (TR *Sistina Şapeli'nde Papa VII. Pius*); year 1814; collection National Gallery of Art, Washington (TR Ulusal Sanat Galerisi, Washington).

## 2. Alternatives

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | François-Marius Granet | *The Choir of the Capuchin Church in Rome* | 1814–15 | The Metropolitan Museum of Art, New York (80.5.2, Gift of P. L. Everard, 1880) | File:The Choir of the Capuchin Church in Rome MET DT2550.jpg (1394 × 1861, CC0; portrait, modest resolution) | Capuchin friars at prayer in the choir of their church in Rome, painted in the same years as the first choice: the world of Roman church services, with the stillness of the Miserere |
| B | Giovanni Paolo Panini | *Interior of Saint Peter's, Rome* | c. 1754 | National Gallery of Art, Washington | File:Giovanni Paolo Panini, Interior of Saint Peter's, Rome, c. 1754, NGA 50884.jpg (4000 × 3138, CC0) | The vast papal basilica next door to the Sistine Chapel, in the century when the Miserere was the Vatican's most famous and best-guarded music |

## 3. Glossary: new rows

EN (`content/en/glossary.md`, `| Term | Short | Definition |`):

```
| Plainchant | Ancient unaccompanied church melody, in free rhythm | The ancient melody of the Western Church, sung without accompaniment in a free, speech-like rhythm by one voice or many in unison. Also called plainsong or Gregorian chant. |
```

TR (`content/tr/glossary.md`, `| Key | Terim | Kısa | Tanım |`):

```
| Plainchant | Gregoryen ilahi | Eşliksiz, serbest ritimli eski kilise ezgisi | Batı Kilisesi'nin eşliksiz, konuşmaya yakın serbest bir ritimle, tek bir sesle ya da birçok sesin aynı notaları söylemesiyle okunan eski ezgisi. Düz şarkı (plainsong) ya da Gregoryen ilahi olarak da bilinir. |
```

If group I (`tallis-spem-in-alium`) proposes the same term under another name (e.g. "Plainsong"), keep one key and point both pieces to it.

## 4. New composer: `allegri` (full `content/composers.yaml` entry)

Place first in the file (chronological). Sources in §5.

Two schema notes for the merger:
- **era:** the `era` enum (`backend/src/db/schema.ts`) has baroque, classical, romantic, late_romantic, modern; there is no renaissance. Allegri (1582–1652) is entered as `baroque` by date, though the Miserere's style looks back to the Renaissance. Tallis (group I) will need a decision too.
- **facts.symphonies** is omitted (Allegri wrote none); `seed.ts` stores a missing fact as null. Check that the app hides an empty "Symphonies" row; otherwise set `{ en: "None", tr: "Yok" }`.

```yaml
- id: allegri
  match: Gregorio Allegri
  sort_name: Allegri, Gregorio
  born: 1582
  died: 1652
  era: renaissance
  names:
    en: { name: Gregorio Allegri, short: Allegri }
    tr: { name: Gregorio Allegri, short: Allegri }
  nationality: { en: Italian, tr: İtalyan }
  facts:
    born: { en: "c. 1582, Rome", tr: "1582 dolayları, Roma" }
    died: { en: "17 February 1652, Rome", tr: "17 Şubat 1652, Roma" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Miserere*, sacred choral music", tr: "*Miserere*, dinî koro müziği" }
  bio:
    en: |-
      Allegri was born in Rome around 1582 and grew up there as a choirboy at San Luigi dei Francesi, the church of the French community, where he studied with the composer Giovanni Bernardino Nanino. He was intended for the Church, and for some years he held a post at the cathedral of Fermo, in central Italy, where he wrote many motets and other sacred works.

      His music came to the notice of Pope Urban VIII, and on 6 December 1629 Allegri joined the choir of the Sistine Chapel as a singer, a post he held for the rest of his life. He published collections of sacred concertos and motets, and wrote masses, settings of the Lamentations of Jeremiah and a little music for strings; one of these pieces was printed by the scholar Athanasius Kircher in his great book on music, *Musurgia universalis* (1650). He was remembered as a kind man who gave generously to the poor and to prisoners.

      He died in Rome in February 1652. His fame rests almost entirely on one work, the *Miserere*, written in the 1630s for the Holy Week services of the Sistine Chapel. For generations the papal singers performed it with ornaments of their own, passed on by ear, and the music gained an aura of secrecy. The story that the fourteen-year-old Mozart wrote it down from memory in 1770 made it famous across Europe, and 20th-century recordings turned its soaring soprano line into one of the best-known sounds in choral music.
    tr: |-
      Allegri 1582 dolaylarında Roma’da doğdu ve orada, Fransız topluluğunun kilisesi San Luigi dei Francesi’de koro çocuğu olarak yetişti; besteci Giovanni Bernardino Nanino’nun öğrencisi oldu. Din adamı olması düşünülüyordu; bir süre İtalya’nın ortasındaki Fermo katedralinde görev yaptı ve orada çok sayıda motet ve başka dinî eser yazdı.

      Müziği Papa VIII. Urbanus’un dikkatini çekti; Allegri 6 Aralık 1629’da Sistina Şapeli korosuna şarkıcı olarak katıldı ve ömrünün sonuna dek bu görevde kaldı. Dinî konçerto ve motet derlemeleri yayımladı; misalar, Yeremya’nın Ağıtları üzerine besteler ve yaylılar için az sayıda eser yazdı. Bu eserlerden biri, bilgin Athanasius Kircher’in müzik üzerine büyük kitabı *Musurgia universalis*’te (1650) basıldı. Yoksullara ve mahkûmlara cömertçe yardım eden iyi kalpli bir insan olarak hatırlandı.

      Şubat 1652’de Roma’da öldü. Ünü neredeyse yalnızca tek bir esere dayanır: 1630’larda Sistina Şapeli’nin Kutsal Hafta ayinleri için yazdığı *Miserere*. Papalık şarkıcıları onu kuşaklar boyunca, kulaktan kulağa aktarılan kendi süslemeleriyle söyledi ve müzik bir gizem havasına büründü. On dört yaşındaki Mozart’ın 1770’te eseri ezberden yazıya geçirdiği hikâyesi onu bütün Avrupa’da ünlü yaptı; 20. yüzyılın kayıtları da yükselen soprano çizgisini koro müziğinin en tanınmış seslerinden biri hâline getirdi.
  portrait:
    artist: { en: "Anonymous, after Francesco Faraone Aquila", tr: "Anonim, Francesco Faraone Aquila’dan" }
    title: { en: Portrait of Gregorio Allegri, tr: Gregorio Allegri’nin Portresi }
    year: null
    collection: { en: "Bibliothèque nationale de France, Paris", tr: "Fransa Ulusal Kütüphanesi, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Gregorio_Allegri.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Gregorio_Allegri.jpg
    width: 1800
    height: 2500
    license: Public domain (PD-Art, PD-old-100)
    focal_y: 0.3
```

Portrait note: an engraving, 19th century (Commons dating), after an earlier portrait engraved by Francesco Faraone Aquila (c. 1676–c. 1740); BnF Gallica, accession Est. Allegri 003 (ark:/12148/btv1b84153428). Black and white. It shows Allegri holding a sheet headed "Miserere"; the cartouche gives his death as "18 Febbraro 1652" (most sources, and Wikidata, say 17 February; the 1911 Britannica says 18). There is no portrait from Allegri's lifetime on Commons, so this is a posthumous image, like the Mozart portrait already in use. `year` is null because the engraving is not precisely dated. Older, smaller alternative: File:Gregorio_Allegri_Romano01.jpg (etching by James Caldwall after Aquila, NYPL, 590 × 721, PD-old).

## 5. Composer sources (for `content/research/composers-sources.md`)

```
## Allegri
- Facts: https://en.wikipedia.org/wiki/Gregorio_Allegri · https://www.wikidata.org/wiki/Q216695 (born 1582, Rome; died 17 February 1652, Rome). Wikipedia gives "c. 14 January 1582"; the card says "c. 1582". Chisholm (1911) gives 18 February 1652, as does the portrait's cartouche.
- Bio claims (Wikipedia): boy chorister at San Luigi dei Francesi under G. B. Nanino; benefice at Fermo cathedral, motets written there; noticed by Urban VIII, contralto in the Sistine Chapel choir from 6 December 1629 until his death; concerti (1618, 1619) and motets (1621), five masses, two settings of the Lamentations, unpublished motets; music for strings, one piece printed in Kircher's *Musurgia universalis*; generous to the poor and prisoners.
- Miserere: https://en.wikipedia.org/wiki/Miserere_(Allegri) (1630s; Holy Week Tenebrae; Leopold Mozart's letter of 14 April 1770; top C from Rockstro's 1880 Grove edition, popularised by Atkins 1951 and King's College 1963).
- Portrait: anonymous 19th-century engraving after Francesco Faraone Aquila, Bibliothèque nationale de France (Est. Allegri 003).
  https://commons.wikimedia.org/wiki/File:Gregorio_Allegri.jpg — 1800 × 2500, Public domain (PD-Art, PD-old-100).
```

## 6. `content/research/retime-needed.md` row

```
| Allegri – Miserere | I Miserere mei, Deus | – | 13:42 | – | Tallis Scholars / Phillips 2005 (Gimell), Spotify `3i1pQhfdXnxiye2G4Qsvqn` (track 1, not track 9) | 0:00, 0:50, 1:10, 2:35, 3:45, 6:15, 8:50, 11:25, 12:30 | Derived from the verse plan and the 1980 recording's verse-group timings scaled to 13:42; confirm the verse plan by ear |
```
