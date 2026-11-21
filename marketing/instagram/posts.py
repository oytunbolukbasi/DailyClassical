# The first 20 Instagram posts, in publishing order (oldest first).
# Every fact comes from content/en/pieces/<id>.md (verified in content/research/).
# kind "piece": 3-slide carousel (painting cover, composer, listen for).
# kind "focus": 2-slide carousel (dark, painting detail + one moment, composer).

COMPOSERS = {
    "mozart": dict(name="Wolfgang Amadeus Mozart", dates="1756–1791", nat="Austrian", credit="Barbara Krafft, 1819", pos="50% 22%"),
    "beethoven": dict(name="Ludwig van Beethoven", dates="1770–1827", nat="German", credit="Joseph Karl Stieler, 1820", pos="50% 18%"),
    "schubert": dict(name="Franz Schubert", dates="1797–1828", nat="Austrian", credit="Wilhelm August Rieder, 1875", pos="50% 15%"),
    "berlioz": dict(name="Hector Berlioz", dates="1803–1869", nat="French", credit="Gustave Courbet, 1850", pos="50% 30%"),
    "brahms": dict(name="Johannes Brahms", dates="1833–1897", nat="German", credit="Photograph by C. Brasch, 1889", pos="50% 20%"),
    "tchaikovsky": dict(name="Pyotr Ilyich Tchaikovsky", dates="1840–1893", nat="Russian", credit="Nikolai Kuznetsov, 1893", pos="50% 18%"),
    "dvorak": dict(name="Antonín Dvořák", dates="1841–1904", nat="Czech", credit="Photograph, 1882", pos="50% 20%"),
    "mahler": dict(name="Gustav Mahler", dates="1860–1911", nat="Austrian", credit="Akseli Gallen-Kallela, 1907", pos="50% 45%"),
    "rachmaninoff": dict(name="Sergei Rachmaninoff", dates="1873–1943", nat="Russian", credit="Bain News Service, c. 1920", pos="50% 15%"),
    "shostakovich": dict(name="Dmitri Shostakovich", dates="1906–1975", nat="Russian", credit="Photo: Leonid Dorensky / Moscow Main Archive (mos.ru), CC BY 4.0", pos="50% 30%"),
}

