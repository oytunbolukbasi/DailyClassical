# Shared-file additions: gershwin-rhapsody-in-blue

Batch 2026-11, group J. Details and sources in `content/research/gershwin-rhapsody-in-blue.md`.

## 1. paintings.yaml

```yaml
gershwin-rhapsody-in-blue:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Whistler-Nocturne_in_black_and_gold.jpg
  source_url: https://dia.org/collection/nocturne-black-and-gold-falling-rocket-64931
  commons_page: https://commons.wikimedia.org/wiki/File:Whistler-Nocturne_in_black_and_gold.jpg
  width: 4371
  height: 5807
  medium: Oil on panel
  license: Public domain (PD-Art)
  credit_line: "James McNeill Whistler, Nocturne in Black and Gold: The Falling Rocket, 1875. Detroit Institute of Arts (46.309), Gift of Dexter M. Ferry, Jr. Image via Wikimedia Commons, public domain."
  rights_status: public_domain
```

Note: the DIA object URL above appears in search results as the museum's record ("Gift of Dexter M. Ferry, Jr., 46.309", oil on panel); the museum site returns 403 to scripted requests, so it was not opened directly.

**Alternative 1.** Joseph Stella (1877–1946), *Brooklyn Bridge*, 1919–20. Yale University Art Gallery, New Haven (1941.690, Gift of Collection Société Anonyme). Commons: https://commons.wikimedia.org/wiki/File:Joseph_Stella,_1919-20,_Brooklyn_Bridge,_oil_on_canvas,_215.3_x_194.6_cm,_Yale_University_Art_Gallery.jpg (2713 × 3000). Rights: Stella died 1946, so PD in the EU/Turkey since 2017; exhibited in the US before 1931, so PD there too (Commons {{PD-old-auto-1923|deathyear=1946}}). Pairing: New York's machine age painted four years before the Rhapsody, the "metropolitan madness" Gershwin said he heard in the train's rattle.

**Alternative 2.** James McNeill Whistler, *Nocturne: Blue and Gold – Old Battersea Bridge*, c. 1872–75. Tate, London (N01957). Commons: https://commons.wikimedia.org/wiki/File:James_McNeill_Whistler_-_Nocturne_en_bleu_et_or.jpg (1926 × 2584, book scan; PD). Pairing: the same Whistler link, with "blue" in its title. Lower image quality than the Detroit painting.

## 2. Glossary

EN:

| Term | Short | Definition |
| --- | --- | --- |
| Blue note | A note bent slightly flat, borrowed from the blues | A note played or sung a little lower than the major scale would have it, usually the third, fifth or seventh. It gives blues and jazz their bittersweet, slightly sour colour. |
| Rhapsody | A free, one-movement piece of contrasting episodes | A single-movement work that moves freely from one mood and tempo to the next, often sounding improvised, instead of following a set form. |

TR:

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Blue note | Blue note | Blues'tan gelen, hafifçe pesleştirilmiş nota | Majör dizinin gerektirdiğinden biraz daha pes çalınan ya da söylenen nota; çoğunlukla üçüncü, beşinci ya da yedinci derece. Blues'a ve caza o buruk, hafif ekşi rengini verir. |
| Rhapsody | Rapsodi | Zıt bölümlerden kurulu, serbest, tek bölümlük eser | Belirli bir formu izlemek yerine bir havadan ve tempodan ötekine serbestçe geçen, çoğu zaman doğaçlama gibi duyulan tek bölümlük eser. |

## 3. Composer

