# Yapılacaklar

Son güncelleme: 7 Ekim 2026. Köşeli parantez içinde işin sahibi var: **[Claude]** kod tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler.

## Sıradaki işler (kod)
1. **[Claude] Koyu modda Sözlük, Kayıtlar ve Besteci sheet'lerine bakmak:** Ana ekranlar, Hesap, Favoriler, premium Arama ve "Şeffaflığı Azalt" kontrol edildi. Bu üç sheet'e koyu modda ayrıca bakılmadı.
2. **[Claude] Denetimin (`design/AUDIT.md`) kalan küçük maddeleri:** Kısa tanım, toplu yükleme ve Dynamic Type yapıldı. Kalan P2 maddeleri (ör. eser görüntüleyicide zoom'un sınırlandırılması, Today'in yayın tarihini göstermesi) tek tek gözden geçirilecek.
3. **[Claude] Rahmaninov tablosu:** Levitan'ın *Göl* tablosunun açık lisanslı en iyi görüntüsü 2000×1403 piksel. Diğer tablolardan biraz daha yumuşak görünüyor ve Levitan, Çaykovski 6'nın da ressamı. Daha yüksek çözünürlüklü bir alternatif aranabilir (senin onayınla).
7. **[Claude] Debug build'i Railway'e bağlamak:** Railway'in herkese açık domaini olunca debug build Mac'teki lokal API yerine oraya bağlanacak.
8. **[Claude + Oytun] VoiceOver'ı cihazda denemek:** Kod tarafı tamam: günler arası geçiş eylemleri, bölüm düğmesi etiketleri, okunur durak zamanları, sözlük terimi ipucu. Cihazda VoiceOver açıkken bir kez gezinmek gerekiyor.
9. **[Claude + Oytun] Widget'ın renklendirilmiş (tinted) modu:** Cihazda ana ekran stili "Renklendirilmiş" ve "Şeffaf" iken widget'ların görünümü kontrol edilecek.

