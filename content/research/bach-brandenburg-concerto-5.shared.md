# Shared-file additions: bach-brandenburg-concerto-5

For merging into `content/paintings.yaml`, `content/composers.yaml`, `content/research/composers-sources.md` and `content/research/retime-needed.md`. Sources: `content/research/bach-brandenburg-concerto-5.md`.

## 1. `content/paintings.yaml` (first choice)

```yaml
bach-brandenburg-concerto-5:
  image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Adolph_Menzel_-_Fl%C3%B6tenkonzert_Friedrichs_des_Gro%C3%9Fen_in_Sanssouci_-_Google_Art_Project.jpg
  source_url: https://id.smb.museum/object/966477
  commons_page: https://commons.wikimedia.org/wiki/File:Adolph_Menzel_-_Fl%C3%B6tenkonzert_Friedrichs_des_Gro%C3%9Fen_in_Sanssouci_-_Google_Art_Project.jpg
  width: 3543
  height: 2433
  medium: Oil on canvas
  license: Public domain (PD-Art, PD-old; Google Art Project)
  credit_line: Adolph Menzel, The Flute Concert of Frederick the Great at Sanssouci, 1850–52. Alte Nationalgalerie, Staatliche Museen zu Berlin (A I 206). Image via Wikimedia Commons (Google Art Project), public domain.
  rights_status: public_domain
```

`source_url` follows the pattern already used for the Friedrich entry (`id.smb.museum/object/<SMB-digital id>`; SMB-digital 966477 from Wikidata Q944909, P8923). The SMB's own photos are CC BY-NC-SA and are not used. Group E lists a different Menzel (*Afternoon in the Tuileries Gardens*) only as an alternative for `brahms-violin-concerto`; if E ends up using it, two Menzels would sit in the catalogue, which the brief allows but may not be wanted.

## 2. Alternatives (in case of a clash)

| # | Artist | Title | Year | Collection | Commons file | Pairing note |
| --- | --- | --- | --- | --- | --- | --- |
| A | Philippe Mercier (1689–1760) | *The Music Party: Frederick, Prince of Wales, with his Sisters* | 1733 | National Portrait Gallery, London (NPG 1556) | https://commons.wikimedia.org/wiki/File:Frederick,_Prince_of_Wales,_and_his_sisters_by_Philip_Mercier.jpg (2400 × 1858, PD-Art) | A prince at the cello and his sister at the harpsichord: royal amateurs playing chamber music, like Bach's employer Prince Leopold of Köthen, himself a keen player. |
| B | Johannes Vermeer (1632–1675) | *A Young Woman seated at a Virginal* | c. 1670–72 | National Gallery, London (NG2568) | https://commons.wikimedia.org/wiki/File:Lady_Seated_at_a_Virginal,_Vermeer,_The_National_Gallery,_London.jpg (3769 × 4225, PD-Art) | A woman alone at a small keyboard instrument, the harpsichord's domestic cousin, before it stepped out as a soloist in Bach's concerto. |

A is Bach's century and shows a harpsichord in a chamber group; B is earlier and quieter but a very strong image.

## 3. Glossary rows (new terms only)

None new from this piece. It uses **Ritornello** and **Continuo**, defined in `vivaldi-four-seasons-spring.shared.md` (add them once), and the existing **Cadenza**, **Fugue** and **Fugato**.

## 4. `content/composers.yaml`: new composer `bach`

