# Yapılacaklar

Son güncelleme: 17 Ekim 2026. **[Claude]** kod ve içerik tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler. İçerik durumu ve zamanlama `content_status.md`'de, proje bilgisi `project_information.md`'de.

## Yayın

- **[Oytun] App Review:** 1.0.0 (1) 9 Ekim'den beri "Waiting for Review". 17 Ekim'de Apple Developer › Contact üzerinden durum sorusu gönderildi; yanıt e-postayla gelecek. Gönderim geri çekilip yeniden yollanmayacak (sıra kaybolur).
- **[Oytun + Claude] Yayın günü:** Onay gelince `schedule.yaml` › `start` yayın gününe, sıra Çaykovski 6 ile; `npm run db:seed && npm run fixtures`, push; ardından App Store Connect › **Release This Version**. Gerekirse mağaza görsellerinin 1. karesi yeniden üretilir.
- **[Claude] 1.0.1 build'i:** Kod hazır (Rönesans dönemi etiketi, 6 bölümlük bölüm seçici, Koşullar/Gizlilik/site bağlantıları www'de, favorileri bildiren gizlilik manifesti). Build 2 olarak arşivlenip yüklenecek, 1.0.0 onaylandıktan sonra incelemeye gidecek. Mahler 3 bu sürüm yayında olmadan takvime girmeyecek.
- **[Oytun] Yayından sonra Railway:** `APP_STORE_URL` eklenecek. Güncelleme istemek için `LATEST_APP_VERSION` (bir kez önerir) ya da `MIN_APP_VERSION` (zorunlu ekran); normalde ikisi de boş.

## İçerik

- **[Oytun] Kulakla zamanlama:** Takvim dışı 45 eser ve yayındaki 14 eserin durakları hâlâ tahmini (≈). Sıra ve liste `content_status.md`'de; ilk haftadan Mozart 41 ve Chopin 1. Piyano Konçertosu kaldı.
- **[Oytun] Dvořák Çello Konçertosu II–III ince ayarı:** Tahminle kapatıldı; en olası kaymalar II 6:30 ve 8:30–10:30, III 8:30 ve 10:00–11:30.
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

- **[Oytun] Yasal metinlerin hukuki okuması:** Kullanım koşulları ve gizlilik metinleri iyi niyetli taslaklar; avukat ya da KVKK danışmanı bakmalı. Veri sorumlusunun adı ve adresi eklenmeli; `hello@dailyclassical.co`'nun e-posta aldığından emin olunmalı.
- **[Oytun] Sandbox'ta kalanlar:** RevenueCat › Customers'ta işlemin görünmesi; uygulamayı silip kurduktan sonra "Satın alımları geri yükle".
- **[Oytun + Claude] Widget, Release build'de:** Gece yarısı yeni günün eserine geçtiğini ve uygulama açılmadan yeni eserleri gösterdiğini kontrol et.
- **Ertelendi (Oytun'un kararı): VoiceOver'ın cihazda denenmesi.** Kod hazır (günler arası geçiş eylemleri, bölüm düğmesi etiketleri, okunur durak zamanları, sözlük terimi ipucu).

## Test notları

- **Debug build:** Premium açık (`EntitlementStore.debugUnlock`), içerik uygulamaya gömülü; production API'ye bağlanır (giriş, favoriler), içerik için `DC_USE_API=1`. Release/TestFlight build'leri StoreKit/RevenueCat ve production API'yi kullanır.
- **Ayarlar › Test** (yalnızca Xcode'dan kurulan build'lerde): "Karşılamayı yeniden göster", "3 gün deneme teklifini göster". Simülatörde `-debugTrialDays 3`, `-debugPremium NO`.
- **Premium test hesabı:** `premium-test@dailyclassical.co`; şifresi git'e girmeyen `backend/test-accounts.local.md`'de. Yeni hesap: `npm run test-user -- adres@... [--free]`.
- **Simülatörler:** iPhone 18 Pro iOS 27.0, iPhone 17 iOS 26.5. Telefon iOS 27.0.1; cihaz davranışı için iOS 27 simülatörü esas.
- Telefondaki "Ömür boyu", Xcode'un yerel StoreKit ortamındaki bir test satın almasından; hesaba bağlı değil, uygulama silinince gider.

## Tamamlananlar (özet)

- **17 Ekim:** Beethoven 3, Vivaldi İlkbahar, Ay Işığı (referans Barenboim'e geçti), Dvořák Çello kulakla zamanlandı. Dokümanlar `project-knowledge/` altında üç dosyada toplandı.
- **16 Ekim:** TR'de pizzicato "parmakla çekmek" (sözlük + 25 eser). Durak Zamanlayıcı kuruldu ve düzeltildi.
- **11 Ekim:** 50 eserlik Ekim partisi birleştirildi (64 eser, 69 terim, 29 besteci); Rönesans dönemi (migration 0011); Türkiye'de çalınmayan üç kayıt değiştirildi.
- **9 Ekim:** www.dailyclassical.co tanıtım sayfası (Claude Design), destek/gizlilik/koşullar sayfaları ana alan adında; Şostakoviç 5 tablosu Malevich → Repin; App Store'a gönderim.
- **8 Ekim:** Karşılama akışı (§09), paywall'da aylık + deneme seçili; Premium faydaları (kaçırılan günler, tablo duvar kâğıdı); fiyatlar (₺699,99 ömür boyu, ₺129,99/ay + 3 gün deneme); RevenueCat; Apple ile giriş; Neon dev branch'i; yasal sayfalar; production (api.dailyclassical.co, Railway ABD doğu); 43 maddelik tasarım denetimi; mağaza görselleri; TestFlight'a 1.0.0 (1).
- **7 Ekim:** İstek sınırlama, koyu mod tokenları, sözlük kısa tanımları, içerik güncelleme servisi (content-publish, widget akışı, `/v1/config`), eser türleri (`form`), 4 yeni eser.
- **5–6 Ekim:** Widget'lar (üç boy, üç mod), HEIC görseller, ana ekran A düzeni, e-posta doğrulama kodu, hediye premium.
