# DailyClassical: proje bilgisi

Son güncelleme: 17 Ekim 2026. Açık işler `backlog.md`'de, içerik durumu ve kulakla zamanlama `content_status.md`'de. Bu üç dosya projenin bütün dokümantasyonu; eski brief, denetim ve spec dosyaları 17 Ekim 2026'da silindi (git geçmişinde duruyorlar, bkz. en alttaki "Eski dokümanlar").

## 1. Ürün

Her gün bir klasik eser: müzik çalarken okunan bir dinleme rehberi ve eserle eşleşen kamu malı bir tablo. Native iOS (SwiftUI, Liquid Glass), ilk sürümden itibaren İngilizce ve Türkçe.

- **Bugün:** Günün eseri herkese ücretsiz. Tablo ekranı doldurur, başlık ve "Dinlemeye başla" tab bar'ın üstünde; geçmiş günlere kaydırılır.
- **Eser sayfası:** Genel bakış, bölümler tablosu, her bölüm için özet, ana fikirler, referans kayda göre zamanlanmış dinleme durakları, dikkat edilecekler, bağlayan ipler. Sözlük terimleri dokununca sheet açar. Kayıt Spotify'da açılır; uygulama ses çalmaz.
- **Kitaplık:** Yayınlanmış eserler (Tür, Besteci, Dönem filtreleri), favoriler, sözlük. **Arama** ayrı sekme.
- **Premium:** geçmiş eserlerin tamamı (kaçırılan günler), arama, tablonun duvar kâğıdı olarak kaydedilmesi. Ömür boyu ₺699,99 (non-consumable `co.dailyclassical.premium.lifetime`), aylık ₺129,99 + 3 gün ücretsiz deneme (`co.dailyclassical.premium.monthly`, grup `Premium`). RevenueCat: entitlement `premium`, offering `default` (`$rc_lifetime`, `$rc_monthly`); uygulamada yalnızca public `appl_` anahtarı (`project.yml` › `REVENUECAT_API_KEY`).
- **Hesap (isteğe bağlı):** e-posta + 6 haneli kod ya da Apple ile giriş; favoriler sunucuda. Hesap silinebilir, Apple bağlantısı iptal edilir.
- **Widget:** küçük/orta/büyük, açık/koyu/renklendirilmiş; kendi akışını (`GET /v1/widget`) çeker, internetsiz çalışır.
- **Karşılama akışı:** tablolu dört kart (Vernet, Levitan, Friedrich *Deniz Kıyısındaki Keşiş*, Gezgin), 4. kart deneme teklifi (yalnızca hak varsa), ardından hatırlatıcı. Paywall'da aylık + deneme önceden seçili, "En avantajlı" rozeti ömür boyunda.

## 2. Repo ve altyapı

| Klasör | İçerik |
| --- | --- |
| `ios/` | SwiftUI uygulaması; proje XcodeGen ile `ios/project.yml`'den |
| `backend/` | API (Node + Hono + Drizzle), Railway'de; veri Neon Postgres. `backend/site/` tanıtım sayfası, `backend/legal/` gizlilik/koşullar/destek metinleri |
| `content/` | İçeriğin kaynağı: `en|tr/pieces/<id>.md`, `glossary.md`, `composers.yaml`, `paintings.yaml`, `schedule.yaml`, `research/` (eser başına doğrulama notları, birleştirme betikleri) |
| `design/` | Uygulama ikonu, SVG ikon seti (`icons/`), mağaza görselleri (`app-store/`), e-posta önizlemeleri, tanıtım sayfası tasarımı (`DailyClassical Landing.dc.html`) |
| `project-knowledge/` | Bu üç doküman |

