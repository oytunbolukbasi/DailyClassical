# İçerik durumu

Son güncelleme: 11 Ekim 2026. Ekim 2026 partisi: 50 yeni eser (brief: `content/research/BATCH-2026-10.md`).

**Aşamalar**
1. **Taslak:** `content/drafts/<dil>/<id>.md`. Yayın hattının dışında, hiçbir yere yüklenmez.
2. **Birleştirildi:** `content/<dil>/pieces/`'e taşındı; tablo, besteci ve sözlük girdileri ortak dosyalara eklendi, görseller üretildi. Sunucuya yüklenir ama takvimde olmadığı için kimse görmez.
3. **Kulakla zamanlandı:** ≈ duraklar referans kayda göre düzeltildi.
4. **Takvimde:** `schedule.yaml`'a eklendi; günü gelince Bugün'de ve Kitaplık'ta.

Her eserin araştırma notu `content/research/<id>.md`; ortak dosyalara girecekler `content/research/<id>.shared.md`.

## Birleştirmeden önce çözülecekler (bütün parti)

- ~~**Rönesans dönemi**~~ **Çözüldü (11 Ekim):** `renaissance` backend'e (migration 0011) ve uygulamaya eklendi. Yayındaki 1.0.0 bilinmeyen dönemi "Diğer" gösteriyor (çökmüyor); bir sonraki build'de "Rönesans".
- ~~**Sözlük**~~ **Çözüldü:** 28 yeni terim, her biri bir kez (toplam 69).
- ~~**Yeni besteciler**~~ **Çözüldü:** 20 yeni besteci eklendi (portreler kırpıldı; Tallis portresiz).
- ~~**Lisans**~~ **Çözüldü:** Khnopff yerine Hammershøi. Spitzweg kaldı: kamu malı bir tablonun aslına sadık fotoğrafı AB'de (DSM md. 14) ve ABD'de yeni hak doğurmuyor (Molitor girdisindeki gibi); fotoğrafçı künyede anılıyor. Not: yayındaki uygulama CC lisanslı *tablo* fotoğraflarının künyesini göstermiyor (yalnızca portrelerde); bu yüzden tablolarda kamu malı ya da bu ilkeye uyan görseller kullanılıyor.
- ~~**Çaykovski Keman Konçertosu**~~ **Çözüldü:** Chung'ın finali (9:29) kesintili görünüyor; referans kesintisiz Hahn / Petrenko (DG 2008) oldu, duraklar orantılı kaydırıldı.
- ~~**Spotify Türkiye erişimi**~~ **Çözüldü (11 Ekim):** 64 referans albüm Türkiye'den denendi; üç eserin parçaları kapalıydı (COUNTRY_RESTRICTED). Mozart 40 (yayında): aynı Mackerras kaydının Linn'in diğer baskısı (`1EsOER6UdNfA5Lliol1o73`). "İmparator": Zimerman / Bernstein / Viyana Filarmoni, canlı 1989. Allegri: The Sixteen / Christophers (1989). Duraklar yeni sürelere göre yeniden yerleştirildi (≈).
- **Mahler 3 (6 bölüm):** Bölüm seçicideki daraltma bir sonraki build'de. O build yayında olmadan takvime girmeyecek.
- **Duraklar:** Hepsi tahmini (≈); her eser takvime girmeden kulakla zamanlanacak (`retime-needed.md`).

## Birleştirme günlüğü

