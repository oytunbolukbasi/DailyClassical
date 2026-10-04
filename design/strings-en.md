# DailyClassical — UI strings (en)

Source: `design/DailyClassical2.html`, the complete export (Round 3 canvas plus section 05 States and 06 Tokens). This file holds UI chrome only. Piece content (titles, hooks, guide text, glossary definitions, painting captions, composer bios) comes from the content API and is **not** listed here.

Conventions
- Keys use `screen.element` in lowerCamelCase. `{placeholder}` marks an interpolated value; in a String Catalog, use the format specifiers given.
- Use typographic characters exactly as written: `’` (U+2019), `“ ”`, `·` (U+00B7 middle dot with spaces either side), `≈` (U+2248), `–` (U+2013 en dash), `›` (U+203A), `…` (U+2026).
- Uppercase section labels are written in sentence case and rendered uppercase with `.textCase(.uppercase)`. Do **not** store them in capitals. This keeps them translatable.
- Allow about 30 % expansion (brief) in buttons, tabs and plan cards.

---

## Tab bar (global)

| Key | English |
|---|---|
| tab.today | Today |
| tab.library | Library |
| tab.settings | Settings |
| tab.search.accessibilityLabel | Search *(icon-only tab; label not visible in design)* |

## Today

| Key | English | Notes |
|---|---|---|
| today.startListening | Start listening | Primary glass button |
| today.meta.format | {year} · About {minutes} minutes · {count} movements | e.g. "1893 · About 46 minutes · 4 movements". Use plural rules for minutes/movements |
| today.dateChip.weekday | {weekday} | e.g. "Saturday"; system `DateFormatter` "EEEE", rendered uppercase |
| today.dateChip.monthYear | {month} {year} | e.g. "October 2026"; "LLLL yyyy", rendered uppercase |
| today.dateChip.day | {day} | e.g. "4" |
| common.composerLink.accessibilityHint | Opens composer details | *(not visible; proposed)* |

## Piece page

| Key | English | Notes |
|---|---|---|
| piece.meta.format | {year} · About {minutes} minutes | Header meta line |
| piece.section.bigPicture | The big picture | Section label |
| piece.section.movements | Movements | Section label |
| piece.movements.footnote | Durations are from the reference recording: {conductor}, {ensemble} ({label}, {year}). Tap a row to jump to that movement. | Under the movement table. The conductor's full name is used here |
| piece.movement.label | Movement {roman} | e.g. "Movement I" |
| piece.movement.meta.format | {key} · {metre} · {duration} | e.g. "B minor · 4/4 · 19:44". Same pattern in table rows without the duration: `{key} · {metre}` |
| piece.section.mainIdeas | Main ideas | |
| piece.section.listeningStops | Listening stops | |
| piece.listeningStops.note | Times are approximate and follow the reference recording: {conductorSurname}, {ensemble} ({label}, {year}). | e.g. "…Currentzis, musicAeterna (Sony Classical, 2017)." |
| piece.stop.time.single | ≈ {time} | e.g. "≈ 4:30" |
| piece.stop.time.range | ≈ {start} to {end} | e.g. "≈ 9:30 to 10:30" |
| piece.section.thingsToNotice | Things to notice | |
| piece.section.inThisRecording | In this recording | Optional section (named in the template slot note, not drawn) |
| piece.section.threads | Threads that tie the piece together | |
| piece.section.recordings | Recommended recordings | |
| piece.recordings.referenceSuffix | {label}, {year} · Reference recording | Sub-line of the recordings card |
| piece.section.sources | Sources and credits | |
| piece.sources.painting | Painting: {artist}, {title}, {year}. {collection}. Public domain. | `{title}` in italics |
| piece.sources.recording | Recording data: Spotify. Durations from {label}, {year}. | |
| piece.openInSpotify | Open in Spotify | Floating glass primary button |
| piece.nav.back.accessibilityLabel | Back | *(icon only)* |
| piece.nav.favourite.accessibilityLabel | Add to Favourites | *(icon only; proposed)* |
| piece.nav.unfavourite.accessibilityLabel | Remove from Favourites | *(proposed)* |
| piece.nav.viewArtwork.accessibilityLabel | View painting | *(icon only; proposed)* |
| piece.nav.glossary.accessibilityLabel | Glossary | *(icon only; proposed)* |
| piece.switcher.accessibilityLabel | Movement {roman} | Segments show roman numerals I, II, III, IV, V |

## Glossary sheet (term pop-over)

| Key | English |
|---|---|
| glossarySheet.seeAll | See all terms in Library › |
| common.close.accessibilityLabel | Close |

## Recordings sheet

| Key | English | Notes |
|---|---|---|
| recordings.title | Recordings | |
| recordings.subtitle | Listening-stop times follow the first recording. | |
| recordings.referenceBadge | Reference recording | Rendered uppercase |
| recordings.row.meta | {label} · {year} | e.g. "Sony Classical · 2017" |
| recordings.openInSpotify | Open in Spotify | Row button |
| recordings.placeholder.performers | Conductor, Orchestra | Design placeholder only; real rows use data |
| recordings.placeholder.meta | Label · Year | Design placeholder only |

