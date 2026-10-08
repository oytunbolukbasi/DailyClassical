# Brief: ilk açılış karşılama akışı (Claude Design)

Bu metni Claude Design'daki DailyClassical tuvaline (`DailyClassical2.html`) yapıştır. Yeni kareleri, mevcut paywall (§4.10) ve karşılama (§4.15–4.16) karelerinin yanına, yeni bir bölüm olarak, açık ve koyu modda ekle.

## Neden

Uygulamayı ilk kez açan kullanıcı şu an Bugün ekranının üstünde tek bir kart ("Her gün bir klasik eser…") ve ardından hatırlatıcı saati seçimini görüyor. Bu akış uygulamayı farklı kılan şeyleri (zamanlanmış dinleme rehberi, sözlük, tablolar) anlatmıyor ve Premium'dan hiç bahsetmiyor. Paywall'ın dilinde kısa ve güzel bir tanıtım istiyoruz: üstte bir tablo, Literata başlık, bir iki satır SF açıklama, düz birincil buton.

## İlkeler

- **Kısa.** En fazla dört kaydırılabilir sayfa, ardından mevcut hatırlatıcı ekranı. Her sayfa atlanabilir: sağ üstte, paywall'daki kapatma butonu gibi cam bir "Geç" kontrolü.
- **Anlatma, göster.** Her sayfa bir tabloyu tek bir fikirle eşleştiriyor. Yararlı olduğu yerde sayfada uygulamadan gerçek bir arayüz parçası duruyor (bir dinleme durağı kartı, bir sözlük terimi).
- **Uygulamanın geri kalanıyla aynı sistem.** Tokenlar, yazı tipleri ve bileşenler SPEC §1–3'ten:
  - `bg` sayfa rengi, Literata başlıklar, `ink2` renkte SF gövde metni;
  - düz birincil buton (52 pt, `tint`), sayfa noktaları;
  - Geç/kapat kontrolü için G1 cam.

  Yeni renk, degrade ya da illüstrasyon yok; yalnızca kamu malı tablolar.
- Her kare **açık ve koyu** modda. Tuvalin geri kalanı gibi 390 × 844 kareler.

## Sayfalar

Aşağıdaki tablolar katalogdan öneriler; daha iyi uyan biri varsa değiştirilebilir. Kamu malı olmaları ve paywall'daki gibi tablonun altında bir künye satırıyla (tire olmadan) belirtilmeleri gerekiyor.

### 1. Fikir
- **Tablo:** Yaklaşık 340 pt yüksekliğinde, tam genişlik, kırpılarak doldurulmuş. Öneri: Vernet, *Fırtınalı Denizde Bir Gemi Kazası* (Mozart 40) ya da katalogdan başka güçlü bir tablo.
- **Başlık** (Literata 30/1.15): **TR** "Her gün bir klasik eser." · **EN** "One classical work a day."
- **Açıklama** (SF 15/1.5 `ink2`):
  - **TR** "Bugün için seçilmiş bir senfoni, konçerto ya da sonat; aynı dünyadan bir tabloyla."
  - **EN** "A symphony, a concerto or a sonata, chosen for today, with a painting from the same world."

### 2. Takip et
- **Tablo:** Daha kısa, yaklaşık 220 pt. Alt kenarına taşan **gerçek bir dinleme durağı kartı** (§3.6, "şu an" durumu). Örnek: "≈ 4:30 · Her şey sakinleşir; sürdinli yaylılarda geniş, şarkı gibi bir melodi · 2. tema."
- **Başlık:** **TR** "Çalmaya başlayın, sonra takip edin." · **EN** "Press play, then follow along."
- **Açıklama:**
  - **TR** "Rehber neyi dinlemeniz gerektiğini dakika dakika anlatır; Spotify'da açılan usta bir kayda göre zamanlanmıştır."
  - **EN** "The guide tells you what to listen for, minute by minute, timed to a great recording that opens in Spotify."