- **Alan adları:** `api.dailyclassical.co` (API, Railway, ABD doğu, Neon ile aynı bölge); `www.dailyclassical.co` aynı servis: `/` tanıtım sayfası, `/support`, `/privacy`, `/terms` (`?locale=tr`). Kök alan adı GoDaddy'de `www`'ye 301 yönlendirme; `www` CNAME Railway'e.
- **Veritabanı:** Neon. Lokal `backend/.env` `dev` branch'ine bağlı; production'a yalnızca Railway (deploy öncesi migration) ve `content-publish` GitHub Action'ı yazar. Son migration 0011 (renaissance).
- **E-posta:** Resend; gönderen `EMAIL_FROM`. İletişim adresi `hello@dailyclassical.co`.
- **Railway değişkenleri:** `DATABASE_URL`, `DATABASE_URL_UNPOOLED`, `JWT_SECRET`, `RESEND_API_KEY`, `EMAIL_FROM`, `PUBLIC_API_URL`, `NODE_ENV=production`; Apple ile giriş anahtarı; isteğe bağlı `APP_STORE_URL`, `LATEST_APP_VERSION`, `MIN_APP_VERSION`. `railway.json` her deploy'dan önce migration çalıştırır, `/health`'i kontrol eder.
- **Sırlar:** Neon URL'leri, Resend anahtarı, `JWT_SECRET`, Apple `.p8` anahtarları, RevenueCat secret key asla repoya, commit'e ya da sohbete girmez. `backend/.env` ve `backend/test-accounts.local.md` git'te yok.
- **Dış isteklerde gizlilik:** Kimsenin e-postası ya da adı URL'lere, header'lara, `User-Agent`'a girmez. İletişim isteyen API'lere `DailyClassical/1.0 (+https://dailyclassical.co)`.

## 3. Backend

```bash
cd backend
cp .env.example .env          # Neon pooled + unpooled URL'ler, JWT secret
npm install
npm run content:build         # EN/TR markdown'ı ayrıştırır ve doğrular
npm run db:migrate            # drizzle/ migration'ları
npm run db:seed               # içerik + takvim
npm run dev                   # http://localhost:3100
```

Uç noktalar (içerik uçları `?locale=en|tr` ya da `Accept-Language` alır): `GET /v1/today?date=`, `/v1/pieces`, `/v1/pieces/:id`, `/v1/glossary`, `/v1/composers`, `/v1/widget?date=&days=`, `/v1/config`; `POST /v1/auth/register` (202, 6 haneli kod), `/verify`, `/verify/resend`, `/login` (doğrulanmadan 403), `/password-reset`, `/password-reset/confirm`, `/apple`; `GET /reset-password` (web); `GET|DELETE /v1/me`; `GET /v1/favourites`, `PUT|DELETE /v1/favourites/:pieceId`. Auth POST'ları IP ve e-posta başına sınırlı (429 `rate_limited`, `Retry-After`; `src/lib/rate-limit.ts`, sayaçlar `rate_limit` tablosunda). İçerik sorguları 1 dk önbellekte.

| Betik | Ne yapar |
| --- | --- |
| `npm run content:build` | Markdown → `content/build/<dil>.json`; `!` uyarısı olmamalı |
| `npm run db:seed` | İçerik, besteciler ve `schedule.yaml` |
| `npm run fixtures` | Uygulamaya gömülü offline/önizleme verisi |
| `npm run images [-- --only <id>]` | Orijinalleri indirir (önbellek, git dışı), HEIC `hero` (kısa kenar 1800) / `thumb` (300) / `full` (4000, zoom için) yazar. Kırpılmış master `<id>.source.jpg` olarak durur; yaml'da "Do not pass --refresh" notu olanlarda `--refresh` kullanılmaz |
| `npm run images:widget` | Widget JPEG'leri (≤ 1100 px), `images`'tan sonra |
| `npm run emails:preview` | E-postaları `design/emails/`'e çizer |
| `npm run test-user -- <e-posta> [--free]` | Doğrulanmış test hesabı; şifre `test-accounts.local.md`'ye |

