# Content guide

How to write a DailyClassical piece. Read this before adding or editing anything under `content/`.
It is written for the people and agents who will extend the catalogue after launch; the ten launch
symphonies (`content/en/pieces/*.md`) are the reference examples.

## 1. What a piece is

One work a day, with a listening guide you read **while the music plays**, and one public-domain
painting paired with it. The catalogue is not only symphonies: concertos, sonatas, string quartets
and other forms all use the same page. Every guide is written for **listeners, not musicians**.

A piece is made of:

| File | What goes in it |
| --- | --- |
| `content/en/pieces/<id>.md` | English guide: yaml meta + markdown sections (format in §4) |
| `content/tr/pieces/<id>.md` | Turkish guide, same structure, same `id` |
| `content/en/glossary.md`, `content/tr/glossary.md` | Every `[[term]]` used in any guide (§6) |
| `content/composers.yaml` | Composer sheet (only if the composer is new) |
| `content/paintings.yaml` | The painting's image file, licence and credit (language-neutral) |
| `content/research/<id>.md` | Verification note: every fact, credit and duration with its source URL |
| `content/schedule.yaml` | When it becomes "Today" (only when it is ready to publish) |

## 2. Ids and forms

- **id:** `<composer-surname>-<form>-<number>` in lower-case ASCII: `beethoven-symphony-5`,
  `rachmaninoff-piano-concerto-2`, `beethoven-piano-sonata-8`, `haydn-string-quartet-op-76-3`.
  Works without a number use a short slug of the title: `berlioz-symphonie-fantastique`.
  The id never changes once published (favourites, image files and schedules use it).
- **form:** exactly one of the values below. It drives the Library filter and nothing else, so
  pick the form a listener would look for.

| `form` | Library chip (EN / TR) |
| --- | --- |
| `symphony` | Symphonies / Senfoniler |
| `piano-concerto` | Piano concertos / Piyano konçertoları |
| `violin-concerto` | Violin concertos / Keman konçertoları |
| `cello-concerto` | Cello concertos / Viyolonsel konçertoları |
| `concerto` | Other concertos / Diğer konçertolar |
| `piano-sonata` | Piano sonatas / Piyano sonatları |
| `sonata` | Other sonatas / Diğer sonatlar |
| `string-quartet` | String quartets / Yaylı dörtlüler |
| `chamber` | Chamber music / Oda müziği |
| `orchestral` | Orchestral works / Orkestra eserleri (overtures, tone poems, suites) |
| `choral` | Choral works / Koro eserleri |

A new form needs a code change (backend `PIECE_FORMS`, iOS `PieceForm`, two strings). Ask first.

## 3. Choosing the recording, the painting and the facts

**Reference recording.** The listening-stop times are tied to it, so it must be on Spotify as a
whole album. If the product owner names a favourite recording, use it. Then:

1. Strip the tracking parameters from the Spotify link: keep `https://open.spotify.com/album/<id>`.
2. Confirm the album from Spotify's public embed page `https://open.spotify.com/embed/album/<id>`
   (it lists every track with credits and exact durations). Note which tracks are this work.
3. Take label, catalogue number, recording dates and venue from a primary source: Discogs
   (`https://api.discogs.com/releases/<id>`), the label's page, Presto Music or the booklet.
   Spotify's release date is the digital edition's, not the original release.
4. Movement durations in the Movements table are the **exact track times** of that album.
5. Add one or two `also_recommended` recordings, verified the same way.

**Performers by form.** Symphonies and orchestral works: `conductor` + `orchestra`. Concertos:
`soloists` (role = instrument) + `conductor` + `orchestra`. Solo sonatas: `soloists` only (omit
`conductor` and `orchestra`). Chamber works: `soloists` for each player, or `ensemble` as the
`orchestra` value with no conductor (e.g. `orchestra: Emerson String Quartet`).

**Painting.** One painting, in the public domain by age (the artist died more than 70 years ago),
with a high-resolution open-access image (Wikimedia Commons, or a museum open-access download).
Never use NC-licensed photos. It should share something real with the music: the same years,
the same place, the same mood or idea. The `pairing_note` says what in one sentence. Prefer a
painting not already used; check `content/paintings.yaml`.

**Privacy in research requests.** Never put the product owner's (or anyone's) email address, name
or other personal data in requests to outside services: not in URLs, headers or `User-Agent`
strings. APIs that ask for a contact in the `User-Agent` (MusicBrainz) get the project's generic
one: `DailyClassical/1.0 (+https://dailyclassical.co)`.

**Facts.** Every claim in "The big picture" and in the movement texts must be checkable. Put the
source for each in `content/research/<id>.md`. When sources disagree, say so there and use the
more cautious wording in the guide. Never invent anecdotes; well-known legends are told as legends
("the story goes…").

## 4. The piece file

The heading is `## <Composer surname> – <Title>`, then a yaml block, then the sections, in this
order. Labels must match exactly (English / Turkish) because the parser reads them.

````markdown
## Rachmaninoff – Piano Concerto No. 2 in C minor

