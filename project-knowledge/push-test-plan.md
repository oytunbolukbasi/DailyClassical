# Push ve uygulama içi mesaj: cihaz test planı (1.4)

Ortam: canlı backend (Railway, APNS_KEY_ID ve APNS_PRIVATE_KEY tanımlı), iPhone'da Ad Hoc imzalı 1.4 (14) (production APNs; Xcode build'leri sandbox olduğu için push almaz). Gönderimler /admin/messages › "Test cihazlarına şimdi gönder" ile.

## 0. Hazırlık
- [x] Panel › Test cihazları › kendi e-postana davet; e-postadaki bağlantıyı iPhone'da aç → DailyClassical açılır, "Bu iPhone artık test cihazı" bildirimi.
- [x] Bildirim izni sorulursa izin ver. Panelde: Doğrulandı · cihaz modeli · "İzin var".

## Push (görselli, link: bir eser)
| # | Uygulama durumu | Beklenen |
|---|---|---|
| P1 ✓ 25 Kas | Ön planda (Bugün ekranı açık) | Üstte banner, görsel küçük resim olarak (webp de); dokununca eser açılır |
| P2 | Arka planda (ana ekran) | Banner + görsel; basılı tutunca büyük görsel; dokununca eser açılır |
| P3 | Kilit ekranında | Bildirim görselle kilit ekranında; dokunup açınca eser açılır |
| P4 | Tamamen kapalı (uygulama değiştiriciden kaydırılmış) | Bildirim gelir; dokununca uygulama açılıp eseri gösterir |
| P5 | Görselsiz push | Düz bildirim, sorunsuz |
| P6 | Link: Premium / https | Premium ekranı açılır / Safari'de sayfa açılır |
| P7 | Uygulama dili İngilizce | İngilizce metin gelir (dil değişince cihaz yeniden kaydolur) |
| P8 | Panelde sayılar | Giden = test cihazı sayısı, Açılan dokunuşları sayar |

## Uygulama içi mesaj ("Yalnız test cihazlarında", görselli, butonlu)
| # | Durum | Beklenen |
|---|---|---|
| I1 | Uygulamayı ön plana getir (son kontrolden 1 dk sonra) | 2 sn içinde kart: görsel, başlık, metin, buton, Kapat |
| I2 | Kapat, uygulamayı kapatıp aç | Aynı mesaj bir daha gelmez |
| I3 | Butona dokun | Kart kapanır, link açılır; panelde Tıklama artar |
| I4 | Butonsuz mesaj | Yalnız "Kapat" |
| I5 | Panelden "Kapat" (pasif) | Yeni açılışta gösterilmez |
| I6 | Test olmayan cihaz | Test mesajını görmez |
| I7 | Onboarding / başka sayfa açıkken | Kart üstüne binmez, sonraki açılışa kalır |