```yaml
- id: bach
  match: Johann Sebastian Bach
  sort_name: Bach, Johann Sebastian
  born: 1685
  died: 1750
  era: baroque
  names:
    en: { name: Johann Sebastian Bach, short: Bach }
    tr: { name: Johann Sebastian Bach, short: Bach }
  nationality: { en: German, tr: Alman }
  facts:
    born: { en: "21 March 1685 (Old Style), Eisenach", tr: "21 Mart 1685 (eski takvim), Eisenach" }
    died: { en: "28 July 1750, Leipzig", tr: "28 Temmuz 1750, Leipzig" }
    symphonies: { en: "None (the form came after his time)", tr: "Yok (bu tür ondan sonra doğdu)" }
    best_known_for: { en: "*Brandenburg Concertos*, *St Matthew Passion*, *The Well-Tempered Clavier*", tr: "*Brandenburg Konçertoları*, *Matta Pasyonu*, *İyi Düzenlenmiş Klavye*" }
  bio:
    en: |-
      Bach was born in Eisenach in 1685, the youngest child of a town musician, into a family that had produced musicians for generations. Orphaned at ten, he lived for five years with his eldest brother, an organist, and went on to work as an organist himself in Arnstadt and Mühlhausen and then at the court of Weimar, where he became known above all as a brilliant player.

      In 1717 he became music director to Prince Leopold of Anhalt-Köthen, a keen musician who paid him well. The Calvinist court needed little church music, so Bach wrote instrumental works there, among them the *Brandenburg Concertos*. In 1723 he moved to Leipzig as Thomaskantor, responsible for the music of the city's main churches and the St Thomas School, and held the post for 27 years. There he wrote whole yearly cycles of church cantatas, the *St Matthew Passion* and, later, the *Mass in B minor*.

      He had twenty children, four of whom became composers. After his death in 1750 he was remembered mainly as an organist, and his music was thought old-fashioned. Mendelssohn's performance of the *St Matthew Passion* in 1829 started a revival that has never stopped. His mastery of [[fugue]] and of weaving several melodies together is now seen as one of the foundations of Western music.
    tr: |-
      Bach 1685'te Eisenach'ta, kuşaklar boyunca müzisyen yetiştirmiş bir ailede, bir kent müzisyeninin en küçük çocuğu olarak doğdu. On yaşında öksüz ve yetim kaldı; beş yıl orgcu olan ağabeyinin yanında yaşadı. Sonra kendisi de orgcu olarak önce Arnstadt'ta ve Mühlhausen'de, ardından Weimar sarayında çalıştı; burada her şeyden önce parlak bir çalıcı olarak tanındı.

      1717'de, kendisi de tutkulu bir müzisyen olan ve ona iyi ücret ödeyen Anhalt-Köthen Prensi Leopold'ün müzik yönetmeni oldu. Kalvinist saray pek kilise müziğine ihtiyaç duymadığı için Bach orada çalgı müziği yazdı; *Brandenburg Konçertoları* da bunlar arasındadır. 1723'te Leipzig'e Thomaskantor olarak geçti; kentin başlıca kiliselerinin ve Thomas Okulu'nun müziğinden sorumluydu ve bu görevi 27 yıl sürdürdü. Orada yıllık döngüler hâlinde kilise kantatları, *Matta Pasyonu*'nu ve daha sonra *Si minör Missa*'yı yazdı.

      Yirmi çocuğu oldu; dördü besteci oldu. 1750'de ölümünden sonra daha çok bir orgcu olarak hatırlandı ve müziği eski moda sayıldı. Mendelssohn'un 1829'da *Matta Pasyonu*'nu seslendirmesi, o günden beri hiç durmayan bir yeniden keşfi başlattı. [[fugue|Füg]] ustalığı ve birkaç ezgiyi bir arada örme becerisi bugün Batı müziğinin temellerinden biri sayılıyor.
  portrait:
    artist: Elias Gottlob Haussmann
    title: { en: Johann Sebastian Bach, tr: Johann Sebastian Bach }
    year: "1746"
    collection: { en: "Stadtgeschichtliches Museum, Leipzig", tr: "Stadtgeschichtliches Museum, Leipzig" }
    image_url: https://commons.wikimedia.org/wiki/Special:FilePath/Johann_Sebastian_Bach_1746.jpg
    source_url: https://commons.wikimedia.org/wiki/File:Johann_Sebastian_Bach_1746.jpg
    width: 2616
    height: 3438
    license: Public domain (PD-Art, PD-old-100)
    focal_y: 0.2
```

## 5. `content/research/composers-sources.md` (new section)

```
## Bach (added 2026-10-10)
- Facts: https://en.wikipedia.org/wiki/Johann_Sebastian_Bach · https://www.britannica.com/biography/Johann-Sebastian-Bach · https://www.wikidata.org/wiki/Q1339
- Born 21 March 1685 Old Style (31 March New Style), Eisenach; the card gives the Old Style date, by which his birthday is usually known, and says so. Died 28 July 1750, Leipzig.
- Orphaned at 10; five years with his brother Johann Christoph; Arnstadt, Mühlhausen, Weimar (Konzertmeister 1714); Köthen 1717–1723 (Prince Leopold, Calvinist court, mostly instrumental music); Thomaskantor in Leipzig from 1723 for 27 years; annual cantata cycles; twenty children, four composers; Mendelssohn's *St Matthew Passion* 1829 started the Bach revival.
- Portrait: Elias Gottlob Haussmann (1695–1774), *Johann Sebastian Bach*, 1746, oil on canvas, Stadtgeschichtliches Museum Leipzig (XXII/48), with the riddle canon BWV 1076.
  https://commons.wikimedia.org/wiki/File:Johann_Sebastian_Bach_1746.jpg — 2616 × 3438, Public domain (PD-Art). The 1748 version (File:Johann_Sebastian_Bach.jpg, 1376 × 1786) is smaller.
```

## 6. `content/research/retime-needed.md` rows

```
| Bach – Brandenburg Concerto No. 5 | I Allegro | – | 9:53 | – | Pinnock / The English Concert, Spotify `3N0xJn1EFWr5GLuslWdBQy` (track 4) | 0:00, 0:20, 1:00, 2:45, 4:30, 5:50, 7:30, 9:30 | Derived from bar positions (cadenza bars 154–219 of 227), not heard. Least certain: start of the cadenza and of the closing ritornello |
| Bach – Brandenburg Concerto No. 5 | II Affettuoso | – | 5:13 | – | same (track 5) | 0:00, 1:15, 2:40, 4:00, Near the end | Estimated from proportions |
| Bach – Brandenburg Concerto No. 5 | III Allegro | – | 5:08 | – | same (track 6) | 0:00, 0:15, 1:18, 3:52, Near the end | From bar positions (310 bars; B from bar 79, A again from bar 233). Note which soloist enters first |
```
