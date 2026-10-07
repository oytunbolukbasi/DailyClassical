# Yapılacaklar

Son güncelleme: 7 Ekim 2026. Köşeli parantez içinde işin sahibi var: **[Claude]** kod tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler.

## Sıradaki işler (kod)
0. **[Claude] İçerik güncelleme servisi: uygulama sürümü çıkmadan yeni içerik.** 1.0'a girmesi gerekenler en üstte.
   - **Mevcut durum:** Release build içeriği API'den alıyor ve internetsiz açılış için diske önbelleğe alıyor. Yeni eserlerin tabloları sunucudan iniyor. Tür ve dönem alanları bilinmeyen değerlere dayanıklı (eski sürüm yeni bir türü "diğer" olarak gösterir).
   - **Widget (1.0 için şart):** Widget şu an uygulamaya gömülü veriyi ve tabloları okuyor, sonradan eklenen eserleri göremez. Uygulama önümüzdeki günlerin kartlarını (başlık, besteci, küçük tablo JPEG'i) App Group'a yazacak; widget önce oradan, yoksa gömülü veriden okuyacak.
   - **Yayın hattı:** İçerik `main`'e girince bir GitHub Action `content:build` ve `db:seed` çalıştıracak (production `DATABASE_URL` GitHub secret olarak). Görseller `backend/public/images` içinde, Railway deploy'uyla gidiyor. Ne zaman yayına gireceği `schedule.yaml` ile belirleniyor, yani içerik günler önceden gönderilebilir.
   - **Eski sürümlere dayanıklılık (1.0 için şart):** Kalan enum alanları (kayıt rolü vb.) aynı şekilde toleranslı yapılacak. Bir `/v1/config` uç noktasıyla en düşük uygulama sürümü ve "güncelleme önerisi" bilgisi verilecek.
   - **Kontrol:** Release build'de uçak modu, yeni eser ekleyip seed etme ve widget senaryoları denenecek.
1. **[Claude] Koyu mod ve "Şeffaflığı Azalt" turu:** Her ekranı tasarımdaki koyu karelerle karşılaştırmak. Canvas'ta her ekran koyu temada da çizili (`design/DailyClassical2.html`).
2. **[Claude] Giriş yapılmış ekranlar turu:** Favoriler listesi, Hesap sayfası, premium kullanıcıyla Arama sonuçları. Erişilebilir bir API gerekiyor: Railway domaini ya da lokal `npm run dev`.
3. **[Claude] Denetimdeki küçük maddeler (`design/AUDIT.md`):**
   - Sözlük listesi için kısa tanım (`short`) alanı. Şu an tanımın ilk satırı kırpılıyor.
   - Kaynaklar ekranı eserleri tek tek, sırayla yüklüyor. Toplu yüklenmeli.
   - `Typography.swift` içinde Dynamic Type ile büyümeyen 4 sabit boyut var (meta satırı, çipler, segment kontrolü, toast).
4. **[Claude] Giriş uç noktalarında istek sınırlama (rate limiting):** `/v1/auth/login`, `/register`, `/verify`, `/verify/resend`, `/password-reset`. Yayından önce şart.
5. **[Claude] Paywall görselini gömmek:** Friedrich tablosu hâlâ Wikimedia'dan çekiliyor (ilk açılıştan sonra önbellekte). Görsel hattına eklenip uygulamaya gömülmeli.
6. **[Claude] Yerel ağ izni metninin Türkçesi:** `NSLocalNetworkUsageDescription` yalnızca İngilizce. Sadece debug build'lerde görünüyor.
7. **[Claude] Debug build'i Railway'e bağlamak:** Railway'in herkese açık domaini olunca debug build Mac'teki lokal API yerine oraya bağlanacak.
8. **[Claude] Erişilebilirlik kontrolü:** VoiceOver ile günler arası geçiş ("Önceki gün / Sonraki gün"), bölüm geçişi ve sözlük terimleri.
9. **[Claude + Oytun] Widget'ın renklendirilmiş (tinted) modu:** Cihazda ana ekran stili "Renklendirilmiş" ve "Şeffaf" iken widget'ların görünümü kontrol edilecek.

## İçerik kararları
10. **[Oytun] Dinleme duraklarını yeniden zamanlamak:** Ölçülen sürelerin taslaktan farklı çıktığı bölümler var. 4 yeni eserin bütün durakları da tahmini (kulakla zamanlanmadı). Liste `content/research/retime-needed.md` dosyasında:
    - Şostakoviç III (Largo): +2:40.
    - Mozart 40 I–II ve Schubert 8 I–II: ±25–45 sn.
    - Beethoven 9 finali Spotify'da iki parçaya bölünmüş.
11. **[Oytun] Mravinsky'nin Çaykovski 6 kaydı:** DG'nin resmi albümü Spotify'da yok. Başka bir alternatif kayıt seçilebilir ya da "Spotify'da yok" olarak kalabilir.
12. **[Oytun] Malevich (Şostakoviç 5'in tablosu):** ABD'de küçük bir telif riski var. Uygulama ABD App Store'da da çıkacaksa Repin'in tablosuna geçilmeli.
13. **[Oytun] Resmi Spotify logosu:** "Spotify'da aç" butonları için Spotify'ın tasarım kurallarına uygun resmi asset.
14. **[Oytun] Türkçe içeriğin ve arayüz metinlerinin native okuması:** Çeviriler ve arayüz metinleri (onboarding butonu, "kadans/kadenza" gibi terimler).

## Altyapı
15. **[Oytun] Sırları yenilemek:** Neon şifresi, Resend API anahtarı ve production `JWT_SECRET` bu sohbette açık geçti. Yenilenip Railway değişkenlerine ve lokal `backend/.env` dosyasına işlenmeli.
16. **[Oytun] `api.dailyclassical.co` domainini Railway'e bağlamak:** Railway'de Custom Domain eklenecek, DNS'e CNAME kaydı girilecek. Cloudflare kullanılıyorsa proxy kapalı olmalı. Şifre sıfırlama linkleri ve TestFlight/Release sürümü buna bağlı.
17. **[Claude] Neon'da `dev` branch'i:** Lokal geliştirme ayrı bir branch'e bağlanmalı, testler production verisine dokunmamalı.
18. **[Oytun] Kullanım koşulları ve gizlilik sayfaları:** `dailyclassical.co/terms` ve `/privacy`. App Store bunları istiyor.
19. **[Oytun + Claude] App Store Connect hazırlığı:**
    - Uygulama kaydı (`co.dailyclassical.app`).
    - Uygulama içi satın alma ürünleri: `co.dailyclassical.premium.lifetime` ve `co.dailyclassical.premium.monthly`.
    - App Group (`group.co.dailyclassical`).
    - TestFlight için Release build.

## Yayından önce sıfırlanacak test verisi
- **Takvim:** `content/schedule.yaml` içerik kontrolü için 27 Eylül 2026'dan başlıyor, böylece 10 eserin hepsi Kitaplık'ta görünüyor. Yayından önce `start` yayın gününe çekilecek ve sıra Çaykovski 6 ile başlayacak. Ardından `npm run db:seed && npm run fixtures` çalıştırılacak.
- **Debug premium:** Debug build'lerde premium varsayılan olarak açık (`EntitlementStore.debugUnlock`). Release build'leri etkilemiyor, sıfırlanması gerekmiyor.

## Tamamlananlar (7 Ekim 2026, eser türleri ve yeni içerik)
- **Senfoni dışı eserler:** Her eserin bir türü var: senfoni, piyano/keman/viyolonsel konçertosu, piyano sonatı, yaylı dörtlü, oda müziği, orkestra eseri, koro eseri.
  - Kitaplık'ta Besteci ve Dönem'in önünde **Tür** filtresi var. Katalogda iki tür olunca görünüyor.
  - Konçerto ve sonat kayıtlarında solist başta yazılıyor. Sonat kayıtlarında şef ve orkestra alanı yok.
  - Veritabanına `pieces.form` eklendi (migration 0007). Kayıtlarda şef ve orkestra artık zorunlu değil.
- **Metinler:** "Her gün bir senfoni" gibi ifadeler "Her gün bir klasik eser" oldu. Hatırlatma, ödeme ekranı, widget açıklaması ve Hakkında "eser" diyor.
- **İçerik yapısı:** Her eser kendi dosyasında (`content/<dil>/pieces/<id>.md`). Sözlük ayrı dosyada (`glossary.md`).
- **İçerik rehberi:** `content/CONTENT_GUIDE.md`, sonraki yazarlar ve ajanlar için. İçinde format, üslup, türe özel yaklaşımlar, kayıt ve tablo doğrulama, Türkçe kuralları ve yayın kontrol listesi var.
- **4 yeni eser (EN + TR, kaynak notlarıyla):** Rahmaninov 2. Piyano Konçertosu, Mozart 23. Piyano Konçertosu, Beethoven 3. Piyano Konçertosu, Beethoven 8. Piyano Sonatı "Patetik". Referans kayıtlar senin favorilerin. 6 yeni sözlük terimi var. Rahmaninov'un besteci sayfası eklendi.
- **Ana ekran:** Yukarı çekince eser parmak kalkınca açılıyor (mesafe ya da fiske). Detaydan dönünce tab bar geri geliyor. Eser sayfası ilk karede hazır.

## Tamamlananlar (6 Ekim 2026, görsel kalitesi)
- Görseller HEIC oldu: ana görsel kısa kenar 1800 px (ana ekranın 1290×1750 px alanını karşılıyor), küçük görsel 300 px, zoom için 4000 px "tam" boy (sunucudan, önbellekli).
- Uygulama görselleri ekrandaki gerçek boyutlarına göre açıyor; bugünün tablosu açılışta önceden yükleniyor; model yeni görsel alanlarını okuyor.
- Turner: 4497 px kamu malı fotoğraf, Tate reprodüksiyonunun renk dengesine eşlendi (`backend/scripts/color-match.swift`). Goya mevcut Prado taramasında kaldı.
- Widget kendi küçük JPEG setini kullanıyor (2 MB); uygulamanın görsel klasörünü ikinci kez taşımıyor, bellek riski yok.

## Tamamlananlar (5–6 Ekim 2026, cihaz geri bildirimi)
- **Widget'lar:** Küçük, orta ve büyük boy, açık, koyu ve renklendirilmiş modda, onaylanan canvas tasarımıyla.
  - İnternetsiz çalışıyor, gece yarısı yenileniyor, uygulamanın dilini takip ediyor, dokununca eseri açıyor.
  - Cihazda boş görünme sorunu giderildi: tablolar artık çizim anında yükleniyor, widget bellek sınırını aşmıyor.
- **Ana ekran:** A düzeni (tablo ekranı dolduruyor, metin tab bar'ın üstünde, 30 pt başlık). Yayınlanmış günler arasında kaydırma var.
- **Eser sayfası:**
  - Bölüm göstergesi ve Bölümler tablosu doğru bölüme gidiyor.
  - Hızlı kaydırmadaki çökme giderildi. Renk sağlayıcısı SwiftUI'nin arka plan çizim thread'inde çalışıyordu.
- **Görseller:** 70 MB'tan 5,4 MB'a indi. Uygulamaya gömülü, disk önbellekli, listelerde küçük boyutlu.
- **Şostakoviç portresi:** Leonid Dorenski, 1940, CC BY 4.0. Kaynak satırı besteci sayfasında görünüyor.
- **Diğer:**
  - Arama ekranındaki çizgi kaldırıldı, boş durum ipucu eklendi, son aramalar kalıcı.
  - Ayarlar'dan "Metin boyutu" kaldırıldı. Uygulama sistemin yazı boyutunu takip etmeye devam ediyor.
  - Kitaplık'ta Sözlük butonu Tüm eserler / Favoriler düğmesinin yanında.
- **Yeni:** E-posta doğrulama kodu akışı, premium test kullanıcısı, hesaba bağlı (hediye) premium.

## Test notları
- **Debug build:** Premium açık ve içerik uygulamaya gömülü, yani sunucu olmadan da telefonda tüm uygulama çalışıyor. Release/TestFlight build'leri StoreKit'i ve production API'yi kullanıyor.
- **Premium test hesabı:** `premium-test@dailyclassical.co`. Şifresi git'e girmeyen `backend/test-accounts.local.md` dosyasında.
- **Yeni test hesabı:** `npm run test-user -- adres@... [--free]`
- **Simülatörler:** iPhone 18 Pro iOS 27.0'da, iPhone 17 (019072D1…) iOS 26.5'te. Telefon iOS 27.0.1'de, cihaz davranışı için iOS 27 simülatörü esas alınmalı.
