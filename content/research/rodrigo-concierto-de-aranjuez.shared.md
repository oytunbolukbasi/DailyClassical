# Shared-file additions: rodrigo-concierto-de-aranjuez

Batch 2026-11, group J. Details and sources in `content/research/rodrigo-concierto-de-aranjuez.md`.

## 1. paintings.yaml

```yaml
rodrigo-concierto-de-aranjuez:
  # Gallery photo by User:anagoria, cropped to the canvas. The "1907" in the Commons file name is wrong:
  # the museum, Wikidata (Q27667826) and the file page give 1911.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/1907_Rusinol_Garten_von_Aranjuez_anagoria.JPG
  source_url: https://www.museoreinasofia.es/en/collection/artwork/faune-vell-old-faun
  commons_page: https://commons.wikimedia.org/wiki/File:1907_Rusinol_Garten_von_Aranjuez_anagoria.JPG
  width: 4752
  height: 3516
  medium: Oil on canvas
  license: Public domain (PD-Art)
  credit_line: Santiago Rusiñol, The Old Faun (Faune vell), 1911. Museo Nacional Centro de Arte Reina Sofía, Madrid (AS12047). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

**Alternative 1.** Santiago Rusiñol, *Garden of Aranjuez* (*Jardín de Aranjuez*), undated (the museum says "Siglo XIX", which is unlikely: Rusiñol's Aranjuez series dates from 1907 on). Museo Nacional de Bellas Artes, Buenos Aires (7916), oil on canvas, 103 × 128 cm. Commons: https://commons.wikimedia.org/wiki/File:Jardin_de_Aranjuez_-_Santiago_Rusi%C3%B1ol.jpg (2000 × 1615, museum-supplied, {{PD-old-70}}). Pairing: a tunnel of clipped cypress and flower beds under autumn trees in the same royal gardens; brighter colours, lower resolution.

**Alternative 2.** Santiago Rusiñol, *Autumnal* (*Otoñal*), 1910. Museo Nacional de Bellas Artes, Buenos Aires, oil on canvas, 105.5 × 121.5 cm. Commons: https://commons.wikimedia.org/wiki/File:Oto%C3%B1al_-_Santiago_Rusi%C3%B1ol_Prats.jpg (3524 × 3095, museum-supplied, {{PD-old-75}}). Pairing: the Fuente de la Boticaria in the Jardín de la Isla, Aranjuez, under tall autumn trees: Rodrigo's "gushing of fountains".

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Rasgueado | Strumming the guitar strings with the fingers | A Spanish guitar technique in which the fingers of the right hand strike the strings in quick, rolling strokes, giving the bright, rhythmic chords of flamenco. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Rasgueado | Rasgueado | Gitar tellerine parmaklarla vurarak akor çalmak | Sağ elin parmaklarının tellere hızlı, yuvarlanan vuruşlarla çarptığı bir İspanyol gitar tekniği; flamenkonun parlak, ritmik akorlarını verir. |

## 3. Composer

```yaml
- id: rodrigo
  match: Joaquín Rodrigo
  sort_name: Rodrigo, Joaquín
  born: 1901
  died: 1999
  era: modern
  names:
    en: { name: Joaquín Rodrigo, short: Rodrigo }
    tr: { name: Joaquín Rodrigo, short: Rodrigo }
  nationality: { en: Spanish, tr: İspanyol }
  facts:
    born: { en: "22 November 1901, Sagunto, Valencia", tr: "22 Kasım 1901, Sagunto, Valensiya" }
    died: { en: "6 July 1999, Madrid", tr: "6 Temmuz 1999, Madrid" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Concierto de Aranjuez*, *Fantasía para un gentilhombre*", tr: "*Concierto de Aranjuez*, *Fantasía para un gentilhombre*" }
  bio:
    en: |-
      Rodrigo was born in 1901 in Sagunto, near Valencia. At the age of three he caught diphtheria and lost his sight almost completely. He began to study music at eight, the piano and the violin first, then harmony and composition in Valencia; all his life he wrote his music in Braille, and it was copied out for publication. In 1927 he went to Paris to study composition with Paul Dukas at the École Normale de Musique. There he met the pianist Victoria Kamhi, born in Istanbul, and they married in 1933. She gave up her own career to work at his side for the rest of her life.

      During the Spanish Civil War the couple lived abroad, in France and Germany. In Paris, early in 1939, Rodrigo wrote the *Concierto de Aranjuez* for the guitarist Regino Sainz de la Maza, although he was a pianist and never played the guitar himself. He returned to Spain that year, and the concerto's premiere in Barcelona in November 1940 made him famous almost overnight. From 1947 he taught the history of music at the University of Madrid, in a chair named after Manuel de Falla; among his students was the Turkish composer and pianist Yüksel Koptagel.

      The success of the concerto brought requests from famous soloists: *Fantasía para un gentilhombre* (1954) for Andrés Segovia, and concertos for the harpist Nicanor Zabaleta, the flautist James Galway, the cellist Julian Lloyd Webber and the guitar family of the Romeros. His music, melodious and full of the dances and colours of old Spain, stayed close to tradition, and the fame of the *Concierto de Aranjuez* overshadowed almost everything else he wrote. In 1991 King Juan Carlos I made him Marquess of the Gardens of Aranjuez. Victoria died in 1997; Rodrigo died at home in Madrid on 6 July 1999, aged 97, and they are buried together in Aranjuez.
    tr: |-
      Rodrigo 1901'de Valensiya yakınlarındaki Sagunto'da doğdu. Üç yaşında difteriye yakalandı ve görme yetisini neredeyse tamamen yitirdi. Müzik eğitimine sekiz yaşında, önce piyano ve kemanla başladı; ardından Valensiya'da armoni ve kompozisyon okudu. Ömrü boyunca eserlerini Braille alfabesiyle yazdı; bunlar yayımlanmak üzere notaya geçirildi. 1927'de Paris'e gitti ve École Normale de Musique'te Paul Dukas'tan kompozisyon dersi aldı. Orada İstanbul doğumlu piyanist Victoria Kamhi ile tanıştı; 1933'te evlendiler. Kamhi kendi kariyerini bırakarak hayatının sonuna dek onun yanında çalıştı.

      İspanya İç Savaşı sırasında çift yurt dışında, Fransa'da ve Almanya'da yaşadı. Rodrigo *Concierto de Aranjuez*'i 1939'un başında Paris'te gitarist Regino Sainz de la Maza için yazdı; oysa kendisi piyanistti ve hiç gitar çalmadı. Aynı yıl İspanya'ya döndü; konçertonun Kasım 1940'ta Barselona'daki ilk seslendirilişi onu neredeyse bir gecede ünlü yaptı. 1947'den itibaren Madrid Üniversitesi'nde, Manuel de Falla'nın adını taşıyan kürsüde müzik tarihi okuttu; öğrencileri arasında Türk besteci ve piyanist Yüksel Koptagel de vardı.

      Konçertonun başarısı ünlü solistlerden siparişler getirdi: Andrés Segovia için *Fantasía para un gentilhombre* (1954), arpçı Nicanor Zabaleta, flütçü James Galway, çellist Julian Lloyd Webber ve gitarcı Romero ailesi için konçertolar. Melodik, eski İspanya'nın danslarıyla ve renkleriyle dolu müziği geleneğe yakın kaldı; *Concierto de Aranjuez*'in ünü yazdığı hemen her şeyi gölgede bıraktı. 1991'de Kral I. Juan Carlos ona "Aranjuez Bahçeleri Markisi" unvanını verdi. Victoria 1997'de öldü; Rodrigo 6 Temmuz 1999'da, 97 yaşında Madrid'deki evinde öldü. İkisi Aranjuez'de yan yana gömülüdür.
  # No portrait: Rodrigo died in 1999, so the brief requires a CC-licensed photo with credit, or null.
  # Commons has no freely licensed photograph of him (only monuments, busts, plaques and his grave,
  # whose sculptures are themselves recent works). See content/research/composers-sources.md.
  portrait: null
```

### Joaquín Rodrigo: content/research/composers-sources.md

## Joaquín Rodrigo (added 2026-11-17, batch 2026-11, group J)
- Facts: https://en.wikipedia.org/wiki/Joaqu%C3%ADn_Rodrigo · https://en.wikipedia.org/wiki/Concierto_de_Aranjuez · https://en.wikipedia.org/wiki/Victoria_Kamhi · https://en.wikipedia.org/wiki/Y%C3%BCksel_Koptagel
- Born 22 November 1901, Sagunto (province of Valencia); died at home in Madrid, 6 July 1999, aged 97 (Wikipedia lead and "Life"). Lost his sight completely at three after diphtheria (Wikipedia; some notes say "almost completely": the bio says "almost completely", as the concerto article does: "nearly blind since age three"). Music from eight (solfège, piano, violin), harmony and composition from 16; teacher in Valencia Francisco Antich; wrote in Braille, transcribed for publication.
- Paris: École Normale de Musique with Paul Dukas; 1927 (runyanprogramnotes.com: "In 1927 he moved to Paris and became a composition student of Paul Dukas"; Hollywood Bowl note: "moved to Paris in 1927 to study with Paul Dukas").
- Victoria Kamhi: Turkish pianist of Sephardic Jewish family, born in Istanbul (en.wikipedia gives 1905; birth year not used), met Rodrigo in 1929, married 19 January 1933; "lived in France and Germany before returning to Spain in 1939"; she left her career as a pianist and was his assistant; memoir *De la mano de Joaquín Rodrigo* (English 1992); died 21 July 1997; both buried in Aranjuez.
- Concierto de Aranjuez: Paris, early 1939; for Regino Sainz de la Maza, at his suggestion (Hollywood Bowl / LA Phil note: https://www.hollywoodbowl.com/musicdb/pieces/269/concierto-de-aranjuez); premiere Barcelona, 9 November 1940. "Almost overnight" fame: Wikipedia ("its success established his reputation"); BHSO note: "immediate success" (https://www.bhso.org.uk/work/rodrigo-concierto-de-aranjuez/).
- From 1947 professor of music history, Manuel de Falla Chair of Music, Faculty of Philosophy and Letters, Complutense University of Madrid; "Notable students include Yüksel Koptagel, Turkish composer and pianist" (Koptagel article: "studied in the Madrid Royal Conservatory with José Cubiles, Joaquin Rodrigo"; the two articles differ on the institution, so the bio says only "among his students").
- Later works: *Fantasía para un gentilhombre* (1954) at the request of Andrés Segovia; *Concierto serenata* for Zabaleta; *Concierto pastoral* for James Galway; *Concierto como un divertimento* for Julian Lloyd Webber; *Concierto andaluz* commissioned by Celedonio Romero for himself and his three sons.
- "Stayed close to tradition" / Aranjuez overshadowed his other works: BHSO note (style blends mainstream European classicism with Iberian harmony; the concerto made him famous and "he was never able to meet the high expectations"); MusicWeb programme note quoting Julian Bream: "The success of Concierto de Aranjuez has somehow eclipsed Rodrigo's other works" (https://musicweb-international.com/programme_notes/rodrigo_aranjuez.htm).
- Honours: Premio Nacional de Música 1983; 30 December 1991 Marqués de los Jardines de Aranjuez (King Juan Carlos I); Prince of Asturias Award (Arts) 1996; Commander of Arts and Letters 1998. Daughter Cecilia (b. 27 January 1941) succeeded to the title.
- Symphonies: none (works list on Wikipedia has orchestral pieces and concertos, no symphony).
- Portrait: `null`. Checked Commons `Category:Joaquín Rodrigo` and searches (2026-11-17): the only images are photos of monuments (Aranjuez, Sagunto, Santa Cruz de Tenerife), a bust in Rosario, Argentina (`File:Joaquin_Rodrigo_en_Rosario.JPG`, the en/es Wikipedia infobox image: a photo of a 1999 sculpture, not a portrait, and the sculpture's own rights are not cleared), plaques, his grave, his coat of arms, and a 354 × 260 scan of a certificate. No freely licensed photograph of Rodrigo himself was found; copyrighted press and foundation photos were not considered.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Rodrigo – Concierto de Aranjuez | I Allegro con spirito | – | 6:08 | – | Yepes / García Navarro / Philharmonia 1979, Spotify `3q15IyNTqYwESGJMbsYP93` (track 1) | 0:00, 0:25, 0:45, 1:20–2:00, 2:00–3:40, 3:40, Last 30 seconds | Nov 2026: estimated from programme notes, the movement's structure and the track length, not heard. Least certain: the orchestral entry ≈ 0:25 and the return of the opening ≈ 3:40 (± 30 s) |
| Rodrigo – Concierto de Aranjuez | II Adagio | – | 11:15 | – | same (track 2) | 0:00, 1:00, 2:15–3:30, 3:30–5:00, 5:00–8:30, 8:30–9:30, Last minute | Least certain: start of the guitar's solo statement and cadenza ≈ 5:00 (± 1 min) and the orchestral climax ≈ 8:30 (± 45 s) |
| Rodrigo – Concierto de Aranjuez | III Allegro gentile | – | 5:15 | – | same (track 3) | 0:00, 0:10, 0:20–1:30, 1:30–2:30, 2:30, 3:00–4:30, Last 15 seconds | Least certain: the contrasting episode ≈ 1:30 and the theme's return ≈ 2:30 |
