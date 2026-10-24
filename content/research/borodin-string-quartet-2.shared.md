# Shared-file additions: borodin-string-quartet-2

Group G, batch 2026-10b. Verification: `content/research/borodin-string-quartet-2.md`. This group owns the new composer entry for Borodin (§3).

## 1. paintings.yaml

First choice: Ivan Kramskoi, *Moonlit Night*, 1880, State Tretyakov Gallery.

```yaml
borodin-string-quartet-2:
  # Portrait format (1784 × 2508, ≈ 0.71:1), moderate resolution: check the hero crop keeps the woman on the bench.
  # Collection from the credit on the smaller Commons file "Moonlight night by Ivan Kramskoy (GTG).jpeg"; inventory number not found.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Ivan_Kramskoi_-_Moonlit_Night(%D0%9B%D1%83%D0%BD%D0%BD%D0%B0%D1%8F_%D0%BD%D0%BE%D1%87%D1%8C)_(1880).jpg
  source_url: https://commons.wikimedia.org/wiki/File:Moonlight_night_by_Ivan_Kramskoy_(GTG).jpeg
  commons_page: https://commons.wikimedia.org/wiki/File:Ivan_Kramskoi_-_Moonlit_Night(%D0%9B%D1%83%D0%BD%D0%BD%D0%B0%D1%8F_%D0%BD%D0%BE%D1%87%D1%8C)_(1880).jpg
  width: 1784
  height: 2508
  medium: Oil on canvas
  license: Public domain (PD-old-70-1923; artist d. 1887)
  credit_line: Ivan Kramskoi, Moonlit Night, 1880. State Tretyakov Gallery, Moscow. Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Alternatives:

- **A. Arkhip Kuindzhi, *Moonlit Night on the Dnieper*, 1880.** State Russian Museum, St Petersburg. Commons: https://commons.wikimedia.org/wiki/File:0857Ha._%D0%9A%D1%83%D0%B8%D0%BD%D0%B4%D0%B6%D0%B8_%D0%90.%D0%98._%D0%9B%D1%83%D0%BD%D0%BD%D0%B0%D1%8F_%D0%BD%D0%BE%D1%87%D1%8C_%D0%BD%D0%B0_%D0%94%D0%BD%D0%B5%D0%BF%D1%80%D0%B5.jpg (4067 × 2955, {{PD-old-70}}). Pairing: the most famous Russian night painting, a year before the quartet; a landscape Notturno. Larger and landscape, but Kuindzhi is already in paintings.yaml (*Red Sunset*).
- **B. Vasily Polenov, *Overgrown Pond*, 1879.** State Tretyakov Gallery. Commons: https://commons.wikimedia.org/wiki/File:Wassilij_Dimitriewitsch_Polenow_004.jpg (2048 × 1322, public domain). Pairing: a quiet, overgrown garden pond with a lone figure on a bench (check), two years before the quartet; the same lyrical stillness as the Notturno.

## 2. Glossary

No new terms. Terms used (already present): sonata form, counterpoint, exposition, development, pedal note, recapitulation, canon, coda.

## 3. Composer

New composer `borodin`, era `romantic` (as the batch brief says). Sources below. Hero/thumb/full and `placeholder_color` are left for `npm run images -- --only borodin`.

```yaml
- id: borodin
  match: Alexander Borodin
  sort_name: Borodin, Alexander
  born: 1833
  died: 1887
  era: romantic
  names:
    en: { name: Alexander Borodin, short: Borodin }
    tr: { name: Aleksandr Borodin, short: Borodin }
  nationality: { en: Russian, tr: Rus }
  facts:
    born: { en: "12 November 1833, St Petersburg", tr: "12 Kasım 1833, St. Petersburg" }
    died: { en: "27 February 1887, St Petersburg", tr: "27 Şubat 1887, St. Petersburg" }
    symphonies: { en: "Two, and an unfinished Third", tr: "İki, bir de yarım kalmış Üçüncü" }
    best_known_for: { en: "*Prince Igor*, *In the Steppes of Central Asia*, String Quartet No. 2", tr: "*Knyaz İgor*, *Orta Asya Bozkırlarında*, 2. Yaylı Dörtlü" }
  bio:
    en: |-
      Borodin was born in St Petersburg in 1833, the illegitimate son of an elderly Georgian nobleman, Luka Gedevanishvili. The nobleman registered the boy as the son of one of his serfs, Porfiry Borodin, which is where the name comes from, and freed him when he was seven. Taught at home by private tutors, he entered the Medical–Surgical Academy in St Petersburg in 1850 and became a chemist. From 1859 he worked for three years in Heidelberg, where he played chamber music on the cello and met the pianist Ekaterina Protopopova, whom he married in 1863.

      In 1862 he became professor of chemistry at the Medical–Surgical Academy, a career he kept all his life. He is credited, with the Frenchman Charles-Adolphe Wurtz, with discovering the aldol reaction, and he helped to found medical courses for women. In the same year he began lessons with Mily Balakirev and joined the circle later known as The Five, who wanted music that sounded Russian. He composed in the time his work left him, often when he was ill: the First Symphony was first played in 1869, the Second in 1877, and the orchestral picture *In the Steppes of Central Asia* followed in 1880. That year Liszt arranged a performance of the First Symphony in Germany.

      His great project was the opera *Prince Igor*, which occupied him from the late 1860s until his death; Rimsky-Korsakov and Glazunov completed it. Its Polovtsian Dances are his best-known music. He died suddenly at a ball in St Petersburg in February 1887, aged 53. His long, lyrical melodies and rich harmonies later fascinated Debussy and Ravel, and in 1953 Broadway turned them into the musical *Kismet*.
    tr: |-
      Borodin 1833'te St. Petersburg'da, yaşlı bir Gürcü soylusu olan Luka Gedevanişvili'nin evlilik dışı oğlu olarak doğdu. Soylu, çocuğu serflerinden Porfiri Borodin'in oğlu olarak kaydettirdi; soyadı buradan gelir. Çocuk yedi yaşındayken onu serflikten azat etti. Evde özel öğretmenlerden eğitim alan Borodin, 1850'de St. Petersburg'daki Tıp ve Cerrahi Akademisi'ne girdi ve kimyacı oldu. 1859'dan başlayarak üç yıl Heidelberg'de çalıştı; orada viyolonselle oda müziği çaldı ve 1863'te evleneceği piyanist Yekaterina Protopopova'yla tanıştı.

      1862'de Tıp ve Cerrahi Akademisi'nde kimya profesörü oldu ve bu mesleği ömrü boyunca sürdürdü. Aldol tepkimesinin keşfi, Fransız kimyacı Charles-Adolphe Wurtz'la birlikte ona atfedilir; kadınlar için tıp kurslarının kurulmasına da öncülük etti. Aynı yıl Mili Balakirev'den ders almaya başladı ve sonradan "Beşler" diye anılacak, Rus gibi duyulan bir müzik isteyen çevreye katıldı. İşinin ona bıraktığı zamanlarda, çoğu kez de hastayken beste yaptı: Birinci Senfoni ilk kez 1869'da, İkinci 1877'de çalındı; *Orta Asya Bozkırlarında* adlı orkestra tablosu 1880'de geldi. Aynı yıl Liszt, Birinci Senfoni'nin Almanya'da seslendirilmesini sağladı.

      Büyük tasarısı *Knyaz İgor* operasıydı; 1860'ların sonundan ölümüne kadar onunla uğraştı, eseri Rimski-Korsakov ve Glazunov tamamladı. Operanın Polovets Dansları, en çok bilinen müziğidir. Şubat 1887'de St. Petersburg'da bir baloda, 53 yaşında ansızın öldü. Uzun, lirik melodileri ve zengin armonileri sonradan Debussy'yi ve Ravel'i büyüledi; 1953'te Broadway onları *Kismet* müzikaline dönüştürdü.
  portrait:
    artist: { en: "After a painting by A. Levinstein", tr: "A. Levinstein'ın bir tablosundan" }
    title: { en: Portrait of Alexander Borodin, tr: Aleksandr Borodin'in Portresi }
    year: "Print, 1910"
    collection: { en: "Bibliothèque nationale de France, Paris", tr: "Fransa Ulusal Kütüphanesi, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Alexandre_Borodine_-_d%27apr%C3%A8s_le_tableau_de_A._Levinstein_-_btv1b8415940h.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Alexandre_Borodine_-_d%27apr%C3%A8s_le_tableau_de_A._Levinstein_-_btv1b8415940h.jpg
    width: 3216
    height: 4264
    license: Public domain (PD-France, PD-US-expired)
    focal_y: 0.3
```

### Sources for composers-sources.md

```markdown
## Alexander Borodin (added 2026-10-24)
- Facts: https://en.wikipedia.org/wiki/Alexander_Borodin · https://www.wikidata.org/wiki/Q164004
- Dates are New Style. Wikidata P569 gives 31 October 1833 (Julian) and 12 November 1833 (Gregorian); P570 gives 15 February 1887 (Julian) and both 27 and 28 February (Gregorian). The card follows Wikipedia: 12 November 1833 and 27 February 1887 (15 Feb O.S. + 12 days = 27 Feb). Birthplace and place of death: Saint Petersburg (Q656).
- Bio: illegitimate son of the 62-year-old Georgian nobleman Luka Stepanovich Gedevanishvili, registered as the son of his serf Porfiry Borodin, emancipated aged 7; private tutors; Medical–Surgical Academy from 1850; Heidelberg 1859–1862 (Erlenmeyer's laboratory), chamber music on the cello there; married the pianist Ekaterina Protopopova in 1863; professor of chemistry at the Academy from 1862; aldol reaction credited jointly to Borodin and Wurtz; medical courses for women (1872); lessons with Balakirev from 1862; The Five; composed "in his spare time or when he was ill"; Symphony No. 1 first performed 1869 (Balakirev), No. 2 in 1877 (Nápravník); *In the Steppes of Central Asia* 1880; Symphony No. 3 unfinished (two movements completed by Glazunov); *Prince Igor* from 1868/69, completed by Rimsky-Korsakov and Glazunov; Polovtsian Dances "probably Borodin's best-known composition"; Liszt arranged a performance of Symphony No. 1 in Germany in 1880; died suddenly at a ball (February 1887); influence on Debussy and Ravel; *Kismet* (1953), posthumous Tony Award (1954). All from the Wikipedia article.
- "Two, and an unfinished Third": two completed symphonies; the Third, begun 1882, was left unfinished (Wikipedia).
- Portrait: print after a painting by A. Levinstein, Bibliothèque nationale de France, département Musique, Est. Borodin 001 (catalogue: http://catalogue.bnf.fr/ark:/12148/cb39602840k), dated 1910 on Commons.
  https://commons.wikimedia.org/wiki/File:Alexandre_Borodine_-_d%27apr%C3%A8s_le_tableau_de_A._Levinstein_-_btv1b8415940h.jpg — 3216 × 4264, {{PD-US-expired}} + {{PD-France}}. Not checked visually: the scan may include the mount; set focal_y and, if needed, crop before `npm run images -- --only borodin`.
- Alternative portrait: Ilya Repin, *Portrait of Alexander Borodin*, 1888 (posthumous), State Russian Museum. The only large Commons files are 2019 gallery photos by shakko under CC BY-SA 4.0, e.g. https://commons.wikimedia.org/wiki/File:Alexander_Borodin_by_Repin_(1888,_GRM)_03.jpg (2343 × 3591); the PD file https://commons.wikimedia.org/wiki/File:Borodin_by_Repin.jpg is only 631 × 1000. If used, add `license: CC BY-SA 4.0`, `license_url: https://creativecommons.org/licenses/by-sa/4.0/` and `credit_line: { en: "Photo: shakko, CC BY-SA 4.0", tr: "Fotoğraf: shakko, CC BY-SA 4.0" }`.
```

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Borodin – String Quartet No. 2 | I Allegro moderato | – | 7:53 | – | Takács Quartet 1995, Spotify `72iK8XF922K1Ba4EbXkiMW` (track 5) | 0:00, 1:10, 1:30–2:10, 2:15, 2:50, 4:20, 4:40, 5:50, 6:40, Last minute | New piece, never timed by ear. Published bar numbers (Wikipedia) × average tempo; fairly reliable |
| Borodin – String Quartet No. 2 | II Scherzo | – | 4:27 | – | same (track 6) | 0:00, 0:25, 0:45, 1:30, 2:10, 2:50, 3:15, Last 20 seconds | Assumes no exposition repeat |
| Borodin – String Quartet No. 2 | III Notturno | – | 7:01 | – | same (track 7) | 0:00, 0:50, 1:50, 2:30–4:20, 4:20, 5:05, Last minute | Least certain: violin's statement (≈ 0:50), second canon (≈ 5:05) |
| Borodin – String Quartet No. 2 | IV Finale | – | 6:52 | – | same (track 8) | 0:00, 0:30, 1:10, 2:00, 2:35, 3:55, 4:45, 6:05, Last 20 seconds | Least certain: end of the Andante (≈ 0:30), start of the development (≈ 2:35) |
