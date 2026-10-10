# Shared-file additions: grieg-piano-concerto (batch G)

Everything here belongs in a shared file; merge by hand. Painting sources: `content/research/grieg-piano-concerto.md` §3.
Composer sources are at the end of this file.

## 1. `content/paintings.yaml`

```yaml
grieg-piano-concerto:
  # Google Art Project file (PD-Art), a Commons Featured Picture. Nasjonalmuseet's own photo of the
  # same painting (7443 × 5391) carries a CC BY 4.0 licence for the photograph, so this one is preferred.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Adolph_Tidemand_%26_Hans_Gude_-_Bridal_Procession_on_the_Hardangerfjord_-_Google_Art_Project.jpg
  source_url: https://www.nasjonalmuseet.no/en/collection/object/NG.M.00467
  commons_page: https://commons.wikimedia.org/wiki/File:Adolph_Tidemand_%26_Hans_Gude_-_Bridal_Procession_on_the_Hardangerfjord_-_Google_Art_Project.jpg
  width: 7783
  height: 5565
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old)
  credit_line: Hans Gude and Adolph Tidemand, Bridal Procession on the Hardangerfjord, 1848. Nasjonalmuseet, Oslo (NG.M.00467). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Hans Gude | *Norwegian Highlands* (*Høyfjell*) | 1857 | Nasjonalmuseet, Oslo | File:Hans_Gude_-_Norwegian_Highlands_-_Google_Art_Project.jpg (3588 × 2661, PD-Art) | The wide Norwegian mountains of Grieg's youth, by the landscape half of the *Bridal Procession* partnership. |
| B | Hans Gude and Adolph Tidemand | *Fishing by Torchlight on the Krøderen* (*Lystring på Krøderen*) | 1851 | Nasjonalmuseet, Oslo (per Google Arts & Culture; confirm the inventory number) | File:Hans_Gude_%26_Adolph_Tidemand_-_Lystring_på_Krøderen_-_Google_Art_Project.jpg (3644 × 2623, PD-Art) | Norwegian folk life by night on a lake: the same national romance, quieter, like the Adagio. |

## 2. Glossary (new term)

`content/en/glossary.md`:

```
| Attacca | Go straight on to the next movement, with no pause | Italian for "attack": the instruction to go on to the next movement without a break, so that two movements are heard as one span. |
```

`content/tr/glossary.md`:

```
| Attacca | Attacca | Ara vermeden bir sonraki bölüme geçiş | İtalyanca "saldır": bir sonraki bölüme ara vermeden geçme talimatı; böylece iki bölüm tek bir akış gibi duyulur. |
```

Used in: `grieg-piano-concerto` (II → III), `tchaikovsky-violin-concerto` (II → III), `bruch-violin-concerto-1` (I → II). EN `[[attacca]]`, TR `[[attacca|attacca]]`. Other groups may propose the same term: keep one row.

## 3. `content/composers.yaml` (new composer `grieg`)

```yaml
- id: grieg
  match: Edvard Grieg
  sort_name: Grieg, Edvard
  born: 1843
  died: 1907
  era: late_romantic
  names:
    en: { name: Edvard Grieg, short: Grieg }
    tr: { name: Edvard Grieg, short: Grieg }
  nationality: { en: Norwegian, tr: Norveçli }
  facts:
    born: { en: "15 June 1843, Bergen", tr: "15 Haziran 1843, Bergen" }
    died: { en: "4 September 1907, Bergen", tr: "4 Eylül 1907, Bergen" }
    symphonies: { en: "One, which he withdrew", tr: "Bir; sonradan geri çekti" }
    best_known_for: { en: "Piano Concerto, *Peer Gynt*, *Lyric Pieces*", tr: "Piyano Konçertosu, *Peer Gynt*, *Lirik Parçalar*" }
  bio:
    en: |-
      Grieg was born in Bergen, on Norway's west coast, in 1843. His mother, Gesine, was a music teacher and gave him his first piano lessons when he was six. In 1858 the famous Norwegian violinist Ole Bull, a friend of the family, persuaded his parents to send the fifteen-year-old to the Leipzig Conservatory. In 1860 he survived pleurisy and tuberculosis, which left him with a ruined left lung for the rest of his life.

      From 1863 he spent three years in Copenhagen, where he became close friends with the young Norwegian composer Rikard Nordraak; when Nordraak died in 1866, Grieg wrote a funeral march for him. In 1867 he married his cousin, the soprano Nina Hagerup, who sang his songs for the rest of his life. The Piano Concerto, written the next year, made his name across Europe, and his music for Henrik Ibsen's play *Peer Gynt*, with "Morning Mood" and "In the Hall of the Mountain King", made it known everywhere.

      Grieg did his best work in small forms: songs, and sixty-six *Lyric Pieces* for piano, published in ten books. Norwegian folk dances and fiddle tunes run through his music. He suppressed his only symphony and completed only one concerto. He died in Bergen in 1907. His house, Troldhaugen, is now a museum, and his and Nina's ashes rest in a crypt in the rock nearby.
    tr: |-
      Grieg 1843'te Norveç'in batı kıyısındaki Bergen'de doğdu. Müzik öğretmeni olan annesi Gesine, ona altı yaşında ilk piyano derslerini verdi. 1858'de ailenin dostu, ünlü Norveçli kemancı Ole Bull, anne babasını on beş yaşındaki oğullarını Leipzig Konservatuvarı'na göndermeye ikna etti. 1860'ta zatülcenp ve vereme yakalandı; atlattı, ama sol akciğeri ömrü boyunca harap kaldı.

      1863'ten başlayarak üç yılını Kopenhag'da geçirdi; orada genç Norveçli besteci Rikard Nordraak ile yakın dost oldu. Nordraak 1866'da ölünce Grieg onun için bir cenaze marşı yazdı. 1867'de kuzeni, soprano Nina Hagerup ile evlendi; Nina ömrü boyunca onun şarkılarını söyledi. Ertesi yıl yazdığı Piyano Konçertosu adını Avrupa'ya duyurdu; Henrik Ibsen'in *Peer Gynt* oyunu için yazdığı, "Sabah" ve "Dağ Kralının Sarayında" bölümlerini de içeren müzik ise onu her yerde tanınır kıldı.

      Grieg en iyi eserlerini küçük biçimlerde verdi: şarkılar ve on kitapta yayımlanan altmış altı piyano parçası, *Lirik Parçalar*. Norveç halk dansları ve keman ezgileri müziğinin her yerinde duyulur. Tek senfonisini geri çekti ve yalnızca bir konçerto tamamladı. 1907'de Bergen'de öldü. Evi Troldhaugen bugün bir müze; onun ve Nina'nın külleri yakındaki kayalığa oyulmuş bir mezarda yatıyor.
  portrait:
    artist: Eilif Peterssen
    title: { en: Portrait of the Composer Edvard Grieg, tr: Besteci Edvard Grieg'in Portresi }
    year: "1891"
    collection: { en: "Nasjonalmuseet, Oslo", tr: "Nasjonalmuseet, Oslo" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Eilif_Peterssen_-_Portrait_of_the_Composer_Edvard_Grieg_-_NG.M.00396_-_National_Museum_of_Art,_Architecture_and_Design.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Eilif_Peterssen_-_Portrait_of_the_Composer_Edvard_Grieg_-_NG.M.00396_-_National_Museum_of_Art,_Architecture_and_Design.jpg
    width: 4000
    height: 3632
    license: Public domain painting (PD-Art, artist d. 1928); museum photograph CC BY 4.0
    license_url: https://creativecommons.org/licenses/by/4.0/
    credit_line: { en: "Photo: Nasjonalmuseet, Oslo, CC BY 4.0", tr: "Fotoğraf: Nasjonalmuseet, Oslo, CC BY 4.0" }
    focal_y: 0.25
```

### Sources for the `grieg` entry (append to `content/research/composers-sources.md`)

```markdown
## Edvard Grieg (added 2026-10-10, batch G)
- Facts: https://en.wikipedia.org/wiki/Edvard_Grieg · https://www.wikidata.org/wiki/Q80621 (P569 1843-06-15, P570 1907-09-04, P19/P20 Bergen Q26793)
- Mother Gesine Judithe Hagerup, a music teacher, his first piano teacher from the age of six. Ole Bull persuaded the parents to send the 15-year-old to the Leipzig Conservatory (1858). 1860: pleurisy and tuberculosis; "destroyed left lung" and a spinal deformity for life. Copenhagen for three years from 1863; friendship with Rikard Nordraak, who died in 1866; Grieg wrote a funeral march in his honour. Married his first cousin, the lyric soprano Nina Hagerup, on 11 June 1867. Incidental music for Ibsen's *Peer Gynt* ("Morning Mood", "In the Hall of the Mountain King"). "Sixty-six Lyric Pieces for piano in ten books" (Opp. 12–71). Suppressed an early symphony. Died in Bergen, 4 September 1907, of heart failure. Troldhaugen is now the Edvard Grieg Museum; his ashes were placed in a mountain crypt near Troldhaugen, Nina's later alongside.
- Only concerto completed: https://en.wikipedia.org/wiki/Piano_Concerto_(Grieg)
- Portrait: Eilif Peterssen (1852–1928), *Portrait of the Composer Edvard Grieg*, 1891, oil on canvas, Nasjonalmuseet, Oslo (NG.M.00396).
  https://commons.wikimedia.org/wiki/File:Eilif_Peterssen_-_Portrait_of_the_Composer_Edvard_Grieg_-_NG.M.00396_-_National_Museum_of_Art,_Architecture_and_Design.jpg — 4000 × 3632, {{Licensed-PD-Art|PD-old-auto-expired|cc-by-4.0|deathyear=1928}}: the painting is public domain; Nasjonalmuseet licenses its photograph CC BY 4.0, hence the credit line (same treatment as the Molitor painting in paintings.yaml). focal_y 0.25 (seated, face at about 28 % from the top; checked on a thumbnail). The image is wider than tall: check the 300 pt cover crop.
  Rejected: Elliott & Fry carte de visite, 1888 (File:Edvard_Grieg_(1888)_by_Elliot_and_Fry_-_02.jpg, PD, only 567 × 863); Bergen Public Library photographs (no restrictions, but undated and unattributed); the small Peterssen file "Eilif Peterssen-Edvard Grieg 1891.jpg" (520 × 477).
```