POSTS = [
    dict(kind="piece", id="mozart-symphony-40", composer="mozart",
         label="Mozart · 1788", title="Symphony No. 40 in G minor",
         hook="Classical elegance with a racing pulse underneath.",
         about="Written in about six weeks in the summer of 1788, alongside Nos. 39 and 41. They were his last three symphonies.",
         painting="Claude-Joseph Vernet, <i>A Shipwreck in Stormy Seas</i>, 1773. National Gallery, London",
         recording="Mackerras · Scottish Chamber Orchestra",
         listen=[("I", "0:00", "The violas start before the melody: an accompaniment with no tune yet. Highly unusual in 1788."),
                 ("III", "0:00", "A minuet in three-bar phrases instead of four. It never quite finds its balance."),
                 ("IV", "3:50", "For a few seconds Mozart touches almost every note of the scale, and the music loses its footing.")],
         caption="""Mozart · Symphony No. 40 in G minor, K. 550 (1788)

One of only two symphonies he wrote in a minor key; both are in G minor. No trumpets, no drums. All the drama comes from strings and woodwinds.

Painting: Claude-Joseph Vernet, A Shipwreck in Stormy Seas (1773), National Gallery, London.

#mozart #classicalmusic #symphony"""),

    dict(kind="piece", id="beethoven-piano-sonata-8", composer="beethoven",
         label="Beethoven · 1798", title="Piano Sonata No. 8 in C minor, “Pathétique”",
         hook="Heavy chords, a fast storm, and one of Beethoven’s best-loved slow tunes.",
         about="Written in his late twenties, when Vienna knew him above all as a fierce pianist.",
         painting="Jacques-Louis David, <i>The Death of Socrates</i>, 1787. The Metropolitan Museum of Art, New York",
         recording="Barenboim (DG, 1983)",
         listen=[("I", "0:00", "A loud, dark chord that fades at once. This slow introduction will break back into the fast music twice."),
                 ("II", "0:00", "One player, three layers: a singing melody, a soft murmur beneath it, a low bass."),
                 ("III", "4:30", "A false calm in A-flat major, as if it might end in peace. It doesn’t.")],
         caption="""Beethoven · Piano Sonata No. 8 in C minor, Op. 13, “Pathétique” (1798)

Not a later nickname: the first edition reads Grande Sonate pathétique, most likely Beethoven’s own title. Pathétique as in full of pathos, not pitiful.

In 1804 the ten-year-old Ignaz Moscheles copied it out by hand because he could not afford to buy it. His teacher warned him off such “eccentric” music.

Painting: Jacques-Louis David, The Death of Socrates (1787), The Met.

#beethoven #pathetique #classicalpiano"""),

    dict(kind="piece", id="beethoven-symphony-5", composer="beethoven",
         label="Beethoven · 1808", title="Symphony No. 5 in C minor",
         hook="Four notes, and everything that can be built from them.",
         about="First heard on 22 December 1808 in Vienna, in a four-hour concert that also introduced the Sixth Symphony and the Fourth Piano Concerto.",
         painting="J. M. W. Turner, <i>Snow Storm: Hannibal and his Army Crossing the Alps</i>, exhibited 1812. Tate, London",
         recording="Kleiber · Wiener Philharmoniker",
         listen=[("I", "0:00", "The motto, twice. For a moment you cannot even tell the key."),
                 ("I", "4:35", "Everything stops for a lone oboe. Time stands still for a few seconds."),
                 ("II", "1:00", "Trumpets and drums burst into C major: a glimpse of the victory to come.")],
         caption="""Beethoven · Symphony No. 5 in C minor, Op. 67 (1808)

Short, short, short, long. One rhythm runs through all four movements and carries the symphony from C minor to C major.

Painting: J. M. W. Turner, Snow Storm: Hannibal and his Army Crossing the Alps (exhibited 1812), Tate.

#beethoven #classicalmusic #symphony"""),

    dict(kind="piece", id="schubert-symphony-8", composer="schubert",
         label="Schubert · 1822", title="Symphony No. 8 in B minor, “Unfinished”",
         hook="Two movements, and nothing missing.",
         about="A songwriter above all. Here the orchestra sings, and the songs keep being interrupted.",
         painting="Caspar David Friedrich, <i>The Abbey in the Oakwood</i>, 1809–10. Alte Nationalgalerie, Berlin",
         recording="Wand · Berliner Philharmoniker",
         listen=[("I", "0:00", "Cellos and basses alone, very quiet, winding downward. Remember it: it returns with a vengeance."),
                 ("I", "2:00", "The melody stops mid-phrase. One bar of silence. Then violent chords."),
                 ("II", "3:00", "A long, searching clarinet solo over gently off-beat strings.")],
         caption="""Schubert · Symphony No. 8 in B minor, D. 759, “Unfinished” (1822)

He wrote two complete movements, sketched a third, and stopped. Nobody knows why. The manuscript sat with a friend for decades; the premiere came in 1865, 37 years after Schubert’s death.

Painting: Caspar David Friedrich, The Abbey in the Oakwood (1809–10), Alte Nationalgalerie, Berlin.

#schubert #unfinished #classicalmusic"""),

    dict(kind="piece", id="dvorak-symphony-9", composer="dvorak",
         label="Dvořák · 1893", title="Symphony No. 9 in E minor, “From the New World”",
         hook="A Czech composer’s postcard from America, written with homesickness in the ink.",
         about="Written in New York while he directed the National Conservatory of Music. First heard at Carnegie Hall on 16 December 1893.",
         painting="Albert Bierstadt, <i>Among the Sierra Nevada, California</i>, 1868. Smithsonian American Art Museum",
         recording="Kubelík · Berliner Philharmoniker",
         listen=[("II", "0:00", "Seven slow brass chords moving through strange harmonies: a gateway."),
                 ("II", "0:45", "The English horn melody, over muted strings."),
                 ("II", "10:30", "A few solo strings take the tune. It stops. Silence. It tries again.")],
         caption="""Dvořák · Symphony No. 9 in E minor, Op. 95, “From the New World” (1893)

The Largo tune is Dvořák’s own. The words “Goin’ Home” were added by a pupil almost thirty years later.

Painting: Albert Bierstadt, Among the Sierra Nevada, California (1868), Smithsonian American Art Museum.

#dvorak #newworldsymphony #classicalmusic"""),

    dict(kind="focus", id="beethoven-symphony-5", composer="beethoven", crop="62% 40%",
         label="In focus · Beethoven 5", big="Three instruments wait until the finale.",
         body="Trombones, piccolo and contrabassoon stay silent for three movements. A soft drum taps over a held note, the violins feel their way upward, and the scherzo runs straight into the finale. Then all three enter at once.",
         stop="III ≈ 4:20, into IV",
         painting="Detail: J. M. W. Turner, <i>Snow Storm: Hannibal and his Army Crossing the Alps</i>, exhibited 1812. Tate, London",
         caption="""Beethoven’s Fifth: trombones, piccolo and contrabassoon play nothing for three movements. Their entry at the start of the finale is one of the great arrivals in music.

Listen from the end of the scherzo: a soft drum, a long held note, and no break.

Painting (detail): J. M. W. Turner, Snow Storm: Hannibal and his Army Crossing the Alps.

#beethoven #classicalmusic #orchestra"""),

    dict(kind="piece", id="brahms-symphony-4", composer="brahms",
         label="Brahms · 1885", title="Symphony No. 4 in E minor",
         hook="An autumn symphony that ends in tragedy, built on a tune borrowed from Bach.",
         about="His last symphony, written over two summers in the Austrian Alps. He conducted the premiere in Meiningen on 25 October 1885.",
         painting="Arnold Böcklin, <i>Isle of the Dead</i> (third version), 1883. Alte Nationalgalerie, Berlin",
         recording="Kleiber · Wiener Philharmoniker",
         listen=[("I", "0:00", "Violins sigh in two-note phrases: a chain of falling thirds."),
                 ("IV", "3:00", "The pulse slows. A solo flute, alone and halting. The loneliest moment in the symphony."),
                 ("IV", "4:20", "Trombones and horns in soft, hymn-like chords. A brief vision of peace.")],
         caption="""Brahms · Symphony No. 4 in E minor, Op. 98 (1885)

The finale is a passacaglia: thirty short variations over an eight-bar theme adapted from a Bach cantata. An old Baroque form, used for a Romantic tragedy that ends in the minor, without consolation.

Painting: Arnold Böcklin, Isle of the Dead (third version, 1883), Alte Nationalgalerie, Berlin.

#brahms #classicalmusic #symphony"""),

    dict(kind="piece", id="mozart-piano-concerto-23", composer="mozart",
         label="Mozart · 1786", title="Piano Concerto No. 23 in A major",
         hook="A sunny concerto with one deeply sad slow movement at its heart.",
         about="Entered in his own catalogue on 2 March 1786, while he was busy with <i>The Marriage of Figaro</i>.",
         painting="Thomas Gainsborough, <i>The Morning Walk</i>, 1785. National Gallery, London",
         recording="Barenboim · Berliner Philharmoniker",
         listen=[("I", "4:50", "A quiet tune that has not been heard before. Mozart saved it for this moment."),
                 ("I", "10:00", "The cadenza, written straight into the score by Mozart himself."),
                 ("III", "4:05", "A simple, smiling clarinet tune, and a surprise turn to D major.")],
         caption="""Mozart · Piano Concerto No. 23 in A major, K. 488 (1786)

When he came back to the half-finished score, he crossed out the oboes and wrote in clarinets. No trumpets, no drums: one flute, two clarinets, two bassoons, two horns and strings.

Painting: Thomas Gainsborough, The Morning Walk (1785), National Gallery, London. Paid for on 4 March 1786, two days after Mozart finished the concerto.

#mozart #pianoconcerto #classicalmusic"""),

    dict(kind="focus", id="dvorak-symphony-9", composer="dvorak", crop="30% 55%",
         label="In focus · Dvořák 9", big="One cymbal note.",
         body="A single, soft clash in the finale, just before the clarinet’s long, tender second theme. It is the only note the cymbals play in the whole symphony.",
         stop="IV ≈ 1:50",
         painting="Detail: Albert Bierstadt, <i>Among the Sierra Nevada, California</i>, 1868. Smithsonian American Art Museum",
         caption="""The cymbal player in Dvořák’s New World Symphony waits through three movements for one soft note in the finale. Listen for it just before the clarinet melody.

Painting (detail): Albert Bierstadt, Among the Sierra Nevada, California (1868).

#dvorak #newworldsymphony #orchestra"""),

    dict(kind="piece", id="berlioz-symphonie-fantastique", composer="berlioz",
         label="Berlioz · 1830", title="Symphonie fantastique",
         hook="An obsession told in five scenes, ending at a witches’ sabbath.",
         about="He was 26 at the Paris premiere on 5 December 1830. Beethoven had died only three years earlier.",
         painting="Francisco Goya, <i>Witches’ Sabbath</i>, 1820–23. Museo del Prado, Madrid",
         recording="Davis · Royal Concertgebouw Orchestra",
         listen=[("I", "5:10", "The idée fixe: the beloved appears, flute and violins over a heartbeat accompaniment."),
                 ("III", "0:00", "An English horn calls; an oboe answers from offstage. Two shepherds across a valley."),
                 ("V", "1:30", "The same melody, turned vulgar on a squealing small clarinet.")],
         caption="""Berlioz · Symphonie fantastique, Op. 14 (1830)

Berlioz handed the audience a written story: a young artist, hopelessly in love, takes opium and dreams. The beloved is one melody, the idée fixe, returning in every movement in a new disguise. The real one was the actress Harriet Smithson, whom he later married.

Painting: Francisco Goya, Witches’ Sabbath (1820–23), Museo del Prado.

#berlioz #symphoniefantastique #classicalmusic"""),

    dict(kind="piece", id="beethoven-symphony-9", composer="beethoven",
         label="Beethoven · 1824", title="Symphony No. 9 in D minor, “Choral”",
         hook="The symphony that found it needed the human voice.",
         about="At the premiere on 7 May 1824 he was deaf, and had to be turned around to see the applause.",
         painting="Philipp Otto Runge, <i>Morning</i> (first version), 1808. Hamburger Kunsthalle",
         recording="Karajan · Berliner Philharmoniker",
         listen=[("IV", "1:00", "Short quotations of the first three movements, each cut off by the basses."),
                 ("IV", "3:00", "The joy theme for the first time: cellos and basses, very quietly, alone."),
                 ("IV", "6:20", "“O friends, not these sounds!” The first words in any Beethoven symphony.")],
         caption="""Beethoven · Symphony No. 9 in D minor, Op. 125, “Choral” (1824)

The first major symphony to include singers. Before the Ode to Joy can begin, the finale tries out each earlier movement and rejects it.

Painting: Philipp Otto Runge, Morning (1808), Hamburger Kunsthalle.

#beethoven #odetojoy #classicalmusic"""),

    dict(kind="focus", id="mozart-piano-concerto-23", composer="mozart", crop="55% 12%",
         label="In focus · Mozart K. 488", big="F-sharp minor.",
         body="The only movement Mozart wrote in that key. A slow, rocking lament set between two sunny movements in A major. The pianist András Schiff counts it among the most sorrowful pieces Mozart ever wrote.",
         stop="II ≈ 0:00",
         painting="Detail: Thomas Gainsborough, <i>The Morning Walk</i>, 1785. National Gallery, London",
         caption="""Mozart wrote one movement in F-sharp minor in his whole life: the Adagio of Piano Concerto No. 23. The piano starts alone, with a melody that leaps far down and back up.

Painting (detail): Thomas Gainsborough, The Morning Walk (1785).

#mozart #pianoconcerto #classicalpiano"""),

    dict(kind="piece", id="beethoven-piano-concerto-3", composer="beethoven",
         label="Beethoven · 1803", title="Piano Concerto No. 3 in C minor",
         hook="A quiet drumbeat Beethoven planned in 1796 waits at the heart of his stormiest concerto.",
         about="At the 1803 premiere the solo part was barely written down. His page-turner saw almost empty pages; Beethoven played from memory.",
         painting="Martin von Molitor, <i>Landscape with Hammer Mill</i>, c. 1800. Belvedere, Vienna",
         recording="Richter · Sanderling · Wiener Symphoniker",
         listen=[("I", "3:20", "The piano enters with three rising scales, then strikes the theme in octaves."),
                 ("I", "14:50", "The piano very soft, the kettledrum tapping the knocking rhythm. The idea from 1796."),
                 ("II", "0:00", "The piano alone, in E major, far from C minor.")],
         caption="""Beethoven · Piano Concerto No. 3 in C minor, Op. 37 (1803)

Among his first notes for it: “kettledrum at the cadenza”. It became the hushed close of the first movement, timpani and piano talking softly together. His only piano concerto in a minor key.

Painting: Martin von Molitor, Landscape with Hammer Mill (c. 1800), Belvedere, Vienna.

#beethoven #pianoconcerto #classicalmusic"""),

    dict(kind="piece", id="mahler-symphony-5", composer="mahler",
         label="Mahler · 1902", title="Symphony No. 5",
         hook="From a funeral march to a love song to laughter.",
         about="Between the two summers he spent writing it, he nearly died of a haemorrhage, met Alma Schindler, and married her.",
         painting="Gustav Klimt, <i>Death and Life</i>, 1910/11, reworked to 1915/16. Leopold Museum, Vienna",
         recording="Bernstein · Wiener Philharmoniker",
         listen=[("I", "0:00", "A solo trumpet: three short notes and a long one. The rhythm of Beethoven’s Fifth."),
                 ("II", "11:30", "A bright brass chorale. Victory seems to have arrived, then it crumbles."),
                 ("V", "13:00", "The chorale returns, and this time it holds.")],
         caption="""Mahler · Symphony No. 5 (1902)

No single home key: it begins in C-sharp minor and ends in D major. Five movements in three parts, from mourning and rage to love and joy.

Painting: Gustav Klimt, Death and Life (1910/11, reworked to 1915/16), Leopold Museum, Vienna.

#mahler #classicalmusic #symphony"""),

    dict(kind="focus", id="berlioz-symphonie-fantastique", composer="berlioz", crop="45% 50%",
         label="In focus · Berlioz", big="Col legno.",
         body="The violinists turn their bows over and tap the strings with the wood. A dry clatter, like rattling bones, at the witches’ sabbath.",
         stop="V ≈ 8:40",
         painting="Detail: Francisco Goya, <i>Witches’ Sabbath</i>, 1820–23. Museo del Prado, Madrid",
         caption="""Col legno: “with the wood”. In the last minutes of the Symphonie fantastique, Berlioz has the violins strike the strings with the back of the bow. In 1830 it was a sound nobody expected from an orchestra.

Painting (detail): Francisco Goya, Witches’ Sabbath (1820–23), Museo del Prado.

#berlioz #symphoniefantastique #orchestra"""),

    dict(kind="piece", id="shostakovich-symphony-5", composer="shostakovich",
         label="Shostakovich · 1937", title="Symphony No. 5 in D minor",
         hook="A triumphant ending, or the sound of being forced to cheer? You decide.",
         about="In January 1936 <i>Pravda</i> attacked his music under the headline “Muddle Instead of Music”. In Stalin’s Soviet Union, that put his career and his life in danger.",
         painting="Ilya Repin, <i>Barge Haulers on the Volga</i>, 1870–73. State Russian Museum, St Petersburg",
         recording="Bernstein · New York Philharmonic",
         listen=[("III", "5:30", "A solo oboe over a single thread of trembling violins. The most desolate passage."),
                 ("III", "9:00", "The cellos cry out at the top of their range. Grief breaks into the open."),
                 ("IV", "5:00", "He quotes his own song on a Pushkin poem, “Rebirth”.")],
         caption="""Shostakovich · Symphony No. 5 in D minor, Op. 47 (1937)

Written between April and July 1937, at the height of the Great Terror. At the Leningrad premiere people wept during the slow movement; the ovation reportedly lasted half an hour. Listeners still argue about what the ending means.

Painting: Ilya Repin, Barge Haulers on the Volga (1870–73), State Russian Museum.
Portrait: Leonid Dorensky / Moscow Main Archive (mos.ru), CC BY 4.0.

#shostakovich #classicalmusic #symphony"""),

    dict(kind="piece", id="rachmaninoff-piano-concerto-2", composer="rachmaninoff",
         label="Rachmaninoff · 1901", title="Piano Concerto No. 2 in C minor",
         hook="The concerto that brought Rachmaninoff back after three silent years.",
         about="After the failed premiere of his First Symphony in 1897, he wrote almost nothing for three years. The concerto is dedicated to his physician, Nikolai Dahl.",
         painting="Arkhyp Kuindzhi, <i>Red Sunset</i>, 1905–8. The Metropolitan Museum of Art, New York",
         recording="Richter · Wisłocki · Warsaw Philharmonic",
         listen=[("I", "0:00", "The piano alone: eight bars of tolling chords, from very soft to very loud."),
                 ("II", "0:50", "A solo flute, then a clarinet, over the piano’s rocking broken chords."),
                 ("III", "10:15", "The warm melody at full strength, now in C major. The minor has become major.")],
         caption="""Rachmaninoff · Piano Concerto No. 2 in C minor, Op. 18 (1901)

In 1900 he saw the physician Nikolai Dahl almost daily, for treatment that included hypnosis. The complete concerto was first heard in Moscow on 9 November 1901, with Rachmaninoff at the piano. It is still his most popular work.

Painting: Arkhyp Kuindzhi, Red Sunset (1905–8), The Met.

#rachmaninoff #pianoconcerto #classicalmusic"""),

    dict(kind="focus", id="mahler-symphony-5", composer="mahler", crop="72% 40%",
         label="In focus · Mahler 5", big="Strings and harp, and nothing else.",
         body="The Adagietto is widely thought to be a love letter to Alma Schindler, whom Mahler married in 1902. Each phrase leans on a note that does not belong, then resolves. In the finale the same melody comes back as a quick dance.",
         stop="IV ≈ 0:00",
         painting="Detail: Gustav Klimt, <i>Death and Life</i>, 1910/11, reworked to 1915/16. Leopold Museum, Vienna",
         caption="""The Adagietto from Mahler’s Fifth: strings and harp only, and widely thought to be a love letter to Alma. It became world famous through the film Death in Venice.

Then listen to the finale, at about 3:20: the same melody, transformed into a quick, light dance.

Painting (detail): Gustav Klimt, Death and Life, Leopold Museum, Vienna.

#mahler #adagietto #classicalmusic"""),

    dict(kind="focus", id="tchaikovsky-symphony-6", composer="tchaikovsky", crop="60% 55%",
         label="In focus · Tchaikovsky 6", big="pppppp",
         body="A solo clarinet lets the great melody fade to almost nothing. Tchaikovsky marks it pppppp, the quietest marking in the score. Then a sudden, violent crash.",
         stop="I ≈ 9:30",
         painting="Detail: Isaac Levitan, <i>Above Eternal Peace</i>, 1894. State Tretyakov Gallery, Moscow",
         caption="""Six p’s. In the first movement of the Pathétique, Tchaikovsky asks for a quietness beyond any normal dynamic, then breaks it with a crash that starts the development.

Painting (detail): Isaac Levitan, Above Eternal Peace (1894), State Tretyakov Gallery.

#tchaikovsky #pathetique #classicalmusic"""),

    dict(kind="piece", id="tchaikovsky-symphony-6", composer="tchaikovsky",
         label="Tchaikovsky · 1893", title="Symphony No. 6 in B minor, “Pathétique”",
         hook="A symphony that ends not in triumph but in silence.",
         about="He conducted the premiere in St Petersburg on 28 October 1893. Nine days later he was dead.",
         painting="Isaac Levitan, <i>Above Eternal Peace</i>, 1894. State Tretyakov Gallery, Moscow",
         recording="Currentzis · musicAeterna",
         listen=[("II", "0:00", "A waltz with five beats in a bar. Count “one-two, one-two-three”."),
                 ("III", "5:30", "The march in the full orchestra. It sounds like a finale. It is a trap."),
                 ("IV", "7:00", "One soft stroke of the tam-tam, its only note in the symphony.")],
         caption="""Tchaikovsky · Symphony No. 6 in B minor, Op. 74, “Pathétique” (1893)

The Russian title means “passionate”, not “pathetic”. He said the symphony had a secret story and never revealed it. He reversed the usual order: the thrilling march comes third, the slow movement last.

Painting: Isaac Levitan, Above Eternal Peace (1894), State Tretyakov Gallery.

#tchaikovsky #pathetique #classicalmusic"""),
]
