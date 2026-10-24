# Shared-file additions: schumann-symphony-3

Sources: `content/research/schumann-symphony-3.md` §3 (painting) and §5 (re-time).

## 1. paintings.yaml

```yaml
schumann-symphony-3:
  # Museum press image (4977 × 6352, portrait). A cropped version exists on Commons
  # (File:Carl_Hasenpflug,_Idealansicht_des_Kölner_Doms_(cropped).jpg, 3725 × 6619): use it if the full file
  # shows frame or margins. Tall format: check the hero crop (focus on the west front and towers).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Carl_Hasenpflug,_Idealansicht_des_K%C3%B6lner_Doms.jpg
  # No museum object page found: Wikidata item (collection, inventory KSM 1962/73, size, medium).
  source_url: https://www.wikidata.org/wiki/Q19915177
  commons_page: https://commons.wikimedia.org/wiki/File:Carl_Hasenpflug,_Idealansicht_des_K%C3%B6lner_Doms.jpg
  width: 4977
  height: 6352
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-100-expired)
  credit_line: Carl Hasenpflug, Ideal View of Cologne Cathedral from the South-West, 1834–36. Kölnisches Stadtmuseum, Cologne (KSM 1962/73). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

`source_url` is the Wikidata item: no object page of the Kölnisches Stadtmuseum was found; the Commons source is a museenkoeln.de press image (http://www.museenkoeln.de/presse/presse/422/hi/05.jpg).

**Alternative 1.** J. M. W. Turner (1775–1851), *Cologne, the Arrival of a Packet-Boat, Evening*, 1826, The Frick Collection, New York. Commons: `File:Joseph Mallord William Turner - Cologne, the Arrival of a Packet Boat in the Evening - c 1826 - The Frick Collection.jpg` (7684 × 5954, PD-Art). Pairing: Cologne's Rhine waterfront in golden evening light, the river city of the symphony. Turner is already in `paintings.yaml` (Snow Storm), so a fallback only.

**Alternative 2.** Andreas Achenbach (1815–1910), *Zons am Rhein*, Alte Nationalgalerie, Berlin. Commons: `File:Achenbach, Andreas - Zons am Rhein - Alte Nationalgalerie.jpg` (1654 × 1283, low resolution; date and inventory not checked). Pairing: a Rhine town between Düsseldorf and Cologne, by a leading painter of the Düsseldorf school, which flourished in the city where Schumann wrote the symphony. Needs a better scan.

## 2. Glossary

No new terms. Existing terms used: Sonata form, Hemiola, Development, Recapitulation, Coda, Ländler, Pedal note, Pizzicato, Counterpoint, Canon.

## 3. Composer

None: Schumann is already in `content/composers.yaml`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Schumann – Symphony No. 3 in E-flat major, "Rhenish" | I Lebhaft | – | 10:39 | – | Giulini / LA Phil, Spotify `0ZSZUADImCrIH5czVBfn38` (track 1) | 0:00, 1:45, 2:00, 3:20, 3:40–4:55, 5:00, 6:40, 7:25, 8:15, 9:30 | de.wikipedia bar numbers × track length (≈ 590 bars assumed). Least certain: horn call, recapitulation |
| Schumann – Symphony No. 3 in E-flat major, "Rhenish" | II Scherzo: Sehr mäßig | – | 6:26 | – | same (track 2) | 0:00, 0:50, 1:40, 2:30, 4:00, 5:00–5:30, Last 40 seconds | Total bars (≈ 126) and repeats unknown: all stops uncertain |
| Schumann – Symphony No. 3 in E-flat major, "Rhenish" | III Nicht schnell | – | 5:30 | – | same (track 3) | 0:00, 0:30, 1:35, 1:55–3:50, 4:00, Last minute | ≈ 62 bars assumed |
| Schumann – Symphony No. 3 in E-flat major, "Rhenish" | IV Feierlich | – | 5:31 | – | same (track 4) | 0:00, 0:35, 0:40–1:50, 2:00, 3:40, 4:30, Last 40 seconds | Metre changes; section boundaries least certain |
| Schumann – Symphony No. 3 in E-flat major, "Rhenish" | V Lebhaft | – | 5:49 | – | same (track 5) | 0:00, 0:50, 1:00, 1:45, 2:15–2:40, 2:40, 4:40, Last 40 seconds | ≈ 340 bars assumed; coda least certain |
