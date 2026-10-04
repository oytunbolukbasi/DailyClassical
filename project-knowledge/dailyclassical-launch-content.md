# DailyClassical – Launch Content (10 Symphonies)

Test content for the DailyClassical iOS app. Language: English. Every piece follows the same structure as the design brief's piece page.

## Read this first

- **Timings are drafts.** Movement durations and listening-stop times are approximate (marked with ≈) and tied to the reference recording named in each piece. Only the Tchaikovsky movement durations were checked against a track listing. Verify every time against the actual recording before publishing.
- **Spotify links are empty.** `spotify_url` is `null` for every recording; fill them in by hand.
- **Paintings are references, not files.** Each piece names one public-domain painting (artist, title, year, collection). Source the image from the holding museum's open-access collection and confirm the rights for your territories. One entry (Malevich, piece 10) carries a specific rights flag.
- **Glossary markup.** `[[term]]` marks a tappable glossary term. Every marked term is defined in the Glossary at the end of this file.
- **Stop variants.** Listening stops appear in three forms on purpose, so the UI can be tested with each: a single time (`≈ 4:30`), a range (`≈ 9:30–10:30`), and no time (`Mid-development`, `Near the end`).

## Structure of each piece

1. Heading: `## <n>. <Composer> – <Title>`
2. A `yaml` meta block: id, composer, title, catalogue, key, year, duration, hook, reference recording, also recommended, painting
3. `### The big picture`: 3 to 5 bullets and a one-line map of the movements
4. `### Movements`: overview table
5. One `###` section per movement: Summary, Main ideas, Listening stops, Things to notice (not every movement has all four)
6. `### Threads`: ideas that tie the piece together

---

## 1. Mozart – Symphony No. 40 in G minor

```yaml
id: mozart-symphony-40
composer: Wolfgang Amadeus Mozart
title: Symphony No. 40 in G minor
catalogue: K. 550
key: G minor
year: 1788
duration_min: 34
movement_count: 4
hook: Classical elegance with a racing pulse underneath.
reference_recording:
  conductor: Sir Charles Mackerras
  orchestra: Scottish Chamber Orchestra
  label: Linn Records
  year: 2008
  spotify_url: null
also_recommended:
  - conductor: Nikolaus Harnoncourt
    orchestra: Concentus Musicus Wien
    label: Sony Classical
    year: 2014
    spotify_url: null
painting:
  artist: Claude-Joseph Vernet
  title: A Shipwreck in Stormy Seas
  year: 1773
  collection: National Gallery, London
  pairing_note: The same years, the same taste for storm and agitation held inside a perfectly balanced frame.
```

### The big picture