**Tanıtım sayfası:** `backend/site/index.html`, `assets/site.css`, `site.js`; `src/routes/site.ts` CSS/JS'i içerik özetli adresle (`?v=`) sunar, dili Accept-Language'den seçer (tercih localStorage'da). Hero 1440 px'lik sahneyi dar pencerede ölçekler (`--hs = min(1, innerWidth/1440)`). Çerez ve analitik yok.

## 4. iOS

```bash
brew install xcodegen
cd ios && xcodegen generate && open DailyClassical.xcodeproj
```

- iOS 26 hedef, iOS 27 SDK ile derlenir. Sistem bileşenleri (arama sekmeli TabView, NavigationStack, sheet'ler, `glassEffect`): Liquid Glass, Şeffaflığı Azalt ve Dynamic Type sistemden gelir. Her işlev için ayrı cam yüzey.
- Dil: Ayarlar › Dil (Sistem / English / Türkçe); arayüz `Localizable.xcstrings`, içerik dili API'ye gider. İçerik eksikse İngilizceye düşer.
- Eski sürümlere dayanıklılık: bilinmeyen tür, dönem ve kayıt rolü "diğer" okunur; çözülemeyen liste öğesi atlanır. `GET /v1/config` ile güncelleme istemi.
- Bundle ID `co.dailyclassical.app` (+ `.widget`, `.tests`). `ITSAppUsesNonExemptEncryption = NO`. Gizlilik manifestleri `Resources/PrivacyInfo.xcprivacy` (+ widget), App Privacy etiketleriyle aynı.
- **Yükleme:** `cd ios && xcodebuild -exportArchive -archivePath "<archive>" -exportOptionsPlist ExportOptions.plist -exportPath build/export -allowProvisioningUpdates`, ya da Xcode › Organizer › Distribute App. Her yüklemede `CURRENT_PROJECT_VERSION` bir artar (1.0.0 (1) reddedildi, 1.0.0 (2) 22 Ekim'de yüklendi; sıradaki build 3).

## 5. İçerik hattı ve yayın

```
content/<dil>/pieces/*.md + glossary.md ──content:build──▶ content/build/<dil>.json ──db:seed──▶ Neon
                                                   └──fixtures──▶ ios/…/Resources/Fixtures
```

- `main`'e giren içerik yayına çıkar: `.github/workflows/content-publish.yml` doğrular, migration'ları çalıştırır, production'a seed eder (secret `DATABASE_URL_UNPOOLED`); görseller aynı push'un Railway deploy'uyla gider. Eser `schedule.yaml`'daki gününde kendiliğinden yayına girer; uygulama sürümü gerekmez. Yalnızca kod değişiklikleri yeni build ister.
- Durak süreleri referans kaydın ilgili parçasının başından, saniye olarak saklanır; uygulama dile göre biçimler.
- `schedule.yaml`: `start` 0. gün; sıra eser eklenene kadar tekrar eder. Şu an test takvimi (bkz. `content_status.md` › Yayın planı).

## 6. İçerik yazım rehberi

Yeni eser yazan kişi ya da ajan için. Örnek eserler: `rachmaninoff-piano-concerto-2`, `beethoven-piano-sonata-8`, `mozart-piano-concerto-23` ve kulakla zamanlanmış `beethoven-symphony-3`. Kural metinleri İngilizce, çünkü ajanlara olduğu gibi verilir.

### 6.1 What a piece is

One work a day, with a listening guide read **while the music plays**, and one public-domain painting. Every guide is written for **listeners, not musicians**.

| File | Contents |
| --- | --- |
| `content/en/pieces/<id>.md` | English guide: yaml meta + markdown sections (§6.4) |
| `content/tr/pieces/<id>.md` | Turkish guide, same structure, same `id` |
| `content/en/glossary.md`, `content/tr/glossary.md` | Every `[[term]]` used in any guide (§6.6) |
| `content/composers.yaml` | Composer sheet (only if new) |
| `content/paintings.yaml` | Image file, licence and credit (language-neutral) |
| `content/research/<id>.md` | Verification note: every fact, credit and duration with its source URL |
| `content/schedule.yaml` | When it becomes "Today" (only when ready) |

### 6.2 Ids and forms

- **id:** `<composer-surname>-<form>-<number>`, lower-case ASCII (`beethoven-symphony-5`, `haydn-string-quartet-op-76-3`); unnumbered works use a short slug (`berlioz-symphonie-fantastique`). Never changes once published.
- **form** (drives the Library filter only): `symphony`, `piano-concerto`, `violin-concerto`, `cello-concerto`, `concerto` (other), `piano-sonata`, `sonata` (other), `string-quartet`, `chamber`, `orchestral` (overtures, tone poems, suites), `choral`. A new form needs a code change (backend `PIECE_FORMS`, iOS `PieceForm`, two strings): ask first.
- **era** comes from the composer; `renaissance` exists since migration 0011 (1.0.0 shows it as "Other").
- **At most 6 movements.** A movement is one Spotify track of the reference album; if the album splits a movement into several tracks, pick another recording.

### 6.3 Recording, painting, facts

**Reference recording.** Stop times are tied to it, so it must be on Spotify as a whole album and **playable in Turkey**. The product owner's favourite wins.
1. Keep only `https://open.spotify.com/album/<id>` (strip tracking parameters).
2. Confirm from `https://open.spotify.com/embed/album/<id>`: the `__NEXT_DATA__` JSON lists every track with credits, `duration` (ms) and `isPlayable` (from a Turkish network: false = blocked).
3. Label, catalogue number, dates, venue from a primary source (Discogs API, label page, Presto, booklet). Spotify's release date is the digital edition's.
4. Movements table durations = exact track times.
5. One or two `also_recommended`, verified the same way.

**Performers by form.** Symphonic/orchestral: `conductor` + `orchestra`. Concertos: `soloists` (role = instrument) + `conductor` + `orchestra`. Solo sonatas: `soloists` only. Chamber: `soloists` per player, or the ensemble as `orchestra` without conductor. Choral: `chorus`.

**Painting.** Public domain by age (artist died 70+ years ago), high-resolution open image (Wikimedia Commons or museum open access), never NC. The shipped app shows credits for portraits but not for painting photos, so painting photos must be public domain (a faithful photo of a PD painting creates no new right in the EU, DSM art. 14, or the US). It must share something real with the music (years, place, mood, idea); `pairing_note` says what in one sentence. Do not reuse a painting; check `content/paintings.yaml`.

**Facts.** Every claim must be checkable; sources go in `content/research/<id>.md`. When sources disagree, say so there and use the cautious wording. No invented anecdotes; legends are told as legends.

### 6.4 The piece file

Heading `## <Composer surname> – <Title>`, a yaml block, then the sections in this order; labels must match exactly (the parser reads them).

````markdown
## Rachmaninoff – Piano Concerto No. 2 in C minor

```yaml
id: rachmaninoff-piano-concerto-2
composer: Sergei Rachmaninoff        # must equal `match` in composers.yaml
form: piano-concerto
title: Piano Concerto No. 2 in C minor
catalogue: Op. 18                     # or null
key: C minor                          # or null (TR: "Do minör")
year: 1901
duration_min: 33                      # rounded sum of the reference tracks
movement_count: 3                     # = number of movement sections
hook: One short sentence, the reason to listen today.
reference_recording:
  soloists:
    - { name: Sviatoslav Richter, role: piano }
  conductor: Stanisław Wisłocki
  orchestra: Warsaw Philharmonic Orchestra
  label: Deutsche Grammophon
  catalogue_number: "138 076"
  recorded: "April 1959"
  venue: Warsaw Philharmonic Hall
  release_year: 1959
  year: 1959
  spotify_url: https://open.spotify.com/album/<id>
also_recommended:
  - { … same fields … }
painting:
  artist: Isaac Levitan
  title: Above Eternal Peace           # translated in the TR file
  year: 1894
  collection: State Tretyakov Gallery, Moscow
  pairing_note: One sentence on why this painting goes with this music.
```

### The big picture
- 3 to 5 bullets; then "In one line: …" mapping the movements.

### Movements
| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Moderato | C minor | 2/2 | 11:02 |

### I. Moderato
**Summary.** Two or three sentences.

**Main ideas**
- Theme 1, bells: what it sounds like and who plays it.

**Listening stops**
| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Eight slow piano chords, growing louder like a bell | The introduction, piano alone |
| ≈ 1:30–2:10 | … | … |
| Near the end | … | … |

**Things to notice**
1. One or two points the listener can test by ear.

**In this recording.** Optional, any bold title.

### Threads
- **Bold title.** Two or three ideas tying the movements together.
````

Rules the parser and app rely on:
- Movement sections are `### <Roman numeral>. <heading>`, numerals matching the Movements table (which may use `Title` or `Title or tempo` columns).
- Stop times from the start of **that movement's track**, `m:ss` or `h:mm:ss`. Three variants on purpose: a time, a range (`9:30–10:30`), or no time (`Near the end`, `Last minute`). `≈` marks an estimate; estimates are listed in `content_status.md` › "Zamanlanacak duraklar" until timed by ear.
- At least one stop per movement; aim for 4–8.
- `*italics*` only for work titles and dynamics; no other markdown in cells. Straight quotes are fine (the build typesets them).

### 6.5 How to write

- **Listener first:** describe the sound, then name it ("the opening tune comes back, now in the piano's lowest register", then "the [[recapitulation]]"). "What you hear" = sound; "What is happening" = structure and meaning.
- Short sentences, plain words. No hype ("sublime", "masterpiece"), no exclamation marks, no commands except in "Things to notice".
- Concrete: instrument, register, rhythm. Keys and bar numbers only when they change what you hear.
- British spelling; en dash for ranges and headings.
- Form angles: *concerto* (who has the tune, dialogue, [[cadenza]], double exposition), *sonata* (one instrument, registers, two hands, pedal, silence), *quartet* (four voices, who leads), *symphony* (sections and how movements connect).

### 6.6 Glossary

- EN `[[term]]`; TR `[[english key|türkçe yüzey]]` with the suffix in the surface (`[[cadenza|kadansı]]`).
- Reuse existing terms. A new term gets a row in both files: EN `| Term | Short | Definition |`, TR `| Key | Terim | Kısa | Tanım |`. **Short** ≤ ~60 characters, a phrase, no full stop, does not repeat the term. **Definition** one or two sentences for the term sheet.
- Mark a term once or twice per piece.

### 6.7 Turkish

- Natural Turkish, not word-for-word; same facts, stops, times, bullet counts.
- Titles in Turkish usage ("Do minör 2. Piyano Konçertosu", "8. Piyano Sonatı, “Patetik”"); keys Do, Re, Mi, Fa, Sol, La, Si + majör/minör, bemol, diyez. Composer names as `composers.yaml` › `names.tr`.
- Labels: Genel bakış, Tek cümleyle, Bölümler, Özet, Ana fikirler, Dinleme durakları, Dikkat edilecekler, Bağlayan ipler, Bu kayıtta. Tables `| | Tempo | Ton | Ölçü | Süre |`, `| Zaman | Ne duyuyorsunuz | Ne oluyor |`. "Near the end" → "Sona doğru", "Last minute" → "Son dakika".
- Yaml keeps English keys; translate `title`, `key`, `hook`, `painting.title`, `painting.collection` (Viyana, Moskova), `pairing_note`; add `composer_display`. Recording fields stay as on the album.
- Pizzicato is "parmakla çekmek" (never "koparmak").

### 6.8 New composer

Entry in `content/composers.yaml` (format at the top of the file): names EN/TR, nationality, facts, three-paragraph bio in both languages, public-domain or CC portrait with credit (or `null`). Sources in `content/research/composers-sources.md`.

### 6.9 Checklist (from `backend/`)

1. `npm run content:build`: no `!` warnings.
2. Painting in `content/paintings.yaml`, then `npm run images -- --only <id>` and `npm run images:widget` (new composer: `--only <composer id>`).
3. `npm run fixtures`; check the piece in both languages (`npm run db:seed` on dev, or `DC_USE_API=1`): every term opens, the movement switcher jumps correctly, the Spotify button opens the album.
4. Merge to `main`: content-publish publishes it. It appears only on its `schedule.yaml` day.

### 6.10 App copy

The app is about works, not only symphonies: "work"/"piece" (TR "eser") in interface strings, App Store text and emails, unless the sentence is about a specific symphony.

### 6.11 Running a content batch with agents (as in October 2026)

- Give each agent a group of ~5 pieces, the ids, fixed choices (product owner's favourite recordings), §6 and the hard limits above.
- Agents write only: `content/drafts/{en,tr}/<id>.md`; `content/research/<id>.md` (verification note: recording check with URLs, exact track durations from the embed, every fact with its source, painting rights, a "Re-time" section); `content/research/<id>.shared.md` (paintings.yaml entry for the first-choice painting + two alternatives, new glossary rows EN and TR, new composers' full yaml entries with sources). They do not edit shared files, run npm/git, or touch the image pipeline.
- Every stop is `≈` (agents cannot listen).
- Merge: resolve painting clashes (`python3 content/research/swap-painting.py spec.json`), then `python3 content/research/merge-drafts.py <id> …` (paintings, composers, glossary, retime rows into `content_status.md`, moves drafts into `pieces/`), then images, `content:build`, `fixtures`, commit. After the merge the `.shared.md` notes can be deleted.

## 7. App Store

- **Kayıt:** Apple ID (App Store kimliği) `6820556910`, Name DailyClassical, SKU `dailyclassical-ios`, birincil dil İngilizce, TR yerelleştirmesi. Kategori Music / Education. Yaş 4+. Content Rights: "contains third-party content and I have the rights" (kamu malı tablolar, Spotify bağlantıları).
- **URL'ler:** Privacy `https://www.dailyclassical.co/privacy`, Support `https://www.dailyclassical.co/support`.
- **Satın almalar:** §1'deki iki ürün; yerelleştirmeler EN `Premium, lifetime` / `Premium, monthly`, TR `Premium, ömür boyu` / `Premium, aylık`; grup yerelleştirmesi `DailyClassical Premium`. Review screenshot'ları `design/app-store/review/premium-*.png` (1320×2868), promosyon görselleri `design/app-store/promo/*-1024.png`. RevenueCat'e In-App Purchase Key, App Store Connect API Key ve sunucu bildirimleri (V2) bağlı.
- **App Privacy:** veri toplanıyor, takip yok. Email Address, User ID, Purchase History, Other User Content (favoriler); hepsi App Functionality, kullanıcıya bağlı.
- **İnceleme notları:** test hesabı `premium-test@dailyclassical.co` (hediye Premium). Not metni: bugünün eseri ücretsiz; Premium geçmiş eserleri, aramayı ve duvar kâğıdını (Fotoğraflar'a yalnızca ekleme izni) açar; kayıtlar Spotify'da açılır, ses akışı yok; tablolar kamu malı (Ayarlar › Painting and recording sources); hesap Ayarlar › Account › Delete account ile silinir, Apple ile giriş iptal edilir. Sürüm yayını "Manually release".
- **İnceleme süresince** `schedule.yaml` ileri bir tarihe alınmaz (boş Bugün/Kitaplık red riski).

**Mağaza metinleri**

| | English | Türkçe |
| --- | --- | --- |
| Subtitle | One classical work a day | Her gün bir klasik eser |
| Promotional text | Today's work, a guide you read while it plays, and a painting to look at. New every day. | Günün eseri, çalarken okuyacağınız bir rehber ve bakacağınız bir tablo. Her gün yenisi. |
| Keywords | classical,music,symphony,concerto,listening guide,orchestra,composer,piano,beethoven,mozart | klasik müzik,senfoni,konçerto,dinleme rehberi,orkestra,besteci,piyano,beethoven,mozart |

Açıklama (EN): "One classical work a day, with a guide you read while it plays." ardından: her gün bir senfoni, konçerto ya da sonat, bölüm bölüm ne dinleneceği, büyük bir kayda göre zamanlanmış; dinleyiciler için yazılmış, terimlere dokununca kısa tanım; aynı dünyadan kamu malı bir tablo (Friedrich'ten Kuindzhi'ye); madde listesi (bugünün eseri ücretsiz, Spotify'da açılan kayda göre zamanlanmış duraklar, sözlük, besteci portreleri, English ve Türkçe, widget'lar); Premium paragrafı (kütüphane ve arama; ömür boyu ya da 3 gün denemeli aylık); Terms/Privacy bağlantıları. TR açıklama aynı yapıda ("zamansız bir kayda göre zamanlanmış"). Tam metin App Store Connect'te.

**Görseller:** 6.9" set `design/app-store/out/<dil>/01–06.png` (1320×2868), 6.3" set `out-6.3/<dil>/` (1206×2622); sıra Bugün, dinleme durakları, sözlük, Kitaplık, besteci, duvar kâğıdı. Ham ekranlar `ios/scripts/app-store-shots.sh <simülatör-udid>` (Debug, `App/ScreenshotScene.swift` launch argümanları), çerçeve `design/app-store/frame.html` + `render.sh`. Creative assets: header 21:9 `header/header-vernet-3840x1646.jpg` (universal 16:9 PNG de var), search 3:2 `search/search-<dil>-3840x2560.jpg`.

## 8. Tasarım

Uygulama tasarımı Claude Design'da; koddaki karşılıkları `ios/DailyClassical/DesignSystem/` (`Palette.swift`, `Typography.swift`, `Metrics.swift`). Kod ile bu bölüm ayrışırsa kod geçerli. Ayrıntılar İngilizce (spec dilinde).

### 8.1 Principles

- **Core moment:** the user presses play in Spotify, comes back and reads along; one hand, headphones on. No audio sync: the user scrolls by hand; the screen never dims while a piece page is open (`isIdleTimerDisabled`).
- Quiet museum wall label / concert programme: editorial, calm, generous space. The painting and the text are the product; the painting supplies the colour and the UI does not compete. No text or logos on paintings; album covers are never shown (so Spotify's artwork rules do not apply; rows are text, "Open in Spotify" deep-links to the album).
- Avoid: album-cover grids, player chrome (waveforms, progress bars), gamification (streaks, badges), busy cards, emoji, SF Symbols.
- Never interrupt Today with a paywall. Locked Library rows stay fully visible (painting + title, small lock, no dimming).

### 8.2 Screens

System TabView: **Today · Library · Settings** + **Search** (`Tab(role: .search)`; opens the paywall for free users).
- **Today:** full-bleed painting under the status bar; glass date chip (day numeral + WEEKDAY / MONTH YEAR) at safe top + 11; clear-glass "Start listening" on the painting's lower edge; caption with a 14 pt dash, composer link ›, title, italic hook, meta "1893 · About 46 minutes · 4 movements". Pages back through earlier days; pulling up opens the piece page.
- **Piece page** (no tab bar): painting → caption → header (composer ›, title, meta, hook) → The big picture → Movements table (rows jump) → per movement: summary, Main ideas, Listening stops, Things to notice, In this recording → Threads → Recommended recordings → Sources and credits. Nav: back | heart, expand. Once Movement I scrolls under the bar: back | movement switcher (I–VI) | glossary, and the floating "Open in Spotify" hides for good.
- **Sheets:** glossary term (small detent, "See all terms in Library ›"); Recordings (medium; first row = reference recording the stops follow); Composer (large: portrait, facts card, bio, "In DailyClassical"); sign-in prompt (medium); Create account / Sign in / Reset password / Check your email (large, solid).
- **Library:** large title, glass segmented All pieces | Favourites, filter chips (Form, Composer, Era menus; Glossary link). Glossary: A–Z list with index rail and search field.
- **Paywall:** full-screen cover, Friedrich *Wanderer above the Sea of Fog* on top, "More of this.", four benefit lines (library, missed days, search, wallpaper), two plan cards (Monthly with the trial preselected; "BEST VALUE" badge on Lifetime), solid CTA, Restore, Terms / Privacy.
- **Settings:** ACCOUNT · READING (Daily reminder, Theme, Language) · PREMIUM (status, Restore) · ABOUT (About and credits, Painting and recording sources); Test section only in Xcode-installed builds. Detail pages hide the tab bar. Account: Email, Change password | Sign out | Delete account (native alert).
- **Artwork viewer:** always black, aspect-fit, pinch / double-tap zoom to the tapped point, caption (artist, italic title + year, medium · collection · rights); wallpaper button (Premium).
- **States** on every data screen: loading (skeleton), empty, offline (only for `APIError.offline`; other errors "Something went wrong"), locked.

### 8.3 Tokens

**Colour** (light / dark):

| Token | Light | Dark | Use |
| --- | --- | --- | --- |
| bg | #F5F2EC (paper) | #111010 (ink) | screens, large sheets |
| surface | #FFFFFF | #1C1A18 | cards, grouped lists |
| ink | #1E1B17 | #F0EBE3 | primary text |
| ink2 | #5E5852 | #B3ABA1 | secondary, labels |
| ink3 | #8A837B | #7D766E | captions, faded stops, chevrons |
| rule | ink 12 % | ink 12 % | hairlines, 0.5 pt card rings |
| accent / tint | #6B4A2B (umber) | #D4AE84 (warm sand) | links, terms, stop times, solid buttons |
| onTint | #FFFFFF | #1E1B17 | text on tint |
| danger | #B3261E | #F28B82 | destructive |
| skeleton | ink 8 % | ink 8 % | loading |

Dark accent warmed so body contrast stays ≥ 4.5:1. Artwork viewer #000 with #F0EBE3 / #B3ABA1 captions. Selected tab capsule ink 12 %; current-stop halo accent 18 %; active term background accent 14 %; secondary buttons ink 8 %.

**Type:** Literata (bundled variable font, 400/500/600 + italic) for titles and reading; SF for labels, tables, buttons. Every size scales `relativeTo:` a text style.

| Role | Spec |
| --- | --- |
| Tab-root large titles | Literata 34/1.1, 500, −0.01em |
| Piece, sheet, onboarding titles | Literata 30/1.15, 500 |
| Paywall / prompt title | Literata 28/1.15 |
| Today title | Literata 30 (layout A) |
| Movement tempo, sheet titles | Literata 24/1.25 |
| Hook | Literata italic 19/1.45 (piece), 17/1.45 ink2 (Today) |
| Reading | Literata 17/1.6; measure 60–70 ch |
| Stop "What you hear" | Literata 17/1.4, 500 |
| "What is happening", secondary | SF 15/1.45 ink2 |
| Button | SF 17/600 |
| Meta / caption | SF 13–14 ink2 / SF 12 ink3 |
| Section label | SF 12/600, +0.1em, uppercase via `.textCase` |
| Stop time | SF 12/600, +0.04em, accent; untimed label Literata italic 12 ink2 |

Tabular figures for durations and the time picker.

**Spacing:** gutter 24; bar inset 16; floating bars at safe top + 11; section gaps 28–34 / 40–44; card padding 16 × 18; list rows ≥ 50; hit target ≥ 44; floating primary 40 from the bottom with a 150 pt page-colour fade. **Radii** (continuous): controls capsule; sheet 38; grouped list 22; card 16; thumbs 8 / 6.

### 8.4 Liquid Glass

- Glass only for bars and controls: tab bar, 44 pt nav circles, date chip, movement switcher, segmented control, filter chips, search field, toast, floating primary, partial sheets. Everything read is solid (stop cards, tables, plan cards, forms, lists, large sheets).
- Never glass on glass. Separate functions get separate glass (`GlassEffectContainer(spacing: 0)` so chips never merge).
- Glass is neutral, never tinted. The floating primary (clear glass, 54 pt, 32 pt side padding) stands out by size, position and shadow; solid umber 52 pt buttons on paper (paywall, sheets, onboarding).
- Reduce Transparency: glass becomes solid surface with a 1 pt outline. Text on glass: short labels only.

### 8.5 Listening stop

Rail (8 pt dot + 1 pt line, none after the last) + solid card (time / hear / happening). The stop nearest the centre of the area below the nav bar is "current" (ringed dot, card shadow); passed stops fade to ink3 with a 40 % dot, upcoming ones to ink3 with a hollow dot; summary, ideas and notes fade too, glossary terms stay accent. 200 ms ease-out, off under Reduce Motion. Glossary terms: accent text with a dotted accent underline.

### 8.6 Copy and voice

- Plain, short, warm; sentence case (uppercase is only a rendering style). Allow 30 % expansion for TR.
- Typography used literally: ’ “ ” · ≈ – › …
- TR: buttons, links and nav titles short imperative ("Giriş yap"); body polite (-ın/-iniz).
- No invented ratings, stats or numbers (app or site); no text baked into images; composer copy gender-neutral.

### 8.7 Icons

Custom SVG set in `Assets.xcassets/Icons/` (template, Preserve Vector Data): 24 pt grid, 1.75 stroke, round caps, outline only; the only filled glyph is `heart-fill`. Icons on glass are ink; the selected tab gets a 12 % ink capsule. Set: tab-today, tab-library, tab-settings, search, glossary-book, lock, expand, open-external, chevron-back, chevron-forward(-small), chevron-down, close, checkmark, reminder, share, wallpaper, offline, info, heart, heart-fill, eye, mail. No play/pause/waveform.

### 8.8 Onboarding (as built)

Over the live Today screen, swipeable, glass "Skip" to the reminder page: (1) "One classical work a day." + "Already have an account? Sign in"; (2) "Press play, then follow along." with a real current-stop card; (3) "Written for listeners." with a glossary fragment; (4) trial, only while eligible and not Premium: "The whole library, free for 3 days.", "Start 3-day free trial", renewal line, equally easy "Continue with today's piece"; (5) reminder: "When should today’s piece arrive?", 5-minute wheel (default 08:00), "Remind me at {time}" / "Not now". Paintings only, no illustrations.

### 8.9 Landing page (www.dailyclassical.co)

One page, one job: the App Store. Light/dark by system, EN/TR by browser with a toggle. (1) Hero: icon + wordmark, "One classical work a day.", App Store badge, drifting paintings, a date chip advancing every 3.2 s (Vernet → Levitan → Monk); (2) pinned phone story in 3 steps (Today, listening stops with a moving highlight, glossary sheet), stacked on mobile; (3) slow paintings band with credits on hover; (4) "Today's piece is waiting.", badge + QR, no prices. Footer /support · /privacy · /terms · hello@ · language. A sticky glass capsule appears after the hero. No cookies, analytics or third-party fonts; Reduce Motion stops all motion; OG image 1200×630 (Vernet); Smart App Banner app id 6820556910.

## Eski dokümanlar

17 Ekim 2026'da silinenler (git'te `git show <commit>^:<yol>` ile okunur; commit mesajı "Docs: consolidate into project-knowledge"): `README.md` (kısaltıldı), `content/CONTENT_GUIDE.md`, `docs/BACKLOG.md`, `docs/CONTENT_STATUS.md`, `docs/APP_STORE.md` (RevenueCat ve App Store Connect adım adım kurulum rehberi), `content/research/retime-needed.md`, `content/research/BATCH-2026-10.md`, 50 `content/research/*.shared.md`, `design/SPEC.md` (ilk tam tasarım spec'i), `design/AUDIT.md`, `design/VISUAL-REVIEW.md`, `design/LANDING_BRIEF.md`, `design/ONBOARDING_BRIEF*.md`, `design/strings-en.md`, `design/icons/README.md`, `project-knowledge/DailyClassical – Design Brief.md`, `project-knowledge/dailyclassical-launch-content.md`.
