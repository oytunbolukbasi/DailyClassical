# App Store ve RevenueCat hazırlığı

Son güncelleme: 8 Ekim 2026. Sırayla ilerle; her adımın sonunda bana haber verebilirsin, ben kontrol edip bir sonrakine geçeriz. **[Oytun]** senin hesaplarında yapılacak işler, **[Claude]** kod tarafı.

## 1. App Store Connect: uygulama kaydı [Oytun]

1. [App Store Connect](https://appstoreconnect.apple.com) › **Apps** › **+** › **New App**.
   - Platform: iOS
   - Name: **DailyClassical** (alınmışsa "DailyClassical: Classical Music" gibi bir varyant; ad 30 karakteri geçemez)
   - Primary language: English (U.K.) ya da English (U.S.). Türkçe'yi sonra yerelleştirme olarak ekleyeceğiz.
   - Bundle ID: `co.dailyclassical.app` (listede görünüyor, Xcode otomatik imzalama kaydetti)
   - SKU: `dailyclassical-ios`
   - User Access: Full Access
2. **App Information**:
   - Category: Primary **Music**, Secondary **Education**
   - Content Rights: "Does not contain, show, or access third-party content" değil; tablolar kamu malı, kayıtlar Spotify'a bağlantı. **"Yes, it contains third-party content and I have the rights"** seçilmeli (kamu malı tablolar + bağlantılar).
   - Age Rating anketi: her şey "None" → **4+**.
   - Privacy Policy URL: `https://api.dailyclassical.co/privacy`
3. **Agreements, Tax, and Banking** (Business bölümü): **Paid Apps** sözleşmesini imzala, banka ve vergi bilgilerini gir. Bu tamamlanmadan uygulama içi satın almalar sandbox'ta bile ürün döndürmez.

## 2. App Store Connect: uygulama içi satın almalar [Oytun]

Ürün kimlikleri koddakilerle **birebir** aynı olmalı.

**Ömür boyu (Non-Consumable)**
- In-App Purchases › **+** › Non-Consumable
- Reference Name: `Premium Lifetime`
- Product ID: `co.dailyclassical.premium.lifetime`
- Price: **₺699,99** (Türkiye). Diğer ülkeler için App Store'un önerdiği eşdeğer fiyatları kabul et.
- Localization (EN): Display Name `Premium, lifetime` · Description `The full library and search, forever.`
- Localization (TR): Display Name `Premium, ömür boyu` · Description `Kütüphanenin tamamı ve arama, süresiz.`

**Aylık (Auto-Renewable Subscription)**
- Subscriptions › **+** Subscription Group: `Premium`
- Reference Name: `Premium Monthly`
- Product ID: `co.dailyclassical.premium.monthly`
- Duration: 1 Month
- Price: **₺129,99/ay** (Türkiye), diğer ülkeler App Store'un eşdeğeri.
- **Introductory Offer** (ücretsiz deneme): aboneliğin sayfasında **Subscription Prices** › **Introductory Offers** › **+** › tüm ülkeler, başlangıç bugünden, bitiş yok, tür **Free**, süre **3 Days**. Uygulama denemeyi App Store'dan okuyor; ödeme ekranında "3 gün ücretsiz dene" ve yasal açıklama yalnızca kullanıcı denemeye hak kazanıyorsa görünüyor (her Apple Kimliği bir kez).
- Localization (EN): `Premium, monthly` · `The full library and search, renewed monthly.`
- Localization (TR): `Premium, aylık` · `Kütüphanenin tamamı ve arama, her ay yenilenir.`
- Grubun kendisine de yerelleştirme ekle (EN `DailyClassical Premium`, TR `DailyClassical Premium`).

Her ürün için **Review Screenshot** istenir: `design/app-store/review/premium-lifetime.png` (ömür boyu seçili) ve `premium-monthly.png` (aylık + deneme seçili), İngilizce, 1320×2868.

**"Missing Metadata" (RevenueCat › Products, ya da App Store Connect'te ürün durumu):** Zorunlu bir alan boş demek; sandbox'ı engellemez ama ürün "Ready to Submit" olmadan gönderilemez. En sık atlananlar: abonelik **grubunun** kendi App Store Localization'ı (grup sayfasında, ürün sayfasında görünmez), fiyat, Availability (ülkeler), ürün yerelleştirmesi, Review Screenshot.

**İlk gönderimde:** Uygulama sürümünün sayfasında **In-App Purchases and Subscriptions** bölümünden iki ürünü seçip sürüme ekle; ilk satın almalar uygulamayla birlikte incelenir.

İki ayrı görsel alanı var, karıştırma:
- **Review Information › Screenshot** (zorunlu, yalnızca inceleme ekibi görür): `design/app-store/review/premium-*.png`.
- **App Store Promotion › Promotional Image** (isteğe bağlı, 1024×1024, mağazada ürün olarak görünür): `design/app-store/promo/premium-lifetime-1024.png` (Gezgin) ve `premium-monthly-1024.png` (Vernet). Yazı ve ikon yok, yalnızca tablo.

## 3. RevenueCat [Oytun]

1. [app.revenuecat.com](https://app.revenuecat.com) › yeni proje: **DailyClassical**.
2. **Apps** › **+ App** › **App Store**: Bundle ID `co.dailyclassical.app`. Uygulama oluşunca ayarlarında üç sekme dolduracağız (2a–2c).

   **2a. In-App Purchase Key (zorunlu).** RevenueCat satın almaları Apple'dan bu anahtarla doğruluyor.
   1. App Store Connect › **Users and Access** › üstte **Integrations** sekmesi › soldan **In-App Purchase**.
   2. **Generate In-App Purchase Key** (daha önce anahtar varsa **Active** başlığının yanındaki **+**). Ad: `RevenueCat`.
   3. Listede yeni anahtarın satırında **Download API Key** › `SubscriptionKey_XXXXXXXXXX.p8` iner. **Yalnızca bir kez indirilebilir**; güvenli bir yerde sakla (git'e koyma, bana da gönderme).
   4. Aynı sayfanın üstündeki **Issuer ID**'yi kopyala (UUID biçiminde). Görünmüyorsa önce 2b'deki API anahtarını oluştur; Issuer ID ikisinde aynıdır.
   5. RevenueCat'te projeyi aç › sol menünün alt kısmında **Apps** (Web, API keys, Integrations ve Project settings'in hemen üstünde). Listede App Store uygulaması yoksa **+ New** / **Add app config** › **App Store** ile ekle (ad, Bundle ID `co.dailyclassical.app`). Uygulamaya tıklayınca tek, uzun bir ayar sayfası açılır; sekme değil, bölüm bölüm aşağı iner. **In-app purchase key configuration** (ya da "P8 key file from App Store Connect") bölümüne in › `.p8` dosyasını yükle (adını değiştirme), **Issuer ID** alanına yapıştır › en alttaki **Save changes**.
   6. Dosyanın altında **Valid credentials** ve bütün izinlerin yanında tik görmelisin. **Save changes** gri kalıyorsa sayfadaki diğer bölümlerde boş zorunlu alan vardır; hepsini açıp kontrol et.

   Bu, Apple ile giriş için oluşturduğun anahtardan (Certificates, Identifiers & Profiles › Keys) **farklı** bir anahtar; onu kullanma.

   **2b. App Store Connect API Key (önerilir).** RevenueCat ürünleri ve fiyatları App Store Connect'ten kendisi çeker, raporları doldurur.
   1. **Users and Access** › **Integrations** › soldan **App Store Connect API** › **Team Keys** › **Generate API Key** (ya da **+**).
   2. Ad: `RevenueCat`, Access: **App Manager** › **Generate**.
   3. Satırda **Download** › `AuthKey_XXXXXXXXXX.p8` (yine tek sefer). Issuer ID tablonun üstünde, 2a'dakiyle aynı.
   4. **Vendor number:** App Store Connect ana sayfa › **Payments and Financial Reports** › sol üstte yazan numara. (Paid Apps sözleşmesi tamamlanınca görünür.)
   5. RevenueCat › aynı ayar sayfasında **App Store Connect API** bölümü › `.p8` yükle, **Issuer ID** ve **Vendor number**'ı gir › **Save changes**.

   **2c. App Store Server Notifications (önerilir).** İptal, yenileme, iade gibi olaylar RevenueCat'e anında düşer.
   1. RevenueCat › aynı ayar sayfasında **Apple Server to Server notification settings** bölümündeki URL'yi kopyala.
   2. App Store Connect › **Apps** › DailyClassical › **App Information** › **App Store Server Notifications** › **Production Server URL** ve **Sandbox Server URL** alanlarına aynı URL'yi yapıştır, sürüm **Version 2** › **Save**.

   *Key ID:* RevenueCat iki anahtar için de yalnızca `.p8` dosyasını ve Issuer ID'yi istiyor; bir alan Key ID sorarsa, App Store Connect'te anahtarın satırındaki **Key ID** sütununda (ve dosya adında, `…_XXXXXXXXXX.p8`) yazar. App-Specific Shared Secret gerekmiyor (SDK StoreKit 2 kullanıyor).
3. **Products**: iki ürünü içe aktar (`…premium.lifetime`, `…premium.monthly`).
4. **Product catalog › Entitlements** › **New entitlement**: Identifier **`premium`** (kod bu adı arıyor, küçük harf), Display Name `Premium` › **Add**. Entitlement'a girip **Attach** ile iki ürünü de bağla.
5. **Product catalog › Offerings** › **New offering**: Identifier `default`, Display name `Premium`. **Tek** offering, içinde **iki paket** (her ürüne ayrı offering değil):
   - **Add package** › `$rc_lifetime` (Lifetime) → `co.dailyclassical.premium.lifetime`
   - **Add package** › `$rc_monthly` (Monthly) → `co.dailyclassical.premium.monthly`

   Sonra listede `default` satırında **⋯** › **Make current** (yanında tik görünür). Uygulama yalnızca current offering'i okuyor; paketleri içlerindeki ürün kimliğinden tanıyor.
6. **API Keys** › bu uygulamanın **Public app-specific API key**'ini (`appl_` ile başlar) bana ver. Bu anahtar herkese açık, uygulamaya gömülür; gizli değil. **Secret key'i verme.**

**Tamam (8 Ekim 2026):** Public anahtar `project.yml` › `REVENUECAT_API_KEY` ayarında; uygulama satın almaları RevenueCat üzerinden yapıyor. RevenueCat API'si `default` offering'i iki paketle (`$rc_monthly`, `$rc_lifetime`) current olarak döndürüyor; paywall ₺699,99 / ₺129,99 ve 3 günlük denemeyi gösteriyor. Birim testi StoreKit yolunu ayrıca (anahtardan bağımsız, TUR mağazası) kontrol ediyor.

## 4. Sandbox testi [Oytun + Claude]

1. App Store Connect › Users and Access › **Sandbox** › bir test hesabı oluştur (gerçek Apple Kimliğinden farklı bir e-posta).
2. Telefonda **Ayarlar › Geliştirici › Sandbox Apple Hesabı** ile o hesaba gir (yeni iOS sürümlerinde App Store ayarlarında değil). Daha kolayı: Xcode'dan kurulan build'de satın almaya basınca **[Environment: Sandbox]** yazan giriş penceresi açılır, test hesabıyla orada gir.
**Durum (8 Ekim 2026):** Cihazda sandbox hesabıyla aylık abonelik (3 gün deneme) satın alındı, Ayarlar'da "Aylık" görünüyor. Kalan: RevenueCat Customers'ta işlemin görünmesi, silip kurduktan sonra geri yükleme.

3. Ben anahtarla bir Release build kuracağım; paywall'da gerçek fiyatlar görünmeli. Satın al, Ayarlar'da "Ömür boyu"/"Aylık" görünmeli, RevenueCat panelinde işlem düşmeli. Silip yeniden kurduktan sonra **Satın alımları geri yükle** çalışmalı.

## 5. Mağaza sayfası metinleri (taslak) [Oytun onayı]

### English

- **Name:** DailyClassical
- **Subtitle (30):** One classical work a day
- **Promotional text (170):** Today's work, a guide you read while it plays, and a painting to look at. New every day.
- **Description:**

  One classical work a day, with a guide you read while it plays.

  Each day DailyClassical picks a symphony, concerto or sonata and tells you what to listen for, movement by movement: the themes, the turns, the moments not to miss, timed to a great recording. Every guide is written for listeners, not musicians; when a musical term comes up, tap it for a short definition.

  Each piece is paired with a public-domain painting from the same world, from Friedrich to Kuindzhi.

  • Today's piece, free, every day
  • Listening stops timed to the reference recording, which opens in Spotify
  • A glossary of musical terms, explained in plain words
  • Composer portraits and short biographies
  • English and Türkçe
  • Home Screen widgets

  Premium unlocks the full library of past pieces and search across pieces, composers and terms. Choose a one-time lifetime purchase, or a monthly subscription that starts with a 3-day free trial.

  Terms: https://api.dailyclassical.co/terms · Privacy: https://api.dailyclassical.co/privacy
- **Keywords (100):** classical,music,symphony,concerto,listening guide,orchestra,composer,piano,beethoven,mozart

### Türkçe

- **Ad:** DailyClassical
- **Alt başlık (30):** Her gün bir klasik eser
- **Tanıtım metni (170):** Günün eseri, çalarken okuyacağınız bir rehber ve bakacağınız bir tablo. Her gün yenisi.
- **Açıklama:**

  Her gün bir klasik eser, çalarken okuyacağınız bir rehberle.

  DailyClassical her gün bir senfoni, konçerto ya da sonat seçer ve neyi dinlemeniz gerektiğini bölüm bölüm anlatır: temalar, dönüşler, kaçırılmaması gereken anlar, usta bir kayda göre zamanlanmış olarak. Rehberler müzisyenler için değil, dinleyiciler için yazılır; bir müzik terimi geçtiğinde üzerine dokunun, kısa tanımı açılsın.

  Her eser, aynı dünyadan bir tabloyla eşleşir: Friedrich'ten Kuindzhi'ye kamu malı başyapıtlar.

  • Günün eseri, her gün ücretsiz
  • Referans kayda göre zamanlanmış dinleme durakları; kayıt Spotify'da açılır
  • Sade bir dille açıklanmış müzik terimleri sözlüğü
  • Besteci portreleri ve kısa biyografiler
  • Türkçe ve İngilizce
  • Ana ekran widget'ları

  Premium, geçmiş eserlerin tamamını içeren kütüphaneyi ve eserlerde, bestecilerde, terimlerde aramayı açar. Tek seferlik ömür boyu satın alma ya da 3 gün ücretsiz denemeyle başlayan aylık abonelik arasında seçim yapabilirsiniz.

  Koşullar: https://api.dailyclassical.co/terms · Gizlilik: https://api.dailyclassical.co/privacy
- **Anahtar kelimeler (100):** klasik müzik,senfoni,konçerto,dinleme rehberi,orkestra,besteci,piyano,beethoven,mozart

## 6. Gizlilik etiketleri (App Privacy) [Oytun]

App Store Connect › App Privacy › **Get Started**. "Do you or your third-party partners collect data from this app?" → **Yes**. İşaretlenecekler (hiçbiri takip için kullanılmıyor, "Used for Tracking" hep **No**):

| Veri türü | Kullanım amacı | Kullanıcıya bağlı mı |
| --- | --- | --- |
| Contact Info › **Email Address** | App Functionality | Yes |
| Identifiers › **User ID** | App Functionality | Yes |
| Purchases › **Purchase History** | App Functionality | Yes |

Hesapsız kullanımda hiçbir şey toplanmıyor, ama etiketler en geniş durumu (hesap açılmış) gösterir. Analitik, reklam, konum, sağlık vb. yok.

## 7. İnceleme bilgileri (App Review) [Oytun + Claude]

- **Sign-in required:** Hayır, ama hesap özelliklerini denemek için bir test hesabı verilmeli: `premium-test@dailyclassical.co` (şifre git'e girmeyen `backend/test-accounts.local.md` dosyasında). Bu hesapta hediye Premium var; inceleme ekibi kilitli içeriği satın almadan görebilir.
- **Notes (EN, öneri):**

  DailyClassical shows one classical work a day with a listening guide. Today's piece is free; Premium (one non-consumable, and one monthly subscription with a 3-day free trial) unlocks past pieces, search, and each day's painting as a wallpaper (saved to Photos with add-only access). The demo account has complimentary Premium for review. Recordings open in Spotify; we do not stream audio. Paintings are public domain; sources are listed in Settings › Painting and recording sources. Accounts can be deleted in Settings › Account › Delete account; Sign in with Apple accounts are revoked with Apple on deletion.

- **Contact:** ad, telefon ve e-posta (senin bilgilerin).

## 8. Ekran görüntüleri [Claude, Oytun onayı]

Zorunlu boyut: 6.9" (1320×2868). Taslak set hazır (EN + TR, 6'şar görüntü): `design/app-store/out/<dil>/01–06.png`, genel bakış `design/app-store/contact-sheet.png`. Sıra: Bugün, dinleme durakları, sözlük, Kitaplık, besteci, duvar kâğıdı (Premium).

- Ham ekranlar: `ios/scripts/app-store-shots.sh <simülatör-udid>` (Debug build; `App/ScreenshotScene.swift` launch argümanlarıyla her ekranı doğrudan açar). `design/app-store/raw/` git'e girmez.
- Çerçeve: `design/app-store/frame.html` (başlıklar ve metinler burada), `design/app-store/render.sh` ile 1320×2868 PNG.
- İçerik değişince (ör. yayın günü takvimi) iki komutla yeniden üretilir.

## 9. TestFlight ve gönderim [Claude + Oytun]

**Hazır (8 Ekim 2026):** Sürüm 1.0.0 (build 1); `ITSAppUsesNonExemptEncryption = NO` (yalnızca HTTPS, her yüklemede şifreleme sorusu çıkmaz); gizlilik manifestleri (`Resources/PrivacyInfo.xcprivacy`, widget'ta ayrıca; App Privacy etiketleriyle aynı). Archive Xcode Organizer'da görünür.

1. **Yükleme:** `cd ios && xcodebuild -exportArchive -archivePath "<archive>" -exportOptionsPlist ExportOptions.plist -exportPath build/export -allowProvisioningUpdates` (Xcode'daki hesapla App Store Connect'e yükler). Ya da Xcode › Window › Organizer › **Distribute App** › App Store Connect › Upload. Sonraki yüklemelerde `CURRENT_PROJECT_VERSION` bir artırılır.
2. App Store Connect › TestFlight: build işlenince (10–30 dk) iç testçilere (Internal Testing) açılır; telefonda TestFlight uygulamasından kurulur. TestFlight'ta satın almalar yine sandbox'tır, para çekilmez.
3. **İnceleme süresince takvim:** İncelemeci uygulamayı o günkü sunucu içeriğiyle görür. Gönderimden onaya kadar `schedule.yaml` ileri bir tarihe başlatılmaz (boş Bugün/Kitaplık = red riski). Şu anki test takvimi (bütün eserler yayında) inceleme için en güvenlisi.
4. Sürüm sayfasında: ekran görüntüleri (§8), metinler (§5), iki satın alma ürünü (In-App Purchases and Subscriptions), inceleme bilgileri (§7), **Version Release: Manually release this version** › **Submit for Review**.
5. **Yayın günü:** `schedule.yaml` › `start` o güne, sıra Çaykovski 6 ile; push (content-publish yayındaki veritabanına yazar, uygulama en geç bir dakikada görür). Sonra App Store Connect'te **Release This Version**. Gerekirse mağaza görsellerinin 1. karesi yeniden üretilir (§8).
6. Yayından sonra içerik (yeni eserler, takvim) uygulama sürümü gerektirmez; yalnızca kod değişiklikleri yeni build ister.
