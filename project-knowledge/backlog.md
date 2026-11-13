# Yapılacaklar

Son güncelleme: 11 Kasım 2026. **[Claude]** kod ve içerik tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler. İçerik durumu ve zamanlama `content_status.md`'de, proje bilgisi `project_information.md`'de.

## Yayın

- **1.0.0 yayında (9 Kasım 2026).** Dördüncü gönderim (build 3, 27 Ekim) onaylandı. Takvim aynı gün sıfırlandı: gün 0 = 9 Kasım, Çaykovski 6 (`content/schedule.yaml`, 21 gün). Hediye Premium `oytunbolukbasi@gmail.com` hesabına tanımlandı (`users.comp_premium_until` = 2099).
- **Red geçmişi:** 21 Ekim 2.1(b) ürünler gönderilmemiş + 3.1.2(c) açıklamada EULA bağlantısı yok; 23 Ekim 2.3.2 iki üründe aynı tanıtım görseli (görseller silindi); 27 Ekim 3.1.2(c) deneme fiyattan belirgin. Kural: gönderimdeki öğe kilitlidir; düzenlemek için gönderimden çıkar, düzelt, hepsini **Add for Review** ile aynı taslağa ekleyip birlikte gönder. Ürün silinmez (Product ID bir daha kullanılamaz). Ödeme ekranında deneme hiçbir zaman fiyattan büyük yazılmaz, butonda "ücretsiz" geçmez.
- **1.0.0 (3) içeriği:** 3.1.2(c) ödeme ekranı düzeltmesi; App Store değerlendirme kartı (`Features/Rating/RatePrompt.swift`, tasarım B, yıldızlar 5→0→5; 3 farklı günde eser açıldıktan sonra bir eserden Bugün'e dönüşte, sürüm başına en fazla 1, 365 günde en fazla 3 kez; "Evet" iOS penceresini açar, TestFlight'ta hiç çıkmaz; test: Ayarlar › Test ya da `-shotRatePrompt YES`); anonim sayaç (`Core/Services/Analytics.swift` → `/v1/events`, yönetim panelindeki DAU/WAU/MAU, açılış ve Spotify sayıları); yalnızca takvimdeki eserlerin tablolarını gömen paketleme. Önceki build 1.0.0 (2) 22 Ekim'de yüklenmişti.
- **Railway (yapıldı, 13 Kasım):** `APP_STORE_URL` ve `LATEST_APP_VERSION=1.1` yayında (`/v1/config` doğrulandı). Güncelleme istemek için `LATEST_APP_VERSION` (bir kez önerir) ya da `MIN_APP_VERSION` (zorunlu ekran); normalde ikisi de boş.

## 1.1 planı (önce 1.0.1 olarak hazırlanmıştı)

**Durum (13 Kasım): 1.1 (build 5) 12 Kasım'da onaylandı, 13 Kasım'da yayınlandı.** (11 Kasım akşamı gönderilmişti.) Oytun'un kararıyla 1.0.1 gönderilmedi, 1.1'e kalan işler de eklendi (build 4 = 1.0.1 yüklü kaldı, kullanılmayacak). iPhone Duo görselleri: her dilde yalnız iç ekran 01–06 (bölüm başına en fazla 10 görsel). Sıra: onay beklerken → kök alan adı DNS'i (reklam ölçümü kopyaları için) → reklamları uçtan uca kurmak. Sürüm `MARKETING_VERSION` 1.1, build 5 (`ios/project.yml`). Kullanıcıya görünen değişiklikler: widget tanıtımı, e-posta değiştirme, iPhone Duo (karşılama dahil), kısa ekranlar, sözlük terimleri ve giriş formunda dokunma alanları; geri kalanı bakım ve sayaçlar.

**Hazır olanlar**

