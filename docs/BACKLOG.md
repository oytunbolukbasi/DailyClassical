# Yapılacaklar

Son güncelleme: 8 Ekim 2026. Köşeli parantez içinde işin sahibi var: **[Claude]** kod tarafı, **[Oytun]** karar ya da hesap erişimi gereken işler.

## Sıradaki işler (kod)
8. **[Claude + Oytun] VoiceOver'ı cihazda denemek:** Kod tarafı tamam: günler arası geçiş eylemleri, bölüm düğmesi etiketleri, okunur durak zamanları, sözlük terimi ipucu. Cihazda VoiceOver açıkken bir kez gezinmek gerekiyor.
9. **[Claude + Oytun] Widget'ın renklendirilmiş (tinted) modu:** Cihazda ana ekran stili "Renklendirilmiş" ve "Şeffaf" iken widget'ların görünümü kontrol edilecek.

## İçerik güncelleme servisi: senden beklenenler
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
- **[Oytun] Yasal metinlerin hukuki okuması:** Kullanım koşulları ve gizlilik metinleri iyi niyetli taslaklar; yayından önce bir avukatın ya da KVKK danışmanının bakması önerilir. Özellikle şirket/şahıs bilgisi (veri sorumlusu adı ve adresi) eklenmeli; şu an yalnızca `hello@dailyclassical.co` var ve bu adresin e-posta alabildiğinden emin ol.
19. **[Oytun + Claude] App Store Connect ve RevenueCat:** Adım adım rehber `docs/APP_STORE.md` içinde (uygulama kaydı, ürünler, RevenueCat, sandbox testi, mağaza metinleri, gizlilik etiketleri, inceleme notları, TestFlight). RevenueCat kodu hazır; public API anahtarı gelince açılacak. Fiyatlar: ömür boyu ₺699,99, aylık ₺129,99 + 3 gün ücretsiz deneme.

## Yayından önce sıfırlanacak test verisi
- **Takvim:** `content/schedule.yaml` içerik kontrolü için 27 Eylül 2026'dan başlıyor, böylece 10 eserin hepsi Kitaplık'ta görünüyor. Yayından önce `start` yayın gününe çekilecek ve sıra Çaykovski 6 ile başlayacak. Ardından `npm run db:seed && npm run fixtures` çalıştırılacak.
- **Debug premium:** Debug build'lerde premium varsayılan olarak açık (`EntitlementStore.debugUnlock`). Release build'leri etkilemiyor, sıfırlanması gerekmiyor.

## Tamamlananlar (8 Ekim 2026, fiyat ve deneme)
- Ömür boyu ₺699,99, aylık ₺129,99. Aylık abonelikte 3 günlük ücretsiz deneme (App Store "introductory offer"). Ödeme ekranında aylık seçiliyken düğme "3 gün ücretsiz dene" oluyor ve altında App Store'un istediği yenileme açıklaması çıkıyor; yalnızca denemeye hak kazanan Apple Kimlikleri için.
- Kullanım koşullarına deneme süresi eklendi. Yerel StoreKit test dosyası güncellendi; birim testi fiyatları ve denemeyi doğruluyor.

## Tamamlananlar (8 Ekim 2026, RevenueCat)
- RevenueCat SDK (purchases-ios 5.93) eklendi. Public anahtar `REVENUECAT_API_KEY` ayarındayken satın alma, geri yükleme ve durum RevenueCat'ten (`premium` yetkisi, `default` offering); anahtar yokken StoreKit 2. Giriş yapan kullanıcı hesap kimliğiyle RevenueCat'e tanıtılıyor.
- Gizlilik metnine RevenueCat eklendi.

## Tamamlananlar (8 Ekim 2026, geçiş ve kararlar)
- **Eser sayfasına geçiş:** Ana sayfayı yukarı çekmek (ya da "Dinlemeye başla") eser sayfasını standart kaydırmayla açıyor; geri dönüş sıradan bir "geri". Zoom geçişi kaldırıldı.
- **Tab bar:** Geçişin kendisiyle birlikte hareket ediyor; geri kaydırmada parmağı takip ederek beliriyor, yarıda bırakılınca gizli kalıyor.
- **Denetim kararları (Oytun):** Bölüm ayırıcıları her bölümde kalıyor; "Spotify'da aç" son bölümden sonra geri gelmiyor; "Kunsthalle Hamburg" olduğu gibi kalıyor; paywall başlığı ve "y. 1818" gibi ifadeler Türkçe native okumada ele alınacak (madde 14).

