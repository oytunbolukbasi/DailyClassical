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

Her ürün için **Review Screenshot** istenir: paywall ekranının bir görüntüsü yeterli (ben hazırlayabilirim).

## 3. RevenueCat [Oytun]

1. [app.revenuecat.com](https://app.revenuecat.com) › yeni proje: **DailyClassical**.
2. **Apps** › **+ App** › **App Store**:
   - Bundle ID: `co.dailyclassical.app`
   - **In-App Purchase Key**: App Store Connect › Users and Access › Integrations › **In-App Purchase** › **+** ile bir anahtar oluştur, `.p8` dosyasını, Key ID'yi ve Issuer ID'yi RevenueCat'e yükle. (Apple ile girişte kullandığın anahtardan farklı bir anahtar.)
   - **App Store Connect API Key** (önerilir, ürünleri otomatik çeker): Users and Access › Integrations › **App Store Connect API** › **Team Keys** › **+**, rol **App Manager**; `.p8` + Key ID + Issuer ID'yi RevenueCat'e ver.
3. **Products**: iki ürünü içe aktar (`…premium.lifetime`, `…premium.monthly`).
4. **Entitlements** › **+**: identifier **`premium`** (kod bu adı arıyor). İki ürünü de bu yetkiye bağla.
5. **Offerings** › **default** offering (Current olarak işaretli) › iki paket:
   - **Lifetime** paketi → `co.dailyclassical.premium.lifetime`
   - **Monthly** paketi → `co.dailyclassical.premium.monthly`
6. **API Keys** › bu uygulamanın **Public app-specific API key**'ini (`appl_` ile başlar) bana ver. Bu anahtar herkese açık, uygulamaya gömülür; gizli değil. **Secret key'i verme.**

Anahtar gelince ben `project.yml` içindeki `REVENUECAT_API_KEY` ayarına yazacağım; uygulama o andan itibaren satın almaları RevenueCat üzerinden yapacak. Anahtar yokken uygulama doğrudan StoreKit 2 kullanıyor (yerel test).

## 4. Sandbox testi [Oytun + Claude]

1. App Store Connect › Users and Access › **Sandbox** › bir test hesabı oluştur (gerçek Apple Kimliğinden farklı bir e-posta).
2. Telefonda Ayarlar › App Store › en altta **Sandbox Account** ile o hesaba gir.
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

Zorunlu boyut: 6.9" (iPhone 16 Pro Max / 17 Pro Max, 1320×2868). 3–6 görüntü önerisi: Bugün, eser sayfası (dinleme durakları), sözlük terimi, Kitaplık, besteci kartı, widget. Görüntüleri simülatörden ben alırım; üstüne başlık yazısı istersen Claude Design'da birlikte hazırlarız.

## 9. TestFlight ve gönderim [Claude + Oytun]

1. Sürüm numarası: `MARKETING_VERSION` 1.0.0, build 1 (project.yml).
2. `schedule.yaml` yayın gününe çekilir, sıra Çaykovski 6 ile başlar; `db:seed` ve `fixtures` çalıştırılır (BACKLOG, "Yayından önce sıfırlanacak test verisi").
3. Xcode › Product › Archive › Distribute App › App Store Connect (ya da `xcodebuild archive` + `-exportArchive`; ben hazırlarım).
4. TestFlight'ta iç test, sonra **Submit for Review**.