- **iPhone Duo uyumu (hazır, 9 Kasım'da `main`'e birleşti).** 6 Kasım'da simülatörde incelendi (`design/iphone-duo/`; önce/sonra canvas'ı: https://claude.ai/artifact/EfnwruT3fbkuAK9ke2DWwG, kapalı ve yarı açık yatay; açık dikey/yatay ve yarı açık dikey eklenecek), aynı gün düzeltildi ve dört konumda yeniden çekildi; normal iPhone'da görünüm değişmedi:
  1. Tablolar sağdaki kontrol sütununun altına uzanıyor: eser sayfası, ödeme ekranı, besteci `.backgroundExtensionEffect()`; Bugün'de sayfalar tam genişlikte, yazı ve düğmeler sütun kadar içeride (`TodayMetrics.leading/trailing`).
  2. Yarı açık yatay konumda "Dinlemeye başla", "Spotify'da aç", tarih rozeti ve değerlendirme kartı katlanma çizgisinden büyük yarıya geçiyor (`FoldAware`, `reservedRegions(kind: .division)`, iOS 27.1+).
  3. Kısa ekranlarda hero küçülüyor (`HeroHeight`): eser sayfası 300 pt ya da ekranın %37'si, ödeme ekranı 280 pt ya da %34'ü. Dış ekranda başlık ve fiyat kartları kaydırmadan görünüyor; iPhone 13 mini ve üstünde değişiklik yok.
  4. Duvar kâğıdı ekran boyutunu pencerenin ekranından okuyor (`UIScreen.main` kalktı); Duo'da kırpma çerçevesi o ekranın oranında.
  5. Eser sayfası ve Bugün metni en fazla 640 pt genişlikte, ortalı sütunda (`readableColumn()`).
  Kalan: karşılama ekranlarında tablo sütunda duruyor (sayfa görünümü yatay güvenli alanı yok sayınca sayfalar kayıyor; Bugün'deki gibi kendi kaydırma görünümüne geçirilirse düzelir). Sonra: App Store Connect'e iPhone Duo ekran görüntüleri (ürün sayfasında Duo rozeti). Test: Device Hub › iPhone Duo (iOS 27.1) › Closed / Partially Open / Open / Rotate; ekran görüntüsü `simctl io <udid> screenshot --display=<UUID>` (iç 2007×2853, dış 1398×2034; UUID'ler her açılışta değişir, `simctl io <udid> enumerate`).

**Build'den önce yapılacaklar [Claude]**

- **Gömülü görseller yeni takvime göre (yapıldı, 9 Kasım):** `npm run images` + `images:widget`; 23–29 Kasım'ın 7 eseri uygulamaya (43 MB) ve widget'a (4,4 MB) girdi. Takvim haftalık uzadıkça her build'den önce tekrarlanır.
- **Eser sayfası alt boşluğu (yapıldı):** son bloktan sonra 150 yerine 44 pt.
- **Değerlendirme istemi sayaçları (yapıldı):** uygulama gösterildi / Evet / Sonra gönderir (`Analytics.ratePrompt`); sunucuda `prompt_events` (migration 0013), adminde "Değerlendirme istemi" kartı ve gösterim kuralları notu. Sunucu tarafı yayında; sayılar 1.1 ile gelmeye başlar.
- **Widget tanıtımı (yapıldı, 9 Kasım; tasarım A onaylandı):** https://claude.ai/artifact/7HKvqZjoyZEN7gg9jFb2dr. `Features/WidgetTip/WidgetTip.swift`: kart (bugünün eseriyle orta boy widget, 3 adım, Anladım / Sonra), kısa ekranda simge sırası olmadan, en büyük yazıda kaydırılır; katlanma çizgisinden kaçar. Kurallar: 2 farklı gün açılıştan sonra Bugün'de, ana ekranda widget varsa hiç (`WidgetCenter`), değerlendirme kartıyla aynı gün değil (iki yönlü), Anladım = bir daha yok, Sonra = 7 gün sonra bir kez daha (en fazla 2). Ayarlar › Okuma › Ana ekran widget'ı her zaman açar (sayılmaz). Sayaçlar `widget_prompt_*`, adminde "Widget tanıtımı" kartı ve kurallar notu. Test: Ayarlar › Test › "Widget tanıtımını göster" ya da `-shotWidgetTip YES`.
- **Duo'da açılışta donma (bulundu ve düzeltildi, 9 Kasım):** takvim tek günle başlayınca Bugün'ün sayfa kaydırıcısı Duo'da sonsuz yerleşim döngüsüne giriyordu (yalnızca 1.0.1 kodu; 1.0.0 etkilenmiyor). 1, 2 ve 21 günle Duo'da, iPhone 17 Pro Max'te denendi.
- **Çökme ve donma raporları (yapıldı, 10 Kasım):** MetricKit (`Core/Services/Diagnostics.swift`) çökme, donma, yavaş açılış, aşırı işlemci ve disk raporlarını kimliksiz olarak `POST /v1/diagnostics`'e gönderir (migration 0014, `diagnostic_reports`, 180 gün). Adminde "Çökmeler ve donmalar": son 30 gün sayıları, imzaya göre gruplanmış hatalar, ham JSON indirme; okumak için `ios/scripts/symbolicate.sh <json>` (arşivdeki dSYM ile dosya ve satır). Test: Ayarlar › Test › "Örnek çökme raporu gönder". PostHog şimdilik yok (9–10 Kasım kararı; kullanıcı sayısı büyüyünce ya da sayacın cevaplayamadığı bir soru çıkınca yeniden bakılır). Gizlilik politikası güncellendi (10 Kasım).
- **Regresyon turu (yapıldı, simülatör):** iPhone 17 Pro Max değişmedi; iPhone SE'de eser ve ödeme ekranı tablosu kısaldı, fiyat kartları görünüyor; duvar kâğıdı çerçevesi ekran oranında. Telefonda TestFlight turu build'le birlikte.
- **Giriş formunda dokunma alanı (yapıldı, 11 Kasım; Oytun'un isteği):** E-posta / Şifre satırının herhangi bir yerine (etiket, boşluk, yazının sağı) dokununca o alan odaklanıp klavye açılıyor (`FormRow(focus:)`, `AuthComponents.swift`); göz düğmesi ayrı çalışıyor. Hesap oluşturma, giriş ve şifre sıfırlamada geçerli; doğrulama kodu kutuları zaten tümüyle dokunulabilirdi. Simülatörde denendi. Test: `-shotSheet auth:signIn` (ya da `auth:createAccount`).
- **"Şeffaflığı Azalt" kontrolü (yapıldı, 11 Kasım, simülatör):** Bugün ve eser sayfasında cam yüzeyler (tarih rozeti, "Dinlemeye başla", sekme çubuğu, "Spotify'da aç", üst düğmeler) opak oluyor ve okunuyor; sorun yok.
- **Karşılamada Duo (yapıldı, 11 Kasım):** sayfa görünümü (`TabView`) Bugün'deki gibi sayfalayan yatay `ScrollView`'e geçti; sayfalar tam genişlikte, tablolar yan sütunun altına uzanıyor, yazı ve düğmeler sütundan uzak (`welcomeSides`). Duo dış ekranda ve iPhone 18 Pro'da Devam, kaydırma ve Geç denendi; açık konum (iç ekran) Device Hub gerektirdiği için bakılmadı.
- **Sözlük terimlerine 44 pt dokunma alanı (yapıldı, 11 Kasım):** `RichTextView` bir `TextRenderer` ile terimlerin yerini kaydediyor; paragrafa dokununca en az 44 × 44 pt'lik alanı dokunuşu içeren en yakın terim açılıyor. VoiceOver bağlantıları aynı. Terimin 16 pt altına dokunmak açıyor, uzağa dokunmak açmıyor (simülatörde denendi).
- **Şifre göz düğmesi (yapıldı, 11 Kasım):** gizli alan artık görünümden çıkmıyor, iOS "Parolayı kaydet?" demiyor; şifre türü yalnızca görünen alanda. Not: simülatörün otomatik yazması "yeni şifre" alanında her tuşta öncekini siliyor (eski kodda da aynı; cihazda sorun yok).
- **E-posta değiştirme (yapıldı, 11 Kasım):** Hesap › E-posta → yeni adres + mevcut şifre → yeni adrese 6 haneli kod → onay; oturum sürer, eski adrese "e-postanız değişti" bildirimi gider. Sunucu: `POST /v1/me/email`, `/confirm`, `/resend` (migration 0016 `email_change_codes`), hız sınırı `emailChange`. Şifresiz Apple hesaplarında satır bilgi olarak kalır (e-posta Apple'dan). Yerel sunucu + dev veritabanıyla uçtan uca denendi.
- **Duo canvas'ını tamamlamak (açık iş):** açık dikey/yatay ve yarı açık dikey; Device Hub ekrana bağlanamadığı için bekliyor.

**Gönderim [Oytun + Claude]**

- **iPhone Duo mağaza görselleri (hazır, 9 Kasım):** `design/app-store/out-duo/` (dış ekran 1398×2034, iç ekran yatay 2853×2007; EN ve TR, iPhone setiyle aynı altı sahne ve metin). App Store Connect › sürüm › iPhone Duo bölümüne yüklenince ürün sayfasında "iPhone Duo için optimize" rozeti çıkar; yüklemeden önce App Store Connect'in önizleme aracıyla bakılmalı. Yeniden üretmek: Device Hub › iPhone Duo › Closed / Open, `design/app-store/render-duo.sh`. Nisan 2027'den itibaren iOS 27.1+ SDK ile gönderilen her sürümde Duo görselleri zorunlu.
- **Öne çıkarılma başvurusu:** yapılmayacak (Oytun'un kararı, 9 Kasım); yalnızca Duo görselleri yüklenecek.
- **Xcode 27.2:** Apple Duo için 27.2 ile derlemeyi öneriyor; Mac'te 27.2 kurulu, 1.1 build'i onunla çıkar.
- **App Privacy güncellenecek:** Diagnostics › **Crash Data** ve **Performance Data** ekle (kullanıcıya bağlı değil, takip yok, amaç App Functionality). Sayaçlar zaten beyan edilen "Product Interaction" kapsamında.
- "Yenilikler" metninde widget tanıtımı ve Ayarlar'daki yeni satır da anılabilir.
- "Yenilikler" metni (aşağıda), iPhone Duo ekran görüntüleri (ürün sayfasında Duo rozeti), App Review notu aşağıda (EN).
- Yenilikler (TR, gönderilen metin): "Küçük düzenlemeler yapıldı ve iPhone Duo için yeniden tasarlandı."
- What's New (EN, gönderilen metin): "Small refinements, and a redesign for iPhone Duo."
- App Review notu (EN, gönderilen metin): "This version is redesigned for iPhone Duo: paintings run under the side controls column and buttons stay clear of the fold, on both the outer and inner displays. It also adds a short guide to the Home Screen widget and a way to change the account email (Settings › Account › Email: enter the new address and the current password, then the 6-digit code sent to the new address). The purchase screen and the in-app purchases are unchanged. Test account: premium-test@dailyclassical.co, with the password in the Sign-In Information."
- Railway'de `LATEST_APP_VERSION=1.1` yapıldı (13 Kasım).

**Sürümden bağımsız, sunucu tarafı [Claude]**

- **Instagram gönderileri 6–20:** pazarlama ortamındaki ajan sürdürüyor; reklam görselleri bunlardan da beslenir.

- **Haftalık takvim:** 21 günlük sıra 29 Kasım'da biter; 30 Kasım'dan itibaren her hafta ~7 eser `schedule.yaml`'ın sonuna eklenir (yalnız ekleme; sıra değişirse geçmiş günler değişir). Eklenmezse 21 günlük sıra baştan döner.

**Sonraki sürümlere (1.1)**

- Beethoven 9 finalinin iki parçalı durak gösterimi (karar bekliyor); VoiceOver'ın cihazda denenmesi.

## Reklam (Instagram / Meta)

**Kararlar (10 Kasım):** Meta Ads Manager'ı Claude, Claude in Chrome ile yönetir (üçüncü taraf bağlantı yok). Pazar: Türkiye ve İngilizce konuşulan ülkeler, ayrı kampanyalar. Ölçüm için reklam SDK'sı ya da MMP (Adjust vb.) yok; Apple'ın SKAdNetwork / AdAttributionKit'i ve App Store Connect kampanya bağlantıları. Para harcatan her adım (yayına alma, bütçe) Oytun'un onayıyla; ödeme yöntemi ve girişler Oytun'da.

**Ölçüm, üç yerden:**
- **Meta Ads Manager:** kampanya başına yükleme (SKAdNetwork, Meta'nın modellemesiyle).
- **Admin › Reklamdan gelen indirmeler:** Apple'ın bize gönderdiği rapor kopyaları; reklam ağı ve kampanya kimliği başına indirme, ilk 2 günde eser açan, deneme ya da satın alma. Gecikme 1–3 gün; az kurulumda Apple ayrıntıyı gizler.
- **App Store Connect › Analytics › Campaigns:** bağlantıyla gelen trafik (profil, hikâye, trafik kampanyaları), bağlantıdaki `ct` etiketine göre kesin indirme sayısı. Kaynaklarda "App Referrer: Instagram" toplamı da görünür.

**Uygulama ve sunucu (hazır, 1.1 ile gelir):** `Core/Services/AdAttribution.swift` adımları (0 açıldı, 10 karşılama, 20 eser açtı, 40 deneme/aylık, 50 ömür boyu); Info.plist'te Meta'nın SKAdNetwork kimlikleri ve rapor kopyası adresi (`https://dailyclassical.co`); sunucuda `/.well-known/skadnetwork/report-attribution/` ve `/.well-known/appattribution/report-attribution/` (migration 0015). Takip izni (ATT), reklam kimliği ya da SDK yok; gizlilik politikasına "Reklam ölçümü" eklendi.

**Kararlar (11 Kasım akşamı):** Meta tarafında hiçbir şey yok (yalnız Instagram hesabı), sıfırdan kurulacak. İlk test bütçesi **₺3.000–5.000** (iki pazar, 7–10 gün). Trafik kampanyası yok; **yükleme kampanyaları 1.1 onaylanınca** açılır (SKAdNetwork kimlikleri 1.1'de), o zamana kadar hesaplar, uygulama kaydı, ASC bağlantıları ve görseller hazırlanır. Pazarlar: TR; EN = ABD, Birleşik Krallık, Kanada, Avustralya, İrlanda, Yeni Zelanda.

**Kurulum durumu (13 Kasım):**
- Business portföyü: **"Oytun Bolukbasi"** (id 548834825812965; ayrı bir DailyClassical portföyü açılmadı). Facebook Sayfası **DailyClassical** ↔ Instagram **@dailyclassical.co** bağlı (kişisel @oytunbolukbasi yanlışlıkla bağlanmıştı; Sayfa bağlantısı kesildi, portföyden kaldırma Meta tarafında işlenmeyi bekliyor, 0 kişi atalı, zararsız).
- Reklam hesabı **DailyClassical** (TRY, İstanbul), kart Oytun'da eklendi.
- Meta for Developers uygulaması **DailyClassical**, App ID **1661415735766563**, kullanım durumu "Create & manage app ads with Meta Ads Manager", portföye bağlı; iOS platformu `co.dailyclassical.app` + App Store ID 6820556910; "Log in-app events automatically" **kapalı** (SDK yok). Reklam hesabı uygulamaya atandı.
- Events Manager: SKAdNetwork olay şeması **yapılandırılmadı** (dönüşüm değerlerini uygulama kendisi veriyor: 0/10/20/40/50; Meta şeması bunları yanlış yorumlar), AEM ve Otomatik Gelişmiş Eşleştirme kapalı. Kampanyalar **yükleme** optimizasyonuyla.
- 1.1 yayında (13 Kasım) → yükleme kampanyaları açılabilir. Kalan: görseller (canvas, onay), ASC kampanya bağlantıları (Instagram profili/organik için), Promotional Text, kampanya kurulumu (bütçe ₺3–5 bin, yayına alma Oytun onayıyla).

**13 Kasım ilerleme:**
- Meta uygulaması **Live** (gizlilik `/privacy`, koşullar `/terms`, kategori Eğitim; Publish'e Oytun bastı).
- **Kreatifler:** `design/app-store/ad.html` + `render-ads.sh` → `ads/{feed,story}/{tr,en}/01–03.png` (Her gün bir eser / Dinleme rehberi / Müzik bilgisi gerekmez); onay sayfası https://claude.ai/artifact/7pVx6vQfFC7sBmaUYY9F6C (Meta metinleri dahil). Onay bekliyor.
- **ASC kampanya bağlantıları** (sağlayıcı `pt=129257819`; ASC'de ayrıca kayıt gerekmez, `ct` serbest, en fazla 30 karakter): `https://apps.apple.com/app/apple-store/id6820556910?pt=129257819&ct=<ad>&mt=8`. Kullanılanlar: `ig-bio` (Instagram profil bağlantısı), `ig-story-tr`, `ig-story-en`, `ig-post-tr`, `ig-post-en`, `site` (www.dailyclassical.co). Sonuçlar ASC › Analytics › Acquisition › Campaigns'te, en az 5 kurulumdan sonra.
- **Promotional Text:** TR ve EN zaten girilmiş (1.1 gönderiminde), reklam mesajıyla uyumlu.

**13 Kasım öğleden sonra, SDK kararı:** Meta, SDK'sız uygulamada iOS 14+ kampanyasında uygulamayı seçtirmedi; SKAdNetwork yapılandırması önce Meta'ya uygulama olayı gelmesini istiyor. Oytun'un kararıyla **Meta SDK eklendi (1.2, build 7 yüklendi (6'daki manifest amacı yanlıştı))**:
- `FacebookCore` 18.1.x (SPM), sınırlı mod: ATT yok, IDFA yok (`FacebookAdvertiserIDCollectionEnabled=false`), otomatik açılış/kurulum olayı açık; Info.plist'te App ID ve client token (gizli değil). Meta for Developers'ta "Log in-app events automatically" kapalı (satın almalar elle loglanıyor).
- `Core/Services/AdAttribution.swift` artık SDK'yı başlatıyor (`AppDelegate`) ve olay gönderiyor: karşılama bitti (`completedTutorial`), ilk eser (`viewedContent`, kurulum başına bir kez), deneme (`startTrial`), satın alma (`logPurchase`, fiyat ve para birimiyle). **SKAdNetwork/AdAttributionKit dönüşüm değerlerini artık SDK yönetiyor**; uygulamanın kendi değer güncellemeleri kaldırıldı.
- Admin paneli reklam sayımı kaba değere geçti (orta = eser, yüksek = deneme/satın alma); Events Manager'daki kaba değer eşlemesi buna göre yapılacak.
- Gizlilik: manifestte Product Interaction, Device ID, Purchase History'ye Developer's Advertising or Marketing amacı (Third-Party Advertising değil: Meta bizim reklamlarımızı gösteriyor); politika (13 Kasım) Meta SDK'yı anlatıyor. **App Store Connect › App Privacy aynı şekilde güncellenecek [Oytun].**
- Simülatörden Meta'ya "Uygulama etkinleştirme" ve "İçerik görüntüleme" ulaştı. Events Manager › SKAdNetwork › "Facebook SDK" yöntemi Meta SDK'yı tanıyınca açılacak (birkaç saat); sonra hassas/kaba değerler ayarlanır, TR kampanyasında iOS 14+ uygulama seçimi açılır.
- TR kampanya taslağı mevcut ("DailyClassical TR - Yükleme", ₺200/gün, iOS 14+ açık, uygulama seçimi bekliyor). Reklam seti/reklamlar ve EN kampanyası SKAdNetwork ayarından sonra.

**1.2 gönderildi (13 Kasım, build 7).** Oytun "onay geldi" dediğinde sırayla:
1. **[Oytun] Railway:** `LATEST_APP_VERSION=1.2` (Variables; "Apply changes" şeridine basmayı unutma). [Claude] `/v1/config`'te doğrular.
2. **[Claude, Chrome] Meta Events Manager › SKAdNetwork:** "Facebook SDK" yöntemi (SDK tanınınca açılır); kaba değerler: düşük = açılış/karşılama, orta = eser (`viewedContent`), yüksek = deneme/satın alma.
3. **[Claude, Chrome] Kampanya taslakları:** TR (₺200/gün; iOS 14+ uygulama seçimi, reklam seti Türkiye + yalnız Instagram, 3 reklam) ve EN (₺250/gün; ABD, BK, Kanada, Avustralya, İrlanda, Yeni Zelanda). Yayına alma Oytun'un onayıyla.
4. **[Oytun] Ads Manager › Hesaba Genel Bakış:** ilk kampanya öncesi istenen hesap bilgileri.

**Sırayla yapılacaklar:**
1. **[Oytun, Claude Chrome'da yönlendirir] Meta hesapları:** Business portföyü, reklam hesabı (TRY, İstanbul saat dilimi), ödeme yöntemi; @dailyclassical.co'yu ve bir Facebook sayfasını portföye bağlamak.
2. **[Oytun + Claude] Kök alan adı → sunucu:** Apple rapor kopyalarını yalnızca `dailyclassical.co`'ya gönderir; bugün kök alan adı GoDaddy'nin yönlendirmesinde (POST'a 405). GoDaddy kök alan adında CNAME/ALIAS desteklemediği için öneri: DNS'i Cloudflare'e taşımak (ücretsiz; alan adı GoDaddy'de kalır). Bütün kayıtlar (www ve api CNAME, e-posta MX, Resend SPF/DKIM TXT) aynen kopyalanır, kök alan adı CNAME (flattening) ile Railway'e, Railway'e `dailyclassical.co` özel alan adı eklenir. Doğrulama: `POST https://dailyclassical.co/.well-known/skadnetwork/report-attribution/` boş gövdeyle 400 döner (bugün 405). Meta'nın kendi raporlaması buna bağlı değil, yalnızca bizim paneldeki sayılar. **11 Kasım envanteri (GoDaddy, ns07/ns08.domaincontrol.com, DNSSEC yok):** kök A 15.197.225.128 + 3.33.251.168 (GoDaddy yönlendirmesi, kalkacak); `www` CNAME 8891qk78.up.railway.app; `api` CNAME 7mf8typj.up.railway.app (ikisi de aynı backend servisi); `send` CNAME send.forge.rmta.net (Resend); `resend._domainkey` TXT (DKIM); `_dmarc` TXT (p=quarantine, rua GoDaddy'nin adresi); `_railway-verify.www` ve `_railway-verify.api` TXT; `_domainconnect` CNAME (GoDaddy'ye özel, taşınmaz). Kökte MX yoktu (hello@ e-posta almıyordu); Email Routing ile çözüldü. Sunucu hazır (11 Kasım): kökten gelen sayfa istekleri www'ye 301, `/.well-known/...` kökte cevaplanır, ağ kimliği olmayan gövde 400. **Cloudflare kuruldu (11 Kasım):** hesap Oytun'da, alan adı eklendi (Free); kayıtlar kopyalandı (Railway ve Resend kayıtları **DNS only**, `_domainconnect` silindi). Railway'in planı üçüncü özel alan adına izin vermediği için kök alan adı Railway'e değil **Cloudflare Worker `dailyclassical-apex`**'e bağlı (`backend/cloudflare/apex-worker.js`, panelden elle kuruldu, rota `dailyclassical.co/*`, kökte proxied yer tutucu `A 192.0.2.1`): iki `/.well-known/...report-attribution/` yolunu `api.dailyclassical.co`'ya iletir, gerisini www'ye 301. workers.dev adresinde denendi (yönlendirme, 400, geçerli test raporu kaydedildi ve silindi). **Tamamlandı (11 Kasım akşamı):** GoDaddy'de ad sunucuları `cameron/meiling.ns.cloudflare.com` oldu, alan adı Cloudflare'de aktif, Universal SSL (Let's Encrypt) çıktı. Doğrulandı: `https://dailyclassical.co/...` → www'ye 301 (yol ve parametre korunuyor); iki `/.well-known/.../report-attribution/` yolu 405 yerine 400 (API'ye ulaşıyor); www ve api 200; Resend kayıtları (send MX/SPF, DKIM) yayında. **Email Routing (yapıldı, 11 Kasım):** hello@dailyclassical.co → Oytun'un Gmail'i (yalnızca hello@, catch-all kapalı). Kökte Cloudflare MX ×3 + SPF `include:_spf.mx.cloudflare.net` + DKIM `cf2024-1._domainkey`; Resend gönderimi `send.` alt alanında, etkilenmedi. Yeni adres gerekirse (support@, privacy@) Cloudflare › Email Routing › Routing rules.
3. **[Claude, Chrome] Meta for Developers'ta uygulama kaydı** (App Store ID 6820556910) ve Events Manager › SKAdNetwork ayarının kontrolü.
4. **[Claude] İlk kampanyalar, 1.1 yayına çıkana kadar:** Trafik kampanyası → App Store bağlantısı, TR ve EN için ayrı `ct` etiketiyle (App Store Connect › Analytics › Campaigns'te bağlantı üretilir). **1.1'den sonra:** Uygulama tanıtımı (yükleme) kampanyaları, SKAdNetwork ile; Meta yüklemeye göre optimize eder.
5. **Promotional Text (App Store Connect › sürüm sayfası):** incelemesiz, istenildiği an değişir; açıklamanın üstünde durur, aramaya etkisi yok (170 karakter). Önerilen (11 Kasım): TR "Her gün bir senfoni, konçerto ya da sonat: dakika dakika bir dinleme rehberi ve aynı dünyadan bir tabloyla. Bugünün eseri her zaman ücretsiz." EN "A symphony, concerto or sonata every day, with a minute-by-minute listening guide and a painting from the same world. Today's piece is always free." Kampanyalar başlayınca reklamın sözüyle aynı yapılır.
6. **[Claude] Görseller:** 4:5 akış ve 9:16 hikâye/reels, TR ve EN; mağaza görsellerinden ve Instagram gönderilerinden; kısa bir ekran kaydı (Bugün → eser → tablo). Abonelik ve deneme ifadeleri ödeme ekranındaki kurala uyar (deneme fiyattan önde değil).
7. **Bütçe:** önce küçük bir test (iki pazar ayrı, 7–10 gün), sonra iyi çalışanı büyütmek; tutarı Oytun belirler. Haftalık değerlendirme: Meta sonuçları + admin + App Store Connect.

## İçerik

- **Uygulama boyutu (25 Ekim, çözüldü):** Tablo hero'ları yalnızca takvimdeki eserler için gömülüyor; gömülü görseller 135 MB → 39 MB, widget 29 MB → 2,7 MB. Gerisi Railway'den iner.

- **[Oytun + Claude] Beethoven 9 finali:** Spotify'da iki parça (6:26 + 17:35). Duraklar bölüm toplamı olarak yazılı; uygulamanın bunları toplam mı, ikinci parçaya göre mi göstereceğine karar verilecek.
- **[Claude] Mozart 41 tablosu:** Hubert Robert, *Dikilitaş* yalnızca 1952 px; daha büyük bir kaynak bulunursa değiştirilecek.
- **[Oytun] Türkçe native okuma:** İçerik ve arayüz metinleri (paywall başlığı, "y. 1818" gibi ifadeler, "kadans/kadenza"). Mağaza görseli 2, açıklama ve tanıtım sayfasında "zamansız bir kayda göre" geçiyor; İngilizcesi "timed to a great recording" (büyük bir kayda göre zamanlanmış). Bilinçli bir seçimse kalsın, değilse "seçkin bir kayda göre" gibi bir ifade düşünülebilir.
- **[Oytun] Resmi Spotify logosu:** "Spotify'da aç" butonları için Spotify'ın marka kurallarına uygun asset. Albüm kapağı gösterilmediği ve butonlar yalnızca metin olduğu için gerekmeyebilir; bilinçli bir karar verilmeli.

## Tasarım denetiminden kalanlar (küçük)

- **[Claude] Dokunma alanı:** Metin içi sözlük terimlerinin 44 pt dokunma alanı yok (`RichTextView` yalnızca `Text` bağlantısı); TextKit ya da `TextRenderer` sarmalayıcısı gerekir.
- **[Claude] E-posta değiştirme:** Hesap › E-posta satırı yalnızca bilgi; değiştirme akışı yok (`account.changeEmail.title` anahtarı ayrılmış).
- **[Oytun] Kontrol edilmemiş durumlar:** Premium arama sonuçları ve giriş yapılmış ekranların (Hesap, favoriler) cihazda görsel kontrolü; 1.1 TestFlight build'iyle bakılabilir. ("Şeffaflığı Azalt" 11 Kasım'da kontrol edildi.)

## Altyapı ve test

- **[Claude] Görselleri dosya depolama servisine taşımak (ertelendi):** Bugün bütün görseller (hero, thumb, full, widget; 114 eserde birkaç yüz MB) git reposunda (`backend/public/images`) duruyor ve Railway her deploy'da onları API'yle birlikte yayınlıyor. Katalog büyüdükçe repo ve her deploy şişiyor. Hedef: Cloudflare R2 (ya da S3) + CDN; `npm run images` çıktıyı oraya yükler, `ASSETS_BASE_URL` (env.ts'te hazır) görsel adreslerini oraya çevirir, repodan `public/images` çıkar. Uygulama değişmez (adresleri API'den alıyor). **Ertelendi (Oytun'un kararı, 9 Kasım):** kullanıcı sayısı belirli bir düzeye gelince yapılacak; o zamana kadar git ve Railway yetiyor. Erken yapmayı gerektirebilecek işaretler: Railway deploy'unun belirgin uzaması, repo boyutunun GitHub sınırlarına yaklaşması, görsel trafiğinin Railway faturasında öne çıkması.

- **[Oytun] Yasal metinlerin hukuki okuması:** Kullanım koşulları ve gizlilik metinleri iyi niyetli taslaklar; avukat ya da KVKK danışmanı bakmalı. Veri sorumlusunun adı ve adresi eklenmeli; `hello@dailyclassical.co`'nun e-posta aldığından emin olunmalı.
- **[Oytun] Sandbox'ta kalanlar:** RevenueCat › Customers'ta işlemin görünmesi; uygulamayı silip kurduktan sonra "Satın alımları geri yükle".
- **[Oytun + Claude] Widget, Release build'de:** Gece yarısı yeni günün eserine geçtiğini ve uygulama açılmadan yeni eserleri gösterdiğini kontrol et.
- **Ertelendi (Oytun'un kararı): VoiceOver'ın cihazda denenmesi.** Kod hazır (günler arası geçiş eylemleri, bölüm düğmesi etiketleri, okunur durak zamanları, sözlük terimi ipucu).

## Test notları

- **Debug build:** Premium açık (`EntitlementStore.debugUnlock`), içerik uygulamaya gömülü; production API'ye bağlanır (giriş, favoriler), içerik için `DC_USE_API=1`. Release/TestFlight build'leri StoreKit/RevenueCat ve production API'yi kullanır.
- **Ayarlar › Test** (yalnızca Xcode'dan kurulan build'lerde): "Karşılamayı yeniden göster", "3 gün deneme teklifini göster". Simülatörde `-debugTrialDays 3`, `-debugPremium NO`.
- **Premium test hesabı:** `premium-test@dailyclassical.co`; şifresi git'e girmeyen `backend/test-accounts.local.md`'de. 11 Kasım: production'daki hesap 9 Kasım'da uygulamadan doğrulanmamış ve Premium'suz olarak açılmıştı (App Review girişte kod isterdi); şifre aynı kalarak doğrulandı ve Premium tanımlandı, API'den giriş denendi. Dikkat: `npm run test-user` `.env`'deki son `DATABASE_URL`'i (dev) kullanır; production için adresi açıkça ver. Yeni hesap: `npm run test-user -- adres@... [--free]`.
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
