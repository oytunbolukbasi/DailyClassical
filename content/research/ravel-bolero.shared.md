# Shared-file additions: ravel-bolero

For the merge into `content/paintings.yaml`, the glossary files and `content/composers.yaml`.
Sources and checks: `content/research/ravel-bolero.md`. Checked 2026-10-10.

## 1. `content/paintings.yaml` (first choice)

```yaml
ravel-bolero:
  # Very wide (≈ 1.48:1 in this file; the canvas is 232 × 348 cm). The Gardner's own image page was not
  # reached; the Commons file cites the museum's former collection URL (kept below as source_url, may redirect).
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/EL_JALEO-SINGER.jpg
  source_url: http://www.gardnermuseum.org/collection/artwork/1st_floor/spanish_cloister/el_jaleo
  commons_page: https://commons.wikimedia.org/wiki/File:EL_JALEO-SINGER.jpg
  width: 3000
  height: 2028
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old-auto-expired; US copyright registered 1925, expired)
  credit_line: John Singer Sargent, El Jaleo, 1882. Isabella Stewart Gardner Museum, Boston (P7s1). Image via Wikimedia Commons, public domain.
  rights_status: public_domain
```

### Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Édouard Manet | The Spanish Singer (Le Guitarrero) | 1860 | The Metropolitan Museum of Art, New York (object 436944) | https://commons.wikimedia.org/wiki/File:Edouard_Manet_-_Le_chanteur_espagnol.jpg (2912 × 3728, PD-Art; source: Met object 436944. The Met's "MET DP815313" files on Commons appear to be the 1861–62 etching, not the painting) | A guitarist absorbed in his song: Paris's fascination with Spain, which Ravel, born near the border, shared. |
| B | Édouard Manet | Lola de Valence | 1862 | Musée d'Orsay, Paris | https://commons.wikimedia.org/wiki/File:Lola_de_Valence_(1862)_-_Edouard_Manet_(Mus%C3%A9e_d%27Orsay,_Paris).jpg (2024 × 2743, PD-Art, Yorck) | A Spanish dancer from a touring troupe, waiting in the wings before her number. |

Both portrait format. Manet died 1883: PD everywhere.

## 2. Glossary: new term

EN (`content/en/glossary.md`):

```markdown
| Ostinato | A short pattern repeated over and over | A short rhythm or melody repeated persistently, often underneath changing music. |
```

TR (`content/tr/glossary.md`):

```markdown
| Ostinato | Ostinato | Durmadan yinelenen kısa bir kalıp | Çoğu zaman değişen bir müziğin altında ısrarla tekrarlanan kısa bir ritim ya da ezgi. |
```

Other terms used (already in the glossary): crescendo, syncopation, muted.

## 3. `content/composers.yaml`: new composer `ravel`

