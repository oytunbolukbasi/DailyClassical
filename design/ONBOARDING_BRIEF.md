# Brief: first-run onboarding (Claude Design)

Paste this into the DailyClassical canvas in Claude Design (`DailyClassical2.html`). Add the new frames as a new section, light and dark, next to the existing paywall (§4.10) and onboarding (§4.15–4.16) frames.

## Why

Today a first-time user sees one card over the Today screen ("One classical work a day…") and then the reminder picker. It does not explain what makes the app different (the timed listening guide, the glossary, the paintings), and it never mentions Premium. We want a short, beautiful introduction in the language of the paywall: a painting on top, Literata heading, one or two lines of SF body, solid primary button.

## Principles

- **Short.** At most four swipeable pages plus the existing reminder screen. Every page skippable ("Skip" top right, glass, like the paywall's close button).
- **Show the product, don't describe it.** Each page pairs a painting with one idea; where useful, a small real UI fragment (a listening-stop card, a glossary term) sits on the page.
- **Same system as the rest of the app.** Tokens, type and components from SPEC §1–3: `bg` page, Literata titles, SF body in `ink2`, solid primary button (52 pt, `tint`), page dots, G1 glass for the skip/close control. No new colours, no gradients, no illustrations: paintings only (public domain).
- **Light and dark** for every frame. 390 × 844 frames like the rest of the canvas.

## Pages

Paintings below are suggestions from the catalogue; replace if another works better, but keep them public domain and credit them in a caption line under the painting (no dash), as on the paywall.

### 1. The idea
- Painting (≈ 340 pt tall, full width, cover): Vernet, *A Shipwreck in Stormy Seas* (Mozart 40), or another strong catalogue painting.
- Title (Literata 30/1.15): **EN** "One classical work a day." · **TR** "Her gün bir klasik eser."
- Body (SF 15/1.5 `ink2`): **EN** "A symphony, a concerto or a sonata, chosen for today, with a painting from the same world." · **TR** "Bugün için seçilmiş bir senfoni, konçerto ya da sonat; aynı dünyadan bir tabloyla."

### 2. Listen along
- Painting (shorter, ≈ 220 pt) with a **real listening-stop card** (§3.6, "current" state) overlapping its lower edge, e.g. "≈ 4:30 · Everything calms; a wide, singing melody on muted strings · Theme 2."
- Title: **EN** "Press play, then follow along." · **TR** "Çalmaya başlayın, sonra takip edin."
- Body: **EN** "The guide tells you what to listen for, minute by minute, timed to a great recording that opens in Spotify." · **TR** "Rehber neyi dinlemeniz gerektiğini dakika dakika anlatır; Spotify'da açılan usta bir kayda göre zamanlanmıştır."

### 3. No jargon
- Painting (≈ 220 pt) with a **glossary sheet fragment** (§4.5, small detent) showing one term, e.g. "Recapitulation · The themes come back, now in the home key."
- Title: **EN** "Written for listeners." · **TR** "Dinleyiciler için yazıldı."
- Body: **EN** "When a musical term comes up, tap it for a short, plain explanation." · **TR** "Bir müzik terimi geçtiğinde dokunun, kısa ve sade bir açıklama açılsın."

### 4. Premium, gently (optional page; draw it, we decide)
- Shown only if the Apple ID can still take the free trial.
- Painting: Friedrich, *Wanderer above the Sea of Fog* (the paywall's painting, so the two feel related), shorter than on the paywall.
- Title: **EN** "The whole library, free for 3 days." · **TR** "Kütüphanenin tamamı, 3 gün ücretsiz."
- Benefit lines (§3.14): past pieces · search · (one more Premium benefit line, see below).
- Primary button: **EN** "Start 3-day free trial" · **TR** "3 gün ücretsiz dene"; under it the renewal line in SF 12 `ink3`: "3 days free, then ₺129,99 a month. Cancel any time in your Apple ID settings."
- Secondary text button (SF 15 `accent`): **EN** "Continue with today's piece" · **TR** "Bugünün eseriyle devam et". This must be as easy to reach as the trial button: it is an offer, not a wall.

### 5. Reminder (existing, §4.16)
Keep as it is, restyled only if needed so it reads as the last page of the same flow (page dots, same top spacing as pages 1–4).

## Controls

- **Page dots** under the text, as in §4.15.
- **Primary button** on pages 1–3: **EN** "Continue" · **TR** "Devam".
- **Skip** on pages 1–4: G1 glass circle with the `close` icon or a small glass capsule "Skip / Geç", top right at the same position as the paywall's close button. Skip goes straight to the reminder page.
- **Sign in** link on page 1 only, under the button: "Already have an account? **Sign in**" (as now).
- Swipe between pages horizontally.

## Also draw

- Page 1 at the largest accessibility text size (the painting shrinks first, the text never truncates).
- Reduce Transparency variant of the skip control.

## Premium benefit lines (for page 4 and the paywall)

The paywall gets two new benefit lines (planned features); please use them on page 4 too:
- **EN** "Catch up on the days you missed" · **TR** "Kaçırdığınız günleri yakalayın"
- **EN** "Each day's painting as a wallpaper" · **TR** "Günün tablosu duvar kâğıdı olarak"

## Out of scope

Account creation inside onboarding, analytics prompts, notification pre-permission screens beyond the existing reminder page.