```yaml
- id: gershwin
  match: George Gershwin
  sort_name: Gershwin, George
  born: 1898
  died: 1937
  era: modern
  names:
    en: { name: George Gershwin, short: Gershwin }
    tr: { name: George Gershwin, short: Gershwin }
  nationality: { en: American, tr: Amerikalı }
  facts:
    born: { en: "26 September 1898, Brooklyn, New York", tr: "26 Eylül 1898, Brooklyn, New York" }
    died: { en: "11 July 1937, Los Angeles", tr: "11 Temmuz 1937, Los Angeles" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Rhapsody in Blue*, *An American in Paris*, the opera *Porgy and Bess*", tr: "*Rhapsody in Blue*, *Paris'te Bir Amerikalı*, *Porgy and Bess* operası" }
  bio:
    en: |-
      Gershwin was born Jacob Gershwine in Brooklyn in 1898, the second son of Jewish immigrants from the Russian Empire, and grew up in the crowded streets of New York. Music meant nothing to him until he was about ten. Then his parents bought a piano for his older brother Ira, and it was George who could not leave it alone. His teacher Charles Hambitzer taught him a proper technique and took him to orchestral concerts. At fifteen he left school to work as a "song plugger" in Tin Pan Alley, playing a publisher's new songs for customers all day for fifteen dollars a week, and he began to cut piano rolls and write songs of his own. In 1919 Al Jolson sang his "Swanee", and it became a national hit.

      In 1924 the bandleader Paul Whiteman persuaded him to write a concert piece for a jazz band, and *Rhapsody in Blue* made him famous overnight. In the same years he and Ira, who wrote the lyrics, filled Broadway with musicals, among them *Lady, Be Good!*, *Funny Face* and *Girl Crazy*, and songs such as "Fascinating Rhythm", "Embraceable You" and "I Got Rhythm"; their *Of Thee I Sing* was the first musical to win the Pulitzer Prize for Drama. He also kept writing for the concert hall: a Piano Concerto in F (1925) and, after a stay in Paris, *An American in Paris* (1928). There he asked Nadia Boulanger and Ravel for lessons; both declined, fearing that strict training would spoil his style.

      His most ambitious work, the opera *Porgy and Bess* (1935), written with Ira and the novelist DuBose Heyward and set among the Black community of Charleston, was a commercial failure at first; it has since become one of the best-known American operas, and its song "Summertime" a standard. In 1936 he moved to Hollywood to write film music, including *Shall We Dance* for Fred Astaire and Ginger Rogers, and played tennis with Arnold Schoenberg. Early in 1937 he began to suffer headaches and blackouts. On 9 July he collapsed; a brain tumour was found too late, and he died in Los Angeles on 11 July 1937, aged 38.
    tr: |-
      Gershwin 1898'de Brooklyn'de, Rus İmparatorluğu'ndan gelmiş Yahudi göçmenlerin ikinci oğlu olarak Jacob Gershwine adıyla doğdu ve New York'un kalabalık sokaklarında büyüdü. On yaşına kadar müzik onun için hiçbir şey ifade etmiyordu. Sonra ailesi ağabeyi Ira için bir piyano aldı; ama piyanonun başından kalkamayan George oldu. Hocası Charles Hambitzer ona sağlam bir teknik öğretti ve onu orkestra konserlerine götürdü. On beş yaşında okulu bırakıp Tin Pan Alley'de "şarkı tanıtıcısı" olarak çalışmaya başladı: haftada on beş dolara, bütün gün bir yayıncının yeni şarkılarını müşterilere çalıyordu. Piyano rulolarına kayıt yapmaya ve kendi şarkılarını yazmaya da başladı. 1919'da Al Jolson onun "Swanee" şarkısını söyledi ve şarkı bütün ülkede sevildi.

      1924'te orkestra şefi Paul Whiteman onu bir caz topluluğu için bir konser eseri yazmaya ikna etti; *Rhapsody in Blue* onu bir gecede ünlü yaptı. Aynı yıllarda sözlerini Ira'nın yazdığı müzikallerle Broadway'i doldurdular: *Lady, Be Good!*, *Funny Face*, *Girl Crazy* ve "Fascinating Rhythm", "Embraceable You", "I Got Rhythm" gibi şarkılar. *Of Thee I Sing*, Pulitzer Drama Ödülü'nü kazanan ilk müzikal oldu. Konser salonu için de yazmayı sürdürdü: Fa majör Piyano Konçertosu (1925) ve bir Paris yolculuğunun ardından *Paris'te Bir Amerikalı* (1928). Paris'te Nadia Boulanger'dan ve Ravel'den ders istedi; ikisi de sıkı bir eğitimin üslubunu bozacağından korkarak geri çevirdi.

      En iddialı eseri, Ira ve romancı DuBose Heyward ile birlikte yazdığı, Charleston'ın siyah topluluğunda geçen *Porgy and Bess* operası (1935), önce ticari bir başarısızlık oldu; bugün en tanınmış Amerikan operalarından biri, "Summertime" şarkısı da bir klasik. 1936'da film müziği yazmak için Hollywood'a taşındı; aralarında Fred Astaire ve Ginger Rogers için *Shall We Dance* da vardı. Arnold Schoenberg'le tenis oynadı. 1937'nin başında baş ağrıları ve bayılmalar başladı. 9 Temmuz'da yere yığıldı; beyin tümörü çok geç fark edildi ve 11 Temmuz 1937'de, 38 yaşında Los Angeles'ta öldü.
  # Bain News Service press photograph, undated (1920s or early 1930s), Library of Congress, no known
  # restrictions; published without a copyright notice (PD-Bain, PD-US-no notice). Same basis as the
  # Rachmaninoff and Prokofiev portraits. See content/research/composers-sources.md.
  portrait:
    artist: { en: Bain News Service, tr: Bain News Service }
    title: { en: George Gershwin, tr: George Gershwin }
    year: "c. 1925–35"
    collection: { en: "Library of Congress, Washington, D.C.", tr: "Kongre Kütüphanesi, Washington" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/George_Gershwin,_1898-1937,_half-length_portrait,_standing,_facing_left_LCCN2005678096.jpg
    source_url: https://commons.wikimedia.org/wiki/File:George_Gershwin,_1898-1937,_half-length_portrait,_standing,_facing_left_LCCN2005678096.jpg
    width: 1177
    height: 1536
    license: Public domain (PD-Bain, PD-US-no notice; Library of Congress, no known restrictions)
    focal_y: 0.15
```