- **11 Ekim 2026, Grup B** (5 eser): ilk tercih tabloların hepsi tutuldu; Friedrich'in Met görselindeki siyah fon kırpıldı (master `.source.jpg`'den). Yeni terim: Lydian mode. Birleştirme betiği: `content/research/merge-drafts.py`.
- **11 Ekim 2026, Grup A** (5 eser): Beethoven Keman Konçertosu Ingres → Villers (Ingres Allegri'de kalıyor). David'in Napolyon'u "İmparator"da kaldı (alternatifler küçük/tarihsiz). Koch (Pastoral) ve Gros (Eroica) görsellerinde çerçeve/fon kırpıldı. Yeni terimler: Hemiola, Attacca, Ostinato, Trill.
- **11 Ekim 2026, Grup E** (5 eser): Klarnet Beşlisi Khnopff (CC BY-SA) → Hammershøi; D 960 Constable → Dahl, *Ay Işığında Dresden*. Yeni terimler: Double stop, Lied, Tarantella.
- **11 Ekim 2026, Grup D** (5 eser + Bruckner): Brahms 1 Menzel → Calame, *Thun Gölü* (Menzel Bach'ta kalıyor; tekniği National Gallery sayfasından doğrulandı). Schiele Mahler 9 ve "Ölüm ve Kız"da iki farklı tabloyla kaldı. Yeni terimler: Offstage, Posthorn, Wagner tuba. Mahler 3 (6 bölüm) yeni build yayına çıkmadan takvime girmeyecek.
- **11 Ekim 2026, Grup C** (5 eser + Haydn, Allegri): ilk tercih tablolar tutuldu. Allegri `renaissance`, "Senfoni: Yok". Yeni terimler: Counterpoint, Basset clarinet, Plainchant. Not: Jupiter tablosu (Hubert Robert, *Dikilitaş*) yalnızca 1952 px; daha büyük bir kaynak bulunursa değiştirilecek.
- **11 Ekim 2026, Grup F** (5 eser + Schumann, Mendelssohn, Chopin): ilk tercih tablolar tutuldu (Courbet Chopin 2'de ve Çaykovski Keman'da farklı tablolarla). Mendelssohn portresi çerçeveli TIFF'ten, Kasprzycki tablosu altın çerçeve kenarından kırpıldı. Yeni terimler: Krakowiak, Nocturne.
- **11 Ekim 2026, Grup G** (5 eser + Liszt, Grieg, Bruch): Çaykovski Keman referansı Chung → Hahn (kesintisiz final). Delacroix (Liszt) görselindeki koyu fon kırpıldı. Yeni terim: Thematic transformation.
- **11 Ekim 2026, Grup H** (5 eser + Sibelius, Elgar): ilk tercih tablolar tutuldu. Nash (Elgar) AB'de 2017'den beri, ABD'de 1928 öncesi yayın olarak kamu malı. Elgar portresi cam negatif kenarı ve el yazısı notundan kırpıldı. Yeni terimler: Harmonics, Pentatonic scale.
- **11 Ekim 2026, Grup I** (5 eser + Vivaldi, Bach, Franck, Tallis, Smetana): Vltava için özel koleksiyondaki Schikaneder yerine Prag Ulusal Galerisi'ndeki Braunerová (*Roztoky'de Vltava Koyu*, ahşap üzerine yağlı boya). Franck ve Vivaldi portrelerinin kâğıt kenarları kırpıldı. Tallis portresiz (yaşarken yapılmış portresi yok), dönemi `renaissance`. Yeni terimler: Continuo, Drone, Ritornello, Cyclic form, Motet, Polyphony, Symphonic poem.
- **11 Ekim 2026, Grup J** (5 eser + Debussy, Ravel, Rimsky-Korsakov, Wagner): Bellotto Kuvartet 8'de kaldı (1760'ta yıkılan Dresden kilisesi, eser 1960'ta Dresden'de yazıldı); Mozart 21 Bellotto → Fragonard, *Salıncak*. Yeni terimler: Leitmotif, Tristan chord, DSCH.
- **Parti tamamlandı (11 Ekim 2026):** 50 eserin hepsi birleşti; katalog 64 eser, 69 terim, 29 besteci. Aynı tablo iki kez yok; 6 ressam iki farklı tabloyla. Taslak klasörü kaldırıldı.

## Eserler

"Çakışma" sütunu: aynı ressam bu partide birden çok kez seçilmişse ya da katalogda zaten varsa. Karar birleştirmede verilecek; `.shared.md`'lerde ikişer alternatif tablo var.