### 3. Terim yok
- **Tablo:** Yaklaşık 220 pt, üzerinde bir **sözlük kartı parçası** (§4.5, küçük sheet). Örnek: "Yeniden serim · Temalar geri gelir, bu kez ana tonda."
- **Başlık:** **TR** "Dinleyiciler için yazıldı." · **EN** "Written for listeners."
- **Açıklama:**
  - **TR** "Bir müzik terimi geçtiğinde dokunun, kısa ve sade bir açıklama açılsın."
  - **EN** "When a musical term comes up, tap it for a short, plain explanation."

### 4. Premium, nazikçe (isteğe bağlı sayfa; çizilsin, kararı sonra vereceğiz)
- Yalnızca Apple Kimliği ücretsiz denemeye hâlâ hak kazanıyorsa gösterilir.
- **Tablo:** Friedrich, *Sis Denizi Üzerindeki Gezgin*. Paywall'daki tablo; iki ekran birbirine bağlı hissettirsin diye. Paywall'dakinden daha kısa.
- **Başlık:** **TR** "Kütüphanenin tamamı, 3 gün ücretsiz." · **EN** "The whole library, free for 3 days."
- **Fayda satırları** (§3.14): geçmiş eserler · arama · aşağıdaki yeni Premium faydaları.
- **Birincil buton:** **TR** "3 gün ücretsiz dene" · **EN** "Start 3-day free trial".
- **Yenileme satırı:** Butonun altında, SF 12 `ink3`. **TR** "3 gün ücretsiz, ardından aylık ₺129,99. Apple Kimliği ayarlarınızdan istediğiniz zaman iptal edebilirsiniz." · **EN** "3 days free, then ₺129,99 a month. Cancel any time in your Apple ID settings."
- **İkincil metin butonu** (SF 15 `accent`): **TR** "Bugünün eseriyle devam et" · **EN** "Continue with today's piece". Deneme butonu kadar kolay ulaşılabilir olmalı: bu bir teklif, duvar değil.

### 5. Hatırlatıcı (mevcut ekran, §4.16)
Olduğu gibi kalsın. Gerekirse yalnızca aynı akışın son sayfası gibi okunacak şekilde düzenlensin: sayfa noktaları ve 1–4. sayfalarla aynı üst boşluk.

## Kontroller

- **Sayfa noktaları:** Metnin altında, §4.15'teki gibi.
- **Birincil buton:** 1–3. sayfalarda **TR** "Devam" · **EN** "Continue".
- **Geç:** 1–4. sayfalarda. Ya `close` ikonlu G1 cam bir daire ya da küçük cam bir kapsül, "Geç / Skip". Sağ üstte, paywall'daki kapatma butonunun konumunda. Doğrudan hatırlatıcı sayfasına götürür.
- **Giriş bağlantısı:** Yalnızca 1. sayfada, butonun altında: **TR** "Zaten hesabınız var mı? **Giriş yapın**" (mevcuttaki gibi).
- **Kaydırma:** Sayfalar arasında yatay kaydırma.

## Bunlar da çizilsin

- 1. sayfa, en büyük erişilebilirlik yazı boyutunda. Önce tablo küçülsün; metin hiçbir zaman kesilmesin.
- Geç kontrolünün "Şeffaflığı Azalt" varyantı.

## Premium fayda satırları (4. sayfa ve paywall için)

Paywall'a planlanan iki yeni fayda satırı ekleniyor; lütfen 4. sayfada da kullan:
- **TR** "Kaçırdığınız günleri yakalayın" · **EN** "Catch up on the days you missed"
- **TR** "Günün tablosu duvar kâğıdı olarak" · **EN** "Each day's painting as a wallpaper"

## Kapsam dışı

- Karşılama akışı içinde hesap oluşturma.
- Analitik izin istemleri.
- Mevcut hatırlatıcı sayfasının dışında bildirim ön-izin ekranları.