### George Gershwin: content/research/composers-sources.md

## George Gershwin (added 2026-11-17, batch 2026-11, group J)
- Facts: https://en.wikipedia.org/wiki/George_Gershwin · https://en.wikipedia.org/wiki/Rhapsody_in_Blue
- Born 26 September 1898, 242 Snediker Avenue, East New York, Brooklyn, as Jacob Gershwine (birth certificate); parents Moishe (Morris) and Roza (Rose) Bruskina, Jewish immigrants from the Russian Empire; elder brother Ira (born 1896). "Until 1908, he cared nothing about music"; piano bought for Ira, George played it. Piano teachers c. 1911; Charles Hambitzer from c. 1913 (taught "conventional piano technique, introduced him to music of the European classical tradition, and encouraged him to attend orchestral concerts"). Left school at 15 in 1913, song plugger for Jerome H. Remick and Company at $15 a week. Piano rolls for Aeolian/Standard from 1916. "Swanee" (1919, Irving Caesar) a national hit after Al Jolson took it up.
- 1924 *Rhapsody in Blue* (Whiteman, Grofé). Concerto in F 1925. Musicals with Ira: *Lady, Be Good!* (1924; "Fascinating Rhythm"), *Oh, Kay!* (1926), *Funny Face* (1927), *Strike Up the Band*, *Girl Crazy* (1930; "Embraceable You", "I Got Rhythm"). *Of Thee I Sing* (1931) first musical to win the Pulitzer Prize for Drama (awarded to Kaufman, Ryskind and Ira, not George). Paris in the mid-1920s: Nadia Boulanger and Ravel declined to teach him, "afraid that rigorous classical study would ruin his jazz-influenced style". *An American in Paris*, Carnegie Hall, 13 December 1928.
- *Porgy and Bess* (1935) with Ira and DuBose Heyward (summer 1934 on Folly Island, South Carolina); initially a commercial failure, now "one of the most important American operas of the 20th century"; "Summertime". Hollywood 1936; *Shall We Dance* (RKO, Astaire and Rogers); tennis with Schoenberg. Headaches early 1937; collapsed 9 July 1937; operation at Cedars of Lebanon Hospital, Los Angeles; died 11 July 1937, aged 38 (brain tumour, probably glioblastoma).
- "Charleston's Black community": the setting of *Porgy and Bess* (Catfish Row, Charleston), standard; not re-fetched.
- Portrait: Bain News Service, "George Gershwin, 1898-1937, half-length portrait, standing, facing left", Library of Congress, George Grantham Bain Collection, LCCN 2005678096, digital id cph.3a42852 ("Photo by Bain News Service"; caption-card data "unverified, old").
  https://commons.wikimedia.org/wiki/File:George_Gershwin,_1898-1937,_half-length_portrait,_standing,_facing_left_LCCN2005678096.jpg — 1177 × 1536 (TIFF version the same size), {{PD-Bain}} + {{PD-US-no notice}}; LOC: "No known restrictions on publication".
  - US: press agency photograph distributed without a copyright notice: PD.
  - EU / Turkey: anonymous agency photograph, published by the 1930s at the latest: 70 years from publication expired.
  - Undated: Commons "c. 1920s or early 1930s"; the yaml says "c. 1925–35" (Gershwin looks about 30). Adjust if a dated source turns up.
  - Resolution is modest (1177 × 1536); the hero copy will be smaller than for most composers.
  - Rejected: Carl Van Vechten's 1937 portraits (LCCN 2004662905–8; Van Vechten died 1964, same reasoning as for Barber, and his estate asks that the photos not be cropped); the self-portrait of 1934 (National Portrait Gallery; painted by Gershwin, who died 1937: PD by age, but it is an oil sketch, not a likeness for a cover).
- focal_y 0.15: three-quarter-length standing figure, face in the top fifth (thumbnail checked).

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Gershwin – Rhapsody in Blue | I Rhapsody in Blue | – | 16:27 | – | Bernstein / Columbia SO 1959, Spotify `7y2gHGuQhJmesRiNO8d8fK` (track 1) | 0:00, 0:30–1:15, 1:15–3:00, 3:00–4:30, 4:30–7:00, 7:00–8:45, 9:00, 10:30–12:00, 12:30–14:30, 14:30–15:45, Last 40 seconds | Nov 2026: estimated from published analyses and the track length, not heard. Least certain: start of the slow tune ≈ 9:00 (± 45 s) and the *Grandioso* ≈ 14:30; Bernstein may make cuts (not verified) |