## Composer sheet

| Key | English | Notes |
|---|---|---|
| composer.meta.format | {birthYear} – {deathYear} · {nationality} · {era} | e.g. "1840 – 1893 · Russian · Romantic era" |
| composer.fact.born | Born | Rendered uppercase |
| composer.fact.died | Died | |
| composer.fact.symphonies | Symphonies | Fact labels may be data-driven; these four are the ones shown |
| composer.fact.bestKnownFor | Best known for | |
| composer.section.inApp | In DailyClassical | Rendered uppercase |
| composer.piece.today | Today | Sub-line when the listed piece is today's piece |
| composer.morePiecesNote | More of his pieces will appear here as they are published. | Gendered pronoun. Consider "More pieces by this composer will appear here as they are published." for neutrality and localisation |

## Library

| Key | English |
|---|---|
| library.title | Library |
| library.segment.all | All pieces |
| library.segment.favourites | Favourites |
| library.filter.composer | Composer |
| library.filter.era | Era |
| library.filter.glossary | Glossary |
| library.row.meta | {composer} · {year} |
| library.row.locked.accessibilityLabel | Premium *(lock icon; proposed)* |

## Library › Glossary

| Key | English |
|---|---|
| glossary.back | Library |
| glossary.title | Glossary |
| glossary.intro | Every term that appears in a piece, explained for listeners. Tap one to read it in full. |
| glossary.searchPlaceholder | Search terms |

## Search

| Key | English | Notes |
|---|---|---|
| search.cancel | Cancel | |
| search.group.pieces | Pieces | Rendered uppercase |
| search.group.glossary | Glossary | Rendered uppercase |
| search.group.composers | Composers | Named in the brief; **not drawn** |
| search.result.pieceMeta | {composerSurname} · {year} | e.g. "Tchaikovsky · 1893" |
| search.placeholder | Search | *(field placeholder not drawn; proposed)* |

## Paywall

| Key | English | Notes |
|---|---|---|
| paywall.title | More of this. | |
| paywall.subtitle | Every symphony we have written about, whenever you want it. | |
| paywall.benefit.library | The full library of past pieces | |
| paywall.benefit.search | Search pieces, composers and terms | |
| paywall.benefit.tbd | Open benefit line (to confirm) | Placeholder; do not ship |
| paywall.plan.badge.bestValue | Best value | Rendered uppercase |
| paywall.plan.lifetime.name | Lifetime | |
| paywall.plan.lifetime.detail | One payment, forever | |
| paywall.plan.monthly.name | Monthly | |
| paywall.plan.monthly.detail | Per month, cancel any time | |
| paywall.cta | Continue · {price} | `{price}` = StoreKit `displayPrice` of the selected plan, e.g. "₺600" |
| paywall.restore | Restore purchases | |
| paywall.terms | Terms | |
| paywall.privacy | Privacy | |

## Settings

| Key | English | Notes |
|---|---|---|
| settings.title | Settings | |
| settings.section.account | Account | Rendered uppercase |
| settings.account.email | {email} | Signed-in row shows the user's email. Guest row copy not drawn |
| settings.section.reading | Reading | |
| settings.dailyReminder | Daily reminder | Value: time, e.g. "08:00" |
| settings.theme | Theme | |
| settings.theme.system | System | Light/Dark options per brief (not drawn): "Light", "Dark" |
| settings.textSize | Text size | |
| settings.textSize.followsSystem | Follows system | |
| settings.language | Language | |
| settings.language.english | English | |
| settings.section.premium | Premium | |
| settings.premium.row | DailyClassical Premium | |
| settings.premium.status.free | Free | Premium status value |
| settings.restorePurchases | Restore purchases | |
| settings.section.about | About | |
| settings.about.credits | About and credits | |
| settings.about.sources | Painting and recording sources | |

## Artwork viewer

| Key | English | Notes |
|---|---|---|
| artwork.titleLine | {title}, {year} | Italic. Data-driven |
| artwork.meta | {medium} · {collection} · Public domain | e.g. "Oil on canvas · State Tretyakov Gallery, Moscow · Public domain" |

## Onboarding

| Key | English |
|---|---|
| onboarding.1.title | One symphony a day, with a guide you read while it plays. |
| onboarding.1.body | Press play in Spotify, come back, and follow along. Today’s piece is already waiting behind this card. |
| onboarding.continue | Continue |
| onboarding.haveAccount | Already have an account? |
| onboarding.signIn | Sign in |
| onboarding.2.eyebrow | Last thing |
| onboarding.2.title | When should today’s piece arrive? |
| onboarding.2.body | One quiet notification a day. Change it any time in Settings. |
| onboarding.2.cta | Remind me at {time} |
| onboarding.2.notNow | Not now |

## Favourites and account