| Eser | Grup | Form | Bölüm | Referans kayıt | Spotify | Tablo | Çakışma | Durum |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| beethoven-symphony-3 | A | symphony | 4 | Herbert von Karajan · Berliner Philharmoniker, 1977 | `4AAP5zYQJTEFQiQacOFq2s` | Antoine-Jean Gros, *Bonaparte at the Pont d'Arcole* |  | Birleştirildi |
| beethoven-symphony-6 | A | symphony | 5 | Karl Böhm · Wiener Philharmoniker, 1971 | `1eMMy3QJ3ezrR6hkp6jP7n` | Joseph Anton Koch, *Heroic Landscape with Rainbow* |  | Birleştirildi |
| beethoven-symphony-7 | A | symphony | 4 | Carlos Kleiber · Wiener Philharmoniker, 1976 | `2aNAica8UZ1gPub5p1UYUe` | Pieter Bruegel the Elder, *The Peasant Dance* |  | Birleştirildi |
| beethoven-piano-concerto-5 | A | piano-concerto | 3 | Krystian Zimerman / Leonard Bernstein · Wiener Philharmoniker, 1989 | `6z85OonA4aXLoUOVeo6GNF` | Jacques-Louis David, *The Emperor Napoleon in His Study at the Tuileries* | katalogda da var (beethoven-piano-sonata-8) | Birleştirildi |
| beethoven-violin-concerto | A | violin-concerto | 3 | Wolfgang Schneiderhan / Eugen Jochum · Berliner Philharmoniker, 1963 | `0irQe1qulTiJHGNuD5sqUa` | Marie-Denise Villers, *Marie Joséphine Charlotte du Val d'Ognes* | (Ingres'ten değişti) | Birleştirildi |
| beethoven-piano-sonata-14 | B | piano-sonata | 3 | Wilhelm Kempff, 1965 | `7z9kHQBUKHO4UQ5ol9D4Ia` | Caspar David Friedrich, *Two Men Contemplating the Moon* | katalogda da var (schubert-symphony-8) | Birleştirildi |
| beethoven-piano-sonata-23 | B | piano-sonata | 3 | Emil Gilels, 1973 | `3O9HUGtcDizohPdj12wmVh` | Johan Christian Dahl, *An Eruption of Vesuvius* |  | Birleştirildi |
| beethoven-string-quartet-15 | B | string-quartet | 5 | Takács Quartet, 2004 | `6tFl4rPDztyza1TSAOZP8i` | John Constable, *Salisbury Cathedral from the Bishop's Garden* | ressam partide 2 kez | Birleştirildi |
| mozart-piano-sonata-11 | B | piano-sonata | 3 | Mitsuko Uchida, 1983 | `36ZImQlSkxKd7FGSiICpEf` | Jean Baptiste Vanmour, *Cornelis Calkoen on his Way to his Audience with Sultan Ahmed III* |  | Birleştirildi |
| mozart-piano-concerto-21 | B | piano-concerto | 3 | Géza Anda / Géza Anda · Camerata Academica des Mozarteums Salzburg, 1961 | `1YEd3qxJpi1SGJFQFqcqKC` | Jean-Honoré Fragonard, *The Swing* | (Bellotto'dan değişti) | Birleştirildi |
| mozart-symphony-41 | C | symphony | 4 | Sir Charles Mackerras · Scottish Chamber Orchestra, 2008 | `0MNU78TPr4GbVdgRBsBL6L` | Hubert Robert, *The Obelisk* |  | Birleştirildi |
| mozart-clarinet-concerto | C | concerto | 3 | Thea King / Jeffrey Tate · English Chamber Orchestra, 1986 | `3UemBU0csyQmjZNyiU7c8R` | Joseph Wright of Derby, *Italian Landscape with Mountains and a River* |  | Birleştirildi |
| haydn-symphony-94 | C | symphony | 4 | Sir Colin Davis · Royal Concertgebouw Orchestra, 1982 | `2FNZ21rGfvoYz953jd6Tda` | Thomas Rowlandson, *Vauxhall Gardens* |  | Birleştirildi |
| haydn-string-quartet-op-76-3 | C | string-quartet | 4 | Takács Quartet, 1988 | `2ZNZLJE9S7WvMb23HVfRu4` | Johann Christian Brand, *Laxenburg from the Münkendorf Pavilion, looking south-west* |  | Birleştirildi |
| allegri-miserere | C | choral | 1 | Deborah Roberts / Peter Phillips, 2007 | `3i1pQhfdXnxiye2G4Qsvqn` | Jean-Auguste-Dominique Ingres, *Pope Pius VII in the Sistine Chapel* | ressam partide 2 kez | Birleştirildi |
| mahler-symphony-2 | D | symphony | 5 | Elisabeth Schwarzkopf / Otto Klemperer · Philharmonia Orchestra, 1963 | `1oXL9ONCxCGF7ctG6gnjrI` | Matthias Grünewald, *The Resurrection (Isenheim Altarpiece)* |  | Birleştirildi |
| mahler-symphony-3 | D | symphony | 6 | Martha Lipton / Leonard Bernstein · New York Philharmonic, 1962 | `4RvVQ968WriWyWv37Aa99q` | Giovanni Segantini, *Spring in the Alps* |  | Birleştirildi |
| mahler-symphony-9 | D | symphony | 4 | Sir John Barbirolli · Berliner Philharmoniker, 1964 | `3mb7iASlTwepiLCXODCnme` | Egon Schiele, *Small Tree in Late Autumn* | ressam partide 2 kez | Birleştirildi |
| bruckner-symphony-7 | D | symphony | 4 | Herbert von Karajan · Wiener Philharmoniker, 1990 | `641TZuqNeVpzvWgoy6Rbp2` | Wilhelm Leibl, *Three Women in Church* |  | Birleştirildi |
| brahms-symphony-1 | D | symphony | 4 | Michel Schwalbé / Karl Böhm · Berliner Philharmoniker, 1960 | `2F7kYdoAGsxxK9fSUiJixg` | Alexandre Calame, *The Lake of Thun* | (Menzel'den değişti) | Birleştirildi |
| brahms-violin-concerto | E | violin-concerto | 3 | Anne-Sophie Mutter / Herbert von Karajan · Berliner Philharmoniker, 1982 | `03xKUXxuRY5KuLs1gITc09` | Pál Szinyei Merse, *Picnic in May* |  | Birleştirildi |
| brahms-clarinet-quintet | E | chamber | 4 | Karl Leister · Amadeus Quartet, 1967 | `3mmIHrQZyvjAyngGlYBohA` | Vilhelm Hammershøi, *Interior with Young Woman Seen from the Back* | (Khnopff'tan değişti) | Birleştirildi |
| schubert-symphony-9 | E | symphony | 4 | Günter Wand · Berliner Philharmoniker, 1995 | `1zEbPxFC7m0Wj8ePFMkP8W` | Ferdinand Georg Waldmüller, *View of the Dachstein with the Hallstätter See from the Hütteneckalm near Ischl* |  | Birleştirildi |
| schubert-piano-sonata-21 | E | piano-sonata | 4 | Mitsuko Uchida, 1998 | `4X32yxTPmTbd7i03gfiSZN` | Johan Christian Dahl, *View of Dresden by Moonlight* | (Constable'dan değişti) | Birleştirildi |
| schubert-string-quartet-14 | E | string-quartet | 4 | Alban Berg Quartett, 1985 | `2IAsZa1NOpFYcY2A58eYME` | Egon Schiele, *Death and the Maiden* | ressam partide 2 kez | Birleştirildi |
| schubert-piano-quintet-trout | F | chamber | 5 | Clifford Curzon, 1958 | `06Aea2N1qVuld6Mw9Xz6XS` | Carl Spitzweg, *The Angler* |  | Birleştirildi |
| schumann-piano-concerto | F | piano-concerto | 3 | Radu Lupu / André Previn · London Symphony Orchestra, 1973 | `6nEpG19dgOSn6mB4ye4czG` | Carl Gustav Carus, *Barge Trip on the Elbe near Dresden* |  | Birleştirildi |
| mendelssohn-violin-concerto | F | violin-concerto | 3 | Anne-Sophie Mutter / Herbert von Karajan · Berliner Philharmoniker, 1981 | `5UMYDc7q9Z0GE2O8zlfRsg` | Adolph Menzel, *The Balcony Room* | ressam partide 3 kez | Birleştirildi |
| chopin-piano-concerto-1 | F | piano-concerto | 3 | Martha Argerich / Claudio Abbado · London Symphony Orchestra, 1968 | `4hQ5UonmIDouhBBEdRAwgC` | Wincenty Kasprzycki, *View of Morysinek* |  | Birleştirildi |
| chopin-piano-sonata-2 | F | piano-sonata | 4 | Maurizio Pollini, 1985 | `5U3T9zcqmcKSmxK7gJuBZB` | Gustave Courbet, *A Burial at Ornans* | ressam partide 2 kez | Birleştirildi |
| liszt-piano-sonata | G | piano-sonata | 1 | Krystian Zimerman, 1990 | `6XN6HweLAIZaY2bMKjWdHx` | Eugène Delacroix, *Christ Asleep during the Tempest* |  | Birleştirildi |
| grieg-piano-concerto | G | piano-concerto | 3 | Krystian Zimerman / Herbert von Karajan · Berliner Philharmoniker, 1981 | `1uOl9hgML9eVDhzWBypnfY` | Hans Gude and Adolph Tidemand, *Bridal Procession on the Hardangerfjord* |  | Birleştirildi |
| tchaikovsky-piano-concerto-1 | G | piano-concerto | 3 | Martha Argerich / Kirill Kondrashin · Bavarian Radio Symphony Orchestra, 1980 | `0PzMgnYqwwSwPnSijeSKSb` | Alexei Savrasov, *The Rooks Have Returned* |  | Birleştirildi |
| tchaikovsky-violin-concerto | G | violin-concerto | 3 | Hilary Hahn / Vasily Petrenko · Royal Liverpool Philharmonic Orchestra, 2008 | `5Iijzf1oBpKJwatVUb2P7o` | Gustave Courbet, *Panoramic View of the Alps, Les Dents du Midi* | ressam partide 2 kez | Birleştirildi |
| bruch-violin-concerto-1 | G | violin-concerto | 3 | Anne-Sophie Mutter / Herbert von Karajan · Berliner Philharmoniker, 1980 | `4tdB1YoK6zCRCnnxQPP4dE` | Anselm Feuerbach, *Iphigenia* |  | Birleştirildi |
| sibelius-symphony-5 | H | symphony | 3 | Colin Davis · Boston Symphony Orchestra, 1975 | `6oBoMHHi6wG9ZUpBHtkxgc` | Bruno Liljefors, *Mute Swans in Evening Flight* |  | Birleştirildi |
| sibelius-violin-concerto | H | violin-concerto | 3 | Hilary Hahn / Esa-Pekka Salonen · Swedish Radio Symphony Orchestra, 2008 | `0YHrFLfeGjkhEhYSCimYdB` | Akseli Gallen-Kallela, *Lake Keitele* |  | Birleştirildi |
| dvorak-cello-concerto | H | cello-concerto | 3 | Mstislav Rostropovich / Herbert von Karajan · Berliner Philharmoniker, 1968 | `0zwaTXZIMtLu2Y0vgbZDlQ` | Antonín Slavíček, *Birch Mood* |  | Birleştirildi |
| dvorak-string-quartet-12 | H | string-quartet | 4 | Pavel Haas Quartet, 2010 | `1DkQ0bddfB6GipbyL1DpvM` | Theodore Robinson, *Canal Scene* |  | Birleştirildi |
| elgar-cello-concerto | H | cello-concerto | 4 | Jacqueline du Pré / John Barbirolli · London Symphony Orchestra, 1965 | `5bE9xVTlVYE0N4147mcfb4` | Paul Nash, *We Are Making a New World* |  | Birleştirildi |
| vivaldi-four-seasons-spring | I | violin-concerto | 3 | Simon Standage / Trevor Pinnock · The English Concert, 1982 | `5tgFFNHTrkzpihDgYvpXEL` | Jean-Antoine Watteau, *Fêtes vénitiennes* |  | Birleştirildi |
| bach-brandenburg-concerto-5 | I | concerto | 3 | Trevor Pinnock / Trevor Pinnock · The English Concert, 1982 | `3N0xJn1EFWr5GLuslWdBQy` | Adolph Menzel, *The Flute Concert of Frederick the Great at Sanssouci* | ressam partide 3 kez | Birleştirildi |
| franck-violin-sonata | I | sonata | 4 | Itzhak Perlman, 1969 | `5HaEcNyN82ue3NHkqIBVQu` | Fernand Khnopff, *Listening to Schumann* | ressam partide 2 kez | Birleştirildi |
| tallis-spem-in-alium | I | choral | 1 | Peter Phillips, 1985 | `7BdRzzRBSBvoin2yIveUmn` | Jacopo Tintoretto, *Paradise* |  | Birleştirildi |
| smetana-vltava | I | orchestral | 1 | Rafael Kubelík · Boston Symphony Orchestra, 1971 | `2wnHlBJhXW9dQn5I2s8KxM` | Zdenka Braunerová, *Backwater of the Vltava at Roztoky* | (Schikaneder'den değişti) | Birleştirildi |
| debussy-la-mer | J | orchestral | 3 | Herbert von Karajan · Berliner Philharmoniker, 1964 | `7nI7p3GS9ENddrxwqk4LSJ` | Katsushika Hokusai, *Under the Wave off Kanagawa (The Great Wave)* |  | Birleştirildi |
| ravel-bolero | J | orchestral | 1 | Charles Dutoit · Orchestre symphonique de Montréal, 1982 | `07g1hfGy288giLhTE18BHS` | John Singer Sargent, *El Jaleo* |  | Birleştirildi |
| rimsky-korsakov-scheherazade | J | orchestral | 4 | Steven Staryk / Sir Thomas Beecham · Royal Philharmonic Orchestra, 1958 | `12gqWnkhIOszwytW6jKcMY` | Ivan Aivazovsky, *The Ninth Wave* |  | Birleştirildi |
| wagner-tristan-prelude-and-liebestod | J | orchestral | 2 | Jessye Norman / Herbert von Karajan · Wiener Philharmoniker, 1988 | `5HgHc9L8xbEpR8d9pCAgwa` | Rogelio de Egusquiza, *Tristan and Isolde (Death)* |  | Birleştirildi |
| shostakovich-string-quartet-8 | J | string-quartet | 5 | Pavel Haas Quartet, 2019 | `7hiFEJ0rzYwRqrexmLRsAI` | Bernardo Bellotto, *The Ruins of the Old Kreuzkirche in Dresden* |  | Birleştirildi |