## Tamamlananlar (8 Ekim 2026, denetim ve tablo)
- **Denetim (`design/AUDIT.md`):** 43 maddenin hepsi kontrol edildi; 23'ü bu turda düzeltildi, 13'ü zaten düzeltilmişti. Öne çıkanlar:
  - Eser görüntüleyicide çift dokunuş dokunulan noktaya yakınlaştırıyor, kaydırma tablonun dışına taşmıyor.
  - Gerçek bağlantı hatası dışındaki hatalar artık "Çevrimdışısınız" değil, "Bir şeyler ters gitti" gösteriyor (Bugün, eser, Kitaplık, Sözlük).
  - Ayarlar alt sayfalarının hepsinde tab bar gizli (Hesap'taki gibi); geri dönünce geliyor.
  - Sözlük terimi bir sheet içinden de açılıyor; Kitaplık'tan açılan eserde "Tüm terimler" artık eser sayfasını kaybettirmiyor.
  - Kaynaklar satırı çevrilebilir tek cümle; İngilizcede "1 minute / 1 movement" tekil-çoğul doğru.
  - Arama'da gereksiz başlık kaldırıldı; kayıt/giriş alt başlıkları tasarımdaki boyutta.
- **Koyu mod:** Sözlük, Kayıtlar ve Besteci sheet'leri, eser sayfası, Ayarlar alt sayfaları ve Arama koyu modda kontrol edildi.
- **Rahmaninov 2 tablosu:** Kuindzhi, *Kızıl Gün Batımı* (1905–8), Metropolitan Sanat Müzesi; Met'in CC0 fotoğrafı, tuval kenarlarından kırpıldı (3675 px).

## Tamamlananlar (8 Ekim 2026, Apple ile giriş)
- Karşılama sheet'inde ("Sevdiğin eserleri sakla") ve kayıt/giriş ekranlarında Apple'ın "Apple ile devam et" butonu. Tek dokunuşla kayıt ya da giriş; e-posta Apple'dan doğrulanmış geldiği için kod adımı yok.
- Sunucu `POST /v1/auth/apple`: Apple'ın kimlik token'ını Apple'ın anahtarlarıyla doğruluyor. Hesap Apple kimliğiyle bulunuyor; ilk girişte aynı doğrulanmış e-postalı hesap varsa birleştiriliyor, yoksa yeni hesap açılıyor. Doğrulanmamış bir e-posta hesabıyla birleştirilirse o hesabın şifresi siliniyor (başkası adına açılmış hesabın ele geçirilmesini önlemek için).
- Apple hesaplarında şifre yok; istenirse "Şifreyi değiştir" (e-postayla sıfırlama) ile eklenebiliyor.
- Hesap silinince Apple bağlantısı iptal ediliyor. Anahtar Railway'de; gerçek bir girişte Apple kabul etti (`/health` → `lastExchange: ok`).
- Migration 0010. Gizlilik metnine Apple ile giriş eklendi.
- Not: Telefondaki "Ömür boyu" premium, Xcode'un yerel StoreKit test ortamında yapılmış bir test satın almasından geliyor; hesaba bağlı değil (satın almalar Apple Kimliği'ne bağlıdır). Uygulama silinince temizlenir.

## Tamamlananlar (8 Ekim 2026, Neon dev branch'i)
- Lokal `backend/.env` artık Neon'un `dev` branch'ine bağlı. Production'dan ayrı olduğu doğrulandı: dev'e yazılan bir test işareti production API'de görünmedi. Lokal migration, seed ve test hesapları artık gerçek kullanıcı verisine dokunmuyor.
- Production'a yalnızca Railway (deploy öncesi migration) ve `content-publish` GitHub Action'ı yazıyor.

## Tamamlananlar (8 Ekim 2026, yasal sayfalar)
- **Kullanım Koşulları ve Gizlilik Politikası** (EN + TR): `api.dailyclassical.co/terms` ve `/privacy`. Metinler `backend/legal/*.md` içinde. Gizlilik metni uygulamanın gerçekte işlediği verilere göre yazıldı: hesap bilgileri, özetlenmiş kodlar, Apple satın almaları, Railway/Neon/Resend, takip yok.
- Uygulama bu sayfaları Hakkında, paywall ve kayıt ekranından uygulama içi tarayıcıda, kendi dilinde açıyor. Web sitesi kurulunca adresler `dailyclassical.co`'ya taşınacak.
- **Sırlar yenilendi** (Neon, Resend, JWT).
- **Hata:** Çıkış yapınca hesaba bağlı premium bayrağı cihazda kalabiliyordu. Artık oturum yoksa sıfırlanıyor.

## Tamamlananlar (8 Ekim 2026, production)
- **Domain:** `api.dailyclassical.co` Railway'e bağlı. SSL var, tüm uç noktalar ve şifre sıfırlama sayfası yanıt veriyor.
- **Railway bölgesi:** ABD doğu (Neon ile aynı bölge). Türkiye'den tekrar eden istekler yaklaşık 0,4 saniye.
- **Yayın hattı:** GitHub secret eklendi. `content-publish` iş akışı elle çalıştırıldı: migration'lar uygulandı, 14 eser production'a yüklendi.
- **Debug build:** Artık Mac'teki sunucuya değil production'a bağlanıyor (giriş, favoriler). İçerik yine gömülü veriden geliyor, `DC_USE_API=1` ile API'den.
- **Telefona Release build kuruldu:** Production'a bağlı. App Store Connect'te ürünler henüz olmadığı için paywall fiyat gösteremez.

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
