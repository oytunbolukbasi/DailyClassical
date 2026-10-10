# Shared-file additions: debussy-la-mer

For the merge into `content/paintings.yaml`, the glossary files and `content/composers.yaml`.
Sources and checks: `content/research/debussy-la-mer.md`. Checked 2026-10-10.

## 1. `content/paintings.yaml` (first choice)

```yaml
debussy-la-mer:
  # A woodblock print, not a painting (the brief named it as the obvious candidate). The Met's own
  # Open Access image of JP1847 is DP130155 (CC0); the Commons file below is that object (Met 45434).
  # Landscape, ≈ 1.49:1.
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Tsunami_by_hokusai_19th_century.jpg
  source_url: https://www.metmuseum.org/art/collection/search/45434
  commons_page: https://commons.wikimedia.org/wiki/File:Tsunami_by_hokusai_19th_century.jpg
  width: 3859
  height: 2594
  medium: Woodblock print; ink and color on paper
  license: Public domain (PD-Art, PD-old; The Met Open Access, CC0)
  credit_line: Katsushika Hokusai, Under the Wave off Kanagawa (The Great Wave), from the series Thirty-six Views of Mount Fuji, c. 1830–32. The Metropolitan Museum of Art, New York, H. O. Havemeyer Collection, Bequest of Mrs. H. O. Havemeyer, 1929 (JP1847). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Gustave Courbet | The Wave | 1869 | National Galleries of Scotland, Edinburgh (NG 2233) | https://commons.wikimedia.org/wiki/File:Gustave_Courbet_-_The_Wave_-_Google_Art_Project.jpg (4001 × 3320, PD-Art, Google Art Project) | One wave caught at the moment it breaks, painted on the Normandy coast a generation before *La mer*. |
| B | Gustave Courbet | The Wave (La vague) | 1870 | Alte Nationalgalerie, Berlin | https://commons.wikimedia.org/wiki/File:Gustave_Courbet_-_La_vague_-_Google_Art_Project.jpg (3783 × 2908, PD-Art, Google Art Project; not the SMB's own NC-licensed photo) | A green-grey sea rearing up under a heavy sky: the storm of the third sketch. |

Both are Courbet (d. 1877, PD everywhere). Debussy is also known to have admired Turner, who already has one painting in `paintings.yaml`.

## 2. Glossary

No new terms. Terms used: motif, muted, chorale, pedal note, divisi, scherzo, glissando (all in `content/en/glossary.md`).

## 3. `content/composers.yaml`: new composer `debussy`

```yaml
- id: debussy
  match: Claude Debussy
  sort_name: Debussy, Claude
  born: 1862
  died: 1918
  era: late_romantic
  names:
    en: { name: Claude Debussy, short: Debussy }
    tr: { name: Claude Debussy, short: Debussy }
  nationality: { en: French, tr: Fransız }
  facts:
    born: { en: "22 August 1862, Saint-Germain-en-Laye", tr: "22 Ağustos 1862, Saint-Germain-en-Laye" }
    died: { en: "25 March 1918, Paris", tr: "25 Mart 1918, Paris" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Prélude à l'après-midi d'un faune*, *La mer*, piano music", tr: "*Bir Faunun Öğleden Sonrası’na Prelüd*, *Deniz*, piyano eserleri" }
  bio:
    en: |-
      Debussy was born in 1862 in Saint-Germain-en-Laye, outside Paris, into a family of modest means with little interest in the arts. His talent at the piano won him a place at the Paris Conservatoire at the age of ten. There he discovered that he cared more about inventing new harmonies than about following the rules, which his teachers did not appreciate. All the same, in 1884 he won the Prix de Rome, France's most prestigious prize for young composers, and spent two unhappy years at the Villa Medici in Rome.

      Back in Paris he fell under Wagner's spell, travelling to Bayreuth in 1888 and 1889, and then worked hard to free himself from it. At the 1889 World's Fair in Paris he heard a Javanese gamelan orchestra, whose shimmering sounds and scales stayed with him. His *Prélude à l'après-midi d'un faune* (1894) opened a new chapter in music; Pierre Boulez later said that modern music was awakened by it. Fame came in 1902, when he was nearly forty, with his only completed opera, *Pelléas et Mélisande*.

      His private life caused a scandal in 1904, when he left his wife for Emma Bardac; their daughter, Claude-Emma, known as Chouchou, was born in 1905, the year of *La mer*. He went on to write the orchestral *Images* and two books of piano *Préludes*, and he always rejected the label "Impressionist". He died of cancer in Paris on 25 March 1918, while the city was under German bombardment.
    tr: |-
      Debussy 1862’de, Paris’in hemen dışındaki Saint-Germain-en-Laye’de, sanatla pek ilgisi olmayan, mütevazı bir ailede doğdu. Piyanodaki yeteneği ona on yaşında Paris Konservatuvarı’nın kapılarını açtı. Orada kurallara uymaktan çok yeni armoniler bulmayı sevdiğini fark etti; hocaları bundan pek hoşnut değildi. Yine de 1884’te genç besteciler için Fransa’nın en saygın ödülü olan Roma Ödülü’nü kazandı ve Roma’daki Villa Medici’de mutsuz geçen iki yıl geçirdi.

      Paris’e döndüğünde Wagner’in büyüsüne kapıldı, 1888 ve 1889’da Bayreuth’a gitti; sonra bu etkiden kurtulmak için çok uğraştı. 1889 Paris Dünya Fuarı’nda dinlediği Cava gamelan orkestrasının ışıldayan sesleri ve dizileri aklından hiç çıkmadı. *Bir Faunun Öğleden Sonrası’na Prelüd* (1894) müzikte yeni bir sayfa açtı; Pierre Boulez yıllar sonra modern müziğin bu eserle uyandığını söyleyecekti. Ün, kırk yaşına yaklaşırken, 1902’de tamamlayabildiği tek operası *Pelléas ve Mélisande* ile geldi.

      1904’te karısını Emma Bardac için terk etmesi bir skandala yol açtı; kızları Claude-Emma, nam-ı diğer Chouchou, *Deniz*’in yazıldığı 1905 yılında doğdu. Ardından orkestra için *Imajlar*’ı ve iki kitaplık piyano *Prelüdler*’ini yazdı; “empresyonist” etiketini ise hep reddetti. 25 Mart 1918’de, Paris Alman bombardımanı altındayken, kanserden öldü.
  portrait:
    artist: Marcel Baschet
    title: { en: Portrait of Claude Debussy, tr: Claude Debussy’nin Portresi }
    year: "1884"
    collection: { en: "Musée d'Orsay, Paris", tr: "Musée d'Orsay, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Claude_Debussy,_portrait_by_Marcel_Baschet_(1884).jpg
    source_url: https://commons.wikimedia.org/wiki/File:Claude_Debussy,_portrait_by_Marcel_Baschet_(1884).jpg
    width: 5520
    height: 6547
    license: Public domain (PD-Art, PD-old-auto-expired; painter d. 1941)
    focal_y: 0.3
```

### Composer sources (for `content/research/composers-sources.md`)

```markdown
## Claude Debussy (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Claude_Debussy · https://www.britannica.com/biography/Claude-Debussy · https://www.wikidata.org/wiki/Q4700
- Born 22 August 1862, Saint-Germain-en-Laye; died 25 March 1918, Paris (colon cancer; Paris under German aerial and artillery bombardment). Conservatoire at ten; Prix de Rome 1884 (Villa Medici, which he found stifling). Heard *Tristan* in 1887, Bayreuth 1888 and 1889. Javanese gamelan at the 1889 Exposition Universelle. *Prélude à l'après-midi d'un faune* 1894; Boulez: "Modern music was awakened by *Prélude à l'après-midi d'un faune*" (quoted in Wikipedia). *Pelléas et Mélisande* 1902 ("nearly 40"). Left Lilly Texier for Emma Bardac, July 1904; daughter Claude-Emma ("Chouchou") born 1905. Rejected the term Impressionism. "Symphonies: None": he wrote no symphony; *La mer* is "three symphonic sketches".
- Era `late_romantic` is a judgement call (he died in 1918, like Mahler's generation); `modern` would also be defensible. Ravel is entered as `modern`.
- Portrait: Marcel Baschet (1862–1941), *Portrait of Claude Debussy*, 1884, oil on canvas, painted in Rome when both were Prix de Rome laureates; Commons source https://www.musee-orsay.fr/fr/oeuvres/claude-debussy-85461 (Musée d'Orsay).
  https://commons.wikimedia.org/wiki/File:Claude_Debussy,_portrait_by_Marcel_Baschet_(1884).jpg — 5520 × 6547, {{PD-Art|PD-old-auto-expired|deathyear=1941}}.
  - EU / Turkey: Baschet died 1941, so PD since 1 Jan 2012 (life + 70). Faithful reproduction: no new right (DSM art. 14).
  - US: PD if the painting was published before 1931. The BnF holds photographic reproductions "d'après le portrait de Marcel Baschet" dated 1919 and 1926 (Commons files btv1b8417033w, btv1b8417032g), which points to publication before 1931. Not proven from a dated printed source; low risk.
  - Shows Debussy at 22. Fallback if a mature likeness is wanted: Atelier Nadar photograph, 1905, BnF (File:Claude_Debussy_-_Nadar_-_btv1b8417039c.jpg, 4872 × 6312, tagged PD-France only; Paul Nadar d. 1939, so PD in the EU; US status depends on pre-1931 publication, not checked).
- focal_y 0.3: face in the upper third (thumbnail checked).
```
