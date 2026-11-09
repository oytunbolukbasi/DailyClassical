# Yapılacaklar

Son güncelleme: 9 Kasım 2026. **[Claude]** kod ve içerik tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler. İçerik durumu ve zamanlama `content_status.md`'de, proje bilgisi `project_information.md`'de.

## Yayın

- **1.0.0 yayında (9 Kasım 2026).** Dördüncü gönderim (build 3, 27 Ekim) onaylandı. Takvim aynı gün sıfırlandı: gün 0 = 9 Kasım, Çaykovski 6 (`content/schedule.yaml`, 21 gün). Hediye Premium `oytunbolukbasi@gmail.com` hesabına tanımlandı (`users.comp_premium_until` = 2099).
- **Red geçmişi:** 21 Ekim 2.1(b) ürünler gönderilmemiş + 3.1.2(c) açıklamada EULA bağlantısı yok; 23 Ekim 2.3.2 iki üründe aynı tanıtım görseli (görseller silindi); 27 Ekim 3.1.2(c) deneme fiyattan belirgin. Kural: gönderimdeki öğe kilitlidir; düzenlemek için gönderimden çıkar, düzelt, hepsini **Add for Review** ile aynı taslağa ekleyip birlikte gönder. Ürün silinmez (Product ID bir daha kullanılamaz). Ödeme ekranında deneme hiçbir zaman fiyattan büyük yazılmaz, butonda "ücretsiz" geçmez.
- **1.0.0 (3) içeriği:** 3.1.2(c) ödeme ekranı düzeltmesi; App Store değerlendirme kartı (`Features/Rating/RatePrompt.swift`, tasarım B, yıldızlar 5→0→5; 3 farklı günde eser açıldıktan sonra bir eserden Bugün'e dönüşte, sürüm başına en fazla 1, 365 günde en fazla 3 kez; "Evet" iOS penceresini açar, TestFlight'ta hiç çıkmaz; test: Ayarlar › Test ya da `-shotRatePrompt YES`); anonim sayaç (`Core/Services/Analytics.swift` → `/v1/events`, yönetim panelindeki DAU/WAU/MAU, açılış ve Spotify sayıları); yalnızca takvimdeki eserlerin tablolarını gömen paketleme. Önceki build 1.0.0 (2) 22 Ekim'de yüklenmişti.
- **[Oytun] Yayından sonra Railway:** `APP_STORE_URL` eklenecek. Güncelleme istemek için `LATEST_APP_VERSION` (bir kez önerir) ya da `MIN_APP_VERSION` (zorunlu ekran); normalde ikisi de boş.

## 1.0.1 planı

Sürüm `MARKETING_VERSION` 1.0.1 (`ios/project.yml`); build numarası arşivde 4'e çıkar. Kullanıcıya görünen değişiklik iPhone Duo ve kısa ekranlar; geri kalanı bakım.

**Hazır olanlar**

