# Shared-file additions: schumann-piano-quintet

Sources: `content/research/schumann-piano-quintet.md` §3 (painting) and §5 (re-time).

## 1. paintings.yaml

```yaml
schumann-piano-quintet:
  # Gallery photo by User:anagoria (4752 × 3329). Check edges and glare before `npm run images`.
  # A larger photo exists (File:Alte_Nationalgalerie_Joseph_Danhauser_-_Liszt_at_the_piano_-_1840_2124.jpg,
  # 8256 × 5504, by Dosseman) but Commons flags it as not a 2D representation (frame/wall likely).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/1840_Danhauser_Liszt_am_Fl%C3%BCgel_anagoria.JPG
  # Federal art administration provenance record (the painting is federal property on loan, inv. F.V. 42).
  source_url: https://kunstverwaltung.bund.de/SharedDocs/Provenienzen/DE/9000_9999/9165.html
  commons_page: https://commons.wikimedia.org/wiki/File:1840_Danhauser_Liszt_am_Fl%C3%BCgel_anagoria.JPG
  width: 4752
  height: 3329
  medium: Oil on panel
  license: Public domain (PD-old-100-expired; photograph of a public-domain painting)
  credit_line: Josef Danhauser, Liszt at the Piano, 1840. Alte Nationalgalerie, Staatliche Museen zu Berlin (on loan from the Federal Republic of Germany, F.V. 42). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

**Alternative 1.** Eduard Bendemann (1811–1889), *The Mourning Jews in Exile* (*Die trauernden Juden im Exil*), c. 1832, Wallraf-Richartz-Museum & Fondation Corboud, Cologne. Commons: `File:Jews Mourning in Exile - Eduard Bendemann - Wallraf-Richartz-Museum & Fondation Corboud-6071 (without frame).jpg` (4578 × 2979; licence tag not checked). Pairing: Bendemann was a close friend of the Schumanns; his grieving figures share the hushed sorrow of the quintet's funeral march. Date, inventory and the friendship need checking before use.

**Alternative 2.** Moritz von Schwind (1804–1871), *A Symphony* (*Eine Symphonie*), 1852, Neue Pinakothek, Munich (WAF 1017). Commons: `File:Moritz von Schwind - Eine Symphonie - Neue Pinakothek - WAF 1017.jpg` (5304 × 7952, portrait; licence tag not checked). Pairing: a piano at the centre of a domestic music-making scene with strings and singers, painted a decade after the quintet; the world of Romantic chamber music that Schumann's quintet brought into the concert hall.

## 2. Glossary

No new terms. Existing terms used: Trio, Sonata form, Exposition, Development, Recapitulation, Coda, Scherzo, Canon, Fugato, Syncopation, Cyclic form.

## 3. Composer

None: Schumann is already in `content/composers.yaml`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Schumann – Piano Quintet in E-flat major | I Allegro brillante | – | 8:15 | – | Andsnes / Artemis Quartet, Spotify `1kBHfVZzVvvlybRk8lvS2o` (track 1) | 0:00, 0:30, 0:55, 1:50, 2:10, 4:20, 5:10, 5:55, 6:50, Last 30 seconds | Proportions, with the exposition repeat (inferred). Least certain: second theme, recapitulation |
| Schumann – Piano Quintet in E-flat major | II In modo d'una marcia. Un poco largamente | – | 7:57 | – | same (track 2) | 0:00, 1:15, 2:20, 3:05, 4:40, 5:50, Last minute | Rondo sections by proportion |
| Schumann – Piano Quintet in E-flat major | III Scherzo: Molto vivace | – | 4:45 | – | same (track 3) | 0:00, 0:45, 1:35, 2:15, 3:20, Last 20 seconds | Trio boundaries depend on repeats |
| Schumann – Piano Quintet in E-flat major | IV Allegro ma non troppo | – | 7:14 | – | same (track 4) | 0:00, 0:45, 1:55, 2:20, 3:00, 3:45, 4:10, 5:20, Last 30 seconds | Wikipedia bar map, ≈ 432 bars assumed. Least certain: double fugato |