```yaml
- id: ravel
  match: Maurice Ravel
  sort_name: Ravel, Maurice
  born: 1875
  died: 1937
  era: modern
  names:
    en: { name: Maurice Ravel, short: Ravel }
    tr: { name: Maurice Ravel, short: Ravel }
  nationality: { en: French, tr: Fransız }
  facts:
    born: { en: "7 March 1875, Ciboure", tr: "7 Mart 1875, Ciboure" }
    died: { en: "28 December 1937, Paris", tr: "28 Aralık 1937, Paris" }
    symphonies: { en: "None", tr: "Yok" }
    best_known_for: { en: "*Boléro*, *Daphnis et Chloé*, piano music", tr: "*Bolero*, *Daphnis ve Khloe*, piyano eserleri" }
  bio:
    en: |-
      Ravel was born in 1875 in Ciboure, a Basque town in south-west France about eleven miles from the Spanish border. His mother was Basque; his father was an engineer and inventor from near the Swiss border. The family moved to Paris when Maurice was three months old, and he grew up there, studying at the Paris Conservatoire. The conservative establishment never warmed to him: he tried five times for the Prix de Rome, and his elimination in 1905, by then an established composer, caused a public scandal.

      He worked slowly and with great care, and many of his pieces exist twice, first for piano and later for orchestra. He became one of the great masters of orchestration: *Daphnis et Chloé* (1912), written for Diaghilev's Ballets Russes, and his orchestral version of Mussorgsky's *Pictures at an Exhibition* (1922) are showpieces for any orchestra. When war came in 1914 he insisted on serving, and in 1915, aged forty, he became an army lorry driver, carrying munitions at night under bombardment. His piano suite *Le Tombeau de Couperin* honours friends killed in the war, one in each movement.

      By the 1920s he was regarded as France's greatest living composer. In 1928 he toured North America for four months, and that same year wrote *Boléro*, which made him more famous than ever, to his own surprise. He wrote no symphonies, but two piano concertos, two operas, ballets, chamber music and songs. From the early 1930s a neurological illness slowly took away his ability to write. He died in Paris on 28 December 1937, after brain surgery, aged 62.
    tr: |-
      Ravel 1875’te, Fransa’nın güneybatısında, İspanya sınırına 18 kilometre uzaklıktaki Bask kasabası Ciboure’da doğdu. Annesi Bask’tı; babası İsviçre sınırına yakın bir yerden gelen bir mühendis ve mucitti. Maurice üç aylıkken aile Paris’e taşındı; orada büyüdü ve Paris Konservatuvarı’nda okudu. Tutucu çevreler onu hiçbir zaman benimsemedi: Roma Ödülü’nü beş kez denedi ve artık tanınmış bir besteciyken 1905’te elenmesi kamuoyunda bir skandala dönüştü.

      Ağır ve büyük bir özenle çalışırdı; eserlerinin çoğu iki kez vardır, önce piyano için, sonra orkestra için. Orkestrasyonun büyük ustalarından biri oldu: Diaghilev’in Rus Baleleri için yazdığı *Daphnis ve Khloe* (1912) ve Musorgski’nin *Bir Sergiden Tablolar*’ı için yaptığı orkestra düzenlemesi (1922) her orkestranın vitrin eserleridir. 1914’te savaş başlayınca askere gitmekte ısrar etti ve 1915’te, kırk yaşında, ordu kamyonu sürücüsü oldu; geceleri bombardıman altında cephane taşıdı. Piyano süiti *Couperin’in Mezarı*’nın her bölümü, savaşta ölen bir dostunun anısına adanmıştır.

      1920’lerde Fransa’nın yaşayan en büyük bestecisi sayılıyordu. 1928’de Kuzey Amerika’da dört aylık bir turneye çıktı ve aynı yıl yazdığı *Bolero*, onu kendisini de şaşırtacak kadar ünlü yaptı. Hiç senfoni yazmadı; ama iki piyano konçertosu, iki opera, baleler, oda müziği ve şarkılar bıraktı. 1930’ların başından itibaren nörolojik bir hastalık, yazma yeteneğini yavaş yavaş elinden aldı. 28 Aralık 1937’de Paris’te, bir beyin ameliyatının ardından, 62 yaşında öldü.
  portrait:
    artist: { en: Unknown photographer, tr: Fotoğrafçısı bilinmiyor }
    title: { en: Maurice Ravel, tr: Maurice Ravel }
    year: "1925"
    collection: { en: "Bibliothèque nationale de France, Paris", tr: "Bibliothèque nationale de France, Paris" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Maurice_Ravel_1925.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Maurice_Ravel_1925.jpg
    width: 2880
    height: 3840
    license: Public domain (anonymous photograph published 1925; PD-EU-no author disclosure, PD-1996)
    focal_y: 0.25
```

### Composer sources (for `content/research/composers-sources.md`)

```markdown
## Maurice Ravel (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Maurice_Ravel · https://www.britannica.com/biography/Maurice-Ravel · https://www.wikidata.org/wiki/Q1178
- Born 7 March 1875, Ciboure (Basque town near Biarritz, 18 km from the Spanish border); mother Basque (Marie Delouart); father Pierre-Joseph Ravel, engineer and inventor, born in Versoix near the Franco-Swiss border; family moved to Paris three months after his birth. Five Prix de Rome attempts (1900–1905); the 1905 elimination caused a scandal. Daphnis et Chloé (Ballets Russes, 1912). Pictures at an Exhibition orchestration 1922. Joined the 13th Artillery Regiment as a lorry driver, March 1915, aged forty; drove munitions at night under bombardment. Le Tombeau de Couperin (1914–17), each movement dedicated to a friend who died in the war. Four-month North American tour, 1928. "Regarded as France's greatest living composer" in the 1920s–30s. No symphonies; two piano concertos, two operas. Taxi accident October 1932; brain surgery (Clovis Vincent) 1937; died 28 December 1937, aged 62. Wikidata death place: Paris.
- Portrait: anonymous photograph, published 1925, Bibliothèque nationale de France (ark:/12148/btv1b8423964k).
  https://commons.wikimedia.org/wiki/File:Maurice_Ravel_1925.jpg — 2880 × 3840, {{PD-EU-no author disclosure}} + {{PD-1996}}.
  - EU / Turkey: anonymous work, 70 years from publication: PD since 1996.
  - US: PD-1996 tag = PD in France on the URAA date, so not restored; in any case a work published in 1925 is PD in the US (95 years, expired 1 Jan 2021).
  - Caveat: the Commons page says "Gallica gives 1925 as date; assumed published in 1925" and sits in "Images from Gallica to be checked". If the photographer were ever identified and died after 1955, the EU status would change. Low risk; no painted portrait of comparable quality was found on Commons.
- focal_y 0.25: face in the upper third (thumbnail checked).
```