```yaml
id: rachmaninoff-piano-concerto-2
composer: Sergei Rachmaninoff        # must equal `match` in composers.yaml
form: piano-concerto
title: Piano Concerto No. 2 in C minor
catalogue: Op. 18                     # or null
key: C minor                          # or null (TR: "Do minör")
year: 1901                            # completion / premiere year, as an integer
duration_min: 33                      # rounded sum of the reference tracks
movement_count: 3                     # must equal the number of movement sections
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
  year: 1959                          # shown next to the recording
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

- 3 to 5 bullets: when and why it was written, what is unusual about it, what to listen for.
- In one line: a map of the movements, e.g. "brooding bells (I), a slow nocturne (II), a race to the finish (III)."

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Moderato | C minor | 2/2 | 11:02 |

### I. Moderato

**Summary.** Two or three sentences: what this movement does and how it feels.

**Main ideas**

- Theme 1, bells: what it sounds like and who plays it.
- Theme 2, the big tune: …

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Eight slow piano chords, growing louder like a bell | The introduction, piano alone |
| ≈ 1:30–2:10 | … | … |
| Near the end | … | … |

**Things to notice**

1. One or two numbered points the listener can test with their own ears.

**In this recording.** Optional notes with any bold title ("A hidden trick.", "Why so slow?").

### Threads

- **Bold title.** Two or three ideas that tie the movements together.
````

**Rules the parser and the app rely on**

- Movement sections are `### <Roman numeral>. <heading>`; the numerals match the Movements table.
- The Movements table may use `Title` or `Title or tempo` columns for named movements.
- Stop times are measured from the start of **that movement's track**, `m:ss` (or `h:mm:ss`).
  `≈` marks an approximate time. Use the three variants on purpose: a single time (`≈ 4:30`),
  a range (`≈ 9:30–10:30`), and no time (`Mid-development`, `Near the end`).
- Every movement has at least one listening stop. Aim for 4–8 per movement; long slow
  movements may have fewer, long sonata-form movements more.
- Times must come from listening to the reference recording, or be marked `≈` and listed in
  `content/research/retime-needed.md` so a human can re-time them.
- `*italics*` for titles of works and for dynamics (`*pp*`). No other markdown inside cells.
- Straight quotes are fine; the build turns them into typographic quotes.

## 5. How to write

- **Listener first.** Describe what you hear before naming it: "the opening tune comes back, now
  in the piano's lowest register" and only then "the [[recapitulation]]". The "What you hear"
  column is sound; the "What is happening" column is structure and meaning.
- **Short sentences, plain words.** No hype ("sublime", "breathtaking", "masterpiece"), no
  exclamation marks, no second-person commands except in "Things to notice".
- **Concrete over abstract.** Name the instrument, the register, the rhythm. "A clarinet, very
  quiet, over plucked strings" beats "a mysterious atmosphere".
- **Explain only what is needed to listen.** Keys, bar numbers and harmonic analysis appear only
  when they change what the listener hears (a surprise key, the minor turning major).
- **British spelling** in English (colour, metre, programme). En dash for ranges and in headings.
- **Form-specific angles:**
  - *Concerto:* who has the tune (soloist or orchestra), the dialogue and contests between them,
    the [[cadenza]], the double exposition in Classical first movements.
  - *Sonata:* one instrument doing everything; register (high, low), the two hands, the pedal,
    silence. Name the instrument's colours as you would an orchestra's.
  - *String quartet:* four voices; who leads, who answers, when they play as one.
  - *Symphony:* sections of the orchestra and how the movements connect.

## 6. Glossary

- EN: `[[term]]` (the key is the term itself). TR: `[[english key|türkçe yüzey]]`, the key is
  always the English term, the surface is the Turkish word as it appears in the sentence
  (with its suffix: `[[cadenza|kadansı]]`).
- Reuse existing terms first (`content/en/glossary.md`). A new term gets a row in **both**
  glossary files: EN `| Term | Definition |`, TR `| Key | Terim | Tanım |`. One or two sentences,
  written for a pop-over, no circular definitions.
- Mark a term once or twice per piece where it helps, not every time it appears.

## 7. Turkish

- The Turkish file is a natural Turkish text, not a word-for-word translation. Same facts,
  same stops, same times, same number of bullets.
- Titles follow Turkish usage: "Do minör 2. Piyano Konçertosu", "Do minör 8. Piyano Sonatı,
  “Patetik”". Keys: Do, Re, Mi, Fa, Sol, La, Si + majör/minör; "bemol", "diyez".
- Composer names as in `composers.yaml` `names.tr` (Çaykovski, Rahmaninov, Şostakoviç).
- Labels: Genel bakış, Tek cümleyle, Bölümler, Özet, Ana fikirler, Dinleme durakları,
  Dikkat edilecekler, Bağlayan ipler. Table headers: `| | Tempo | Ton | Ölçü | Süre |` and
  `| Zaman | Ne duyuyorsunuz | Ne oluyor |`. "Near the end" → "Sona doğru".
- The yaml block keeps English keys; translate `title`, `key`, `hook`, `painting.title`,
  `painting.collection` (city names in Turkish: Viyana, Moskova), `pairing_note`, and add
  `composer_display` with the Turkish name. Recording fields stay as on the album.

## 8. New composer

Add an entry to `content/composers.yaml` (format at the top of that file): names in both
languages, nationality, facts (born, died, symphonies, best_known_for), a three-paragraph bio
in both languages, and a public-domain or CC-licensed portrait with its credit. Sources go in
`content/research/composers-sources.md`.

## 9. Checklist

From `backend/`:

1. `npm run content:build` – must print no `!` warnings (undefined glossary terms, empty movements).
2. Add the painting to `content/paintings.yaml`, then `npm run images -- --only <id>` and
   `npm run images:widget` (new composer: `npm run images -- --only <composer id>`).
3. `npm run db:seed && npm run fixtures` (the app bundles the fixtures).
4. Add the id to `content/schedule.yaml` when it should go live.
5. Open the piece in the app in both languages: every glossary term opens, the movement switcher
   jumps correctly, the Spotify button opens the album.

## 10. App copy

The app is about works, not only symphonies. In interface strings (`ios/strings/*.json`), App
Store text and emails, say "work" / "piece" (TR: "eser"), never "symphony", unless the sentence is
about a specific symphony.
