# Brief: dailyclassical.co tanıtım sayfası (Claude Design)

Bu metni Claude Design'da yeni bir dosyaya yapıştır. Tek sayfalık, hareketli, sade bir site istiyoruz. Tek amacı ziyaretçiyi App Store'a götürmek.

## Referans: getdailyart.com (neyi alıyoruz, neyi almıyoruz)

**Alıyoruz:**
- **Büyük, kendinden emin bir serif başlık**, altında tek cümle ve indirme butonu. İlk ekranda başka bir şey yok.
- **Tablolarla dolu bir sahne.** Hero'da tablolar yüzer gibi dağılıyor; kaydırınca hafif paralaksla kayıyorlar.
- **Ekranın ortasında sabit bir telefon.** Kaydırdıkça telefonun içindeki ekran ilerliyor; iki yandaki başlık ve kısa metin yumuşakça değişiyor.
- **Hep görünen indirme butonu.** Hero'dan sonra ekranın altında küçük bir cam kapsül içinde App Store rozeti duruyor.

**Almıyoruz:**
- **Puan, yorum ve indirme sayısı:** henüz yok; uydurma hiçbir şey olmayacak.
- **İstatistik, kategori listesi, SSS, dil şeridi:** fazla bilgi.
- **Google Play:** yalnızca iPhone.
- **Koyu, siyah zemin:** bizim kimliğimiz kâğıt rengi (koyu mod aşağıda).

## Kimlik (uygulamayla aynı; `design/SPEC.md`)

- **Renkler:**
  - Açık: zemin `#F5F2EC`, mürekkep `#1E1B17`, ikincil `#5E5852`, vurgu `#6B4A2B`.
  - Koyu: `#111010` / `#F0EBE3` / `#B3ABA1` / `#D4AE84`.
  - Sayfa sistemin açık/koyu ayarını izler.
- **Yazı tipleri:** Başlıklar **Literata** (500; vurgu cümlelerinde italik). Gövde metni ve etiketler SF / sistem sans.
- **Görseller:** Yalnızca katalogdaki kamu malı tablolar ve uygulamanın gerçek ekranları. İllüstrasyon, degrade, stok fotoğraf yok.
- **Logo:** Uygulama ikonu (Literata küçük harf "d", krem zemin üzerinde mürekkep rengi; `design/AppIcon-1024.svg`) ve "DailyClassical" yazısı.
- **Ton:** Sakin, müze gibi. Hareketler yavaş ve yumuşak; zıplayan, esneyen hiçbir şey yok.

## Sayfa akışı (yukarıdan aşağı)

### 1. Hero (tam ekran)
- **Üstte:** Solda ikon ve "DailyClassical", sağda dil seçici (EN / TR).
- **Orta:**
  - Başlık (Literata, büyük): **EN** "One classical work a day." · **TR** "Her gün bir klasik eser."
  - Alt metin (sans, ikincil renk):
    - **EN** "A symphony, a concerto or a sonata, chosen for today, with a listening guide and a painting from the same world."
    - **TR** "Bugün için seçilmiş bir senfoni, konçerto ya da sonat; bir dinleme rehberi ve aynı dünyadan bir tabloyla."
  - Resmi **"Download on the App Store"** rozeti; dile göre "App Store'dan İndirin" sürümü.
- **Sahne ve hareket (öneri):** Arkada katalogdan 6–8 tablo, farklı boyutlarda dağınık duruyor. Yavaşça süzülüyor, kaydırınca paralaksla ayrılıyor.
- **Bize özgü bir dokunuş:** Ortada uygulamadaki **tarih çipi** ("8 · Perşembe · Ekim"). Birkaç saniyede bir gün ilerliyor, öne çıkan tablo bir sonrakine yavaşça geçiyor. "Her gün bir eser" fikrini tek bakışta anlatsın.

### 2. Telefon hikâyesi (kaydırmaya bağlı, ekran sabit)
Ortada iPhone çerçevesi içinde uygulamanın gerçek ekranı. Üç adım; her adımda iki yandaki başlık ve metin yumuşakça değişir (karşılama akışıyla aynı metinler):

1. **Bugün ekranı**
   - **EN** "Every day, one piece." / "Chosen for today, with its painting." · **TR** "Her gün tek bir eser." / "Bugün için seçildi, tablosuyla birlikte."