| Key | English | Notes |
|---|---|---|
| favourites.prompt.title | Keep the pieces you love | Sign-in prompt sheet |
| favourites.prompt.body | Favourites live in your Library and follow you to any device. All it takes is an email address. | |
| favourites.prompt.createAccount | Create an account | |
| favourites.prompt.signIn | Sign in | |
| favourites.prompt.notNow | Not now | |
| favourites.toast.saved | Saved to Favourites | Toast |
| auth.create.title | Create an account | |
| auth.create.subtitle | One email, one password. No newsletter. | |
| auth.field.email | Email | |
| auth.field.password | Password | |
| auth.password.hint | At least 8 characters. | |
| auth.create.cta | Create account | Note: no "an". It differs from the title |
| auth.legal.format | By continuing you agree to the {terms} and {privacy}. | `{terms}` = auth.legal.terms, `{privacy}` = auth.legal.privacy, both links |
| auth.legal.terms | Terms | |
| auth.legal.privacy | Privacy Policy | |
| auth.haveAccount | Already have an account? | |
| auth.signInLink | Sign in | |
| auth.signIn.title | Sign in | |
| auth.signIn.subtitle | Welcome back. | |
| auth.signIn.cta | Sign in | |
| auth.forgotPassword | Forgot password? | Opens Reset password |
| auth.newHere | New here? | |
| auth.createAccountLink | Create an account | |
| auth.password.show.accessibilityLabel | Show password | *(eye icon; proposed)* |

## Reset password

| Key | English | Notes |
|---|---|---|
| auth.reset.title | Reset password | |
| auth.reset.subtitle | We will email you a link to choose a new one. | |
| auth.reset.cta | Send reset link | |
| auth.reset.backToSignIn | Back to sign in | |
| auth.checkEmail.title | Check your email | |
| auth.checkEmail.body | A reset link is on its way to {email}. It expires in 30 minutes. | `{email}` is weight 500 |
| auth.checkEmail.hint | Nothing there? Check spam, or send it again. | |
| auth.checkEmail.openMail | Open Mail | |
| auth.checkEmail.sendAgain | Send again | |

## Settings › Account

| Key | English | Notes |
|---|---|---|
| account.back | Settings | Back pill (system back title) |
| account.title | Account | Large title; the subtitle is `{email}` |
| account.email | Email | Row; value `{email}` |
| account.changePassword | Change password | |
| account.signOut | Sign out | Accent row |
| account.signOut.footer | You can sign back in any time. Favourites stay with your account. | |
| account.delete | Delete account | Danger row |
| account.delete.footer | Removes your account and favourites permanently. Premium purchases are tied to your Apple ID and are unaffected. | |
| account.delete.alert.title | Delete account? | System alert |
| account.delete.alert.message | Your account and favourites will be removed permanently. This cannot be undone. | |
| account.delete.alert.cancel | Cancel | |
| account.delete.alert.confirm | Delete | Destructive |

## Library › Favourites

| Key | English | Notes |
|---|---|---|
| favourites.row.saved | Saved {relativeDate} | e.g. "Saved today", "Saved 28 September" (`today` / "d MMMM") |
| favourites.footer | Swipe left to remove. Favourites are free; locked pieces stay locked until Premium. | |
| favourites.empty.title | Nothing saved yet | Guest and signed-in empty |
| favourites.empty.body | Tap the heart on any piece to keep it here. | Signed-in empty |
| favourites.empty.body.guest | Tap the heart on any piece to keep it here. Sign in and your favourites follow you to every device. | Guest |
| favourites.empty.guestCta | Sign in or create account | Guest |
| library.row.todaySuffix | {year} · Today | Today's piece in Library rows: "Tchaikovsky · 1893 · Today" |

## States (section 05)

| Key | English | Notes |
|---|---|---|
| state.offline.date | {weekday}, {day} {month} | e.g. "Saturday, 4 October", rendered uppercase in accent |
| state.offline.title | You’re offline | |
| state.offline.body | Today’s piece will appear as soon as you reconnect. Pieces you have opened before stay readable offline. | |
| state.retry | Try again | |
| search.empty.title | Nothing for “{query}” yet | |
| search.empty.body | We add one piece a day. Try a composer from the library, or a term like “coda”. | |
| state.loading.accessibilityLabel | Loading | Skeleton has no visible text; proposed VoiceOver label |

---

## Proposed, not in the design

These states or labels are **not drawn**, even in the complete export. Their keys are reserved and the copy needs sign-off.

| Key | Proposed English | For |
|---|---|---|
| state.error.generic | Something went wrong. | Generic network/server error |
| auth.error.invalidEmail | Enter a valid email address. | Form validation (`--danger`) |
| auth.error.passwordTooShort | Use at least 8 characters. | |
| auth.error.wrongCredentials | Email or password is incorrect. | |
| auth.error.emailInUse | An account with this email already exists. | |
| settings.account.signIn | Sign in | Guest state of the Settings Account row |
| favourites.toast.removed | Removed from Favourites | Un-favourite toast |
| account.changeEmail.title | Change email | Destination of the Email row |
| account.changePassword.title | Change password | Destination of the row |
