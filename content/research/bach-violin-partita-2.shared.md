# Shared-file additions: bach-violin-partita-2

For the merge (`python3 content/research/merge-drafts.py bach-violin-partita-2`). Details and sources in `content/research/bach-violin-partita-2.md`.

## 1. paintings.yaml

First choice: Pieter Claesz, *Vanitas Still Life with Self-Portrait*, 1628, Germanisches Nationalmuseum, Nuremberg.

```yaml
bach-violin-partita-2:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Pieter_Claesz._-_Still_Life_with_a_Self-portrait.jpg
  source_url: https://objektkatalog.gnm.de/objekt/Gm1409
  commons_page: https://commons.wikimedia.org/wiki/File:Pieter_Claesz._-_Still_Life_with_a_Self-portrait.jpg
  width: 6668
  height: 3972
  medium: Oil on oak panel
  license: Public domain (PD-Art, PD-old-100)
  credit_line: Pieter Claesz, Vanitas Still Life with Self-Portrait, 1628. Germanisches Nationalmuseum, Nuremberg (Gm 1409). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

Cover crop: wide landscape; the violin is right of centre, the skull at the right edge. A crop centred slightly right keeps violin and skull together.

Alternatives:

1. **Arnold Böcklin, *Self-Portrait with Death Playing the Fiddle*, 1872.** Alte Nationalgalerie, Staatliche Museen zu Berlin (A I 633). Commons: `File:Arnold Boecklin-fiedelnder Tod.jpg` (3543 × 4389, Google Art Project, PD-Art; not the SMB's NC photo). Pairing: Death plays a single string of a violin behind the painter's shoulder. Strong image, but it leans on the disputed memorial theory, and Böcklin is already in `paintings.yaml` (*Isle of the Dead*).
2. **Harmen Steenwijck, *An Allegory of the Vanities of Human Life*, c. 1640.** National Gallery, London. Commons: `File:Harmen Steenwijck - Vanitas Still-Life - WGA21768.jpg` (3000 × 2357, PD-Art). Pairing: a vanitas like the first choice (skull, timepiece, musical instruments); the objects were not checked visually for this note, and there is no violin.

## 2. Glossary

New terms used in this piece. `suite`, `allemande`, `courante`, `sarabande` and `gigue` are also in `bach-cello-suite-1.shared.md`; `ground bass` also in `bach-keyboard-concerto-1.shared.md` and from group B; the merge skips duplicates.

| Term | Short | Definition |
| --- | --- | --- |
| Suite | A set of dances in one key, played as one work | A set of contrasting movements, usually dances, in the same key and played as one work. Bach also used the Italian word partita. |
| Allemande | A moderate German dance in four, often first in a suite | A dance of German origin in a moderate four beats, usually the first dance of a Baroque suite, with a flowing line of quick notes. |
| Courante | A lively "running" dance in three | A "running" dance in three beats. The Italian corrente is quick and light; the French courante is more stately. |
| Sarabande | A slow, stately dance in three, stressing the second beat | A slow, dignified dance in three beats, often with the weight on the second beat. It is the expressive centre of many Baroque suites. |
| Gigue | A fast jig in skipping groups of three | A fast dance descended from the British jig, in a skipping rhythm of three-note groups. It usually ends a Baroque suite. |
| Chaconne | Variations over a short, repeating pattern of chords | A piece built on a short pattern of chords, often four or eight bars long, repeated again and again while the music above it keeps changing. Bach's for solo violin is the best known. |

| Key | Terim | Kısa | Tanım |
| --- | --- | --- | --- |
| Suite | Süit | Aynı tonda, tek eser olarak çalınan bir dizi dans | Aynı tonda, genellikle danslardan oluşan ve tek bir eser olarak çalınan karşıt bölümler dizisi. Bach bunun için İtalyanca partita sözcüğünü de kullandı. |
| Allemande | Allemande | Süiti çoğu zaman açan, dört vuruşlu ılımlı bir dans | Alman kökenli, dört vuruşlu, orta hızda bir dans. Barok süitte genellikle ilk danstır ve hızlı notalardan akıcı bir çizgisi vardır. |
| Courante | Courante | Üç vuruşlu, canlı, "koşan" bir dans | Üç vuruşlu, "koşan" bir dans. İtalyan corrente hızlı ve hafif, Fransız courante daha ağırbaşlıdır. |
| Sarabande | Sarabande | İkinci vuruşa yaslanan, yavaş ve görkemli bir dans | Üç vuruşlu, yavaş ve ağırbaşlı bir dans; ağırlık çoğu zaman ikinci vuruştadır. Birçok Barok süitin duygusal merkezidir. |
| Gigue | Gigue | Üçlü gruplarla sekerek ilerleyen hızlı bir cig | Britanya'daki jig'den türemiş hızlı bir dans; üçlü nota gruplarıyla sekerek ilerler. Barok süiti genellikle kapatır. |
| Chaconne | Şakon | Kısa, yinelenen bir akor kalıbı üzerinde varyasyonlar | Çoğu zaman dört ya da sekiz ölçülük kısa bir akor kalıbının, üstündeki müzik durmadan değişirken tekrar tekrar yinelendiği eser. En ünlüsü Bach'ın solo keman için yazdığıdır. |

## 3. Composer

None: Bach is already in `content/composers.yaml`.

## 4. Re-time

| Piece | Mvt | Old draft | Measured | Diff | Reference track | Current stops (unchanged) | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Bach – Partita No. 2 for solo violin | I Allemanda | – | 4:05 | – | Milstein (DG), Spotify `0BNyjTMaSqSa01cxdT3RNT` (track 17) | 0:00, 1:00, 2:02, 3:05, Near the end | Estimate; equal halves, both repeated |
| Bach – Partita No. 2 for solo violin | II Corrente | – | 3:33 | – | same (track 18) | 0:00, 0:48, 1:35, 2:35, Last 10 seconds | Estimate; half lengths not checked |
| Bach – Partita No. 2 for solo violin | III Sarabanda | – | 4:01 | – | same (track 19) | 0:00, 0:33, 1:06, 2:33, Near the end | Estimate; 8 + 21 bars assumed |
| Bach – Partita No. 2 for solo violin | IV Giga | – | 4:13 | – | same (track 20) | 0:00, 0:50, 1:41, 2:57, Near the end | Estimate; 16 + 24 bars assumed |
| Bach – Partita No. 2 for solo violin | V Ciaccona | – | 13:56 | – | same (track 21) | 0:00, 0:30, 2:00, 4:50–6:30, 6:45, 7:10, 8:30–10:30, 11:15, Last 30 seconds | Estimate from 256 bars at ≈ 3.27 s per bar (D major from bar 133, D minor from bar 209). Least certain: 7:10 and 11:15 |
