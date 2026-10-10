# Shared-file additions: elgar-cello-concerto

For merging into `content/paintings.yaml`, the glossary files, `content/composers.yaml` and `content/research/composers-sources.md`. Sources: `content/research/elgar-cello-concerto.md` §3–4 and §5 below. This piece introduces the new composer `elgar`.

## 1. `content/paintings.yaml` (first choice)

```yaml
elgar-cello-concerto:
  # Google Art Project file (4950 × 3876). IWM marks its own photo "© IWM"; Commons treats faithful
  # photographs of this public-domain painting as public domain (artist d. 1946). See the research note.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Nash,_Paul_-_We_are_Making_a_New_World_-_Google_Art_Project.jpg
  source_url: https://www.iwm.org.uk/collections/item/object/20070
  commons_page: https://commons.wikimedia.org/wiki/File:Nash,_Paul_-_We_are_Making_a_New_World_-_Google_Art_Project.jpg
  width: 4950
  height: 3876
  medium: Oil on canvas
  license: Public domain (PD-old-auto-1923; artist d. 1946)
  credit_line: Paul Nash, We are Making a New World, 1918. Imperial War Museums, London (Art.IWM ART 1146). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | John Singer Sargent (1856–1925) | *Gassed* | 1919 | Imperial War Museums, London, Art.IWM ART 1460 (oil on canvas, 231 × 611 cm) | https://commons.wikimedia.org/wiki/File:Sargent,_John_Singer_(RA)_-_Gassed_-_Google_Art_Project.jpg (13549 × 5075, PD-Art) | Finished in 1919, the year of the concerto: blinded soldiers led in a line at evening, a frieze of grief as quiet as Elgar's music. Very wide format; heavy subject |
| B | Paul Nash (1889–1946) | *The Menin Road* | 1919 | Imperial War Museums, London (oil on canvas, 182.8 × 317.5 cm) | https://commons.wikimedia.org/wiki/File:The_Menin_Road.jpg (5338 × 3078, PD) | Nash's largest war painting, finished in 1919, the year Elgar wrote the concerto; shattered trees and pools under shafts of light. Same artist as the first choice |

## 3. Glossary rows

No new terms. This piece uses **Attacca** (proposed by group F in `content/research/schumann-piano-concerto.shared.md`; used here with exactly that row) and existing terms (recitative, scherzo, pizzicato, cadenza).

```
| Attacca | Go straight on into the next movement, without a pause | Italian for "attack": the next movement begins at once, with no break, so the two are heard as one continuous piece. |
```

```
| Attacca | Attacca | Ara vermeden bir sonraki bölüme geçmek | İtalyanca "saldır": sonraki bölüm hiç ara vermeden hemen başlar, böylece iki bölüm kesintisiz tek bir müzik gibi duyulur. |
```

## 4. `content/composers.yaml`: new composer `elgar`

Insert in date order (born 1857: after `dvorak` (1841), before `mahler` (1860)). `hero`/`thumb`/`full`/`placeholder_color` are written later by `npm run images -- --only elgar`.

```yaml
- id: elgar
  match: Edward Elgar
  sort_name: Elgar, Edward
  born: 1857
  died: 1934
  era: late_romantic
  names:
    en: { name: Edward Elgar, short: Elgar }
    tr: { name: Edward Elgar, short: Elgar }
  nationality: { en: English, tr: İngiliz }
  facts:
    born: { en: "2 June 1857, Lower Broadheath", tr: "2 Haziran 1857, Lower Broadheath" }
    died: { en: "23 February 1934, Worcester", tr: "23 Şubat 1934, Worcester" }
    symphonies: { en: "Two (a third completed from his sketches by Anthony Payne)", tr: "İki (üçüncüsü eskizlerinden Anthony Payne tarafından tamamlandı)" }
    best_known_for: { en: "*Enigma Variations*, Cello Concerto, *Pomp and Circumstance* marches", tr: "*Enigma Varyasyonları*, Viyolonsel Konçertosu, *Pomp and Circumstance* marşları" }
  bio:
    en: |-
      Elgar was born in 1857 in Lower Broadheath, a village near Worcester, the son of a piano tuner who kept a music shop in the city. Apart from piano and violin lessons, he was almost entirely self-taught. For years he earned his living locally: teaching, playing the violin in festival orchestras, conducting, and writing music for whatever ensembles were at hand, from a wind quintet to the band of a nearby asylum. In 1889 he married Caroline Alice Roberts, a general’s daughter eight years older than him, whose family disapproved of the match. She became his business manager and a perceptive critic of his music.

      Success came late. In 1899, at 42, the *Enigma Variations*, a set of musical portraits of his friends, made his name, and *The Dream of Gerontius* followed in 1900. He was knighted in 1904. His First Symphony (1908) was played around a hundred times in little more than a year, and the Violin Concerto followed in 1910. During the First World War “Land of Hope and Glory”, sung to a tune from his first *Pomp and Circumstance* march, grew more popular than ever, though Elgar wished in vain for less nationalistic words.

      After the war his music went out of fashion. In a cottage in the Sussex woods he wrote three chamber works and then the Cello Concerto (1919), his last major work. Alice died in 1920 and he completed no more large-scale pieces, though he became one of the first composers to take the gramophone seriously, recording much of his own music, and in 1924 was made Master of the King’s Music. He died in Worcester in 1934, leaving sketches for a Third Symphony that the composer Anthony Payne later completed.
    tr: |-
      Elgar 1857’de Worcester yakınlarındaki Lower Broadheath köyünde doğdu; babası, şehirde bir müzik dükkânı işleten bir piyano akortçusuydu. Piyano ve keman derslerinin dışında neredeyse tamamen kendi kendini yetiştirdi. Yıllarca geçimini yöresinde sağladı: ders verdi, festival orkestralarında keman çaldı, şeflik yaptı ve eldeki her topluluk için, bir üflemeli beşliden yakındaki bir akıl hastanesinin bandosuna kadar, müzik yazdı. 1889’da kendisinden sekiz yaş büyük bir general kızı olan Caroline Alice Roberts’la evlendi; Alice’in ailesi bu evliliğe karşıydı. Alice onun işlerini yöneten kişi ve müziğinin keskin gözlü bir eleştirmeni oldu.

      Başarı geç geldi. 1899’da, 42 yaşındayken, dostlarının müzikal portrelerinden oluşan *Enigma Varyasyonları* onu tanıttı; 1900’de *Gerontius’un Rüyası* izledi. 1904’te şövalye unvanı aldı. Birinci Senfonisi (1908) bir yıldan biraz uzun bir sürede yüze yakın kez çalındı; 1910’da Keman Konçertosu geldi. Birinci Dünya Savaşı sırasında, ilk *Pomp and Circumstance* marşındaki bir ezgiyle söylenen “Land of Hope and Glory” her zamankinden popüler oldu; Elgar ise boşuna daha az milliyetçi sözler istedi.

      Savaştan sonra müziği modası geçmiş sayıldı. Sussex ormanlarındaki bir kulübede üç oda müziği eseri, ardından son büyük eseri Viyolonsel Konçertosu’nu (1919) yazdı. Alice 1920’de öldü ve Elgar bir daha büyük ölçekli bir eser tamamlamadı; yine de gramofonu ciddiye alan ilk bestecilerden biri olarak kendi müziğinin çoğunu kaydetti ve 1924’te Kralın Müzik Ustası (Master of the King’s Music) oldu. 1934’te Worcester’da öldü; geride bıraktığı Üçüncü Senfoni eskizlerini besteci Anthony Payne sonradan tamamladı.
  portrait:
    artist: { en: Bain News Service, tr: Bain News Service }
    title: { en: Sir Edward Elgar, tr: Sir Edward Elgar }
    # Published in US newspapers in May 1924 (Keystone View Co. print); the sitting date is unknown.
    year: "1924"
    collection: { en: "Library of Congress, Washington, D.C.", tr: "Kongre Kütüphanesi, Washington" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Sir_Edw._Elgar_LCCN2014716700.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Sir_Edw._Elgar_LCCN2014716700.jpg
    width: 3715
    height: 5072
    license: Public domain (PD-Bain; Library of Congress, no known restrictions on publication)
    focal_y: 0.15
```

**Image note.** The LOC scan is the whole glass negative: a dark border with the handwritten caption "SIR EDW. ELGAR" and negative numbers runs round the picture. Crop the border (about 5 % on each side) before `npm run images -- --only elgar`, as was done for Rachmaninoff's Bain photograph.

## 5. `content/research/composers-sources.md`: section to append

```markdown
## Edward Elgar (added 2026-10-10, batch group H)

- Facts: https://en.wikipedia.org/wiki/Edward_Elgar · https://www.wikidata.org/wiki/Q179631 (P569 2 Jun 1857, P570 23 Feb 1934, P19 Lower Broadheath, P20 Worcester)
- Father William Henry Elgar, piano tuner with a music shop in Worcester. Only formal training: piano and violin lessons from local teachers (and violin studies with Pollitzer in London); otherwise self-taught.
- Local career: teaching, violin in the Worcester and Birmingham festival orchestras, conducting, music for a wind quintet (with his brother) and for the Powick Asylum band.
- Married Caroline Alice Roberts, daughter of Major-General Sir Henry Roberts, eight years older, on 8 May 1889; her family disapproved ("She was disinherited", Kennedy); business manager, social secretary and "perceptive musical critic".
- *Enigma Variations* 1899 (aged 42), portraits of friends; *The Dream of Gerontius* 1900; knighted 5 July 1904; First Symphony 1908 (about a hundred performances in just over a year: https://en.wikipedia.org/wiki/Cello_Concerto_(Elgar)); Violin Concerto 1910.
- "Land of Hope and Glory" became still more popular in the First World War; Elgar "wished in vain to have new, less nationalistic, words sung to the tune".
- Brinkwells (Sussex), 1918–19: Violin Sonata, String Quartet, Piano Quintet, Cello Concerto. Music out of fashion in the 1920s. Alice died 7 April 1920; no further large-scale works were completed.
- "The first composer to take the gramophone seriously" (Robert Philip); recordings from 1914, electrical recordings from 1926.
- Master of the King's Musick 1924 (the TR text keeps the English title in brackets; the bio uses the modern spelling "Music").
- Died 23 Feb 1934 (colorectal cancer); Third Symphony sketches elaborated by Anthony Payne (premiered 1998).
- Portrait: Bain News Service glass negative, Library of Congress, George Grantham Bain Collection, LCCN 2014716700 (ggbain.36551); the same image ran in US newspapers in May 1924 with the caption on his appointment as Master of the King's Music (Keystone View Company; Commons File:Edward_Elgar,_appointed_Master_of_King's_Music.jpg, from the *St. Louis Post-Dispatch*, 9 May 1924).
  https://commons.wikimedia.org/wiki/File:Sir_Edw._Elgar_LCCN2014716700.jpg — 3715 × 5072 px (TIFF also available). Commons: {{PD-Bain}}, {{PD-old-70-1923}}; LOC: no known restrictions on publication.
  Rights check: US — published in 1924, before 1931: public domain. UK/EU — photographer unknown (agency print); an anonymous work published in 1924 is out of copyright 70 years after publication (1994). Safe in both. Year shown as "1924" = first known publication; the sitting may be a few years earlier (Elgar wears academic robes; he looks about 60).
  focal_y 0.15: seated three-quarter figure, face in the top fifth of the frame (checked on a 500 px thumbnail); re-check after cropping the negative border.
- Rejected: File:Edward_Elgar.jpg (the familiar c. 1905 Rotary Photo postcard portrait; PD-anon-expired, PD-UK-unknown) is only 697 × 698 px. File:Edward_Elgar_1857_-_1934.jpg (3821 × 5454) is a halftone scan from a 1913 book with a visible screen pattern. File:Edward_Elgar,_appointed_Master_of_King's_Music.jpg (1791 × 2086) is the same photo as a newspaper reproduction, lower quality than the LOC negative.
```