- **iPhone Duo uyumu (hazır, 9 Kasım'da `main`'e birleşti).** 6 Kasım'da simülatörde incelendi (`design/iphone-duo/`; önce/sonra canvas'ı: https://claude.ai/artifact/EfnwruT3fbkuAK9ke2DWwG, kapalı ve yarı açık yatay; açık dikey/yatay ve yarı açık dikey eklenecek), aynı gün düzeltildi ve dört konumda yeniden çekildi; normal iPhone'da görünüm değişmedi:
  1. Tablolar sağdaki kontrol sütununun altına uzanıyor: eser sayfası, ödeme ekranı, besteci `.backgroundExtensionEffect()`; Bugün'de sayfalar tam genişlikte, yazı ve düğmeler sütun kadar içeride (`TodayMetrics.leading/trailing`).
  2. Yarı açık yatay konumda "Dinlemeye başla", "Spotify'da aç", tarih rozeti ve değerlendirme kartı katlanma çizgisinden büyük yarıya geçiyor (`FoldAware`, `reservedRegions(kind: .division)`, iOS 27.1+).
  3. Kısa ekranlarda hero küçülüyor (`HeroHeight`): eser sayfası 300 pt ya da ekranın %37'si, ödeme ekranı 280 pt ya da %34'ü. Dış ekranda başlık ve fiyat kartları kaydırmadan görünüyor; iPhone 13 mini ve üstünde değişiklik yok.
  4. Duvar kâğıdı ekran boyutunu pencerenin ekranından okuyor (`UIScreen.main` kalktı); Duo'da kırpma çerçevesi o ekranın oranında.
  5. Eser sayfası ve Bugün metni en fazla 640 pt genişlikte, ortalı sütunda (`readableColumn()`).
  Kalan: karşılama ekranlarında tablo sütunda duruyor (sayfa görünümü yatay güvenli alanı yok sayınca sayfalar kayıyor; Bugün'deki gibi kendi kaydırma görünümüne geçirilirse düzelir). Sonra: App Store Connect'e iPhone Duo ekran görüntüleri (ürün sayfasında Duo rozeti). Test: Device Hub › iPhone Duo (iOS 27.1) › Closed / Partially Open / Open / Rotate; ekran görüntüsü `simctl io <udid> screenshot --display=<UUID>` (iç 2007×2853, dış 1398×2034; UUID'ler her açılışta değişir, `simctl io <udid> enumerate`).

**Build'den önce yapılacaklar [Claude]**

- **Gömülü görseller yeni takvime göre:** `npm run images` ve `npm run images:widget`; takvime giren 7 yeni eserin (23–29 Kasım) tabloları uygulamaya ve widget'a girer. Takvim haftalık uzadıkça her build'den önce tekrarlanır.
- **Eser sayfası alt boşluğu:** son bölümden sonra 150 yerine ~44 pt (`Spacing.floatingButtonClearance`).
- **Karşılamada Duo:** tablo yan sütunda kesiliyor; sayfaları Bugün'deki gibi kendi kaydırma görünümüne geçirmek (isteğe bağlı, karşılama bir kez görülür).
- **Duo canvas'ını tamamlamak:** açık dikey/yatay ve yarı açık dikey son build'le çekilip canvas'a eklenecek.
- **Regresyon turu:** iPhone 17 Pro Max, iPhone SE boyu (kısa ekranda tablo yüksekliği değişti) ve Duo'da Bugün, eser, ödeme, karşılama, duvar kâğıdı; telefonda TestFlight.

**Gönderim [Oytun + Claude]**

- "Yenilikler" metni (aşağıda), iPhone Duo ekran görüntüleri (ürün sayfasında Duo rozeti), App Review notu: yalnız yerleşim değişikliği, satın alma ekranı aynı.
- Yenilikler (TR): "iPhone Duo için yeniden düzenlendi: tablolar ekranın tamamını kaplıyor, düğmeler katlanma çizgisinden uzak duruyor. Kısa ekranlarda eser sayfası ve Premium ekranı daha derli toplu. Küçük düzeltmeler."
- What's New (EN): "Redesigned for iPhone Duo: paintings fill the whole screen and buttons stay clear of the fold. On shorter screens the piece page and the Premium screen are tidier. Small fixes."
- Yayından sonra Railway'de `LATEST_APP_VERSION=1.0.1` (eski sürümdekilere bir kez güncelleme önerir).

**Sürümden bağımsız, sunucu tarafı [Claude]**

- **Haftalık takvim:** 30 Kasım'dan itibaren her hafta ~7 eser `schedule.yaml`'ın sonuna eklenir (yalnız ekleme; sıra değişirse geçmiş günler değişir). Eklenmezse 21 günlük sıra baştan döner.
- **Görselleri R2/CDN'e taşımak (önemli):** aşağıda "Altyapı"da; bir sonraki içerik partisinden önce.

**Sonraki sürümlere (1.1)**

- Metin içi sözlük terimlerine 44 pt dokunma alanı; e-posta değiştirme akışı; Beethoven 9 finalinin iki parçalı durak gösterimi; "Şeffaflığı Azalt" ve VoiceOver turu.

## İçerik

- **Uygulama boyutu (25 Ekim, çözüldü):** Tablo hero'ları yalnızca takvimdeki eserler için gömülüyor; gömülü görseller 135 MB → 39 MB, widget 29 MB → 2,7 MB. Gerisi Railway'den iner.

- **[Oytun + Claude] Beethoven 9 finali:** Spotify'da iki parça (6:26 + 17:35). Duraklar bölüm toplamı olarak yazılı; uygulamanın bunları toplam mı, ikinci parçaya göre mi göstereceğine karar verilecek.
- **[Claude] Mozart 41 tablosu:** Hubert Robert, *Dikilitaş* yalnızca 1952 px; daha büyük bir kaynak bulunursa değiştirilecek.
- **[Oytun] Türkçe native okuma:** İçerik ve arayüz metinleri (paywall başlığı, "y. 1818" gibi ifadeler, "kadans/kadenza").
- **[Oytun] Resmi Spotify logosu:** "Spotify'da aç" butonları için Spotify'ın marka kurallarına uygun asset. Albüm kapağı gösterilmediği ve butonlar yalnızca metin olduğu için gerekmeyebilir; bilinçli bir karar verilmeli.

## Tasarım denetiminden kalanlar (küçük)

- **[Claude] Dokunma alanı:** Metin içi sözlük terimlerinin 44 pt dokunma alanı yok (`RichTextView` yalnızca `Text` bağlantısı); TextKit ya da `TextRenderer` sarmalayıcısı gerekir.
- **[Claude] Eser sayfası alt boşluğu:** "Spotify'da aç" son bölümden sonra geri gelmediği için alt boşluk 150 yerine ~44 olabilir (`Spacing.floatingButtonClearance`).
- **[Claude] E-posta değiştirme:** Hesap › E-posta satırı yalnızca bilgi; değiştirme akışı yok (`account.changeEmail.title` anahtarı ayrılmış).
- **[Oytun + Claude] Kontrol edilmemiş durumlar:** "Şeffaflığı Azalt" açıkken uygulama genelinde; Premium arama sonuçları ve giriş yapılmış ekranların görsel kontrolü.

## Altyapı ve test

- **[Claude] Görselleri dosya depolama servisine taşımak (önemli):** Bugün bütün görseller (hero, thumb, full, widget; 114 eserde birkaç yüz MB) git reposunda (`backend/public/images`) duruyor ve Railway her deploy'da onları API'yle birlikte yayınlıyor. Katalog büyüdükçe repo ve her deploy şişiyor. Hedef: Cloudflare R2 (ya da S3) + CDN; `npm run images` çıktıyı oraya yükler, `ASSETS_BASE_URL` (env.ts'te hazır) görsel adreslerini oraya çevirir, repodan `public/images` çıkar. Uygulama değişmez (adresleri API'den alıyor). Birkaç parti daha eklenmeden önce yapılmalı.

- **[Oytun] Yasal metinlerin hukuki okuması:** Kullanım koşulları ve gizlilik metinleri iyi niyetli taslaklar; avukat ya da KVKK danışmanı bakmalı. Veri sorumlusunun adı ve adresi eklenmeli; `hello@dailyclassical.co`'nun e-posta aldığından emin olunmalı.
- **[Oytun] Sandbox'ta kalanlar:** RevenueCat › Customers'ta işlemin görünmesi; uygulamayı silip kurduktan sonra "Satın alımları geri yükle".
- **[Oytun + Claude] Widget, Release build'de:** Gece yarısı yeni günün eserine geçtiğini ve uygulama açılmadan yeni eserleri gösterdiğini kontrol et.
- **Ertelendi (Oytun'un kararı): VoiceOver'ın cihazda denenmesi.** Kod hazır (günler arası geçiş eylemleri, bölüm düğmesi etiketleri, okunur durak zamanları, sözlük terimi ipucu).

## Test notları

- **Debug build:** Premium açık (`EntitlementStore.debugUnlock`), içerik uygulamaya gömülü; production API'ye bağlanır (giriş, favoriler), içerik için `DC_USE_API=1`. Release/TestFlight build'leri StoreKit/RevenueCat ve production API'yi kullanır.
- **Ayarlar › Test** (yalnızca Xcode'dan kurulan build'lerde): "Karşılamayı yeniden göster", "3 gün deneme teklifini göster". Simülatörde `-debugTrialDays 3`, `-debugPremium NO`.
- **Premium test hesabı:** `premium-test@dailyclassical.co`; şifresi git'e girmeyen `backend/test-accounts.local.md`'de. Yeni hesap: `npm run test-user -- adres@... [--free]`.
- **Simülatörler (29 Ekim, yeni Mac, Xcode 27.1):** iPhone 17 Pro Max ve iPhone 18 Pro, iOS 27.0 (24A434) ile; mağaza ekranları 6,9 inç (17 Pro Max). iOS 27.1 simülatörü (24A94425) yalnızca iPhone Duo'ya izin veriyor (`restrictedToDeviceTypes`), diğer modeller için 27.0 gerekli. Telefon iOS 27.0.1; cihaz davranışı için iOS 27 simülatörü esas.
- Telefondaki "Ömür boyu", Xcode'un yerel StoreKit ortamındaki bir test satın almasından; hesaba bağlı değil, uygulama silinince gider.

## Tamamlananlar (özet)

- **9 Kasım:** 1.0.0 App Store'da yayında. Takvim 9 Kasım'dan (Çaykovski 6) yeniden kuruldu; `release/1.0.1` (iPhone Duo) `main`'e birleşti.
- **27 Ekim:** Dördüncü App Review gönderimi (build 3). App Privacy güncellendi; satın alma inceleme görselleri yenilendi.
- **25–26 Ekim:** İkinci 50 eserlik parti birleştirildi (114 eser, 36 besteci, 99 terim; Çaykovski 4 ve 5 eklendi); yönetim paneli `dailyclassical.co/admin` (e-postayla kod, KPI'lar, takvim, katalog araması); anonim sayaç; değerlendirme kartı; uygulama boyutu küçültüldü.
- **24 Ekim:** Kulakla zamanlama kapatıldı (7 eser zamanlandı; kalan duraklar ≈ tahmin olarak kalıyor).

- **17 Ekim:** Beethoven 3, Vivaldi İlkbahar, Ay Işığı (referans Barenboim'e geçti), Dvořák Çello kulakla zamanlandı. Dokümanlar `project-knowledge/` altında üç dosyada toplandı.
- **16 Ekim:** TR'de pizzicato "parmakla çekmek" (sözlük + 25 eser). Durak Zamanlayıcı kuruldu ve düzeltildi.
- **11 Ekim:** 50 eserlik Ekim partisi birleştirildi (64 eser, 69 terim, 29 besteci); Rönesans dönemi (migration 0011); Türkiye'de çalınmayan üç kayıt değiştirildi.
- **9 Ekim:** www.dailyclassical.co tanıtım sayfası (Claude Design), destek/gizlilik/koşullar sayfaları ana alan adında; Şostakoviç 5 tablosu Malevich → Repin; App Store'a gönderim.
- **8 Ekim:** Karşılama akışı (§09), paywall'da aylık + deneme seçili; Premium faydaları (kaçırılan günler, tablo duvar kâğıdı); fiyatlar (₺699,99 ömür boyu, ₺129,99/ay + 3 gün deneme); RevenueCat; Apple ile giriş; Neon dev branch'i; yasal sayfalar; production (api.dailyclassical.co, Railway ABD doğu); 43 maddelik tasarım denetimi; mağaza görselleri; TestFlight'a 1.0.0 (1).
- **7 Ekim:** İstek sınırlama, koyu mod tokenları, sözlük kısa tanımları, içerik güncelleme servisi (content-publish, widget akışı, `/v1/config`), eser türleri (`form`), 4 yeni eser.
- **5–6 Ekim:** Widget'lar (üç boy, üç mod), HEIC görseller, ana ekran A düzeni, e-posta doğrulama kodu, hediye premium.
