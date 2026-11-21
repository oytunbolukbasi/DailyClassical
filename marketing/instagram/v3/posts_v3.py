# v3 Instagram carousels: dark, cinematic, full-bleed paintings. 5 posts x 3 slides.
# Every fact comes from the verified content files (content/en/...); do not add others.
# Images are looked up in the build's image dir: p-<piece id>.jpg, c-<composer id>.jpg, s-<screenshot>.png.
#
# Slide kinds:
#   hero    full-bleed image, dark gradient, label + huge headline + sub
#   phone   blurred painting, headline + big phone (runs off the bottom, or the top with anchor="bottom")
#   stops   blurred painting, timed rows (time, text)
#   facts   blurred image, numbered rows
#   stages  blurred painting, big term + definition
#   story   painting band on top, pairing text below
#   mosaic  grid of paintings under a gradient, headline

LEVITAN = "Isaac Levitan, <i>Above Eternal Peace</i>, 1894. State Tretyakov Gallery"
BOCKLIN = "Arnold Böcklin, <i>Isle of the Dead</i> (third version), 1883. Alte Nationalgalerie, Berlin"
KUINDZHI = "Arkhyp Kuindzhi, <i>Red Sunset</i>, 1905–8. The Metropolitan Museum of Art, New York"
VERNET = "Claude-Joseph Vernet, <i>A Shipwreck in Stormy Seas</i>, 1773. National Gallery, London"

MOSAIC = ["vivaldi-four-seasons-spring", "debussy-la-mer", "beethoven-symphony-6", "mozart-symphony-41",
          "rimsky-korsakov-scheherazade", "schubert-piano-quintet-trout", "smetana-vltava", "dvorak-cello-concerto",
          "bach-cello-suite-1", "mahler-symphony-1", "sibelius-symphony-5", "ravel-bolero"]

