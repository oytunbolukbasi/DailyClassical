# Shared-file additions: beethoven-piano-concerto-5

For merging into `content/paintings.yaml` and the glossary files. Sources: `content/research/beethoven-piano-concerto-5.md` §1 and §3.

## 1. `content/paintings.yaml` (first choice)

**Artist reuse flag:** David already has one painting in `paintings.yaml` (*The Death of Socrates*, `beethoven-piano-sonata-8`). The brief allows a second work only if it is clearly the best match; the case is in the research note §3 (a concerto nicknamed "Emperor", written under Napoleon's occupation of Vienna; a portrait of Napoleon as emperor dated 1812, the year of its Vienna premiere). If that is not accepted, use alternative A or B.

```yaml
beethoven-piano-concerto-5:
  # Samuel H. Kress Foundation image, reduced on Commons from a 16304 × 26731 original (7.8 MB at this size).
  # NGA's own open-access file is smaller: File:The_Emperor_Napoleon_in_His_Study_at_the_Tuileries_-_National_Gallery_of_Art_-_A34961.jpg
  # (2414 × 4000). Tall portrait (≈ 0.61:1): plan the hero crop around the head and shoulders.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/The_Emperor_Napoleon_in_His_Study_at_the_Tuileries,_by_Jacques-Louis_David_(1812)_-_National_Gallery_of_Art_(Samuel_H._Kress_Foundation)_-_2.jpg
  source_url: https://www.nga.gov/collection/art-object-page.46114.html
  commons_page: https://commons.wikimedia.org/wiki/File:The_Emperor_Napoleon_in_His_Study_at_the_Tuileries,_by_Jacques-Louis_David_(1812)_-_National_Gallery_of_Art_(Samuel_H._Kress_Foundation)_-_2.jpg
  width: 8000
  height: 13116
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired)
  credit_line: Jacques-Louis David, The Emperor Napoleon in His Study at the Tuileries, 1812. National Gallery of Art, Washington, Samuel H. Kress Collection (1961.9.15). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the NGA object page from Wikidata (P4683 = 46114); nga.gov refused the fetcher (403), so the page itself was not opened.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Louis Albert Guislain Bacler d'Albe (1761–1824) | *Bombardment of Vienna, 11 May 1809* (*Bombardement de Vienne, 11 mai 1809*) | not dated (first half of the 19th century; artist died 1824) | Château de Versailles (MV 1741) | https://commons.wikimedia.org/wiki/File:Bombardement_de_Vienne.jpg (2000 × 1603, PD-Art; frame visible, crop) | Vienna burning under French guns on the night of 11 May 1809, the spring Beethoven was writing this concerto. |
| B | Joseph Anton Koch (1768–1839) | *The Tyrolean Landsturm in 1809* (*Der Tiroler Landsturm im Jahre 1809*) | c. 1819–20 | Tiroler Landesmuseum Ferdinandeum, Innsbruck (not confirmed on a museum page) | https://commons.wikimedia.org/wiki/File:Tiroler_Landsturm_1809.jpg (3000 × 2241, PD-old-100; scan from zeno.org) | Tyrolean villagers rising against Napoleon's armies in 1809, the year of the concerto, painted by an Austrian contemporary. |

A has the most direct link but a small image (the same size as the Levitan scan rejected for Rachmaninoff) and no date. B's collection and date need checking, and Koch is also the first choice for `beethoven-symphony-6`.

## 3. Glossary rows (new terms only)

Used here: **Trill** (I), **Attacca** (II, end). Both already proposed by other groups; rows copied verbatim. Add once.

- Trill: from `content/research/brahms-violin-concerto.shared.md` (also in `tchaikovsky-violin-concerto`, `sibelius-violin-concerto`).
- Attacca: from `content/research/schumann-piano-concerto.shared.md` (also in `grieg-piano-concerto`, `elgar-cello-concerto`).

EN:

```
| Attacca | Go straight on into the next movement, without a pause | Italian for "attack": the next movement begins at once, with no break, so the two are heard as one continuous piece. |
| Trill | A rapid shake between two neighbouring notes | A rapid alternation between a note and the note just above it, which makes the sound shimmer or, low on the piano, rumble. |
```

TR:

```
| Attacca | Attacca | Ara vermeden bir sonraki bölüme geçmek | İtalyanca "saldır": sonraki bölüm hiç ara vermeden hemen başlar, böylece iki bölüm kesintisiz tek bir müzik gibi duyulur. |
| Trill | Tril | Yan yana iki nota arasında hızlı titreşim | Bir notayla hemen üstündeki nota arasında hızla gidip gelmek; ses parıldar ya da piyanonun pesinde gürler. |
```

All other terms already exist: arpeggio, cadenza, coda, development, double exposition, exposition, muted, recapitulation, rondo.

## 4. Composers

None.

## 5. Re-time rows

See `beethoven-piano-concerto-5.md` §5 (Kempff / Leitner, Spotify `3cS6w1hujyiNMpBFZfJtRO`).
