# DailyClassical – Lansman İçeriği (10 Senfoni)

DailyClassical iOS uygulaması için test içeriği. Dil: Türkçe. Her eser, tasarım brifindeki eser sayfasıyla aynı yapıyı izler.

## Önce bunu okuyun

- **Durak zamanları taslaktır.** Bölüm süreleri, referans kaydın Spotify albümündeki kesin parça süreleridir (Ekim 2026'da doğrulandı; bkz. content/research/). Dinleme durağı zamanları hâlâ yaklaşıktır (≈ ile işaretli) ve her eserde adı geçen referans kayda göre verilmiştir; content/research/retime-needed.md dosyasındaki duraklar yayımlamadan önce yeniden zamanlanmalıdır.
- **Spotify bağlantıları doğrulanmış albüm bağlantılarıdır.** `spotify_url` yalnızca doğrulanmış bir albüm bulunamadığında `null` (Mravinski'nin Çaykovski 6 kaydı).
- **Resimler dosya değil, referanstır.** Her eser, telif hakkı süresi dolmuş tek bir resmi adlandırır (sanatçı, başlık, yıl, koleksiyon). Görsel dosyaları, boyutları ve lisansları content/paintings.yaml dosyasındadır. Bir kayıtta (Maleviç, 10. eser) özel bir hak uyarısı var.
- **Sözlük işaretlemesi.** `[[term|metin]]` dokunulabilir bir sözlük terimini işaretler. `|` işaretinden önceki kısım, sözlükteki İngilizce anahtardır; sonraki kısım ekranda görünen Türkçe metindir. İşaretlenen her terim bu dosyanın sonundaki Sözlük'te tanımlanmıştır.
- **Durak çeşitleri.** Dinleme durakları bilerek üç biçimde verilir; böylece arayüz her biriyle test edilebilir: tek bir zaman (`≈ 4:30`), bir aralık (`≈ 9:30–10:30`) ve zamansız (`Gelişme ortası`, `Sona doğru`).

## Her eserin yapısı

1. Başlık: `## <n>. <Besteci> – <Başlık>`
2. Bir `yaml` meta bloğu: id, besteci, başlık, katalog, ton, yıl, süre, kanca, referans kayıt, ayrıca önerilenler, tablo
3. `### Genel bakış`: 3 ila 5 madde ve bölümlerin tek satırlık haritası
4. `### Bölümler`: genel bakış tablosu
5. Her bölüm için bir `###` kısmı: Özet, Ana fikirler, Dinleme durakları, Dikkat edilecekler (her bölümde dördü birden yok)
6. `### Bağlayan ipler`: eseri bir arada tutan fikirler

---

## 1. Mozart – Sol minör 40. Senfoni

```yaml
id: mozart-symphony-40
composer: Wolfgang Amadeus Mozart
composer_display: Wolfgang Amadeus Mozart
title: Sol minör 40. Senfoni
catalogue: K. 550
key: Sol minör
year: 1788
duration_min: 34
movement_count: 4
hook: Klasik zarafet, altında hızla atan bir nabız.
reference_recording:
  conductor: Sir Charles Mackerras
  orchestra: Scottish Chamber Orchestra
  label: Linn Records
  catalogue_number: "CKD 308"
  recorded: "3–9 August 2007"
  venue: City Halls, Glasgow
  release_year: 2008
  year: 2008
  spotify_url: https://open.spotify.com/album/0MNU78TPr4GbVdgRBsBL6L
also_recommended:
  - conductor: Nikolaus Harnoncourt
    orchestra: Concentus Musicus Wien
    label: Sony Classical
    catalogue_number: "88843026352"
    recorded: "12–14 October 2013"  # MusicWeb; classiquenews.com dates the sessions to Dec 2012
    venue: Musikverein, Vienna
    release_year: 2014
    year: 2014
    spotify_url: https://open.spotify.com/album/2rq5Iu6Ox0TCICD2N685Y6
painting:
  artist: Claude-Joseph Vernet
  title: Fırtınalı Denizde Bir Gemi Kazası
  year: 1773
  collection: Ulusal Galeri, Londra
  pairing_note: Aynı yıllar, fırtınaya ve çalkantıya aynı düşkünlük; hepsi kusursuz dengeli bir çerçevenin içinde tutuluyor.
```

### Genel bakış

- 1788 yazında, yaklaşık altı hafta içinde, 39. ve 41. Senfonilerle birlikte yazıldı. Bunlar Mozart'ın son üç senfonisiydi.
- Mozart'ın minör tonda yazdığı yalnızca iki senfoniden biri. İkisi de Sol minör.
- Trompet de yok, davul da. Bütün dram yaylılardan ve tahta üflemelilerden geliyor.
- Mozart sonradan partisyona klarnet ekledi; bu da eserin onun sağlığında çalındığını düşündürüyor.
- Tek cümleyle: hareket hâlinde bir kaygı (I), huzursuz bir sükûnet (II), sert bir dans (III), mutlu sonu reddeden bir koşu (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Molto allegro | Sol minör | 2/2 | 7:07 |
| II | Andante | Mi bemol majör | 6/8 | 13:25 |
| III | Menuetto: Allegretto | Sol minör | 3/4 | 4:03 |
| IV | Allegro assai | Sol minör | 2/2 | 9:27 |

### I. Molto allegro

**Özet.** Senfoni, sanki çoktan başlamış bir şeyin ortasına girmişiz gibi açılır: önce mırıldanan bir eşlik, ardından müziğin en ünlü ezgilerinden biri. Bölüm [[sonata form|sonat formu]]nda.

**Ana fikirler**

- 1. tema, telaş: kemanlarda tekrar tekrar duyulan, iç çeker gibi üç notalık bir figür (kısa, kısa, uzun); altında huzursuz viyolalar.
- 2. tema, kısa bir nefes: yaylılarla tahta üflemeliler arasında paylaşılan, yumuşak, kayan bir melodi; [[major|majör]] tonda.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Viyolalar bir an yalnız mırıldanır; sonra kemanlar iç çeken ezgiyle girer | 1. tema. Eşlik melodiden önce başlıyor; bu o dönem için çok alışılmadıktı |
| ≈ 0:45 | Bir duraksama, ardından yaylılarla tahta üflemeliler arasında dolaşan daha yumuşak bir melodi | 2. tema, Si bemol majörde. Bölümdeki tek sakin an |
| ≈ 1:50 | Açılış aynen geri gelir | [[exposition|Serim]] tekrarlanıyor |
| ≈ 3:40 | İç çeken ezgi tuhaf, uzak bir tonda belirir, sonra pes ve tiz yaylılar arasında bir oraya bir buraya atılır | [[development|Gelişme bölümü]]. Tema, geriye yalnızca üç notalık iç çekişi kalana dek parçalanıyor |
| ≈ 5:00 | Tahta üflemeliler aşağı doğru süzülür ve iç çeken ezgi sessizce geri döner | [[recapitulation|Yeniden serim]] |
| ≈ 6:00 | Yumuşak ikinci melodi geri gelir, ama daha karanlık | 2. tema artık Sol minörde. Önceki teselli geri alınıyor |
| Sona doğru | İç çekişin son, sessiz bir söylenişi, ardından kararlı akorlar | [[coda|Koda]] |

**Dikkat edilecekler**

1. Birinci temanın tamamı üç notadan doğar. O kısa-kısa-uzun ritmi kaç kez duyduğunuzu sayın.
2. 2. temanın ilk hâlini (majör, teselli eden) dönüşüyle (minör, boyun eğmiş) karşılaştırın. Aynı notalar, tam tersi etki.

### II. Andante

**Özet.** Sol minörden ayrılan tek bölüm. Sakin duyulur, ama bu sakinlik küçük, tedirgin parçalardan örülmüştür.

**Ana fikirler**

- Tekrarlanan notalardan oluşan ve katman katman giren bir tema: viyolalar, ikinci kemanlar, birinci kemanlar.
- Yaylılar ve tahta üflemeliler arasında titreşen, iki notalık minik çırpıntılar.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Pesten tize doğru üst üste binen tekrarlı notalar | Ana tema katman katman kendini kuruyor |
| ≈ 0:40 | Çalgılar arasında dolaşan, küçük iç çekişler gibi hızlı iki notalık çırpıntılar | İkinci fikir. Bundan sonra her şeyi süsleyecek |
| Orta | Tekrarlı notalar ısrarcı hâle gelir, armoni kararır | [[development|Gelişme bölümü]]. Sakin yüzey çatlıyor |
| ≈ 8:00 | Katmanlı açılış geri döner | [[recapitulation|Yeniden serim]] |

**Dikkat edilecekler**

1. Bu çırpıntı figürü, birinci bölümdeki iç çekişin bir akrabası.

### III. Menuetto: Allegretto

**Özet.** Yalnızca adı [[minuet|menuet]] olan bir menuet. Kimse bununla dans edemezdi: sert, köşeli ve birbiriyle çatışan çizgilerle dolu.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Beklenmedik yerlerde vurgular taşıyan ağır, uzun adımlı bir ezgi | Menuet. Cümleler alışılmış dört yerine üç ölçü uzunluğunda; bu da dengesini hep bozuyor |
| ≈ 0:40 | Tiz ve pes çalgılar aynı ezgiyle birbirini kovalar | Çizgiler [[canon|kanon]] hâlinde üst üste biniyor, birbirine sürtünüyor |
| ≈ 1:50 | Birden yumuşar: önce yaylılar, sonra tahta üflemeliler, sonra ışıldayan kornolar | [[trio|Trio]], Sol majörde. Senfoninin en huzurlu dakikası |
| ≈ 3:00 | Sert dans geri gelir | Menuet tekrarlanıyor |

### IV. Allegro assai

**Özet.** [[sonata form|Sonat formu]]nda, son ölçüye dek minörde kalan hızlı, tutkulu bir final.

**Ana fikirler**

- 1. tema: bir akorun içinden sessizce yukarı sıçrayış, ardından gürültülü bir patlamayla gelen cevap.
- 2. tema: kemanlarda pürüzsüz, şarkı söyler gibi bir çizgi.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yumuşak yükselen figür, gür cevap, yumuşak, gür | 1. tema. Yukarı doğru bir [[arpeggio|arpej]] üzerine kurulu bir soru-cevap |
| ≈ 1:00 | Kemanlarda daha sakin, şarkı gibi bir melodi; klarnet yankılar | 2. tema, Si bemol majörde |
| ≈ 3:50 | Bütün orkestra için, belirgin bir tonu olmayan, pürüzlü, tökezleyen bir pasaj | [[development|Gelişme bölümü]]nün başlangıcı. Birkaç saniye boyunca Mozart gamın neredeyse her notasına dokunuyor ve müziğin ayağı kayıyor |
| ≈ 4:10 | Yükselen figür kendi üstüne yığılır; çalgı grupları birbiri ardına girer | Bir [[fugato|fugato]] pasajı |
| ≈ 5:20 | Sessiz yükselen figür geri döner | [[recapitulation|Yeniden serim]] |
| Sona doğru | Şarkı gibi melodi yeniden, bu kez minörde; ardından çevik bir kapanış | Majöre dönüş yok. Senfoni başladığı kadar karanlık bitiyor |

**Dikkat edilecekler**

1. Gelişme bölümünün başındaki o pürüzlü pasaj, 18. yüzyıl müziğinin en tuhaf anlarından biridir. Yalnızca birkaç saniye sürer.

### Bağlayan ipler

- **Minör ton direniyor.** Dört bölümün üçü Sol minörde ve final alışılmış mutlu sonu reddediyor.
- **İç çekişler.** Kısa, inen figürler birinci, ikinci ve son bölümlerin içinden geçiyor.
- **Davulsuz dram.** Trompet ya da timpani olmadan gerilim yalnızca armoniden ve ritimden doğuyor.

---

## 2. Beethoven – Do minör 5. Senfoni

```yaml
id: beethoven-symphony-5
composer: Ludwig van Beethoven
composer_display: Ludwig van Beethoven
title: Do minör 5. Senfoni
catalogue: Op. 67
key: Do minör
year: 1808
duration_min: 33
movement_count: 4
hook: Dört nota ve onlardan kurulabilecek her şey.
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  catalogue_number: "2530 516 (LP); 447 400-2 (CD, with Symphony No. 7)"
  recorded: "29–30 March & 4 April 1974"
  venue: Musikverein, Vienna
  release_year: 1975
  year: 1975
  spotify_url: https://open.spotify.com/album/2aNAica8UZ1gPub5p1UYUe
also_recommended:
  - conductor: Teodor Currentzis
    orchestra: musicAeterna
    label: Sony Classical
    catalogue_number: "19075884972"
    recorded: "2018"
    venue: Konzerthaus, Vienna
    release_year: 2020
    year: 2020
    spotify_url: https://open.spotify.com/album/2zwzrmpYKqc1aVC0shtPmW
painting:
  artist: J. M. W. Turner
  title: "Kar Fırtınası: Hannibal ve Ordusu Alpleri Geçerken"
  year: 1812'de sergilendi
  collection: Tate Britain, Londra
  pairing_note: Karanlığın içinden bir mücadele, fırtınanın kenarında beliren ışık; senfoniden en fazla dört yıl sonra boyandı.
```

### Genel bakış

- İlk kez 22 Aralık 1808'de Viyana'da, Altıncı Senfoni ile Dördüncü Piyano Konçertosu'nun da tanıtıldığı dört saatlik bir konserde seslendirildi.
- Tek bir ritim (kısa, kısa, kısa, uzun) dört bölümün hepsinde karşımıza çıkar.
- Senfoni Do minörden Do majöre yolculuk eder: mücadeleden göz kamaştırıcı ışığa.
- Beethoven trombonları, pikoloyu ve kontrfagotu finale kadar saklar. Onların girişi müzikteki büyük varışlardan biridir.
- Tek cümleyle: mücadele (I), umut kıvılcımlarıyla teselli (II), hayalet gibi bir yürüyüş (III), zafer (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Allegro con brio | Do minör | 2/4 | 7:22 |
| II | Andante con moto | La bemol majör | 3/8 | 10:00 |
| III | Scherzo: Allegro | Do minör | 3/4 | 5:09 |
| IV | Allegro | Do majör | 4/4 | 10:51 |

### I. Allegro con brio

**Özet.** Klasik müziğin en ünlü açılışı ve bir tutumluluk dersi: bu [[sonata form|sonat formu]] bölümünün neredeyse her ölçüsü ilk dört notadan yapılmıştır.

**Ana fikirler**

- Slogan motif: kısa, kısa, kısa, uzun. Hem tema hem de eşlik odur.
- 2. tema: kemanlarda yumuşak, yükselen bir melodi; önce bir korno çağrısıyla haber verilir.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Dört notalık slogan motif iki kez, her seferinde uzatılan bir notayla biter | Slogan motif. Bir an tonu bile kestiremiyoruz |
| ≈ 0:20 | Slogan motif yaylılar boyunca üst üste yığılır, önce sessizce, sonra daha gür | 1. tema tamamen slogan motiften kuruluyor |
| ≈ 0:45 | Gür bir korno çağrısı, ardından kemanlarda ve tahta üflemelilerde yumuşak bir melodi | 2. tema. Altını dinleyin: çellolar ve kontrbaslar slogan motifi tıklatmayı sürdürüyor |
| ≈ 1:25 | Açılış geri gelir | [[exposition|Serim]] tekrarlanıyor |
| ≈ 2:50 | Slogan motif uzak tonlarda; ardından tahta üflemelilerle yaylılar arasında gidip gelen, giderek sessizleşen tek tek akorlar | [[development|Gelişme bölümü]]. Korno çağrısı önce iki notaya, sonra bir notaya iniyor |
| ≈ 4:15 | Slogan motif bütün orkestrayla gürleyerek geri döner | [[recapitulation|Yeniden serim]] |
| ≈ 4:35 | Her şey durur; yalnız, yakınır gibi bir obua kalır | Minik bir [[cadenza|kadans]]. Birkaç saniye zaman duruyor |
| ≈ 5:50 | Yeni, ayak sürüyen bir marş; müzik durmak bilmez | Neredeyse ikinci bir gelişme bölümü kadar uzun [[coda|koda]]. Kararlı biçimde minörde bitiyor |

**Dikkat edilecekler**

1. Slogan motifi arka plana doğru izleyin. Yumuşak ikinci temanın altında bile hiç kaybolmaz.
2. Obua solosu bölümdeki tek durgunluk anıdır.

### II. Andante con moto

**Özet.** İki tema sırayla gelir ve her seferinde biraz daha süslenir: bir dizi [[variation|varyasyon]]. Temalardan biri yumuşaktır; öteki finali müjdeleyen bir fanfara dönüşüp durur.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Viyolalar ve çellolar rahat, zarif bir melodi söyler | A teması |
| ≈ 1:00 | Klarnetler ve fagotlar yumuşakça başlar; sonra trompetler ve davullar parlak bir fanfarla patlar | B teması, birden Do majöre dönüyor. Gelecek zaferden bir an |
| ≈ 2:00 | A teması yeniden, şimdi akıcı notalarla | Birinci varyasyon |
| ≈ 4:00 | Aynısı daha hızlı notalarla; sonra kontrbaslar devralır | İkinci varyasyon |
| ≈ 6:00 | Yalnız tahta üflemeliler, tereddütlü | Bir ara bölüm |
| ≈ 7:00 | A teması bütün orkestrada | En görkemli söyleyiş |
| Sona doğru | Bir fagot ezgiyi daha hızlı bir tempoda alır | [[coda|Koda]] |

**Dikkat edilecekler**

1. B temasının fanfarı, kılık değiştirmiş hâlde slogan motifle aynı kısa-kısa-kısa-uzun ritmini kullanır.

### III. Scherzo: Allegro

**Özet.** Fısıltılarla başlayan, slogan motifle bölünen ve şimdiye dek yazılmış en ünlü geçişlerden biriyle biten bir [[scherzo|scherzo]].

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Çellolar ve kontrbaslar neredeyse sessizlikte yukarı doğru sürünür | Hayalet gibi bir açılış |
| ≈ 0:20 | Kornolar çekiç gibi vuran bir ritmi haykırır | Yine slogan motif: kısa, kısa, kısa, uzun |
| ≈ 1:45 | Çellolar ve kontrbaslar hırçınca koşuşturur; diğer yaylılar sırayla katılır | [[trio|Trio]], Do majörde; bir [[fugue|füg]] gibi başlıyor |
| ≈ 3:10 | Açılış bir gölge gibi döner: koparılan teller ve sessiz bir fagot | Scherzo [[pizzicato|pizzicato]] olarak geri geliyor, sanki birini uyandırmaktan korkar gibi |
| ≈ 4:20 | Uzun tutulan bir notanın üzerinde yumuşak bir davul vuruşu; kemanlar el yordamıyla yukarı tırmanır | Geçiş. Gerilim neredeyse bir dakika boyunca birikir, sonra hiç ara vermeden doğrudan finale akar |

### IV. Allegro

**Özet.** Do majör, tam orkestra ve şimdiye dek susmuş üç çalgı. Final, birinci bölüme verilen cevaptır.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yükselen üç notada bir bakır alevi | 1. tema. Trombonlar, pikolo ve kontrfagot ilk kez çalıyor |
| ≈ 0:35 | Kornolarda uzun adımlı bir ezgi | Aynı zafer havasında ikinci bir fikir |
| ≈ 1:00 | Kemanlarda hızlı, sekerek ilerleyen bir figür | 2. tema |
| Orta | Seken figür büyük bir doruğa kadar işlenir | [[development|Gelişme bölümü]] |
| Doruktan sonra | Ani sessizlik: scherzonun tıklayan ritmi geri döner | Üçüncü bölümün bir anısı. Karanlık hatırlanıyor, sonra yeniden süpürülüp atılıyor |
| Kısa süre sonra | Alev geri döner | [[recapitulation|Yeniden serim]] |
| Son 2 dakika | Müzik hızlanır; Do majör akoru üstüne akor | [[coda|Koda]]. Beethoven ana akoru, emin olmak istercesine çekiçliyor |

**Dikkat edilecekler**

1. Scherzonun finalin içinde geri dönmesi eşi görülmemiş bir şeydi. Zafer, gölge önce bir kez daha geldiği için daha anlamlı.

### Bağlayan ipler

- **Tek ritim.** Kısa-kısa-kısa-uzun her bölümde var.
- **Minörden majöre.** Bütün senfoni, Do minörden Do majöre tek bir yolculuk.
- **Saklanan güçler.** Final daha büyük duyulur, çünkü Beethoven bazı çalgıları ona saklamıştır.

---

## 3. Beethoven – Re minör 9. Senfoni, "Koral"

```yaml
id: beethoven-symphony-9
composer: Ludwig van Beethoven
composer_display: Ludwig van Beethoven
title: Re minör 9. Senfoni, "Koral"
catalogue: Op. 125
key: Re minör
year: 1824
duration_min: 67
movement_count: 4
hook: İnsan sesine ihtiyaç duyduğunu keşfeden senfoni.
reference_recording:
  conductor: Herbert von Karajan
  orchestra: Berliner Philharmoniker
  soloists:
    - { name: Gundula Janowitz, role: soprano }
    - { name: Hilde Rössel-Majdan, role: contralto }
    - { name: Waldemar Kmentt, role: tenor }
    - { name: Walter Berry, role: bass }
  chorus: Wiener Singverein (chorus master Reinhold Schmid)
  label: Deutsche Grammophon
  catalogue_number: "447 401-2 (Originals CD)"  # original 1963 LP number unverified
  recorded: "October 1962"
  venue: Jesus-Christus-Kirche, Berlin
  release_year: 1963
  year: 1963
  # Spotify metadata swaps the titles of tracks 3 and 4 (track 3 "IVa. Presto" is really the Adagio).
  spotify_url: https://open.spotify.com/album/1xrUldRtz5tcUQ6KrIOS2e
also_recommended:
  - conductor: Ferenc Fricsay
    orchestra: Berliner Philharmoniker
    soloists:
      - { name: Irmgard Seefried, role: soprano }
      - { name: Maureen Forrester, role: contralto }
      - { name: Ernst Haefliger, role: tenor }
      - { name: Dietrich Fischer-Dieskau, role: baritone }
    chorus: Chor der St. Hedwigs-Kathedrale Berlin (chorus master Karl Forster)
    label: Deutsche Grammophon
    catalogue_number: "463 626-2 (CD)"
    recorded: "December 1957, January & April 1958"
    venue: Jesus-Christus-Kirche, Berlin
    release_year: 1958
    year: 1958
    spotify_url: https://open.spotify.com/album/6ZNetkvZd0EsHIqYxCRMQA
painting:
  artist: Philipp Otto Runge
  title: Sabah (ilk versiyon), Küçük Sabah olarak da bilinir  # müze: "Der Morgen (erste Fassung)", HK-1016
  year: 1808
  collection: Hamburger Kunsthalle, Hamburg
  pairing_note: Beethoven'ın kendi kuşağından, ışığa ve yeni bir başlangıca dair parıl parıl bir görüntü; finaldeki neşe ilahisiyle tam bir eş.
```

### Genel bakış

- İlk kez 7 Mayıs 1824'te Viyana'da seslendirildi. O sırada artık sağır olan Beethoven'ın alkışları görebilmesi için onu seyirciye doğru çevirmek gerekti.
- Şarkıcılara yer veren ilk büyük senfoni. Final, Friedrich Schiller'in "Neşeye Övgü" şiirini besteler.
- Ortadaki bölümlerin sırası tersine çevrilmiştir: hızlı [[scherzo|scherzo]] ikinci, yavaş bölüm üçüncü sırada gelir.
- Final, neşe teması bulunmadan önce, önceki bölümlerin her birini alıntılayıp reddederek başlar.
- Tek cümleyle: kaostan yaratılış (I), vahşi bir enerji (II), derin bir huzur (III), şarkıyla biten bir arayış (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Allegro ma non troppo, un poco maestoso | Re minör | 2/4 | 15:29 |
| II | Molto vivace – Presto | Re minör | 3/4 | 11:04 |
| III | Adagio molto e cantabile | Si bemol majör | 4/4 | 16:30 |
| IV | Presto – Allegro assai (korolu final) | Re minörden Re majöre | çeşitli | 24:01 |

### I. Allegro ma non troppo, un poco maestoso

**Özet.** Müzik sanki hiçlikten biçimleniyor: boş, oyuk bir titreşim, düşen parçacıklar, ardından muazzam güçte bir tema. Devasa bir [[sonata form|sonat formu]] bölümü.

**Ana fikirler**

- Titreşim: yaylılarda çıplak, boş tınlayan bir uğultu; ne majör ne minör.
- 1. tema: bütün orkestranın birlikte çaldığı, aşağı doğru çarpıp düşen pürüzlü bir çizgi.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Sessiz, oyuk bir titreşim; içinden küçük parçacıklar düşer | Açılış. Akort yapan bir orkestra gibi ya da biçim almakta olan bir dünya gibi |
| ≈ 0:35 | Parçacıklar toplanır ve [[unison|unison]] hâlinde gürleyerek düşer | 1. tema, fortissimo |
| ≈ 2:45 | Tahta üflemelilerde sıcak, yumuşak cümleler | İkinci tema grubu, majör tonda. Neşe ezgisinin biçimine dair ilk ipucu |
| ≈ 4:50 | Oyuk titreşim geri döner | [[development|Gelişme bölümü]] başlıyor. Bir tekrar gibi duyuluyor, ama kısa sürede başka yerlere gidiyor |
| ≈ 8:30 | Titreşim bir kükreme olarak geri gelir: gürleyen davulların üzerinde tam orkestra | [[recapitulation|Yeniden serim]]. Fısıltı olan şey artık bir felaket; üstelik majör tonda, bu da onu daha az değil, daha çok korkutucu yapıyor |
| ≈ 13:00 | Pes yaylılar sürünen bir figürü durmadan tekrar tekrar öğütür | [[coda|Koda]], bir cenaze alayı gibi |
| Son ölçüler | 1. tema son bir kez, unison | Hiç teselli sunmayan bir son |

**Dikkat edilecekler**

1. İlk saniyeleri ≈ 8:30'daki durakla karşılaştırın. Aynı müzik, iki zıt uçta.

### II. Molto vivace – Presto

**Özet.** Tek bir sıçrayan ritimle ilerleyen, davulların solist olduğu bir [[scherzo|scherzo]].

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Çekiçle vurulmuş gibi üç sıçrama; ikincisini timpani tek başına çalar | Dikkat çağrısı. Anlatılana göre ilk seslendirmede seyirci burada alkışladı |
| ≈ 0:10 | Bir yaylı grubundan ötekine yayılan, sessiz, seğirten bir ezgi | Sıçrayan ritim üzerine kurulu bir [[fugato|fugato]] |
| Scherzonun ortası | Davullar gürültüyle, tek başlarına araya girip durur | Beethoven timpaniyi hem komik hem şiddetli bir solo ses olarak kullanıyor |
| ≈ 4:30 | Hareketli bir fagotun üzerinde, obualarda ve klarnetlerde pürüzsüz, halk ezgisi gibi bir melodi | [[trio|Trio]], Re majörde. Trombonlar senfoniye burada giriyor |
| Trionun ardından | Seğirten müzik geri döner | Scherzo tekrarlanıyor |
| Son saniyeler | Trio yeniden başlar ve kesilir | Şakacı bir son |

### III. Adagio molto e cantabile

**Özet.** Senfoninin durgun merkezi. İki melodi sırayla gelir; birincisi her dönüşünde daha zengin süslenir.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yaylılarda yavaş bir ilahi; tahta üflemeliler her cümlenin sonunu yankılar | A teması |
| ≈ 2:45 | İkinci kemanlarda ve viyolalarda akıcı, biraz daha hızlı bir melodi | B teması, daha parlak bir tonda |
| ≈ 4:30 | İlahi geri döner; kemanlar etrafına süslemeler örer | A temasının birinci [[variation|varyasyon]]u |
| Orta | Bir korno tek başına, açıkta, yavaş bir gam çalar | Dördüncü korno için ünlü bir solo |
| ≈ 10:00 | İlahi, akan notalardan oluşan uzun, süzülen çizgilerle | En dolgun varyasyon |
| ≈ 12:30 ve kısa süre sonra yeniden | Trompetler ve davullar sert bir fanfarla araya girer | Rüya iki kez, sanki bir uyandırma çağrısıyla bölünüyor. Her seferinde sükûnet geri geliyor |

### IV. Finale

**Özet.** Birkaç sahneden oluşan bir dram: kaos, geçmişin içinde bir arayış, basit bir ezginin keşfi ve sonunda insan sesleri. Biçimi kendisinden önceki hiçbir şeye benzemez.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Üflemeliler ve davullardan sert, çatışan bir patlama | "Dehşet fanfarı" |
| ≈ 0:10 | Çellolar ve kontrbaslar tek başına, sözsüz konuşan bir şarkıcı gibi | Çalgısal bir [[recitative|resitatif]] |
| ≈ 1:00–2:40 | I., II. ve III. bölümlerden kısa alıntılar; her birini kontrbaslar keser | Geçmiş deneniyor ve reddediliyor |
| ≈ 3:00 | Çellolar ve kontrbaslar çok sessizce basit bir ezgi çalar | Neşe teması ilk kez, eşliksiz duyuluyor |
| ≈ 3:45–6:00 | Ezgi tekrarlanır; her seferinde daha çok çalgıyla, sonunda tam orkestraya ulaşır | Üç [[variation|varyasyon]] |
| ≈ 6:20 | Dehşet fanfarı yeniden; ardından solo bir bariton | "Ey dostlar, bu sesler değil!" Herhangi bir Beethoven senfonisinde duyulan ilk sözler |
| ≈ 7:20 | Önce bariton, sonra koro neşe temasını söyler | Neşeye Övgü başlıyor |
| ≈ 9:40 | "vor Gott" sözlerinde uzun tutulan devasa bir akor | İlk büyük doruk; ardından sessizlik |
| ≈ 10:00 | Büyük davul ve fagottan güm güm vuruşlar; pikolo, üçgen ve ziller; bir tenor söyler | Bir "Türk" marşı: neşe teması neşeli bir askerî bando olarak |
| ≈ 11:40 | Orkestra tek başına, hızlı ve iç içe geçmiş | Orkestral bir [[fugue|füg]] |
| ≈ 13:00 | Tam koro ve orkestra neşe temasıyla patlar | En ünlü söyleyiş |
| ≈ 13:50 | Erkek sesleri ve trombonlarla geniş, ağırbaşlı yeni bir tema | "Kucaklaşın, ey milyonlar". İkinci, ilahi gibi bir fikir |
| ≈ 16:00 | Tiz, fısıltılı, titreşen akorlar | "Yıldızların ötesinde oturuyor olmalı O". Finalin mistik kalbi |
| ≈ 17:30 | Sopranolar neşe temasını söylerken altolar aynı anda ağırbaşlı temayı söyler | İki fikri birleştiren çifte [[fugue|füg]] |
| ≈ 20:30 | Dört solist tek başına, yavaş ve süslü; soprano çok yükseğe tırmanır | Vokal bir [[cadenza|kadans]] |
| Son dakika | Her şey çılgınca hızlanır | Prestissimo kapanış |

**Dikkat edilecekler**

1. Neşe teması neredeyse tamamen adım adım, komşu notalarla ilerler. Herkes söyleyebilir; asıl mesele de bu.
2. Final, senfoninin açılış fikrini tekrarlar: basit bir şey, neredeyse sessizlikten başlayıp katman katman büyür.

### Bağlayan ipler

- **Hiçlikten her şeye.** Hem birinci bölüm hem de neşe teması bir fısıltıyla başlar ve tam orkestraya kadar büyür.
- **Ret ve keşif.** Final önceki bölümleri açıkça bir kenara iter; çalgılar artık yetmediğinde sözler gelir.
- **Re minörden Re majöre.** Beşinci'de olduğu gibi senfoni, karanlıktan aydınlığa bir yolculuktur.

---

## 4. Schubert – Si minör 8. Senfoni, "Bitmemiş"

```yaml
id: schubert-symphony-8
composer: Franz Schubert
composer_display: Franz Schubert
title: Si minör 8. Senfoni, "Bitmemiş"
catalogue: D. 759
key: Si minör
year: 1822
duration_min: 28
movement_count: 2
hook: İki bölüm ve hiçbir eksik yok.
reference_recording:
  conductor: Günter Wand
  orchestra: Berliner Philharmoniker
  label: RCA Red Seal
  catalogue_number: "09026 68314 2"
  recorded: "28–29 March 1995 (live)"  # booklet; Apple/Spotify metadata say Dec 1994
  venue: Philharmonie, Berlin
  release_year: 1995
  year: 1995
  spotify_url: https://open.spotify.com/album/1zEbPxFC7m0Wj8ePFMkP8W
also_recommended:
  - conductor: Carlos Kleiber
    orchestra: Wiener Philharmoniker
    label: Deutsche Grammophon
    catalogue_number: "2531 124 (LP); 415 601-2 (CD)"
    recorded: "11–15 September 1978"
    venue: Musikverein, Vienna
    release_year: 1979
    year: 1979
    spotify_url: https://open.spotify.com/album/2RF2WYWqoaiZzLewXG6Fe6
painting:
  artist: Caspar David Friedrich
  title: Meşe Ormanındaki Manastır
  year: 1809–1810
  collection: Alte Nationalgalerie, Berlin
  pairing_note: Eksik olduğu için daha da dokunaklı bir yıkıntı; senfoninin açılışındaki o sessiz, kış gibi ruh hâliyle.
```

### Genel bakış

- Schubert 1822'de iki tam bölüm yazdı ve üçüncüsünün taslağını çıkardı, sonra bıraktı. Nedenini kimse bilmiyor.
- El yazması onlarca yıl bir arkadaşının yanında kaldı. İlk seslendirme 17 Aralık 1865'te, Schubert'in ölümünden 37 yıl sonra yapıldı.
- İki bölüm de üçlü ölçüde ve benzer bir hızda; yine de gece ile gündüz kadar farklı hissettirirler.
- Schubert her şeyden önce bir şarkı bestecisiydi. Burada orkestra şarkı söylüyor ve şarkılar durmadan bölünüyor.
- Tek cümleyle: tehdit altında bir şarkı (I), huzursuz bir barış (II).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Allegro moderato | Si minör | 3/4 | 15:26 |
| II | Andante con moto | Mi majör | 3/8 | 12:45 |

### I. Allegro moderato

**Özet.** Kontrbaslarda karanlık bir cümle, huzursuz bir titreşim ve Schubert'in yazdığı en güzel iki melodi. Bölüm [[sonata form|sonat formu]]nda ve dramını, melodilerin ne kadar acımasızca kesildiğinden alıyor.

**Ana fikirler**

- Slogan motif: yalnız çellolar ve kontrbaslar için pes, kıvrılan bir cümle.
- 1. tema: titreşen kemanların üzerinde obua ve klarnet için yakınır gibi bir melodi.
- 2. tema: çellolarda sıcak, salınan bir ezgi. Klasik müziğin en tanınmış melodilerinden biri.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Çellolar ve kontrbaslar tek başına, çok sessiz, aşağı doğru kıvrılarak | Slogan motif. Aklınızda tutun; ileride hıncını alırcasına geri dönecek |
| ≈ 0:20 | Koparılan kontrbasların üzerinde tedirgin, titreşen kemanlar; obua ve klarnet birlikte söyler | 1. tema |
| ≈ 1:15 | Kornolar ve fagotlar tek bir uzun notayı tutar; hava aydınlanır | Bir menteşe. Tek bir tutulan nota müziği yeni bir tona taşıyor |
| ≈ 1:25 | Çellolar yumuşak, salınan bir melodi söyler; kemanlar devralır | 2. tema, Sol majörde |
| ≈ 2:00 | Melodi cümlenin ortasında durur. Bir ölçü sessizlik. Ardından şiddetli akorlar | İlk kesinti |
| ≈ 3:40 | Karanlık slogan motif geri döner | [[exposition|Serim]] tekrarlanıyor |
| ≈ 7:20 | Slogan motif yeniden, daha da aşağı inerek; sonra bütün orkestra boyunca yükselip trombonlarla devasa bir doruğa varır | [[development|Gelişme bölümü]] neredeyse tamamen slogan motif üzerine kurulu. Sessiz açılış cümlesi bir çığlığa dönüşüyor |
| ≈ 10:30 | Titreşim ve obua melodisi geri döner | [[recapitulation|Yeniden serim]] |
| ≈ 14:00 | Slogan motif son bir kez, ardından sert kapanış akorları | [[coda|Koda]] |

**Dikkat edilecekler**

1. Ünlü çello ezgisi gelişme bölümünde hiç görünmez. Schubert ona dokunmaz, yalnızca karanlık slogan motifle çalışır.
2. ≈ 2:00'deki sessizliğe kulak verin. Herhangi bir nota kadar önemlidir.

### II. Andante con moto

**Özet.** Dışarıdan dingin, tahta üflemeliler için uzun solo çizgilerle; ama sükûnet gür, yürüyüş havasındaki ara bölümlerle bozulur.

**Ana fikirler**

- 1. tema: kemanlarda sessiz bir melodi; önce kornolar ve aşağı inen koparılmış kontrbaslar hazırlar.
- 2. tema: yumuşakça atan yaylıların üzerinde klarnet, sonra obua için uzun, yalnız bir solo.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Kornolar ve fagotlar, adım adım inen koparılmış kontrbaslar, ardından sakin bir keman melodisi | 1. tema |
| ≈ 1:10 | Trombonlarla birden gelen gür, uzun adımlı bir pasaj | İlk sarsıntı. Kontrbaslar yürürken üflemeliler yukarıdan seslenir |
| ≈ 2:45 | Kemanlar tek başına, yumuşak notalardan ince bir çizgi tutar | Neredeyse hiçlikten bir köprü |
| ≈ 3:00 | Hafifçe vuruş dışı çalan yaylıların üzerinde uzun, arayış dolu bir klarnet solosu; obua majörde cevap verir | 2. tema. Eşlik [[syncopation|senkop]] kullanıyor; süzülen havasını buna borçlu |
| ≈ 4:10 | Klarnetin melodisini tam orkestra fortissimo kapar | İkinci sarsıntı |
| ≈ 6:00 | Açılış geri döner | İlk yarı, tonlar değiştirilerek tekrarlanıyor |
| Son 2 dakika | Kemanlar tek başına uzak bir tona süzülüp geri gelir; müzik durulur | [[coda|Koda]]. Pek çok dinleyiciye gerçek bir sonuç gibi gelen huzurlu bir bitiş |

**Dikkat edilecekler**

1. İki bölüm de aynı kalıbı izler: bir şarkı, bir kesinti, yeniden şarkı. Bu ortak biçim, iki bölümün birlikte eksiksiz hissettirmesinin bir nedenidir.

### Bağlayan ipler

- **Güce karşı şarkı.** İki bölümde de lirik melodiler şiddetli patlamalarla kesilir.
- **Sessiz trombonlar.** Schubert trombonları çoğu zaman yalnızca güç için değil, yumuşakça, karanlık bir renk olarak kullanır.
- **Bitmemiş, ama bütün.** İkinci bölüm, son gibi hissettiren bir sükûnetle biter.

---

## 5. Berlioz – Fantastik Senfoni

```yaml
id: berlioz-symphonie-fantastique
composer: Hector Berlioz
composer_display: Hector Berlioz
title: Fantastik Senfoni
catalogue: Op. 14
key: Do majör
year: 1830
duration_min: 55
movement_count: 5
hook: Beş sahnede anlatılan, bir cadılar sabbatında sona eren bir saplantı.
reference_recording:
  conductor: Sir Colin Davis
  orchestra: Royal Concertgebouw Orchestra
  label: Philips
  catalogue_number: "6500 774 (LP); 464 692-2 (CD)"
  recorded: "January 1974"
  venue: Concertgebouw, Amsterdam
  release_year: 1974
  year: 1974
  spotify_url: https://open.spotify.com/album/28YsKbzTM2Sa8A7hcoT2D0
also_recommended:
  - conductor: John Eliot Gardiner
    orchestra: Orchestre Révolutionnaire et Romantique
    label: Philips
    catalogue_number: "434 402-2"
    recorded: "September 1991"
    venue: Ancien Conservatoire, Paris
    release_year: 1993
    year: 1993
    spotify_url: https://open.spotify.com/album/0NbwU9876DOibCxRopIVlu
painting:
  artist: Francisco Goya
  title: Cadılar Sabbatı ya da Büyük Teke
  year: 1820–1823
  collection: Museo del Prado, Madrid
  pairing_note: Senfoniden on yıl içinde boyandı; Berlioz'un finalinde sahneye koyduğu aynı kâbus toplantısı.
```

### Genel bakış

- İlk kez 5 Aralık 1830'da Paris'te seslendirildi. Berlioz 26 yaşındaydı. Beethoven öleli yalnızca üç yıl olmuştu.
- Bu bir [[programme music|programlı müzik]] eseri: Berlioz dinleyicilere yazılı bir öykü dağıttı. Umutsuzca âşık genç bir sanatçı afyon alır ve rüya görür.
- Sevgili tek bir melodiyle temsil edilir: [[idée fixe|idée fixe]]. Bu melodi her bölümde yeni bir kılıkla geri döner.
- İlham kaynağı, Berlioz'un aktris Harriet Smithson'a duyduğu kendi saplantısıydı; onunla sonradan evlendi.
- Orkestra hem devasa hem yeniydi: iki arp, çanlar, dört timpani, bir İngiliz kornosu, cırtlak sesli küçük bir klarnet.
- Tek cümleyle: özlem (I), bir balo (II), kırlar (III), darağacı (IV), sabbat (V).

### Bölümler

| | Başlık | Tempo | Süre |
| --- | --- | --- | --- |
| I | Rêveries – Passions | Largo – Allegro agitato e appassionato assai | 15:16 |
| II | Un bal (Bir balo) | Valse: Allegro non troppo | 6:12 |
| III | Scène aux champs (Kırlarda bir sahne) | Adagio | 17:05 |
| IV | Marche au supplice (Darağacına yürüyüş) | Allegretto non troppo | 6:47 |
| V | Songe d'une nuit du sabbat (Bir cadılar sabbatı rüyası) | Larghetto – Allegro | 9:52 |

### I. Rêveries – Passions

**Özet.** Sanatçı belirsiz bir özlemin içinde savrulur, sonra sevgiliyi görür. O andan itibaren kadının melodisi peşini bırakmayacaktır.

**Ana fikirler**

- [[idée fixe|İdée fixe]]: flüt ve kemanlar için, dalga dalga yükselip geri düşen uzun, hasret dolu bir melodi.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yumuşak tahta üflemeliler, ardından uzun duraklamalarla ilerleyen yavaş, hüzünlü bir melodide [[muted|sordinli]] kemanlar | Giriş: hayaller ve melankoli |
| ≈ 5:10 | Tedirgin, kalp atışı gibi bir eşliğin üzerinde flüt ve kemanlar birlikte uzun, huzursuz bir melodi çalar | İdée fixe. Sevgili beliriyor |
| Orta | Melodi parçalara ayrılır; yaylılar dalgalar hâlinde inip çıkar; ani sessizlikler | Kıskançlık ve çalkantı |
| ≈ 11:30 | İdée fixe bütün orkestrada alev alev parlar | Tutkunun doruğu |
| Son dakika | Yavaş, yumuşak, org gibi akorlar | Berlioz burayı "dinî bir duyguyla" diye işaretler. Sanatçı teselli arıyor |

### II. Un bal

**Özet.** Bir baloda ışıl ışıl bir vals. Kalabalığın ortasında onu yeniden görür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Titreşen yaylılar ve dalgalanan arplar, giderek parlaklaşır | Balo salonu netleşiyor |
| ≈ 0:35 | Kemanlar zarif bir valse kapılır | Dans |
| ≈ 2:00 | Altta dans mırıldanarak sürerken flüt ve obua idée fixe'i, bu kez vals ölçüsünde çalar | Kadın dansçıların arasında beliriyor |
| ≈ 3:20 | Vals daha dolgun ve daha hızlı geri döner | Girdap yeniden başlıyor |
| Sona doğru | Solo bir klarnet idée fixe'i hatırlatır; ardından baş döndürücü bir bitiş | Dans onu alıp götürmeden önce son bir bakış |

### III. Scène aux champs

**Özet.** Kırlarda bir akşam. İki çoban birbirine seslenir; sanatçı huzur bulur, sonra şüphe geri döner. En uzun ve en durgun bölüm.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Bir İngiliz kornosu seslenir; uzaktan (sahne dışından) bir obua cevap verir | Bir vadinin iki yakasından kaval çalan iki çoban |
| ≈ 2:00 | Flüt ve kemanlar için geniş, sakin bir melodi | Kırların huzuru |
| ≈ 7:00–9:00 | Öfkeli, homurdanan pes yaylılara karşı tahta üflemelilerde idée fixe, bir patlamaya kadar yükselir | "Ya beni aldatıyorsa?" Fırtına onun içinde |
| ≈ 11:00 | Sakin melodi süslenmiş olarak geri döner | Huzur, ama sarsılmış |
| Son 2 dakika | İngiliz kornosu yeniden seslenir. Cevap yok. Yalnızca dört timpaniden yumuşak gümbürtüler | Uzak gök gürültüsü, yalnızlık, sessizlik. Döneminin en özgün orkestrasyon sayfalarından biri |

### IV. Marche au supplice

**Özet.** Rüya kâbusa döner. Sevgilisini öldürmüştür, mahkûm edilir ve giyotine yürütülür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Boğuk davullar ve homurdanan kornolar | Alay yaklaşıyor |
| ≈ 0:25 | Çellolar ve kontrbaslar uzun bir gamda aşağı doğru adımlar; kasvetli ve ağır | 1. tema: mahkûmun yürüyüşü. Çok geçmeden bir fagot alaycı bir karşı ezgi ekler |
| ≈ 1:40 | Bakırlarda ve üflemelilerde alev alev, kabadayı bir ezgi | 2. tema: kalabalığın marşı, parlak ve acımasız |
| Son 30 saniye | Solo bir klarnet idée fixe'e şefkatle başlar | "Son bir aşk düşüncesi" |
| Hemen ardından | Gürleyen bir akor; koparılan teller; davul gümbürtüleri ve bakırlar | Bıçak düşer, baş yuvarlanır, kalabalık kükrer |

**Dikkat edilecekler**

1. Klarnet, kesilmeden önce idée fixe'in yalnızca ilk birkaç notasını çalabilir. Bütün öykü dört saniyede.

### V. Songe d'une nuit du sabbat

**Özet.** Kendini, kendi cenazesi için toplanmış bir cadılar sabbatında görür. Sevgili gelir, ama artık grotesk bir parodidir. Senfoninin en radikal müziği.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Ürkütücü tiz yaylılar, pes hırıltılar, tahta üflemelilerde kıkırdayan kaymalar | Cadıların ve ruhların toplanması |
| ≈ 1:30 | Ciyaklayan küçük bir klarnet sarsak, trilli bir cig dansı çalar | İdée fixe bayağılaşmış hâlde. Sevgili bir cadıya dönüşmüş; orkestra onu kükreyerek karşılıyor |
| ≈ 3:00 | Derinden çanlar çalar | Cenaze çanları |
| ≈ 3:25 | Tubalar ve fagotlar yavaş, kadim bir ilahiyi okur; bakırlar onu daha hızlı tekrarlar; tahta üflemeliler alay eder | [[Dies irae|Dies irae]], ölüler için okunan Orta Çağ ilahisi, parodi edilerek |
| ≈ 5:10 | Pes yaylılarda ayak vurarak ilerleyen bir dans ezgisi başlar ve yukarı doğru yayılır | Cadıların halka dansı, bir [[fugue|füg]] olarak yazılmış |
| ≈ 8:00 | Yaylılarda dans, bakırlarda Dies irae, aynı anda | İki tema birleşiyor |
| ≈ 8:40 | Kemanlardan kuru, takırdayan bir ses | [[Col legno|Col legno]]: çalıcılar tellere yayın tahtasıyla vurur; takırdayan kemikler gibi |
| Son dakika | Bakırlar ve davullarla alev alev bir bitiş | Âlem, hiç de masum duyulmayan bir Do majörle sona eriyor |

### Bağlayan ipler

- **Tek melodi, beş maske.** İdée fixe'i izleyin: soylu (I), dans eden (II), kaygılı (III), yarıda kesilen (IV), grotesk (V).
- **Öykü olarak ses.** Sahne dışındaki obua, gök gürültüsü olarak dört timpani, çanlar, col legno: her etkinin öyküde bir anlamı var.
- **Yeni bir senfoni türü.** Açıkça bir öykü anlatan bir senfoni, bütün yüzyıl için bir dönüm noktasıydı.

---

## 6. Brahms – Mi minör 4. Senfoni

```yaml
id: brahms-symphony-4
composer: Johannes Brahms
composer_display: Johannes Brahms
title: Mi minör 4. Senfoni
catalogue: Op. 98
key: Mi minör
year: 1885
duration_min: 40
movement_count: 4
hook: Trajediyle biten, Bach'tan ödünç alınmış bir ezgi üzerine kurulu bir sonbahar senfonisi.
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  catalogue_number: "2532 003 (LP); 400 037-2 (CD); 457 706-2 (The Originals)"
  recorded: "12–15 March 1980"
  venue: Musikverein, Vienna
  release_year: 1981
  year: 1981
  spotify_url: https://open.spotify.com/album/0m6drSxGp5CSwgIn4J8upn
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Gewandhausorchester Leipzig
    label: Decca
    catalogue_number: "478 5344"
    recorded: "9–10 May 2013"
    venue: Gewandhaus, Leipzig
    release_year: 2013
    year: 2013
    spotify_url: https://open.spotify.com/album/0D8FPBeT77NdsjiwuSd103
painting:
  artist: Arnold Böcklin
  title: Ölüler Adası (üçüncü versiyon)
  year: 1883
  collection: Alte Nationalgalerie, Berlin
  pairing_note: Senfoniden iki yıl önce boyandı; aynı ağırbaşlı durgunluk, teselli eden bir sonu aynı reddediş.
```

### Genel bakış

- Brahms'ın son senfonisi; 1884 ve 1885 yazlarında Avusturya Alpleri'nde yazıldı. İlk seslendirmeyi 25 Ekim 1885'te Meiningen'de kendisi yönetti.
- Final bir [[passacaglia|passacaglia]]: bir Bach kantatasından uyarlanmış sekiz ölçülük bir tema üzerinde otuz kısa varyasyon. Eski bir Barok biçimiydi; burada Romantik bir trajedi için kullanılıyor.
- Döneminin bir senfonisi için alışılmadık biçimde, minör tonda ve tesellisiz biter.
- Açılış teması, aşağı inen üçlülerden oluşan bir zincirle kurulmuştur; bu aralık kalıbı en sonda geri döner.
- Tek cümleyle: teslimiyet (I), soylu bir alay (II), hoyrat bir coşku (III), kader (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Allegro non troppo | Mi minör | 2/2 | 12:50 |
| II | Andante moderato | Mi majör | 6/8 | 11:24 |
| III | Allegro giocoso | Do majör | 2/4 | 6:07 |
| IV | Allegro energico e passionato | Mi minör | 3/4 | 9:11 |

### I. Allegro non troppo

**Özet.** Giriş yok: senfoni bir iç çekişin ortasında başlar. Yumuşak bir melankoliyle başlayıp felaketle biten bir [[sonata form|sonat formu]] bölümü.

**Ana fikirler**

- 1. tema: önce inen sonra çıkan nota çiftleriyle kemanlar; nefes verip alır gibi.
- 2. tema: tahta üflemelilerde gururlu, ritmik bir çağrı; ardından çellolar ve kornolar için geniş, ateşli bir melodi.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Kemanlar iki notalık cümlelerle iç çeker; tahta üflemeliler her birini bir an sonra yankılar | 1. tema. Notalar aşağı inen üçlülerden bir zincir çiziyor |
| ≈ 1:20 | Üflemelilerde keskin, fanfar gibi bir ritim; ardından çellolar ve kornolar geniş, tutkulu bir melodi söyler | 2. tema |
| ≈ 3:00 | Tahta üflemelilerde yumuşak fanfarlarla fısıltılı, gizemli yaylı dalgacıkları | [[exposition|Serim]] kapanmadan önce zamanın askıda kaldığı bir an |
| ≈ 4:00 | Açılıştaki iç çekişler aynen geri gelir, sonra yeni bir yöne döner | [[development|Gelişme bölümü]], tekrarmış gibi yaparak başlıyor |
| ≈ 7:10 | Açılış notaları tahta üflemelilerde çok yavaş uzatılarak, aralarında sessiz yaylı dalgacıklarıyla | [[recapitulation|Yeniden serim]] sinsice içeri süzülüyor. İç çekişler normal hızına dönene kadar eve vardığınızı fark etmeyebilirsiniz |
| ≈ 11:00 | İç çeken tema, şimdi fortissimo; kontrbaslar kemanları kovalar | [[coda|Koda]]. Yumuşak tema öfkeye dönüşmüş, [[canon|kanon]] hâlinde |
| Son ölçüler | Gümbürdeyen timpani | Trajik bir kapanış |

**Dikkat edilecekler**

1. ≈ 7:10'daki ağır çekim dönüş, Brahms'ın en ince dokunuşlarından biridir. Başa sarıp iki kez dinleyin.

### II. Andante moderato

**Özet.** Yalnız kornolarla açılan, eski zamanlardan bir tat taşıyan yavaş bir bölüm. İkinci teması Brahms'ın yazdığı en sıcak şeyler arasındadır.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Kornolar tek başına, ağırbaşlı, arkaik tınlayan bir çağrıda | Açılış eski bir kilise dizisi kullanıyor; uzak, efsanevi rengini buna borçlu |
| ≈ 0:30 | Klarnetler, koparılan tellerin üzerinde ezgiyi devralır | 1. tema; [[pizzicato|pizzicato]] ayak sesleriyle yavaş bir alay gibi |
| ≈ 3:30 | Çellolar geniş, ışıldayan bir melodi söyler; kemanlar yukarıdan süsler | 2. tema |
| ≈ 5:30 | Alay daha çalkantılı hâlde geri döner ve sert bir doruğa yükselir | Bölümün ortası |
| ≈ 8:00 | Işıldayan melodi yeniden, şimdi bütün zengin yaylı grubunda | Duygusal zirve. Yaylılar daha fazla sıcaklık için birçok partiye bölünüyor |
| Son dakika | Korno çağrısı geri döner | [[coda|Koda]] |

### III. Allegro giocoso

**Özet.** Brahms'ın bir senfoniye koyduğu en gürültülü, en şamatacı bölüm; bir üçgen bile var. Trajediden önce bir hoyrat mizah patlaması.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Tam orkestra gürleyerek girer; bir üçgen şıngırdar | 1. tema. Pikolo, kontrfagot ve üçgen bu bölüm için orkestraya katılıyor |
| ≈ 0:50 | Kemanlarda daha yumuşak, zarif bir ezgi | 2. tema |
| ≈ 3:10 | Tempo düşer; kornolar ve tahta üflemeliler sanki uzaktan, yumuşakça çalar | Kısa, sessiz bir ara bölüm |
| ≈ 4:00 | Açılış patlayarak geri döner | Dönüş ve ayak vuran bir kapanış |

### IV. Allegro energico e passionato

**Özet.** Sekiz akor, ardından hiç ara vermeden onlar üzerine otuz [[variation|varyasyon]]. Tema her zaman oradadır; bazen en üstte, bazen baslara gömülü.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Üflemelilerde ve bakırlarda adım adım tırmanan sekiz sert akor | Tema. Trombonlar senfonide ilk kez çalıyor |
| ≈ 0:15–1:20 | Koparılan teller ve davullar; ardından tahta üflemelilerde kaskatı bir ezgi | İlk varyasyonlar. Sekiz nota basa iniyor |
| ≈ 1:30 | Yaylılar coşkun, tutkulu bir melodiyle devralır | Varyasyonlar daha lirik ve daha ivedi hâle geliyor |
| ≈ 3:00 | Nabız yavaşlar. Solo bir flüt, yalnız ve duraksayarak | Flüt varyasyonu. Senfoninin en yalnız anı |
| ≈ 4:20 | Trombonlar ve kornolarda yumuşak, ilahi gibi akorlar | Mi majörde bir [[chorale|koral]]. Kısa bir huzur görüntüsü |
| ≈ 5:20 | Sekiz akor başlangıçtaki gibi gürleyerek geri döner | İkinci yarı başlıyor. Rüya bitti |
| ≈ 6:00–8:00 | Giderek şiddetlenen varyasyonlar: bıçak gibi vurgular, hücum eden gamlar | Sona doğru atılış |
| Sona doğru | Tahta üflemeliler ve yaylılar inen nota çiftleriyle birbirine cevap verir | Birinci bölümdeki inen üçlüler zinciri geri dönüyor |
| ≈ 8:20 | Tempo hızlanır | [[coda|Koda]]. Mi minörde, uzlaşmadan bitiyor |

**Dikkat edilecekler**

1. Her varyasyonda yükselen sekiz notayı duymaya çalışın. Onları izleyebildiğinizde bölüm kesintisiz tek bir çizgiye dönüşür.

### Bağlayan ipler

- **İnen üçlüler.** İlk temanın aralık kalıbı son varyasyonlarda geri döner.
- **Eski biçimler, yeni duygu.** İkinci bölümde bir kilise dizisi, finalde Barok bir passacaglia.
- **Teselli yok.** Senfoni Mi minörde başlar ve Mi minörde biter.

---

## 7. Çaykovski – Si minör 6. Senfoni, "Patetik"

```yaml
id: tchaikovsky-symphony-6
composer: Pyotr Ilyich Tchaikovsky
composer_display: Pyotr İlyiç Çaykovski
title: Si minör 6. Senfoni, "Patetik"
catalogue: Op. 74
key: Si minör
year: 1893
duration_min: 46
movement_count: 4
hook: Zaferle değil, sessizlikle biten bir senfoni.
reference_recording:
  conductor: Teodor Currentzis
  orchestra: musicAeterna
  label: Sony Classical
  catalogue_number: "88985404352"
  recorded: "9–15 February 2015"
  venue: Funkhaus Nalepastraße, Berlin
  release_year: 2017
  year: 2017
  spotify_url: https://open.spotify.com/album/4K1qDDbKEYVGF4jQIZyyJI
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: Deutsche Grammophon
    catalogue_number: "138 659 (LP); 477 5911 (CD, Nos. 4–6)"
    recorded: "November 1960"
    venue: Musikverein, Vienna
    release_year: 1961
    year: 1960
    # Official DG album not found on Spotify; third-party reissues of unconfirmed identity exist.
    spotify_url: null
painting:
  artist: Isaac Levitan
  title: Ebedî Huzurun Üzerinde
  year: 1894
  collection: Devlet Tretyakov Galerisi, Moskova
  pairing_note: Senfoniden bir yıl sonra boyandı; durgunluğun ve ölümlülüğün uçsuz bucaksız bir Rus manzarası.
```

### Genel bakış

- Şubat ile Ağustos 1893 arasında yazıldı ve yeğeni Vladimir Davıdov'a ithaf edildi.
- İlk kez 28 Ekim 1893'te St. Petersburg'da, Çaykovski'nin yönetiminde seslendirildi. Besteci dokuz gün sonra öldü.
- Rusça başlık "acınası" değil, "tutkulu" ya da "duygu dolu" anlamına gelir.
- Çaykovski alışılmış sırayı tersine çevirir: heyecan verici marş üçüncü, yavaş bölüm en sonda gelir.
- Senfoninin gizli bir öyküsü olduğunu söyledi ve bunu hiç açıklamadı.
- Tek cümleyle: mücadele ve özlem (I), hafifçe aksayan zarif bir dans (II), sahte bir zafer (III), kabulleniş ve sönüp gidiş (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Adagio – Allegro non troppo | Si minör | 4/4 | 19:42 |
| II | Allegro con grazia | Re majör | 5/4 | 7:43 |
| III | Allegro molto vivace | Sol majör | 12/8 ve 4/4 | 8:36 |
| IV | Finale: Adagio lamentoso | Si minör | 3/4 | 10:21 |

### I. Adagio – Allegro non troppo

**Özet.** Senfoninin kalbi. Karanlıkta doğan huzursuz bir tema, Çaykovski'nin yazdığı en ünlü, en sıcak melodiyle karşılaşır. Bölüm [[sonata form|sonat formu]]nda: temalar tanıtılır, çatışmaya sokulur ve geri getirilir.

**Ana fikirler**

- 1. tema, huzursuzluk: kısa, tırmanan, soru soran bir [[motif|motif]]. Önce tek başına bir fagotta ağır çekimde, sonra viyolalarda hızlı ve tedirgin.
- 2. tema, özlem: [[muted|sordinli]] yaylılarda aşağı doğru süzülen geniş bir melodi. İlk aydınlık an.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Karanlık, oyuk kontrbasların üzerinde tek bir fagot | Giriş. 1. temanın tohumu, ağır çekimde |
| ≈ 2:00 | Viyolalar aynı fikri hızlı ve kaygılı çalar; yaylılar ve tahta üflemeliler cümleleri birbirine paslar | Ana kısım 1. temayla başlıyor. Gerilim adım adım tırmanıyor |
| ≈ 4:30 | Her şey durulur; sordinli yaylılarda geniş, şarkı gibi bir melodi | 2. tema. Senfoninin imza ezgisi |
| ≈ 6:30 | Atan bir yaylı eşliğinin üzerinde flüt ve fagot sohbet eder | 2. temanın ortası, biraz daha canlı |
| ≈ 8:00 | Ünlü melodi tam orkestrayla geri döner | 2. tema en dolgun hâlinde |
| ≈ 9:30–10:30 | Solo bir klarnet melodiyi neredeyse hiçliğe kadar söndürür | Çaykovski burada pppppp yazar; partisyondaki en sessiz işaret |
| ≈ 10:30 | Ani, şiddetli bir çarpma; ardından hızlı, birbirini kovalayan yaylı pasajları | [[development|Gelişme bölümü]]. 1. tema paramparça ediliyor |
| Gelişme ortası | Trombonlarda ve trompetlerde yavaş, ilahi gibi bir cümle | Rus Ortodoks cenaze ayininden bir alıntı |
| ≈ 12:30–14:30 | 1. tema fırtınanın içinde geri döner; trombonlar yuvarlanan timpaninin üzerinde adım adım iner | [[recapitulation|Yeniden serim]] ve doruk iç içe geçiyor. En trajik an |
| ≈ 15:00 | Ünlü melodi daha parlak hâlde geri gelir | 2. tema, şimdi Si majörde: aynı ezgi, ama hak edilmiş bir huzur gibi |
| ≈ 18:00 | Yaylılar yavaşça inen bir gamı koparır; üstünde sakin bir bakır [[chorale|koral]] | [[coda|Koda]], yaylılar [[pizzicato|pizzicato]]. Fırtına geçti; son huzurlu, ama aşağıyı işaret ediyor |

**Dikkat edilecekler**

1. Girişteki fagot fikri ile Allegro'daki viyola teması aynı notalardır; yalnızca hız değişir.
2. 2. tema üç kez gelir. Orkestrasyonun her seferinde nasıl değiştiğini karşılaştırın.
3. Sondaki inen pizzicato gamı, finaldeki "inen çizgi"nin ilk ipucudur.

### II. Allegro con grazia

**Özet.** Vals gibi duyulur, ama vals değildir: ölçüde üç yerine beş vuruş vardır. Sonuç, hafifçe aksayan zarif bir danstır.

**Ritmi nasıl duymalı.** "Bir-iki, bir-iki-üç" diye sayın. Her ölçü 2 + 3. Birkaç ölçü sonra kulağınız bu salınıma alışır.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Koparılan tellerin üzerinde çellolarda akıcı, gülümseyen bir melodi | Ana kısım, Re majörde. Birinci bölümden sonra bir nefes |
| ≈ 1:00–2:30 | Melodi tahta üflemelilere ve kemanlara geçer, süslenerek tekrarlanır | Ana kısım genişliyor |
| ≈ 2:30 | Hava kararır: kemanlarda iç çeken, inen cümleler. Altta davullar ve kontrbaslar her vuruşta hiç değişmeyen tek bir notayı tekrarlar | Orta kısım, Si minörde. O ısrarcı nota bir [[pedal note|pedal sesi]]; kalp atışı gibi duyuluyor |
| ≈ 5:00 | İlk melodi geri döner | Ana kısım geri geliyor |
| ≈ 6:30 | Kalp atışı notası geri döner; melodi parçalara ayrılıp söner | [[coda|Koda]]. Orta kısmın gölgesi dansın üzerine düşüyor |

**Dikkat edilecekler**

1. Orta kısmın inen cümleleri, birinci bölümün 2. temasının ve finalin akrabalarıdır. Hepsi aşağı doğru süzülür.
2. Tekrarlanan tek nota, senfoninin en sonunda kontrbaslarda geri dönecek.

### III. Allegro molto vivace

**Özet.** Fısıltı gibi bir hareket, sekiz dakika boyunca büyüyerek bütün orkestranın marşına dönüşür. Bir final gibi duyulur ve dinleyiciler sık sık burada alkışlar. Ama bu bir tuzaktır; gerçek son hâlâ ileride.

**Ana fikirler**

- [[scherzo|Scherzo]] katmanı: yaylılarda ve tahta üflemelilerde hızlı, hafif, hiç durmayan üçlemeler.
- Marş katmanı: kesik bir ritimle sert, sıçrayan bir ezgi. Önce yalnızca parça parça görünür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yaylılarda hafif, hızlı üçlemeler; obuada bir marş kırıntısı | Scherzo başlıyor. Marş yalnızca bir ima |
| ≈ 0:30–2:00 | Kırıntı çalgıdan çalgıya dolaşır; bakırlar katılır | Parçalar birikiyor |
| ≈ 2:00 | Klarnetler marşı baştan sona, hâlâ hafifçe çalar | Marşın ilk tam söyleyişi |
| ≈ 4:00 | Hızlı üçlemeler yeniden başlar; uzun, sabırlı bir [[crescendo|crescendo]] | İkinci tur. Gerilim depolanıyor |
| ≈ 5:30–6:00 | Gamlar yaylılarla üflemeliler arasında aşağı yukarı süzülür; ardından ziller ve büyük davulla marş | Marş tam orkestrada. Bölümün varmak istediği yer |
| Son dakika | Çekiç gibi akorlar ve hücum eden inen gamlar | [[coda|Koda]]. Zafer mi, yoksa zorlama bir şey mi? Karar sizin |

**Bu kayıtta.** Currentzis marşı görkemli değil, tehditkâr ve sert çalıyor; bu da finaldeki çöküşü daha inandırıcı kılıyor.

**Dikkat edilecekler**

1. En parlak anında bile marş inen gamlarla doludur. Finaldeki iniş, zaferin içine gizlenmiştir.

### IV. Finale: Adagio lamentoso

**Özet.** Marşın gürültüsünün hemen ardından bu ağıt gelir; senfoninin gerçek sonu. İnen iki melodi de yükselmeye çalışır; ikisi de çöker; müzik kontrbaslarda sönüp gider.

**Ana fikirler**

- 1. tema, ağıt: yaylılarda aşağı doğru adımlayan bir feryat.
- 2. tema, teselli: yine inen bir melodi, ama sıcak; yumuşakça atan kornoların üzerinde.

**Gizli bir numara.** Açılış melodisini tek bir çalgı çalmaz. Notaları birinci ve ikinci kemanlar arasında sırayla paylaştırılmıştır; ezgi ancak ikisi birleşince var olur. Melodi sonradan geri döndüğünde Çaykovski onu düpedüz birinci kemanlara verir.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yaylılarda inen bir feryat; her cümlenin sonunda fagotlar derinlere batar | 1. tema |
| ≈ 2:30 | Kornolarda yumuşak, vuruş dışı bir nabız; üstünde yaylılarda sıcak, inen bir melodi | 2. tema. Sessizce başlıyor ve her tekrarda büyüyor |
| ≈ 4:00–5:00 | Melodi bir doruğa ulaşır, sonra sert inen gamlarla dağılır; bir sessizlik | Tesellinin ilk çöküşü |
| ≈ 5:00 | Ağıt daha hızlı ve daha umutsuz hâlde geri döner ve büyük bir doruğa tırmanır | 1. temanın dönüşü ve bölümün zirvesi |
| ≈ 7:00–7:30 | Boğuk, tıkanmış korno notaları; ardından bir gonga tek, yumuşak bir vuruş | Dönüm noktası. Tam-tam bütün senfonide yalnızca bu bir kez çalıyor |
| Hemen ardından | Trombonlar ve tubada yavaş, ilahi gibi akorlar | Bir cenaze [[chorale|korali]] |
| ≈ 8:00 | 2. tema, kontrbaslarda atan tek bir notanın üzerinde, bu kez minörde geri döner | Teselli eden melodi bir ağıta dönüşmüş. Nabız yavaşlıyor |
| Son dakika | Yalnızca çellolar ve kontrbaslar, hiçliğe doğru sönerek | Senfoni başladığı yerde, en pes ve karanlık seslerde bitiyor |

**Dikkat edilecekler**

1. 2. temanın iki hâli: majörde umutlu, minörde teslim olmuş. Aynı notalar, tam tersi anlam.
2. Kontrbaslardaki nabız, ikinci bölümdeki kalp atışı notasına cevap verir. Burada yavaşlar ve durur.
3. Son notadan sonraki sessizlik eserin bir parçasıdır. Hemen bir sonraki parçaya geçmeyin.

### Bağlayan ipler

- **İnen çizgi.** Senfonideki önemli melodilerin neredeyse hepsi aşağı doğru hareket eder.
- **Nabız.** İkinci bölümde tekrarlanan tek nota, sonda kontrbaslarda geri döner, yavaşlar ve durur.
- **Karanlıktan karanlığa.** Senfoni en pes çalgılarda başlar ve biter.
- **Uç dinamikler.** Partisyon pppppp'den fff'ye kadar uzanır.
- **Ters çevrilmiş sıra.** Zafer "yanlış" yerde gelir; bu yüzden final, açığa çıkan bir gerçek gibi hissettirir.

---

## 8. Dvořák – Mi minör 9. Senfoni, "Yeni Dünya'dan"

```yaml
id: dvorak-symphony-9
composer: Antonín Dvořák
composer_display: Antonín Dvořák
title: Mi minör 9. Senfoni, "Yeni Dünya'dan"
catalogue: Op. 95
key: Mi minör
year: 1893
duration_min: 42
movement_count: 4
hook: Çek bir bestecinin Amerika'dan kartpostalı; mürekkebinde sıla özlemi var.
reference_recording:
  conductor: Rafael Kubelík
  orchestra: Berliner Philharmoniker
  label: Deutsche Grammophon
  catalogue_number: "2530 415 (LP); 447 412-2 (CD, Nos. 8 & 9)"
  recorded: "June 1972"
  venue: Jesus-Christus-Kirche, Berlin
  release_year: 1973
  year: 1973
  # DG box "Dvorak: The 9 Symphonies"; No. 9 is tracks I–IV. No standalone album playable in TR.
  spotify_url: https://open.spotify.com/album/45AlGtE9Il2BmnisrbU1no
also_recommended:
  - conductor: István Kertész
    orchestra: London Symphony Orchestra
    label: Decca
    catalogue_number: "SXL 6291 (LP); 475 7517 (CD, Nos. 8 & 9)"
    recorded: "1966"  # month disputed (Jan vs Nov–Dec 1966)
    venue: Kingsway Hall, London
    release_year: 1967
    year: 1966
    spotify_url: https://open.spotify.com/album/7fIXzx0sCyE9YvmOW8hZ7Z
painting:
  artist: Albert Bierstadt
  title: Sierra Nevada'da, Kaliforniya
  year: 1868
  collection: Smithsonian Amerikan Sanat Müzesi, Washington, D.C.
  pairing_note: Uçsuz bucaksız, ışıl ışıl Amerikan manzarası, Avrupa'da yetişmiş bir sanatçının hayal ettiği hâliyle; Dvořák'ın seslerle yaptığı da tam olarak buydu.
```

### Genel bakış

- 1893'ün ilk yarısında, Dvořák Ulusal Müzik Konservatuvarı'nı yönetirken New York'ta yazıldı. İlk kez 16 Aralık 1893'te Carnegie Hall'da seslendirildi.
- Dvořák, Afro-Amerikan spiritüellerine ve Longfellow'un "Hiawatha'nın Şarkısı" şiirine hayrandı; ortadaki iki bölüme bu şiirin ilham verdiğini söyledi.
- Yavaş bölümün ünlü ezgisi Dvořák'ın kendisine aittir. "Goin' Home" sözleri, neredeyse otuz yıl sonra bir öğrencisi tarafından eklendi.
- Önceki bölümlerin temaları sonrakilerde durmadan geri döner ve hepsi finalde buluşur.
- Tek cümleyle: varış ve enerji (I), sıla özlemi (II), ormanda bir dans (III), her şeyin bir araya gelişi (IV).

### Bölümler

| | Tempo | Ton | Ölçü | Süre |
| --- | --- | --- | --- | --- |
| I | Adagio – Allegro molto | Mi minör | 2/4 | 9:24 |
| II | Largo | Re bemol majör | 4/4 | 13:00 |
| III | Scherzo: Molto vivace | Mi minör | 3/4 | 8:05 |
| IV | Allegro con fuoco | Mi minör | 4/4 | 11:48 |

### I. Adagio – Allegro molto

**Özet.** Kara kara düşünen yavaş bir giriş, ardından her biri bir halk şarkısı kadar akılda kalıcı üç temalı bir [[sonata form|sonat formu]] bölümü.

**Ana fikirler**

- 1. tema: yukarı sıçrayıp geri düşen bir korno çağrısı. Her bölümde geri dönecek.
- 2. tema: flüt ve obua için köylü havasında, hafifçe hüzünlü bir dans.
- 3. tema: solo flüt için pes ve sıcak, yumuşak bir ezgi; pek çok kişi bunu "Swing Low, Sweet Chariot" spiritüelinin bir yankısı olarak duyar.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Sessiz pes yaylılar; ardından kornolardan, yaylılardan ve davullardan ani sarsıntılar | Yavaş giriş |
| ≈ 2:00 | Kornolar yukarı sıçrayıp geri düşer; tahta üflemeliler zıplayan bir ritimle cevap verir | 1. tema |
| ≈ 3:10 | Vızıldayan bir bas üzerinde flüt ve obuada halk ezgisi gibi bir melodi | 2. tema |
| ≈ 4:10 | Solo bir flüt, pes ve yumuşak | 3. tema |
| ≈ 4:50 | Flüt ezgisi ve korno çağrısı, parçalanıp elden ele dolaşır | [[development|Gelişme bölümü]] |
| ≈ 6:30 | Korno çağrısı geri döner | [[recapitulation|Yeniden serim]] |
| Son dakika | Trompetler ve trombonlar korno çağrısını alev alev haykırır | [[coda|Koda]] |

### II. Largo

**Özet.** Bütün müziğin en sevilen melodilerinden biri; üstelik spot ışığına pek çıkmayan bir çalgı söylüyor: İngiliz kornosu.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Bakırlarda tuhaf armonilerden geçen yavaş, ağırbaşlı akorlar | Yedi akordan bir kapı |
| ≈ 0:45 | [[muted|Sordinli]] yaylıların üzerinde İngiliz kornosu | Ana tema |
| ≈ 4:40 | Flüt ve obuada biraz daha hızlı, yakınır gibi bir ezgi; altta koparılan kontrbaslar yürür | Orta kısım, minörde. Dvořák bunu "Hiawatha"daki ormanda bir cenazeyle ilişkilendirdi |
| ≈ 8:00 | Obua ve flüt parlak parlak cıvıldar; müzik kabarır; trombonlar birinci bölümün korno çağrısını gürleyerek çalar | Ani bir gün ışığı görüntüsü ve birinci bölüm araya giriyor |
| ≈ 9:15 | İngiliz kornosu melodisi geri döner | Yeniden ana tema |
| ≈ 10:30 | Bir avuç solo yaylı ezgiyi devralır. Durur. Sessizlik. Yeniden dener | Melodi, sanki duygularına yenik düşmüş gibi iki kez bocalıyor |
| Son dakika | Ağırbaşlı bakır akorları; ardından yalnız kontrbaslar için yumuşak bir akor | Kapı kapanıyor |

**Dikkat edilecekler**

1. Sona doğrudaki duraklamalar partisyonda yazılıdır. O sessizlik, sıla özleminin ta kendisidir.

### III. Scherzo: Molto vivace

**Özet.** Üçgenli, hızlı, ritmik bir [[scherzo|scherzo]]; Dvořák'a göre "Hiawatha"daki düğün şölenindeki bir danstan esinlendi. Orta kısmı ise saf Bohemya.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Keskin akorlar ve bir davul figürü; ardından tahta üflemelilerde fırlayıp duran bir ezgi | Scherzo. Açılış, Beethoven'ın Dokuzuncu'sunun scherzosuna şapka çıkarıyor |
| ≈ 1:30 | Tempo gevşer, tahta üflemelilerde salınan bir melodiye dönüşür | Daha yumuşak ikinci bir fikir, majörde |
| ≈ 2:50 | Çellolar birinci bölümün korno çağrısını sessizce hatırlatır | Bir köprü |
| ≈ 3:10 | Trilli yaylılarla tahta üflemelilerde salınan, vals gibi bir ezgi | [[trio|Trio]]. Bu bir Amerikan değil, bir Çek köy dansı |
| ≈ 4:40 | Fırlayıp duran ezgi geri döner | Scherzo tekrarlanıyor |
| Son 30 saniye | Birinci bölümün korno çağrısı sönerek, ardından tek bir gür akor | [[coda|Koda]] |

### IV. Allegro con fuoco

**Özet.** Alev alev bir marş teması ve ardından büyük bir buluşma: önceki üç bölümün melodileri geri döner ve birbirine örülür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yaylılar ikişer nota hâlinde, giderek hızlanarak yukarı doğru ilerler | Kısa bir hız alma |
| ≈ 0:20 | Trompetler ve kornolar cesur bir marşı alev alev haykırır | 1. tema |
| ≈ 1:50 | Tek, yumuşak bir zil vuruşu | Zillerin bütün senfonide çaldığı tek nota |
| ≈ 2:00 | Titreşen yaylıların üzerinde bir klarnet uzun, şefkatli bir melodi söyler | 2. tema |
| ≈ 4:00 | Tahta üflemelilerde Largo ezgisi, scherzonun fırlayan ezgisi, birinci bölümün korno çağrısı | [[development|Gelişme bölümü]]. Önceki bölümler birbiri ardına geri geliyor |
| ≈ 6:30 | Marş, önce şaşırtıcı biçimde sessizce geri döner | [[recapitulation|Yeniden serim]] |
| ≈ 9:30 | Largo'yu açan ağırbaşlı akorlar, şimdi bakırlarda fortissimo | [[coda|Koda]] başlıyor |
| Son dakika | Marş ve birinci bölümün korno çağrısı aynı anda | Temalar birleşiyor |
| Son akor | Üflemeliler son akoru tutar ve hiçliğe doğru söndürür | Senfoni bir patlamayla değil, sönüp giderek bitiyor |

**Dikkat edilecekler**

1. Finalde geri dönen temaları sayın. Sona gelindiğinde dört bölümün hepsi oradadır.

### Bağlayan ipler

- **Korno çağrısı.** Birinci bölümün 1. teması her bölümde görünür.
- **İki yurt.** Amerikan ilhamı (spiritüeller, "Hiawatha") baştan sona Çek bir müzik aksanıyla.
- **Toplayan bir son.** Final, her bölümün ana temasını geri getirir.

---

## 9. Mahler – 5. Senfoni

```yaml
id: mahler-symphony-5
composer: Gustav Mahler
composer_display: Gustav Mahler
title: 5. Senfoni
catalogue: null
key: Do diyez minör (Re majörde biter)
year: 1902
duration_min: 75
movement_count: 5
hook: Bir cenaze marşından bir aşk şarkısına, oradan kahkahaya.
reference_recording:
  conductor: Leonard Bernstein
  orchestra: Wiener Philharmoniker
  soloists:
    - { name: Friedrich Pfeiffer, role: horn }
  label: Deutsche Grammophon
  catalogue_number: "423 608-2"
  recorded: "6–8 September 1987 (live)"
  venue: Alte Oper, Frankfurt am Main
  release_year: 1988
  year: 1988
  spotify_url: https://open.spotify.com/album/5ENEAfJFQNuvww1jxjcnbu
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Royal Concertgebouw Orchestra
    soloists:
      - { name: Peter Masseurs, role: trumpet }
      - { name: Jakob Slagter, role: horn }
    label: Decca
    catalogue_number: "458 860-2"
    recorded: "October 1997"
    venue: Concertgebouw, Amsterdam
    release_year: 1998
    year: 1998
    spotify_url: https://open.spotify.com/album/4HTScZKz8noAd4TU6rrqyY
painting:
  artist: Gustav Klimt
  title: Ölüm ve Yaşam
  year: 1910/11; 1912/13 ve 1915/16'da yeniden işlendi
  collection: Leopold Museum, Viyana
  pairing_note: "Mahler'in Viyana'sı tuvalde ve senfoninin kendi yolculuğu tek bir görüntüde: ölüm figüründen bir kucaklaşmaya."
```

### Genel bakış

- 1901 ve 1902 yazlarında yazıldı. Bu iki yaz arasında Mahler bir kanamadan neredeyse ölüyordu; Alma Schindler'le tanıştı ve onunla evlendi. İlk seslendirmeyi 18 Ekim 1904'te Köln'de kendisi yönetti.
- Beş bölüm üç kısımda toplanır: I. Kısım (1. ve 2. bölümler), II. Kısım (3. bölüm), III. Kısım (4. ve 5. bölümler).
- Yaylılar ve arp için yazılmış dördüncü bölüm Adagietto'nun, Alma'ya bir aşk mektubu olduğu yaygın biçimde düşünülür. "Venedik'te Ölüm" filmi sayesinde dünyaca ünlendi.
- Senfoninin tek bir ana tonu yok. Do diyez minörde başlar ve Re majörde biter.
- Tek cümleyle: yas (I), öfke (II), geri dönen hayat (III), aşk (IV), neşe (V).

### Bölümler

| | Başlık veya tempo | Ton | Süre |
| --- | --- | --- | --- |
| I | Trauermarsch (Cenaze marşı) | Do diyez minör | 14:35 |
| II | Stürmisch bewegt (Fırtınalı, en büyük şiddetle) | La minör | 15:01 |
| III | Scherzo | Re majör | 19:08 |
| IV | Adagietto | Fa majör | 11:18 |
| V | Rondo-Finale | Re majör | 15:00 |

### I. Trauermarsch

**Özet.** Solo bir trompetin açtığı bir cenaze alayı. Ölçülü marş iki kez keder patlamalarıyla parçalanır.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Solo bir trompet: üç kısa ve bir uzun nota, tırmanarak | Fanfar. Ritmi, Beethoven'ın Beşinci'sindeki slogan motifi hatırlatıyor |
| ≈ 0:30 | Tam orkestra gürleyerek girer | Alay başlıyor |
| ≈ 1:20 | Kemanlarda ve çellolarda yorgun, şarkı gibi bir melodi | Marş temasının kendisi |
| ≈ 5:30 | Ani bir patlama: trompet çalkalanan yaylıların üzerinde çığlık atar | İlk patlama. Mahler burayı "Birden daha hızlı. Tutkulu. Vahşi" diye işaretler |
| ≈ 7:30 | Trompet fanfarı, ardından tahta üflemelilerde marş | Alay yeniden yola koyuluyor |
| ≈ 10:30 | Yaylılarda daha sessiz, yas tutan bir melodi; bir doruğa kabarır ve çöker | İkinci ara bölüm |
| Son dakika | Fanfar önce trompette, sonra flütte söner; pes yaylılardan tek, yumuşak bir tok ses | Alay uzaklarda kayboluyor. Son nota [[pizzicato|pizzicato]] |

### II. Stürmisch bewegt

**Özet.** Birinci bölümün kederi öfkeye döner. Fırtınalar yavaş ağıtlarla nöbetleşir ve sona doğru bir zafer görüntüsü belirip kaybolur.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Hırlayan kontrbaslar, çığlık atan tahta üflemeliler | Fırtına |
| ≈ 1:30 | Tempo düşer; çellolar yavaş bir ağıt söyler | Birinci bölümün cenaze marşından bir melodi geri dönüyor |
| ≈ 4:30 | Yumuşak bir davul gümbürtüsünün üzerinde, çok sessiz, yalnız çellolar | Uzun, çıplak bir [[recitative|resitatif]]. Senfoninin en yalnız pasajı |
| Orta | Fırtına ve ağıt birbirinin sözünü kesip durur | İki ruh hâli üstünlük için çarpışıyor |
| ≈ 11:30 | Bakırlar parlak, görkemli bir ilahiyle çınlar | Re majörde bir [[chorale|koral]]. Bir an için zafer gelmiş gibi |
| ≈ 12:30 | İlahi ufalanır; fırtına geri döner, sonra parçalara dağılır | Görüntü tutunamıyor. Finalde geri gelecek |
| Son saniyeler | Sessiz kırıntılar ve yumuşak bir davul vuruşu | Bölüm buharlaşıp gidiyor |

### III. Scherzo

**Özet.** En uzun bölüm ve senfoninin menteşesi. Ölümden ve öfkeden sonra hayat, başrolde solo bir kornoyla, dev, dönen bir dans olarak geri gelir.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Dört korno seslenir; solo bir korno zıplayan bir köy dansını önden götürür | [[scherzo|Scherzo]] teması, gürbüz bir [[Ländler|ländler]]. Kornonun baştan sona bir [[obbligato|obligato]] partisi var |
| ≈ 2:30 | Yaylılarda daha yumuşak, daha zarif bir vals | Birinci trio. Köy terbiyesinden sonra şehir terbiyesi |
| ≈ 6:00 | Müzik durur; solo korno seslenir, diğerleri sessizliklerin ötesinden cevap verir | Dağların arasında yankılanır gibi korno çağrıları |
| ≈ 8:00 | Yaylılar utangaç, küçük bir valsi koparır | Çekingen ve içten bir [[pizzicato|pizzicato]] ara bölümü |
| ≈ 11:00 | Danslar geri döner ve üst üste yığılır | Mahler temalarını büyük bir kontrpuan ustalığıyla birleştiriyor |
| Son dakika | Tempo çılgınca hızlanır; tahta bir çırpıcı takırdar | Vahşi bir kapanış |

### IV. Adagietto

**Özet.** Yalnızca yaylılar ve arp. Nefesini tutuyormuş gibi, varacağı yere hep gecikerek ulaşan bir melodi.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Yavaş arp notaları; kemanlar havada asılı kalan bir melodiyle girer | Ana tema. Her cümle oraya ait olmayan bir notaya yaslanır, sonra çözülür |
| ≈ 4:00 | Arp susar; müzik daha huzursuz hâle gelir ve daha yükseğe tırmanır | Orta kısım, uzak tonlardan geçerek |
| ≈ 7:30 | Kemanlar büyük bir yükseklikten yavaşça aşağı kayar | Ana temaya geri dönen uzun bir [[glissando|glissando]] |
| ≈ 8:00 | Açılış melodisi arpla birlikte geri döner | Dönüş |
| Son dakika | Son bir kabarma ve yerine oturmak için acele etmeyen, uzun tutulan bir akor | Mümkün olduğunca geciktirilmiş son çözülme |

**Bu kayıtta.** Bernstein bölümü çok yavaş çalıyor. Başka şefler onu sekiz dakikanın altında çalar; o zaman bir ağıttan çok bir şarkı gibi duyulur.

### V. Rondo-Finale

**Özet.** Adagietto'nun son akoru henüz sönmüşken tek bir korno notası yeni bir dünyanın kapısını açar. Güneşli, hareketli bir [[rondo|rondo]], içi [[fugue|füg]]lerle dolu. Aşk şarkısı bir dans olarak geri döner ve kaybolan ilahi sonunda gelir.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Tek bir korno notası; ardından fagot, obua ve klarnet küçük cümleler paslaşır | Pastoral bir giriş. Bu kırıntılar bütün finalin yapı taşları |
| ≈ 1:00 | Kornolarda rahat, güler yüzlü bir melodi | Ana rondo teması |
| ≈ 1:50 | Çellolar hareketli, koşturan bir ezgiye başlar; diğer yaylılar sırayla devralır | Birinci [[fugue|füg]] |
| ≈ 3:20 | Yaylılarda zarif, ayağı hafif bir melodi | Adagietto teması, yavaş bir aşk şarkısından hızlı bir dansa dönüşmüş |
| Orta | Rondo teması, füg ve dans ezgisi her seferinde daha süslü biçimde dönüp dolaşır | Bölüm dalga dalga yükseliyor |
| ≈ 13:00 | Bakırlar görkemli ilahiyi çınlatır | İkinci bölümde çöken [[chorale|koral]] geri dönüyor ve bu kez ayakta kalıyor |
| Son dakika | Nefes nefese, hızlanan bir koşu | Bir cenazeyle başlayan senfoninin sonunda kahkaha |

### Bağlayan ipler

- **Uzun yolculuk.** Cenaze marşından neşeli finale, Do diyez minörden Re majöre.
- **Yolculuk eden temalar.** İkinci bölüm birinciden alıntı yapar; final Adagietto'yu dönüştürür; ikinci bölümde bir an görünen koral beşincide gerçekleşir.
- **Trompetin ritmi.** Üç kısa ve bir uzun nota; Beethoven'ın Beşinci'sine bilinçli bir yankı.

---

## 10. Şostakoviç – Re minör 5. Senfoni

```yaml
id: shostakovich-symphony-5
composer: Dmitri Shostakovich
composer_display: Dmitri Şostakoviç
title: Re minör 5. Senfoni
catalogue: Op. 47
key: Re minör
year: 1937
duration_min: 46
movement_count: 4
hook: Zafer dolu bir son mu, yoksa zorla tezahürat ettirilmenin sesi mi? Karar sizin.
reference_recording:
  conductor: Leonard Bernstein
  orchestra: New York Philharmonic
  label: Sony Classical (originally Columbia)
  catalogue_number: "MS 6115 (original stereo LP)"
  recorded: "20 October 1959"
  venue: Symphony Hall, Boston
  release_year: 1959
  year: 1959
  # 2017 Sony remaster of the 1959 recording (not the 1979 Tokyo album 3fiptp5ORRFfnoRzhjHALZ).
  spotify_url: https://open.spotify.com/album/00d6wTUJHGsrxPmbETXGWm
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: Erato
    catalogue_number: "2292-45752-2"
    recorded: "4 April 1984 (live)"
    venue: Large Hall of the Leningrad Philharmonia
    year: 1984
    # Warner album "Shostakovich: Symphonies Nos. 5 & 6", tracks 1–4. The Spotify page carries no
    # date: the 1984 Erato performance is identified by timing only (15:01 / 5:14 / 13:13 / 10:54
    # against the Erato 15:00 / 5:10 / 13:09 / 10:52).
    spotify_url: https://open.spotify.com/album/4n4zKOkzZSwuymCZ4XGxuk
painting:
  artist: Kazimir Malevich
  title: Sarı Gömlekli Gövde (Karmaşık Önsezi)
  year: c. 1932
  collection: Devlet Rus Müzesi, St. Petersburg
  pairing_note: Boş bir manzarada yüzsüz bir figür; aynı ülkede ve aynı on yılda, o da resmî baskı altındaki bir sanatçı tarafından boyandı.
  rights_flag: AB'de ve Türkiye'de 1 Ocak 2006'dan beri kamu malı (ömür + 70; Maleviç 1935'te öldü). ABD'de de büyük olasılıkla kamu malı, ancak tablonun ilk yayımlanma tarihi doğrulanamadı; bu yüzden ABD dağıtımı için küçük bir risk kalıyor. Tek ücretsiz görsel düşük çözünürlüklü (1370 × 1800). Güvenli yedek - İlya Repin, "Volga Mavnacıları", 1870–1873, Devlet Rus Müzesi.
```

### Genel bakış

- Ocak 1936'da Pravda gazetesi, "Müzik Yerine Karmaşa" başlıklı bir makalede Şostakoviç'in müziğine saldırdı. Stalin'in Sovyetler Birliği'nde bu, hem kariyerini hem de hayatını tehlikeye atmak demekti.
- Beşinci Senfoni'yi Nisan ile Temmuz 1937 arasında, Büyük Terör'ün doruğunda yazdı.
- 21 Kasım 1937'de Leningrad'da Yevgeni Mravinski yönetimindeki ilk seslendirme büyük bir olay oldu. İnsanlar yavaş bölüm sırasında ağladı; anlatılana göre alkış yarım saat sürdü.
- Senfoni, Şostakoviç'in resmî itibarını geri kazandırdı. Dinleyiciler o günden beri zafer dolu sonun gerçekte ne anlama geldiğini tartışıyor.
- Tek cümleyle: sorgulama (I), alay (II), yas (III), tırnak içinde zafer (IV).

### Bölümler

| | Tempo | Ton | Süre |
| --- | --- | --- | --- |
| I | Moderato | Re minör | 16:20 |
| II | Allegretto | La minör | 4:58 |
| III | Largo | Fa diyez minör | 15:40 |
| IV | Allegro non troppo | Re minörden Re majöre | 8:59 |

### I. Moderato

**Özet.** Yavaş yavaş tutuşan bir [[sonata form|sonat formu]] bölümü. Sessiz, soğuk iki tema giderek bakırların ve davulların eline geçer ve vahşi bir marşa dönüştürülür.

**Ana fikirler**

- Açılış jesti: pürüzlü sıçramalar; pes yaylılara tiz yaylılar cevap verir.
- 1. tema: kemanlarda durmadan aşağı batan, sessiz, kıvrılan bir melodi.
- 2. tema: kemanlarda çok uzun, aralıkları geniş notalar; yumuşak, tekrarlanan bir ritmin (uzun, kısa-kısa) üzerinde süzülür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Pes yaylılar yukarı sıçrar; tiz yaylılar bir an sonra aynı biçimle cevap verir | Açılış jesti, [[canon|kanon]] hâlinde |
| ≈ 0:50 | Kemanlarda sessiz, boynu bükük bir melodi | 1. tema |
| ≈ 5:30 | Müzik iyice durgunlaşır: hafifçe atan bir eşliğin üzerinde uzun, tiz keman notaları | 2. tema. Sakin, ama buz gibi |
| ≈ 8:00 | Bir piyano pes ve vurmalı bir sesle girer; kornolar 1. temayı hırlayarak çalar | [[development|Gelişme bölümü]]. Tempo hızlanmaya başlıyor |
| ≈ 10:00 | Trompetler ve bir trampet: 1. tema kasıla kasıla yürüyen bir marş olarak | Lirik melodi groteskleşmiş |
| ≈ 11:50 | Bütün orkestra [[unison|unison]] hâlinde açılış jestini fırlatır; bir gong çarpar | Doruk; aynı zamanda [[recapitulation|yeniden serim]]in başlangıcı |
| ≈ 13:00 | Bir flüt ve bir korno 2. temayı birbirine söyler; biri ötekinin bir adım gerisinden gelir | 2. tema Re majörde, yumuşak bir [[canon|kanon]] hâlinde. Bölümün en şefkatli anı |
| Son 90 saniye | Solo bir keman, ardından çelestadan yükselen, cam gibi notalar | [[coda|Koda]]. Bölüm bir cevapla değil, bir soruyla bitiyor |

**Dikkat edilecekler**

1. ≈ 10:00'daki marş, sessiz 1. temayla tamamen aynı notaları kullanır. Mesaj, dönüşümün kendisidir.

### II. Allegretto

**Özet.** Vals ölçüsünde, kısa, ağır adımlı bir [[scherzo|scherzo]]. Mizahın keskin bir kenarı var.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Çellolar ve kontrbaslar hırçınca, tek başlarına başlar | Hantal, ayak vuran bir başlangıç |
| ≈ 0:20 | Cırtlak küçük bir klarnet, ardından kurumlu kornolar | Bir karikatürler geçidi, [[Ländler|ländler]] tarzında |
| ≈ 1:45 | Solo bir keman, arpın üzerinde kaymalarla süslü, nazlı küçük bir ezgi çalar | [[trio|Trio]]. Bir flüt onu tekrarlıyor. [[glissando|Glissando]] kaymaları ona sahte bir masumiyet veriyor |
| ≈ 2:50 | Açılış şimdi parmak uçlarında geri döner: fagot ve koparılan teller | Scherzo [[pizzicato|pizzicato]] olarak geri geliyor |
| Son 20 saniye | Obua nazlı ezgiyi bu kez minörde hatırlatır; ardından gür bir savuşturma | Ekşi bir son söz |

### III. Largo

**Özet.** Senfoninin kalbi ve ilk dinleyicileri ağlatan bölüm. Bakırlar baştan sona susar. Yaylılar sekiz ayrı partiye bölünmüştür.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Kemanlar tek başına, sessiz ve ilahi gibi; diğer yaylılar grup grup katılır | Birinci tema. Yaylılar [[divisi|divisi]] çalarak koro gibi bir doku örüyor |
| ≈ 3:00 | Bir flüt ve arp, neredeyse yalnız | Yalnız bir ikinci melodi |
| ≈ 5:30 | Titreyen kemanlardan tek bir ipliğin üzerinde solo bir obua | En ıssız pasaj. Ardından klarnet ve flüt geliyor, her biri tek başına |
| ≈ 9:00 | Çellolar seslerinin en tepesinde haykırır; bir ksilofon çekiçler; altta kontrbaslar öğütür | Doruk. Keder açığa çıkıyor |
| ≈ 11:00 | Müzik bir fısıltıya kadar çekilir | Ardından gelen sessizlik |
| Son dakika | Arp ve çelesta yalnız melodiyi nota nota seçer; yumuşak bir majör akor | Tükenmiş bir huzurla gelen son |

**Dikkat edilecekler**

1. Bu bölümde hiç bakır yok. Birinci bölümün marşlarından sonra onların sessizliği hissediliyor.

### IV. Allegro non troppo

**Özet.** Davullar ve bakırlar bir marşla içeri dalar. Sessiz, düşünceli bir orta kısımdan sonra marş geri döner ve alev alev bir Re majöre doğru büyür. Bu sonun bir zafer olup olmadığı, senfoninin açık bıraktığı sorudur.

**Dinleme durakları**

| Zaman | Ne duyuyorsunuz | Ne oluyor |
| --- | --- | --- |
| ≈ 0:00 | Gümbürdeyen timpani; trompetler ve trombonlar bir marşı bangır bangır çalar | 1. tema. Giderek hızlanıyor |
| ≈ 2:40 | Solo bir trompet, girdap gibi dönen yaylıların üzerinde geniş, yeni bir melodi söyler | 2. tema. Bir doruğa yükseliyor, sonra çöküyor |
| ≈ 3:30 | Sessizlik. Solo bir korno trompetin melodisini yumuşakça çalar | Düşünceli orta kısım |
| ≈ 5:00 | Kemanlar arp notalarının üzerinde ileri geri sallanır | Şostakoviç burada kendi şarkılarından birini alıntılıyor: Puşkin'in "Yeniden Doğuş" adlı şiiri üzerine bir şarkı |
| ≈ 6:30 | Bir trampet yumuşakça vurur; tahta üflemeliler marşı yavaşça geri getirir | Sona doğru uzun tırmanış başlıyor |
| Son 90 saniye | Yaylılar tek bir notayı durmadan çekiçlerken bakırlar marş temasını Re majörde ilan eder | [[coda|Koda]]. Yaylılar aynı notayı iki yüzden fazla kez tekrarlıyor |
| Son ölçüler | Timpani ve büyük davul son notaları gümbür gümbür vurur | Son |

**Bu kayıtta.** Bernstein sonu hızlı alıyor ve gerçek bir zafer gibi duyuluyor. Mravinski dahil pek çok şef onu bu hızın yaklaşık yarısında çalar; o zaman ağır ve zorlama duyulur. İkisini karşılaştırın; aradaki fark, bütün tartışmanın minyatürüdür.

**Dikkat edilecekler**

1. Son dakikada bakırları değil, yaylıları dinleyin. O tek, çekiçlenen nota bir sevinç gibi de duyulabilir, dayak yemek gibi de.

### Bağlayan ipler

- **Marşa dönüştürülen temalar.** Sessiz melodiler tekrar tekrar bakırların ve davulların eline geçer.
- **Eksik bakırlar.** Largo'daki sessizlikleri, başka yerlerdeki gürültüleri kadar anlamlıdır.
- **Açık soru.** Senfoni yetkililere zafer dolu bir final verir, dinleyicilere de bundan şüphe etme alanı bırakır.

---

## Sözlük

Yukarıda kullanılan her `[[term|metin]]`. Her biri bir iki cümle; açılır pencere için yazıldı.

| Key | Terim | Tanım |
| --- | --- | --- |
| Arpeggio | Arpej | Bir akorun notalarının birlikte değil, art arda çalınması. |
| Cadenza | Kadans | Orkestranın geri kalanının durduğu ve bir çalgıcının ya da şarkıcının dilediğince oyalanabildiği kısa bir solo pasaj. |
| Canon | Kanon | Bir çalgı bir melodi çalar, bir başkası bir an sonra aynı melodiyle onu izler; bir dönüşümlü şarkı gibi. |
| Chorale | Koral | Ağırbaşlı akorlarla ilerleyen yavaş, ilahi gibi bir müzik. |
| Coda | Koda | Bir bölümün sonuna eklenen kapanış kısmı. |
| Col legno | Col legno | Tellere yayın tahta sırtıyla vurmak; kuru, tıkırdayan bir ses çıkarır. |
| Crescendo | Crescendo | Giderek güçlenen ses. |
| Development | Gelişme | Sonat formunun orta evresi; temalar parçalanır, birleştirilir ve farklı tonlardan geçirilir. |
| Dies irae | Dies irae | Ölüler için okunan ayinden bir Orta Çağ ilahisi. Besteciler onu ölümün simgesi olarak alıntılar. |
| Divisi | Divisi | Bir yaylı grubunun, her biri farklı bir çizgi çalan iki ya da daha fazla gruba bölünmesi. |
| Exposition | Serim | Sonat formunun ilk evresi; ana temalar tanıtılır. Çoğu zaman tekrarlanır. |
| Fugato | Fugato | Füg gibi, çalgıların aynı ezgiyle tek tek girmesiyle başlayan ama tam bir füg olmayan pasaj. |
| Fugue | Füg | Tek bir ezginin sırayla her seste girdiği ve kendi kendisiyle örüldüğü bir eser ya da kısım. |
| Glissando | Glissando | Bir notadan ötekine kesintisiz bir kayış. |
| Idée fixe | İdée fixe | "Saplantılı fikir": Berlioz'un, bir kişiyi temsil eden ve eser boyunca geri dönen bir melodi için kullandığı terim. |
| Ländler | Ländler | Üç vuruşlu, köylü havasında bir Avusturya halk dansı; valsin daha yavaş, daha ağır bir atası. |
| Major | Majör | Genellikle parlak ya da yerine oturmuş duyulan ton türü. Daha karanlık karşılığı minördür. |
| Minuet | Menuet | Üç vuruşlu, zarif bir 18. yüzyıl dansı; Klasik dönem senfonilerinde üçüncü bölüm olarak kullanılır. |
| Motif | Motif | Bir temanın kurulduğu, yalnızca birkaç notadan oluşan en küçük müzikal fikir. |
| Muted | Sordinli | Çalgının üzerine takılan, sesi yumuşatan ve örten küçük bir düzenekle çalınan. |
| Obbligato | Obligato | Bir bölüm boyunca vazgeçilmez ve belirgin olan solo çalgı partisi. |
| Passacaglia | Passacaglia | Kısa bir temanın durmadan tekrarlandığı, çevresindeki müziğin ise sürekli değiştiği bir biçim. |
| Pedal note | Pedal sesi | Üstündeki armoni değişirken, genellikle basta tutulan ya da tekrarlanan tek bir nota. |
| Pizzicato | Pizzicato | Yaylı bir çalgının tellerini yay yerine parmakla koparmak. |
| Programme music | Programlı müzik | Bestecinin anlattığı bir öyküyü aktaran ya da bir sahneyi betimleyen çalgı müziği. |
| Recapitulation | Yeniden serim | Sonat formunun son evresi; açılış temaları geri döner. |
| Recitative | Resitatif | Konuşmanın ritmini taklit eden, serbest ve ölçüsüz müzik. |
| Rondo | Rondo | Bir ana temanın, birbirine zıt ara bölümler arasında durmadan geri döndüğü biçim. |
| Scherzo | Scherzo | Hızlı, enerjik bir bölüm; bir senfonide genellikle üçüncü sırada. Sözcük "şaka" demektir, ama havası çoğu zaman hiç de komik değildir. |
| Sonata form | Sonat formu | Üç evreli bir yapı: temalar tanıtılır (serim), işlenir ve birbirine karşı konur (gelişme), sonra geri getirilir (yeniden serim). |
| Syncopation | Senkop | Ana vuruşların dışına yerleştirilen vurgular; ritme süzülüyormuş ya da nabza karşı çekiyormuş gibi bir his verir. |
| Trio | Trio | Bir menuetin ya da scherzonun, genellikle daha yumuşak olan zıt orta kısmı. |
| Unison | Unison | Herkesin aynı anda aynı notaları çalması. |
| Variation | Varyasyon | Bir temanın, bir şeyi değiştirilerek tekrarlanması: süsleme, ritim, armoni ya da çalgılar. |