POSTS = [
    dict(id="tchaikovsky-wait", slides=[
        dict(kind="hero", img="p-tchaikovsky-symphony-6.jpg", pos="38% 50%",
             label="Tchaikovsky · Symphony No. 6", title="Wait for 4:30.", size=124,
             sub="Everything calms. A wide, singing melody on muted strings: the signature tune of the symphony."),
        dict(kind="phone", bg="p-tchaikovsky-symphony-6.jpg", shot="s-02-piece.png",
             title="Every moment, timed to the recording.", sub="Follow the guide while the music plays."),
        dict(kind="stops", bg="p-tchaikovsky-symphony-6.jpg", label="Tchaikovsky · Symphony No. 6",
             title="Then keep listening",
             rows=[("≈ 8:00", "The famous melody returns in the full orchestra."),
                   ("≈ 9:30", "A solo clarinet lets it fade to almost nothing."),
                   ("≈ 10:30", "A sudden, violent crash.")],
             pill="Today’s piece is free · DailyClassical on the App Store",
             credit=f"Times from Currentzis · musicAeterna.<br>Painting: {LEVITAN}."),
    ], caption="""Tchaikovsky · Symphony No. 6 in B minor, “Pathétique” (1893)

Wait for 4:30. Everything calms, and a wide, singing melody arrives on muted strings: the signature tune of the symphony. DailyClassical times every moment of the guide to the recording, so you know exactly what to listen for.

Painting: Isaac Levitan, Above Eternal Peace (1894), State Tretyakov Gallery.

#tchaikovsky #classicalmusic #symphony"""),

    dict(id="sonata-form", slides=[
        dict(kind="hero", img="p-brahms-symphony-4.jpg", pos="50% 50%",
             label="Glossary", title="Sonata form, in three words.", size=112,
             sub="The plan behind countless first movements."),
        dict(kind="stages", bg="p-brahms-symphony-4.jpg", label="Sonata form",
             rows=[("I", "Exposition", "The first stage of sonata form, where the main themes are introduced. It is often repeated."),
                   ("II", "Development", "The middle stage, where the themes are broken up, combined and pushed through different keys."),
                   ("III", "Recapitulation", "The last stage, where the opening themes return.")]),
        dict(kind="phone", bg="p-brahms-symphony-4.jpg", shot="s-03-glossary.png", anchor="bottom",
             title="Tap any term.", sub="Every musical term in the guides comes with a short, plain explanation.",
             credit=f"Painting: {BOCKLIN}."),
    ], caption="""Sonata form, in three words: exposition, development, recapitulation.

It is the plan behind countless first movements. The themes are introduced, broken up and pushed through different keys, then they return. In DailyClassical, every musical term in the guides comes with a short, plain explanation.

Painting: Arnold Böcklin, Isle of the Dead (third version, 1883), Alte Nationalgalerie, Berlin.

#classicalmusic #musictheory #sonataform"""),

    dict(id="tchaikovsky-clerk", slides=[
        dict(kind="hero", img="c-tchaikovsky.jpg", pos="50% 18%",
             label="Pyotr Ilyich Tchaikovsky · 1840–1893", title="Before the symphonies, the Ministry of Justice.", size=92,
             sub="His family steered him towards a safe career: he trained in law and worked as a clerk in St Petersburg.",
             credit="Portrait: Nikolai Kuznetsov, 1893."),
        dict(kind="phone", bg="c-tchaikovsky.jpg", shot="s-05-composer.png",
             title="Every composer, in three paragraphs."),
        dict(kind="facts", bg="c-tchaikovsky.jpg", label="Tchaikovsky", title="Three more things",
             rows=["A wealthy widow, Nadezhda von Meck, paid him an allowance for thirteen years, on condition that they never meet.",
                   "In 1891 he took part in the opening of Carnegie Hall in New York.",
                   "He died in St Petersburg in 1893, nine days after conducting the premiere of his Sixth Symphony."],
             credit="Portrait: Nikolai Kuznetsov, 1893."),
    ], caption="""Before the symphonies, the Ministry of Justice.

Tchaikovsky’s family steered him towards a safe career: he trained in law and worked as a clerk in St Petersburg. Every composer in DailyClassical comes with a short life in three paragraphs.

Portrait: Nikolai Kuznetsov (1893).

#tchaikovsky #classicalmusic #composer"""),

    dict(id="wallpaper", slides=[
        dict(kind="hero", img="p-rachmaninoff-piano-concerto-2.jpg", pos="50% 50%",
             label="Wallpaper", title="Today’s painting, on your Lock Screen.", size=96,
             sub="Every piece comes with a public-domain painting. Save it as your wallpaper."),
        dict(kind="phone", bg="p-rachmaninoff-piano-concerto-2.jpg", shot="s-06-wallpaper.png",
             title="Drag to choose what fills your screen."),
        dict(kind="story", img="p-rachmaninoff-piano-concerto-2.jpg", label="Why this painting",
             title="Rachmaninoff · Piano Concerto No. 2 (1901)",
             body="Arkhyp Kuindzhi, <i>Red Sunset</i> (1905–8). A red evening light breaking over a dark river, painted a few years after the concerto: the same turn from gloom to glow that the music makes.",
             credit="The Metropolitan Museum of Art, New York."),
    ], caption="""Today’s painting, on your Lock Screen.

Every piece in DailyClassical comes with a public-domain painting, and you can save it as your wallpaper. Rachmaninoff’s Second Piano Concerto is paired with a red evening light breaking over a dark river: the same turn from gloom to glow that the music makes.

Painting: Arkhyp Kuindzhi, Red Sunset (1905–8), The Metropolitan Museum of Art, New York.

#rachmaninoff #classicalmusic #wallpaper"""),

    dict(id="one-a-day", slides=[
        dict(kind="mosaic", tiles=MOSAIC, title="114 works. One a day.", size=116,
             sub="Symphonies, concertos, sonatas, quartets and choral works, each with a listening guide and a painting."),
        dict(kind="phone", bg="p-mozart-symphony-40.jpg", shot="s-01-today.png",
             title="Every morning, a new piece.", credit=f"Painting: {VERNET}."),
        dict(kind="phone", bg="p-debussy-la-mer.jpg", shot="s-04-library.png",
             title="36 composers, one library.", sub="Today’s piece is free."),
    ], caption="""114 works. One a day.

Symphonies, concertos, sonatas, quartets and choral works, each with a listening guide and a painting. Every morning, DailyClassical opens on a new piece, and today’s piece is free.

Painting on the Today screen: Claude-Joseph Vernet, A Shipwreck in Stormy Seas (1773), National Gallery, London.

#classicalmusic #dailyclassical #paintings"""),
]