- Written in the summer of 1788, within about six weeks, alongside Symphonies No. 39 and No. 41. They were Mozart's last three.
- One of only two symphonies Mozart wrote in a minor key. Both are in G minor.
- There are no trumpets and no drums. All the drama comes from strings and woodwinds.
- Mozart later added clarinets to the score, which suggests the work was performed in his lifetime.
- In one line: anxiety in motion (I), an uneasy calm (II), a stern dance (III), a race that refuses a happy ending (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Molto allegro | G minor | 2/2 | ≈ 7:30 |
| II | Andante | E-flat major | 6/8 | ≈ 13:00 |
| III | Menuetto: Allegretto | G minor | 3/4 | ≈ 4:00 |
| IV | Allegro assai | G minor | 2/2 | ≈ 9:30 |

### I. Molto allegro

**Summary.** The symphony starts as if we had walked in on something already under way: a murmuring accompaniment first, then one of the most famous tunes in music. The movement is in [[sonata form]].

**Main ideas**

- Theme 1, agitation: a sighing three-note figure (short, short, long) repeated in the violins over restless violas.
- Theme 2, brief relief: a gentle, sliding melody shared between strings and woodwinds, in a [[major]] key.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Violas murmur for a moment alone; then violins enter with the sighing tune | Theme 1. The accompaniment begins before the melody, which was highly unusual |
| ≈ 0:45 | A pause, then a softer melody passed between strings and woodwinds | Theme 2, in B-flat major. The only calm in the movement |
| ≈ 1:50 | The opening returns exactly | The [[exposition]] is repeated |
| ≈ 3:40 | The sighing tune appears in a strange, distant key, then is tossed between low and high strings | The [[development]]. The theme is pulled apart until only its three-note sigh remains |
| ≈ 5:00 | Woodwinds drift downward and the sighing tune slips back in | The [[recapitulation]] |
| ≈ 6:00 | The gentle second melody returns, but darker | Theme 2 is now in G minor. The relief it offered earlier is withdrawn |
| Near the end | A last quiet statement of the sigh, then firm chords | The [[coda]] |

**Things to notice**

1. The whole first theme grows out of three notes. Count how often you hear that short-short-long rhythm.
2. Compare Theme 2 the first time (major, consoling) with its return (minor, resigned). Same notes, opposite effect.

### II. Andante

**Summary.** The only movement that leaves G minor. It sounds calm, but the calm is built from nervous little pieces.

**Main ideas**

- A theme made of repeated notes that enters one layer at a time: violas, second violins, first violins.
- Tiny two-note flutters that flicker through strings and woodwinds.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Repeated notes stacking up from low to high | The main theme assembles itself in layers |
| ≈ 0:40 | Quick two-note flutters, like small sighs, passing between instruments | The second idea. It will decorate everything from here on |
| Middle | The repeated notes turn insistent and the harmony darkens | The [[development]]. The calm surface cracks |
| ≈ 8:00 | The layered opening returns | The [[recapitulation]] |

**Things to notice**

1. The flutter figure is a cousin of the sigh from the first movement.

### III. Menuetto: Allegretto

**Summary.** A [[minuet]] in name only. Nobody could dance to this: it is stern, angular and full of clashing lines.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A heavy, striding tune with accents in unexpected places | The minuet. Phrases are three bars long instead of the usual four, which keeps it off balance |
| ≈ 0:40 | Upper and lower instruments chase each other with the same tune | The lines overlap in [[canon]], grinding against each other |
| ≈ 1:50 | Suddenly gentle: strings, then woodwinds, then glowing horns | The [[trio]], in G major. The most peaceful minute of the symphony |
| ≈ 3:00 | The stern dance returns | The minuet is repeated |

### IV. Allegro assai

**Summary.** A fast, driven finale in [[sonata form]] that stays in the minor to the last bar.

**Main ideas**

- Theme 1: a quiet upward leap through a chord, answered by a loud outburst.
- Theme 2: a smooth, singing line in the violins.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Soft rising figure, loud answer, soft, loud | Theme 1. A question-and-answer built on an upward [[arpeggio]] |
| ≈ 1:00 | A calmer, singing melody in the violins, echoed by clarinet | Theme 2, in B-flat major |
| ≈ 3:50 | A jagged, stumbling passage for the whole orchestra with no clear key | The start of the [[development]]. For a few seconds Mozart touches almost every note of the scale and the music loses its footing |
| ≈ 4:10 | The rising figure piled on top of itself, entering in one section after another | A stretch of [[fugato]] |
| ≈ 5:20 | The quiet rising figure returns | The [[recapitulation]] |
| Near the end | The singing melody again, now in the minor; then a brisk close | No turn to the major. The symphony ends as darkly as it began |

**Things to notice**

1. That jagged passage at the start of the development is one of the strangest moments in 18th-century music. It lasts only a few seconds.

### Threads

- **The minor key holds.** Three of four movements are in G minor, and the finale refuses the customary happy ending.
- **Sighs.** Short falling figures run through the first, second and last movements.
- **Drama without drums.** With no trumpets or timpani, the tension comes from harmony and rhythm alone.

---

## 2. Beethoven – Symphony No. 5 in C minor

```yaml
id: beethoven-symphony-5
composer: Ludwig van Beethoven
title: Symphony No. 5 in C minor
catalogue: Op. 67
key: C minor
year: 1808
duration_min: 33
movement_count: 4
hook: Four notes, and everything that can be built from them.
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  year: 1975
  spotify_url: null
also_recommended:
  - conductor: Teodor Currentzis
    orchestra: musicAeterna
    label: Sony Classical
    year: 2020
    spotify_url: null
painting:
  artist: J. M. W. Turner
  title: "Snow Storm: Hannibal and his Army Crossing the Alps"
  year: 1812
  collection: Tate Britain, London
  pairing_note: A struggle through darkness with light breaking at the edge of the storm, painted within four years of the symphony.
```

### The big picture

- First performed on 22 December 1808 in Vienna, in a four-hour concert that also introduced the Sixth Symphony and the Fourth Piano Concerto.
- A single rhythm (short, short, short, long) appears in all four movements.
- The symphony travels from C minor to C major: from struggle to blazing light.
- Beethoven holds back trombones, piccolo and contrabassoon until the finale. Their entry is one of the great arrivals in music.
- In one line: struggle (I), consolation with flashes of hope (II), a ghostly march (III), victory (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Allegro con brio | C minor | 2/4 | ≈ 7:20 |
| II | Andante con moto | A-flat major | 3/8 | ≈ 10:00 |
| III | Scherzo: Allegro | C minor | 3/4 | ≈ 5:10 |
| IV | Allegro | C major | 4/4 | ≈ 10:50 |

### I. Allegro con brio

**Summary.** The most famous opening in classical music, and a lesson in economy: nearly every bar of this [[sonata form]] movement is made from the first four notes.

**Main ideas**

- The motto: short, short, short, long. It is both the theme and the accompaniment.
- Theme 2: a soft, rising melody in the violins, announced by a horn call.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | The four-note motto, twice, each time ending on a held note | The motto. For a moment we cannot even tell the key |
| ≈ 0:20 | The motto stacked up through the strings, quietly, then louder | Theme 1 is assembled entirely from the motto |
| ≈ 0:45 | A loud horn call, then a gentle melody in violins and woodwinds | Theme 2. Listen below it: cellos and basses keep tapping the motto |
| ≈ 1:25 | The opening returns | The [[exposition]] is repeated |
| ≈ 2:50 | The motto in distant keys; then single chords passed between woodwinds and strings, quieter and quieter | The [[development]]. The horn call is reduced to two notes, then one |
| ≈ 4:15 | The motto crashes back in the full orchestra | The [[recapitulation]] |
| ≈ 4:35 | Everything stops for a lone, plaintive oboe | A tiny [[cadenza]]. Time stands still for a few seconds |
| ≈ 5:50 | A new, stamping march; the music will not stop | The [[coda]], almost as long as a second development. It ends firmly in the minor |

**Things to notice**

1. Follow the motto into the background. Even under the gentle second theme it never leaves.
2. The oboe solo is the only moment of stillness in the movement.

### II. Andante con moto

**Summary.** Two themes take turns and are decorated a little more each time: a set of [[variation]]s. One theme is gentle; the other keeps breaking into a fanfare that foreshadows the finale.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Violas and cellos sing a relaxed, graceful melody | Theme A |
| ≈ 1:00 | Clarinets and bassoons begin softly; then trumpets and drums burst out in a bright fanfare | Theme B, turning suddenly to C major. A glimpse of the victory to come |
| ≈ 2:00 | Theme A again, now in smoothly flowing notes | First variation |
| ≈ 4:00 | The same, in faster notes; then taken over by the basses | Second variation |
| ≈ 6:00 | Woodwinds alone, hesitant | An interlude |
| ≈ 7:00 | Theme A in the full orchestra | The grandest statement |
| Near the end | A bassoon picks up the tune at a quicker pace | The [[coda]] |

**Things to notice**

1. The fanfare of Theme B uses the same short-short-short-long rhythm as the motto, in disguise.

### III. Scherzo: Allegro

**Summary.** A [[scherzo]] that begins in whispers, is interrupted by the motto, and ends in one of the most famous transitions ever written.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Cellos and basses creep upward in near silence | A ghostly opening |
| ≈ 0:20 | Horns blast out a hammering rhythm | The motto again: short, short, short, long |
| ≈ 1:45 | Cellos and basses scurry gruffly; the other strings join in turn | The [[trio]], in C major, starting like a [[fugue]] |
| ≈ 3:10 | The opening returns as a shadow: plucked strings and a quiet bassoon | The scherzo comes back in [[pizzicato]], as if afraid to wake someone |
| ≈ 4:20 | A soft drum taps over a long held note; violins feel their way upward | The transition. Tension builds for almost a minute, then runs straight into the finale without a break |

### IV. Allegro

**Summary.** C major, full orchestra, and three instruments that have been silent until now. The finale is the answer to the first movement.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A blaze of brass on three rising notes | Theme 1. Trombones, piccolo and contrabassoon play for the first time |
| ≈ 0:35 | A striding tune in the horns | A second idea in the same triumphant mood |
| ≈ 1:00 | A quick, skipping figure in the violins | Theme 2 |
| Middle | The skipping figure is worked up to a great climax | The [[development]] |
| After the climax | Sudden quiet: the tapping rhythm of the scherzo returns | A memory of the third movement. The darkness is recalled, then swept away again |
| Shortly after | The blaze returns | The [[recapitulation]] |
| Last 2 minutes | The music speeds up; chord after chord of C major | The [[coda]]. Beethoven hammers the home chord as if to make sure |

**Things to notice**

1. The return of the scherzo inside the finale was unprecedented. Triumph means more because the shadow comes back first.

### Threads

- **One rhythm.** Short-short-short-long is in every movement.
- **Minor to major.** The whole symphony is a single journey from C minor to C major.
- **Held-back forces.** The finale sounds bigger because Beethoven saved instruments for it.

---

## 3. Beethoven – Symphony No. 9 in D minor, "Choral"

```yaml
id: beethoven-symphony-9
composer: Ludwig van Beethoven
title: Symphony No. 9 in D minor, "Choral"
catalogue: Op. 125
key: D minor
year: 1824
duration_min: 67
movement_count: 4
hook: The symphony that found it needed the human voice.
reference_recording:
  conductor: Herbert von Karajan
  orchestra: Berliner Philharmoniker
  label: Deutsche Grammophon
  year: 1963
  spotify_url: null
also_recommended:
  - conductor: Ferenc Fricsay
    orchestra: Berliner Philharmoniker
    label: Deutsche Grammophon
    year: 1958
    spotify_url: null
painting:
  artist: Philipp Otto Runge
  title: Morning (The Small Morning)
  year: 1808
  collection: Hamburger Kunsthalle, Hamburg
  pairing_note: A radiant vision of light and new beginning from Beethoven's own generation, matching the finale's hymn to joy.
```

### The big picture

- First performed on 7 May 1824 in Vienna. Beethoven, by then deaf, had to be turned around to see the applause.
- The first major symphony to include singers. The finale sets Friedrich Schiller's poem "Ode to Joy".
- The order of the middle movements is reversed: the fast [[scherzo]] comes second and the slow movement third.
- The finale begins by quoting, and rejecting, each of the earlier movements before the joy theme is found.
- In one line: creation out of chaos (I), wild energy (II), deep peace (III), a search that ends in song (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Allegro ma non troppo, un poco maestoso | D minor | 2/4 | ≈ 15:30 |
| II | Molto vivace – Presto | D minor | 3/4 | ≈ 11:00 |
| III | Adagio molto e cantabile | B-flat major | 4/4 | ≈ 16:30 |
| IV | Presto – Allegro assai (choral finale) | D minor to D major | various | ≈ 24:00 |

### I. Allegro ma non troppo, un poco maestoso

**Summary.** The music seems to form out of nothing: a hollow shimmer, falling fragments, then a theme of enormous force. A vast [[sonata form]] movement.

**Main ideas**

- The shimmer: a bare, empty-sounding hum in the strings, neither major nor minor.
- Theme 1: a jagged line crashing downward, played by the whole orchestra together.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A quiet, hollow shimmer; small fragments drop through it | The opening. Like an orchestra tuning, or a world taking shape |
| ≈ 0:35 | The fragments gather and crash down in [[unison]] | Theme 1, fortissimo |
| ≈ 2:45 | Warm, gentle phrases in the woodwinds | The second group of themes, in a major key. A first hint of the shape of the joy tune |
| ≈ 4:50 | The hollow shimmer returns | The [[development]] begins. It sounds like a repeat, but soon goes elsewhere |
| ≈ 8:30 | The shimmer comes back as a roar: full orchestra over thundering drums | The [[recapitulation]]. What was a whisper is now a catastrophe, and in the major key, which makes it more frightening, not less |
| ≈ 13:00 | Low strings grind out a creeping figure, over and over | The [[coda]], like a funeral procession |
| Last bars | Theme 1 one final time, in unison | An ending with no comfort |

**Things to notice**

1. Compare the first seconds with the stop at ≈ 8:30. It is the same music at opposite extremes.

### II. Molto vivace – Presto

**Summary.** A [[scherzo]] driven by a single leaping rhythm, with the drums as soloist.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Three hammered leaps, the second one by the timpani alone | The call to attention. At the premiere the audience reportedly applauded here |
| ≈ 0:10 | A quiet, skittering tune that spreads from one string section to the next | A [[fugato]] built on the leaping rhythm |
| Middle of the scherzo | The drums keep interrupting, loudly, on their own | Beethoven uses the timpani as a comic and violent solo voice |
| ≈ 4:30 | A smooth, folk-like tune in oboes and clarinets over a bustling bassoon | The [[trio]], in D major. Trombones enter the symphony here |
| After the trio | The skittering music returns | The scherzo is repeated |
| Last seconds | The trio starts again and is cut off | A joke ending |

### III. Adagio molto e cantabile

**Summary.** The still centre of the symphony. Two melodies alternate, and the first becomes more richly decorated each time it returns.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A slow hymn in the strings; woodwinds echo the end of each phrase | Theme A |
| ≈ 2:45 | A flowing, slightly faster melody in the second violins and violas | Theme B, in a brighter key |
| ≈ 4:30 | The hymn returns with the violins weaving ornaments around it | First [[variation]] of Theme A |
| Middle | A horn plays a slow, exposed scale on its own | A famous solo for the fourth horn |
| ≈ 10:00 | The hymn in long, floating lines of running notes | The fullest variation |
| ≈ 12:30 and again shortly after | Trumpets and drums break in with a stern fanfare | Twice the dream is interrupted, as if by a wake-up call. Each time the calm returns |

### IV. Finale

**Summary.** A drama in several scenes: chaos, a search through the past, the discovery of a simple tune, and finally voices. The form is unlike anything before it.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A harsh, clashing blast from winds and drums | The "terror fanfare" |
| ≈ 0:10 | Cellos and basses alone, speaking like a singer without words | An instrumental [[recitative]] |
| ≈ 1:00–2:40 | Short quotations of movements I, II and III, each cut off by the basses | The past is tried and rejected |
| ≈ 3:00 | Cellos and basses, very quietly, play a simple tune | The joy theme, heard for the first time, unaccompanied |
| ≈ 3:45–6:00 | The tune repeats, each time with more instruments, up to the full orchestra | Three [[variation]]s |
| ≈ 6:20 | The terror fanfare again; then a solo baritone | "O friends, not these sounds!" The first words in any Beethoven symphony |
| ≈ 7:20 | Baritone, then chorus, sing the joy theme | The Ode to Joy begins |
| ≈ 9:40 | A huge held chord on the words "vor Gott" | The first great climax; then silence |
| ≈ 10:00 | Thumps from bass drum and bassoon; piccolo, triangle and cymbals; a tenor sings | A "Turkish" march: the joy theme as a jaunty military band |
| ≈ 11:40 | Orchestra alone, fast and tangled | An orchestral [[fugue]] |
| ≈ 13:00 | Full chorus and orchestra burst out with the joy theme | The most famous statement |
| ≈ 13:50 | Men's voices and trombones in a broad, solemn new theme | "Be embraced, you millions". A second, hymn-like idea |
| ≈ 16:00 | High, hushed, shimmering chords | "Above the stars he must dwell". The mystical heart of the finale |
| ≈ 17:30 | Sopranos sing the joy theme while altos sing the solemn theme at the same time | A double [[fugue]] combining both ideas |
| ≈ 20:30 | The four soloists alone, slow and ornate; the soprano climbs very high | A vocal [[cadenza]] |
| Last minute | Everything accelerates wildly | The Prestissimo close |

**Things to notice**

1. The joy theme moves almost entirely by step. Anyone can sing it, which is the point.
2. The finale repeats the symphony's opening idea: something simple growing, layer by layer, from near silence.

### Threads

- **From nothing to everything.** Both the first movement and the joy theme begin in a whisper and grow to the full orchestra.
- **Rejection and discovery.** The finale openly dismisses the earlier movements; words arrive when instruments are no longer enough.
- **D minor to D major.** As in the Fifth, the symphony is a journey from dark to light.

---

## 4. Schubert – Symphony No. 8 in B minor, "Unfinished"

```yaml
id: schubert-symphony-8
composer: Franz Schubert
title: Symphony No. 8 in B minor, "Unfinished"
catalogue: D. 759
key: B minor
year: 1822
duration_min: 27
movement_count: 2
hook: Two movements, and nothing missing.
reference_recording:
  conductor: Günter Wand
  orchestra: Berliner Philharmoniker
  label: RCA Red Seal
  year: 1995
  spotify_url: null
also_recommended:
  - conductor: Carlos Kleiber
    orchestra: Wiener Philharmoniker
    label: Deutsche Grammophon
    year: 1979
    spotify_url: null
painting:
  artist: Caspar David Friedrich
  title: The Abbey in the Oakwood
  year: 1809–1810
  collection: Alte Nationalgalerie, Berlin
  pairing_note: A ruin that is more moving for being incomplete, in the hushed, wintry mood of the symphony's opening.
```

### The big picture

- Schubert wrote two complete movements in 1822 and sketched a third, then stopped. Nobody knows why.
- The manuscript sat with a friend for decades. The first performance was on 17 December 1865, 37 years after Schubert's death.
- Both movements are in triple time and at a similar pace, yet they feel like night and day.
- Schubert was a songwriter above all. Here the orchestra sings, and the songs keep being interrupted.
- In one line: a song under threat (I), an uneasy peace (II).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Allegro moderato | B minor | 3/4 | ≈ 15:00 |
| II | Andante con moto | E major | 3/8 | ≈ 12:00 |

### I. Allegro moderato

**Summary.** A dark phrase in the basses, a restless shimmer, and two of the most beautiful melodies Schubert wrote. The movement is in [[sonata form]], and its drama comes from how brutally the melodies are cut off.

**Main ideas**

- The motto: a low, winding phrase for cellos and basses alone.
- Theme 1: a plaintive melody for oboe and clarinet over shimmering violins.
- Theme 2: a warm, swaying tune in the cellos. One of the best-known melodies in classical music.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Cellos and basses alone, very quiet, winding downward | The motto. Remember it; it returns later with a vengeance |
| ≈ 0:20 | Nervous, shimmering violins over plucked basses; oboe and clarinet sing together | Theme 1 |
| ≈ 1:15 | Horns and bassoons hold a single long note; the mood lifts | A hinge. One held note carries the music into a new key |
| ≈ 1:25 | Cellos sing a gentle, swaying melody; violins take it up | Theme 2, in G major |
| ≈ 2:00 | The melody stops in mid-phrase. One bar of silence. Then violent chords | The first interruption |
| ≈ 3:40 | The dark motto returns | The [[exposition]] is repeated |
| ≈ 7:20 | The motto again, sinking lower; then it rises through the whole orchestra to a huge climax with trombones | The [[development]] is built almost entirely on the motto. The quiet opening phrase becomes a cry |
| ≈ 10:30 | The shimmer and the oboe melody return | The [[recapitulation]] |
| ≈ 14:00 | The motto one last time, then stern closing chords | The [[coda]] |

**Things to notice**

1. The famous cello tune never appears in the development. Schubert leaves it untouched and works only with the dark motto.
2. Listen for the silence at ≈ 2:00. It is as important as any note.

### II. Andante con moto

**Summary.** Outwardly serene, with long solo lines for the woodwinds, but the calm is broken by loud, marching episodes.

**Main ideas**

- Theme 1: a quiet melody in the violins, introduced by horns and descending plucked basses.
- Theme 2: a long, lonely solo for clarinet, later oboe, over softly pulsing strings.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Horns and bassoons, plucked basses stepping down, then a calm violin melody | Theme 1 |
| ≈ 1:10 | A sudden loud, striding passage with trombones | The first disturbance. The basses march while the winds call out above |
| ≈ 2:45 | Violins alone hold a thin line of soft notes | A bridge of almost nothing |
| ≈ 3:00 | A long, searching clarinet solo over gently off-beat strings; the oboe answers in the major | Theme 2. The accompaniment uses [[syncopation]], which gives it its floating quality |
| ≈ 4:10 | The clarinet's melody is seized by the full orchestra, fortissimo | The second disturbance |
| ≈ 6:00 | The opening returns | The first half is repeated with the keys changed |
| Last 2 minutes | Violins alone drift into a distant key and back; the music settles | The [[coda]]. A peaceful ending that sounds, for many listeners, like a true conclusion |

**Things to notice**

1. Both movements follow the same pattern: a song, an interruption, the song again. That shared shape is part of why the two movements feel complete together.

### Threads

- **Song against force.** In both movements lyrical melodies are broken off by violent outbursts.
- **Quiet trombones.** Schubert often uses the trombones softly, as a dark colour, not just for power.
- **Unfinished, yet whole.** The second movement ends in a calm that feels final.

---

## 5. Berlioz – Symphonie fantastique

```yaml
id: berlioz-symphonie-fantastique
composer: Hector Berlioz
title: Symphonie fantastique
catalogue: Op. 14
key: C major
year: 1830
duration_min: 55
movement_count: 5
hook: An obsession told in five scenes, ending at a witches' sabbath.
reference_recording:
  conductor: Sir Colin Davis
  orchestra: Royal Concertgebouw Orchestra
  label: Philips
  year: 1974
  spotify_url: null
also_recommended:
  - conductor: John Eliot Gardiner
    orchestra: Orchestre Révolutionnaire et Romantique
    label: Philips
    year: 1993
    spotify_url: null
painting:
  artist: Francisco Goya
  title: Witches' Sabbath (The Great He-Goat)
  year: 1820–1823
  collection: Museo del Prado, Madrid
  pairing_note: Painted within a decade of the symphony, the same nightmare gathering that Berlioz stages in his finale.
```

### The big picture

- First performed on 5 December 1830 in Paris. Berlioz was 26. Beethoven had died only three years earlier.
- It is [[programme music]]: Berlioz handed the audience a written story. A young artist, hopelessly in love, takes opium and dreams.
- The beloved is represented by one melody, the [[idée fixe]], which returns in every movement in a new disguise.
- The inspiration was Berlioz's own obsession with the actress Harriet Smithson, whom he later married.
- The orchestra was enormous and new: two harps, bells, four timpani, an English horn, a shrill small clarinet.
- In one line: longing (I), a ball (II), the countryside (III), the scaffold (IV), the sabbath (V).

### Movements

| | Title | Tempo | Duration |
| --- | --- | --- | --- |
| I | Rêveries – Passions | Largo – Allegro agitato e appassionato assai | ≈ 15:00 |
| II | Un bal (A Ball) | Valse: Allegro non troppo | ≈ 6:15 |
| III | Scène aux champs (Scene in the Fields) | Adagio | ≈ 17:00 |
| IV | Marche au supplice (March to the Scaffold) | Allegretto non troppo | ≈ 6:50 |
| V | Songe d'une nuit du sabbat (Dream of a Witches' Sabbath) | Larghetto – Allegro | ≈ 10:00 |

### I. Rêveries – Passions

**Summary.** The artist drifts in vague longing, then sees the beloved. From that moment her melody will not leave him.

**Main ideas**

- The [[idée fixe]]: a long, yearning melody for flute and violins that rises in waves and falls back.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Soft woodwinds, then [[muted]] violins in a slow, sad melody with long pauses | The introduction: daydreams and melancholy |
| ≈ 5:10 | Flute and violins together in a long, restless melody over a nervous, heartbeat-like accompaniment | The idée fixe. The beloved appears |
| Middle | The melody is broken into pieces; strings slide up and down in waves; sudden silences | Jealousy and agitation |
| ≈ 11:30 | The idée fixe blazes out in the full orchestra | The peak of passion |
| Last minute | Slow, soft, organ-like chords | Berlioz marks this "religiously". The artist seeks consolation |

### II. Un bal

**Summary.** A glittering waltz at a ball. In the middle of the crowd, he sees her again.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Shimmering strings and rippling harps, growing brighter | The ballroom comes into focus |
| ≈ 0:35 | Violins sweep into an elegant waltz | The dance |
| ≈ 2:00 | Flute and oboe play the idée fixe, now in waltz time, while the dance murmurs on below | She appears among the dancers |
| ≈ 3:20 | The waltz returns, fuller and faster | The whirl resumes |
| Near the end | A solo clarinet recalls the idée fixe; then a headlong finish | One last glimpse before the dance sweeps her away |

### III. Scène aux champs

**Summary.** An evening in the country. Two shepherds call to each other; the artist finds calm, then doubt returns. The longest and stillest movement.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | An English horn calls; an oboe answers from far away (offstage) | Two shepherds piping across a valley |
| ≈ 2:00 | A broad, calm melody for flute and violins | The peace of the countryside |
| ≈ 7:00–9:00 | The idée fixe in the woodwinds against angry, muttering low strings, rising to an outburst | "What if she is deceiving me?" The storm is inside him |
| ≈ 11:00 | The calm melody returns, decorated | Peace, but shaken |
| Last 2 minutes | The English horn calls again. No answer. Only soft rolls from four timpani | Distant thunder, solitude, silence. One of the most original pages of orchestration of its time |

### IV. Marche au supplice

**Summary.** The dream turns to nightmare. He has killed his beloved, is condemned, and is marched to the guillotine.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Muffled drums and growling horns | The procession approaches |
| ≈ 0:25 | Cellos and basses stride down a long scale, grim and heavy | Theme 1: the march of the condemned. A bassoon soon adds a mocking counter-melody |
| ≈ 1:40 | Blazing brass and winds in a swaggering tune | Theme 2: the crowd's march, brilliant and brutal |
| Last 30 seconds | A solo clarinet begins the idée fixe, tenderly | "A last thought of love" |
| Immediately after | A crashing chord; plucked strings; drum rolls and brass | The blade falls, the head drops, the crowd roars |

**Things to notice**

1. The clarinet gets only the first few notes of the idée fixe before it is cut off. That is the story in four seconds.

### V. Songe d'une nuit du sabbat

**Summary.** He sees himself at a witches' sabbath, gathered for his own funeral. The beloved arrives, now a grotesque parody. The most radical music in the symphony.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Eerie high strings, low growls, cackling slides in the woodwinds | The gathering of witches and spirits |
| ≈ 1:30 | A squealing small clarinet plays a jerky, trilling jig | The idée fixe, turned vulgar. The beloved has become a witch; the orchestra roars its welcome |
| ≈ 3:00 | Deep bells toll | The funeral bells |
| ≈ 3:25 | Tubas and bassoons intone a slow, ancient chant; brass repeat it faster; woodwinds mock it | The [[Dies irae]], the medieval chant for the dead, parodied |
| ≈ 5:10 | A stamping dance tune starts in the low strings and spreads upward | The witches' round dance, written as a [[fugue]] |
| ≈ 8:00 | The dance in the strings and the Dies irae in the brass, at the same time | The two themes combined |
| ≈ 8:40 | A dry, clattering sound from the violins | [[Col legno]]: the players tap the strings with the wood of the bow, like rattling bones |
| Last minute | Brass and drums in a blazing finish | The orgy ends in a C major that sounds anything but innocent |

### Threads

- **One melody, five masks.** Follow the idée fixe: noble (I), dancing (II), anxious (III), cut off (IV), grotesque (V).
- **Sound as story.** Offstage oboe, four timpani as thunder, bells, col legno: each effect has a meaning in the tale.
- **A new kind of symphony.** A symphony that tells an explicit story was a turning point for the whole century.

---

## 6. Brahms – Symphony No. 4 in E minor

```yaml
id: brahms-symphony-4
composer: Johannes Brahms
title: Symphony No. 4 in E minor
catalogue: Op. 98
key: E minor
year: 1885
duration_min: 40
movement_count: 4
hook: An autumn symphony that ends in tragedy, built on a tune borrowed from Bach.
reference_recording:
  conductor: Carlos Kleiber
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  year: 1981
  spotify_url: null
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Gewandhausorchester Leipzig
    label: Decca
    year: 2013
    spotify_url: null
painting:
  artist: Arnold Böcklin
  title: Isle of the Dead (third version)
  year: 1883
  collection: Alte Nationalgalerie, Berlin
  pairing_note: Painted two years before the symphony, with the same grave stillness and the same refusal of a consoling ending.
```

### The big picture

- Brahms's last symphony, written in the summers of 1884 and 1885 in the Austrian Alps. He conducted the premiere on 25 October 1885 in Meiningen.
- The finale is a [[passacaglia]]: thirty short variations over an eight-bar theme adapted from a Bach cantata. It was an old Baroque form, used here for a Romantic tragedy.
- Unusually for a symphony of its time, it ends in the minor key, without consolation.
- The opening theme is built from a chain of falling thirds, an interval pattern that returns at the very end.
- In one line: resignation (I), a noble procession (II), rough high spirits (III), fate (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Allegro non troppo | E minor | 2/2 | ≈ 12:45 |
| II | Andante moderato | E major | 6/8 | ≈ 11:20 |
| III | Allegro giocoso | C major | 2/4 | ≈ 6:00 |
| IV | Allegro energico e passionato | E minor | 3/4 | ≈ 9:10 |

### I. Allegro non troppo

**Summary.** No introduction: the symphony begins in mid-sigh. A [[sonata form]] movement that starts in gentle melancholy and ends in catastrophe.

**Main ideas**

- Theme 1: violins in pairs of notes, falling then rising, like breathing out and in.
- Theme 2: a proud, rhythmic call in the woodwinds, followed by a broad, ardent melody for cellos and horns.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Violins sigh in two-note phrases; woodwinds echo each one a moment later | Theme 1. The notes trace a chain of falling thirds |
| ≈ 1:20 | A sharp, fanfare-like rhythm in the winds; then cellos and horns sing a wide, passionate melody | Theme 2 |
| ≈ 3:00 | Hushed, mysterious string ripples with soft fanfares in the woodwinds | A moment of suspended time before the close of the [[exposition]] |
| ≈ 4:00 | The opening sighs return exactly, then turn somewhere new | The [[development]] begins by pretending to be a repeat |
| ≈ 7:10 | The opening notes, stretched out very slowly in the woodwinds, with quiet string ripples between them | The [[recapitulation]] steals in. You may not notice you are home until the sighs resume at normal speed |
| ≈ 11:00 | The sighing theme, now fortissimo, with the basses chasing the violins | The [[coda]]. The gentle theme has become furious, in [[canon]] |
| Last bars | Pounding timpani | A tragic close |

**Things to notice**

1. The slow-motion return at ≈ 7:10 is one of Brahms's subtlest strokes. Rewind and hear it twice.

### II. Andante moderato

**Summary.** A slow movement with an antique flavour, opening with horns alone. Its second theme is among the warmest things Brahms wrote.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Horns alone, in a solemn, archaic-sounding call | The opening uses an old church scale, which gives it its distant, legendary colour |
| ≈ 0:30 | Clarinets take the tune over plucked strings | Theme 1, like a slow procession with [[pizzicato]] footsteps |
| ≈ 3:30 | Cellos sing a broad, glowing melody; violins decorate above | Theme 2 |
| ≈ 5:30 | The procession returns, more agitated, rising to a stern climax | The middle of the movement |
| ≈ 8:00 | The glowing melody again, now in the full, rich string section | The emotional summit. The strings are divided into many parts for extra warmth |
| Last minute | The horn call returns | The [[coda]] |

### III. Allegro giocoso

**Summary.** The loudest, most boisterous movement Brahms put in a symphony, complete with a triangle. A burst of rough humour before the tragedy.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | The full orchestra crashes in; a triangle jingles | Theme 1. Piccolo, contrabassoon and triangle join the orchestra for this movement |
| ≈ 0:50 | A gentler, graceful tune in the violins | Theme 2 |
| ≈ 3:10 | The pace drops; horns and woodwinds play softly, as from a distance | A brief quiet episode |
| ≈ 4:00 | The opening bursts back | The return, and a stamping close |

### IV. Allegro energico e passionato

**Summary.** Eight chords, then thirty [[variation]]s on them, without pause. The theme is always there, sometimes on top, sometimes buried in the bass.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Eight stern chords in winds and brass, climbing step by step | The theme. Trombones play for the first time in the symphony |
| ≈ 0:15–1:20 | Plucked strings and drums; then a stiff woodwind tune | The first variations. The eight notes move into the bass |
| ≈ 1:30 | The strings take over with a sweeping, passionate melody | The variations grow more lyrical and more urgent |
| ≈ 3:00 | The pulse slows. A solo flute, alone and halting | The flute variation. The loneliest moment in the symphony |
| ≈ 4:20 | Trombones and horns in soft, hymn-like chords | A [[chorale]] in E major. A brief vision of peace |
| ≈ 5:20 | The eight chords crash back as at the start | The second half begins. The dream is over |
| ≈ 6:00–8:00 | Variations of growing violence: stabbing accents, rushing scales | The drive to the end |
| Near the end | Woodwinds and strings answer each other in falling pairs of notes | The chain of falling thirds from the first movement returns |
| ≈ 8:20 | The tempo quickens | The [[coda]]. It ends in E minor, unreconciled |

**Things to notice**

1. Try to hear the eight rising notes in every variation. Once you can follow them, the movement becomes a single unbroken line.

### Threads

- **Falling thirds.** The interval pattern of the very first theme returns in the final variations.
- **Old forms, new feeling.** A church scale in the second movement and a Baroque passacaglia in the finale.
- **No consolation.** The symphony begins and ends in E minor.

---

## 7. Tchaikovsky – Symphony No. 6 in B minor, "Pathétique"

```yaml
id: tchaikovsky-symphony-6
composer: Pyotr Ilyich Tchaikovsky
title: Symphony No. 6 in B minor, "Pathétique"
catalogue: Op. 74
key: B minor
year: 1893
duration_min: 46
movement_count: 4
hook: A symphony that ends not in triumph but in silence.
reference_recording:
  conductor: Teodor Currentzis
  orchestra: musicAeterna
  label: Sony Classical
  year: 2017
  spotify_url: null
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: Deutsche Grammophon
    year: 1960
    spotify_url: null
painting:
  artist: Isaac Levitan
  title: Above the Eternal Peace
  year: 1894
  collection: State Tretyakov Gallery, Moscow
  pairing_note: Painted a year after the symphony, a vast Russian landscape of stillness and mortality.
```

### The big picture

- Written between February and August 1893 and dedicated to his nephew, Vladimir Davydov.
- First performed on 28 October 1893 in St Petersburg, conducted by Tchaikovsky. He died nine days later.
- The Russian title means "passionate" or "full of feeling", not "pathetic".
- Tchaikovsky reverses the usual order: the thrilling march comes third, and the slow movement comes last.
- He said the symphony had a secret story, and never revealed it.
- In one line: struggle and longing (I), a graceful dance with a limp (II), a false victory (III), acceptance and fading (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Adagio – Allegro non troppo | B minor | 4/4 | 19:44 |
| II | Allegro con grazia | D major | 5/4 | 7:44 |
| III | Allegro molto vivace | G major | 12/8 and 4/4 | 8:36 |
| IV | Finale: Adagio lamentoso | B minor | 3/4 | 10:21 |

### I. Adagio – Allegro non troppo

**Summary.** The heart of the symphony. A restless theme born in darkness meets the most famous, warmest melody Tchaikovsky ever wrote. The movement is in [[sonata form]]: the themes are introduced, thrown into conflict, and brought back.

**Main ideas**

- Theme 1, unrest: a short, climbing, questioning [[motif]]. First on a lone bassoon in slow motion, then fast and nervous in the violas.
- Theme 2, longing: a broad melody that drifts downward on [[muted]] strings. The first moment of light.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A single bassoon over dark, hollow double basses | The introduction. The seed of Theme 1, in slow motion |
| ≈ 2:00 | Violas play the same idea, fast and anxious; strings and woodwinds trade phrases | The main section begins with Theme 1. Tension climbs step by step |
| ≈ 4:30 | Everything calms; a wide, singing melody on muted strings | Theme 2. The signature tune of the symphony |
| ≈ 6:30 | Flute and bassoon in conversation over a pulsing string accompaniment | The middle of Theme 2, a little more animated |
| ≈ 8:00 | The famous melody returns in the full orchestra | Theme 2 at its fullest |
| ≈ 9:30–10:30 | A solo clarinet lets the melody fade to almost nothing | Tchaikovsky writes pppppp here, the quietest marking in the score |
| ≈ 10:30 | A sudden, violent crash; then fast, chasing string passages | The [[development]]. Theme 1 is torn apart |
| Mid-development | A slow, hymn-like phrase in trombones and trumpets | A quotation from the Russian Orthodox funeral service |
| ≈ 12:30–14:30 | Theme 1 returns inside the storm; trombones descend step by step over rolling timpani | The [[recapitulation]] and the climax fused together. The most tragic moment |
| ≈ 15:00 | The famous melody comes back, brighter | Theme 2, now in B major: the same tune, but like peace that has been earned |
| ≈ 18:00 | Strings pluck a slowly falling scale; above it, a calm brass [[chorale]] | The [[coda]], with the strings in [[pizzicato]]. The storm has passed; the ending is peaceful, but it points downward |

**Things to notice**

1. The bassoon idea in the introduction and the viola theme of the Allegro are the same notes; only the speed changes.
2. Theme 2 comes three times. Compare how the orchestration changes each time.
3. The falling plucked scale at the end is the first hint of the finale's "falling line".

### II. Allegro con grazia

**Summary.** It sounds like a waltz, but it is not one: there are five beats in a bar instead of three. The result is an elegant dance with a slight limp.

**How to hear the rhythm.** Count "one-two, one-two-three". Every bar is 2 + 3. After a few bars your ear settles into the lilt.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A flowing, smiling melody in the cellos over plucked strings | The main section, in D major. A breath after the first movement |
| ≈ 1:00–2:30 | The melody moves to woodwinds and violins and is repeated with decoration | The main section expands |
| ≈ 2:30 | The mood darkens: sighing, falling phrases in the violins. Underneath, drums and basses repeat one unchanging note on every beat | The middle section, in B minor. That insistent note is a [[pedal note]], and it sounds like a heartbeat |
| ≈ 5:00 | The first melody returns | The main section comes back |
| ≈ 6:30 | The heartbeat note returns; the melody breaks into fragments and fades | The [[coda]]. The shadow of the middle section falls across the dance |

**Things to notice**

1. The falling phrases of the middle section are relatives of the first movement's Theme 2 and of the finale. All of them drift downward.
2. The repeated single note will return in the double basses at the very end of the symphony.

### III. Allegro molto vivace

**Summary.** A whisper of movement grows, over eight minutes, into a march for the whole orchestra. It sounds like a finale, and audiences often applaud here. But it is a trap; the real ending is still to come.

**Main ideas**

- The [[scherzo]] layer: fast, light, never-resting triplets in strings and woodwinds.
- The march layer: a hard, leaping tune with a snapped rhythm. At first it appears only in scraps.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Light, quick triplets in the strings; a scrap of march in the oboe | The scherzo begins. The march is only a hint |
| ≈ 0:30–2:00 | The scrap travels from instrument to instrument; brass join in | The fragments accumulate |
| ≈ 2:00 | Clarinets play the march from start to finish, still lightly | The first complete statement of the march |
| ≈ 4:00 | The quick triplets start over; a long, patient [[crescendo]] | The second round. Tension is stored up |
| ≈ 5:30–6:00 | Scales swoop up and down between strings and winds; then the march with cymbals and bass drum | The march in the full orchestra. The goal of the movement |
| Last minute | Hammering chords and rushing descending scales | The [[coda]]. Victory, or something forced? You decide |

**In this recording.** Currentzis plays the march as menacing and harsh, not glorious, which makes the collapse of the finale more convincing.

**Things to notice**

1. Even at its brightest, the march is full of falling scales. The finale's descent is hidden inside the triumph.

### IV. Finale: Adagio lamentoso

**Summary.** Straight after the noise of the march comes this lament, the true conclusion of the symphony. Two falling melodies each try to rise; both collapse; the music dies away in the double basses.

**Main ideas**

- Theme 1, lament: a cry in the strings, stepping downward.
- Theme 2, consolation: another falling melody, but warm, over soft pulsing horns.

**A hidden trick.** No single instrument plays the opening melody. Its notes are shared out alternately between the first and second violins, and the tune exists only when the two are combined. When the melody returns later, Tchaikovsky gives it plainly to the first violins.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A falling cry in the strings; bassoons sink into the depths at the end of each phrase | Theme 1 |
| ≈ 2:30 | Soft, off-beat pulsing in the horns; above it a warm, falling melody in the strings | Theme 2. It begins quietly and grows with every repetition |
| ≈ 4:00–5:00 | The melody reaches a peak, then breaks apart in harsh descending scales; a silence | The first collapse of the consolation |
| ≈ 5:00 | The lament returns, faster and more desperate, and climbs to a great climax | The return of Theme 1 and the summit of the movement |
| ≈ 7:00–7:30 | Choked, stopped horn notes; then one soft stroke of a gong | The turning point. The tam-tam plays only this once in the entire symphony |
| Immediately after | Trombones and tuba in slow, hymn-like chords | A funeral [[chorale]] |
| ≈ 8:00 | Theme 2 returns, now in the minor, over a single note pulsing in the double basses | The consoling melody has become a lament. The pulse grows slower |
| Last minute | Only cellos and double basses, fading to nothing | The symphony ends where it began, in the dark lowest voices |

**Things to notice**

1. Theme 2 in its two forms: hopeful in the major, surrendered in the minor. The same notes, the opposite meaning.
2. The pulse in the double basses answers the heartbeat note of the second movement. Here it slows and stops.
3. The silence after the last note is part of the piece. Do not skip to the next track.

### Threads

- **The falling line.** Almost every important melody in the symphony moves downward.
- **The pulse.** A repeated single note in the second movement returns in the double basses at the end, slows, and stops.
- **Darkness to darkness.** The symphony begins and ends in the lowest instruments.
- **Extreme dynamics.** The score runs from pppppp to fff.
- **The reversed order.** Triumph arrives in the "wrong" place, so the finale feels like a truth revealed.

---

## 8. Dvořák – Symphony No. 9 in E minor, "From the New World"

```yaml
id: dvorak-symphony-9
composer: Antonín Dvořák
title: Symphony No. 9 in E minor, "From the New World"
catalogue: Op. 95
key: E minor
year: 1893
duration_min: 42
movement_count: 4
hook: A Czech composer's postcard from America, written with homesickness in the ink.
reference_recording:
  conductor: Rafael Kubelík
  orchestra: Berliner Philharmoniker
  label: Deutsche Grammophon
  year: 1973
  spotify_url: null
also_recommended:
  - conductor: István Kertész
    orchestra: London Symphony Orchestra
    label: Decca
    year: 1966
    spotify_url: null
painting:
  artist: Albert Bierstadt
  title: Among the Sierra Nevada, California
  year: 1868
  collection: Smithsonian American Art Museum, Washington, D.C.
  pairing_note: The vast, luminous American landscape as a European-trained artist imagined it, which is exactly what Dvořák did in sound.
```

### The big picture

- Written in New York in the first half of 1893, while Dvořák directed the National Conservatory of Music. First performed at Carnegie Hall on 16 December 1893.
- Dvořák was fascinated by African American spirituals and by Longfellow's poem "The Song of Hiawatha", which he said inspired the two middle movements.
- The famous slow-movement tune is Dvořák's own. The words "Goin' Home" were added by a pupil almost thirty years later.
- Themes from earlier movements keep returning in later ones, and all of them meet in the finale.
- In one line: arrival and energy (I), longing for home (II), a dance in the forest (III), everything gathered together (IV).

### Movements

| | Tempo | Key | Metre | Duration |
| --- | --- | --- | --- | --- |
| I | Adagio – Allegro molto | E minor | 2/4 | ≈ 9:30 |
| II | Largo | D-flat major | 4/4 | ≈ 13:00 |
| III | Scherzo: Molto vivace | E minor | 3/4 | ≈ 8:00 |
| IV | Allegro con fuoco | E minor | 4/4 | ≈ 11:45 |

### I. Adagio – Allegro molto

**Summary.** A brooding slow introduction, then a [[sonata form]] movement with three themes, each as memorable as a folk song.

**Main ideas**

- Theme 1: a horn call that leaps up and falls back. It will return in every movement.
- Theme 2: a rustic, slightly sad dance for flute and oboe.
- Theme 3: a gentle tune for solo flute, low and warm, which many hear as an echo of the spiritual "Swing Low, Sweet Chariot".

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Quiet low strings; then sudden shocks from horns, strings and drums | The slow introduction |
| ≈ 2:00 | Horns leap up and fall back; woodwinds answer with a bouncing rhythm | Theme 1 |
| ≈ 3:10 | Flute and oboe in a folk-like tune over a droning bass | Theme 2 |
| ≈ 4:10 | A solo flute, low and gentle | Theme 3 |
| ≈ 4:50 | The flute tune and the horn call, broken up and passed around | The [[development]] |
| ≈ 6:30 | The horn call returns | The [[recapitulation]] |
| Last minute | Trumpets and trombones blaze out the horn call | The [[coda]] |

### II. Largo

**Summary.** One of the best-loved melodies in all music, sung by an instrument that rarely gets the spotlight: the English horn.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Slow, solemn chords in the brass, moving through strange harmonies | A gateway of seven chords |
| ≈ 0:45 | English horn over [[muted]] strings | The main theme |
| ≈ 4:40 | A slightly faster, plaintive tune in flute and oboe; plucked basses walk beneath | The middle section, in the minor. Dvořák linked it to a funeral in the forest from "Hiawatha" |
| ≈ 8:00 | Oboe and flute chirp brightly; the music swells; trombones thunder out the horn call from the first movement | A sudden vision of daylight, and the first movement breaks in |
| ≈ 9:15 | The English horn melody returns | The main theme again |
| ≈ 10:30 | A handful of solo strings take the tune. It stops. Silence. It tries again | The melody falters twice, as if overcome |
| Last minute | The solemn brass chords; then a soft chord for double basses alone | The gateway closes |

**Things to notice**

1. The pauses near the end are written into the score. The silence is the homesickness.

### III. Scherzo: Molto vivace

**Summary.** A fast, rhythmic [[scherzo]] with a triangle, which Dvořák said was suggested by a dance at the wedding feast in "Hiawatha". The middle is pure Bohemia.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Sharp chords and a drum figure; then a darting tune in the woodwinds | The scherzo. The opening tips its hat to the scherzo of Beethoven's Ninth |
| ≈ 1:30 | The pace relaxes into a lilting woodwind melody | A gentler second idea, in the major |
| ≈ 2:50 | Cellos quietly recall the horn call from the first movement | A bridge |
| ≈ 3:10 | A swaying, waltz-like tune in the woodwinds with trilling strings | The [[trio]]. This is a Czech village dance, not an American one |
| ≈ 4:40 | The darting tune returns | The scherzo is repeated |
| Last 30 seconds | The horn call from the first movement, fading away, then one loud chord | The [[coda]] |

### IV. Allegro con fuoco

**Summary.** A blazing march theme, and then a grand reunion: melodies from all three earlier movements return and are woven together.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Strings push upward, two notes at a time, faster and faster | A short run-up |
| ≈ 0:20 | Trumpets and horns blaze out a bold march | Theme 1 |
| ≈ 1:50 | A single soft cymbal clash | The only note the cymbals play in the whole symphony |
| ≈ 2:00 | A clarinet sings a long, tender melody over shimmering strings | Theme 2 |
| ≈ 4:00 | The Largo tune in the woodwinds, the scherzo's darting tune, the horn call from the first movement | The [[development]]. The earlier movements come back one after another |
| ≈ 6:30 | The march returns, at first surprisingly quietly | The [[recapitulation]] |
| ≈ 9:30 | The solemn chords that opened the Largo, now fortissimo in the brass | The [[coda]] begins |
| Last minute | The march and the first movement's horn call at the same time | The themes are combined |
| Last chord | The winds hold the final chord and let it fade to nothing | Instead of a bang, the symphony ends by dying away |

**Things to notice**

1. Count the returning themes in the finale. By the end, all four movements are present.

### Threads

- **The horn call.** Theme 1 of the first movement appears in every movement.
- **Two homes.** American inspiration (spirituals, "Hiawatha") in a thoroughly Czech musical accent.
- **A gathered ending.** The finale brings every movement's main theme back.

---

## 9. Mahler – Symphony No. 5

```yaml
id: mahler-symphony-5
composer: Gustav Mahler
title: Symphony No. 5
catalogue: null
key: C-sharp minor (ends in D major)
year: 1902
duration_min: 75
movement_count: 5
hook: From a funeral march to a love song to laughter.
reference_recording:
  conductor: Leonard Bernstein
  orchestra: Wiener Philharmoniker
  label: Deutsche Grammophon
  year: 1988
  spotify_url: null
also_recommended:
  - conductor: Riccardo Chailly
    orchestra: Royal Concertgebouw Orchestra
    label: Decca
    year: 1998
    spotify_url: null
painting:
  artist: Gustav Klimt
  title: Death and Life
  year: 1910–1915
  collection: Leopold Museum, Vienna
  pairing_note: Mahler's Vienna in paint, and the symphony's own journey in one image, from the figure of death to an embrace.
```

### The big picture

- Written in the summers of 1901 and 1902. Between them, Mahler nearly died of a haemorrhage, met Alma Schindler, and married her. He conducted the premiere on 18 October 1904 in Cologne.
- Five movements grouped in three parts: Part I (movements 1 and 2), Part II (movement 3), Part III (movements 4 and 5).
- The fourth movement, the Adagietto for strings and harp, is widely thought to be a love letter to Alma. It became world famous through the film "Death in Venice".
- The symphony has no single home key. It begins in C-sharp minor and ends in D major.
- In one line: mourning (I), rage (II), life returning (III), love (IV), joy (V).

### Movements

| | Title or tempo | Key | Duration |
| --- | --- | --- | --- |
| I | Trauermarsch (Funeral March) | C-sharp minor | ≈ 14:30 |
| II | Stürmisch bewegt (Stormy, with greatest vehemence) | A minor | ≈ 15:00 |
| III | Scherzo | D major | ≈ 19:00 |
| IV | Adagietto | F major | ≈ 11:15 |
| V | Rondo-Finale | D major | ≈ 15:00 |

### I. Trauermarsch

**Summary.** A funeral procession, opened by a solo trumpet. Twice the measured march is torn apart by outbursts of grief.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | A solo trumpet: three short notes and a long one, climbing | The fanfare. Its rhythm recalls the motto of Beethoven's Fifth |
| ≈ 0:30 | The full orchestra crashes in | The procession begins |
| ≈ 1:20 | A weary, song-like melody in the violins and cellos | The march theme itself |
| ≈ 5:30 | A sudden eruption: the trumpet shrieks over churning strings | The first outburst. Mahler marks it "Suddenly faster. Passionate. Wild" |
| ≈ 7:30 | The trumpet fanfare, then the march in the woodwinds | The procession resumes |
| ≈ 10:30 | A quieter, grieving melody in the strings that swells to a climax and collapses | The second episode |
| Last minute | The fanfare fades, first on trumpet, then on flute; one soft thud from the low strings | The procession disappears into the distance. The final note is [[pizzicato]] |

### II. Stürmisch bewegt

**Summary.** The grief of the first movement turns to fury. Storms alternate with slow laments, and near the end a vision of triumph appears and vanishes.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Snarling basses, shrieking woodwinds | The storm |
| ≈ 1:30 | The tempo drops; cellos sing a slow lament | A melody from the first movement's funeral march returns |
| ≈ 4:30 | Cellos alone, very quietly, over a soft drum roll | A long, bare [[recitative]]. The loneliest passage in the symphony |
| Middle | Storm and lament keep interrupting each other | The two moods fight for control |
| ≈ 11:30 | Brass ring out in a bright, glorious hymn | A [[chorale]] in D major. For a moment, victory seems to have arrived |
| ≈ 12:30 | The hymn crumbles; the storm returns, then scatters into fragments | The vision fails. It will come back in the finale |
| Last seconds | Quiet scraps and a soft drum tap | The movement evaporates |

### III. Scherzo

**Summary.** The longest movement and the hinge of the symphony. After death and rage, life comes back as a huge, swirling dance, with a solo horn in the leading role.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Four horns call out; a solo horn leads a bouncing country dance | The [[scherzo]] theme, a robust [[Ländler]]. The horn has an [[obbligato]] part all the way through |
| ≈ 2:30 | A softer, more elegant waltz in the strings | The first trio. City manners after country ones |
| ≈ 6:00 | The music stops; the solo horn calls and others answer across silences | Horn calls echoing as if across mountains |
| ≈ 8:00 | Strings pluck a shy little waltz | A [[pizzicato]] episode, tentative and intimate |
| ≈ 11:00 | The dances return and pile on top of one another | Mahler combines his themes with great contrapuntal skill |
| Last minute | The pace turns frantic; a wooden clapper rattles | A wild close |

### IV. Adagietto

**Summary.** Strings and harp alone. A melody that seems to hold its breath, always delaying its arrival.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Slow harp notes; violins enter with a melody that hangs in the air | The main theme. Each phrase leans on a note that does not belong, then resolves |
| ≈ 4:00 | The harp falls silent; the music grows more restless and climbs higher | The middle section, moving through distant keys |
| ≈ 7:30 | The violins slide slowly downward from a great height | A long [[glissando]] back to the main theme |
| ≈ 8:00 | The opening melody returns with the harp | The return |
| Last minute | One last swell, and a long-held chord that takes its time to settle | The final resolution, delayed as long as possible |

**In this recording.** Bernstein takes the movement very slowly. Other conductors play it in under eight minutes, which makes it sound more like a song and less like an elegy.

### V. Rondo-Finale

**Summary.** The Adagietto's last chord has hardly faded when a single horn note opens a new world. A sunny, bustling [[rondo]] full of [[fugue]]s, in which the love song returns as a dance and the lost hymn finally arrives.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | One horn note; then bassoon, oboe and clarinet trade little phrases | A pastoral introduction. These scraps are the building blocks of the whole finale |
| ≈ 1:00 | Horns in a relaxed, genial melody | The main rondo theme |
| ≈ 1:50 | Cellos start a busy, running tune that the other strings take up in turn | The first [[fugue]] |
| ≈ 3:20 | A graceful melody in the strings, light on its feet | The Adagietto theme, transformed from a slow love song into a quick dance |
| Middle | The rondo theme, the fugue and the dance tune keep coming round, each time more elaborate | The movement builds in waves |
| ≈ 13:00 | The brass ring out the glorious hymn | The [[chorale]] that collapsed in the second movement returns, and this time it holds |
| Last minute | A breathless, accelerating dash | Laughter at the end of a symphony that began with a funeral |

### Threads

- **The long journey.** Funeral march to joyful finale, C-sharp minor to D major.
- **Themes that travel.** The second movement quotes the first; the finale transforms the Adagietto; the chorale glimpsed in the second movement is achieved in the fifth.
- **The trumpet's rhythm.** Three short notes and a long one, a deliberate echo of Beethoven's Fifth.

---

## 10. Shostakovich – Symphony No. 5 in D minor

```yaml
id: shostakovich-symphony-5
composer: Dmitri Shostakovich
title: Symphony No. 5 in D minor
catalogue: Op. 47
key: D minor
year: 1937
duration_min: 45
movement_count: 4
hook: A triumphant ending, or the sound of being forced to cheer? You decide.
reference_recording:
  conductor: Leonard Bernstein
  orchestra: New York Philharmonic
  label: Sony Classical (originally Columbia)
  year: 1959
  spotify_url: null
also_recommended:
  - conductor: Evgeny Mravinsky
    orchestra: Leningrad Philharmonic Orchestra
    label: several recordings exist; choose one available on Spotify
    year: null
    spotify_url: null
painting:
  artist: Kazimir Malevich
  title: "Complex Presentiment: Torso in a Yellow Shirt"
  year: c. 1932
  collection: State Russian Museum, St Petersburg
  pairing_note: A faceless figure in an empty landscape, painted in the same country and decade, by an artist who was also under official pressure.
  rights_flag: Malevich died in 1935. Check public-domain status per territory, especially the United States, before using this image. Safe fallback - Ilya Repin, "Barge Haulers on the Volga", 1870–1873, State Russian Museum.
```

### The big picture

- In January 1936 the newspaper Pravda attacked Shostakovich's music in an article headed "Muddle Instead of Music". In Stalin's Soviet Union, that put his career and his life in danger.
- He wrote the Fifth Symphony between April and July 1937, at the height of the Great Terror.
- The premiere, on 21 November 1937 in Leningrad under Evgeny Mravinsky, was a sensation. People wept during the slow movement, and the ovation reportedly lasted half an hour.
- The symphony restored Shostakovich to official favour. Listeners have argued ever since about what its triumphant ending really means.
- In one line: questioning (I), sarcasm (II), mourning (III), triumph in quotation marks (IV).

### Movements

| | Tempo | Key | Duration |
| --- | --- | --- | --- |
| I | Moderato | D minor | ≈ 16:10 |
| II | Allegretto | A minor | ≈ 4:55 |
| III | Largo | F-sharp minor | ≈ 13:00 |
| IV | Allegro non troppo | D minor to D major | ≈ 9:00 |

### I. Moderato

**Summary.** A slow-burning [[sonata form]] movement. Two quiet, cold themes are gradually seized by the brass and drums and turned into a brutal march.

**Main ideas**

- The opening gesture: jagged leaps, low strings answered by high strings.
- Theme 1: a quiet, winding melody in the violins that keeps sinking.
- Theme 2: very long, widely spaced notes in the violins, floating over a soft repeating rhythm (long, short-short).

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Low strings leap upward; high strings answer a moment later with the same shape | The opening gesture, in [[canon]] |
| ≈ 0:50 | A quiet, drooping melody in the violins | Theme 1 |
| ≈ 5:30 | The music becomes very still: long, high violin notes over a gently pulsing accompaniment | Theme 2. Calm, but icy |
| ≈ 8:00 | A piano enters, low and percussive; horns growl out Theme 1 | The [[development]]. The tempo starts to accelerate |
| ≈ 10:00 | Trumpets and a snare drum: Theme 1 as a strutting march | The lyrical melody has become grotesque |
| ≈ 11:50 | The whole orchestra, in [[unison]], hurls out the opening gesture; a gong crashes | The climax, which is also the start of the [[recapitulation]] |
| ≈ 13:00 | A flute and a horn sing Theme 2 to each other, one a step behind the other | Theme 2 in D major, in gentle [[canon]]. The most tender moment in the movement |
| Last 90 seconds | A solo violin, then rising, glassy notes from the celesta | The [[coda]]. The movement ends with a question, not an answer |

**Things to notice**

1. The march at ≈ 10:00 uses exactly the same notes as the quiet Theme 1. The transformation is the message.

### II. Allegretto

**Summary.** A short, heavy-footed [[scherzo]] in waltz time. The humour has an edge.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Cellos and basses begin gruffly, alone | A clumsy, stamping start |
| ≈ 0:20 | A shrill small clarinet, then pompous horns | A parade of caricatures, in the manner of a [[Ländler]] |
| ≈ 1:45 | A solo violin plays a coy little tune with slides, over harp | The [[trio]]. A flute repeats it. The [[glissando]] slides make it sound mock-innocent |
| ≈ 2:50 | The opening returns, now tiptoeing: bassoon and plucked strings | The scherzo comes back in [[pizzicato]] |
| Last 20 seconds | The oboe recalls the coy tune, now in the minor; then a loud dismissal | A sour afterthought |

### III. Largo

**Summary.** The heart of the symphony, and the movement that made the first audience weep. The brass are silent throughout. The strings are divided into eight separate parts.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Violins alone, quiet and hymn-like; other strings join one group at a time | The first theme. The strings play [[divisi]], building a choir-like texture |
| ≈ 3:00 | A flute and harp, almost alone | A lonely second melody |
| ≈ 5:30 | A solo oboe over a single thread of trembling violins | The most desolate passage. Clarinet and flute follow, each alone |
| ≈ 9:00 | The cellos cry out at the top of their range; a xylophone hammers; double basses grind beneath | The climax. Grief breaks into the open |
| ≈ 11:00 | The music subsides to a whisper | The aftermath |
| Last minute | Harp and celesta pick out the lonely melody, note by note; a soft major chord | An ending of exhausted peace |

**Things to notice**

1. There is no brass in this movement. After the marches of the first movement, their silence is felt.

### IV. Allegro non troppo

**Summary.** Drums and brass burst in with a march. After a quiet, reflective middle, the march returns and builds to a blazing D major. Whether that ending is a victory is the question the symphony leaves open.

**Listening stops**

| Time | What you hear | What is happening |
| --- | --- | --- |
| ≈ 0:00 | Pounding timpani; trumpets and trombones blare out a march | Theme 1. It gets faster and faster |
| ≈ 2:40 | A solo trumpet sings a broad new melody over swirling strings | Theme 2. It rises to a climax, then collapses |
| ≈ 3:30 | Quiet. A solo horn plays the trumpet's melody, gently | The reflective middle section |
| ≈ 5:00 | Violins rock back and forth over harp notes | Shostakovich quotes one of his own songs here, a setting of a Pushkin poem called "Rebirth" |
| ≈ 6:30 | A snare drum taps softly; woodwinds bring back the march, slowly | The long build to the ending begins |
| Last 90 seconds | The brass proclaim the march theme in D major while the strings hammer one single note, over and over | The [[coda]]. The strings repeat the same note more than two hundred times |
| Last bars | Timpani and bass drum pound out the final notes | The end |

**In this recording.** Bernstein takes the ending fast, and it sounds like a real triumph. Many conductors, including Mravinsky, play it at about half that speed, and then it sounds heavy and forced. Compare the two; the difference is the whole debate in miniature.

**Things to notice**

1. Listen to the strings in the final minute, not the brass. That one hammered note can sound like rejoicing or like being beaten.

### Threads

- **Themes turned into marches.** Quiet melodies are repeatedly taken over by brass and drums.
- **The missing brass.** Their silence in the Largo is as expressive as their noise elsewhere.
- **The open question.** The symphony gives the authorities a triumphant finale and gives listeners room to doubt it.

---

## Glossary

Every `[[term]]` used above. One or two sentences each, written for the pop-over.

| Term | Definition |
| --- | --- |
| Arpeggio | The notes of a chord played one after another instead of together. |
| Cadenza | A short solo passage where the rest of the orchestra stops and one player or singer is free to linger. |
| Canon | One instrument plays a melody and another follows a moment later with the same melody, like a round. |
| Chorale | Slow, hymn-like music that moves in solemn chords. |
| Coda | A closing section added to the end of a movement. |
| Col legno | Tapping the strings with the wooden back of the bow, which makes a dry, clicking sound. |
| Crescendo | Getting gradually louder. |
| Development | The middle stage of sonata form, where the themes are broken up, combined and pushed through different keys. |
| Dies irae | A medieval chant from the Mass for the dead. Composers quote it as a symbol of death. |
| Divisi | A string section split into two or more groups, each playing a different line. |
| Exposition | The first stage of sonata form, where the main themes are introduced. It is often repeated. |
| Fugato | A passage that starts like a fugue, with instruments entering one by one on the same tune, without being a full fugue. |
| Fugue | A piece or section in which one tune enters in each voice in turn and is woven against itself. |
| Glissando | A continuous slide from one note to another. |
| Idée fixe | "Fixed idea": Berlioz's term for a melody that represents a person and returns throughout a piece. |
| Ländler | A rustic Austrian country dance in three beats, a slower, heavier ancestor of the waltz. |
| Major | The kind of key that generally sounds bright or settled. Its darker counterpart is the minor. |
| Minuet | An elegant 18th-century dance in three beats, used as the third movement of Classical symphonies. |
| Motif | The smallest musical idea, just a few notes, from which a theme is built. |
| Muted | Played with a small device on the instrument that softens and veils the sound. |
| Obbligato | A solo instrumental part that is essential and prominent throughout a movement. |
| Passacaglia | A form in which a short theme repeats over and over while the music around it keeps changing. |
| Pedal note | A single note held or repeated, usually in the bass, while the harmony changes above it. |
| Pizzicato | Plucking the strings of a string instrument with the finger instead of using the bow. |
| Programme music | Instrumental music that tells a story or depicts a scene described by the composer. |
| Recapitulation | The last stage of sonata form, where the opening themes return. |
| Recitative | Music that imitates the rhythm of speech, free and unmeasured. |
| Rondo | A form in which one main theme keeps returning between contrasting episodes. |
| Scherzo | A fast, energetic movement, usually third in a symphony. The word means "joke", though the mood is often far from funny. |
| Sonata form | A three-stage structure: themes are introduced (exposition), worked and set against each other (development), and brought back (recapitulation). |
| Syncopation | Accents placed off the main beats, which makes the rhythm feel as if it is floating or pulling against the pulse. |
| Trio | The contrasting middle section of a minuet or scherzo, usually gentler. |
| Unison | Everyone playing the same notes at the same time. |
| Variation | A repeat of a theme in which something is changed: the decoration, the rhythm, the harmony or the instruments. |
