# Shared-file additions: schubert-arpeggione-sonata

## 1. paintings.yaml

```yaml
schubert-arpeggione-sonata:
  # Gallery photo by Sailko, photo licence CC BY 3.0; artwork public domain (Engert died 1871). Portrait, 2502 × 2886:
  # plan the crop and check the edges for frame. The WGA scan (File:Erasmus Engert - Viennese Domestic Garden - WGA07524.jpg)
  # is only 900 × 1091. SMB inventory number not recorded; the SMB's own photos are NC, so not used.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Erasmus_ritter_von_engert,_giardino_interno_viennese,_1828-30_ca.jpg
  source_url: https://www.wga.hu/html/e/engert/garden.html
  commons_page: https://commons.wikimedia.org/wiki/File:Erasmus_ritter_von_engert,_giardino_interno_viennese,_1828-30_ca.jpg
  width: 2502
  height: 2886
  medium: Oil on canvas
  license: Public domain (photograph of a public-domain painting)
  credit_line: Erasmus Engert, Viennese Domestic Garden (Wiener Hausgarten), c. 1828–30. Alte Nationalgalerie, Staatliche Museen zu Berlin. Image via Wikimedia Commons, public domain (photo Sailko, CC BY 3.0).
  rights_status: public_domain
```

Pairing note (in the drafts): a quiet Viennese courtyard garden of Schubert's last years, a woman reading in the shade; the intimate, private Vienna where music like this sonata was played among friends.

`source_url` is the Web Gallery of Art page (the SMB online record was not located); replace with the SMB record at merge if found. Medium "Oil on canvas" is from WGA/Commons category, not checked with the museum.

**Alternative 1.** Leopold Kupelwieser, *Party Game of the Schubertians in Atzenbrugg* (*Gesellschaftsspiel der Schubertianer in Atzenbrugg*), 1821, watercolour. Wien Museum. Commons: `File:Gesellschaftsspiel in Atzenbrugg.jpg` (918 × 694, public domain; too small, look for the Wien Museum's own open-content scan). Pairing: Schubert at the piano among friends, painted by the friend to whom he wrote his despairing letter of 31 March 1824.

**Alternative 2.** Caspar David Friedrich, *Moonrise over the Sea*, 1822. Alte Nationalgalerie, Berlin. Commons: search `Caspar David Friedrich - Mondaufgang am Meer` (public domain). Pairing: three figures watching the light fade, the melancholy of the years around 1824. Friedrich is already in `paintings.yaml` four times, so last resort.

## 2. Glossary

No new terms (uses Sonata form, Arpeggio, Exposition, Development, Recapitulation, Coda, Attacca, Rondo, Pizzicato). The word "arpeggione" is explained in the text, not as a term.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Schubert – Sonata in A minor for Arpeggione and Piano | I Allegro moderato | – | 13:36 | – | Rostropovich / Britten 1968, Spotify `6neCSxdb3EaVeJRlDmY23M` (track 1) | 0:00, 0:20, 1:50, 2:50, 3:50, 7:45, 9:30, 12:50 | Section proportions only; assumes the exposition repeat |
| Schubert – Sonata in A minor for Arpeggione and Piano | II Adagio | – | 4:36 | – | same (track 2) | 0:00, 0:20, 1:50, 3:10, Last minute | Section proportions only; confirm where the track ends relative to the attacca |
| Schubert – Sonata in A minor for Arpeggione and Piano | III Allegretto | – | 10:32 | – | same (track 3) | 0:00, 1:30, 3:00, 4:30, 7:00, 9:30, Near the end | Rondo proportions only; confirm the pizzicato passage (≈ 4:30) |
