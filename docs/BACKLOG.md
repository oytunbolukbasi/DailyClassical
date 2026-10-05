# Backlog

Open work after the scaffold (state on 5 Oct 2026). Owner in brackets.

## Done on 5–6 Oct 2026 (device feedback)
- Widgets (small / medium / large, light, dark, tinted) built to the approved canvas design; offline, refresh at midnight, follow the app language, tap opens the piece.
- Today: layout A (painting fills the screen, text anchored above the tab bar, 30 pt title); swipe between published days.
- Piece page: movement switcher and Movements table jump reliably; fast-scroll crash fixed (Palette colour provider ran on SwiftUI's async render thread).
- Images: optimized (70 MB → 5.4 MB), bundled, disk-cached, thumbnails in lists; Shostakovich portrait (CC BY 4.0, credited).
- Search: stray line removed, idle hint, recent searches persist; Settings: "Text size" row removed; Library: Glossary chip beside All / Favourites.

## Test data to reset before launch
- `content/schedule.yaml` starts on 2026-09-27 so all ten pieces are published for content review; set `start` to launch day (Tchaikovsky 6 first) and re-run `npm run db:seed && npm run fixtures`.

## Next up (engineering)
1. [Claude] Dark mode + Reduce Transparency visual pass against the canvas (every screen is drawn dark in `design/DailyClassical2.html`).
2. [Claude] Signed-in screens visual pass: Favourites list, Account, premium Search results. Needs a reachable API (Railway domain or local `npm run dev`).
3. [Claude] Remaining P2 items in `design/AUDIT.md`, e.g. glossary `short` field, thumbnail-sized image URLs, Sources screen loading pieces one by one, fixed font sizes that ignore Dynamic Type.
4. [Claude] Rate limiting on `/v1/auth/login`, `/register`, `/verify`, `/verify/resend`, `/password-reset` (required before launch).
5. [Claude] Localize `NSLocalNetworkUsageDescription` (EN only today; debug builds only).
6. [Claude] Point debug builds at the Railway API once it has a public domain, instead of the Mac on the LAN.

## Content decisions
7. [Oytun] Re-time listening stops where measured durations differ from the drafts: see `content/research/retime-needed.md` (Shostakovich III Largo +2:40; Mozart 40 I–II, Schubert 8 I–II ±25–45 s; Beethoven 9 finale split across two tracks).
8. [Oytun] Shostakovich portrait: no safely public-domain photo; CC BY-SA option listed in `content/research/composers-sources.md`.
9. [Oytun] Mravinsky's Tchaikovsky 6 (DG) isn't on Spotify; pick another alternative recording or keep "Not on Spotify".
10. [Oytun] Malevich (Shostakovich 5 painting): small US copyright risk; switch to Repin if the app ships in the US store.
11. [Oytun] Official Spotify mark asset for "Open in Spotify" buttons (Spotify design guidelines).
12. [Oytun] Native read of the Turkish content and UI copy.

## Infrastructure
13. [Oytun] Rotate secrets that appeared in chat: Neon password, Resend API key, production `JWT_SECRET`; update Railway variables and local `backend/.env`.
14. [Oytun] Connect `api.dailyclassical.co` to Railway (Custom Domain + CNAME at the DNS host; Cloudflare proxy off).
15. [Claude] Neon `dev` branch for local development so tests never touch production data.
16. [Oytun] Terms and Privacy pages at dailyclassical.co/terms and /privacy (App Store requirement).

## Testing notes
- Debug builds unlock Premium by default (`EntitlementStore.debugUnlock`) and read bundled content, so the full app works on a device with no server. Release/TestFlight builds use StoreKit + the production API.
- Premium test account: `premium-test@dailyclassical.co`, password in the git-ignored `backend/test-accounts.local.md`.