## İçerik güncelleme servisi: senden beklenenler
- **[Oytun] GitHub secret:** Repo ayarlarında (Settings → Secrets and variables → Actions) `DATABASE_URL_UNPOOLED` secret'ını ekle (Neon'un direct bağlantı adresi). Eklenene kadar Action içeriği yalnızca doğrular, yayınlamaz.
- **[Oytun] App Store linki:** Uygulama App Store'da olunca Railway'e `APP_STORE_URL` ekle. Güncelleme istemek için `LATEST_APP_VERSION` (bir kez önerir) ya da `MIN_APP_VERSION` (zorunlu ekran) kullanılır. Normalde ikisi de boş kalır.
- **[Oytun + Claude] Cihazda widget denemesi:** Release/TestFlight build'inde ana ekrana widget ekle; gece yarısı geçince yeni günün eserine geçtiğini ve uygulama açılmadan yeni eserleri gösterdiğini kontrol et.

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
17. **[Oytun] Neon'da `dev` branch'i:** Neon panelinde production'dan bir `dev` branch'i aç ve bağlantı adresini lokal `backend/.env` dosyasına yaz (ya da bana ver). Şu an lokal geliştirme ve seed doğrudan production veritabanına gidiyor. Bilgisayarda Neon CLI ya da API anahtarı olmadığı için bunu ben açamadım.
17a. **[Oytun] Railway bölgesi:** Neon `us-east-2` (Ohio) bölgesinde. Railway servisi de ABD doğu bölgesinde olmalı. Aksi halde her istek okyanus aşırı birkaç sorgu yapıyor (Türkiye'den lokal ölçüm: `/v1/today` ilk istekte 4 saniye). Sunucuya 1 dakikalık önbellek eklendi, tekrar eden istekler artık anında dönüyor.
18. **[Oytun] Kullanım koşulları ve gizlilik sayfaları:** `dailyclassical.co/terms` ve `/privacy`. App Store bunları istiyor.
19. **[Oytun + Claude] App Store Connect hazırlığı:**
    - Uygulama kaydı (`co.dailyclassical.app`).
    - Uygulama içi satın alma ürünleri: `co.dailyclassical.premium.lifetime` ve `co.dailyclassical.premium.monthly`.
    - App Group (`group.co.dailyclassical`).
    - TestFlight için Release build.

## Yayından önce sıfırlanacak test verisi
- **Takvim:** `content/schedule.yaml` içerik kontrolü için 27 Eylül 2026'dan başlıyor, böylece 10 eserin hepsi Kitaplık'ta görünüyor. Yayından önce `start` yayın gününe çekilecek ve sıra Çaykovski 6 ile başlayacak. Ardından `npm run db:seed && npm run fixtures` çalıştırılacak.
- **Debug premium:** Debug build'lerde premium varsayılan olarak açık (`EntitlementStore.debugUnlock`). Release build'leri etkilemiyor, sıfırlanması gerekmiyor.

## Tamamlananlar (7 Ekim 2026, plan maddeleri, ikinci kısım)
- **Hata: favoriler sunucudan hiç yüklenmiyordu.** API tarihleri milisaniyeli gönderiyor, uygulama bunları okuyamıyordu ve hata sessizce yutuluyordu. Favoriler listesi yalnızca o oturumda kalbe basılanları gösteriyordu. Düzeltildi, test eklendi.
- **Sözlük kısa tanımları:** 40 terimin hepsine iki dilde tek satırlık kısa tanım yazıldı. Kitaplık › Sözlük listesi ve Arama'da bu tanım görünüyor; tam tanım sheet'te. Migration 0009 production'a uygulandı.
- **Kaynaklar ekranı:** Eserler sırayla değil, aynı anda 4'erli yükleniyor.
- **Dynamic Type:** Meta satırı, çipler, segmentler ve toast artık sistem yazı boyutuyla büyüyor. Varsayılan boyuttaki görünüm aynı.
- **Paywall tablosu:** Friedrich tablosu uygulamaya gömüldü, artık Wikimedia'dan çekilmiyor.
- **Yerel ağ izni metni:** Türkçesi eklendi.
- **"Şeffaflığı Azalt":** Bu ayar açıkken ana ekranda tablonun üstünde oluşan düz bant kaldırıldı.
- **Fontlar git'e eklendi:** `.gitignore`'daki `fonts/` kuralı Literata fontlarını da dışarıda bırakıyordu, repo temiz bir kopyadan derlenemiyordu.

## Tamamlananlar (7 Ekim 2026, plan maddeleri)
- **İstek sınırlama:** Altı giriş uç noktasının hepsinde IP ve e-posta başına sınır var (ör. giriş: 15 dakikada IP+e-posta başına 10 deneme). Sınır aşılınca 429 dönüyor ve uygulama "Çok fazla deneme" mesajı gösteriyor. Sayaçlar Postgres'te tutuluyor (migration 0008, production'a uygulandı).
- **Koyu mod:** Renk tokenları tasarımla birebir aynı. Seçili sekme artık vurgu rengi değil, tasarımdaki gibi mürekkep rengi. Birincil cam buton ("Start listening", "Open in Spotify") koyu modda tasarımdaki gibi açık camda krem yazıyla görünüyor.
- **Giriş yapılmış ekranlar:**
  - Hesaba tanımlı (hediye) premium Ayarlar'da "Free" görünüp paywall açıyordu. Artık "Etkin" yazıyor.
  - Hesap ve Şifre değiştir ekranlarında iOS 27'nin çizdiği ikinci, sistem başlığı kaldırıldı.
- **VoiceOver:** Durak zamanları "yaklaşık 4 dakika 30 saniye" olarak okunuyor. Sözlük terimi içeren paragraflar terimin nasıl açılacağını söylüyor.
- **API hızı:** İçerik sorguları sunucuda 1 dakika önbellekte tutuluyor.

## Tamamlananlar (7 Ekim 2026, içerik güncelleme servisi)
- **Yayın hattı:** İçerik `main`'e girince `content-publish` GitHub Action'ı içeriği doğrular, migration'ları çalıştırır ve production veritabanına seed eder. Görseller Railway deploy'uyla gider. Eser, `schedule.yaml`'daki gününde kendiliğinden yayına girer. Uygulama sürümü gerekmez.
- **Widget:** Kendi akışını (`GET /v1/widget`, bugün ve sonraki 3 gün) sunucudan çekiyor ve görselleri App Group'ta önbelleğe alıyor. Uygulama açılmadan gece yarısı yeni güne geçiyor, sonradan eklenen eserleri gösteriyor. İnternet yoksa önbellek, o da yoksa gömülü veri kullanılıyor.
- **Eski sürümlere dayanıklılık:** Bilinmeyen tür, dönem ve kayıt rolü "diğer" olarak okunuyor. Listelerde çözümlenemeyen bir öğe atlanıyor, listenin geri kalanı gösteriliyor. Birim testleri var.
- **Güncelleme istemi:** `GET /v1/config` ile en düşük ve en güncel sürüm bilgisi veriliyor. Eski sürümde ya bir kez "Yeni sürüm var" uyarısı ya da zorunlu güncelleme ekranı çıkıyor. Railway değişkenleriyle yönetiliyor.
- **İçerik rehberi ve README:** Yayın akışı belgelendi.

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
