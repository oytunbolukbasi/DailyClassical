# Yapılacaklar

Son güncelleme: 6 Ekim 2026. Köşeli parantez içinde işin sahibi var: **[Claude]** kod tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler.

## Devam eden
- **[Claude] Arama alanının konumu (iOS 27):** Arama alanı artık sekme yapısına (TabView) bağlı. Ara sekmesi seçilince tab bar alttaki arama alanına dönüşüyor (Apple'ın iOS 26 yöntemi). iOS 27 simülatöründe ve telefonda doğrulanacak.

## Sıradaki işler (kod)
1. **[Claude] Koyu mod ve "Şeffaflığı Azalt" turu:** Her ekranı tasarımdaki koyu karelerle karşılaştırmak. Canvas'ta her ekran koyu temada da çizili (`design/DailyClassical2.html`).
2. **[Claude] Giriş yapılmış ekranlar turu:** Favoriler listesi, Hesap sayfası, premium kullanıcıyla Arama sonuçları. Erişilebilir bir API gerekiyor: Railway domaini ya da lokal `npm run dev`.
3. **[Claude] Denetimdeki küçük maddeler (`design/AUDIT.md`):**
   - Sözlük listesi için kısa tanım (`short`) alanı. Şu an tanımın ilk satırı kırpılıyor.
   - Kaynaklar ekranı eserleri tek tek, sırayla yüklüyor. Toplu yüklenmeli.
   - `Typography.swift` içinde Dynamic Type ile büyümeyen 4 sabit boyut var (meta satırı, çipler, segment kontrolü, toast).
4. **[Claude] Giriş uç noktalarında istek sınırlama (rate limiting):** `/v1/auth/login`, `/register`, `/verify`, `/verify/resend`, `/password-reset`. Yayından önce şart.
5. **[Claude] Uygulama modeli yeni görsel alanlarını okumuyor:** `Piece.swift`, API'nin gönderdiği `thumbUrl`, `placeholderColor`, `creditLine`, `licenseUrl` alanlarını henüz çözmüyor. Gömülü 10 eser için sorun yok, ama yayından sonra eklenecek eserlerin görselleri ve kaynak satırları bunlara bağlı.
6. **[Claude] Paywall görselini gömmek:** Friedrich tablosu hâlâ Wikimedia'dan çekiliyor (ilk açılıştan sonra önbellekte). Görsel hattına eklenip uygulamaya gömülmeli.
7. **[Claude] Bugünün tablosunu açılışta önceden yüklemek:** `ImagePipeline.shared.prefetch` hazır ama henüz çağrılmıyor. Yalnızca gömülü olmayan yeni eserler için önemli.
8. **[Claude] Yerel ağ izni metninin Türkçesi:** `NSLocalNetworkUsageDescription` yalnızca İngilizce. Sadece debug build'lerde görünüyor.
9. **[Claude] Debug build'i Railway'e bağlamak:** Railway'in herkese açık domaini olunca debug build Mac'teki lokal API yerine oraya bağlanacak.
10. **[Claude] Erişilebilirlik kontrolü:** VoiceOver ile günler arası geçiş ("Önceki gün / Sonraki gün"), bölüm geçişi ve sözlük terimleri.
11. **[Claude + Oytun] Widget'ın renklendirilmiş (tinted) modu:** Cihazda ana ekran stili "Renklendirilmiş" ve "Şeffaf" iken widget'ların görünümü kontrol edilecek.

## İçerik kararları
12. **[Oytun] Dinleme duraklarını yeniden zamanlamak:** Ölçülen sürelerin taslaktan farklı çıktığı bölümler var. Liste `content/research/retime-needed.md` dosyasında:
    - Şostakoviç III (Largo): +2:40.
    - Mozart 40 I–II ve Schubert 8 I–II: ±25–45 sn.
    - Beethoven 9 finali Spotify'da iki parçaya bölünmüş.
13. **[Oytun] Mravinsky'nin Çaykovski 6 kaydı:** DG'nin resmi albümü Spotify'da yok. Başka bir alternatif kayıt seçilebilir ya da "Spotify'da yok" olarak kalabilir.
14. **[Oytun] Malevich (Şostakoviç 5'in tablosu):** ABD'de küçük bir telif riski var. Uygulama ABD App Store'da da çıkacaksa Repin'in tablosuna geçilmeli.
15. **[Oytun] Resmi Spotify logosu:** "Spotify'da aç" butonları için Spotify'ın tasarım kurallarına uygun resmi asset.
16. **[Oytun] Türkçe içeriğin ve arayüz metinlerinin native okuması:** Çeviriler ve arayüz metinleri (onboarding butonu, "kadans/kadenza" gibi terimler).

## Altyapı
17. **[Oytun] Sırları yenilemek:** Neon şifresi, Resend API anahtarı ve production `JWT_SECRET` bu sohbette açık geçti. Yenilenip Railway değişkenlerine ve lokal `backend/.env` dosyasına işlenmeli.
18. **[Oytun] `api.dailyclassical.co` domainini Railway'e bağlamak:** Railway'de Custom Domain eklenecek, DNS'e CNAME kaydı girilecek. Cloudflare kullanılıyorsa proxy kapalı olmalı. Şifre sıfırlama linkleri ve TestFlight/Release sürümü buna bağlı.
19. **[Claude] Neon'da `dev` branch'i:** Lokal geliştirme ayrı bir branch'e bağlanmalı, testler production verisine dokunmamalı.
20. **[Oytun] Kullanım koşulları ve gizlilik sayfaları:** `dailyclassical.co/terms` ve `/privacy`. App Store bunları istiyor.
21. **[Oytun + Claude] App Store Connect hazırlığı:**
    - Uygulama kaydı (`co.dailyclassical.app`).
    - Uygulama içi satın alma ürünleri: `co.dailyclassical.premium.lifetime` ve `co.dailyclassical.premium.monthly`.
    - App Group (`group.co.dailyclassical`).
    - TestFlight için Release build.

## Yayından önce sıfırlanacak test verisi
- **Takvim:** `content/schedule.yaml` içerik kontrolü için 27 Eylül 2026'dan başlıyor, böylece 10 eserin hepsi Kitaplık'ta görünüyor. Yayından önce `start` yayın gününe çekilecek ve sıra Çaykovski 6 ile başlayacak. Ardından `npm run db:seed && npm run fixtures` çalıştırılacak.
- **Debug premium:** Debug build'lerde premium varsayılan olarak açık (`EntitlementStore.debugUnlock`). Release build'leri etkilemiyor, sıfırlanması gerekmiyor.

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