2. **Dinleme durakları**
   - **EN** "Press play, then follow along." / "What to listen for, minute by minute, timed to a timeless recording that opens in Spotify."
   - **TR** "Çalmaya başlayın, sonra takip edin." / "Neyi dinleyeceğiniz, dakika dakika; Spotify'da açılan zamansız bir kayda göre."
   - **İmza hareketi:** Kaydırdıkça telefondaki "şu an" vurgusu bir duraktan diğerine geçer; uygulamadaki okuma odağının aynısı.
3. **Sözlük**
   - **EN** "Written for listeners." / "Tap a musical term for a short, plain explanation."
   - **TR** "Dinleyiciler için yazıldı." / "Bir müzik terimine dokunun, kısa ve sade bir açıklama açılsın."
   - Telefonda sözlük sheet'i aşağıdan yükselir.

**Mobilde:** Sabit telefon yerine her adım alt alta: önce metin, sonra telefon.

### 3. Tablolar bandı
- Bütün kataloğun tabloları yatay, çok yavaş akan bir şerit halinde. Üzerine gelince (mobilde dokununca) künye görünür: sanatçı, *eser*, yıl.
- Tek satır başlık: **EN** "Paintings from the same world." · **TR** "Aynı dünyadan tablolar."

### 4. Kapanış
- Başlık: **EN** "Today's piece is waiting." · **TR** "Bugünün eseri sizi bekliyor."
- App Store rozeti. Masaüstünde yanında küçük bir **QR kodu** ("Telefonunuzla tarayın"), mobilde yalnızca rozet.
- Altında küçük not: **EN** "Free to start. Premium unlocks the whole library." · **TR** "Ücretsiz başlayın. Premium kütüphanenin tamamını açar." Fiyat yazmıyoruz.

### Alt bilgi
Destek (`/support`) · Gizlilik (`/privacy`) · Koşullar (`/terms`) · `hello@dailyclassical.co` · dil seçici · © 2026 DailyClassical. Bu sayfalar zaten yayında ve aynı sitede kalacak.

### Hep görünen buton
Hero kaybolunca altta ortalanmış küçük bir **cam kapsül** belirir: ikon, "DailyClassical" ve App Store rozeti. Kapanış bölümüne gelince kaybolur.

## Kurallar

- **Bilgi az:** Toplam 4 bölüm, her bölümde en fazla bir başlık ve bir cümle. "Özellik listesi" yok.
- **Erişilebilirlik:**
  - **Hareketi azalt** açıksa bütün hareketler durur; tablolar sabit, adımlar sade geçişle değişir.
  - Metin kontrastı en az 4.5:1.
  - Klavyeyle gezilebilir; görsellerin alternatif metni künyesidir.
- **Performans:**
  - Tablolar WebP/JPEG; HEIC tarayıcıların çoğunda açılmıyor.
  - İlk ekran 1 saniyede görünür; animasyonlar CSS ya da hafif JS ile.
- **Gizlilik:** Çerez, analitik, üçüncü taraf takip yok (gizlilik metnimiz "takip yok" diyor). Fontlar siteden servis edilir; Google Fonts bağlantısı yok.
- **Diller:** EN ve TR, tarayıcı diline göre açılır, elle değiştirilebilir.
- **Paylaşım:** Open Graph görseli (1200×630, Vernet tablosu ve başlık), sekme ikonu, Safari'de **Smart App Banner** (`apple-itunes-app`, app id `6820556910`).
- **App Store linki:** `https://apps.apple.com/app/id6820556910` (yayına çıkınca çalışır).

## Malzemeler (repoda)

- **Tablolar ve künyeler:** `content/paintings.yaml`; görseller `backend/public/images/paintings/`. Web için JPEG/WebP'yi ben üreteceğim.
- **Uygulama ekranları:** `design/app-store/raw/<dil>/01–06.png` (1320×2868, temiz durum çubuğu).
- **İkon:** `design/AppIcon-1024.svg`. **Font:** `ios/DailyClassical/Resources/Fonts/Literata-*.ttf` (OFL).
- **Mağaza görselleri** (ton için): `design/app-store/out/`, `header/`, `search/`.

## Bunlar da çizilsin

- **Masaüstü:** 1440 genişlik, hero ve telefon hikâyesinin 3 adımı.
- **Mobil:** 390 genişlik, bütün sayfa.
- **Koyu mod:** hero ve kapanış.
- **"Hareketi azalt" durumu:** hero.

## Kapsam dışı

Blog, bülten kaydı, fiyat tablosu, giriş/hesap, Android, basın kiti. Sonra eklenebilir.
