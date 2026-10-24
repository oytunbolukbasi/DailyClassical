# Shared-file additions: brahms-symphony-2

For merging into `content/paintings.yaml`, the glossaries and `project-knowledge/content_status.md`. Sources: `content/research/brahms-symphony-2.md`.

## 1. paintings.yaml

First choice:

```yaml
brahms-symphony-2:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Marko_Pernhart_-_A_view_of_Lake_W%C3%B6rthersee_with_Maria_Loretto_and_Freyenthurn_Castle.jpg
  source_url: https://www.dorotheum.com/en/l/1091998/
  commons_page: https://commons.wikimedia.org/wiki/File:Marko_Pernhart_-_A_view_of_Lake_W%C3%B6rthersee_with_Maria_Loretto_and_Freyenthurn_Castle.jpg
  width: 4833
  height: 3869
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100)
  credit_line: Markus Pernhart, View of the Wörthersee with Maria Loretto and Freyenthurn Castle, 1850. Private collection, Austria. Image via Wikimedia Commons (Dorotheum), public domain.
  rights_status: public_domain
```

`source_url` is the Dorotheum lot page built from the Commons {{dorotheum|1091998}} template; it returns 403 to scripts and was not opened. The painting is in a private collection, so there is no museum page.

Alternatives (in case of a clash, or if a museum-held picture is preferred):

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Jakob Canciani | *Blick auf den Wörthersee nach Osten* (View of the Wörthersee towards the East) | before 1891 | Private collection (Dorotheum sale) | https://commons.wikimedia.org/wiki/File:Jakob_Canciani_Blick_auf_den_W%C3%B6rthersee_nach_Osten.jpg (6461 × 2523, PD; very wide, ≈ 2.6:1) | The lake where Brahms wrote the symphony, seen from its western shore in the later 19th century. |
| B | Anton Hlavacek | *Bei Velden am Wörthersee* (Near Velden on the Wörthersee) | before 1926 | Private collection (Dorotheum sale) | https://commons.wikimedia.org/wiki/File:Anton_Hlavacek_Bei_Velden_am_W%C3%B6rthersee.jpg (5000 × 3576, PD) | A sunlit view of the lake where the symphony was written, near Velden at its western end. |

Both dates ("before …") are from the Commons metadata only; Canciani's direction of view is from the title. Neither is museum-held; if that matters, Tina Blau's *Spring in the Prater* (proposed for `brahms-piano-concerto-2`) is the museum-held Viennese alternative.

## 2. Glossary

No new terms. Terms used, all existing: sonata form, exposition, development, fugato, recapitulation, coda, scherzo, trio.

## 3. Composer

Brahms is already in `content/composers.yaml`: nothing to add.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Brahms – Symphony No. 2 in D major | I Allegro non troppo | – | 15:10 | – | Walter / Columbia SO, Spotify `0wHgDAO1eMeoZSkm00ESED` (track 1) | 0:00, 0:55, 1:20, 2:15, 3:20, 4:15, 4:55, 5:35–6:40, 8:20, 9:40, 12:40–13:10, Last minute | New piece, estimates from Hansen's bar timings (Abbado) scaled × 0.966 after removing the exposition repeat. Confirm Walter omits the repeat; least certain: recapitulation ≈ 8:20 |
| Brahms – Symphony No. 2 in D major | II Adagio non troppo | – | 10:37 | – | same (track 2) | 0:00, 1:15, 1:40, 3:00, 4:10, 5:10–6:00, 6:35, 8:15, 9:25 | Scaled × 1.056; least certain: Theme 2 ≈ 3:00 and outburst ≈ 8:15 |
| Brahms – Symphony No. 2 in D major | III Allegretto grazioso | – | 5:33 | – | same (track 3) | 0:00, 1:10, 2:05, 2:50, 3:35, Last 30 seconds | Scaled × 1.025; least certain: second Presto ≈ 2:50 |
| Brahms – Symphony No. 2 in D major | IV Allegro con spirito | – | 9:38 | – | same (track 4) | 0:00, 0:28, 1:30, 2:20, 3:10, 4:20, 5:15, 5:35, 6:20, 7:55, 9:10 | Scaled × 0.991; least certain: tranquillo ≈ 4:20, coda ≈ 7:55 |
