# Shared-file additions: bruckner-symphony-7

For the batch editor to merge. Nothing here has been written to the shared files.
Sources and checks: `content/research/bruckner-symphony-7.md` §3 (painting) and §6 (composer).

## 1. `content/paintings.yaml` entry (first choice)

```yaml
bruckner-symphony-7:
  # Bildindex-sourced scan on Commons. Portrait format (2944 × 4596, ≈ 0.64:1): the three faces are in the
  # upper half; crop from the top. The Hamburger Kunsthalle's object page is a JavaScript app (not readable by
  # the fetcher); its permalink is below.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Wilhelm_Leibl_-_Drei_Frauen_in_der_Kirche_(1882).jpg
  source_url: https://online-sammlung.hamburger-kunsthalle.de/de/objekt/HK-1534
  commons_page: https://commons.wikimedia.org/wiki/File:Wilhelm_Leibl_-_Drei_Frauen_in_der_Kirche_(1882).jpg
  width: 2944
  height: 4596
  medium: Oil on mahogany
  license: Public domain (PD-Art, PD-old-100-1923)
  credit_line: Wilhelm Leibl, Three Women in Church, 1878–1882. Hamburger Kunsthalle (HK-1534). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

## 2. Alternative paintings (in case of a clash)

| | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Arnold Böcklin (1827–1901) | *The Sacred Grove* (*Der heilige Hain*) | 1882 | Kunstmuseum Basel | File:Sacred_Grove_(1882)_-_Arnold_Böcklin_(Kunstmuseum_Basel).jpg (6884 × 4800, PD, Yorck Project) | Painted in the same years: white-robed figures in a slow procession towards an altar among dark trees, as solemn as the Adagio. Caveat: Böcklin already pairs with Brahms 4. |
| B | Martín Rico (1833–1908) | *Garden of the Palazzo Vendramin, Venice* | late 19th century (undated) | Minneapolis Institute of Art (65.20) | File:Martin_Rico_(Martin_Rico_y_Ortega)_-_Giardino_del_Palazzo_Vendramin_-_65.20_-_Minneapolis_Institute_of_Arts.jpg (8085 × 5362, PD) | The Venetian palace where Wagner died in February 1883, while Bruckner was writing the lament for him in the Adagio. |

## 3. New glossary rows

`Wagner tuba` is new (EN `[[Wagner tuba]]`, TR `[[Wagner tuba|Wagner tubası]]`).

EN (`content/en/glossary.md`):

```
| Wagner tuba | A horn-like brass instrument with a dark, soft tone | A brass instrument made for Wagner's Ring operas and played by horn players. Its tone is darker and rounder than a horn's. |
```

TR (`content/tr/glossary.md`):

```
| Wagner tuba | Wagner tubası | Koyu ve yumuşak tınılı, kornoya benzer bakır çalgı | Wagner'in Nibelung Yüzüğü operaları için yapılmış, korno çalgıcılarının çaldığı bir bakır çalgı. Tınısı kornonunkinden daha koyu ve yuvarlaktır. |
```

Other glossary terms used in this piece already exist: Tremolo, Development, Recapitulation, Pedal note, Coda, Scherzo, Trio, Chorale.

## 4. New composer: `bruckner` (full `content/composers.yaml` entry)

Insert after `brahms` or wherever the editor keeps chronological order. Run `npm run images -- --only bruckner` after merging.

```yaml
- id: bruckner
  match: Anton Bruckner
  sort_name: Bruckner, Anton
  born: 1824
  died: 1896
  era: late_romantic
  names:
    en: { name: Anton Bruckner, short: Bruckner }
    tr: { name: Anton Bruckner, short: Bruckner }
  nationality: { en: Austrian, tr: Avusturyalı }
  facts:
    born: { en: "4 September 1824, Ansfelden", tr: "4 Eylül 1824, Ansfelden" }
    died: { en: "11 October 1896, Vienna", tr: "11 Ekim 1896, Viyana" }
    symphonies: { en: "Nine numbered (the Ninth unfinished), plus two early ones", tr: "Dokuz numaralı (Dokuzuncu yarım kaldı) ve iki erken senfoni" }
    best_known_for: { en: "Symphonies, Masses, *Te Deum*", tr: "Senfonileri, ayin müzikleri, *Te Deum*" }
  bio:
    en: |-
      Bruckner was born in 1824 in Ansfelden, a village near Linz in Upper Austria, the eldest child of the village schoolmaster. His father gave him his first music lessons and taught him the organ. When his father died in 1837, the 13-year-old was sent to the Augustinian monastery of St Florian as a choirboy, and he was in awe of its great organ. He trained as a schoolteacher and spent his late teens and twenties teaching in village schools, playing the organ and composing on the side.

      In 1848 he became organist at St Florian, and in 1855 he won the post of cathedral organist in Linz. That same year he began years of study, mostly by post, with the Viennese theorist Simon Sechter. He only started composing in earnest at 37, after lessons with the young conductor Otto Kitzler, who introduced him to the music of Richard Wagner. In 1868 he moved to Vienna to teach at the Conservatory, and as an organist he toured France in 1869 and England in 1871, where he played at the Royal Albert Hall.

      His symphonies had a hard time in Vienna. Bruckner revered Wagner and dedicated his Third Symphony to him, and from then on the city's most powerful critic, Eduard Hanslick, a champion of Brahms, treated him as a dangerous Wagnerite. The Third's premiere in 1877 was a fiasco. Real success came only at 60, with the Seventh Symphony in Leipzig in 1884. Fiercely self-critical, he revised his scores again and again, which is why many exist in several versions. He died in Vienna in 1896 with his Ninth Symphony unfinished, and lies in the crypt of St Florian, beneath his favourite organ.
    tr: |-
      Bruckner 1824’te Yukarı Avusturya’da, Linz yakınlarındaki Ansfelden köyünde, köy öğretmeninin en büyük çocuğu olarak doğdu. İlk müzik derslerini babasından aldı, orgu da ondan öğrendi. Babası 1837’de ölünce on üç yaşındaki Anton, koro çocuğu olarak Aziz Florian’daki Augustinus manastırına gönderildi; manastırın büyük orgu onu derinden etkiledi. Öğretmen olarak yetişti ve gençlik yıllarını köy okullarında ders vererek, bir yandan da org çalıp beste yaparak geçirdi.

      1848’de Aziz Florian’ın orgcusu oldu, 1855’te de Linz Katedrali’nin orgcusu olarak seçildi. Aynı yıl Viyanalı kuramcı Simon Sechter’le, çoğunu mektupla sürdürdüğü uzun bir öğrenim dönemine başladı. Ciddi olarak beste yapmaya ancak 37 yaşında, kendisini Richard Wagner’in müziğiyle tanıştıran genç şef Otto Kitzler’le çalıştıktan sonra başladı. 1868’de Konservatuvar’da ders vermek için Viyana’ya taşındı; orgcu olarak 1869’da Fransa’da, 1871’de İngiltere’de konserler verdi ve Royal Albert Hall’da çaldı.

      Senfonileri Viyana’da zor günler geçirdi. Bruckner Wagner’e hayrandı ve Üçüncü Senfonisi’ni ona ithaf etti; Brahms’ın savunucusu olan, şehrin en güçlü eleştirmeni Eduard Hanslick o andan itibaren onu tehlikeli bir Wagner taklitçisi olarak gördü. Üçüncü’nün 1877’deki ilk seslendirmesi tam bir fiyaskoydu. Gerçek başarı ancak 60 yaşında, 1884’te Leipzig’de Yedinci Senfoni’yle geldi. Kendine karşı son derece eleştirel olduğundan partisyonlarını tekrar tekrar elden geçirdi; bu yüzden eserlerinin birçoğunun birden fazla versiyonu vardır. 1896’da Viyana’da, Dokuzuncu Senfonisi yarım kalmışken öldü; Aziz Florian’ın mahzeninde, çok sevdiği orgun tam altında yatıyor.
  portrait:
    artist: Ferry Bératon
    title: { en: Portrait of Anton Bruckner, tr: Anton Bruckner’in Portresi }
    year: "1889"
    collection: { en: "Wien Museum, Vienna", tr: "Wien Museum, Viyana" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Anton_bruckner.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Anton_bruckner.jpg
    width: 2329
    height: 2521
    license: Public domain painting (PD-Art, artist d. 1900); museum photograph CC BY 4.0 (Wien Museum)
    license_url: https://creativecommons.org/licenses/by/4.0/
    credit_line: { en: "Photo: Birgit and Peter Kainz, Wien Museum, CC BY 4.0", tr: "Fotoğraf: Birgit ve Peter Kainz, Wien Museum, CC BY 4.0" }
    focal_y: 0.3
```

### Sources block for `content/research/composers-sources.md`

```markdown
## Anton Bruckner (added 2026-10, batch group D)
- Facts: https://en.wikipedia.org/wiki/Anton_Bruckner · https://de.wikipedia.org/wiki/Anton_Bruckner · https://www.wikidata.org/wiki/Q81752 (P569 1824-09-04, P570 1896-10-11, P19 Ansfelden, P20 Vienna)
- Choirboy at St Florian after his father's death (1837); organist at St Florian from 1848; Linz cathedral organist from 8 December 1855 (de.wikipedia); studies with Sechter from 1855, mostly by correspondence; composing seriously from 1861 (aged 37) after lessons with Otto Kitzler, who introduced him to Wagner; Vienna Conservatory 1868; organ tours to France 1869 and England 1871.
- Third Symphony dedicated to Wagner; its 1877 premiere his greatest failure; Hanslick's hostility (de.wikipedia). Breakthrough with the Seventh, Leipzig 1884. Ninth unfinished. Buried at St Florian below the organ.
- "Nine numbered (the Ninth unfinished), plus two early ones": Wikipedia counts eleven symphonies including the F minor Study Symphony (1863) and the unnumbered D minor symphony.
- Portrait: Ferry Bératon (1859–1900), *Anton Bruckner*, 1889, oil on canvas, 85.6 × 75.8 cm, Wien Museum inv. 16837 (https://sammlung.wienmuseum.at/objekt/42817-anton-bruckner-1824-1896-komponist-und-organist/).
  https://commons.wikimedia.org/wiki/File:Anton_bruckner.jpg — 2329 × 2521. Painting public domain ({{PD-Art|PD-old-auto-expired|deathyear=1900}}); the museum's photograph is offered under CC BY 4.0 ("Foto: Birgit und Peter Kainz, Wien Museum"), so the sheet credits it via credit_line, as for the Shostakovich portrait.
  Rejected: Anton Huber photo c. 1890 (972 × 1602) and Ludwig Grillich photo c. 1892 (ÖNB, 600 × 800), both PD but smaller; Hermann Kaulbach's 1885 portrait (book scan only).
```

## 5. `retime-needed.md` rows

See `content/research/bruckner-symphony-7.md` §5 (all stops ≈).
